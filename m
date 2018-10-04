Date: Wed, 3 Oct 2018 17:46:55 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 1/5] rpmsg: glink: Add GLINK signal support for RPMSG
Message-ID: <20181004004655.GW2523@minitux>
References: <1538566463-24627-1-git-send-email-aneela@codeaurora.org>
 <1538566463-24627-2-git-send-email-aneela@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1538566463-24627-2-git-send-email-aneela@codeaurora.org>
To: Arun Kumar Neelakantam <aneela@codeaurora.org>
Cc: ohad@wizery.com, clew@codeaurora.org, sricharan@codeaurora.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed 03 Oct 04:34 PDT 2018, Arun Kumar Neelakantam wrote:

> Add support to handle SMD signals to RPMSG over GLINK. SMD signals
> mimic serial protocol signals to notify of ports opening and closing.
> This change affects the rpmsg core, rpmsg char and glink drivers.
> 
> Signed-off-by: Chris Lew <clew@codeaurora.org>
> Signed-off-by: Arun Kumar Neelakantam <aneela@codeaurora.org>
> ---
>  drivers/rpmsg/qcom_glink_native.c | 80 +++++++++++++++++++++++++++++++++++++++
>  drivers/rpmsg/rpmsg_core.c        | 41 ++++++++++++++++++++
>  drivers/rpmsg/rpmsg_internal.h    |  5 +++
>  include/linux/rpmsg.h             | 25 ++++++++++++

Please split this patch in one for rpmsg and one for GLINK, and
incorporate the translation from patch 5 in the latter.

>  4 files changed, 151 insertions(+)
> 
> diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
[..]
> @@ -954,6 +961,52 @@ static int qcom_glink_rx_open_ack(struct qcom_glink *glink, unsigned int lcid)
>  	return 0;
>  }
>  
> +/**
> + * qcom_glink_send_signals() - convert a signal  cmd to wire format and transmit
> + * @glink:	The transport to transmit on.
> + * @channel:	The glink channel
> + * @sigs:	The signals to encode.
> + *
> + * Return: 0 on success or standard Linux error code.
> + */
> +static int qcom_glink_send_signals(struct qcom_glink *glink,
> +				   struct glink_channel *channel,
> +				   u32 sigs)
> +{

As this deals with TIOCM_* flags the individual bits are defined as
having "local" or "remote" status. So I believe you should be able to
just pass around one set of bits and extract the ones that makes sense
to send here.


> +	struct glink_msg msg;
> +
> +	msg.cmd = cpu_to_le16(RPM_CMD_SIGNALS);
> +	msg.param1 = cpu_to_le16(channel->lcid);
> +	msg.param2 = cpu_to_le32(sigs);
> +
> +	return qcom_glink_tx(glink, &msg, sizeof(msg), NULL, 0, true);
> +}
> +
> +static int qcom_glink_handle_signals(struct qcom_glink *glink,
> +				     unsigned int rcid, unsigned int signals)
> +{
> +	struct glink_channel *channel;
> +	unsigned long flags;
> +	u32 old;

As with send above you should be able to parse out the bits that makes
sense for the remote to set and update the one set of status bits for
the channel here.

> +
> +	spin_lock_irqsave(&glink->idr_lock, flags);
> +	channel = idr_find(&glink->rcids, rcid);
> +	spin_unlock_irqrestore(&glink->idr_lock, flags);
> +	if (!channel) {
> +		dev_err(glink->dev, "signal for non-existing channel\n");
> +		return -EINVAL;
> +	}
> +
> +	old = channel->rsigs;
> +	channel->rsigs = signals;
> +
> +	if (channel->ept.sig_cb)
> +		channel->ept.sig_cb(channel->ept.rpdev, channel->ept.priv,
> +				    old, channel->rsigs);

Add {} when block is multiline.

> +
> +	return 0;
> +}
[..]
> diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
[..]
> +/**
> + * rpmsg_get_sigs() - get the signals for this endpoint
> + * @ept: the rpmsg endpoint
> + * @sigs: serial signals bitmask
> + *
> + * Returns 0 on success and an appropriate error value on failure.
> + */
> +int rpmsg_get_sigs(struct rpmsg_endpoint *ept, u32 *lsigs, u32 *rsigs)

> +{
> +	if (WARN_ON(!ept))
> +		return -EINVAL;
> +	if (!ept->ops->get_sigs)
> +		return -ENXIO;

I think EOPNOTSUPP would be better here.

> +
> +	return ept->ops->get_sigs(ept, lsigs, rsigs);
> +}
> +EXPORT_SYMBOL(rpmsg_get_sigs);
> +
> +/**
> + * rpmsg_set_sigs() - set the remote signals for this endpoint
> + * @ept: the rpmsg endpoint
> + * @sigs: serial signals bitmask
> + *
> + * Returns 0 on success and an appropriate error value on failure.
> + */
> +int rpmsg_set_sigs(struct rpmsg_endpoint *ept, u32 sigs)
> +{
> +	if (WARN_ON(!ept))
> +		return -EINVAL;
> +	if (!ept->ops->set_sigs)
> +		return -ENXIO;

Ditto

> +
> +	return ept->ops->set_sigs(ept, sigs);
> +}
> +EXPORT_SYMBOL(rpmsg_set_sigs);
> +

Regards,
Bjorn
