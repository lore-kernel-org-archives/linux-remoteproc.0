Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793054546;
	b=dGrWbhTn8QMoCuWTlM9MkmoGxrqO6/Va3oi2XmAWICiU5bVKuwA8XHARxgxql8Ts0rPZ
	 pQXEkwSea2B5S3zKoJ6LqYPktHzNU7o3M+Wfr/5uxwWC9RwSJNX71XWG9W1KAShkLZZsm
	 Fb4UANjgapUDgQA/FOY7g5++psO+b8bKBtiVeM29/+nnusRN42qNXA5CWBUuE/ym/wXSz
	 eDGY5HovgnYWjGNGHxS9YIl0m6Iz+68yfqmDWQmo/iiu1iLAwmtNlQhUzV9jqcJcp8Ho+
	 +6wqzLN72HRR1olflkXk/QsIu0alcMWu+HJSlbc1ql6IVcEVjR/Dm0m+CsjL40Qr+OA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793054546;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Xo61tsKLH784MqoqU8IXRPYPaaxHVovW0NiSgjsHO50=;
	b=VT1sIcLBp3NfIN6zczvsN4hWzDoD/G3Pce0z5H58OfeO9+6QTBE/Ej9oWiTKHZQq7W0x
	 FDD8DsRQ1nV2a2V5s0wdCaj8v7U0+JxEWH10oSgh7e5y/718BW6IhmGuSFdO/uVqVqiOR
	 TzWsFBIkurxDHNk9De85FFFt1mehuJ7THHUzrjmnz9bztzMp83Fh0fsENuKqZJs06C697
	 GevOM2rVEl/litxMDm9Wo1Bw34jk89TsxiQUyXPZ0aL7KI7gGvCLdQCoHXRxJmsQ4Xk6O
	 v0WiXv/iUhlwgQC9lU/ZwBP54PmFWWrlCHn79cQsBaSbw38aftqwFoyOm7ZYY0N/8Xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j2zVTuOy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48272606A31B;
	Mon, 26 Oct 2026 22:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j2zVTuOy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 256AE1F01825;
	Mon, 26 Oct 2026 22:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793054545;
	bh=Xo61tsKLH784MqoqU8IXRPYPaaxHVovW0NiSgjsHO50=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=j2zVTuOyrhrSdX1cpqD3VRrigqIVhxd33ay3rIpKmTicH4RrRR8lIFbnpFEnMf5x1
	 A/3Rb+/5FWK3qsP8T18EePO/L7KaFQ8pmYXYJiqcOCU8sVXURC1d8kPjJFJUwVf4wf
	 TFvNZwwQZ9U1QtLqScNA5FHMUMebpR5VUp5efN79MNuGD1GpbYQ3Xk41sm7GmFJbb/
	 QKIY4HZbduYjqs4JiHmSOH9xE4gLT4E/bX2VKc9TNVg7Bdv0argSbc1pS6jk+kD88q
	 jJ6BYcnN6ote+tl0eseIQbcyOeJZ6nON6ayWowqYZe7PSoWukZ+aLh8svJA54MzZpl
	 6TkWm0IiLkF6g==
Date: Mon, 26 Oct 2026 17:42:21 -0500
From: Rob Herring <robh@kernel.org>
To: Bhargav Joshi <j.bhargav.u@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Suman Anna <s-anna@ti.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, goledhruva@gmail.com,
	m-chawdhry@ti.com, daniel.baluta@gmail.com, simona.toaca@nxp.com
Subject: Re: [PATCH] dt-bindings: remoteproc: ti,keystone-rproc: Convert to
 DT schema
Message-ID: <20261026224221.GA103164-robh@kernel.org>
References: <20261006-ti-keystone-rproc-v1-1-41f7f078b44e@gmail.com>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261006-ti-keystone-rproc-v1-1-41f7f078b44e@gmail.com>

On Tue, Oct 06, 2026 at 12:40:26AM +0530, Bhargav Joshi wrote:
> Convert TI Keystone DSP remoteproc binding from legacy text format to DT
> schema. No functional changes are introduced during conversion.
> 
> Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
> ---
>  .../bindings/remoteproc/ti,keystone-rproc.txt      | 182 ---------------------
>  .../bindings/remoteproc/ti,keystone-rproc.yaml     | 140 ++++++++++++++++
>  2 files changed, 140 insertions(+), 182 deletions(-)


