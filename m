Return-Path: <bjorn.andersson@linaro.org>
Date: Sun, 25 Jun 2017 14:43:52 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] rpmsg: virtio_rpmsg_bus: cleanup multiple assignment to
 ops
Message-ID: <20170625214352.GI26155@builder>
References: <1496403382-32374-1-git-send-email-henri.roosen@ginzinger.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1496403382-32374-1-git-send-email-henri.roosen@ginzinger.com>
To: Henri Roosen <henri.roosen@ginzinger.com>
Cc: linux-remoteproc@vger.kernel.org, Ohad Ben-Cohen <ohad@wizery.com>, open list <linux-kernel@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri 02 Jun 04:36 PDT 2017, Henri Roosen wrote:

> Trivial cleanup: the .ops pointer is assigned twice. This patch removes the
> first assignment.
> 
> Signed-off-by: Henri Roosen <henri.roosen@ginzinger.com>

Applied, thanks

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
> -- 
> 2.1.4
> 
