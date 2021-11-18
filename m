Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED3CEC433EF
	for <linux-remoteproc@archiver.kernel.org>; Thu, 18 Nov 2021 17:26:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CD12A61284
	for <linux-remoteproc@archiver.kernel.org>; Thu, 18 Nov 2021 17:26:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231745AbhKRR34 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 18 Nov 2021 12:29:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234099AbhKRR3w (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 18 Nov 2021 12:29:52 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 449CEC06173E
        for <linux-remoteproc@vger.kernel.org>; Thu, 18 Nov 2021 09:26:52 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id n15-20020a17090a160f00b001a75089daa3so8809890pja.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 18 Nov 2021 09:26:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ffg8RENMvUuNEkBhbj1rA+p5DmTOHVu6yl2demT0EE4=;
        b=fb17491S/0gCnhjw+z0N6OqW92Tpeno6JI0c/csN8eX8CnIeKqlHLLnbYOpgouQx5q
         /vtBplywQdcqf0PQ3Qwot2PPxBcx3YU6PQ2GCes4CuxMTHWYtAK1HKc0+3i8o7FAbRpY
         01mzWpo1DwrHuAepeXOHU6IF2mjHq+r09yhUe01Lh42slxYx0G0lRzkQWMNGjzL1ixPw
         Yxp4dRABOXdkmw/u3rWxmnxmfcPPSBUfUvSfP63GYg4Rz2jZ16TtwkMYE1Imud86YSZ+
         +iPhSMPj46izY9h6v8K7QFlyNbHHE3x4LMg3ekEun1ZTGngs9MDjCwXVWFVLZIWKo/FG
         wJNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ffg8RENMvUuNEkBhbj1rA+p5DmTOHVu6yl2demT0EE4=;
        b=pKXe/3zuxZTPoRzCgcQDRjCKCygeQu+eJJMn6MZtiK6WBv6tnfr3x/NnK/R/uq0HpD
         PzqwjcowVTKvzZ/Dmp8LMAeO4sj7Ujelvdq1qul+xGlcNxMuOxAdVvIlb/WF8zQrGKu7
         tvLeYQdbZt/grdaKDp8fzalF5gT/ZIFVrTlYIP1eEVIVD+9UWOqgk6/j1R4mG6tZROSU
         cKeHBa0d1fqjbtoh+r/Z3NbFXhTZbjYOe0Zf9ROMcPgEnsVZOK4kfcEa+2KzH19KRSR7
         TEDR+0bbxK93hqk0g9/RvQcPAyC0ROKsvvdn7CTggPQi7/AaNEe86H8YP9qHv1kzFOCj
         jL2g==
X-Gm-Message-State: AOAM530T1mf1rwcCtcYWQTlhMNaz+F+eXT3zPfR46hnvFPwTcLRX40gb
        yp5N5moI9LqeNeIegFiAzRQP3A==
X-Google-Smtp-Source: ABdhPJwT015s86rLy9F8ng6d55iG1IPThLw+nvpC0UIAsjoQ/rL8E+JpvJUMBGsEjaoL3VO27U59zg==
X-Received: by 2002:a17:902:e548:b0:141:f4ae:d2bd with SMTP id n8-20020a170902e54800b00141f4aed2bdmr69754101plf.41.1637256411831;
        Thu, 18 Nov 2021 09:26:51 -0800 (PST)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id z22sm233489pfe.93.2021.11.18.09.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Nov 2021 09:26:50 -0800 (PST)
Date:   Thu, 18 Nov 2021 10:26:48 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH] rpmsg: char: Add pr_fmt() to prefix messages
Message-ID: <20211118172648.GC2530497@p14s>
References: <20211108135945.3364-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211108135945.3364-1-arnaud.pouliquen@foss.st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, Nov 08, 2021 at 02:59:45PM +0100, Arnaud Pouliquen wrote:
> Make all messages to be prefixed in a unified way.
> Add pr_fmt() to achieve this.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/rpmsg/rpmsg_char.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index b5907b80727c..d6214cb66026 100644
> --- a/drivers/rpmsg/rpmsg_char.c
> +++ b/drivers/rpmsg/rpmsg_char.c
> @@ -9,6 +9,9 @@
>   * Based on rpmsg performance statistics driver by Michal Simek, which in turn
>   * was based on TI & Google OMX rpmsg driver.
>   */
> +
> +#define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
> +
>  #include <linux/cdev.h>
>  #include <linux/device.h>
>  #include <linux/fs.h>
> @@ -550,7 +553,7 @@ static int rpmsg_chrdev_init(void)
>  
>  	ret = alloc_chrdev_region(&rpmsg_major, 0, RPMSG_DEV_MAX, "rpmsg");
>  	if (ret < 0) {
> -		pr_err("rpmsg: failed to allocate char dev region\n");
> +		pr_err("failed to allocate char dev region\n");
>  		return ret;
>  	}
>  
> @@ -563,7 +566,7 @@ static int rpmsg_chrdev_init(void)
>  
>  	ret = register_rpmsg_driver(&rpmsg_chrdev_driver);
>  	if (ret < 0) {
> -		pr_err("rpmsgchr: failed to register rpmsg driver\n");
> +		pr_err("failed to register rpmsg driver\n");

This probably the right thing to do - I will pick up this patch.

Thanks,
Mathieu

>  		class_destroy(rpmsg_class);
>  		unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
>  	}
> -- 
> 2.17.1
> 
