Return-Path: <bjorn.andersson@linaro.org>
Date: Sun, 25 Jun 2017 14:35:29 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] rpmsg: virtio_rpmsg_bus: fix announce for devices
 without endpoint
Message-ID: <20170625213529.GF26155@builder>
References: <1496403351-32280-1-git-send-email-henri.roosen@ginzinger.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1496403351-32280-1-git-send-email-henri.roosen@ginzinger.com>
To: Henri Roosen <henri.roosen@ginzinger.com>
Cc: linux-remoteproc@vger.kernel.org, Ohad Ben-Cohen <ohad@wizery.com>, open list <linux-kernel@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri 02 Jun 04:35 PDT 2017, Henri Roosen wrote:

> A device might not have an endpoint assigned. This patch checks if
> rpdev->ept has a value before dereferencing or using it.
> 

Applied, thanks.

> Signed-off-by: Henri Roosen <henri.roosen@ginzinger.com>
> ---
>  drivers/rpmsg/virtio_rpmsg_bus.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> index 5e66e081..3c582f2 100644
> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> @@ -314,7 +314,7 @@ static int virtio_rpmsg_announce_create(struct rpmsg_device *rpdev)
>  	int err = 0;
>  
>  	/* need to tell remote processor's name service about this channel ? */
> -	if (rpdev->announce &&
> +	if (rpdev->announce && rpdev->ept &&
>  	    virtio_has_feature(vrp->vdev, VIRTIO_RPMSG_F_NS)) {
>  		struct rpmsg_ns_msg nsm;
>  
> @@ -338,7 +338,7 @@ static int virtio_rpmsg_announce_destroy(struct rpmsg_device *rpdev)
>  	int err = 0;
>  
>  	/* tell remote processor's name service we're removing this channel */
> -	if (rpdev->announce &&
> +	if (rpdev->announce && rpdev->ept &&
>  	    virtio_has_feature(vrp->vdev, VIRTIO_RPMSG_F_NS)) {
>  		struct rpmsg_ns_msg nsm;
>  
> -- 
> 2.1.4
> 
