Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BB11C433FE
	for <linux-remoteproc@archiver.kernel.org>; Tue,  2 Nov 2021 16:38:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 79D9860EE9
	for <linux-remoteproc@archiver.kernel.org>; Tue,  2 Nov 2021 16:38:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234618AbhKBQlN (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 2 Nov 2021 12:41:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235013AbhKBQk0 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 2 Nov 2021 12:40:26 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C9AFC0432F3
        for <linux-remoteproc@vger.kernel.org>; Tue,  2 Nov 2021 09:36:53 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id v40-20020a056830092800b0055591caa9c6so22561833ott.4
        for <linux-remoteproc@vger.kernel.org>; Tue, 02 Nov 2021 09:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Hm1s1/+vcD/eENdvDXhNAAKv0AXEzr2FBFBpPoaluhc=;
        b=FvXnExitK3HslLrf7rUdnG9+Lr+7sI0WE4F0fC1+thajKo07qBSz+9fH2rldHchIxl
         1fsdt33UBZ5uXA4s21yFTysAVnUL/xhCDOKR/U2XJe+A++WyVuTk2fjCCC/zQUP1SBQl
         7zXznhLV+XdBBhwfdaA4D+koqwz41rnuG4S4m4bnfGCBf72Z8EBkz3tejpw51rL7/Rij
         QlLCIhPIhhYVyYvukk5n/88YM6obUt4I2Sw1fkhO8T9pnkMam6xa4MXBlZviZxW6PW0L
         0vA6wzVsErPT8/bnoLL9sBWsb0a6nC/F4mJW+e34wnfizShZnp4Iv3M8+2HGtmddl1+h
         31Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Hm1s1/+vcD/eENdvDXhNAAKv0AXEzr2FBFBpPoaluhc=;
        b=z1EUTKFKoKRlLgYVDxTFIlOgdLBiAf3AIBEkhalFj0KgaL6nQxDt93uyLgDO9DD5AZ
         eYf5E6L8yaUkeQyyjekApzg4d+vixuvjvWnaulW6dzvt8x5ZNuQP3v2GypSRpfeGvggS
         hWwrdVyghoWjZsp77K9GF6/7ZVK/ZdZouPCT1Z/a74osdb1RwilpfNHBIYEzdct94Ea4
         6pwa9lI7pbNjcIqbLYYfWWn0VMnayJbVb4/Q2q6ss2Bmcdff/fxDecc3LkMawif+RuLb
         +YJS54eqOrIwbSbU45BIkv0sCKAawAb21tJrSWFwPJR0+kV1xF+VDckWsU39gRJKwcQb
         opfQ==
X-Gm-Message-State: AOAM530+QhBJH9cN7j8Mm96H5+bj/dwSnvrGEA5B8TSQ3ptZ7drn0mD6
        b7C7vEAMnjyl93Ix8pJwvQJrrw==
X-Google-Smtp-Source: ABdhPJwImzdHUnfzXZUwIbmB7Ar4uCodc97YlCqozA49KiW587cp4yzswjeQNxlDu+Tw+UoLzjw+aw==
X-Received: by 2002:a05:6830:1516:: with SMTP id k22mr15770258otp.280.1635871012666;
        Tue, 02 Nov 2021 09:36:52 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id q11sm1938274ota.54.2021.11.02.09.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 09:36:52 -0700 (PDT)
Date:   Tue, 2 Nov 2021 09:38:34 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, julien.massot@iot.bzh
Subject: Re: [PATCH v6 02/10] rpmsg: create the rpmsg class in core instead
 of in rpmsg char
Message-ID: <YYFpit0SixojReo+@ripper>
References: <20211022125426.2579-1-arnaud.pouliquen@foss.st.com>
 <20211022125426.2579-3-arnaud.pouliquen@foss.st.com>
 <YYAcYLxEmbwJShg7@builder.lan>
 <962ca426-5cc4-4adb-df55-27fe93f7e767@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <962ca426-5cc4-4adb-df55-27fe93f7e767@foss.st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue 02 Nov 08:23 PDT 2021, Arnaud POULIQUEN wrote:

> 
> 
> On 11/1/21 5:57 PM, Bjorn Andersson wrote:
> > On Fri 22 Oct 07:54 CDT 2021, Arnaud Pouliquen wrote:
> > 
> >> Migrate the creation of the rpmsg class from the rpmsg_char
> >> to the core that the class is usable by all rpmsg services.
> >>
> >> Suggested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> >> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> >> ---
> >>  drivers/rpmsg/rpmsg_char.c | 14 ++------------
> >>  drivers/rpmsg/rpmsg_core.c | 26 ++++++++++++++++++++++++--
> >>  include/linux/rpmsg.h      | 10 ++++++++++
> >>  3 files changed, 36 insertions(+), 14 deletions(-)
> >>
> >> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> >> index 941c5c54dd72..327ed739a3a7 100644
> >> --- a/drivers/rpmsg/rpmsg_char.c
> >> +++ b/drivers/rpmsg/rpmsg_char.c
> >> @@ -28,7 +28,6 @@
> >>  #define RPMSG_DEV_MAX	(MINORMASK + 1)
> >>  
> >>  static dev_t rpmsg_major;
> >> -static struct class *rpmsg_class;
> >>  
> >>  static DEFINE_IDA(rpmsg_ctrl_ida);
> >>  static DEFINE_IDA(rpmsg_ept_ida);
> >> @@ -362,7 +361,7 @@ int rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct device *parent
> >>  	init_waitqueue_head(&eptdev->readq);
> >>  
> >>  	device_initialize(dev);
> >> -	dev->class = rpmsg_class;
> >> +	dev->class = rpmsg_get_class();
> >>  	dev->parent = parent;
> >>  	dev->groups = rpmsg_eptdev_groups;
> >>  	dev_set_drvdata(dev, eptdev);
> >> @@ -482,7 +481,7 @@ static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
> >>  	dev = &ctrldev->dev;
> >>  	device_initialize(dev);
> >>  	dev->parent = &rpdev->dev;
> >> -	dev->class = rpmsg_class;
> >> +	dev->class = rpmsg_get_class();
> >>  
> >>  	cdev_init(&ctrldev->cdev, &rpmsg_ctrldev_fops);
> >>  	ctrldev->cdev.owner = THIS_MODULE;
> >> @@ -558,17 +557,9 @@ static int rpmsg_chrdev_init(void)
> >>  		return ret;
> >>  	}
> >>  
> >> -	rpmsg_class = class_create(THIS_MODULE, "rpmsg");
> >> -	if (IS_ERR(rpmsg_class)) {
> >> -		pr_err("failed to create rpmsg class\n");
> >> -		unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
> >> -		return PTR_ERR(rpmsg_class);
> >> -	}
> >> -
> >>  	ret = register_rpmsg_driver(&rpmsg_chrdev_driver);
> >>  	if (ret < 0) {
> >>  		pr_err("rpmsgchr: failed to register rpmsg driver\n");
> >> -		class_destroy(rpmsg_class);
> >>  		unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
> >>  	}
> >>  
> >> @@ -579,7 +570,6 @@ postcore_initcall(rpmsg_chrdev_init);
> >>  static void rpmsg_chrdev_exit(void)
> >>  {
> >>  	unregister_rpmsg_driver(&rpmsg_chrdev_driver);
> >> -	class_destroy(rpmsg_class);
> >>  	unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
> >>  }
> >>  module_exit(rpmsg_chrdev_exit);
> >> diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
> >> index 9151836190ce..53162038254d 100644
> >> --- a/drivers/rpmsg/rpmsg_core.c
> >> +++ b/drivers/rpmsg/rpmsg_core.c
> >> @@ -20,6 +20,8 @@
> >>  
> >>  #include "rpmsg_internal.h"
> >>  
> >> +static struct class *rpmsg_class;
> >> +
> >>  /**
> >>   * rpmsg_create_channel() - create a new rpmsg channel
> >>   * using its name and address info.
> >> @@ -296,6 +298,19 @@ __poll_t rpmsg_poll(struct rpmsg_endpoint *ept, struct file *filp,
> >>  }
> >>  EXPORT_SYMBOL(rpmsg_poll);
> >>  
> >> +/**
> >> + * rpmsg_get_class() - get reference to the sysfs rpmsg class
> >> + *
> >> + * This function return the pointer to the "rpmsg" class created by the rpmsg core.
> >> + *
> >> + * Returns the struct class pointer
> >> + */
> >> +struct class *rpmsg_get_class(void)
> > 
> > What value does this helper function add? Can't we just expose
> > rpmsg_class directly?
> 
> look to me cleaner to not expose directly the rpmsg_class in rpmsg.h as this
> variable is read only for rpmsg services.
> 

