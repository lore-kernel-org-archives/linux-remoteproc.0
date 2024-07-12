Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82DDA13D601;
	Fri, 12 Jul 2024 08:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720772472; cv=none; b=jnmFikqEJOyY3NpkQD7W2iVK7q2cLEKrKCqutVvnTWmuC5MN9ybUB+sP8LV9ZrKM1TlADcAkkx+1tlKjFd8L0oh3Aoh4eDYmXcwFYfYX6IWrOHX+iSpa2NrAFEo9V6yC83H2y3QIQSzIA8mv30ABfbWQhZSpDg8vvr6UodaRBwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720772472; c=relaxed/simple;
	bh=UYd8B6nbv4Ic8XdLU0JyQpuWnMpczUrarlWTU56zvyw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gTUrOqGJ7X6FfpYNFMAlemCQaMqIx6nFIXapEm77AID+CHlQOMDGUs6nsrRwe53jFCkruhI4MlRv2+eqQXU4bvuQHsQUCe7UaV6il+jLVfkylaPZW2PGnBGwCTy8IYmE6WSyacK/R3GTZlWmpcyI7qzipQRcN5bBPHy6g76btTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Ve9dDWD1; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Ve9dDWD1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1720772468;
	bh=UYd8B6nbv4Ic8XdLU0JyQpuWnMpczUrarlWTU56zvyw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ve9dDWD1aMPL0aCuq0X9Tw+Vhke0eUwIIUSRuo5vv6m6/8JSUbSBzvt7t8kj0Ljm7
	 E+8Z7c2wGe8gnXN1bOpDmUXd4p6Q611eDZyN2O65PAGn5LtfWSZK+revM4ypRIjH43
	 vq/ZcKQR1QuRDke5ZnK1jQJAwlAY8CfF3WNY3gily2fq3vTTflaN5vQyJPQFAMWRfj
	 eWshNOdFAEN/F5r08h8yvtoVvF2ov+TV0QaBn5I4u8Vd6RlSFZeCrYtUaoRSCUKwsO
	 gAyROsWj0CR9eJ36bgaOnt7GU4pQ1OHI7sLLNJG5/MH1IzV9F0koJSqHZRAstj568M
	 SjtfhGCIV7Bmw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id EB48237821DB;
	Fri, 12 Jul 2024 08:21:07 +0000 (UTC)
Message-ID: <1b1231e5-cf10-4a26-8a62-311f4d8bcae9@collabora.com>
Date: Fri, 12 Jul 2024 10:21:07 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] remoteproc: mediatek: Support multiple reserved
 memory regions
To: Shun-yi Wang <shun-yi.wang@mediatek.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 jason-ch.chen@mediatek.com, yaya.chang@mediatek.com,
 teddy.chen@mediatek.com, olivia.wen@mediatek.com
References: <20240703115308.17436-1-shun-yi.wang@mediatek.com>
 <20240703115308.17436-2-shun-yi.wang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240703115308.17436-2-shun-yi.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 03/07/24 13:53, Shun-yi Wang ha scritto:
> From: "shun-yi.wang" <shun-yi.wang@mediatek.com>
> 
> SCP supports multiple reserved memory regions, intended for
> specific hardwards.
> 
> Signed-off-by: shun-yi.wang <shun-yi.wang@mediatek.com>
> ---
>   drivers/remoteproc/mtk_scp.c | 25 +++++++++++++++++--------
>   1 file changed, 17 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index 9ecd5ea04b5f3..1902826cea0af 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -1006,22 +1006,31 @@ EXPORT_SYMBOL_GPL(scp_mapping_dm_addr);
>   
>   static int scp_map_memory_region(struct mtk_scp *scp)
>   {
> -	int ret;
> +	int ret, i, err;
>   	const struct mtk_scp_sizes_data *scp_sizes;
> +	struct device_node *node = scp->dev->of_node;
> +	struct of_phandle_iterator it;


	struct device_node *node = scp->dev->of_node;
  	const struct mtk_scp_sizes_data *scp_sizes;
	struct of_phandle_iterator it;
	int i = 0;
	int ret;

	of_for_each_phandle(&it, ret, node, "memory-region", NULL, 0) {
		ret = ...
		if (ret) .....
		i++;
	}

> +
> +	i = 0;
> +	of_for_each_phandle(&it, err, node, "memory-region", NULL, 0) {
> +		ret = of_reserved_mem_device_init_by_idx(scp->dev, node, i);
> +
> +		if (ret) {
> +			dev_err(scp->dev, "failed to assign memory-region: %s\n",
> +				it.node->name);
> +			of_node_put(it.node);
> +			return -ENOMEM;
> +		}
>   
> -	ret = of_reserved_mem_device_init(scp->dev);
> +		i++;
> +	}
>   
>   	/* reserved memory is optional. */
> -	if (ret == -ENODEV) {
> +	if (!i) {

	if (i == 0) {
		dev_dbg(scp->dev, "skipping reserved memory initialization\n");
		return 0;
	}


Regards,
Angelo


