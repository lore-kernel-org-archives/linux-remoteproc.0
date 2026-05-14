Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6C03DDDCA;
	Thu, 14 May 2026 12:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778761809; cv=none; b=jkE6OX0c+kYoH+or2wzG6hTFbwsE02TlfOdY965VXSGqo5OiEgKbRmTvc9Fh3CGFWvlzLS+YE3qtyKS7flb5GwuIYrXfsaScAzXvvjK5ogSBo/zCaqU+w263Npz1q9202UpRPZexPkxfIFOr0J0EtxPGSJYFUZZ55k4xSh5uiQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778761809; c=relaxed/simple;
	bh=bUh+fpgrDiqNF35orWAhT8L0f4AXwoeZqv6kc4rEVU4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cu70IkMGHANB0Qbw0ZLJ5QbGn+ql9c2vvL+6WjUsxGO72pshFJWCjJKk4JJPbyt0/FRIfmPdGwj2zEhDHt2H2k5SnzCyvWu9O+lc9vLnz+uirqt/jjutyrzPvfG1W1tzFy9I9nJ0qYZmspBT6ITGXcDSYHaxFgRB6b64ceSudNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W5BUHYe3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W5BUHYe3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C3C8C2BCB3;
	Thu, 14 May 2026 12:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778761808;
	bh=bUh+fpgrDiqNF35orWAhT8L0f4AXwoeZqv6kc4rEVU4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W5BUHYe3ZNzL2CGqEFckQzrOa1MKywKGhu62LRN9TnGvw6OuznC4nD2zXLAqRaxfR
	 d8GdZoc+8s49uFy2BhmA41PE6d72IVcuMsroX2Y0KejLpc8HJZi0PCjv03UBoUn2qM
	 6ZvPnlIikDs9REcOwCCqDaGZGQ9efShL3T5zm+D5OAfB8KeiKNM3jJjafyffHkMgil
	 TXnDqextjkZ3JZXecYSahsKVnhlH/4H0apemKNb6WpBw6V1OUg/iOlUpTOeHguv062
	 1Lfdxvb3GHojAsMaJ7Ui6qchEXPknHRcEhtRis04MS21EPvvp0OFRq8CQAGfUb82ON
	 6ReMjwToEjdhw==
Date: Thu, 14 May 2026 14:30:06 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arnab Layek <arnab.layek@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, andersson@kernel.org, mathieu.poirier@linaro.org, 
	linux-remoteproc@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v3 1/1] dt-bindings: remoteproc: mtk,scp: Allow multiple
 memory regions for MT8188
Message-ID: <20260514-poised-green-beagle-79cb9c@quoll>
References: <20260506133157.3283204-1-arnab.layek@mediatek.com>
 <20260514114533.174008-1-arnab.layek@mediatek.com>
 <20260514114533.174008-2-arnab.layek@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260514114533.174008-2-arnab.layek@mediatek.com>

On Thu, May 14, 2026 at 07:45:33PM +0800, Arnab Layek wrote:
> The MT8188 SCP requires support for 1-2 reserved memory regions, while
> other MediaTek SoCs use only a single memory region.
> 
> The schema uses a permissive base with restrictive conditionals:
> 1) Base schema allows all devices minItems: 1, maxItems: 2
> 2) Non-MT8188 devices (mt8183, mt8186, mt8192, mt8195, mt8195-dual) are
>    restricted to maxItems: 1, overriding the base
> 3) MT8188 devices (mt8188, mt8188-dual) set minItems: 1 with item
>    descriptions, inheriting maxItems: 2 from base, making the second
>    L1TCM region optional
> 
> This follows the same pattern as other MediaTek dt-bindings such as
> mediatek,jpeg-encoder.yaml which uses conditional schemas to support
> different numbers of iommus per device variant.
> 

So I just reviewed v2, because it appeared in patchwork thread...
because you just threaded v3 there.

No, really, this was repeated also to Mediatek so many times.

Implement v2 review.

Best regards,
Krzysztof

