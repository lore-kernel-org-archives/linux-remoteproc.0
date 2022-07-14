Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06F7ECCA480
	for <linux-remoteproc@archiver.kernel.org>; Thu, 14 Jul 2022 09:50:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233972AbiGNJuq (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 14 Jul 2022 05:50:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236782AbiGNJuh (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 14 Jul 2022 05:50:37 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82A3215A0E
        for <linux-remoteproc@vger.kernel.org>; Thu, 14 Jul 2022 02:50:35 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id y11so1909319lfs.6
        for <linux-remoteproc@vger.kernel.org>; Thu, 14 Jul 2022 02:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=IFNGmvKSIjurGjF75ExlJcbhfRadQGl32aSmkHBap5g=;
        b=l+ZoxUrVCmXyZKPHPIXBIWC64qWGrklxTO/ckCJoMcufn8GVTGNrj43hs6u/6ep/Sk
         2koj3zvO5GDT37GMtMQdON/WJv5uzZHmsfDosd0Vj7TdOGn7KU5fLRMKxYQoLeFrABF5
         6MbIcyx/Y2Z8CIaPKckLlyCoMe6j4LprOzLkjk5WdtkAymR6f11sKrfW2+pQZOjcP7nK
         amYu2HIwCqMZMlCfI/0uWM1OujLiY1DWcrY2T4ldm8CZfTbN4L43zZmykbo2AfYEVUZP
         TNRnhaUGVVauQS/GIqnoSFOLZ4f9YLw3jBFTyLYsaJMFkgzKUvMRTdYClJLEH+gZLweB
         ZStQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=IFNGmvKSIjurGjF75ExlJcbhfRadQGl32aSmkHBap5g=;
        b=SaJA/S8tdP8fKfjI05f9yK2AgWSWiF2Sk5EoZmbIbzZPt3o/7cz+Es3rb2sMLOVT6E
         /6IbHMt0a0aVAeq8KiJmua2yEp1xIVIYmKqvdfgCIrcs2nV6U1tYG5xm/+JztgF0nEYh
         6MVhNhhDCU5mDM483I0krjAu66uo6E2cZApI17GLsfmJhGtrQjkQuIVjHFYo++VPiIA8
         vK0UMGHcduODcjwCL80J73RtetqWmTJeg6dRGhhM1QFMODHK/VMggEN4rKJrx+Iacm/P
         j0rdG1OO9KQK2SVQzUvkZdfJlTZW6zKWZlVTvyZ72yuYMllvAgTheVYXdDpb7WJofe1T
         UqIQ==
X-Gm-Message-State: AJIora+5EPbcbeHpTWQwHjTjRICYPqVa30fcpyPkxqYiU/o08x9pC8AI
        RiDIkHbrGXu0FvxpbpGOXd+7Qg==
X-Google-Smtp-Source: AGRyM1uF7AM+bBXLHDWifq6ubfidK2KhSh8BsZqXTFLFjms4QR9CjXdZmlzTkLy3YGl0Y+G5mZEbGA==
X-Received: by 2002:a05:6512:b27:b0:489:e045:394e with SMTP id w39-20020a0565120b2700b00489e045394emr4492693lfu.202.1657792233840;
        Thu, 14 Jul 2022 02:50:33 -0700 (PDT)
Received: from [10.0.0.8] (fwa5da9-171.bb.online.no. [88.93.169.171])
        by smtp.gmail.com with ESMTPSA id o3-20020a056512230300b0047f6c98e243sm268747lfu.102.2022.07.14.02.50.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Jul 2022 02:50:33 -0700 (PDT)
Message-ID: <434cbf73-c62d-7d5c-fe60-7d98a84bc7fe@linaro.org>
Date:   Thu, 14 Jul 2022 11:50:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/6] dt-bindings: remoteproc: qcom,q6v5: Move MSM8916 to
 schema
Content-Language: en-US
To:     Stephan Gerhold <stephan.gerhold@kernkonzept.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
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
References: <20220712124421.3129206-1-stephan.gerhold@kernkonzept.com>
 <20220712124421.3129206-3-stephan.gerhold@kernkonzept.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220712124421.3129206-3-stephan.gerhold@kernkonzept.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 12/07/2022 14:44, Stephan Gerhold wrote:
> qcom,q6v5.txt covers multiple SoCs with quite different binding
> requirements. Converting this into one DT schema would require
> several if statements, making the DT schema overall harder to
> read and understand.
> 
> To avoid this, follow the example of SC7180/SC7280 and split
> "qcom,msm8916-mss-pil" (and the equivalent deprecated "qcom,q6v5-pil"
> compatible) into a separate DT schema. The schema is somewhat based
> on the one for SC7180/SC7280 but adjusted for the old platforms.
> 
> Compared to the old plain text bindings, add missing documentation for
> the "bam-dmux" subnode and recommend one particular approach to specify
> the MBA/MPSS "memory-region" (the other one is marked as deprecated).
> 
> Cc: Sireesh Kodali <sireeshkodali1@gmail.com>
> Signed-off-by: Stephan Gerhold <stephan.gerhold@kernkonzept.com>
> ---
> Like Sibi's patch series for SC7180/SC7820 [1] this is somewhat related
> to Sireesh's series that converts all of qcom,q6v5.txt [2] (with a lot
> of if statements). However, this series focuses on MSM8916/MSM8974 (or
> actually MSM8909) only.
> 

