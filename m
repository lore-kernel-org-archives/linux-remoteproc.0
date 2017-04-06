Return-Path: <bjorn.andersson@linaro.org>
Date: Wed, 5 Apr 2017 21:43:49 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3 1/2] soc: qcom: Add support of scm call for mss rproc
 to share access of ddr
Message-ID: <20170406044349.GA15143@minitux>
References: <1488996202-1546-1-git-send-email-akdwived@codeaurora.org>
 <1488996202-1546-2-git-send-email-akdwived@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1488996202-1546-2-git-send-email-akdwived@codeaurora.org>
To: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Cc: sboyd@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed 08 Mar 10:03 PST 2017, Avaneesh Kumar Dwivedi wrote:

> This patch add scm call support to make hypervisor call to enable access
> of fw regions in ddr to mss subsystem on arm-v8 arch soc's.
> 
> Signed-off-by: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
> ---
>  drivers/firmware/qcom_scm-64.c     |  25 +++++++
>  drivers/firmware/qcom_scm.c        |  93 ++++++++++++++++++++++++++
>  drivers/firmware/qcom_scm.h        |   3 +
>  drivers/remoteproc/qcom_q6v5_pil.c | 129 ++++++++++++++++++++++++++++++++++++-
>  include/linux/qcom_scm.h           |  14 ++++
>  5 files changed, 262 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/firmware/qcom_scm-64.c b/drivers/firmware/qcom_scm-64.c
> index 4a0f5ea..187fc00 100644
> --- a/drivers/firmware/qcom_scm-64.c
> +++ b/drivers/firmware/qcom_scm-64.c
> @@ -358,3 +358,28 @@ int __qcom_scm_pas_mss_reset(struct device *dev, bool reset)
>  
>  	return ret ? : res.a1;
>  }
> +
> +int __qcom_scm_assign_mem(struct device *dev, struct vmid_detail vmid)

Rather than packing these parameters up in a struct I think it's cleaner
to just pass them directly.

