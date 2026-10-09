Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A9C3C9893
	for <linux-remoteproc@vger.kernel.org>; Fri,  9 Oct 2026 14:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791556701; cv=none; b=p14zW8DKymuS25t8DaIqAifGDuFtJuVuSj3p5S2lEp2r9P/IAndA/k/pU/ffESgN8gUbshSymtpdpfVemET4V/bceu26sdZa0PpjM14/hmFN/PSPlVNKp+53q80H7u1GLgAKELV78W6hhYEc80Go3d1Cxr50ppnIDGnlHtfYpgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791556701; c=relaxed/simple;
	bh=WVChwmzOJXlx/K3vTVPxtUdHIg/2GuvU3lzTNBEWicI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HmaecMVsWPF318IPvO3rxlIrd2L0S0zFlIt+X/zBY1IVPwoLtdtVshhMfz5G9gGYOQ/ifh/3Hmh+Xi60370jwpfZFeAPOn9C7ME7cf97C+5bnp9qZ1SXvJuwCtEVsSnu0tOJ93qSoq21kw3raVPP3WzI+sByc9zo0KubUro5X/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DNYGoQ3H; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DNYGoQ3H"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a018dc1f98so36267715e9.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 09 Oct 2026 07:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791556697; x=1792161497; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ADsYu9bd8YELZpguZOm7XXP0fQTzNLazolnLueW7QDs=;
        b=DNYGoQ3HwemgVjPZ1pV85u9okaoHl6GT3EsHfdc+REIfB8KII5U74w8h0FwTnrGkDh
         DM9uCC5p4UcKVqxbN4OuLa1dwl5oYDTmJ7lW826RYTTqnM4ydsv+2EyYNVCOzTqDxKMR
         xDvxeGJ/CRFgSkNqQrz0lrssx/of2WLn1TU3RSkUU3Q8p7T2KIVMBrXE6QgzDpMs9yYv
         LQ5UQVgGeEYB0zqShHaXLU1yMOsjcGPAQOvjmeMHsfWMmxGRtBpjh0B6+dLhmT+cbJnV
         gsAiDXn5C1ncnbO5P+8iAkAL4UEW4U2pDg4p50XJtp8EDAh59J+4AmBupVdCXaDXdVli
         JkZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791556697; x=1792161497;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ADsYu9bd8YELZpguZOm7XXP0fQTzNLazolnLueW7QDs=;
        b=W9e+bHFvgQ+O88oX4enzZ+NGiN/aEZv5QMRunYj75NDVt1LJ7NgS4+1XHS0l6N8rnC
         ONYCp3SgIPCGBoZxUMZLi+MLdhGNDr5g1gC109vJ+q4SvWfbeMjPfw4PCxcvyiR3wX6X
         PgX14bcXRuxHShgGH2YpH3gN4gP9LNkV3dY4e3/ZGtv+VWCg0GIqWfg2CyRDRay7fO0+
         fTPd9fINE0Gx8Q0fVXoIfbpde0EUaiDyDYIce29lvXTJ/2bOH60vmCv6jU3Op6FFQBm2
         O8RK9/wcgcl4OungJ2YO4HZNRDF/ajfwJCADDYYvfHvt4dgw6zYIhvovpP073tsB4q+/
         UUIw==
X-Forwarded-Encrypted: i=1; AKwUvByI1VzZrOf3qVC9CYQU63R3ktXM0jsPKvq0nGFU3nj/n4IQ5od6vuGyDGdJ+1a8jJlITNh/jdBQwFVTCgZcjUi+@vger.kernel.org
X-Gm-Message-State: AFuF++lhKLhWD59aAIbpnYnpdwSNsisKslz0e94HoTFk/G8PEaJT4xR0
	wo2mWKgiJdU+0Y+nVHVFtkW6EfxpIxvpyJUvYVKSiS41J5eUje+1LubRc7DgX8KU2as=
