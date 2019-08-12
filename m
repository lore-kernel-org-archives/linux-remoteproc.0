Return-Path: <afd@ti.com>
Subject: Re: [PATCH] rpmsg: virtio_rpmsg_bus: replace "%p" with "%pK"
References: <20181024011909.21674-1-s-anna@ti.com>
From: "Andrew F. Davis" <afd@ti.com>
Message-ID: <1cc3d697-6fde-901b-2e35-2e2b53b44425@ti.com>
Date: Mon, 12 Aug 2019 11:47:58 -0400
MIME-Version: 1.0
In-Reply-To: <20181024011909.21674-1-s-anna@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Suman Anna <s-anna@ti.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, Loic Pallardy <loic.pallardy@st.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-ID: <linux-remoteproc@vger.kernel.org>

On 10/23/18 9:19 PM, Suman Anna wrote:
> The virtio_rpmsg_bus driver uses the "%p" format-specifier for
> printing the vring buffer address. This prints only a hashed
> pointer even for previliged users. Use "%pK" instead so that
> the address can be printed during debug using kptr_restrict
> sysctl.
> 


s/previliged/privileged

You describe what the code does, but not why you need this. %pK is used
for only about 1% of pointer printing, why do you want to leak this
address to userspace at all?

Andrew


> Signed-off-by: Suman Anna <s-anna@ti.com>
> ---
>  drivers/rpmsg/virtio_rpmsg_bus.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> index f29dee731026..1345f373a1a0 100644
> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> @@ -950,7 +950,7 @@ static int rpmsg_probe(struct virtio_device *vdev)
>  		goto vqs_del;
>  	}
>  
> -	dev_dbg(&vdev->dev, "buffers: va %p, dma %pad\n",
> +	dev_dbg(&vdev->dev, "buffers: va %pK, dma %pad\n",
>  		bufs_va, &vrp->bufs_dma);
>  
>  	/* half of the buffers is dedicated for RX */
> 
