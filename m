Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B3FDC38145
	for <linux-remoteproc@archiver.kernel.org>; Tue,  6 Sep 2022 09:03:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238834AbiIFJDZ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 6 Sep 2022 05:03:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233089AbiIFJDY (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 6 Sep 2022 05:03:24 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1521A3CBD8
        for <linux-remoteproc@vger.kernel.org>; Tue,  6 Sep 2022 02:03:23 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id z25so16378120lfr.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 06 Sep 2022 02:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=qKAHS8QOJPr7gTNEKi97bZ2RBqwyh0sayFIzXNeO7N8=;
        b=FGQxGcqFByjtxDxOIs5PvfbJTQ9eEq9GcmSCWha7C0lIb2q3lUGFl8ZVz9wIQMdSJa
         lKLX3QwZxiNNoY4coo1hyXGBH59d74JVFqtvc9j1LwObBXdArMyIB8MLVvaFTzJednbY
         M7keFOSDLziyCZhusXNGJbJGnW8kr1y7K1tn+YjidvDyCgbGKxlSYliAegoCMHbHjrus
         V2MiGMd4mKUvx4lTsndwKPYiBHHrdioq9buZK5XfdhdFz/LJgH8oJBMc8gMXy1RsZNSc
         BdzVKv4dxX599HnYsmMJSptltzoEZCc0tZY0rmkBNLmHNP+YRtMG0KpeJ0BoW9sHHKGd
         gXHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=qKAHS8QOJPr7gTNEKi97bZ2RBqwyh0sayFIzXNeO7N8=;
        b=NXfyMEkMJwQwRfc8m22nje+cxvQWtXQAd7BuhQa+nweRPNmtTmDn8nL5iPQpWf54F+
         4oN76/K+EOKW9Ug7CrVJqpL+trRtMl6/PQURFh3zokoMXw1ju5Fq0w/wy1D7hebBDt/P
         TJmNmVFN7fTd4zf0LiSaWAgY7SAcue3enEEzELP3FUEBhHTBF5ayQdsRmTgRMIzWDu46
         DIA+VyIWaQruXKJt/QtUFr1OyvMaACTiZs4zAj0cRRlCMLb2aOmDyhMd9IXb8g7AU+Je
         T3Lv1aH4vnu+bia3ZF5eI1zVDWlaJEDvqkUabD4sjwHSyuVCKioBBHXxT8l2eXZqYN3s
         9GBA==
X-Gm-Message-State: ACgBeo1hmswgFBhhwiGvvvqJfDp6xwdHgBCSKpI5Q+LBoL3/5tpGU8Dl
        MBjkZOSWSpV7h0nfrtKO7pzoLA==
X-Google-Smtp-Source: AA6agR71TapACZZa68tF3V1Bts7FpSvEvhdkK84e8jhYmvFXx2UsXQ/vF3J0/lgxyibBVYn21QZF6Q==
X-Received: by 2002:a05:6512:2805:b0:48b:78:6e91 with SMTP id cf5-20020a056512280500b0048b00786e91mr16482906lfb.569.1662455001421;
        Tue, 06 Sep 2022 02:03:21 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id f12-20020a056512360c00b0049482adb3basm1601042lfs.63.2022.09.06.02.03.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Sep 2022 02:03:20 -0700 (PDT)
Message-ID: <5d4abf52-17d5-343b-b771-ac87bc2cff07@linaro.org>
Date:   Tue, 6 Sep 2022 11:03:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 2/7] dt-bindings: remoteproc: qcom,q6v5: Move MSM8916
 to schema
Content-Language: en-US
To:     Stephan Gerhold <stephan.gerhold@kernkonzept.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sireesh Kodali <sireeshkodali1@gmail.com>,
        Luca Weiss <luca@z3ntu.xyz>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220831134626.2803117-1-stephan.gerhold@kernkonzept.com>
 <20220831134626.2803117-3-stephan.gerhold@kernkonzept.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220831134626.2803117-3-stephan.gerhold@kernkonzept.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 31/08/2022 15:46, Stephan Gerhold wrote:

Thank you for your patch. There is something to discuss/improve.

> +  qcom,halt-regs:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description:
> +      Halt registers are used to halt transactions of various sub-components
> +      within MSS.
> +    items:
> +      - items:
> +          - description: phandle to TCSR syscon region
> +          - description: offset to the Q6 halt register
> +          - description: offset to the modem halt register
> +          - description: offset to the nc halt register
> +
> +  memory-region:
> +    items:
> +      - description: MBA reserved region
> +      - description: MPSS reserved region
> +
> +  firmware-name:
> +    $ref: /schemas/types.yaml#/definitions/string-array
> +    items:
> +      - description: Name of MBA firmware
> +      - description: Name of modem firmware
> +
> +  bam-dmux:
> +    $ref: /schemas/net/qcom,bam-dmux.yaml#
> +    description:
> +      Qualcomm BAM Data Multiplexer (provides network interface to the modem)
> +
> +  smd-edge:
> +    $ref: qcom,smd-edge.yaml#
> +    description:
> +      Qualcomm SMD subnode which represents communication edge, channels
> +      and devices related to the DSP.
> +
> +    properties:
> +      label:
> +        enum:
> +          - modem
> +          - hexagon

This needs unevaluatedProperties:false. I will fix qcom,adsp.yaml which
has similar problem.

Best regards,
Krzysztof
