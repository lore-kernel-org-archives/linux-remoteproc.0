Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BA04C7EE45
	for <linux-remoteproc@archiver.kernel.org>; Sat, 10 Jun 2023 16:43:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229627AbjFJQn0 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sat, 10 Jun 2023 12:43:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229675AbjFJQnY (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 10 Jun 2023 12:43:24 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2D131FCC
        for <linux-remoteproc@vger.kernel.org>; Sat, 10 Jun 2023 09:43:22 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-51494659d49so4916933a12.3
        for <linux-remoteproc@vger.kernel.org>; Sat, 10 Jun 2023 09:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686415401; x=1689007401;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=16glZHVHfrDJCB1vT1ZmjPXJBVgrv3uWR5Igml4xrN8=;
        b=FNY2L9Ufj7dT0HlMoWnE5qw2b9nI/XiL7HSmFGq/4tftb5cDftc92nx1CeS+9+psFz
         JhIz35Wuf2ZAQiwNdPlxRvzbFZOqZE05Irg6aNwgBR72otn6qkjh6SK6p6Hl5CobqxZE
         d5cuFYEBmFGuxHGzMfyOknDplbv/tcFXTKwkkqiEP5hCVdR+B6hUNFutqMywxF5wnaoB
         MVOZV/3uyLdTbeXJx0Xvmq4YfQPprO0/N7BOXOIyllBF24BSz6MSwFoz+/S+WK/vM9vK
         gtzGVSAUgQkVAs8i5SaX5aEIs2riyVeysPzqUFAujRGE3M+1ART4yqY8kyUeK1G/quwD
         slww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686415401; x=1689007401;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=16glZHVHfrDJCB1vT1ZmjPXJBVgrv3uWR5Igml4xrN8=;
        b=R48al3HtTAx19drRhquWfyQ1kO4Anc5gFnMb/7K34asLIOpH/lcWCbgLai69bYyDcR
         NIwHCBmcltZ2IBmPp9ffsFtlUExaCMMZzmez/V8daIc/w+RPBEdiDjHt5p7oHC3W9F8F
         wsNAESgIIs7McACuHQYCAEp67Ww1ZA8sr0DnLrSV45zPiuaknBk1+tI/Qz8o9nxZorR0
         RHO2VoTL2XB2HhUC66enuyzsJDc28ozhU/dFlh5ajKqbKRk52yCESrTSMAR7/mWk5z3H
         izyXJ2FyBrrcJr5w2UNx4JLVQv6ghybW1eHZM9vqaPQJhLGTlwomcNFlHrLkEk03ipqQ
         inig==
X-Gm-Message-State: AC+VfDztSljGF4/VQ3bIKet3+0r0NFGu5TWBifMNYaMS45ebU8SnJWJp
        1BCOXRshzddmcHRBukCsdVzqYg==
X-Google-Smtp-Source: ACHHUZ49JDloONiyGKyrP6IY9tXGIK6d1xW79M4QASHlondY5fCm5u3oy8O75QxLggof9qMKnw10zw==
X-Received: by 2002:aa7:d84f:0:b0:510:e790:4911 with SMTP id f15-20020aa7d84f000000b00510e7904911mr1618507eds.4.1686415401244;
        Sat, 10 Jun 2023 09:43:21 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id e2-20020a50ec82000000b005182143e111sm1641595edr.17.2023.06.10.09.43.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Jun 2023 09:43:20 -0700 (PDT)
Message-ID: <9cdf22cc-6509-b87e-e631-4e3633d1f542@linaro.org>
Date:   Sat, 10 Jun 2023 18:43:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2 05/12] dt-bindings: remoteproc: Add Qualcomm RPM
 processor/subsystem
Content-Language: en-US
To:     Stephan Gerhold <stephan@gerhold.net>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20230531-rpm-rproc-v2-0-56a4a00c8260@gerhold.net>
 <20230531-rpm-rproc-v2-5-56a4a00c8260@gerhold.net>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230531-rpm-rproc-v2-5-56a4a00c8260@gerhold.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 08/06/2023 09:10, Stephan Gerhold wrote:
> On Qualcomm platforms, most subsystems (e.g. audio/modem DSP) are
> described as remote processors in the device tree, with a dedicated
> node where properties and services related to them can be described.


Thank you for your patch. There is something to discuss/improve.


> +
> +  smd-edge:
> +    $ref: /schemas/remoteproc/qcom,smd-edge.yaml#
> +    description:
> +      Qualcomm Shared Memory subnode which represents communication edge,
> +      channels and devices related to the RPM subsystem.
> +
> +  glink-rpm:

This should be "glink-edge", to be a bit more generic and match existing
smd-edge.

> +    $ref: /schemas/remoteproc/qcom,glink-rpm-edge.yaml#
> +    description:
> +      Qualcomm G-Link subnode which represents communication edge,
> +      channels and devices related to the RPM subsystem.
> +
> +  interrupt-controller:
> +    type: object
> +    $ref: /schemas/interrupt-controller/qcom,mpm.yaml#
> +    description:
> +      MSM Power Manager (MPM) interrupt controller that monitors interrupts
> +      when the system is asleep.
> +
> +  master-stats:
> +    $ref: /schemas/soc/qcom/qcom,rpm-master-stats.yaml#
> +    description:
> +      Subsystem-level low-power mode statistics provided by RPM.
> +
> +required:
> +  - compatible
> +


Best regards,
Krzysztof

