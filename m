Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AAF2C636D4
	for <linux-remoteproc@archiver.kernel.org>; Wed,  8 Feb 2023 08:20:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230167AbjBHIUL (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 8 Feb 2023 03:20:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230324AbjBHIUH (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 8 Feb 2023 03:20:07 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01FCB4521B
        for <linux-remoteproc@vger.kernel.org>; Wed,  8 Feb 2023 00:20:04 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id m2so49255842ejb.8
        for <linux-remoteproc@vger.kernel.org>; Wed, 08 Feb 2023 00:20:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OVV+Erc03EhvFx9/pFaStozA4lX7te1RdMrbtZiYOU8=;
        b=W7HmY+Xmh8yZDz+50345IxhCOQ+kGKVkecUlIn2FhFmcdEk26J2hyYmavLWjleeHqP
         Y2f/545cSPxYaQZGcxLKJWpfGBmHxh2dZVt/ix1zuHO0mPZ6wqvuobSCZDOozWtYSCu3
         aE/+WlxKQ0uEoQ4994veyNoX6JaqBu8bXZpdUyb27r+t0GLpbqP36SOiZznclhzMaVeJ
         qaCJRI3VE/RTpzdNdhJJkZotYX2RcKYpjNUGUMFAdrjloQuPoIS9/DKUDpkwh9nARYJi
         5ph3eoPy7ytCbt6hIUfaY+FXu4Sk1RYOfJQSnkp/9A0M9Bg8b0sdiD1x9fvGBt1bVa5p
         2J3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OVV+Erc03EhvFx9/pFaStozA4lX7te1RdMrbtZiYOU8=;
        b=QSyWCFEbd19TOs2/bP518YLPFc/DTeQ9pUu25BiaAGXV2pKk5t3qJh8EV+UDrqsnsC
         fJjX8pWk6RKbuF7EBVCAnmkasiU0uxewYNz4oEl01/Z9JwJS8a9NnnwLerJUISogwCTB
         oOjx2e8kaPOfIrJCIGupKjV6lNddC7VpIxzDTvVXlRHXMOcITuBPlns6Lqmx8/FyYYGX
         RDy+AcGdHsqCFesyWEDfGzVocN57CHlKxiWEPIK8OeNJQTkNxThWAvEmRidszX+oZzFl
         NQ141QmTVOyg1lzzxRlOKxRBrknvcqTmhLSFbKjHnJ21TcZejxbAzf3w7E+U1n4odecZ
         yg8A==
X-Gm-Message-State: AO0yUKWMOBbQ8pAioylU6jdxhvA341OwCRKwuHm8AvsUMkJe+EChUAYy
        kmhgYgukS11LSOqMd9wvkQdhzw==
X-Google-Smtp-Source: AK7set/fmj36Ka+iQs3KfMvO/+zs9mMWG3mAZL5BNDjXnfBJAL7M+pZYORq70QOFRUjzilO12GZxXw==
X-Received: by 2002:a17:906:4084:b0:878:7471:6da7 with SMTP id u4-20020a170906408400b0087874716da7mr7410059ejj.66.1675844403346;
        Wed, 08 Feb 2023 00:20:03 -0800 (PST)
Received: from [192.168.1.101] (abxh117.neoplus.adsl.tpnet.pl. [83.9.1.117])
        by smtp.gmail.com with ESMTPSA id n13-20020a170906840d00b008af00d64addsm13800ejx.169.2023.02.08.00.20.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Feb 2023 00:20:03 -0800 (PST)
Message-ID: <5b7f1917-c754-3a9a-1ea5-4a5153b5a7df@linaro.org>
Date:   Wed, 8 Feb 2023 09:20:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/5] arm64: dts: qcom: ipq6018: align RPM G-Link node with
 bindings
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230207090852.28421-1-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230207090852.28421-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 7.02.2023 10:08, Krzysztof Kozlowski wrote:
> Bindings expect (and most of DTS use) the RPM G-Link node name to be
> "rpm-requests".
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
It's not the glink node, it's the rpm subnode of glink.

For the change:

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/ipq6018.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> index d32c9b2515ee..bbd94025ff5d 100644
> --- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> @@ -176,7 +176,7 @@ rpm-glink {
>  		qcom,rpm-msg-ram = <&rpm_msg_ram>;
>  		mboxes = <&apcs_glb 0>;
>  
> -		rpm_requests: glink-channel {
> +		rpm_requests: rpm-requests {
>  			compatible = "qcom,rpm-ipq6018";
>  			qcom,glink-channels = "rpm_requests";
>  
