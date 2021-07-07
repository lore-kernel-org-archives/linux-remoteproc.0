Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1F6DC07E9C
	for <linux-remoteproc@archiver.kernel.org>; Wed,  7 Jul 2021 15:56:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B388B61CC3
	for <linux-remoteproc@archiver.kernel.org>; Wed,  7 Jul 2021 15:56:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231685AbhGGP7W (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 7 Jul 2021 11:59:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232066AbhGGP7W (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 7 Jul 2021 11:59:22 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA63DC06175F
        for <linux-remoteproc@vger.kernel.org>; Wed,  7 Jul 2021 08:56:40 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id n99-20020a9d206c0000b029045d4f996e62so2694244ota.4
        for <linux-remoteproc@vger.kernel.org>; Wed, 07 Jul 2021 08:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=WClwSt7qahvqLc8S6VDs1WktQFeBcnd4I5Z/KAvSJ6Q=;
        b=GyPnJFzj+FIqG12dqeMSz1D9H82hgXeeY6o8amJ/3QfGWrTW4vSslOfhmU4s265og4
         4a/phVm7uLymyPOgZEKrAo2pPTxZY6KiABRTT2K2Oe5eBRkr13AjCK0pJbiCNf1mxUf8
         K11PfK+ll5Wy5zOuGyUA2tNVUdswfBDDzCPMVy7clx4q4/HT71MYtctP1wx116Lr/mbS
         1RLYuxFd7FEDvT1nfoSi6tSYf/KSTz/skS0EUZtfgnXMIva00UiLerPqpuCV+IuHeDyU
         +OzLVycLqe0kBai9Lyf3DoVqTJ/eNbhNzlenLDXJWml9pZb6MlCatuNQ63CG2liw/PLe
         RhSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WClwSt7qahvqLc8S6VDs1WktQFeBcnd4I5Z/KAvSJ6Q=;
        b=qbHp3sC7WdesY5JTA0PYwfbyU8NzX3EtP2AwIrO3gDNxgTC011ibdjHevLBH8J08un
         LU8Q48aIkftzpIDtC63P9ZELeX19sQyfTTER5PTy895qCW53nhqKzHpZFmCpqPZgT5ZF
         +SLb3jyTXa3A6UZ0XjZKKlA9D67FG7G7GtDBkuO3C6ji0v1VyqDGrnEctqUuUA3IlUqh
         sEKwn9XoWn02rGG2WxAF6zKXDNjgKQIiWqaFcSE+XAaLbk9ZbUs2OqanTJF+ne5LeYIp
         PKuDt6A1HwB/O0doSCgCc6w8EdH+y/Bw7x27L/3fSJc5jCcRf/yPEG/wTqPagZXs460D
         Xluw==
X-Gm-Message-State: AOAM533Km9AlRJldC65LjhswIx+qiOPQXLuE0PVS6t1Q+HPYwUEJoEFx
        7Kob0RlUnmTGfMgSNMfYZ9UywQ==
X-Google-Smtp-Source: ABdhPJw0G2ZxbJQpJmRGIvwWpv4+5espexq+AeG21C4eJk5hnEYITZ0VBJFViyGAMDy2IV7iwV+cwQ==
X-Received: by 2002:a9d:6c07:: with SMTP id f7mr14025619otq.50.1625673400158;
        Wed, 07 Jul 2021 08:56:40 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id o20sm3504649ook.40.2021.07.07.08.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jul 2021 08:56:39 -0700 (PDT)
Date:   Wed, 7 Jul 2021 10:56:37 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Deepak Kumar Singh <deesin@codeaurora.org>,
        Chris Lew <clew@codeaurora.org>,
        Mathieu <mathieu.poirier@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-remoteproc@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH V7 0/4] Signaling api support in glink/rpmsg clients
Message-ID: <YOXOtRSpKO5WdlHZ@yoga>
References: <1599063847-2347-1-git-send-email-deesin@codeaurora.org>
 <CAF2Aj3gAqjVbcMayR7yYBb6UxY5ekC9gdhpmNdz1-zLwo10yLw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF2Aj3gAqjVbcMayR7yYBb6UxY5ekC9gdhpmNdz1-zLwo10yLw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue 06 Jul 10:27 CDT 2021, Lee Jones wrote:

> On Wed, 2 Sept 2020 at 17:25, Deepak Kumar Singh <deesin@codeaurora.org>
> wrote:
> 
> > Change from version 6
> > In last series(v6) i had put wrong version(v5) for cover note.
> > Which led to confusion for patch set series.
> >
> > In this series i have updated the label for cover letter(v7).
> > There is no change in patches. Only cover note label is updated.
> >
> > Change from version 5
> > [V6,4/4] rpmsg: char: Add signal callback and POLLPRI support
> > Updated for sparse warning. Replaced POLLPRI => EPOLLPRI to fix
> > warning.
> >
> > Change from version 4
> > I am taking over these patches from aneela@codeaurora.org
> > Fixed all the trivial review comments.
> >
> > Signal conversion to and from native signal as done in patch V4,2/4
> > is intentional.
> >
> > Arun Kumar Neelakantam (3):
> >   rpmsg: glink: Add support to handle signals command
> >   rpmsg: char: Add TIOCMGET/TIOCMSET ioctl support
> >   rpmsg: char: Add signal callback and POLLPRI support
> >
> > Deepak Kumar Singh (1):
> >   rpmsg: core: Add signal API support
> >
> >  drivers/rpmsg/qcom_glink_native.c | 125
> > ++++++++++++++++++++++++++++++++++++++
> >  drivers/rpmsg/rpmsg_char.c        |  76 ++++++++++++++++++++++-
> >  drivers/rpmsg/rpmsg_core.c        |  40 ++++++++++++
> >  drivers/rpmsg/rpmsg_internal.h    |   5 ++
> >  include/linux/rpmsg.h             |  27 ++++++++
> >  5 files changed, 270 insertions(+), 3 deletions(-)
> >
> > --
> > The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> > a Linux Foundation Collaborative Project
> >
> >
> Any idea why this died at v7?
> 

I had some concerns about the actual users of this and wanted the API to
be more generic. Deepak brought this up again recently and I think we
have a common understanding of how v8 should look like.

Regards,
Bjorn
