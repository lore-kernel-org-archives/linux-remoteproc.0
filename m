Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5AF2D6E4B;
	Mon, 15 Sep 2025 07:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757922496; cv=none; b=SLl40gfmD0ZNNVsLyEU7zJ6WpsXQetd1x1pBi1sol0MH4A3TjsWHPuPD9WEXblWKtHWjzXxXBAlJiTKKym32yjprIeFAr26pmnz6HXFy03v7kMJI8RW0sPjkU7yeY00J2+HcuVUFtM0QkVoYWLqOHoZGH9DzkEMn76rf4cEOuAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757922496; c=relaxed/simple;
	bh=vB9GcUmcfOQtoFZZDhDvPQi1G6RyCsjXZqj9XRwFDDg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iR8bdTtOrr+XNEl8lme0n1ucsCJnG3GGVYyd4TsUIx1NNLJvT0ZfI0rwR0ERQQ5zt8mniRxoe1T4f7/5224HhkonqBmdPXr45SxtukrjSPIFOOCsY2W87ABCM8pSN1Dajx4XIepuFDTSyrAzUh8xgRT1rpVD1YMWF0RH0Ih45NE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=eAdBbE/F; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="eAdBbE/F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1757922492;
	bh=vB9GcUmcfOQtoFZZDhDvPQi1G6RyCsjXZqj9XRwFDDg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eAdBbE/FYgw8uAuc6mgi4EXUTYPU+wCaeYzWmnTAU9LDniagsTtXnRYgKgslS3t5w
	 Mb/Rpyrx3bfezOUOnz3+Az18Mf6d8LWOzqWFY/2ZWNzcuxZ+Lnf8/MhMsDLveLhbrS
	 eu/iAySEqG+q8hHVBpSuFWBPxkZDNEKAAjouigISkJsmmLw5rqbwBhRd9hLnHNH1tP
	 99bT8pEadDq5zdLkBu05NQD7MBaedKH0gNFtwMvZZ6iaKArjCoXZepCXEMOis+xhse
	 81N6Et83WvkPh5Z/iMjqKnmcO4yaVOuJ3m5M9b/0dB+b2sXEUg30dpokq5+xawQqNN
	 1k2ThEXkQfxcg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EBEAF17E0F88;
	Mon, 15 Sep 2025 09:48:11 +0200 (CEST)
Message-ID: <a36c5bfe-be01-431b-9d4f-eb41a085bef7@collabora.com>
Date: Mon, 15 Sep 2025 09:48:11 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: remoteproc: Add VCP support for
 mt8196
To: Xiangzhi Tang <xiangzhi.tang@mediatek.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Jjian Zhou <Jjian.Zhou@mediatek.com>,
 Hailong Fan <Hailong.Fan@mediatek.com>
References: <20250914122943.10412-1-xiangzhi.tang@mediatek.com>
 <20250914122943.10412-2-xiangzhi.tang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250914122943.10412-2-xiangzhi.tang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 14/09/25 14:29, Xiangzhi Tang ha scritto:
> Add the new binding document for MediaTek Video Companion
> Processor(VCP) on MediaTek mt8196.
> 
> Signed-off-by: Xiangzhi Tang <xiangzhi.tang@mediatek.com>
> ---
>   .../remoteproc/mediatek,mt8196-vcp.yaml       | 165 ++++++++++++++++++
>   1 file changed, 165 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/remoteproc/mediatek,mt8196-vcp.yaml
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/mediatek,mt8196-vcp.yaml b/Documentation/devicetree/bindings/remoteproc/mediatek,mt8196-vcp.yaml
> new file mode 100644
> index 000000000000..71a55943843b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/mediatek,mt8196-vcp.yaml
> @@ -0,0 +1,165 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/remoteproc/mediatek,mt8196-vcp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek Video Companion Processor (VCP)
> +
> +maintainers:
> +  - Xiangzhi Tang <Xiangzhi.Tang@mediatek.com>
> +
> +description:
> +  The MediaTek VCP enables the SoC control the MediaTek Video Companion Risc-V coprocessor.
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

