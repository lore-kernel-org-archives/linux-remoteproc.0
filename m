Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689DA3064B3;
	Fri, 16 Jan 2026 08:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768552846; cv=none; b=powMEYV1+GOJH/sHFMLdy5j/twDX1Twm4474FYGaiSZjqiU5HgqRsPlM2moRHkwW8Qg9fijtviim2LjdY6IAr9a465hM+UYu5ouuRKjuCUUMd51GEF64i0362VrJEnXzrrbiL2SKzgkeM3/At0cxNPLeyKxG37wSFi5iFThpd2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768552846; c=relaxed/simple;
	bh=f+DnxG+tWr6LkjJ/46PLbA9O6VfKrOr4lzxCHsXIu2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cRdTM6OhEelEgvf+TJwM92eGBH5qRWrpuN/yoBENnK0AChu5nlKAl5B0fSjX7D+lE5tiKE/5mAduoR7VgZvQgXJDc4USK6ETHwj7X7+XkkZHrlOTIVf4+Wf1nxnQihAp5OTNDVAXuPO1+W3F64bZlw0fZSI/c0VBqXrhBhwXPSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MtXZls+G; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MtXZls+G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86164C116C6;
	Fri, 16 Jan 2026 08:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768552846;
	bh=f+DnxG+tWr6LkjJ/46PLbA9O6VfKrOr4lzxCHsXIu2s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MtXZls+GShqS+5lTMgfRUU+FuysRlVU4riZP1foVzCoS5sfZl2JAjlbABOIdVhveG
	 BhtkSrQOvDZOF9BKZjpOSxHhvuDPA4fjWKHHHoELkrV9mC+Lfjc6v67jPBV2P27aXM
	 NzOAt+hDDfs/36IJawV0O7D+WcGDur5ipqM5jxjC10vde+6/Btpna571rGyOWWqqhR
	 byJ8MJj20689SaCiIlBAkgsWJXddQZ0PbTjK/fqUfu6mzhjoniPrt21U1e8B9G40Pf
	 ogO/MP0Ay0gVUlzuJXth07zDupN/UtdFlEW531x5/krYN/QyNRNBFPrQw1EHuJRLsX
	 foW/nsb3TK6Mg==
Date: Fri, 16 Jan 2026 09:40:43 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, andersson@kernel.org, 
	mathieu.poirier@linaro.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, tinghan.shen@mediatek.com, olivia.wen@mediatek.com, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v2] dt-bindings: remoteproc: mediatek: Remove l1tcm MMIO
 from MT8188 dual
Message-ID: <20260116-soft-rapid-mongrel-8de32e@quoll>
References: <20260115111645.63295-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260115111645.63295-1-angelogioacchino.delregno@collabora.com>

On Thu, Jan 15, 2026 at 12:16:45PM +0100, AngeloGioacchino Del Regno wrote:
>    reg-names:
> -    minItems: 2
> +    minItems: 1
>      maxItems: 3
>  
>    clocks:
> @@ -185,7 +185,7 @@ allOf:
>      then:
>        properties:
>          reg:
> -          maxItems: 3
> +          minItems: 3
>          reg-names:
>            items:
>              - const: sram

I think you also need to update the if:then: section with
mediatek,mt8183-scp+mediatek,mt8186-scp+mediatek,mt8188-scp

> @@ -196,11 +196,22 @@ allOf:
>          compatible:
>            enum:
>              - mediatek,mt8188-scp-dual
> +    then:
> +      properties:
> +        reg:
> +          maxItems: 1
> +        reg-names:
> +          items:
> +            - const: cfg
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
>              - mediatek,mt8195-scp-dual
>      then:
>        properties:
>          reg:
> -          maxItems: 2
> +          minItems: 2

You still need maxItems here, otherwise you change the meaning to 2-3.

>          reg-names:
>            items:
>              - const: cfg
> -- 
> 2.52.0
> 
