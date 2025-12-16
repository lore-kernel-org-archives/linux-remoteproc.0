Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C06633F362
	for <linux-remoteproc@vger.kernel.org>; Tue, 16 Dec 2025 22:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765923844; cv=none; b=jd3YXMmtvs/gA/zvihTt5WuAoZKweE/2O197Cp0m8pUpym0Rh1Ot6JLbCFSyBYyp89LQ0rf38hK0DZSnrBXZynZFy4yEI1wQHpWE7hXMy8kkXbhsX/UUqHVL3k7C7FnwUixXfv9J8Ehd27N71GRgbtyZ+EL+z2eSQRKpew/ua2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765923844; c=relaxed/simple;
	bh=f+/nNAjSGYY2ENuv/b+fDYiEOTkax2ilfzfed+Spv2M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QxVubcfj4laaesFM2tkebBI7fMURgADIzSP3likQP6mExkHm6Oa11WW1SAzingUi907fJFwNy2MT7Rhl9dyEaTYixzIUKW4pRVWRBX1ttXsm/+NDdoqUvkZargSQpkvF2YVsoLJKfmkEuEe2f1B2NywaM0MsmVPItCvDzP0zcoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OFGm40Fm; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OFGm40Fm"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7e2762ad850so5377772b3a.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 16 Dec 2025 14:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765923840; x=1766528640; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AdTRCBs5e2VEb/2+0jd+GH5sExE/IfnulepilsSOVBM=;
        b=OFGm40Fm6WemTHaZ4ukbbFHiWL9Tq4jQRdWJYCSLkH54RVmW0L48PMsTwv0G98z7HX
         TPMzEOuUtNnG2/XOHRv5QEC5R+nt3bOQTkxDL/iS08oXBqCGSC4bggdfUiZ44VMvAcVe
         zO5MEoETBc09UTecEcsSomhCvmy1vMrwgQuQFHEo2AbRLI3t40vfJD6OWTgrO3vFLnh7
         GVakvurXh2EA0c/x2ZZjECX7K87qPYLjRagA3hckVjMjw49R+btDOuQwWHOSk5xkDtK7
         AnoW4Es8tlu+WTxgfY97Dkxj4Gq4GkPHDxIE7CRkqna0lC3ez+f1LnMLutZTmo4pcskX
         lahw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765923840; x=1766528640;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AdTRCBs5e2VEb/2+0jd+GH5sExE/IfnulepilsSOVBM=;
        b=daGqaWBYahviVYgyS7l0wK7uAgcBOB/xAbFNoZ8cxC148l61NHHzKIM6KBf5U7Qnem
         obShMKHK2i1ARmMRD1B2FSA7LNfV5FRm7qDIf4uDThhjJgRA6VCvXezv83YABiSNpzif
         j4XX8WeHEDNsDy06NoLjDZpjyt/e9gJEM+xRfs+fRvcdGvnzaOg+ajs41GALvwmuZLzd
         mzbDfunKKJfywy+L3Y7NYCjVbc8YubmT6pY9TYe0D+41oLGQKEBEp4FKYlRfTgLcaavm
         PXCnFD38GDnILLzvVTp0OTU0QcLG95E9ZoVl0HWEqxB98nVIIq1jobqp/sMAvQnaOg6P
         xAkw==
X-Forwarded-Encrypted: i=1; AJvYcCXWr7D37m7xqRv9DjvlObyZyBQ/kuiaB1eUWjEYo0jfLW4e4xmezy+q+jzyeD7Ak1dhoGYExe8P0cXgRbBFvyMr@vger.kernel.org
X-Gm-Message-State: AOJu0YymwccLQxXbNGskqYHMPX189aRLcrf5ynk1dZjQDIZYYsNzDtRX
	XBP0Wcgbv2xCPppX/W2C63WaW7oeQXN1zTOiTCyWJAScPdnHjfroktegIy0VALu0F4I=
X-Gm-Gg: AY/fxX64POGdRTp7pk0ynZwBbUUxQbsR9RMvl423qdn9pYb3E6+6s2lJN/TEGt+BSaV
	gHk4PGijZ5O9/WiNDQYa3KEkKUf6mr7JhMHLpzsvp+Q0SMFdyn4GfA71W+viUivQDe+N51YLC8e
	vmNW6DDV6JttYWOsVlqBdLtrXmloqco1Dy3RrQq1t1ZC47Dk0LJ2rb3krW/+Hon18lN/ZV8WvMt
	4urG1WDvAx6huxXnvUeZooL0s2spyVYCvaaA+oTWDVLrhy0WFuQ+rRb7a3NXKvmit6Uy9njT9Iz
	R+i6ugqYrZKGhkml2YhM291uc4JIRb3O0atowIwhBgZPq5bm6DKdjI55lUT+spZy+kw9IVy5vV6
	MuF6zImKFcHbueedgSjJF9EXDVK84AxMomK5Hm3cjOeiiI2snGAHX/Lyxx3aCyxFsDuc/15mxtB
	dX4mRx9q3UYc4Z6Q==
