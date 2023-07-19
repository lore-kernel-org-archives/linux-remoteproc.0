Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAECBC04A94
	for <linux-remoteproc@archiver.kernel.org>; Wed, 19 Jul 2023 07:01:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230418AbjGSHBa (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 19 Jul 2023 03:01:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230346AbjGSHB1 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 19 Jul 2023 03:01:27 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E41BD1FC4
        for <linux-remoteproc@vger.kernel.org>; Wed, 19 Jul 2023 00:01:24 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-992ca792065so892595966b.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 19 Jul 2023 00:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689750083; x=1692342083;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WSZrt9jeszEZGu/mKauiyWiY1HTeSRHVXWkl0PsyR+c=;
        b=BgrP9HbHLulKJqAh3a90fRdgO4sjNLYjWboQJenzmWIzqTETCKSTkJHOpYBFwF4qQB
         bel2zi8jpzzRW3dQgrJfvkauUOmb7SUrbmqW3vJ0B4pe+mFKjD4bWIwstIzNydVSsstR
         2bbQc4sz1ggaszirvJ+zXsbpAtLnWPtKgofL/oAasUQ6VgRM7Y/DU3hSsY496X8gxd1d
         nQUJxAu6Xddw1Zj4tYagBOu8vipwkKoPD3231wfqwdAIQmNU169JPK/+nopUP6nZDy5y
         RVlbSYICm/mVexr+x6rJuJSbqnhoi9LG5r9/ScVUEKSxjBublwhXyPzh59a/z1XGj0wH
         Em5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689750083; x=1692342083;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WSZrt9jeszEZGu/mKauiyWiY1HTeSRHVXWkl0PsyR+c=;
        b=eAzUkkpobIT9+00+lSY1mdVdB8sn7qDho85KU/zZGfP6ttPUnhjmnOUcI+Jv5/Ixh8
         1dKlIGRUu2dy0PAUhH4gyu0Tkf2FFf1kupFaZQT2m7J3Vf1pNenQ6h5Dt+QNkqKCDHxq
         C8iJfLumMwaWZ2qtvSbOcuYE25lJUci3xaFM4eDphYvPcjMvsXEfiMlDo73R2RIcFVdM
         R022mwiwwLZM7Gk250hUYXl1hGTt4DEWW+1YAHcSTampbiZuojAdwSdGe4kfFv1rKX0u
         i4El/vFjL6UwceMcWi+2B9RHJ9S+YapQ+Yi0Wkyq9SpIQLEZH2RS64Pk7nlGMPwPGnp0
         fCQQ==
X-Gm-Message-State: ABy/qLZ0i1ptuBmUZsmIK3cGg1IomToAA0RRuG5K9eGu19RYRSxoW+JD
        4El69CU+BHs8ZH5ST3l+ujC0rA==
X-Google-Smtp-Source: APBJJlGX7cx1vVoHNi6pwROqc+qSgYNgqVavnXFuzLoHzyAPHaI3G/MLulDPjwxxVA6/dpRfkZ/Ugw==
X-Received: by 2002:a17:906:95:b0:978:928:3b99 with SMTP id 21-20020a170906009500b0097809283b99mr1479059ejc.46.1689750083436;
        Wed, 19 Jul 2023 00:01:23 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id qn24-20020a170907211800b00993470682e5sm1920268ejb.32.2023.07.19.00.01.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jul 2023 00:01:22 -0700 (PDT)
Message-ID: <bf6c7433-7773-9b4d-1141-b5ceccae77ee@linaro.org>
Date:   Wed, 19 Jul 2023 09:01:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [V3,00/11] Add multipd remoteproc support
Content-Language: en-US
To:     Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        mathieu.poirier@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        quic_eberman@quicinc.com, kvalo@kernel.org,
        loic.poulain@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Cc:     quic_srichara@quicinc.com, quic_sjaganat@quicinc.com,
        quic_kathirav@quicinc.com, quic_anusha@quicinc.com
References: <20230718120501.3205661-1-quic_mmanikan@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230718120501.3205661-1-quic_mmanikan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 18/07/2023 14:04, Manikanta Mylavarapu wrote:
> APSS brings Q6 out of reset and then Q6 brings
> WCSS block (wifi radio's) out of reset.
> 
> 				   ---------------
> 			      -->  |WiFi 2G radio|
> 			      |	   --------------
> 			      |
> --------	-------	      |
> | APSS | --->   |QDSP6|  -----|
> ---------	-------       |
>                               |
>       			      |
> 			      |   --------------
> 			      --> |WiFi 5G radio|
> 				  --------------
> 
> Problem here is if any radio crashes, subsequently other
> radio also should crash because Q6 crashed. Let's say
> 2G radio crashed, Q6 should pass this info to APSS. Only
> Q6 processor interrupts registered with APSS. Obviously
> Q6 should crash and raise fatal interrupt to APSS. Due
> to this 5G radio also crashed. But no issue in 5G radio,
> because of 2G radio crash 5G radio also impacted.

Your patches and cover letter is unnecessarily more difficult to parse
and filter:
1. Please use standard email subjects, so with the PATCH keyword in the
title. `git format-patch` helps here to create proper versioned patches.
Another useful tool is b4. Skipping the PATCH keyword makes filtering of
emails more difficult thus making the review process less convenient.

2. Please wrap message according to Linux coding style / submission
process (neither too early nor over the limit):
https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597
This is wrapped way too early.
> 

Best regards,
Krzysztof

