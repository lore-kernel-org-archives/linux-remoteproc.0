Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9464E2F4A05;
	Thu, 14 May 2026 12:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778761953; cv=none; b=YPSXb3y6qA5H7zm1fiEASESnTg5pphfg4Zv49zZ9dBfN4Dwe0tKztLTb+B+KC5Hc3Eu6gRdTjx2od9pXJYdQXToKNorcj1d5rhJhigyHezcGTMd1HexPHYPVNp1fbW4mVPjy53WmE1Qq0kn8S6ThXtSUu3HhtNBLUOCpvUqkQ/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778761953; c=relaxed/simple;
	bh=yUdL4HvV+GJY4HsxY8hBpdvOPdpVc1WRWzDtFXGeMGQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=XmtuV/n4gOf4H7JDaJqAs1LiDPPZCNjwQMJIQx+yLc2hMVQsdx6e3wiX0MuyIc0Ag3quPsN9yRLkfQbedEY3b+FuM3LalcaPsKbxZGg38l0qU1F4gUt3BzXR8SkTBBB9yzCukfFIq5aDRrUCA99NdpxjggFYaz/ZfTYYjwydkQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RiRSJqz+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RiRSJqz+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E577C2BCB3;
	Thu, 14 May 2026 12:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778761953;
	bh=yUdL4HvV+GJY4HsxY8hBpdvOPdpVc1WRWzDtFXGeMGQ=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=RiRSJqz+bDpm/6dTKo+1l4NzeYaoytGfd3p8Uy5x2D+g0i4PfPv5YYyJxuVobLRRr
	 PcvdOHltdcL/nTRl3vjquglt+/d65EY2vBG90s+326YXAqUMX/qNNPUritLAb27ZDL
	 uztWAaHpFUaMixZE8EwCe8keA5qv5Lw+phL1qg+mrE6ODr9MomyblfY89z0ixrsf9p
	 6bCXRKsYwXaEjg/A9yEXfQ+szHprTT4ikWiaNCgopJpSUJtUoESJQa2Gbjm/wCHpnW
	 6289z29JLSER7uBnZPpCvjIpTAC3Q7TIfWtVyWdKge7zMiGf3AzPDbv8LBZBNUhUC3
	 03ElOchIr7AYg==
Message-ID: <38d29061-64a4-45e8-891f-d688716058a5@kernel.org>
Date: Thu, 14 May 2026 14:32:28 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] dt-bindings: remoteproc: mtk,scp: Allow multiple
 memory regions for MT8188
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arnab Layek <arnab.layek@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 andersson@kernel.org, mathieu.poirier@linaro.org,
 linux-remoteproc@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20260506133157.3283204-1-arnab.layek@mediatek.com>
 <20260514114533.174008-1-arnab.layek@mediatek.com>
 <20260514114533.174008-2-arnab.layek@mediatek.com>
 <20260514-poised-green-beagle-79cb9c@quoll>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20260514-poised-green-beagle-79cb9c@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/05/2026 14:30, Krzysztof Kozlowski wrote:
> On Thu, May 14, 2026 at 07:45:33PM +0800, Arnab Layek wrote:
>> The MT8188 SCP requires support for 1-2 reserved memory regions, while
>> other MediaTek SoCs use only a single memory region.
>>
>> The schema uses a permissive base with restrictive conditionals:
>> 1) Base schema allows all devices minItems: 1, maxItems: 2
>> 2) Non-MT8188 devices (mt8183, mt8186, mt8192, mt8195, mt8195-dual) are
>>    restricted to maxItems: 1, overriding the base
>> 3) MT8188 devices (mt8188, mt8188-dual) set minItems: 1 with item
>>    descriptions, inheriting maxItems: 2 from base, making the second
>>    L1TCM region optional
>>
>> This follows the same pattern as other MediaTek dt-bindings such as
>> mediatek,jpeg-encoder.yaml which uses conditional schemas to support
>> different numbers of iommus per device variant.
>>
> 
> So I just reviewed v2, because it appeared in patchwork thread...
> because you just threaded v3 there.
> 
> No, really, this was repeated also to Mediatek so many times.
> 
> Implement v2 review.
>

Heh, and now I noticed that you just merged THREE versions in one thread
leading to complete mess in this entire thread.

Best regards,
Krzysztof