> +{
> +	int ret;
> +	struct qcom_scm_desc desc = {0};
> +	struct arm_smccc_res res;
> +
> +	desc.args[0] = vmid.fw_phy;
> +	desc.args[1] = vmid.size_fw;
> +	desc.args[2] = vmid.from_phy;
> +	desc.args[3] = vmid.size_from;
> +	desc.args[4] = vmid.to_phy;
> +	desc.args[5] = vmid.size_to;
> +	desc.args[6] = 0;
> +
> +	desc.arginfo = QCOM_SCM_ARGS(7, QCOM_SCM_RO, QCOM_SCM_VAL,
> +				QCOM_SCM_RO, QCOM_SCM_VAL, QCOM_SCM_RO,
> +				QCOM_SCM_VAL, QCOM_SCM_VAL);
> +
> +	ret = qcom_scm_call(dev, QCOM_SCM_SVC_MP,
> +				QCOM_MEM_PROT_ASSIGN_ID,
> +				&desc, &res);
> +
> +	return ret ? : res.a1;

If I understand the downstream code we only care about "ret" here; being
zero on success or negative on error.

> +}
> diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
> index 893f953ea..f137f34 100644
> --- a/drivers/firmware/qcom_scm.c
> +++ b/drivers/firmware/qcom_scm.c
> @@ -42,6 +42,18 @@ struct qcom_scm {
>  
>  static struct qcom_scm *__scm;
>  
> +struct dest_vm_and_perm_info {
> +	__le32 vm;
> +	__le32 perm;
> +	__le32 *ctx;

Please be explicit about the fact that this is 64 bit.

> +	__le32 ctx_size;
> +};

This should be __packed

> +
> +struct fw_region_info {
> +	__le64 addr;
> +	__le64 size;
> +};
> +
>  static int qcom_scm_clk_enable(void)
>  {
>  	int ret;
> @@ -292,6 +304,87 @@ int qcom_scm_pas_shutdown(u32 peripheral)
>  }
>  EXPORT_SYMBOL(qcom_scm_pas_shutdown);
>  
> +/**
> + * qcom_scm_assign_mem() - Allocate and fill vmid detail of old
> + * new owners of memory region for fw and metadata etc, Which is
> + * further passed to hypervisor, which does translate intermediate
> + * physical address used by subsystems.
> + * @vmid: structure with pointers and size detail of old and new
> + * owners vmid detail.
> + * Return 0 on success.
> + */
> +int qcom_scm_assign_mem(struct vmid_detail vmid)

After a long discussion with Stephen I now think that I understand
what's actually going on here.

So this function will request TZ to remove all permissions for the
memory region in the tables specified in "from" and then for each vmid
in "to" it will set up the specified "permission".

So the "to" and "permissions" are actually a tuple, rather than
independent lists of values. So I think this should be exposed in the
prototype, as a list of <vmid, permission> entries.

To make the function prototype more convenient I think you should turn
"from" into a bitmap (e.g. BIT(VMID_HLOS) | BIT(VMID_MSS_MSA)).

If you then make the function, on success, return "to" as a bitmap the
caller can simply store that in a state variable and pass it as "from"
in the next call.

So you would have:

  struct qcom_scm_mem_perm new_perms[] = {
  	{ VMID_HLOS, PERM_READ },	
  	{ VMID_MSS_MSA, PREM_READ | PERM_WRITE },
  };
  
  current_perms = qcom_scm_assign_mem(ptr, size, current_perms, new_perms, 2);


And I believe something like "curr_perm" and "new_perm" are even better
names than "from" and "to"

> +{
> +	unsigned long dma_attrs = DMA_ATTR_FORCE_CONTIGUOUS;
> +	struct dest_vm_and_perm_info *to;
> +	struct fw_region_info *fw_info;
> +	__le64 fw_phy;
> +	__le32 *from;
> +	int ret = -ENOMEM;
> +	int i;
> +
> +	from = dma_alloc_attrs(__scm->dev, vmid.size_from,
> +				&vmid.from_phy, GFP_KERNEL, dma_attrs);
> +	if (!from) {
> +		dev_err(__scm->dev,
> +			"failed to allocate buffer to pass source vmid detail\n");
> +		return -ENOMEM;
> +	}
> +	to = dma_alloc_attrs(__scm->dev, vmid.size_to,
> +				&vmid.to_phy, GFP_KERNEL, dma_attrs);
> +	if (!to) {
> +		dev_err(__scm->dev,
> +			"failed to allocate buffer to pass destination vmid detail\n");
> +		goto free_src_buff;
> +	}
> +	fw_info = dma_alloc_attrs(__scm->dev, sizeof(*fw_info),
> +					&fw_phy, GFP_KERNEL, dma_attrs);
> +	if (!fw_info) {
> +		dev_err(__scm->dev,
> +			"failed to allocate buffer to pass firmware detail\n");
> +		goto free_dest_buff;
> +	}

You should be able to allocate these in one chunk and you should be able
to just use dma_alloc_coherent().

> +
> +	/* copy detail of original owner of ddr region */
> +	/* in physically contigious buffer */
> +	memcpy(from, vmid.from, vmid.size_from);

With "from" as a bitmap see hweight_long() to figure out the size of
"from".

> +
> +	/* fill details of new owners of ddr region*/
> +	/* in physically contigious buffer */
> +	for (i = 0; i < (vmid.size_to / sizeof(__le32)); i++) {

Better pass "number of entries in 'to'" and use standard types (such as
int or unsigned int) for "to" and "permission" until this point.

> +		to[i].vm = vmid.to[i];
> +		to[i].perm = vmid.permission[i];
> +		to[i].ctx = NULL;
> +		to[i].ctx_size = 0;
> +	}
> +
> +	/* copy detail of firmware region whose mapping need to be done */
> +	/* in physically contigious buffer */
> +	fw_info->addr = vmid.fw_phy;
> +	fw_info->size = vmid.size_fw;

fw_info is a confusing name for "a list of memory regions".

And you need a cpu_to_le32() somewhere, better keep the in-kernel API
pass standard types (such as phys_addr_t) and then convert to the
"hardware specific" type here.

> +
> +	/* reuse fw_phy and size_fw members to fill address and size of */
> +	/* fw_info buffer */

Please don't try to be "clever" and reuse things when writing
kernel-code, non-obvious reuse of variables or struct members often end
up causing someone else to introduce bugs in your code later.

> +	vmid.fw_phy = fw_phy;
> +	vmid.size_to = sizeof(*to) * (vmid.size_to / sizeof(__le32));
> +	vmid.size_fw = sizeof(*fw_info);
> +	ret = __qcom_scm_assign_mem(__scm->dev, vmid);
> +	if (!ret)
> +		goto free_fw_buff;
> +	return ret;
> +free_fw_buff:
> +	dma_free_attrs(__scm->dev, sizeof(*fw_info), fw_info,
> +		fw_phy, dma_attrs);
> +free_dest_buff:
> +	dma_free_attrs(__scm->dev, vmid.size_to, to,
> +		vmid.to_phy, dma_attrs);
> +free_src_buff:
> +	dma_free_attrs(__scm->dev, vmid.size_from, from,
> +		vmid.from_phy, dma_attrs);
> +	return ret;
> +}
> +EXPORT_SYMBOL(qcom_scm_assign_mem);
> +
>  static int qcom_scm_pas_reset_assert(struct reset_controller_dev *rcdev,
>  				     unsigned long idx)
>  {
> diff --git a/drivers/firmware/qcom_scm.h b/drivers/firmware/qcom_scm.h
> index 3584b00..4665a11 100644
> --- a/drivers/firmware/qcom_scm.h
> +++ b/drivers/firmware/qcom_scm.h
> @@ -55,6 +55,9 @@ extern int  __qcom_scm_pas_mem_setup(struct device *dev, u32 peripheral,
>  extern int  __qcom_scm_pas_auth_and_reset(struct device *dev, u32 peripheral);
>  extern int  __qcom_scm_pas_shutdown(struct device *dev, u32 peripheral);
>  extern int  __qcom_scm_pas_mss_reset(struct device *dev, bool reset);
> +#define QCOM_SCM_SVC_MP	0xc
> +#define QCOM_MEM_PROT_ASSIGN_ID	0x16
> +extern int  __qcom_scm_assign_mem(struct device *dev, struct vmid_detail vmid);
>  
>  /* common error codes */
>  #define QCOM_SCM_V2_EBUSY	-12
> diff --git a/drivers/remoteproc/qcom_q6v5_pil.c b/drivers/remoteproc/qcom_q6v5_pil.c
> index 8fd697a..62ad976 100644
> --- a/drivers/remoteproc/qcom_q6v5_pil.c
> +++ b/drivers/remoteproc/qcom_q6v5_pil.c

Please split the patch in a scm-patch and a q6v5 patch.

> @@ -110,6 +110,7 @@ struct rproc_hexagon_res {
>  	struct qcom_mss_reg_res *active_supply;
>  	char **proxy_clk_names;
>  	char **active_clk_names;
> +	int version;

This will result in multi-line conditionals checking if we should do
memory protection for platform x, y, z or not. Add a "bool
need_mem_protect;" instead.

>  };
>  
>  struct q6v5 {
> @@ -153,8 +154,28 @@ struct q6v5 {
>  	size_t mpss_size;
>  
>  	struct qcom_rproc_subdev smd_subdev;
> +	int version;
>  };
>  
> +enum {
> +	MSS_MSM8916,
> +	MSS_MSM8974,
> +	MSS_MSM8996,
> +};
> +
> +enum {
> +	ASSIGN_ACCESS_MSA,
> +	REMOVE_ACCESS_MSA,
> +	ASSIGN_SHARED_ACCESS_MSA,
> +	REMOVE_SHARED_ACCESS_MSA,
> +};
> +
> +#define VMID_HLOS	0x3
> +#define VMID_MSS_MSA	0xF
> +#define PERM_READ	0x4
> +#define PERM_WRITE	0x2
> +#define PERM_EXEC	0x1
> +#define PERM_RW	(PERM_READ | PERM_WRITE)

These belongs in the SCM API instead. (Prefix them appropriately)

>  static int q6v5_regulator_init(struct device *dev, struct reg_info *regs,
>  			       const struct qcom_mss_reg_res *reg_res)
>  {
> @@ -288,6 +309,54 @@ static struct resource_table *q6v5_find_rsc_table(struct rproc *rproc,
>  	return &table;
>  }
>  
> +int hyp_mem_access(int id, phys_addr_t addr, size_t size)

I much prefer the downstream split and naming of this function, rather
than using a switch to implement 4 different functions in one please
split it up.

> +{
> +	struct vmid_detail vmid;
> +	int ret;
> +

Pass the struct q6v5 here and return successfully here if we're not
supposed to do memory protection. It does clean up the calling code.

> +	switch (id) {
> +	case ASSIGN_ACCESS_MSA:
> +		vmid.from = (int[]) { VMID_HLOS };
> +		vmid.to = (int[]) { VMID_MSS_MSA };
> +		vmid.permission = (int[]) { PERM_READ | PERM_WRITE };
> +		vmid.size_from = vmid.size_to = 1 * sizeof(__le32);
> +		break;
> +	case REMOVE_ACCESS_MSA:
> +		vmid.from = (int[]) { VMID_MSS_MSA };
> +		vmid.to = (int[]) { VMID_HLOS };
> +		vmid.permission =
> +			(int[]) { PERM_READ | PERM_WRITE | PERM_EXEC };
> +		vmid.size_from = vmid.size_to = 1 * sizeof(__le32);
> +		break;
> +	case ASSIGN_SHARED_ACCESS_MSA:
> +		vmid.from = (int[]) { VMID_HLOS };
> +		vmid.to = (int[]) { VMID_HLOS, VMID_MSS_MSA };
> +		vmid.permission = (int[]) { PERM_RW, PERM_RW };
> +		vmid.size_from = 1 * sizeof(__le32);
> +		vmid.size_to = 2 * sizeof(__le32);
> +		break;
> +	case REMOVE_SHARED_ACCESS_MSA:
> +		vmid.from = (int[]) { VMID_HLOS, VMID_MSS_MSA };
> +		vmid.to = (int[]) { VMID_HLOS };
> +		vmid.permission =
> +			(int[]) { PERM_READ | PERM_WRITE | PERM_EXEC };
> +		vmid.size_from = 2 * sizeof(__le32);
> +		vmid.size_to = 1 * sizeof(__le32);
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	vmid.fw_phy = addr;
> +	vmid.size_fw = size;
> +	ret = qcom_scm_assign_mem(vmid);
> +	if (ret)
> +		pr_err("%s: Failed to assign memory protection, ret = %d\n",
> +			__func__, ret);
> +
> +	return ret;
> +}
> +
>  static int q6v5_load(struct rproc *rproc, const struct firmware *fw)
>  {
>  	struct q6v5 *qproc = rproc->priv;
> @@ -461,6 +530,15 @@ static int q6v5_mpss_init_image(struct q6v5 *qproc, const struct firmware *fw)
>  
>  	memcpy(ptr, fw->data, fw->size);
>  
> +	/* Hypervisor mapping to access metadata by modem */
> +	ret = qproc->version == MSS_MSM8996 ?

To prove the point above, imagine just in the next year when this
becomes:

ret = (qproc->version == MSS_MSM8996 ||
       qproc->version == MSS_MSM8998 ||
       qproc->version == MSS_NEXT_THING) ?
       hyp_mem_access(ASSIGN_ACCESS_MSA, phys, ALIGN(fw->size, SZ_4K)) :
       0;

Or in 5 years...

> +			hyp_mem_access(ASSIGN_ACCESS_MSA, phys,
> +			ALIGN(fw->size, SZ_4K)) : 0;
> +	if (ret) {
> +		dev_err(qproc->dev,
> +			"Failed to assign metadata memory, ret - %d\n", ret);

Rather than having this print after each call to hyp_mem_access() move
the message into that function.

> +		return -ENOMEM;

And don't forget to clean up the allocation before returning.

> +	}
>  	writel(phys, qproc->rmb_base + RMB_PMI_META_DATA_REG);
>  	writel(RMB_CMD_META_DATA_READY, qproc->rmb_base + RMB_MBA_COMMAND_REG);
>  
> @@ -470,6 +548,13 @@ static int q6v5_mpss_init_image(struct q6v5 *qproc, const struct firmware *fw)
>  	else if (ret < 0)
>  		dev_err(qproc->dev, "MPSS header authentication failed: %d\n", ret);
>  
> +	/* Metadata authentication done, remove modem access */
> +	ret = qproc->version == MSS_MSM8996 ?
> +			hyp_mem_access(REMOVE_ACCESS_MSA, phys,
> +			ALIGN(fw->size, SZ_4K)) : 0;

You use ALIGN(fw->size, SZ_4K) numerous times in this function, use a
variable and make the allocation take this as well to make it explicit
that we're dealing with the same memory chunk size all over.

> +	if (ret)
> +		dev_err(qproc->dev,
> +			"Failed to reclaim metadata memory, ret - %d\n", ret);
>  	dma_free_attrs(qproc->dev, fw->size, ptr, phys, dma_attrs);
>  
>  	return ret < 0 ? ret : 0;
> @@ -578,6 +663,16 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
>  		size = readl(qproc->rmb_base + RMB_PMI_CODE_LENGTH_REG);
>  		if (!size) {
>  			boot_addr = relocate ? qproc->mpss_phys : min_addr;
> +			/* Hypervisor mapping of modem fw */
> +			ret = qproc->version == MSS_MSM8996 ?
> +					hyp_mem_access(ASSIGN_SHARED_ACCESS_MSA,
> +					boot_addr, qproc->mpss_size) : 0;

The mpss is loaded somewhere in qproc->mpss_region, potentially at some
offset (which would be reflected in boot_addr).

But if boot_addr > qproc->mpss_region the region to hand out is no
longer mpss_size large, it's "mpss_size - (boot_addr - mpss_phys)", so
you might give the mpss permission to trash the memory after the
mpss_region.

Better hand out qproc->mpss_phys of size qproc->mpss_size.


And as far as I can tell the downstream driver load the segments and
then make the MSS sole owner of the memory region. Do note that it's
perfectly fine to refactor code to make things better fit a natural and
easy to follow flow of ownership here!

> +			if (ret) {
> +				dev_err(qproc->dev,
> +					"Failed to assign fw memory access, ret - %d\n",
> +					ret);
> +				return -ENOMEM;
> +			}
>  			writel(boot_addr, qproc->rmb_base + RMB_PMI_CODE_START_REG);
>  			writel(RMB_CMD_LOAD_READY, qproc->rmb_base + RMB_MBA_COMMAND_REG);
>  		}
> @@ -636,6 +731,14 @@ static int q6v5_start(struct rproc *rproc)
>  		goto assert_reset;
>  	}
>  
> +	ret = qproc->version == MSS_MSM8996 ?
> +			hyp_mem_access(ASSIGN_ACCESS_MSA, qproc->mba_phys,
> +			qproc->mba_size) : 0;
> +	if (ret) {
> +		dev_err(qproc->dev,
> +			"Failed to assign mba memory access, ret - %d\n", ret);
> +		goto assert_reset;
> +	}
>  	writel(qproc->mba_phys, qproc->rmb_base + RMB_MBA_IMAGE_REG);
>  
>  	ret = q6v5proc_reset(qproc);
> @@ -657,16 +760,22 @@ static int q6v5_start(struct rproc *rproc)
>  
>  	ret = q6v5_mpss_load(qproc);
>  	if (ret)
> -		goto halt_axi_ports;
> +		goto reclaim_mem;
>  
>  	ret = wait_for_completion_timeout(&qproc->start_done,
>  					  msecs_to_jiffies(5000));
>  	if (ret == 0) {
>  		dev_err(qproc->dev, "start timed out\n");
>  		ret = -ETIMEDOUT;
> -		goto halt_axi_ports;
> +		goto reclaim_mem;
>  	}
>  
> +	ret = qproc->version == MSS_MSM8996 ?
> +			hyp_mem_access(REMOVE_ACCESS_MSA, qproc->mba_phys,
> +			qproc->mba_size) : 0;
> +	if (ret)
> +		dev_err(qproc->dev,
> +			"Failed to reclaim mba memory, ret - %d\n", ret);
>  	qproc->running = true;
>  
>  	q6v5_clk_disable(qproc->dev, qproc->proxy_clks,
> @@ -676,7 +785,20 @@ static int q6v5_start(struct rproc *rproc)
>  

On success q6v5_start() will leave Linus as sole owner of mba_phys and
mpss_phys (or boot_addr) will have shared ownership. rproc_stop() should
make sure to reclaim the sole ownership of mpss_phys again, so that
subsequent calls to rproc_start() will find the memory protection in an
appropriate state.

>  	return 0;
>  
> +reclaim_mem:
> +	ret = qproc->version == MSS_MSM8996 ?
> +			hyp_mem_access(REMOVE_SHARED_ACCESS_MSA,
> +			qproc->mpss_phys, qproc->mpss_size) : 0;
> +	if (ret)
> +		dev_err(qproc->dev,
> +			"Failed to reclaim fw memory, ret - %d\n", ret);
>  halt_axi_ports:
> +	ret = qproc->version == MSS_MSM8996 ?
> +			hyp_mem_access(REMOVE_ACCESS_MSA, qproc->mba_phys,
> +			qproc->mba_size) : 0;
> +	if (ret)
> +		dev_err(qproc->dev,
> +			"Failed to reclaim mba memory, ret - %d\n", ret);

Isn't it possible that the remote processor is still executing the MBA
firmware up until we halt the axi ports and assert the reset? We don't
want to remove permission until we know the CPU is stopped and it wont
fault on us.

>  	q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_q6);
>  	q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_modem);
>  	q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_nc);
> @@ -1015,6 +1137,7 @@ static int q6v5_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto free_rproc;
>  
> +	qproc->version = desc->version;
>  	ret = q6v5_request_irq(qproc, pdev, "wdog", q6v5_wdog_interrupt);
>  	if (ret < 0)
>  		goto free_rproc;
> @@ -1090,6 +1213,7 @@ static int q6v5_remove(struct platform_device *pdev)
>  		"mem",
>  		NULL
>  	},
> +	.version = MSS_MSM8916,
>  };
>  
>  static const struct rproc_hexagon_res msm8974_mss = {
> @@ -1127,6 +1251,7 @@ static int q6v5_remove(struct platform_device *pdev)
>  		"mem",
>  		NULL
>  	},
> +	.version = MSS_MSM8974,
>  };
>  
>  static const struct of_device_id q6v5_of_match[] = {
> diff --git a/include/linux/qcom_scm.h b/include/linux/qcom_scm.h
> index cc32ab8..cb0b7ee 100644
> --- a/include/linux/qcom_scm.h
> +++ b/include/linux/qcom_scm.h
> @@ -23,6 +23,19 @@ struct qcom_scm_hdcp_req {
>  	u32 val;
>  };
>  
> +struct vmid_detail {

Whenever you add structs to a public API, make sure to add some
kerneldoc.

And as this is a kernel-API I would like to see standard kernel-types
for things.

> +	__le32 *from;
> +	__le32 *to;
> +	__le32 *permission;
> +	__le32 size_from;
> +	__le32 size_to;
> +	__le32 size_fw;
> +	__le64 fw_phy;
> +	__le64 from_phy;
> +	__le64 to_phy;
> +
> +};
> +

Regards,
Bjorn
