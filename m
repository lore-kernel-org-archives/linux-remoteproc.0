Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794321506;
	b=pAcskY0oKhqKynYubWtOatz0M4JwbfNueZ5KbTBL1cAnJGuagptMY08yj6r/RFEu83Fc
	 ef77+mpYUwTz3koFt3AU00VNtmg8LcdISGQz54I5gSwxQGLbTYX0NCb+4wuqIMF3A/pUB
	 jnPRkFIQJWlp43xhRi4UCDoIZoZi10voVe5wVUR5jgX3qMTyiYIygLSHRbzzbee8asWc0
	 rnefoQvXYMm/M1ppk8fIExcmaKfF+/LzWSxjeHfhk1uVIMyMqxI5ZNj0eSGNBWrlmIRZa
	 U8uJhGox9iFjhim9c1PDYL3GzW3NWhHDORuECpsV8E4e6AQt5LR7LDMLl8eG3qScIYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794321506;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=+IqBot1PtwDYqDn5RWRuc5xaq4SMIIwOUN97ZyFcYvk=;
	b=QJb+WPXMDbEy+RSPUbCRVJlWm8gDmHn47OW/T/Y1y8fqtBO7GRDVamQcXpRhjxolysyf
	 bNGgWjNmAcxqQT3GCTL5G51XSZ9DUEnnFbO178oJcYbaIIMYw2bJAPFInDFgRUEr739a6
	 Bh4XsP6uhDNsBTldxXZ4MlqSYuP1HhOdgKJueTMOB6y3u7w5Arp0p2xH+ac8jcgWZrhls
	 YA6FAGb8SjkcK9CuWktAbjyEOzis16Lz1TxgEl821U/UewpI+IL6pwZXc12TmjjpcdQm+
	 ySVJAXy6qgNxFRsXT80UDCZgodDpNEofaxhNFKXmn/ePqlADgtktRspTfwpXX3FCPGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hrJve89P;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6DB460A3806
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Nov 2026 14:38:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6DB460A3806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hrJve89P
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3b15e46698aso888312a91.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 10 Nov 2026 06:38:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794321504; x=1794926304; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+IqBot1PtwDYqDn5RWRuc5xaq4SMIIwOUN97ZyFcYvk=;
        b=hrJve89P30ZZYGbe0BJQdAnnZFrGUVIhrkrfu+XymLOuVqkHijsWcVWhZqP+Kraafb
         xr0ZXuYsI6GU200X0y4+GdOyPWsw8+7UYT6BPHVdgrvBqty31OcYgQMhVqABZdQtu8JX
         Gz0gon8/PXNxLHaMa/IhkUZr6hFE0I7UmlrJY2Vm7uiWm/9KXLgNOoSKgzNLI+rynwPl
         q/zC9vsCS5b8d6rZmvpXV945VruWAKAzrH4wVaQ/YNieNoVnbqLh3yCwf1vL3srgAXAN
         L0GkYN5gIa/JkzEUkA2KpmAiP+f3v71mbj30VaLZ0aNbmoQ6cRJfZf+at3UDB5IYkMNn
         sHhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794321504; x=1794926304;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+IqBot1PtwDYqDn5RWRuc5xaq4SMIIwOUN97ZyFcYvk=;
        b=D690Lnilb9D9jkjndUPQ/qIsWi6TO9XKBEoT9IzM+4S7m2WJZWlS1FXPaiHxSoSbLr
         FSJvgAjQmwf2SCEo2Ctr3YWRfs0uDQaLWATm6HrXNfE7HSJmV7iWTrKHsqUsW6c1/tPg
         c24a8b7UmuPps+sCOlmGPMZgIU3nRfnhfkUM7LQIFlh73qyAcIQ3n5QSXTuOQQ9Q4DyI
         3ZWK7uIxkV12T3zm/WtPWRu+qH8mJRpd8x3LOcGQhJne//YlvAQLxDTiaobE4cyt14vA
         tpPnaGQESKJNwPNQcZwhnL+Vu8XSjVR4CtXQE473HmejzOBhrFwkIzVAYLv+5WNUcyGC
         n2Ng==
X-Forwarded-Encrypted: i=1; AL+hErGc1woJfqwy7C8BQ0KsgkfLeQ2qDARQkUfGthw8CzywV8UXFWDY4W152WvAObJB6z0oi9CapVzFhahFK+VP58xs@vger.kernel.org
X-Gm-Message-State: APuU4Z8mx922CrtqM+uo6s+GO5Us5NHqv92JTvu5b6xSzNCfQOwczU5b
	+40manXsflj4USEwBLKqMGw4KYxxmlaukP+M4PClxP0Tku37XRkbQbyPLEGBTalEq/w=
