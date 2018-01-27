Return-Path: <jmcnicol@redhat.com>
Date: Fri, 26 Jan 2018 17:32:30 -0800
From: Jeremy McNicoll <jmcnicol@redhat.com>
Subject: Re: [PATCH 1/5] rpmsg: smd: Perform handshake during open
Message-ID: <20180127013230.GB32527@mini-rhel.redhat.com>
References: <20171212235857.10432-1-bjorn.andersson@linaro.org>
 <20171212235857.10432-2-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171212235857.10432-2-bjorn.andersson@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Will Newton <will.newton@gmail.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Chris Lew <clew@quicinc.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On Tue, Dec 12, 2017 at 03:58:53PM -0800, Bjorn Andersson wrote:
> Validate the the remote side is opening the channel that we've found by
> performing a handshake when opening the channel.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/rpmsg/qcom_smd.c | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
> index b01774e9fac0..58dd44493420 100644
> --- a/drivers/rpmsg/qcom_smd.c
> +++ b/drivers/rpmsg/qcom_smd.c
> @@ -200,6 +200,7 @@ struct qcom_smd_channel {
>  	char *name;
>  	enum smd_channel_state state;
>  	enum smd_channel_state remote_state;
> +	wait_queue_head_t state_change_event;
>  
>  	struct smd_channel_info_pair *info;
>  	struct smd_channel_info_word_pair *info_word;
> @@ -570,6 +571,8 @@ static bool qcom_smd_channel_intr(struct qcom_smd_channel *channel)
>  	if (remote_state != channel->remote_state) {
>  		channel->remote_state = remote_state;
>  		need_state_scan = true;
> +
> +		wake_up_interruptible_all(&channel->state_change_event);
>  	}
>  	/* Indicate that we have seen any state change */
>  	SET_RX_CHANNEL_FLAG(channel, fSTATE, 0);
> @@ -786,7 +789,9 @@ static int __qcom_smd_send(struct qcom_smd_channel *channel, const void *data,
>  static int qcom_smd_channel_open(struct qcom_smd_channel *channel,
>  				 rpmsg_rx_cb_t cb)
>  {
> +	struct qcom_smd_edge *edge = channel->edge;
>  	size_t bb_size;
> +	int ret;
>  
>  	/*
>  	 * Packets are maximum 4k, but reduce if the fifo is smaller
> @@ -798,9 +803,33 @@ static int qcom_smd_channel_open(struct qcom_smd_channel *channel,
>  
>  	qcom_smd_channel_set_callback(channel, cb);
>  	qcom_smd_channel_set_state(channel, SMD_CHANNEL_OPENING);
> +
> +	/* Wait for remote to enter opening or opened */
> +	ret = wait_event_interruptible_timeout(channel->state_change_event,
> +			channel->remote_state == SMD_CHANNEL_OPENING ||
> +			channel->remote_state == SMD_CHANNEL_OPENED,
> +			HZ);
> +	if (!ret) {
> +		dev_err(&edge->dev, "remote side did not enter opening state\n");
> +		goto out_close_timeout;
> +	}
> +
>  	qcom_smd_channel_set_state(channel, SMD_CHANNEL_OPENED);
>  
> +	/* Wait for remote to enter opened */
> +	ret = wait_event_interruptible_timeout(channel->state_change_event,
> +			channel->remote_state == SMD_CHANNEL_OPENED,
> +			HZ);
> +	if (!ret) {
> +		dev_err(&edge->dev, "remote side did not enter open state\n");
> +		goto out_close_timeout;
> +	}
> +
>  	return 0;
> +
> +out_close_timeout:
> +	qcom_smd_channel_set_state(channel, SMD_CHANNEL_CLOSED);

Why not do something like this, 

out_close_timeout:
	qcom_smd_channel_set_state(channel, SMD_CHANNEL_CLOSING);
	wait_for_a_little_bit();
	qcom_smd_channel_set_state(channel, SMD_CHANNEL_CLOSED);

Doing something like that may get the remote back into a better
state if say for example it was stuck, rather than jumping directly
to CLOSED.

The reason why I am suggesting this is that whilst investigating
the problem of the SMD channel not getting created correctly, due
to the initial state of the remote being in an unexpected state I did
observe that if the host transistions from CLOSING to CLOSED it
takes far less time for the host and remote to get back into
sync.  It could be that it was a side effect of some of the changes
that I made, although it is worth considering. 

We could run some experiments to see how long it takes for host
and remote to get back into sync when going directly to CLOSED vs.
CLOSING, CLOSED.

-jeremy

> +	return -ETIMEDOUT;
>  }
>  
>  /*
> @@ -1055,6 +1084,7 @@ static struct qcom_smd_channel *qcom_smd_create_channel(struct qcom_smd_edge *ed
>  	mutex_init(&channel->tx_lock);
>  	spin_lock_init(&channel->recv_lock);
>  	init_waitqueue_head(&channel->fblockread_event);
> +	init_waitqueue_head(&channel->state_change_event);
>  
>  	info = qcom_smem_get(edge->remote_pid, smem_info_item, &info_size);
>  	if (IS_ERR(info)) {
> -- 
> 2.15.0
> 
