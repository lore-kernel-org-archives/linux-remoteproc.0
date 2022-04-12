Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73A7CC433F5
	for <linux-remoteproc@archiver.kernel.org>; Tue, 12 Apr 2022 05:50:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348362AbiDLFwS (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 12 Apr 2022 01:52:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243858AbiDLFwR (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 12 Apr 2022 01:52:17 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B2CAA2DA90
        for <linux-remoteproc@vger.kernel.org>; Mon, 11 Apr 2022 22:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1649742598;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+nfLWnPBAuMlm5r+UmbtTzmJcwM0c6Blxn5Idke/QAM=;
        b=IBLFSY15QUMCIl9/rL8co57IWU1p9begSpzqiTj89yvVMo1YXlA/ZFm1H51r7D4NuFGzLb
        63Ez6NC+p0841bUnL4wxBfezv2Yusavtz8RWLU2Rvh3e9iGx5ADz+Dl1HVWxEa+eJ8suhm
        c0XK3MQhNAoy2Cs466G4mzuLSo1xrjU=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-594-_SpTpLn8O-2DlPD9yayZBg-1; Tue, 12 Apr 2022 01:49:57 -0400
X-MC-Unique: _SpTpLn8O-2DlPD9yayZBg-1
Received: by mail-pg1-f199.google.com with SMTP id q13-20020a638c4d000000b003821725ad66so10001711pgn.23
        for <linux-remoteproc@vger.kernel.org>; Mon, 11 Apr 2022 22:49:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=+nfLWnPBAuMlm5r+UmbtTzmJcwM0c6Blxn5Idke/QAM=;
        b=4tigZyHstoRw9tWSU5lIHECFHYWF4gMVmb8JX9bM7GcMlqOqBu1p3mv0KUNmYI4yuH
         JK5ceZIPHgPKDzRpFKi0Nrgl9DKdJ5LEkPLIOdw7+ilglIUhYRsP0YE1zxUtJ4AWi3GJ
         P2Oy+P+4qCoRww9nlL48iVdOXfYamMaQY6ouwFtvyoTJXnioimh26K75R1Udmo9419SL
         OTQ01PoILhD8qd+2KBNpdixgm3RBCuMndyb0X/jmGDW+UIUWsM2UjdgHP926KS/P1GSt
         DgdM/Me3pJr1q4HWORQbB8AN0orL3+/EjmxpsJ6NwzX3E79wlWVw8XODSC9yYb7o0Ru6
         ko1g==
X-Gm-Message-State: AOAM532TzGtTfngjKdbHF+Zn03Fd3T2TaWvGPe3Lltc4WRzXfjA9TjnS
        ohjxOycPqn9oYwFMg73y2ycDYw9uV/TQTdTbjTpkyVrnBGR5fVQNVCDYH/d8m7Yb8TT/N6MB/We
        HX6XKWe7rJ41Badqi3yApNlS89WN04A==
X-Received: by 2002:a17:90a:2b0f:b0:1cb:a3e5:413b with SMTP id x15-20020a17090a2b0f00b001cba3e5413bmr3111668pjc.115.1649742595569;
        Mon, 11 Apr 2022 22:49:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx5M7w4regKv/6lTzZiCGXRv4gWijfltQwpzvyUhGLz6udlOo2qWGkxbBotpTg1IaFMoqyGeg==
X-Received: by 2002:a17:90a:2b0f:b0:1cb:a3e5:413b with SMTP id x15-20020a17090a2b0f00b001cba3e5413bmr3111650pjc.115.1649742595355;
        Mon, 11 Apr 2022 22:49:55 -0700 (PDT)
Received: from [10.72.14.5] ([209.132.188.80])
        by smtp.gmail.com with ESMTPSA id 3-20020a17090a034300b001c779e82af6sm1265782pjf.48.2022.04.11.22.49.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Apr 2022 22:49:54 -0700 (PDT)
Message-ID: <14ab2942-2141-cb1b-14be-35da1c9ee03d@redhat.com>
Date:   Tue, 12 Apr 2022 13:49:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v9 10/32] virtio_ring: split: introduce
 virtqueue_reinit_split()
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
 <20220406034346.74409-11-xuanzhuo@linux.alibaba.com>
From:   Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220406034346.74409-11-xuanzhuo@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org


在 2022/4/6 上午11:43, Xuan Zhuo 写道:
> Introduce a function to initialize vq without allocating new ring,
> desc_state, desc_extra.
>
> Subsequent patches will call this function after reset vq to
> reinitialize vq.
>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>


Acked-by: Jason Wang <jasowang@redhat.com>


> ---
>   drivers/virtio/virtio_ring.c | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
>
> diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
> index 874f878087a3..3dc6ace2ba7a 100644
> --- a/drivers/virtio/virtio_ring.c
> +++ b/drivers/virtio/virtio_ring.c
> @@ -953,6 +953,25 @@ static void vring_virtqueue_init_split(struct vring_virtqueue *vq,
>   	vq->free_head = 0;
>   }
>   
> +static void virtqueue_reinit_split(struct vring_virtqueue *vq)
> +{
> +	struct virtio_device *vdev = vq->vq.vdev;
> +	int size, i;
> +
> +	memset(vq->split.vring.desc, 0, vq->split.queue_size_in_bytes);
> +
> +	size = sizeof(struct vring_desc_state_split) * vq->split.vring.num;
> +	memset(vq->split.desc_state, 0, size);
> +
> +	size = sizeof(struct vring_desc_extra) * vq->split.vring.num;
> +	memset(vq->split.desc_extra, 0, size);
> +
> +	for (i = 0; i < vq->split.vring.num - 1; i++)
> +		vq->split.desc_extra[i].next = i + 1;
> +
> +	vring_virtqueue_init_split(vq, vdev, true);
> +}
> +
>   static void vring_virtqueue_attach_split(struct vring_virtqueue *vq,
>   					 struct vring vring,
>   					 struct vring_desc_state_split *desc_state,