The pointer is read only, but the object isn't. So I think it's cleaner
to just share the pointer in the first place.

But that said, looking at this a little bit more, I don't think there's
any guarantee that class_create() has been executed before
rpmsg_ctrl_probe() is being invoked.

> > 
> >> +{
> >> +	return rpmsg_class;
> >> +}
> >> +EXPORT_SYMBOL(rpmsg_get_class);
[..]
> >> diff --git a/include/linux/rpmsg.h b/include/linux/rpmsg.h
> > 
> > Isn't this just going to be used by rpmsg_char and rpmsg_ctrl? Do we
> > really need to expose it in the client-facing API?
> 
> I based this dev on hypothesis that the class could be used by some other rpmsg
> clients. But it is not mandatory. It can be extended later, on need.
> 

That's a good hypothesis, it might be useful in other places as well.
But I think it's best to keep it local for now and make an explicit
decision about opening up when that need comes.

> What would you propose as an alternative to this API?
> 
> I can see 2 alternatives:
> - Define the rpmsg_class in rpmsg_internal.h
>   In current patchset rpmsg_char.c does not include the rpmsg_internal.h.
>   I'm not sure if this include makes sense for an rpmsg service driver.
> 

rpmsg_ctrl and rpmsg_char are more tightly coupled to rpmsg than typical
rpmsg drivers, so I think it's better to include rpmsg_internal.h than to
open up the API to the clients.

