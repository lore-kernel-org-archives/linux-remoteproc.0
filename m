Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E9946DFF4
	for <linux-remoteproc@vger.kernel.org>; Mon, 12 Oct 2026 08:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791795049; cv=none; b=hvoknPwSKuTVlcjnMSp6FvdijyJxaVMhzAIL1vN/Rg8GM881MJCy4TC2o/I49F1zJxfqELbx98IX+LpKKHKX78nfluo95XoMo39mit554Y/04sfWr+WOpsCsRxwZQKmy2+ZaEQpy6CGTMZfW6VPjjMcJTGKtFKsXbikz7PQRV3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791795049; c=relaxed/simple;
	bh=KSXKge8lF98WBnWGNkG0IboR9V4b1N6GQ5xQBRhqa94=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QaAtv+kbSALpY7rrX2hGQrGljuNNFcOOGI3vH27Qa9hoDWKFOnYGqVzdhmxDmE2Ymb32klEjC9u19vFnjkdZRM0hmXbOdPnDyDpl9r7holULPmFN36fqCwlQzvE74sW4RiE8ChJaTX9I7yW/toImIPG0sHrKyFfJrUwkPGvIsbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a+wgW86M; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a+wgW86M"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso1064320f8f.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 12 Oct 2026 01:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791795045; x=1792399845; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VauPgqsnl4i0EoTG9j7fG+t1lHBl9BTOH+qyhzX/v4Q=;
        b=a+wgW86MAYcXbvQT1LQgC3jZGYmpVdNst8AFLXk/CHXfS+9HJBEi8qZwoqLNXYhQdX
         UGBBtDTwoBGgnZfJ6TDJSlcyDQbH3lMoLrfzqkfI4aLMJmxEj2Wnb7DTfF5nwVXCCfv+
         5Sca5+/CPLlES0KDSb3Ouowb9+fdH+L9/k5NNe5FgckmcuxEBhjn1HKCwWukbl58a1S9
         5rFzGMJL4ACHouSpgoZDTbaAZ162n2YCCVT+fvvp0TwVlRYYTb/gM+VlAAhtLwBD3Pxk
         xKn0DQ8OW7FeVczKCzkl/01P1RITxkEfOvjmoPGy0k446Khm3l2aqvaZzuGqDLl9qYK0
         5Jkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791795045; x=1792399845;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VauPgqsnl4i0EoTG9j7fG+t1lHBl9BTOH+qyhzX/v4Q=;
        b=oI6/K9emfCoWza2F6xFcDJhaAR0tRGetRg+gcKkz9iYcg0tIJNchhYAysxlfMgGzBL
         w3LV3HMguqdFDjVfZarjU3VZc9PPUUlLs8kGo6e0jnPhc+F/4i4W7iyRM2/utnMbZd+5
         BbUFkPDmYjCqAx4HtpS6L96H9+1mL6xTyv8l+Sf54imJWdVUfmYgVdF2NdvV/tNKXajD
         rf7XjUGAy6t8BjH1o41h5vMwGNGXIXr2HA6bG+weF7lfJqsvl4XysBQc8nrKAlNuLHEJ
         P3Il4L8uz3R6/cWYqPhgsuE2owsgsX6/ddb17hT/oIB3+Ks1G/nNE8xBPcqadYDBVXYC
         I8GA==
X-Forwarded-Encrypted: i=1; AKwUvBzuIfr72GRNDmamjwmyOT+xA43XQqZzYU3jlI8W2F6c9dk45/7b4XidiC4xIAIvGNtL1wLC3M3CST7/8DrCIkWC@vger.kernel.org
X-Gm-Message-State: AFq9FYKbEdCuCI/Ihy4BTpc856AEWV8Q975D0Zm7/2HaZS/PsR+xbfWs
	aN1NWJN8eCdkYO3tSuC1ww49dEfSxs+ESK0uQPwT1TcvUzvoV+anIxq9kondbTXthU4=
