Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6121B5819
	for <linux-remoteproc@vger.kernel.org>; Wed, 14 Aug 2024 15:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723650847; cv=none; b=ZrpvQ9cnOSdKJLG/WD0nbsDYShCmvcCPeaiveauLgFLgw2ls9k92UscsvV3Owg5a6Plwn0bd3Eikbc3AY6KW1cUuGYo0sPgqBeS0LWMv/iJWkVbjv7TjNyLIg+KJPwIrtoH6eHVBxXngbjKA8VezorMZ9RVOFycfUD3dShaqmOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723650847; c=relaxed/simple;
	bh=OKLLoXaGWdTiIePoKItpfGDt4N/SOQW07ycov0HJBSY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ub+q1guiNw7kydWb1dijn4/G/t2sulST3tP/LBhVewelLrKu1vS6f4YTruH0pfzCPxnUpm2S7TFT32qguQOm6i89ZlmL22WPO0R4SJ02ibL7v0rkhG8Xn1GXShnQFWpF8Wrg9HhX/DqeYuXSbVo3sCmwuSse7WN9ofpN7W6uasg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TXrhVxDZ; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TXrhVxDZ"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-656d8b346d2so44578a12.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 14 Aug 2024 08:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723650845; x=1724255645; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y47RbXS2cxNB5+BpZPdXXp9JA6H+++LjJxoIhLy87Bg=;
        b=TXrhVxDZ18ca+Zr2T3ad4JCxi1+RtU+9EDnF1tFhm2qI6v+kThvBZdTXK6q8xR7G9X
         ufOEi8JFl3sqJBN5MKcsp/vw6Nj7zegsbv+3XovnhMFlpQrPD+D60DvBBJdx5MlldTxI
         5Z5TrpGqJVZMCgDeKEBt4UJADUsDZauMdtwc2vWiZO9WDaDkAX994C2dwLiC3JpGiHjX
         /O//cJBuSXgI+3AcHF+1tQhNTEjdwhtexWLxVHe3559EGHtWXruYdmaBeJm2RjvuZJLF
         3eonWKbykMuhisDoZti/7pXXk+riL+8x4wH5AgWzd9BbtJVpgzsg/gOCTsm8RxHVU5mz
         GfDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723650845; x=1724255645;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y47RbXS2cxNB5+BpZPdXXp9JA6H+++LjJxoIhLy87Bg=;
        b=YM7HygP14nE8t4xeF1+/ZN8rURw3P6smmc6Z9cOLMnNufYchcGp6jfZZI8X2KeqTuo
         b/hiDNJAVRX8p0Jj/FoiA7XX134VpjbiBKH2Y246J1Z6qVffv+EYVwJ7bJPGvzE6FgSG
         wIlEDlHpgFSmocAD8Sks7Cd+GWrudSK7V/t6aUX7jmauGaztaV+33zi7ee0LWM37wQbx
         j+yc90zQ46ohu9kZIIUlzy1qC9Ac6oSe7sLOTyrYTVZ5ec4T1hcnKI6sOCE23nIQxyrk
         BiGlb3rpdTZW5ssY0/Tf7niISilXAop0MTI/0skAHhCLfEV0vwK/hZoLA5VP5cRym34z
         HxJw==
X-Forwarded-Encrypted: i=1; AJvYcCUcxbFYOU9ZV5r+FWjZ0ZVuPqC0JzOqGyDGlqTZHV71XVn/PRA0l+xVptGEmPwezc2FJcOVc6ZwTgx9imgUt7f6/MrJTxADoj/q/N7mkw5Wdw==
X-Gm-Message-State: AOJu0YzR24EADILRJnhrcL1e/ip7eaGzydMYUqguwrRMAiYhqBXyk6Pf
	tQsmN2c+JzcFEeCgtM9nbhOnCFWF198PZ6GAz4fQ6pP0keo2c4UFGQry+s1nsIo=
