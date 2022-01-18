Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AB4CC433F5
	for <linux-remoteproc@archiver.kernel.org>; Tue, 18 Jan 2022 14:36:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241311AbiAROg6 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 18 Jan 2022 09:36:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235461AbiAROg5 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 18 Jan 2022 09:36:57 -0500
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82CA6C06161C
        for <linux-remoteproc@vger.kernel.org>; Tue, 18 Jan 2022 06:36:57 -0800 (PST)
Received: by mail-ot1-x32c.google.com with SMTP id c3-20020a9d6c83000000b00590b9c8819aso24425762otr.6
        for <linux-remoteproc@vger.kernel.org>; Tue, 18 Jan 2022 06:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=g/E6azSHew9V9PpvF0f3pP+5wnsWrv43TlCShv5exTk=;
        b=hNkz9/kSj8wQa0Ci2dc6jiOTsxWHve+kRJ59sfk94ZDTe7WVF8wCCMHrYAJD29Nnm9
         JpN8kbVTTOSlMHh2+d1EWxgFah+zyUhvAG9/sBLzhjKiouBApmg3qBxHWB+onfwu5Er9
         7MzZNjVl/cw1lM6IAZRK1LHXtg+citJvHUIxRbekxQW0A59SD6oZnfhHzVWhTKG8dAsm
         m2AICjWIfT9+5y+EaNtGzNh0RBa/TnzIIwqVqhX6aCo9uLFkQ8Y4Zhezcsa6uWtGd36P
         M4tbvweuW95jTEvs48sVpgaI7j9EoAimL3O9nVNykHT9XKCSUEqPD9csWb4aUbKeksHZ
         RSaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=g/E6azSHew9V9PpvF0f3pP+5wnsWrv43TlCShv5exTk=;
        b=lIHB48CRoCPsxciOE7Adbw1eIp//NU7t3p5OJEssR0aa+8ivSB7PJAXzLJh8cqJffr
         qd2Ha4u5+RWjYUk8xHZNeKC+npvw2iv8UdHYaNW9DyRnoEJ9VqqVQbpnc/zQme90R6yQ
         zxaAC5kP62WaTOmsVtGD3Aw4nwddv0Gx6uIAJBhLBRkbMrAhep4nofOE1/d70LxXCn4N
         xXv0nV7b9+NBEmriCe4meMIDSTwmpd5lAztHE7FWymOsLZm6TDEkPzCe4iO0lpCFTxRG
         Umwd8qzb0oWkC8V1fEvDSMRettjPcwNuGkdp/pzWEPa11hTaE8eFXy6Cr8GF+1qYiUMU
         P3Ig==
X-Gm-Message-State: AOAM532JcQaJPnLAnsimfPlgCm820x6wlkQd5ff6fZlyzLPf7TLSsbMe
        0KR6JHoMK4Wm9cwphJeCPFQBlgChd71kDQ==
X-Google-Smtp-Source: ABdhPJwFzwToSEDVW3yM42csZG3NG85MjPaMhYhNFzmJr7RLCE5BGaf629ocAuaJmIqaF6vOU42BNg==
X-Received: by 2002:a05:6830:1da:: with SMTP id r26mr19695944ota.204.1642516616771;
        Tue, 18 Jan 2022 06:36:56 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id bx32sm6215930oib.52.2022.01.18.06.36.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jan 2022 06:36:56 -0800 (PST)
Date:   Tue, 18 Jan 2022 08:36:54 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, julien.massot@iot.bzh
Subject: Re: [PATCH v8 11/13] rpmsg: char: Introduce the "rpmsg-raw" channel
Message-ID: <YebQhrO+l6J+w9Hj@builder.lan>
References: <20211207080843.21222-1-arnaud.pouliquen@foss.st.com>
 <20211207080843.21222-12-arnaud.pouliquen@foss.st.com>
 <YeX13cUAerjCM5Li@builder.lan>
 <6db32381-6615-3916-088a-d1cd27e3443a@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6db32381-6615-3916-088a-d1cd27e3443a@foss.st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue 18 Jan 05:04 CST 2022, Arnaud POULIQUEN wrote:

