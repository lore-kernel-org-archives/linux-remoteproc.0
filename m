Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134761DF985;
	Mon,  4 Aug 2025 08:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754296051; cv=none; b=kVVf+5sfpSTYzIDnKR1wzSWqK/zoiEUk9dhhcHIa8+65stcVLuEVKZSavRY15Sq+0pvwmWjhBU05D6rfODdp7qk0jbT3fVvoZV4EiiMsSMcx5Ua8feYGXXMA3iiUnnfrDuj6r7qxSJu1NpjpHPvqMiN6/qDG/Oc3ylmvqSxBj0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754296051; c=relaxed/simple;
	bh=WBkM16+jIJE2ThEr1976D3BhzdAkH74SvuKumd7owH4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=okWAixLgFLzNThVvYrtBvv4Pq/7QJjpsIv+pHO5Xw29UWQprEtjvzmGgLO8GZeETHXFPVviVCeqnOSuRf8cFwWcnL1XKAV87kQmbR9nABDHsIkKdiLnwBwW0qeevAkWFZXDrxGdUsrlz+crZyoQeXYgzqkZkSPChg54CJv/fJJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=VOlqozXG; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="VOlqozXG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754296047;
	bh=WBkM16+jIJE2ThEr1976D3BhzdAkH74SvuKumd7owH4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VOlqozXGjYZdW/D8GSK4R8eucLjxxlvsVD5QlkUk2b+xl+UZvv3RMyzbpNdCSuoxm
	 7JJQlhLFafz8NjtlbbWQueaL91M8KFeeTfTW/sFhdzFMHay523qLuITYUhZljdR3xy
	 zzvrd+e+19SAOIoO9727ICqwZhUUeaOj3pjBgCWGdqxng6KABWIVNWzLmHCLtOnuvN
	 WOTvvVgIOKl9ZOQ0ehRhKBNvG6RdUp9Lzlr/GEn+ghgw2lvouKlxa0gL4XC4xXonrR
	 Q1NiNsMPrR6OX7O6nd7b1w3rSiDbBgMszEfH8g2uG5hZoObfRnFjgJhtDapNpyJwiq
	 gpjufi90fcsOg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B0ABE17E017D;
	Mon,  4 Aug 2025 10:27:26 +0200 (CEST)
Message-ID: <7aececf2-438a-4dbc-90e6-fd457a12ace6@collabora.com>
Date: Mon, 4 Aug 2025 10:27:26 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: remoteproc: mediatek: Add binding for
 mt8189 scp
To: Huayu Zong <huayu.zong@mediatek.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20250729023125.9036-1-huayu.zong@mediatek.com>
 <20250729023125.9036-2-huayu.zong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250729023125.9036-2-huayu.zong@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 29/07/25 04:31, Huayu Zong ha scritto:
> Add the compatible for mt8189 SCP to the binding.
> 
> Signed-off-by: Huayu Zong <huayu.zong@mediatek.com>

Is MT8189's SCP really single-core?

All of the new SoCs have two SCP cores - it's a bit strange to see that 8189 has
only one... hence, please triple check and confirm.

Cheers,
Angelo

> ---
>   Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> index adc6b3f36fde..88e240430f3f 100644
> --- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> @@ -20,6 +20,7 @@ properties:
>         - mediatek,mt8186-scp
>         - mediatek,mt8188-scp
>         - mediatek,mt8188-scp-dual
> +      - mediatek,mt8189-scp
>         - mediatek,mt8192-scp
>         - mediatek,mt8195-scp
>         - mediatek,mt8195-scp-dual
> @@ -168,6 +169,7 @@ allOf:
>               - mediatek,mt8183-scp
>               - mediatek,mt8186-scp
>               - mediatek,mt8188-scp
> +            - mediatek,mt8189-scp
>       then:
>         properties:
>           reg:



