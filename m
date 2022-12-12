Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ACACC4332F
	for <linux-remoteproc@archiver.kernel.org>; Mon, 12 Dec 2022 09:17:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231804AbiLLJRU (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 12 Dec 2022 04:17:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231873AbiLLJQQ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 12 Dec 2022 04:16:16 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0FEAF03D
        for <linux-remoteproc@vger.kernel.org>; Mon, 12 Dec 2022 01:16:07 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id s10so11843990ljg.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 12 Dec 2022 01:16:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0AIifoEFiC72psMbY45WalcO7jXfalLI3RSBsB5quiY=;
        b=VU0qvLfKj6onkE+LjiSwLgyffzxKO3/+UKSQ6Svkoefd1GeQ2Khrmv9ExbgGWewakJ
         9tpB0HxI4OfR6vo3Hujb6iTbmPcPjo8EZovoutNXQ92PSKvvobUryZdqlAd9WPriqBCF
         yEjUEoLHQq4mKxz9+3U5xTg/sowdq2XIxu2KfuX4ulzjwa8YsolMAK1LwlqT4UmVYakR
         AJDfz0L/xwJ7sB/kr0ywJSz+kS1kNAOBFnXpQmxOgKJ0E2pLPSsYwT1GwMvQYBrHZ+CQ
         Q11F6qrZZv71DMM5QaRE+GYp6gjik9pTvJ4nfMkK6jXR4lbmM/im8h51RbiSg4K0kObt
         glyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0AIifoEFiC72psMbY45WalcO7jXfalLI3RSBsB5quiY=;
        b=qcfykPMa8Wvc9PMXK5q/TLs64Crmi1oKJSDXfYoIQQ6nsUCu7j3/7Ma0hCSUjNC5xU
         7q9/qUgJ0A09Zo1nu9S0q1yRm7bJVGa2ml1U75GnxruuxvGW+EEYkc/QcIF2E9I8Etg2
         T+6ni/YD8AuwhTKQnN1/eyDWpCZu6jBgTkhU9eJA9k9JHa6HavmuxzAjspE//2Iog6cw
         zGGfPcZ1ErmrFCmBaB8rwGxE8O9c4U1aXVOMlMhVneM4QuGAtecNjyzQhg1IRvTMc5KN
         vO4cwO9O6j3ifZqg1DFiJ1lM4rLiKRzI+p65SbE5FGBQ731tnvoKtZg35Z9qTFzxfIv3
         ZuwA==
X-Gm-Message-State: ANoB5pm/ZFe6i+NAWQ/GekSMr6YtFp0pvyaqWLkxHMepzfrqEFSaquV/
        AHr38mUAOZwJAslcsDugnFK0ng==
X-Google-Smtp-Source: AA0mqf6YsR1jFMYRTC/iblW+rjoiOstEAbwhIih7h9N7e29IB0kHS1dSoQK+u78um0vwEFjSgAudHg==
X-Received: by 2002:a2e:a58d:0:b0:26f:db35:6046 with SMTP id m13-20020a2ea58d000000b0026fdb356046mr5118214ljp.17.1670836566099;
        Mon, 12 Dec 2022 01:16:06 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id y12-20020a05651c106c00b00267232d0652sm1161080ljm.46.2022.12.12.01.16.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Dec 2022 01:16:05 -0800 (PST)
Message-ID: <f7cb79d2-cfcf-dd12-5127-373ed192120e@linaro.org>
Date:   Mon, 12 Dec 2022 10:16:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: qcom,adsp: Add SM6375 ADSP
 and CDSP
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     patches@linaro.org, Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221109170822.58281-1-konrad.dybcio@linaro.org>
 <be450f51-6e1c-a3c1-904f-1f915f0dba5e@linaro.org>
In-Reply-To: <be450f51-6e1c-a3c1-904f-1f915f0dba5e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 10/11/2022 10:32, Krzysztof Kozlowski wrote:
> On 09/11/2022 18:08, Konrad Dybcio wrote:
>> Add entries for SM6375 ADSP and CDSP. They are effectively the same
>> as SM6350 ADSP and SM8150 CDSP respectively.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>  .../devicetree/bindings/remoteproc/qcom,adsp.yaml         | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
> 
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Although change looks ok, but I missed that it will conflict with my
series here:
https://lore.kernel.org/all/20221124184333.133911-1-krzysztof.kozlowski@linaro.org/

This should be moved to a new tile or merged with one of device-specific
bindings I added.

Best regards,
Krzysztof

