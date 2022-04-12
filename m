Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8E8FC433FE
	for <linux-remoteproc@archiver.kernel.org>; Tue, 12 Apr 2022 02:50:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240428AbiDLCwS (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 11 Apr 2022 22:52:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343616AbiDLCwQ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 11 Apr 2022 22:52:16 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 71C1A24956
        for <linux-remoteproc@vger.kernel.org>; Mon, 11 Apr 2022 19:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1649731798;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=uwRhwX5o1ZKlygCgQ3xGq/wyDNTDMYF/CMCZtPRL46U=;
        b=G4RrJ5ft8ecoVCz0VTGfINHW0fo9GMMmcoYI/WEUlDZVwC8tTWbAFUcAwYymNVEdgrV0t/
        h3nDtz9yJOQ1JmKYOgBjVF62uSs/dfT+eJMPSzHdslirT6TSTZPBe+ZJ/b9VGqxw9C1WjH
        werWhuQalvR3Xy0y21jF1FF5QnKkpsk=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-29-D8JH4NihMf6URHjQIrPgOA-1; Mon, 11 Apr 2022 22:49:56 -0400
X-MC-Unique: D8JH4NihMf6URHjQIrPgOA-1
Received: by mail-pg1-f200.google.com with SMTP id e12-20020a63544c000000b003985d5888a8so9799380pgm.15
        for <linux-remoteproc@vger.kernel.org>; Mon, 11 Apr 2022 19:49:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=uwRhwX5o1ZKlygCgQ3xGq/wyDNTDMYF/CMCZtPRL46U=;
        b=kzUHMkQsXF+9iayeGTK3jgSO4Vmq2WWA/JNktFhPsPtmdH7wHy5qe/1aXukn8kFMdL
         uhqVO7bE8kIKcSxxEiizH64/nW2RLiHV/qd/9dBAFPWQjb1RRc1BYGnzr8hpWaC+ZYBh
         mb+wiazHVFgh5SB4NkLNyOyfVvJL7g30riICM3wbTRv+E5eBE0aVt6SIhCAT1WAra+pc
         rhmbj9oWjjYcP+g0V8k7LkJDJ1HKlu2Br+UTHzVj/aytxoCZ8R5lSD16Dip20ML3muDF
         GHnvfdcX4X6Q8aFoJStks4c+aOObFxBiFAW9t8RrCdHHaiixBGZwwREkUekCB8Ti4DGE
         f80w==
X-Gm-Message-State: AOAM532k33JYwBbstGS8sPdr8ifgrggkX+TUIxiepTP4ON0W4l7XdXyI
        Vu47XHtOqFbSh7G79ujFlVdpQcQK3I4gnyh2hbJ+oxkLGGvx9rDTZZ24QuQHNZyQexflU2JjcLb
        H5SNO/K/stBn8zFcs5n5/Er734VD+lw==
X-Received: by 2002:a17:902:f787:b0:152:157:eb7 with SMTP id q7-20020a170902f78700b0015201570eb7mr34196045pln.109.1649731795829;
        Mon, 11 Apr 2022 19:49:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7g+34LbfFseW6K+0T9iSnUxylNiT1oNf8YpIYdQIMHAztol8ytTy6Bjs0RdOSSnoavA05bA==
X-Received: by 2002:a17:902:f787:b0:152:157:eb7 with SMTP id q7-20020a170902f78700b0015201570eb7mr34196016pln.109.1649731795595;
        Mon, 11 Apr 2022 19:49:55 -0700 (PDT)
Received: from [10.72.14.5] ([209.132.188.80])
        by smtp.gmail.com with ESMTPSA id 75-20020a62174e000000b0050579f94ed2sm13220419pfx.96.2022.04.11.19.49.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Apr 2022 19:49:55 -0700 (PDT)
Message-ID: <f57f8da3-38a6-91a5-05bb-9435a21880d7@redhat.com>
Date:   Tue, 12 Apr 2022 10:49:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v9 03/32] virtio_ring: update the document of the
 virtqueue_detach_unused_buf for queue reset
Content-Language: en-US
To:     Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        virtualization@lists.linux-foundation.org
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
        linux-um@lists.infradead.org, netdev@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org,
        kvm@vger.kernel.org, bpf@vger.kernel.org
References: <20220406034346.74409-1-xuanzhuo@linux.alibaba.com>
 <20220406034346.74409-4-xuanzhuo@linux.alibaba.com>
From:   Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220406034346.74409-4-xuanzhuo@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org


在 2022/4/6 上午11:43, Xuan Zhuo 写道:
> Added documentation for virtqueue_detach_unused_buf, allowing it to be
> called on queue reset.
>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>


Acked-by: Jason Wang <jasowang@redhat.com>


> ---
>   drivers/virtio/virtio_ring.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
> index b87130c8f312..f1807f6b06a5 100644
> --- a/drivers/virtio/virtio_ring.c
> +++ b/drivers/virtio/virtio_ring.c
> @@ -2127,8 +2127,8 @@ EXPORT_SYMBOL_GPL(virtqueue_enable_cb_delayed);
>    * @_vq: the struct virtqueue we're talking about.
>    *
>    * Returns NULL or the "data" token handed to virtqueue_add_*().
> - * This is not valid on an active queue; it is useful only for device
> - * shutdown.
> + * This is not valid on an active queue; it is useful for device
> + * shutdown or the reset queue.
>    */
>   void *virtqueue_detach_unused_buf(struct virtqueue *_vq)
>   {

