Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6951FB3;
	Sun, 14 Sep 2025 13:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757856653; cv=none; b=HU/H1B/RTQa1RIIFCrgp4haR/XgO8tUYjXOd3FGbiSzVqloto68IZTQ6B4F+4QlLY1XvoJ5Ni7PCF1NVppJEl24i6yenNF3hUcm0EIBpwcHJfOhR60J05iLC0Noxd1butTTuMBkQHoTLd58bMveZbBwX62/v081QR0RxAjR7qQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757856653; c=relaxed/simple;
	bh=znUg6TmwCXJATYx0iPaI3iat1yH0r9iU0Zft+BHEagk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V9Ehj8KDFa0BUv2J46Mcc5gCXqkze0fRPrW25SITyKfT4jURH2Z2SP61TW/FnKyFkSJwAEYPpmC8K0woZrA48q6BtDHaW8hh6MU3QzAziksK78iIuBEl0c+4gmfMQ02ZPTrG0vIJroCHZPdzG4CVi7E2GN+fdnVOiWPu9Wqn7yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=baqE8Tmw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="baqE8Tmw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 163C1C4CEF0;
	Sun, 14 Sep 2025 13:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757856653;
	bh=znUg6TmwCXJATYx0iPaI3iat1yH0r9iU0Zft+BHEagk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=baqE8Tmw5jzjbX+OxiuIb1oUVXf+JLqFmB0EsxDO9KwDEJheOQ8Qb84WJlbmTq37f
	 yOZBsWLQGi4Z4LValk/cUYvjPV4sO170/U0ASG+wy8RFhs2eKDjXeC5fXXinmBj7jq
	 gnaAEX5bcarDtT3Gy3DtHosPmC1GuObCHhNNqxC4ba2VQkPUKBn31qtaIW3TiH6/dK
	 wf+6+RqJJeUkBssb12DbPUTJHgmSv0xmaz1F0yfIlZv/JQLRqSNfhvQE03thEaEzls
	 MI3vvl+ZLhLRYn6upjgqQU6JinUAS8hRL5znZu4MzBne2Tlvvth+5HT76QM149QJxp
	 2Pjg9klzP9x+A==
Message-ID: <4ef0e813-310d-4ca7-b946-32d7f436c20b@kernel.org>
Date: Sun, 14 Sep 2025 15:30:48 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] remoterpoc: mediatek: vcp: Add ipi-mbox
 communication
To: Xiangzhi Tang <xiangzhi.tang@mediatek.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Jjian Zhou <Jjian.Zhou@mediatek.com>,
 Hailong Fan <Hailong.Fan@mediatek.com>
References: <20250914122943.10412-1-xiangzhi.tang@mediatek.com>
 <20250914122943.10412-4-xiangzhi.tang@mediatek.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250914122943.10412-4-xiangzhi.tang@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/09/2025 14:29, Xiangzhi Tang wrote:
>  
> +/**
> + * vcp_get_ipidev() - get a vcp ipi device struct to reference vcp ipi.
> + *
> + * @vcp: mtk_vcp_device structure from vcp_get().
> + *
> + **/
> +struct mtk_ipi_device *vcp_get_ipidev(struct mtk_vcp_device *vcp)
> +{
> +	return vcp->ipi_dev;
> +}
> +EXPORT_SYMBOL_GPL(vcp_get_ipidev);

NAK, there is no user of this.

I did not check the rest but I assume the same pattern in other places.

> +
>  static int mtk_vcp_start(struct rproc *rproc)
>  {
>  	struct mtk_vcp_device *vcp = (struct mtk_vcp_device *)rproc->priv;
>  	struct arm_smccc_res res;
> +	int ret;
> +
> +	ret = vcp->ipi_ops->ipi_register(vcp->ipi_dev, IPI_IN_VCP_READY_0,
> +					 (void *)vcp_A_ready_ipi_handler,
> +					 vcp, &vcp->vcp_cluster->msg_vcp_ready0);
> +	if (ret) {
> +		dev_err(vcp->dev, "Failed to register IPI_IN_VCP_READY_0\n");
> +		goto vcp0_ready_ipi_unregister;
> +	}
> +
> +	ret = vcp->ipi_ops->ipi_register(vcp->ipi_dev, IPI_IN_VCP_READY_1,
> +					 (void *)vcp_A_ready_ipi_handler,
> +					 vcp, &vcp->vcp_cluster->msg_vcp_ready1);
> +	if (ret) {
> +		dev_err(vcp->dev, "Failed to register IPI_IN_VCP_READY_1\n");
> +		goto vcp1_ready_ipi_unregister;
> +	}
>  
>  	/* core 0 */
>  	arm_smccc_smc(MTK_SIP_TINYSYS_VCP_CONTROL,
> @@ -82,7 +112,14 @@ static int mtk_vcp_start(struct rproc *rproc)
>  		dev_info(vcp->dev, "bootup successfully\n");
>  	}
>  
> -	return 0;
> +	return ret;

This make sno sense, why are you doing this?


Best regards,
Krzysztof
