Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77C54C07E96
	for <linux-remoteproc@archiver.kernel.org>; Thu,  8 Jul 2021 11:20:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 52F536161F
	for <linux-remoteproc@archiver.kernel.org>; Thu,  8 Jul 2021 11:20:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231559AbhGHLXW (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 8 Jul 2021 07:23:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231540AbhGHLXW (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 8 Jul 2021 07:23:22 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EDF3C061574
        for <linux-remoteproc@vger.kernel.org>; Thu,  8 Jul 2021 04:20:40 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id t14-20020a05600c198eb029020c8aac53d4so17836180wmq.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 08 Jul 2021 04:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=rFpDh7TVWZtaM5cs5d5LHXdV3TqKZpl99EHToFRBjzg=;
        b=Xnx0zHtsBOr98Vo5otxRILu0ikPe61GOmG7rqmRqh6XT1bOJdVJQUkn/kfK5NHZLFj
         ILsIVMYUoB2BuY9g9N1vz7NeLQdZmo/8dRhc2KmGnt2tPFsdKhR2UhQtCAQ6M3/U66oq
         3r4gTgizmGVOusPMoP4ysDG8SVE3/Byj0f1XW82bsvdXD32AjSTJ7garNje6lGn+zdRJ
         XvHgLbHXZJ5NpA0RBUjadOXEZypLMHGHQXzj2TYzJqFoPWs3LQHc8tjnH9ooR2Jd/GH7
         VdcpEIoZIEUZmshI80KVdwMJ/ldb6QXV/+8hZ5Ej5YcgQpeTreLwsO0dgLy6aRN7CpVs
         aPBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=rFpDh7TVWZtaM5cs5d5LHXdV3TqKZpl99EHToFRBjzg=;
        b=R9+PsTRzg2jch4Ftwm7k9ArMG5v4yy2NnNu3DMR3+GILexdjqXiH185pVIDvBTB45o
         gJj0IPJxzw98bhugNqZgFhjY+wnWgYpvWZsTsPcw4qOZcWPLwLmrVeyRkP0HogiKH/SC
         mvlv/AI/9j1w7sue3nMy/4RIaT8LgD+Rhu8GWolK0AML9LHfwlZGHITaAyHhVoZuOQnF
         Vk+Zdc8tknbTE19jlHBtKYL0PcntbpcLCPE9Qv7g5Q4iihG0oTnUOk11xZynMmKpiIMj
         X0VuBif8Tyl6CmThj8bwQpOeWumvojLxpV1IhOL3tOQIUW8+W+tpwPmxIa/TzsKD4iLS
         SE1A==
X-Gm-Message-State: AOAM532Obcuzyk1d5rGVBSfGZllickX6LC3Cq95wdVRf0j6tdE7rFYIO
        s9/scZPnamr+bHCbepLNfsTTeQ==
X-Google-Smtp-Source: ABdhPJx6exO8vO9udBHYfA8ebFe4eoju6SLYXTu4Sfdz7wzxhRRjMepfAj0J4wx5/njHb2XblKOFiw==
X-Received: by 2002:a1c:4603:: with SMTP id t3mr2262634wma.178.1625743238929;
        Thu, 08 Jul 2021 04:20:38 -0700 (PDT)
Received: from google.com ([109.180.115.218])
        by smtp.gmail.com with ESMTPSA id o11sm1711710wmq.1.2021.07.08.04.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jul 2021 04:20:38 -0700 (PDT)
Date:   Thu, 8 Jul 2021 11:20:36 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Deepak Kumar Singh <deesin@codeaurora.org>,
        Chris Lew <clew@codeaurora.org>,
        Mathieu <mathieu.poirier@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-remoteproc@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH V7 0/4] Signaling api support in glink/rpmsg clients
Message-ID: <YObfhBXAu6g5S3ws@google.com>
References: <1599063847-2347-1-git-send-email-deesin@codeaurora.org>
 <CAF2Aj3gAqjVbcMayR7yYBb6UxY5ekC9gdhpmNdz1-zLwo10yLw@mail.gmail.com>
 <YOXOtRSpKO5WdlHZ@yoga>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YOXOtRSpKO5WdlHZ@yoga>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, 07 Jul 2021, Bjorn Andersson wrote:

> On Tue 06 Jul 10:27 CDT 2021, Lee Jones wrote:
> 
> > On Wed, 2 Sept 2020 at 17:25, Deepak Kumar Singh <deesin@codeaurora.org>
> > wrote:
> > 
> > > Change from version 6
> > > In last series(v6) i had put wrong version(v5) for cover note.
> > > Which led to confusion for patch set series.
> > >
> > > In this series i have updated the label for cover letter(v7).
> > > There is no change in patches. Only cover note label is updated.
> > >
> > > Change from version 5
> > > [V6,4/4] rpmsg: char: Add signal callback and POLLPRI support
> > > Updated for sparse warning. Replaced POLLPRI => EPOLLPRI to fix
> > > warning.
> > >
> > > Change from version 4
> > > I am taking over these patches from aneela@codeaurora.org
> > > Fixed all the trivial review comments.
> > >
> > > Signal conversion to and from native signal as done in patch V4,2/4
> > > is intentional.
> > >
> > > Arun Kumar Neelakantam (3):
> > >   rpmsg: glink: Add support to handle signals command
> > >   rpmsg: char: Add TIOCMGET/TIOCMSET ioctl support
> > >   rpmsg: char: Add signal callback and POLLPRI support
> > >
> > > Deepak Kumar Singh (1):
> > >   rpmsg: core: Add signal API support
> > >
> > >  drivers/rpmsg/qcom_glink_native.c | 125
> > > ++++++++++++++++++++++++++++++++++++++
> > >  drivers/rpmsg/rpmsg_char.c        |  76 ++++++++++++++++++++++-
> > >  drivers/rpmsg/rpmsg_core.c        |  40 ++++++++++++
> > >  drivers/rpmsg/rpmsg_internal.h    |   5 ++
> > >  include/linux/rpmsg.h             |  27 ++++++++
> > >  5 files changed, 270 insertions(+), 3 deletions(-)
> > >
> > >
> > >
> > Any idea why this died at v7?
> > 
> 
> I had some concerns about the actual users of this and wanted the API to
> be more generic. Deepak brought this up again recently and I think we
> have a common understanding of how v8 should look like.

Okay, great.

Deepak, would you be kind enough to Cc me on the next submission please?

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
