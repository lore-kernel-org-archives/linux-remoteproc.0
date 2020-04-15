Return-Path: <SRS0=YAOw=57=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3091C2BA19
	for <linux-remoteproc@archiver.kernel.org>; Wed, 15 Apr 2020 21:26:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9A9EB20784
	for <linux-remoteproc@archiver.kernel.org>; Wed, 15 Apr 2020 21:26:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g7Eozqsw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439001AbgDOV0H (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 15 Apr 2020 17:26:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2439052AbgDOV0F (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 15 Apr 2020 17:26:05 -0400
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com [IPv6:2607:f8b0:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F155AC061A0C
        for <linux-remoteproc@vger.kernel.org>; Wed, 15 Apr 2020 14:26:04 -0700 (PDT)
Received: by mail-il1-x144.google.com with SMTP id t8so4906051ilj.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 15 Apr 2020 14:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=dDKixBKJLPaNO8k57JKpb1sXM656jJUiTX6KQ+yAoqY=;
        b=g7EozqswakYwF1/wULpyaIm4jT5PtWBB5Uvexq3Y9TZB95+OCrfZM25ZpyOEy9fZhK
         MICFsAHFoVF4M7TtSxoCaU/7NJoh+yKGpCzU/FGAv/R7bhEAFB5GE0fdSK0kl20RSr0K
         z9RqR9wDln+OsIcY8OYuvWzE+0jKmVVLmW7YfC52AV0PHi8P8aO2dhCFehYA7dWnT3ux
         4jDWMGwX70eOQpKCrSNOhwgxvcfW30t38puuUgpTVvagamxLaTFMY89Y4/ELbzUbEkiR
         pz0AjrsZE6PilYkEC7OtHYIzKwu9cJ4Ut4EkkyJaC3FNu/fFmW3dyDQ51v1dmzclOQol
         +keQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=dDKixBKJLPaNO8k57JKpb1sXM656jJUiTX6KQ+yAoqY=;
        b=ebTnEPtREhe74KWLisBKlXbILEQxAFaFUTKb9fvnuP+na91mLnKD7s0aWrsAfh2vO2
         S1pCNT13DlOliBbIgeckQUHUmeAhaXCtYtpNuU+MX8nQoe5hGhKd9XeKSzETINAPlg01
         yN4CSc+dqwi4tj/AwvcKop4klbZUmPLkLSRYyhm0BuGeygbs62yaP97fga/vfz7Xv0HF
         Ij23uCdzb9ZdplDt0p2Hw6OcR0H4A6Hlhw3bcni5SWp4LLLCTx9V+3oU1aMjyUFW1bgA
         1xqPQzXAXbcYIzI75ZOZ3pjKziDoBM6WXAtkEBVnBu0zkhi/7cbOy4WEXPTAADVt7Rd/
         vOsg==
X-Gm-Message-State: AGi0PubE101LCb3i2R7sa+7/PNTw0qw7/pl60lXOM+WmlC/hWI25SJML
        gkjNY/j2Ty57UM6NCnTR8Ag7pA==
X-Google-Smtp-Source: APiQypIknJfnLHYbE2ky961lF+1JjLtngLEsPW+cd7UBwdTylCjdPXZ3uClCJQUe0r0TZfxq1jHvYA==
X-Received: by 2002:a92:1d3:: with SMTP id 202mr7884500ilb.77.1586985964327;
        Wed, 15 Apr 2020 14:26:04 -0700 (PDT)
Received: from [172.22.22.26] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id i2sm4426239ilq.25.2020.04.15.14.26.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2020 14:26:03 -0700 (PDT)
Subject: Re: [PATCH v2 3/7] remoteproc: Simplify default name allocation
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        bjorn.andersson@linaro.org, ohad@wizery.com
Cc:     s-anna@ti.com, Markus.Elfring@web.de,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200415204858.2448-1-mathieu.poirier@linaro.org>
 <20200415204858.2448-4-mathieu.poirier@linaro.org>
From:   Alex Elder <elder@linaro.org>
Message-ID: <1772f2f2-b063-c80f-9d3a-0127302d33f0@linaro.org>
Date:   Wed, 15 Apr 2020 16:26:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200415204858.2448-4-mathieu.poirier@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org
Message-ID: <20200415212601.z-UBYKZGsjkGYwRmtQFiDJQdTDU6mLYSAuE6U4tbULY@z>

On 4/15/20 3:48 PM, Mathieu Poirier wrote:
> In an effort to cleanup firmware name allocation, replace the
> cumbersome mechanic used to allocate a default firmware name with
> function kasprintf().
> 
> Suggested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>

Looks good to me.

Reviewed-by: Alex Elder <elder@linaro.org>

> ---
>  drivers/remoteproc/remoteproc_core.c | 19 +++++++------------
>  1 file changed, 7 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 4dee63f319ba..9899467fa1cf 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1982,24 +1982,19 @@ static const struct device_type rproc_type = {
>  static int rproc_alloc_firmware(struct rproc *rproc,
>  				const char *name, const char *firmware)
>  {
> -	char *p, *template = "rproc-%s-fw";
> -	int name_len;
> +	char *p;
>  
> -	if (!firmware) {
> +	if (!firmware)
>  		/*
>  		 * If the caller didn't pass in a firmware name then
>  		 * construct a default name.
>  		 */
> -		name_len = strlen(name) + strlen(template) - 2 + 1;
> -		p = kmalloc(name_len, GFP_KERNEL);
> -		if (!p)
> -			return -ENOMEM;
> -		snprintf(p, name_len, template, name);
> -	} else {
> +		p = kasprintf(GFP_KERNEL, "rproc-%s-fw", name);
> +	else
>  		p = kstrdup(firmware, GFP_KERNEL);
> -		if (!p)
> -			return -ENOMEM;
> -	}
> +
> +	if (!p)
> +		return -ENOMEM;
>  
>  	rproc->firmware = p;
>  
> 

