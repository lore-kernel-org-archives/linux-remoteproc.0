Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A0B12B72
	for <linux-remoteproc@vger.kernel.org>; Tue, 16 Jul 2024 15:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721144813; cv=none; b=WlvQin+cawG69Nz+TG0NDnLEAF2fZJj/MxwUdywTncfkNuYhvmDK8CxKQuXDlE6NFKwO4P9XiKOURjMjC7Ul/dcZ5Xb7TkIjVg76ui5Vk2qE3IEiqb0kpfO+46iV/xJkThrx7X+jdEQ90zCua8nCIk9NLO5ehI8ziEASMwulpJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721144813; c=relaxed/simple;
	bh=Ov0ZxuRqg19DOdyaVwSAZjy1CSU3sqSqbZdr+Bo8tNo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aJaNwAUVGPsATBVwvdV8f87DjkuZHwsNNY29Q5Ov6i+iRjUeOEKAp4lTVv+LTu7sV4UkTrdv6fJaj0rwPGCGndv/9j88JcVBxFbmjRelzRd9n0HKLbrtzZCcVvaY+HqpSpgGpew9PhFVix8nZ0AL3vcbSNIrIRUheLlN414/V5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AeJWbA1S; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AeJWbA1S"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1fb0d88fd25so39872865ad.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 16 Jul 2024 08:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721144810; x=1721749610; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GOZ0mHcem+Vs3dr0bori38FCvWKVYDMdvIY4Rdc3Vvo=;
        b=AeJWbA1SSdGEVdsc/Gd75fv/SMMsmEk8eT/e7boEoP/lAfNO55IWEgT7B0i2DpJA/k
         /FMWwH9En3RMKtham9KhgQbz4ukXuEnn21baGigD3FomrJ3acNHQORiAWpjCyFhTkv+U
         y1sdybpC0fn85j+UkuG+H/kh4F7XSqI+JsN7gaCkMOnUYatzqkbq76Q8jr4gQN/EMsfX
         2TylCXOjJgq39L6HB8WePtJs+GU0af5uTiLNG+9fnz1SvYnEcpyTd0i6ZReYU82vft+k
         ojvDkEXVtRrMQ65/pWOGRroNJJO6XdpVdSex0WBeHfnzT3n3cmv8m5CM+r908T0tw5pC
         GhVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721144810; x=1721749610;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GOZ0mHcem+Vs3dr0bori38FCvWKVYDMdvIY4Rdc3Vvo=;
        b=P4NgaoMmXf/WF/wzSrtlG7+3mLOS6Xn1qMqOYAiB92wbTTwd4LJIGEwpqEUY2MKDwc
         kQhxOLLurBUHyDOH+SA8YZFlMVUtoU1DelqsmTOnP/mooBjAJuO4VIv4WrFKi5Zu8NaR
         LrneBvpPuG6Xvo9YmFV6ZY6Nm4pF70w5BrriRuKLzpY7cDwIcUOC1FXr/5KPmdJwxPkx
         YhEvq6+/qL1/rpVBke0G+UuT62/kpCpTvECc3dvK7Xs8TVDAeHSvZiLqgl81cA3kR0i7
         BSQ1Oymfrl0mhYNl+GwD04b0Cnn/OBKIj7GcNID0Uw9jZm2ua2bDaOGDMLlcMBbh7lQI
         w/MQ==
X-Forwarded-Encrypted: i=1; AJvYcCVC362ZWgiq5ld5FkNm6SpL2QUzzxj+ugokC9U6dNcPRV/29VWJArYDKrfGtAwMPr/H95j5h10D4NP+Q9Gu0IGA+25Ig715H+RyC3LlfjcA4A==
X-Gm-Message-State: AOJu0Yz6Sy3hNZDJLPEKlGEi4//ScTf42LvzT/UUHc7F3MP/gMM497/k
	nyb78R5ZzGYzbsLYkC/dKEf5aV6FWuY/MsrDYKn1tZE5M7oatvV/EtAK0n9JaSQ=