Thank you for your patch. There is something to discuss/improve.

> [1]: https://lore.kernel.org/linux-arm-msm/1657020721-24939-1-git-send-email-quic_sibis@quicinc.com/
> [2]: https://lore.kernel.org/linux-arm-msm/20220511161602.117772-7-sireeshkodali1@gmail.com/
> ---
>  .../remoteproc/qcom,msm8916-mss-pil.yaml      | 246 ++++++++++++++++++
>  .../bindings/remoteproc/qcom,q6v5.txt         |  19 --
>  2 files changed, 246 insertions(+), 19 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml
> new file mode 100644
> index 000000000000..3968348dc982
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml
> @@ -0,0 +1,246 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/remoteproc/qcom,msm8916-mss-pil.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm MSM8916 MSS Peripheral Image Loader (and similar)
> +
> +maintainers:
> +  - Stephan Gerhold <stephan@gerhold.net>
> +
> +description:
> +  This document describes the hardware for a component that loads and boots
> +  firmware on the Qualcomm MSM8916 Modem Hexagon Core (and similar).
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - qcom,msm8916-mss-pil
> +
> +      - const: qcom,q6v5-pil
> +        description: Deprecated, prefer using qcom,msm8916-mss-pil
> +        deprecated: true

The last compatible does not seem applicable here. Aren't you moving
only MSM8916 to new schema?

> +
> +  reg:
> +    items:
> +      - description: MSS QDSP6 registers
> +      - description: RMB registers
> +
> +  reg-names:
> +    items:
> +      - const: qdsp6
> +      - const: rmb
> +
> +  interrupts:
> +    items:
> +      - description: Watchdog interrupt
> +      - description: Fatal interrupt
> +      - description: Ready interrupt
> +      - description: Handover interrupt
> +      - description: Stop acknowledge interrupt
> +
> +  interrupt-names:
> +    items:
> +      - const: wdog
> +      - const: fatal
> +      - const: ready
> +      - const: handover
> +      - const: stop-ack
> +
> +  clocks:
> +    items:
> +      - description: Configuration interface (AXI) clock
> +      - description: Configuration bus (AHB) clock
> +      - description: Boot ROM (AHB) clock
> +      - description: XO proxy clock (control handed over after startup)
> +
> +  clock-names:
> +    items:
> +      - const: iface
> +      - const: bus
> +      - const: mem
> +      - const: xo
> +
> +  power-domains:
> +    items:
> +      - description: CX proxy power domain (control handed over after startup)
> +      - description: MX proxy power domain (control handed over after startup)
> +
> +  power-domain-names:
> +    items:
> +      - const: cx
> +      - const: mx
> +
> +  pll-supply:
> +    description: PLL proxy supply (control handed over after startup)
> +
> +  resets:
> +    items:
> +      - description: MSS restart control
> +
> +  reset-names:
> +    items:
> +      - const: mss_restart
> +
> +  qcom,smem-states:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description: States used by the AP to signal the Hexagon core
> +    items:
> +      - description: Stop modem
> +
> +  qcom,smem-state-names:
> +    description: Names of the states used by the AP to signal the Hexagon core
> +    items:
> +      - const: stop
> +
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
> +
> +  # Deprecated properties
> +  cx-supply:
> +    description: CX power domain regulator supply (prefer using power-domains)
> +    deprecated: true

Blank line, here and in other places between top-level properties.

> +  mx-supply:
> +    description: MX power domain regulator supply (prefer using power-domains)
> +    deprecated: true
> +  mba:
> +    type: object
> +    description:
> +      MBA reserved region (prefer using memory-region with two items)
> +    properties:
> +      memory-region: true
> +    required:
> +      - memory-region
> +    deprecated: true
> +  mpss:
> +    type: object
> +    description:
> +      MPSS reserved region (prefer using memory-region with two items)
> +    properties:
> +      memory-region: true
> +    required:
> +      - memory-region
> +    deprecated: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - interrupts
> +  - interrupt-names
> +  - clocks
> +  - clock-names
> +  - pll-supply
> +  - resets
> +  - reset-names
> +  - qcom,halt-regs
> +  - qcom,smem-states
> +  - qcom,smem-state-names
> +  - smd-edge
> +
> +# Fallbacks for deprecated properties
> +allOf:
> +  - oneOf:
> +      - required:
> +          - memory-region
> +      - required:
> +          - mba
> +          - mpss
> +        deprecated: true

Not sure if this is correct syntax.

> +  - oneOf:
> +      - required:
> +          - power-domains
> +          - power-domain-names
> +      - required:
> +          - cx-supply
> +          - mx-supply
> +        deprecated: true
> +
> +additionalProperties: false



Best regards,
Krzysztof
