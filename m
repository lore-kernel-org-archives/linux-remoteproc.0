Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92412E11C7
	for <linux-remoteproc@vger.kernel.org>; Fri, 21 Nov 2025 15:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763739438; cv=none; b=vDQe09SqtiaG2YjrakgJk1bW/T5F6atjEUGyE1X7GYX+qeNLQu8LXH0RecKeoHzdf8m94GEcjXuGPiGkabgbcH8sfasc6wrfE70mUMDoFI5HvwraFKwyLebQczUY6bbOjCPH2C3zeDXvvN7RUon8T9EHa0jwgtxEJ7DYf9FPrFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763739438; c=relaxed/simple;
	bh=9SEYQ6o3otkAfW+rZ8gGxm5y9lr5TZX3GX9hh60Fq54=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O9V5WSSXyDdEPHMICSSFZY8RsD91xqu5hOJuI3DrlNO6zp1Hhrfzy/bW3DAvMiN9HKLSilHlrkxLaIWWLsSwsOn4DCChfL/95tnqlB3JmuD66Mc+FkGlditv8CIQva4s6DTGrf5X3ApLOh+rs8XIY/+txN6I7MAQQ/EoJgItC2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dihh+YYZ; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dihh+YYZ"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7ba92341f83so3037214b3a.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 21 Nov 2025 07:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763739434; x=1764344234; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wn1kSEu9OwZ97Yg1s+a7dWNpqwCIOmyY5CJUhlq1Tr8=;
        b=dihh+YYZkSJnkgAmmAONoQ9feKxp3fbL3JtWqaX6ZNBMX6baBGynrm0x39UrRrrs3W
         sSpyDF3wAQGKWzAgr8M05L2pk466rbBQSPcIFNJ0wCBMVbz7fAb0dH65Ibb0vRWt+kUn
         RlK7N7VexdFt4DvjS6+7VKho6Ryot88uc3iNXqdU3a1+VkXMYrGBA3H85Z+XSwIUG3N3
         IxXV41nIhzcaYHTu0g1jk4Lp0V4QQ7PNBTY90mRnjLswysOEtT3IZd1rOmtVTw0juf4P
         o6n2/fvZrMvEbp5Nb13KG9Ak7wWfi1W5v1WBboK51UwUuRiHTfSrItatxeZLnKGQqdN5
         4Vcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763739434; x=1764344234;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wn1kSEu9OwZ97Yg1s+a7dWNpqwCIOmyY5CJUhlq1Tr8=;
        b=eihh3TRL93zz8sVMb9+tC7amnc5zuqxUxWrMNRETOmHL6EEGkHamtztsA/nd4v6aYc
         XtyiYsAyylFQdIZm8eYkl06PDJLS6Y8ysPfa3AhzjQ+9LJTWMZ8vqorK/nvVIkYOZ4XP
         JMsu+WEMj6OMlAtgwJQ3d80wMjv0X0t4NdEOusowX2QxtbEcJCHPRzJLZgYeChEEWfpj
         1gLPpXibvnusi824MSN9zRKNeJ/NzD/Y3PiPlY2d6oisIZh7OINfRE9ldZ7xcSJEWxBJ
         EvyqafToHE9gLQnuttzTui8lrTX14tRgesNFSGl/LgcTKOPccJKOykHW82hBS+yIKhtO
         Xymg==
X-Forwarded-Encrypted: i=1; AJvYcCXplnrdBNUQsbMNqXuSNjhClzochtHZq3bznbyyDqISVZVsTx9DrW1kOiZnWMtu5SPNH78RrkpjQlMFAAl0QqWp@vger.kernel.org
X-Gm-Message-State: AOJu0YxXw71oUPGmzUr4K7we+4UvHZWOEwBVMG+hCvCFapyYIYnkGSKz
	1e1o5OhiaIx0R9+WnETDbGsZYRVrSLaf62FORFZB6XdH3Bj3hKDBhlU7Y6KmWOWoqrc=
X-Gm-Gg: ASbGncs6rQIlUx74bdpn6wHk43A7nEwi2koqFZjbkiz8J3NNziVVqUOvnaBNjNWmA65
	ri0yJt9T7PtdZPtJtqjFM9ePC2d4QJ1aTnhX7PJTQlhTs2u6doIRepCDBVXEwsc+9pWoKC+ROet
	/3l2BLUvo9BZn3XfxRl6yjTdH7eTQ5kTZw4SHEF3zqpyypeS/+pit49XfY1+BcojBH69AUh5kGR
	u1vJxZ3dKYdfd2s+vvpEIhMTRdHUVm9C8sXs2f+jzO17vqvTOS2DNQipze2aQnhrQDsbpxsXyj1
	bNRaX7GqEfa+1tBz5nY4PvGOqOjIymXY6bqjPE7mJ1k6/FjqrnvAOjg4GctqGTLS3sURpntKlXi
	ZRlsf/JTr6xAdnGor3LwsSuNUvqIg5QA6rXYMPtPcTxxmb0mBczKc2vLLKLuceyWD2BhJXelOk+
	nbFQdPxKm0O6b9Zw==
