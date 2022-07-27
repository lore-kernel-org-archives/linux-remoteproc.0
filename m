Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6C45C19F2D
	for <linux-remoteproc@archiver.kernel.org>; Wed, 27 Jul 2022 04:30:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233855AbiG0EaB (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 27 Jul 2022 00:30:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229838AbiG0EaA (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 27 Jul 2022 00:30:00 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 4C1E83CBEA
        for <linux-remoteproc@vger.kernel.org>; Tue, 26 Jul 2022 21:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1658896198;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=m3R1yCR4JjKjOL2e44LtMos911qHy0R24gXLvjAAiWw=;
        b=M4odReusa8XhjNN11HHg28wIJ1Oc/YpWG9EaEfpAjcrxyO8bXqEZ4AenkiHlR9XOYLgWbW
        FMz5ZSK7YqBZR80TQWaCTRXSUNLZSOVAZoQJXvEcYPT8EqLef9WuvHIwQWOjgK1tmpoNUP
        dPL+UEtOA0vaCLSVRbczUi+A1y6oRqw=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-288-L3tQ4KMSOCiVEnxYQSm4Yw-1; Wed, 27 Jul 2022 00:29:53 -0400
X-MC-Unique: L3tQ4KMSOCiVEnxYQSm4Yw-1
Received: by mail-pf1-f197.google.com with SMTP id x34-20020a056a000be200b0052b7f102681so5398197pfu.5
        for <linux-remoteproc@vger.kernel.org>; Tue, 26 Jul 2022 21:29:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=m3R1yCR4JjKjOL2e44LtMos911qHy0R24gXLvjAAiWw=;
        b=kqVEwbSBmRMqd9ZtKP1CtPeUdBo4UFkoyGsUjjIZsA2a6HoUeWSrANqI8vSYvrLGoQ
         ftA2q9Da9TPvyUSLBLro4dgOfnk+ueMRfl6IAKhUpVpSG39rJ+u6Xy28qgWpLgjY6l+k
         sqXLpKlMdcyARTDpedZT8HGBKNsIDj5rk9WEJ5s8RRwBhD+PkiuY1uD2p0dc8BDJEb+h
         8IRKvlvCegEXBYqobm/2pYqerXW8erzFJ2CYV7TAvPuEXN77tG81Xb9ahzW3DSiYn738
         CT5PLgXo0x1ig9HEIH9FV4q1PKFVaQzYM8ezGm3ezX0bYLBhlrATLplBohK+JKqOtSdg
         O+ww==
X-Gm-Message-State: AJIora90UkDv0JunQOq/9kK7SYxXSjOFz7neTLsWMMkcWFb4r2fmkhcL
        d3IedwlqE0XngK5H2etYR6vhZXmiBKJ167qWKvfd92GOzu7ExXvCe4JlXp76S15XKiGTkvp+Rg1
        17x77bC0eGmdSbITCEHA9VsE6vSHB6A==
X-Received: by 2002:a62:29c3:0:b0:52b:f774:7242 with SMTP id p186-20020a6229c3000000b0052bf7747242mr12642993pfp.67.1658896192588;
        Tue, 26 Jul 2022 21:29:52 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uJEmlIFJw4XLwcoDuJY/DA3iRQl4vi72zW5Nqvakm1GQ10IUCcyGSf9WmnEO/2tbD5Ja9IXw==
X-Received: by 2002:a62:29c3:0:b0:52b:f774:7242 with SMTP id p186-20020a6229c3000000b0052bf7747242mr12642976pfp.67.1658896192306;
        Tue, 26 Jul 2022 21:29:52 -0700 (PDT)
Received: from [10.72.12.96] ([209.132.188.80])
        by smtp.gmail.com with ESMTPSA id d4-20020a17090abf8400b001f10b31e7a7sm469679pjs.32.2022.07.26.21.29.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Jul 2022 21:29:51 -0700 (PDT)
Message-ID: <4de63999-2c35-3208-709b-2a67d696fec6@redhat.com>
Date:   Wed, 27 Jul 2022 12:29:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH v13 18/42] virtio_ring: packed: extract the logic of alloc
 queue
Content-Language: en-US
To:     Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        virtualization@lists.linux-foundation.org
Cc:     Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        "Michael S. Tsirkin" <mst@redhat.com>,
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
References: <20220726072225.19884-1-xuanzhuo@linux.alibaba.com>
 <20220726072225.19884-19-xuanzhuo@linux.alibaba.com>
From:   Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220726072225.19884-19-xuanzhuo@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org


在 2022/7/26 15:22, Xuan Zhuo 写道:
> Separate the logic of packed to create vring queue.
>
> This feature is required for subsequent virtuqueue reset vring.
>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>


Acked-by: Jason Wang <jasowang@redhat.com>


> ---
>   drivers/virtio/virtio_ring.c | 80 +++++++++++++++++++++++-------------
>   1 file changed, 51 insertions(+), 29 deletions(-)
>
> diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
> index 891900b31c3d..10cc2b7e3588 100644
> --- a/drivers/virtio/virtio_ring.c
> +++ b/drivers/virtio/virtio_ring.c
> @@ -1857,19 +1857,10 @@ static void vring_free_packed(struct vring_virtqueue_packed *vring_packed,
>   	kfree(vring_packed->desc_extra);
>   }
>   
> -static struct virtqueue *vring_create_virtqueue_packed(
> -	unsigned int index,
> -	unsigned int num,
> -	unsigned int vring_align,
> -	struct virtio_device *vdev,
> -	bool weak_barriers,
> -	bool may_reduce_num,
> -	bool context,
> -	bool (*notify)(struct virtqueue *),
> -	void (*callback)(struct virtqueue *),
> -	const char *name)
> +static int vring_alloc_queue_packed(struct vring_virtqueue_packed *vring_packed,
> +				    struct virtio_device *vdev,
> +				    u32 num)
>   {
> -	struct vring_virtqueue *vq;
>   	struct vring_packed_desc *ring;
>   	struct vring_packed_desc_event *driver, *device;
>   	dma_addr_t ring_dma_addr, driver_event_dma_addr, device_event_dma_addr;
> @@ -1881,7 +1872,11 @@ static struct virtqueue *vring_create_virtqueue_packed(
>   				 &ring_dma_addr,
>   				 GFP_KERNEL|__GFP_NOWARN|__GFP_ZERO);
>   	if (!ring)
> -		goto err_ring;
> +		goto err;
> +
> +	vring_packed->vring.desc         = ring;
> +	vring_packed->ring_dma_addr      = ring_dma_addr;
> +	vring_packed->ring_size_in_bytes = ring_size_in_bytes;
>   
>   	event_size_in_bytes = sizeof(struct vring_packed_desc_event);
>   
> @@ -1889,13 +1884,47 @@ static struct virtqueue *vring_create_virtqueue_packed(
>   				   &driver_event_dma_addr,
>   				   GFP_KERNEL|__GFP_NOWARN|__GFP_ZERO);
>   	if (!driver)
> -		goto err_driver;
> +		goto err;
> +
> +	vring_packed->vring.driver          = driver;
> +	vring_packed->event_size_in_bytes   = event_size_in_bytes;
> +	vring_packed->driver_event_dma_addr = driver_event_dma_addr;
>   
>   	device = vring_alloc_queue(vdev, event_size_in_bytes,
>   				   &device_event_dma_addr,
>   				   GFP_KERNEL|__GFP_NOWARN|__GFP_ZERO);
>   	if (!device)
> -		goto err_device;
> +		goto err;
> +
> +	vring_packed->vring.device          = device;
> +	vring_packed->device_event_dma_addr = device_event_dma_addr;
> +
> +	vring_packed->vring.num = num;
> +
> +	return 0;
> +
> +err:
> +	vring_free_packed(vring_packed, vdev);
> +	return -ENOMEM;
> +}
> +
> +static struct virtqueue *vring_create_virtqueue_packed(
> +	unsigned int index,
> +	unsigned int num,
> +	unsigned int vring_align,
> +	struct virtio_device *vdev,
> +	bool weak_barriers,
> +	bool may_reduce_num,
> +	bool context,
> +	bool (*notify)(struct virtqueue *),
> +	void (*callback)(struct virtqueue *),
> +	const char *name)
> +{
> +	struct vring_virtqueue_packed vring_packed = {};
> +	struct vring_virtqueue *vq;
> +
> +	if (vring_alloc_queue_packed(&vring_packed, vdev, num))
> +		goto err_ring;
>   
>   	vq = kmalloc(sizeof(*vq), GFP_KERNEL);
>   	if (!vq)
> @@ -1918,17 +1947,14 @@ static struct virtqueue *vring_create_virtqueue_packed(
>   	vq->indirect = virtio_has_feature(vdev, VIRTIO_RING_F_INDIRECT_DESC) &&
>   		!context;
>   
> -	vq->packed.ring_dma_addr = ring_dma_addr;
> -	vq->packed.driver_event_dma_addr = driver_event_dma_addr;
> -	vq->packed.device_event_dma_addr = device_event_dma_addr;
> +	vq->packed.ring_dma_addr = vring_packed.ring_dma_addr;
> +	vq->packed.driver_event_dma_addr = vring_packed.driver_event_dma_addr;
> +	vq->packed.device_event_dma_addr = vring_packed.device_event_dma_addr;
>   
> -	vq->packed.ring_size_in_bytes = ring_size_in_bytes;
> -	vq->packed.event_size_in_bytes = event_size_in_bytes;
> +	vq->packed.ring_size_in_bytes = vring_packed.ring_size_in_bytes;
> +	vq->packed.event_size_in_bytes = vring_packed.event_size_in_bytes;
>   
> -	vq->packed.vring.num = num;
> -	vq->packed.vring.desc = ring;
> -	vq->packed.vring.driver = driver;
> -	vq->packed.vring.device = device;
> +	vq->packed.vring = vring_packed.vring;
>   
>   	vq->packed.next_avail_idx = 0;
>   	vq->packed.avail_wrap_counter = 1;
> @@ -1967,11 +1993,7 @@ static struct virtqueue *vring_create_virtqueue_packed(
>   err_desc_state:
>   	kfree(vq);
>   err_vq:
> -	vring_free_queue(vdev, event_size_in_bytes, device, device_event_dma_addr);
> -err_device:
> -	vring_free_queue(vdev, event_size_in_bytes, driver, driver_event_dma_addr);
> -err_driver:
> -	vring_free_queue(vdev, ring_size_in_bytes, ring, ring_dma_addr);
> +	vring_free_packed(&vring_packed, vdev);
>   err_ring:
>   	return NULL;
>   }