> 
> 
> On 1/18/22 12:03 AM, Bjorn Andersson wrote:
> > On Tue 07 Dec 02:08 CST 2021, Arnaud Pouliquen wrote:
> > 
> > > Allows to probe the endpoint device on a remote name service announcement,
> > > by registering a rpmsg_driverfor the "rpmsg-raw" channel.

Thought of this after replying yesterday, I really would like this to be
updated to include an explanation of _why_ this is a good thing. What is
the use case etc.

> > > 
> > > With this patch the /dev/rpmsgX interface can be instantiated by the remote
> > > firmware.

It would be nice if this mentioned why you can rely on udev events and
rpmsgexport.

> > > 
> > > Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> > > ---
> > >   drivers/rpmsg/rpmsg_char.c | 64 ++++++++++++++++++++++++++++++++++++++
> > >   drivers/rpmsg/rpmsg_ctrl.c |  7 +++--
> > >   2 files changed, 69 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> > > index cf97839f5833..92b44630e03a 100644
> > > --- a/drivers/rpmsg/rpmsg_char.c
> > > +++ b/drivers/rpmsg/rpmsg_char.c
> > > @@ -435,6 +435,58 @@ int rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct device *parent
> > >   }
> > >   EXPORT_SYMBOL(rpmsg_chrdev_eptdev_create);
> > > +static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
> > > +{
> > > +	struct rpmsg_channel_info chinfo;
> > > +	struct rpmsg_eptdev *eptdev;
> > > +	struct device *dev = &rpdev->dev;
> > > +
> > > +	memcpy(chinfo.name, rpdev->id.name, RPMSG_NAME_SIZE);
> > > +	chinfo.src = rpdev->src;
> > > +	chinfo.dst = rpdev->dst;
> > > +
> > > +	eptdev = rpmsg_chrdev_eptdev_alloc(rpdev, dev);
> > > +	if (IS_ERR(eptdev))
> > > +		return PTR_ERR(eptdev);
> > > +
> > > +	/*
> > > +	 * Create the default endpoint associated to the rpmsg device and provide rpmsg_eptdev
> > > +	 * structure as callback private data.
> > 
> > If the only this the probe function does is to create a new endpoint
> > with the same properties as the rpdev, why can't you just specify a
> > callback on the rpmsg_chrdev_driver?
> > 
> > As this isn't the typical way you create a default endpoint I think the
> > reasoning behind this warrants a proper explanation in the commit
> > message.
> > 
> 
> As mentioned in [PATCH v8 09/13] rpmsg: Introduce rpmsg_create_default_ept function
> "This helper function allows rpmsg drivers to create a default endpoint
> on runtime with an associated private context."
> 
> Here the private context is the eptdev structure. I need to create the
> structure first, before
> the endpoint.
> I will add more details in the commit message as you suggest.

Okay, I think the important part to document is _why_ this has to happen
in this order - in particular since I suspect that this reason might not
be unique to this driver.

> 
> An alternative could be to directly set default_ept->priv but as the
> rpmsg_create_default_ept
> "priv" parameter is forwarded to the rpmsg backend (using create_ept ops).
> This could introduces unexpected side effect.
> 

I'm not sure I understand the unexpected side effect of reassigning priv
here.

Regards,
Bjorn

> > > +	 * Do not allow the creation and release of an endpoint on /dev/rpmsgX open and close,
> > > +	 * reuse the default endpoint instead
> > 
> > This sentence doesn't tell me anything about this code snippet and
> > doesn't indicate that it relates to the snippet added elsewhere in this
> > file by the previous patch.
> > 
> > > +	 */
> > > +	eptdev->default_ept = rpmsg_create_default_ept(rpdev, rpmsg_ept_cb, eptdev, chinfo);
> > > +	if (!eptdev->default_ept) {
> > > +		dev_err(&rpdev->dev, "failed to create %s\n", chinfo.name);
> > > +		put_device(dev);
> > > +		kfree(eptdev);
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	return rpmsg_chrdev_eptdev_add(eptdev, chinfo);
> > > +}
> > > +
> > > +static void rpmsg_chrdev_remove(struct rpmsg_device *rpdev)
> > > +{
> > > +	int ret;
> > > +
> > > +	ret = device_for_each_child(&rpdev->dev, NULL, rpmsg_chrdev_eptdev_destroy);
> > > +	if (ret)
> > > +		dev_warn(&rpdev->dev, "failed to destroy endpoints: %d\n", ret);
> > > +}
> > > +
> > > +static struct rpmsg_device_id rpmsg_chrdev_id_table[] = {
> > > +	{ .name	= "rpmsg-raw" },
> > > +	{ },
> > > +};
> > > +
> > > +static struct rpmsg_driver rpmsg_chrdev_driver = {
> > > +	.probe = rpmsg_chrdev_probe,
> > > +	.remove = rpmsg_chrdev_remove,
> > > +	.id_table = rpmsg_chrdev_id_table,
> > > +	.drv.name = "rpmsg_chrdev",
> > > +};
> > > +
> > >   static int rpmsg_chrdev_init(void)
> > >   {
> > >   	int ret;
> > > @@ -445,12 +497,24 @@ static int rpmsg_chrdev_init(void)
> > >   		return ret;
> > >   	}
> > > +	ret = register_rpmsg_driver(&rpmsg_chrdev_driver);
> > > +	if (ret < 0) {
> > > +		pr_err("rpmsg: failed to register rpmsg raw driver\n");
> > > +		goto free_region;
> > > +	}
> > > +
> > >   	return 0;
> > > +
> > > +free_region:
> > > +	unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
> > > +
> > > +	return ret;
> > >   }
> > >   postcore_initcall(rpmsg_chrdev_init);
> > >   static void rpmsg_chrdev_exit(void)
> > >   {
> > > +	unregister_rpmsg_driver(&rpmsg_chrdev_driver);
> > >   	unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
> > >   }
> > >   module_exit(rpmsg_chrdev_exit);
> > > diff --git a/drivers/rpmsg/rpmsg_ctrl.c b/drivers/rpmsg/rpmsg_ctrl.c
> > > index 59d2bd264fdb..298e75dc7774 100644
> > > --- a/drivers/rpmsg/rpmsg_ctrl.c
> > > +++ b/drivers/rpmsg/rpmsg_ctrl.c
> > > @@ -10,6 +10,9 @@
> > >    * Based on rpmsg performance statistics driver by Michal Simek, which in turn
> > >    * was based on TI & Google OMX rpmsg driver.
> > >    */
> > > +
> > > +#define pr_fmt(fmt)		KBUILD_MODNAME ": " fmt
> > 
> > These changes seems unrelated to above.
> 
> I apparently broke something in my patchset here during a rebase. The previous
> irrelevant comment you pointed out to me is also a consequence. My apologies
> for this dirty patch...
> 
> Thanks,
> Arnaud
> 
> > 
> > Regards,
> > Bjorn
> > 
> > > +
> > >   #include <linux/cdev.h>
> > >   #include <linux/device.h>
> > >   #include <linux/fs.h>
> > > @@ -193,13 +196,13 @@ static int rpmsg_ctrldev_init(void)
> > >   	ret = alloc_chrdev_region(&rpmsg_major, 0, RPMSG_DEV_MAX, "rpmsg_ctrl");
> > >   	if (ret < 0) {
> > > -		pr_err("rpmsg: failed to allocate char dev region\n");
> > > +		pr_err("failed to allocate char dev region\n");
> > >   		return ret;
> > >   	}
> > >   	ret = register_rpmsg_driver(&rpmsg_ctrldev_driver);
> > >   	if (ret < 0) {
> > > -		pr_err("rpmsg ctrl: failed to register rpmsg driver\n");
> > > +		pr_err("failed to register rpmsg driver\n");
> > >   		unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
> > >   	}
> > > -- 
> > > 2.17.1
> > > 
