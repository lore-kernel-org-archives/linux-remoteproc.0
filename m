Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5327AC433B4
	for <linux-remoteproc@archiver.kernel.org>; Thu,  6 May 2021 16:11:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 131B361078
	for <linux-remoteproc@archiver.kernel.org>; Thu,  6 May 2021 16:11:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235395AbhEFQM2 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 6 May 2021 12:12:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235246AbhEFQM2 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 6 May 2021 12:12:28 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E265C061761
        for <linux-remoteproc@vger.kernel.org>; Thu,  6 May 2021 09:11:29 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id lj11-20020a17090b344bb029015bc3073608so3744709pjb.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 06 May 2021 09:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=joBZO2EuUGmN/P5upzQHQzAEiuX94k7ShmHvJ9FOemo=;
        b=ZD6h9R+F4/uMQWTdK41klFKGncWIdr39EC1I0XnlWWb2kMqVfRP0piB6Reht3xWpzI
         qsc/YzJ+ZEf7E31IAFWjBlpYXQtswOUNv0r8otDjCayOzMWkrjlWj7dfgoYpeGBoaHyt
         2MyV78sRt17LSUWaSfrGg3XER3fjKGONW+bzptAJvULiMLkqB5ttbPESQEslGgaQh3tL
         ELddIEPvT+knJaYrY8BS/OoEo/P32uLxg46f40ujDOzRnmXhBLF3NigTda9xSo2LqR24
         jFV9oSfB6mP1gszI1ti+9KToOS6WT0TFVCMpkYd/GiW9cDCdLNcQIwaPyAq6Fy1HWQOy
         Ck6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=joBZO2EuUGmN/P5upzQHQzAEiuX94k7ShmHvJ9FOemo=;
        b=IanBxxLXPC89zyzRkgmVPWc3P0fQGVhk4C+e4Rcy5vg2jomQVCRMO7i3VC5yLgx/DK
         B9obeEHe9CLUXE2hndWKYkXMX9jrudN/j4Amm4PZPayYZam6OXXrsBB0yjab0jNKo01z
         gISNpSaBqqh9fMopqqW3nqenDlb3vF+erg1NxpGspZCx1XzuayYGN3JVeogkQXkiFeZd
         RLF7tnOECDQwg17qdbCpVonpiUSwOCzrvnnmoO3LWNPY+eG6lCBJVbhHdIsuYy6Zl9Rq
         ldr9LIBNk7Ixmt0yuQVGt6vvwWKa0+TYn8VKIBajxPjTkJOsy0rjdJGOruKgABj4TOyS
         DkDA==
X-Gm-Message-State: AOAM5306ufNW5us8SujwB8VWoVFHbynBMJ8lNwMuWlvw2m3ecPkHFgJ5
        kIDoZryFoRXK+BS5WqgPOD6B2jCrnbov0g==
X-Google-Smtp-Source: ABdhPJzObUur+TjQiT6SzsHBylqtcJ8knSBvnsqzTLAPKU54bXpp8bUj7Gt7vbmUASD20WyJfQiMuQ==
X-Received: by 2002:a17:902:b683:b029:ee:f0e3:7a50 with SMTP id c3-20020a170902b683b02900eef0e37a50mr5549593pls.7.1620317488726;
        Thu, 06 May 2021 09:11:28 -0700 (PDT)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id b21sm2455098pfl.82.2021.05.06.09.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 May 2021 09:11:27 -0700 (PDT)
Date:   Thu, 6 May 2021 10:11:25 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v3 5/6] rpmsg: char: Introduce a rpmsg driver for the
 rpmsg char device
Message-ID: <20210506161125.GA1804623@xps15>
References: <20210429135507.8264-1-arnaud.pouliquen@foss.st.com>
 <20210429135507.8264-6-arnaud.pouliquen@foss.st.com>
 <20210505164159.GB1766375@xps15>
 <5a41e653-4d75-c5d5-a8e3-e247a50507f3@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5a41e653-4d75-c5d5-a8e3-e247a50507f3@foss.st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Good day,

