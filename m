Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A9CBC433E0
	for <linux-remoteproc@archiver.kernel.org>; Thu,  4 Mar 2021 00:50:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E106864F6C
	for <linux-remoteproc@archiver.kernel.org>; Thu,  4 Mar 2021 00:50:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232120AbhCDAt4 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 3 Mar 2021 19:49:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235954AbhCCQbv (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 3 Mar 2021 11:31:51 -0500
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51D4CC061761
        for <linux-remoteproc@vger.kernel.org>; Wed,  3 Mar 2021 08:30:55 -0800 (PST)
Received: by mail-pf1-x430.google.com with SMTP id w18so16625459pfu.9
        for <linux-remoteproc@vger.kernel.org>; Wed, 03 Mar 2021 08:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fKljbwfHwY1Q+a6Bd/pUMmBfSKv+s+Xw9X7kH0d2WEg=;
        b=Xu6XuARpMfA3MfTXHyS/oX63X0r/+u1oimMoD1xemgbqLWHasDk+ZFfc4Z5dkT7rCp
         lPoTUMVpeMJghNHXCjqbixUw+xCsOV7etRsvosNzWYlfVrEmDHqZaeyOhCHFE7EZOyS/
         vgIl/FLTQtzX8UCPmSsKNpL7mPtpphfPQfbaolC+GPWdgPmzWnZW/JA8H2K0avWS1K5K
         5lDUx4KD4RVIIRktXb8a2/NejYNpeqZomQVruK3ciT/JWqI/D7c2zP/NKeV/kOYRCoMQ
         IYgh1gJkP+L1mYM1j0r9SZgbcWCPpB4ql+/51Ess+tU/vHdvM2lkrp9252A+eD6Fp7CD
         fOwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fKljbwfHwY1Q+a6Bd/pUMmBfSKv+s+Xw9X7kH0d2WEg=;
        b=Td0r+JKLfVZ1vRcPvEYA8qrFx+FvG1hZoCsluEukcP/3BZxG2jzmQvY7rmtFQCePoA
         dKNh5nqIMDZgop/iVKGM+m1o/36QQU8yajRHiHILaBHQ0Aryw25pNLS6NS9eznFlZY3+
         TLnTZQQiKR8UzHvClyae+VMw32jgF55ETpKMY9wqgyP0gTqVjwCKp+Oa7b8kXYQzz6AL
         gOahbP15vX/PRWb4OfU1UHhD5iTfK5J2B9oACzdh1gHAgpPpTU1NISyJ/4lzNDmZdipZ
         kNWGYWpcgeChUE1IuZ+KX7A61M9qUAVCXGaBCBSLysT2dgFLYCDzmr1fm3JvZ9RT1ALA
         nDfg==
X-Gm-Message-State: AOAM5310AmLvT/HrWHbGpEVOBBGSfAWI3fugYXCElY3foLnKAeFRq84F
        esS1dNl/4mZ5rJ9HUjD6wq+Q4w==
X-Google-Smtp-Source: ABdhPJxxmCFDZNZZaOv7U8dH/eyo0FSPkLIDG8Vga5V/IFMI6Z3enEbj6AcIKqX2ivy17VPO0P3m8A==
X-Received: by 2002:a65:6441:: with SMTP id s1mr23881369pgv.368.1614789054587;
        Wed, 03 Mar 2021 08:30:54 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id q23sm25090951pfn.213.2021.03.03.08.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 08:30:53 -0800 (PST)
Date:   Wed, 3 Mar 2021 09:30:51 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Andy Gross <agross@kernel.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v5 04/16] rpmsg: char: export eptdev create an destroy
 functions
Message-ID: <20210303163051.GA3817330@xps15>
References: <20210219111501.14261-1-arnaud.pouliquen@foss.st.com>
 <20210219111501.14261-5-arnaud.pouliquen@foss.st.com>
 <20210302175702.GA3791957@xps15>
 <4b361c08-09ad-b353-4896-97af3edfc9c6@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4b361c08-09ad-b353-4896-97af3edfc9c6@foss.st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Mar 03, 2021 at 02:22:36PM +0100, Arnaud POULIQUEN wrote:
