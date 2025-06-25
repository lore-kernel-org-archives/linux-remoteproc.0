Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 656C7189F43;
	Wed, 25 Jun 2025 19:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750878974; cv=none; b=UMu/ATjqmb4npbzfdh7Ywc+djMOnK8ykhjMt9qCK3TkiyaftKAhhmON9Obvr1XbaKMYUtr/dqmK6bdIaT6fe2l9XoOwpwRpekduXNVYuO6480YyWODBq41JJPaARcCv7vP1lkgtEk2/+3AYr+qK50i2V4CZzxUN+45+l9M1OqUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750878974; c=relaxed/simple;
	bh=3xx8v1UwfRqi0ZG+i5McWZ2XEzZuimQytzqJT5SglHc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b/NP2UBoP+JfdB9dgc1liNs+BtdP+bvqIoliDfVJ/PZBPzNBYKX1opv8IXRCL13mHVOpf+pLdaTwyCNPLk90CqF3O++UuV0QKLFE526nqod4kFHCt0pkYIglmlzyG9OVnsYoevklPEC/zixI/1pEc8ZS8ASUqQO1EHhJfwWEcgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ll2ev9x+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ll2ev9x+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D58DBC4CEEA;
	Wed, 25 Jun 2025 19:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750878974;
	bh=3xx8v1UwfRqi0ZG+i5McWZ2XEzZuimQytzqJT5SglHc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ll2ev9x+mDm8fPwuaepM18THd82jsyPWzG1/HqjPrZGqYpAzaSSUdOof59nOSs7rO
	 2u3wLcOS0vbFia4CRWStDdB+amoW4c7rRUfueX91+SbCUNc5BdtdepjG4dus7voYR+
	 HtwGuwjRm+c2GtlaamNxkd819845Wo0pT0gRxPhoOsosCJGyVKqBLrVB/SlLHZQKI0
	 32owTpKRMV7oaDrPeMCMSBy95Or3G9HSoVih9qazQ4LZpKfwnHCUVJytV4JgCF/xvd
	 b5Gk1VBplToldZh8xhEKFCiO7EcenEo2YdWqXI53zv4pOOvUPJf1uC2LXHbqXCUMAq
	 IaV6JW0gJ6bTA==
Date: Wed, 25 Jun 2025 14:16:13 -0500
From: Rob Herring <robh@kernel.org>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: Add C906L rproc for Sophgo
 CV1800B SoC
Message-ID: <20250625191613.GA2059062-robh@kernel.org>
References: <20250608-cv1800-rproc-v1-0-57cf66cdf6a3@pigmoral.tech>
 <20250608-cv1800-rproc-v1-1-57cf66cdf6a3@pigmoral.tech>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250608-cv1800-rproc-v1-1-57cf66cdf6a3@pigmoral.tech>

On Sun, Jun 08, 2025 at 10:37:39AM +0800, Junhui Liu wrote:
> Add C906L remote processor for CV1800B SoC, which is an asymmetric
> processor typically running RTOS.
> 
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
>  .../bindings/remoteproc/sophgo,cv1800b-c906l.yaml  | 68 ++++++++++++++++++++++
>  1 file changed, 68 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/sophgo,cv1800b-c906l.yaml b/Documentation/devicetree/bindings/remoteproc/sophgo,cv1800b-c906l.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..455e957dec01c16424c49ebe5ef451883b0c3d4a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/sophgo,cv1800b-c906l.yaml
> @@ -0,0 +1,68 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/remoteproc/sophgo,cv1800b-c906l.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sophgo C906L remote processor controller for CV1800B SoC
> +
> +maintainers:
> +  - Junhui Liu <junhui.liu@pigmoral.tech>
> +
> +description:
> +  Document the bindings for the C906L remoteproc component that loads and boots
> +  firmwares on the CV1800B SoC.
> +
> +properties:
> +  compatible:
> +    const: sophgo,cv1800b-c906l
> +
> +  firmware-name:
> +    $ref: /schemas/types.yaml#/definitions/string

Already has a type. You just need 'maxItems: 1'.

> +    description:
> +      The name of the firmware file to load for this remote processor, relative
> +      to the firmware search path (typically /lib/firmware/).

That's the same for every 'firmware-name' instance. So drop.

Is there a default name?

> +
> +  memory-region:

       maxItems: 1

> +    description:
> +      Phandle to a reserved memory region that is used to load the firmware for
> +      this remote processor. The remote processor will use this memory region
> +      as its execution memory.
> +
> +  resets:
> +    maxItems: 1
> +
> +  sophgo,syscon:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      A phandle to the SEC_SYS region, used for configuration of the remote processor.
> +
> +required:
> +  - compatible
> +  - firmware-name
> +  - memory-region
> +  - resets
> +  - sophgo,syscon
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    reserved-memory {
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        ranges;
> +
> +        c906l_mem: region@83f40000 {
> +            reg = <0x83f40000 0xc0000>;
> +            no-map;
> +        };
> +    };

Drop. No need to show how /reserved-memory works here.

> +
> +    c906l-rproc {
> +        compatible = "sophgo,cv1800b-c906l";
> +        firmware-name = "c906l-firmware.elf";
> +        memory-region = <&c906l_mem>;
> +        resets = <&rst 294>;
> +        sophgo,syscon = <&sec_sys>;
> +    };
> 
> -- 
> 2.49.0
> 
