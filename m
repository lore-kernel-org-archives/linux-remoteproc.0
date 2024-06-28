Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991D858AB9
	for <linux-remoteproc@vger.kernel.org>; Fri, 28 Jun 2024 20:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719607740; cv=none; b=qYCqYZwSXqDmMh27reSpgj9H+sRi5frXFuYlfEcUjatnKh9gylXGuXAL/FmQA2pRFJpeQVp9ErbhQ0mxvuileuKTdAyN1Ivat/kK9NrP1iT5XAkWBDuyjekMjXsJd2oD+YIQ8+lmveMAfVlY8nKxxYsU9NxktjLlzH9DJr+T774=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719607740; c=relaxed/simple;
	bh=EAorGCg7r6Wr2iAgszF2xV+g4guLTY246hL8eXnlKRg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J1YqtZcV3Fig/0M/cTZGb+Jp1ufJW69wCcoDD/Y2WY+VTSvi0JIBZLEIvQe+OXi0YAIU+E5PxmHEZ5aJ6WI29+lLLVQhEuJjjNLtdCU6d9ejtenGjkxJ8FOJLrsuycPBqWcnzG5/P4svnnzAiLOqkndSfEov27XYo3I1Y6FoUis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xl1CP78Q; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xl1CP78Q"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-706680d3a25so804858b3a.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 28 Jun 2024 13:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719607738; x=1720212538; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bw1rfSo1C4qRY3HRMB+pO6r6mbChHtcPy6u6MEj5Nr4=;
        b=xl1CP78QfCu1EB2hxgGnsDYp/chUcG6fjsk1xhv7JyBHxthAv2DeTYcZB2oBS1IUWs
         pVeFmzXGSTk+5I9rhmSNeUkDCrEyD452HW8Br3YExf9tIN0pCGz+oTLEKh3akSLeBpEk
         UiIsGxMJ+MkkicN/Nn1tNx7B+uNb2QIt8oZTy6DoRwWqzpqx07+HDB+e6xA2ogYV6oHq
         tW2iYHfNAYJyLqkolEobeBNa4kAUBI9lao7I1CelMKrTj3mDjh+Yy1EqIbNyRyX/rFFk
         C6oIS+h5stluy18/fv4iwYIUO7hlA4gI2TTy5C5Kk3e3FP2tp/tVAVns0pIDkW/7WgnX
         JP5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719607738; x=1720212538;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bw1rfSo1C4qRY3HRMB+pO6r6mbChHtcPy6u6MEj5Nr4=;
        b=RgUi+r8LWLx+eCEhvszc/KnDO3KmM2r2FylcqUCg70HyDreRiAWAU8vj7WWAOH1DUk
         t/oA7dEFsElTihvR4bEs4j+vZiqRiQyJIQZwh3lu4crX91yEVuuzpG5qf0PdB9eVTigj
         2MMcPfdvKLPd9Vx0z4WGPg1txEG/n739GOgJLpGd9HO1MisIy0MSaWi7cB1ySrNwoFkm
         Qbiw0jZenG+FR2J7wmSt+/Rsm4+2yE2gLmrbifnsJx+tpCr8+x1J5+T0iPEGx7TON8wi
         Oc7UwP4dGuWaRoeUx8FBnmEXPJnIyw1/93VmQA57UJckuvlthWcg6veUh1nj6suNeBSj
         BgKA==
X-Forwarded-Encrypted: i=1; AJvYcCU3VErvAbLcSjK8mFRvMM0ZQRtAwbDHLw5wyN3Do9/dojMIB9Ug2gxcsLsegczPFwzLBXgI5DxOQgeGdDtj9Upxsze+vMhmUDbu66l6hrlUxw==
X-Gm-Message-State: AOJu0YyQuBUTDkPKp6nndD27qzfszwzlYJUNAOD1MJv9mTIuKvVtnJAA
	x+jVjRZShCYPtfJqFrqHDSnsyROA/bCntq0WAALm+QwPCXVV+v7Usvj/3pZq4rQ=
X-Google-Smtp-Source: AGHT+IGX4Fw9+VwQkv9g3qTdfbkQFctJIrZrvzzpGsPigGshTmpgjBQfbNZmxivMYcsvp/ye0ENynQ==
X-Received: by 2002:a05:6a20:c428:b0:1be:9068:aa61 with SMTP id adf61e73a8af0-1be9068acbamr9129734637.36.1719607737803;
        Fri, 28 Jun 2024 13:48:57 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:e53e:a53d:f473:181e])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-72c6a8df0e3sm1678587a12.36.2024.06.28.13.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 13:48:57 -0700 (PDT)
