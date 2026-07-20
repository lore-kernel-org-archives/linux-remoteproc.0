Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB4B445AC6
	for <linux-remoteproc@vger.kernel.org>; Mon, 20 Jul 2026 17:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784568853; cv=none; b=pGjVBviRrjAk3iCaOp5Rl5kfKqjrgspko1WFnTnM0Q+nziXXd6rqWoJdDxJFge72p503oxIQju54fKiAI6mpNah8WX46Jsl6t9ANlOiXAMm24ao48lQNsYF1YHNj3uAJONF/LRzTgjyLqdx8N+iHeVZSjbxButr8ACajKtArSB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784568853; c=relaxed/simple;
	bh=IA4qJ3jziJWvXHXEpJH0hBp5Jn2BPQsR5b3O8nub2rU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rii1B89Lbv2I28Ui52BAOeZwuKVul4/nLhhzX/a1PwIJJjfxP4ymPvZyQvzvRi8ahDGJ/rwa0VXFkEq1n1UzTgqhh8m5uM6mCBUSn2cfPILH1QZgj3b2S5Lwrqxmt/6RhfgojK2Jlxiv35tmTSa125XG94K6RMLNoylvVp6a5gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZSMxLtWd; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZSMxLtWd"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-84a652535dcso3480927b3a.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 20 Jul 2026 10:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784568840; x=1785173640; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3c5exW3/ZWNcrrRMB2dz5lEAeo0oJMzDXuXV4sscBRQ=;
        b=ZSMxLtWdd4rNeBMeyBc9qvvCKZUGOERybawErILHjPDDJgfrmeNk1nm+D5pl9PnBFc
         V/zBZMIZaymRInZ/b8tqQ2O3xiCEJcuFPh8hcxqMXvDT72P8Hc7qfcMEL/qRRO+0ID8h
         J1dhi8Kp/qKJlOwUgZnoGrqH5WmeHvr0dsDUPV+makNGMkALJSpWHOIPvPBt+WEeu7Ak
         h7E0ebwsCFI60whAJfhsUlQRBjCvinKtltVQ/ceUFYx/le2jwLqnlwWdjRyGaSBe6zGR
         +HEXrVQbRHExkZ2Ingv33u6qCD5cRzbLaSDvmtK3r3PZSUvDA3TmnkWdHqrHvDgxZ2ek
         fypw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784568840; x=1785173640;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3c5exW3/ZWNcrrRMB2dz5lEAeo0oJMzDXuXV4sscBRQ=;
        b=d1PC2ky/oUNOQ70t61/shRxc/srUmvHCIDfvx2x90jbfSvS97Zcqw0Rfh9aYOsY/Iq
         UJFD/RkjoOvTc/hv/7qTefr/5SBIxMR0aN3Uxt24P5hsZGtqOmhZdt74Th0OufmriSNr
         QKeG1Cqn+P1dewodZOXVYcjaQM6xG64JLpUvzCdOSLxdXOfbyU9dByEIVGQipczj60Zv
         pV6rsh3Bkj62oL8LyIgvjFjy6rp28AeygHImGMDH4JkdhoWnku+2dc934w8LuyF10e8W
         pP4Frb3s9Ff+l2/hzc8Hc3PDggSNPYvctyA/Tlx8dQDXfiojFq6IePTH1NVcOTiJTkAM
         g0Sw==
X-Forwarded-Encrypted: i=1; AHgh+RrSKrlpwo4xkBtXN4YC4hW2Kb5Rw1+hPu7SkpOXJ3EGHK9rFvSPDpJJ69Kraf1ej6VFJQSK5wOht4cfaNQFYd1z@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6BTQZYx3enMt5/jfJPvCZfqRHfV/21VtdmBv1DtleJQ6bO0Al
	9J9+i94M/MRZHmj85Sq/HGiANRHaZkwiRYMdRM3GbKkXHx2u4RkvzqrsuFZBv15gtYA=
