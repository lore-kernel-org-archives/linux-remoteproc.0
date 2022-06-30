Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BE2BC43334
	for <linux-remoteproc@archiver.kernel.org>; Thu, 30 Jun 2022 06:40:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232585AbiF3GkV (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 30 Jun 2022 02:40:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232384AbiF3GkS (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 30 Jun 2022 02:40:18 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C68E62F3B6
        for <linux-remoteproc@vger.kernel.org>; Wed, 29 Jun 2022 23:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1656571216;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=jAHrr0+GxDfej1qVCdn75eKSnjxER8aot4sqAySqnyU=;
        b=Oo3ryxbYhjMRU4GeMSGk2FfioiMTH0El4VRsR94NLhqA4QpDxWAuBUof6yPymtfkGYauQz
        r7/s4y1IUeaKMnB8O+VAV4weR+9cE/mDwvHqqjS/VPBNOg1B5jvPdhTowJLqYQUauhKKKE
        BJV0e+ZIGypGkIJSUfMk8WS4mJus1mY=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-374-6XK_j8LGM0Sdh8tx10Q6PQ-1; Thu, 30 Jun 2022 02:40:15 -0400
X-MC-Unique: 6XK_j8LGM0Sdh8tx10Q6PQ-1
Received: by mail-lj1-f199.google.com with SMTP id y16-20020a2e95d0000000b0025a70d22a16so2829809ljh.7
        for <linux-remoteproc@vger.kernel.org>; Wed, 29 Jun 2022 23:40:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jAHrr0+GxDfej1qVCdn75eKSnjxER8aot4sqAySqnyU=;
        b=1aKkZxR0NKLy3QZ47fdvti/s+UyIzFRgQBsADUnEhANw/R4+tG/kuu97RLIJnqhxkG
         rpX20gm+ZP+BYjVI4Id+cMGkFWeDyhdCz/dI9HFX/bYnMXNXdse5u2sLOfqJ50nm/5Ye
         /PDeE5tqYhAdDo+I5EiCE9ksQ+qkGdYHmHtfLfNDAL5CeKoszbSG3uv+Q/KX4a24eRcv
         QtFQNE4p5XBsgGehomDzpEBizna2qGe0T2kRg3WqA7wjGcB3IjZlg9giC0lI+kgAWl9J
         eTAxZruMIWaE8IJ2n6h0gJ0+ALoRppG3hE/+vABgNLJ24h7PbXEg3po47aai8VGWsJGZ
         wiMg==
X-Gm-Message-State: AJIora+89SWRvWyzB98zBf/n8JdumCOW+FdpFoqWoUUILtsBc95jNTIk
        QYvN87TlNddnIU+KrnltV73sZ0r/1j0zIY4WRZe8+mL2lY+UuhhVix54iZpHfk8DoeemnRkhni6
        DbpmtinaRkGRciklonM/U4FpSAOOzbcR47afjaB2+OVIM6w==
X-Received: by 2002:a05:6512:158d:b0:47f:718c:28b5 with SMTP id bp13-20020a056512158d00b0047f718c28b5mr4753520lfb.397.1656571213817;
        Wed, 29 Jun 2022 23:40:13 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tAA0XU6ZzbOAb5pqi3g/cuvZsx0P7N9Yp/LWOT+IpPh+uRjEGCtW9glE4GIh09HeOKg0ELev5VqROwEDkQfbM=
X-Received: by 2002:a05:6512:158d:b0:47f:718c:28b5 with SMTP id
 bp13-20020a056512158d00b0047f718c28b5mr4753513lfb.397.1656571213588; Wed, 29
 Jun 2022 23:40:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220629065656.54420-1-xuanzhuo@linux.alibaba.com> <20220629065656.54420-6-xuanzhuo@linux.alibaba.com>
In-Reply-To: <20220629065656.54420-6-xuanzhuo@linux.alibaba.com>
From:   Jason Wang <jasowang@redhat.com>
Date:   Thu, 30 Jun 2022 14:40:02 +0800
Message-ID: <CACGkMEvfFV8w34=SiS4XFyEH5+EEkb9JqYg0t_rKpU1rRBMLiQ@mail.gmail.com>
Subject: Re: [PATCH v11 05/40] virtio_ring: split vring_virtqueue
To:     Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc:     virtualization <virtualization@lists.linux-foundation.org>,
        Richard Weinberger <richard@nod.at>,
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
        linux-um@lists.infradead.org, netdev <netdev@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org,
        kvm <kvm@vger.kernel.org>,
        "open list:XDP (eXpress Data Path)" <bpf@vger.kernel.org>,
        kangjie.xu@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Jun 29, 2022 at 2:57 PM Xuan Zhuo <xuanzhuo@linux.alibaba.com> wrote:
>
> Separate the two inline structures(split and packed) from the structure
> vring_virtqueue.
>
> In this way, we can use these two structures later to pass parameters
> and retain temporary variables.
>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>

Acked-by: Jason Wang <jasowang@redhat.com>

> ---
>  drivers/virtio/virtio_ring.c | 116 ++++++++++++++++++-----------------
>  1 file changed, 60 insertions(+), 56 deletions(-)
>
> diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
> index bb4e8ae09c9b..2806e033a651 100644
> --- a/drivers/virtio/virtio_ring.c
> +++ b/drivers/virtio/virtio_ring.c
> @@ -85,6 +85,64 @@ struct vring_desc_extra {
>         u16 next;                       /* The next desc state in a list. */
>  };
>
> +struct vring_virtqueue_split {
> +       /* Actual memory layout for this queue. */
> +       struct vring vring;
> +
> +       /* Last written value to avail->flags */
> +       u16 avail_flags_shadow;
> +
> +       /*
> +        * Last written value to avail->idx in
> +        * guest byte order.
> +        */
> +       u16 avail_idx_shadow;
> +
> +       /* Per-descriptor state. */
> +       struct vring_desc_state_split *desc_state;
> +       struct vring_desc_extra *desc_extra;
> +
> +       /* DMA address and size information */
> +       dma_addr_t queue_dma_addr;
> +       size_t queue_size_in_bytes;
> +};
> +
> +struct vring_virtqueue_packed {
> +       /* Actual memory layout for this queue. */
> +       struct {
> +               unsigned int num;
> +               struct vring_packed_desc *desc;
> +               struct vring_packed_desc_event *driver;
> +               struct vring_packed_desc_event *device;
> +       } vring;
> +
> +       /* Driver ring wrap counter. */
> +       bool avail_wrap_counter;
> +
> +       /* Avail used flags. */
> +       u16 avail_used_flags;
> +
> +       /* Index of the next avail descriptor. */
> +       u16 next_avail_idx;
> +
> +       /*
> +        * Last written value to driver->flags in
> +        * guest byte order.
> +        */
> +       u16 event_flags_shadow;
> +
> +       /* Per-descriptor state. */
> +       struct vring_desc_state_packed *desc_state;
> +       struct vring_desc_extra *desc_extra;
> +
> +       /* DMA address and size information */
> +       dma_addr_t ring_dma_addr;
> +       dma_addr_t driver_event_dma_addr;
> +       dma_addr_t device_event_dma_addr;
> +       size_t ring_size_in_bytes;
> +       size_t event_size_in_bytes;
> +};
> +
>  struct vring_virtqueue {
>         struct virtqueue vq;
>
> @@ -124,64 +182,10 @@ struct vring_virtqueue {
>
>         union {
>                 /* Available for split ring */
> -               struct {
> -                       /* Actual memory layout for this queue. */
> -                       struct vring vring;
> -
> -                       /* Last written value to avail->flags */
> -                       u16 avail_flags_shadow;
> -
> -                       /*
> -                        * Last written value to avail->idx in
> -                        * guest byte order.
> -                        */
> -                       u16 avail_idx_shadow;
> -
> -                       /* Per-descriptor state. */
> -                       struct vring_desc_state_split *desc_state;
> -                       struct vring_desc_extra *desc_extra;
> -
> -                       /* DMA address and size information */
> -                       dma_addr_t queue_dma_addr;
> -                       size_t queue_size_in_bytes;
> -               } split;
> +               struct vring_virtqueue_split split;
>
>                 /* Available for packed ring */
> -               struct {
> -                       /* Actual memory layout for this queue. */
> -                       struct {
> -                               unsigned int num;
> -                               struct vring_packed_desc *desc;
> -                               struct vring_packed_desc_event *driver;
> -                               struct vring_packed_desc_event *device;
> -                       } vring;
> -
> -                       /* Driver ring wrap counter. */
> -                       bool avail_wrap_counter;
> -
> -                       /* Avail used flags. */
> -                       u16 avail_used_flags;
> -
> -                       /* Index of the next avail descriptor. */
> -                       u16 next_avail_idx;
> -
> -                       /*
> -                        * Last written value to driver->flags in
> -                        * guest byte order.
> -                        */
> -                       u16 event_flags_shadow;
> -
> -                       /* Per-descriptor state. */
> -                       struct vring_desc_state_packed *desc_state;
> -                       struct vring_desc_extra *desc_extra;
> -
> -                       /* DMA address and size information */
> -                       dma_addr_t ring_dma_addr;
> -                       dma_addr_t driver_event_dma_addr;
> -                       dma_addr_t device_event_dma_addr;
> -                       size_t ring_size_in_bytes;
> -                       size_t event_size_in_bytes;
> -               } packed;
> +               struct vring_virtqueue_packed packed;
>         };
>
>         /* How to notify other side. FIXME: commonalize hcalls! */
> --
> 2.31.0
>

