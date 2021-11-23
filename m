Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6813C433EF
	for <linux-remoteproc@archiver.kernel.org>; Tue, 23 Nov 2021 06:16:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233576AbhKWGTH (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 23 Nov 2021 01:19:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33015 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233414AbhKWGTH (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 23 Nov 2021 01:19:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1637648159;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=4zwLXwj6k9S2mIEl8JoRh6JXMNKqR5tGWTY9Pd3RcY4=;
        b=ErEx38P69NJZcrFE5I7LwTBtdzTSnJzdHj2sXvGFXLGVqkG5vdL7NvslugWgfGAqEbZ9dH
        6eFclFeUjKBQEvjqiaQJLRsdESAQY15zYiX+wFdZN/yoa7akve9Rse76Ef72vw3Znwk9xJ
        sBCZforC23H3b+LC3C0aETqtQXaUfj4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-49-JQQ5_srwPYCMMK9-J-6Rmg-1; Tue, 23 Nov 2021 01:15:57 -0500
X-MC-Unique: JQQ5_srwPYCMMK9-J-6Rmg-1
Received: by mail-wm1-f69.google.com with SMTP id z138-20020a1c7e90000000b003319c5f9164so677202wmc.7
        for <linux-remoteproc@vger.kernel.org>; Mon, 22 Nov 2021 22:15:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4zwLXwj6k9S2mIEl8JoRh6JXMNKqR5tGWTY9Pd3RcY4=;
        b=3hyAhTYSofmfBRUCUhabl8bidFkjBK3PipMJXXAVq3ckOINcapNr0YEuIURcjOzJKG
         sF4T6pFkjz5eUiBdjWjYLxJPdl0nC+MYL4g9rDFhXbrAp68jaZY0JfZ/uiGMfcUEFpp5
         i9bBo/aeX0Uokrfw+EMcfM4a+SclAZMLQ7Jd988UinCedLVxX/kFc+qnYxRwMJRtLDRB
         1GHelLHyC0RJ/OvhoM/jniIFsCy/KCaA8c6GKfOPxE+cDkYhP+OP4tJtQmHv9aA7Jjyu
         1gVmCtL337AjeNo6wdwVZffdMwYRKzVJ3x8x3vHbe7/prV3yh09KJ1E6RA1j4g6JlGoj
         8LHw==
X-Gm-Message-State: AOAM531Ica2/oynbyiMJLUlVfTqfShS2KQi5BFzuL7/CS7Q/4gwaJbQ0
        MWEbOlNsT1a6Gu0e1ZSsrG8pD8kepN6KE1GpBnlBP9yD/TjVm/eT+tr1PuzjTq2MORAxo4QG9/O
        ldl1daB54c2fyDsy6fZjrKi7aA10KRQ==
X-Received: by 2002:adf:ef4f:: with SMTP id c15mr4390047wrp.226.1637648156165;
        Mon, 22 Nov 2021 22:15:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwCd6t13EbSY0ZWFB7yE27RLkDqYVVYmKx7kd9hky7A7ody0jIp7kwGr4IDGX9vk1Uty1OSnQ==
X-Received: by 2002:adf:ef4f:: with SMTP id c15mr4390015wrp.226.1637648155984;
        Mon, 22 Nov 2021 22:15:55 -0800 (PST)
Received: from redhat.com ([45.15.19.36])
        by smtp.gmail.com with ESMTPSA id a10sm24151127wmq.27.2021.11.22.22.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Nov 2021 22:15:55 -0800 (PST)
Date:   Tue, 23 Nov 2021 01:15:51 -0500
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH] rpmsg: virtio: don't let virtio core to validate used
 length
Message-ID: <20211123011340-mutt-send-email-mst@kernel.org>
References: <20211122160812.25125-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211122160812.25125-1-arnaud.pouliquen@foss.st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, Nov 22, 2021 at 05:08:12PM +0100, Arnaud Pouliquen wrote:
> For RX virtqueue, the used length is validated in all the three paths
> (big, small and mergeable). For control vq, we never tries to use used
> length. So this patch forbids the core to validate the used length.

Jason commented on this. This is copy paste from virtio net
where the change was merely an optimization.

> Without patch the rpmsg client sample does not work.

Hmm that's not enough of a description. Could you please
provide more detail? Does rpmsg device set used length to a
value > dma read buffer size? what kind of error message
do you get? what are the plans to fix the device?

> Fixes: 939779f5152d ("virtio_ring: validate used buffer length")
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> ---
> base-commit: fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf
> ---
>  drivers/rpmsg/virtio_rpmsg_bus.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> index 9c112aa65040..5f73f19c2c38 100644
> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> @@ -1054,6 +1054,7 @@ static struct virtio_driver virtio_ipc_driver = {
>  	.feature_table_size = ARRAY_SIZE(features),
>  	.driver.name	= KBUILD_MODNAME,
>  	.driver.owner	= THIS_MODULE,
> +	.suppress_used_validation = true,
>  	.id_table	= id_table,
>  	.probe		= rpmsg_probe,
>  	.remove		= rpmsg_remove,
> -- 
> 2.17.1

