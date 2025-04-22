Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067D120E703;
	Tue, 22 Apr 2025 13:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745329495; cv=none; b=XGSfEYgdbToei6u0R61j8BNp6v0B7PjSZnAU4wZjyWO1OWbT4tMjGdgVB2ZWFdwooecgDpUKgnwt/iw5O9yJit6oI/IPbtICjYzq8gUf3FZ3KF/nVpzkhFBKPYKkNYYGubscKUcAPTvk3GL7ROUDCM1riNsubRlxUsm+Adtu8n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745329495; c=relaxed/simple;
	bh=WynR8L5BQ92M+53aOKAzVzpk7FToQpWuQOuOQxLXzcw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f9dm+0lHNY+jgbBKYvzxFOIZYHyr2uLyPtICiUYVQ89X9SBvEb1oCMgk7L3srNT0sahEucnu1WQjqB3dWNFs/LFJ2aX1eYYEMrAeZ1XkwbFU76ZvBSIV6egO2PE9nqeJzKHP5toWAstRKHA8Go1CfKff1lF0qfAj1EvZMyvjLgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=PMzTCiA9; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="PMzTCiA9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745329491;
	bh=WynR8L5BQ92M+53aOKAzVzpk7FToQpWuQOuOQxLXzcw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PMzTCiA9hbuk02gOjtxpO1b65EoMoX7GSYJyrM9J50+woyI73LBx5V2ZfD71//djs
	 bUS2BWXxkC9rfgKcgmJb8yp3G5qGq/Sfnxx4sGevmGrM6VxtvaLtY12K9+s7/e/FNa
	 2WmloGZwoDILBXMOQ/8xIThZ6+GhsrjocFsySpl1AOZWYh+3WOXH6z9UEvQxNWGwUZ
	 1QHlDJiVaJTUbUV94vjI+Vz5ZLXCxrQ7SuQ13z0T0r7D2NN5AF9IikDDKfuzIq/n2u
	 AicTOiL/M073aAdz3pBTB/34jIJnY5+Sy47w/9Vh7UzpJW7zcnkoFt63rwPmk6Ehxx
	 BXFvWcJ1Pj5Rw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 74A6517E0B9D;
	Tue, 22 Apr 2025 15:44:50 +0200 (CEST)
Message-ID: <d86e6559-3b85-43f6-a8b6-8906a7b66b0b@collabora.com>
Date: Tue, 22 Apr 2025 15:44:49 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] dt-bindings: remoteproc: mediatek: Add missing
 minItems for 8192/8195
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>,
 Olivia Wen <olivia.wen@mediatek.com>
Cc: kernel@collabora.com, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250421-scp-dual-core-mt8390-v2-0-c84117a959a9@collabora.com>
 <20250421-scp-dual-core-mt8390-v2-1-c84117a959a9@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250421-scp-dual-core-mt8390-v2-1-c84117a959a9@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Il 21/04/25 22:49, Nícolas F. R. A. Prado ha scritto:
> Both MT8192 and MT8195 have an L1TCM memory, so it should be described
> in reg, and therefore reg's minItems should be 3, as is already implicit
> by reg-names being three entries long. However minItems is currently
> unset for mt8192/mt8195, resulting in it being equal to 2, from the base
> schema. Fix reg minItems for MT8192 and MT8195 by setting it to 3.
> 
> Fixes: 6b55b1e2fd7f ("dt-bindings: remoteproc: mediatek: Support MT8195 dual-core SCP")
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

