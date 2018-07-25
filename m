Return-Path: <s-anna@ti.com>
Subject: Re: [PATCH 1/1] rpmsg: virtio_rpmsg_bus: Fix rpmsg_remove() release
 order
References: <1532552826-30003-1-git-send-email-loic.pallardy@st.com>
From: Suman Anna <s-anna@ti.com>
Message-ID: <d9b7192b-2fc7-664f-d9a5-b90c8644b991@ti.com>
Date: Wed, 25 Jul 2018 17:32:06 -0500
MIME-Version: 1.0
In-Reply-To: <1532552826-30003-1-git-send-email-loic.pallardy@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Loic Pallardy <loic.pallardy@st.com>, bjorn.andersson@linaro.org, ohad@wizery.com
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com, benjamin.gaignard@linaro.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Loic,

On 07/25/2018 04:07 PM, Loic Pallardy wrote:
> In rpmsg_remove() procedure, children are removed then Name
> Service announcement endpoint is destroyed and device released.
> 
> Issue with current implementation is if a NS announcement
> creation request is ongoing (received before virtio reset),
> child device could be created after children removing.
> In that case rpmsg_remove() is freeing rpmsg_virtio_bus,
> leading to an inconsistent state.
> 
> This patch is destroying NS announcement service endpoint before
> removing children to guarantee that list of child devices is
> fixed and all of them will be correctly removed before cleaning
> resources.

I do not think this is the right fix for the problem you explained.
The removal of rpmsg devices can actually invoke the announce_destroy
in the rpmsg_dev_remove().

regards
Suman

> 
> fixes: bcabbccabffe ("rpmsg: Split off generic tail of create_channel()")
> 
> Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
> ---
>  drivers/rpmsg/virtio_rpmsg_bus.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> index 664f957..f5d481f 100644
> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> @@ -1004,13 +1004,13 @@ static void rpmsg_remove(struct virtio_device *vdev)
>  
>  	vdev->config->reset(vdev);
>  
> +	if (vrp->ns_ept)
> +		__rpmsg_destroy_ept(vrp, vrp->ns_ept);
> +
>  	ret = device_for_each_child(&vdev->dev, NULL, rpmsg_remove_device);
>  	if (ret)
>  		dev_warn(&vdev->dev, "can't remove rpmsg device: %d\n", ret);
>  
> -	if (vrp->ns_ept)
> -		__rpmsg_destroy_ept(vrp, vrp->ns_ept);
> -
>  	idr_destroy(&vrp->endpoints);
>  
>  	vdev->config->del_vqs(vrp->vdev);
> 
