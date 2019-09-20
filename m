Date: Thu, 19 Sep 2019 21:18:41 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] rpmsg: glink: Fix channel memory leak
Message-ID: <20190920041838.GE1746@tuxbook-pro>
References: <20190919100540.28159-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190919100540.28159-1-srinivas.kandagatla@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: ohad@wizery.com, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu 19 Sep 03:05 PDT 2019, Srinivas Kandagatla wrote:

> If we stop and start the dsp while channel is open then there is a leak
> in the driver as the refcount is not accounted for the open.
> 
> This patch checks if the channel is open while running cleanup code
> and does an extra kref_put to account for open which would ensure
> that channel does not leak.
> 
> Originally detected by kmemleak:
>   backtrace:
>     [<ffffff80088b74d8>] kmemleak_alloc+0x50/0x84
>     [<ffffff80081ddbc8>] kmem_cache_alloc_trace+0xd4/0x178
>     [<ffffff80086b8bd0>] qcom_glink_alloc_channel+0x34/0x148
>     [<ffffff80086b8038>] qcom_glink_work+0x3b0/0x664
>     [<ffffff80080c3da8>] process_one_work+0x160/0x2f8
>     [<ffffff80080c4198>] worker_thread+0x1e8/0x2d4
>     [<ffffff80080c8b24>] kthread+0x128/0x138
>     [<ffffff80080845b4>] ret_from_fork+0x10/0x18
>     [<ffffffffffffffff>] 0xffffffffffffffff
> unreferenced object 0xffffffc02cf5ed80 (size 128):
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  drivers/rpmsg/qcom_glink_native.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
> index dc7d3d098fd3..38a10dcc2029 100644
> --- a/drivers/rpmsg/qcom_glink_native.c
> +++ b/drivers/rpmsg/qcom_glink_native.c
> @@ -1660,8 +1660,13 @@ void qcom_glink_native_remove(struct qcom_glink *glink)
>  
>  	spin_lock_irqsave(&glink->idr_lock, flags);
>  	/* Release any defunct local channels, waiting for close-ack */
> -	idr_for_each_entry(&glink->lcids, channel, cid)
> +	idr_for_each_entry(&glink->lcids, channel, cid) {
> +		if (channel->rcid)

Thanks for the patch Srinivas! I looked at it in your tree as I was
coming up with the fixes for the problems I hit in my testing the other
day.

But, there is a window between qcom_glink_rx_open() assigning
channel->rcid and where rpmsg_dev_probe() will invoke
qcom_glink_create_remote(), which adds the channel to lcids, i.e. where
we would leak the channel. So I instead picked Chris' patch (3/6 in my
series), which will clean up the channel in this case as well.

Regards,
Bjorn

> +			kref_put(&channel->refcount,
> +				 qcom_glink_channel_release);
> +
>  		kref_put(&channel->refcount, qcom_glink_channel_release);
> +	}
>  
>  	/* Release any defunct local channels, waiting for close-req */
>  	idr_for_each_entry(&glink->rcids, channel, cid)
> -- 
> 2.21.0
> 
