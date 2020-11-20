Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5B78C2D0E4
	for <linux-remoteproc@archiver.kernel.org>; Fri, 20 Nov 2020 22:37:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 60E0822470
	for <linux-remoteproc@archiver.kernel.org>; Fri, 20 Nov 2020 22:37:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IiJvOOQf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728282AbgKTWhF (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 20 Nov 2020 17:37:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728260AbgKTWhE (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 20 Nov 2020 17:37:04 -0500
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CABB0C061A04
        for <linux-remoteproc@vger.kernel.org>; Fri, 20 Nov 2020 14:37:04 -0800 (PST)
Received: by mail-pg1-x542.google.com with SMTP id f18so8529881pgi.8
        for <linux-remoteproc@vger.kernel.org>; Fri, 20 Nov 2020 14:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=4zBsSClJxK/oRC1/vhFa/cwjuf3LYCK8JJOKPWg9iec=;
        b=IiJvOOQfoY3zYljz6wJd/z8j1MJMr60n656zy9wu42s1EcN4zs31x16q0hrbj9o0Qt
         grw3V1YyAqeMtmk1aKaFCOkNpInUU1/IXMXxXYbW0f65LcRN9XjvZcJwPTgPsPTQCUMe
         4d9EcZ8CJrlNBwmzXR8wa+xIxkkpeDch0xSDStaKjYrLhq5guO6H5r3AiLPGdrSxGqA0
         aKinU4UUF47pI/TV1+IYMYLeEEOlVpAkYE0L4/mZ+WsyXUjZH+hueca0wYUdYe+c+RyI
         FXwqGMNwZ76rgC+kuSYkCw0A9uiPbSVF7xhw/JsCv4VzbqGzoqwM8T/A/uxK5Z6lK68Z
         yVzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4zBsSClJxK/oRC1/vhFa/cwjuf3LYCK8JJOKPWg9iec=;
        b=GSWBxXRxLkQYBTqCsjM/edOLKp1DXIQY0q6bDTVHIXCuQ6ocSpzMbv8p0mXDQvLKAy
         m7l8SXOpwNIHudBTg5ScEmcduUVt90H/Z5DLYL8IgWI4Hmb8tZVHl6u6O7TXOMB38VXs
         BfDsn+zBu0g3+O3TzrmryiyPR1pAVacQDwPvCL+th1UypHAjF6Q+ZhlRVigDQ88HOm5Q
         MqSinUmF240T+Ratzer9/2fDoGTZ5lvggH4ENu9OBv6jqk9TzxCuAM7RVZJV8DgYWV6Z
         oWX2886KgvO+CU3INS1dCGUZ6/HhGUfTCPwlDkMKEl+nYs3gYN1eG49L59ppJcHYXFby
         dDAQ==
X-Gm-Message-State: AOAM530UMU1K8tITyOpF8LgIkF2Nx7l2P5NGNDMvWRGpDYGXsBTuOLDb
        T8Y9wd+WBVjoGzTgOqybZg//gg==
X-Google-Smtp-Source: ABdhPJz9vh7QXNVSMeNOljxwXcEdKLKPOsBMHRM83Y5rYhvQAkwQSFFkDuQ+ybVfYd+6FX1n+Y6vZA==
X-Received: by 2002:a62:2a8c:0:b029:197:a56b:8e79 with SMTP id q134-20020a622a8c0000b0290197a56b8e79mr11024847pfq.51.1605911824277;
        Fri, 20 Nov 2020 14:37:04 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id u197sm5089110pfc.127.2020.11.20.14.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 14:37:03 -0800 (PST)
Date:   Fri, 20 Nov 2020 15:37:01 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>, od@zcrc.me,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: Add module parameter 'auto_boot'
Message-ID: <20201120223701.GF4137289@xps15>
References: <20201115115056.83225-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201115115056.83225-1-paul@crapouillou.net>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Paul,

On Sun, Nov 15, 2020 at 11:50:56AM +0000, Paul Cercueil wrote:
> Until now the remoteproc core would always default to trying to boot the
> remote processor at startup. The various remoteproc drivers could
> however override that setting.
> 
> Whether or not we want the remote processor to boot, really depends on
> the nature of the processor itself - a processor built into a WiFi chip
> will need to be booted for the WiFi hardware to be usable, for instance,
> but a general-purpose co-processor does not have any predeterminated
> function, and as such we cannot assume that the OS will want the
> processor to be booted - yet alone that we have a single do-it-all
> firmware to load.
>

If I understand correctly you have various remote processors that use the same firmware
but are serving different purposes - is this correct?
 
> Add a 'auto_boot' module parameter that instructs the remoteproc whether
> or not it should auto-boot the remote processor, which will default to
> "true" to respect the previous behaviour.
>

Given that the core can't be a module I wonder if this isn't something that
would be better off in the specific platform driver or the device tree...  Other
people might have an opinion as well.

Thanks,
Mathieu

> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  drivers/remoteproc/remoteproc_core.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index dab2c0f5caf0..687b1bfd49db 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -44,6 +44,11 @@
>  
>  #define HIGH_BITS_MASK 0xFFFFFFFF00000000ULL
>  
> +static bool auto_boot = true;
> +module_param(auto_boot, bool, 0400);
> +MODULE_PARM_DESC(auto_boot,
> +		 "Auto-boot the remote processor [default=true]");
> +
>  static DEFINE_MUTEX(rproc_list_mutex);
>  static LIST_HEAD(rproc_list);
>  static struct notifier_block rproc_panic_nb;
> @@ -2176,7 +2181,7 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
>  		return NULL;
>  
>  	rproc->priv = &rproc[1];
> -	rproc->auto_boot = true;
> +	rproc->auto_boot = auto_boot;
>  	rproc->elf_class = ELFCLASSNONE;
>  	rproc->elf_machine = EM_NONE;
>  
> -- 
> 2.29.2
> 