X-Google-Smtp-Source: AGHT+IGOnvgZ9Kb603v7ZA4QDyTjY4H8Fqu/f18jmkX7xABasU7co35c7nr2HGXdMzGA1OyGJB5TMw==
X-Received: by 2002:a05:6a20:c90d:b0:1c3:b267:4261 with SMTP id adf61e73a8af0-1c8eae6ce37mr3765146637.12.1723650845402;
        Wed, 14 Aug 2024 08:54:05 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:58b0:43ab:ed9f:f0e3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7126c9ca119sm1233555b3a.209.2024.08.14.08.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 08:53:59 -0700 (PDT)
Date: Wed, 14 Aug 2024 09:53:57 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Beleswar Padhi <b-padhi@ti.com>
Cc: andersson@kernel.org, afd@ti.com, hnagalla@ti.com, u-kumar1@ti.com,
	s-anna@ti.com, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/3] remoteproc: k3-dsp: Acquire mailbox handle during
 probe routine
Message-ID: <ZrzTFZeh7WDPQZJF@p14s>
References: <20240808074127.2688131-1-b-padhi@ti.com>
 <20240808074127.2688131-4-b-padhi@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240808074127.2688131-4-b-padhi@ti.com>

On Thu, Aug 08, 2024 at 01:11:27PM +0530, Beleswar Padhi wrote:
> Acquire the mailbox handle during device probe and do not release handle
> in stop/detach routine or error paths. This removes the redundant
> requests for mbox handle later during rproc start/attach. This also
> allows to defer remoteproc driver's probe if mailbox is not probed yet.
> 
> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> Acked-by: Andrew Davis <afd@ti.com>
> ---
>  drivers/remoteproc/ti_k3_dsp_remoteproc.c | 80 +++++++++--------------
>  1 file changed, 30 insertions(+), 50 deletions(-)
> 
> diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> index a22d41689a7d..9009367e2891 100644
> --- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> +++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> @@ -115,6 +115,10 @@ static void k3_dsp_rproc_mbox_callback(struct mbox_client *client, void *data)
>  	const char *name = kproc->rproc->name;
>  	u32 msg = omap_mbox_message(data);
>  
> +	/* Do not forward messages from a detached core */
> +	if (kproc->rproc->state == RPROC_DETACHED)
> +		return;
> +
>  	dev_dbg(dev, "mbox msg: 0x%x\n", msg);
>  
>  	switch (msg) {
> @@ -155,6 +159,10 @@ static void k3_dsp_rproc_kick(struct rproc *rproc, int vqid)
>  	mbox_msg_t msg = (mbox_msg_t)vqid;
>  	int ret;
>  
> +	/* Do not forward messages to a detached core */
> +	if (kproc->rproc->state == RPROC_DETACHED)
> +		return;
> +
>  	/* send the index of the triggered virtqueue in the mailbox payload */
>  	ret = mbox_send_message(kproc->mbox, (void *)msg);
>  	if (ret < 0)
> @@ -230,12 +238,9 @@ static int k3_dsp_rproc_request_mbox(struct rproc *rproc)
>  	client->knows_txdone = false;
>  
>  	kproc->mbox = mbox_request_channel(client, 0);
> -	if (IS_ERR(kproc->mbox)) {
> -		ret = -EBUSY;
> -		dev_err(dev, "mbox_request_channel failed: %ld\n",
> -			PTR_ERR(kproc->mbox));
> -		return ret;
> -	}
> +	if (IS_ERR(kproc->mbox))
> +		return dev_err_probe(dev, PTR_ERR(kproc->mbox),
> +				     "mbox_request_channel failed\n");
>  
>  	/*
>  	 * Ping the remote processor, this is only for sanity-sake for now;
> @@ -315,32 +320,23 @@ static int k3_dsp_rproc_start(struct rproc *rproc)
>  	u32 boot_addr;
>  	int ret;
>  
> -	ret = k3_dsp_rproc_request_mbox(rproc);
> -	if (ret)
> -		return ret;
> -
>  	boot_addr = rproc->bootaddr;
>  	if (boot_addr & (kproc->data->boot_align_addr - 1)) {
>  		dev_err(dev, "invalid boot address 0x%x, must be aligned on a 0x%x boundary\n",
>  			boot_addr, kproc->data->boot_align_addr);
> -		ret = -EINVAL;
> -		goto put_mbox;
> +		return -EINVAL;
>  	}
>  
>  	dev_dbg(dev, "booting DSP core using boot addr = 0x%x\n", boot_addr);
>  	ret = ti_sci_proc_set_config(kproc->tsp, boot_addr, 0, 0);
>  	if (ret)
> -		goto put_mbox;
> +		return ret;
>  
>  	ret = k3_dsp_rproc_release(kproc);
>  	if (ret)
> -		goto put_mbox;
> +		return ret;
>  
>  	return 0;
> -
> -put_mbox:
> -	mbox_free_channel(kproc->mbox);
> -	return ret;
>  }
>  
>  /*
> @@ -353,8 +349,6 @@ static int k3_dsp_rproc_stop(struct rproc *rproc)
>  {
>  	struct k3_dsp_rproc *kproc = rproc->priv;
>  
> -	mbox_free_channel(kproc->mbox);
> -
>  	k3_dsp_rproc_reset(kproc);
>  
>  	return 0;
> @@ -363,42 +357,22 @@ static int k3_dsp_rproc_stop(struct rproc *rproc)
>  /*
>   * Attach to a running DSP remote processor (IPC-only mode)
>   *
> - * This rproc attach callback only needs to request the mailbox, the remote
> - * processor is already booted, so there is no need to issue any TI-SCI
> - * commands to boot the DSP core. This callback is invoked only in IPC-only
> - * mode.
> + * This rproc attach callback is a NOP. The remote processor is already booted,
> + * and all required resources have been acquired during probe routine, so there
> + * is no need to issue any TI-SCI commands to boot the DSP core. This callback
> + * is invoked only in IPC-only mode and exists because rproc_validate() checks
> + * for its existence.
>   */
> -static int k3_dsp_rproc_attach(struct rproc *rproc)
> -{
> -	struct k3_dsp_rproc *kproc = rproc->priv;
> -	struct device *dev = kproc->dev;
> -	int ret;
> -
> -	ret = k3_dsp_rproc_request_mbox(rproc);
> -	if (ret)
> -		return ret;
> -
> -	dev_info(dev, "DSP initialized in IPC-only mode\n");
> -	return 0;
> -}
> +static int k3_dsp_rproc_attach(struct rproc *rproc) { return 0; }
>  
>  /*
>   * Detach from a running DSP remote processor (IPC-only mode)
>   *
> - * This rproc detach callback performs the opposite operation to attach callback
> - * and only needs to release the mailbox, the DSP core is not stopped and will
> - * be left to continue to run its booted firmware. This callback is invoked only
> - * in IPC-only mode.
> + * This rproc detach callback is a NOP. The DSP core is not stopped and will be
> + * left to continue to run its booted firmware. This callback is invoked only in
> + * IPC-only mode and exists for sanity sake.
>   */
> -static int k3_dsp_rproc_detach(struct rproc *rproc)
> -{
> -	struct k3_dsp_rproc *kproc = rproc->priv;
> -	struct device *dev = kproc->dev;
> -
> -	mbox_free_channel(kproc->mbox);
> -	dev_info(dev, "DSP deinitialized in IPC-only mode\n");
> -	return 0;
> -}
> +static int k3_dsp_rproc_detach(struct rproc *rproc) { return 0; }

Same comment as the previous patch.

Thanks,
Mathieu

>  
>  /*
>   * This function implements the .get_loaded_rsc_table() callback and is used
> @@ -697,6 +671,10 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
>  	kproc->dev = dev;
>  	kproc->data = data;
>  
> +	ret = k3_dsp_rproc_request_mbox(rproc);
> +	if (ret)
> +		return ret;
> +
>  	kproc->ti_sci = devm_ti_sci_get_by_phandle(dev, "ti,sci");
>  	if (IS_ERR(kproc->ti_sci))
>  		return dev_err_probe(dev, PTR_ERR(kproc->ti_sci),
> @@ -789,6 +767,8 @@ static void k3_dsp_rproc_remove(struct platform_device *pdev)
>  		if (ret)
>  			dev_err(dev, "failed to detach proc (%pe)\n", ERR_PTR(ret));
>  	}
> +
> +	mbox_free_channel(kproc->mbox);
>  }
>  
>  static const struct k3_dsp_mem_data c66_mems[] = {
> -- 
> 2.34.1
> 
