Return-Path: <bjorn.andersson@linaro.org>
Date: Tue, 5 Jul 2016 16:43:15 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [patch] remoteproc: qcom: remove some bogus error handling
Message-ID: <20160705234315.GP1190@tuxbot>
References: <20160629144055.GB22818@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160629144055.GB22818@mwanda>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@sonymobile.com>, linux-remoteproc@vger.kernel.org, kernel-janitors@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed 29 Jun 07:40 PDT 2016, Dan Carpenter wrote:

> "val" can't be negative because it's unsigned and also readl() doesn't
> return negative error codes.
> 

Thanks for catching this. Unfortunately a successful validation will
result in status becoming 4 and I check if the return value is non-zero
(rather than negative) in q6v5_mpss_load().

However, the next step in the process is to do a timed wait for the
status to turn 4 or negative, so we should treat that snippet (check for
MBA_AUTH_COMPLETE) as part of the validation and move it in here from
q6v5_mpss_load().

Regards,
Bjorn

> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pil.c b/drivers/remoteproc/qcom_q6v5_pil.c
> index fb4c56c..8abc369 100644
> --- a/drivers/remoteproc/qcom_q6v5_pil.c
> +++ b/drivers/remoteproc/qcom_q6v5_pil.c
> @@ -386,7 +386,6 @@ static int q6v5_mpss_validate(struct q6v5 *qproc, const struct firmware *fw)
>  	phys_addr_t fw_addr;
>  	bool relocate;
>  	size_t size;
> -	u32 val;
>  	int ret;
>  	int i;
>  
> @@ -425,8 +424,7 @@ static int q6v5_mpss_validate(struct q6v5 *qproc, const struct firmware *fw)
>  		writel(size, qproc->rmb_base + RMB_PMI_CODE_LENGTH_REG);
>  	}
>  
> -	val = readl(qproc->rmb_base + RMB_MBA_STATUS_REG);
> -	return val < 0 ? val : 0;
> +	return readl(qproc->rmb_base + RMB_MBA_STATUS_REG);
>  }
>  
>  static int q6v5_mpss_load(struct q6v5 *qproc)
> --
> To unsubscribe from this list: send the line "unsubscribe linux-remoteproc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
