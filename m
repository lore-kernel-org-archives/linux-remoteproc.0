Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962E4253356;
	Wed, 19 Mar 2025 09:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742376892; cv=none; b=Dk3nbRxSkMs9kCLA/Qdo2S3bYghp9r/UVjYBooqAn+8L/EFo3Br/5I3LinEeOrBA0R9dtZ1dkNKxqVQrPRWLvEkAuIwBzNSHSeQbe7xatyOEEQLTEj1AAb5awFTTVZH7zZN2pF9yANjqE6ImkKaaqZIYz1hYV4x9gAHbbmKu4MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742376892; c=relaxed/simple;
	bh=srUPQaoIT1eUxODIcp9G8q+P3AERhlCZzGqJ5NwwctY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PEi1ATL09Kr78uC3byMn3XJ/BI2xDhtEMUYhndNETtoY4APCQAebTtiRTF9Et48+o8YxtAnMXvamOkarZJQrHolMPuNE5WPKwsvrVL6UqMJuEMdoScPNFpeL6nFTqHE/aQSTz53tpV9VQ4CBLrnR1XiYQEohlll2D8BxoUNAAmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ahXaX6zG; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ahXaX6zG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1742376888;
	bh=srUPQaoIT1eUxODIcp9G8q+P3AERhlCZzGqJ5NwwctY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ahXaX6zGlXiBq77NwXPNWqOMkalJx7KwK2ftYjFCRCXuLWBM4tanG2A9RImzZN3NE
	 uuZZSmoE4oLFnjjFCadB1Rc5JTeSvw8ULfA5HYyQdlQj7hzH+ns+iVsOvajakgRk1k
	 KQmVeSKibWyJdGmso5lG8pcf5D7BrloRFCTF4CGEscMmUogPWIU95ytZvi+VDbk8G+
	 EuzjomDCoTxKvC0NePvTckMEVEj71k/F0BKjxywVE7bmuKmKmiRJYIXUoL5RZkXPjV
	 uODrCu8lxMaJWmyUiLk1XsoJIGqEjZ3WsbrIM1xw5aCmMQxuQ2dy5Q/6pc1B49wVYl
	 bRy61TDStiBPA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 91CF717E0385;
	Wed, 19 Mar 2025 10:34:47 +0100 (CET)
Message-ID: <70c10764-121b-43f5-931e-84ffd666c594@collabora.com>
Date: Wed, 19 Mar 2025 10:34:46 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] dt-bindings: remoteproc: mediatek: Remove l1tcm for
 dual-core MT8188 SCP
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>,
 Olivia Wen <olivia.wen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>
Cc: kernel@collabora.com, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250318-scp-dual-core-mt8390-v1-0-8733e192cc73@collabora.com>
 <20250318-scp-dual-core-mt8390-v1-2-8733e192cc73@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250318-scp-dual-core-mt8390-v1-2-8733e192cc73@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Il 18/03/25 23:22, Nícolas F. R. A. Prado ha scritto:
> The SCP present on MT8188 does not have an L1TCM memory region, but the
> binding incorrectly requires one for the dual-core description of the
> MT8188 SCP. Remove that requirement. Also update the minimum number of
> reg and reg-names to 1, since as this is a multi-core SCP with no
> L1TCM memory, only the CFG memory region is present in the parent node.
> 
> Fixes: 91e0d560b9fd ("dt-bindings: remoteproc: mediatek: Support MT8188 dual-core SCP")
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

As far as I know, the L1TCM is present on MT8188, and it's at 0x1070000 len 0x8000
exactly like MT8195.

Moudy, are you able to please confirm or deny that?

Cheers,
Angelo


