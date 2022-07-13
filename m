Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EC0EC433EF
	for <linux-remoteproc@archiver.kernel.org>; Wed, 13 Jul 2022 16:45:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236587AbiGMQpx (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 13 Jul 2022 12:45:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237178AbiGMQpq (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 13 Jul 2022 12:45:46 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BF102FFCB
        for <linux-remoteproc@vger.kernel.org>; Wed, 13 Jul 2022 09:45:31 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id g16-20020a17090a7d1000b001ea9f820449so4570789pjl.5
        for <linux-remoteproc@vger.kernel.org>; Wed, 13 Jul 2022 09:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=/iQtm6Kux/xWroeqwCGf2oSrpyEqZ4z/EH3B3RJO+Zo=;
        b=Joha79Wraj0RM+cNfu3SLTwfR7k4tiDA9n7XxadX3uG3w0zYyxHrPOtXzh8dM3yFtA
         FF2ylCS4LuB5M/us7A/MHNY98bLJE1mRjrjc3RpAHNtMmQWGPT3ztvVb8X2ySQf9WyHm
         OSe3MmIRa4sR1Mub2jw6fK4W9IfwsKKvHoApKaQ8eFykY1qNF2EQtNfFx5k9DofsGOgc
         Xt6AxlIOQbdyCFWgBWXsI+VkRYcg1r143YeWJP3ikSoe6BgtPxbBcCGaCuAYoWM/djmU
         EEWqJrzaycQVS0zFdsIKKSti0JSLZCbm46H8xrVrLio68hqOaGS3WpuW/yiGHEF3PjFJ
         VhsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/iQtm6Kux/xWroeqwCGf2oSrpyEqZ4z/EH3B3RJO+Zo=;
        b=Mep7Q1Yx1Iz/4bFNgoRCaNGMLzHUHyyjYamYVG6QLJGwgzuzlfwsnbdfZyyzSerUw3
         7NmXhgDXoAxUZ6zDQYg3MGMcZdB0JSHspEhC4zEJ+8R9G8mWUmv1MQIaHoZGuL9wnLOx
         wEBCbbl25lKDMXtaVJg8NcwlPjpxUxjHMN58Tme4QL1IYlpVLgLqiPO+fmlOxYd7Fsfg
         A0gh/mnnqgdCYFY7IJWueEzt5uMnd2K9Fu2DebsD2DI8JQIB8MvfGftqW8gxIzYuKpfc
         7sHylwxrUDMbZ+xuRkP2GoTzpsJU6/EpcejhIgB+t6a7kknlBnrikXp6Wq95pnbHQtrs
         i5vw==
X-Gm-Message-State: AJIora8RrzjAD1Ev83q8kmv/sOaAjdXbev0JHqqWZuuQZUqBzBY6SNvB
        bJnew8ni2Yj6EIWS6HjtVpD6
X-Google-Smtp-Source: AGRyM1vpxsjXKe7Cp4HLhTBdF09rD64pUIPfu6lFoXvKGOvtaOsFtN9vtggHGNXvZdPImb8Oe6tBgw==
X-Received: by 2002:a17:90a:7c05:b0:1ee:e40c:589b with SMTP id v5-20020a17090a7c0500b001eee40c589bmr4764943pjf.78.1657730730820;
        Wed, 13 Jul 2022 09:45:30 -0700 (PDT)
Received: from workstation ([117.248.1.226])
        by smtp.gmail.com with ESMTPSA id f1-20020a170902ce8100b0016beceac426sm9045079plg.138.2022.07.13.09.45.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Jul 2022 09:45:30 -0700 (PDT)
Date:   Wed, 13 Jul 2022 22:15:25 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Abel Vesa <abel.vesa@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] remoteproc: qcom_q6v5_pas: Deal silently with optional
 px and cx regulators
Message-ID: <20220713164525.GB4591@workstation>
References: <20220713152835.3848875-1-abel.vesa@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220713152835.3848875-1-abel.vesa@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Jul 13, 2022 at 06:28:35PM +0300, Abel Vesa wrote:
> Use _get_optional as some platforms might not provide the px
> and cx regulators.

But this makes no failure for platforms that really needs these regulators and
not defined in devicetree. But at the same time, the driver should trust
the devicetree anyway and not try to validate it.

So I think this is fine.

> This avoids printing the following for each
> unavailable regulator:
> 
> [    4.350229] qcom_q6v5_pas 5c00000.remoteproc: supply cx not found,
> using dummy regulator
> [    4.374224] qcom_q6v5_pas 5c00000.remoteproc: supply px not found,
> using dummy regulator
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 32 +++++++++++++++++++-----------
>  1 file changed, 20 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index 6ae39c5653b1..3c3affaff7ac 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -185,13 +185,17 @@ static int adsp_start(struct rproc *rproc)
>  	if (ret)
>  		goto disable_xo_clk;
>  
> -	ret = regulator_enable(adsp->cx_supply);
> -	if (ret)
> -		goto disable_aggre2_clk;
> +	if (adsp->cx_supply) {
> +		ret = regulator_enable(adsp->cx_supply);
> +		if (ret)
> +			goto disable_aggre2_clk;
> +	}
>  
> -	ret = regulator_enable(adsp->px_supply);
> -	if (ret)
> -		goto disable_cx_supply;
> +	if (adsp->px_supply) {
> +		ret = regulator_enable(adsp->px_supply);
> +		if (ret)
> +			goto disable_cx_supply;
> +	}
>  
>  	ret = qcom_scm_pas_auth_and_reset(adsp->pas_id);
>  	if (ret) {
> @@ -212,9 +216,11 @@ static int adsp_start(struct rproc *rproc)
>  	return 0;
>  
>  disable_px_supply:
> -	regulator_disable(adsp->px_supply);
> +	if (adsp->px_supply)
> +		regulator_disable(adsp->px_supply);
>  disable_cx_supply:
> -	regulator_disable(adsp->cx_supply);
> +	if (adsp->cx_supply)
> +		regulator_disable(adsp->cx_supply);
>  disable_aggre2_clk:
>  	clk_disable_unprepare(adsp->aggre2_clk);
>  disable_xo_clk:
> @@ -231,8 +237,10 @@ static void qcom_pas_handover(struct qcom_q6v5 *q6v5)
>  {
>  	struct qcom_adsp *adsp = container_of(q6v5, struct qcom_adsp, q6v5);
>  
> -	regulator_disable(adsp->px_supply);
> -	regulator_disable(adsp->cx_supply);
> +	if (adsp->px_supply)
> +		regulator_disable(adsp->px_supply);
> +	if (adsp->cx_supply)
> +		regulator_disable(adsp->cx_supply);
>  	clk_disable_unprepare(adsp->aggre2_clk);
>  	clk_disable_unprepare(adsp->xo);
>  	adsp_pds_disable(adsp, adsp->proxy_pds, adsp->proxy_pd_count);
> @@ -326,13 +334,13 @@ static int adsp_init_clock(struct qcom_adsp *adsp)
>  
>  static int adsp_init_regulator(struct qcom_adsp *adsp)
>  {
> -	adsp->cx_supply = devm_regulator_get(adsp->dev, "cx");
> +	adsp->cx_supply = devm_regulator_get_optional(adsp->dev, "cx");
>  	if (IS_ERR(adsp->cx_supply))
>  		return PTR_ERR(adsp->cx_supply);
>  
>  	regulator_set_load(adsp->cx_supply, 100000);
>  
> -	adsp->px_supply = devm_regulator_get(adsp->dev, "px");
> +	adsp->px_supply = devm_regulator_get_optional(adsp->dev, "px");
>  	return PTR_ERR_OR_ZERO(adsp->px_supply);
>  }
>  
> -- 
> 2.34.3
> 
