Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1CA194C96;
	Thu,  6 Jun 2024 10:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717671060; cv=none; b=Kt9keCPyoqPEQ/vgBxU7De2YZ/CDwzKW1Kj2A+STjRbgfCigqk9uZ3HNDHMnds3ZUZ3cG+hQ/h/NSXqlpjdY6aH9YjQHN/iuOTnTeFQcE8flq4ZyzXlOBWpCpC7jcF5BhT0JFqsR54E0V2mlFqdK3T5WGPIKFMW9NpwdkzP2vKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717671060; c=relaxed/simple;
	bh=V5kYSuM39lIyPyl/wBUgkddb3iuaXISbMV793lW+VO8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X0QxpH40QBlAwyz0IA6BuHvsuhqPwjDF8QQbW/V9rbuapiyp3okpUXMhQNuP02plMuJBM7IWBRRej4T69pc1dMns9JcV1oJDzpX7y3Z69QrGCG6s5hdZ1LDkHnTnOQCJrfA5wEa31nxiCJB0WcA17NChwY6M4EaQ47gHi2hr6lE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=XMmtKzPg; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="XMmtKzPg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1717671057;
	bh=V5kYSuM39lIyPyl/wBUgkddb3iuaXISbMV793lW+VO8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XMmtKzPgFURGg6x7dDHARuSpRJmfp6YZhIZxS1Y+vK/tt8JbTXZ1/0oLVpARHtFXy
	 lbNyoV1Y35lhQVP4Zorf2vsKM5S0LSMaE7A8uOwTIdzCZqV8ChpP9BnoQ/Ih1UBQhV
	 Oj8P2sgE97ymMJ8sw70wj2Vc2Gsd1lFgnUJ//U9stRLIaAGlWQFRo6EKuRJeEh08fM
	 FlzmvRPERk+/kkcsBNYOJ0Z6DBFyCquSC0coyahHsXfRtNyt1BqrqW2min272MnTZR
	 5N22aB7Wx3kMoDf9J3645pyOHZaiMeocO0JRD1TNX6u0O4vqC78MM2oCcyqgA/0RWC
	 XvXWCAAWsZOlA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id C3FA63780627;
	Thu,  6 Jun 2024 10:50:56 +0000 (UTC)
Message-ID: <99d19104-875c-4214-b4a4-4c228cc08b66@collabora.com>
Date: Thu, 6 Jun 2024 12:50:56 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: mediatek: Don't print error when optional scp
 handle is missing
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@collabora.com, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240605-mt8195-dma-scp-node-err-v1-1-f2cb42f24d6e@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240605-mt8195-dma-scp-node-err-v1-1-f2cb42f24d6e@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Il 05/06/24 21:35, Nícolas F. R. A. Prado ha scritto:
> The scp_get() helper has two users: the mtk-vcodec and the mtk-mdp3
> drivers. mdp3 considers the mediatek,scp phandle optional, and when it's
> missing mdp3 will directly look for the scp node based on compatible.
> 
> For that reason printing an error in the helper when the handle is
> missing is wrong, as it's not always an actual error. Besides, the other
> user, vcodec, already prints an error message on its own when the helper
> fails so this message doesn't add that much information.
> 
> Remove the error message from the helper. This gets rid of the deceptive
> error on MT8195-Tomato:
> 
>    mtk-mdp3 14001000.dma-controller: can't get SCP node

I'm way more for giving it a SCP handle instead of silencing this print... the
SCP handle way *is* the correct one and I prefer it, as that'd also be the only
way to support Dual-Core SCP in MDP3.

I really want to see hardcoded stuff disappear and I really really *really* want
to see more consistency across DT nodes in MediaTek platforms.

So, still a one-line change, but do it on the devicetree instead of here please.

Cheers,
Angelo

> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>   drivers/remoteproc/mtk_scp.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index b885a9a041e4..f813117b6312 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -37,10 +37,8 @@ struct mtk_scp *scp_get(struct platform_device *pdev)
>   	struct platform_device *scp_pdev;
>   
>   	scp_node = of_parse_phandle(dev->of_node, "mediatek,scp", 0);
> -	if (!scp_node) {
> -		dev_err(dev, "can't get SCP node\n");
> +	if (!scp_node)
>   		return NULL;
> -	}
>   
>   	scp_pdev = of_find_device_by_node(scp_node);
>   	of_node_put(scp_node);
> 
> ---
> base-commit: d97496ca23a2d4ee80b7302849404859d9058bcd
> change-id: 20240605-mt8195-dma-scp-node-err-6a8dea26d4f5
> 
> Best regards,

