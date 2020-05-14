Return-Path: <SRS0=9JvK=64=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02BE0C433DF
	for <linux-remoteproc@archiver.kernel.org>; Thu, 14 May 2020 04:58:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DA8C8206C0
	for <linux-remoteproc@archiver.kernel.org>; Thu, 14 May 2020 04:58:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q0CuyR16"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725967AbgENE6f (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 14 May 2020 00:58:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725794AbgENE6f (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 14 May 2020 00:58:35 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 011CAC061A0C
        for <linux-remoteproc@vger.kernel.org>; Wed, 13 May 2020 21:58:35 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id f23so762653pgj.4
        for <linux-remoteproc@vger.kernel.org>; Wed, 13 May 2020 21:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Fy4YBkk4dKPrXz1Sz6in3rq8QZwklEzzdmUHwWz7Vts=;
        b=q0CuyR167W+2BNBNi9zP/2Uo5HLrTYi02yqX2gsXiURJvGny1sZnBQuNVC6dB+Jenn
         dZo0jdexaxmCbJxntzQ/rQy2sTYrHnzssTzyjed7H5gwHO623LSN8LsLakEmtj47rYRT
         i1CDdwGC9jd5kU/aYeV0kVUSns/5vIOUKeo3yf/Bq6od7L5fq+tfAq6AT4tm5+Jc03xG
         Hlo7QzEcyYCrZbt90ZrcrjBvV9d9kjnD+KPmpTwQpYOioy8QqwnkPf8ZPcuVwlEzw5I6
         HACuCYW1LIqjhZh2oS5Rw+ibKfvsRuoFElx50bxhm7tFpljDv5VHFZdvXIttrYReFJRN
         P8Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Fy4YBkk4dKPrXz1Sz6in3rq8QZwklEzzdmUHwWz7Vts=;
        b=Tny3e3rPklZA+5kXT/wiYKwI3IKDQgHFvSoJLIEgicI6vBONr4i32A7Xz1hpTKrAKX
         OMkTOm2n1Gd03UbYfd9QzndihqGqmnf0tZMMOnP9//AZ4p6BNRZ/c2xDwTGKai0d23Vw
         At4MVZhBDBaApX/q4rkW2IdCKsizopXCZCqgV89VXqejulvOOaIkGEpxsmMDg869lnFI
         tee/33zUH7gwwz2X97TAgkF++AumyCMjfOpPj95+HpmCrR3VYtr74FWY6NerAuY/srVa
         9zaQ7a3Norm2mElp6Fv7+qAFTjM+GREbSFeItjdXL4uAVBRQXKGKjC6l+KTmeSJjcdAN
         qeaw==
X-Gm-Message-State: AOAM531p/hDuxfySozS5sxl0lrvNiKua3d6SIV6TQfK7VhGHRZWf1G7y
        zsGmByG4U4sxBsyh0i6s+Q5MWNdFYGs=
X-Google-Smtp-Source: ABdhPJxyjBQaF0IbDv+oDp7VWgasXey2FK6oPgo+5su8LZ7HawcQevb3Y0t9Ukgg2sHbL3dWhdsSNg==
X-Received: by 2002:a63:7d3:: with SMTP id 202mr2403501pgh.279.1589432314389;
        Wed, 13 May 2020 21:58:34 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id x12sm1056388pfq.209.2020.05.13.21.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2020 21:58:33 -0700 (PDT)
Date:   Wed, 13 May 2020 21:57:03 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     ohad@wizery.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, loic.pallardy@st.com,
        arnaud.pouliquen@st.com, linux-remoteproc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 01/12] remoteproc: stm32: Decouple rproc from memory
 translation
Message-ID: <20200514045703.GG16107@builder.lan>
References: <20200424202505.29562-1-mathieu.poirier@linaro.org>
 <20200424202505.29562-2-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200424202505.29562-2-mathieu.poirier@linaro.org>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri 24 Apr 13:24 PDT 2020, Mathieu Poirier wrote:

> Remove the remote processor from the process of parsing the memory
> ranges since there is no correlation between them.
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Reviewed-by: Loic Pallardy <loic.pallardy@st.com>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/remoteproc/stm32_rproc.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index 0f9d02ca4f5a..91fd59af0ffe 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -127,10 +127,10 @@ static int stm32_rproc_mem_release(struct rproc *rproc,
>  	return 0;
>  }
>  
> -static int stm32_rproc_of_memory_translations(struct rproc *rproc)
> +static int stm32_rproc_of_memory_translations(struct platform_device *pdev,
> +					      struct stm32_rproc *ddata)
>  {
> -	struct device *parent, *dev = rproc->dev.parent;
> -	struct stm32_rproc *ddata = rproc->priv;
> +	struct device *parent, *dev = &pdev->dev;
>  	struct device_node *np;
>  	struct stm32_rproc_mem *p_mems;
>  	struct stm32_rproc_mem_ranges *mem_range;
> @@ -606,7 +606,7 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev)
>  
>  	rproc->auto_boot = of_property_read_bool(np, "st,auto-boot");
>  
> -	return stm32_rproc_of_memory_translations(rproc);
> +	return stm32_rproc_of_memory_translations(pdev, ddata);
>  }
>  
>  static int stm32_rproc_probe(struct platform_device *pdev)
> -- 
> 2.20.1
> 
