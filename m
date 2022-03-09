Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F221C433F5
	for <linux-remoteproc@archiver.kernel.org>; Wed,  9 Mar 2022 09:29:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232087AbiCIJap (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 9 Mar 2022 04:30:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232103AbiCIJak (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 9 Mar 2022 04:30:40 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id BB1BF16EA8E
        for <linux-remoteproc@vger.kernel.org>; Wed,  9 Mar 2022 01:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1646818181;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=W9ocX7htY9ba2tFChckZrvAN3geRIS+/uGpDxNIPVbs=;
        b=ajS20yniFZTHJKnEU1MpIx1UmHmw2GlEn9Se+44YNoCUPOm1EOjcv2TGszJ1BoTEOQlOJc
        2eh7WNrqKqouTZmAJiiThUIuXL9pDwCOdypBuDBY+hKs/w7c6GI3XPJRpJdUpfMtjlg7BU
        BKtgWaAUOXXtU7pBAGRG8tZGZyw1gSk=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-460-SjFqrLIDOUy_RrQti1R1kg-1; Wed, 09 Mar 2022 04:29:41 -0500
X-MC-Unique: SjFqrLIDOUy_RrQti1R1kg-1
Received: by mail-pj1-f71.google.com with SMTP id p5-20020a17090a748500b001bee6752974so1229966pjk.8
        for <linux-remoteproc@vger.kernel.org>; Wed, 09 Mar 2022 01:29:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=W9ocX7htY9ba2tFChckZrvAN3geRIS+/uGpDxNIPVbs=;
        b=ycy3k6mqiWeBkM5scOIhoGx6XguXyI6LUcnsd2pEV66UhmDG/xybJdPn3u0njnhjmn
         oWbuaqZfRJRCtyNN2Aan/Add6I3Nye+MvUahdQKM4sjzVjzNjlSGfo9I4zOlS9mWcfZ8
         DSDXCDlWTdFPrcgcegkIZmoUbBeKpwKwBfwTqcbQshNGPG5KHqSgToiOb7BXKFCsMkul
         brsVSOg1Hn88ct+zltzVoYg56HWzmmgaKeI7ZrIIupYOXwtvBsJ56lOaB9YC9FGiYIwF
         vDteYVZ7iW9jTnrmYXvFZjY0fBrh0zQGk5us4Ook5IQ/dKXvgMR4xYl1xeQTHjRao6SW
         EZog==
X-Gm-Message-State: AOAM533J6ayxXaWsQw0730eygtQ6LGuIz2qDzcap60yvevOvAmtIMi+P
        Q2ujUWOSYtS6jguhuv9BJez0fZ7GaH45qvxW5loO/SsfSUuatrqVthJQBPDFI5E11RfbEAFSpR0
        Sl35sEHUQ3QXf3v1ClJCcHsowNMzIgQ==
X-Received: by 2002:a05:6a00:3011:b0:4f6:dca6:ece1 with SMTP id ay17-20020a056a00301100b004f6dca6ece1mr20189430pfb.75.1646818179711;
        Wed, 09 Mar 2022 01:29:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxL+3sp7OJuCEahtHTbhOxVlCpFQIqW2Pb0J6gPCFuY6dSoVpGjvXAebQz9lHsTjjuvBf4aOg==
X-Received: by 2002:a05:6a00:3011:b0:4f6:dca6:ece1 with SMTP id ay17-20020a056a00301100b004f6dca6ece1mr20189408pfb.75.1646818179436;
        Wed, 09 Mar 2022 01:29:39 -0800 (PST)
Received: from [10.72.12.183] ([209.132.188.80])
        by smtp.gmail.com with ESMTPSA id j13-20020a056a00130d00b004f1025a4361sm2297184pfu.202.2022.03.09.01.29.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Mar 2022 01:29:38 -0800 (PST)
Message-ID: <bd27898f-59bc-215b-bb84-14582b12cb16@redhat.com>
Date:   Wed, 9 Mar 2022 17:29:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v7 26/26] virtio_net: support set_ringparam
Content-Language: en-US
To:     Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        virtualization@lists.linux-foundation.org, netdev@vger.kernel.org
Cc:     Jeff Dike <jdike@addtoit.com>, Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Cornelia Huck <cohuck@redhat.com>,
        Halil Pasic <pasic@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        John Fastabend <john.fastabend@gmail.com>,
        Johannes Berg <johannes.berg@intel.com>,
        Vincent Whitchurch <vincent.whitchurch@axis.com>,
        linux-um@lists.infradead.org, platform-driver-x86@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org,
        kvm@vger.kernel.org, bpf@vger.kernel.org
References: <20220308123518.33800-1-xuanzhuo@linux.alibaba.com>
 <20220308123518.33800-27-xuanzhuo@linux.alibaba.com>
From:   Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220308123518.33800-27-xuanzhuo@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org


在 2022/3/8 下午8:35, Xuan Zhuo 写道:
> Support set_ringparam based on virtio queue reset.
>
> The rx,tx_pending required to be passed must be power of 2.
>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> ---
>   drivers/net/virtio_net.c | 47 ++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 47 insertions(+)
>
> diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
> index f1bdc6ce21c3..1fa2d632a994 100644
> --- a/drivers/net/virtio_net.c
> +++ b/drivers/net/virtio_net.c
> @@ -2290,6 +2290,52 @@ static void virtnet_get_ringparam(struct net_device *dev,
>   	ring->tx_pending = virtqueue_get_vring_size(vi->sq[0].vq);
>   }
>   
> +static int virtnet_set_ringparam(struct net_device *dev,
> +				 struct ethtool_ringparam *ring,
> +				 struct kernel_ethtool_ringparam *kernel_ring,
> +				 struct netlink_ext_ack *extack)
> +{
> +	struct virtnet_info *vi = netdev_priv(dev);
> +	u32 rx_pending, tx_pending;
> +	struct receive_queue *rq;
> +	struct send_queue *sq;
> +	int i, err;
> +
> +	if (ring->rx_mini_pending || ring->rx_jumbo_pending)
> +		return -EINVAL;


Any chance that we may hit this EINVAL?

Thanks


> +
> +	rx_pending = virtqueue_get_vring_size(vi->rq[0].vq);
> +	tx_pending = virtqueue_get_vring_size(vi->sq[0].vq);
> +
> +	if (ring->rx_pending == rx_pending &&
> +	    ring->tx_pending == tx_pending)
> +		return 0;
> +
> +	if (ring->rx_pending > virtqueue_get_vring_max_size(vi->rq[0].vq))
> +		return -EINVAL;
> +
> +	if (ring->tx_pending > virtqueue_get_vring_max_size(vi->sq[0].vq))
> +		return -EINVAL;
> +
> +	for (i = 0; i < vi->max_queue_pairs; i++) {
> +		rq = vi->rq + i;
> +		sq = vi->sq + i;
> +
> +		if (ring->tx_pending != tx_pending) {
> +			err = virtnet_tx_vq_reset(vi, sq, ring->tx_pending);
> +			if (err)
> +				return err;
> +		}
> +
> +		if (ring->rx_pending != rx_pending) {
> +			err = virtnet_rx_vq_reset(vi, rq, ring->rx_pending);
> +			if (err)
> +				return err;
> +		}
> +	}
> +
> +	return 0;
> +}
>   
>   static void virtnet_get_drvinfo(struct net_device *dev,
>   				struct ethtool_drvinfo *info)
> @@ -2523,6 +2569,7 @@ static const struct ethtool_ops virtnet_ethtool_ops = {
>   	.get_drvinfo = virtnet_get_drvinfo,
>   	.get_link = ethtool_op_get_link,
>   	.get_ringparam = virtnet_get_ringparam,
> +	.set_ringparam = virtnet_set_ringparam,
>   	.get_strings = virtnet_get_strings,
>   	.get_sset_count = virtnet_get_sset_count,
>   	.get_ethtool_stats = virtnet_get_ethtool_stats,

