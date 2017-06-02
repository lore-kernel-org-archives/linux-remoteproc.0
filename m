Return-Path: <s-anna@ti.com>
Subject: Re: [PATCH] rpmsg: virtio_rpmsg_bus: cleanup multiple assignment to
 ops
References: <1496403382-32374-1-git-send-email-henri.roosen@ginzinger.com>
From: Suman Anna <s-anna@ti.com>
Message-ID: <053186d1-f05d-06e0-2fa9-e15bcfa5bb02@ti.com>
Date: Fri, 2 Jun 2017 16:40:15 -0500
MIME-Version: 1.0
In-Reply-To: <1496403382-32374-1-git-send-email-henri.roosen@ginzinger.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
To: Henri Roosen <henri.roosen@ginzinger.com>, linux-remoteproc@vger.kernel.org
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, open list <linux-kernel@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On 06/02/2017 06:36 AM, Henri Roosen wrote:
> Trivial cleanup: the .ops pointer is assigned twice. This patch removes the
> first assignment.
> 
> Signed-off-by: Henri Roosen <henri.roosen@ginzinger.com>

Acked-by: Suman Anna <s-anna@ti.com>

> ---
>  drivers/rpmsg/virtio_rpmsg_bus.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> index 3c582f2..35b8379 100644
> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> @@ -390,9 +390,6 @@ static struct rpmsg_device *rpmsg_create_channel(struct virtproc_info *vrp,
>  	/* Link the channel to our vrp */
>  	vch->vrp = vrp;
>  
> -	/* Assign callbacks for rpmsg_channel */
> -	vch->rpdev.ops = &virtio_rpmsg_ops;
> -
>  	/* Assign public information to the rpmsg_device */
>  	rpdev = &vch->rpdev;
>  	rpdev->src = chinfo->src;
> 
