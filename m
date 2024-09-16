Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ACB24174A;
	Mon, 16 Sep 2024 20:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726517907; cv=none; b=VV1P/uQWCVID/kwo6EqZTonLvx8Ct6ZrAXqECsBa7eYnEcmXeINN0VD5RZaHsYawPb+ee4IjmhRjqloo8g797AT7c1TCnxNjnBwQpSixVgbNXavZn269Ixe7sHpC1/7lpMj+Uv+iB5+8JxMAcSNVxx9o0z76br1C1jV++TLK0bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726517907; c=relaxed/simple;
	bh=u77P5jo7uS3KP9szkgannbMqAvqt8NPp8EYTzcJOPcw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FxKrpFtCkCWQijv5CkJjbQd/zdfdNTPI14x3WVaTL2Tw/gBCgetkyTkujM0sY7TTH7C91sZxRd12/eW7bvC8iWwJGqvVPorQ3MReXt+hNKnDu5Uh8LkdjSMxZ/TiyvGUFMohbsBDjakhhOaBdy6z3NG9VCo0hqLm7kGiOob7P54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aF4VxTbN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aF4VxTbN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 237BFC4CEC4;
	Mon, 16 Sep 2024 20:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726517907;
	bh=u77P5jo7uS3KP9szkgannbMqAvqt8NPp8EYTzcJOPcw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aF4VxTbNmH0/0wK+fzdswLiNQDB+zYGUmblw38h94Pv9VV8XK89sL+ys7Ux3yFKvo
	 ag8V+TI8kZSCMCj3Hvh6ZWtTPKkKYx5GOOeaoXpsI7+hCFUdbHI8TlvLLHcovSNOGE
	 BEsirEtTWp0I1/zaOsnS19RWHdw8kwhN5wYQSAqgKOcJ9FwzGIuHT6a9XNjt8rxI1q
	 ydqidw8jIRyqFX3bfdzcZ6TcjyG5IFj/z47xaLZtW0PLscPk2LPHTY0lsxpt0r2OOJ
	 4WZn0EZUJb4f3KzwHxcheYw9FLwP6TaUrBGXrnWivqtgr0ooP9GQk3Q/e7wihOcT5g
	 K3MXwtAX7BuCQ==
Message-ID: <6f1fa401-e9ca-466f-990a-52bc37899bf4@kernel.org>
Date: Mon, 16 Sep 2024 22:18:16 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/5] remoteproc: add support for Microchip IPC
 remoteproc platform driver
To: Valentina Fernandez <valentina.fernandezalanis@microchip.com>,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 peterlin@andestech.com, dminus@andestech.com, conor.dooley@microchip.com,
 conor+dt@kernel.org, ycliang@andestech.com, jassisinghbrar@gmail.com,
 robh@kernel.org, krzk+dt@kernel.org, andersson@kernel.org,
 mathieu.poirier@linaro.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20240912170025.455167-1-valentina.fernandezalanis@microchip.com>
 <20240912170025.455167-6-valentina.fernandezalanis@microchip.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240912170025.455167-6-valentina.fernandezalanis@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/09/2024 19:00, Valentina Fernandez wrote:
> The Microchip family of RISC-V SoCs typically has one or more clusters.
> These clusters can be configured to run in Asymmetric Multi-Processing
> (AMP) mode.
> 
> Add a remoteproc platform driver to be able to load and boot firmware
> to the remote processor(s).

...