X-Google-Smtp-Source: AGHT+IHf0JXGqxWOmSObNRkoxYuE/072gCT9gskWkAHGDfr+qbbCbb7muBRs8XMkmwuAj5teff3rew==
X-Received: by 2002:a05:6a20:728b:b0:358:dc7d:a2be with SMTP id adf61e73a8af0-3614ebab4admr3929217637.17.1763739433864;
        Fri, 21 Nov 2025 07:37:13 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:4d45:74bb:af4e:251c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3f024b7d2sm6326077b3a.40.2025.11.21.07.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 07:37:13 -0800 (PST)
Date: Fri, 21 Nov 2025 08:37:10 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] remoteproc: xlnx: add crash detection mechanism
Message-ID: <aSCHJvtEwYWb6Ie0@p14s>
References: <20251113154403.2454319-1-tanmay.shah@amd.com>
 <20251113154403.2454319-4-tanmay.shah@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251113154403.2454319-4-tanmay.shah@amd.com>

On Thu, Nov 13, 2025 at 07:44:04AM -0800, Tanmay Shah wrote:
> Remote processor will report the crash reason via the resource table
> and notify the host via kick. The host checks this crash reason on
> every kick notification from the remote and report to the core
> framework. Then the rproc core framework will start the recovery
> process.

Please substitute the word "kick" for "mailbox notification".  I also have to
assume "core framework" and "rproc core framework" are the same.  Pick one and
stick with it.

