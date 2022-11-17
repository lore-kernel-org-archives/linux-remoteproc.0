Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06CA0C4332F
	for <linux-remoteproc@archiver.kernel.org>; Thu, 17 Nov 2022 09:32:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233466AbiKQJcH (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 17 Nov 2022 04:32:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239251AbiKQJcG (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 17 Nov 2022 04:32:06 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 069E86CA14
        for <linux-remoteproc@vger.kernel.org>; Thu, 17 Nov 2022 01:32:05 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id s8so1868948lfc.8
        for <linux-remoteproc@vger.kernel.org>; Thu, 17 Nov 2022 01:32:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OHCbnyqktFUSf9IKrLp6iVFJSHrFuKbgt4erXb4qf1Y=;
        b=MGogdx0f3eR/N4U/XHNRAwWXsU003fKuWMj1Pv0dhmTkAuZelbaCG25obFd2duVkzZ
         2y8Y7CxU80BXc9vGnxSuN0Qzo7Ol80C9XX+ZOg2bGL6rvfh9Qenz+LdUKv26AeSiNVBH
         tyxrRKtLg7i6uQffkwl6VCFX4P4J/Yqfl7UDED2Dozaq1JdyEasUDPh9GRFSMNun4E8H
         70KaJX1bRvECLaW1XM229UZpA6XdNvYRrcXWJ93moqB7rM0mIb1e9ufQIs9rqM8U/XKt
         3ugIIsGgAFJvbTYFeCRInFi9SApxiUHlWoczLOJrRuEqkhmZjhANqFfjS7WJ0iGsUHir
         2FvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OHCbnyqktFUSf9IKrLp6iVFJSHrFuKbgt4erXb4qf1Y=;
        b=Yav267k6CoC/lUwpNFsB+Daq2MN5WZSik2fUPtZI45noDV+X6u/czbyyW3bXotdrHa
         81bAE1PXx2yNzjwrBZzTPtG6Q/Fet4KCiQDxg3/Qeo3KiuJoNTIl8R5fYrdIHSQwKHQ0
         zYtzSj4DfEZXdtL+nSZBu0U3fjAmpUUQiO9IVoVLlhM0yQWMtMlmgZLPRGUb6k0zqubc
         klENgzUYQ+SpBZn0mzoeI41/po/KdTvut3pGGf+1o0kExQSGh0YgWJO6bBTSdxgGiezc
         eRWLrDDGh2KO9NpS5AJewMOn+iv146L53B6d0dQi2Ju2Ci2FttCVpISgWNNvLw8HYIY9
         fpIg==
X-Gm-Message-State: ANoB5pnklP4p9sQuNTVZLgqPaD01jGO6h8+uGnRQc5Yak1i3bOo1D0G8
        Q8v3HmRN3q+1usNvBHBuRoAusA==
X-Google-Smtp-Source: AA0mqf6RwhqC8C8ERpHU5iNKRdID8pAZfWvulmJEAm5wS3EhAunQuKjqaMwSiKpiIoj7Ur0dpberKA==
X-Received: by 2002:a19:4f02:0:b0:4a2:1d18:45d8 with SMTP id d2-20020a194f02000000b004a21d1845d8mr580697lfb.330.1668677523426;
        Thu, 17 Nov 2022 01:32:03 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id u16-20020a056512041000b004aa95889063sm65546lfk.43.2022.11.17.01.32.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Nov 2022 01:32:02 -0800 (PST)
Message-ID: <1b23d300-a580-85a0-3c1d-605305099eba@linaro.org>
Date:   Thu, 17 Nov 2022 10:32:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/4] dt-bindings: remoteproc: qcom: adsp: document sm8550
 adsp, cdsp & mpss compatible
Content-Language: en-US
To:     neil.armstrong@linaro.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     devicetree@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
References: <20221114-narmstrong-sm8550-upstream-remoteproc-v1-0-104c34cb3b91@linaro.org>
 <20221114-narmstrong-sm8550-upstream-remoteproc-v1-1-104c34cb3b91@linaro.org>
 <b6eac577-f3a7-d1a4-f492-74782c2e5ff1@linaro.org>
 <daa4b852-5452-9363-3bc8-16a7637cc8bb@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <daa4b852-5452-9363-3bc8-16a7637cc8bb@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 17/11/2022 10:22, Neil Armstrong wrote:
>>>   
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            enum:
>>> +              - qcom,sm8550-cdsp-pas
>>> +    then:
>>> +      properties:
>>> +        power-domains:
>>> +          items:
>>> +            - description: CX power domain
>>> +            - description: MXC power domain
>>> +            - description: NSP power domain
>>> +        power-domain-names:
>>> +          items:
>>> +            - const: cx
>>> +            - const: mxc
>>> +            - const: nsp
>>> +
>>
>> You also need to update entry for resets. I think it is missing.
> 
> Hmm no, no resets needed for sm8550.

Indeed, only few variants update resets. I'll fix them in my cleanup
series. The series conflict with this one here.

https://lore.kernel.org/linux-arm-msm/20221116155416.164239-1-krzysztof.kozlowski@linaro.org/T/#t

> 
>>
>>>     - if:
>>>         properties:
>>>           compatible:
>>> @@ -573,6 +608,29 @@ allOf:
>>>         properties:
>>>           qcom,qmp: false
>>>   
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            enum:
>>> +              - qcom,sm8550-adsp-pas
>>> +              - qcom,sm8550-cdsp-pas
>>> +              - qcom,sm8550-mpss-pas
>>> +    then:
>>> +      properties:
>>> +        memory-region:
>>> +          minItems: 2
>>> +          description:
>>> +            First entry is a phandle for a reserved memory area that holds
>>> +            the main Firmware for authentication, and second entry a phandle for a
>>> +            reserved memory area that holds the Devicetree Firmware for authentication.
>>
>> Instead of minItems and description:
>>    items:
>>      - description: Main Firmware for auth....
>>      - description: Devicetree Firmware....
> 
> Ack
> 
>>
>>> +    else:
>>> +      properties:
>>> +        qcom,dtb-firmware-name: false
>>> +
>>> +        memory-region:
>>> +          maxItems: 1
>>> +
> 
> I'll rebase on top of 20221116155416.164239-1-krzysztof.kozlowski@linaro.org.
> 
> Seems I should perhaps add a separate qcom,sm8550-pas.yaml right, or adding the qcom,sm6350-pas.yam would be ok ?

The clocks and interrupts match qcom,sm8350-pas.yaml, but power domains
and memory region does not, so you need separate qcom,sm8550-pas.yaml file.

Best regards,
Krzysztof