X-Gm-Gg: AYBFou3r0eGRACgXnKG4Qv8qNZ7Kpw23JSUjJ3tb8vz7AG+Bhy6VYd5HdzPdTkpRkzv
	I7pjKi/hZxUig2wvyZERk9iYnOcYRJCOj4MbC8fRYG+aX+rCvCdEq3NjC/yVpvW1Jik218/WOim
	Q0I/QvJRbuga3kNRr+wNyNVZRWTKvs7uZZHHp7YpnhrkpM+f2SkmBLv23+Jl/Z5sMCSFzMd4l99
	guPCFdjVb0kG0akIxgM0581VpvdrpHOjQ/IQ4mz4gJm/lS+9jl6z5CFuVELMqwWaRU6pTaBB5fJ
	gXeKSzFhytWmvjX0lon6FVKdaOSrDoeUNvg1L3+Qi5pW9dzRcyFNGwGIT3YfQKkAUnsSmaXoSHt
	VdRaUEhpP1R4ewNGOWvkJqnorhXU+2y1BK4RVlhqUcqBTuzf1Qs/LHn9nfvuCJs7HpbRhJh+ncv
	ou71o7oiQDkCyZczbRW8Oh63xW5A3oii6jhgaqDKypc3pbtSKEW4vHSqvViHo/1a1s9OK7mrCXq
	7mmqL9zYzuDRc7tKAfuiw==
X-Received: by 2002:a5d:59c5:0:b0:48a:f592:fb63 with SMTP id ffacd0b85a97d-48dba7bea5dmr16393442f8f.1.1791795045347;
        Mon, 12 Oct 2026 01:50:45 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff25:4f41:fef7:ab03:44ed:97e7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db99b820asm19710565f8f.24.2026.10.12.01.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 01:50:44 -0700 (PDT)
Date: Mon, 12 Oct 2026 10:50:43 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] remoteproc: qcom: pas: Don't fail attach if the
 remote has crashed
Message-ID: <asyfY0gZg8OkU1PT@linaro.org>
References: <20261011022802.4069489-1-shengchao.guo@oss.qualcomm.com>
 <20261011022802.4069489-3-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261011022802.4069489-3-shengchao.guo@oss.qualcomm.com>

On Sun, Oct 11, 2026 at 10:28:02AM +0800, Shawn Guo wrote:
> When qcom_pas_attach() finds the fatal SMP2P bit already set, it reports
> a crash and then fails the attach. The core unwinds the attach while the
> crash work is queued: rproc_boot() drops the power refcount back to 0,
> and __rproc_attach()/rproc_attach() unprepare the subdevices, clean up
> the resource table and disable the IOMMU. Once rproc_boot() releases
> rproc->lock, the crash handler finds the rproc still RPROC_DETACHED,
> marks it RPROC_CRASHED and runs rproc_boot_recovery() on top of that
> torn-down state:
> 
>  - the subdevices are unprepared a second time by rproc_stop(), so SSR
>    and sysmon notifiers see a duplicate shutdown;
>  - qcom_pas_stop() and the subsequent rproc_start() operate on resources
>    that rproc_attach() already released, e.g. iommu_unmap() on a
>    disabled domain for rproc->has_iommu;
>  - recovery leaves the rproc RPROC_RUNNING with power == 0. A later
>    "stop" via sysfs takes power to -1 and returns success without
>    stopping anything, so the remote stays running. A following "start"
>    then boots the firmware again on the running remote and fails to
>    re-add the still registered subdevices:
> 
>   sysfs: cannot create duplicate filename '.../qcom_common.pd-mapper.0'
>   remoteproc remoteproc0: failed to prepare subdevices for adsp: -17
>   remoteproc remoteproc0: Boot failed: -17
> 
> A crash found at attach time is no different from one reported by the
> fatal interrupt right after attaching. Factor the crash handling out of
> q6v5_fatal_interrupt() into qcom_q6v5_report_fatal(), which logs the
> SMEM crash reason, clears q6v5.running and reports the crash, and call
> it from qcom_pas_attach() before letting the attach succeed. The core
> completes the attach with balanced bookkeeping, and the crash handler
> then recovers the subsystem through the regular RPROC_ATTACHED ->
> RPROC_CRASHED path.  With running cleared, qcom_q6v5_request_stop() does
> not wait for a stop ack the dead remote cannot send, and handover_issued
> already prevents a spurious handover on stop.
> 
> Assisted-by: LLM

