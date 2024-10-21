Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6841EEB3
	for <linux-remoteproc@vger.kernel.org>; Mon, 21 Oct 2024 15:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729523573; cv=none; b=CCf207jrbJwc3FffXidvXD3NnPTMThihR23aT/2F4Q/qIVOM3srDbFZi3is1EwY2qWI5qmXm9K4zlN2wb2ecX1wmpil7VpeIoRs4nBaEX0yLqtmPgAuW5nucpKgLshWK6mw93+hn1g/7tI1VUkhwjyJxBCL+/ixhV8bv2nf4D3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729523573; c=relaxed/simple;
	bh=HA0tHinn+bqrD776M0L/2NYbGNmG9TR+YyPv2Lgp40E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yx0OAFzdfEw6qdhtnuE2AoGk/tdfIdTjifd69YXpTmpL9y1cwaSUVAmyGaWZT/HUD1tO5wjZkBAJSoZYPvALEXE5rfPzC3vx8e+/mrt70jN3UJQKBdUqrLoBHPnRLdqpwZRiRtligExFn126irnqEts/WaOpmWEjjxr5UHnVam8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lkSWIPAA; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lkSWIPAA"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2e2a999b287so3512688a91.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 21 Oct 2024 08:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729523571; x=1730128371; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=koGPDoEs33GkFYUJ8VvUnAUxrtRA6oGYT3URNqBimfc=;
        b=lkSWIPAAu8ijP4o7sOnOo34e3V1WLPy7RdjK45CRuv8bce4bJam4lPIGDqVxCZts9H
         kCu+hntjLYNHiemyCVNqmNtxOw+tkuzoa4W67dQMBRoPKsCE+Kqicb9pbrYWZq0D3udt
         zh5DPku9vkdNwVfvg8rmSBVCatckvl2KE6oCB7q1vx9NujRF9LsjQ1vLfEEqcTkKC/NJ
         GS1wORj+Yb0DZ9Psr5FaCdNZ07d7y3/Dn3y8+lStqK0lwm99dpyd2KmNHYQBmGacZrET
         aEjTIN8UT65ZxMrLu8XEcOH/DT3Mu8SE11bFg6Z+m280OAy2xdjgbQ14fjvOt/e0BL4I
         47lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729523571; x=1730128371;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=koGPDoEs33GkFYUJ8VvUnAUxrtRA6oGYT3URNqBimfc=;
        b=tRaKvlvMUk7IvWOpW3QwFmJ6IGEzXkRSe34t4R+4FohBFVz5eB26Xy5r5slLiMgjDV
         0hqahafQpJ62atxeCt+QndMX7/ssTpOFNLc12VXk2u2glLn9zZSa20qXxy8bVL+xXokA
         v+tx6yqNODN6ahGrF1sdKkxvLObZRw02VLMikjdrFoRlp6nl/i3D+tUHWy0nVmDdQcsF
         kbF0/Mm3//iEgJKeC5zbVP5OWhcrMiNgZh855NfmHUOQ6ahxofpOehUkrxtvrLkp5QtQ
         dtdKbQgfMC2jzACL12KETvqeCXMUp6o0XqhwTwW6V7qAjr8xIQiT5nypkhdjy7HG4CNm
         Q7JA==
X-Forwarded-Encrypted: i=1; AJvYcCUdxgl57NgorA4RjBtvnSdHpD5ead2DFsSVU/MX4NB8MWjk4Q6dT2frzv40ty9CU2c/qdGhCKDfCP7t7Rtg/xNx@vger.kernel.org
X-Gm-Message-State: AOJu0YzRK0Qjvk13GWgKZm7JJumy/uRrpK/1dvtGIpHluAuMWkZmfwyN
	XyJcm7r3YRywVqeNiEkMLeapVbset1+yWkhBlQljbzAX8W5M4i8RVS7p4s3wzBU=
X-Google-Smtp-Source: AGHT+IESfkw+TDgA9sQaThZSYXSbpbhhKDO0hLMQggL9hcnwuUK+4dhR89Sa5+gB5uRw6+z/7OUTxw==
X-Received: by 2002:a17:90b:4d0f:b0:2e2:cf5c:8ee8 with SMTP id 98e67ed59e1d1-2e561612dcemr13097090a91.12.1729523570841;
        Mon, 21 Oct 2024 08:12:50 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:fb5e:248e:29ec:7946])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e5ad365d1fsm3997628a91.16.2024.10.21.08.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 08:12:50 -0700 (PDT)
Date: Mon, 21 Oct 2024 09:12:47 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Mukesh Ojha <quic_mojha@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] remoteproc: Add a new remoteproc state RPROC_DEFUNCT
Message-ID: <ZxZvbz9C/eHzosFN@p14s>
References: <20241016045546.2613436-1-quic_mojha@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241016045546.2613436-1-quic_mojha@quicinc.com>

Hi Mukesh,

