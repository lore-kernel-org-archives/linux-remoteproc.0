Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 869B4C433EF
	for <linux-remoteproc@archiver.kernel.org>; Wed, 24 Nov 2021 02:12:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240674AbhKXCPi (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 23 Nov 2021 21:15:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51430 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240652AbhKXCPe (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 23 Nov 2021 21:15:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1637719945;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=cHuWTYdtSIPzZHFaKqJwWvyGZC39PbxUEyp53nqBMwc=;
        b=OQzx4cFwtr8hgDJO2FtLJhvZm8kx9w+dUFtDXKPowbq07BXTXCzG3ZpIBgIwNGq1sC/Noy
        FgBJclZjvwRGLIPzom69e4HVKkmBx4OZizXEdRbqOthXjp12h3r3gPxJIoVNUgZKir8cbD
        I5UbDPXM0RBVI+/f7xSyLMtBR9/8wRg=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-437-NCojMXxTMGGAVTTFwX6aFA-1; Tue, 23 Nov 2021 21:12:23 -0500
X-MC-Unique: NCojMXxTMGGAVTTFwX6aFA-1
Received: by mail-lf1-f69.google.com with SMTP id s18-20020ac25c52000000b004016bab6a12so573929lfp.21
        for <linux-remoteproc@vger.kernel.org>; Tue, 23 Nov 2021 18:12:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cHuWTYdtSIPzZHFaKqJwWvyGZC39PbxUEyp53nqBMwc=;
        b=bmaUXhROeDy0VTjpM2O+hEH1i7AzxF+iwAeukxyFmQD6V4DKA4xkfFMUEiZ7NXdak3
         MbhjZ7C/SivrpJH74WO9TE4K4FANd/wizTN05RxSA+O/yXJTWa/XAjrsV6Q3wSBwd+tF
         rsensMXmFU+gT9Fv3ZczUeOeJWjF/3qtP33lY65jh4Qt9n37QTIGxGnkeM+Ssmr7O3h6
         4vJ8hyrELCnRE2kvqf+txWRVwV9av9Aax/Jy1qnSCeZqB0ZqrVWXH8TWoU2nXyoFj71c
         I6P/hj24UKxR3O2YoZ5zWxjYh0rarPv179R0ioJRgAyBIES92tEGSFoS5j4bUHy7RcBO
         DTfw==
X-Gm-Message-State: AOAM530kHk/OCkZaqYzNLz98ExugdbjNZ/naSMaTL7RCszuhGm0phc+A
        SRpB808UoiUNBu/dntx6vStgCQrtPa2+zjUIVq5SndYqClzrHgm8heGNtlD6yrFGDMMxRBGUU7i
        Luy45ni9mvaMVVnuATPs28Qj5hR7vlfIRSSzk/mEsmFa7yw==
X-Received: by 2002:a05:6512:2081:: with SMTP id t1mr10481853lfr.348.1637719942289;
        Tue, 23 Nov 2021 18:12:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyJeEKFCopfpyRB/TX2750LgtrsQYYGCgCoSciJIStnUHkOBPXhj0IjwWIHrugsFvaDl47TxsS3au6bWJkBWNE=
X-Received: by 2002:a05:6512:2081:: with SMTP id t1mr10481816lfr.348.1637719942016;
 Tue, 23 Nov 2021 18:12:22 -0800 (PST)
MIME-Version: 1.0
References: <20211122160812.25125-1-arnaud.pouliquen@foss.st.com>
 <20211123011340-mutt-send-email-mst@kernel.org> <43894114-6d25-98fa-a89f-b720749ba910@foss.st.com>
In-Reply-To: <43894114-6d25-98fa-a89f-b720749ba910@foss.st.com>
From:   Jason Wang <jasowang@redhat.com>
Date:   Wed, 24 Nov 2021 10:12:11 +0800
Message-ID: <CACGkMEtC9sD2MX20Q3C3ecWH_TXCQMTS1qDLevKhuv=dyR14sQ@mail.gmail.com>
Subject: Re: [PATCH] rpmsg: virtio: don't let virtio core to validate used length
To:     Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc:     "Michael S. Tsirkin" <mst@redhat.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Nov 23, 2021 at 9:31 PM Arnaud POULIQUEN
<arnaud.pouliquen@foss.st.com> wrote:
>
> Hello Mickael, Jason,
>
> On 11/23/21 7:15 AM, Michael S. Tsirkin wrote:
> > On Mon, Nov 22, 2021 at 05:08:12PM +0100, Arnaud Pouliquen wrote:
> >> For RX virtqueue, the used length is validated in all the three paths
> >> (big, small and mergeable). For control vq, we never tries to use used
> >> length. So this patch forbids the core to validate the used length.
> >
> > Jason commented on this. This is copy paste from virtio net
> > where the change was merely an optimization.
> >
>
> Right, I did it too fast last night (European time) to share the regression as
> soon as possible.
> For that, I copied and pasted the first commit I found related to the problem.
> Need to rework this.
>
> >> Without patch the rpmsg client sample does not work.
> >
> > Hmm that's not enough of a description. Could you please
> > provide more detail? Does rpmsg device set used length to a
> > value > dma read buffer size? what kind of error message
> > do you get? what are the plans to fix the device?
>
> Let's me explain the context.
> I run the rpmsg client sample test to communicate with a remote processor
> that runs a Zephyr FW designed to answer to the Linux kernel driver sample.
>
> The Zephyr is relying on OpenAMP library to implement the RPMsg and VirtIO layers.
>
> In TX direction (Linux to Zephyr) 8 buffers of 512 bytes are allocated.
> The first 8 RPMsg sent are OK. But when virtio loop back the the TX buffer index
> 0 (so already used and free one time) the following error occurs in
> virtqueue_get_buf_ctx_split[1]:
> " virtio_rpmsg_bus virtio0: output:used len 28 is larger than in buflen 0"
>
> I have investigated the problem further today. Here is my analysis
>
> rpmsg_send_offchannel_raw
> -> virtqueue_add_outbuf
>    -> virtqueue_add
>       -> virtqueue_add_split
>          Here we use the "out_sgs" (in_sgs == 0)
>          buflen is not incremented in loop [2]
>          We don't enter in loop [3] as "in_sgs == 0"
>          consequence is that vq->buflen[head] is set to 0 [4]
>
> [1]
> https://elixir.bootlin.com/linux/v5.16-rc2/source/drivers/virtio/virtio_ring.c#L799
> [2]
> https://elixir.bootlin.com/linux/v5.16-rc2/source/drivers/virtio/virtio_ring.c#L551
> [3]
> https://elixir.bootlin.com/linux/v5.16-rc2/source/drivers/virtio/virtio_ring.c#L567
> [4]
> https://elixir.bootlin.com/linux/v5.16-rc2/source/drivers/virtio/virtio_ring.c#L622
>
>
> An alternative to fix the issue is to set buflen in loop 2, but I'm not enough
> expert to ensure that this will not have any side effect...
>
> @@ -559,10 +559,11 @@ static inline int virtqueue_add_split(struct virtqueue *_vq,
>                          * table since it use stream DMA mapping.
>                          */
>                         i = virtqueue_add_desc_split(_vq, desc, i, addr, sg->length,
>                                                      VRING_DESC_F_NEXT,
>                                                      indirect);
> +                       buflen += sg->length;

This is not what spec what:

"Each entry in the ring is a pair: id indicates the head entry of the
descriptor chain describing the buffer (this matches an entry placed
in the available ring by the guest earlier), and len the total of
bytes written into the buffer."

For TX, the used length should be 0.

>                 }
>         }
>         for (; n < (out_sgs + in_sgs); n++) {
>
> So can you tell me if you prefer me to send a V2 updating the commit message or
> a new message to fix virtio_ring (or both)?

See above, for the driver side, the suppress_used_validation is
sufficient. For the device side, it needs to be fixed (0 for TX used
length) too.

Thanks

>
> Thanks,
> Arnaud
>
> >
> >> Fixes: 939779f5152d ("virtio_ring: validate used buffer length")
> >>
> >> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> >> Cc: Jason Wang <jasowang@redhat.com>
> >> Cc: Michael S. Tsirkin <mst@redhat.com>
> >> ---
> >> base-commit: fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf
> >> ---
> >>  drivers/rpmsg/virtio_rpmsg_bus.c | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> >> index 9c112aa65040..5f73f19c2c38 100644
> >> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> >> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> >> @@ -1054,6 +1054,7 @@ static struct virtio_driver virtio_ipc_driver = {
> >>      .feature_table_size = ARRAY_SIZE(features),
> >>      .driver.name    = KBUILD_MODNAME,
> >>      .driver.owner   = THIS_MODULE,
> >> +    .suppress_used_validation = true,
> >>      .id_table       = id_table,
> >>      .probe          = rpmsg_probe,
> >>      .remove         = rpmsg_remove,
> >> --
> >> 2.17.1
> >
>

