Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3385C43217
	for <linux-remoteproc@archiver.kernel.org>; Thu,  1 Dec 2022 11:00:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231205AbiLALAG (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 1 Dec 2022 06:00:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231128AbiLAK7f (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 1 Dec 2022 05:59:35 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F40095807
        for <linux-remoteproc@vger.kernel.org>; Thu,  1 Dec 2022 02:58:53 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id q7so1435405ljp.9
        for <linux-remoteproc@vger.kernel.org>; Thu, 01 Dec 2022 02:58:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9CMzCUFTPRKosFugMwQr2rqsvUFi3ESa8CvF8qyIZfg=;
        b=PnMhWd05zRtzaHExY2rIhP1gphf9RFJAl65SVxk7kbPa+KKK+YkkHzsGWPr8mMkYOo
         B1MGjQ+pj1q4Kx/7s7aoVouh+wVLTCAWHkfmxk4R7uNkPYQnDoH5TDXb8pdeOupaamsT
         OWtdq5m+qk8OSCfNdWBAwQyywOQEq9Q6ybtq3C86o71/VY+mamB2c8Rb3Xm//Uw72Mfa
         kVejeEcmMBlV/ltrtl2ju+CEFUQQXCWi52ly3LkUQtjegnVl/Cz98bUZZjp1iAahSM4/
         SzkueT61emF5X2sLvwL6BYpjqjmo1nQTjtPPkdbH6B/2hm3irS5gb3xavHr7QnLBKyEA
         CU2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9CMzCUFTPRKosFugMwQr2rqsvUFi3ESa8CvF8qyIZfg=;
        b=yQ6+yNbcSWmONMe7W1iJtqQ0iZfjQAhhi6Nb5LbnosKazk1eLELw4ktbPN06q5Haor
         XZLN4qHa4f1+ubyZtCV3CAR9dLl146KMOz0XzU/vR+kUbTERVWIpXK9dNehU2qaw8gMN
         azKJw9IcMDODlH7QP8H+sI5HaBHMwdPjwiJVkIer18uA/bBZKPfHMGDn+FgwAV+TnfHH
         q9VeJRz444DKXKPrKzG3m2cn+U3VhimwjDQjCu+EFLC8iM2Vv+3GJj3rkNSJXbUBUKKe
         V2UWG1bIFYtzBtVFMjnEFHMBrarWbc9OaAcG8+xA6kbLE7aDIggUeqMvJh4G33YRyrLL
         QA6A==
X-Gm-Message-State: ANoB5pnIJx17Vjz8dPjunEEzA15K0g6d8XNzednW89jfomIOyElz+Qzt
        3cqW6Km/XR1WQZDnfa2hkVLbTw==
X-Google-Smtp-Source: AA0mqf5ufFeOB1OMBaOMcApvYDpojjK4SFRwAd0IAmjOU7uHV8tnjvNQBKUnCedswt5pgds69ito8w==
X-Received: by 2002:a2e:be06:0:b0:26f:c489:883e with SMTP id z6-20020a2ebe06000000b0026fc489883emr20653090ljq.281.1669892331406;
        Thu, 01 Dec 2022 02:58:51 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id br33-20020a056512402100b004b1756a0ae9sm611811lfb.55.2022.12.01.02.58.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Dec 2022 02:58:50 -0800 (PST)
Message-ID: <8d7367b2-126a-d8ba-b616-be1ef9c67122@linaro.org>
Date:   Thu, 1 Dec 2022 11:58:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 2/5] dt-bindings: remoteproc: qcom: adsp: document
 sm8550 adsp, cdsp & mpss compatible
Content-Language: en-US
To:     Neil Armstrong <neil.armstrong@linaro.org>,
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
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221114-narmstrong-sm8550-upstream-remoteproc-v2-2-12bc22255474@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 30/11/2022 11:29, Neil Armstrong wrote:
> This documents the compatible for the component used to boot the
> aDSP, cDSP and MPSS on the SM8550 SoC.
> 
> The SM8550 boot process on SM8550 now requires a secondary "Devicetree"
> firmware to be passed along the main Firmware, and the cDSP a new power
> domain named "NSP".
> 
> A third memory domain for the DSM memory zone is also needed for the MPSS
> PAS bindings.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Thank you for your patch. There is something to discuss/improve.

> +
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - qcom,sm8550-adsp-pas
> +    then:
> +      properties:
> +        power-domains:
> +          items:
> +            - description: LCX power domain
> +            - description: LMX power domain
> +        power-domain-names:
> +          items:
> +            - const: lcx
> +            - const: lmx
> +
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - qcom,sm8550-cdsp-pas
> +    then:
> +      properties:
> +        power-domains:
> +          items:
> +            - description: CX power domain
> +            - description: MXC power domain
> +        power-domain-names:
> +          items:
> +            - const: cx
> +            - const: mxc
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,sm8550-cdsp-pas

This entire if does not look valid - compatible is covered in the
previous one. You should see `dtbs_check` warnings on your DTS.

> +    then:
> +      properties:
> +        power-domains:
> +          items:
> +            - description: CX power domain
> +            - description: MXC power domain
> +            - description: NSP power domain
> +        power-domain-names:
> +          items:
> +            - const: cx
> +            - const: mxc
> +            - const: nsp
> +
> +unevaluatedProperties: false
> +

Best regards,
Krzysztof

