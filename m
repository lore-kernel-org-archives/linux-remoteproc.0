Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F1E7C433EF
	for <linux-remoteproc@archiver.kernel.org>; Thu, 19 May 2022 04:31:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233641AbiESEb0 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 19 May 2022 00:31:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232733AbiESEbZ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 19 May 2022 00:31:25 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92FE4522F5
        for <linux-remoteproc@vger.kernel.org>; Wed, 18 May 2022 21:31:23 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id bq30so7043437lfb.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 18 May 2022 21:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=ykAUPANu4B9XJJmg2pnplY4MjTnWZ9pJsCZp3uk7/eg=;
        b=BgAPtJzkRnc0lxQambdyfxszWLewO5SRkQq0gFA51AIiKnINcJdV5bJlMEpnKA/mZF
         JBV7cSqiEYCbRc5x9ZpraSMGolT1JUAVATze0FdxoGUqR/7UeAKKR4W8QSmemH40bcuT
         2xkblaSeWCapxTb3LB0hzWzf56ROr6QaSx0XPaZkzaSCn5nFxwyTsoONA1sdNpZYSIni
         MDVSzfn6U5SaPFmCqcIs54jyKxaa8MZ97J1fdXRDR2p9jWDav4Egk0ZKrx5owF52lyUF
         9eSul1A5fGSIOvarKpzahDN8mJfi+9+OE7nNP2cPlSMTfMIAdWfF51QDvKBw9QPnGUzZ
         3oZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ykAUPANu4B9XJJmg2pnplY4MjTnWZ9pJsCZp3uk7/eg=;
        b=Y5Z+XOGpLGrj3OzioqGWD/9c+HTzROwB1Oe/rhHCneHW+6mF1CyB2FvNwP0vTw6xeh
         kUgPhYTYMW0gwtgR/jAghyWbfHfmEvdHvQqCSnHsF24FqJQpd22iR0uY2KiKak5wfbeM
         rOOzKZT2bEM1ZLM+f9UB+nRFZL5AOuebqGGV+KwPvQvDE9wBof+swZ9PDoZcsx4RUFzY
         he79KBtXqYWPlnT+eWXCQxyBwHQdTvxrXvH59MfyMfYvyFMA8b9s9UArV8VIGgyOi9DJ
         fdLvWjgF0efXCa3fT0aWB8gX2IE1KX9LKeuLtcIqDM/eqrlAL1TI5GmK7WanCit6N+xk
         cGxA==
X-Gm-Message-State: AOAM532pNlK/9dyZWLOdPHMtq/1IlStJCQPBhJ1F5AJh8WWemGU5zbAI
        9w+a65fai2xZvAz1mBIZXGAbIg==
X-Google-Smtp-Source: ABdhPJzBLhtYkn9iLfgHnLIimZi8ZrrcTKRdSm09/QdmXeugoK2IHQD5ZdleTymVilW5AMPFl3eNPQ==
X-Received: by 2002:ac2:46e8:0:b0:477:ba2c:a68b with SMTP id q8-20020ac246e8000000b00477ba2ca68bmr2011664lfo.55.1652934681773;
        Wed, 18 May 2022 21:31:21 -0700 (PDT)
Received: from [192.168.1.102] (mobile-access-b04822-211.dhcp.inet.fi. [176.72.34.211])
        by smtp.gmail.com with ESMTPSA id w12-20020a05651204cc00b0047255d2119fsm138383lfq.206.2022.05.18.21.31.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 May 2022 21:31:21 -0700 (PDT)
Message-ID: <cce59517-e9f0-2e29-038b-ba2f0faa075f@linaro.org>
Date:   Thu, 19 May 2022 07:30:58 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/8] clk: qcom: alpha-pll: correct kerneldoc
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20220501103520.111561-1-krzysztof.kozlowski@linaro.org>
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20220501103520.111561-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Krzysztof,

On 5/1/22 13:35, Krzysztof Kozlowski wrote:
> Correct kerneldoc warning:
> 
>    drivers/clk/qcom/clk-alpha-pll.c:1450:
>      warning: expecting prototype for clk_lucid_pll_configure(). Prototype was for clk_trion_pll_configure() instead
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   drivers/clk/qcom/clk-alpha-pll.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
> index 4406cf609aae..969d98fca5df 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.c
> +++ b/drivers/clk/qcom/clk-alpha-pll.c
> @@ -1439,7 +1439,7 @@ const struct clk_ops clk_alpha_pll_postdiv_fabia_ops = {
>   EXPORT_SYMBOL_GPL(clk_alpha_pll_postdiv_fabia_ops);
>   
>   /**
> - * clk_lucid_pll_configure - configure the lucid pll
> + * clk_trion_pll_configure - configure the lucid pll
>    *
>    * @pll: clk alpha pll
>    * @regmap: register map

this fix is done earlier, unfortunately the inclusion is still pending, in v5 series:

https://lore.kernel.org/linux-clk/20220509090143.4140999-1-vladimir.zapolskiy@linaro.org/

--
Best wishes,
Vladimir
