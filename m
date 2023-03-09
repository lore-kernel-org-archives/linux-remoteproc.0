Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C62AC64EC4
	for <linux-remoteproc@archiver.kernel.org>; Thu,  9 Mar 2023 08:29:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230050AbjCII3j (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 9 Mar 2023 03:29:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230062AbjCII3X (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 9 Mar 2023 03:29:23 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F389AE20F4
        for <linux-remoteproc@vger.kernel.org>; Thu,  9 Mar 2023 00:27:26 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id k10so3701635edk.13
        for <linux-remoteproc@vger.kernel.org>; Thu, 09 Mar 2023 00:27:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678350445;
        h=content-transfer-encoding:in-reply-to:from:cc:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YYduG/Bcmu9NPPmwSKTMuZPf8YDgxXGdRWgnP+qoWu8=;
        b=rkmkI5jIk3QDSxiUKCdxvPJQEePjs3LY0yNfoBgsvBatlCgroAG+UJ4n8jlWm1z+zf
         4H1usWjTSumuMp1VzkFlTZnivzb8i13sivLkMtfNTW8Xt57xZK1P5vkxXu7x7BzMSRmo
         NQnyeBNU/R+NYKURr3PmwgSIjP/Wlh66PgD+bPuUaeS17TgivgWfHGi1b9ZPttv7ivfp
         yRisWYwTTP2iiihu4LydgdJ0lmF6q20rC2yRulLRexozjHBmwGDI56doy6C9olIlzxaY
         iK1kLyH0eW5yoTNwK0B18/skQ7VvLF84Rt0Mekw06Ci3MSL8hfBN2fX0rzSoXDbF47sc
         Q2Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678350445;
        h=content-transfer-encoding:in-reply-to:from:cc:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YYduG/Bcmu9NPPmwSKTMuZPf8YDgxXGdRWgnP+qoWu8=;
        b=ViBN9KR4jwFafDn1X7FrjYkmZ9O2+xyXv6cgHIwEAHT3+XhQYWuTX8h1CnQQOjDgc3
         VKHSx1aldcpJ/rxv2UK7GbeUSggH4luk1h/6LvWbn0OPTwyX9hlEFeY56u5tdQBkC7oB
         QgAxwMZx0nU+e3e+f/vh2LTn86KW8rm6AN0W+YRdYXxi43sB1cSUMiIZw2kzY5fk7TcF
         urgf5I4r16Ete/ktCFtzTGa88KFV8c/Wjd6H9jP1GAixa7BmimlhBBCU0OOT9zLb73Ix
         EqyoDkSsUftpiH7HMj/HzRSc+jrcZ/Mwq1vsyd8Qk6Hzk5tmRlxfngLDaSJNO4dJ+hxp
         YOFA==
X-Gm-Message-State: AO0yUKWzImxHl5Wwfq/grgRVSJZ2hphYmFGnXENnhmRlXfIDNCa/Rmec
        mzJlBOoEir/rAfrN4EUwdU3Rbw==
X-Google-Smtp-Source: AK7set/hGQYMclII6drCi+1VpLYiPnyopU8ViBSDK48kAcF5QPIQpFX3tD0Q3oPoOgezzIW+XkG8qg==
X-Received: by 2002:aa7:d84a:0:b0:4ad:316:b4e6 with SMTP id f10-20020aa7d84a000000b004ad0316b4e6mr20325419eds.42.1678350445264;
        Thu, 09 Mar 2023 00:27:25 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:7ee2:e73e:802e:45c1? ([2a02:810d:15c0:828:7ee2:e73e:802e:45c1])
        by smtp.gmail.com with ESMTPSA id w22-20020a17090633d600b008b907006d5dsm8665494eja.173.2023.03.09.00.27.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Mar 2023 00:27:24 -0800 (PST)
Message-ID: <4b115ff2-a137-dd12-472c-f2248ce6350a@linaro.org>
Date:   Thu, 9 Mar 2023 09:27:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/3] dt-bindings: remoteproc: qcom,sm6115-pas: correct
 memory-region constraints
Content-Language: en-US
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>
References: <20230309082446.37362-1-krzysztof.kozlowski@linaro.org>
 <20230309082446.37362-2-krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230309082446.37362-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 09/03/2023 09:24, Krzysztof Kozlowski wrote:
> Qualcomm PAS devices expect exactly one memory region, not many.  Also,
> the memory-region is now defined in device specific binding, not in
> qcom,pas-common.yaml, thus also require it in the same place.
> 
> Fixes: 838c558bb8bc ("dt-bindings: remoteproc: qcom: Add sm6115 pas yaml file")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

I think the sm6115 was not yet merged, thus maybe this patch is not
needed. If it wasn't merged, please squash it with original submission
and send new viersion.

Best regards,
Krzysztof

