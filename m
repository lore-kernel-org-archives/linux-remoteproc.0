Return-Path: <SRS0=YAOw=57=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B11EEC2BA19
	for <linux-remoteproc@archiver.kernel.org>; Wed, 15 Apr 2020 21:23:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8932F20732
	for <linux-remoteproc@archiver.kernel.org>; Wed, 15 Apr 2020 21:23:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wTx2LAC/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2442384AbgDOVXW (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 15 Apr 2020 17:23:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2442379AbgDOVXT (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 15 Apr 2020 17:23:19 -0400
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com [IPv6:2607:f8b0:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92C25C061A0C
        for <linux-remoteproc@vger.kernel.org>; Wed, 15 Apr 2020 14:23:19 -0700 (PDT)
Received: by mail-il1-x143.google.com with SMTP id i2so4828430ils.12
        for <linux-remoteproc@vger.kernel.org>; Wed, 15 Apr 2020 14:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=RX9/7s9yBWh914994jEXd2QhL9nBP30B6ZtmmCdyhxc=;
        b=wTx2LAC/B09d11qUoGdj5u2RYaV0q/DFXuL4o/rD/9hsnsxy3S5NORSu186U+uJ4IE
         jcC6jzYMmQ8GV9WITPDYUo+pKuC3obDmGC0Pc8ER3fS327RtZQGBFQfF1eT51JVmS8Oy
         xrUgsO4kteAyb3P/UP2q9WnQ6nfqix6qLUg6mu44rlsXaw3dToxQy2M76TtGAfFbn2BJ
         E7tUfpIZIncGBuebxAgOKHofF5RRkihw1MhQPSS0pA6KLyxIaZENXf4tirntu1JFB4Pg
         CMRQw3FLkB6CPLTj3Hc9roAEkcFPGJX6KRm3FCercuGYGSOo66c28Qs4hqqADilgAFHo
         GZtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=RX9/7s9yBWh914994jEXd2QhL9nBP30B6ZtmmCdyhxc=;
        b=Zcoz9Z7yqTWDQa1UPpDbr/HGL42da2V2IkU/af6pHsU6kNKLHrOcfuKuDmwWpb1c8j
         B0VH1+zyAthIyQ6SUkGso4FRQG+IZAol6I7yFg46FaI8nMG2IeqlL7nlsRy3M8teOUKI
         TbmIgrDnJfcidvg3Dgiw6sN51ChjpzoCZV/XpAjPKH0kJmtWKgp2tbgvGqebzCX67d1p
         d+a+/xGRyA9rk9IxM2jmGDfPvkr2osdbrV0H3GHeQcrqW/fxJQAA+2t8bIUJDWnOK7/x
         SJeVglQtqQquYHcT25bLx1GBc9Ln1ldChz4SExBCnZzHxEVkYjDjN27OrBBHYJkaaa3d
         uLHA==
X-Gm-Message-State: AGi0PuY4R325tcWb1KzsTvG6a0bO6d2GiVUiVwaXsEQhV9K7z6Qt7uKJ
        Co+vfFJRJucFZ3PNADbwJt5Hyw==
X-Google-Smtp-Source: APiQypJKTAvCDrpOq2KGbM1EjjkdCf379V1hS/PN+AxYI5EfZRkWfFdPypD2jgzQnUDsF1BHxFOw5w==
X-Received: by 2002:a92:cac7:: with SMTP id m7mr6784000ilq.6.1586985798849;
        Wed, 15 Apr 2020 14:23:18 -0700 (PDT)
Received: from [172.22.22.26] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id c19sm2379446ili.63.2020.04.15.14.23.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2020 14:23:17 -0700 (PDT)
Subject: Re: [PATCH v2 5/7] remoteproc: Restructure firmware name allocation
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        bjorn.andersson@linaro.org, ohad@wizery.com
Cc:     s-anna@ti.com, Markus.Elfring@web.de,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200415204858.2448-1-mathieu.poirier@linaro.org>
 <20200415204858.2448-6-mathieu.poirier@linaro.org>
From:   Alex Elder <elder@linaro.org>
Message-ID: <9a4b6342-750e-284a-2343-8151b478589b@linaro.org>
Date:   Wed, 15 Apr 2020 16:23:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200415204858.2448-6-mathieu.poirier@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org
Message-ID: <20200415212314.oWYyUV8F2w03DdfsD64SkRSj6KcH1WmaOnp2_C1wXK4@z>

On 4/15/20 3:48 PM, Mathieu Poirier wrote:
> Improve the readability of function rproc_alloc_firmware() by using
> a non-negated condition.
> 
> Suggested-by: Alex Elder <elder@linaro.org>
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>

If it were me, I'd move the comment above the if statement and
perhaps reword it a little bit to describe what's happening.
But no matter, this looks good.

Reviewed-by: Alex Elder <elder@linaro.org>

> ---
>  drivers/remoteproc/remoteproc_core.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index ebaff496ef81..0bfa6998705d 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1984,14 +1984,14 @@ static int rproc_alloc_firmware(struct rproc *rproc,
>  {
>  	const char *p;
>  
> -	if (!firmware)
> +	if (firmware)
> +		p = kstrdup_const(firmware, GFP_KERNEL);
> +	else
>  		/*
>  		 * If the caller didn't pass in a firmware name then
>  		 * construct a default name.
>  		 */
>  		p = kasprintf(GFP_KERNEL, "rproc-%s-fw", name);
> -	else
> -		p = kstrdup_const(firmware, GFP_KERNEL);
>  
>  	if (!p)
>  		return -ENOMEM;
> 

