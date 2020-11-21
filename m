Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E45DC56202
	for <linux-remoteproc@archiver.kernel.org>; Sat, 21 Nov 2020 04:03:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E88DE22269
	for <linux-remoteproc@archiver.kernel.org>; Sat, 21 Nov 2020 04:03:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V3ft2O8J"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727317AbgKUEDQ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 20 Nov 2020 23:03:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727166AbgKUEDQ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 20 Nov 2020 23:03:16 -0500
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96C44C061A48
        for <linux-remoteproc@vger.kernel.org>; Fri, 20 Nov 2020 20:03:15 -0800 (PST)
Received: by mail-oi1-x242.google.com with SMTP id t16so12881278oie.11
        for <linux-remoteproc@vger.kernel.org>; Fri, 20 Nov 2020 20:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=d+Jt7Kw8tpbR0XZRec6xgDcNSJxFLJiVa/Gv05lalew=;
        b=V3ft2O8JeSSLMy1nZsUqp23pVt9eilwqNNaJ56mAPY3c4Px4/iFl7M1t8ww4Ilfhru
         4Sz1i4Rdgy9ormCWbNs36UPOAAZM7DbHZDP56Qth9Nxgqw6Zn1PGQygV4M3/kQcAx7RL
         x9+f4zU1depG3fJ1LmEFunDbPTePXby+FCOl3YdEwfmA26Edtg0MuMiYJKUnrn+1HAZE
         3u9nXxptvpeVxQ1adajzI/rH4xBMVKsMBte1uHGXMgBTa9ACOKW6FJ1S7zuV8s4wnc5Y
         tKeHrudxFAgkhGD4XNQxf8+DEWvQdR+3/GoAw2ZgKng94WulU1km7lCF1ejtbJk02zB9
         xF/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=d+Jt7Kw8tpbR0XZRec6xgDcNSJxFLJiVa/Gv05lalew=;
        b=EJa+rDfKei9CuiA4upnh+csn6iLCCMr8kyNYJwAm5HddKY5ibYiLXiPB5hcPWk5uM9
         XIpFgWLbGlaod5s5FGCXZaCN0VsmykaKUXC0+Ze+Dd5Dags4cRr3bDBNWz/WKbu5KcQd
         tPzsHSgLIyc8++RFk3NQqLbZ1pPdmT48TGyCWnkLmpWFQde1rMZLzYTzpMAkMS3SnSAV
         bJUjzQ7RLRfnGfQsyhTnBYyX8zaBZdiuiE6RctWY+XotrHjAU3D8wkTFVAsEjwHLC/fY
         ExOOw5xnQ4Vb5Yfm/iGUeS6/Qg/QIJIujWnIqD6uPWpaCYFb1CtktT2cydibk7XELpwY
         /2Pg==
X-Gm-Message-State: AOAM530/BpLiQwrdLlXLPlJrXX+139dGp6Up5yvZjkGajnYbsr3xUz98
        OfuJj+Jtu0Tqmmk888/5bc0sJA==
X-Google-Smtp-Source: ABdhPJxVDjWGCc5NwMV+giup5gCgzYtcJnesWwSzwDESxca8dWpFgXUfe5hC+9eX7BMITuhs6jJQIA==
X-Received: by 2002:aca:a9c8:: with SMTP id s191mr8025691oie.11.1605931394890;
        Fri, 20 Nov 2020 20:03:14 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id o63sm2781105ooa.10.2020.11.20.20.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 20:03:14 -0800 (PST)
Date:   Fri, 20 Nov 2020 22:03:12 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Siddharth Gupta <sidgup@codeaurora.org>
Cc:     agross@kernel.org, ohad@wizery.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, rishabhb@codeaurora.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v8 1/4] remoteproc: core: Add ops to enable custom
 coredump functionality
Message-ID: <20201121040312.GJ9177@builder.lan>
References: <1605819935-10726-1-git-send-email-sidgup@codeaurora.org>
 <1605819935-10726-2-git-send-email-sidgup@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1605819935-10726-2-git-send-email-sidgup@codeaurora.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu 19 Nov 15:05 CST 2020, Siddharth Gupta wrote:

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
