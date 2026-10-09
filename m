Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27EB24E4319
	for <linux-remoteproc@vger.kernel.org>; Fri,  9 Oct 2026 14:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791555668; cv=none; b=G06p+B3xh2cgDVVGUu6kNnkwPoQcyqUmDwpp9MtTQb79ItDHdZH0rFCDxp7u6fOwVe+oNWjlsWeOMiEvHcL4+s82RMB1KhEikLsS44FV1sUMTrvlJ8SqVIqnU/pqovDdPhSomeVPnhISuQqKJcMOPqvc7QnsPAhcN8c2HJ/5Y5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791555668; c=relaxed/simple;
	bh=XZGBSjqEv18NCbDscH5T7VJzzYzo/noInSon79888DU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l72HbjS0YC/EYWRLhMzMrrIEegF5E8+4i3ded6RrMesXaO2Bz/o/lfBxFIZbarg5gHoEhvRZjf4GVbiaHgoow/t1DyqNlOoPpBtfupE6cc1QisqmNrt0hEEOsI+9H6yfAYXLrKbogxhkjOtdPJDXblFaVPVnO2mhGvGWFSlfAe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T3NzLMZE; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T3NzLMZE"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-487049569b6so2920248f8f.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 09 Oct 2026 07:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791555665; x=1792160465; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZN/KPNY2M7mPJZQUsUziJoEy9hPU2aa6/znszLL6sTY=;
        b=T3NzLMZElROAsb8bCTj8/FhhqIy2zhR5gwNQ0c/vyZCt9J1knuwe1BTrILzwbbwJRM
         vf2IqT0O1QZ1JZdn8CtPu8zEfvxwEfWwczk53pTTF65COwF7Nu2PJZPPtmojhHFcqnnS
         Qfijf4wCNAO86KK6+K4UgPVFEEI1Xa2VupzJk7uT+dm2c5/yTpF3ETAHv4I2Ei/8TNW1
         z+B8XJX3w/o9lua+ESfU5hsp23yz1N2APuxspSiKoyMD1jIT95qbo9jqFAw/57XpiK0e
         zBOyUZ8nRR0mWaYGFGctMH7+K/CgtAhyKLD82eo78HmlnsPPUUiviS0typP6AP3VhI+0
         9m+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791555665; x=1792160465;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZN/KPNY2M7mPJZQUsUziJoEy9hPU2aa6/znszLL6sTY=;
        b=I/Cu2AytJKa1V6c3aUch+BZztvgiz3tpH0vm0U4GjlhqqFbCeW2a7NI8HZPOcc3XZ0
         sSyXq+ob4cKAw+lFP1ZKn0dV48se+2NMX5H843MWXqaxhr0t9YQVAFeLq3UxuqclC/3K
         E6lXIpei1xyP84YvplSk2NjJ/w5LswUjmgL0vulknSzU6YJJlhjCEwEktSxLIgtd3BCf
         w6xUDoSj84p/gWXEYhmIouvIOPCK7PIuEDnQDlPI2MemxeuNtDJHNOdwrgVTee2Aiq9J
         qXlMNLQXF/YhLFqDGlKFhX7m2Aswkm6umD7x7b1G8refP4nvD8wgpKG+2iAOWG+le9S6
         Olig==
X-Forwarded-Encrypted: i=1; AKwUvBw8TrizqzDSoT+wddAKlesqzqMgX5Bh8vMqKb1WL0XcdriMMjhtyw16UuUBUkt0EqW+8yD7WZlvJtOHK4dIihII@vger.kernel.org
X-Gm-Message-State: AFuF++m0BCcaV4HUdUI3UowyYYwMcBk49XtaVR4pEf+cxS9VwI/zoz1L
	azrXCclx45gKNZ5jV/nEhtCvgwRMfOz+f/U0VW0xvUVq0xqwdgKFYPALt0mFDJ80N10=
X-Gm-Gg: AYBFou07cTcwbJy3/NGWZPbUjkVgTgo/sPzgmtttrF8yd8ylb+QXVgJnb1NIhWJkdeK
	vfgyInsKMT2XFKnKCwvNSFLttmJKjaquWEdf9ypxzwrWgQwygp6O+KmiGPCqLWbO0sLWhEHsLYa
	Yetz1Oth0OA/cqXiQYwHyxaIGZ3693orXhkjIOCwtcm3n1JQDHV10sNHHIrKx6Bd1JQ/ZBF7mAJ
	NFlGa7zyKwKjGmcKV4XavEM74YEiH9UhQ5NUyGwLhVQN25tM/4eHvNdyOvz8lR+D43HtxlPWtHq
	x+dhI+WCEKmo18KZtz+HRoYG/5qCYB7QsttmMXeyFPsEzUgCyk2jaMLgyzBHTGW8IZaqt8vjSqF
	h1ftsA5E3XyuEyzX9GcVC1hgVG8r2WWu6eMtWvhF7DvZHwhE23wbLifhaDSrT8trYR/EsR7e4XW
	uOm+cflI6T66hvJg6ykDtOJPpQ6Kisgdf+WXSsncIewF3JHZurBfifQ1o5uzXlCeePU2SdrgUQm
	6IMh2gRvcroVsKQ5mrF7Q==
X-Received: by 2002:a05:600c:8b6f:b0:4a0:25e9:bc47 with SMTP id 5b1f17b1804b1-4a18e4ba6c2mr39538215e9.19.1791555665208;
        Fri, 09 Oct 2026 07:21:05 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff25:4f41:8f61:e8db:b29a:c15a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9ac94c6sm4198485f8f.42.2026.10.09.07.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 07:21:03 -0700 (PDT)