On Wed, Oct 16, 2024 at 10:25:46AM +0530, Mukesh Ojha wrote:
> Multiple call to glink_subdev_stop() for the same remoteproc can happen
> if rproc_stop() fails from Process-A that leaves the rproc state to
> RPROC_CRASHED state later a call to recovery_store from user space in
> Process B triggers rproc_trigger_recovery() of the same remoteproc to
> recover it results in NULL pointer dereference issue in
> qcom_glink_smem_unregister().
> 
> There is other side to this issue if we want to fix this via adding a
> NULL check on glink->edge which does not guarantees that the remoteproc
> will recover in second call from Process B as it has failed in the first
> Process A during SMC shutdown call and may again fail at the same call
> and rproc can not recover for such case.
> 
> Add a new rproc state RPROC_DEFUNCT i.e., non recoverable state of
> remoteproc and the only way to recover from it via system restart.
> 
> 	Process-A                			Process-B
> 
>   fatal error interrupt happens
> 
>   rproc_crash_handler_work()
>     mutex_lock_interruptible(&rproc->lock);
>     ...
> 
>        rproc->state = RPROC_CRASHED;
>     ...
>     mutex_unlock(&rproc->lock);
> 
>     rproc_trigger_recovery()
>      mutex_lock_interruptible(&rproc->lock);
> 
>       adsp_stop()
>       qcom_q6v5_pas 20c00000.remoteproc: failed to shutdown: -22
>       remoteproc remoteproc3: can't stop rproc: -22
>      mutex_unlock(&rproc->lock);

Ok, that can happen.

> 
> 						echo enabled > /sys/class/remoteproc/remoteprocX/recovery
> 						recovery_store()
> 						 rproc_trigger_recovery()
> 						  mutex_lock_interruptible(&rproc->lock);
> 						   rproc_stop()
> 						    glink_subdev_stop()
> 						      qcom_glink_smem_unregister() ==|
>                                                                                      |
>                                                                                      V

I am missing some information here but I will _assume_ this is caused by
glink->edge being set to NULL [1] when glink_subdev_stop() is first called by
process A.  Instead of adding a new state to the core I think a better idea
would be to add a check for a NULL value on @smem in
qcom_glink_smem_unregister().  This is a problem that should be fixed in the
driver rather than the core.

[1]. https://elixir.bootlin.com/linux/v6.12-rc4/source/drivers/remoteproc/qcom_common.c#L213

> 						      Unable to handle kernel NULL pointer dereference
>                                                                 at virtual address 0000000000000358
> 
> Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
> ---
> Changes in v3:
>  - Fix kernel test reported error.
> 
> Changes in v2:
>  - Removed NULL pointer check instead added a new state to signify
>    non-recoverable state of remoteproc.
> 
>  drivers/remoteproc/remoteproc_core.c  | 3 ++-
>  drivers/remoteproc/remoteproc_sysfs.c | 1 +
>  include/linux/remoteproc.h            | 5 ++++-
>  3 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index f276956f2c5c..c4e14503b971 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1727,6 +1727,7 @@ static int rproc_stop(struct rproc *rproc, bool crashed)
>  	/* power off the remote processor */
>  	ret = rproc->ops->stop(rproc);
>  	if (ret) {
> +		rproc->state = RPROC_DEFUNCT;
>  		dev_err(dev, "can't stop rproc: %d\n", ret);
>  		return ret;
>  	}
> @@ -1839,7 +1840,7 @@ int rproc_trigger_recovery(struct rproc *rproc)
>  		return ret;
>  
>  	/* State could have changed before we got the mutex */
> -	if (rproc->state != RPROC_CRASHED)
> +	if (rproc->state == RPROC_DEFUNCT || rproc->state != RPROC_CRASHED)
>  		goto unlock_mutex;

The problem is that rproc_trigger_recovery() an only be called once for a
remoteproc, something that modifies the state machine and may introduce backward
compatibility issues for other remote processor implementations.

Thanks,
Mathieu

>  
>  	dev_err(dev, "recovering %s\n", rproc->name);
> diff --git a/drivers/remoteproc/remoteproc_sysfs.c b/drivers/remoteproc/remoteproc_sysfs.c
> index 138e752c5e4e..5f722b4576b2 100644
> --- a/drivers/remoteproc/remoteproc_sysfs.c
> +++ b/drivers/remoteproc/remoteproc_sysfs.c
> @@ -171,6 +171,7 @@ static const char * const rproc_state_string[] = {
>  	[RPROC_DELETED]		= "deleted",
>  	[RPROC_ATTACHED]	= "attached",
>  	[RPROC_DETACHED]	= "detached",
> +	[RPROC_DEFUNCT]		= "defunct",
>  	[RPROC_LAST]		= "invalid",
>  };
>  
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index b4795698d8c2..3e4ba06c6a9a 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -417,6 +417,8 @@ struct rproc_ops {
>   *			has attached to it
>   * @RPROC_DETACHED:	device has been booted by another entity and waiting
>   *			for the core to attach to it
> + * @RPROC_DEFUNCT:	device neither crashed nor responding to any of the
> + * 			requests and can only recover on system restart.
>   * @RPROC_LAST:		just keep this one at the end
>   *
>   * Please note that the values of these states are used as indices
> @@ -433,7 +435,8 @@ enum rproc_state {
>  	RPROC_DELETED	= 4,
>  	RPROC_ATTACHED	= 5,
>  	RPROC_DETACHED	= 6,
> -	RPROC_LAST	= 7,
> +	RPROC_DEFUNCT	= 7,
> +	RPROC_LAST	= 8,
>  };
>  
>  /**
> -- 
> 2.34.1
> 
