Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 488A730BB80;
	Tue, 14 Apr 2026 17:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776189225; cv=none; b=PMwq19zaA9BDvIXQOg2rIlQWwdUPfDOzA4/ZugwWhZV9iK02Vvapjoioj2y8KpHbaaKsC9iN9YYzGEfSGDPYVNVfahqgPcg/LFe7quYUN8Yopien/nCxzlg8+8aPEIvCIVgV7Y1eWDaGrg0sdaFNx4wLEz5kX2Kn38BjSHL/tqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776189225; c=relaxed/simple;
	bh=FPusdFb9xoFVuUwJITEKp9MXRZJcT0Vyg1zGUYkNRw0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TAIHc4/xo5CZZX4TA3P03ejf/U57dt0+d2quhSBKvIYKz/nGmrOCIzAdcArebGWbeqOG1/65bcUW7DhN+oYHSrA+qJzkrJlOLdDqT7RVZGXxwjivMMFVEDzog1tncEFvejQU+QKKPkzdmAQ0YjEuLAX9kyCK8ujCDXPv45wGXxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rgA+bQs5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rgA+bQs5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 910E3C19425;
	Tue, 14 Apr 2026 17:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776189225;
	bh=FPusdFb9xoFVuUwJITEKp9MXRZJcT0Vyg1zGUYkNRw0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rgA+bQs52SPQ8MsyaWsh0Hr4xPOozfJ0C0UilpNNtrvHrit2cv38lqSrkryEb/n2K
	 qhUIsg6ErtCthENptf5MY8ANxZ81v7d0gLXr/PF4Q+2qLm433zIP73+Ht2NSQJSc5c
	 fNtUBBSQfRNjhOrV5ViVw1d91RfObaMCMpNjlQKOXMzo91njz5KKfKurhvR9Q//U+B
	 WDkv8wJ3LvInML2zfVPg7fAIkzeAGaxWYb9yBrZKjfb7ICESZ5MzcKZue7QQQr2r/S
	 eGANcyRnvbHiqrAi3pcTjttiEC0uIZJPrYmmU9+fN5H1sWtgBvX4IVoxGWa5AnTHIf
	 /VCo1WrXLKBqA==
Message-ID: <774a8e9f-cfd9-4584-aaf0-2fd1189f65e8@kernel.org>
Date: Tue, 14 Apr 2026 19:53:40 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: add AMD MicroBlaze binding
To: Ben Levinsky <ben.levinsky@amd.com>, andersson@kernel.org,
 mathieu.poirier@linaro.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tanmay.shah@amd.com, michal.simek@amd.com
References: <20260414161558.2579920-1-ben.levinsky@amd.com>
 <20260414161558.2579920-2-ben.levinsky@amd.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20260414161558.2579920-2-ben.levinsky@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/04/2026 18:15, Ben Levinsky wrote:

A nit, subject: drop second/last, redundant "binding". The "dt-bindings"
prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

> +---
> +$id: http://devicetree.org/schemas/remoteproc/amd,microblaze.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: AMD MicroBlaze remote processor
> +
> +maintainers:
> +  - Ben Levinsky <ben.levinsky@amd.com>
> +
> +description:
> +  MicroBlaze remote processor controlled by Linux through the remoteproc
> +  framework.

Describe hardware, not Linux frameworks. IOW, Linux framework is here
irrelevant.

> +
> +  The executable firmware memory window is described in the
> +  MicroBlaze-local address space by the node's reg property and translated
> +  to the system physical address space with standard devicetree address
> +  translation provided by the parent bus node's ranges property.
> +
> +properties:
> +  $nodename:
> +    pattern: "^remoteproc@[0-9a-f]+$"
> +
> +  compatible:
> +    const: amd,microblaze

microblaze is architecture, so this feels way too generic. You need SoC
specific compatibles and I suggest do not reference architecture, but
name or the function of the processor, if there are such.


> +
> +  reg:
> +    maxItems: 1
> +    description:
> +      MicroBlaze-local address and size of the executable firmware memory
> +      window.
> +
> +  firmware-name:
> +    maxItems: 1
> +
> +  reset-gpios:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - reset-gpios
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    / {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +
> +      bus@b0000000 {
> +        compatible = "simple-pm-bus";
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        ranges = <0x0 0x0 0xb0000000 0x40000>;
> +

Drop all above.

> +        remoteproc@0 {
> +          compatible = "amd,microblaze";
> +          reg = <0x0 0x40000>;
> +          reset-gpios = <&mbv_reset_gpio 0 GPIO_ACTIVE_LOW>;
> +        };
> +      };
> +    };


Best regards,
Krzysztof
