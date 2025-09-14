Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C359D19D087;
	Sun, 14 Sep 2025 13:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757856516; cv=none; b=UrM4kxzJKKvcF5dAP+4KVz5HSZkqrzGPTmsh/YQMvtqE4OOJK+EhAPQaekw2Slk3kPF0JSK63pVbPKgl6NNIhGwsHZ+H7FxTrV7JnORlpMwEHz63utgMSs/1EYzFskOTMrVomXentxEaoh0tsB4C1JrQMe9yfQ4cF0DrhWzJRHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757856516; c=relaxed/simple;
	bh=bi2EiYLS+A8f/w7jCWkTyo4nLGGJbpc175iFxjzkCG8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sIc1RDzIKsnHWNEMHYgGvhp9VTslLBiVP0Mc5m+ZL4C7CU/Rq69mRw1PIcHJcD6d7SyNofvpVJLPzuhXJIKcdfPcNmJ5GqEZDKAO8Pa7cvaOukXBsckUg01pYV0Wl5rSWfeDCcWxolO1Zk61djPRfnVNVBxzriuQZsQpfDZcH+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gjjIl8rx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gjjIl8rx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AB6EC4CEF0;
	Sun, 14 Sep 2025 13:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757856516;
	bh=bi2EiYLS+A8f/w7jCWkTyo4nLGGJbpc175iFxjzkCG8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gjjIl8rxHh/A+Rj5iCmVil4FvhlqvxqSjvzIrrX+iGIg5tLPjjBVIembnsVoZvzQp
	 5be5fGB3/gB+x3bDN63Kka9CVZCQ6zJIc0m1Oyqu/79rd540xp8gPZM0GRF/XhN33K
	 IBcBrWJ5f40VSBavkO4PuVHxXiSlQSthFe9ZWugpGn0VyifkWMXEh6ijxVx0nu1h3i
	 +g/KsRkNBX3IeAX+sc6Br/XeFeE4GBTqrBwxipi/OcuN5sQ2ZaaaW2SzzuQJgGSzXu
	 phUufiwv89X6n0xUsfTqzVCS+LEwnUiocUJaxjhoKDCqor6uE79NB2hxGHex5ljzRb
	 VW59hY8cxFLYw==
Message-ID: <8c298465-893a-4a18-9955-4769288ec010@kernel.org>
Date: Sun, 14 Sep 2025 15:28:29 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] remoterpoc: mediatek: vcp: Add vcp remoteproc
 driver
To: Xiangzhi Tang <xiangzhi.tang@mediatek.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "irving.ch.lin" <irving-ch.lin@mediatek.com>,
 =?UTF-8?B?VmluY2UtV0wgTGl1ICjlionmlofpvo0p?= <vince-wl.liu@mediatek.com>,
 =?UTF-8?B?SmggSHN1ICjoqLHluIzlrZwp?= <jh.hsu@mediatek.com>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 =?UTF-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <sirius.wang@mediatek.com>
Cc: Rob Herring <robh@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-remoteproc@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Jjian Zhou <Jjian.Zhou@mediatek.com>,
 Hailong Fan <Hailong.Fan@mediatek.com>
References: <20250914122943.10412-1-xiangzhi.tang@mediatek.com>
 <20250914122943.10412-3-xiangzhi.tang@mediatek.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250914122943.10412-3-xiangzhi.tang@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/09/2025 14:29, Xiangzhi Tang wrote:
> +
> +static const struct rproc_ops mtk_vcp_ops = {
> +	.load		= mtk_vcp_load,
> +	.start		= mtk_vcp_start,
> +	.stop		= mtk_vcp_stop,
> +};
> +
> +static int vcp_multi_core_init(struct platform_device *pdev,
> +			       struct mtk_vcp_of_cluster *vcp_cluster,
> +			       enum vcp_core_id core_id)
> +{
> +	int ret;
> +
> +	ret = of_property_read_u32(pdev->dev.of_node, "mtk,vcp-core-twohart",
> +				   &vcp_cluster->twohart[core_id]);
> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to twohart property\n");
> +		return ret;
> +	}
> +	ret = of_property_read_u32(pdev->dev.of_node, "mtk,core-sram-offset",

Undocumented ABI, if you ever bothered to test your DTS you would see
clear warning.

> +				   &vcp_cluster->sram_offset[core_id]);
> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to sram-offset property\n");
> +		return ret;
> +	}
> +
> +	return ret;
> +}
> +
> +static struct mtk_vcp_device *vcp_rproc_init(struct platform_device *pdev,
> +					     struct mtk_vcp_of_cluster *vcp_cluster)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *np = dev_of_node(dev);
> +	struct device_node *child;
> +	struct platform_device *cpdev;
> +	struct mtk_vcp_device *vcp;
> +	struct rproc *rproc;
> +	const struct mtk_vcp_of_data *vcp_of_data;
> +	u32 core_id;
> +	int ret;
> +
> +	vcp_of_data = of_device_get_match_data(dev);
> +	rproc = devm_rproc_alloc(dev, np->name, &mtk_vcp_ops,
> +				 vcp_of_data->platdata.fw_name,
> +				 sizeof(struct mtk_vcp_device));
> +	if (!rproc) {
> +		dev_err(dev, "unable to allocate remoteproc\n");

No, you never do this.

> +		return ERR_PTR(-ENOMEM);
> +	}
> +
> +	vcp  = rproc->priv;
> +	vcp->rproc = rproc;
> +	vcp->pdev = pdev;
> +	vcp->dev = dev;
> +	vcp->ops = &vcp_of_data->ops;
> +	vcp->platdata = &vcp_of_data->platdata;
> +	vcp->vcp_cluster = vcp_cluster;
> +
> +	rproc->auto_boot = vcp_of_data->platdata.auto_boot;
> +	rproc->sysfs_read_only = vcp_of_data->platdata.sysfs_read_only;
> +	mutex_init(&vcp->vcp_cluster->vcp_feature_mutex);
> +	mutex_init(&vcp->vcp_cluster->vcp_pw_clk_mutex);
> +	platform_set_drvdata(pdev, vcp);
> +
> +	ret = vcp_reserve_memory_ioremap(vcp);
> +	if (ret) {
> +		dev_err(dev, "vcp_reserve_memory_ioremap failed ret = %d\n", ret);
> +		return ERR_PTR(ret);
> +	}
> +
> +	core_id = 0;
> +	for_each_available_child_of_node(np, child) {
> +		if (of_device_is_compatible(child, "mediatek,vcp-core")) {
> +			cpdev = of_find_device_by_node(child);
> +			if (!cpdev) {
> +				ret = -ENODEV;
> +				dev_err(dev, "Not found platform device for core\n");

1. That's probe path, so why are you using this old style? The syntax is
return dev_err_probe and I am dissapointed that your internal review did
not ask for that.

2. You just leak here everywhere device.

This patchset has trivial errors, which should be spotted easily by
internal review. Plus your other patch ignored EXITING feedback, so what
is even point of posting this if you are just going to ignore us?

Please confirm that you received extensive internal review before
posting this?

Mediatek posts so many patches, I complained so many times about poor
quality, things a bit improved two years ago and for a year the quality
deteriorated and Mediatek posts poor code again. It's huge company with
huge resources, so I do not understand why trivial bugs like this cannot
be found inside first, to offload the community reviewers.

NAK

Best regards,
Krzysztof
