Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 047ADC54EAA
	for <linux-remoteproc@archiver.kernel.org>; Fri, 27 Jan 2023 11:03:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232303AbjA0LDM (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 27 Jan 2023 06:03:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231579AbjA0LDL (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 27 Jan 2023 06:03:11 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 838994F353
        for <linux-remoteproc@vger.kernel.org>; Fri, 27 Jan 2023 03:03:08 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id d14so4613877wrr.9
        for <linux-remoteproc@vger.kernel.org>; Fri, 27 Jan 2023 03:03:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6WecBPN5Z8fIrzgNM6687sCUjCeNc3gPd9HUiHww7Wk=;
        b=OBf+O2j/9x9He+KEFDkRIkjuVrzJXuxA4H3bMwqUDxkjdcmPMZfFo/EPdCiuJ0RJGf
         4WqNjLFcv3q3LuZ3eILsP5MSYMWCoHE0n5SjthGN1+PEbMbXKOA0Gn40GyEJWWkeGoZ9
         cKqgHqtr0lj3Rl+b9xaP2a4TWfCl7TUoroOKPg93PC3K1UmVXKw1Naf+ESEtFADVjcuC
         ycmjIZs8Gaa5hQjiAcO76hgURMfYFRcVNjvCga2MNz1gQNSmYoPs3eKHjuMEChLhZNmX
         QKK4K+FM8h6QCV+ApeE/JY3jZoI5AsRJ9gLaQ+HIIW8+DIMR/b7Uj6Qg/ExXFcBPpZjs
         eDsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6WecBPN5Z8fIrzgNM6687sCUjCeNc3gPd9HUiHww7Wk=;
        b=uC33undCDYqikzd4aYUUsYJdN3Y5ZLxxW04PwECZhMejD/LpVU54jB3selw3al9e5U
         ES0m/yUWz5cR2XmLjYEqiOAAzlgguWMY8Mm0ArpWILqB1Fu5ke+Dto75WI3CQkkadsUQ
         BXAP+SAiBuojNmZeXRc1uutpdrRL7q9DcumBughu9wfBkJp7rOav4+e8dLBQg8CUz+rb
         IZIC/c824OE8NIJHN8UeKKEqLLM34ksqFRBsizZwyWUE4SWET4vyjI3l35rC3VNbHw0e
         qpGcWYi2BRXFaQJ0hl5sMAdt2GLWt23ehBOWBlFx22ILLXkS2CNkacCbOzkKphcX795x
         8Bew==
X-Gm-Message-State: AFqh2kqJwUiMuFCBlO29C9bqGH21uMTQ1CNLMrg8ZIxgA6/ycqBQ+5u6
        KGmaADDc8AJqPOJ/9Mdp7Qnulw==
X-Google-Smtp-Source: AMrXdXv1lUyHNCHx29DyxMxXVX+IbwzXZxWV8IkNWDcUSyNoeC1L0J8VhZEhpvrzdFiL8GYHKEc0Pw==
X-Received: by 2002:a05:6000:4f:b0:2bf:94c3:19ac with SMTP id k15-20020a056000004f00b002bf94c319acmr21429083wrx.31.1674817387043;
        Fri, 27 Jan 2023 03:03:07 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id e10-20020a5d500a000000b002be0b1e556esm3674567wrt.59.2023.01.27.03.03.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jan 2023 03:03:06 -0800 (PST)
Message-ID: <795b6ac2-9745-7992-566e-950037e622e4@linaro.org>
Date:   Fri, 27 Jan 2023 12:03:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 0/5] remoteproc: qcom_q6v5_pas: add support for SM8550
 adsp, cdsp & mpss
Content-Language: en-US
To:     Bjorn Andersson <andersson@kernel.org>, agross@kernel.org,
        robh+dt@kernel.org, neil.armstrong@linaro.org, mani@kernel.org,
        srinivas.kandagatla@linaro.org, krzysztof.kozlowski+dt@linaro.org,
        amahesh@qti.qualcomm.com, mathieu.poirier@linaro.org,
        konrad.dybcio@somainline.org
Cc:     linux-arm-msm@vger.kernel.org, elder@linaro.org,
        abel.vesa@linaro.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20221114-narmstrong-sm8550-upstream-remoteproc-v4-0-54154c08c0b7@linaro.org>
 <167406406337.2924867.12230424280288709048.b4-ty@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <167406406337.2924867.12230424280288709048.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 18/01/2023 18:47, Bjorn Andersson wrote:
> On Wed, 18 Jan 2023 17:22:39 +0100, Neil Armstrong wrote:
>> This patchsets adds support for the aDSP, cDSP and MPSS found in the
>> SM8550 SoC.
>>
>> The aDSP, cDSP and MPSS boot process on SM8550 now requires a secondary
>> "Devicetree" firmware to be passed along the main Firmware, and the cDSP
>> a new power domain named "NSP".
>>
>> [...]
> 
> Applied, thanks!
> 
> [1/5] dt-bindings: remoteproc: qcom: adsp: move memory-region and firmware-name out of pas-common
>       commit: cee616c6884616aea3be72a9debafd0614332682
> [2/5] dt-bindings: remoteproc: qcom: adsp: document sm8550 adsp, cdsp & mpss compatible
>       commit: 084258d607128a7486311daf5e67ca414ee07cc9
> [3/5] remoteproc: qcom_q6v5_pas: add support for dtb co-firmware loading
>       commit: 29814986b82e820ae9d3eb7474cdcf66605bd114
> [4/5] remoteproc: qcom_q6v5_pas: add support for assigning memory to firmware
>       commit: c63c0a7cab91b930a6ee78c28b481b84bfa98b7f
> [5/5] remoteproc: qcom_q6v5_pas: add sm8550 adsp, cdsp & mpss c


The bindings were not tested against their own DTS:

sm8550-mtp.dtb: remoteproc@32300000: power-domain-names: ['cx', 'mxc',
'nsp'] is too long

so now it throws fresh warnings... I don't know what is wrong here -
either DTS or the bindings - but they probably were never used together.


Best regards,
Krzysztof