On Wed, May 05, 2021 at 08:25:24PM +0200, Arnaud POULIQUEN wrote:
> Hi Mathieu,
> 
> On 5/5/21 6:41 PM, Mathieu Poirier wrote:
> > Hi Arnaud,
> > 
> > On Thu, Apr 29, 2021 at 03:55:06PM +0200, Arnaud Pouliquen wrote:
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
> >>
> >>  - add missing unregister_rpmsg_driver call on module exit.
> >> ---
> >>  drivers/rpmsg/rpmsg_char.c | 53 +++++++++++++++++++++++++++++++++++++-
> >>  1 file changed, 52 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> >> index 5c6a7da6e4d7..9166454c1310 100644
> >> --- a/drivers/rpmsg/rpmsg_char.c
> >> +++ b/drivers/rpmsg/rpmsg_char.c
> >> @@ -18,6 +18,8 @@
> >>  
> >>  #include "rpmsg_char.h"
> >>  
> >> +#define RPMSG_CHAR_DEVNAME "rpmsg-raw"
> >> +
> >>  static dev_t rpmsg_major;
> >>  static struct class *rpmsg_class;
> >>  
> >> @@ -413,6 +415,40 @@ int rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct device *parent
> >>  }
> >>  EXPORT_SYMBOL(rpmsg_chrdev_eptdev_create);
> >>  
> >> +static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
> >> +{
> >> +	struct rpmsg_channel_info chinfo;
> >> +
> >> +	memcpy(chinfo.name, RPMSG_CHAR_DEVNAME, sizeof(RPMSG_CHAR_DEVNAME));
> >> +	chinfo.src = rpdev->src;
> >> +	chinfo.dst = rpdev->dst;
> >> +
> >> +	return __rpmsg_chrdev_eptdev_create(rpdev, &rpdev->dev, chinfo, true);
> >> +}
> >> +
> >> +static void rpmsg_chrdev_remove(struct rpmsg_device *rpdev)
> >> +{
> >> +	int ret;
> >> +
> >> +	ret = device_for_each_child(&rpdev->dev, NULL, rpmsg_chrdev_eptdev_destroy);
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
> >> +	.drv = {
> >> +		.name = "rpmsg_chrdev",
> >> +	},
> >> +};
> > 
> > The sole purpose of doing this is to create instances of rpmsg_chrdevs from the
> > name service - but is it really needed?  Up to now and aside from GLINK and SMD,
> > there asn't been other users of it so I'm wondering if it is worth going through
> > all this trouble.
> 
> It is a good point.
> 
> Just as a reminder, the need of ST and, I assume, some other companies, is to
> have a basic/generic communication channel to control a remote processor
> application.
> 
> Nothing generic exists today for a virtio transport based implementation.
> Companies have to create their own driver.
> 
> The purpose of my work is to allow our customer to use RPMsg without developing
> a specific driver to control remote applications.
> 
> The rpmsg_chrdev char is a good candidate for this. No protocol, just a simple
> inter-processor link to send and receive data. The rpmsg_tty is another one.
> 
> Focusing on the rpmsg_chrdev:
> We did a part of the work with the first patch set that would be in 5.13.
> But is it simple to use it for virtio transport based platforms?
> If we don't implement the NS announcement support in rpmsg_chrdev, using
> rpmsg_chrdev for a user application seems rather tricky.
> How to instantiate the communication?

Since we already have /dev/rpmsg_ctrlX user space can instantiate an rpmsg_chrdev
using that interface, which is how things are done in the GLINK/SMD world.

Wouldn't that cover the usecases you had in mind?

As you pointed out above rpmsg_chrdev should be light and simple - eliminating
patches 4, 5 and 6 would yield that.

> The application will probably has to scan the /sys/bus/rpmsg/devices/ folder to
> determine the services and associated remote address.
> 
> I don't think the QCOM drivers have the same problem because they seems to
> initiate the communication and work directly with the RPMsg endpoints ( new
> channel creation on endpoint creation) while Virtio works with the RPMsg channel.
> 
> By introducing the ability to instantiate rpmsg_chrdevs through the NS
> announcement, we make this easy for applications to use.
> 
> And without rpmsg_chrdevs instantiation, It also means that we can't create an
> RPMsg channel for the rpmsg_chrdevs using a new RPMSG_CREATE_DEV_IOCTL control,
> right?
> 
> That said, If we consider that the aim was only to extract the rpmsg_ctrl part,
> I'm not against leaving the rpmsg_char in this state and switching to the
> rpmsg_tty driver upstream including the work on the rpmsg_ctrl to create rpmsg
> channels.
> 
> We could come back on this if requested by someone else.
> 
> Thanks,
> Arnaud
> 
> > 
> > As such I suggest we don't go out of our way to expose rpmsg_chrdevs to the name
> > service.  That way patches 4, 5 and 6 of this set can be dropped.
> > 
> > Thanks,
> > Mathieu
> > 
> >> +
> >>  static int rpmsg_chrdev_init(void)
> >>  {
> >>  	int ret;
> >> @@ -427,15 +463,30 @@ static int rpmsg_chrdev_init(void)
> >>  	if (IS_ERR(rpmsg_class)) {
> >>  		pr_err("failed to create rpmsg class\n");
> >>  		unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
> >> -		return PTR_ERR(rpmsg_class);
> >> +		ret = PTR_ERR(rpmsg_class);
> >> +		goto free_region;
> >> +	}
> >> +
> >> +	ret = register_rpmsg_driver(&rpmsg_chrdev_driver);
> >> +	if (ret < 0) {
> >> +		pr_err("rpmsg: failed to register rpmsg raw driver\n");
> >> +		goto free_class;
> >>  	}
> >>  
> >>  	return 0;
> >> +
> >> +free_class:
> >> +	class_destroy(rpmsg_class);
> >> +free_region:
> >> +	unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
> >> +
> >> +	return ret;
> >>  }
> >>  postcore_initcall(rpmsg_chrdev_init);
> >>  
> >>  static void rpmsg_chrdev_exit(void)
> >>  {
> >> +	unregister_rpmsg_driver(&rpmsg_chrdev_driver);
> >>  	class_destroy(rpmsg_class);
> >>  	unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
> >>  }
> >> -- 
> >> 2.17.1
> >>
