Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C0DDC433EF
	for <linux-remoteproc@archiver.kernel.org>; Tue,  3 May 2022 12:19:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235195AbiECMXW (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 3 May 2022 08:23:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235176AbiECMXR (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 3 May 2022 08:23:17 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC252340DB
        for <linux-remoteproc@vger.kernel.org>; Tue,  3 May 2022 05:19:44 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id j6so33055650ejc.13
        for <linux-remoteproc@vger.kernel.org>; Tue, 03 May 2022 05:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=E0FzV2fBfe8kPBhuxEwn1PdqXllBR0GrPuRd857XDdA=;
        b=LPlJwbk1n+l06QinBjW6ePwHR8rrTDXnev1EfL6Au3JGuKa2VdGXO5DX2rfJuBtRDc
         e2YGAusK522SljneiVjCtnXAtiEl14s5LKap4NUY4seBcRscMT+nVNBUalCptRjamrDn
         D7J5YAnRFk+xGZRlvNdz3eB0RHYi1Eh5qKZNcgwDExGji4jq93OXX1rNCkZjwkeEmnWV
         K8orZxCpiowxnoyzxnBgB3xplvgRxr4A2nto9gakFJZqjpHHjilCTSkq5iCQYq9qCYIM
         XHtLpOW+vNtgWbuIg0lzQtESnUcMRSwn1ppF6Yv/nme9L9Y2fvc7CKA4SNm1w0xEAAjk
         gePA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=E0FzV2fBfe8kPBhuxEwn1PdqXllBR0GrPuRd857XDdA=;
        b=ij4n25zljNw1NWyFS+swi0YrmRnSA9EBpSPke9uFjqZz/+wqKJQJL3PoURFe6PUFm9
         TBDTFqihydqwp/tFeaImV3NqAzN3T2rWmHiMOQutveXi5/kGbVpch0/K7rH4u63Cpzod
         sNw693jQdF8e/9Y6vsDwRCN0BGbtmMi8KinQ6ud4OJ+qzozrpGsJxrh9/C5ajFRAVTlK
         JQsPnvdDDkVT6GEZ/mL+VH9HiT49NC+dg9OLgAon8UPJE4ScT7yYsOy1lGeZp0LI6QqF
         +6VY5IXQZEkzHXa66S0he3XSFUiFc4wGWWe8lUhgOrkYRNKRCBn+y+qXXNQQrt6eBz9c
         xsUg==
X-Gm-Message-State: AOAM530aAgpA4AYBX0JTrTcfZAQNkkP3F2Ko7zTUWrdSbBRgl1W7yejl
        HcEu/pFe2sisqbLogUslJDvFnw==
X-Google-Smtp-Source: ABdhPJxifn0hfMTBOE+xe9zJim85fEKHkZT0EqBYtldUSbjhvMttgkM6uEDWPlQ4LMHLFXvHIHgEkQ==
X-Received: by 2002:a17:906:7947:b0:6f3:f971:1d6a with SMTP id l7-20020a170906794700b006f3f9711d6amr15722768ejo.571.1651580383483;
        Tue, 03 May 2022 05:19:43 -0700 (PDT)
Received: from [192.168.0.203] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id v7-20020a056402174700b004275cef32efsm4551143edx.6.2022.05.03.05.19.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 May 2022 05:19:41 -0700 (PDT)
Message-ID: <a95fc4a9-af6b-e2c2-ef41-df9742d393de@linaro.org>
Date:   Tue, 3 May 2022 14:19:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: mediatek: Fix optional
 reg-names for mtk,scp
Content-Language: en-US
To:     =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= 
        <nfraprado@collabora.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>, kernel@collabora.com,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Tinghan Shen <tinghan.shen@mediatek.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-remoteproc@vger.kernel.org
References: <20220429211111.2214119-1-nfraprado@collabora.com>
 <20220429211111.2214119-2-nfraprado@collabora.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220429211111.2214119-2-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 29/04/2022 23:11, Nícolas F. R. A. Prado wrote:
> The SCP has three memory regions: sram, l1tcm and cfg. Only sram is
> required, the other two are optional. Fix the dt-binding so that the
> optional regions can be omitted and passed in any order.

No, cannot be passed in any order.

> 
> Also add the missing minItems to the reg property and update the
> description.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 
> ---
> 
>  .../devicetree/bindings/remoteproc/mtk,scp.yaml      | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> index 823a236242de..ec9ddeb6ca2c 100644
> --- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> @@ -24,14 +24,20 @@ properties:
>    reg:
>      description:
>        Should contain the address ranges for memory regions SRAM, CFG, and
> -      L1TCM.
> +      L1TCM. Only SRAM is required, while CFG and L1TCM are optional.
> +    minItems: 1
>      maxItems: 3
>  
>    reg-names:
> +    minItems: 1
>      items:
>        - const: sram
> -      - const: cfg
> -      - const: l1tcm
> +      - enum:
> +          - l1tcm
> +          - cfg
> +      - enum:
> +          - l1tcm
> +          - cfg

This allows them in any combination which is not what we want. If both
are optional and both can appear, then last should be a const:l1tcm.

Best regards,
Krzysztof
