Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F911C4332F
	for <linux-remoteproc@archiver.kernel.org>; Wed,  9 Mar 2022 04:48:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229518AbiCIEtu (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 8 Mar 2022 23:49:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229524AbiCIEtr (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 8 Mar 2022 23:49:47 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id DBEA0158783
        for <linux-remoteproc@vger.kernel.org>; Tue,  8 Mar 2022 20:48:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1646801328;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7yW1kWq855MoycbxENZXn/INYb5Qcrtgiwr9xtyGJCE=;
        b=BqcZKHSgPtV7wWEAkPYeiBzssX0Az1kSsBGdDEKxPjUvA7V2z5hV1mkVlg0JxvlQnA8Y/0
        VxeVA6q+OC04lUufrR7TOzDd2br5jEc5uQFn3UPUaVLmPXn/5kFttwlcy4EvpivAPdlxTm
        heJyLu3qEqXVlYqzbPVjgnG3RREYeG8=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-65-UxdfwhdINk2BCm1drPUPJw-1; Tue, 08 Mar 2022 23:48:46 -0500
X-MC-Unique: UxdfwhdINk2BCm1drPUPJw-1
Received: by mail-pj1-f70.google.com with SMTP id s20-20020a17090ad49400b001bf481fae01so2176674pju.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 08 Mar 2022 20:48:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=7yW1kWq855MoycbxENZXn/INYb5Qcrtgiwr9xtyGJCE=;
        b=c4PEeSQuBPkjbGLjDy70VVN3pv8o5lUTyUmXaKI7MkabtPaCrA0tLHhmc69nJLSM7T
         bDDTRDGrj81wDus0AdrJWCrfJMaigZWF31t1VbeAWyJgxXBnqxdkq96bOPyvebymBpCB
         ci1UnajQQNzn3Bvz8SjfwBULIn/zAHb6EKAwsPj8OWbzKYQkORUpnw8VZSEblJ6pWgob
         f4xoNuBbtRX3JEE9pX5TjZDAKUBFocWfkQfCkrjzv4sBvy6+jrne27Ffx9vA9fhHrQUd
         dbxPjXwWNZi6/kaxiLD6iYpWHSiiwB56veQNgXxr4Seph5bEDN+qDVgGRHzoQ0itd7xw
         X3Zg==
X-Gm-Message-State: AOAM530GUV1HZcIQ2JL6BRht5b7450X5VO7gs1x+isCpfHle5Uex24dU
        1MUfvG4K7EwcQtTiiYUKdso6wqd8KEXhEzDv2wJ735VIf1jcKHezuRPm0SSTEIOFlfUDtDEav7y
        IP41RX6vEhZ/gNZoMEH13UCLGTvfw0w==
X-Received: by 2002:a17:90b:17ca:b0:1bf:6188:cc00 with SMTP id me10-20020a17090b17ca00b001bf6188cc00mr8597564pjb.2.1646801325729;
        Tue, 08 Mar 2022 20:48:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwosqJUOOIblsYGQ27dg95V2/uz330dPMJom2dl9RgGa8k3TOiXYiGNo7Wasa+ovCrQzyH4wQ==
X-Received: by 2002:a17:90b:17ca:b0:1bf:6188:cc00 with SMTP id me10-20020a17090b17ca00b001bf6188cc00mr8597538pjb.2.1646801325443;
        Tue, 08 Mar 2022 20:48:45 -0800 (PST)
Received: from [10.72.13.251] ([209.132.188.80])
        by smtp.gmail.com with ESMTPSA id g15-20020a056a0023cf00b004e17e11cb17sm821341pfc.111.2022.03.08.20.48.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Mar 2022 20:48:44 -0800 (PST)
Message-ID: <373494ae-825b-d573-012c-4e7d453934da@redhat.com>
Date:   Wed, 9 Mar 2022 12:48:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v7 01/26] virtio_pci: struct virtio_pci_common_cfg add
 queue_notify_data
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
 <20220308123518.33800-2-xuanzhuo@linux.alibaba.com>
From:   Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220308123518.33800-2-xuanzhuo@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org


在 2022/3/8 下午8:34, Xuan Zhuo 写道:
> Add queue_notify_data in struct virtio_pci_common_cfg, which comes from
> here https://github.com/oasis-tcs/virtio-spec/issues/89
>
> For not breaks uABI, add a new struct virtio_pci_common_cfg_notify.
>
> Since I want to add queue_reset after queue_notify_data, I submitted
> this patch first.
>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>


Acked-by: Jason Wang <jasowang@redhat.com>


> ---
>   include/uapi/linux/virtio_pci.h | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/include/uapi/linux/virtio_pci.h b/include/uapi/linux/virtio_pci.h
> index 3a86f36d7e3d..22bec9bd0dfc 100644
> --- a/include/uapi/linux/virtio_pci.h
> +++ b/include/uapi/linux/virtio_pci.h
> @@ -166,6 +166,13 @@ struct virtio_pci_common_cfg {
>   	__le32 queue_used_hi;		/* read-write */
>   };
>   
> +struct virtio_pci_common_cfg_notify {
> +	struct virtio_pci_common_cfg cfg;
> +
> +	__le16 queue_notify_data;	/* read-write */
> +	__le16 padding;
> +};
> +
>   /* Fields in VIRTIO_PCI_CAP_PCI_CFG: */
>   struct virtio_pci_cfg_cap {
>   	struct virtio_pci_cap cap;

