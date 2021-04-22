Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6872C433B4
	for <linux-remoteproc@archiver.kernel.org>; Thu, 22 Apr 2021 16:30:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 99D1B61405
	for <linux-remoteproc@archiver.kernel.org>; Thu, 22 Apr 2021 16:30:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236459AbhDVQah (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 22 Apr 2021 12:30:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236287AbhDVQag (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 22 Apr 2021 12:30:36 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D56BFC06138B
        for <linux-remoteproc@vger.kernel.org>; Thu, 22 Apr 2021 09:30:00 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id z16so33202414pga.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 22 Apr 2021 09:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=lawUhVx9LR46HLNkgQQFO/GOkSvOeBnJpjIhoUiGAmk=;
        b=zOb1ZqmyjqfRgKrvImrowtblh/NqTMIxecp9KwjFIl9DxkV+g0OSssOeAWSgYE0H0L
         Jj67CSgdFlhrs1BsMVwPy2lkzMaRQ62P8HJ9BvuhASOVmhwv5vpqep+s0LCKjbBNOS0Y
         8dAZUR0SbwS8ZslK+3x/MS13LY4brdiu6zfypKP6tsE4x6Tv+lvuxIe7SPN8j9wyZhMV
         dZr2C+Owl6oCenmul2s78g3z0dWgQsQHsgMYf8fHRf/6KfBq0aDhkKIwnsKbUSCwqfYR
         sC6Cvs5TElJECaz8M60fCb05EFBEkiliQ18/RuEwDmZtq6fOTxyHXOYV6Bb1hawL14dh
         ht8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lawUhVx9LR46HLNkgQQFO/GOkSvOeBnJpjIhoUiGAmk=;
        b=PXe2p9tk8oZVd+xdiUOLyPhhV4m0UznWLBlL/isOpSAkH9yb6KJ3M+SzukLoHAZ8Bn
         VQup0p4iCvTJJEQjZjQ57KUfyblSnUs88CPzZg8krow46iuw5f3F73PaiUwiytuxQHsi
         VM0KDUEJXHwJFBSEItphK/eQVe3p9HOjZ43vDPSXgdyg/DDvFnfwgvdbn9seoGFeCD2a
         dWoVBtIQtzaY3CRZC3Ujb7pjr4/2n+2asxWDWTh35ShHOKKcBPjWv4OlNhQz3yhoXKgu
         3S+LH0ACE1LymzPTTSDdMZW/JmuP3VlCSfu+WpPqz3j+7yaiIJwwFnyt0ytVV5GhS6lU
         3F3w==
X-Gm-Message-State: AOAM530JRtQaYG6WOKQR2Q4iZ6UiITvM9dR3oWqtNIe6hTDsPjhmB56q
        aE3IDUL5n+/PpAul8470sCqxuQ==
X-Google-Smtp-Source: ABdhPJwLZ3ebjK10BDA7X7/KdCYCJe6XxXNF+n1qD9PU9mP4Lb1CxfXBout7AKoRhJWiDadrdMEWgA==
X-Received: by 2002:a62:be12:0:b029:24e:ba53:aaa4 with SMTP id l18-20020a62be120000b029024eba53aaa4mr4187067pff.63.1619109000321;
        Thu, 22 Apr 2021 09:30:00 -0700 (PDT)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id lx11sm2653572pjb.27.2021.04.22.09.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Apr 2021 09:29:59 -0700 (PDT)
Date:   Thu, 22 Apr 2021 10:29:58 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 1/7] rpmsg: char: Export eptdev create an destroy
 functions
Message-ID: <20210422162958.GA1256950@xps15>
References: <20210413134458.17912-1-arnaud.pouliquen@foss.st.com>
 <20210413134458.17912-2-arnaud.pouliquen@foss.st.com>
 <20210421175219.GD1223348@xps15>
 <b5231124-a09f-ba2f-9246-3bfd4dfd39c4@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b5231124-a09f-ba2f-9246-3bfd4dfd39c4@foss.st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, Apr 22, 2021 at 09:55:47AM +0200, Arnaud POULIQUEN wrote:
> hello Mathieu
> 
> On 4/21/21 7:52 PM, Mathieu Poirier wrote:
> > On Tue, Apr 13, 2021 at 03:44:52PM +0200, Arnaud Pouliquen wrote:
> >> To prepare the split of the code related to the control (ctrldev)
> >> and the endpoint (eptdev) devices in 2 separate files:
> >>
> >> - Rename and export the functions in rpmsg_char.h.
> >>
> >> - Suppress the dependency with the rpmsg_ctrldev struct in the
> >>   rpmsg_chrdev_create_eptdev function.
> >>
> >> - The rpmsg class is provided as parameter in rpmsg_chrdev_create_eptdev,
> >>   because the class is associated to the control part.
> >>
> >> Suggested-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> >> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> >> ---
> >>  drivers/rpmsg/rpmsg_char.c | 19 +++++++++------
> >>  drivers/rpmsg/rpmsg_char.h | 50 ++++++++++++++++++++++++++++++++++++++
> >>  2 files changed, 61 insertions(+), 8 deletions(-)
> >>  create mode 100644 drivers/rpmsg/rpmsg_char.h
> >>
> >> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> >> index 2bebc9b2d163..b9df8dc4365f 100644
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
> >> +int rpmsg_chrdev_destroy_eptdev(struct device *dev, void *data)
> > 
> > Shouldn't this be rpmsg_chrdev_eptdev_destroy()?  I've been wondering about the
> > flipping of destroy and eptdev...  The same for rpmsg_chrdev_create_eptdev().
> 
> As the function is exported i prefered to follow name srtructure that is
> commonly used: <module>_<action>_<object>
> 
> But it is not a rule, so please just tell me if you prefer that i rename the
> functions  rpmsg_chrdev_eptdev_xxxx?

I'd prefer rpmsg_chrdev_eptdev_create/destroy() since we are already familiar
with that terminology.

> 
> Thanks,
> Arnaud
> 
> > 
> > With that:
> > 
> > Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > 
> >>  {
> >>  	struct rpmsg_eptdev *eptdev = dev_to_eptdev(dev);
> >>  
> >> @@ -97,6 +99,7 @@ static int rpmsg_eptdev_destroy(struct device *dev, void *data)
> >>  
> >>  	return 0;
> >>  }
> >> +EXPORT_SYMBOL(rpmsg_chrdev_destroy_eptdev);
> >>  
> >>  static int rpmsg_ept_cb(struct rpmsg_device *rpdev, void *buf, int len,
> >>  			void *priv, u32 addr)
> >> @@ -280,7 +283,7 @@ static long rpmsg_eptdev_ioctl(struct file *fp, unsigned int cmd,
> >>  	if (cmd != RPMSG_DESTROY_EPT_IOCTL)
> >>  		return -EINVAL;
> >>  
> >> -	return rpmsg_eptdev_destroy(&eptdev->dev, NULL);
> >> +	return rpmsg_chrdev_destroy_eptdev(&eptdev->dev, NULL);
> >>  }
> >>  
> >>  static const struct file_operations rpmsg_eptdev_fops = {
> >> @@ -339,10 +342,9 @@ static void rpmsg_eptdev_release_device(struct device *dev)
> >>  	kfree(eptdev);
> >>  }
> >>  
> >> -static int rpmsg_eptdev_create(struct rpmsg_ctrldev *ctrldev,
> >> -			       struct rpmsg_channel_info chinfo)
> >> +int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent,
> >> +			       struct rpmsg_channel_info chinfo, struct class *rpmsg_class)
> >>  {
> >> -	struct rpmsg_device *rpdev = ctrldev->rpdev;
> >>  	struct rpmsg_eptdev *eptdev;
> >>  	struct device *dev;
> >>  	int ret;
> >> @@ -362,7 +364,7 @@ static int rpmsg_eptdev_create(struct rpmsg_ctrldev *ctrldev,
> >>  
> >>  	device_initialize(dev);
> >>  	dev->class = rpmsg_class;
> >> -	dev->parent = &ctrldev->dev;
> >> +	dev->parent = parent;
> >>  	dev->groups = rpmsg_eptdev_groups;
> >>  	dev_set_drvdata(dev, eptdev);
> >>  
> >> @@ -405,6 +407,7 @@ static int rpmsg_eptdev_create(struct rpmsg_ctrldev *ctrldev,
> >>  
> >>  	return ret;
> >>  }
> >> +EXPORT_SYMBOL(rpmsg_chrdev_create_eptdev);
> >>  
> >>  static int rpmsg_ctrldev_open(struct inode *inode, struct file *filp)
> >>  {
> >> @@ -444,7 +447,7 @@ static long rpmsg_ctrldev_ioctl(struct file *fp, unsigned int cmd,
> >>  	chinfo.src = eptinfo.src;
> >>  	chinfo.dst = eptinfo.dst;
> >>  
> >> -	return rpmsg_eptdev_create(ctrldev, chinfo);
> >> +	return rpmsg_chrdev_create_eptdev(ctrldev->rpdev, &ctrldev->dev, chinfo, rpmsg_class);
> >>  };
> >>  
> >>  static const struct file_operations rpmsg_ctrldev_fops = {
> >> @@ -530,7 +533,7 @@ static void rpmsg_chrdev_remove(struct rpmsg_device *rpdev)
> >>  	int ret;
> >>  
> >>  	/* Destroy all endpoints */
> >> -	ret = device_for_each_child(&ctrldev->dev, NULL, rpmsg_eptdev_destroy);
> >> +	ret = device_for_each_child(&ctrldev->dev, NULL, rpmsg_chrdev_destroy_eptdev);
> >>  	if (ret)
> >>  		dev_warn(&rpdev->dev, "failed to nuke endpoints: %d\n", ret);
> >>  
> >> diff --git a/drivers/rpmsg/rpmsg_char.h b/drivers/rpmsg/rpmsg_char.h
> >> new file mode 100644
> >> index 000000000000..379d2ae2bee8
> >> --- /dev/null
> >> +++ b/drivers/rpmsg/rpmsg_char.h
> >> @@ -0,0 +1,50 @@
> >> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> >> +/*
> >> + * Copyright (C) STMicroelectronics 2021.
> >> + */
> >> +
> >> +#ifndef __RPMSG_CHRDEV_H__
> >> +#define __RPMSG_CHRDEV_H__
> >> +
> >> +#if IS_REACHABLE(CONFIG_RPMSG_CHAR)
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
> >> +			       struct rpmsg_channel_info chinfo, struct class *rpmsg_class);
> >> +
> >> +/**
> >> + * rpmsg_chrdev_destroy_eptdev() - destroy created char device endpoint.
> >> + * @data: private data associated to the endpoint device
> >> + *
> >> + * This function destroys a rpmsg char endpoint device created by the RPMSG_DESTROY_EPT_IOCTL
> >> + * control.
> >> + */
> >> +int rpmsg_chrdev_destroy_eptdev(struct device *dev, void *data);
> >> +
> >> +#else  /*IS_REACHABLE(CONFIG_RPMSG_CHAR) */
> >> +
> >> +static inline int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent,
> >> +					     struct rpmsg_channel_info chinfo,
> >> +					     struct class *rpmsg_class)
> >> +{
> >> +	return -EINVAL;
> >> +}
> >> +
> >> +static inline int rpmsg_chrdev_destroy_eptdev(struct device *dev, void *data)
> >> +{
> >> +	/* This shouldn't be possible */
> >> +	WARN_ON(1);
> >> +
> >> +	return 0;
> >> +}
> >> +
> >> +#endif /*IS_REACHABLE(CONFIG_RPMSG_CHAR) */
> >> +
> >> +#endif /*__RPMSG_CHRDEV_H__ */
> >> -- 
> >> 2.17.1
> >>
