Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EABF7C433E0
	for <linux-remoteproc@archiver.kernel.org>; Thu, 14 Jan 2021 19:06:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A655623A05
	for <linux-remoteproc@archiver.kernel.org>; Thu, 14 Jan 2021 19:06:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728773AbhANTG0 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 14 Jan 2021 14:06:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727872AbhANTG0 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 14 Jan 2021 14:06:26 -0500
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53A5DC061575
        for <linux-remoteproc@vger.kernel.org>; Thu, 14 Jan 2021 11:05:46 -0800 (PST)
Received: by mail-pf1-x436.google.com with SMTP id h186so3927994pfe.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 14 Jan 2021 11:05:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9eQpCXhKjCHwg9nJ0ZvUFOOkfeOuaFDT4T5heWosDRk=;
        b=sqRjubUVFoI42sWF35FLYlG5wrhrTfG4ofY/KnCDSFr1CiweQKiYdOu+Y2g9Vkw1rB
         j7tJuC9H85ZI5gZGIIU0Mm0pdWrGni6WCcHB+VdhE2tw5zihK4JpZc3CFOZm2UWTUwvo
         DmYW8eIXE2s2a1Yhi6JaR5ZYDO5ykeGGQ+0I48muB+KYO1rEim4vfFR2jkcg7RhjsKYI
         LDIM4WFj0a5rXDo0jXymb8cAGEzd9ffnhKW/U0FletCAqcqQyh4QfZEHGvJHPBGpsjB+
         pH+8We+T8OTCPqxvCCpb/DQ+Tzf5JXWQm7T8FBKtW0opDpEhrvqXH3Keaf09io5M3uVK
         YLag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9eQpCXhKjCHwg9nJ0ZvUFOOkfeOuaFDT4T5heWosDRk=;
        b=Lr1UwN/XeDgz6R4jWoNrcyIfPP2tMzXUiTDUpAOBZn5rREMWKUhGpSk/ooFgP09e6I
         WR5Fpw5+RvrMBiQ8dqF5mG76juHpokAAT7LdRoss4ZPwzfZFkwEjb/y4SPAj4YJQDbzU
         AxXiuAzYF61q59dz3JtzI8Nhjb+d7V13WT4FxZ+GDLQQR2c8Qu3/+Ho7FP4S9wcCaNRi
         mBC5erakOfZoBFwr1V/oNJiPAnm7DNqfE77NpIi+ggkQJNlM+3TiPIgimYi2CN9p5zYg
         SNYTy0LR2jeP8XEd1ZFgjLctLtbdoKoppoqZA/hRfrOcKqVVXFTqVVd9sKp+Vkwf0Wqb
         FClQ==
X-Gm-Message-State: AOAM532jWgS9e8o0JD+h5ukZBrO7rA149tbOR7vgEDt0LrWLVbGRD5tn
        AWvivOuXV2IToEF1NLTrrcSIxw==
X-Google-Smtp-Source: ABdhPJyn8ffJyXOF9cK+jocYwrLCcfz6CojMYiM4QGvdeTEZoBPlKtMfSWkixhuPd+fqpuT7Av6Hpw==
X-Received: by 2002:a63:7904:: with SMTP id u4mr8851614pgc.41.1610651145903;
        Thu, 14 Jan 2021 11:05:45 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id g30sm5504881pfr.152.2021.01.14.11.05.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 11:05:45 -0800 (PST)
Date:   Thu, 14 Jan 2021 12:05:43 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH] rpmsg: char: return an error if device already open
Message-ID: <20210114190543.GB255481@xps15>
References: <20210106133714.9984-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210106133714.9984-1-arnaud.pouliquen@foss.st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Jan 06, 2021 at 02:37:14PM +0100, Arnaud Pouliquen wrote:
> The rpmsg_create_ept function is invoked when the device is opened.
> As only one endpoint must be created per device. It is not
> possible to open the same device twice.
> The fix consists in returning -EBUSY when device is already
> opened.
> 
> Fixes: c0cdc19f84a4 ("rpmsg: Driver for user space endpoint interface")
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/rpmsg/rpmsg_char.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index 4bbbacdbf3bb..360a1ab0a9c4 100644
> --- a/drivers/rpmsg/rpmsg_char.c
> +++ b/drivers/rpmsg/rpmsg_char.c
> @@ -127,6 +127,9 @@ static int rpmsg_eptdev_open(struct inode *inode, struct file *filp)
>  	struct rpmsg_device *rpdev = eptdev->rpdev;
>  	struct device *dev = &eptdev->dev;
>  
> +	if (eptdev->ept)
> +		return -EBUSY;
> +

I rarely had to work so hard to review a 2 line patch...

As far as I can tell the actual code is doing the right thing.  If user space is
trying to open the same eptdev more than once function rpmsg_create_ept() should
complain and the operation denied, wich is what the current code is doing.  

There is currently two customers for this API - SMD and GLINK.  The SMD code is
quite clear that if the channel is already open, the operation will be
denied [1].  The GLINK code isn't as clear but the fact that it returns NULL on
error conditions [2] is a good indication that things are working the same way.

What kind of use case are you looking to address?  Is there any way you can use
rpdev->ops->create_ept() as it is currently done?

Thanks,
Mathieu

[1]. https://elixir.bootlin.com/linux/v5.11-rc3/source/drivers/rpmsg/qcom_smd.c#L920
[2]. https://elixir.bootlin.com/linux/v5.11-rc3/source/drivers/rpmsg/qcom_glink_native.c#L1149

>  	get_device(dev);
>  
>  	ept = rpmsg_create_ept(rpdev, rpmsg_ept_cb, eptdev, eptdev->chinfo);
> -- 
> 2.17.1
> 
