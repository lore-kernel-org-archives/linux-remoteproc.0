Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F9D3C433DB
	for <linux-remoteproc@archiver.kernel.org>; Thu, 18 Mar 2021 02:56:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3E97D64F3B
	for <linux-remoteproc@archiver.kernel.org>; Thu, 18 Mar 2021 02:56:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230330AbhCRC4N (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 17 Mar 2021 22:56:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230217AbhCRCz7 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 17 Mar 2021 22:55:59 -0400
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EB85C061760
        for <linux-remoteproc@vger.kernel.org>; Wed, 17 Mar 2021 19:55:59 -0700 (PDT)
Received: by mail-ot1-x329.google.com with SMTP id l23-20020a05683004b7b02901b529d1a2fdso3854985otd.8
        for <linux-remoteproc@vger.kernel.org>; Wed, 17 Mar 2021 19:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=27W1NAaEDoiN1XjCrbRbIY3sRWmvahk+Y7TUd1HZpNk=;
        b=NNT30YpUOjnTtIIgfpPaaNb1NMWqPi9HZGoaMjkSlCPov7l+5HMwI8MrMlLHCsm+Lk
         vLbpD1HexvGx38mf30KvE8L+mYXcCXiN4RqIaytz9B2dqg0GjdofqlkCWrZnhaqWqzyV
         GrHhWdJpO7P8QlolwKGMCziDVySsJrOBikmTs8tTzWL6/ibmap79OuxlVUp6pAb/IlUU
         6CXY/JltgtoMigly3rllHeZVza0XWr/zyE0Vbnh9bdm6ah5TLYLMCupumLa92xCeKy6R
         DPZ5f4SZqxPt4qiHYsisFA+mrYsYEIKXtW84qLgabMrqlDb46NASckOEFwfF24F8Enfp
         hi+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=27W1NAaEDoiN1XjCrbRbIY3sRWmvahk+Y7TUd1HZpNk=;
        b=q6oYaIL7b5Fp/OUiMUQLCs6s9qE1rXdleCBpPqyBc6BL2CBxHsJXUFZrJSsKEgiXdI
         BWbsTtlPi5yDhALI7ghCY9SelHBThZQYtoIQs3suPBhJfqmitvjeQnafLZa6YDfKQv3n
         OSc8LkT6YpA5vvktUOn/w7H9VXEGPgB/j6uFO2Ji9ktw8Imk6Kg9HE/rbIwFfFqwZGKK
         oZQrIh6vUSOirp2YgknIyV2SP0xR3LX2+ZeQAI1RV58YP1hLTumDvwpZvwnF0/N+vqWo
         pmbVlbmHk+MieAgeMXg8H1V0FC19Mo1Ic8Q2AgPUpAnil30O24lMUaWbMRhk+ffiDria
         heRA==
X-Gm-Message-State: AOAM533jOZMcnXFJ07SwLyuuNiplD8g8DlMC1kBk8rrZCqk6kjvOskB5
        Z4ieYKAZjlExQhdWsnnlwmh58A==
X-Google-Smtp-Source: ABdhPJzvUIUNj7R3Lxmz3ePp9qfkHXEqAKknhmjyW0ajLAsXeDfcHGJ8d8H2YuhuKEQT9+SLORAolQ==
X-Received: by 2002:a9d:2f24:: with SMTP id h33mr6029369otb.128.1616036158912;
        Wed, 17 Mar 2021 19:55:58 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id g13sm181622otq.3.2021.03.17.19.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 19:55:58 -0700 (PDT)
Date:   Wed, 17 Mar 2021 21:55:56 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     linux-remoteproc@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, ohad@wizery.com, robh+dt@kernel.org
Subject: Re: [PATCH 3/5] dt-bindings: remoteproc: Add the documentation for
 Meson AO ARC rproc
Message-ID: <YFLBPGNQpT9mM3AJ@builder.lan>
References: <20201230012724.1326156-1-martin.blumenstingl@googlemail.com>
 <20201230012724.1326156-4-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201230012724.1326156-4-martin.blumenstingl@googlemail.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue 29 Dec 19:27 CST 2020, Martin Blumenstingl wrote:

> Amlogic Meson6, Meson8, Meson8b and Meson8m2 SoCs embed an ARC EM4
> controller for always-on operations, typically used for managing system
> suspend.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  .../remoteproc/amlogic,meson-mx-ao-arc.yaml   | 87 +++++++++++++++++++
>  1 file changed, 87 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml b/Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml
> new file mode 100644
> index 000000000000..ba5deebaf7dc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml
> @@ -0,0 +1,87 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/remoteproc/amlogic,meson-mx-ao-arc.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Amlogic Meson AO ARC Remote Processor bindings
> +
> +description:
> +  Amlogic Meson6, Meson8, Meson8b and Meson8m2 SoCs embed an ARC core
> +  controller for always-on operations, typically used for managing
> +  system suspend. Meson6 and older use a ARC core based on the ARCv1
> +  ISA, while Meson8, Meson8b and Meson8m2 use an ARC EM4 (ARCv2 ISA)
> +  core.
> +
> +maintainers:
> +  - Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +        - amlogic,meson8-ao-arc
> +        - amlogic,meson8b-ao-arc
> +      - const: amlogic,meson-mx-ao-arc
> +
> +  firmware-name:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description:
> +      The name of the firmware which should be loaded for this remote
> +      processor.
> +
> +  reg:
> +    description:
> +      Address ranges of the remap and CPU control addresses for the
> +      remote processor.
> +    minItems: 2
> +
> +  reg-names:
> +    items:
> +      - const: remap
> +      - const: cpu
> +
> +  resets:
> +     minItems: 1
> +
> +  clocks:
> +    minItems: 1
> +
> +  sram:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      phandles to a reserved SRAM region which is used as the memory of
> +      the ARC core. The region should be defined as child nodes of the
> +      AHB SRAM node as per the generic bindings in
> +      Documentation/devicetree/bindings/sram/sram.yaml
> +
> +  amlogic,secbus2:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      A phandle to the SECBUS2 region which contains some configuration
> +      bits of this remote processor
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - resets
> +  - clocks
> +  - sram
> +  - amlogic,secbus2
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    remoteproc@1c {
> +      compatible= "amlogic,meson8-ao-arc", "amlogic,meson-mx-ao-arc";
> +      reg = <0x1c 0x8>, <0x38 0x8>;

I'm generally not in favor of mapping "individual" registers, do you
know what hardware block this is part of? Can you express the whole
block as an single entity in your DT?

Regards,
Bjorn

> +      reg-names = "remap", "cpu";
> +      resets = <&media_cpu_reset>;
> +      clocks = <&media_cpu_clock>;
> +      sram = <&ahb_sram_ao_arc>;
> +      amlogic,secbus2 = <&secbus2>;
> +    };
> +
> +...
> -- 
> 2.30.0
> 
