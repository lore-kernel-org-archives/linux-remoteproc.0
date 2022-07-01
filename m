Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D70A6C43334
	for <linux-remoteproc@archiver.kernel.org>; Fri,  1 Jul 2022 06:29:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235227AbiGAG3k (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 1 Jul 2022 02:29:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235076AbiGAG3Z (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 1 Jul 2022 02:29:25 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8F38160539
        for <linux-remoteproc@vger.kernel.org>; Thu, 30 Jun 2022 23:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1656656943;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Ep21GC3WWMrq7ZTqF7foficvymTnhxBLuGKtrZfIeyk=;
        b=RQEw8Es/jMdKZ4McFlTmGmlf3pvkiRHc2v31GH0uUjvB4WcF7xhn9AWDiCBsgymv78gVs+
        M14TLFFRR/ow6uGT2UI9Ys8UdDa/Xmcwe89xXnM3gr83JQjPGnH+S0vB53Qv+2z+I6JDpz
        gTaKxrwaZsJC0S6EAocHHoeGJeTSJq4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-495-BxD0sx7_OEy-du5x5ofcTw-1; Fri, 01 Jul 2022 02:28:55 -0400
X-MC-Unique: BxD0sx7_OEy-du5x5ofcTw-1
Received: by mail-ed1-f70.google.com with SMTP id z19-20020a05640240d300b00437633081abso1124132edb.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 30 Jun 2022 23:28:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Ep21GC3WWMrq7ZTqF7foficvymTnhxBLuGKtrZfIeyk=;
        b=aHsFOqCVc8f3kh0A3zEuyJDYSW79jam8D+Yho+cEFJP0Ccd4wDSLY+EowOtRCxBm1R
         n/dkulLVMOZSwy7LAgOB+QvqSqefk3GneIIjQx+5/MXAKTwhLF6dsR+vodhJ/uTjOBIP
         sjzPGVOGj/Tfpnwy+ywybJTYIPpJ4qrJy0Sh3CzKplKPTSQM4a5Dd0LT+oNEAU/M6cLG
         pDERG+tvNwLLEYcDsGFwSu172kT42tDMMF68UfLzqxKtkEejWvEAFNDxTZ6Tw2jF94dk
         abv+V4Xje9FqtxzlgbkgU2YMYmiTtU1Ontu9IimoxebaBiMMRbvtFcLsWMuvVLs8C+UE
         wExQ==
X-Gm-Message-State: AJIora9+cei3tyDxiQj23OJOW3LvKLWRhwHoi83SHsagWDfLDLPAKwSc
        ATW2fvG3NrnlN2JMmPWZt3BkzSMPuyEz0o00ffXKllqjDnB1JaBqfY6IPyYqaXCY7YfWsJvXmen
        96R1jxyX716kPAd2+L8+X4HZCwNMtqg==
X-Received: by 2002:a17:907:a428:b0:726:c9f6:cb72 with SMTP id sg40-20020a170907a42800b00726c9f6cb72mr12254040ejc.663.1656656933860;
        Thu, 30 Jun 2022 23:28:53 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1slJK/GfjvEb+V/KlSodwyGrJY9IlEvcE76Gj4Vrg2HN6t0BznA8dFZxHAHBftC/lU4lpUOHg==
X-Received: by 2002:a17:907:a428:b0:726:c9f6:cb72 with SMTP id sg40-20020a170907a42800b00726c9f6cb72mr12254030ejc.663.1656656933627;
        Thu, 30 Jun 2022 23:28:53 -0700 (PDT)
Received: from redhat.com ([2.55.3.188])
        by smtp.gmail.com with ESMTPSA id a23-20020aa7d757000000b00437df2444f5sm3589564eds.11.2022.06.30.23.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 23:28:53 -0700 (PDT)
Date:   Fri, 1 Jul 2022 02:28:46 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc:     virtualization@lists.linux-foundation.org,
        Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jason Wang <jasowang@redhat.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Cornelia Huck <cohuck@redhat.com>,
        Halil Pasic <pasic@linux.ibm.com>,
        Eric Farman <farman@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        John Fastabend <john.fastabend@gmail.com>,
        Vincent Whitchurch <vincent.whitchurch@axis.com>,
        linux-um@lists.infradead.org, netdev@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org,
        kvm@vger.kernel.org, bpf@vger.kernel.org,
        kangjie.xu@linux.alibaba.com
Subject: Re: [PATCH v11 02/40] virtio: struct virtio_config_ops add callbacks
 for queue_reset
Message-ID: <20220701022728-mutt-send-email-mst@kernel.org>
References: <20220629065656.54420-1-xuanzhuo@linux.alibaba.com>
 <20220629065656.54420-3-xuanzhuo@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220629065656.54420-3-xuanzhuo@linux.alibaba.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Jun 29, 2022 at 02:56:18PM +0800, Xuan Zhuo wrote:
> reset can be divided into the following four steps (example):
>  1. transport: notify the device to reset the queue
>  2. vring:     recycle the buffer submitted
>  3. vring:     reset/resize the vring (may re-alloc)
>  4. transport: mmap vring to device, and enable the queue
> 
> In order to support queue reset, add two callbacks(reset_vq,
> enable_reset_vq) in struct virtio_config_ops to implement steps 1 and 4.
> 
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> ---
>  include/linux/virtio_config.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/include/linux/virtio_config.h b/include/linux/virtio_config.h
> index b47c2e7ed0ee..ded51b0d4823 100644
> --- a/include/linux/virtio_config.h
> +++ b/include/linux/virtio_config.h
> @@ -78,6 +78,16 @@ struct virtio_shm_region {
>   * @set_vq_affinity: set the affinity for a virtqueue (optional).
>   * @get_vq_affinity: get the affinity for a virtqueue (optional).
>   * @get_shm_region: get a shared memory region based on the index.
> + * @reset_vq: reset a queue individually (optional).
> + *	vq: the virtqueue
> + *	Returns 0 on success or error status
> + *	reset_vq will guarantee that the callbacks are disabled and synchronized.
> + *	Except for the callback, the caller should guarantee that the vring is
> + *	not accessed by any functions of virtqueue.
> + * @enable_reset_vq: enable a reset queue
> + *	vq: the virtqueue
> + *	Returns 0 on success or error status
> + *	If reset_vq is set, then enable_reset_vq must also be set.
>   */
>  typedef void vq_callback_t(struct virtqueue *);
>  struct virtio_config_ops {
> @@ -104,6 +114,8 @@ struct virtio_config_ops {
>  			int index);
>  	bool (*get_shm_region)(struct virtio_device *vdev,
>  			       struct virtio_shm_region *region, u8 id);
> +	int (*reset_vq)(struct virtqueue *vq);
> +	int (*enable_reset_vq)(struct virtqueue *vq);
>  };

The names need some tweaking.
I came up with
 	int (*disable_vq_and_reset)(struct virtqueue *vq);
 	int (*enable_vq_after_reset)(struct virtqueue *vq);


>  /* If driver didn't advertise the feature, it will never appear. */
> -- 
> 2.31.0

