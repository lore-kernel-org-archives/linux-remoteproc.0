Return-Path: <akdwived@codeaurora.org>
Subject: Re: [PATCH v5 1/4] firmware: scm: Add new SCM call API for switching
 memory ownership
References: <1496344641-6291-1-git-send-email-akdwived@codeaurora.org>
 <1496344641-6291-2-git-send-email-akdwived@codeaurora.org>
 <20170602182242.GN20170@codeaurora.org>
From: "Dwivedi, Avaneesh Kumar (avani)" <akdwived@codeaurora.org>
Message-ID: <30599029-67a5-d279-f166-6316e9402a14@codeaurora.org>
Date: Wed, 7 Jun 2017 21:36:24 +0530
MIME-Version: 1.0
In-Reply-To: <20170602182242.GN20170@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: bjorn.andersson@linaro.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>



On 6/2/2017 11:52 PM, Stephen Boyd wrote:
> On 06/02, Avaneesh Kumar Dwivedi wrote:
>> Two different processors on a SOC need to switch memory ownership
>> during load/unload. To enable this, level second memory map table
> second level page tables instead of level second memory map table
OK
>
>> need to be updated, which is done by secure layer.
>> This patch add the interface for making secure monitor call for
> s/add/adds/
OK.
>
>> memory ownership switching request.
>> diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
>> index bb16510..9da3c6d 100644
>> --- a/drivers/firmware/qcom_scm.c
>> +++ b/drivers/firmware/qcom_scm.c
>> @@ -292,6 +304,86 @@ int qcom_scm_pas_shutdown(u32 peripheral)
>>   }
>>   EXPORT_SYMBOL(qcom_scm_pas_shutdown);
>>   
>> +/**
>> + * qcom_scm_assign_mem() - Make a secure call to reassign memory ownership
>> + *
>> + * @mem_addr: mem region whose ownership need to be reassigned
>> + * @mem_sz:   size of the region.
>> + * @srcvm:    vmid for current set of owners, each set bit in
>> + *            flag indicate a unique owner
>> + * @newvm:    array having new owners and corrsponding permission
>> + *            flags
>> + * @dest_cnt: number of owners in next set.
>> + * Return next set of owners on success.
>> + */
>> +int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz, int srcvm,
>> +			struct qcom_scm_vmperm *newvm, int dest_cnt)
>> +{
>> +	unsigned long dma_attrs = DMA_ATTR_FORCE_CONTIGUOUS;
>> +	struct qcom_scm_current_perm_info *destvm;
>> +	struct qcom_scm_mem_map_info *mem;
>> +	phys_addr_t memory_phys;
>> +	phys_addr_t dest_phys;
>> +	phys_addr_t src_phys;
>> +	size_t mem_all_sz;
>> +	size_t memory_sz;
>> +	size_t dest_sz;
>> +	size_t src_sz;
>> +	int next_vm;
>> +	__le32 *src;
>> +	void *ptr;
>> +	int ret;
>> +	int i;
> Yay reverse christmas tre.
Shall be reversed?
>
>> +
>> +	src_sz = hweight_long(srcvm)*sizeof(*src);
> Please add space around that '*':
OK
>
> 	src_sz = hweight_long(srcvm) * sizeof(*src);
>
>> +	memory_sz = sizeof(*mem);
>> +	dest_sz = dest_cnt*sizeof(*destvm);
>> +	mem_all_sz = src_sz + memory_sz + dest_sz;
>> +
>> +	ptr = dma_alloc_attrs(__scm->dev, ALIGN(mem_all_sz, SZ_64),
>> +		&src_phys, GFP_KERNEL, dma_attrs);
>> +	if (!ptr) {
>> +		pr_err("mem alloc failed\n");
> We don't want memory allocation failure prints. Please remove.
OK
>
>> +		return -ENOMEM;
>> +	}
> Newline here!
OK
>
>> +	/* Fill source vmid detail */
>> +	src = (__le32 *)(ptr);
> Drop useless parenthesis around ptr please.
OK
>
>> +	ret = hweight_long(srcvm);
> len = hweight_long(...)?
OK, thought to use less local variables. will change
>
>> +	for (i = 0; i < ret; i++) {
> i to ret is really weird looking!
Will check if can use below suggestion
>
>> +		src[i] = cpu_to_le32(ffs(srcvm) - 1);
>> +		srcvm ^= 1 << (ffs(srcvm) - 1);
>> +	}
> What if the loop was written like:
>
> 	for_each_set_bit(i, &srcvm, sizeof(srcvm))
> 		src[i] = cpu_to_le32(i);
>
> I guess srvcm would have to be a long then.
Will check and adopt
>
>> +
>> +	/* Fill details of mem buff to map */
>> +	mem = (struct qcom_scm_mem_map_info *)(ptr + ALIGN(src_sz, SZ_64));
> Useless cast from void *.
OK
>
>> +	memory_phys = src_phys + ALIGN(src_sz, SZ_64);
>> +	mem[0].mem_addr = cpu_to_le64(mem_addr);
>> +	mem[0].mem_size = cpu_to_le64(mem_sz);
>> +
>> +	next_vm = 0;
>> +	/* Fill details of next vmid detail */
>> +	destvm = (struct qcom_scm_current_perm_info *)
>> +			(ptr + ALIGN(memory_sz, SZ_64) + ALIGN(src_sz, SZ_64));
> Useless cast from void.
OK
>> +	dest_phys = memory_phys + ALIGN(memory_sz, SZ_64);
>> +	for (i = 0; i < dest_cnt; i++) {
>> +		destvm[i].vmid = cpu_to_le32(newvm[i].vmid);
>> +		destvm[i].perm = cpu_to_le32(newvm[i].perm);
>> +		destvm[i].ctx = 0;
>> +		destvm[i].ctx_size = 0;
>> +		next_vm |= BIT(newvm[i].vmid);
>> +	}
> Newline please!
OK
>
>> +	ret = __qcom_scm_assign_mem(__scm->dev, memory_phys,
>> +		memory_sz, src_phys, src_sz, dest_phys, dest_sz);
>> +	dma_free_attrs(__scm->dev, ALIGN(mem_all_sz, SZ_64),
>> +		ptr, src_phys, dma_attrs);
>> +	if (ret == 0)
>> +		return next_vm;
>> +	else if (ret > 0)
>> +		return -ret;
> When is ret > 0?
SCM returns positive value in r1 register , and if r1 reg is non zero 
then that should be returned.
Not sure what that indicate.
>
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL(qcom_scm_assign_mem);
>> +
>>   static int qcom_scm_pas_reset_assert(struct reset_controller_dev *rcdev,
>>   				     unsigned long idx)
>>   {

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
