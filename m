Return-Path: <SRS0=5S9b=6F=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED7E1C38A30
	for <linux-remoteproc@archiver.kernel.org>; Tue, 21 Apr 2020 01:55:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C49C32078C
	for <linux-remoteproc@archiver.kernel.org>; Tue, 21 Apr 2020 01:55:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Lz12bxzp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726024AbgDUBzv (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 20 Apr 2020 21:55:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725829AbgDUBzv (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 20 Apr 2020 21:55:51 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13503C061A0E
        for <linux-remoteproc@vger.kernel.org>; Mon, 20 Apr 2020 18:55:51 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id y6so207446pjc.4
        for <linux-remoteproc@vger.kernel.org>; Mon, 20 Apr 2020 18:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=UJYIzPofAuqOoim8IEbHP214MoKizgp6mPi7cMfmlTk=;
        b=Lz12bxzpMoqWdcPL2IcFBJ+Auu7ic26DmgBR9mTtNM8xHVSbGwbJvJjlyyzts7JmCI
         a5ixrVA75cvIamw0JhLVjmB259OasqspsBoGm+PkT3RxXZ7MobcMULNtr1KvZM/7Mu1y
         ew2HBjWyeKyiWnA3fX0o/UN/jA3zqqdLxc4myBWScMTai9dpLVzmwWlouZ3wa2dZIzJI
         fPXW8WcrtrHB6iG1s7/LISI0nxGEL4gSf8IRHUvOZuLX49nWVzS8Zav0Jh+BP6sw774z
         Q3PIspK5wWhWWmgZmwSKo/8ND5kzxRk0qQg6gLTdD+g3G0uM9BByW14Qc9TIllBrVtAh
         OZOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UJYIzPofAuqOoim8IEbHP214MoKizgp6mPi7cMfmlTk=;
        b=obFOsHkWb9+GgSmlzr6dK9X3UXQ5DyYRfURZwYyMdi9PIUKyc5PVZDQxhqj4sW5PCm
         DiuLNJKwFxUCNFoYXGjtwLo3vt+SicH++zCz9v4kv9AOVBAv1xS+xR/ozzxPmyYo/xgO
         DmxkLrTMZfQBAdV1tXXgeb/62yWxXk+9QzeUzQkh1JjwOpNP/4mjRTT5mJmsSXII+Bat
         5esoDJyw9fb+q8MNFLa+Y8XF0+Y005/QBrVIaKixGTozuLAxibgXWuFMt3osxVpgh+5o
         kE7okSXSBjnKQvMxSLPKATi/5BOI0yOtnFFG7Tnlfa4kHuuFyffchD7kwIevTwis+Uo0
         DGVg==
X-Gm-Message-State: AGi0PuYuyitI1M7yzbIjfmloEPmP8pbMnGyR+jbFPLGks25bfHHjyLz/
        Qw37Y7ibqqwKbXm8C8CWtNHtTQ==
X-Google-Smtp-Source: APiQypLX8QkQ/nR8KIFND3+xxvFUTWTgbOCJnNOKNoJ6e2WXuhoSZHeq9fral0Gzrbudm56yHsQSOQ==
X-Received: by 2002:a17:90b:110d:: with SMTP id gi13mr2616270pjb.131.1587434150541;
        Mon, 20 Apr 2020 18:55:50 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id c187sm818148pfc.63.2020.04.20.18.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2020 18:55:49 -0700 (PDT)
Date:   Mon, 20 Apr 2020 18:56:14 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     ohad@wizery.com, elder@linaro.org, s-anna@ti.com,
        Markus.Elfring@web.de, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] remoteproc: Use kstrdup_const() rather than
 kstrdup()
Message-ID: <20200421015614.GG1868936@builder.lan>
References: <20200420231601.16781-1-mathieu.poirier@linaro.org>
 <20200420231601.16781-2-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200420231601.16781-2-mathieu.poirier@linaro.org>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org
Message-ID: <20200421015614.XLgpDN0Cl3dajzIDtsLqP9-fgaS1TRIcrsfiIDpe0Mg@z>

On Mon 20 Apr 16:15 PDT 2020, Mathieu Poirier wrote:

> For cases where @firmware is declared "const char *", use function
> kstrdup_const() to avoid needlessly creating another copy on the
> heap.
> 
> Suggested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Reviewed-by: Alex Elder <elder@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/remoteproc/remoteproc_core.c | 8 ++++----
>  include/linux/remoteproc.h           | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index d9e6949e4ac1..db8a15fc1e4a 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1996,7 +1996,7 @@ static void rproc_type_release(struct device *dev)
>  	if (rproc->index >= 0)
>  		ida_simple_remove(&rproc_dev_index, rproc->index);
>  
> -	kfree(rproc->firmware);
> +	kfree_const(rproc->firmware);
>  	kfree(rproc->ops);
>  	kfree(rproc);
>  }
> @@ -2009,7 +2009,7 @@ static const struct device_type rproc_type = {
>  static int rproc_alloc_firmware(struct rproc *rproc,
>  				const char *name, const char *firmware)
>  {
> -	char *p;
> +	const char *p;
>  
>  	if (!firmware)
>  		/*
> @@ -2018,7 +2018,7 @@ static int rproc_alloc_firmware(struct rproc *rproc,
>  		 */
>  		p = kasprintf(GFP_KERNEL, "rproc-%s-fw", name);
>  	else
> -		p = kstrdup(firmware, GFP_KERNEL);
> +		p = kstrdup_const(firmware, GFP_KERNEL);
>  
>  	if (!p)
>  		return -ENOMEM;
> @@ -2122,7 +2122,7 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
>  	return rproc;
>  
>  free_firmware:
> -	kfree(rproc->firmware);
> +	kfree_const(rproc->firmware);
>  free_rproc:
>  	kfree(rproc);
>  	return NULL;
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index 0547676479d3..800b4f09dc98 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -489,7 +489,7 @@ struct rproc {
>  	struct list_head node;
>  	struct iommu_domain *domain;
>  	const char *name;
> -	char *firmware;
> +	const char *firmware;
>  	void *priv;
>  	struct rproc_ops *ops;
>  	struct device dev;
> -- 
> 2.20.1
> 