X-Gm-Gg: AYBFou13Tq6nYiG2bYwT83VeZC76dJ6ofAPVK7DIw1Ag8OFKHBg+RIzo2pWrXJArpvb
	Li+pgoLi1U+rrNhqxNXrhrcJVlGCgRY+GMNfLqH5hBFVVE9tSJK5Wv3T9MQdX3CIx1MWeRQZIHf
	c0GaDJle89v3KxqrSTCovBe9t3bRm47GwoDDN08gIadaAsdhz4r4DFFr5p00M0+2kqVZFRRcEEH
	NyVw2pw7U/7xUqosJfG/SgzDrHfQ5oSBPwnyGDimosA1kW77JIYTs1uEhQVcpABeqYOuH0PiWBx
	YgBFQtNq4wwXs8npR46BcLz/5CVCFdzHwvW2yDweWy1cvogu5dyEfh0p62s3J9ofJxOPq6ZsCHz
	r+PnPUxf4SWP/9nfY8OZVfeeZvq0a9NPrrVLRB1HFkIR6mPogJmcTg1K/5/XCmoH2naeJfeW2Xm
	/fVNFK9M8Rg4dz4F1+nPgNnqLOTWxRmmxDvuI3Iec1Uhgky0kZmZCKuDXuS0msKTi+Qtrg9qLy1
	cuZl8Z0VdY=
X-Received: by 2002:a05:600c:c176:b0:4a0:c2a:485e with SMTP id 5b1f17b1804b1-4a18e4dce0cmr41026305e9.33.1791556696563;
        Fri, 09 Oct 2026 07:38:16 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff25:4f41:8f61:e8db:b29a:c15a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18e4225f4sm72506615e9.0.2026.10.09.07.38.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 07:38:16 -0700 (PDT)
Date: Fri, 9 Oct 2026 16:38:14 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] remoteproc: qcom: pas: Don't fail attach if the
 remote has crashed
Message-ID: <asj8VnSmKBF3nA79@linaro.org>
References: <20261006033550.2726451-1-shengchao.guo@oss.qualcomm.com>
 <20261006033550.2726451-3-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261006033550.2726451-3-shengchao.guo@oss.qualcomm.com>

On Tue, Oct 06, 2026 at 11:35:50AM +0800, Shawn Guo wrote:
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
> fatal interrupt right after attaching. Treat it the same way as
> q6v5_fatal_interrupt() does: clear q6v5.running, report the crash and
> let the attach succeed. The core completes the attach with balanced
> bookkeeping, and the crash handler then recovers the subsystem through
> the regular RPROC_ATTACHED -> RPROC_CRASHED path.  With running cleared,
> qcom_q6v5_request_stop() does not wait for a stop ack the dead remote
> cannot send, and handover_issued already prevents a spurious handover
> on stop.
> 

Hmmmm okay, I have never thought of this option, but reusing the
existing crash path as-is by making the attach succeed feels actually
quite clever! I suppose starting all the subdevs is really redundant in
this case, but the crash case is also nothing worth optimizing for.

> Assisted-by: LLM
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index 8f3d45c604c9..0ecd7688a54d 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -562,10 +562,14 @@ static int qcom_pas_attach(struct rproc *rproc)
>  		goto disable_running;
>  
>  	if (crash_state) {
> +		/*
> +		 * Complete the attach and let the crash handler recover the
> +		 * subsystem from the attached state, as for a crash reported
> +		 * by the fatal interrupt.
> +		 */
>  		dev_err(pas->dev, "Subsystem has crashed before driver probe\n");
> +		pas->q6v5.running = false;
>  		rproc_report_crash(rproc, RPROC_FATAL_ERROR);
> -		ret = -EINVAL;
> -		goto disable_running;
>  	}

My only nitpick is that it would be nice to fully reuse the normal crash
handling in this case, in particular the crash_reason logging inside
q6v5_fatal_interrupt(). Can you extract that part into a common function
and call it from here?

(I guess you could also call the existing q6v5_fatal_interrupt()
function since it should work as-is, but externally calling an interrupt
handler might be a bit weird...)

Thanks,
Stephan
