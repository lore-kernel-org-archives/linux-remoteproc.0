Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13BBA3603D8;
	Thu, 13 Aug 2026 07:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786607394; cv=none; b=TFnQFQeGfmGzy/cEeItzFhLG510AMr/2bQCC3IHuwptnA8gea8A+9PgG/DtPCqyJ+S2PEueV2Eby6A4pFVJx+4VaM0EPRYdDDsugE/IbtURNu6SfHXBfqLEVRW+if1iqTnFF6BRvqyA74d4YpYzyGLHBeoCQaHJTpchguG6n28c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786607394; c=relaxed/simple;
	bh=NQFyHyCsvTm+lEylibxpGl6ev/hg33c487iw9mvSROA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bP2Pd60u4c9MCGTFgR/OT/9u4ypX2BBaMC3Nd0X2mpSNl7pyTa2avFVkwNCmhKWZIC9Q1mQTh5j3TW9GS+7RAUhaf8qU2Hw2ovAiEZyC6VVZiXCosuDyJDBekIpECiTgr1u6W5En8iCvej3cofcwJVw3LLuDLLsUJiQJubzflgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TMwoa+JJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TMwoa+JJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 379BF1F00A3D;
	Thu, 13 Aug 2026 07:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786607392;
	bh=xrT6aEk5N24iDw0s4WvaNp+BT4gNzb4qeJewak6Ie1c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TMwoa+JJitxUpPqB06Z8bZtlAFKBefvy19sMR5ok/RGRqwbXalaJxWlHxB8SNslMO
	 26nFK2NHuL5kvFQGRArGvSwUnAj8gZVjDIa3CHiTuuRAmPMtwfktPQX2FRPGBh0aGN
	 tAUE53qJHMMvN1OnsKehK2YmhswwO6OzICYEsDBH+d9QZJnkHHzh6IWH99rT3Q+Kz0
	 W+1QsFPcOQKIgcMb8LDkB7cGMCNUWLGLToCBXKTPby/IEgPWvgXtwZz7SF8lTcngDO
	 ALTmyytz5DkU3vwwiSPCTfbXfm73lFbkJubNC2qy5BTVw47btu6181xFHjfD0H8TB5
	 XkpmWbxO+hqpw==
Date: Thu, 13 Aug 2026 09:49:44 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jiafei Pan <Jiafei.Pan@nxp.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, 
	krzysztof.kozlowski@linaro.org, peng.fan@nxp.com, Frank.Li@nxp.com, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Zhiqiang.Hou@nxp.com, mingkai.hu@nxp.com
Subject: Re: [PATCH v4 1/4] dt-bindings: remoteproc: add imx-rproc-psci
Message-ID: <20260813-imposing-blazing-gharial-fbb19c@quoll>
References: <20260511023928.39640-2-Jiafei.Pan@nxp.com>
 <20260812104633.22420-1-Jiafei.Pan@nxp.com>
 <20260812104633.22420-2-Jiafei.Pan@nxp.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260812104633.22420-2-Jiafei.Pan@nxp.com>

On Wed, Aug 12, 2026 at 06:46:30PM +0800, Jiafei Pan wrote:
> Add compatible string "fsl,imx-rproc-psci" for i.MX Cortex-A Core's
> remoteproc support.
> 
> Signed-off-by: Jiafei Pan <Jiafei.Pan@nxp.com>
> 
> ---
> Changes in v4:
> - Updated description to describe the hardware instead of the binding
> - Changed compatible to SoC-specific "fsl,imx93-rproc-psci" with
>   generic fallback "fsl,imx-rproc-psci"
> - Fixed example node name from "remoteproc-ca55-1" to "remoteproc"

You need to start using b4 to send patches or send them correctly... Why
is this response to some other thread?

> 
> ---
>  .../remoteproc/fsl,imx-rproc-psci.yaml        | 54 +++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc-psci.yaml
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc-psci.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc-psci.yaml
> new file mode 100644
> index 000000000000..7d0d0da383a2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc-psci.yaml
> @@ -0,0 +1,54 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/remoteproc/fsl,imx-rproc-psci.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP i.MX Cortex-A Core Remote Processor via PSCI
> +
> +maintainers:
> +  - Jiafei Pan <Jiafei.Pan@nxp.com>
> +
> +description:
> +  NXP i.MX SoCs integrate multiple Cortex-A cores. On certain i.MX
> +  platforms, one or more of these cores can be offloaded to run RTOS
> +  or bare-metal firmware as a remote processor, while the remaining
> +  cores run Linux. The cores are powered on and off via PSCI (Power
> +  State Coordination Interface) CPU_ON/CPU_OFF calls to the firmware.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - fsl,imx93-ca55-rproc
> +      - const: fsl,imx-rproc-psci

Hm? So you just ignored the feedback?

> +
> +  fsl,cpus-mask:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Bitmask indicating which CPU cores are assigned to this remote
> +      processor instance. Each bit represents a CPU core, where bit N
> +      corresponds to CPU N. For example, 0x2 (0b10) assigns CPU core 1,
> +      while 0x6 (0b110) assigns CPU cores 1 and 2.

How did you implement feedback from Sashiko?

> +
> +  memory-region:
> +    maxItems: 1
> +    description:
> +      Phandle to a reserved memory region to be used for the remote
> +      processor's code and data.
> +
> +required:
> +  - compatible
> +  - fsl,cpus-mask
> +  - memory-region
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +        remoteproc {

Odd indentation.

> +            compatible = "fsl,imx93-ca55-rproc", "fsl,imx-rproc-psci";
> +            /* bitmask: 0b10, assign A55 Core 1 */
> +            fsl,cpus-mask = <0x2>;
> +            memory-region = <&rtos_ca55_reserved>;
> +        };
> -- 
> 2.43.0
> 
