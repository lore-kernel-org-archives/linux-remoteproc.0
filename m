Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F0BDC04A68
	for <linux-remoteproc@archiver.kernel.org>; Wed, 27 Jul 2022 18:22:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238678AbiG0SWm (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 27 Jul 2022 14:22:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241026AbiG0SWU (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 27 Jul 2022 14:22:20 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 680CCF2854
        for <linux-remoteproc@vger.kernel.org>; Wed, 27 Jul 2022 10:21:35 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id q16so16449367pgq.6
        for <linux-remoteproc@vger.kernel.org>; Wed, 27 Jul 2022 10:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=gLqFxsF2/j9UhzKinC6sGKUkXzM7b+wYfN/HlusP9rw=;
        b=k8mfwrQ7X3wtEb6WrBgiu95MAf6GLUmK3Vxcxmwfo1s3BPKofGkKNP1MtGCuyBWbwf
         kMObd7CcTIo6+TAzed0LWbGPP1zwHrUM7hP6pCIDN7ZpHhFK6eby2ld7b3NVoZulQ9km
         eGv5H9R5j8AzTguVzRt96brX8/mdECNRzXYPeneySXeolFxkE/Gl5bCBw097Ky43di7U
         NpO5MnGfDYmyYGrZ52jOLcnYhBU04LbG9/lcveuAlPUpKegKGF8l6NWj6mp2GWi05IAD
         sVVJp/GWHwIEwuQxVewSaFFvoS9+AH8uvLwA3oxDpS3+noz7GyBzCT9L15T2Fd1yTzAB
         Lmfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gLqFxsF2/j9UhzKinC6sGKUkXzM7b+wYfN/HlusP9rw=;
        b=GxdL6uruRs4n+2HWK9I1Gf32Wtw+XQs+IQU+si/PdwgVysTEXqvd2IaksFbuXqW6ri
         qYh3awXCwEysSnEvYfaLwhK/p2T8gC+m/+60ojGRNpdkMsJVDpFqETE0XrXCCq/zFtsr
         hMqWGkn2KKZcjDg1HV0WspjKY/xIb4vPqLs4z6AF7jM0XysbzSLT+bt23IsZt73rousL
         tRwgmoBlS778zhPZtlzLN2qug+jaWpcv304NiLEcCq8P9md07ulFXeW/Bg2YMPersgCA
         EJFw47pcP7UTpJ+sjwne7YvcXhqL9V7SxxEBJHf1TAYYbYVLWLr0r2pnK0JXoYDZSyTU
         PwWg==
X-Gm-Message-State: AJIora+ZNn+rZtlY5XdlynK6P8J/fjtRADtldYzCcJU6ywviSI/ISzPA
        ZH2+hx12CHyam78kcbhMcwDKZ0ziG5rKkQ==
X-Google-Smtp-Source: AGRyM1u0RiWcWQBpsfCyjeGvV/kUtmFcrrM2vJqoT0INYQm9iIDjACXiFNrxAz4irgXoFCLtdoXj3A==
X-Received: by 2002:a63:e109:0:b0:419:c3bc:b89 with SMTP id z9-20020a63e109000000b00419c3bc0b89mr19789462pgh.176.1658942494480;
        Wed, 27 Jul 2022 10:21:34 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id o1-20020a17090a678100b001efa35356besm2043368pjj.28.2022.07.27.10.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jul 2022 10:21:33 -0700 (PDT)
Date:   Wed, 27 Jul 2022 11:21:31 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Chris Lew <quic_clew@quicinc.com>
Cc:     bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] rpmsg: glink: Add support for rpmsg_rx_done
Message-ID: <20220727172131.GC199805@p14s>
References: <1654651005-15475-1-git-send-email-quic_clew@quicinc.com>
 <1654651005-15475-5-git-send-email-quic_clew@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1654651005-15475-5-git-send-email-quic_clew@quicinc.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Jun 07, 2022 at 06:16:45PM -0700, Chris Lew wrote:
> Add the implementation for the hooks of rpmsg_rx_done. If a client
> signals they want to hold onto a buffer with RPMSG_DEFER in the rx_cb,
> glink will move that intent to a deferred cleanup list. On the new
> rpmsg rx_done call, the glink transport will search this deferred
> cleanup list for the matching buffer and release the intent.
> 
> Signed-off-by: Chris Lew <quic_clew@quicinc.com>
> ---
>  drivers/rpmsg/qcom_glink_native.c | 54 ++++++++++++++++++++++++++++++++++++---
>  1 file changed, 51 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
> index 799e602113a1..db0dcc04f393 100644
> --- a/drivers/rpmsg/qcom_glink_native.c
> +++ b/drivers/rpmsg/qcom_glink_native.c
> @@ -146,6 +146,7 @@ enum {
>   * @riids:	idr of all remote intents
>   * @intent_work: worker responsible for transmitting rx_done packets
>   * @done_intents: list of intents that needs to be announced rx_done
> + * @defer_intents: list of intents held by the client released by rpmsg_rx_done
>   * @buf:	receive buffer, for gathering fragments
>   * @buf_offset:	write offset in @buf
>   * @buf_size:	size of current @buf
> @@ -174,6 +175,7 @@ struct glink_channel {
>  	struct idr riids;
>  	struct work_struct intent_work;
>  	struct list_head done_intents;
> +	struct list_head defer_intents;
>  
>  	struct glink_core_rx_intent *buf;
>  	int buf_offset;
> @@ -232,6 +234,7 @@ static struct glink_channel *qcom_glink_alloc_channel(struct qcom_glink *glink,
>  	init_completion(&channel->intent_req_comp);
>  
>  	INIT_LIST_HEAD(&channel->done_intents);
> +	INIT_LIST_HEAD(&channel->defer_intents);
>  	INIT_WORK(&channel->intent_work, qcom_glink_rx_done_work);
>  
>  	idr_init(&channel->liids);
> @@ -261,6 +264,12 @@ static void qcom_glink_channel_release(struct kref *ref)
>  			kfree(intent);
>  		}
>  	}
> +	list_for_each_entry_safe(intent, tmp, &channel->defer_intents, node) {
> +		if (!intent->reuse) {
> +			kfree(intent->data);
> +			kfree(intent);
> +		}
> +	}
>  
>  	idr_for_each_entry(&channel->liids, tmp, iid) {
>  		kfree(tmp->data);
> @@ -549,9 +558,10 @@ static void qcom_glink_rx_done_work(struct work_struct *work)
>  	spin_unlock_irqrestore(&channel->intent_lock, flags);
>  }
>  
> -static void qcom_glink_rx_done(struct qcom_glink *glink,
> +static void __qcom_glink_rx_done(struct qcom_glink *glink,
>  			       struct glink_channel *channel,
> -			       struct glink_core_rx_intent *intent)
> +			       struct glink_core_rx_intent *intent,
> +			       bool defer)
>  {
>  	int ret = -EAGAIN;
>  
> @@ -569,6 +579,14 @@ static void qcom_glink_rx_done(struct qcom_glink *glink,
>  		spin_unlock(&channel->intent_lock);
>  	}
>  
> +	/* Move intent to defer list until client calls rpmsg_rx_done */
> +	if (defer) {
> +		spin_lock(&channel->intent_lock);
> +		list_add_tail(&intent->node, &channel->defer_intents);
> +		spin_unlock(&channel->intent_lock);
> +		return;
> +	}
> +
>  	/* Schedule the sending of a rx_done indication */
>  	spin_lock(&channel->intent_lock);
>  	if (list_empty(&channel->done_intents))
> @@ -581,6 +599,28 @@ static void qcom_glink_rx_done(struct qcom_glink *glink,
>  	spin_unlock(&channel->intent_lock);
>  }
>  
> +static int qcom_glink_rx_done(struct rpmsg_endpoint *ept, void *data)
> +{
> +	struct glink_channel *channel = to_glink_channel(ept);
> +	struct qcom_glink *glink = channel->glink;
> +	struct glink_core_rx_intent *intent, *tmp;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&channel->intent_lock, flags);
> +	list_for_each_entry_safe(intent, tmp, &channel->defer_intents, node) {
> +		if (intent->data == data) {
> +			list_del(&intent->node);
> +			spin_unlock_irqrestore(&channel->intent_lock, flags);
> +
> +			qcom_glink_send_rx_done(glink, channel, intent, true);
> +			return 0;
> +		}
> +	}
> +	spin_unlock_irqrestore(&channel->intent_lock, flags);
> +
> +	return -EINVAL;
> +}
> +
>  /**
>   * qcom_glink_receive_version() - receive version/features from remote system
>   *
> @@ -841,6 +881,7 @@ static int qcom_glink_rx_data(struct qcom_glink *glink, size_t avail)
>  	} __packed hdr;
>  	unsigned int chunk_size;
>  	unsigned int left_size;
> +	bool rx_done_defer;
>  	unsigned int rcid;
>  	unsigned int liid;
>  	int ret = 0;
> @@ -935,7 +976,12 @@ static int qcom_glink_rx_data(struct qcom_glink *glink, size_t avail)
>  		intent->offset = 0;
>  		channel->buf = NULL;
>  
> -		qcom_glink_rx_done(glink, channel, intent);
> +		if (channel->ept.rx_done && ret == RPMSG_DEFER)

I don't see where @ret could be set to RPMSG_DEFER in this function...

Thanks,
Mathieu


> +			rx_done_defer = true;
> +		else
> +			rx_done_defer = false;
> +
> +		__qcom_glink_rx_done(glink, channel, intent, rx_done_defer);
>  	}
>  
>  advance_rx:
> @@ -1212,6 +1258,7 @@ static struct rpmsg_endpoint *qcom_glink_create_ept(struct rpmsg_device *rpdev,
>  	ept->cb = cb;
>  	ept->priv = priv;
>  	ept->ops = &glink_endpoint_ops;
> +	ept->rx_done = true;
>  
>  	return ept;
>  }
> @@ -1462,6 +1509,7 @@ static const struct rpmsg_endpoint_ops glink_endpoint_ops = {
>  	.sendto = qcom_glink_sendto,
>  	.trysend = qcom_glink_trysend,
>  	.trysendto = qcom_glink_trysendto,
> +	.rx_done = qcom_glink_rx_done,
>  };
>  
>  static void qcom_glink_rpdev_release(struct device *dev)
> -- 
> 2.7.4
> 
