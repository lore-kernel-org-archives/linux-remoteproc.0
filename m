Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005532DBF7C;
	Wed, 24 Sep 2025 10:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758708931; cv=none; b=UHtcOY28oJMWGL2lu3ZLC8JWUOnSSpyJlEkw6nzlo7IDLzIg1JW058LqTt3ZF87tBfUP8thoI0otz1ApoFuMn4FNi1luJzvxcYQjD5qBBnhAmBE5dVV28QLbnhBiE3W6ysz70O0k2XqVOJBXgar770/57/zpYzafhSW7yHiKnFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758708931; c=relaxed/simple;
	bh=1uyEu6yafkIx0SXozzaxMJRC9ltSjEJEMuHsl0MpVlU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C0BPfDkbAAYVJ+rUWDrQSBiZnNgBqHvtHr41eJU2ui0Evr19z1TDO0K3+XDNx3CIsKC9Y8k8Oo1IvkFfNEkJS/JSBUZT8XodkNeS61jXhu0yTHwTT2aYPhWVC7x3iDyS8HAlT+tglGcI2/gu18I9PYfeLO+IVkJs8mglNsb+iio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=S93HjY1c; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="S93HjY1c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1758708927;
	bh=1uyEu6yafkIx0SXozzaxMJRC9ltSjEJEMuHsl0MpVlU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=S93HjY1cAJMNbDfCnyhBybY0llsQplGyrGqfWhpQQRCAFvk9J5NX/iMbG2zVt2mqL
	 s7K6LahFrz2/SowOlGk+h05i3VtpzPIcGdypz9y/6uiDaE7b+W7r/CNZuG++4m2xjR
	 Lnzvm6aUPI539UHXr8WTczL1o5EwFB8BflEdau/FajawvUsUNLV+UhsrW0FPeYJnwv
	 sGqZq66K+GRCImEiLFECqD7x7Ng/PsO3vLiZeR7JA5LoAxMsvHnT8IS7wcMLCyMokl
	 ZNLWzoHsTugp96TAt6fesMYXhvFVKFcYszrWjbaY9r48dsDeTV79SdE09KF8uA0v/c
	 tJqHUnTPwWlfg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9AFDC17E12A7;
	Wed, 24 Sep 2025 12:15:26 +0200 (CEST)
Message-ID: <6af21910-5e45-4eef-90d2-690766913bed@collabora.com>
Date: Wed, 24 Sep 2025 12:15:26 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: remoteproc: mediatek: Add binding for
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
References: <20250924084422.4604-1-huayu.zong@mediatek.com>
 <20250924084422.4604-2-huayu.zong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250924084422.4604-2-huayu.zong@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 24/09/25 10:44, Huayu Zong ha scritto:
> Add the compatible for mt8189 SCP to the binding.
> 
> Signed-off-by: Huayu Zong <huayu.zong@mediatek.com>

Please fix the commit description.

Example:

Add a new compatible for MT8189's SCP: even though this is partially
compatible with the SCP found in MT8192, the register layout has some
slight differences.

...after which:

Reviewed-by: AngeloGioacchino Del Regno <angelogiaocchino.delregno@collabora.com>

> ---
>   Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> index 179c98b33b4d..407be544b404 100644
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


