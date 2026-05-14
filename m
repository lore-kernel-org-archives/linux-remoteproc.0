Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996B63C1F46;
	Thu, 14 May 2026 11:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778758709; cv=none; b=OflCABTIgazCxKy6XfNQ+NQdtuxscd9DROLqJMxXV4o2iN5IEyn/6LrAiRFahvI0tlM6gMjRouNdkSsBE0IbwT8cYEcKv8I+3663L4+2wLU8AdnvzY/mQxZPVpfTr7pQ6C4LutQ2mqqO/zPfgCfLeb789W7tGFj0EQOD/d6yNLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778758709; c=relaxed/simple;
	bh=r0B3lSKf8gQDDJW5cY+Yg6YjjIjao27p5dvnDeMp/SQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oY9ITGmO/ctzQfmJHFdFYnhv3iQ+E+rIZdSIBnCpum4Zw+ZJNZFre97sEHMNERoD4wGKkHGf4soiZga9OKxnRzJiS8Gx1HTiLPUkciordInnVpoLZ75bu3kggQUwF9cNAecb/BjFTgNNqcJWd3wWd8FLHCaEAP1nc3fEFPVh8Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kNQ+9h8L; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kNQ+9h8L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02B0BC2BCC7;
	Thu, 14 May 2026 11:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778758709;
	bh=r0B3lSKf8gQDDJW5cY+Yg6YjjIjao27p5dvnDeMp/SQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kNQ+9h8LGRxHG5m553fqqudypahupVGpFMNyboyE2iCh75htaN8icgnwxI/GA3+WZ
	 gyrTswzGbrWWXcmgwvNeB2+GEhg7nMGhDVthLfAh4w/SPdZwbuBue0WcNg3f203vFE
	 TU14B2cy1O90WgxLV3Wp+K3ND4Y8j3HavYyPYWy5yPhiCLIYinHlKd/qCSVAl6LclR
	 MxTXtAQxX8HACwV3X5lGz9fmD0O3ihA0djCtH+exGx0LmIBRuqCTonuweozss6yk8a
	 NSU2HeL7HcQHvv8zT3JWfwPmKfMOTZAsfvM89vsIIG+gOdgNehxJL5JK3VkiPxxbbZ
	 JvFM3hSyoQWeQ==
Date: Thu, 14 May 2026 13:38:27 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jiafei Pan <Jiafei.Pan@nxp.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, peng.fan@nxp.com, 
	Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Zhiqiang.Hou@nxp.com, mingkai.hu@nxp.com, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: remoteproc: add imx-rproc-psci
Message-ID: <20260514-omniscient-futuristic-macaque-af0718@quoll>
References: <20260511023928.39640-1-Jiafei.Pan@nxp.com>
 <20260511023928.39640-2-Jiafei.Pan@nxp.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260511023928.39640-2-Jiafei.Pan@nxp.com>

On Mon, May 11, 2026 at 10:39:25AM +0800, Jiafei Pan wrote:
> Add compatible string "fsl,imx-rproc-psci" for i.MX Cortex-A Core's
> remoteproc support.
> 
> Signed-off-by: Jiafei Pan <Jiafei.Pan@nxp.com>
> 
> ---
> Changes in v3:
> - Fixed dt_binding_check warnings
> 
> ---
>  .../remoteproc/fsl,imx-rproc-psci.yaml        | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc-psci.yaml
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc-psci.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc-psci.yaml
> new file mode 100644
> index 000000000000..28d00dbf8bc7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc-psci.yaml
> @@ -0,0 +1,51 @@
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
> +  This binding provides support for managing Cortex-A cores as remote

Describe the hardware, not the binding.

> +  processors on i.MX platforms using the PSCI (Power State Coordination
> +  Interface) for CPU power management operations. This allows single
> +  Cortex-A core or multiple Cortex-A cores to be controlled by Linux as
> +  a remote processor, enabling them to run RTOS or bare-metal applications.
> +
> +properties:
> +  compatible:
> +    const: fsl,imx-rproc-psci

Why isn't the compatible specific?

> +
> +  fsl,cpus-mask:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Bitmask indicating which CPU cores are assigned to this remote
> +      processor instance. Each bit represents a CPU core, where bit N
> +      corresponds to CPU N. For example, 0x2 (0b10) assigns CPU core 1,
> +      while 0x6 (0b110) assigns CPU cores 1 and 2.

So you partition existing Cortex-A cores? Or how exactly? Why isn't this
deducible from the compatible (I assume you read carefully writing
bindings)?

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
> +        remoteproc-ca55-1 {

Implement previous comments.

Best regards,
Krzysztof

