Return-Path: <SRS0=5S9b=6F=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2825C38A30
	for <linux-remoteproc@archiver.kernel.org>; Tue, 21 Apr 2020 01:56:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B3C10208E4
	for <linux-remoteproc@archiver.kernel.org>; Tue, 21 Apr 2020 01:56:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KRhpwjcM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726812AbgDUB42 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 20 Apr 2020 21:56:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725989AbgDUB41 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 20 Apr 2020 21:56:27 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D617C061A0E
        for <linux-remoteproc@vger.kernel.org>; Mon, 20 Apr 2020 18:56:27 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id r14so5903029pfg.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 20 Apr 2020 18:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=qAjH16kQBGAeeywXkaMxFLlfcw0obRf/vrgqobiQeqo=;
        b=KRhpwjcMGn2Yt8er4JmgUaUzxSwEjOMFXp38EI/0ELCU5mLnqO6llZZPJQgsUv4feB
         0KG3FijZW4qcsFf/NKgxJg+KQP0grSUkMyOFcVcmKfF3ONVf8UKXifWSQkFqldHPtmyA
         W0ijChGCbfIumqlHlllOhI594BuRIQK85NMCyzfJUUYxbZ37KySKqzXG6z52tTncHAUC
         KBnXSB5zO8iNTyMF/7FwQYgDnZZAA6Wyv2NLwmgbmytVi/DRQcggMh9RnGLdb7MEgJi8
         o1x5BloRSxAP+VQhKNepgmCoW7/MFOa/868J3ZQc4BseJ+C1yjg21/cKJ7BXd/lGpgw3
         mLAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qAjH16kQBGAeeywXkaMxFLlfcw0obRf/vrgqobiQeqo=;
        b=E1dFJR+Y5kVJ4vYPaO1s3Xhdb17l5MzXNlaEs3LICeVTUKwUcOc72ddohb8Gnok5/7
         tZTKzBz7cn+tMDc2pQ97G8hJqTUnzEJdIwvpQ/jw6xwwT47++L8TaHgXabOqpaXq49MR
         0j+iASQU22Ap6WVeEGddnnrzZq6HslcBGJv9QowHBUOATpqXUB+YUx7HyJbKlhbpSalZ
         ip0bkGPaZf8yii4ZkqJlqkBFGY6EnG1O0Io8dTSqxnzqf71ZwV1jhGVMbHfWHmM9zv7G
         es21Sp24Kj0GmXMbp5/wOGowAaCbPLDheePc+5YL0FN84e+tmT6quluciiCy8oChezuu
         4LPA==
X-Gm-Message-State: AGi0PuYJfOmMHAis3qVSq/8lAezpZiS3s+ChBkFavdkTmSBQUQmFo9H7
        2nkKX+L0AX4sHPfv9FzO+onoXKhuqKM=
X-Google-Smtp-Source: APiQypJAJwaTaJDXtAQzmLZzuBaUW0DygL2RNry9w7rGIzAT6qkP1GaaWf9xyQ6CNSsJu4bRRmgHRg==
X-Received: by 2002:aa7:819a:: with SMTP id g26mr4929416pfi.193.1587434187059;
        Mon, 20 Apr 2020 18:56:27 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 62sm802499pfu.181.2020.04.20.18.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2020 18:56:26 -0700 (PDT)
Date:   Mon, 20 Apr 2020 18:56:50 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     ohad@wizery.com, elder@linaro.org, s-anna@ti.com,
        Markus.Elfring@web.de, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/4] remoteproc: Restructure firmware name allocation
Message-ID: <20200421015650.GH1868936@builder.lan>
References: <20200420231601.16781-1-mathieu.poirier@linaro.org>
 <20200420231601.16781-3-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200420231601.16781-3-mathieu.poirier@linaro.org>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org
Message-ID: <20200421015650.AdWxZuzmW0g0R1-2oMqWkKnDXYiVi2U0u7qbalRldhM@z>

On Mon 20 Apr 16:15 PDT 2020, Mathieu Poirier wrote:

> Improve the readability of function rproc_alloc_firmware() by using
> a non-negated condition and moving the comment out of the conditional
> block
> 
> Suggested-by: Alex Elder <elder@linaro.org>
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Reviewed-by: Alex Elder <elder@linaro.org>

Looks better, thanks for respinning.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/remoteproc/remoteproc_core.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index db8a15fc1e4a..45529d40342f 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -2011,14 +2011,14 @@ static int rproc_alloc_firmware(struct rproc *rproc,
>  {
>  	const char *p;
>  
> -	if (!firmware)
> -		/*
> -		 * If the caller didn't pass in a firmware name then
> -		 * construct a default name.
> -		 */
> -		p = kasprintf(GFP_KERNEL, "rproc-%s-fw", name);
> -	else
> +	/*
> +	 * Allocate a firmware name if the caller gave us one to work
> +	 * with.  Otherwise construct a new one using a default pattern.
> +	 */
> +	if (firmware)
>  		p = kstrdup_const(firmware, GFP_KERNEL);
> +	else
> +		p = kasprintf(GFP_KERNEL, "rproc-%s-fw", name);
>  
>  	if (!p)
>  		return -ENOMEM;
> -- 
> 2.20.1
> 
