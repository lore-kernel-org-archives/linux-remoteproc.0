Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE8B4C11F65
	for <linux-remoteproc@archiver.kernel.org>; Wed, 30 Jun 2021 20:39:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7EF6B61457
	for <linux-remoteproc@archiver.kernel.org>; Wed, 30 Jun 2021 20:39:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233899AbhF3Ulh (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 30 Jun 2021 16:41:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234996AbhF3Ulb (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 30 Jun 2021 16:41:31 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D663CC0617A8
        for <linux-remoteproc@vger.kernel.org>; Wed, 30 Jun 2021 13:39:01 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id b5so2198906plg.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 30 Jun 2021 13:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1QWbs7h30bnNV963rbbzjJDg0UDFTbJY6yBzK3R8mzg=;
        b=hPNODuyPg5Rw1fJUcM4FQLorWQylbBhvhPXzL9BR56UUv8auy73pUzuVprp2niJH9y
         648UPRT0FCkbQN54PhQvGm7BMqfcz4HzaY/fIukSwechh/s3tItlXuWLl5EDi9YRB040
         aP4xB4Mpdu0JRAVcVdKqezE1sUU+dAC5TtN9lLE58R7MIgEWnh3zTPAcV+/evTbgA21y
         1AF5nFlx6POoLmfAxBVgaUcUpdGPULTt/mmbPcGsnakygUjb5b0jDxZBMfOJ5WC0ahiX
         jP/q4YEAD5N5IR0fnE8Ndwl3UcEaNhrQ6C6eFeStiUXAZBDJTYZT9xtXGCLDbqykTPqY
         pgHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1QWbs7h30bnNV963rbbzjJDg0UDFTbJY6yBzK3R8mzg=;
        b=k8lUk4p0h1sJRecY5NNH6q29BQLDVBPouWLC36SMJabckDruuDV+WAY7JwZ8/VpluU
         fbykgBeEbkmSf0UTRf3Z7VQ3mN19ent/71NuYWGOPYa+hvzbLXDWH1BHt1jN6TiaEZGc
         z3KAc2JB675R/wIvoT/26+fCLvKYxLIV3Uih0eWWFf43monbqj+O8gbyU2OfWo/iPEuX
         THHST/2dkJd7FqcaCIKWmljfKgBJewDf5VV21Q9ySdZPJYPvOYbMYzafvmZNx3s+bJ89
         tEEyOrzcEA9giOc5wp7Q5Yh0KccgH8TvH3cTW+ibot6vW9MjphN4G4slkdSsDun5tm16
         WKFA==
X-Gm-Message-State: AOAM533ZNWkHo0mnFuwIEn5/gy8I4MUU/iIvVLvdmgFlevR5rSlv6hUC
        h0WyCA8cnS9kKRGYEUMF2XTBBA==
X-Google-Smtp-Source: ABdhPJxDuIvq0mqYDwGwJgxm0JEJP5gLA/GtqUYItFp3JZTSwPwTb7ZgJHTBlXQk1hmBRYmeYd0BLw==
X-Received: by 2002:a17:902:a3cf:b029:128:cade:7dd5 with SMTP id q15-20020a170902a3cfb0290128cade7dd5mr19411664plb.4.1625085541384;
        Wed, 30 Jun 2021 13:39:01 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id ay3sm14191539pjb.38.2021.06.30.13.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jun 2021 13:39:00 -0700 (PDT)
Date:   Wed, 30 Jun 2021 14:38:59 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, julien.massot@iot.bzh
Subject: Re: [PATCH v2 2/4] rpmsg: char: Introduce
 __rpmsg_chrdev_create_eptdev function
Message-ID: <20210630203859.GB1290178@p14s>
References: <20210623150504.14450-1-arnaud.pouliquen@foss.st.com>
 <20210623150504.14450-3-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210623150504.14450-3-arnaud.pouliquen@foss.st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Jun 23, 2021 at 05:05:02PM +0200, Arnaud Pouliquen wrote:
> Introduce the __rpmsg_chrdev_create_eptdev internal function that returns
> the rpmsg_eptdev context structure.
> 
> This patch prepares the introduction of a rpmsg channel device for the
> char device. The rpmsg device will need a reference to the context.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/rpmsg/rpmsg_char.c | 24 +++++++++++++++++++-----
>  1 file changed, 19 insertions(+), 5 deletions(-)
>

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index fbe10d527c5c..50b7d4b00175 100644
> --- a/drivers/rpmsg/rpmsg_char.c
> +++ b/drivers/rpmsg/rpmsg_char.c
> @@ -323,8 +323,9 @@ static void rpmsg_eptdev_release_device(struct device *dev)
>  	kfree(eptdev);
>  }
>  
> -int rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct device *parent,
> -			       struct rpmsg_channel_info chinfo)
> +static struct rpmsg_eptdev *__rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev,
> +							 struct device *parent,
> +							 struct rpmsg_channel_info chinfo)
>  {
>  	struct rpmsg_eptdev *eptdev;
>  	struct device *dev;
> @@ -332,7 +333,7 @@ int rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct device *parent
>  
>  	eptdev = kzalloc(sizeof(*eptdev), GFP_KERNEL);
>  	if (!eptdev)
> -		return -ENOMEM;
> +		return ERR_PTR(-ENOMEM);
>  
>  	dev = &eptdev->dev;
>  	eptdev->rpdev = rpdev;
> @@ -374,9 +375,10 @@ int rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct device *parent
>  	if (ret) {
>  		dev_err(dev, "device_add failed: %d\n", ret);
>  		put_device(dev);
> +		return ERR_PTR(ret);
>  	}
>  
> -	return ret;
> +	return eptdev;
>  
>  free_ept_ida:
>  	ida_simple_remove(&rpmsg_ept_ida, dev->id);
> @@ -386,7 +388,19 @@ int rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct device *parent
>  	put_device(dev);
>  	kfree(eptdev);
>  
> -	return ret;
> +	return ERR_PTR(ret);
> +}
> +
> +int rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct device *parent,
> +			       struct rpmsg_channel_info chinfo)
> +{
> +	struct rpmsg_eptdev *eptdev;
> +
> +	eptdev = __rpmsg_chrdev_eptdev_create(rpdev, parent, chinfo);
> +	if (IS_ERR(eptdev))
> +		return PTR_ERR(eptdev);
> +
> +	return 0;
>  }
>  EXPORT_SYMBOL(rpmsg_chrdev_eptdev_create);
>  
> -- 
> 2.17.1
> 
