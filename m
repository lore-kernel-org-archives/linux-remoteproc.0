Return-Path: <SRS0=Or6o=C2=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6543BC433E2
	for <linux-remoteproc@archiver.kernel.org>; Thu, 17 Sep 2020 12:13:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 26B52208DB
	for <linux-remoteproc@archiver.kernel.org>; Thu, 17 Sep 2020 12:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600344833;
	bh=Nbgs0z/6xv+x5U3xdgRyiH/6O+3c4uMDhu4Ye3gQrgo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-ID:From;
	b=zhP238WwrZjmqc17bG26v3FlOy3UUB9PNzYSVPf/SkOICZzfUoEoEpaL2IdPk6S5o
	 KhfwjzSg1WwE5o9mqoFzlsC+e+8Rm9N+J7YnlopL5JppCdIY+0iR7piGIOzhynBGBH
	 4tlgp26gbmN4Byn2dgoV/eCT4+4StAdGq5IUc+M4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726900AbgIQMNk (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 17 Sep 2020 08:13:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:46358 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726792AbgIQMNi (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 17 Sep 2020 08:13:38 -0400
Received: from coco.lan (ip5f5ad5d2.dynamic.kabel-deutschland.de [95.90.213.210])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5A033208DB;
        Thu, 17 Sep 2020 12:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600344804;
        bh=Nbgs0z/6xv+x5U3xdgRyiH/6O+3c4uMDhu4Ye3gQrgo=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Mf933PlCguinwSiUXc7C75dNyDg64TCRFNjAX5zAMEwxK8WVCc7DNZtfjvCGyyNzl
         iCeE6Np2l4wCTHbeTsS9h7i5cxLDc/iSQD+5qqhB0iE1jzreC+oKX3c4+od0hqsenM
         /79QkyIAlbpYTySkCL0y6eZvBqRZ7igl54drWmpU=
Date:   Thu, 17 Sep 2020 14:13:20 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Alexandre Courbot <acourbot@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        "open list:REMOTE PROCESSOR REMOTEPROC SUBSYSTEM" 
        <linux-remoteproc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: Re: [PATCH RESEND RESEND] remoteproc: scp: add COMPILE_TEST
 dependency
Message-ID: <20200917141320.1a1bb9df@coco.lan>
In-Reply-To: <CAPBb6MXGGn-QGZvCycfMNO-PW_pBhi+B0QWoa=iESBp1P-eZrw@mail.gmail.com>
References: <20200915012911.489820-1-acourbot@chromium.org>
        <20200915032529.GA7762@uller>
        <CAPBb6MXGGn-QGZvCycfMNO-PW_pBhi+B0QWoa=iESBp1P-eZrw@mail.gmail.com>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Em Tue, 15 Sep 2020 12:43:26 +0900
Alexandre Courbot <acourbot@chromium.org> escreveu:

> On Tue, Sep 15, 2020 at 12:25 PM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > On Tue 15 Sep 01:29 UTC 2020, Alexandre Courbot wrote:
> >  
> > > This will improve this driver's build coverage.
> > >
> > > Reported-by: Ezequiel Garcia <ezequiel@collabora.com>
> > > Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> > > ---
> > > Hi remoteproc maintainers,
> > >
> > > Second resend as I got no reaction for almost 1 month on this one-liner.  
> >
> > Sorry about that. I fell behind on my inbox and have missed your
> > previous attempts.
> >
> > This has now been applied.  
> 
> No worries, thanks for the quick response.
> 
> Mauro, the patch is applied on
> https://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc.git/commit/?id=5185e3a9dc2d68bb52e3e12400428aa060b87733,
> will it work for you to merge this into the media tree and apply the
> pull request on top?
> 
> >
> > Regards,
> > Bjorn
> >  
> > > Pretty please?
> > >
> > > As explained in
> > > https://www.spinics.net/lists/linux-media/msg175991.html, we need this
> > > patch in order to merge a driver series in the media tree. If that
> > > looks ok to you, can we pull it in the media tree along with the series
> > > that depends on it?
> > >
> > >  drivers/remoteproc/Kconfig | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> > > index c6659dfea7c7..d1fcada71017 100644
> > > --- a/drivers/remoteproc/Kconfig
> > > +++ b/drivers/remoteproc/Kconfig
> > > @@ -43,7 +43,7 @@ config INGENIC_VPU_RPROC
> > >
> > >  config MTK_SCP
> > >       tristate "Mediatek SCP support"
> > > -     depends on ARCH_MEDIATEK
> > > +     depends on ARCH_MEDIATEK || COMPILE_TEST
> > >       select RPMSG_MTK_SCP
> > >       help
> > >         Say y here to support Mediatek's System Companion Processor (SCP) via

Bjorn/Alexandre,

Can I just cherry-pick the patch from:

	https://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc.git/commit/?id=5185e3a9dc2d68bb52e3e12400428aa060b87733

Adding it on my tree before the patches that require it?

If aren't there any other changes for "config MTK_SCP",
this is the easiest way for me, as I won't need to pull from
a stable branch from your tree and wait for your patches to
reach upstream, before sending a tree branch with such changes.

Regards,
Mauro
