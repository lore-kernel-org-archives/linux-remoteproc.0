Return-Path: <bjorn.andersson@linaro.org>
Date: Wed, 30 Jan 2019 13:07:04 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] remoteproc: qcom_q6v5: don't auto boot remote processor
Message-ID: <20190130210704.GW31919@minitux>
References: <20180524192141.20323-1-ramon.fried@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180524192141.20323-1-ramon.fried@gmail.com>
To: Ramon Fried <ramon.fried@gmail.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu 24 May 12:21 PDT 2018, Ramon Fried wrote:

> Sometimes that rmtfs userspace module is not brought
> up fast enough and the modem crashes.
> disabling automated boot in the driver and triggering
> the boot from user-space sovles the problem.
> 
> Signed-off-by: Ramon Fried <ramon.fried@gmail.com>

While I don't think we have fully settled on the mechanism yet, it's
clear that we don't want this to auto boot using the existing mechanism.

So I picked this patch, with Sibi's ack.

Thanks,
Bjorn

> ---
>  drivers/remoteproc/qcom_q6v5_pil.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pil.c b/drivers/remoteproc/qcom_q6v5_pil.c
> index cbbafdcaaecb..719ee96445b3 100644
> --- a/drivers/remoteproc/qcom_q6v5_pil.c
> +++ b/drivers/remoteproc/qcom_q6v5_pil.c
> @@ -1133,6 +1133,8 @@ static int q6v5_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  	}
>  
> +	rproc->auto_boot = false;
> +
>  	qproc = (struct q6v5 *)rproc->priv;
>  	qproc->dev = &pdev->dev;
>  	qproc->rproc = rproc;
> -- 
> 2.17.0
> 
