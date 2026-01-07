Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815E839C62C
	for <linux-remoteproc@vger.kernel.org>; Wed,  7 Jan 2026 15:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767800143; cv=none; b=CfXOcBgG4N+cpMbLT3zSFZh+CsVu40YAc/qYWTUx8RNQMbOKVge5u4Kg3QvyQEBHf3GxNSbZW65S49iUsv0y4+FYGiyk3saulM2YSlGQlDJ7mtEaz9ZO8aaWp4inBGpBvtXRVnb+c/SkQKundtOvObnpN9tKPsBioaotNsmZ2S4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767800143; c=relaxed/simple;
	bh=mGN3GgnNdoOqT5ttldrfgrxqNaE1p+uWyAokSQ+Gslc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cazU2lDAN4LEq8NGczvtoLuFRSqYzN07yITLIZWI1Rn+6BA4EUEQqxOjpm4Qwv7eaAWp5Jsi/gDOpZmEQaakqWRqQXnWC39qvBeIii7eVf+9MxanBZ5mMvpWUuSiZNhGiR2mHRM+dkaqVXNDkCj6Pa3CE/heJI0RYW3t3djZ0A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ifWwwKe8; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ifWwwKe8"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2a07fac8aa1so19451635ad.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 07 Jan 2026 07:35:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767800141; x=1768404941; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/SR2gLuU1H5541mPq9C4V04vstpLOPeBOnMkn3dWO/g=;
        b=ifWwwKe8Smrr+FnksjcqI7m3i0DzMT42h55P22D+IGaBM9R4AkK2fH4dCWaF0NwVFU
         o8m8nLX1z3yDt//AXNOqZRzBgcfDg6JYhrORAJNGpQEDAdd2hRocNBjWfRCCPAeofP2G
         YEopQMIRkGx51d8JBfRkC6f6e619oFDLCtUbNlBYuVQ+G/JNRZ0SS+cbTfmyIy7k4PiF
         TaNiZcm7ZF/vRlTbaPgvnf8vhZah+UzfRJ99ryZRsMfzzn6K/HoI3G+vKethHRnxFbFN
         p9a5Z45Nx7KlhDWQz9lCA8594yQ/tipXAYNMaEiUEaXnuDevULIvw9/tATwzw8lCw8iy
         nxKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767800141; x=1768404941;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/SR2gLuU1H5541mPq9C4V04vstpLOPeBOnMkn3dWO/g=;
        b=S49uCQTqHfXLTAMQ3iXeB7/J/PnMbjJ4bL0zUWTSaj61DFjY2LTbrR9c5/SIZMAlCq
         NnD3MMIglkWO6cEq9E3p+EzT14nrNYIIwb802OvN+M/DKmH792ajC8axHFyMpqoImlmC
         JTgmm1UcXNeI7emaGW/8hfddxpBK7sMhRvnt7ouiFKdqYkIYNakOu6lzZfvqKf3hCGUp
         cujiJZxKU9hPBvVLZCDHgmEU+Wk2rg616y/OqzNi3bS3Upkqi470jaZijcKL+erk+dj6
         uDLEDY5y7uTy+lMjGbDylCm8IJdkoOywZ2dCrYZmgHjUFWVDc8ReuGYeG/xkghTAVQf8
         kq8A==
X-Forwarded-Encrypted: i=1; AJvYcCUb0UFXuzVXcyFzUe+cVizqodAeougpkgw0BGd0bIOWtK4J5uludzSZ2Ag88xTuQ2kMvwf25xBooqRzqbF5FHam@vger.kernel.org
X-Gm-Message-State: AOJu0Yyib9zUlYZOdfTqq+keyealHkHgzbikhnTIJ/bfdjuXQnc6D/L5
	O1tL/z8tUfjq2bqFIJ3JGl/PlVK4mikstFLyT7Udf4/87eOnEAAMl+g5zOunjbf+S6Olz2tWuof
	DlJcjB94=
