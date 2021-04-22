Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42466C433ED
	for <linux-remoteproc@archiver.kernel.org>; Thu, 22 Apr 2021 16:36:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 00BB7613B8
	for <linux-remoteproc@archiver.kernel.org>; Thu, 22 Apr 2021 16:36:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236603AbhDVQhC (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 22 Apr 2021 12:37:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236341AbhDVQhB (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 22 Apr 2021 12:37:01 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AA64C06174A
        for <linux-remoteproc@vger.kernel.org>; Thu, 22 Apr 2021 09:36:25 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id e8-20020a17090a7288b029014e51f5a6baso1284243pjg.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 22 Apr 2021 09:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=bHrSpjoxi7GzA2ZaNPeafU+dF7Tz3gc6DEgzLNKIcQo=;
        b=c+u2ELcovy3fr4Etm23Uo++9pf9NP/AK9ri6yWndwYuUV/l+N8onGmAdCr9SFeUGF0
         1I0IMWjpbi9R5s7axnFu/WuA+q9P9+mgT4NxSG7pjcammnBKaKZv2zDJNwIHXtzw12jL
         QS0GgnXZxPsSy60/gzArLZgGJ0iNay/7gbng1pKXS80YZDhjrtFnh89rRCEczInY0Lto
         yrQ/I9yFMlB0YrWvw/5Y0GJLF2x5Q4FfP8N6f295ZrF4gWNq4cGJZ4aTz5BkG4e+v0Aw
         Ik3xNWP3tQho6N+zz2JR2WTP1eXBGgYNUY9TJAdKmAepMD9cl/auktqVtvgrPsBkEIb0
         bI6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bHrSpjoxi7GzA2ZaNPeafU+dF7Tz3gc6DEgzLNKIcQo=;
        b=pFtErt0EQCNLPJKUxdxVNbvPDDCkdvkOyM+xQ7rFAkOxRUsfB2cq4Iv63ttcvGxmDY
         o4Lp3X6uWaf8LF0vclg8gc4ZOF9meY14WWOI9qws3HF7LlDAON0OjlbWM3f10C18HG6S
         qGGIAlHjv7fpP1WZ1s5qh1zG+w+Ms/TAEN8Urr1bNlJ+6Fn1WrDMfDJWOlsVNGZXSCju
         iNVg0xmUJwJGkhDYWdYw2UgwmwpIKJ+qY+BSto9tCHiWITAaN3cLGs+yy7fyy+e9+xHw
         vXcH1TwWP2z/htZxopBd9yNT72fXT7yga172Xnm0uHLv0E3BWHpx4OKgks49Li7GvGUn
         bZTw==
X-Gm-Message-State: AOAM530s9MpDxGJxcL41n0rYNILTtspZxz9km7a9bKxNTVfilFWuMD0u
        HfnGN97AR8x0ybQT6ffleuveQA==
X-Google-Smtp-Source: ABdhPJwcne8lKdAjcKufpGfTQxkYk0+8i7CJ1Jsc8uJOavtk9sRka/jP3LwbnsSHXkt8FtXafvsWgQ==
X-Received: by 2002:a17:902:d68c:b029:ea:dfbf:9f4b with SMTP id v12-20020a170902d68cb02900eadfbf9f4bmr4549079ply.12.1619109384949;
        Thu, 22 Apr 2021 09:36:24 -0700 (PDT)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id r11sm2072768pff.192.2021.04.22.09.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Apr 2021 09:36:24 -0700 (PDT)
Date:   Thu, 22 Apr 2021 10:36:22 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 5/7] rpmsg: char: Introduce a rpmsg driver for the
 rpmsg char device
Message-ID: <20210422163622.GC1256950@xps15>
References: <20210413134458.17912-1-arnaud.pouliquen@foss.st.com>
 <20210413134458.17912-6-arnaud.pouliquen@foss.st.com>
 <20210421174053.GA1223348@xps15>
 <47015357-b006-1c32-f63f-d4fcac054d6f@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <47015357-b006-1c32-f63f-d4fcac054d6f@foss.st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, Apr 22, 2021 at 09:58:27AM +0200, Arnaud POULIQUEN wrote:
> On 4/21/21 7:40 PM, Mathieu Poirier wrote:
> > Good day Arnaud,
> > 
> > On Tue, Apr 13, 2021 at 03:44:56PM +0200, Arnaud Pouliquen wrote:
> >> A rpmsg char device allows to probe the endpoint device on a remote name
> >> service announcement.
> >>
> >> With this patch the /dev/rpmsgX interface is created either by a user
> >> application or by the remote firmware.
> >>
> >> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> >>
> >> ---
> >> update from V1:
> >>  - add missing unregister_rpmsg_driver call on module exit.
> >>
> >> ---
> >>  drivers/rpmsg/rpmsg_char.c | 59 +++++++++++++++++++++++++++++++++++++-
> >>  1 file changed, 58 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> >> index a64249d83172..4606787b7011 100644
> >> --- a/drivers/rpmsg/rpmsg_char.c
> >> +++ b/drivers/rpmsg/rpmsg_char.c
> >> @@ -26,6 +26,8 @@
> >>  #include "rpmsg_char.h"
> >>  #include "rpmsg_internal.h"
> >>  
> >> +#define RPMSG_CHAR_DEVNAME "rpmsg-raw"
> >> +
> > 
> > Why not simply call it rpmsg-char?
> 
> I would avoid to link the rpmsg name service to the Linux Kernel device.

To me that's exactly what we want to do...  Am I missing something?

> 
> > 
> >>  static dev_t rpmsg_major;
> >>  
> >>  static DEFINE_IDA(rpmsg_ept_ida);
> >> @@ -403,13 +405,67 @@ int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent
> >>  }
> >>  EXPORT_SYMBOL(rpmsg_chrdev_create_eptdev);
> >>  
> >> +static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
> >> +{
> >> +	struct rpmsg_channel_info chinfo;
> >> +	struct rpmsg_eptdev *eptdev;
> >> +
> >> +	if (!rpdev->ept)
> >> +		return -EINVAL;
> >> +
> >> +	memcpy(chinfo.name, RPMSG_CHAR_DEVNAME, sizeof(RPMSG_CHAR_DEVNAME));
> >> +	chinfo.src = rpdev->src;
> >> +	chinfo.dst = rpdev->dst;
> >> +
> >> +	eptdev = __rpmsg_chrdev_create_eptdev(rpdev, &rpdev->dev, chinfo, NULL);
> >> +	if (IS_ERR(eptdev))
> >> +		return PTR_ERR(eptdev);
> >> +
> >> +	/* Set the private field of the default endpoint to retrieve context on callback. */
> >> +	rpdev->ept->priv = eptdev;
> > 
> > This is already done in rpmsg_create_ept() when rpmsg_eptdev_open() is called.
> > 
> >> +
> >> +	return 0;
> >> +}
> >> +
> >> +static void rpmsg_chrdev_remove(struct rpmsg_device *rpdev)
> >> +{
> >> +	int ret;
> >> +
> >> +	ret = device_for_each_child(&rpdev->dev, NULL, rpmsg_chrdev_destroy_eptdev);
> >> +	if (ret)
> >> +		dev_warn(&rpdev->dev, "failed to destroy endpoints: %d\n", ret);
> >> +}
> >> +
> >> +static struct rpmsg_device_id rpmsg_chrdev_id_table[] = {
> >> +	{ .name	= RPMSG_CHAR_DEVNAME },
> >> +	{ },
> >> +};
> >> +
> >> +static struct rpmsg_driver rpmsg_chrdev_driver = {
> >> +	.probe = rpmsg_chrdev_probe,
> >> +	.remove = rpmsg_chrdev_remove,
> >> +	.id_table = rpmsg_chrdev_id_table,
> >> +	.callback = rpmsg_ept_cb,
> > 
> > Not sure why we need a callback associated to this driver when
> > rpmsg_eptdev_open() already creates and rpmsg_endpoint.  To me the only thing
> > having a callback provides is the association between the rpmsg_device and the
> > rpmsg_endpoint[1] that happens in rpmsg_dev_probe().  The QC folks already do
> > this association in their platform code[2].  Since this is not done in
> > __rpmsg_create_ept() a check for rpdev->ept == NULL could be done in
> > rpmsg_eptdev_open() and do the assignment there. 
> > 
> > [1]. https://elixir.bootlin.com/linux/v5.12-rc6/source/drivers/rpmsg/rpmsg_core.c#L513  
> > [2]. https://elixir.bootlin.com/linux/v5.12-rc6/source/drivers/rpmsg/qcom_glink_native.c#L1623
> > 
> 
> That's a good point! When I started the redesign, I faced some issues with the
> approach you propose. But as I can not remember the reason and because the code
> has evolved, i need to re-think about this.
> 

Glad to see we're on the same page.  I stared at this code for a very long time,
thinking there was some kind of bigger picture I wasn't getting.


> Thanks,
> Arnaud
> 
> 
> >> +	.drv = {
> >> +		.name = "rpmsg_chrdev",
> >> +	},
> >> +};
> >> +
> >>  static int rpmsg_chrdev_init(void)
> >>  {
> >>  	int ret;
> >>  
> >>  	ret = alloc_chrdev_region(&rpmsg_major, 0, RPMSG_DEV_MAX, "rpmsg_char");
> >> -	if (ret < 0)
> >> +	if (ret < 0) {
> >>  		pr_err("rpmsg: failed to allocate char dev region\n");
> >> +		return ret;
> >> +	}
> >> +
> >> +	ret = register_rpmsg_driver(&rpmsg_chrdev_driver);
> >> +	if (ret < 0) {
> >> +		pr_err("rpmsg: failed to register rpmsg raw driver\n");
> >> +		unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
> >> +	}
> >>  
> >>  	return ret;
> >>  }
> >> @@ -417,6 +473,7 @@ postcore_initcall(rpmsg_chrdev_init);
> >>  
> >>  static void rpmsg_chrdev_exit(void)
> >>  {
> >> +	unregister_rpmsg_driver(&rpmsg_chrdev_driver);
> >>  	unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
> >>  }
> >>  module_exit(rpmsg_chrdev_exit);
> >> -- 
> >> 2.17.1
> >>
