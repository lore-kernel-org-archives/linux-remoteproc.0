Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44DF1C433FE
	for <linux-remoteproc@archiver.kernel.org>; Tue, 12 Apr 2022 08:25:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235222AbiDLINm (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 12 Apr 2022 04:13:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357563AbiDLHk3 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 12 Apr 2022 03:40:29 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 177EE30550
        for <linux-remoteproc@vger.kernel.org>; Tue, 12 Apr 2022 00:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1649747763;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=WVzkj+bZmYlT5FAR8tqeVhbuQLiJC56RxAwusezhQ84=;
        b=Ipj5ds9Utagz21lJ3xj664pkZLGXcShNWfs2unJjKlJJ2/t39e50wjxGiKT5aNxSmCugFN
        8K91I42SlcGvPJbB6iyJDuPrxMYP1FYi+kSkBJ1/K/MNRiit0xNapO3BcgRq0fEQGqLyWL
        ftME8HOM1EjNAtD1pGpcIdHAFEeHEk0=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-322-SF0PEQL9MV-PcnNU9V_e5A-1; Tue, 12 Apr 2022 03:16:01 -0400
X-MC-Unique: SF0PEQL9MV-PcnNU9V_e5A-1
Received: by mail-pj1-f69.google.com with SMTP id n17-20020a17090ac69100b001c77ebd900fso1079132pjt.8
        for <linux-remoteproc@vger.kernel.org>; Tue, 12 Apr 2022 00:16:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=WVzkj+bZmYlT5FAR8tqeVhbuQLiJC56RxAwusezhQ84=;
        b=y5c4HSw6VG3evEnbR9Ca1IZ9drWBhkv2CaxZBqNWQOM+lTTGpXA6+9GmIGFez3wGw0
         dn/jYdp6wYniatxtcqWkeIP2Iaw+2NOalJXzgbaLdwqhTy+B4+9sMmWm0X7A0w6UqKcd
         hEIx34A5XHi4+UL1QtvdojciJ8cBfuI4gcnTHXikHPJawZLQPpwEK+ExZKTyLuSOLsGD
         AqukDxrhezvJcLoljkxuOfZDHV6jLlbO+gUWH14cLZJ/xoEzWqzNG0kg+NY15rbJLVuH
         SCK5ZnRMiQ8G5FFoKgfU7g8rVEh2CoqjZ0TYP6fA0nJvuZbrI5DxW3ZvFH3iw0Ks0lNk
         N44g==
X-Gm-Message-State: AOAM532YrxGRxRVJALNEt7u/LAwlNPW+GDUzCzrx0ciZU7ks/qq/NBNZ
        0aPVXGT3XVKAHeBxENwofbIT8lWv1AVj20BN+zEoDvR7H5TUPuKLA5X827veN1Em7F6oggbY69q
        +jH6hg9vElSTvbftoIKTyqrYLcaFJPA==
X-Received: by 2002:a17:902:6b89:b0:154:623c:9517 with SMTP id p9-20020a1709026b8900b00154623c9517mr35687018plk.45.1649747759849;
        Tue, 12 Apr 2022 00:15:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7Spm6ydmB4c+gNo+WzpTpSsuGx/B9P8qij+KvJBZZhrNiJwtOL5scK9AARgGePEjvxDGr1g==
X-Received: by 2002:a17:902:6b89:b0:154:623c:9517 with SMTP id p9-20020a1709026b8900b00154623c9517mr35687003plk.45.1649747759617;
        Tue, 12 Apr 2022 00:15:59 -0700 (PDT)
Received: from [10.72.14.5] ([209.132.188.80])
        by smtp.gmail.com with ESMTPSA id y15-20020a17090a1f4f00b001c7ecaf9e13sm1705890pjy.35.2022.04.12.00.15.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Apr 2022 00:15:59 -0700 (PDT)
Message-ID: <ccd0fd5d-389a-70e9-ae48-406514e383d6@redhat.com>
Date:   Tue, 12 Apr 2022 15:15:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v9 27/32] virtio: add helper virtio_find_vqs_ctx_size()
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
 <20220406034346.74409-28-xuanzhuo@linux.alibaba.com>
From:   Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220406034346.74409-28-xuanzhuo@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org


在 2022/4/6 上午11:43, Xuan Zhuo 写道:
> Introduce helper virtio_find_vqs_ctx_size() to call find_vqs and specify
> the maximum size of each vq ring.
>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>


Acked-by: Jason Wang <jasowang@redhat.com>


> ---
>   include/linux/virtio_config.h | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
>
> diff --git a/include/linux/virtio_config.h b/include/linux/virtio_config.h
> index 0f7def7ddfd2..22e29c926946 100644
> --- a/include/linux/virtio_config.h
> +++ b/include/linux/virtio_config.h
> @@ -235,6 +235,18 @@ int virtio_find_vqs_ctx(struct virtio_device *vdev, unsigned nvqs,
>   				      ctx, desc);
>   }
>   
> +static inline
> +int virtio_find_vqs_ctx_size(struct virtio_device *vdev, u32 nvqs,
> +				 struct virtqueue *vqs[],
> +				 vq_callback_t *callbacks[],
> +				 const char * const names[],
> +				 u32 sizes[],
> +				 const bool *ctx, struct irq_affinity *desc)
> +{
> +	return vdev->config->find_vqs(vdev, nvqs, vqs, callbacks, names, sizes,
> +				      ctx, desc);
> +}
> +
>   /**
>    * virtio_device_ready - enable vq use in probe function
>    * @vdev: the device