sram, cfg-global, cfg-core, cfg-sec, vcp-vlp-ao-ready

> +      - const: cfg_sec
> +      - const: vcp_vlp_ao_rsvd7
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  mboxes:
> +    maxItems: 5
> +
> +  mbox-names:
> +    maxItems: 5
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  iommus:
> +    description:
> +      Using MediaTek iommu to apply larb ports for Multimedia Memory
> +      Management Unit and address translation
> +      Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml
> +    maxItems: 1
> +
> +  memory-region:
> +    maxItems: 1
> +
> +patternProperties:
> +  "^vcp@[a-f0-9]+$":
> +    type: object
> +    description:
> +      The MediaTek VCP integrated to SoC might be a multi-core version.

"may feature one or multiple cores"

> +      The other cores are represented as child nodes of the boot core.
> +      There are some integration differences for the IP like the usage of
> +      address translator for translating SoC bus addresses into address
> +      space for the processor.
> +
> +      The SRAM are shared by all cores, each VCP core only using a piece

s/piece/portion of/g

> +      SRAM memory. The power of SRAM should be enabled before booting VCP cores.

How do you enable the SRAM power?

Is there a regulator, a power domain, both, or what?

> +      The size of SRAM are varied on differnt SoCs.
> +
> +      The VCP cores has differences on different SoCs to support for
> +      Hart.
> +
> +    properties:
> +      compatible:
> +        enum:
> +          - mediatek,vcp-core
> +
> +      reg:
> +        description: The base address and size of SRAM.
> +        maxItems: 1
> +
> +      reg-names:
> +        const: sram
> +
> +      mtk,vcp-core-twohart:

1. s/mtk,/mediatek,/g
2. there's no description, what does "twohart" mean?

> +        enum: [0, 1]
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +
> +      mtk,vcp-sram-offset:
> +        description:
> +          Allocated SRAM memory for each VCP core used.

vcp-sram-offset is the same as the iostart in `reg`, so you don't need this
property at all.

> +        $ref: /schemas/types.yaml#/definitions/uint32
> +
> +    required:
> +      - compatible
> +      - reg
> +      - reg-names
> +      - mtk,vcp-core-twohart
> +      - mtk,vcp-sram-offset
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
> +        reg-names = "sram",
> +                    "cfg",
> +                    "cfg_core",
> +                    "cfg_sec",
> +                    "vcp_vlp_ao_rsvd7";
> +
> +        interrupts = <GIC_SPI 787 IRQ_TYPE_LEVEL_HIGH 0>;
> +
> +        mboxes = <&vcp_mailbox0>,
> +                 <&vcp_mailbox1>,
> +                 <&vcp_mailbox2>,
> +                 <&vcp_mailbox3>,
> +                 <&vcp_mailbox4>;
> +        mbox-names = "mbox0", "mbox1", "mbox2", "mbox3", "mbox4";

Is there any descriptive name that can be used for mbox-names?

As in, what is mbox0 used for? what is mbox1 used for? etc.

> +
> +        power-domains = <&scpsys MT8196_POWER_DOMAIN_MM_PROC_DORMANT>;
> +        iommus = <&mm_smmu 160>;
> +        memory-region = <&vcp_resv_mem>;
> +
> +        vcp@0 {
> +            compatible = "mediatek,vcp-core";
> +            reg = <0x0 0x31000>;
> +            reg-names = "sram";
> +            mtk,vcp-core-twohart = <1>;

Is the first core always "twohart"?

If it is, there's no need to even have this property, as you can add that to
the driver, either in form of platform data (if this changes per-SoC) or just
hardcoded.

Regards,
Angelo

> +            mtk,vcp-sram-offset = <0x0>;
> +        };
> +
> +        vcp@31000 {
> +            compatible = "mediatek,vcp-core";
> +            reg = <0x31000 0x60000>;
> +            reg-names = "sram";
> +            mtk,vcp-core-twohart = <0>;
> +            mtk,vcp-sram-offset = <0x31000>;
> +        };
> +    };

