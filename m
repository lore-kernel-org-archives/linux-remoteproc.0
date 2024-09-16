Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 694B72628C;
	Mon, 16 Sep 2024 20:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726518092; cv=none; b=h9H/qqE5N1ZobqfLnYTokIYabsVn1kgiky6WPs+XXKsgZhXVs+D0vZjbQ13jmJN0cQ+bh25SEP02qrHvJFv3IX/gJSUf/bZbCFIEvId2evJF2m/hy+2t7ei6qhsPnV08TZSHGOiHhRXJDcU7eq9ktt9By7XaTfhV8CpifYe9myw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726518092; c=relaxed/simple;
	bh=deePev/5PolISmSihzoi92wFF4nh6uH26O7kF3BOKIE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=noR9D4Fs7qRIbKQ5H7qNp09P/wMd/WEq3nLdN7q1QTnL+3mzG8CahCbKK4YYvxDodFemMAQCr4hHJdzvC5X3MNTUH2rdew8RQP7Ju7+3ugZgHr2pn3D8BUoXA1uCyK+YLmKAwM3dbFcDTi4jhEf55YDehsboFXOcq6p/1oQ4bQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AI6nrhE+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AI6nrhE+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4393AC4CEC4;
	Mon, 16 Sep 2024 20:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726518091;
	bh=deePev/5PolISmSihzoi92wFF4nh6uH26O7kF3BOKIE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AI6nrhE+qlOcShePDmLEslKbmQSQ1NecLFiA6QqOcVst0iui8VTKnQ46vtMd9by+c
	 RV6MapLMdaKiJqsFOdGrjk0BomIxMxhQAewfqWqpg3OdkagGcpI5IWA/0SFgOAjQFZ
	 IpiW74loDU/bX0EW1W0DZzLKcedy2TgyJY0zV7MnITIp2g0/D/0QBIVaKgax+hedne
	 OTUDN8XN7GuPTfHP+ZYbJAL2Jo3Hfs+E6n/zGE/uzas0YxjxJzcSFFqGgxcn3YD9X8
	 dX28BmTdEsuQjQWnPYp4cHORQBV8Q0uUZ2bD240uDToEai3OJFLaHQLvArv3qQ2a/F
	 99KeXyLOnEbJg==
Message-ID: <0b855362-d0a7-45da-81d5-10d53bf8d965@kernel.org>
Date: Mon, 16 Sep 2024 22:21:21 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/5] mailbox: add Microchip IPC support
To: Valentina Fernandez <valentina.fernandezalanis@microchip.com>,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 peterlin@andestech.com, dminus@andestech.com, conor.dooley@microchip.com,
 conor+dt@kernel.org, ycliang@andestech.com, jassisinghbrar@gmail.com,
 robh@kernel.org, krzk+dt@kernel.org, andersson@kernel.org,
 mathieu.poirier@linaro.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20240912170025.455167-1-valentina.fernandezalanis@microchip.com>
 <20240912170025.455167-4-valentina.fernandezalanis@microchip.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240912170025.455167-4-valentina.fernandezalanis@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/09/2024 19:00, Valentina Fernandez wrote:
> Add a mailbox controller driver for the Microchip Inter-processor
> Communication (IPC), which is used to send and receive data between
> processors.
> 
> The driver uses the RISC-V Supervisor Binary Interface (SBI) to
> communicate with software running in machine mode (M-mode) to access
> the IPC hardware block.
> 

...

> +
> +static struct microchip_ipc *to_mchp_ipc_mbox(struct mbox_controller *mbox)
> +{
> +	return container_of(mbox, struct microchip_ipc, controller);
> +}
> +

You need kerneldoc for exported functions.

> +u32 mchp_ipc_get_chan_id(struct mbox_chan *chan)
> +{
> +	struct ipc_chan_info *chan_info = (struct ipc_chan_info *)chan->con_priv;
> +
> +	return chan_info->id;
> +}
> +EXPORT_SYMBOL(mchp_ipc_get_chan_id);

