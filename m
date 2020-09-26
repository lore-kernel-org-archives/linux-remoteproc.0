Return-Path: <SRS0=ZQLr=DD=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21B6FC47420
	for <linux-remoteproc@archiver.kernel.org>; Sat, 26 Sep 2020 04:16:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D2962208FE
	for <linux-remoteproc@archiver.kernel.org>; Sat, 26 Sep 2020 04:16:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uqJc0OcP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729986AbgIZEQy (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sat, 26 Sep 2020 00:16:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729987AbgIZEQy (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 26 Sep 2020 00:16:54 -0400
Received: from mail-oo1-xc44.google.com (mail-oo1-xc44.google.com [IPv6:2607:f8b0:4864:20::c44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DEBAC0613D5
        for <linux-remoteproc@vger.kernel.org>; Fri, 25 Sep 2020 21:16:54 -0700 (PDT)
Received: by mail-oo1-xc44.google.com with SMTP id h8so1247942ooc.12
        for <linux-remoteproc@vger.kernel.org>; Fri, 25 Sep 2020 21:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+Z37Fca87Mpl6L+K0zrgYd0RdpI2X88yVtRUYsl1J3c=;
        b=uqJc0OcP8FvnyPPH0nITToeULy5TrUuhzPlmcZ7fBJV/LzND8hxhs+0+Z9/Fsnuvlt
         590X5ZU5nZsrJGWjLk4VE085/maMLhu9MCGo1YxhX76Sd8OzJIyBlr4mBgMrlxY6SRQP
         zA/2D9Wtuq3XXCNit9NBYwqd4wfoSBKT4M+r1TuooApV2PU2j3U5bCURJ0K8mgdlA5mH
         28jOIaZB8871nsuFE9CR84ud1M7+2FUMrBETn/vhgdh4n5SUnJBCztyvucrCXVpfquSS
         sM3g50pinK9yiYiwNVWUrw2QIOjEZlhKb3H1xQIpsnUvfmt03u+rg7jhhKqPEfnYcx30
         RIlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+Z37Fca87Mpl6L+K0zrgYd0RdpI2X88yVtRUYsl1J3c=;
        b=iDwscyZBM8WOFhU7q+5fIVHekDxyMFfseBGDKRy8FiNl2nJcyuUU4B9gr3hugvQVqI
         9v6yiJKt2GZtw6JDpa6rXuYC7Gl37F6B+0IpRnA3jinwqU9RrzG/spZIwDMOG1hhwihx
         33RFAWu60lTelI0cI7u0NUeewGkODa9BJhiFxTYzgO0o+/jm7ybtdWy3wT0QdJct7OIM
         oe9FrA7dNmdbxMu6va3dLP/he09wSPH3PZ8sZARWK0sOgxqLsxcZhoAFyVY+qYzG//Dd
         L4Fw5Hl4VZhkE17tv7J+VmBKGwJ7WPadVFhnJJ9xZ70HYnYoDcmvJTUQqmclgCQs1WvW
         JYLQ==
X-Gm-Message-State: AOAM532HpGcuLp7UWkBhLgtT7XmyJiKZ6BB2so4Nvl3fhxTztYV5OJ97
        8ErFhwR+RhHQNJ60++LwM9bUsw==
X-Google-Smtp-Source: ABdhPJygTkA1q+h96IozblgNZnHnLwavcJnTvKhoyaPtXMsWWHc5/hVlmiY+uw+eO7c4ir/4HsXm6Q==
X-Received: by 2002:a4a:e75a:: with SMTP id n26mr2949195oov.29.1601093813729;
        Fri, 25 Sep 2020 21:16:53 -0700 (PDT)
Received: from builder.lan (99-135-181-32.lightspeed.austtx.sbcglobal.net. [99.135.181.32])
        by smtp.gmail.com with ESMTPSA id g21sm366274oos.36.2020.09.25.21.16.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2020 21:16:53 -0700 (PDT)
Date:   Fri, 25 Sep 2020 21:12:20 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Siddharth Gupta <sidgup@codeaurora.org>
Cc:     agross@kernel.org, ohad@wizery.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, rishabhb@codeaurora.org,
        linux-doc@vger.kernel.org, Gurbir Arora <gurbaror@codeaurora.org>
Subject: Re: [PATCH v5 3/3] remoteproc: qcom: Add minidump id for sm8150
 modem remoteproc
Message-ID: <20200926041220.GD10036@builder.lan>
References: <1600991488-17877-1-git-send-email-sidgup@codeaurora.org>
 <1600991488-17877-4-git-send-email-sidgup@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1600991488-17877-4-git-send-email-sidgup@codeaurora.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu 24 Sep 16:51 PDT 2020, Siddharth Gupta wrote:

> Add minidump id for modem in sm8150 chipset.

"...so that the regions to be included in the coredump generated upon a
crash is based on the minidump tables in SMEM instead of those in the
ELF header."

Regards,
Bjorn

> 
> Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
> Signed-off-by: Gurbir Arora <gurbaror@codeaurora.org>
> Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index 752c862..26958e1 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -709,6 +709,7 @@ static const struct adsp_data mpss_resource_init = {
>  	.crash_reason_smem = 421,
>  	.firmware_name = "modem.mdt",
>  	.pas_id = 4,
> +	.minidump_id = 3,
>  	.has_aggre2_clk = false,
>  	.auto_boot = false,
>  	.active_pd_names = (char*[]){
> -- 
> Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