Date: Fri, 9 Oct 2026 16:20:58 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] remoteproc: qcom: pas: Decide early_boot attach at
 probe time
Message-ID: <asj4Sgsjw5xNXNLb@linaro.org>
References: <20261006033550.2726451-1-shengchao.guo@oss.qualcomm.com>
 <20261006033550.2726451-2-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261006033550.2726451-2-shengchao.guo@oss.qualcomm.com>

On Tue, Oct 06, 2026 at 11:35:49AM +0800, Shawn Guo wrote:
> For early_boot subsystems, probe unconditionally marks the rproc
> RPROC_DETACHED and qcom_pas_attach() discovers from SMP2P whether the
> bootloader actually started the remote. If it did not, attach sets the
> state back to RPROC_OFFLINE and fails, expecting the core to boot the
> firmware instead. The core does not do that: rproc_boot() treats the
> attach failure as fatal and the remote is never started.
> 
> This is hit on Nord with firmware where XBL no longer brings ADSP out
> of reset. The remote never publishes its inbound SMP2P entries, so the
> very first state read fails (debug print below) and the ADSP stays down:
> 
>   qcom_q6v5_pas 4c00000.remoteproc: Failed to get fatal_irq state: -19
>   remoteproc remoteproc0: can't attach to rproc adsp: -19
> 
> The ready, stop-ack and sysmon shutdown-ack signals cannot change while
> Linux has not yet interacted with the remote, so there is no reason to
> defer the decision to attach time. Check them in probe and only mark
> the rproc RPROC_DETACHED when the remote is up and has not been asked
> to stop; otherwise leave it RPROC_OFFLINE so the regular firmware boot
> path is taken. The ready state is read first so that a missing SMP2P
> entry -ENODEV is treated as "not running" before sysmon is queried.
> 
> qcom_pas_attach() keeps only the fatal check, since that is the one
> signal that has to be acted upon once the rproc is attached.
> 
> Assisted-by: LLM
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 64 +++++++++++++++---------------
>  1 file changed, 33 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index 2e1e39826ffa..8f3d45c604c9 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -550,9 +550,7 @@ static unsigned long qcom_pas_panic(struct rproc *rproc)
>  static int qcom_pas_attach(struct rproc *rproc)
>  {
>  	struct qcom_pas *pas = rproc->priv;
> -	bool ready_state;
>  	bool crash_state;
> -	bool stop_state;
>  	int ret;
>  
>  	pas->q6v5.handover_issued = true;
> @@ -570,42 +568,46 @@ static int qcom_pas_attach(struct rproc *rproc)
>  		goto disable_running;
>  	}
>  
> -	ret = irq_get_irqchip_state(pas->q6v5.stop_irq,
> -				    IRQCHIP_STATE_LINE_LEVEL, &stop_state);
> -	if (ret)
> -		goto disable_running;
> -
> -	if (stop_state || qcom_sysmon_shutdown_irq_state(pas->sysmon)) {
> -		dev_info(pas->dev, "Subsystem found stop state set. Falling back to start.\n");
> -		goto unroll_attach;
> -	}
> -
> -	ret = irq_get_irqchip_state(pas->q6v5.ready_irq,
> -				    IRQCHIP_STATE_LINE_LEVEL, &ready_state);
> -	if (ret)
> -		goto disable_running;
> -
> -	if (unlikely(!ready_state)) {
> -		/*
> -		 * The bootloader may not support early boot, mark the state as
> -		 * RPROC_OFFLINE so that the PAS driver can load the firmware and
> -		 * start the remoteproc.
> -		 */
> -		dev_err(pas->dev, "Failed to get subsystem ready interrupt\n");
> -		goto unroll_attach;
> -	}
> -
>  	return 0;
>  
> -unroll_attach:
> -	pas->rproc->state = RPROC_OFFLINE;
> -	ret = -EINVAL;
>  disable_running:
>  	pas->q6v5.running = false;
>  
>  	return ret;
>  }
>  
> +/*
> + * The bootloader may or may not have started the subsystem. Inspect the
> + * SMP2P state, which is static until Linux interacts with the remote, to
> + * decide whether to attach or to load and start the firmware.
> + */
> +static bool qcom_pas_is_running(struct qcom_pas *pas)
> +{
> +	bool ready_state;
> +	bool stop_state;
> +	int ret;
> +
> +	/*
> +	 * Check ready first: if the remote never published its SMP2P
> +	 * entries the state read fails with -ENODEV.
> +	 */
> +	ret = irq_get_irqchip_state(pas->q6v5.ready_irq,
> +				    IRQCHIP_STATE_LINE_LEVEL, &ready_state);
> +	if (ret || !ready_state) {
> +		dev_info(pas->dev, "Subsystem not running. Falling back to start.\n");
> +		return false;
> +	}
> +
> +	ret = irq_get_irqchip_state(pas->q6v5.stop_irq,
> +				    IRQCHIP_STATE_LINE_LEVEL, &stop_state);
> +	if (ret || stop_state || qcom_sysmon_shutdown_irq_state(pas->sysmon)) {
> +		dev_info(pas->dev, "Subsystem found stop state set. Falling back to start.\n");
> +		return false;
> +	}

Nitpick: Both of these messages are a bit imprecise. desc->early_boot
does not necessarily imply desc->auto_boot, so they may just be marked
as offline and not automatically started.

But you just moved this code and I don't think it's worth resending just
to polish these messages a bit more. :-)

In any case:

Reviewed-by: Stephan Gerhold <stephan.gerhold@linaro.org>

Thanks,
Stephan
