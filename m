Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA54DC636CC
	for <linux-remoteproc@archiver.kernel.org>; Tue,  7 Feb 2023 10:00:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231843AbjBGKAl (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 7 Feb 2023 05:00:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231848AbjBGKAU (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 7 Feb 2023 05:00:20 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5959D12F0F
        for <linux-remoteproc@vger.kernel.org>; Tue,  7 Feb 2023 01:59:21 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id y1so12982168wru.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 07 Feb 2023 01:59:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gyxo1SYfYxqaPFoqXEgYr/ocAyDp0P/Afe4B05MrX2g=;
        b=KzUsPTYWPFHfbLnnGsjoPYvqAu0p4zXIIyFAyQZ7lM/tW0/LideTaa5ZkrAqRI26GH
         GH1/SBpFezyNWMSdg0lcwdwBVPj9PnB44iaNkrCU7HZCAq9KD04+1zceZS7NpkGGbg5T
         49lDY1s6A0TjFPNDmGQq3I8kZhT7cNTRMoRuv71V4amdrb9f+B3BzVizxeTPLmKtG2Zk
         jqREe0/ffmG2XeH67rlJtXrgkVKC5mpgXrVq+Z/e5bDcacOGtwetl10GLbVqdBLhq0ht
         q2pi2euEWKbuBZWSHy8sQrTKfWZGmjJGO3dBXzAsJbE0A31Ga4sjM23sNyL3m/hdDFW4
         BtTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gyxo1SYfYxqaPFoqXEgYr/ocAyDp0P/Afe4B05MrX2g=;
        b=74V611sInvCiPJ6sMNlbuKz+vJn8CyiK8ehQTuWQvbEkS7apLn9swN8mHsHLDgMphw
         w0XG1ACsBSIlYkkEhCBfILuZlsrgPvGIg64FKTkJDO/HG8avECHXvJdP+o/pkeujmOov
         5oUiG5sR0Vo3TouwJF/zxU6OY8TAZtQuodwt9X4LL7O9YrQH3TkIjiL3Cs56SPk6PvKZ
         jfcmgtG/s7zSQJmvizqKuYMbLCNRNq1ob7PojxySGpu7Ed6uKy9lFKcQsWK9/3bIwSOa
         MsD2Z7JW8aUYzZQeg/9lDZTjU0BYGI7tqgAhC0TmEQaalCzEkcweVogmV+rKBv9NjR2P
         CzQg==
X-Gm-Message-State: AO0yUKVrn625rGLq7hYVl4rmqWNmxdvvd1HOellu0NjT2kKkZ1xei2XT
        /mi+hcnizn1sFCImBuoSMLM2kQ==
X-Google-Smtp-Source: AK7set9AGUr02MY4TirPrz8+iYHIBelGFh4xaIZhKWPYG47xjHnOe3bmka69hBvzuOpVUsCNtFRL7Q==
X-Received: by 2002:a5d:4a0d:0:b0:2c3:ea81:64bf with SMTP id m13-20020a5d4a0d000000b002c3ea8164bfmr1877549wrq.56.1675763959917;
        Tue, 07 Feb 2023 01:59:19 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id l11-20020a05600002ab00b002bfb5ebf8cfsm11408275wry.21.2023.02.07.01.59.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Feb 2023 01:59:19 -0800 (PST)
Message-ID: <9f0e05ee-de21-c234-7c8e-e6105e98c0ac@linaro.org>
Date:   Tue, 7 Feb 2023 10:59:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 4/5] dt-bindings: remoteproc: qcom,glink-rpm-edge: convert
 to DT schema
Content-Language: en-US
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230207090852.28421-1-krzysztof.kozlowski@linaro.org>
 <20230207090852.28421-4-krzysztof.kozlowski@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230207090852.28421-4-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 07/02/2023 10:08, Krzysztof Kozlowski wrote:
> Convert Qualcomm G-Link RPM edge binding to DT schema.  Move it to
> remoteproc as it better suits the purpose - communication channel with
> remote processor.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../remoteproc/qcom,glink-rpm-edge.yaml       | 92 ++++++++++++++++++
>  .../bindings/soc/qcom/qcom,glink.txt          | 94 -------------------
>  2 files changed, 92 insertions(+), 94 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,glink-rpm-edge.yaml
>  delete mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,glink.txt

This is expected to trigger warning in other bindings, being fixed here:
https://lore.kernel.org/linux-arm-msm/20230207095639.36537-1-krzysztof.kozlowski@linaro.org/T/#u

Best regards,
Krzysztof