X-Google-Smtp-Source: AGHT+IFw34ekhYpLgwTzgsA5c1I7XEJGtx0plUdIT3tSiewP94ziLUssbb0E5VHPSHCWe5aGzFT8cw==
X-Received: by 2002:a05:6a20:6a24:b0:35d:cc9a:8bbb with SMTP id adf61e73a8af0-369afc00b9cmr16283445637.47.1765923840199;
        Tue, 16 Dec 2025 14:24:00 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:ba5d:91e2:900a:fb01])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c0c2c963b53sm16297176a12.36.2025.12.16.14.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 14:23:59 -0800 (PST)
Date: Tue, 16 Dec 2025 15:23:57 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Beleswar Padhi <b-padhi@ti.com>
Cc: andersson@kernel.org, richard.genoud@bootlin.com, afd@ti.com,
	hnagalla@ti.com, jm@ti.com, u-kumar1@ti.com, jan.kiszka@siemens.com,
	christophe.jaillet@wanadoo.fr, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] remoteproc: k3: support for graceful shutdown of
 remote cores
Message-ID: <aUHb_ax7rn3K_QeW@p14s>
References: <20251125083746.2605721-1-b-padhi@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125083746.2605721-1-b-padhi@ti.com>

Hi Beleswar,

On Tue, Nov 25, 2025 at 02:07:46PM +0530, Beleswar Padhi wrote:
> From: Richard Genoud <richard.genoud@bootlin.com>
> 
> Introduce software IPC handshake between the host running Linux and the
> remote processors to gracefully stop/reset the remote core.
> 
> Upon a stop request, remoteproc driver sends a RP_MBOX_SHUTDOWN mailbox
> message to the remotecore.
> The remote core is expected to:
> - relinquish all the resources acquired through Device Manager (DM)
> - disable its interrupts
> - send back a mailbox acknowledgment RP_MBOX_SHUDOWN_ACK
> - enter WFI state.
> 
> Meanwhile, the K3 remoteproc driver does:
> - wait for the RP_MBOX_SHUTDOWN_ACK from the remote core
> - wait for the remoteproc to enter WFI state
> - reset the remote core through device manager
> 
> Based on work from: Hari Nagalla <hnagalla@ti.com>
> 
> Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
> [b-padhi@ti.com: Extend support to all rprocs]
> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> ---
> v2: Changelog:
> 1. Extend graceful shutdown support for all rprocs (R5, DSP, M4)
> 2. Halt core only if SHUTDOWN_ACK is received from rproc and it has
> entered WFI state.
> 3. Convert return type of is_core_in_wfi() to bool. Works better with
> readx_poll_timeout() condition.
> 4. Cast RP_MBOX_SHUTDOWN to uintptr_t to suppress compiler warnings
> when void* is 64 bit.
> 5. Wrapped Graceful shutdown code in the form of notify_shutdown_rproc
> function.
> 6. Updated commit message to fix minor typos and such.
> 
> Link to v1:
> https://lore.kernel.org/all/20240621150058.319524-5-richard.genoud@bootlin.com/
> 
> Testing done:
> 1. Tested Boot across all TI K3 EVM/SK boards.
> 2. Tested IPC on all TI K3 J7* EVM/SK boards (& AM62x SK).
> 4. Tested R5 rprocs can now be shutdown and powered back on
> from userspace.
> 3. Tested that each patch in the series generates no new
> warnings/errors.
> 
>  drivers/remoteproc/omap_remoteproc.h      |  9 ++-
>  drivers/remoteproc/ti_k3_common.c         | 72 +++++++++++++++++++++++
>  drivers/remoteproc/ti_k3_common.h         |  4 ++
>  drivers/remoteproc/ti_k3_dsp_remoteproc.c |  2 +
>  drivers/remoteproc/ti_k3_m4_remoteproc.c  |  2 +
>  drivers/remoteproc/ti_k3_r5_remoteproc.c  |  5 ++
>  6 files changed, 93 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/omap_remoteproc.h b/drivers/remoteproc/omap_remoteproc.h
> index 828e13256c023..c008f11fa2a43 100644
> --- a/drivers/remoteproc/omap_remoteproc.h
> +++ b/drivers/remoteproc/omap_remoteproc.h
> @@ -42,6 +42,11 @@
>   * @RP_MBOX_SUSPEND_CANCEL: a cancel suspend response from a remote processor
>   * on a suspend request
>   *
> + * @RP_MBOX_SHUTDOWN: shutdown request for the remote processor
> + *
> + * @RP_MBOX_SHUTDOWN_ACK: successful response from remote processor for a
> + * shutdown request. The remote processor should be in WFI state short after.
> + *
>   * Introduce new message definitions if any here.
>   *
>   * @RP_MBOX_END_MSG: Indicates end of known/defined messages from remote core
> @@ -59,7 +64,9 @@ enum omap_rp_mbox_messages {
>  	RP_MBOX_SUSPEND_SYSTEM	= 0xFFFFFF11,
>  	RP_MBOX_SUSPEND_ACK	= 0xFFFFFF12,
>  	RP_MBOX_SUSPEND_CANCEL	= 0xFFFFFF13,
> -	RP_MBOX_END_MSG		= 0xFFFFFF14,
> +	RP_MBOX_SHUTDOWN	= 0xFFFFFF14,
> +	RP_MBOX_SHUTDOWN_ACK	= 0xFFFFFF15,
> +	RP_MBOX_END_MSG		= 0xFFFFFF16,
>  };
>  
>  #endif /* _OMAP_RPMSG_H */
> diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
> index 56b71652e449f..5d469f65115c3 100644
> --- a/drivers/remoteproc/ti_k3_common.c
> +++ b/drivers/remoteproc/ti_k3_common.c
> @@ -18,7 +18,9 @@
>   *	Hari Nagalla <hnagalla@ti.com>
>   */
>  
> +#include <linux/delay.h>
>  #include <linux/io.h>
> +#include <linux/iopoll.h>
>  #include <linux/mailbox_client.h>
>  #include <linux/module.h>
>  #include <linux/of_address.h>
> @@ -69,6 +71,10 @@ void k3_rproc_mbox_callback(struct mbox_client *client, void *data)
>  	case RP_MBOX_ECHO_REPLY:
>  		dev_info(dev, "received echo reply from %s\n", rproc->name);
>  		break;
> +	case RP_MBOX_SHUTDOWN_ACK:
> +		dev_dbg(dev, "received shutdown_ack from %s\n", rproc->name);
> +		complete(&kproc->shutdown_complete);
> +		break;
>  	default:
>  		/* silently handle all other valid messages */
>  		if (msg >= RP_MBOX_READY && msg < RP_MBOX_END_MSG)
> @@ -188,6 +194,67 @@ int k3_rproc_request_mbox(struct rproc *rproc)
>  }
>  EXPORT_SYMBOL_GPL(k3_rproc_request_mbox);
>  
> +/**
> + * is_core_in_wfi - Utility function to check core status
> + * @kproc: remote core pointer used for checking core status
> + *
> + * This utility function is invoked by the shutdown sequence to ensure
> + * the remote core is in wfi, before asserting a reset.
> + */
> +bool is_core_in_wfi(struct k3_rproc *kproc)
> +{
> +	int ret;
> +	u64 boot_vec;
> +	u32 cfg, ctrl, stat;
> +
> +	ret = ti_sci_proc_get_status(kproc->tsp, &boot_vec, &cfg, &ctrl, &stat);
> +	if (ret)
> +		return false;
> +
> +	return (bool)(stat & PROC_BOOT_STATUS_FLAG_CPU_WFI);
> +}
> +EXPORT_SYMBOL_GPL(is_core_in_wfi);
> +
> +/**
> + * notify_shutdown_rproc - Prepare the remoteproc for a shutdown
> + * @kproc: remote core pointer used for sending mbox msg
> + *
> + * This function sends the shutdown prepare message to remote processor and
> + * waits for an ACK. Further, it checks if the remote processor has entered
> + * into WFI mode. It is invoked in shutdown sequence to ensure the rproc
> + * has relinquished its resources before asserting a reset, so the shutdown
> + * happens cleanly.
> + */
> +int notify_shutdown_rproc(struct k3_rproc *kproc)
> +{
> +	bool wfi_status = false;
> +	int ret;
> +
> +	reinit_completion(&kproc->shutdown_complete);
> +
> +	ret = mbox_send_message(kproc->mbox, (void *)(uintptr_t)RP_MBOX_SHUTDOWN);
> +	if (ret < 0) {
> +		dev_err(kproc->dev, "PM mbox_send_message failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = wait_for_completion_timeout(&kproc->shutdown_complete,
> +					  msecs_to_jiffies(5000));
> +	if (ret == 0) {
> +		dev_err(kproc->dev, "%s: timeout waiting for rproc completion event\n",
> +			__func__);
> +		return -EBUSY;
> +	}
> +


Won't that create an issue on systems with an older FW that doesn't send a
RP_MBOX_SHUDOWN_ACK message?  Unless I'm missing something, this kind of feature
needs to be backward compatible.   

Thanks,
Mathieu

> +	ret = readx_poll_timeout(is_core_in_wfi, kproc, wfi_status, wfi_status,
> +				 200, 2000);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(notify_shutdown_rproc);
> +
>  /*
>   * The K3 DSP and M4 cores have a local reset that affects only the CPU, and a
>   * generic module reset that powers on the device and allows the internal
> @@ -288,6 +355,11 @@ EXPORT_SYMBOL_GPL(k3_rproc_start);
>  int k3_rproc_stop(struct rproc *rproc)
>  {
>  	struct k3_rproc *kproc = rproc->priv;
> +	int ret;
> +
> +	ret = notify_shutdown_rproc(kproc);
> +	if (ret)
> +		return ret;
>  
>  	return k3_rproc_reset(kproc);
>  }
> diff --git a/drivers/remoteproc/ti_k3_common.h b/drivers/remoteproc/ti_k3_common.h
> index aee3c28dbe510..2a025f4894b82 100644
> --- a/drivers/remoteproc/ti_k3_common.h
> +++ b/drivers/remoteproc/ti_k3_common.h
> @@ -22,6 +22,7 @@
>  #define REMOTEPROC_TI_K3_COMMON_H
>  
>  #define KEYSTONE_RPROC_LOCAL_ADDRESS_MASK	(SZ_16M - 1)
> +#define PROC_BOOT_STATUS_FLAG_CPU_WFI		0x00000002
>  
>  /**
>   * struct k3_rproc_mem - internal memory structure
> @@ -92,6 +93,7 @@ struct k3_rproc {
>  	u32 ti_sci_id;
>  	struct mbox_chan *mbox;
>  	struct mbox_client client;
> +	struct completion shutdown_complete;
>  	void *priv;
>  };
>  
> @@ -115,4 +117,6 @@ int k3_rproc_of_get_memories(struct platform_device *pdev,
>  void k3_mem_release(void *data);
>  int k3_reserved_mem_init(struct k3_rproc *kproc);
>  void k3_release_tsp(void *data);
> +bool is_core_in_wfi(struct k3_rproc *kproc);
> +int notify_shutdown_rproc(struct k3_rproc *kproc);
>  #endif /* REMOTEPROC_TI_K3_COMMON_H */
> diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> index d6ceea6dc920e..156ae09d8ee25 100644
> --- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> +++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
> @@ -133,6 +133,8 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> +	init_completion(&kproc->shutdown_complete);
> +
>  	ret = k3_rproc_of_get_memories(pdev, kproc);
>  	if (ret)
>  		return ret;
> diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
> index 3a11fd24eb52b..64d99071279b0 100644
> --- a/drivers/remoteproc/ti_k3_m4_remoteproc.c
> +++ b/drivers/remoteproc/ti_k3_m4_remoteproc.c
> @@ -90,6 +90,8 @@ static int k3_m4_rproc_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> +	init_completion(&kproc->shutdown_complete);
> +
>  	ret = k3_rproc_of_get_memories(pdev, kproc);
>  	if (ret)
>  		return ret;
> diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> index 04f23295ffc10..8748dc6089cc2 100644
> --- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
> +++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> @@ -533,6 +533,10 @@ static int k3_r5_rproc_stop(struct rproc *rproc)
>  	struct k3_r5_cluster *cluster = core->cluster;
>  	int ret;
>  
> +	ret = notify_shutdown_rproc(kproc);
> +	if (ret)
> +		return ret;
> +
>  	/* halt all applicable cores */
>  	if (cluster->mode == CLUSTER_MODE_LOCKSTEP) {
>  		list_for_each_entry(core, &cluster->cores, elem) {
> @@ -1129,6 +1133,7 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
>  			goto out;
>  		}
>  
> +		init_completion(&kproc->shutdown_complete);
>  init_rmem:
>  		k3_r5_adjust_tcm_sizes(kproc);
>  
> -- 
> 2.34.1
> 
