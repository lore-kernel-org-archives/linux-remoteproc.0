Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27FD7C6FA92
	for <linux-remoteproc@archiver.kernel.org>; Tue, 27 Sep 2022 08:14:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231153AbiI0IOT (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 27 Sep 2022 04:14:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231737AbiI0INt (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 27 Sep 2022 04:13:49 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D81BBF78
        for <linux-remoteproc@vger.kernel.org>; Tue, 27 Sep 2022 01:09:36 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id l18so1744656wrw.9
        for <linux-remoteproc@vger.kernel.org>; Tue, 27 Sep 2022 01:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date;
        bh=Ut3iGu0b/mI6XW5rpgCs/5VK4qy+LVrOrJIS25KPemw=;
        b=i4Jvq0fa9Bl6I2SPiG4hGMCYydOUsAwFpniv75l8RduOKIDc+1n907TVHDddAjeadQ
         R/8ye3NnLtMldaO9llS3wIopU6SlVHg7cJk3qvlr+/JoAOOTw1/5ncKSMOyy2+UN9IG+
         OCh2VvIaQ6XZqTD+bLDNQLcY8BOB9cqII1xsU7J4Lu7D+94BOmzTRqRbNpQ3nD3yehzE
         6pF6bZt60JhmPPtpvL0yiGU+IJ01BRZfai2B9lqRHoQvnwCExYbzh27J1CBqg7QS4DN/
         3plZLbc0+SMImRnuUUtnHlw+4U7XuXRHzUpY0Gjy4Fi/2IQRGrE31/IjgHvc4/J3PfxF
         Cd4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=Ut3iGu0b/mI6XW5rpgCs/5VK4qy+LVrOrJIS25KPemw=;
        b=zmCswiFcET75AfeN6KEg/G2W9Mic8W7W1dD7XzGuHEwSBDJXzKaMciIXoz0lnviW4a
         DdkuB/WkDGauWm0iD0KIf4Cc07zhPf+mtpGYAoZrNAYIq7QVXjivL2+m+YBH8IkaSvE7
         5X42LNxpniFP//VBx2TV7VOhJsvOw1CecBy98kFJY0k7yAj+pKfK1a49D8xHKCAGhfKC
         E3prNsZwoubNFOQE7po9qrOjuAl/b09K+kLoprfUy+Kz9M9jFGRZV5oyq8r+srVkqH6J
         W+iu/fs7JyQxsRJGQkD7jmAmM5FApk/mg8W+sNM0wAIHJ11uuuajFfwVL3YTnZr4kBQJ
         38bg==
X-Gm-Message-State: ACrzQf1irKW6F0BQM7JMJlCoyuAA6PBjFJHv1vt56h9Pjmdr2+r+n87N
        qoMVuFm5Xkzu/FN/qXE4ZkDozQ==
X-Google-Smtp-Source: AMsMyM4WHp67dF80OY/vsCx8rfoGnuoWLl1ptdh1oP4myyjv5slsl9o3gYYnbqLklpA+rBFT+1PyXw==
X-Received: by 2002:adf:a15e:0:b0:22c:b9b7:abd0 with SMTP id r30-20020adfa15e000000b0022cb9b7abd0mr1508586wrr.584.1664266174765;
        Tue, 27 Sep 2022 01:09:34 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:b771:c77b:f889:9833? ([2a01:e0a:982:cbb0:b771:c77b:f889:9833])
        by smtp.gmail.com with ESMTPSA id d37-20020a05600c4c2500b003b332a7b898sm899485wmp.45.2022.09.27.01.09.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Sep 2022 01:09:34 -0700 (PDT)
Message-ID: <82fd53cf-c45e-fd9e-13b2-3cc2ff155d65@linaro.org>
Date:   Tue, 27 Sep 2022 10:09:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v4 2/3] ARM: dts: qcom: msm8974: add missing TCSR syscon
 compatible
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220920150414.637634-1-krzysztof.kozlowski@linaro.org>
 <20220920150414.637634-3-krzysztof.kozlowski@linaro.org>
Reply-To: neil.armstrong@linaro.org
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20220920150414.637634-3-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 20/09/2022 17:04, Krzysztof Kozlowski wrote:
> TCSR syscon node should come with dedicated compatible.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   arch/arm/boot/dts/qcom-msm8974.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
> index 7a9be0acf3f5..a4e12daf3eeb 100644
> --- a/arch/arm/boot/dts/qcom-msm8974.dtsi
> +++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
> @@ -1239,7 +1239,7 @@ tcsr_mutex_block: syscon@fd484000 {
>   		};
>   
>   		tcsr: syscon@fd4a0000 {
> -			compatible = "syscon";
> +			compatible = "qcom,tcsr-msm8974", "syscon";
>   			reg = <0xfd4a0000 0x10000>;
>   		};
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
