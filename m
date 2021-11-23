Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BF74C433F5
	for <linux-remoteproc@archiver.kernel.org>; Tue, 23 Nov 2021 02:15:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231363AbhKWCSz (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 22 Nov 2021 21:18:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28660 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231879AbhKWCSy (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 22 Nov 2021 21:18:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1637633746;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=W1DldLfSNZ3GZO5TU3A8eWGee6MOniRNFPe++o8u1a8=;
        b=MwHIO3lkC84qaTE2GHPcelXtOImMGBosDQNuu19riZQouGYB8dYaM5sjANIplEL0apyFcb
        6V8uVSG/MB1iDjFVRAGm0Hz3exFWBSOns1Jfp5sBTUes169+5Fp/qim2qiGpLlb0mFA2IY
        5SJk15hL/4RvtBvc+yEvpiiGTBRjrC8=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-58-7qJ5kwUiPyq6DotwrVdHJQ-1; Mon, 22 Nov 2021 21:15:45 -0500
X-MC-Unique: 7qJ5kwUiPyq6DotwrVdHJQ-1
Received: by mail-lf1-f72.google.com with SMTP id bp10-20020a056512158a00b0040376f60e35so13438725lfb.8
        for <linux-remoteproc@vger.kernel.org>; Mon, 22 Nov 2021 18:15:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=W1DldLfSNZ3GZO5TU3A8eWGee6MOniRNFPe++o8u1a8=;
        b=rjuYpjfC3xLcTaqad6aReLrxnGYj5wGj3AtdkELS4u/6Dsj3tKuIKw5p6q/iN+JpEA
         eDMk5eOAmciRa1Lr4+UojBVYVVYab0Fc5cpbMuQ38mzSgHDMnlcblgX1G7DQ5QhZLiev
         Sg6KrcLQMLUCdiAJCnIWi6icLDnvhE8tPiYNfYPeg0tV371/h1Q+Z7JV8o7KgyGvMU8m
         mCWuxvxQYW8+t3I5epTnEsDLhXV3ewjqbJ7Z/jjKOg42Z03Ij3UX9vLCo/37Huni+Gmu
         bmuUHbKFG6ME63FU1N/TPD7DrmwvgbIR/jrDWA0IwVNP6vqEOxgC7KgxadpWVUhfbhFs
         LLgA==
X-Gm-Message-State: AOAM532EJ6j3S0EGFv8hDJmS0FbNZZhDMJ0UjvmVQFdRbjUCOrne28Yp
        Zl8kpK1wNi3oqDy8Z3rfVQAFrQ7g4dI/0laZj0KLvEUxuWu8KdEL9++TbnkumYGc7e8+nfa/5HD
        X5GuM1q6u3Tp9JqSHUYHMDv8zzH+/ToH61WKNUiOlxJvwHw==
X-Received: by 2002:ac2:5310:: with SMTP id c16mr1146923lfh.580.1637633743784;
        Mon, 22 Nov 2021 18:15:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy5F3fLTnFecDRwlbxWQoSLXoV9918xgCV7czUaBFIpkdKJC7LiNweYTTTLyK3IrQGG25LnISfSApYTs8M+AAs=
X-Received: by 2002:ac2:5310:: with SMTP id c16mr1146901lfh.580.1637633743597;
 Mon, 22 Nov 2021 18:15:43 -0800 (PST)
MIME-Version: 1.0
References: <20211122160812.25125-1-arnaud.pouliquen@foss.st.com>
In-Reply-To: <20211122160812.25125-1-arnaud.pouliquen@foss.st.com>
From:   Jason Wang <jasowang@redhat.com>
Date:   Tue, 23 Nov 2021 10:15:32 +0800
Message-ID: <CACGkMEsQVVMx_+ezoVZ86xEFuadNOzjwcNBnv+-h-pE0JnXhxw@mail.gmail.com>
Subject: Re: [PATCH] rpmsg: virtio: don't let virtio core to validate used length
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        "Michael S . Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Nov 23, 2021 at 12:08 AM Arnaud Pouliquen
<arnaud.pouliquen@foss.st.com> wrote:
>
> For RX virtqueue, the used length is validated in all the three paths
> (big, small and mergeable). For control vq, we never tries to use used
> length. So this patch forbids the core to validate the used length.

If I understand the code correctly, the function that calls
virtqueue_get_buf() ares:

rpmsg_recv_done()
get_a_tx_buf()

So it looks to me like the above change log needs some tweak? (It
looks like a copy from the virtio-net patch).

The codes are fine.

Thanks

>
> Without patch the rpmsg client sample does not work.
>
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
>         .feature_table_size = ARRAY_SIZE(features),
>         .driver.name    = KBUILD_MODNAME,
>         .driver.owner   = THIS_MODULE,
> +       .suppress_used_validation = true,
>         .id_table       = id_table,
>         .probe          = rpmsg_probe,
>         .remove         = rpmsg_remove,
> --
> 2.17.1
>

