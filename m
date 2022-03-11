Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4D58C433FE
	for <linux-remoteproc@archiver.kernel.org>; Fri, 11 Mar 2022 20:55:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230173AbiCKU4J (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 11 Mar 2022 15:56:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230324AbiCKU4I (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 11 Mar 2022 15:56:08 -0500
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com [IPv6:2607:f8b0:4864:20::c29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A7A32028AB
        for <linux-remoteproc@vger.kernel.org>; Fri, 11 Mar 2022 12:54:55 -0800 (PST)
Received: by mail-oo1-xc29.google.com with SMTP id n5-20020a4a9545000000b0031d45a442feso11945373ooi.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 11 Mar 2022 12:54:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1Eb4lJ/gRDGHQtzxeJ/n15BUoLk+AfXEc1aV/y6NJFo=;
        b=mD6CQw0YWd3H8i8Emv3nPIRx2chGxuqbAk1C75U0CqzBBTn9zloG/aU5nIwgWuMjxc
         UNkPmd8Pwd4Duvvp6MIgSvRF6LPOgQQ8aG12+/IS04ubDMbb1ZXfGGjaA+V2hEqhdMsF
         L7Iw19u8joHut2ekiM4dK6FMbRZ4wGH6jP3ps9KWjKXPkFzGEMw/DcjRDwxmpRY0vZE2
         qOEDk0a1Bh8kjMzxvUa+36rTE9pdSV+DJ8IfrmBQhLYiJucMJEXg+S7RYm8+h5JukFhL
         IC0hP3TnWoHw+wu0sPhi7zeITEXSB32A3lFsLhZ5MxwhDSvp5v6S+59ACGi6RfgRkEHh
         7klQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1Eb4lJ/gRDGHQtzxeJ/n15BUoLk+AfXEc1aV/y6NJFo=;
        b=qtgn8arIWonpJ59ch80HQTuW454cHOZ4cWDONoo1SMZERP4NXG+wqRmwuRg8MxJdfb
         ejevJUEMT3M9NjCCn3JPiphC47sI9jBZXG9n8SnV6ImayQwdWw/uP7QGSn2wzxeAX1wX
         RB7mdmumsk41qYUuA4IW758vMJW0h006nrIAi7MgJYJFC6FGGqO0W3aqY5Ktm64/lUK1
         fpsA+3OdK3eh/lPSL/+YMowCR6iYIqc+akzF6Oup9Y4/Ktol2N6gkOs3y4irWYQRlrfN
         +FgCBdhKljw0XhFeYTT/S+P2CBoIx+SSGyEfPPxqde0pvJhwG+mqMgSv7KIo0hXYaIGQ
         DNCg==
X-Gm-Message-State: AOAM53356mYKZUYmus2tjL5sgvM1vHGZi+tk4/RMEM4FanoYYyQZcaX/
        dENQsGgvhmYsYLnQCqHMlqr/GA==
X-Google-Smtp-Source: ABdhPJy5GmX5UQ0mj0ySsNzmIfZIFATXV7mzuj3RfTYMC74asWaMPo8GP7EpX/K3319p7uZfI+aziQ==
X-Received: by 2002:a05:6870:a986:b0:da:b3f:3277 with SMTP id ep6-20020a056870a98600b000da0b3f3277mr6854732oab.295.1647032089018;
        Fri, 11 Mar 2022 12:54:49 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id o10-20020acaf00a000000b002da04e165a4sm4245817oih.23.2022.03.11.12.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Mar 2022 12:54:48 -0800 (PST)
Date:   Fri, 11 Mar 2022 14:54:46 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Deepak Kumar Singh <quic_deesin@quicinc.com>
Cc:     swboyd@chromium.org, quic_clew@quicinc.com,
        mathieu.poirier@linaro.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Ohad Ben-Cohen <ohad@wizery.com>
Subject: Re: [PATCH V1 3/3] rpmsg: glink: Add lock for ctrl device
Message-ID: <Yiu3Fl/Diw5iqh24@builder.lan>
References: <1643223886-28170-1-git-send-email-quic_deesin@quicinc.com>
 <1643223886-28170-4-git-send-email-quic_deesin@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1643223886-28170-4-git-send-email-quic_deesin@quicinc.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed 26 Jan 13:04 CST 2022, Deepak Kumar Singh wrote:

> Race between rpmsg_eptdev_create and rpmsg_chrdev_remove
> can sometime casue crash while accessing rpdev while new
> endpoint is being created. Using lock ensure no new eptdev
> is created after rpmsg_chrdev_remove has been completed.

This patch lacks a Signed-off-by.

Isn't this solving the same problem as the previous patch? Would be nice
with some more specifics on the race that you're seeing.

Thanks,
Bjorn

> ---
>  drivers/rpmsg/rpmsg_char.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index 2108ef8..3e5b85d 100644
> --- a/drivers/rpmsg/rpmsg_char.c
> +++ b/drivers/rpmsg/rpmsg_char.c
> @@ -27,6 +27,7 @@
>  
>  static dev_t rpmsg_major;
>  static struct class *rpmsg_class;
> +struct mutex ctrl_lock;
>  
>  static DEFINE_IDA(rpmsg_ctrl_ida);
>  static DEFINE_IDA(rpmsg_ept_ida);
> @@ -396,9 +397,12 @@ static int rpmsg_eptdev_create(struct rpmsg_ctrldev *ctrldev,
>  	struct device *dev;
>  	int ret;
>  
> +	mutex_lock(&ctrl_lock);
>  	eptdev = kzalloc(sizeof(*eptdev), GFP_KERNEL);
> -	if (!eptdev)
> +	if (!eptdev) {
> +		mutex_unlock(&ctrl_lock);
>  		return -ENOMEM;
> +	}
>  
>  	dev = &eptdev->dev;
>  	eptdev->rpdev = rpdev;
> @@ -443,6 +447,7 @@ static int rpmsg_eptdev_create(struct rpmsg_ctrldev *ctrldev,
>  		put_device(dev);
>  	}
>  
> +	mutex_unlock(&ctrl_lock);
>  	return ret;
>  
>  free_ept_ida:
> @@ -453,6 +458,7 @@ static int rpmsg_eptdev_create(struct rpmsg_ctrldev *ctrldev,
>  	put_device(dev);
>  	kfree(eptdev);
>  
> +	mutex_unlock(&ctrl_lock);
>  	return ret;
>  }
>  
> @@ -525,6 +531,7 @@ static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
>  	if (!ctrldev)
>  		return -ENOMEM;
>  
> +	mutex_init(&ctrl_lock);
>  	ctrldev->rpdev = rpdev;
>  
>  	dev = &ctrldev->dev;
> @@ -581,12 +588,14 @@ static void rpmsg_chrdev_remove(struct rpmsg_device *rpdev)
>  	int ret;
>  
>  	/* Destroy all endpoints */
> +	mutex_lock(&ctrl_lock);
>  	ret = device_for_each_child(&ctrldev->dev, NULL, rpmsg_eptdev_destroy);
>  	if (ret)
>  		dev_warn(&rpdev->dev, "failed to nuke endpoints: %d\n", ret);
>  
>  	device_del(&ctrldev->dev);
>  	put_device(&ctrldev->dev);
> +	mutex_unlock(&ctrl_lock);
>  }
>  
>  static struct rpmsg_driver rpmsg_chrdev_driver = {
> -- 
> 2.7.4
> 
