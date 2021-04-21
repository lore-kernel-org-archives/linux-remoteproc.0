Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7D2BC433B4
	for <linux-remoteproc@archiver.kernel.org>; Wed, 21 Apr 2021 17:40:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 68824613D8
	for <linux-remoteproc@archiver.kernel.org>; Wed, 21 Apr 2021 17:40:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242273AbhDURla (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 21 Apr 2021 13:41:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238197AbhDURla (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 21 Apr 2021 13:41:30 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45A17C06174A
        for <linux-remoteproc@vger.kernel.org>; Wed, 21 Apr 2021 10:40:57 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id h11so11903994pfn.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 21 Apr 2021 10:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=KqxdLKVRxruk3VhviovYIaEHWX0upwD63/5cJozT3Xk=;
        b=ikBHNJurMTLHP8Txl/56QkAbqnldy80ahyLzWNHPAqXFyq1HkiG7onJin3REQoxLpj
         tUmwPEzzpuucrWPkZBuNB7nFadmFtru21xzefr3YY/7pde0xc7ebDHC63kHOBRfA5538
         wwHBH3PNghUAV6WCyD059MuhOAqGR30uVs34IpRAhXDKwED2iyDMD6Tu31GSV+VoSgeJ
         RyCuvc4ezp6TNvHoqfcs4xlqhOqERrmff9a00eZtC/rozbIrbh2tYdXfP0p7Y8QUwGYs
         90y/8C/9P1nzOfS543GmJVL6B4HG3LLLsYr4keqxeBXgDSjfjhrQfXQF5wH5hRkrhEM7
         z5xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KqxdLKVRxruk3VhviovYIaEHWX0upwD63/5cJozT3Xk=;
        b=oKMw1jV0fq/n29WKAo0kf2zfyq8jv/7Yxs8EkA/AbFPu2OVHzkUfQt9v9RmeSISibM
         nHXcwNXphAQmXcZP2c4c+KHxWAM1jEDOR19LNAXZ66cQwNilODkEneods3L4O0hVJ4Vv
         oWstVS6+KmGGgX1z+LwOyjgE+e15VhC9nK/7XjB37L5A/T7BxDHPIpaWnWcf+d9CJoWg
         sETE8imbRKIZBUXfFMfaYvsIrLe6rHIcVGMRfSXMzEXir7ZRRrHXxW+hX0/pCrw0OYrM
         YV6EZmR7vArMtvO1pnhI8GxgkgRAFLBqXtogSQFMYYOT6uYepsQJTvU9FyjujIedWpDe
         DRjA==
X-Gm-Message-State: AOAM533uDlXCDdyy4zDDJLCBEWBIwi7JKT5/eH5ieZ6M6P2ckybjQqpZ
        9F+MX4AWVLlfLf6KOrsqejiFWg==
X-Google-Smtp-Source: ABdhPJzK8tVMg33C/wZvY7JUR5cwCTHDq0JUq0IowoA1jQW1qJkblE1B9he3NCv5ZOXiyAPA+qG4qA==
X-Received: by 2002:a17:90a:c08f:: with SMTP id o15mr12664038pjs.22.1619026856756;
        Wed, 21 Apr 2021 10:40:56 -0700 (PDT)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id pc17sm21713pjb.19.2021.04.21.10.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Apr 2021 10:40:55 -0700 (PDT)
Date:   Wed, 21 Apr 2021 11:40:53 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 5/7] rpmsg: char: Introduce a rpmsg driver for the
 rpmsg char device
Message-ID: <20210421174053.GA1223348@xps15>
References: <20210413134458.17912-1-arnaud.pouliquen@foss.st.com>
 <20210413134458.17912-6-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210413134458.17912-6-arnaud.pouliquen@foss.st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Good day Arnaud,

On Tue, Apr 13, 2021 at 03:44:56PM +0200, Arnaud Pouliquen wrote:
> A rpmsg char device allows to probe the endpoint device on a remote name
> service announcement.
> 
> With this patch the /dev/rpmsgX interface is created either by a user
> application or by the remote firmware.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> 
> ---
> update from V1:
>  - add missing unregister_rpmsg_driver call on module exit.
> 
> ---
>  drivers/rpmsg/rpmsg_char.c | 59 +++++++++++++++++++++++++++++++++++++-
>  1 file changed, 58 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index a64249d83172..4606787b7011 100644
> --- a/drivers/rpmsg/rpmsg_char.c
> +++ b/drivers/rpmsg/rpmsg_char.c
> @@ -26,6 +26,8 @@
>  #include "rpmsg_char.h"
>  #include "rpmsg_internal.h"
>  
> +#define RPMSG_CHAR_DEVNAME "rpmsg-raw"
> +

Why not simply call it rpmsg-char?

>  static dev_t rpmsg_major;
>  
>  static DEFINE_IDA(rpmsg_ept_ida);
> @@ -403,13 +405,67 @@ int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent
>  }
>  EXPORT_SYMBOL(rpmsg_chrdev_create_eptdev);
>  
> +static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
> +{
> +	struct rpmsg_channel_info chinfo;
> +	struct rpmsg_eptdev *eptdev;
> +
> +	if (!rpdev->ept)
> +		return -EINVAL;
> +
> +	memcpy(chinfo.name, RPMSG_CHAR_DEVNAME, sizeof(RPMSG_CHAR_DEVNAME));
> +	chinfo.src = rpdev->src;
> +	chinfo.dst = rpdev->dst;
> +
> +	eptdev = __rpmsg_chrdev_create_eptdev(rpdev, &rpdev->dev, chinfo, NULL);
> +	if (IS_ERR(eptdev))
> +		return PTR_ERR(eptdev);
> +
> +	/* Set the private field of the default endpoint to retrieve context on callback. */
> +	rpdev->ept->priv = eptdev;

This is already done in rpmsg_create_ept() when rpmsg_eptdev_open() is called.

> +
> +	return 0;
> +}
> +
> +static void rpmsg_chrdev_remove(struct rpmsg_device *rpdev)
> +{
> +	int ret;
> +
> +	ret = device_for_each_child(&rpdev->dev, NULL, rpmsg_chrdev_destroy_eptdev);
> +	if (ret)
> +		dev_warn(&rpdev->dev, "failed to destroy endpoints: %d\n", ret);
> +}
> +
> +static struct rpmsg_device_id rpmsg_chrdev_id_table[] = {
> +	{ .name	= RPMSG_CHAR_DEVNAME },
> +	{ },
> +};
> +
> +static struct rpmsg_driver rpmsg_chrdev_driver = {
> +	.probe = rpmsg_chrdev_probe,
> +	.remove = rpmsg_chrdev_remove,
> +	.id_table = rpmsg_chrdev_id_table,
> +	.callback = rpmsg_ept_cb,

Not sure why we need a callback associated to this driver when
rpmsg_eptdev_open() already creates and rpmsg_endpoint.  To me the only thing
having a callback provides is the association between the rpmsg_device and the
rpmsg_endpoint[1] that happens in rpmsg_dev_probe().  The QC folks already do
this association in their platform code[2].  Since this is not done in
__rpmsg_create_ept() a check for rpdev->ept == NULL could be done in
rpmsg_eptdev_open() and do the assignment there. 

[1]. https://elixir.bootlin.com/linux/v5.12-rc6/source/drivers/rpmsg/rpmsg_core.c#L513  
[2]. https://elixir.bootlin.com/linux/v5.12-rc6/source/drivers/rpmsg/qcom_glink_native.c#L1623

> +	.drv = {
> +		.name = "rpmsg_chrdev",
> +	},
> +};
> +
>  static int rpmsg_chrdev_init(void)
>  {
>  	int ret;
>  
>  	ret = alloc_chrdev_region(&rpmsg_major, 0, RPMSG_DEV_MAX, "rpmsg_char");
> -	if (ret < 0)
> +	if (ret < 0) {
>  		pr_err("rpmsg: failed to allocate char dev region\n");
> +		return ret;
> +	}
> +
> +	ret = register_rpmsg_driver(&rpmsg_chrdev_driver);
> +	if (ret < 0) {
> +		pr_err("rpmsg: failed to register rpmsg raw driver\n");
> +		unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
> +	}
>  
>  	return ret;
>  }
> @@ -417,6 +473,7 @@ postcore_initcall(rpmsg_chrdev_init);
>  
>  static void rpmsg_chrdev_exit(void)
>  {
> +	unregister_rpmsg_driver(&rpmsg_chrdev_driver);
>  	unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
>  }
>  module_exit(rpmsg_chrdev_exit);
> -- 
> 2.17.1
> 
