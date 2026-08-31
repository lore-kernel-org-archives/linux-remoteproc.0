Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAFE235677D
	for <linux-remoteproc@vger.kernel.org>; Mon, 31 Aug 2026 05:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788155560; cv=none; b=AOrbVLy1Jg2PzbVXkbnryV0EcPIwidF9LQYbEgBea7+iKGrBNjNvn0bRrk8DpIVyiKXz2RlTujq5xEqAmpdWc/rlw6q2xeq5Dp/YAo4XXGOFvtQ16j3v8W04xhRPCGpvCAS/AEZqHil/H0N5bP3bPQcW+z46W88YBKXPT1qkPTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788155560; c=relaxed/simple;
	bh=Gx8dA2g+mBwttry7LSB36CW/iS8nutJKidZ1ioeEuZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r+HhfJRj2Hf75zps5nwsNI/Rx48LlbLZLdAk6wZ8KLIj80tncma6mUlpNCO55zt5rGEjTNrsPJFTLTgpRN9Qd5Onf3mHFMqboBvDzpgi8YAeozS5YS45Sz+mKAHtlbj1+rCPWzz+C9M2zlpFBHShLmD2le5E8hizgRCHJzkgr3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AVrGWze+; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AVrGWze+"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-499ac87c92bso27764265e9.1
        for <linux-remoteproc@vger.kernel.org>; Sun, 30 Aug 2026 22:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788155557; x=1788760357; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XgW48+Yzc91knnksx3tvkw+5MBtgMA/lwUwkXpa2nc4=;
        b=AVrGWze+YW0FuUxMuY587aPpy3iWGqPV7wnTA9CxG5cHFMK0LpRkp8tTsQBW+ENF/5
         FAvqlak8CYa+axHsSHeP5yQct+FgWbAAkXP5NvjDxSQMpa82zvQ0yuCGgGDdmBhL6Y2d
         VZaN+4jSO5xajMrc4bAfG8c3pNI7HhJWTDZGuGVtzlP43q195mu8nd0Ds16mSj5Hv5iJ
         r2xZYx8hTwQmH8QOJcmTnp8p5btbyLur3PQLMPYjPl6sphIqJs2Uu6/OsMJy678K71lD
         zQdQXLCde61axBmrw1zE94KNCATmdYkqzZdmCU6BGxoPMBPakRj1mqQHsTM48XNj4D6u
         M5eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788155557; x=1788760357;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XgW48+Yzc91knnksx3tvkw+5MBtgMA/lwUwkXpa2nc4=;
        b=WXEq6iIWMerukPcAnVzxQn6t6/78QlbGy+g7Y9vXGaHI4xYEih6s49yqdSePp2AKMA
         uH/Sblgt1BA+Inifcreh/dVtdvGrI84l9rqJfqmLaJqO5v9NZzS47+FPnagzgywKXgoV
         ZDQ67rWs6bKEoq/icj1CxjPZfYFA/InuKE6V+equh15vf/QisIc1E6K6elYBHdzjF8mV
         XSc8VTpzEoD4UqCJn8NrWAUWbxsvriyfdOetUqZld/xi45acv76IE1GvRjyuLnJQUIPt
         73SX9bv6tmE9oV94Q1h/Uz90jhB7Qdzi4mk1jc87AYsmTL0UAF9CZAWOES/Z5RNXFrxm
         t2ZQ==
X-Forwarded-Encrypted: i=1; AHgh+RqPYxzdoidhInlXNXenGf/YKkRtqeUOQVwRKxXkrfxP2/RtpNb83rL7ksXdxGo8G9lKEpY2860Snf3mx6d35bgu@vger.kernel.org
X-Gm-Message-State: AFuF++m9zKXx4aNsr9T7jbJqZESh3IQ85Dw8Uwr29U2fGlR2FktjG4Z9
	aXLLeqQYBoRM3KIc71iBESv0TyzMOzhj8RbPpGK4GX7oYU/5NAip56ZWg8tSwYDBeSg=
