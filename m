Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94600ECAAA1
	for <linux-remoteproc@archiver.kernel.org>; Mon, 19 Sep 2022 22:15:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229804AbiISWPB (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 19 Sep 2022 18:15:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229806AbiISWO7 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 19 Sep 2022 18:14:59 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68BAE31353
        for <linux-remoteproc@vger.kernel.org>; Mon, 19 Sep 2022 15:14:57 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id a10so913047ljq.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 19 Sep 2022 15:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=/1WCedtk/KjBM3RO+wdfRwgGcGH0AKvYxTW8lbAp9Dw=;
        b=JATdPgqjbylhCP2iuY22LrDcGHAtRI4MOQBlZZcQ8MEo8T0ciL98GV3f/5wLqZ1FiY
         wtmWK/kbt5x/cx6jEikNLHvWzzr8XnR9IdPGVmgzJ13maJdV7X+cqSXhKr5/6rfelh2G
         83r/jGveabQ3T+cZLncR0q/ybqtcBCnP0vJWM3E7QiNtscaq0GvnQscaAbUxxKcPjCnf
         T4qOLAuFGi0gAN+Paybk0KMLZy9lNWG58mX/ztKVjq5muGr7ny2mDkSLd4q/D7zY1yqC
         WpHgrhVDcFmr4D8RRVqIdA4y3VJdUpDK1qn5uI2HYiJYKWvWcIklq5GmIeDuXdp1MSWm
         qBbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=/1WCedtk/KjBM3RO+wdfRwgGcGH0AKvYxTW8lbAp9Dw=;
        b=Yx3pToaFA0bo7lPvua3zB+r4id8muhXfeKMnUCe4E250dyKCl8/5aAUj668dXQTyzu
         vFN6Szlgcb2d2aBDMN89g9XwNfeIN7KHLYoSNKJkBIxNlw6qjlNzNAAh3Sxtw3qd7EPx
         OAkjAO+AYa+sU1F47IWFMrSIC/KiAywusjiIZfdbQL3C/jvNb6cwqmx+n5q5nJjthtcD
         ou/lAu77U7Per/zezSYyAOiDbmT3B9JagOCsiGkf+W7UgGbOibLNNWMl4ROfD2HyctSo
         kcpO6rx7rQvh29VLWL5o8a/P7T8wnPnAyNVKNH9VOtciNkyzM9rF3Thop4FcEs4ovCW3
         Warw==
X-Gm-Message-State: ACrzQf2ahDumzi1T4K/b/LJUrBX5y9jR6aVAyNuZ02Up3KBrppnUlFPc
        08JrlO29bOq70Xk8SURacMjziQ==
X-Google-Smtp-Source: AMsMyM6lw1FnCuV/OiFUVeEgIyrZD4IG+NKoayQOz/FI7PiyICtg12frSluN2etQg+NdKwX7RMOupg==
X-Received: by 2002:a2e:9b91:0:b0:26a:ce59:c517 with SMTP id z17-20020a2e9b91000000b0026ace59c517mr5754803lji.181.1663625695482;
        Mon, 19 Sep 2022 15:14:55 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 15-20020ac25f4f000000b00492e3c8a986sm5353357lfz.264.2022.09.19.15.14.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Sep 2022 15:14:55 -0700 (PDT)
Message-ID: <3456921e-15cf-90da-44eb-bb378d217daa@linaro.org>
Date:   Tue, 20 Sep 2022 01:14:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: (subset) [PATCH v3 00/15] ARM/hwlock: qcom: switch TCSR mutex to
 MMIO
Content-Language: en-GB
To:     Bjorn Andersson <andersson@kernel.org>,
        linux-kernel@vger.kernel.org, agross@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, konrad.dybcio@somainline.org,
        ohad@wizery.com, linux-arm-msm@vger.kernel.org,
        baolin.wang@linux.alibaba.com, linux-remoteproc@vger.kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski@linaro.org,
        devicetree@vger.kernel.org, vkoul@kernel.org
References: <20220909092035.223915-1-krzysztof.kozlowski@linaro.org>
 <166310928500.670084.9085382465104729419.b4-ty@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <166310928500.670084.9085382465104729419.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 14/09/2022 01:48, Bjorn Andersson wrote:
> On Fri, 9 Sep 2022 11:20:20 +0200, Krzysztof Kozlowski wrote:
>> Switch older Qualcomm SoCs to use MMIO-based method instead of syscon.
>>
>> Not tested on hardware. Please kindly provide tests.
>>
>> Changes since v2
>> ================
>> 1. Rebase on current MFD changes.
>> 2. Add Rb tag.
>> 3. Split MFD patch to separate patchset:
>> https://lore.kernel.org/linux-devicetree/20220909091056.128949-1-krzysztof.kozlowski@linaro.org/T/#u
>>
>> [...]
> 
> Applied, thanks!
> 
> [05/15] arm64: dts: qcom: ipq6018: add missing TCSR syscon compatible
>          commit: d30bcfa4408596e8dd3714dfdd90334d2bdc9856
> [06/15] arm64: dts: qcom: msm8953: add missing TCSR syscon compatible
>          commit: d07ac9d93ced0f8203230bf1de49b7cc605e1547
> [07/15] arm64: dts: qcom: qcs404: add missing TCSR syscon compatible
>          commit: 98460385091fc2e86a296f9643105d8a8777ccc2
> [08/15] arm64: dts: qcom: msm8996: add missing TCSR syscon compatible
>          commit: 8a99e0fc8bd3fa9c8be1fc115a2e38f4fd51ccda

Please revert 08/15, it is incorrect.

> [11/15] arm64: dts: qcom: ipq6018: switch TCSR mutex to MMIO
>          commit: f5e303aefc06b7508d7a490f9a2d80e4dc134c70
> [12/15] arm64: dts: qcom: msm8994: switch TCSR mutex to MMIO
>          commit: 9e826e05061c61d84217bbe436b4ef0bedbfe458
> [14/15] ARM: dts: qcom: apq8084: switch TCSR mutex to MMIO
>          commit: 16ae4e557b2fa9fc7372b4503247aca80a476272
> [15/15] ARM: dts: qcom: msm8226: switch TCSR mutex to MMIO
>          commit: 18a4af7a598445af54e1e16a66b7f31669578701
> 
> Best regards,

-- 
With best wishes
Dmitry

