Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D890426F2B2
	for <linux-remoteproc@vger.kernel.org>; Wed, 20 Aug 2025 19:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755719782; cv=none; b=d38DlYNdih4f+mKV2h/OCphX7QHpVzMENXjgpSBoRqqmFIXJ6mCeDuXi5J6a/1zZ31pNpkm1h3L0he9t1NIKneHyhAtPvpYgyHl/atwGBkpVoYL9+N6+n7vwesBt8TzeJiM5Ad4w7cb5RZciJ7nRhkpSYZ4pAUY469IsV97ZJN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755719782; c=relaxed/simple;
	bh=JKFx7dG73dWwgzgE54wVU60OobxbiMDnyR+qsSG+jpU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H9PkBnA/COoQjK1xRPXc2/H00NwMG6YU+Nzw2J+6+rj9gFw4jC42O+g+eeM6PK52OI+1/Xe0ZNUl1gkMQZ29K67OGLNavzDcs+5uOqtV1Kn9CFJ0Y9Icd38zt8RCyl0qNgaSCMdT9ji75Nyl5+XhrXhic7/resn+NOuKnRiSScU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vTgD0L/K; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vTgD0L/K"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b471737b347so140001a12.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 20 Aug 2025 12:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755719780; x=1756324580; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ktglgwpYXxtvm/5NhCfS+CAvyyI+5EGT6SfLe6CPLiw=;
        b=vTgD0L/K0Eq827VMs8mMk5OnfRj9VMVBM9Nqm6i7avZ4AuIWZ06keuWDDoyDH7ErfX
         TtsXTBjCLI6IcQAk8eS//s0d1EYtLV+JyocFxED+a5OVKgw6jdOXoi3zNjTwDJwCYXWK
         bU8O3dLSBkGTdpz+ClaPSJx9OyB7uRScg0sIY/zRHcgUoC/Z0qtkuloboAnmgFM5KD82
         a7QjOtn7f3IqKfH4jalRsBbvFIzdytACeP5SNgAC5LZGKYQLtbPQ3XvPcxH6f5f5ai/k
         KQ9UGmw5qPoxVBH6U1Wk8hxFa3HvmPocSV5aJzsZBnAGgydw5kLhJMNfAA7q53rNUhDu
         U9rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755719780; x=1756324580;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ktglgwpYXxtvm/5NhCfS+CAvyyI+5EGT6SfLe6CPLiw=;
        b=OD8k2UwX6gAOzgn98QiHSAofyMAgtl8XEHRFZrv7mE7rMy6hmIux/0vmO0ApAa27C8
         h9cCnNNF60LzlVMAZnlbcJnbYoirAKVUE7uMTliwNXRo86famjm5rTuRxyspQIXSQeZ9
         xsXLF4RFaZN85JanKxhTHafF5XR3IqGLgTFdHuop1X5mJGNuYxelUWsyyuLpA3HXoesY
         NXekYAvUlH9PKL0DuKjvydrjRR9uVSnDSDLAyF0mr64vp26W/v1cG7z03F4xGDua5eJT
         z0vAaxDkB/wsVGp4eI9LNytc5HeRnc7Tr7Op1tUdXgE2JcGVaMpsPIG/v1qSDdobRNv/
         Zvzg==
X-Forwarded-Encrypted: i=1; AJvYcCU4V0bN+uJcGxvZ6vzjpyE/IFw3g/aOWegO1a5CwL2b75l8dYD/yqKiyiNaUeAQwPpC4xgN8NMgFkPv5sJwPfOv@vger.kernel.org
X-Gm-Message-State: AOJu0YzQSuU2OWqLjvNa0X4+tk62EJrEGW7XI5PopP/niZgwN2n63mJQ
	FMGQsQ9Zb/QXgBkPIDU6hUyD+jzpPmPcirIZuR/sKGn5w2/w85fCT0VAGSOC7BG9SVQ=
X-Gm-Gg: ASbGncv/dcmSmidiEDhVAd5OCyFEb0yMgFLHRYleGwDyKoZFAUSJA0bu/kAbQXRj76+
	aqxiSOjuhzZOFcORmPMrVJdzsd2Z1FoFTOvKl1JamVxKSVlypaK7HAp4a6E8rNZzKI+rKPHEh/u
	gtFoWgyyQ+ztm1eilg/juNVGzd5EQnarlHlo14C1+xujikdQjoNqIhkA6MHhsJ6Mmvrmkk191gk
	G7VzNgChMl9jcbM6qwROC9BSbLbTCgdKenVj81g2rez6BIY5NoSy2P02pfJksILp1WM4sXaBJwg
	YvjQf7xLSYj+XnSFNkOFvoMdKeSQHNW+r9Mt6MNobP6JFbo3d4r58KWZlRNtyNU/S3Qo5ohM5py
	Ryy0FBMtVuK4jxiCswPynEZYvRw==
