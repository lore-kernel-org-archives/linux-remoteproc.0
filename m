Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45FB2C46467
	for <linux-remoteproc@archiver.kernel.org>; Mon, 26 Dec 2022 12:18:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231614AbiLZMSd (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 26 Dec 2022 07:18:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229702AbiLZMSc (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 26 Dec 2022 07:18:32 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08EC0635B
        for <linux-remoteproc@vger.kernel.org>; Mon, 26 Dec 2022 04:18:30 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id p36so15716175lfa.12
        for <linux-remoteproc@vger.kernel.org>; Mon, 26 Dec 2022 04:18:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jnMgVqsL7Bxv/dXube4K70tj9aVpj3q9QmsELXQ1nlw=;
        b=EAQXLAUOmyauGC2eRIfbMka12G+3g2mgYXxiUjTNiZ/+5HkC8EL8ETCRrqII+e+pau
         cR99FI0eaoy9KCh+5rqX288NSjhsxyU9/dwHypCO7gHWQR0hr6o7a3SfrBWlBAtw4GWm
         PVIPYTAVs0MKrsCjJv2rAJ9b0RwmEtj7rekk4gWUQk2BDVCFP9/IU+/RLA1vTtM544nF
         4hNUyIA0HSRt+Ys6Z6ORxUGmvg3l/B3a52lDQjpMCYU6Q8sjD88UV7DfCe0NjPo5D1DV
         VpVMALQgM+cVo6Sma/0gS2RUNcInXK1XYMNLZigwAILJ2M1VWhRXVlNI9NRTnfrJr4u0
         dkeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jnMgVqsL7Bxv/dXube4K70tj9aVpj3q9QmsELXQ1nlw=;
        b=sW7bLylNs+CwbTYkOh9uYw6/v87hY+oShD5eVnh1uwp/az0Z5UWuaYHG19y5c35bGk
         bEeIDChOPBVBEcDtmx2pByLIoueJFaqjtVEOuUtTkUp9/3QfpVjMZi+nTKSwO1c/ZOG7
         PijfUL6ghR26b+knTIDHcM2eJbpE8TMfT4Ox72jFttZR2vn3OowbtpTprJcedsyIkHuW
         fAIrj8rwuxrC7BsZaexAGt6HrPNsN8LYJkO0Wa62dpc3HgBQwxzN56gPx0MaUXsoXAFw
         j17hoJlOsVB3z1M5hFk2YxBwiEbZNDdwJExUHaNHOpXB4xJo835vDs7vofaK9xWOZFHM
         CBdQ==
X-Gm-Message-State: AFqh2kpZR7cTlh1rFAHD/KjCrTjixO+3huCmJhoWvZoiS5HnV6O19Yxh
        1S2wqE94QlGFnYFbp+/+lGbxDw==
X-Google-Smtp-Source: AMrXdXv4JwVqf1Vu1HZjAT3Gpg97Z9IrTmBJdp0hwy878ZEGfTJ7OeuE6bVSJZdHcHwev60fyTOehA==
X-Received: by 2002:ac2:495b:0:b0:4b5:6755:4226 with SMTP id o27-20020ac2495b000000b004b567554226mr4826333lfi.55.1672057108367;
        Mon, 26 Dec 2022 04:18:28 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id b11-20020a056512024b00b004b57277474esm1779684lfo.106.2022.12.26.04.18.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Dec 2022 04:18:28 -0800 (PST)
Message-ID: <374d0b5c-55f4-ee30-c804-4488a3fedb48@linaro.org>
Date:   Mon, 26 Dec 2022 13:18:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 1/2] dt-bindings: remoteproc: ti: Add new compatible
 for AM62 SoC family
Content-Language: en-US
To:     Devarsh Thakkar <devarsht@ti.com>, andersson@kernel.org,
        devicetree@vger.kernel.org, mathieu.poirier@linaro.org,
        p.zabel@pengutronix.de, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, s-anna@ti.com
Cc:     hnagalla@ti.com, praneeth@ti.com, nm@ti.com, vigneshr@ti.com,
        a-bhatia1@ti.com, j-luthra@ti.com
References: <20221223115638.20192-1-devarsht@ti.com>
 <20221223115638.20192-2-devarsht@ti.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221223115638.20192-2-devarsht@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 23/12/2022 12:56, Devarsh Thakkar wrote:
> AM62 family of devices don't have a R5F cluster, instead
> they have single core DM R5F.
> Add new compatible string ti,am62-r5fss to support this scenario.
> 
> When this new compatible is used don't allow cluster-mode
> property usage in device-tree as this implies that there
> is no R5F cluster available and only single R5F core
> is present.
> 
> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> ---
> V2: Avoid acronyms, use "Device Manager" instead of "DM"
> V3:
> - Use separate if block for each compatible for ti,cluster-mode property
> - Rearrange compatibles as per alphabatical order
> ---
>  .../bindings/remoteproc/ti,k3-r5f-rproc.yaml  | 68 +++++++++++++------
>  1 file changed, 47 insertions(+), 21 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
> index fb9605f0655b..e8a861179bd9 100644
> --- a/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
> @@ -21,6 +21,9 @@ description: |
>    called "Single-CPU" mode, where only Core0 is used, but with ability to use
>    Core1's TCMs as well.
>  
> +  AM62 SoC family support a single R5F core only which runs Device Manager
> +  firmware and can also be used as a remote processor with IPC communication.
> +
>    Each Dual-Core R5F sub-system is represented as a single DTS node
>    representing the cluster, with a pair of child DT nodes representing
>    the individual R5F cores. Each node has a number of required or optional
> @@ -28,16 +31,20 @@ description: |
>    the device management of the remote processor and to communicate with the
>    remote processor.
>  
> +  Since AM62 SoC family only support a single core, there is no cluster-mode
> +  property setting required for it.
> +
>  properties:
>    $nodename:
>      pattern: "^r5fss(@.*)?"
>  
>    compatible:
>      enum:
> +      - ti,am62-r5fss
> +      - ti,am64-r5fss
>        - ti,am654-r5fss
> -      - ti,j721e-r5fss
>        - ti,j7200-r5fss
> -      - ti,am64-r5fss
> +      - ti,j721e-r5fss
>        - ti,j721s2-r5fss
>  
>    power-domains:
> @@ -80,7 +87,9 @@ patternProperties:
>        node representing a TI instantiation of the Arm Cortex R5F core. There
>        are some specific integration differences for the IP like the usage of
>        a Region Address Translator (RAT) for translating the larger SoC bus
> -      addresses into a 32-bit address space for the processor.
> +      addresses into a 32-bit address space for the processor. For AM62x,
> +      the R5F Sub-System device node should only define one R5F child node
> +      as it has only one core available.
>  
>        Each R5F core has an associated 64 KB of Tightly-Coupled Memory (TCM)
>        internal memories split between two banks - TCMA and TCMB (further
> @@ -100,11 +109,12 @@ patternProperties:
>      properties:
>        compatible:
>          enum:
> -          - ti,am654-r5f
> -          - ti,j721e-r5f
> -          - ti,j7200-r5f
> -          - ti,am64-r5f
> -          - ti,j721s2-r5f
> +          - ti,am62-r5fss
> +          - ti,am64-r5fss
> +          - ti,am654-r5fss
> +          - ti,j7200-r5fss
> +          - ti,j721e-r5fss
> +          - ti,j721s2-r5fss
>  
>        reg:
>          items:
> @@ -208,19 +218,35 @@ patternProperties:
>  
>      unevaluatedProperties: false
>  
> -if:
> -  properties:
> -    compatible:
> -      enum:
> -        - ti,am64-r5fss
> -then:
> -  properties:
> -    ti,cluster-mode:
> -      enum: [0, 2]
> -else:
> -  properties:
> -    ti,cluster-mode:
> -      enum: [0, 1]
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - ti,am64-r5fss
> +    then:
> +      properties:
> +        ti,cluster-mode:
> +          enum: [0, 2]
> +
> +  - if:
> +      properties:
> +        compatible:
> +          enum: ["ti,am654-r5fss", "ti,j7200-r5fss", "ti,j721e-r5fss",  "ti,j721s2-r5fss"]

That's not how enums are spelled for such cases. Git grep for examples -
this should be a enum with each item in new entry, no quotes.

Best regards,
Krzysztof

