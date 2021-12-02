Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BBC1C433EF
	for <linux-remoteproc@archiver.kernel.org>; Thu,  2 Dec 2021 17:00:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359692AbhLBRDk (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 2 Dec 2021 12:03:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359682AbhLBRDj (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 2 Dec 2021 12:03:39 -0500
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2245C06174A
        for <linux-remoteproc@vger.kernel.org>; Thu,  2 Dec 2021 09:00:16 -0800 (PST)
Received: by mail-pg1-x534.google.com with SMTP id s137so335324pgs.5
        for <linux-remoteproc@vger.kernel.org>; Thu, 02 Dec 2021 09:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NJpF2n0u3f+V7LbnqKcCz27brPpeZJOecaGwU3axpi0=;
        b=CiMe61IIzyOL1BdLkQAxHVUenkc57I8TLB0f1Bw9VwRKN3NPdIv/6r4TknCta3x1lI
         i+9oJjkhEOYH9hjYG+ZnlIfdBUh5d+QSjZ9qBO6/lJg+Q3FcEFUwe5pu+R8L9w7HICuD
         AqEQXCbmxpq191HswrrCvq3MvTLqtOv0adbZBd9L+Rr5cWynWnOyNe1hCx4skCUqNd/u
         uhHFW17VS7Wix2xuQBWPV2WqpV3cWEdxbypaZXAqMOUWLAvlwsBarUABz9y3fq9maIZG
         pAv0I308HwItzYIgzVsNCyL5piFKlE6P/tUGVAozP3zXXsu22OSkoNabHrqXG+/j3f2e
         08Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NJpF2n0u3f+V7LbnqKcCz27brPpeZJOecaGwU3axpi0=;
        b=vCSP1Jv4Lfpy42ZDBIIhBdMsg2bvVKlmcXuqRLhFejI0El1EWIkGaeLljBK1IxQSWO
         xU9pfRnf7YOykKAnCRIRVU3aOFjunBMQN7Q3kXOEwP/FjcwIIhLMQ+r9peg9N7hVBiK7
         f/2r6A9h+EE50q4DP64zXOqCsFPXV5/9BTzM+gjH7K8JOswh+stspbj+HMlhrf/Xf7Nx
         DqEMRokrtmoolHjB53nvfVF2su94HhDc7bf06STFwDRHxglrDnlYMa08Lgnt9YkZiKm9
         IDLd204CN1QlKlTzKokePPnp1d9KpeAe/mb2E8Zjyp2nf7kEdiyrU8VeV8vDV0O271g4
         45GQ==
X-Gm-Message-State: AOAM530P0NxM06i7j8yfAHvu+Luq9lyIG2VEahe8BiI0GDPI9Iqb6X1H
        Q5SzvB06mOPb+fss0LZSP9ejdA==
X-Google-Smtp-Source: ABdhPJykaF4uJUYc6GupHBk20usta49lUngRp9G2RsDCMbhgeVs6B+tYMdejk7ROtLxS7brmW4lP0w==
X-Received: by 2002:a63:534d:: with SMTP id t13mr284539pgl.604.1638464416221;
        Thu, 02 Dec 2021 09:00:16 -0800 (PST)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id 66sm180331pgg.63.2021.12.02.09.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 09:00:14 -0800 (PST)
Date:   Thu, 2 Dec 2021 10:00:11 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Jason Wang <jasowang@redhat.com>
Cc:     "Michael S. Tsirkin" <mst@redhat.com>,
        Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-remoteproc@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2] rpmsg: virtio: don't let virtio core to validate used
 length
Message-ID: <20211202170011.GA900071@p14s>
References: <20211124162045.25983-1-arnaud.pouliquen@foss.st.com>
 <20211124161055-mutt-send-email-mst@kernel.org>
 <CACGkMEvQoUcPFgOTvEDGkZHMXhjhPrk0xq-Zq3+G20_Lp-hu8A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACGkMEvQoUcPFgOTvEDGkZHMXhjhPrk0xq-Zq3+G20_Lp-hu8A@mail.gmail.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hey guys,

On Thu, Nov 25, 2021 at 10:15:44AM +0800, Jason Wang wrote:
> On Thu, Nov 25, 2021 at 5:12 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Wed, Nov 24, 2021 at 05:20:45PM +0100, Arnaud Pouliquen wrote:
> > > Using OpenAMP library on remote side, when the rpmsg framework tries to
> > > reuse the buffer the following error message is displayed in
> > > the virtqueue_get_buf_ctx_split function:
> > > "virtio_rpmsg_bus virtio0: output:used len 28 is larger than in buflen 0"
> > >
> > > As described in virtio specification:
> > > "many drivers ignored the len value, as a result, many devices set len
> > > incorrectly. Thus, when using the legacy interface, it is generally
> > > a good idea to ignore the len value in used ring entries if possible."
> > >
> > > To stay in compliance with the legacy libraries, this patch prevents the
> > > virtio core from validating used length.
> > >
> > > Fixes: 939779f5152d ("virtio_ring: validate used buffer length")
> > >
> > > Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> > > Cc: Jason Wang <jasowang@redhat.com>
> > > Cc: Michael S. Tsirkin <mst@redhat.com>
> > > ---
> >
> > Arnaud, thanks a lot for the analysis.
> >
> > Jason, I think this is another good point. We really should not
> > validate input for legacy devices at all.
> 
> I agree. Will do that in the next version.

I'm a little unclear about the "next version" in the above comment - is this
something I should wait for?  Should I move forward with Arnaud's patch?

Thanks,
Mathieu

> 
> Thanks
> 
> >
> >
> > > Update vs v1[1]: update commit message to clarify the context.
> > >
> > > base-commit: fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf
> > >
> > > [1]https://lore.kernel.org/lkml/20211122160812.25125-1-arnaud.pouliquen@foss.st.com/T/
> > > ---
> > >  drivers/rpmsg/virtio_rpmsg_bus.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> > > index 9c112aa65040..5f73f19c2c38 100644
> > > --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> > > +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> > > @@ -1054,6 +1054,7 @@ static struct virtio_driver virtio_ipc_driver = {
> > >       .feature_table_size = ARRAY_SIZE(features),
> > >       .driver.name    = KBUILD_MODNAME,
> > >       .driver.owner   = THIS_MODULE,
> > > +     .suppress_used_validation = true,
> > >       .id_table       = id_table,
> > >       .probe          = rpmsg_probe,
> > >       .remove         = rpmsg_remove,
> > > --
> > > 2.17.1
> >
> 