Thanks,
Bjorn

> - Use "extern struct class *rpmsg_class; " in rpmsg_char and rpmsg_ctrl modules
> 
> Regards,
> Arnaud
> 
> > 
> > Regards,
> > Bjorn
> > 
> >> index a8dcf8a9ae88..6fe51549d931 100644
> >> --- a/include/linux/rpmsg.h
> >> +++ b/include/linux/rpmsg.h
> >> @@ -186,6 +186,8 @@ int rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src, u32 dst,
> >>  __poll_t rpmsg_poll(struct rpmsg_endpoint *ept, struct file *filp,
> >>  			poll_table *wait);
> >>  
> >> +struct class *rpmsg_get_class(void);
> >> +
> >>  #else
> >>  
> >>  static inline int rpmsg_register_device(struct rpmsg_device *rpdev)
> >> @@ -296,6 +298,14 @@ static inline __poll_t rpmsg_poll(struct rpmsg_endpoint *ept,
> >>  	return 0;
> >>  }
> >>  
> >> +static inline struct class *rpmsg_get_class(void)
> >> +{
> >> +	/* This shouldn't be possible */
> >> +	WARN_ON(1);
> >> +
> >> +	return NULL;
> >> +}
> >> +
> >>  #endif /* IS_ENABLED(CONFIG_RPMSG) */
> >>  
> >>  /* use a macro to avoid include chaining to get THIS_MODULE */
> >> -- 
> >> 2.17.1
> >>
