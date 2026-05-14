Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B5C3630A4;
	Thu, 14 May 2026 12:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778761754; cv=none; b=Uq7VBpcCMvNS59Bhbt3WbxPCKe9H7FCkiojpkP9Rd7U5oYQQTdd8QaIY11Asab2AjJi0+GXKI5JphS2yzN142trz2BWov6NNAhXwyWBHWVwqoZCsdII3N0mKN+Gsl7goQbb/CWsrb8z2VFP5qLkiJ9Vuk35Gin8kjv4ZDJALeHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778761754; c=relaxed/simple;
	bh=qOWbOvqHMaeYwiDsyg5AN0nnqLfamVFB2hHGFVZd/pE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uE2CMVPBOizrfI3IBKae+7nMNTw/FaUtUWrkVoSi4AOuuSwA6dsRTLqCbPB6yViCKzxjcSQ+2U9vaNywRknfgs//pzO1/JbZy533C+XDqOIJMrDdvPyobxmITZi214PJtDjfiRIgyfZZfpD3BYoJdpWu8eCR5dMUx3WXCtB+tZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GTnbsWpz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GTnbsWpz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82E94C2BCB3;
	Thu, 14 May 2026 12:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778761754;
	bh=qOWbOvqHMaeYwiDsyg5AN0nnqLfamVFB2hHGFVZd/pE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GTnbsWpzLvrGR+7jaAiWkc30RibULgmzzDGxmo57IvbRhPrFATtFElhSiiDLqeYKd
	 6/5tRP06GN+ENFWoo8gasw+Fc+86hA3xGqw6Oq2mIESRWek8HX0/NRS4TmktTH6wL8
	 HFr/OlbxOtW/q4rj03rUM8AKSdAw6KzKKQdS3I6B/KP5cOODlW5CZwgnTQLvBZSkXz
	 iHxBU17+9nJ+4sTrlpUGuiEB6V/6A4sJ8a5cEZvAScknfoHFpgxs/KZ11rn7g4gOVT
	 4DTNXiquD2CA6sr/FbisgTfO4NZBTbqGdI6N7nQRya7m4/5SXjR5r/YA+H9yJWrJtp
	 SIH8cVqmQuf+Q==
Date: Thu, 14 May 2026 14:29:11 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arnab Layek <arnab.layek@mediatek.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v2 1/1] dt-bindings: remoteproc: mtk,scp: Allow multiple
 memory regions for MT8188
Message-ID: <20260514-shiny-woodoo-saluki-1b07d3@quoll>
References: <20260506133157.3283204-1-arnab.layek@mediatek.com>
 <20260511121004.2984149-1-arnab.layek@mediatek.com>
 <20260511121004.2984149-2-arnab.layek@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260511121004.2984149-2-arnab.layek@mediatek.com>

On Mon, May 11, 2026 at 08:10:04PM +0800, Arnab Layek wrote:
> The MT8188 SCP requires two reserved memory regions:
> 1. Main SCP SRAM memory region (required)
> 2. SCP L1TCM memory region (optional, for additional memory)
> 
> Some other MediaTek SoCs only use a single memory region. This patch adds

Please do not use "This commit/patch/change", but imperative mood. See
longer explanation here:
https://elixir.bootlin.com/linux/v6.16/source/Documentation/process/submitting-patches.rst#L94

> a conditional schema using if/then to allow 1-2 memory regions
> specifically for mediatek,mt8188-scp and mediatek,mt8188-scp-dual
> compatibles, while keeping the default maxItems: 1 for other
> SoCs.

Stop explaining what you did. Explain WHY. Why second entry is optional?
Why are you changing existing binding? Was it working? Not? Why not? Why
yes?


> 
> Each memory region is documented with descriptions to
> clarify their purpose, following the pattern used in other bindings.

Redundant. We can read the diff.

> 
> Signed-off-by: Arnab Layek <arnab.layek@mediatek.com>
> ---
>  .../bindings/remoteproc/mtk,scp.yaml          | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> index bdbb12118da4..df13be2026a6 100644
> --- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> @@ -205,6 +205,27 @@ allOf:
>            items:
>              - const: cfg
>              - const: l1tcm
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - mediatek,mt8188-scp
> +            - mediatek,mt8188-scp-dual
> +    then:
> +      properties:
> +        memory-region:
> +          minItems: 1
> +          items:
> +            - description: Main SCP SRAM memory region
> +            - description: Optional SCP L1TCM memory region

Conflicts top level.

> +      patternProperties:
> +        "^scp@[a-f0-9]+$":
> +          properties:
> +            memory-region:
> +              minItems: 1
> +              items:
> +                - description: Main SCP SRAM memory region
> +                - description: Optional SCP L1TCM memory region
>  
>  additionalProperties: false
>  
> -- 
> 2.45.2
> 
