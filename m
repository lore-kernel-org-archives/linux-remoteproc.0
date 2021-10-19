Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03A95C433EF
	for <linux-remoteproc@archiver.kernel.org>; Tue, 19 Oct 2021 03:07:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DB01C61175
	for <linux-remoteproc@archiver.kernel.org>; Tue, 19 Oct 2021 03:07:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229692AbhJSDJN (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 18 Oct 2021 23:09:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231938AbhJSDJM (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 18 Oct 2021 23:09:12 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BA98C061745
        for <linux-remoteproc@vger.kernel.org>; Mon, 18 Oct 2021 20:07:00 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id t4so2765553oie.5
        for <linux-remoteproc@vger.kernel.org>; Mon, 18 Oct 2021 20:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ASSGMPImuuIUj7uz+ftmcXorRU78+ZHBGPyjATEUEfo=;
        b=Ox2299nAE1pU/PWKgODFZpHzshOzObJFcqhUd2WPbUovkTzsbAMEPXCV0PorYRCOhs
         3fBSM0TLiv+ZbELS428PdTjFzvmIJw6CJfHflvpW+J0UcqKQf2Y+6p4Fcguvsj2qB/aV
         g7cGaKUeGiVHZy7ay6dutbhy4dMwX/lCDQrDG60mMJTqsFOuAt8DyvQYExXdpypmEHNW
         khiOns6T3xDLtJEJYQ/AO1eKHRNED9iNYvlb0Ng9scxP1QinlRlgdcdF6zpra+dIy1G8
         u4+Tgv+gbk7HtwwhvXaFjKGnwHqinyp5UN1tmrhqstyWaMeKeq7ay4eFqHJqdYh0ZE3s
         6WKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ASSGMPImuuIUj7uz+ftmcXorRU78+ZHBGPyjATEUEfo=;
        b=GC+KDISuAi1L+vi6CNseUbwRfXtdFUfv5mFmNqKTac02Vd/hyUxkjdxTKUztBoUIjO
         yrjSTAH4MamP9cxbuLuoqb6nohAYrFievKXVK/7VfPEqEPm0S0rKvL7qeRWAqRjEcjh8
         4YRWZOPFkCHCoktw7Zg+TlzivXUho0hPo5M+lURPl0zdjdTbqStSjDEWiB3U93xM2aMX
         j6n8Q0d/MtF2dZnlSVnWgEo9WofYXcrD2unBFPVkYO32xrvRAFE9B4/RTGTzROCAf3fr
         OYTq8fWeAA1Ww6iZmBiLslepSUXsyjgUyeS7I5n/F6Ni34AXP8zLylM2E4VFTa09L9qG
         YX9w==
X-Gm-Message-State: AOAM533xm1DV26GvV3cLqT1KxHBdvgIdlrtZw/5+oMo3NBkfkhqmTeX+
        gin47iqD1jyoDB2BqslAsCHcKA==
X-Google-Smtp-Source: ABdhPJy4qDdJNNcQjwuwmXCRWPdhKKHoAauqZHPXMBGZiUgS0AS23J/ZoJi0aKHfopmr9e4hvYvQQw==
X-Received: by 2002:aca:2406:: with SMTP id n6mr2131470oic.28.1634612819796;
        Mon, 18 Oct 2021 20:06:59 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id e23sm3408844oih.40.2021.10.18.20.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Oct 2021 20:06:59 -0700 (PDT)
Date:   Mon, 18 Oct 2021 20:08:46 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v5 3/4] rpmsg: Move the rpmsg control device from
 rpmsg_char to rpmsg_ctrl
Message-ID: <YW42vhByiSG1hhqc@ripper>
References: <20210712123752.10449-1-arnaud.pouliquen@foss.st.com>
 <20210712123752.10449-4-arnaud.pouliquen@foss.st.com>
 <YWDVwArEz5Yub3GJ@ripper>
 <f0696b4d-c0b6-5283-2eda-e5791462cbba@foss.st.com>
 <YWpZMwgWqcPMvL5q@yoga>
 <ffb110dc-bc3b-dbc2-679f-de2416f7b90f@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ffb110dc-bc3b-dbc2-679f-de2416f7b90f@foss.st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon 18 Oct 02:13 PDT 2021, Arnaud POULIQUEN wrote:

> 
> 
> On 10/16/21 6:46 AM, Bjorn Andersson wrote:
> > On Mon 11 Oct 05:46 CDT 2021, Arnaud POULIQUEN wrote:
> > 
> >>
> >>
> >> On 10/9/21 1:35 AM, Bjorn Andersson wrote:
> >>> On Mon 12 Jul 05:37 PDT 2021, Arnaud Pouliquen wrote:
> >>>
> >>>> Create the rpmsg_ctrl.c module and move the code related to the
> >>>> rpmsg_ctrldev device in this new module.
> >>>>
> >>>> Add the dependency between rpmsg_char and rpmsg_ctrl in the
> >>>> kconfig file.
> >>>>
> >>>
> >>> As I said in the cover letter, the only reason I can see for doing this
> >>> refactoring is in relation to the introduction of
> >>> RPMSG_CREATE_DEV_IOCTL. So I would like this patch to go together with
> >>> that patch, together with a good motivation why there's merit to
> >>> creating yet another kernel module (and by bind/unbind can't be used).
> >>>
> >>> Perhaps I'm just missing some good usecase related to this?
> >>
> >>
> >>>
> >>>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> >>>> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> >>>> ---
> >>>>  drivers/rpmsg/Kconfig      |   9 ++
> >>>>  drivers/rpmsg/Makefile     |   1 +
> >>>>  drivers/rpmsg/rpmsg_char.c | 170 +----------------------------
> >>>>  drivers/rpmsg/rpmsg_char.h |   2 +
> >>>>  drivers/rpmsg/rpmsg_ctrl.c | 215 +++++++++++++++++++++++++++++++++++++
> >>>>  5 files changed, 229 insertions(+), 168 deletions(-)
> >>>>  create mode 100644 drivers/rpmsg/rpmsg_ctrl.c
> >>>>
> >>> [..]
> >>>> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> >>> [..]
> >>>> -static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
> >>>> -{
> >>> [..]
> >>>> -	dev = &ctrldev->dev;
> >>>> -	device_initialize(dev);
> >>>> -	dev->parent = &rpdev->dev;
> >>>> -	dev->class = rpmsg_class;
> >>> [..]
> >>>> diff --git a/drivers/rpmsg/rpmsg_ctrl.c b/drivers/rpmsg/rpmsg_ctrl.c
> >>> [..]
> >>>> +static int rpmsg_ctrldev_probe(struct rpmsg_device *rpdev)
> >>>> +{
> >>> [..]
> >>>> +	dev = &ctrldev->dev;
> >>>> +	device_initialize(dev);
> >>>> +	dev->parent = &rpdev->dev;
> >>>
> >>> You lost the assignment of dev->class here, which breaks the udev rules
> >>> we use to invoke rpmsgexport to create endpoints and it causes udevadm
> >>> to complain that rpmsg_ctrlN doesn't have a "subsystem".
> >>
> >> We discussed this point with Mathieu, as a first step i kept the class, but that
> >> generated another dependency with the rpmsg_char device while information was
> >> available on the rpmsg bus. The char device and ctrl device should share the
> >> same class. As rpmsg_ctrl is created first it would have to create the class,and
> >> provide an API to rpmsg char
> >>
> > 
> > Perhaps if this is considered a common piece shared between multiple
> > rpmsg modules we can create such class in the rpmsg "core" itself?
> 
> Yes that seems a good alternative
> 
> > 
> >> Please could you details what does means "rpmsg_ctrlN doesn't have a
> >> "subsystem"." What exactly the udev is looking for? could it base it check on
> >> the /dev/rpmsg_ctrl0 or /sys/bus/rpmsg/devices/...?
> >>
> > 
> > If I read the uevent messages correctly they seem to contain a SUBSYTEM=
> > property when the class is provided. But I'm not sure about the reasons
> > for that.
> 
> If it part of the udev requirement, i suppose that it is mandatory, and in this
> case, declare the class in the core make sense.
> 

I don't know if it's a requirement. But I think it's worth keeping the
class around, as it's the only problem I've found with existing users.

> I will send a new patchset that will squash all the remaining patches, taking
> into account your comment.
> 

Thanks,
Bjorn

> Thanks,
> Arnaud
> 
> > 
> > Regards,
> > Bjorn
> > 
> >> Thanks,
> >> Arnaud
> >>
> >>>
> >>> Regards,
> >>> Bjorn
> >>>
