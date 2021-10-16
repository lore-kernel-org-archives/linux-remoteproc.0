Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70744C433F5
	for <linux-remoteproc@archiver.kernel.org>; Sat, 16 Oct 2021 04:46:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4BA3760F9D
	for <linux-remoteproc@archiver.kernel.org>; Sat, 16 Oct 2021 04:46:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239593AbhJPEsz (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sat, 16 Oct 2021 00:48:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239502AbhJPEsy (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 16 Oct 2021 00:48:54 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BFCFC061570
        for <linux-remoteproc@vger.kernel.org>; Fri, 15 Oct 2021 21:46:47 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id n63so16102363oif.7
        for <linux-remoteproc@vger.kernel.org>; Fri, 15 Oct 2021 21:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7jdite1hAjXEiglN1UH70+mYHUHBTl0WhHrqA0xqBVg=;
        b=GEvvrOEglTBTjBSOthbUwTbYjTRG5t/LKLUtrMdsVR9ySB/ZMGvIpMMAuVWmcKZ9+Z
         9mTD4QHyn1DUIeZ8poq5abiwHACjcv3WVJFkn8SQyLOPtv6OPU9F12jZbnQFoO0pJ0q6
         nO1Q/GHh/MjQLE5NnYXMgXHp0Q+3rVTYWMFXU2VOtLs5td3Lj4gRIhgfgp6JwXf2FoYo
         RwKMyeH8ij7FazwFYGlp9aA4MBNUP/vJrLP4JzfXa1XVZvt5c4my37i/VznM5eH3YnsG
         cM0YwKwuUT4oIFSQJR31aVdKp6zw8dnzVVCUtjiShcdQrDdtl0aV/K12X/pE8PA0cZAd
         sCiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7jdite1hAjXEiglN1UH70+mYHUHBTl0WhHrqA0xqBVg=;
        b=RxyXTnjNvNwL8qoRIbMFxiow8ZTOkS+PfyFC8lNiK3tgTievczbjVq25UZqWp8SuFk
         7/NGo+l5Cez1U/WnaOucz/tG+9XCwnsEjB8S0FGbTaNMTBbHhQk9Tfl4STNuueUa9w5J
         ZP0sY23iih+YNCKs8B18f03ctd4qwo1O1DlJ9K4Tj+b81B7rrTfk9OvXMVnqLndK/lvF
         a2QKiwtYZtQnBrVsPXIoae6oZQ2pRfcYqHIpvAUjaHkHWFGnE5tE7nHg8NVryZ1vXz/Q
         gGBRKKnM716WKcCSlw9Yogjj+mkREpTvnrJznYQnkRXJygqMJ8of9hUdD1T+AyoSm3Ib
         8tqg==
X-Gm-Message-State: AOAM533VH1fFtrXsqO4Qifd4RR/oeNJIbxe/MqfvbECK8mpEr7/rwLqZ
        BTQ6Xb3tG9+SCKOu9hWgzaD8+A==
X-Google-Smtp-Source: ABdhPJxRkaoIgWmmGlna0G7eFd4BhU04dWuo6pdyE9mW1cyvxr3YbLhbs2DmnBDdXProOc47T9kDtw==
X-Received: by 2002:aca:220d:: with SMTP id b13mr11403295oic.114.1634359606221;
        Fri, 15 Oct 2021 21:46:46 -0700 (PDT)
Received: from yoga ([2600:1700:a0:3dc8:74c9:deff:fe1a:d52c])
        by smtp.gmail.com with ESMTPSA id m4sm1654714otp.1.2021.10.15.21.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 21:46:45 -0700 (PDT)
Date:   Fri, 15 Oct 2021 23:46:43 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v5 3/4] rpmsg: Move the rpmsg control device from
 rpmsg_char to rpmsg_ctrl
Message-ID: <YWpZMwgWqcPMvL5q@yoga>
References: <20210712123752.10449-1-arnaud.pouliquen@foss.st.com>
 <20210712123752.10449-4-arnaud.pouliquen@foss.st.com>
 <YWDVwArEz5Yub3GJ@ripper>
 <f0696b4d-c0b6-5283-2eda-e5791462cbba@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f0696b4d-c0b6-5283-2eda-e5791462cbba@foss.st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon 11 Oct 05:46 CDT 2021, Arnaud POULIQUEN wrote:

> 
> 
> On 10/9/21 1:35 AM, Bjorn Andersson wrote:
> > On Mon 12 Jul 05:37 PDT 2021, Arnaud Pouliquen wrote:
> > 
> >> Create the rpmsg_ctrl.c module and move the code related to the
> >> rpmsg_ctrldev device in this new module.
> >>
> >> Add the dependency between rpmsg_char and rpmsg_ctrl in the
> >> kconfig file.
> >>
> > 
> > As I said in the cover letter, the only reason I can see for doing this
> > refactoring is in relation to the introduction of
> > RPMSG_CREATE_DEV_IOCTL. So I would like this patch to go together with
> > that patch, together with a good motivation why there's merit to
> > creating yet another kernel module (and by bind/unbind can't be used).
> > 
> > Perhaps I'm just missing some good usecase related to this?
> 
> 
> > 
> >> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> >> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> >> ---
> >>  drivers/rpmsg/Kconfig      |   9 ++
> >>  drivers/rpmsg/Makefile     |   1 +
> >>  drivers/rpmsg/rpmsg_char.c | 170 +----------------------------
> >>  drivers/rpmsg/rpmsg_char.h |   2 +
> >>  drivers/rpmsg/rpmsg_ctrl.c | 215 +++++++++++++++++++++++++++++++++++++
> >>  5 files changed, 229 insertions(+), 168 deletions(-)
> >>  create mode 100644 drivers/rpmsg/rpmsg_ctrl.c
> >>
> > [..]
> >> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> > [..]
> >> -static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
> >> -{
> > [..]
> >> -	dev = &ctrldev->dev;
> >> -	device_initialize(dev);
> >> -	dev->parent = &rpdev->dev;
> >> -	dev->class = rpmsg_class;
> > [..]
> >> diff --git a/drivers/rpmsg/rpmsg_ctrl.c b/drivers/rpmsg/rpmsg_ctrl.c
> > [..]
> >> +static int rpmsg_ctrldev_probe(struct rpmsg_device *rpdev)
> >> +{
> > [..]
> >> +	dev = &ctrldev->dev;
> >> +	device_initialize(dev);
> >> +	dev->parent = &rpdev->dev;
> > 
> > You lost the assignment of dev->class here, which breaks the udev rules
> > we use to invoke rpmsgexport to create endpoints and it causes udevadm
> > to complain that rpmsg_ctrlN doesn't have a "subsystem".
> 
> We discussed this point with Mathieu, as a first step i kept the class, but that
> generated another dependency with the rpmsg_char device while information was
> available on the rpmsg bus. The char device and ctrl device should share the
> same class. As rpmsg_ctrl is created first it would have to create the class,and
> provide an API to rpmsg char
> 

Perhaps if this is considered a common piece shared between multiple
rpmsg modules we can create such class in the rpmsg "core" itself?

> Please could you details what does means "rpmsg_ctrlN doesn't have a
> "subsystem"." What exactly the udev is looking for? could it base it check on
> the /dev/rpmsg_ctrl0 or /sys/bus/rpmsg/devices/...?
> 

If I read the uevent messages correctly they seem to contain a SUBSYTEM=
property when the class is provided. But I'm not sure about the reasons
for that.

Regards,
Bjorn

> Thanks,
> Arnaud
> 
> > 
> > Regards,
> > Bjorn
> > 
