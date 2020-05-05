Return-Path: <SRS0=+YGx=6T=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D623C47254
	for <linux-remoteproc@archiver.kernel.org>; Tue,  5 May 2020 22:31:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 39198206FA
	for <linux-remoteproc@archiver.kernel.org>; Tue,  5 May 2020 22:31:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YOLnVZG2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729256AbgEEWbO (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 5 May 2020 18:31:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729170AbgEEWbO (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 5 May 2020 18:31:14 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34F35C061A10
        for <linux-remoteproc@vger.kernel.org>; Tue,  5 May 2020 15:31:14 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id u22so1422758plq.12
        for <linux-remoteproc@vger.kernel.org>; Tue, 05 May 2020 15:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=2xxVztmNYqOGfjjdgr4754NPPqPnQ38+rwBroaQlUMI=;
        b=YOLnVZG2/hq4lTk59fWo+fRGNhnSnVIsi7eSgGm1NIlRpfElJK1gZjV2pzJjHSLTMx
         DSQZSG5Kz2uif3xFuLyv4H8KeOE6KVw5+9paaylOxI9dSf3IOYfaEFJGtJHrHGefxTBt
         4CtdqD3u+ZAW6E9+5UoxrSeSbjj6Os2TNffLe60CNTwbzNqfAEKQ9yL/6SmC29ap7X4a
         6DWKkcMRxznVf4f9wIDD8/IHorxf6vUJYWzejerjtAXSqym783ByP6sxQLA1UHj8+7kW
         JPvE9NmZuZwlgif3BRDodLj/A9/cAyJJxT2/1xobZ3B8vBqPwKfvfu2l5C6bhSjH1gck
         sDIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2xxVztmNYqOGfjjdgr4754NPPqPnQ38+rwBroaQlUMI=;
        b=LUAwa8aSk2MTMZ8yAR0lCHOE5Scx41av8uTnO3Ka2w4JQ/HxcgaONzmFI+g3A67EjS
         YQSFl/q22H2LCsTvV3jvXLJv+5xd0PC/DhoISWGdHqmwQWGZEZHP4tgeQHL6bakzeN0X
         9MVJgFZN/vX1VFxuI+2Xuj76a0RmswS2Yrhv0FDUSBGfLrX1zgAp6J6pjpVLVuqB/9pt
         xyxIJBVNo/+ZG2LDSN3PfPTYOIIGJE/4gIBZvwJ4+BkJdZd2vRO7aLfVMNZgxcUc8i4R
         a7CSL76pZ6NEHiyI12cPQZVCrO40kTEvgHFLXAYlrJ4ZLvxvQJvK1LhSTLWL0//8AO44
         2x1g==
X-Gm-Message-State: AGi0PuYGE1gmgTZKLDhEasbb1RocDWcvlHNdd/zI7s1CFbf8+Jm+97Cn
        Iwz5Gin3aaOu7CQtUEUIiJeuvQ==
X-Google-Smtp-Source: APiQypJHrrWRceS8FL3Aju2CNIXlXPSdxYOC4I/MK875YORMTPVfM/fqE6Z6Jsxub4yjtZa2sGwkLA==
X-Received: by 2002:a17:90b:957:: with SMTP id dw23mr5793353pjb.101.1588717873532;
        Tue, 05 May 2020 15:31:13 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id g16sm20985pfq.203.2020.05.05.15.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 15:31:12 -0700 (PDT)
Date:   Tue, 5 May 2020 15:31:58 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     ohad@wizery.com, loic.pallardy@st.com, arnaud.pouliquen@st.com,
        s-anna@ti.com, linux-remoteproc@vger.kernel.org, corbet@lwn.net,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 02/14] remoteproc: Introduce function
 rproc_alloc_internals()
Message-ID: <20200505223158.GB2329931@builder.lan>
References: <20200424200135.28825-1-mathieu.poirier@linaro.org>
 <20200424200135.28825-3-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200424200135.28825-3-mathieu.poirier@linaro.org>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri 24 Apr 13:01 PDT 2020, Mathieu Poirier wrote:

> In scenarios where the remote processor's lifecycle is entirely
> managed by another entity there is no point in allocating memory for
> a firmware name since it will never be used.  The same goes for a core
> set of operations.
> 
> As such introduce function rproc_alloc_internals() to decide if the
> allocation of a firmware name and the core operations need to be done.
> That way rproc_alloc() can be kept as clean as possible.
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>  drivers/remoteproc/remoteproc_core.c | 31 +++++++++++++++++++++++-----
>  1 file changed, 26 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 448262470fc7..1b4756909584 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -2076,6 +2076,30 @@ static int rproc_alloc_ops(struct rproc *rproc, const struct rproc_ops *ops)
>  	return 0;
>  }
>  
> +static int rproc_alloc_internals(struct rproc *rproc,
> +				 const struct rproc_ops *ops,
> +				 const char *name, const char *firmware)
> +{
> +	int ret;
> +
> +	/*
> +	 * In scenarios where the remote processor's lifecycle is entirely
> +	 * managed by another entity there is no point in carrying a set
> +	 * of operations that will never be used.
> +	 *
> +	 * And since no firmware will ever be loaded, there is no point in
> +	 * allocating memory for it either.

While this is true, I would expect that there are cases where the
remoteproc has ops but no firmware.

How about splitting this decision already now; i.e. moving the if(!ops)
to rproc_alloc_ops() and perhaps only allocate firmware if ops->load is
specified?

Regards,
Bjorn

> +	 */
> +	if (!ops)
> +		return 0;
> +
> +	ret = rproc_alloc_firmware(rproc, name, firmware);
> +	if (ret)
> +		return ret;
> +
> +	return rproc_alloc_ops(rproc, ops);
> +}
> +
>  /**
>   * rproc_alloc() - allocate a remote processor handle
>   * @dev: the underlying device
> @@ -2105,7 +2129,7 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
>  {
>  	struct rproc *rproc;
>  
> -	if (!dev || !name || !ops)
> +	if (!dev || !name)
>  		return NULL;
>  
>  	rproc = kzalloc(sizeof(struct rproc) + len, GFP_KERNEL);
> @@ -2128,10 +2152,7 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
>  	if (!rproc->name)
>  		goto put_device;
>  
> -	if (rproc_alloc_firmware(rproc, name, firmware))
> -		goto put_device;
> -
> -	if (rproc_alloc_ops(rproc, ops))
> +	if (rproc_alloc_internals(rproc, ops, name, firmware))
>  		goto put_device;
>  
>  	/* Assign a unique device index and name */
> -- 
> 2.20.1
> 