X-Gm-Gg: AR+sD13+0KH7g5KHXUiUChQcE3QsHkkUOJa8NkTdZ9uTCCPnIbHBTESLeJ+rHj/Gw6d
	sjtZaUpzyHpoftLvlf8M/tK2jLGcegdGG9FtC6gd4mEpDJ2EB14/ucteKzS6YDCnoOc2Mh7J44Q
	ZQTADzQCJM08+swu9Ead6IXm5fhkVztfN+BeVUU45rdsePIs442TXzdehc2w4Esi6GzaOdB2o7V
	luydPQCsJh1UnwgwLsXQc536t7X1l+dmSFxHezB/JwFQZ3VQzMCaRBrRHMXXXMJ9EbAW4flErkp
	nSedQRC+3LXDGd1vGIErUN2tr3mKBLFJV32Ar8zmRQzY3xnlGEseF6tRi7cPZfksD4ZGULr4xbT
	vLRkIjt7uU2zOAYJADMLa1I2aICj3bZe1O/pov3kyVkeooSH3odvupEPc0XKx7bLcQc3VMJRxin
	PFY8bV0mK96M7FN3gFBB/5nOMZwHsBlhmhix1CrN6bo7k1WWCDV1wlPHZQ2m/OygZmYFeGogmVb
	rXycYTH8fE=
X-Received: by 2002:a05:600c:6096:b0:49c:cfad:90c1 with SMTP id 5b1f17b1804b1-49ccfad9180mr194739605e9.14.1788155556937;
        Sun, 30 Aug 2026 22:52:36 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff24:7241:7d09:c3ef:cd6:3fed])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b9500c80asm302186875e9.9.2026.08.30.22.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 22:52:36 -0700 (PDT)
Date: Mon, 31 Aug 2026 07:52:32 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
	Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] remoteproc: qcom_q6v5: Skip handover callback if
 already issued
Message-ID: <apUWoCCfgthl40AZ@linaro.org>
References: <20260828181311.4038346-1-mukesh.ojha@oss.qualcomm.com>
 <20260828181311.4038346-2-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260828181311.4038346-2-mukesh.ojha@oss.qualcomm.com>

On Fri, Aug 28, 2026 at 11:43:10PM +0530, Mukesh Ojha wrote:
> When qcom_pas_attach() is called (subsystem already running at kernel
> probe time), it sets handover_issued = true before enabling the handover
> IRQ. The handover line may be high already (from bootloader boot), causing
> the IRQ to fire immediately. Since proxy resources were never acquired via
> qcom_pas_pds_enable() in the attach path, the resulting handover callback
> calls pm_runtime_put() on proxy power domains with usage count = 0:
> 
>   genpd genpd:0:d00000.remoteproc: Runtime PM usage count underflow!
>   genpd genpd:1:d00000.remoteproc: Runtime PM usage count underflow!
> 
> Also, because the old code left handover_irq_enabled = false after attach
> (fixed separately), the handover IRQ was never disabled inside the handler,
> allowing it to fire repeatedly and generating multiple underflows.
> 
> Fix by recording whether handover_issued was already set before the IRQ
> fires and skipping the handover callback in that case. The callback
> releases proxy resources that are only held when the normal start path
> ran qcom_pas_pds_enable(); if handover was already marked as issued,
> those resources were never acquired and must not be released.
> 
> Fixes: 16472c99f469 ("remoteproc: qcom: pas: Add late attach support for subsystems")
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

Shawn sent the same patch already and the same comment applies here:
https://lore.kernel.org/linux-arm-msm/amxf7MODINj26a4m@linaro.org/

v2 fixes it properly:
https://lore.kernel.org/linux-arm-msm/20260801011731.1084591-1-shengchao.guo@oss.qualcomm.com/

Thanks,
Stephan
