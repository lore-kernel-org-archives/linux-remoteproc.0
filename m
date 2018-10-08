Return-Path: <bjorn.andersson@linaro.org>
Date: Sun, 7 Oct 2018 23:55:02 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3 6/6] remoteproc: qcom: q6v5-pil: Assign the relocated
 address
Message-ID: <20181008065502.GQ12063@builder>
References: <20180727152003.11663-1-sibis@codeaurora.org>
 <20180727152003.11663-7-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180727152003.11663-7-sibis@codeaurora.org>
To: Sibi Sankar <sibis@codeaurora.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, ohad@wizery.com, kyan@codeaurora.org, sricharan@codeaurora.org, akdwived@codeaurora.org, linux-arm-msm@vger.kernel.org, tsoni@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri 27 Jul 08:20 PDT 2018, Sibi Sankar wrote:

> Assign the relocated base of the modem image, as the offsets
> from the virtual memory might not be based on the physical
> address.
> 

In order to get this merged before the first call to rproc_da_to_va() I
applied this patch to rproc-next.

Thanks,
Bjorn

> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  drivers/remoteproc/qcom_q6v5_pil.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pil.c b/drivers/remoteproc/qcom_q6v5_pil.c
> index 22bb049c3e7f..b1296d614b8b 100644
> --- a/drivers/remoteproc/qcom_q6v5_pil.c
> +++ b/drivers/remoteproc/qcom_q6v5_pil.c
> @@ -862,6 +862,7 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
>  	}
>  
>  	mpss_reloc = relocate ? min_addr : qproc->mpss_phys;
> +	qproc->mpss_reloc = mpss_reloc;
>  	/* Load firmware segments */
>  	for (i = 0; i < ehdr->e_phnum; i++) {
>  		phdr = &phdrs[i];
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
