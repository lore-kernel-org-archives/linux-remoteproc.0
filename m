Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81BB3ECAAD3
	for <linux-remoteproc@archiver.kernel.org>; Mon, 19 Sep 2022 22:13:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229473AbiISWNM (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 19 Sep 2022 18:13:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbiISWNL (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 19 Sep 2022 18:13:11 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E13A4B485
        for <linux-remoteproc@vger.kernel.org>; Mon, 19 Sep 2022 15:13:10 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id x27so866168lfu.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 19 Sep 2022 15:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=fW+BG/ifotJzpbpYrUmfeXzsvH+V22SmlVB0fmXMDBY=;
        b=zHSp0dAkCWyMONr1qxKlKhqnKlB+iscpGidOopbZzIQW9XUXnvlhqNAwFlNLoNj1s5
         16V0DjZ06LoA5RiLLv3e8sa4YdfNjMAaKXau8a1wjIDAw69PDWGIqrgkgNggKz5HL2EE
         3tmknEpEPRm/GIBv32Yl/MWB6TN9zPIxHy5+bQB5UEU85g36ZHGOQyn7rPs92jsIVYU6
         pJjJKX9RT6DPCpD3Y0mQhMuAVQbfs/MJxZN7mfX1IS7c44pJel0kDIxYxiMCFMvWf+FN
         8DkPXqXip3SLO3FNtiL634SpSM+8o2Y18F3xiNvyT3PcVvGOws0SEapq5T6kZEYcyqEX
         bmrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=fW+BG/ifotJzpbpYrUmfeXzsvH+V22SmlVB0fmXMDBY=;
        b=J6qf8vQbdKl4mgKrO7Wf2/0tHEuBLmiEzZw7UTQbRlowDQ/R2th0MaJ0ASjgNyGu7Y
         G9qD/nGnsBHFkZgq0fUca+fLywwd1ST958hF0ZQgl+zc4loF7CNZY2luSO91IYHrHIcb
         DdLOnUnptz2144Np0Nvludfp5hW9VINB+FNHZAP40SCnvjkwumB8tnoAvpa+f0pxGa19
         JQjZiA/czOyu1ULJsIfDl4k5gq8mfjcb7atUlrmgSEse06raHcS7Us+ABL9dCs+2VcDO
         VskvqCrvKiTaKHZh8eOLlnTs81G/vZxKL1CCCOZLIKlrJXu+Q80QgMkBZ9XcCJzKGzL9
         IWdQ==
X-Gm-Message-State: ACrzQf0Rpqt1SP5PekVT3XyOTV8wv/qsGytp/ulOxYJvVbn7tuVFvtL1
        N2aDFqeR2B8ByVWDXpYAN0zymA==
X-Google-Smtp-Source: AMsMyM6ic1gA/caHy9x6orElbheB+k7wWcsArpMWT+flAE3i3cuy4q0qCbblGvLZooRIMIzwVVr0Kg==
X-Received: by 2002:a05:6512:3daa:b0:49f:966f:254a with SMTP id k42-20020a0565123daa00b0049f966f254amr3646871lfv.73.1663625588688;
        Mon, 19 Sep 2022 15:13:08 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id cf11-20020a056512280b00b00499b232875dsm5257177lfb.171.2022.09.19.15.13.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Sep 2022 15:13:08 -0700 (PDT)
Message-ID: <9f47ef0f-6e73-9ed4-55db-491d22c55c76@linaro.org>
Date:   Tue, 20 Sep 2022 01:13:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v3 08/15] arm64: dts: qcom: msm8996: add missing TCSR
 syscon compatible
Content-Language: en-GB
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220909092035.223915-1-krzysztof.kozlowski@linaro.org>
 <20220909092035.223915-9-krzysztof.kozlowski@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220909092035.223915-9-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 09/09/2022 12:20, Krzysztof Kozlowski wrote:
> TCSR syscon node should come with dedicated compatible.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index 166374566a49..5f45d0589265 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -3499,7 +3499,7 @@ frame@98c0000 {
>   		};
>   
>   		saw3: syscon@9a10000 {
> -			compatible = "syscon";
> +			compatible = "qcom,tcsr-msm8996", "syscon";

No! saw3 is not a TCSR. It is a separate region, which should be managed 
by the SPM driver.

>   			reg = <0x09a10000 0x1000>;
>   		};
>   

-- 
With best wishes
Dmitry