> diff --git a/Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.yaml
> new file mode 100644
> index 0000000000000..3117cfb2b3e07
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.yaml
> @@ -0,0 +1,140 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/remoteproc/ti,keystone-rproc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: TI Keystone DSP devices
> +
> +maintainers:
> +  - Suman Anna <s-anna@ti.com>
> +
> +description: >
> +  The TI Keystone 2 family of SoCs usually have one or more (up to 8) TI DSP
> +  Core sub-systems that are used to offload some of the processor-intensive
> +  tasks or algorithms, for achieving various system level goals.
> +
> +  These processor sub-systems usually contain additional sub-modules like L1
> +  and/or L2 caches/SRAMs, an Interrupt Controller, an external memory
> +  controller, a dedicated local power/sleep controller etc. The DSP processor
> +  core in Keystone 2 SoCs is usually a TMS320C66x CorePac processor.
> +
> +  Each DSP Core sub-system is represented as a single DT node, and should also
> +  have an alias with the stem 'rproc' defined. Each node has a number of
> +  required or optional properties that enable the OS running on the host
> +  processor (ARM CorePac) to perform the device management of the remote
> +  processor and to communicate with the remote processor.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,k2hk-dsp
> +      - ti,k2l-dsp
> +      - ti,k2e-dsp
> +      - ti,k2g-dsp
> +
> +  reg:
> +    minItems: 3
> +    maxItems: 3
> +
> +  reg-names:
> +    items:
> +      - const: l2sram
> +      - const: l1pram
> +      - const: l1dram
> +
> +  interrupts:
> +    minItems: 2
> +    maxItems: 2
> +
> +  interrupt-names:
> +    items:
> +      - const: vring
> +      - const: exception
> +
> +  ti,syscon-dev:
> +    description: Phandle and offset to syscon device
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      - items:
> +          - description: Phandle to Keystone Device State Control node
> +          - description: offset of the DSP boot address register
> +
> +  resets:
> +    maxItems: 1
> +    description:
> +      refer to either of the following reset bindings for the reset argument
> +      specifier as per SoC,
> +      Documentation/devicetree/bindings/reset/ti-syscon-reset.txt for
> +      66AK2HK/66AK2L/66AK2E SoCs or,
> +      Documentation/devicetree/bindings/reset/ti,sci-reset.yaml for 66AK2G SoCs

Drop. The reset provider is outside the scope of this binding.

> +
> +  kick-gpios:
> +    maxItems: 1
> +    description:
> +      GPIO used by the virtio IPC stack to interrupt the remote processor. See
> +      Documentation/devicetree/bindings/gpio/ti,keystone-dsp-gpio.yaml

Drop the 2nd sentence.

> +
> +  memory-region:
> +    maxItems: 1
> +    description:
> +      Reserved memory node can be CMA memory node, and should be defined as per
> +      Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt

Don't add references to .txt bindings. Drop.

> +
> +  clocks:
> +    maxItems: 1
> +    description:
> +      Input clock (66AK2HK/66AK2L/66AK2E only), see
> +      Documentation/devicetree/bindings/clock/ti,keystone,psc-clock.yaml

Drop.

> +
> +  power-domains:
> +    maxItems: 1
> +    description:
> +      PM domain provider phandle and DSP device id (66AK2G only), see
> +      Documentation/devicetree/bindings/soc/ti/sci-pm-domain.yaml

Drop

> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - interrupts
> +  - interrupt-names
> +  - ti,syscon-dev
> +  - resets
> +  - kick-gpios
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: ti,k2g-dsp
> +    then:
> +      properties:
> +        clocks: false
> +      required:
> +        - power-domains
> +    else:
> +      properties:
> +        power-domains: false
> +      required:
> +        - clocks
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    dsp@10800000 {
> +      compatible = "ti,k2g-dsp";
> +      reg = <0x10800000 0x00100000>,
> +            <0x10e00000 0x00008000>,
> +            <0x10f00000 0x00008000>;
> +      reg-names = "l2sram", "l1pram", "l1dram";
> +      power-domains = <&k2g_pds 0x0046>;
> +      ti,syscon-dev = <&devctrl 0x844>;
> +      resets = <&k2g_reset 0x0046 0x1>;
> +      interrupts = <0>, <8>;
> +      interrupt-names = "vring", "exception";
> +      kick-gpios = <&dspgpio0 27 0>;
> +      memory-region = <&dsp_common_memory>;
> +    };
> 
> ---
> base-commit: 67f0943b394d920b6c142aad8c6af94340342ae7
> change-id: 20261006-ti-keystone-rproc-4e3b8f328662
> 
> Best regards,
> -- 
> Bhargav
> 
> 