> Hi Mathieu,
> 
> On 3/2/21 6:57 PM, Mathieu Poirier wrote:
> > Good morning,
> > 
> > I have started to review this set - comments will be staggered over several
> > days.
> > 
> > On Fri, Feb 19, 2021 at 12:14:49PM +0100, Arnaud Pouliquen wrote:
> >> To prepare the split code related to the control and the endpoint
> >> devices in separate files:
> >> - suppress the dependency with the rpmsg_ctrldev struct,
> >> - rename and export the functions in rpmsg_char.h.
> >>
> >> Suggested-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> >> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> >> ---
> >>  drivers/rpmsg/rpmsg_char.c | 22 ++++++++++------
> >>  drivers/rpmsg/rpmsg_char.h | 51 ++++++++++++++++++++++++++++++++++++++
> >>  2 files changed, 66 insertions(+), 7 deletions(-)
> >>  create mode 100644 drivers/rpmsg/rpmsg_char.h
> >>
> >> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> >> index 9e33b53bbf56..78a6d19fdf82 100644
> >> --- a/drivers/rpmsg/rpmsg_char.c
> >> +++ b/drivers/rpmsg/rpmsg_char.c
> >> @@ -1,5 +1,6 @@
> >>  // SPDX-License-Identifier: GPL-2.0
> >>  /*
> >> + * Copyright (C) 2021, STMicroelectronics
> >>   * Copyright (c) 2016, Linaro Ltd.
> >>   * Copyright (c) 2012, Michal Simek <monstr@monstr.eu>
> >>   * Copyright (c) 2012, PetaLogix
> >> @@ -22,6 +23,7 @@
> >>  #include <linux/uaccess.h>
> >>  #include <uapi/linux/rpmsg.h>
> >>  
> >> +#include "rpmsg_char.h"
> >>  #include "rpmsg_internal.h"
> >>  
> >>  #define RPMSG_DEV_MAX	(MINORMASK + 1)
> >> @@ -78,7 +80,7 @@ struct rpmsg_eptdev {
> >>  	wait_queue_head_t readq;
> >>  };
> >>  
> >> -static int rpmsg_eptdev_destroy(struct device *dev, void *data)
> >> +static int rpmsg_eptdev_destroy(struct device *dev)
> >>  {
> >>  	struct rpmsg_eptdev *eptdev = dev_to_eptdev(dev);
> >>  
> >> @@ -277,7 +279,7 @@ static long rpmsg_eptdev_ioctl(struct file *fp, unsigned int cmd,
> >>  	if (cmd != RPMSG_DESTROY_EPT_IOCTL)
> >>  		return -EINVAL;
> >>  
> >> -	return rpmsg_eptdev_destroy(&eptdev->dev, NULL);
> >> +	return rpmsg_eptdev_destroy(&eptdev->dev);
> >>  }
> >>  
> >>  static const struct file_operations rpmsg_eptdev_fops = {
> >> @@ -336,10 +338,15 @@ static void rpmsg_eptdev_release_device(struct device *dev)
> >>  	kfree(eptdev);
> >>  }
> >>  
> >> -static int rpmsg_eptdev_create(struct rpmsg_ctrldev *ctrldev,
> >> +int rpmsg_chrdev_eptdev_destroy(struct device *dev, void *data)
> >> +{
> >> +	return rpmsg_eptdev_destroy(dev);
> >> +}
> >> +EXPORT_SYMBOL(rpmsg_chrdev_eptdev_destroy);
> > 
> > Below we have rpmsg_chrdev_create_eptdev() so it would make sense to have
> > rpmsg_chrdev_destroy_ept().
> > 
> > I would also rename rpmsg_eptdev_destroy() to rpmsg_chrdev_destroy_ept() and
> > export that symbol rather than introducing a function that only calls another
> > one.  You did exactly that for rpmsg_chrdev_create_eptdev().
> 
> This function is used in rpmsg_ctrl to remove eptdev devices.
> As device_for_each_child request a specific function prototype I do not only
> export but change function prototype.
> 
> I can squash all in one function but that means that the "data" parameter is
> just always unused.

The @data parameter in rpmsg_eptdev_destroy() is currently unused so nothing
changes.

> 
> > 
> >> +
> >> +int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent,
> >>  			       struct rpmsg_channel_info chinfo)
> >>  {
> >> -	struct rpmsg_device *rpdev = ctrldev->rpdev;
> >>  	struct rpmsg_eptdev *eptdev;
> >>  	struct device *dev;
> >>  	int ret;
> >> @@ -359,7 +366,7 @@ static int rpmsg_eptdev_create(struct rpmsg_ctrldev *ctrldev,
> >>  
> >>  	device_initialize(dev);
> >>  	dev->class = rpmsg_class;
> >> -	dev->parent = &ctrldev->dev;
> >> +	dev->parent = parent;
> >>  	dev->groups = rpmsg_eptdev_groups;
> >>  	dev_set_drvdata(dev, eptdev);
> >>  
> >> @@ -402,6 +409,7 @@ static int rpmsg_eptdev_create(struct rpmsg_ctrldev *ctrldev,
> >>  
> >>  	return ret;
> >>  }
> >> +EXPORT_SYMBOL(rpmsg_chrdev_create_eptdev);
> >>  
> >>  static int rpmsg_ctrldev_open(struct inode *inode, struct file *filp)
> >>  {
> >> @@ -441,7 +449,7 @@ static long rpmsg_ctrldev_ioctl(struct file *fp, unsigned int cmd,
> >>  	chinfo.src = eptinfo.src;
> >>  	chinfo.dst = eptinfo.dst;
> >>  
> >> -	return rpmsg_eptdev_create(ctrldev, chinfo);
> >> +	return rpmsg_chrdev_create_eptdev(ctrldev->rpdev, &ctrldev->dev, chinfo);
> > 
> > Not sure why we have to change the signature of rpmsg_eptdev_create() but I may
> > find an answer to that question later on in the patchset.
> 
> Here I need to break dependency with rpmsg_ctrldev that will move to the
> rpmsg_ctrl.c. rpmsg_eptdev_create doesn't need it but just parent devices to be
> attached to.

So you don't want to have instances of struct rpmsg_ctrldev in rpmsg_char.c .
Ok, that's a valid point.

> 
> I will add more explicit information about this, in the commit message.
> 
> Thanks,
> Arnaud
> 
> > 
> >>  };
> >>  
> >>  static const struct file_operations rpmsg_ctrldev_fops = {
> >> @@ -527,7 +535,7 @@ static void rpmsg_chrdev_remove(struct rpmsg_device *rpdev)
> >>  	int ret;
> >>  
> >>  	/* Destroy all endpoints */
> >> -	ret = device_for_each_child(&ctrldev->dev, NULL, rpmsg_eptdev_destroy);
> >> +	ret = device_for_each_child(&ctrldev->dev, NULL, rpmsg_chrdev_eptdev_destroy);
> >>  	if (ret)
> >>  		dev_warn(&rpdev->dev, "failed to nuke endpoints: %d\n", ret);
> >>  
> >> diff --git a/drivers/rpmsg/rpmsg_char.h b/drivers/rpmsg/rpmsg_char.h
> >> new file mode 100644
> >> index 000000000000..0feb3ea9445c
> >> --- /dev/null
> >> +++ b/drivers/rpmsg/rpmsg_char.h
> >> @@ -0,0 +1,51 @@
> >> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> >> +/*
> >> + * Copyright (C) STMicroelectronics 2021.
> >> + */
> >> +
> >> +#ifndef __RPMSG_CHRDEV_H__
> >> +#define __RPMSG_CHRDEV_H__
> >> +
> >> +#if IS_ENABLED(CONFIG_RPMSG_CHAR)
> >> +/**
> >> + * rpmsg_chrdev_create_eptdev() - register char device based on an endpoint
> >> + * @rpdev:  prepared rpdev to be used for creating endpoints
> >> + * @parent: parent device
> >> + * @chinfo: assiated endpoint channel information.
> >> + *
> >> + * This function create a new rpmsg char endpoint device to instantiate a new
> >> + * endpoint based on chinfo information.
> >> + */
> >> +int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent,
> >> +			       struct rpmsg_channel_info chinfo);
> >> +
> >> +/**
> >> + * rpmsg_chrdev_eptdev_destroy() - destroy created char device
> >> + * @data: parent device
> >> + * @chinfo: assiated endpoint channel information.
> >> + *
> >> + * This function create a new rpmsg char endpoint device to instantiate a new
> >> + * endpoint based on chinfo information.
> >> + */
> >> +int rpmsg_chrdev_eptdev_destroy(struct device *dev, void *data);
> >> +
> >> +#else  /*IS_ENABLED(CONFIG_RPMSG_CHAR) */
> >> +
> >> +static inline int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev,
> >> +					     struct device *parent,
> >> +					     struct rpmsg_channel_info chinfo)
> >> +{
> >> +	return -EINVAL;
> >> +}
> >> +
> >> +static inline int rpmsg_chrdev_eptdev_destroy(struct device *dev, void *data)
> >> +{
> >> +	/* This shouldn't be possible */
> >> +	WARN_ON(1);
> >> +
> >> +	return 0;
> >> +}
> >> +
> >> +#endif /*IS_ENABLED(CONFIG_RPMSG_CHAR) */
> >> +
> >> +#endif /*__RPMSG_CHRDEV_H__ */
> >> -- 
> >> 2.17.1
> >>
