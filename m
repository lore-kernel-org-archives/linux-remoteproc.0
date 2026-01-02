Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3042119258E;
	Fri,  2 Jan 2026 12:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767357048; cv=none; b=OMXKR5a6/JWwKd5U4li8k0TcjsJ8t7pFWffeXZk+IrH0kF3NP5oWxXF0G2eolCZtR8IV9zXXLOlL3qZbrFqFvM+/dja/vvrFU023pGyUSVNqG13LxT2IPxSr98T0WQjg/G3jBpiU6LUiWXMdierVtKcEp1WuyX9NWxZSRQP9KNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767357048; c=relaxed/simple;
	bh=rJC7m9lCc0+e15A46s9W1trAfNGWVYAMEpv2sDUKGls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aCXR21EB1hbcUfUpRm4ZEcLtzjD7DUGdGAEhP8c3xbrUZPmDXH+Uui4oUcrfaPsjo6Sx+yf618Tc6tJCCqTZdmWIvyMZuY0zJ9LWKX8kFfpXOpbVV3u5p1VXZVuZXPLT/QqQKStwQz9ttAkTR78OWDtsTbP1dTuiTEzxvZ9GutU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JXcDe7uk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JXcDe7uk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63499C116B1;
	Fri,  2 Jan 2026 12:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767357046;
	bh=rJC7m9lCc0+e15A46s9W1trAfNGWVYAMEpv2sDUKGls=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JXcDe7ukpMXFefbqc0Z3d62d5YYkzVeN0TzkD5ZIZGDgs5pFD/IrzYh7y9vQDoh1L
	 WSRyJ/4cVMr5FlxAZICg/8R94pCpZyi4leFXH4POj33333fZUgVL/BWbLiXylyjkGr
	 /DeBbxyMXc4/AexY9pLRlYhcxsK02oyjtdxgEmmbZTpFsDdUkmlVVaVPw49vBNFLlz
	 fm5Sznj6ZgEB4KeDOkDW7jnmEP/1uMDOpkjRMaPl4bj3tlQHnyApfrSIN06Qy+y6v4
	 JlXqkZJZtlCnawt9OtCiNVhh9wgz7WbB2IRmiybYJLwU3ofsWnafembysWmL3dEg56
	 NeEaTfXn+U63w==
Date: Fri, 2 Jan 2026 13:30:44 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Beleswar Padhi <b-padhi@ti.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, nm@ti.com, vigneshr@ti.com, 
	kristo@kernel.org, afd@ti.com, u-kumar1@ti.com, hnagalla@ti.com, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: remoteproc: Add bindings for HSM core
 on TI K3 SoCs
Message-ID: <20260102-shrewd-unnatural-lynx-b7d214@quoll>
References: <20251231165102.950644-1-b-padhi@ti.com>
 <20251231165102.950644-2-b-padhi@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251231165102.950644-2-b-padhi@ti.com>

On Wed, Dec 31, 2025 at 10:21:00PM +0530, Beleswar Padhi wrote:
> Some of the TI K3 family of SoCs have a HSM (High Security Module) M4F
> core in the Wakeup Voltage Domain which could be used to run secure
> services like Authentication. Add the device tree bindings document for
> this HSM M4F core.
> 
> The added example illustrates the DT node for the HSM core present on K3
> J722S SoC.

A nit, subject: drop second/last, redundant "bindings for". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

> 
> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> ---
>  .../bindings/remoteproc/ti,k3-hsm-rproc.yaml  | 79 +++++++++++++++++++
>  1 file changed, 79 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/ti,k3-hsm-rproc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/ti,k3-hsm-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/ti,k3-hsm-rproc.yaml
> new file mode 100644
> index 0000000000000..f61e4046843af
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/ti,k3-hsm-rproc.yaml

Filename must match the compatible. Are you sure you are following
internal TI guidelines? Did you read them?

> @@ -0,0 +1,79 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/remoteproc/ti,k3-hsm-rproc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: TI K3 HSM M4F processor subsystems
> +
> +maintainers:
> +  - Beleswar Padhi <b-padhi@ti.com>
> +
> +description: |
> +  Some K3 family SoCs have a HSM (High Security Module) M4F core in the
> +  Wakeup Voltage Domain which could be used to run secure services like
> +  Authentication. Some of those are J721S2, J784S4, J722S, AM62X.
> +
> +$ref: /schemas/arm/keystone/ti,k3-sci-common.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,hsm-m4fss
> +
> +  "#address-cells":
> +    const: 2
> +
> +  "#size-cells":
> +    const: 2

Why do you need these two properties?

> +
> +  reg:

reg is always the second property. Please read DTS coding style.

> +    items:
> +      - description: SRAM0_0 internal memory region
> +      - description: SRAM0_1 internal memory region
> +      - description: SRAM1 internal memory region
> +
> +  reg-names:
> +    items:
> +      - const: sram0_0
> +      - const: sram0_1
> +      - const: sram1
> +
> +  resets:
> +    maxItems: 1
> +
> +  firmware-name:
> +    maxItems: 1
> +    description: Name of firmware to load for the HSM core

Drop description. Can it be anything else than name of the firmware to
load?

> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - resets
> +  - firmware-name
> +  - ti,sci
> +  - ti,sci-dev-id
> +  - ti,sci-proc-ids
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        remoteproc@43c00000 {
> +            compatible = "ti,hsm-m4fss";
> +            reg = <0x00 0x43c00000 0x00 0x20000>,
> +                  <0x00 0x43c20000 0x00 0x10000>,
> +                  <0x00 0x43c30000 0x00 0x10000>;
> +            reg-names = "sram0_0", "sram0_1", "sram1";
> +            resets = <&k3_reset 225 1>;
> +            firmware-name = "hsm.bin";

Make the binding complete. All properties must be listed.

> +            ti,sci = <&sms>;
> +            ti,sci-dev-id = <225>;
> +            ti,sci-proc-ids = <0x80 0xff>;
> +         };

Messed indentation.

> +    };
> -- 
> 2.34.1
> 