> 
> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> ---
> 
> Changes in v2:
>   - clear attach recovery boot flag during detach and stop ops
> 
>  drivers/remoteproc/xlnx_r5_remoteproc.c | 56 +++++++++++++++++++++++++
>  1 file changed, 56 insertions(+)
> 
> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
> index 8677b732ad14..5d04e8c0dc52 100644
> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> @@ -108,6 +108,10 @@ struct rsc_tbl_data {
>  	const uintptr_t rsc_tbl;
>  } __packed;
>  
> +enum fw_vendor_rsc {
> +	FW_RSC_VENDOR_CRASH_REASON = RSC_VENDOR_START,
> +};
> +
>  /*
>   * Hardcoded TCM bank values. This will stay in driver to maintain backward
>   * compatibility with device-tree that does not have TCM information.
> @@ -127,9 +131,21 @@ static const struct mem_bank_data zynqmp_tcm_banks_lockstep[] = {
>  	{0xffe30000UL, 0x30000, 0x10000UL, PD_R5_1_BTCM, "btcm1"},
>  };
>  
> +/**
> + * struct xlnx_rproc_crash_report - resource to know crash status and reason
> + *
> + * @crash_state: if true, the rproc is notifying crash, time to recover
> + * @crash_reason: reason of crash
> + */
> +struct xlnx_rproc_crash_report {
> +	u32 crash_state;
> +	u32 crash_reason;
> +} __packed;
> +
>  /**
>   * struct zynqmp_r5_core - remoteproc core's internal data
>   *
> + * @crash_report: rproc crash state and reason
>   * @rsc_tbl_va: resource table virtual address
>   * @sram: Array of sram memories assigned to this core
>   * @num_sram: number of sram for this core
> @@ -143,6 +159,7 @@ static const struct mem_bank_data zynqmp_tcm_banks_lockstep[] = {
>   * @ipi: pointer to mailbox information
>   */
>  struct zynqmp_r5_core {
> +	struct xlnx_rproc_crash_report *crash_report;
>  	void __iomem *rsc_tbl_va;
>  	struct zynqmp_sram_bank *sram;
>  	int num_sram;
> @@ -227,10 +244,14 @@ static void handle_event_notified(struct work_struct *work)
>  static void zynqmp_r5_mb_rx_cb(struct mbox_client *cl, void *msg)
>  {
>  	struct zynqmp_ipi_message *ipi_msg, *buf_msg;
> +	struct zynqmp_r5_core *r5_core;
> +	struct rproc *rproc;
>  	struct mbox_info *ipi;
>  	size_t len;
>  
>  	ipi = container_of(cl, struct mbox_info, mbox_cl);
> +	r5_core = ipi->r5_core;
> +	rproc = r5_core->rproc;
>  
>  	/* copy data from ipi buffer to r5_core */
>  	ipi_msg = (struct zynqmp_ipi_message *)msg;
> @@ -244,6 +265,13 @@ static void zynqmp_r5_mb_rx_cb(struct mbox_client *cl, void *msg)
>  	buf_msg->len = len;
>  	memcpy(buf_msg->data, ipi_msg->data, len);
>  
> +	/* Check for crash only if rproc crash is expected */
> +	if (rproc->state == RPROC_ATTACHED || rproc->state == RPROC_RUNNING) {
> +		if (r5_core->crash_report->crash_state)
> +			rproc_report_crash(rproc,
> +					   r5_core->crash_report->crash_reason);

At this stage ->crash_state indicates that a crash occured, but how is it reset
once the crash has been handle?  How do we make sure the next mailbox
notification won't trigger another crash report?

> +	}
> +
>  	/* received and processed interrupt ack */
>  	if (mbox_send_message(ipi->rx_chan, NULL) < 0)
>  		dev_err(cl->dev, "ack failed to mbox rx_chan\n");
> @@ -397,6 +425,7 @@ static int zynqmp_r5_rproc_start(struct rproc *rproc)
>  	if (ret)
>  		dev_err(r5_core->dev,
>  			"failed to start RPU = 0x%x\n", r5_core->pm_domain_id);
> +

Spurious change

>  	return ret;
>  }
>  
> @@ -438,6 +467,8 @@ static int zynqmp_r5_rproc_stop(struct rproc *rproc)
>  	if (ret)
>  		dev_err(r5_core->dev, "core force power down failed\n");
>  
> +	test_and_clear_bit(RPROC_FEAT_ATTACH_ON_RECOVERY, rproc->features);
> +
>  	return ret;
>  }
>  
> @@ -874,6 +905,8 @@ static int zynqmp_r5_get_rsc_table_va(struct zynqmp_r5_core *r5_core)
>  
>  static int zynqmp_r5_attach(struct rproc *rproc)
>  {
> +	rproc_set_feature(rproc, RPROC_FEAT_ATTACH_ON_RECOVERY);
> +

Why can't this be set in probe() and left alone from thereon?

>  	dev_dbg(&rproc->dev, "rproc %d attached\n", rproc->index);
>  
>  	return 0;
> @@ -888,6 +921,8 @@ static int zynqmp_r5_detach(struct rproc *rproc)
>  	 */
>  	zynqmp_r5_rproc_kick(rproc, 0);
>  
> +	clear_bit(RPROC_FEAT_ATTACH_ON_RECOVERY, rproc->features);
> +

I'm not sure why this needs to be done, same comment for zynqmp_r5_rproc_stop().

>  	return 0;
>  }
>  
> @@ -896,6 +931,26 @@ static void zynqmp_r5_coredump(struct rproc *rproc)
>  	(void)rproc;
>  }
>  
> +static int zynqmp_r5_handle_crash_rsc(struct rproc *rproc, void *rsc,
> +				      int offset, int avail)
> +{
> +	struct zynqmp_r5_core *r5_core = rproc->priv;
> +
> +	r5_core->crash_report =
> +		(struct xlnx_rproc_crash_report *)(r5_core->rsc_tbl_va + offset);
> +

This function is so simple that I would fold it in zynqmp_r5_handle_rsc() below.

Thanks,
Mathieu

> +	return RSC_HANDLED;
> +}
> +
> +static int zynqmp_r5_handle_rsc(struct rproc *rproc, u32 rsc_type, void *rsc,
> +				int offset, int avail)
> +{
> +	if (rsc_type == FW_RSC_VENDOR_CRASH_REASON)
> +		return zynqmp_r5_handle_crash_rsc(rproc, rsc, offset, avail);
> +
> +	return RSC_IGNORED;
> +}
> +
>  static const struct rproc_ops zynqmp_r5_rproc_ops = {
>  	.prepare	= zynqmp_r5_rproc_prepare,
>  	.unprepare	= zynqmp_r5_rproc_unprepare,
> @@ -911,6 +966,7 @@ static const struct rproc_ops zynqmp_r5_rproc_ops = {
>  	.attach		= zynqmp_r5_attach,
>  	.detach		= zynqmp_r5_detach,
>  	.coredump	= zynqmp_r5_coredump,
> +	.handle_rsc	= zynqmp_r5_handle_rsc,
>  };
>  
>  /**
> -- 
> 2.34.1
> 
