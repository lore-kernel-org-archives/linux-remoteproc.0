Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60922345741
	for <linux-remoteproc@vger.kernel.org>; Mon, 12 Oct 2026 08:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791794933; cv=none; b=N/QoxCkEmfbGsa+hVUxQGjITGZsM5XlQSjuH05KSntSRrSc+kLtORMItVMeNN6ztNsBtQbhMJagI4qd05xhJoAzfxXDoUDia45eU/XCzW1FqOEFqhF1TxmpG//BiZSUdUm9IuWk/yp1KZCPtD/APySRv/yfg4SYsvHsMaFLUl3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791794933; c=relaxed/simple;
	bh=1eOpVzSHBaZ6yZXrZrTN/Es+LXfRmjlxWvWnixDQFmo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BUs3FZmV+r6heeUMsVOvTz0i07DwodgGgWoEPDYlBwWWlEXfLc9uk7x6djUZWsGzVP4D3EaQLxFOaU7Zytzz9+OCWrRt7pngQ8gzTvSuIGlqgCGiEuQqsVqUq81inZJhDXtyP++NAEC9egsk0fBRAhVwZ5hptARcJGgnZd69udM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VskVFhY1; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VskVFhY1"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a022fee0caso13658025e9.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 12 Oct 2026 01:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791794929; x=1792399729; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3cASW6w1EYZAgoYuqInWi7bvGxpflIrfTx3mhO3Baq4=;
        b=VskVFhY1h/PWH/3Lg6myfccXMSXciiA1OLXid3aqdnYs1Fpp5Bpuxs9Or2TTEUAUgm
         ANrLA5Ycmp0ba3dDqCDPxV2/JnOZMpMI0Sjp5FCSziaAmrG00/ZpF5v53vhGCeRB5E/I
         xTso93mz8h3/BYWhpmbeiwgaWMwpbIL2JhCnJqwcbtrZwhrIj1BaF9785Rs4ZDLI9Ydf
         REb1osXC4qlY5mU5AgDYeMiT/fMJe3qzW8WYa7t65mYCYA0j10jsOGMNntuesTFUxe2f
         bNJvRGtKoeh22HhUOaxGrK5c/zVk2oanarDG1Y3tn7Bpn/4Vgx/H6N7SIKKIhH8QVHz+
         O21w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791794929; x=1792399729;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3cASW6w1EYZAgoYuqInWi7bvGxpflIrfTx3mhO3Baq4=;
        b=iJHCHzNgFz1Qvd3R7rewFIKPI0+xsx4ft3sy3+IhlFxm+FhVHboz5oD9aVeC68DFm9
         ItXYrjWCz5p/1JTLo7krpWZmB5VMlMJSOzAZljyKSIlwYYhz+rqGLXn3sXQeAmLlboW3
         MaIpxen1Qhaolp3fGzU/cQN+OtOar3p6m7LgOIf6OrvV15g+iEaUsP7UQIKjeO/PoIHU
         c0/Y2xnd2vCbH+SlsDt0pY6DVoqLJY1LiPMzxgeuhc21bxsjp5H495xLbKjaQy6zoJnt
         aRnRJz+PO2U7KVH83iEJuzGJ9JzdnE9Ny+NLbZ3VqvB9bYLYbkekF78our5oiPeVIbc1
         fHcQ==
X-Forwarded-Encrypted: i=1; AKwUvBwOYCVz8fZgDdO2dtpNvyQDRUuceLpRp2nTLcotQo1Cs31nG5ycJc6MwO7UbFID3eORnXdepm8HizjBtspUeEh0@vger.kernel.org
X-Gm-Message-State: AFq9FYJFocML5+kbZs5YV9n8BFzBNXKIxc2rsV308eyUHsjeVMIlq/uu
	655DfeVhv3j7Vu3uB3zBs61O9shA8ehhkylkKmPYlAwgfVtmVaFnBOR9lBa0jkb91kg=
X-Gm-Gg: AYBFou2dFi3i4M/thPwkrfwXnlhjJa3gkdK3mKXCM4vZmqMCxwHPs6ZiKpLmWOFab3t
	5c+C68RXlHE79nGXpCEtMVw5lKhmSbgW/gG/6jfNnGJz3CwHDKIU14lODqvb7mwKazOQo6q55bo
	LZS2bVtBU8+3887xUuWpMhj2Tb36TagDB38ueN2eqShg8bpwOcr1ss0At6CQdgTIRkzNEkqt/Zn
	NfmEuMFvUtSza+r/2f1t2+CsV7O8HFKuhIM7UhRptTg6BvH0qh66/ceGfN875msClUlN7MsLsJ1
	VZsinuMqcGMDBTwkEG9L0sNDSNxhvLt8BsQFJytob3A+Ruqono0oaClz6vdpdDMy9URXNaLlrMG
	CebchDxzbZ1UNlLRnrc6+CRK2w4JFeFUijrVuez7ayISWcCMhlL60JnXHTfDpV5FjCmot+xhT1R
	ctAd2rMMleKChDXLMF1ZTTRszi0rWYh+Ib1CIk3l7W6zGGqtuUbc+NhNO/jqXbK4Ls0yIfT45ua
	EIwFEcotUY=
X-Received: by 2002:a05:600c:4e91:b0:4a1:7ec7:a479 with SMTP id 5b1f17b1804b1-4a18e4f56bcmr174368605e9.33.1791794929369;
        Mon, 12 Oct 2026 01:48:49 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff25:4f41:fef7:ab03:44ed:97e7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a19f249692sm132645895e9.3.2026.10.12.01.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 01:48:48 -0700 (PDT)
Date: Mon, 12 Oct 2026 10:48:43 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] remoteproc: qcom: pas: Decide early_boot attach
 at probe time
Message-ID: <asye6zJKwBBpcrCX@linaro.org>
References: <20261011022802.4069489-1-shengchao.guo@oss.qualcomm.com>
 <20261011022802.4069489-2-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261011022802.4069489-2-shengchao.guo@oss.qualcomm.com>

On Sun, Oct 11, 2026 at 10:28:01AM +0800, Shawn Guo wrote:
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

I think we should add stable/Fixes here for backporting to 6.3:

Cc: stable@vger.kernel.org
Fixes: 16472c99f469 ("remoteproc: qcom: pas: Add late attach support for subsystems")

I'm not sure if b4 picks up Cc/Fixes as trailers when applying so you
may need to resend.

> Reviewed-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 64 +++++++++++++++---------------
>  1 file changed, 33 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index 2e1e39826ffa..56179b71fd2a 100644
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
> +		dev_info(pas->dev, "Subsystem not running, not attaching\n");
> +		return false;
> +	}
> +
> +	ret = irq_get_irqchip_state(pas->q6v5.stop_irq,
> +				    IRQCHIP_STATE_LINE_LEVEL, &stop_state);
> +	if (ret || stop_state || qcom_sysmon_shutdown_irq_state(pas->sysmon)) {
> +		dev_info(pas->dev, "Subsystem found stop state set, not attaching\n");

Another nitpick from the original message, the subsystem is stopped so
it cannot find anything, "Subsystem *has* stop state set" would probably
be better. :-)

Thanks,
Stephan
