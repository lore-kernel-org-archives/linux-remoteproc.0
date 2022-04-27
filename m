Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1171BC433F5
	for <linux-remoteproc@archiver.kernel.org>; Wed, 27 Apr 2022 14:38:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238337AbiD0OlX (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 27 Apr 2022 10:41:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238427AbiD0OlU (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 27 Apr 2022 10:41:20 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 905C733E1A
        for <linux-remoteproc@vger.kernel.org>; Wed, 27 Apr 2022 07:37:58 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id i19so3792242eja.11
        for <linux-remoteproc@vger.kernel.org>; Wed, 27 Apr 2022 07:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Bp4nvCVNUoCNEAKvKfnnGKwiKlXJzQznkSn+Xrwkfm0=;
        b=MhMHiFv6IziSDkdNlh2UkxZ6wRadtQURhNooR20okqyWTqd2+czoeWuBhz0z4JWzm8
         D14A391nTFsO7zVvvx68QGBFV/NOikeIxpN3XqZJczoNMYIaJUUeSeasMMd31dP0x4yz
         HAHkEH/ctSv3WhVSG4cQx1OEqpCyiyr1jKS9XAn8ktOm8kgEyzvseAsBYBpB9+LMuoZl
         Oc7jIsPs+Ji4y7A79TbeEByv2p4W2COBmGrtXw7KkVbhO3Q5qvacwutoKX53YUG81m/B
         cLitJrR/sKOPueb/Er8XqOnIr3YzTOYxjeLUWGAzANVG7pwKUvFsaq7ewf82X0ralNxK
         uZzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Bp4nvCVNUoCNEAKvKfnnGKwiKlXJzQznkSn+Xrwkfm0=;
        b=jbm0oka+C+Geub45V1DQVOaNfajQeySDZhYgxOKUWvEWKkzf1d8nciFVA/EpjmhVu2
         o82kkLac7kMtULgvZdOfJb9LbGxBxjR9qClr+IU/fQVUC/T0Va+7O3EamYSdKj9u1l7J
         HbV3KnlEAo2iCiSmie3WHXW1CFiNtRHdLF6D2U9mfHKm7aap0VNvIrHzYNE4gcGLSS1g
         RAPOzxqpnXZtUqUO/1EThPZTA39x3YsAl6xPBqJeoUIuzKH7jrTOkzx9DVbnskwsypLi
         d45ERgwdR51eMwLagD25ATGlBMIzCemxY5nuRtSWtYTQ/nPluZ8a7633G+z9OFUNIrYZ
         FVlw==
X-Gm-Message-State: AOAM533UTwX8kuXeUy7dalNsfMRUhUQoZe10MV6u77EPVZ8kueXDZZ34
        7e/z3XP/cEzKNdgfCFPUZaRRRrcJWuh+MpaiI1uF/A==
X-Google-Smtp-Source: ABdhPJx/b1z9pzoC8wsJhdzRIvOPilfrnLEqVf6eXmNt9pExpQjAD0KJZeU/Mw5BgndZemcvxbOMWpKWQSi9IhO4Dcc=
X-Received: by 2002:a17:907:9506:b0:6da:b4cd:515b with SMTP id
 ew6-20020a170907950600b006dab4cd515bmr26917366ejc.602.1651070274544; Wed, 27
 Apr 2022 07:37:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220426060536.15594-1-hbh25y@gmail.com> <20220426060536.15594-4-hbh25y@gmail.com>
 <20220426165613.GA2007637@p14s> <55c946ad-5d19-1d38-3484-1ab059a27642@gmail.com>
In-Reply-To: <55c946ad-5d19-1d38-3484-1ab059a27642@gmail.com>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Wed, 27 Apr 2022 08:37:42 -0600
Message-ID: <CANLsYkx7fB1O001cPLZbidDLmWyobb2zmhEX23naef7kb-RcAw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] rpmsg: virtio: Fix the unregistration of the
 device rpmsg_ctrl
To:     Hangyu Hua <hbh25y@gmail.com>
Cc:     bjorn.andersson@linaro.org, arnaud.pouliquen@foss.st.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, 26 Apr 2022 at 20:50, Hangyu Hua <hbh25y@gmail.com> wrote:
>
> On 2022/4/27 00:56, Mathieu Poirier wrote:
> > On Tue, Apr 26, 2022 at 02:05:36PM +0800, Hangyu Hua wrote:
> >> Unregister the rpmsg_ctrl device instead of just freeing the
> >> the virtio_rpmsg_channel structure.
> >> This will properly unregister the device and call
> >> virtio_rpmsg_release_device() that frees the structure.
> >>
> >> Fixes: c486682ae1e2 ("rpmsg: virtio: Register the rpmsg_char device")
> >> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> >> Cc: Hangyu Hua <hbh25y@gmail.com>
> >> Reviewed-by: Hangyu Hua <hbh25y@gmail.com>
> >> ---
> >>   drivers/rpmsg/virtio_rpmsg_bus.c | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> >> index 291fc1cfab7f..485e95f506df 100644
> >> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> >> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> >> @@ -862,7 +862,7 @@ static void rpmsg_virtio_del_ctrl_dev(struct rpmsg_device *rpdev_ctrl)
> >>   {
> >>      if (!rpdev_ctrl)
> >>              return;
> >> -    kfree(to_virtio_rpmsg_channel(rpdev_ctrl));
> >> +    device_unregister(&rpdev_ctrl->dev);
> >
> > The author of this patch should have been Arnaud, something I have fixed before
> > applying this set.
> >
> > Thanks,
> > Mathieu
> >
>
> I get it. I'm sorry i thought Signed-off-by and a description in cover
> letter are enough to express. Do i need to do anything else?

I don't.

>
> Thanks,
> Hangyu
> >>   }
> >>
> >>   static int rpmsg_probe(struct virtio_device *vdev)
> >> --
> >> 2.25.1
> >>