X-Gm-Gg: AfdE7cl9VHWVVFqBcTuWu0/zyaOvxRGt63TFeARqmtL7VxoyiArJRNYf/lkdcFcZOLb
	7jLZnCbnYeKjZQ+07M2vVmsAseTjT08a7rbDNWTKEdjHZCpxoqyLO7XvOHl+Fe9jCBHgR9m9FUJ
	9YkzSopllpCNDj/QycgpWNX7zgMJawLO0szp7d5/pkC2k2gE3IFYJj7gaBX0x638eVBwjWFxLLe
	zvWtX2Ulf1sbhHBK5fxgpCnNM2vd5B0ehrxBGzf0p6KCnra0onJQjUTiGdGxKgsRbE7tgcq89OU
	3LGRlubdD6Z/R/qbBnNJ/AiMEYr116iBVTHeOcpqXMY3gQ1WyDJuO1GC4A9nhENw5XgrEi6K5WL
	VqEt1ciIsAVypZBm1lY/BIufI2LLTeISGe6WKYHvl+AefDTTNpTRDxvUV+WfqUKi1WUXGcbYf79
	ffIfk4
X-Received: by 2002:a05:6a00:3391:b0:841:dca1:8b69 with SMTP id d2e1a72fcca58-84c2923d63amr16490697b3a.5.1784568839837;
        Mon, 20 Jul 2026 10:33:59 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:966a:e23:19e7:951a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2af9af7esm5713606b3a.52.2026.07.20.10.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 10:33:59 -0700 (PDT)
Date: Mon, 20 Jul 2026 11:33:56 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Pan Chuang <panchuang@vivo.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	"open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" <linux-remoteproc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:INGENIC JZ47xx SoCs" <linux-mips@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
	"open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>,
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [PATCH] remoteproc: Remove redundant dev_err()/dev_err_probe()
Message-ID: <al5cBMO91BeFghCz@p14s>
References: <20260717065224.600593-1-panchuang@vivo.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717065224.600593-1-panchuang@vivo.com>

On Fri, Jul 17, 2026 at 02:52:23PM +0800, Pan Chuang wrote:
> Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
> devm_request_*_irq()"), devm_request_irq() and devm_request_threaded_irq()
> automatically log detailed error messages on failure. Remove the
> now-redundant driver-specific dev_err() and dev_err_probe() calls.
> 
> Signed-off-by: Pan Chuang <panchuang@vivo.com>
> ---
>  drivers/remoteproc/da8xx_remoteproc.c    |  2 +-
>  drivers/remoteproc/ingenic_rproc.c       |  4 +---
>  drivers/remoteproc/keystone_remoteproc.c |  4 ++--
>  drivers/remoteproc/mtk_scp.c             |  4 +---
>  drivers/remoteproc/qcom_q6v5.c           | 20 +++++---------------
>  drivers/remoteproc/qcom_sysmon.c         |  2 --
>  drivers/remoteproc/qcom_wcnss.c          |  4 +---
>  drivers/remoteproc/stm32_rproc.c         |  3 +--
>  8 files changed, 12 insertions(+), 31 deletions(-)
>

Applied.

Thanks,
Mathieu
 
