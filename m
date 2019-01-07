Return-Path: <bjorn.andersson@linaro.org>
Date: Mon, 7 Jan 2019 09:30:03 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] rpmsg: core: Make remove handler for rpmsg driver
 optional.
Message-ID: <20190107173003.GL31596@builder>
References: <20190107113833.243672-1-pihsun@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190107113833.243672-1-pihsun@chromium.org>
To: Pi-Hsun Shih <pihsun@chromium.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, "open list:REMOTE PROCESSOR MESSAGING (RPMSG) SUBSYSTEM" <linux-remoteproc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Mon 07 Jan 03:38 PST 2019, Pi-Hsun Shih wrote:

> Most other bus (for example, SPI, i2c) have the remove handler for
> driver optional. Make remove handler for rpmsg driver optional too.
> 
> Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>

Thanks Pi-Hsun, applied.

Regards,
Bjorn

> ---
>  drivers/rpmsg/rpmsg_core.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
> index 8122807db38094..ea88fd4e2a6ecf 100644
> --- a/drivers/rpmsg/rpmsg_core.c
> +++ b/drivers/rpmsg/rpmsg_core.c
> @@ -493,7 +493,8 @@ static int rpmsg_dev_remove(struct device *dev)
>  	if (rpdev->ops->announce_destroy)
>  		err = rpdev->ops->announce_destroy(rpdev);
>  
> -	rpdrv->remove(rpdev);
> +	if (rpdrv->remove)
> +		rpdrv->remove(rpdev);
>  
>  	dev_pm_domain_detach(dev, true);
>  
> -- 
> 2.20.1.97.g81188d93c3-goog
> 