EXPORT_SYMBOL_GPL

> +


...

> +static int mchp_ipc_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct mchp_ipc_probe ipc_info;
> +	struct microchip_ipc *ipc;
> +	struct ipc_chan_info *priv;
> +	bool irq_avail = false;
> +	int ret;
> +	u32 chan_id;
> +
> +	ret = sbi_probe_extension(SBI_EXT_MICROCHIP_TECHNOLOGY);
> +	if (ret <= 0)
> +		return dev_err_probe(dev, ret, "Microchip SBI extension not detected\n");
> +
> +	ipc = devm_kzalloc(dev, sizeof(*ipc), GFP_KERNEL);
> +	if (!ipc)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, ipc);
> +
> +	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(IPC_DMA_BIT_MASK));
> +	if (ret)
> +		return dev_err_probe(dev, ret, "dma_set_mask_and_coherent failed\n");
> +
> +	ipc->buf_base = dmam_alloc_coherent(dev, sizeof(u32), &ipc->dma_addr, GFP_KERNEL);
> +

Drop blank line.

> +	if (!ipc->buf_base)
> +		return -ENOMEM;
> +
> +	ret = mchp_ipc_sbi_send(SBI_EXT_IPC_PROBE, ipc->dma_addr);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "could not probe IPC SBI service\n");
> +
> +	memcpy(&ipc_info, ipc->buf_base, sizeof(struct mchp_ipc_probe));
> +	ipc->num_channels = ipc_info.num_channels;
> +	ipc->hw_type = ipc_info.hw_type;
> +
> +	ipc->chans = devm_kcalloc(dev, ipc->num_channels, sizeof(*ipc->chans), GFP_KERNEL);
> +	if (!ipc->chans)
> +		return -ENOMEM;
> +
> +	ipc->dev = dev;
> +	ipc->controller.txdone_irq = true;
> +	ipc->controller.dev = ipc->dev;
> +	ipc->controller.ops = &mchp_ipc_ops;
> +	ipc->controller.chans = ipc->chans;
> +	ipc->controller.num_chans = ipc->num_channels;
> +	ipc->controller.of_xlate = mchp_ipc_mbox_xlate;
> +
> +	for (chan_id = 0; chan_id < ipc->num_channels; chan_id++) {
> +		priv = devm_kmalloc(dev, sizeof(*priv), GFP_KERNEL);
> +		if (!priv)
> +			return -ENOMEM;
> +
> +		ipc->chans[chan_id].con_priv = priv;
> +		priv->id = chan_id;
> +	}
> +
> +	if (ipc->hw_type == MIV_IHC) {
> +		ipc->cluster_cfg = devm_kcalloc(dev, num_online_cpus(),
> +						sizeof(struct mchp_ipc_cluster_cfg),
> +						GFP_KERNEL);
> +		if (!ipc->cluster_cfg)
> +			return -ENOMEM;
> +
> +		if (mchp_ipc_get_cluster_aggr_irq(ipc))
> +			irq_avail = true;
> +	}
> +
> +	if (!irq_avail)
> +		return dev_err_probe(dev, -ENODEV, "missing interrupt property\n");
> +
> +	ret = devm_mbox_controller_register(dev, &ipc->controller);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +					 "Inter-Processor communication (IPC) registration failed\n");

Fix alignment.

> +
> +	return 0;
> +}
> +
> +MODULE_DEVICE_TABLE(of, mchp_ipc_of_match);

This is ALWAYS next to the definition.

> +
> +static struct platform_driver mchp_ipc_driver = {
> +	.driver = {
> +		.name = "microchip_ipc",
> +		.of_match_table = of_match_ptr(mchp_ipc_of_match),

Drop of_match_ptr. You have warnings here.

> +	},
> +	.probe = mchp_ipc_probe,
> +};
> +
> +module_platform_driver(mchp_ipc_driver);



Best regards,
Krzysztof

