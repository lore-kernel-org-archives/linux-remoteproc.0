Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C973FC433ED
	for <linux-remoteproc@archiver.kernel.org>; Fri,  7 May 2021 16:40:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8F3A260232
	for <linux-remoteproc@archiver.kernel.org>; Fri,  7 May 2021 16:40:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236763AbhEGQl4 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 7 May 2021 12:41:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236442AbhEGQlz (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 7 May 2021 12:41:55 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC30EC0613ED
        for <linux-remoteproc@vger.kernel.org>; Fri,  7 May 2021 09:40:53 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id m190so7582697pga.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 07 May 2021 09:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xRZozbSj5JJlMuUTe4lrInslxUwcTfAxWixBF52Viac=;
        b=EMrqt6SUvfHfueDNpj4rhhcf7h3ymIg9mcsONtu9G1cyzBoAh9w1NCnu1jyzSxyrd6
         f80AmRhbDW5Ge3jIvHS7uln4f4b9Y56ccCCJT8PmdKw/GlcAs6fmX/dXiBySeJSdcdUC
         2yN1o3CtgC0FiWLmyn0XkQ3aX5tlHYewXF2ws8iHDghmd6KSTQ6ka6QQbSe0p03rltlb
         jaZrwODYnwVw1RYFrZghXDIHZjWHy2NEK6oawVOzvFM0pjTV1I3tN1tck/KLo8Cl1pM4
         75vVN4LaHvTmdha7+EIcogC6yTQIuwgDvXmX9cNbgi8u2acfu6qzPrent4iHKzRHOyKV
         ktUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xRZozbSj5JJlMuUTe4lrInslxUwcTfAxWixBF52Viac=;
        b=qV7vqOi4FMZuFu3XfEs/hLR56W01dIzR3OtOgBvUEcnyJ0rS+IIbI6dGKRE52oWFBe
         2CT5mkmGFjUfdgNISlrwuIsZVbZCvxpeVxqIqkuxUjbLHyraNWEzdWtAxBQBpsZ78oNE
         f0J4xzvlD/ZIB3au82u9I9iQdgbiie9aHPXKB8hOueQfc7VGt5rdaY8OgDPNNAJQKGgA
         C3VygiDLHTyBu4TtEv1B4sQ5BRTsu6oxYW2fPtJ3eywm/lTI5OLgCGVACSvMTxihzHiy
         ZBOYIQgqkeikKd7FBvKd1NRl6DXBfTe2iuaUG2ImqW+aTVxh/8XgcXo9jE6dFyKHQ9s1
         pzpg==
X-Gm-Message-State: AOAM532wZIY/Iy5ZYsdn9ZbWtOoLpf98Yrp113nUQ5E68+6khJ7ZZhn+
        y+Vjz8EP00uktpJYb/WG/2Z5
X-Google-Smtp-Source: ABdhPJzpnyq5HBH9yW+K1RZjCshQrJhcCi6hFFjInm/x5r/TkeXI4BPclZezomnm+Gg/394YWPxCyw==
X-Received: by 2002:aa7:88c9:0:b029:2ab:aea7:e761 with SMTP id k9-20020aa788c90000b02902abaea7e761mr2082866pff.71.1620405653157;
        Fri, 07 May 2021 09:40:53 -0700 (PDT)
Received: from thinkpad ([2409:4072:e94:6cb6:4728:f123:8d88:45e9])
        by smtp.gmail.com with ESMTPSA id z7sm2868984pfb.93.2021.05.07.09.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 May 2021 09:40:52 -0700 (PDT)
Date:   Fri, 7 May 2021 22:10:45 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Yassine Oudjana <y.oudjana@protonmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 1/3] remoteproc: qcom: pas: Use the same init resources
 for MSM8996 and MSM8998
Message-ID: <20210507164045.GA3622@thinkpad>
References: <zbAB2sceYHmsYeraZUi4YUKL7lgFMu13w3vHQQYUQ4@cp3-web-020.plabs.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <zbAB2sceYHmsYeraZUi4YUKL7lgFMu13w3vHQQYUQ4@cp3-web-020.plabs.ch>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, May 06, 2021 at 09:18:04PM +0000, Yassine Oudjana wrote:
> The init resources for MSM8996 are missing power domains, and adding them
> makes the resources identical to the MSM8998 ones. Remove slpi_resource_init
> and use MSM8998 resources for both chips.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 15 ++-------------
>  1 file changed, 2 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index b921fc26cd04..b1e613187c68 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -689,17 +689,6 @@ static const struct adsp_data mpss_resource_init = {
>  	.ssctl_id = 0x12,
>  };
>  
> -static const struct adsp_data slpi_resource_init = {
> -		.crash_reason_smem = 424,
> -		.firmware_name = "slpi.mdt",
> -		.pas_id = 12,
> -		.has_aggre2_clk = true,
> -		.auto_boot = true,
> -		.ssr_name = "dsps",
> -		.sysmon_name = "slpi",
> -		.ssctl_id = 0x16,
> -};
> -
>  static const struct adsp_data sm8150_slpi_resource = {
>  		.crash_reason_smem = 424,
>  		.firmware_name = "slpi.mdt",
> @@ -803,8 +792,8 @@ static const struct adsp_data sdx55_mpss_resource = {
>  
>  static const struct of_device_id adsp_of_match[] = {
>  	{ .compatible = "qcom,msm8974-adsp-pil", .data = &adsp_resource_init},
> -	{ .compatible = "qcom,msm8996-adsp-pil", .data = &adsp_resource_init},
> -	{ .compatible = "qcom,msm8996-slpi-pil", .data = &slpi_resource_init},
> +	{ .compatible = "qcom,msm8996-adsp-pil", .data = &msm8998_adsp_resource},
> +	{ .compatible = "qcom,msm8996-slpi-pil", .data = &msm8998_slpi_resource},

NACK.

I see that the "slpi_resource_init" and "msm8998_{slpi/adsp}_resource" are
completely different, even the firmware name. How can you get it to work?

Thanks,
Mani

>  	{ .compatible = "qcom,msm8998-adsp-pas", .data = &msm8998_adsp_resource},
>  	{ .compatible = "qcom,msm8998-slpi-pas", .data = &msm8998_slpi_resource},
>  	{ .compatible = "qcom,qcs404-adsp-pas", .data = &adsp_resource_init },
> -- 
> 2.31.1
> 
> 
