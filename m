Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95820C433F5
	for <linux-remoteproc@archiver.kernel.org>; Wed, 17 Nov 2021 18:57:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7C9C261212
	for <linux-remoteproc@archiver.kernel.org>; Wed, 17 Nov 2021 18:57:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231894AbhKQTAT (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 17 Nov 2021 14:00:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236388AbhKQTAP (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 17 Nov 2021 14:00:15 -0500
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21ED9C061766
        for <linux-remoteproc@vger.kernel.org>; Wed, 17 Nov 2021 10:57:16 -0800 (PST)
Received: by mail-ot1-x332.google.com with SMTP id x43-20020a056830246b00b00570d09d34ebso6439373otr.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 17 Nov 2021 10:57:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=J0Ee9uS/yNgK0Q38kRm9WiYIRO1wJYHsfH9qjA2K+7w=;
        b=kzHn6zBkFHRDLpiKcjHC6wdwdCAsiEWlU1A5ga8fIQG/NkKrfuEM8UZ3GubHSyljZi
         dlmvBmBNnQT9teK9HvVXlqZvz+6UVAeg1BFSrCcJUtplhufu5Op8acDCURafV1GBgdfU
         z1u1DnUZ8YuocgW5tefkx3WD5X6RKKxK4xOsVED+2Lzq87RbE6PuwJONo8w2o6CS+WxH
         Zlo2jgIXcZRhHnYTxS3GURFTCVj5NmhUGUAd3ZaCaDItviXTrhJSz34JvZj0aP2CYB4o
         sxtCxhNc/0Lnv3GnEHGqPMy42lbkh/09Dx+kOwc6UKyIoGh0FDOH8Le4th2dj5XVWYVf
         dZtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=J0Ee9uS/yNgK0Q38kRm9WiYIRO1wJYHsfH9qjA2K+7w=;
        b=CZ/tjOg+QelT6SP419EEKXjemHumBsCz3is5H1SaGydvaRwg4L6/ZC41RcBpUOpYVT
         lD0ADswFW9Or9hheluA8OSZsmtPQo1Fd87qf3G1SUnAoHjEfhiYCNGS8bvc37B7GM0FY
         iJjTaGlgeQ0+LpJCmAZeiDyqCvJaXdQd/hx6p+E+44d/7WIRXfUTjuYYndHG2AiPZsiM
         22MAiNAXKl3Ysv/UtcJP6WqLdImbmhinD+OGQhRwDqkJqeOK6KwjLduUtzJTsMpSq0bn
         SJtRbeLxMpsgtVyhEPY6P1nAiGF9yaeNCHkyUwkbBhhmhe8OjXEFkLmci6rLOGnUmNw5
         kOsg==
X-Gm-Message-State: AOAM530fBsY7PBuOUl+sbd4ocjiR5fb5OfUGE6HP4gh/gNCzg6IhFOkR
        HyeDZ0/PR1DU0hJiDPQtZJMlRA==
X-Google-Smtp-Source: ABdhPJynSXjZcC1ekGOZbGSEKHkQCV4LlmAj0G8v/H9dQsgtSOa6o3k4RrWaDEeFL6ED7RfR1PFFkA==
X-Received: by 2002:a9d:7dca:: with SMTP id k10mr15971598otn.274.1637175435285;
        Wed, 17 Nov 2021 10:57:15 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id a13sm150174oiy.9.2021.11.17.10.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 10:57:14 -0800 (PST)
Date:   Wed, 17 Nov 2021 12:57:12 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     vkoul@kernel.org, agross@kernel.org, ohad@wizery.com,
        mathieu.poirier@linaro.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH] remoteproc: qcom: pas: Add missing power-domain "mxc"
 for CDSP
Message-ID: <YZVQiG5ChGFHwquA@builder.lan>
References: <1624559605-29847-1-git-send-email-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1624559605-29847-1-git-send-email-sibis@codeaurora.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu 24 Jun 13:33 CDT 2021, Sibi Sankar wrote:

> Add missing power-domain "mxc" required by CDSP PAS remoteproc on SM8350
> SoC.
> 
> Fixes: e8b4e9a21af7 ("remoteproc: qcom: pas: Add SM8350 PAS remoteprocs")
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> Cc: stable@vger.kernel.org
> ---
> 
> The device tree and pas documentation lists mcx as a required pd for cdsp.
> Looks like it was missed while adding the proxy pds in the pas driver.
> Bjorn/Vinod you'll need to test this patch before picking it up.
> 

At least on the HDK mxc seems to be optional given the current system
state, but I don't see any regressions so let's land this before we put
the system in a state where it would matter.

Tested-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

>  drivers/remoteproc/qcom_q6v5_pas.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index b921fc26cd04..ad20065dbdea 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -661,6 +661,7 @@ static const struct adsp_data sm8350_cdsp_resource = {
>  	},
>  	.proxy_pd_names = (char*[]){
>  		"cx",
> +		"mxc",
>  		NULL
>  	},
>  	.ssr_name = "cdsp",
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