> +
> +static int mchp_ipc_rproc_prepare(struct rproc *rproc)
> +{
> +	struct mchp_ipc_rproc *priv = rproc->priv;
> +	struct device_node *np = priv->dev->of_node;
> +	struct rproc_mem_entry *mem;
> +	struct reserved_mem *rmem;
> +	struct of_phandle_iterator it;
> +	u64 device_address;
> +
> +	reinit_completion(&priv->start_done);
> +
> +	of_phandle_iterator_init(&it, np, "memory-region", NULL, 0);
> +	while (of_phandle_iterator_next(&it) == 0) {
> +		/*
> +		 * Ignore the first memory region which will be used vdev
> +		 * buffer. No need to do extra handlings, rproc_add_virtio_dev
> +		 * will handle it.
> +		 */
> +		if (!strcmp(it.node->name, "vdev0buffer"))

What? If you ignore the first, then why are you checking names? This
does not make sense. Especially that your binding did not say anything
about these phandles being somehow special.

> +			continue;
> +
> +		if (!strcmp(it.node->name, "rsc-table"))

Nope.

> +			continue;
> +
> +		rmem = of_reserved_mem_lookup(it.node);
> +		if (!rmem) {
> +			of_node_put(it.node);
> +			dev_err(priv->dev, "unable to acquire memory-region\n");
> +			return -EINVAL;
> +		}
> +
> +		device_address = rmem->base;
> +
> +		mem = rproc_mem_entry_init(priv->dev, NULL, (dma_addr_t)rmem->base,
> +					   rmem->size, device_address, mchp_ipc_rproc_mem_alloc,
> +					   mchp_ipc_rproc_mem_release, it.node->name);
> +
> +		if (!mem) {
> +			of_node_put(it.node);
> +			return -ENOMEM;
> +		}
> +
> +		rproc_add_carveout(rproc, mem);
> +	}
> +
> +	return 0;
> +}
> +
> +static int mchp_ipc_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
> +{
> +	int ret;
> +
> +	ret = rproc_elf_load_rsc_table(rproc, fw);
> +	if (ret)
> +		dev_info(&rproc->dev, "No resource table in elf\n");
> +
> +	return 0;
> +}
> +
> +static void mchp_ipc_rproc_kick(struct rproc *rproc, int vqid)
> +{
> +	struct mchp_ipc_rproc *priv = (struct mchp_ipc_rproc *)rproc->priv;
> +	struct mchp_ipc_msg msg;
> +	int ret;
> +
> +	msg.buf = (void *)&vqid;
> +	msg.size = sizeof(vqid);
> +
> +	ret = mbox_send_message(priv->mbox_channel, (void *)&msg);
> +	if (ret < 0)
> +		dev_err(priv->dev,
> +			"failed to send mbox message, status = %d\n", ret);
> +}
> +
> +static int mchp_ipc_rproc_attach(struct rproc *rproc)
> +{
> +	return 0;
> +}
> +
> +static struct resource_table
> +*mchp_ipc_rproc_get_loaded_rsc_table(struct rproc *rproc, size_t *table_sz)
> +{
> +	struct mchp_ipc_rproc *priv = rproc->priv;
> +
> +	if (!priv->rsc_table)
> +		return NULL;
> +
> +	*table_sz = SZ_1K;
> +	return (struct resource_table *)priv->rsc_table;
> +}
> +
> +static const struct rproc_ops mchp_ipc_rproc_ops = {
> +	.prepare = mchp_ipc_rproc_prepare,
> +	.start = mchp_ipc_rproc_start,
> +	.get_loaded_rsc_table = mchp_ipc_rproc_get_loaded_rsc_table,
> +	.attach = mchp_ipc_rproc_attach,
> +	.stop = mchp_ipc_rproc_stop,
> +	.kick = mchp_ipc_rproc_kick,
> +	.load = rproc_elf_load_segments,
> +	.parse_fw = mchp_ipc_rproc_parse_fw,
> +	.find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
> +	.sanity_check = rproc_elf_sanity_check,
> +	.get_boot_addr = rproc_elf_get_boot_addr,
> +};
> +
> +static int mchp_ipc_rproc_addr_init(struct mchp_ipc_rproc *priv,
> +				    struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *np = dev->of_node;
> +	int i, err, rmem_np;
> +
> +	rmem_np = of_count_phandle_with_args(np, "memory-region", NULL);
> +	if (rmem_np <= 0)
> +		return 0;
> +
> +	for (i = 0; i < rmem_np; i++) {
> +		struct device_node *node;
> +		struct resource res;
> +
> +		node = of_parse_phandle(np, "memory-region", i);
> +		if (!node)
> +			continue;
> +
> +		if (!strncmp(node->name, "vdev", strlen("vdev"))) {

Uh? Why do you look for node names? What if I call the name differently?
Why would that matter?

> +			of_node_put(node);
> +			continue;
> +		}
> +
> +		if (!strcmp(node->name, "rsc-table")) {

No, really. Why are you checking for these?

NAK


> +			err = of_address_to_resource(node, 0, &res);
> +			if (err) {
> +				of_node_put(node);
> +				return dev_err_probe(dev, err,
> +						     "unable to resolve memory region\n");
> +			}
> +			priv->rsc_table = devm_ioremap(&pdev->dev,
> +						       res.start, resource_size(&res));
> +			of_node_put(node);
> +		}
> +	}
> +
> +	return 0;
> +}


Best regards,
Krzysztof

