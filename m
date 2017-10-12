Return-Path: <bjorn.andersson@linaro.org>
Date: Thu, 12 Oct 2017 11:18:05 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v7 3/4] remoteproc: qcom: Make secure world call for mem
 ownership switch
Message-ID: <20171012181805.GF1165@minitux>
References: <1500634173-24416-1-git-send-email-akdwived@codeaurora.org>
 <1500634173-24416-4-git-send-email-akdwived@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1500634173-24416-4-git-send-email-akdwived@codeaurora.org>
To: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Cc: sboyd@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri 21 Jul 03:49 PDT 2017, Avaneesh Kumar Dwivedi wrote:

> MSS proc on msm8996 can not access fw loaded region without stage
> second translation of memory pages where mpss image are loaded.
> This patch in order to enable mss boot on msm8996 invoke scm call
> to switch or share ownership between apps and modem.
> 
> Signed-off-by: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
> ---
>  drivers/remoteproc/qcom_q6v5_pil.c | 90 ++++++++++++++++++++++++++++++++++++--
>  1 file changed, 87 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pil.c b/drivers/remoteproc/qcom_q6v5_pil.c
[..]
> +static int q6v5_xfer_mem_ownership(struct q6v5 *qproc, int *current_perm,
> +				   bool remote_owner, phys_addr_t addr,
> +				   size_t size)
> +{
> +	struct qcom_scm_vmperm next;
> +	int ret;
> +
> +	if (!qproc->need_mem_protection)
> +		return 0;
> +	if (remote_owner && *current_perm == BIT(QCOM_SCM_VMID_MSS_MSA))
> +		return 0;
> +	if (!remote_owner && *current_perm == BIT(QCOM_SCM_VMID_HLOS))
> +		return 0;
> +
> +	next.vmid = remote_owner ? QCOM_SCM_VMID_MSS_MSA : QCOM_SCM_VMID_HLOS;
> +	next.perm = remote_owner ? QCOM_SCM_PERM_RW : QCOM_SCM_PERM_RWX;
> +
> +	ret = qcom_scm_assign_mem(addr, ALIGN(size, SZ_4K),
> +				  *current_perm, &next, 1);
> +	if (ret < 0) {
> +		pr_err("Failed to assign memory access in range %p to %p to %s ret = %d\n",
> +		       (void *)addr, (void *)(addr + size),
> +		       remote_owner ? "mss" : "hlos", ret);

qcom_scm_assign_mem() also prints an error when this happens, there's no
need for that. I'm happy with you dropping the print from
qcom_scm_assign_mem() and keeping this one.

> +		return ret;
> +	}
> +
> +	*current_perm = ret;
> +	return 0;
> +}
> +
>  static int q6v5_load(struct rproc *rproc, const struct firmware *fw)
>  {
>  	struct q6v5 *qproc = rproc->priv;
> @@ -450,6 +484,8 @@ static int q6v5_mpss_init_image(struct q6v5 *qproc, const struct firmware *fw)
>  {
>  	unsigned long dma_attrs = DMA_ATTR_FORCE_CONTIGUOUS;
>  	dma_addr_t phys;
> +	int mdata_perm;
> +	int xferop_ret;
>  	void *ptr;
>  	int ret;
>  
> @@ -461,6 +497,12 @@ static int q6v5_mpss_init_image(struct q6v5 *qproc, const struct firmware *fw)
>  
>  	memcpy(ptr, fw->data, fw->size);
>  
> +	/* Hypervisor mapping to access metadata by modem */
> +	mdata_perm = BIT(QCOM_SCM_VMID_HLOS);
> +	ret = q6v5_xfer_mem_ownership(qproc, &mdata_perm,
> +				      1, phys, fw->size);

Please use "true" instead of "1".

> +	if (ret)
> +		return -EAGAIN;

Please keep a empty line here, to keep the "paragraphs" or "chunks" of
code split up.

>  	writel(phys, qproc->rmb_base + RMB_PMI_META_DATA_REG);
>  	writel(RMB_CMD_META_DATA_READY, qproc->rmb_base + RMB_MBA_COMMAND_REG);
>  

Regards,
Bjorn
