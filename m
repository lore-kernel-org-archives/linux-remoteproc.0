Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BF41EF37D;
	Wed,  2 Apr 2025 11:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743592312; cv=none; b=P12qKwBwYfm0EaPphondCGF4IcYMZ/W51OtRGArFe2J7ZwEz2BUE579J+iU8dCSH1ukTc0GSa54gQxpaNziA8tk/uKUt6SB/ncYqk49njggVPtGUkJbetZVbrv9JX4zcaDCXsuUy8JpNyJfradd+rMAv6kOX/Rk5LAc9sfuZJF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743592312; c=relaxed/simple;
	bh=UqhKSL65Dxgk2dVyb4tCArOqKN+10TQqPqttHJ0QJO8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G6V1XTjT9C6BZArYJNoeuGnsUxQ5h3YaLroFo/By86RBpOfUN9x95Vg5+DPxRsLK4BerX14th285qZDRV9o9oTL3lufQ1U/08MnxI/BI7sobui1BCI4XYKoWQkBx4pxDDpRkgwu9PNBuH0Iqy0QWzD8MyFsXVQkRX8a8Yr9t9J0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Js1F89MZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Js1F89MZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00991C4CEDD;
	Wed,  2 Apr 2025 11:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743592311;
	bh=UqhKSL65Dxgk2dVyb4tCArOqKN+10TQqPqttHJ0QJO8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Js1F89MZ7mNqy+1Rx8WRbvLFGAnn2kyc2xk0D+jRJgnpYglHNNXsre5BwSajoXQfx
	 z/7Xu4ofH+VNbrxEI5IbjrJOkoE0xTlmrWLfz4E9roXufyg/9MaSMoMpV4JdsYxzw6
	 dLR1Li/2S8SAU5llwUTxs7P38xefN0Rr1OGrSAblHNcJzpFfeb3J3QV/TCKO7LEqs0
	 X9wkOlEipCmvqyd+482RTngII0StYMWDcxMWTO5EYbqYXMCSPFjbu6UKAhc0RTmnee
	 k2nqn36OmTL57W9u9X8XDLieQAs/ax7pDXmDmjp1pa6gW9jG9JlXDd4Erraijhkr28
	 dC985VtQWHccA==
Message-ID: <860ae623-f33f-4cfe-be08-6bb6524ecf94@kernel.org>
Date: Wed, 2 Apr 2025 13:11:43 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: Add VCP support for mt8196
To: Xiangzhi Tang <xiangzhi.tang@mediatek.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, jjian.zhou@mediatek.com,
 hailong.fan@mediatek.com
References: <20250402092134.12293-1-xiangzhi.tang@mediatek.com>
 <20250402092134.12293-2-xiangzhi.tang@mediatek.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250402092134.12293-2-xiangzhi.tang@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/04/2025 11:19, Xiangzhi Tang wrote:
> +
> +description:
> +  The MediaTek VCP enables the SoC control the MediaTek Video Companion Risc-V coprocessor.

Wrap at coding style.

> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt8196-vcp
> +
> +  reg:
> +    items:
> +      - description: sram base
> +      - description: cfg group IO
> +      - description: cfg core group IO
> +      - description: cfg sec group IO
> +      - description: vcp rdy group IO
> +
> +  reg-names:
> +    items:
> +      - const: sram
> +      - const: cfg
> +      - const: cfg_core
> +      - const: cfg_sec
> +      - const: vcp_vlp_ao_rsvd7
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  mboxes:
> +    description:
> +      Using mailbox to communicate with VCP, it should have this
> +      property and list of phandle, mailbox specifiers. See
> +      Documentation/devicetree/bindings/mailbox/mediatek,mt8196-vcp-mbox.yaml
> +      for details.

Drop entire description, redundant.

> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +

No, you do not get your own type. Instead list items or just maxItems.


> +  mbox-names:
> +    maxItems: 5

No, you must list the items.

> +
> +  power-domains:
> +    description:
> +      A phandle and PM domain specifier as defined by bindings
> +      of the power controller specified by phandle. See
> +      Documentation/devicetree/bindings/power/power-domain.yaml for details.

Look how other bindings do it. Do not repeat obvious stuff, do not
develop bindings entirely different than all others.

> +    maxItems: 1
> +
> +  iommus:
> +    description:
> +      Using MediaTek iommu to apply larb ports for Multimedia Memory
> +      Management Unit and address translation
> +      Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml

Really, look at other code first.

> +
> +  memory-region:
> +    maxItems: 1
> +
> +  vcp-mem-tbl:
> +    description:
> +      Manage reserved memory for VCP RTOS FW and various features.

No, reserved memory is in memory-region. Drop property.

> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 2
> +    maxItems: 12
> +
> +patternProperties:
> +  "^vcp_[a-f0-9]+$":

Follow DTS coding style.

Heh, nothing here was really tested and you have obvious bugs pointed
out by simple testing of DTS.

Why these children are needed in the first place? Offsets are implied by
parent compatible.

> +    type: object
> +    description:
> +      The MediaTek VCP integrated to SoC might be a multi-core version.
> +      The other cores are represented as child nodes of the boot core.
> +      There are some integration differences for the IP like the usage of
> +      address translator for translating SoC bus addresses into address
> +      space for the processor.
> +
> +      The SRAM are shared by all cores, each VCP core only using a piece
> +      SRAM memory. The power of SRAM should be enabled before booting VCP cores.
> +      The size of SRAM are varied on differnt SoCs.
> +
> +      The VCP cores has differences on different SoCs to support for
> +      Hart.
> +
> +    properties:
> +      compatible:
> +        enum:
> +          - mediatek,vcp-core
> +          - mediatek,mmup-core
> +
> +      twohart:

Missing vendor prefix, look at writing bindings and other examples.

> +        enum: [0, 1]
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +
> +      sram-offset:
> +        description:
> +          Allocated SRAM memory for each VCP core used.
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +
> +    required:
> +      - compatible
> +      - twohart
> +      - sram-offset
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - interrupts
> +  - mboxes
> +  - mbox-names
> +  - power-domains
> +  - iommus
> +  - memory-region
> +  - vcp-mem-tbl
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/power/mt8196-power.h>
> +
> +    vcp: vcp@31800000 {
> +        compatible = "mediatek,mt8196-vcp";
> +        reg = <0x31800000 0x60000>,
> +              <0x31a04000 0xa000>,
> +              <0x31bd0000 0x1000>,
> +              <0x31a70020 0x100>,
> +              <0x1c00091c 0x4>;

Quite different address,  are you sure this is still part of this
device? Looks like on register.


Best regards,
Krzysztof
