Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E23F7C47088
	for <linux-remoteproc@archiver.kernel.org>; Fri,  2 Dec 2022 10:33:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233373AbiLBKdc (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 2 Dec 2022 05:33:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232642AbiLBKdX (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 2 Dec 2022 05:33:23 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F0B8C23D2
        for <linux-remoteproc@vger.kernel.org>; Fri,  2 Dec 2022 02:33:22 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id ay8-20020a05600c1e0800b003d0808d2826so1986547wmb.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 02 Dec 2022 02:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=319dmF23gwJK1akaWUytWINSdZyUZn6mYWv2AFrEvXo=;
        b=LolCNAjp8odhCiMzE1CWcI/k7ve1fvFvyHmzTvLl5QBZgGw7eXneQh8wD3olh4o1Ri
         rtEuowwpMdnrC9s5Rlfw2Gwc+VTnv3ZBkXo2w94zYQcvWR9kE/WB8nW0pr15EpoxWOTU
         AndyX49+UzNhi65llM4u34e0ctQ8/hsQa2lOuUNBfnkTOylumMgMUIYC3074fH0TUoJR
         G6U2JLUDTbig+kheenO6WKmhAcSH3hIndDuqck25IWkIo+rm3kSYUS4L2AGTmBmHkmj6
         l6gTFk+CmulioyhUbFT8qf2n0YDBajiHS5nAKiKiw4AaU53sG+zU7JmL3bVpYqR89lJm
         Jimw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=319dmF23gwJK1akaWUytWINSdZyUZn6mYWv2AFrEvXo=;
        b=zE4SALMCAhNGhvkZZKTGPQ9TD8EkDthACLI3n/++1tIfuPj0HWS6zPFh76XfB8Xg++
         vLLn1gZzt46pDpwRIT1GjKK9x1idqY34QXtevnCb2/3HSjzWtsZPtdBXZ+Xkf175qi6v
         +YF2LDq+Zzb6pV5YuAiQRTGZIGZxfGUHkVeg1kSlnxhgz64tS0SStw3EtgvWIhjvi8IM
         4hzn0tAbfpxBAChRN9q7703rp+xZVgwIysxiu/6j6cqUTNjwKOqurhekPX+WrxeEvB3i
         blhp8q7EpKDEWexaQau+6vhKmozqUxx1fgVSAturNcaG3UWxNYQoayrxlRRKyrAbu7d1
         RA+Q==
X-Gm-Message-State: ANoB5pnKGyhJRZEbJ39mdHU5uBYYwSK7yEHY+HRMdOa1ZBuMiO5sA/kk
        OwUrai5rZ2yG8TDRImzceH959A==
X-Google-Smtp-Source: AA0mqf5MasTI2olKjBxig8ppzSE99CaJVV90JPkC7fb8qDKJK8xOdMTP/AoSJjoRRLZElCCYyX9HRg==
X-Received: by 2002:a05:600c:35c4:b0:3cf:9668:e8f8 with SMTP id r4-20020a05600c35c400b003cf9668e8f8mr42600076wmq.195.1669977200633;
        Fri, 02 Dec 2022 02:33:20 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:c6e:eb0:b551:55ee? ([2a01:e0a:982:cbb0:c6e:eb0:b551:55ee])
        by smtp.gmail.com with ESMTPSA id z12-20020a5d44cc000000b002362f6fcaf5sm6640919wrr.48.2022.12.02.02.33.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Dec 2022 02:33:20 -0800 (PST)
Message-ID: <ace35de2-9aa8-8cfa-1f4c-46480fbbc442@linaro.org>
Date:   Fri, 2 Dec 2022 11:33:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 2/5] dt-bindings: remoteproc: qcom: adsp: document
 sm8550 adsp, cdsp & mpss compatible
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Andy Gross <agross@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>,
        linux-remoteproc@vger.kernel.org
References: <20221114-narmstrong-sm8550-upstream-remoteproc-v2-0-12bc22255474@linaro.org>
 <20221114-narmstrong-sm8550-upstream-remoteproc-v2-2-12bc22255474@linaro.org>
 <8d7367b2-126a-d8ba-b616-be1ef9c67122@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <8d7367b2-126a-d8ba-b616-be1ef9c67122@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 01/12/2022 11:58, Krzysztof Kozlowski wrote:
> On 30/11/2022 11:29, Neil Armstrong wrote:
>> This documents the compatible for the component used to boot the
>> aDSP, cDSP and MPSS on the SM8550 SoC.
>>
>> The SM8550 boot process on SM8550 now requires a secondary "Devicetree"
>> firmware to be passed along the main Firmware, and the cDSP a new power
>> domain named "NSP".
>>
>> A third memory domain for the DSM memory zone is also needed for the MPSS
>> PAS bindings.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> 
> Thank you for your patch. There is something to discuss/improve.
> 
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          enum:
>> +            - qcom,sm8550-adsp-pas
>> +    then:
>> +      properties:
>> +        power-domains:
>> +          items:
>> +            - description: LCX power domain
>> +            - description: LMX power domain
>> +        power-domain-names:
>> +          items:
>> +            - const: lcx
>> +            - const: lmx
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          enum:
>> +            - qcom,sm8550-cdsp-pas
>> +    then:
>> +      properties:
>> +        power-domains:
>> +          items:
>> +            - description: CX power domain
>> +            - description: MXC power domain
>> +        power-domain-names:
>> +          items:
>> +            - const: cx
>> +            - const: mxc
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - qcom,sm8550-cdsp-pas
> 
> This entire if does not look valid - compatible is covered in the
> previous one. You should see `dtbs_check` warnings on your DTS.

Wow indeed, this should be mpss-pas...

The main changes here was firmware-name and memory-region to handle
the dtb firmware and the DSM memory region, are those OK ?

Neil

> 
>> +    then:
>> +      properties:
>> +        power-domains:
>> +          items:
>> +            - description: CX power domain
>> +            - description: MXC power domain
>> +            - description: NSP power domain
>> +        power-domain-names:
>> +          items:
>> +            - const: cx
>> +            - const: mxc
>> +            - const: nsp
>> +
>> +unevaluatedProperties: false
>> +
> 
> Best regards,
> Krzysztof
> 

