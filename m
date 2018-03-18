Return-Path: <bjorn.andersson@linaro.org>
Date: Sun, 18 Mar 2018 15:47:44 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH RESEND] rpmsg: virtio_rpmsg_bus: fix rpmsg_probe() for
 virtio-mmio transport
Message-ID: <20180318224744.GL5626@tuxbook-pro>
References: <1515590217-24256-1-git-send-email-anup@brainfault.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1515590217-24256-1-git-send-email-anup@brainfault.org>
To: Anup Patel <anup@brainfault.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed 10 Jan 05:16 PST 2018, Anup Patel wrote:
> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
[..]
> @@ -924,9 +925,16 @@ static int rpmsg_probe(struct virtio_device *vdev)
>  				     total_buf_space, &vrp->bufs_dma,
>  				     GFP_KERNEL);
>  	if (!bufs_va) {
> -		err = -ENOMEM;
> -		goto vqs_del;
> -	}
> +		bufs_va = dma_alloc_coherent(vdev->dev.parent,
> +					     total_buf_space, &vrp->bufs_dma,
> +					     GFP_KERNEL);
> +		if (!bufs_va) {
> +			err = -ENOMEM;
> +			goto vqs_del;
> +		} else
> +			vrp->bufs_dev = vdev->dev.parent;
> +	} else
> +		vrp->bufs_dev = vdev->dev.parent->parent;

I really don't fancy the idea of us allocating on behalf of our
grandparent here, as you show it's not certain that our grandparent is
what someone originally expected it to be.

With the purpose of being able to control these allocations there is an
ongoing discussion related to this, which I believe will result in this
being changed to at least vdev->dev.parent..


I do expect that this discussion will be brought up during Linaro
Connect the coming week.

Regards,
Bjorn
