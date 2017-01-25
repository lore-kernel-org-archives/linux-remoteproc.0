Return-Path: <akdwived@codeaurora.org>
Subject: Re: [RFC ADD HYPERVISOR CALL SUPPORT 1/2] soc: qcom: Add hypervisor
 stage two translation request support.
References: <1483974609-25522-1-git-send-email-akdwived@codeaurora.org>
 <1483974609-25522-2-git-send-email-akdwived@codeaurora.org>
 <20170121090923.GE8801@codeaurora.org>
From: "Dwivedi, Avaneesh Kumar (avani)" <akdwived@codeaurora.org>
Message-ID: <ad7027a0-4a0e-4074-6e46-18db3e01a663@codeaurora.org>
Date: Wed, 25 Jan 2017 19:13:05 +0530
MIME-Version: 1.0
In-Reply-To: <20170121090923.GE8801@codeaurora.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: bjorn.andersson@linaro.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>



On 1/21/2017 2:39 PM, Stephen Boyd wrote:
> On 01/09, Avaneesh Kumar Dwivedi wrote:
>> This patch add hypervisor support for mss bring up on msm8996.
>> MSS rproc driver make hypervisor request to add certain region
>> in IPA table owned by hepervisor and assign access permission
> Please drop the use of IPA here. There's an IPA acronym for the
> IP accelerator and that is confused with Intermediate Physical
> Address. Instead, say something like "in the stage 2 page tables
> of the SMMU". Also hypervisor is misspelled here.
OK.
>
>> to modem. These regions are used to load MBA, MDT, FW into DDR.
>>
>> Signed-off-by: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
>> ---
>>   drivers/firmware/qcom_scm-64.c     |  16 +++
>>   drivers/firmware/qcom_scm.c        |  13 +++
>>   drivers/firmware/qcom_scm.h        |  10 ++
>>   drivers/remoteproc/qcom_q6v5_pil.c |  96 +++++++++++++++-
> Please split the remoteproc code off from this patch.
Ok.
>
>>   drivers/soc/qcom/Kconfig           |   8 ++
>>   drivers/soc/qcom/Makefile          |   1 +
>>   drivers/soc/qcom/secure_buffer.c   | 229 +++++++++++++++++++++++++++++++++++++
>>   include/linux/qcom_scm.h           |   1 +
>>   include/soc/qcom/secure_buffer.h   |  51 +++++++++
>>   9 files changed, 419 insertions(+), 6 deletions(-)
>>   create mode 100644 drivers/soc/qcom/secure_buffer.c
>>   create mode 100644 include/soc/qcom/secure_buffer.h
>>
>> diff --git a/drivers/firmware/qcom_scm-64.c b/drivers/firmware/qcom_scm-64.c
>> index 4a0f5ea..63b814c 100644
>> --- a/drivers/firmware/qcom_scm-64.c
>> +++ b/drivers/firmware/qcom_scm-64.c
>> @@ -358,3 +358,19 @@ int __qcom_scm_pas_mss_reset(struct device *dev, bool reset)
>>   
>>   	return ret ? : res.a1;
>>   }
>> +
>> +int __qcom_scm_assign_mem(struct device *dev, void *data)
>> +{
>> +	int ret;
>> +	struct qcom_scm_desc *desc = (struct qcom_scm_desc *)data;
> Useless cast from void.
Yes, will correct.
>> +	struct arm_smccc_res res;
>> +
>> +	desc->arginfo = QCOM_SCM_ARGS(7, SCM_RO, SCM_VAL, SCM_RO,
>> +					SCM_VAL, SCM_RO, SCM_VAL, SCM_VAL);
>> +
>> +	ret = qcom_scm_call(dev, QCOM_SCM_SVC_MP,
>> +				QCOM_MEM_PROT_ASSIGN_ID,
>> +				desc, &res);
>> +
>> +	return ret ? : res.a1;
>> +}
>> diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
>> index 893f953ea..52394ac 100644
>> --- a/drivers/firmware/qcom_scm.c
>> +++ b/drivers/firmware/qcom_scm.c
>> @@ -292,6 +292,19 @@ int qcom_scm_pas_shutdown(u32 peripheral)
>>   }
>>   EXPORT_SYMBOL(qcom_scm_pas_shutdown);
>>   
>> +/**
>> + * qcom_scm_assign_mem() -
> Some words on what the function does?
OK.
>
>> + * @desc:	descriptor to send to hypervisor
>> + *
>> + * Return 0 on success.
>> + */
>> +int qcom_scm_assign_mem(void *desc)
>> +{
>> +
> Nitpick: Drop the extra newline
OK.
>
>> +	return __qcom_scm_assign_mem(__scm->dev, desc);
>> +}
>> +EXPORT_SYMBOL(qcom_scm_assign_mem);
>> +
>>   static int qcom_scm_pas_reset_assert(struct reset_controller_dev *rcdev,
>>   				     unsigned long idx)
>>   {
>> diff --git a/drivers/firmware/qcom_scm.h b/drivers/firmware/qcom_scm.h
>> index 3584b00..f248dc9 100644
>> --- a/drivers/firmware/qcom_scm.h
>> +++ b/drivers/firmware/qcom_scm.h
>> @@ -47,6 +47,8 @@ extern int __qcom_scm_hdcp_req(struct device *dev,
>>   #define QCOM_SCM_PAS_SHUTDOWN_CMD	0x6
>>   #define QCOM_SCM_PAS_IS_SUPPORTED_CMD	0x7
>>   #define QCOM_SCM_PAS_MSS_RESET		0xa
>> +#define QCOM_SCM_SVC_MP				0xc
>> +#define QCOM_MEM_PROT_ASSIGN_ID		0x16
>>   extern bool __qcom_scm_pas_supported(struct device *dev, u32 peripheral);
>>   extern int  __qcom_scm_pas_init_image(struct device *dev, u32 peripheral,
>>   		dma_addr_t metadata_phys);
>> @@ -55,6 +57,7 @@ extern int  __qcom_scm_pas_mem_setup(struct device *dev, u32 peripheral,
>>   extern int  __qcom_scm_pas_auth_and_reset(struct device *dev, u32 peripheral);
>>   extern int  __qcom_scm_pas_shutdown(struct device *dev, u32 peripheral);
>>   extern int  __qcom_scm_pas_mss_reset(struct device *dev, bool reset);
>> +extern int  __qcom_scm_assign_mem(struct device *dev, void *desc);
>>   
>>   /* common error codes */
>>   #define QCOM_SCM_V2_EBUSY	-12
>> @@ -83,4 +86,11 @@ static inline int qcom_scm_remap_error(int err)
>>   	return -EINVAL;
>>   }
>>   
>> +enum scm_arg_types {
>> +	SCM_VAL,
>> +	SCM_RO,
>> +	SCM_RW,
>> +	SCM_BUFVAL,
>> +};
> We already have this enum? It's just prepended with QCOM_
> instead.
I think i missed somehow, will see and correct.
>
>> +
>>   #endif
>> diff --git a/drivers/remoteproc/qcom_q6v5_pil.c b/drivers/remoteproc/qcom_q6v5_pil.c
>> index e5edefa..cbf833c 100644
>> --- a/drivers/remoteproc/qcom_q6v5_pil.c
>> +++ b/drivers/remoteproc/qcom_q6v5_pil.c
>> @@ -31,6 +31,7 @@
>>   #include <linux/soc/qcom/smem.h>
>>   #include <linux/soc/qcom/smem_state.h>
>>   #include <linux/of_device.h>
>> +#include <soc/qcom/secure_buffer.h>
>>   
>>   #include "remoteproc_internal.h"
>>   #include "qcom_mdt_loader.h"
>> @@ -105,12 +106,19 @@ struct qcom_mss_reg_res {
>>   	int uA;
>>   };
>>   
>> +struct src_dest_vmid {
>> +	int *srcVM;
>> +	int *destVM;
>> +	int *destVMperm;
> Why not have an array of these structures instead of a structure
> with three arrays inside? Can you map one source VM to multiple
> destination VMs?
Yes one to multiple or multiple to one mapping is possible, i.e. grant 
access from HLOS only to HLOS+MSA.
>
>> +};
>> +
>>   struct rproc_hexagon_res {
>>   	const char *hexagon_mba_image;
>>   	struct qcom_mss_reg_res proxy_supply[4];
>>   	struct qcom_mss_reg_res active_supply[2];
>>   	char **proxy_clk_names;
>>   	char **active_clk_names;
>> +	int version;
>>   };
>>   
>>   struct q6v5 {
>> @@ -127,6 +135,8 @@ struct q6v5 {
>>   
>>   	struct reset_control *mss_restart;
>>   
>> +	struct src_dest_vmid vmid_details;
>> +
>>   	struct qcom_smem_state *state;
>>   	unsigned stop_bit;
>>   
>> @@ -152,6 +162,13 @@ struct q6v5 {
>>   	phys_addr_t mpss_reloc;
>>   	void *mpss_region;
>>   	size_t mpss_size;
>> +	int version;
>> +};
>> +
>> +enum {
>> +	MSS_MSM8916,
>> +	MSS_MSM8974,
>> +	MSS_MSM8996,
>>   };
>>   
>>   static int q6v5_regulator_init(struct device *dev, struct reg_info *regs,
>> @@ -273,13 +290,46 @@ static void q6v5_clk_disable(struct device *dev,
>>   		clk_disable_unprepare(clks[i]);
>>   }
>>   
>> +int hyp_mem_access(struct q6v5 *qproc, phys_addr_t addr, size_t size)
>> +{
>> +	int src_count = 0;
>> +	int dest_count = 0;
>> +	int ret;
>> +	int i;
>> +
>> +	if (qproc->version != MSS_MSM8996)
>> +		return 0;
>> +
>> +	for (i = 0; i < 2; i++) {
>> +		if (qproc->vmid_details.srcVM[i] != 0)
>> +		src_count++;
> Bad tabbing here.
Yes, will correct.
>
>> +		if (qproc->vmid_details.destVM[i] != 0)
>> +		dest_count++;
> And here.
>
> When is it ever == 0? The hardcoded 2 in the for loop is also
> suspect.
In downstream, VMID 0 is not assigned for any subsystem, my purpose here 
is to check if destination vmid is valid for some subsystem.
On hard coded value question, will try to define a macro which will 
indicate MAX number of source or destination subsys VMID. which in
this case is two i.e. HLOS and MODEM can be source or destination.

>> +	}
> Add newline
OK.
>
>> +	ret = hyp_assign_phys(qproc->dev, addr, size,
>> +			qproc->vmid_details.srcVM,
>> +			src_count, qproc->vmid_details.destVM,
>> +			qproc->vmid_details.destVMperm, dest_count);
> At the least this API could take a vmid_details structure instead
> of all these arguments:
>
> 	struct vm_perms {
> 		u32 vm;
> 		u32 perm;
> 	};
>
> 	struct vmid_details {
> 		u32 *src;
> 		size_t src_count;
> 		struct vm_perms *dest;
> 		size_t dest_count;
> 	};
OK, will try to correct.
>
>> +	if (ret)
>> +		dev_err(qproc->dev,
>> +			"%s: failed for %pa address of size %zx\n",
>> +			__func__, &addr, size);
>> +	return ret;
>> +}
>> +
> [...]
>> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
>> index 461b387..9459894 100644
>> --- a/drivers/soc/qcom/Kconfig
>> +++ b/drivers/soc/qcom/Kconfig
>> @@ -76,3 +76,11 @@ config QCOM_WCNSS_CTRL
>>   	help
>>   	  Client driver for the WCNSS_CTRL SMD channel, used to download nv
>>   	  firmware to a newly booted WCNSS chip.
>> +
>> +config QCOM_SECURE_BUFFER
> Please no. Just fold this into the qcom_scm.c code and drop the
> new config and new file.
Will try to incorporate this functionality in qcom_scm related source files.
>
>> +	bool "Helper functions for securing buffers through TZ"
>> +	help
>> +	 Say 'Y' here for targets that need to call into TZ to secure
>> +	 memory buffers. This ensures that only the correct clients can
>> +	 use this memory and no unauthorized access is made to the
>> +	 buffer
>> diff --git a/drivers/soc/qcom/secure_buffer.c b/drivers/soc/qcom/secure_buffer.c
>> new file mode 100644
>> index 0000000..54eaa6f
>> --- /dev/null
>> +++ b/drivers/soc/qcom/secure_buffer.c
>> @@ -0,0 +1,229 @@
>> +/*
>> + * Copyright (c) 2011-2017, The Linux Foundation. All rights reserved.
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License version 2 and
>> + * only version 2 as published by the Free Software Foundation.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + *
>> + */
>> +
>> +#include <linux/highmem.h>
> Used?
I think i missed to remove these, will remove them.
>
>> +#include <linux/kernel.h>
>> +#include <linux/kref.h>
> Used?
Will check and remove.
>
>> +#include <linux/mutex.h>
>> +#include <linux/scatterlist.h>
>> +#include <linux/slab.h>
>> +#include <linux/dma-mapping.h>
>> +#include <linux/qcom_scm.h>
>> +#include <linux/dma-mapping.h>
>> +#include <soc/qcom/secure_buffer.h>
>> +
>> +DEFINE_MUTEX(secure_buffer_mutex);
> static?
OK, will correct.
>
>> +
>> +struct scm_desc {
>> +	u32 arginfo;
>> +	u64 args[10];
>> +};
> This would be in qcom_scm-64.c already.
OK.
>
>> +
>> +struct mem_prot_info {
>> +	phys_addr_t addr;
>> +	u64 size;
> Both should be __le64 presumably.
Yes, it should be in basic data type, but then i took it from downstream 
which keep address and size detail in above format.
>> +};
>> +
>> +struct info_list {
>> +	struct mem_prot_info *list_head;
>> +	u64 list_size;
>> +};
>> +
>> +struct dest_vm_and_perm_info {
>> +	u32 vm;
>> +	u32 perm;
>> +	u32 *ctx;
> Why is this a pointer?
I had taken reference from 3.18 kernel based downstream source code, it 
is not used and initialized with NULL but that is how TZ accept parameters.
> Is this structure put into memory and
> passed to the firmware? We should use the appropriate __le32 and
> __le64 types then.
OK.
>
>> +	u32 ctx_size;
>> +};
>> +
>> +struct dest_info_list {
>> +	struct dest_vm_and_perm_info *dest_info;
>> +	u64 list_size;
>> +};
> These structures are confusing. From what I can tell we need an
> array of struct mem_prot_info and an array of struct
> dest_vm_and_perm_info in our pre-allocated buffer. The other
> info_list and dest_info_list structures are bookkeeping things
> that we pass to the firmware via registers. So let's drop the
> info_list structures and have the functions that populate arrays
> take pointers to the memory region to populate and return size_t?
>
> static size_t populate_dest_info(struct dest_vm_and_perm_info *info,
> 				  struct int *dest_vmids, int nelements,
> 				  int *dest_perms);
>
> static size_t populate_prot_info_from_table(struct mem_prot_info *info,
> 					    struct sg_table *table);
>
> And then the callers can add the size returned to the memory
> chunk pointer.
>
> 	void *qcom_secure_mem;
> 	struct mem_prot_info *prot_info = qcom_secure_mem;
> 	struct dest_vm_and_perm_info *dest_info;
> 	size_t size;
>
> 	size = populate_prot_info_from_table(prot_info, ...);
> 	...
> 	dest_info = qcom_secure_mem + size;
> 	size = populate_dest_info(dest_info, ...);
>
> 	smc_call()...
>
> }
OK, Will try to modify as above.
>> +
>> +static void *qcom_secure_mem;
>> +#define QCOM_SECURE_MEM_SIZE (512 * 1024)
>> +#define PADDING 32
> What is the padding for? cache aligning? 32 seems magical.
I have taken bare minimum version of this driver to make hyp_assign call 
for msm8996, this PADDING does not seem doing anything useful.
It is not related with cache alignment. its only purpose seems that size 
of qcom_secure_mem should be at least 32 byte more than size of all info 
to be passed.
>
>> +
>> +static void populate_dest_info(int *dest_vmids, int nelements,
>> +			int *dest_perms, struct dest_info_list **list,
> s/list/list_p/
Did not get what is ask here?
>
>> +			void *current_qcom_secure_mem)
>> +{
>> +	struct dest_vm_and_perm_info *dest_info;
>> +	int i;
>> +
>> +	dest_info = (struct dest_vm_and_perm_info *)current_qcom_secure_mem;
> Useless cast, please remove.
OK
>> +
>> +	for (i = 0; i < nelements; i++) {
>> +		dest_info[i].vm = dest_vmids[i];
>> +		dest_info[i].perm = dest_perms[i];
>> +		dest_info[i].ctx = NULL;
>> +		dest_info[i].ctx_size = 0;
>> +	}
>> +
>> +	*list = (struct dest_info_list *)&dest_info[i];
> Grow a local variable:
OK
>
> 	struct dest_info_list *list = *list_p;
>
> 	list = &dest_info[i];
> 	list->dest_info = dest_info;
> 	list->list_size = nelements * sizeof(*dest_info);
>
> Of course this may all change anyway.
OK.
>
>> +
>> +	(*list)->dest_info = dest_info;
>> +	(*list)->list_size = nelements * sizeof(struct dest_vm_and_perm_info);
>> +}
>> +
>> +static void get_info_list_from_table(struct sg_table *table,
>> +					struct info_list **list)
>> +{
>> +	int i;
>> +	struct scatterlist *sg;
>> +	struct mem_prot_info *info;
>> +
>> +	info = (struct mem_prot_info *)qcom_secure_mem;
> Useless cast from void.
OK
>
>> +
>> +	for_each_sg(table->sgl, sg, table->nents, i) {
>> +		info[i].addr = page_to_phys(sg_page(sg));
>> +		info[i].size = sg->length;
>> +	}
>> +
>> +	*list = (struct info_list *)&(info[i]);
>> +
>> +	(*list)->list_head = info;
>> +	(*list)->list_size = table->nents * sizeof(struct mem_prot_info);
>> +}
>> +
>> +int hyp_assign_table(struct device *dev, struct sg_table *table,
>> +			u32 *source_vm_list, int source_nelems,
>> +			int *dest_vmids, int *dest_perms,
>> +			int dest_nelems)
>> +{
>> +	int ret;
>> +	struct info_list *info_list = NULL;
>> +	struct dest_info_list *dest_info_list = NULL;
>> +	struct scm_desc desc = {0};
>> +	u32 *source_vm_copy;
>> +	void *current_qcom_secure_mem;
>> +
>> +	size_t reqd_size = dest_nelems * sizeof(struct dest_vm_and_perm_info) +
>> +			table->nents * sizeof(struct mem_prot_info) +
>> +			sizeof(dest_info_list) + sizeof(info_list) + PADDING;
>> +
>> +	if (!qcom_secure_mem) {
>> +		pr_err("%s is not functional as qcom_secure_mem is not allocated.\n",
>> +				__func__);
>> +		return -ENOMEM;
>> +	}
>> +
>> +	if (reqd_size > QCOM_SECURE_MEM_SIZE) {
>> +		pr_err("%s: Not enough memory allocated. Required size %zd\n",
>> +				__func__, reqd_size);
>> +		return -EINVAL;
>> +	}
>> +
>> +	/*
>> +	 * We can only pass cache-aligned sizes to hypervisor, so we need
>> +	 * to kmalloc and memcpy the source_vm_list here.
>> +	 */
>> +	source_vm_copy = kmalloc_array(
>> +		source_nelems, sizeof(*source_vm_copy), GFP_KERNEL);
>> +	if (!source_vm_copy)
>> +		return -ENOMEM;
>> +	memcpy(source_vm_copy, source_vm_list,
>> +	       sizeof(*source_vm_list) * source_nelems);
> All of these u32s need an endian swap on big-endian platforms
> when they're copied.
OK.
>
>> +
>> +	mutex_lock(&secure_buffer_mutex);
>> +
>> +	get_info_list_from_table(table, &info_list);
>> +
>> +	current_qcom_secure_mem = &(info_list[1]);
>> +	populate_dest_info(dest_vmids, dest_nelems, dest_perms,
>> +				&dest_info_list, current_qcom_secure_mem);
>> +
>> +	desc.args[0] = virt_to_phys(info_list->list_head);
>> +	desc.args[1] = info_list->list_size;
>> +	desc.args[2] = virt_to_phys(source_vm_copy);
>> +	desc.args[3] = sizeof(*source_vm_copy) * source_nelems;
>> +	desc.args[4] = virt_to_phys(dest_info_list->dest_info);
>> +	desc.args[5] = dest_info_list->list_size;
>> +	desc.args[6] = 0;
>> +
>> +	dma_set_mask(dev, DMA_BIT_MASK(64));
> The dev passed here should be the scm->dev because we don't want
> to allocate memory from a memory region that may be associated
> with some random device using this API, and
OK.
> also we want to be
> able to have the right mask set for communicating with the
> firmware, which may be different than whatever mask is needed for
> DMA with a device.
dma_map_single need a non NULL dev pointer to set mask, which scm->dev 
will provide.
>> +	dma_map_single(dev, (void *)source_vm_copy,
> Useless cast to void.
OK.
>
>> +			(size_t)(source_vm_copy + source_nelems),
> This looks wrong? source_vm_copy is a pointer and we're adding
> source_nelems and then casting that address to a size_t which
> would be potentially very large? Shouldn't it just be
> desc.args[3]?
My Bad, yes will correct.
>
>> +			DMA_TO_DEVICE);
>> +	dma_map_single(dev, (void *)info_list->list_head,
>> +		(size_t)(info_list->list_head +
>> +		(info_list->list_size / sizeof(*info_list->list_head))),
>> +		DMA_TO_DEVICE);
>> +	dma_map_single(dev,
>> +		(void *)dest_info_list->dest_info,
> Useless cast to void.
OK.
>
>> +		(size_t)(dest_info_list->dest_info +
>> +		(dest_info_list->list_size /
>> +		sizeof(*dest_info_list->dest_info))),
>> +		DMA_TO_DEVICE);
>> +
>> +	ret = qcom_scm_assign_mem((void *)&desc);
> Useless cast to void.
OK.
>
>> +	if (ret)
>> +		pr_info("%s: Failed to assign memory protection, ret = %d\n",
> pr_err?
OK.
>
>> +			__func__, ret);
>> +
>> +	mutex_unlock(&secure_buffer_mutex);
> Missing the dma_unmap calls here? Failure to do that could lead
> to a leak if we bounce the page.
>
> Also, shouldn't we skip the dma mapping if we have allocated
> coherent memory instead of kmalloc for the qcom_secure_mem
> buffer? The code seems to ignore the dma allocation case.
problem with coherent memory allocation is uncertainty of getting such 
chunk or carving it out for always.
>
>> +	kfree(source_vm_copy);
>> +	return ret;
>> +}
>> +
>> +int hyp_assign_phys(struct device *dev, phys_addr_t addr, u64 size,
>> +			u32 *source_vm_list, int source_nelems,
>> +			int *dest_vmids, int *dest_perms,
>> +			int dest_nelems)
>> +{
>> +	struct sg_table *table;
>> +	int ret;
>> +
>> +	table = kzalloc(sizeof(struct sg_table), GFP_KERNEL);
> sizeof(*table)
OK.
>
>> +	if (!table)
>> +		return -ENOMEM;
> Newline here
OK.
>
>> +	ret = sg_alloc_table(table, 1, GFP_KERNEL);
>> +	if (ret)
>> +		goto err1;
>> +
>> +	sg_set_page(table->sgl, phys_to_page(addr), size, 0);
>> +
>> +	ret = hyp_assign_table(dev, table, source_vm_list,
>> +				source_nelems, dest_vmids,
>> +				dest_perms, dest_nelems);
> I'd prefer two user facing APIs exist. One that takes a single
> address and size argument, and one that takes an sg_table. Both
> APIs can then call some common function that passes that info off
> to the firmware, but the first one can be used here without
> requiring us to make an sg_table for no reason besides undoing the
> sg_table in hyp_assign_table().
if you are OK, i will use a private API which will do away requirement 
of allocating sg_table as well as doing dma_single_map()
i will directly pass src and dest VM info to TZ.

>
>> +	if (ret)
>> +		goto err2;
>> +
>> +	return ret;
>> +err2:
>> +	sg_free_table(table);
>> +err1:
>> +	kfree(table);
>> +	return ret;
>> +}
>> +
>> +static int __init alloc_secure_shared_memory(void)
>> +{
>> +	int ret = 0;
> ret is 0...
>
>> +
>> +	qcom_secure_mem = kzalloc(QCOM_SECURE_MEM_SIZE, GFP_KERNEL);
>> +	if (!qcom_secure_mem) {
>> +		/* Fallback to CMA-DMA memory */
>> +		qcom_secure_mem = dma_alloc_coherent(NULL, QCOM_SECURE_MEM_SIZE,
> We can't really pass NULL here anymore. Use the scm device.
OK.
>
>> +						NULL, GFP_KERNEL);
>> +		if (!qcom_secure_mem) {
>> +			pr_err("Couldn't allocate memory for secure use-cases. hyp_assign_table will not work\n");
> Memory allocation messages are practically useless. Please remove
> them.
OK.
>> +			return -ENOMEM;
>> +		}
>> +	}
>> +
>> +	return ret;
> And that's all for ret. Always 0.
OK.
>
>> +}
>> +pure_initcall(alloc_secure_shared_memory);
> pure initcall? Maybe we should take the lazy approach and
> allocate this big chunk once someone calls into the API the first
> time? If we merge this with scm device, then we can probably do
> the allocation when scm probes and we have a proper device for
> dma allocation.
OK.
>
>> diff --git a/include/soc/qcom/secure_buffer.h b/include/soc/qcom/secure_buffer.h
>> new file mode 100644
>> index 0000000..2c7015d
>> --- /dev/null
>> +++ b/include/soc/qcom/secure_buffer.h
>> @@ -0,0 +1,51 @@
>> +/*
>> + * Copyright (c) 2015-2016, The Linux Foundation. All rights reserved.
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License version 2 and
>> + * only version 2 as published by the Free Software Foundation.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + *
>> + */
>> +
>> +#ifndef __MSM_SECURE_BUFFER_H__
>> +#define __MSM_SECURE_BUFFER_H__
>> +
>> +enum vmid {
>> +	VMID_HLOS = 0x3,
>> +	VMID_MSS_MSA = 0xF,
>> +	VMID_INVAL = -1
> Just drop the enum and use #defines please.
OK.
>
>> +};
>> +
>> +#define PERM_READ			0x4
>> +#define PERM_WRITE			0x2
>> +#define PERM_EXEC			0x1

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
