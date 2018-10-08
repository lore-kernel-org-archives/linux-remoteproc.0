Return-Path: <bjorn.andersson@linaro.org>
Date: Sun, 7 Oct 2018 23:48:28 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3 5/6] remoteproc: qcom: q6v5-pil: Register
 segments/dumpfn for coredump
Message-ID: <20181008064828.GP12063@builder>
References: <20180727152003.11663-1-sibis@codeaurora.org>
 <20180727152003.11663-6-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180727152003.11663-6-sibis@codeaurora.org>
To: Sibi Sankar <sibis@codeaurora.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, ohad@wizery.com, kyan@codeaurora.org, sricharan@codeaurora.org, akdwived@codeaurora.org, linux-arm-msm@vger.kernel.org, tsoni@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri 27 Jul 08:20 PDT 2018, Sibi Sankar wrote:

> Register the MDT segments and custom dumpfn with the remoteproc core
> dump functionality.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  drivers/remoteproc/qcom_q6v5_pil.c | 40 ++++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pil.c b/drivers/remoteproc/qcom_q6v5_pil.c
> index ac3342f9ea5a..22bb049c3e7f 100644
> --- a/drivers/remoteproc/qcom_q6v5_pil.c
> +++ b/drivers/remoteproc/qcom_q6v5_pil.c
> @@ -1058,10 +1058,50 @@ static void *q6v5_da_to_va(struct rproc *rproc, u64 da, int len)
>  	return qproc->mpss_region + offset;
>  }
>  
> +static int qcom_q6v5_register_dump_segments(struct rproc *rproc,
> +				const struct firmware *fw_unused)

How about naming it mba_fw instead of unused? Just as unused, but easier
to understand why it isn't used.

> +{
> +	const struct firmware *fw;
> +	const struct elf32_phdr *phdrs;
> +	const struct elf32_phdr *phdr;
> +	const struct elf32_hdr *ehdr;
> +	struct q6v5 *qproc = (struct q6v5 *)rproc->priv;

No need for an explicit typecast from void *.

The rest looks good!

Regards,
Bjorn
