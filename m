Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86DA8C433ED
	for <linux-remoteproc@archiver.kernel.org>; Thu, 22 Apr 2021 18:05:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4489E613D8
	for <linux-remoteproc@archiver.kernel.org>; Thu, 22 Apr 2021 18:05:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236660AbhDVSFg (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 22 Apr 2021 14:05:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236459AbhDVSFf (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 22 Apr 2021 14:05:35 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91825C061756
        for <linux-remoteproc@vger.kernel.org>; Thu, 22 Apr 2021 11:04:58 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id d124so32232402pfa.13
        for <linux-remoteproc@vger.kernel.org>; Thu, 22 Apr 2021 11:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8DyCq2os32b/ZRYdNBKzb//1RkdLowyIWLVKKhCF2PA=;
        b=HGV9QCo1og7yK9vy+06kusMk4C4C0iyhIm/rxx6EmD/OOC9gQOMKVXWssLLl4HmsfL
         U+xHZngoKH6ToiI8LVc1ftY6d5QuSPB84p5PzvNJhRX2pnHLI4cqOFuaoHi9C+UnfiY3
         8PCLSP8NeZ6ourTHYXWEAOElYqAYkMFOPFECiGpwxqIxAKeTCEjjwaNH9Qsrlb+4AtQ/
         JmRrNW7U3a2nRru5wGA02I3eFIH1cwGKNZog/6xiKTU8S/XlKW5uAtRiPWe4rFdAzSet
         CZ85My4JJ5cTDaImWSHFps6pcjFJBsiz7UC3Ugnidmd10N60yfhfbaBx4/8kG2TOzw5V
         t7aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8DyCq2os32b/ZRYdNBKzb//1RkdLowyIWLVKKhCF2PA=;
        b=gQmCjz4vEpduIf9DXlTG4xnOJWIjyFEdqqu2VXjZjvJUeuGzovn6w4wbkhLcdqXHF1
         dYxEgqnXT217bv8FGHyUHLlPPnOWs1B6dmTzQrKJz2hQ1an5U0D10LfE1VZascbnCALf
         k8XCzGJmYUE77hfJjfoVXCMv2R4NE+sRbTBZZzvrVtk7abBbzxk8qHdJlGunlL5Fsq69
         cD2I11tw5j/tux/gKh6eX/tkYIcr4fsUmI63a8poZrLv/5MgU2vSh9s8IEtaML2UyFBS
         5nk4Ea1jbVvWKV1l5l6zFidSJCDki5CgLnhNA8gM51ackVyeass1CuS6O2asTVx/5RtA
         +Rfw==
X-Gm-Message-State: AOAM5334DVCjSMeoYpcAjTLqUBh6a0ZDWqYHTGNTnsbD2WR/h/C6yzkg
        IQ+9GwmOoH7LCNIzBtMGqsGSYQ==
X-Google-Smtp-Source: ABdhPJxzJk0/sfz834RgXlWUfIvDG1YLrHWPOrAQK4/gxBQuAPVSSE51shnGQjktSlxxUzCBC5uHuw==
X-Received: by 2002:aa7:9add:0:b029:260:8c8a:91fb with SMTP id x29-20020aa79add0000b02902608c8a91fbmr4745676pfp.21.1619114698034;
        Thu, 22 Apr 2021 11:04:58 -0700 (PDT)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id d4sm5309906pjz.49.2021.04.22.11.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Apr 2021 11:04:56 -0700 (PDT)
Date:   Thu, 22 Apr 2021 12:04:55 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Siddharth Gupta <sidgup@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, ohad@wizery.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        psodagud@codeaurora.org, eberman@codeaurora.org
Subject: Re: [PATCH] remoteproc: core: Move cdev add before device add
Message-ID: <20210422180455.GE1256950@xps15>
References: <1618946805-26970-1-git-send-email-sidgup@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1618946805-26970-1-git-send-email-sidgup@codeaurora.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Siddharth,

On Tue, Apr 20, 2021 at 12:26:45PM -0700, Siddharth Gupta wrote:
> When cdev_add is called after device_add has been called there is no
> way for the userspace to know about the addition of a cdev as cdev_add
> itself doesn't trigger a uevent notification, or for the kernel to
> know about the change to devt. This results in two problems:
>  - mknod is never called for the cdev and hence no cdev appears on
>    devtmpfs.
>  - sysfs links to the new cdev are not established.
> 
> Based on how cdev_device_add[1] is written, it appears that the correct

Please don't add this kind of reference to the change log as it will become
invalid with time.

> way to use these APIs is to call cdev_add before device_add is called.
> Since the cdev is an optional feature for remoteproc we cannot directly
> use the existing API.

Please explain why the existing API can't be used directly.

> Hence moving rproc_char_device_add() before
> device_add() in rproc_add().
> 
> [1]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/fs/char_dev.c#n537
> 
> Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
> ---
>  drivers/remoteproc/remoteproc_core.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 626a6b90f..562355a 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -2316,6 +2316,11 @@ int rproc_add(struct rproc *rproc)
>  	struct device *dev = &rproc->dev;
>  	int ret;
>  
> +	/* add char device for this remoteproc */
> +	ret = rproc_char_device_add(rproc);
> +	if (ret < 0)
> +		return ret;
> +

I have tested this change and it works.  So how did it work before?

>  	ret = device_add(dev);
>  	if (ret < 0)
>  		return ret;
> @@ -2329,11 +2334,6 @@ int rproc_add(struct rproc *rproc)
>  	/* create debugfs entries */
>  	rproc_create_debug_dir(rproc);
>  
> -	/* add char device for this remoteproc */
> -	ret = rproc_char_device_add(rproc);
> -	if (ret < 0)
> -		return ret;
> -

While reviewing this patch I had another look at rproc_add() and noticed it
doesn't clean up after itself in case of failure.  If any of the conditions
aren't met the function returns but rproc_delete_debug_dir(),
rproc_char_device_remove() and device_del() aren't called.  Please fix that as
part of your next revision.

Thanks,
Mathieu


>  	/* if rproc is marked always-on, request it to boot */
>  	if (rproc->auto_boot) {
>  		ret = rproc_trigger_auto_boot(rproc);
> -- 
> Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
