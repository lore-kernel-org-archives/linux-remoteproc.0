Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F3E449B3F;
	Mon, 12 Oct 2026 08:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791795317; cv=none; b=f4mVVgLkNtaZ06TqXhmUoxHhgyvAHVIseqfC9jCBISIdQSq2JWR4RijzH74TcMpW/QCeRMdQmPq69c9it5uivVvrniISXXRCXngET7Hr0msk9vHTjGurzs4gZG5nCTIfQZl97veteBQynApxhMARq2t37mYAgqklbB8U5XtX6HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791795317; c=relaxed/simple;
	bh=SFlT8f5O1uS5gyAPr3fI8UtmdpGQjU5Ii1ch/y5CkvE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gpIOhybDa1/tv7psgzU5QwlxEz8k9+OSZzHzvsTUokwfz9hP7yUTUM/62lHt+jIATBhekOCUVzCLCnS4R5xlJHq4qC2ua7lRO+PpVzC0AAAj6qAuE2V2WudK433hOdHiH6RIGPJnJ4bARn3opDOtBof9DR6CA2WeyaxxC5akAnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NAqY133f; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NAqY133f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 995851F0089B;
	Mon, 12 Oct 2026 08:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791795315;
	bh=6+RjzyoY+WzdecItmok1wH56kEdK4bd4YwXPaoMyTUw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NAqY133fO18gICNf4yx50YT57a3AIVU6GPi+M8pOAQYcaJq3bLsCycEamcTHUdcj9
	 pwjdf0a92lQfWRw0JkObvZzXH/GceFK21Hq2QivgpVe7E2KbctvnAm20EpTuGhm1Ov
	 89ueAiZcT+2YTOtVQAL1+B2IkWsGTiCXFUGUrsv03KXUUyyRG0uLu8bVHDl8HcwwRf
	 rC4e+9gbciEzbldC/Xu+vJaUfUbATaJNGez8XhXp+Rr+Wh6Ktf3CcMRVuJmeeCgu3M
	 spLWMPLPvsMl4+G1EVfen1Ks8gePOiORFxM0NU7tQllxvYlYZxoF+A/T4Gd8huWsKg
	 8DMX1dhtYqOSg==
Date: Mon, 12 Oct 2026 10:55:11 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Subject: Re: [PATCH 1/4] dt-bindings: remoteproc: qcom: Add Glymur OOBMSS PAS
 binding
Message-ID: <20261012-impossible-illustrious-dog-702afc@quoll>
References: <20261009-oob-support-glymur-v1-0-96cc8ffcced3@oss.qualcomm.com>
 <20261009-oob-support-glymur-v1-1-96cc8ffcced3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261009-oob-support-glymur-v1-1-96cc8ffcced3@oss.qualcomm.com>

On Fri, Oct 09, 2026 at 12:47:39PM +0530, Anvesh Jain P wrote:
> Document the Glymur OOBMSS PAS node with its secure GLink edge,
> shared-memory signaling, firmware carveouts, and power resources.
> 

A nit, subject: drop second/last, redundant "binding". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v7.1-rc7/source/Documentation/devicetree/bindings/submitting-patches.rst#L23

> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> ---
>  .../bindings/remoteproc/qcom,glymur-oob-pas.yaml   | 156 +++++++++++++++++++++
>  1 file changed, 156 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,glymur-oob-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,glymur-oob-pas.yaml
> new file mode 100644
> index 000000000000..bd4f397da40f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,glymur-oob-pas.yaml
> @@ -0,0 +1,156 @@
> +# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/remoteproc/qcom,glymur-oob-pas.yaml#

Filename must match the compatible.

> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Glymur Out-of-Band Management Subsystem (OOBMSS) PAS
> +
> +maintainers:
> +  - Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> +
> +description: |
> +  Qualcomm Glymur Out-of-Band Management Subsystem (OOBMSS) contains two
> +  processors running Zephyr, managed together as one remoteproc instance.
> +  The Out-of-Band Trusted Execution Environment (OOB-TEE) is the primary
> +  processor. The OOB-Non-Secure processor is an auxiliary processor that
> +  depends on the primary processor and cannot function independently.
> +
> +  The primary processor runs the primary image, while the auxiliary
> +  processor runs the secondary image. Each processor has its own DTB.
> +  The two images and their DTBs have separate PAS identifiers for
> +  authentication and dedicated reserved-memory carveouts.
> +
> +  OOBMSS is booted by earlier-stage firmware and uses an XO clock and the
> +  CX and MX power domains. Shared Memory Point-to-Point (SMP2P) provides
> +  boot, shutdown, handover and ping/pong signaling, as well as fatal error
> +  notifications. The subsystem exposes a secure GLink edge to the host,
> +  with doorbell interrupts provided by the Inter-Processor Communication
> +  Controller (IPCC).
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,glymur-oobmss-pas
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    items:
> +      - description: Watchdog interrupt
> +      - description: Fatal interrupt
> +      - description: Ready interrupt
> +      - description: Handover interrupt
> +      - description: Stop acknowledge interrupt
> +      - description: Pong interrupt
> +
> +  interrupt-names:
> +    items:
> +      - const: wdog
> +      - const: fatal
> +      - const: ready
> +      - const: handover
> +      - const: stop-ack
> +      - const: pong
> +
> +  clocks:
> +    items:
> +      - description: XO clock
> +
> +  clock-names:
> +    items:
> +      - const: xo
> +
> +  power-domains:
> +    items:
> +      - description: CX power domain
> +      - description: MX power domain
> +
> +  power-domain-names:
> +    items:
> +      - const: cx
> +      - const: mx
> +
> +  memory-region:
> +    items:
> +      - description: Secure firmware carveout
> +      - description: Secure device tree carveout
> +      - description: Non-secure firmware carveout
> +      - description: Non-secure device tree carveout
> +
> +  firmware-name:
> +    items:
> +      - description: Secure firmware
> +      - description: Secure device tree firmware
> +      - description: Non-secure firmware
> +      - description: Non-secure device tree firmware
> +
> +  qcom,smem-states:
> +    minItems: 2
> +    description: States used by the AP to signal OOBMSS
> +
> +  qcom,smem-state-names:
> +    minItems: 2
> +    description: The names of the state bits used for SMP2P output
> +
> +required:
> +  - compatible
> +  - reg
> +  - power-domains
> +  - power-domain-names
> +  - memory-region

firmware-name as well, I guess?


> +
> +allOf:
> +  - $ref: /schemas/remoteproc/qcom,pas-common.yaml#
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,rpmh.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/mailbox/qcom-ipcc.h>
> +    #include <dt-bindings/power/qcom,rpmhpd.h>
> +    #define IPCC_MPROC_OOB_S 56
> +    #define IPCC_MPROC_OOB   55

Drop these two

> +
> +    remoteproc@1f000000 {
> +        compatible = "qcom,glymur-oobmss-pas";
> +        reg = <0x1f000000 0x30000>;
> +
> +        interrupts-extended = <&intc GIC_SPI 86 IRQ_TYPE_EDGE_RISING>,
> +                              <&smp2p_oobmss_in 0 IRQ_TYPE_EDGE_RISING>,
> +                              <&smp2p_oobmss_in 1 IRQ_TYPE_EDGE_RISING>,
> +                              <&smp2p_oobmss_in 2 IRQ_TYPE_EDGE_RISING>,
> +                              <&smp2p_oobmss_in 3 IRQ_TYPE_EDGE_RISING>,
> +                              <&smp2p_oobmss_in 9 IRQ_TYPE_EDGE_RISING>;
> +        interrupt-names = "wdog", "fatal", "ready", "handover", "stop-ack", "pong";
> +
> +        clocks = <&rpmhcc RPMH_CXO_CLK>;
> +        clock-names = "xo";
> +        power-domains = <&rpmhpd RPMHPD_CX>,
> +                        <&rpmhpd RPMHPD_MX>;
> +        power-domain-names = "cx", "mx";
> +
> +        memory-region = <&oob_secure_mem>, <&oobdtbqc_mem>,
> +                        <&oob_nonsecure_mem>, <&oobdtboem_mem>;
> +        firmware-name = "qcom/glymur/oobmss_tee.mbn",
> +                        "qcom/glymur/oobmss_qc_dtb.mbn",
> +                        "qcom/glymur/oobmss_ns.mbn",
> +                        "qcom/glymur/oobmss_oem_dtb.mbn";
> +        qcom,smem-states = <&smp2p_oobmss_out 1>,
> +                           <&smp2p_oobmss_out 8>;
> +        qcom,smem-state-names = "stop", "ping";
> +
> +        glink-edge {
> +            interrupts-extended = <&ipcc IPCC_MPROC_OOB_S

Just use numbers here

Best regards,
Krzysztof