X-Google-Smtp-Source: AGHT+IE3GayEZrxMbfewQ2UCpBN/LwZ37KggyygIZMcR3e6q5d8IrJ1ER/jvr3e/ecjH7rpB99UwQg==
X-Received: by 2002:a17:902:f54c:b0:240:2145:e526 with SMTP id d9443c01a7336-245febe145bmr165575ad.6.1755719779986;
        Wed, 20 Aug 2025 12:56:19 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:ed3c:56fb:c00a:205e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed51a40fsm34318635ad.141.2025.08.20.12.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 12:56:19 -0700 (PDT)
Date: Wed, 20 Aug 2025 13:56:17 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Hiago De Franco <hiagofranco@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Andrew Davis <afd@ti.com>,
	Beleswar Prasad Padhi <b-padhi@ti.com>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: Re: [PATCH] remoteproc: ti_k3_common: remove remote processor
 mailbox ping
Message-ID: <aKYoYYMyzaGoW-al@p14s>
References: <20250806-v1-fix-am62-hmp-suspend-v1-1-1c4a81bb5dde@toradex.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250806-v1-fix-am62-hmp-suspend-v1-1-1c4a81bb5dde@toradex.com>

On Wed, Aug 06, 2025 at 02:48:17PM -0300, Hiago De Franco wrote:
> From: Hiago De Franco <hiago.franco@toradex.com>
> 
> As of today, pinging the remote processor during k3_rproc_request_mbox()
> does not have any functional effect. This behavior was originally based on
> the OMAP remoteproc driver, where the idea was to send messages such as
> suspend requests (among others) to the remote processor, but this was
> never upstreamed.
> 
> Currently, the ping message has no effect in upstream usage and causes an
> unread message to remain in the mailbox, which ultimately prevents the
> system from entering suspend mode:
> 
> Freezing remaining freezable tasks completed (elapsed 0.001 seconds)
> printk: Suspending console(s) (use no_console_suspend to debug)
> omap-mailbox 29000000.mailbox: fifo 1 has unexpected unread messages
> omap-mailbox 29000000.mailbox: PM: dpm_run_callback(): platform_pm_suspend returns -16
> omap-mailbox 29000000.mailbox: PM: failed to suspend: error -16
> 
> The ping is only replied if the remote core firmware is capable of doing
> it, otherwise the unread message stays into the mailbox.
> 
> Remove the ping and fix the suspend issue.
> 
> Suggested-by: Andrew Davis <afd@ti.com>
> Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> ---
> Hi,
> 
> this is the result patch of the discussion from
> 
> https://lore.kernel.org/lkml/20250725150713.barg5lhqr4reoxv3@hiagonb/
> ---
>  drivers/remoteproc/ti_k3_common.c | 15 ---------------
>  1 file changed, 15 deletions(-)
>

Applied - thanks,
Mathieu
 
> diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
> index d4f20900f33bdd92a59c62d0a7b166c4ad66ed16..8266e11914af87ac38977763099521dee4334348 100644
> --- a/drivers/remoteproc/ti_k3_common.c
> +++ b/drivers/remoteproc/ti_k3_common.c
> @@ -160,7 +160,6 @@ int k3_rproc_request_mbox(struct rproc *rproc)
>  	struct k3_rproc *kproc = rproc->priv;
>  	struct mbox_client *client = &kproc->client;
>  	struct device *dev = kproc->dev;
> -	int ret;
>  
>  	client->dev = dev;
>  	client->tx_done = NULL;
> @@ -173,20 +172,6 @@ int k3_rproc_request_mbox(struct rproc *rproc)
>  		return dev_err_probe(dev, PTR_ERR(kproc->mbox),
>  				     "mbox_request_channel failed\n");
>  
> -	/*
> -	 * Ping the remote processor, this is only for sanity-sake for now;
> -	 * there is no functional effect whatsoever.
> -	 *
> -	 * Note that the reply will _not_ arrive immediately: this message
> -	 * will wait in the mailbox fifo until the remote processor is booted.
> -	 */
> -	ret = mbox_send_message(kproc->mbox, (void *)RP_MBOX_ECHO_REQUEST);
> -	if (ret < 0) {
> -		dev_err(dev, "mbox_send_message failed (%pe)\n", ERR_PTR(ret));
> -		mbox_free_channel(kproc->mbox);
> -		return ret;
> -	}
> -
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(k3_rproc_request_mbox);
> 
> ---
> base-commit: 6bcdbd62bd56e6d7383f9e06d9d148935b3c9b73
> change-id: 20250805-v1-fix-am62-hmp-suspend-aed6a8de0225
> 
> Best regards,
> -- 
> Hiago De Franco <hiago.franco@toradex.com>
> 
