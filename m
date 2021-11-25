Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DBCAC433EF
	for <linux-remoteproc@archiver.kernel.org>; Thu, 25 Nov 2021 02:18:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230060AbhKYCVK (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 24 Nov 2021 21:21:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21877 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238726AbhKYCTJ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 24 Nov 2021 21:19:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1637806558;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=r72uMhfjIYSF88TaYdiXECmLl0Mii7SWfOdaVyCFTl8=;
        b=HbyZjPq+41l6L8F+jq+XC6xRXJiaUwhToVpOC+t4zG3MW1+AnzDosR3TDj6kFlm8nIqaXY
        CU8HOC86/isAQVug5oLmU/bAR0DsF2ievmtvq1JKprfAQHpcq9sH4zsq0t/m+0TL7EcA0j
        YvG9pRzTvppC615kJPM5BIeXcaE4SjE=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-149-77FD4V9vMQGumzy55k-rBg-1; Wed, 24 Nov 2021 21:15:57 -0500
X-MC-Unique: 77FD4V9vMQGumzy55k-rBg-1
Received: by mail-lf1-f71.google.com with SMTP id 24-20020ac25f58000000b0041799ebf529so2362102lfz.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 24 Nov 2021 18:15:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=r72uMhfjIYSF88TaYdiXECmLl0Mii7SWfOdaVyCFTl8=;
        b=sTXS4QWmJzF4JSDJxiR5YCj5PZCBq0pidVLPrxrAMSeWmkVpvF3nTo52HPBK+/PJBg
         EjMawb9tekaR9EreL9jPSXepMw9bfQpFPxs+pWf7hjLf4/0JWFiSYE8GMtWbl4kYYne2
         5/2SCGSMgxrJ/us/sYzQIJlAy2etqVKpDnlLMph38kXNpxa904y9blV1NWW7LxeqcQKB
         difc/mOuSD+NY/wqtWQd+wtNhLAuma3Uo7YqaG6elscn47nSSPWoNlZ5T5wZHiaThTjJ
         vOmFwmB9XqkHoda6BTYt9XfU27g+idXOEvq9NaCv+gy3US9wIon3zQ2RKs1C7nuTZqGv
         O+KA==
X-Gm-Message-State: AOAM532c7pQuwi8uq5j5KBj8ffDK5+UMfEayAop2elbNyDATiPdA3xAU
        c+B73TCqDjK3odLBNO7MB7Xw0dqUkufllBFg1JOvADfGY2MGnm9bDir2x4daQv+meWQ7+fhuncQ
        PKnVG8WuQmidfyxjh0Q3tnxst3Qvg3MYku1f2R2CX7zU5vQ==
X-Received: by 2002:a2e:b88d:: with SMTP id r13mr20998302ljp.362.1637806556014;
        Wed, 24 Nov 2021 18:15:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzT9Fnm7W7ku4KzzgyNbW6baOBfxN7dV9GBC3FZtP+i7ldmgANqMnbMbrg7KLgP/dpEX9CSqxPFFGj2DzWKb3k=
X-Received: by 2002:a2e:b88d:: with SMTP id r13mr20998288ljp.362.1637806555830;
 Wed, 24 Nov 2021 18:15:55 -0800 (PST)
MIME-Version: 1.0
References: <20211124162045.25983-1-arnaud.pouliquen@foss.st.com> <20211124161055-mutt-send-email-mst@kernel.org>
In-Reply-To: <20211124161055-mutt-send-email-mst@kernel.org>
From:   Jason Wang <jasowang@redhat.com>
Date:   Thu, 25 Nov 2021 10:15:44 +0800
Message-ID: <CACGkMEvQoUcPFgOTvEDGkZHMXhjhPrk0xq-Zq3+G20_Lp-hu8A@mail.gmail.com>
Subject: Re: [PATCH v2] rpmsg: virtio: don't let virtio core to validate used length
To:     "Michael S. Tsirkin" <mst@redhat.com>
Cc:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
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

On Thu, Nov 25, 2021 at 5:12 AM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Wed, Nov 24, 2021 at 05:20:45PM +0100, Arnaud Pouliquen wrote:
> > Using OpenAMP library on remote side, when the rpmsg framework tries to
> > reuse the buffer the following error message is displayed in
> > the virtqueue_get_buf_ctx_split function:
> > "virtio_rpmsg_bus virtio0: output:used len 28 is larger than in buflen 0"
> >
> > As described in virtio specification:
> > "many drivers ignored the len value, as a result, many devices set len
> > incorrectly. Thus, when using the legacy interface, it is generally
> > a good idea to ignore the len value in used ring entries if possible."
> >
> > To stay in compliance with the legacy libraries, this patch prevents the
> > virtio core from validating used length.
> >
> > Fixes: 939779f5152d ("virtio_ring: validate used buffer length")
> >
> > Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> > Cc: Jason Wang <jasowang@redhat.com>
> > Cc: Michael S. Tsirkin <mst@redhat.com>
> > ---
>
> Arnaud, thanks a lot for the analysis.
>
> Jason, I think this is another good point. We really should not
> validate input for legacy devices at all.

I agree. Will do that in the next version.

Thanks

>
>
> > Update vs v1[1]: update commit message to clarify the context.
> >
> > base-commit: fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf
> >
> > [1]https://lore.kernel.org/lkml/20211122160812.25125-1-arnaud.pouliquen@foss.st.com/T/
> > ---
> >  drivers/rpmsg/virtio_rpmsg_bus.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> > index 9c112aa65040..5f73f19c2c38 100644
> > --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> > +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> > @@ -1054,6 +1054,7 @@ static struct virtio_driver virtio_ipc_driver = {
> >       .feature_table_size = ARRAY_SIZE(features),
> >       .driver.name    = KBUILD_MODNAME,
> >       .driver.owner   = THIS_MODULE,
> > +     .suppress_used_validation = true,
> >       .id_table       = id_table,
> >       .probe          = rpmsg_probe,
> >       .remove         = rpmsg_remove,
> > --
> > 2.17.1
>

