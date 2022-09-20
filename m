Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E94BFECAAD8
	for <linux-remoteproc@archiver.kernel.org>; Tue, 20 Sep 2022 13:04:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230426AbiITNEp (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 20 Sep 2022 09:04:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230374AbiITNEm (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 20 Sep 2022 09:04:42 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75D4EE020
        for <linux-remoteproc@vger.kernel.org>; Tue, 20 Sep 2022 06:04:40 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id b24so2902064ljk.6
        for <linux-remoteproc@vger.kernel.org>; Tue, 20 Sep 2022 06:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=mygucZLIIUq2+FCsjFkyMMlDK+CJ9xh7zLzeZeK2yZg=;
        b=WsxTjmjjR5He1obnmT81IpfHGF3TAtQwEqHc9G5ZqUrFs2kbImGYXtBE/xJo9lJWJE
         W2TazRt+bt2n5AWiU1ukRCVo5TNGXC566ucLppTnHSuPW0MP0YvlovfNFKnTb6skx2aS
         mFLuiC9VSf2F3yeK/uMlAHPnbgGU3EjqCDChKYlbVl9NMxHgNWhZNusMNGJ2VAHqWeaS
         7Wv2polvLKRw4rSxP65KinAT2KfRSMogHr1ERuG96Nw8pHE1xbuykZeCidiKoOXdzeAe
         Sn62ybtz34tDJ1SG8HonleKGLwlnDmSt7gc2LEKo7QcXmvG9/OVHn4pkTPHLRsQIyfYK
         +/rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=mygucZLIIUq2+FCsjFkyMMlDK+CJ9xh7zLzeZeK2yZg=;
        b=IM+sfkQzLUBhN/ycVdX8IFI4cl+7IFelz/aLpq3NNZlqK4WRgRxO2xQRE+NXusA+Nb
         7fZQktYR6YMfaoHOT1E+nBs1BynFQQ+ef8rvNZMdDfgtfx1FCiGnFII06lKWj00kXvjM
         9a65BBSWGiSutmJUVs8ADw7AMpD7ziqxDPGAA6ja7kS0mICvpwqa4YgUnUWFJBWQpnIv
         7qFlMI4gjUZ0apR3BXL/vnwsWnAly66DphwU6/X/dfLMXvpfPz+63igmJD/raA0ehKme
         JXdHZHGMPoXb0puU/0tOFTRyiQww+DqWw/N7obuKEbrDfip7Bg/AyVpAJgtjl5+8HGQ+
         srNg==
X-Gm-Message-State: ACrzQf1if+dckH1GXSJzNOBW8ZFggCUdQ9t/TIZGmAmdo0S5V25AD0H9
        6bsy16yHJwgutisgPrlp8yf5+w==
X-Google-Smtp-Source: AMsMyM5iwAJVadIwLWzNsycVIha+pQHWZEUDNZq7PgtHVR0W04+wybhIyzQLVLqGmQPd6wdqR+xJfA==
X-Received: by 2002:a2e:98c:0:b0:26a:9b25:b76f with SMTP id 134-20020a2e098c000000b0026a9b25b76fmr6869396ljj.256.1663679078764;
        Tue, 20 Sep 2022 06:04:38 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id y20-20020ac24214000000b0049f54a976efsm312567lfh.29.2022.09.20.06.04.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Sep 2022 06:04:38 -0700 (PDT)
Message-ID: <b4b61b0a-25a2-b435-4154-2ec2db2c289e@linaro.org>
Date:   Tue, 20 Sep 2022 15:04:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 08/15] arm64: dts: qcom: msm8996: add missing TCSR
 syscon compatible
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
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
 <9f47ef0f-6e73-9ed4-55db-491d22c55c76@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <9f47ef0f-6e73-9ed4-55db-491d22c55c76@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 20/09/2022 00:13, Dmitry Baryshkov wrote:
> On 09/09/2022 12:20, Krzysztof Kozlowski wrote:
>> TCSR syscon node should come with dedicated compatible.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>   arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
>> index 166374566a49..5f45d0589265 100644
>> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
>> @@ -3499,7 +3499,7 @@ frame@98c0000 {
>>   		};
>>   
>>   		saw3: syscon@9a10000 {
>> -			compatible = "syscon";
>> +			compatible = "qcom,tcsr-msm8996", "syscon";
> 
> No! saw3 is not a TCSR. It is a separate region, which should be managed 
> by the SPM driver.

Indeed. Thanks for checking this.

Best regards,
Krzysztof
