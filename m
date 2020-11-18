Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32C6CC6369E
	for <linux-remoteproc@archiver.kernel.org>; Wed, 18 Nov 2020 15:39:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9133C20BED
	for <linux-remoteproc@archiver.kernel.org>; Wed, 18 Nov 2020 15:39:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wYTZDFlA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727457AbgKRPib (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 18 Nov 2020 10:38:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727451AbgKRPib (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 18 Nov 2020 10:38:31 -0500
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C786BC0613D6
        for <linux-remoteproc@vger.kernel.org>; Wed, 18 Nov 2020 07:38:29 -0800 (PST)
Received: by mail-ot1-x342.google.com with SMTP id o3so2116161ota.8
        for <linux-remoteproc@vger.kernel.org>; Wed, 18 Nov 2020 07:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=TsvK+IoKETFNYhIytzLBxH/j36F8chmPX/TnN3zexa8=;
        b=wYTZDFlA3tUB95X6qvT5yBzXs1b2g8nlWXan51fiHn2N+LE4I54ylPBZRAGyURuAWL
         DEKkC/37ZcTA1+/6PpMkt/qP+wZyI9zSSF3h8plfg3GSMCdDfMgamCXK5YCCtmEsLL6T
         56WMDqhXLUIIa1oSlBVNEYdEJFDJYUV816WHapudQlwcxnnBThvaIBiTJ+/hOK/WEUdr
         8kArerUAGhZZeace4X3nLWn2FD8yXofEm3LM6/TJphpgGOBjOZPIU8BnLKYJhwOjfJL+
         uF9hOVkf0rJDyigkpyQg6/GAIMpYOqaYn8HXDf9+M5ONyYr1xW+Np3qLvrAptMaRht0m
         jhBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TsvK+IoKETFNYhIytzLBxH/j36F8chmPX/TnN3zexa8=;
        b=TlfafvFNsS3jPhyNyxBzs2Qqb7C7sI7qzyvVXrymvR07mdkyM11ob3KDazfHW+IKzw
         j94ygkcZVjrxu+Mx5lIN7P73Kmi+Yor2oS9pltJS1L9hbfPLEm9ik4wgiElUnAw05M6r
         8RTYVr50Es9sdl1or3LRuzWlVKnzRUPrNAjD463hn2j1lFYdlidVInX5fyNEpjD0SnzL
         nP51ccOpUHOSKyQS4CX4eDgh4sJHOIzs46Ke0RurVRkwn/RQI8WhFNqVQvGiB7Zt9K5i
         3w2WCBGK8F6GJaKTXR1F5cmTprbXcdzm1v+CG/7Zubh6vqa64d8XRTuhvrho7iGbUWIv
         KHVg==
X-Gm-Message-State: AOAM533dfKXsgg+uIjRj7wppcCEUM2iklli37IiKlFhpk0w9K30LwsHa
        fcsqgOLcM+hxQyhJKpUsGVo0TA==
X-Google-Smtp-Source: ABdhPJzywmas3hikLpSgLLjiOMgRkgImxu3xoAApCX2PhesJEy70rQd6gd6216DeBtWyOphhReAUCQ==
X-Received: by 2002:a05:6830:204f:: with SMTP id f15mr6534274otp.80.1605713909174;
        Wed, 18 Nov 2020 07:38:29 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id y8sm7592882ota.64.2020.11.18.07.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2020 07:38:28 -0800 (PST)
Date:   Wed, 18 Nov 2020 09:38:26 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Siddharth Gupta <sidgup@codeaurora.org>
Cc:     agross@kernel.org, ohad@wizery.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, rishabhb@codeaurora.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v7 1/4] remoteproc: core: Add ops to enable custom
 coredump functionality
Message-ID: <20201118153826.GA9177@builder.lan>
References: <1604395160-12443-1-git-send-email-sidgup@codeaurora.org>
 <1604395160-12443-2-git-send-email-sidgup@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1604395160-12443-2-git-send-email-sidgup@codeaurora.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue 03 Nov 03:19 CST 2020, Siddharth Gupta wrote:

> Each remoteproc might have different requirements for coredumps and might
> want to choose the type of dumps it wants to collect. This change allows
> remoteproc drivers to specify their own custom dump function to be executed
> in place of rproc_coredump. If the coredump op is not specified by the
> remoteproc driver it will be set to rproc_coredump by default.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
> ---
>  drivers/remoteproc/remoteproc_core.c | 6 +++++-
>  include/linux/remoteproc.h           | 2 ++
>  2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index dab2c0f..eba7543 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1704,7 +1704,7 @@ int rproc_trigger_recovery(struct rproc *rproc)
>  		goto unlock_mutex;
>  
>  	/* generate coredump */
> -	rproc_coredump(rproc);
> +	rproc->ops->coredump(rproc);
>  
>  	/* load firmware */
>  	ret = request_firmware(&firmware_p, rproc->firmware, dev);
> @@ -2126,6 +2126,10 @@ static int rproc_alloc_ops(struct rproc *rproc, const struct rproc_ops *ops)
>  	if (!rproc->ops)
>  		return -ENOMEM;
>  
> +	/* Default to rproc_coredump if no coredump function is specified */
> +	if (!rproc->ops->coredump)
> +		rproc->ops->coredump = rproc_coredump;
> +
>  	if (rproc->ops->load)
>  		return 0;
>  
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index 3fa3ba6..a419878 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -375,6 +375,7 @@ enum rsc_handling_status {
>   * @get_boot_addr:	get boot address to entry point specified in firmware
>   * @panic:	optional callback to react to system panic, core will delay
>   *		panic at least the returned number of milliseconds
> + * @coredump:	  collect firmware dump after the subsystem is shutdown
>   */
>  struct rproc_ops {
>  	int (*prepare)(struct rproc *rproc);
> @@ -393,6 +394,7 @@ struct rproc_ops {
>  	int (*sanity_check)(struct rproc *rproc, const struct firmware *fw);
>  	u64 (*get_boot_addr)(struct rproc *rproc, const struct firmware *fw);
>  	unsigned long (*panic)(struct rproc *rproc);
> +	void (*coredump)(struct rproc *rproc);
>  };
>  
>  /**
> -- 
> Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
