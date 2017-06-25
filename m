Date: Sun, 25 Jun 2017 14:42:26 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] rpmsg: virtio_rpmsg_bus: fix nameservice address
Message-ID: <20170625214226.GH26155@builder>
References: <1496403402-32420-1-git-send-email-henri.roosen@ginzinger.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1496403402-32420-1-git-send-email-henri.roosen@ginzinger.com>
To: Henri Roosen <henri.roosen@ginzinger.com>
Cc: linux-remoteproc@vger.kernel.org, Ohad Ben-Cohen <ohad@wizery.com>, open list <linux-kernel@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri 02 Jun 04:36 PDT 2017, Henri Roosen wrote:

> Commit 2a48d7322dc8 ("rpmsg: rpmsg_send() operations takes rpmsg_endpoint")
> only changed the nameservice address for virtio_rpmsg_announce_create() but
> did not do the same change for virtio_rpmsg_announce_destroy().
> 
> Signed-off-by: Henri Roosen <henri.roosen@ginzinger.com>

Applied, thanks

> ---
>  drivers/rpmsg/virtio_rpmsg_bus.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> index 35b8379..0e0d930 100644
> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> @@ -343,7 +343,7 @@ static int virtio_rpmsg_announce_destroy(struct rpmsg_device *rpdev)
>  		struct rpmsg_ns_msg nsm;
>  
>  		strncpy(nsm.name, rpdev->id.name, RPMSG_NAME_SIZE);
> -		nsm.addr = rpdev->src;
> +		nsm.addr = rpdev->ept->addr;
>  		nsm.flags = RPMSG_NS_DESTROY;
>  
>  		err = rpmsg_sendto(rpdev->ept, &nsm, sizeof(nsm), RPMSG_NS_ADDR);
> -- 
> 2.1.4
> 
