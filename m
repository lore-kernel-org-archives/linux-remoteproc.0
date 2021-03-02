Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB412C433DB
	for <linux-remoteproc@archiver.kernel.org>; Wed,  3 Mar 2021 10:32:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6A53464E66
	for <linux-remoteproc@archiver.kernel.org>; Wed,  3 Mar 2021 10:32:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240830AbhCCIQe (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 3 Mar 2021 03:16:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1580526AbhCBSEX (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 2 Mar 2021 13:04:23 -0500
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B08E5C0611BC
        for <linux-remoteproc@vger.kernel.org>; Tue,  2 Mar 2021 10:01:14 -0800 (PST)
Received: by mail-pf1-x434.google.com with SMTP id j12so14291405pfj.12
        for <linux-remoteproc@vger.kernel.org>; Tue, 02 Mar 2021 10:01:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=UBInWvC4UtsMqMVlbtixev5AhwLr9Odk/zIdyxeWBVE=;
        b=gkKGSNWCsOVvAVoe6dY3Z32WGzDgmFBGW2Rdy7IGyI+X06lJHhsUEJnYKADiJ+JwDz
         KZa4BRTCoHDaMLCWkJ3VXKKsiTKWIDKvMbwuY+xaQ6rzeikYjM4sBUKsNOTFnUMUOsNR
         o6Qlyjx7EVKBp4wxt/L+lmHVpdomxhCqLVSYVGlAoij6YB1NgtrudvLPLPduMz/06TQX
         /zXj3i/TR5iMmw/f0irj/FtJLyZUhjeAXxmRB/HDFZ0+hB6yS++YHwHv9NI+SjSpXrD/
         yFUjZlgvAsbweDBQcQ000ZDcSzfSazOk8QnGzA7XPoc7/gVoJ/gzN85rz06qgjWIiqcR
         NE0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UBInWvC4UtsMqMVlbtixev5AhwLr9Odk/zIdyxeWBVE=;
        b=bPDc+pTrXHUwQeNPSgm+/uYGUhx4j00i/15lbvFuel4ZjrXWqEfkj32lSo42EkOUQd
         Q3sI16YwftxHMkPlS49wtJyo/pRnvetg7kCWXAbClIFa5dSEt/y+8Yto8OeepRTGWTOH
         vsN1QUintZYhcxmP0JKteEmzofJ367FcgHiGGn6avrOtn11Uka//Ru0iq2AjPO1F9uTD
         NVypW3aICVlyXcEeqiiOFjIBGv/Wnm+Hr/aB9L59lEdNbIrwiVS/vOzlI60sT/NBbQ9y
         sUIULFpxYKM8nrlROBIcoU43v+f4oE8RVgPJpIQ+4yDyf+WD5JTAkuT455JvdMB75N2Z
         gd3Q==
X-Gm-Message-State: AOAM531CZ8GtTLHLISRO7u3M8wI8Ng8Urw3C6SooTfTdX5URprfmJXHg
        IuVr+Guoygce77+JganvUpyNidl9NStnFQ==
X-Google-Smtp-Source: ABdhPJzG0wzLzTI1eJKKGZkec00/EiMDhEKSsK3bDtPIQa/dNEuZiqt855r5ju1GLQpivCBDKuVbsw==
X-Received: by 2002:a63:585d:: with SMTP id i29mr19092274pgm.10.1614708074117;
        Tue, 02 Mar 2021 10:01:14 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id q15sm20198751pfk.181.2021.03.02.10.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 10:01:13 -0800 (PST)
Date:   Tue, 2 Mar 2021 11:01:11 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Andy Gross <agross@kernel.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v5 05/16] rpmsg: char: dissociate the control device from
 the rpmsg class
Message-ID: <20210302180111.GB3791957@xps15>
References: <20210219111501.14261-1-arnaud.pouliquen@foss.st.com>
 <20210219111501.14261-6-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210219111501.14261-6-arnaud.pouliquen@foss.st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, Feb 19, 2021 at 12:14:50PM +0100, Arnaud Pouliquen wrote:
> The RPMsg control device is a RPMsg device, it is already
> referenced in the RPMsg bus. There is only an interest to
> reference the ept char devices in the rpmsg class.
> This patch prepares the code split of the control and end point
> devices in two separate files.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/rpmsg/rpmsg_char.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index 78a6d19fdf82..23e369a00531 100644
> --- a/drivers/rpmsg/rpmsg_char.c
> +++ b/drivers/rpmsg/rpmsg_char.c
> @@ -485,7 +485,6 @@ static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
>  	dev = &ctrldev->dev;
>  	device_initialize(dev);
>  	dev->parent = &rpdev->dev;
> -	dev->class = rpmsg_class;

This may break user space...  It has been around for so long that even if the
information is redundant we have to keep it.

>  
>  	cdev_init(&ctrldev->cdev, &rpmsg_ctrldev_fops);
>  	ctrldev->cdev.owner = THIS_MODULE;
> -- 
> 2.17.1
> 