> diff --git a/drivers/remoteproc/da8xx_remoteproc.c b/drivers/remoteproc/da8xx_remoteproc.c
> index 23fca7176539..006fa7b56727 100644
> --- a/drivers/remoteproc/da8xx_remoteproc.c
> +++ b/drivers/remoteproc/da8xx_remoteproc.c
> @@ -298,7 +298,7 @@ static int da8xx_rproc_probe(struct platform_device *pdev)
>  					handle_event, 0, "da8xx-remoteproc",
>  					rproc);
>  	if (ret)
> -		return dev_err_probe(dev, ret, "devm_request_threaded_irq error\n");
> +		return ret;
>  
>  	/*
>  	 * rproc_add() can end up enabling the DSP's clk with the DSP
> diff --git a/drivers/remoteproc/ingenic_rproc.c b/drivers/remoteproc/ingenic_rproc.c
> index 1b78d8ddeacf..252519f48964 100644
> --- a/drivers/remoteproc/ingenic_rproc.c
> +++ b/drivers/remoteproc/ingenic_rproc.c
> @@ -219,10 +219,8 @@ static int ingenic_rproc_probe(struct platform_device *pdev)
>  
>  	ret = devm_request_irq(dev, vpu->irq, vpu_interrupt, IRQF_NO_AUTOEN,
>  			       "VPU", rproc);
> -	if (ret < 0) {
> -		dev_err(dev, "Failed to request IRQ\n");
> +	if (ret < 0)
>  		return ret;
> -	}
>  
>  	ret = devm_rproc_add(dev, rproc);
>  	if (ret) {
> diff --git a/drivers/remoteproc/keystone_remoteproc.c b/drivers/remoteproc/keystone_remoteproc.c
> index 83763d640c4e..407d6034f748 100644
> --- a/drivers/remoteproc/keystone_remoteproc.c
> +++ b/drivers/remoteproc/keystone_remoteproc.c
> @@ -411,7 +411,7 @@ static int keystone_rproc_probe(struct platform_device *pdev)
>  	ret = devm_request_irq(dev, ksproc->irq_ring, keystone_rproc_vring_interrupt,
>  			       IRQF_NO_AUTOEN, dev_name(dev), ksproc);
>  	if (ret)
> -		return dev_err_probe(dev, ret, "failed to request vring interrupt\n");
> +		return ret;
>  
>  	ksproc->irq_fault = platform_get_irq_byname(pdev, "exception");
>  	if (ksproc->irq_fault < 0)
> @@ -419,7 +419,7 @@ static int keystone_rproc_probe(struct platform_device *pdev)
>  	ret = devm_request_irq(dev, ksproc->irq_fault, keystone_rproc_exception_interrupt,
>  			       IRQF_NO_AUTOEN, dev_name(dev), ksproc);
>  	if (ret)
> -		return dev_err_probe(dev, ret, "failed to enable exception interrupt\n");
> +		return ret;
>  
>  	ksproc->kick_gpio = devm_gpiod_get(dev, "kick", GPIOD_ASIS);
>  	ret = PTR_ERR_OR_ZERO(ksproc->kick_gpio);
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index 436656bdfa8b..9751acc2bf83 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -1246,10 +1246,8 @@ static struct mtk_scp *scp_rproc_init(struct platform_device *pdev,
>  					scp_irq_handler, IRQF_ONESHOT,
>  					pdev->name, scp);
>  
> -	if (ret) {
> -		dev_err(dev, "failed to request irq\n");
> +	if (ret)
>  		goto remove_subdev;
> -	}
>  
>  	return scp;
>  
> diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
> index 0206a4a19254..1075ef4027b7 100644
> --- a/drivers/remoteproc/qcom_q6v5.c
> +++ b/drivers/remoteproc/qcom_q6v5.c
> @@ -302,10 +302,8 @@ int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
>  					NULL, q6v5_wdog_interrupt,
>  					IRQF_TRIGGER_RISING | IRQF_ONESHOT,
>  					"q6v5 wdog", q6v5);
> -	if (ret) {
> -		dev_err(&pdev->dev, "failed to acquire wdog IRQ\n");
> +	if (ret)
>  		return ret;
> -	}
>  
>  	q6v5->fatal_irq = platform_get_irq_byname(pdev, "fatal");
>  	if (q6v5->fatal_irq < 0)
> @@ -315,10 +313,8 @@ int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
>  					NULL, q6v5_fatal_interrupt,
>  					IRQF_TRIGGER_RISING | IRQF_ONESHOT,
>  					"q6v5 fatal", q6v5);
> -	if (ret) {
> -		dev_err(&pdev->dev, "failed to acquire fatal IRQ\n");
> +	if (ret)
>  		return ret;
> -	}
>  
>  	q6v5->ready_irq = platform_get_irq_byname(pdev, "ready");
>  	if (q6v5->ready_irq < 0)
> @@ -328,10 +324,8 @@ int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
>  					NULL, q6v5_ready_interrupt,
>  					IRQF_TRIGGER_RISING | IRQF_ONESHOT,
>  					"q6v5 ready", q6v5);
> -	if (ret) {
> -		dev_err(&pdev->dev, "failed to acquire ready IRQ\n");
> +	if (ret)
>  		return ret;
> -	}
>  
>  	q6v5->handover_irq = platform_get_irq_byname(pdev, "handover");
>  	if (q6v5->handover_irq < 0)
> @@ -342,10 +336,8 @@ int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
>  					IRQF_TRIGGER_RISING | IRQF_ONESHOT |
>  					IRQF_NO_AUTOEN,
>  					"q6v5 handover", q6v5);
> -	if (ret) {
> -		dev_err(&pdev->dev, "failed to acquire handover IRQ\n");
> +	if (ret)
>  		return ret;
> -	}
>  
>  	q6v5->stop_irq = platform_get_irq_byname(pdev, "stop-ack");
>  	if (q6v5->stop_irq < 0)
> @@ -355,10 +347,8 @@ int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
>  					NULL, q6v5_stop_interrupt,
>  					IRQF_TRIGGER_RISING | IRQF_ONESHOT,
>  					"q6v5 stop", q6v5);
> -	if (ret) {
> -		dev_err(&pdev->dev, "failed to acquire stop-ack IRQ\n");
> +	if (ret)
>  		return ret;
> -	}
>  
>  	q6v5->state = devm_qcom_smem_state_get(&pdev->dev, "stop", &q6v5->stop_bit);
>  	if (IS_ERR(q6v5->state)) {
> diff --git a/drivers/remoteproc/qcom_sysmon.c b/drivers/remoteproc/qcom_sysmon.c
> index a0830a48b1f4..61e1038328e8 100644
> --- a/drivers/remoteproc/qcom_sysmon.c
> +++ b/drivers/remoteproc/qcom_sysmon.c
> @@ -662,8 +662,6 @@ struct qcom_sysmon *qcom_add_sysmon_subdev(struct rproc *rproc,
>  						IRQF_TRIGGER_RISING | IRQF_ONESHOT,
>  						"q6v5 shutdown-ack", sysmon);
>  		if (ret) {
> -			dev_err(sysmon->dev,
> -				"failed to acquire shutdown-ack IRQ\n");
>  			kfree(sysmon);
>  			return ERR_PTR(ret);
>  		}
> diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
> index 3392c9380202..e9a00efe97f6 100644
> --- a/drivers/remoteproc/qcom_wcnss.c
> +++ b/drivers/remoteproc/qcom_wcnss.c
> @@ -521,10 +521,8 @@ static int wcnss_request_irq(struct qcom_wcnss *wcnss,
>  					NULL, thread_fn,
>  					IRQF_TRIGGER_RISING | IRQF_ONESHOT,
>  					"wcnss", wcnss);
> -	if (ret) {
> -		dev_err(&pdev->dev, "request %s IRQ failed\n", name);
> +	if (ret)
>  		return ret;
> -	}
>  
>  	/* Return the IRQ number if the IRQ was successfully acquired */
>  	return irq_number;
> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index 0e5d64fbe52c..1fe4cdc0a13a 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -682,8 +682,7 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev,
>  		err = devm_request_irq(dev, irq, stm32_rproc_wdg, 0,
>  				       dev_name(dev), pdev);
>  		if (err)
> -			return dev_err_probe(dev, err,
> -					     "failed to request wdg irq\n");
> +			return err;
>  
>  		ddata->wdg_irq = irq;
>  
> -- 
> 2.34.1
> 
