Return-Path: <SRS0=FIV4=6E=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 814A8C3815B
	for <linux-remoteproc@archiver.kernel.org>; Mon, 20 Apr 2020 05:09:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5D72F2064A
	for <linux-remoteproc@archiver.kernel.org>; Mon, 20 Apr 2020 05:09:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gvbnmsQH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725971AbgDTFJo (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 20 Apr 2020 01:09:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725815AbgDTFJn (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 20 Apr 2020 01:09:43 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76BFAC061A0F
        for <linux-remoteproc@vger.kernel.org>; Sun, 19 Apr 2020 22:09:43 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id x77so1781635pfc.0
        for <linux-remoteproc@vger.kernel.org>; Sun, 19 Apr 2020 22:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=nC9CIaWqMd1UKYPm0a2LPx8hGZfVgwmPult1RAMV1Rc=;
        b=gvbnmsQHwre/LrHaor3Ssfl7JaYyJbYUNff9Ub8GHGaPNCRts2ADkcSVVYS+DtjwXZ
         9T/LoknZDwyBhO+sAqTKvvQHcLhyiHU+2iOJ/RzzjjdpoXvFeDgI7FRFQ1n27JyPuPaN
         uU9x5qshlh54PBxC86rvLi2Kbejd1sXCfjJwNKYNH3DFKNznfkSpuz53GKUDPWWanE4p
         CJN4y/69Ck+7VxPz26X6iFS3xntml/OC3lvmu6yKkkJMJYzMYfoRRq8WCjezfEJGTSYP
         fPMQiWr5BYCpey8qlVX/bWtTHLaEwbSFYWXjbhQVTvxWV2JlMNb5w4dLHTfVB/e88T79
         jOTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nC9CIaWqMd1UKYPm0a2LPx8hGZfVgwmPult1RAMV1Rc=;
        b=r+qULnaV5zXigo9hH+Jc0hprDPw2qTE/5TJYXMov+K4ac1oLJq3/vXOuE+iV32hknW
         s5hwZX9zjth+Vju56S/4hggbInylaB0zZl9LrbJnDuPlUwsIklBxTZguZ3QEVqDH8Y0T
         9ANH2UFZOe72AtgSz9ny+RUjpn7lWnfwaw4iYOK+epmzgnWClb3LTPUntfHRHJ4GP5T8
         eBecxkcv0haXAZf0mFzSI0Lct78+wVc2RddMxtinCV2CXthyqaoS2/lJbyigN5/0ijpr
         rqECm3yqz0oXoZl4OJAss5Jd/Vdet36xDhfD3gobbMNicPWhmX2w0lWyG539TFTomyHY
         RWEg==
X-Gm-Message-State: AGi0Pua9DgbDVyK4NeBSkZUDls/I456ORL2+FhlS6CsHY+5q1o++M2pC
        JvLs9HEj8/d/oc1SChqp4hN6wg==
X-Google-Smtp-Source: APiQypJCdcKkSS6azmAMWwIFSilGv9k6qNIKlm1642PVNNb+Q5NfF1IiXm6GEm7CpWzDypUsUkVFCA==
X-Received: by 2002:a63:145a:: with SMTP id 26mr15678077pgu.238.1587359382897;
        Sun, 19 Apr 2020 22:09:42 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id f10sm7489619pju.34.2020.04.19.22.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2020 22:09:42 -0700 (PDT)
Date:   Sun, 19 Apr 2020 22:10:05 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     ohad@wizery.com, s-anna@ti.com, elder@linaro.org,
        Markus.Elfring@web.de, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/7] remoteproc: Simplify default name allocation
Message-ID: <20200420051005.GD1516868@builder.lan>
References: <20200415204858.2448-1-mathieu.poirier@linaro.org>
 <20200415204858.2448-4-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200415204858.2448-4-mathieu.poirier@linaro.org>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org
Message-ID: <20200420051005.y61fn0L7DN0OYiyNtxA3_jRD8sY4NZh4NjByp0_8YH4@z>

On Wed 15 Apr 13:48 PDT 2020, Mathieu Poirier wrote:

> In an effort to cleanup firmware name allocation, replace the
> cumbersome mechanic used to allocate a default firmware name with
> function kasprintf().
> 
> Suggested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

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
> -- 
> 2.20.1
> 