Date: Fri, 28 Jun 2024 14:48:53 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Richard Genoud <richard.genoud@bootlin.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, Suman Anna <s-anna@ti.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Udit Kumar <u-kumar1@ti.com>,
	Thomas Richard <thomas.richard@bootlin.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Hari Nagalla <hnagalla@ti.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] remoteproc: k3-r5: Introduce PM suspend/resume
 handlers
Message-ID: <Zn8htULTLxyfMiWk@p14s>
References: <20240621150058.319524-1-richard.genoud@bootlin.com>
 <20240621150058.319524-3-richard.genoud@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240621150058.319524-3-richard.genoud@bootlin.com>

On Fri, Jun 21, 2024 at 05:00:56PM +0200, Richard Genoud wrote:
> This patch adds the support for system suspend/resume to the ti_k3_R5
> remoteproc driver.
> 
> In order to save maximum power, the approach here is to shutdown
> completely the cores that were started by the kernel (i.e. those in
> RUNNING state).
> Those which were started before the kernel (in attached mode) will be
> detached.
> 
> The pm_notifier mechanism is used here because the remote procs firmwares
> have to be reloaded at resume, and thus the driver must have access to
> the file system were the firmware is stored.
> 
> On suspend, the running remote procs are stopped, the attached remote
> procs are detached and processor control released.
> 
> On resume, the reverse operation is done.
> 
> Based on work from: Hari Nagalla <hnagalla@ti.com>
> 
> Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
> ---
>  drivers/remoteproc/ti_k3_r5_remoteproc.c | 123 ++++++++++++++++++++++-
>  1 file changed, 121 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> index 39a47540c590..1f18b08618c8 100644
> --- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
> +++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> @@ -20,6 +20,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/remoteproc.h>
> +#include <linux/suspend.h>
>  #include <linux/reset.h>
>  #include <linux/slab.h>
>  
> @@ -112,6 +113,7 @@ struct k3_r5_cluster {
>  	struct list_head cores;
>  	wait_queue_head_t core_transition;
>  	const struct k3_r5_soc_data *soc_data;
> +	struct notifier_block pm_notifier;
>  };
>  
>  /**
> @@ -577,7 +579,8 @@ static int k3_r5_rproc_start(struct rproc *rproc)
>  		/* do not allow core 1 to start before core 0 */
>  		core0 = list_first_entry(&cluster->cores, struct k3_r5_core,
>  					 elem);
> -		if (core != core0 && core0->rproc->state == RPROC_OFFLINE) {
> +		if (core != core0 && (core0->rproc->state == RPROC_OFFLINE ||
> +				      core0->rproc->state == RPROC_SUSPENDED)) {

If I understand correctly, this is to address a possible race condition between
user space wanting to start core1 via sysfs while the system is being suspended.
Is this correct?  If so, please add a comment to explain what is going on.
Otherwise a comment is obviously needed.

>  			dev_err(dev, "%s: can not start core 1 before core 0\n",
>  				__func__);
>  			ret = -EPERM;
> @@ -646,7 +649,8 @@ static int k3_r5_rproc_stop(struct rproc *rproc)
>  		/* do not allow core 0 to stop before core 1 */
>  		core1 = list_last_entry(&cluster->cores, struct k3_r5_core,
>  					elem);
> -		if (core != core1 && core1->rproc->state != RPROC_OFFLINE) {
> +		if (core != core1 && core1->rproc->state != RPROC_OFFLINE &&
> +		    core1->rproc->state != RPROC_SUSPENDED) {
>  			dev_err(dev, "%s: can not stop core 0 before core 1\n",
>  				__func__);
>  			ret = -EPERM;
> @@ -1238,6 +1242,117 @@ static int k3_r5_rproc_configure_mode(struct k3_r5_rproc *kproc)
>  	return ret;
>  }
>  
> +static int k3_r5_rproc_suspend(struct k3_r5_rproc *kproc)
> +{
> +	unsigned int rproc_state = kproc->rproc->state;
> +	int ret;
> +
> +	if (rproc_state != RPROC_RUNNING && rproc_state != RPROC_ATTACHED)
> +		return 0;
> +
> +	if (rproc_state == RPROC_RUNNING)
> +		ret = rproc_shutdown(kproc->rproc);
> +	else
> +		ret = rproc_detach(kproc->rproc);
> +
> +	if (ret) {
> +		dev_err(kproc->dev, "Failed to %s rproc (%d)\n",
> +			(rproc_state == RPROC_RUNNING) ? "shutdown" : "detach",
> +			ret);
> +		return ret;
> +	}
> +
> +	kproc->rproc->state = RPROC_SUSPENDED;
> +
> +	return ret;
> +}
> +
> +static int k3_r5_rproc_resume(struct k3_r5_rproc *kproc)
> +{
> +	int ret;
> +
> +	if (kproc->rproc->state != RPROC_SUSPENDED)
> +		return 0;
> +
> +	ret = k3_r5_rproc_configure_mode(kproc);
> +	if (ret < 0)
> +		return -EBUSY;
> +
> +	/*
> +	 * ret > 0 for IPC-only mode
> +	 * ret == 0 for remote proc mode
> +	 */
> +	if (ret == 0) {
> +		/*
> +		 * remote proc looses its configuration when powered off.
> +		 * So, we have to configure it again on resume.
> +		 */
> +		ret = k3_r5_rproc_configure(kproc);
> +		if (ret < 0) {
> +			dev_err(kproc->dev, "k3_r5_rproc_configure failed (%d)\n", ret);
> +			return -EBUSY;
> +		}
> +	}
> +
> +	return rproc_boot(kproc->rproc);
> +}
> +
> +static int k3_r5_cluster_pm_notifier_call(struct notifier_block *bl,
> +					  unsigned long state, void *unused)
> +{
> +	struct k3_r5_cluster *cluster = container_of(bl, struct k3_r5_cluster,
> +						     pm_notifier);
> +	struct k3_r5_core *core;
> +	int ret;
> +
> +	switch (state) {
> +	case PM_HIBERNATION_PREPARE:
> +	case PM_RESTORE_PREPARE:
> +	case PM_SUSPEND_PREPARE:
> +		/* core1 should be suspended before core0 */
> +		list_for_each_entry_reverse(core, &cluster->cores, elem) {
> +			/*
> +			 * In LOCKSTEP mode, rproc is allocated only for
> +			 * core0
> +			 */
> +			if (core->rproc) {
> +				ret = k3_r5_rproc_suspend(core->rproc->priv);
> +				if (ret)
> +					dev_warn(core->dev,
> +						 "k3_r5_rproc_suspend failed (%d)\n", ret);
> +			}
> +
> +			ret = ti_sci_proc_release(core->tsp);
> +			if (ret)
> +				dev_warn(core->dev, "ti_sci_proc_release failed (%d)\n", ret);
> +		}
> +		break;
> +	case PM_POST_HIBERNATION:
> +	case PM_POST_RESTORE:
> +	case PM_POST_SUSPEND:
> +		/* core0 should be started before core1 */
> +		list_for_each_entry(core, &cluster->cores, elem) {
> +			ret = ti_sci_proc_request(core->tsp);
> +			if (ret)
> +				dev_warn(core->dev, "ti_sci_proc_request failed (%d)\n", ret);
> +
> +			/*
> +			 * In LOCKSTEP mode, rproc is allocated only for
> +			 * core0
> +			 */
> +			if (core->rproc) {
> +				ret = k3_r5_rproc_resume(core->rproc->priv);
> +				if (ret)
> +					dev_warn(core->dev,
> +						 "k3_r5_rproc_resume failed (%d)\n", ret);
> +			}
> +		}
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
>  static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
>  {
>  	struct k3_r5_cluster *cluster = platform_get_drvdata(pdev);
> @@ -1336,6 +1451,9 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
>  		}
>  	}
>  
> +	cluster->pm_notifier.notifier_call = k3_r5_cluster_pm_notifier_call;
> +	register_pm_notifier(&cluster->pm_notifier);
> +
>  	return 0;
>  
>  err_split:
> @@ -1402,6 +1520,7 @@ static void k3_r5_cluster_rproc_exit(void *data)
>  		rproc_free(rproc);
>  		core->rproc = NULL;
>  	}
> +	unregister_pm_notifier(&cluster->pm_notifier);
>  }
>  
>  static int k3_r5_core_of_get_internal_memories(struct platform_device *pdev,
