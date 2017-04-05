Return-Path: <sboyd@codeaurora.org>
Date: Wed, 5 Apr 2017 16:44:48 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v3 1/2] soc: qcom: Add support of scm call for mss rproc
 to share access of ddr
Message-ID: <20170405234448.GO7065@codeaurora.org>
References: <1488996202-1546-1-git-send-email-akdwived@codeaurora.org>
 <1488996202-1546-2-git-send-email-akdwived@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1488996202-1546-2-git-send-email-akdwived@codeaurora.org>
To: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Cc: bjorn.andersson@linaro.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On 03/08, Avaneesh Kumar Dwivedi wrote:
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

Why are we passing a structure copy?

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

These should all cause sparse warnings because of incorrect
assignments. Given that these are all registers, I'm not sure why
the vmid_detail structure has __le32 in it.

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

Drop the pointer? Just treat it like another number? Pointer is
really odd because it doesn't really make any sense what the
address of the pointer would be.

> +	__le32 ctx_size;
> +};
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

Maybe this can be the long description, but the short description
should be shorter.

> + * @vmid: structure with pointers and size detail of old and new
> + * owners vmid detail.
> + * Return 0 on success.

There's a standard syntax for return too. Look at kernel doc
howto please.

> + */
> +int qcom_scm_assign_mem(struct vmid_detail vmid)

Please no structure copy.

> +{
> +	unsigned long dma_attrs = DMA_ATTR_FORCE_CONTIGUOUS;
> +	struct dest_vm_and_perm_info *to;
> +	struct fw_region_info *fw_info;
> +	__le64 fw_phy;
> +	__le32 *from;
> +	int ret = -ENOMEM;

Not sure why we assign it. It gets overwritten with the first use.

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

Can we consolidate this into one allocation with the appropriate
size and then offset the different structures in it?

> +	if (!fw_info) {
> +		dev_err(__scm->dev,
> +			"failed to allocate buffer to pass firmware detail\n");
> +		goto free_dest_buff;
> +	}
> +
> +	/* copy detail of original owner of ddr region */
> +	/* in physically contigious buffer */
> +	memcpy(from, vmid.from, vmid.size_from);
> +
> +	/* fill details of new owners of ddr region*/
> +	/* in physically contigious buffer */
> +	for (i = 0; i < (vmid.size_to / sizeof(__le32)); i++) {
> +		to[i].vm = vmid.to[i];
> +		to[i].perm = vmid.permission[i];

Here you want the cpu_to_le32() stuff. Please run sparse.

> +		to[i].ctx = NULL;
> +		to[i].ctx_size = 0;
> +	}
> +
> +	/* copy detail of firmware region whose mapping need to be done */
> +	/* in physically contigious buffer */

/* 
 * Multi-line comments are like so.
 */

> +	fw_info->addr = vmid.fw_phy;
> +	fw_info->size = vmid.size_fw;
> +
> +	/* reuse fw_phy and size_fw members to fill address and size of */
> +	/* fw_info buffer */
> +	vmid.fw_phy = fw_phy;
> +	vmid.size_to = sizeof(*to) * (vmid.size_to / sizeof(__le32));
> +	vmid.size_fw = sizeof(*fw_info);
> +	ret = __qcom_scm_assign_mem(__scm->dev, vmid);
> +	if (!ret)
> +		goto free_fw_buff;
> +	return ret;

We don't free dma on failure?

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

This is already defined upstream?

> +#define QCOM_MEM_PROT_ASSIGN_ID	0x16
> +extern int  __qcom_scm_assign_mem(struct device *dev, struct vmid_detail vmid);
>  
>  /* common error codes */
>  #define QCOM_SCM_V2_EBUSY	-12
> diff --git a/drivers/remoteproc/qcom_q6v5_pil.c b/drivers/remoteproc/qcom_q6v5_pil.c
> index 8fd697a..62ad976 100644
> --- a/drivers/remoteproc/qcom_q6v5_pil.c
> +++ b/drivers/remoteproc/qcom_q6v5_pil.c
> @@ -288,6 +309,54 @@ static struct resource_table *q6v5_find_rsc_table(struct rproc *rproc,
>  	return &table;
>  }
>  
> +int hyp_mem_access(int id, phys_addr_t addr, size_t size)

static?

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
> +	__le32 *from;
> +	__le32 *to;
> +	__le32 *permission;
> +	__le32 size_from;
> +	__le32 size_to;
> +	__le32 size_fw;
> +	__le64 fw_phy;
> +	__le64 from_phy;
> +	__le64 to_phy;

should the *_phy be phys_addr_t types?

Leave these all as u32/u64. Perhaps also move size_from/size_to
next to the arrays they're for. Also add some documentation so we
know what they're all about.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
