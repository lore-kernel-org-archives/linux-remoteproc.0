Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A501E2D94AF;
	Tue, 14 Apr 2026 17:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776189381; cv=none; b=EiZdCvxZtkz0WQbGdAp5tsLeXHthwBKsFSnbYe6R/IHC2yCMHfIJvNWECw/vge4DRH/4IaUg6KP9H/W6W406dlB0+GodmSWfoFyfd9dcqnOoZy4qT2Lh/QqrhmSdpvGA+SUHanYGt7MS+Vu2CQSqV9GdtXer6BqUrgtYcWdNtO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776189381; c=relaxed/simple;
	bh=ITnv3BrsSdGjP9wuxqeknqRZJkJsbYlTwOKIU4L4FcA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FnAhg0zouANgb7BlORd6n3wxELFBRpQmJoHnO0H86ThXGiIV4X5dZpjip6/ysR++WMDnQKsjDT4vfE/LM2sP55V2frmxSog2sp8exQBd228gIPXVvX08hGk2V5YO/GxLvgdexruv5RcwSIhQT8ujWMg+v97zIFR/jvJYGFCSMyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D72A1F4H; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D72A1F4H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C97B2C19425;
	Tue, 14 Apr 2026 17:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776189381;
	bh=ITnv3BrsSdGjP9wuxqeknqRZJkJsbYlTwOKIU4L4FcA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=D72A1F4HVtoExY4l7fzIXrXze9dlN7iNgtNw55wSz88M4IohOc7eHfFYRdH9Mp4Wu
	 jmUoybPBRLnIliYAI78C7x4x0vgTsyd/TJ4y7VJyXIn6xKC9H4LKIZS7+QY3PqwUIQ
	 Mbwp4Wlep1TlotgfDvlZL4YSn/wYbx/pHOiXGpOA4v1oJsfKwy2/iP5CJmzSMhTV15
	 25H1+tCjEaCBd0ZH/YseTEv+5P9HwBstpT9KHERtW52Y/QDeA7GR7KfvnxvyWwPyQ/
	 sb3gJna3w+My6RAAIvdKN5j+tjupnUL+yHsdjzmp+R1DvDkhroHS+z73NoQ4nx2FqA
	 hEkyDBjvmSUnQ==
Message-ID: <8e40020d-3471-4c72-9de9-ed5eb53433a7@kernel.org>
Date: Tue, 14 Apr 2026 19:56:17 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] remoteproc: add AMD MicroBlaze driver
To: Ben Levinsky <ben.levinsky@amd.com>, andersson@kernel.org,
 mathieu.poirier@linaro.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tanmay.shah@amd.com, michal.simek@amd.com
References: <20260414161558.2579920-1-ben.levinsky@amd.com>
 <20260414161558.2579920-3-ben.levinsky@amd.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20260414161558.2579920-3-ben.levinsky@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/04/2026 18:15, Ben Levinsky wrote:
>  Add an AMD MicroBlaze remoteproc driver.
> 
>  The driver parses the executable firmware memory window from
>  the remoteproc device node's reg property, interprets that
>  address and size in the MicroBlaze-local address space, and
>  then uses standard devicetree address translation through the
>  parent bus ranges property to obtain the corresponding
>  Linux-visible system physical address.
> 
>  The resulting translated region is registered as the executable
>  remoteproc carveout and coredump segment.
> 
>  The MicroBlaze is controlled through an active-low reset GPIO and kept in
>  reset until firmware loading completes.
> 
>  The firmware-name property is optional, allowing firmware to be
>  assigned later through the remoteproc framework.
> 

Fix your commit msg so it uses sane style, not some indentation.

Look at how other commits are written, if you have doubts.

...

> +
> +static int mb_rproc_start(struct rproc *rproc)
> +{
> +	struct mb_rproc *mb = rproc->priv;
> +
> +	/* reset-gpios is declared active-low, so logical 0 releases reset */

If reset-gpios is declared active-high, then logical 0 also releases reset.

Drop comment, not correct.

> +	gpiod_set_value_cansleep(mb->reset, 0);
> +
> +	return 0;
> +}
> +
> +static int mb_rproc_stop(struct rproc *rproc)
> +{
> +	struct mb_rproc *mb = rproc->priv;
> +
> +	/* reset-gpios is declared active-low, so logical 1 asserts reset */
> +	gpiod_set_value_cansleep(mb->reset, 1);
> +
> +	return 0;
> +}
> +
> +static int mb_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
> +{
> +	int ret;
> +
> +	ret = rproc_elf_load_rsc_table(rproc, fw);
> +	if (ret == -EINVAL) {
> +		dev_dbg(&rproc->dev, "no resource table found\n");
> +		return 0;
> +	}
> +
> +	return ret;
> +}
> +
> +static const struct rproc_ops mb_rproc_ops = {
> +	.prepare	= mb_rproc_prepare,
> +	.start		= mb_rproc_start,
> +	.stop		= mb_rproc_stop,
> +	.load		= rproc_elf_load_segments,
> +	.sanity_check	= rproc_elf_sanity_check,
> +	.get_boot_addr	= rproc_elf_get_boot_addr,
> +	.parse_fw	= mb_rproc_parse_fw,
> +};
> +
> +static int mb_rproc_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct mb_rproc *mb;
> +	struct rproc *rproc;
> +	const char *fw_name = NULL;
> +	int ret;
> +
> +	ret = rproc_of_parse_firmware(dev, 0, &fw_name);
> +	if (ret < 0 && ret != -EINVAL)
> +		return dev_err_probe(dev, ret,
> +				     "failed to parse firmware-name property\n");
> +
> +	rproc = devm_rproc_alloc(dev, dev_name(dev), &mb_rproc_ops, fw_name,
> +				 sizeof(*mb));
> +	if (!rproc)
> +		return -ENOMEM;
> +
> +	mb = rproc->priv;
> +	mb->dev = dev;
> +
> +	/*
> +	 * Keep the MicroBlaze in reset until remoteproc has finished loading
> +	 * firmware into the executable memory window described by reg and
> +	 * translated through the parent bus ranges property.
> +	 */
> +	mb->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(mb->reset))
> +		return dev_err_probe(dev, PTR_ERR(mb->reset),
> +				     "failed to get reset gpio\n");
> +
> +	rproc->auto_boot = false;
> +
> +	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64));
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to set DMA mask\n");
> +
> +	platform_set_drvdata(pdev, rproc);
> +
> +	ret = devm_rproc_add(dev, rproc);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to register rproc\n");
> +
> +	dev_dbg(dev, "MicroBlaze remoteproc registered\n");

Drop. This does not look like useful printk message. Drivers should be
silent on success:
https://elixir.bootlin.com/linux/v6.15-rc7/source/Documentation/process/coding-style.rst#L913
https://elixir.bootlin.com/linux/v6.15-rc7/source/Documentation/process/debugging/driver_development_debugging_guide.rst#L79

Core already gives way to see probe success.

Best regards,
Krzysztof
