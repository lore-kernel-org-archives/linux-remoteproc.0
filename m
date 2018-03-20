Return-Path: <srinivas.kandagatla@linaro.org>
Return-Path: <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH] rpmsg: glink: Use spinlock in tx path
References: <20180213190404.25026-1-bjorn.andersson@linaro.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <572c1691-cb6d-773b-a9e9-19ad1da079a5@linaro.org>
Date: Tue, 20 Mar 2018 10:14:36 +0800
MIME-Version: 1.0
In-Reply-To: <20180213190404.25026-1-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Chris Lew <clew@codeaurora.org>, Arun Kumar Neelakantam <aneela@codeaurora.org>
Cc: linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>



On 14/02/18 03:04, Bjorn Andersson wrote:
> Switch the tx_lock to a spinlock we allow clients to use rpmsg_trysend()
> from atomic context.
> 
> In order to allow clients to sleep while waiting for space in the FIFO
> we release the lock temporarily around the delay; which should be
> replaced by sending a READ_NOTIF and waiting for the remote to signal
> us that space has been made available.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

with ret set to 0 in qcom_glink_tx()

Tested-by: Srinivas kandagatla <srinivas.kandagatla@linaro.org>

>   drivers/rpmsg/qcom_glink_native.c | 16 ++++++++++------
>   1 file changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
> index e0f31ed096a5..6e950e9afa82 100644
> --- a/drivers/rpmsg/qcom_glink_native.c
> +++ b/drivers/rpmsg/qcom_glink_native.c
> @@ -113,7 +113,7 @@ struct qcom_glink {
>   	spinlock_t rx_lock;
>   	struct list_head rx_queue;
>   
> -	struct mutex tx_lock;
> +	spinlock_t tx_lock;
>   
>   	spinlock_t idr_lock;
>   	struct idr lcids;
> @@ -288,15 +288,14 @@ static int qcom_glink_tx(struct qcom_glink *glink,
>   			 const void *data, size_t dlen, bool wait)
>   {
>   	unsigned int tlen = hlen + dlen;
> +	unsigned long flags;
>   	int ret;
>   
>   	/* Reject packets that are too big */
>   	if (tlen >= glink->tx_pipe->length)
>   		return -EINVAL;
>   
> -	ret = mutex_lock_interruptible(&glink->tx_lock);
> -	if (ret)
> -		return ret;
> +	spin_lock_irqsave(&glink->tx_lock, flags);
>   
>   	while (qcom_glink_tx_avail(glink) < tlen) {
>   		if (!wait) {
> @@ -304,7 +303,12 @@ static int qcom_glink_tx(struct qcom_glink *glink,
>   			goto out;
>   		}
>   
> +		/* Wait without holding the tx_lock */
> +		spin_unlock_irqrestore(&glink->tx_lock, flags);
> +
>   		usleep_range(10000, 15000);
> +
> +		spin_lock_irqsave(&glink->tx_lock, flags);
>   	}
>   
>   	qcom_glink_tx_write(glink, hdr, hlen, data, dlen);
> @@ -313,7 +317,7 @@ static int qcom_glink_tx(struct qcom_glink *glink,
>   	mbox_client_txdone(glink->mbox_chan, 0);
>   
>   out:
> -	mutex_unlock(&glink->tx_lock);
> +	spin_unlock_irqrestore(&glink->tx_lock, flags);
>   
>   	return ret;
>   }
> @@ -1567,7 +1571,7 @@ struct qcom_glink *qcom_glink_native_probe(struct device *dev,
>   	glink->features = features;
>   	glink->intentless = intentless;
>   
> -	mutex_init(&glink->tx_lock);
> +	spin_lock_init(&glink->tx_lock);
>   	spin_lock_init(&glink->rx_lock);
>   	INIT_LIST_HEAD(&glink->rx_queue);
>   	INIT_WORK(&glink->rx_work, qcom_glink_work);
> 
