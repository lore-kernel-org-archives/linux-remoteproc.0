Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71FBDC433F5
	for <linux-remoteproc@archiver.kernel.org>; Thu, 19 May 2022 22:35:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245518AbiESWfQ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 19 May 2022 18:35:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245512AbiESWfP (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 19 May 2022 18:35:15 -0400
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com [IPv6:2001:4860:4864:20::36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 580D2C0397
        for <linux-remoteproc@vger.kernel.org>; Thu, 19 May 2022 15:35:13 -0700 (PDT)
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-e656032735so8532258fac.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 19 May 2022 15:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=VjlrbV4vJKI8XrHdrvSp11oTKl50bHpTcvsdSZU8U4M=;
        b=XkI+w/MjL3A6mJl2TFEUT88gLNyZg00mKX8nHV7mXLrN8otWS80SaNXd/6sNN2XUTo
         oZ+Tp90Cs1lq2W9ocDlCd23qD8CaCLRgFr3Mk8m9L4k0AktuSg7PaUdLtT8S9CHKYj5y
         caMezmMFbAAhbmPNUrkS5UN0NVPZA+odXJR2g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=VjlrbV4vJKI8XrHdrvSp11oTKl50bHpTcvsdSZU8U4M=;
        b=n2Gy+LUvEF5p5b8GUPIECDYRPTG+tnEmiB42GFyzMM49BTlW3kOgt3eNrzPL1B8ulD
         87VywHDr/S4v+EDmxHFDa39vtNX9XdyKGLHm7VYNhegm7pZaS8M6U8ZDw277vhgyIl5F
         S0oDHmK8OvZiWTeuQ0eZGrZ3CsMicXVmJJW5qOopwMROT9AHlmYLt/OAIaFFGVyDTZLo
         GfY3Akw+exC2YRn12blSf4cSF9Qo3EZ4DmxyG0Nyxm+2WWs9nhYNy/rB6XAHp2yjvkwC
         uyrKU8kfKnkE6TARLqN1lEtH9Mgt5bFA55BPffMup+KEGtSawgfkhUMKgYA/kD3FqJmt
         hQGQ==
X-Gm-Message-State: AOAM530gbrLOCyUF+Qp43ynIV79k1segnQhI6rBhs/Z2xwbQ+CdwAkxO
        eEvIxcqTyOpXh1QnG/oUrZkNjS7Gi3PU6ifaVbaa9Q9Sgq4=
X-Google-Smtp-Source: ABdhPJyHbu0BSr9LBi52hxpKPmXOdW1xCXpPhmUrDoe9clR+KRpEObjnicQVOt9bttlw1GiBXVL+iYfOG64eiydGEFw=
X-Received: by 2002:a05:6870:240d:b0:f1:b878:e97c with SMTP id
 n13-20020a056870240d00b000f1b878e97cmr3776843oap.193.1652999712543; Thu, 19
 May 2022 15:35:12 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 19 May 2022 15:35:11 -0700
MIME-Version: 1.0
In-Reply-To: <1652978825-5304-3-git-send-email-quic_sibis@quicinc.com>
References: <1652978825-5304-1-git-send-email-quic_sibis@quicinc.com> <1652978825-5304-3-git-send-email-quic_sibis@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 19 May 2022 15:35:11 -0700
Message-ID: <CAE-0n50iYAUmj6GEdCuOJ1d_SgeeFWtoxqWf7qN=jZ_js4wBcQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] dt-bindings: remoteproc: qcom: Convert SC7280 MSS
 bindings to YAML
To:     Sibi Sankar <quic_sibis@quicinc.com>, bjorn.andersson@linaro.org,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org
Cc:     ohad@wizery.com, agross@kernel.org, mathieu.poirier@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mka@chromium.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Quoting Sibi Sankar (2022-05-19 09:47:04)
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-mss-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-mss-pil.yaml
> new file mode 100644
> index 000000000000..a936d84eefa6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-mss-pil.yaml
> @@ -0,0 +1,250 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/remoteproc/qcom,sc7280-mss-pil.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm SC7280 MSS Peripheral Image Loader
> +
> +maintainers:
> +  - Sibi Sankar <quic_sibis@quicinc.com>
> +
> +description:
> +  This document describes the hardware for a component that loads and boots firmware
> +  on the Qualcomm Technology Inc. SC7280 Modem Hexagon Core.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,sc7280-mss-pil
> +
[..]
> +
> +  resets:
> +    items:
> +      - description: AOSS restart
> +      - description: PDC reset
> +
> +  reset-names:
> +    items:
> +      - const: mss_restart
> +      - const: pdc_reset
> +
> +  memory-region:
> +    maxItems: 2
> +    description: Phandle reference to the reserved-memory for the MBA region followed
> +                 by the modem region.
> +
> +  firmware-name:
> +    $ref: /schemas/types.yaml#/definitions/string-array
> +    maxItems: 2

Instead of maxItems can this be

       items:
         - description: Name of MBA firmware
	 - description: Name of modem firmware

so that we know the order? Same for 'memory-region' above.

> +    description:
> +      The name of the MBA and modem firmware to be loaded for this remote processor.
> +
> +  qcom,halt-regs:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array

Should this have maxItems: 1? Or that's implicit from description?

> +    description:
> +      Phandle reference to a syscon representing TCSR followed by the
> +      four offsets within syscon for q6, modem, nc and vq6 halt registers.
> +
> +  qcom,ext-regs:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array

Should this have min/maxItems: 2?

> +    description:
> +      Two phandle references to syscons representing TCSR_REG and TCSR register
> +      space followed by the two offsets within the syscon to force_clk_en/rscc_disable
> +      and axim1_clk_off/crypto_clk_off registers respectively.
> +
> +  qcom,qaccept-regs:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description:
> +      Phandle reference to a syscon representing TCSR followed by the
> +      three offsets within syscon for mdm, cx and axi qaccept registers.
> +
> +  qcom,qmp:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: Reference to the AOSS side-channel message RAM.
> +
> +  qcom,smem-states:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description: States used by the AP to signal the Hexagon core
> +    items:
> +      - description: Stop the modem

This one did items for a phandle array so I think we should follow the
same above.

> +
> +  qcom,smem-state-names:
> +    description: The names of the state bits used for SMP2P output
> +    const: stop
> +
> +  glink-edge:
> +    $ref: qcom,glink-edge.yaml#
> +    description:
> +      Qualcomm G-Link subnode which represents communication edge, channels
> +      and devices related to the DSP.
[..]
> +        power-domain-names = "cx", "mss";
> +
> +        memory-region = <&mba_mem>, <&mpss_mem>;
> +
> +        qcom,qmp = <&aoss_qmp>;
> +
> +        qcom,smem-states = <&modem_smp2p_out 0>;
> +        qcom,smem-state-names = "stop";
> +
> +        resets = <&aoss_reset AOSS_CC_MSS_RESTART>,
> +                 <&pdc_reset PDC_MODEM_SYNC_RESET>;
> +        reset-names = "mss_restart", "pdc_reset";
> +
> +        qcom,halt-regs = <&tcsr_mutex 0x23000 0x25000 0x28000 0x33000>;
> +        qcom,ext-regs = <&tcsr 0x10000 0x10004 &tcsr_mutex 0x26004 0x26008>;

Because it's two items I'd expect:
	
	<&tcsr 0x10000 0x10004>, <&tcsr_mutex 0x26004 0x26008>;

> +        qcom,qaccept-regs = <&tcsr_mutex 0x23030 0x23040 0x23020>;
> +
> +        glink-edge {
> +            interrupts-extended = <&ipcc IPCC_CLIENT_MPSS
> +                                   IPCC_MPROC_SIGNAL_GLINK_QMP
> +                                   IRQ_TYPE_EDGE_RISING>;
