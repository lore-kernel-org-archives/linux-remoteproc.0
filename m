Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 458BDC433F5
	for <linux-remoteproc@archiver.kernel.org>; Thu, 19 May 2022 07:23:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234670AbiESHXr (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 19 May 2022 03:23:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232023AbiESHXm (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 19 May 2022 03:23:42 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D30048020E
        for <linux-remoteproc@vger.kernel.org>; Thu, 19 May 2022 00:23:41 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id q130so5179748ljb.5
        for <linux-remoteproc@vger.kernel.org>; Thu, 19 May 2022 00:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=X+M/rKycNyEYq7mDVzTSNot/YX2q43M/ax40JXZzzrY=;
        b=UzL10+ibxu0Za8wZRcb3fjPhjV6VyMwfbhItChQRYpBSKGjoQuvAHeRuLzk2gBOcDI
         f8+QblbVAaEMnOOowRDst7vk+QPOlC9pmCTA1lRNFNdyyO3GzgqqUsNFpV/DcWOmwoMA
         dFn3FThgLfhdXn3gXYOmxZ/x97tess6zjwjnj8D5zdDdjCtIJDNNwK6Jk8Y9J6BWuIVq
         qtnY6vc3PonNEO8EJljAim+eBDtaG/4/UUD1W+26t53iFd+3cU8TclHXZPRh0Hg35C5M
         B2ZQj6JWvlliPmLQviUcRnTkBadC97dT9Pg4RJ9exrfzC1sVLBBadv99md7E7uORfs4i
         it2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=X+M/rKycNyEYq7mDVzTSNot/YX2q43M/ax40JXZzzrY=;
        b=lAqVDT936UDj2VSkrhp0W+n3NW18PFAWOZIjZfXjk6Vpo24AZTWuPWDWP4NHeaJBzm
         CrSoMRuo84/Da2vpL0xPOMveG1gteEpex+b+F0o1Mm8Oty+cZLlSDpKLXTQMer13ePV8
         eHLZMP2eNngKopcYluK8SsZh+pv1yRb1qTCqdJpSvKHb6shIpR9NrZIw9BhS1EbheTJq
         oDgaGHYZnXafrBkOUqsCtmnrwXR/JW+bmHIu2y0DHEWB1qGQy6DB++eQVzt4r5qq9EaD
         BPLJdcFKPo04s7udNlSIY+URs5f0waTRrpGWO5z0GeZLS8uKAOajogFXmfH9Gu86p/yg
         7R5A==
X-Gm-Message-State: AOAM532BkLnww0GBv5KVdW1lr+DLYCX/e82n640cBjQwksNT8tpyWdHD
        0uKZ+omVwF2kvK0oWZlDgrMUfQ==
X-Google-Smtp-Source: ABdhPJxgX9jTZGvt6mG1yVs6UHIRABoohk2r/88VsRZLTWVK1hyx8Q7mYWMhrzwq+AN/+i7TJ9vQEQ==
X-Received: by 2002:a2e:b6d3:0:b0:24f:3144:6349 with SMTP id m19-20020a2eb6d3000000b0024f31446349mr1792982ljo.50.1652945020122;
        Thu, 19 May 2022 00:23:40 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id f14-20020ac24e4e000000b0047255d2115esm184288lfr.141.2022.05.19.00.23.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 May 2022 00:23:39 -0700 (PDT)
Message-ID: <d17e73c7-058f-d269-1737-4152cd85078e@linaro.org>
Date:   Thu, 19 May 2022 09:23:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 1/8] clk: qcom: alpha-pll: correct kerneldoc
Content-Language: en-US
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20220501103520.111561-1-krzysztof.kozlowski@linaro.org>
 <cce59517-e9f0-2e29-038b-ba2f0faa075f@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <cce59517-e9f0-2e29-038b-ba2f0faa075f@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 19/05/2022 06:30, Vladimir Zapolskiy wrote:
> Hi Krzysztof,
> 
> On 5/1/22 13:35, Krzysztof Kozlowski wrote:
>> Correct kerneldoc warning:
>>
>>    drivers/clk/qcom/clk-alpha-pll.c:1450:
>>      warning: expecting prototype for clk_lucid_pll_configure(). Prototype was for clk_trion_pll_configure() instead
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>   drivers/clk/qcom/clk-alpha-pll.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
>> index 4406cf609aae..969d98fca5df 100644
>> --- a/drivers/clk/qcom/clk-alpha-pll.c
>> +++ b/drivers/clk/qcom/clk-alpha-pll.c
>> @@ -1439,7 +1439,7 @@ const struct clk_ops clk_alpha_pll_postdiv_fabia_ops = {
>>   EXPORT_SYMBOL_GPL(clk_alpha_pll_postdiv_fabia_ops);
>>   
>>   /**
>> - * clk_lucid_pll_configure - configure the lucid pll
>> + * clk_trion_pll_configure - configure the lucid pll
>>    *
>>    * @pll: clk alpha pll
>>    * @regmap: register map
> 
> this fix is done earlier, unfortunately the inclusion is still pending, in v5 series:
> 
> https://lore.kernel.org/linux-clk/20220509090143.4140999-1-vladimir.zapolskiy@linaro.org/
>

I'll skip this one.


Best regards,
Krzysztof