X-Gm-Gg: AY/fxX6UDbEy9caw1lFzCEO489MrPLXT/S/lCumZq7V+Y8wvqJuCfTkQ3ZY7CjYDnxq
	ENOLhbrWlp+v78cJyhsG+uc4oq+Bsc3tkSG2lP+RwyB+loDtv/OnQA5xdZZ8ilzyit7HIddjvbj
	BTZmPzNOILS+6V1RupdO/FNnl1KwqTibQRBuJfBt9YRKtu/YM8f0CJ+mYuf1sBat3kipsFHkuIa
	264/UNqekM+Y9l29etUjBW1dJ9JJ0K1BNZHQ9bBU0MADx9iOg3u8dnJGALCdzLMVRLM+BAGO/Q1
	OeEW7s2Gw5pc3xmn4hBtPr3TsQvsYK18fQH5uiHZB5ycTN7sfvE6Wf5Qy0VJm4Je6BTMPgn8aS1
	Bzwz6EgQES8rw+CyNkl3fkWbOm7Yh0GHa+ExijN3e8o2e5fQ12N7SUeN7e4w3k3kDWwkkh8zuNW
	X3dT/EQtAYYo3WKQ==
X-Google-Smtp-Source: AGHT+IGBvG5WmQSIVwy8pD5KbvRQIOMKna1wirHJXxpWkWLnZtjO89ZkOS60V0d1bqeYUMlW/GSgnw==
X-Received: by 2002:a17:903:1105:b0:2a0:cb8d:2ed6 with SMTP id d9443c01a7336-2a3ee4d9b4bmr18514405ad.51.1767800140725;
        Wed, 07 Jan 2026 07:35:40 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:9510:cc09:7589:5527])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c52f88casm5317448b3a.34.2026.01.07.07.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 07:35:40 -0800 (PST)
Date: Wed, 7 Jan 2026 08:35:37 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Beleswar Padhi <b-padhi@ti.com>
Cc: andersson@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, nm@ti.com, vigneshr@ti.com, kristo@kernel.org,
	afd@ti.com, u-kumar1@ti.com, hnagalla@ti.com,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/3] dt-bindings: remoteproc: Add HSM M4F core on TI
 K3 SoCs
Message-ID: <aV59SdFU15HpLHeO@p14s>
References: <20260106104755.948086-1-b-padhi@ti.com>
 <20260106104755.948086-2-b-padhi@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260106104755.948086-2-b-padhi@ti.com>

On Tue, Jan 06, 2026 at 04:17:53PM +0530, Beleswar Padhi wrote:
> Some of the TI K3 family of SoCs have a HSM (High Security Module) M4F
> core in the Wakeup Voltage Domain which could be used to run secure
> services like Authentication. Add the device tree bindings document for
> this HSM M4F core.
> 
> The added example illustrates the DT node for the HSM core present on K3
> J722S SoC.
> 
> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> ---
> v2: Changelog:
> [Krzysztof Kozlowski]:
>  1. Update commit msg to remove redundant "bindings".
>  2. Update filename to match compatible.
>  3. Remove "address-cells" & "size-cells" property. These belong to the
>     device's parent node.
>  4. Drop description from firmware-name property.
>  5. Fix indentation for DT example.
> 
> Link to v1:
> https://lore.kernel.org/all/20251231165102.950644-2-b-padhi@ti.com/
> 
>  .../bindings/remoteproc/ti,hsm-m4fss.yaml     | 72 +++++++++++++++++++
>  1 file changed, 72 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/ti,hsm-m4fss.yaml
> 

I have applied this patch- Nishanth and Vignesh should handle the .dsti files.

Thanks,
Mathieu

> diff --git a/Documentation/devicetree/bindings/remoteproc/ti,hsm-m4fss.yaml b/Documentation/devicetree/bindings/remoteproc/ti,hsm-m4fss.yaml
> new file mode 100644
> index 0000000000000..9244e60acee37
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/ti,hsm-m4fss.yaml
> @@ -0,0 +1,72 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/remoteproc/ti,hsm-m4fss.yaml#
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
> +  reg:
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
> +            ti,sci = <&sms>;
> +            ti,sci-dev-id = <225>;
> +            ti,sci-proc-ids = <0x80 0xff>;
> +        };
> +    };
> -- 
> 2.34.1
> 
