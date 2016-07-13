Return-Path: <bjorn.andersson@linaro.org>
Date: Wed, 13 Jul 2016 13:42:35 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] rpmsg: remove unneeded conversions to bool
Message-ID: <20160713204235.GN23833@tuxbot>
References: <20160701142458.17021-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160701142458.17021-1-afd@ti.com>
To: "Andrew F. Davis" <afd@ti.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri 01 Jul 07:24 PDT 2016, Andrew F. Davis wrote:

> Found with scripts/coccinelle/misc/boolconv.cocci.
> 
> Signed-off-by: Andrew F. Davis <afd@ti.com>

Applied, thanks

Regards,
Bjorn

> ---
>  drivers/rpmsg/virtio_rpmsg_bus.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> index fe03b2a..e58637a 100644
> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> @@ -528,7 +528,7 @@ static struct rpmsg_channel *rpmsg_create_channel(struct virtproc_info *vrp,
>  	 * rpmsg server channels has predefined local address (for now),
>  	 * and their existence needs to be announced remotely
>  	 */
> -	rpdev->announce = rpdev->src != RPMSG_ADDR_ANY ? true : false;
> +	rpdev->announce = rpdev->src != RPMSG_ADDR_ANY;
>  
>  	strncpy(rpdev->id.name, chinfo->name, RPMSG_NAME_SIZE);
>  
> -- 
> 2.9.0
> 
