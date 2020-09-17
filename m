Return-Path: <SRS0=Or6o=C2=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33130C43461
	for <linux-remoteproc@archiver.kernel.org>; Thu, 17 Sep 2020 19:16:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D76F3206C9
	for <linux-remoteproc@archiver.kernel.org>; Thu, 17 Sep 2020 19:16:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CREaOxf0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725882AbgIQTQK (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 17 Sep 2020 15:16:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728394AbgIQQSo (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 17 Sep 2020 12:18:44 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11D0BC06121E
        for <linux-remoteproc@vger.kernel.org>; Thu, 17 Sep 2020 09:09:37 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id 60so2415656otw.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 17 Sep 2020 09:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=EpwgO2gE232MQ8MlmE9oGUJ2SqqC1OkAKiHLBPpysXo=;
        b=CREaOxf0kmFXuOoQR8BoDazJ9PauASn2hhUtueJmHKUzGZIMo3Ku0zwjy+44ikxHGQ
         jk37ySD4ZiQ8GQGyARaRhw2O94qzKeXxNsXdu6FyyGVPw2XPEV1xk7oxHJ+ZlP+gcWVP
         OgLYU81pbMSjlgquQ2oHnYV9j7hwL/zoyF4JsVKImTcm3348Gqh4eLshHr1H0VXGdwOW
         rfpBHNBInXkrYmadwYOl4Rs22EPCVy5JTaI+niPxnBnsw/LY38yTEw8UDFxgk9XUtRqj
         jTz2qkmmeGX7qm7n2/cqzU/gSmD2PE5LbO5BTpG3Yc+x1bss77NWd0rn4PrS6oKO71hI
         hpNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EpwgO2gE232MQ8MlmE9oGUJ2SqqC1OkAKiHLBPpysXo=;
        b=nVJwL2xKidQt461Zo65CbWwhq97hoTfPwrOGBZocxkIA1RsPQWQ1wwYQ518SKcSoAN
         IdQUahhZVyWBkkuPRvjue5qJYKDTy/la2in7QpYlZivvjd6QCqwPhQkO+8wCm8FdqrWW
         ccRnMRFjJGz2VZu4Sg+NJzr4JBhZelMwmXNTucoj31R5Sw0jZIbUrbs7vpvnXwprIHw6
         TQf+l40PIdKfy0jef20yDbtvObQ6ZyQPLmySQuHIqct7NMl9KvVnNE1IJCQVaI7DuKrd
         ftOA3I14fjMBbKIFVQipc2jZLDKZpNyc69KaK12YWo+R3bOgRATtVRfwTjkEc7A8Ei49
         kPTQ==
X-Gm-Message-State: AOAM530VL0VHvC7xbM9CN4rIFW/HWNO+/Dkrp0FTi5ulC6RNQcD0YWxh
        d+cgaQqQqNZYcXa4KC2RuhadCQ==
X-Google-Smtp-Source: ABdhPJz6dpPUOs9zY2r2UAdlGLE+UGCQulYBlk4T3lLoPIPgRjUzAdpgzKBUersByMvs+M3l/UuKsg==
X-Received: by 2002:a05:6830:1518:: with SMTP id k24mr19291103otp.21.1600358977119;
        Thu, 17 Sep 2020 09:09:37 -0700 (PDT)
Received: from yoga ([2605:6000:e5cb:c100:7cad:6eff:fec8:37e4])
        by smtp.gmail.com with ESMTPSA id c14sm241959ooi.9.2020.09.17.09.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 09:09:36 -0700 (PDT)
Date:   Thu, 17 Sep 2020 11:09:32 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Alexandre Courbot <acourbot@chromium.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        "open list:REMOTE PROCESSOR REMOTEPROC SUBSYSTEM" 
        <linux-remoteproc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: Re: [PATCH RESEND RESEND] remoteproc: scp: add COMPILE_TEST
 dependency
Message-ID: <20200917160932.GP1893@yoga>
References: <20200915012911.489820-1-acourbot@chromium.org>
 <20200915032529.GA7762@uller>
 <CAPBb6MXGGn-QGZvCycfMNO-PW_pBhi+B0QWoa=iESBp1P-eZrw@mail.gmail.com>
 <20200917141320.1a1bb9df@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200917141320.1a1bb9df@coco.lan>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu 17 Sep 07:13 CDT 2020, Mauro Carvalho Chehab wrote:

> Em Tue, 15 Sep 2020 12:43:26 +0900
> Alexandre Courbot <acourbot@chromium.org> escreveu:
> 
> > On Tue, Sep 15, 2020 at 12:25 PM Bjorn Andersson
> > <bjorn.andersson@linaro.org> wrote:
> > >
> > > On Tue 15 Sep 01:29 UTC 2020, Alexandre Courbot wrote:
> > >  
> > > > This will improve this driver's build coverage.
> > > >
> > > > Reported-by: Ezequiel Garcia <ezequiel@collabora.com>
> > > > Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> > > > ---
> > > > Hi remoteproc maintainers,
> > > >
> > > > Second resend as I got no reaction for almost 1 month on this one-liner.  
> > >
> > > Sorry about that. I fell behind on my inbox and have missed your
> > > previous attempts.
> > >
> > > This has now been applied.  
> > 
> > No worries, thanks for the quick response.
> > 
> > Mauro, the patch is applied on
> > https://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc.git/commit/?id=5185e3a9dc2d68bb52e3e12400428aa060b87733,
> > will it work for you to merge this into the media tree and apply the
> > pull request on top?
> > 
> > >
> > > Regards,
> > > Bjorn
> > >  
> > > > Pretty please?
> > > >
> > > > As explained in
> > > > https://www.spinics.net/lists/linux-media/msg175991.html, we need this
> > > > patch in order to merge a driver series in the media tree. If that
> > > > looks ok to you, can we pull it in the media tree along with the series
> > > > that depends on it?
> > > >
> > > >  drivers/remoteproc/Kconfig | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> > > > index c6659dfea7c7..d1fcada71017 100644
> > > > --- a/drivers/remoteproc/Kconfig
> > > > +++ b/drivers/remoteproc/Kconfig
> > > > @@ -43,7 +43,7 @@ config INGENIC_VPU_RPROC
> > > >
> > > >  config MTK_SCP
> > > >       tristate "Mediatek SCP support"
> > > > -     depends on ARCH_MEDIATEK
> > > > +     depends on ARCH_MEDIATEK || COMPILE_TEST
> > > >       select RPMSG_MTK_SCP
> > > >       help
> > > >         Say y here to support Mediatek's System Companion Processor (SCP) via
> 
> Bjorn/Alexandre,
> 
> Can I just cherry-pick the patch from:
> 
> 	https://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc.git/commit/?id=5185e3a9dc2d68bb52e3e12400428aa060b87733
> 
> Adding it on my tree before the patches that require it?
> 
> If aren't there any other changes for "config MTK_SCP",
> this is the easiest way for me, as I won't need to pull from
> a stable branch from your tree and wait for your patches to
> reach upstream, before sending a tree branch with such changes.
> 

I don't see anything that would cause a merge conflicts here, so that
should be fine. And perhaps we should just have picked it through your
tree from the beginning then.

Feel free to add my:

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn
