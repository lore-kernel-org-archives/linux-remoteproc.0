Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB3F8EB64D9
	for <linux-remoteproc@archiver.kernel.org>; Mon, 26 Jun 2023 20:19:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229523AbjFZUS7 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 26 Jun 2023 16:18:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230133AbjFZUSe (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 26 Jun 2023 16:18:34 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C42CDE7B
        for <linux-remoteproc@vger.kernel.org>; Mon, 26 Jun 2023 13:18:20 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2b699a2fe86so32286001fa.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 26 Jun 2023 13:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687810699; x=1690402699;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GXjEfqWjSNnoy5GhK5+E3PAFQcJVxWndxMD1oYQAjkw=;
        b=fUUyuH/Gp2T5jQI/T7Y/Ui9PoTwGsjiJJnQ/BKfNFKW0/9Sn+W23FJd2TChdwyzNWk
         xRMnwIrVhChZyfliEpJB9J0YuU8EJkHeKrW3yv5IYSty7pXb75UmOtqXI/tmMgPBODmB
         TMlQetlqLcVjUeJ5Xi4ed3cNYXE5UXmFkt3fqc1KO/DPjvxTB56xARwwH3dNyKhG2aSn
         Rpfj2sbpyr0WXX76jC96rB7VkoNZkuC94UrNbSVkoWM0cAgSHAeOoly3jhtcCTtSK5a8
         +VoZxIkzMZFA5X0Be2liBuyNO+iSd3HtSsa5T4FaxQVfVJ/phZbOZwrwGMRwTXW5y61/
         ZbTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687810699; x=1690402699;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GXjEfqWjSNnoy5GhK5+E3PAFQcJVxWndxMD1oYQAjkw=;
        b=DoM4l+3KxnbpJjQn01EVhM4DPbkw2Xl/Gi+dfgv8HaSULcFFlYsu8RAenrlHTc6N5Q
         5jPW9ZwwDItDcM4JrqwBiRwSnQfpsI6TnZ8+0K6tMKHnVKqnIdQywc5UjwbGCuIK6mTo
         iKMsSncyuwf+zbiF/MVrQZbxAaT7VRI9xXPFjRlxcuqfyCUGRL3CvXRb2A/BMHjpA1gB
         g0Gh0AW3HkF31n9Iy4RE8E6rGCrL57YCoS7c4XPhQ/TZTTzn8KYatOZq8fXQ3NJjfRvp
         lpol2Zeg2ALk1q4cC2XJUBgLruQVLiEKpJNdr9WBuemFXH/JwHI6mK6Y8kUGxr9PGKyx
         5GaA==
X-Gm-Message-State: AC+VfDyhX9aQ/PzgmSaP3y+YWB6KhtUUn7Hexju83+yKm6GTyjLlx0v8
        aY3psQd4rHnUJsZAAF6mUSvcNg==
X-Google-Smtp-Source: ACHHUZ4EEElP2/m42K4q0pHHIK4S8Q3rlG8J7bTTattHnlSY7jwFCYjgRYpZYEHrMvkooIooNzg6gw==
X-Received: by 2002:a05:6512:3414:b0:4f9:cd02:4af1 with SMTP id i20-20020a056512341400b004f9cd024af1mr4297892lfr.34.1687810698953;
        Mon, 26 Jun 2023 13:18:18 -0700 (PDT)
Received: from [192.168.1.101] (abyk179.neoplus.adsl.tpnet.pl. [83.9.30.179])
        by smtp.gmail.com with ESMTPSA id k1-20020ac24561000000b004f86f98ede5sm1239369lfm.309.2023.06.26.13.18.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jun 2023 13:18:18 -0700 (PDT)
Message-ID: <2b14f2a7-7f65-1b9d-06dc-92f0ea7fe096@linaro.org>
Date:   Mon, 26 Jun 2023 22:18:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 3/7] arm64: dts: qcom: pm6150l: Add missing short
 interrupt
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>
References: <20230626-topic-bindingsfixups-v1-0-254ae8642e69@linaro.org>
 <20230626-topic-bindingsfixups-v1-3-254ae8642e69@linaro.org>
 <2684880.mvXUDI8C0e@z3ntu.xyz>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <2684880.mvXUDI8C0e@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 26.06.2023 22:17, Luca Weiss wrote:
> On Montag, 26. Juni 2023 22:00:25 CEST Konrad Dybcio wrote:
>> Add the missing short interrupt. This fixes the schema warning:
>>
>> wled@d800: interrupt-names: ['ovp'] is too short
>>
>> Fixes: fe508ced49dd ("arm64: dts: qcom: pm6150l: Add wled node")
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>  arch/arm64/boot/dts/qcom/pm6150l.dtsi | 5 +++--
>>  1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/pm6150l.dtsi
>> b/arch/arm64/boot/dts/qcom/pm6150l.dtsi index 6a7fe1e59f15..d13a1ab7c20b
>> 100644
>> --- a/arch/arm64/boot/dts/qcom/pm6150l.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/pm6150l.dtsi
>> @@ -121,8 +121,9 @@ pm6150l_flash: led-controller@d300 {
>>  		pm6150l_wled: leds@d800 {
>>  			compatible = "qcom,pm6150l-wled";
>>  			reg = <0xd800>, <0xd900>;
>> -			interrupts = <0x5 0xd8 0x1 IRQ_TYPE_EDGE_RISING>;
>> -			interrupt-names = "ovp";
>> +			interrupts = <0x5 0xd8 0x1 IRQ_TYPE_EDGE_RISING>,
>> +				     <0x5 0xd8 0x2 IRQ_TYPE_EDGE_RISING>;
>> +			interrupt-names = "ovp", "short";
> 
> Are you sure this interrupt really exists? It's not a thing used downstream at
> least:
> https://android.googlesource.com/kernel/msm-extra/devicetree/+/refs/heads/android-msm-bramble-4.19-android11-qpr1/qcom/pm6150l.dtsi#293
> 
Confirmed with a reliable source.

Konrad
> Regards
> Luca
> 
>>  			label = "backlight";
>>
>>  			status = "disabled";
> 
> 
> 
> 
