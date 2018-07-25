Return-Path: <s-anna@ti.com>
Subject: Re: [PATCH 1/1] rpmsg: virtio_rpmsg_bus: Fix rpmsg_create_channel
 memory leak
References: <1532552916-30111-1-git-send-email-loic.pallardy@st.com>
From: Suman Anna <s-anna@ti.com>
Message-ID: <19e8f6e7-3ee6-6606-164c-3bb953a13da5@ti.com>
Date: Wed, 25 Jul 2018 17:36:33 -0500
MIME-Version: 1.0
In-Reply-To: <1532552916-30111-1-git-send-email-loic.pallardy@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Loic Pallardy <loic.pallardy@st.com>, bjorn.andersson@linaro.org, ohad@wizery.com
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com, benjamin.gaignard@linaro.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Loic,

On 07/25/2018 04:08 PM, Loic Pallardy wrote:
> In case of rpmsg_register_device() failure, vch previously
> allocated must be free.
> 

Isn't this already handled through the virtio_rpmsg_release_device()
callback as part of the put_device() in rpmsg_register_device() failure.

regards
Suman

> fixes: 6eed598a0491 ("rpmsg: Split off generic tail of create_channel()")
> 
> Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
> ---
>  drivers/rpmsg/virtio_rpmsg_bus.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> index 664f957..10f927e 100644
> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> @@ -431,8 +431,10 @@ static struct rpmsg_device *rpmsg_create_channel(struct virtproc_info *vrp,
>  	rpdev->dev.parent = &vrp->vdev->dev;
>  	rpdev->dev.release = virtio_rpmsg_release_device;
>  	ret = rpmsg_register_device(rpdev);
> -	if (ret)
> +	if (ret) {
> +		kfree(vch);
>  		return NULL;
> +	}
>  
>  	return rpdev;
>  }
> 
