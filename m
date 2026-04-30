Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237DB29CE1
	for <linux-remoteproc@vger.kernel.org>; Thu, 30 Apr 2026 21:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777584121; cv=none; b=oCZeM6bwsYyzutg26qTEcKP8c4MfmFQH38oAeAtizqaUHiKTWJ3OcvjLPH3HVxM6Iv9p2QXn5STsuus4+eorYna98QUiZSdQjFOcmNlwLd/GPnwJqSpsA3hik3pLGIuuZoD6ql9/Mu5kLukYVzY/oLdx7OcomzZ98jn/y+WlXVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777584121; c=relaxed/simple;
	bh=ccigQjvafW1oY5YTxkhLrhtOn2STN3FITyr8Tvrijno=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lhkUBXkuF30yfYuAfkM0uRn01clkvyLRqTqxIPSXl9tfNy+inVnPnhSgryEbTTMOhDzhoeJf052KijG7H35UL7KEmvWmZQHQWjU0orEHfXsMNNWbteHYkU+7k22v/DvK4Srx7i3i2t+Bg52KRn8z1Xc/ZLEwa2d7x8Ur/hjOdnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lNaKCNUK; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lNaKCNUK"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-82f8892d4d6so674585b3a.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 30 Apr 2026 14:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777584119; x=1778188919; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7QAcFENGAWMvRKtX38HM/K9V9AEirES0LrBY8xwrc44=;
        b=lNaKCNUKdHA6zzHWy0wdWh33TCIB+SlGgNyffaeS/DjVQjVmLW2YjA+2w5YHF05LDx
         pKI2FczfPE0/93JMgAWwnVe9ipYh669NqNdpRgIxakoBofSGtH4/Yb552MlA6mvPz+Ck
         d3HQ82pgreqlMrHYcCr8J1Hvz4zHAVKC1R3tK6B7PAZOibzUMgGmmsn2o3x8cLdlDvBO
         EIMRlv6/4NbSQdxj2IUwafCQNMnFfMK32ge+kBNE6lGnHfAZNaz7EDyVCKre0PuK6AZw
         ubFEn+cfqRpviCz6+dqNZZzukPe6w8oLaIZqydsSFjBE8uWTNQM2p5smPkNXF9Hx6TLJ
         xh3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777584119; x=1778188919;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7QAcFENGAWMvRKtX38HM/K9V9AEirES0LrBY8xwrc44=;
        b=f0OCKWkcT2AobJ4lqpIEgCmm9zqrNVX8rafU9Q83SlXPMZHCa5W2wXsd1QaWPehOvI
         XsH2+Xnwh1FDMYUuL0w8Je1kJwn0jVIVtUE1KoqdPW6Rb3TqBxTITc/bpw5vIcyNSPvB
         sNqKwTSudZk4qLEkD8tArGkaik0Wk+lqHHcwWbRorBah8k6RqaKt0adJQgRelzkZXzBJ
         MWLJ2EQWv5GJZaaV23FBSByWWK9pwc03f3ztkibCrL1mPgRQtm/EuPsucK0CbYGnkSo0
         z7CAluViCMniP6asQf9WPP7xIJGojEcz3wm5ugATDg6iggAWrcOdKCW5gW/I9oU8EZ9U
         1Z9A==
X-Forwarded-Encrypted: i=1; AFNElJ+wF9k3/9qZwKpvsvpsk0f9622Di7SLzq6j/aVn167wYOwJ3CC3F0qOHBLgWRlkKPStUD8Io0WTtB+wa2U28xme@vger.kernel.org
X-Gm-Message-State: AOJu0YwYsxWqODKs69rHQ7vW7wJakNkpE9Co3fAIJ+N16fRzYbeFywoe
	9FYDreKWixS64Vot01rHzZh5CitDNovx6wWe2Dtf+U4Und90wn+cylD5poV/dUb4WFs=
X-Gm-Gg: AeBDiesWzEhrWiXKNJvGwTInteSRHOXTKEt/RrHqUSk6fp6pTSiNssVNoNxL7c4R+qN
	TE9mr8E6ZZcgcrHRva3wOz90ND9FKTGRP/oDD/j9mFpaZ2qJ+sHeVzmZRwjIzF3GUNftB78S/X8
	gNmNP/QbFiGZfYvkjZf7RmiXdsrStbt2k8Y9Z/fPWC+syR3WjnKZaeEkFlAuvL7wiLHsoMD8SNM
	qeuz12lEWkJHzr/Eync/++hgq53GXjkaVS8a4CFIUirdxiy7MvzolI9lRgnu4DTXv+kfdoMskGW
	Lv+RVaH0IOhfVQwxphqkuSdvYYq4N+JyufpICf1GpwTgxHSJP+BhcIVm4A8YYVZgU46X9aFHTGC
	1zpup3DIMWfNPHvwgyg3HsVHWxLY9K42SuYcP5MNCy7yijCVRKncz5avlZFIdMBlM5uYKtsqXsx
	1A+d2kOo/fkeh1ROLeBltmMCuBKmrqZR899BvE