X-Google-Smtp-Source: AGHT+IGuZHVU0ziAtoeqsGV04P2Tf0nyODoXzZ44+orFCy6lC6ncLmkiz+ZhBmIDQL7JpJUFd4iWGQ==
X-Received: by 2002:a17:903:11cc:b0:1fb:6121:dfc0 with SMTP id d9443c01a7336-1fc3e6cae84mr37740675ad.19.1721144809911;
        Tue, 16 Jul 2024 08:46:49 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:5d01:167d:9cf4:148e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fc0bbc2782sm59434125ad.102.2024.07.16.08.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 08:46:49 -0700 (PDT)
Date: Tue, 16 Jul 2024 09:46:45 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>, Jacky Bai <ping.bai@nxp.com>
Subject: Re: [PATCH 5/6] remoteproc: imx_rproc: allow tx_block to be set
Message-ID: <ZpaV5W94NvuJpvle@p14s>
References: <20240712-imx_rproc-v1-0-7bcf6732d328@nxp.com>
 <20240712-imx_rproc-v1-5-7bcf6732d328@nxp.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240712-imx_rproc-v1-5-7bcf6732d328@nxp.com>

On Fri, Jul 12, 2024 at 04:34:58PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Current tx_block is set to true, but there is case that no need to wait
> response. Linux just needs to send data to remote processor, so let's
> allow tx_block could be set to false.

Ok, maybe - but this patch doesn't use the new functionality, i.e nothing
changes.  

> 
> Reviewed-by: Jacky Bai <ping.bai@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 552fccebf7e2..01cf1dfb2e87 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -90,7 +90,7 @@ struct imx_rproc_mem {
>  #define ATT_CORE_MASK   0xffff
>  #define ATT_CORE(I)     BIT((I))
>  
> -static int imx_rproc_xtr_mbox_init(struct rproc *rproc);
> +static int imx_rproc_xtr_mbox_init(struct rproc *rproc, bool tx_block);
>  static void imx_rproc_free_mbox(struct rproc *rproc);
>  
>  struct imx_rproc {
> @@ -369,7 +369,7 @@ static int imx_rproc_start(struct rproc *rproc)
>  	struct arm_smccc_res res;
>  	int ret;
>  
> -	ret = imx_rproc_xtr_mbox_init(rproc);
> +	ret = imx_rproc_xtr_mbox_init(rproc, true);
>  	if (ret)
>  		return ret;
>  
> @@ -629,7 +629,7 @@ static void imx_rproc_kick(struct rproc *rproc, int vqid)
>  
>  static int imx_rproc_attach(struct rproc *rproc)
>  {
> -	return imx_rproc_xtr_mbox_init(rproc);
> +	return imx_rproc_xtr_mbox_init(rproc, true);
>  }
>  
>  static int imx_rproc_detach(struct rproc *rproc)
> @@ -794,7 +794,7 @@ static void imx_rproc_rx_callback(struct mbox_client *cl, void *msg)
>  	queue_work(priv->workqueue, &priv->rproc_work);
>  }
>  
> -static int imx_rproc_xtr_mbox_init(struct rproc *rproc)
> +static int imx_rproc_xtr_mbox_init(struct rproc *rproc, bool tx_block)
>  {
>  	struct imx_rproc *priv = rproc->priv;
>  	struct device *dev = priv->dev;
> @@ -817,7 +817,7 @@ static int imx_rproc_xtr_mbox_init(struct rproc *rproc)
>  
>  	cl = &priv->cl;
>  	cl->dev = dev;
> -	cl->tx_block = true;
> +	cl->tx_block = tx_block;
>  	cl->tx_tout = 100;
>  	cl->knows_txdone = false;
>  	cl->rx_callback = imx_rproc_rx_callback;
> @@ -1083,7 +1083,7 @@ static int imx_rproc_probe(struct platform_device *pdev)
>  
>  	INIT_WORK(&priv->rproc_work, imx_rproc_vq_work);
>  
> -	ret = imx_rproc_xtr_mbox_init(rproc);
> +	ret = imx_rproc_xtr_mbox_init(rproc, true);
>  	if (ret)
>  		goto err_put_wkq;
>  
> 
> -- 
> 2.37.1
> 