Cc: stable@vger.kernel.org
Fixes: 16472c99f469 ("remoteproc: qcom: pas: Add late attach support for subsystems")
Reviewed-by: Stephan Gerhold <stephan.gerhold@linaro.org>

Thanks for the fixes!
Stephan

> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_q6v5.c     | 22 +++++++++++++++++-----
>  drivers/remoteproc/qcom_q6v5.h     |  1 +
>  drivers/remoteproc/qcom_q6v5_pas.c |  9 ++++++---
>  3 files changed, 24 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
> index fe148b4b3775..51b24cbd4336 100644
> --- a/drivers/remoteproc/qcom_q6v5.c
> +++ b/drivers/remoteproc/qcom_q6v5.c
> @@ -147,15 +147,18 @@ static irqreturn_t q6v5_wdog_interrupt(int irq, void *data)
>  	return IRQ_HANDLED;
>  }
>  
> -static irqreturn_t q6v5_fatal_interrupt(int irq, void *data)
> +/**
> + * qcom_q6v5_report_fatal() - report a fatal error of the remote processor
> + * @q6v5:	reference to qcom_q6v5 context
> + *
> + * Log the crash reason published by the remote in SMEM, mark the remote as
> + * no longer running and report the crash to the remoteproc core.
> + */
> +void qcom_q6v5_report_fatal(struct qcom_q6v5 *q6v5)
>  {
> -	struct qcom_q6v5 *q6v5 = data;
>  	size_t len;
>  	char *msg;
>  
> -	if (!q6v5->running)
> -		return IRQ_HANDLED;
> -
>  	msg = qcom_smem_get(QCOM_SMEM_HOST_ANY, q6v5->crash_reason, &len);
>  	if (!IS_ERR(msg) && len > 0 && msg[0])
>  		dev_err(q6v5->dev, "fatal error received: %s\n", msg);
> @@ -164,6 +167,15 @@ static irqreturn_t q6v5_fatal_interrupt(int irq, void *data)
>  
>  	q6v5->running = false;
>  	rproc_report_crash(q6v5->rproc, RPROC_FATAL_ERROR);
> +}
> +EXPORT_SYMBOL_GPL(qcom_q6v5_report_fatal);
> +
> +static irqreturn_t q6v5_fatal_interrupt(int irq, void *data)
> +{
> +	struct qcom_q6v5 *q6v5 = data;
> +
> +	if (q6v5->running)
> +		qcom_q6v5_report_fatal(q6v5);
>  
>  	return IRQ_HANDLED;
>  }
> diff --git a/drivers/remoteproc/qcom_q6v5.h b/drivers/remoteproc/qcom_q6v5.h
> index 8991ff090579..a0507860a21c 100644
> --- a/drivers/remoteproc/qcom_q6v5.h
> +++ b/drivers/remoteproc/qcom_q6v5.h
> @@ -56,5 +56,6 @@ int qcom_q6v5_unprepare(struct qcom_q6v5 *q6v5);
>  int qcom_q6v5_request_stop(struct qcom_q6v5 *q6v5, struct qcom_sysmon *sysmon);
>  int qcom_q6v5_wait_for_start(struct qcom_q6v5 *q6v5, int timeout);
>  unsigned long qcom_q6v5_panic(struct qcom_q6v5 *q6v5);
> +void qcom_q6v5_report_fatal(struct qcom_q6v5 *q6v5);
>  
>  #endif
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index 56179b71fd2a..99f627db6bd3 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -562,10 +562,13 @@ static int qcom_pas_attach(struct rproc *rproc)
>  		goto disable_running;
>  
>  	if (crash_state) {
> +		/*
> +		 * Complete the attach and let the crash handler recover the
> +		 * subsystem from the attached state, as for a crash reported
> +		 * by the fatal interrupt.
> +		 */
>  		dev_err(pas->dev, "Subsystem has crashed before driver probe\n");
> -		rproc_report_crash(rproc, RPROC_FATAL_ERROR);
> -		ret = -EINVAL;
> -		goto disable_running;
> +		qcom_q6v5_report_fatal(&pas->q6v5);
>  	}
>  
>  	return 0;
> -- 
> 2.43.0
> 
