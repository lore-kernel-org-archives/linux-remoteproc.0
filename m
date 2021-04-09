Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED2D1C433ED
	for <linux-remoteproc@archiver.kernel.org>; Fri,  9 Apr 2021 17:53:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B73C46115B
	for <linux-remoteproc@archiver.kernel.org>; Fri,  9 Apr 2021 17:53:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234250AbhDIRyI (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 9 Apr 2021 13:54:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233332AbhDIRyH (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 9 Apr 2021 13:54:07 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 072D1C061761
        for <linux-remoteproc@vger.kernel.org>; Fri,  9 Apr 2021 10:53:55 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id a12so4721988pfc.7
        for <linux-remoteproc@vger.kernel.org>; Fri, 09 Apr 2021 10:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=t0lA/jFVR3TTCjtnv1uyJJiTbsD33ku905quI/YeL/8=;
        b=ujzqBY4P8EW3BO2TN+Pcc1TuyrOGLeEzdi6LjPKFvGdzOrzLy+E3xdB6qDl7lnihv7
         mtR4mmom/nb94xbAaHAgP4YyETgvmhM99+46KpKkZiu7Mk73tAWdkdVgVaRqYJKW0hQI
         Bqa8PL8+fsaU9pm6TbG3aH7vLnq4jvdzsY87YLCIbLDBO8va6hggYohkPwYFX2cUKf5w
         VPXOBlEuxvHCiVhsPdUgwzjmx6BRnMTva66Bvgr+a6430LOyipUkgDPeMdxZeU1kv9Iz
         bST5+/kITQOvnzSmXiePB5EZlE9qgE6+aJ1EyCp36p4diDPPk6Ikgv+1G/OM1+JHsh4u
         Qpww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=t0lA/jFVR3TTCjtnv1uyJJiTbsD33ku905quI/YeL/8=;
        b=kAecSIYxnVpQbOswybUxoOuk0ZBf/sFBF6ddNRfHpFp1+NZ8Fe+ad/dr/M997Sy7rd
         JWK5X5JfrUMipvg3xUzIOZ7xq8mknEDOPDBonS1F0idsVH3P9BnjYDcmc0vSrIDosqu7
         jkYDWHrM7xkZclJQhfPbUUyD7XLrPqfF5c5yutCR+jPyHOJ5xSFumd+3k9dHAWGE6ExW
         vsVUcnYeHhMhK+SIeC6qqSeyzCm2qzFEm+XIDxbXAMd/vkXMznwxYrhBrHRqtzaeDC5R
         BA1F0auJlgc7Tw1v2WQPrmUV74uaIK1NTQn84HRxD/mHNisYBQkZBL/u78RdCsSwfA2c
         HCMA==
X-Gm-Message-State: AOAM530j3u1ukoUvCFtqoP1JqxbFWIbRAdKlxtgDnA6ijrp+phb9ZUOd
        2LFnA1S9XXvsmMWwp0LeFkKpyQ==
X-Google-Smtp-Source: ABdhPJzxMzOT86u7n+dmZg6aYJAHdUkT8NqqK1u+CwJMn8VdnNGQaux3HBYp8DZNloQZe9Q//Gftyw==
X-Received: by 2002:a05:6a00:883:b029:247:562:f8f9 with SMTP id q3-20020a056a000883b02902470562f8f9mr3739481pfj.34.1617990834443;
        Fri, 09 Apr 2021 10:53:54 -0700 (PDT)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id n73sm3049665pfd.196.2021.04.09.10.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 10:53:53 -0700 (PDT)
Date:   Fri, 9 Apr 2021 11:53:52 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Andy Gross <agross@kernel.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 4/7] rpmsg: char: Introduce __rpmsg_chrdev_create_eptdev
 function
Message-ID: <20210409175352.GB489094@xps15>
References: <20210323122737.23035-1-arnaud.pouliquen@foss.st.com>
 <20210323122737.23035-5-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210323122737.23035-5-arnaud.pouliquen@foss.st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Mar 23, 2021 at 01:27:34PM +0100, Arnaud Pouliquen wrote:
> Introduce the __rpmsg_chrdev_create_eptdev internal function that returns
> the rpmsg_eptdev context structure.
> 
> This patch prepares the introduction of a rpmsg channel device for the
> char device. The rpmsg device will need a reference to the context.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> 
> ---
> update from [1]
> - propagate parent param in rpmsg_chrdev_create_eptdev,
> - fix changelog.
> 
> [1] https://patchwork.kernel.org/project/linux-remoteproc/patch/20210219111501.14261-14-arnaud.pouliquen@foss.st.com/
> ---
>  drivers/rpmsg/rpmsg_char.c | 21 +++++++++++++++++----
>  1 file changed, 17 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index 5d4a768002ce..7f6d46078179 100644
> --- a/drivers/rpmsg/rpmsg_char.c
> +++ b/drivers/rpmsg/rpmsg_char.c
> @@ -325,7 +325,8 @@ static void rpmsg_eptdev_release_device(struct device *dev)
>  	kfree(eptdev);
>  }
>  
> -int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent,
> +static struct rpmsg_eptdev *__rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev,
> +							 struct device *parent,
>  			       struct rpmsg_channel_info chinfo, struct class *rpmsg_class)

Please fix:

static struct rpmsg_eptdev *
__rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent,
                             struct rpmsg_channel_info chinfo, struct class *rpmsg_class)

>  {
>  	struct rpmsg_eptdev *eptdev;
> @@ -334,7 +335,7 @@ int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent
>  
>  	eptdev = kzalloc(sizeof(*eptdev), GFP_KERNEL);
>  	if (!eptdev)
> -		return -ENOMEM;
> +		return ERR_PTR(-ENOMEM);
>  
>  	dev = &eptdev->dev;
>  	eptdev->rpdev = rpdev;
> @@ -378,7 +379,7 @@ int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent
>  		put_device(dev);
>  	}
>  
> -	return ret;
> +	return eptdev;
>  
>  free_ept_ida:
>  	ida_simple_remove(&rpmsg_ept_ida, dev->id);
> @@ -388,7 +389,19 @@ int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent
>  	put_device(dev);
>  	kfree(eptdev);
>  
> -	return ret;
> +	return ERR_PTR(ret);
> +}
> +
> +int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent,
> +			       struct rpmsg_channel_info chinfo,  struct class *rpmsg_class)
> +{
> +	struct rpmsg_eptdev *eptdev;
> +
> +	eptdev = __rpmsg_chrdev_create_eptdev(rpdev, parent, chinfo, rpmsg_class);
> +	if (IS_ERR(eptdev))
> +		return PTR_ERR(eptdev);
> +
> +	return 0;
>  }
>  EXPORT_SYMBOL(rpmsg_chrdev_create_eptdev);
>  
> -- 
> 2.17.1
> 
