Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F9714036E
	for <linux-remoteproc@vger.kernel.org>; Thu, 12 Sep 2024 21:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726176648; cv=none; b=WmyeF5dkJe5NaFGxy1PucImVpnVAST05J0I9yGC0yUwVM1jusfge6tqM6z8LTJYdxEu9WYeWMz9+ubRCHh8mJWTHi96iKarLJnbmeJ0X+KR4rZPNie1f7XM7DQJnr2k5nM/apM8PLX7nslDDENyy7GRtKBLgjR4gGYDm78k8qoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726176648; c=relaxed/simple;
	bh=NUdUDtfXmxz6bqwrgpk0iyWOFljyOADqSJxLAc8iOxM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AGy0uaI7dsDOpgJ4GR9rcFxGbGkMPKjL2bwiqibhQD/2g0wBlqbNkqutjNV94JXfcK8mSrDKjqJ42dUQKhPZbQqqJ5P/Quoej98Zx7CbjI0FFTN/gQkq/zMZrQOdxKK0/Bp+CoqVfbfIiEusfu8lweXhYkwVId3HMyn/AWuQjBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=CYjH+b/B; arc=none smtp.client-ip=209.85.166.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="CYjH+b/B"
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-82d07f32eeaso13209039f.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 12 Sep 2024 14:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1726176646; x=1726781446; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UtIMN8hjt+eHm8/8igTe0EDjoiHpYlyPflzpSE1/b8c=;
        b=CYjH+b/B6JMik1bkkgUTlRIj91ZnhU8kiPpmLS+LwcfsBexBcjhxjGXoXyZL1Q1fka
         eCJkzB+Iynuaz9+9plIwHiNOAX6BUAeInhfVw7p/j50ZAWi1Wep23+UtYnETNvPKsQ0x
         DW5FtSSMJGraRXwcyC+v5+dCE4oVtitKnU9EibMcQR6NNhzHUFYMNBQRhMnD3St+nIq5
         oAk1gZAH7FGthu+rh87icbTRb7F3bqTlMWaMjBopOkyZ6v2o1r+ljKFGZZcs7OyK0D64
         GIVsgjUml2sI1G3uM8K2u0sF8URSeejvoenXmRdZnWib6Ji9OXzBvP7FQS1bywpJpq5J
         eiXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726176646; x=1726781446;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UtIMN8hjt+eHm8/8igTe0EDjoiHpYlyPflzpSE1/b8c=;
        b=F4B647vud0ihbL8KM+0ukvp8r1r8YvZ3bTxoSjFq9VCcLA08gJ5uMqr4WRE+RCycZQ
         koiSn29kBwkSjuzYXsTD5Tuo988VTLPCEZ9HQukpELoxrOnXXOYnu/JHjvoeaRGZJgEC
         /GC6ghiAqLa3Xe0qsIQctot3zDKrrFlG6Mn6Yw1UjoG2icAS8A3WyYet6XLmQpznC0LW
         V5cxCpmmQSY52qqphSEybcvsoLQhKRMJ9kyBUhmek4WimqJ1HqgkXC92Q92lIMsvuIhP
         f0gJ0DckQuNF/ko9XS3oEh/iL5/Wu58RoqmDbYMOEI90hawidIKFjVZgKc90HUa4CR4A
         SzUw==
X-Forwarded-Encrypted: i=1; AJvYcCVLB3WMvWcUcE3FTwQs2srYw67uZ9nx7ilnlv400Q0Cq5nnred+1eVPqEGPwt4CDn6Id/50wtfJkQjVjZT1i213@vger.kernel.org
X-Gm-Message-State: AOJu0YyH6b73KWQWdtCaOQfCsllNcl4393fD8Jvo94HoI2SBV9xeGE60
	Gjdyw2ec1GSX57/A9DVMxMRTqL0QBmTs5p/XG4cOar/wvVLYaXQHyQoCeY6vtCk=
X-Google-Smtp-Source: AGHT+IF0Dj116Hozge8v197MDvYjeTxK3MKp0aY5RS13PAtZvlLU8oqWjlPSuwRMds/rwKfYKaJo8g==
X-Received: by 2002:a05:6602:15ca:b0:82d:d07:daaa with SMTP id ca18e2360f4ac-82d376b01c6mr102431939f.4.1726176646337;
        Thu, 12 Sep 2024 14:30:46 -0700 (PDT)
Received: from [100.64.0.1] ([147.124.94.167])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4d35f8dac37sm807546173.133.2024.09.12.14.30.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Sep 2024 14:30:45 -0700 (PDT)
Message-ID: <22dd1d53-9ac5-4672-ad68-e82499038283@sifive.com>
Date: Thu, 12 Sep 2024 16:30:43 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/5] mailbox: add Microchip IPC support
To: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 peterlin@andestech.com, dminus@andestech.com, conor.dooley@microchip.com,
 conor+dt@kernel.org, ycliang@andestech.com, jassisinghbrar@gmail.com,
 robh@kernel.org, krzk+dt@kernel.org, andersson@kernel.org,
 mathieu.poirier@linaro.org
References: <20240912170025.455167-1-valentina.fernandezalanis@microchip.com>
 <20240912170025.455167-4-valentina.fernandezalanis@microchip.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20240912170025.455167-4-valentina.fernandezalanis@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Valentina,

On 2024-09-12 12:00 PM, Valentina Fernandez wrote:
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
> +	if (!ipc->buf_base)
> +		return -ENOMEM;

One drive-by comment here: you don't need to use the DMA API to get a physical
address for passing to the SBI interface. You can use __pa() on a kmalloc'd
buffer, since kmalloc() returns memory from the linear map. This has the
advantage of 1) using cacheable memory and 2) not rounding up the allocation
size to a whole page.

> +
> +	ret = mchp_ipc_sbi_send(SBI_EXT_IPC_PROBE, ipc->dma_addr);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "could not probe IPC SBI service\n");
> +
> +	memcpy(&ipc_info, ipc->buf_base, sizeof(struct mchp_ipc_probe));

Here sizeof(struct mchp_ipc_probe) > sizeof(u32), so if the DMA API wasn't
rounding up the allocation size, this would be a buffer overflow.

Regards,
Samuel

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
> +
> +	return 0;
> +}

