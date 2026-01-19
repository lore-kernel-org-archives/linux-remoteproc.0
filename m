Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 494C7344044;
	Mon, 19 Jan 2026 08:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768812148; cv=none; b=gxD6brFs4HpmxJukRwZD0qSlrdnVM8OrZvE+681YgtQ6Gb/ZvSef888L78fIgRrphnMPCrb+G0FDkYHtwPr+SArVxnCDeDS2W45U7tEdXm7cewDj0gXXr5W9mjGRw8E63BUSSovXdDnluzkj4tNCA0GEg3VyGFLgfxBFQo01SoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768812148; c=relaxed/simple;
	bh=mPX6JoUD2kWnhithrUDeTBPLyzqFJUKWdQH8B2eq938=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ZqLOdzhD8EwzwOMC78OLfwRLGyeFTn+e5hp+8HXb40W5kWRZT31aESiHotDGGSkRNDwiyuqRcgxFZ4LU89s4otkBj2uDRlTosK4vLjKQw2BanZdEqLjQUVYwmTXB74BskxnzNGaqMpFB2VRk8n0OzuOX7kY9bCYd0aWVM9LjPE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Sy4hcfXV; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Sy4hcfXV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768812143;
	bh=mPX6JoUD2kWnhithrUDeTBPLyzqFJUKWdQH8B2eq938=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=Sy4hcfXVy7UPkLEceMqSHCT8dYb/188ZBxySLfn7nfgRLWjtAHCHBdEwhdgGXGSR4
	 Kn+m5je/DMaDal2R1NCkPJdcUfiJJ58acVAZP/f0NibY48X1Uqs41CzKfiqXqGBNXp
	 6y4/xlGirCide43500HZmpVzMJVMBhncRWVDn2RLqvkSWeb5awDN0H4Ej//dIvQzMf
	 TkUM73L85qCtQvRmIvzUkzPZqtufsx/rPfgeu5vvCyE5QhR+XR04gkd6HC6FBaVuY+
	 zGvGXcVM0q9OubkPjrbqb0ma2bP0oZqt1AonUOALg2h2pLQdpV/nBqMeThovDeUELP
	 InwmTpDGNBmPQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7B65D17E130A;
	Mon, 19 Jan 2026 09:42:23 +0100 (CET)
Message-ID: <366b8358-a89a-4033-9f3b-9542a5de414e@collabora.com>
Date: Mon, 19 Jan 2026 09:42:22 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: mediatek: Replace Tinghan Shen in
 maintainers
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-remoteproc@vger.kernel.org
References: <20260116172915.99811-2-krzysztof.kozlowski@oss.qualcomm.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260116172915.99811-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 16/01/26 18:29, Krzysztof Kozlowski ha scritto:
> Emails to Tinghan Shen bounce permanently with "550 Relaying mail to
> tinghan.shen@mediatek.com is not allowed (in reply to RCPT TO command)",
> so switch to AngeloGioacchino Del Regno - Mediatek SoC platform
> maintainer.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