X-Gm-Gg: AYBFou3V8PrHxhqYDxCddvdklNyxztSjBxS1TVBgiU7s+qMTLpBpGUlX7+w09P4wFzJ
	YesYBESZ/H/X9YrK/U8Uvg+eFVdKZmPUuqEnUeLpRgYE7scSBSEV5LbLd0HgEVAUwtv3WRXP4sh
	puXyqP50wXqDTzwy/uv1cGbR9WoY9+xAc9LF0yPOFIr5i0NtREYQSyTM7EyuxHF8R8GVeK8W8Ne
	hi8uzR3T1iZMO1lq1UXIs4evlRSUzlbzZZQAIemp4RZ+lgwTwLXPAAD0W6xZY4ftyjrAu89QHw3
	/5O+Uc8UiKA0X76/BnAvC5ntGfcXUz3XkLvuf48cCA1PznJrU+Nz7ero+E/8//R8LsaH/X7XT1h
	B3f4lT0kMpgudbuQssFWGh8u4LCu4oIPRHRgpyp5vIf1PZAeCb8UNSmQr63yGHdXiva/YzVLP3a
	z7kNX0sZnb+P4cBCPB4UN1TlL4tejjyCTo7RDisKDlN4ZS3uh1AArzwuenXoPGyvFEkswTkWMv1
	MLPvaivjckl25YScIadsFsyQmCOnwYcywXpw14XFNsb+fqEjLOA01NUwvwjuYZV00LA/4c1JDo+
	P9ywe3N+BGBjx/LJrdFCo2JsDSTAuy2L
X-Received: by 2002:a17:90b:55cd:b0:3ac:9925:72ae with SMTP id 98e67ed59e1d1-3b166cddadbmr2410116a91.31.1794321503970;
        Tue, 10 Nov 2026 06:38:23 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:a917:5683:7f92:9eda])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1690eb517sm1867517a91.4.2026.11.10.06.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 06:38:23 -0800 (PST)
Date: Tue, 10 Nov 2026 08:38:21 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, Nishanth Menon <nm@ti.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: reset: Convert the ti,syscon-reset binding
 to DT schema
Message-ID: <avMsXdwyw4FsQtZG@p14s>
References: <20261109173112.4111810-1-robh@kernel.org>
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
In-Reply-To: <20261109173112.4111810-1-robh@kernel.org>

On Mon, Nov 09, 2026 at 11:31:11AM -0600, Rob Herring (Arm) wrote:
> Convert the ti,syscon-reset binding to DT schema format. It's a straight
> forward conversion.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../bindings/remoteproc/ti,keystone-rproc.txt |  2 +-
>  .../bindings/reset/ti,syscon-reset.yaml       | 58 ++++++++++++
>  .../bindings/reset/ti-syscon-reset.txt        | 91 -------------------
>  3 files changed, 59 insertions(+), 92 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/reset/ti,syscon-reset.yaml
>  delete mode 100644 Documentation/devicetree/bindings/reset/ti-syscon-reset.txt

Applied.

Thanks,
Mathieu

> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt b/Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt
> index 847552133633..94f4508c8b0c 100644
> --- a/Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt
> +++ b/Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt
> @@ -46,7 +46,7 @@ The following are the mandatory properties:
>  			managing the resets for this device, and a reset
>  			specifier. Please refer to either of the following reset
>  			bindings for the reset argument specifier as per SoC,
> -			Documentation/devicetree/bindings/reset/ti-syscon-reset.txt
> +			Documentation/devicetree/bindings/reset/ti,syscon-reset.yaml
>  			    for 66AK2HK/66AK2L/66AK2E SoCs or,
>  			Documentation/devicetree/bindings/reset/ti,sci-reset.yaml
>  			    for 66AK2G SoCs
> diff --git a/Documentation/devicetree/bindings/reset/ti,syscon-reset.yaml b/Documentation/devicetree/bindings/reset/ti,syscon-reset.yaml
> new file mode 100644
> index 000000000000..1cbb2bf88716
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reset/ti,syscon-reset.yaml
> @@ -0,0 +1,58 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/reset/ti,syscon-reset.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: TI Syscon Reset Controller
> +
> +maintainers:
> +  - Nishanth Menon <nm@ti.com>
> +
> +description:
> +  Reset controller implemented by registers in the parent syscon.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: ti,syscon-reset
> +      - items:
> +          - enum:
> +              - ti,k2e-pscrst
> +              - ti,k2l-pscrst
> +              - ti,k2hk-pscrst
> +          - const: ti,syscon-reset
> +
> +  '#reset-cells':
> +    const: 1
> +
> +  ti,reset-bits:
> +    description: >
> +      Seven cells per reset, indexed by the reset specifier:
> +
> +        Cell #1 : offset of the reset assert control register
> +        Cell #2 : bit position of the reset in the reset assert control register
> +        Cell #3 : offset of the reset deassert control register
> +        Cell #4 : bit position of the reset in the reset deassert control register
> +        Cell #5 : offset of the reset status register
> +        Cell #6 : bit position of the reset in the reset status register
> +        Cell #7 : Flags used to control reset behavior, available flags defined
> +                  in the DT include file <dt-bindings/reset/ti-syscon.h>
> +
> +required:
> +  - compatible
> +  - '#reset-cells'
> +  - ti,reset-bits
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/reset/ti-syscon.h>
> +
> +    reset-controller {
> +        compatible = "ti,k2e-pscrst", "ti,syscon-reset";
> +        #reset-cells = <1>;
> +        ti,reset-bits = <0xa3c 8 0xa3c 8 0x83c 8
> +                          (ASSERT_CLEAR | DEASSERT_SET | STATUS_CLEAR)>;
> +    };
> diff --git a/Documentation/devicetree/bindings/reset/ti-syscon-reset.txt b/Documentation/devicetree/bindings/reset/ti-syscon-reset.txt
> deleted file mode 100644
> index 61a0ff33e89f..000000000000
> --- a/Documentation/devicetree/bindings/reset/ti-syscon-reset.txt
> +++ /dev/null
> @@ -1,91 +0,0 @@
> -TI SysCon Reset Controller
> -=======================
> -
> -Almost all SoCs have hardware modules that require reset control in addition
> -to clock and power control for their functionality. The reset control is
> -typically provided by means of memory-mapped I/O registers. These registers are
> -sometimes a part of a larger register space region implementing various
> -functionalities. This register range is best represented as a syscon node to
> -allow multiple entities to access their relevant registers in the common
> -register space.
> -
> -A SysCon Reset Controller node defines a device that uses a syscon node
> -and provides reset management functionality for various hardware modules
> -present on the SoC.
> -
> -SysCon Reset Controller Node
> -============================
> -Each of the reset provider/controller nodes should be a child of a syscon
> -node and have the following properties.
> -
> -Required properties:
> ---------------------
> - - compatible		: Should be,
> -			    "ti,k2e-pscrst"
> -			    "ti,k2l-pscrst"
> -			    "ti,k2hk-pscrst"
> -			    "ti,syscon-reset"
> - - #reset-cells		: Should be 1. Please see the reset consumer node below
> -			  for usage details
> - - ti,reset-bits	: Contains the reset control register information
> -			  Should contain 7 cells for each reset exposed to
> -			  consumers, defined as:
> -			    Cell #1 : offset of the reset assert control
> -			              register from the syscon register base
> -			    Cell #2 : bit position of the reset in the reset
> -			              assert control register
> -			    Cell #3 : offset of the reset deassert control
> -			              register from the syscon register base
> -			    Cell #4 : bit position of the reset in the reset
> -			              deassert control register
> -			    Cell #5 : offset of the reset status register
> -			              from the syscon register base
> -			    Cell #6 : bit position of the reset in the
> -			              reset status register
> -			    Cell #7 : Flags used to control reset behavior,
> -			              available flags defined in the DT include
> -			              file <dt-bindings/reset/ti-syscon.h>
> -
> -SysCon Reset Consumer Nodes
> -===========================
> -Each of the reset consumer nodes should have the following properties,
> -in addition to their own properties.
> -
> -Required properties:
> ---------------------
> - - resets	: A phandle to the reset controller node and an index number
> -		  to a reset specifier as defined above.
> -
> -Please also refer to Documentation/devicetree/bindings/reset/reset.txt for
> -common reset controller usage by consumers.
> -
> -Example:
> ---------
> -The following example demonstrates a syscon node, the reset controller node
> -using the syscon node, and a consumer (a DSP device) on the TI Keystone 2
> -66AK2E SoC.
> -
> -/ {
> -	soc {
> -		psc: power-sleep-controller@2350000 {
> -			compatible = "syscon", "simple-mfd";
> -			reg = <0x02350000 0x1000>;
> -
> -			pscrst: reset-controller {
> -				compatible = "ti,k2e-pscrst", "ti,syscon-reset";
> -				#reset-cells = <1>;
> -
> -				ti,reset-bits = <
> -					0xa3c 8 0xa3c 8 0x83c 8 (ASSERT_CLEAR | DEASSERT_SET   | STATUS_CLEAR) /* 0: dsp0 */
> -					0xa40 5 0xa44 3 0     0 (ASSERT_SET   | DEASSERT_CLEAR | STATUS_NONE)  /* 1: example */
> -				>;
> -			};
> -		};
> -
> -		dsp0: dsp0 {
> -			...
> -			resets = <&pscrst 0>;
> -			...
> -		};
> -	};
> -};
> -- 
> 2.53.0
> 