X-Received: by 2002:a05:6a00:4298:b0:82c:212a:a9b5 with SMTP id d2e1a72fcca58-834fdc6b1a1mr5314878b3a.36.1777584119286;
        Thu, 30 Apr 2026 14:21:59 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:8054:625e:b15:dac0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83515b1d554sm533175b3a.46.2026.04.30.14.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 14:21:58 -0700 (PDT)
Date: Thu, 30 Apr 2026 15:21:56 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: michal.simek@amd.com, andersson@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v3] remoteproc: xlnx: check remote core state
Message-ID: <afPH9BRwmpCZnvhX@p14s>
References: <20260428221855.313752-1-tanmay.shah@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428221855.313752-1-tanmay.shah@amd.com>

On Tue, Apr 28, 2026 at 03:18:56PM -0700, Tanmay Shah wrote:
> The remote state is set to RPROC_DETACHED if the resource table is found
> in the memory. However, this can be wrong if the remote is not started,
> but firmware is still loaded in the memory. Use PM_GET_NODE_STATUS call
> to the firmware to request the state of the RPU node. If the RPU is
> actually out of reset and running, only then move the remote state to
> RPROC_DETACHED, otherwise keep the remote state to RPROC_OFFLINE.
> 
> Fixes: bca4b02ef92e ("remoteproc: xlnx: Add attach detach support")
> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> ---
> 
> Changes in v3:
>   - add fixes tag
> 
> Changes in v2:
>   - fix subject line: %s/node/core/
>   - add comment explaining optional resource table availability in the
> 
>  drivers/firmware/xilinx/zynqmp.c        | 28 +++++++++++++++
>  drivers/remoteproc/xlnx_r5_remoteproc.c | 46 +++++++++++++++++++------
>  include/linux/firmware/xlnx-zynqmp.h    | 21 +++++++++++
>  3 files changed, 85 insertions(+), 10 deletions(-)
>

Applied.

Thanks,
Mathieu
 
> diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
> index fbe8510f4927..af838b2dc327 100644
> --- a/drivers/firmware/xilinx/zynqmp.c
> +++ b/drivers/firmware/xilinx/zynqmp.c
> @@ -1450,6 +1450,34 @@ int zynqmp_pm_get_node_status(const u32 node, u32 *const status,
>  }
>  EXPORT_SYMBOL_GPL(zynqmp_pm_get_node_status);
>  
> +/**
> + * zynqmp_pm_get_rpu_node_status - PM call to request a RPU node's current power state
> + * @node:		ID of the RPU component or sub-system in question
> + * @status:		Current operating state of the requested RPU node.
> + * @requirements:	Current requirements asserted on the RPU node.
> + * @usage:		Usage information, used for RPU slave nodes only:
> + *			PM_USAGE_NO_MASTER	- No master is currently using
> + *						  the node
> + *			PM_USAGE_CURRENT_MASTER	- Only requesting master is
> + *						  currently using the node
> + *			PM_USAGE_OTHER_MASTER	- Only other masters are
> + *						  currently using the node
> + *			PM_USAGE_BOTH_MASTERS	- Both the current and at least
> + *						  one other master is currently
> + *						  using the node
> + *
> + * Return:		Returns status, either success or error+reason
> + */
> +int zynqmp_pm_get_rpu_node_status(const u32 node, u32 *const status,
> +				  u32 *const requirements, u32 *const usage)
> +{
> +	if (zynqmp_pm_feature(PM_GET_NODE_STATUS) < PM_API_VERSION_2)
> +		return -EOPNOTSUPP;
> +
> +	return zynqmp_pm_get_node_status(node, status, requirements, usage);
> +}
> +EXPORT_SYMBOL_GPL(zynqmp_pm_get_rpu_node_status);
> +
>  /**
>   * zynqmp_pm_force_pwrdwn - PM call to request for another PU or subsystem to
>   *             be powered down forcefully
> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
> index 50a9974f3202..45a62cb98072 100644
> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> @@ -948,16 +948,6 @@ static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
>  		goto free_rproc;
>  	}
>  
> -	/*
> -	 * If firmware is already available in the memory then move rproc state
> -	 * to DETACHED. Firmware can be preloaded via debugger or by any other
> -	 * agent (processors) in the system.
> -	 * If firmware isn't available in the memory and resource table isn't
> -	 * found, then rproc state remains OFFLINE.
> -	 */
> -	if (!zynqmp_r5_get_rsc_table_va(r5_core))
> -		r5_rproc->state = RPROC_DETACHED;
> -
>  	r5_core->rproc = r5_rproc;
>  	return r5_core;
>  
> @@ -1210,6 +1200,7 @@ static int zynqmp_r5_core_init(struct zynqmp_r5_cluster *cluster,
>  {
>  	struct device *dev = cluster->dev;
>  	struct zynqmp_r5_core *r5_core;
> +	u32 req, usage, status;
>  	int ret = -EINVAL, i;
>  
>  	r5_core = cluster->r5_cores[0];
> @@ -1255,6 +1246,41 @@ static int zynqmp_r5_core_init(struct zynqmp_r5_cluster *cluster,
>  		ret = zynqmp_r5_get_sram_banks(r5_core);
>  		if (ret)
>  			return ret;
> +
> +		/*
> +		 * It is possible that firmware is loaded into the memory, but
> +		 * RPU (remote) is not running. In such case, RPU state will be
> +		 * moved to RPROC_DETACHED wrongfully. To avoid it first make
> +		 * sure RPU is power-on and out of reset before parsing for the
> +		 * resource table.
> +		 */
> +		ret = zynqmp_pm_get_rpu_node_status(r5_core->pm_domain_id,
> +						    &status, &req, &usage);
> +		if (ret) {
> +			dev_warn(r5_core->dev,
> +				 "failed to get rpu node status, err %d\n", ret);
> +			continue;
> +		}
> +
> +		/*
> +		 * If RPU state is power on and out of reset i.e. running, then
> +		 * assign RPROC_DETACHED state. If the RPU is not out of reset
> +		 * then do not attempt to attach to the remote processor.
> +		 */
> +		if (status == PM_NODE_RUNNING) {
> +			/*
> +			 * Not all the firmware that is running on the remote
> +			 * core is expected to have the resource table. The
> +			 * firmware might not use RPMsg at all, and in that case
> +			 * resource table becomes irrelevant. However, we still
> +			 * need to make sure that running core is not reported
> +			 * as offline. so do not decide remote core state based
> +			 * on the resource table availability
> +			 */
> +			if (zynqmp_r5_get_rsc_table_va(r5_core))
> +				dev_dbg(r5_core->dev, "rsc tbl not found\n");
> +			r5_core->rproc->state = RPROC_DETACHED;
> +		}
>  	}
>  
>  	return 0;
> diff --git a/include/linux/firmware/xlnx-zynqmp.h b/include/linux/firmware/xlnx-zynqmp.h
> index d70dcd462b44..7e27b0f7bf7e 100644
> --- a/include/linux/firmware/xlnx-zynqmp.h
> +++ b/include/linux/firmware/xlnx-zynqmp.h
> @@ -542,6 +542,18 @@ enum pm_gem_config_type {
>  	GEM_CONFIG_FIXED = 2,
>  };
>  
> +/**
> + * enum pm_node_status - Device node status provided by xilpm fw
> + * @PM_NODE_UNUSED: Device is not used
> + * @PM_NODE_RUNNING: Device is power-on and out of reset
> + * @PM_NODE_HALT: Device is power-on but in the reset state
> + */
> +enum pm_node_status {
> +	PM_NODE_UNUSED = 0,
> +	PM_NODE_RUNNING = 1,
> +	PM_NODE_HALT = 12,
> +};
> +
>  /**
>   * struct zynqmp_pm_query_data - PM query data
>   * @qid:	query ID
> @@ -630,6 +642,8 @@ int zynqmp_pm_set_rpu_mode(u32 node_id, enum rpu_oper_mode rpu_mode);
>  int zynqmp_pm_set_tcm_config(u32 node_id, enum rpu_tcm_comb tcm_mode);
>  int zynqmp_pm_get_node_status(const u32 node, u32 *const status,
>  			      u32 *const requirements, u32 *const usage);
> +int zynqmp_pm_get_rpu_node_status(const u32 node, u32 *const status,
> +				  u32 *const requirements, u32 *const usage);
>  int zynqmp_pm_set_sd_config(u32 node, enum pm_sd_config_type config, u32 value);
>  int zynqmp_pm_set_gem_config(u32 node, enum pm_gem_config_type config,
>  			     u32 value);
> @@ -939,6 +953,13 @@ static inline int zynqmp_pm_get_node_status(const u32 node, u32 *const status,
>  	return -ENODEV;
>  }
>  
> +static inline int zynqmp_pm_get_rpu_node_status(const u32 node, u32 *const status,
> +						u32 *const requirements,
> +						u32 *const usage)
> +{
> +	return -ENODEV;
> +}
> +
>  static inline int zynqmp_pm_set_sd_config(u32 node,
>  					  enum pm_sd_config_type config,
>  					  u32 value)
> 
> base-commit: fcdf2df56d34a3f04cab0725c5bc3abdaa73c2be
> -- 
> 2.34.1
> 
