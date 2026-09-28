Received: from mail-pj2-f39.google.com (mail-pj2-f39.google.com [74.125.227.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684944E0205
	for <linux-remoteproc@vger.kernel.org>; Mon, 28 Sep 2026 17:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790616860; cv=none; b=f52X6ne/BUzgcXKCFKZqbQgSQGf5gfaz+kh/8ABQyB4YzniV8W3ZKQGAsIBHtGrlDTvqxkt1LUR2vPg/CjLUZC3Bfr//6fT6kkac/2Dkxm2IC8jP/wsAxOpBvwXeDsu02pHgFJSHyCNO6aQD1CXc4fsTGypZkWglRhlN1dVsbo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790616860; c=relaxed/simple;
	bh=zVmtAsUqPSMNoqDH/7D+NMhiQ2/HTbjTJjk8eGyLuWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a4f4R2uP8S4X+katGSTj5SesOUVYpzAHT3lJlAFTgdXeVwqeSkofMgYiqf8vKLBvJTganUykdPNdXJbR1bkG15SX9YKFRoRqY3cENFoigaKQn0k9KOySUuFy16UB45l8JbG0wbTW9Cfg6/BTQxz5EIAHEgAMci0DFFtGokmHjBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dv2XO52x; arc=none smtp.client-ip=74.125.227.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dv2XO52x"
Received: by mail-pj2-f39.google.com with SMTP id 98e67ed59e1d1-3a498cb99b3so57434a91.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 28 Sep 2026 10:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790616858; x=1791221658; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MM49i+L9UDpZ4v503sv48jIdzXYqrYoHmJErHUgk4sU=;
        b=dv2XO52xe/+LtPfJYk2sir64oSyw2Da+bZuoH8LPJeJKZjjGADKLa+t8XVEW1oT9Ak
         AAeNGvo66A5gHhPp5oaAm+L+ydJZFVDkYaxScs584uxxywaqXPD/EiJEd6RYLuo4+Q9r
         trvZQvmlYQNy/DBD7gtjtjkxXGufbZXQd9v4oocC6egXcuTFryIgPdYVGy5gnLLhUAvW
         MmqzW/UDA4Pvuj8SHAOpZJlNCTFSK2bpfE9j7TcVY1aEHiVwkCBaVNU8JmKEm6CzOZIb
         ME27fKiqdZXL+EEEYlbfY4M4wR+jbhoN4f0Qqn/ezE8gEB4QyK6fhCqAWlb3+YnG40vJ
         gI1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790616858; x=1791221658;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MM49i+L9UDpZ4v503sv48jIdzXYqrYoHmJErHUgk4sU=;
        b=xHoaoYQzRWxgk6qATt3VueSBU3SehkHbGiSR0i6W3D5ZaeH6x4QGJFHn9mDwcCIryM
         niC0CsZ5Iqqi5WRfuz9YUhKzNzZ35j6EV43ZzxMBj4ZFVhO50Xj0B7Z0W9HwbZXFif9s
         S1bAqKycAWLoLANRV4KsfNxHuZ1Oev5DMxKiXmpJard0u1+ldNxMrhEmUjzFTRhodvc0
         zkLjZhY5eK/vXmIGoo78WrXXZ+P68oJkWmuGFRT9CWzyci1EoZC1x7DuVzNf5TOQc7vm
         vHF0rXGQh6qo7aR++IEycsgag1xFErOmB4HL14sIsT/fio7+LZTxn8Z9H50qqC9L0tJ/
         EnHg==
X-Forwarded-Encrypted: i=1; AKwUvByiG/MQn+DnfreYizQh/dUMBF7YP9teIAtaNBvFqJtODtFxyWGcis+ven/1IzKX2rjrAzf/FPKGk0LqZnUnyEIw@vger.kernel.org
X-Gm-Message-State: AFq9FYLZMvk0D/CoLMRYc2lMkP3WncRUdsoaK75yBitGjFwnfT3iEW7r
	k9faQ3j6/VrDzHS9is66uot11oOQXgUbzKg2potPW39RrzdV8bGKe01C52Y+R9xSLkk=
X-Gm-Gg: AYBFou0x0zCiAPl7bQ1f4deCZrpkdaQ5F2H7NKICwRs7ZOw+aqZZZMiACexHLmqlbt5
	pvN1jFICdwQXDo2/UVjl/68kaZqof6KTZy5z4Hcl87j9Ibu9INAKAzIwzB7l55euaCJHqcJ6sx6
	x6O4QMKUYYQB+CsDX9isqzEd7ZQrpX9ciqFq3GAAjNO5hY4K8dAUL2aBBk3NeOdad/XdtsgewMS
	XhJSU8xtZN9q9rkZCaoPKRC90yz/uaSdiO37qhp6f8XAbksL2lgdP3CYWBPNyHJiAs10eIv02xo
	GVpV3Z0wkm0knFMRv8CfoJak8E6ULtbKFvPwBYJZvFDhjhfWVIoAT0/+DQTIeEfBEdKoyXZRFQz
	inJ4dJU7jhhw9CQ4FbBXgBVtS6cudXdoshgjKDOgNPSXhprW7pdB8LLQ3xc8i22C47yMsnpWOMj
	urGHOuLVkbupugrCQ/N3M9Ss5kltiCsyaVO4BQT9Hq0mDgjQ4J9bz0oE96hJaE0MzojdpA/6gEE
	w==
X-Received: by 2002:a17:90b:582c:b0:3a2:b70b:9cd4 with SMTP id 98e67ed59e1d1-3a2b70bb0a5mr2230449a91.12.1790616857412;
        Mon, 28 Sep 2026 10:34:17 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:e9da:534b:a5b3:3920])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a49867a4b1sm492261a91.11.2026.09.28.10.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 10:34:16 -0700 (PDT)
Date: Mon, 28 Sep 2026 11:34:14 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Yonghao Zhang <hyz3367@gmail.com>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: core: Fetch the auto-boot firmware only once
Message-ID: <arqlFtvlN2LI6cT2@p14s>
References: <20260923025855.2523147-1-hyz3367@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923025855.2523147-1-hyz3367@gmail.com>

Good day,

On Wed, Sep 23, 2026 at 10:58:55AM +0800, Yonghao Zhang wrote:
> Auto-boot for an always-on remote processor registers an asynchronous
> request_firmware_nowait() whose callback discards the fetched image

The callback function is rproc_auto_boot_callback() but I don't see where the
image fetched by request_firmware_nowait() is discarded.

Otherwise I agree with this patch.

Thanks,
Mathieu

> and calls rproc_boot().  rproc_boot() then fetches the very same image
> again with a synchronous request_firmware(), so every auto-boot reads
> the firmware image twice and allocates the buffer twice; on kernels
> with the sysfs fallback enabled, the uevent round-trip is repeated
> as well.
> 
> The asynchronous request exists only so that rproc_add() does not
> block on the filesystem read; the image it fetches is never used.
> The core already defers rproc_boot() to a worker for detached
> processors (attach_work).  Reuse that worker for offline processors
> too and drop the asynchronous firmware request: rproc_boot() fetches
> the image exactly once and dispatches between a firmware boot and
> an attach based on the proccessor state.  The work is renamed to
> boot_work to match its widened role.
> 
> commit 400e64df6b23 ("remoteproc: add framework for controlling remote
> processors") noted back in 2011 that "we must wait until it completes
> before we try to unregister the device".  rproc_del() now does exactly
> that: it waits for the boot work with cancel_work_sync(), which also
> closes the theoretical window in which a pending attach work could
> outlive the rproc instance.
> 
> The changed fallback behaviour only matters for legacy
> configurations.  udev dropped its userspace firmware loader back in
> 2014, as recorded in
> Documentation/driver-api/firmware/fallback-mechanisms.rst, and the
> kernel has documented since commit 02c399306826 ("firmware_loader:
> enhance Kconfig documentation over FW_LOADER") that "Linux no longer
> relies on or uses a fallback mechanism in userspace".  Auto-boot now
> uses the same synchronous fallback semantics as every other explicit
> boot source (sysfs, cdev).
> 
> Signed-off-by: Yonghao Zhang <hyz3367@gmail.com>
> ---
>  drivers/remoteproc/remoteproc_core.c | 65 ++++++++--------------------
>  include/linux/remoteproc.h           |  4 +-
>  2 files changed, 21 insertions(+), 48 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 263e12f022ea..f329dc478170 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1662,49 +1662,26 @@ static int rproc_attach(struct rproc *rproc)
>  }
>  
>  /*
> - * take a firmware and boot it up.
> - *
> - * Note: this function is called asynchronously upon registration of the
> - * remote processor (so we must wait until it completes before we try
> - * to unregister the device. one other option is just to use kref here,
> - * that might be cleaner).
> + * Boot or attach the remote processor in the background, on behalf of
> + * rproc_trigger_auto_boot(): rproc_add() runs in probe context and must
> + * not block while the firmware image is read from storage.  rproc_boot()
> + * dispatches on the processor state, so this covers both a firmware boot
> + * and an attach to a processor started by another entity.
> + *
> + * Note: rproc_del() waits for this work to complete with
> + * cancel_work_sync(), so the rproc instance remains valid for the
> + * entire lifetime of this function.
>   */
> -static void rproc_auto_boot_callback(const struct firmware *fw, void *context)
> +static void rproc_boot_work(struct work_struct *work)
>  {
> -	struct rproc *rproc = context;
> +	struct rproc *rproc = container_of(work, struct rproc, boot_work);
>  
>  	rproc_boot(rproc);
> -
> -	release_firmware(fw);
>  }
>  
> -static void rproc_attach_work(struct work_struct *work)
> +static void rproc_trigger_auto_boot(struct rproc *rproc)
>  {
> -	struct rproc *rproc = container_of(work, struct rproc, attach_work);
> -
> -	rproc_boot(rproc);
> -}
> -
> -static int rproc_trigger_auto_boot(struct rproc *rproc)
> -{
> -	int ret;
> -
> -	if (rproc->state == RPROC_DETACHED) {
> -		schedule_work(&rproc->attach_work);
> -		return 0;
> -	}
> -
> -	/*
> -	 * We're initiating an asynchronous firmware loading, so we can
> -	 * be built-in kernel code, without hanging the boot process.
> -	 */
> -	ret = request_firmware_nowait(THIS_MODULE, FW_ACTION_UEVENT,
> -				      rproc->firmware, &rproc->dev, GFP_KERNEL,
> -				      rproc, rproc_auto_boot_callback);
> -	if (ret < 0)
> -		dev_err(&rproc->dev, "request_firmware_nowait err: %d\n", ret);
> -
> -	return ret;
> +	schedule_work(&rproc->boot_work);
>  }
>  
>  static int rproc_stop(struct rproc *rproc, bool crashed)
> @@ -2348,11 +2325,8 @@ int rproc_add(struct rproc *rproc)
>  	rproc_create_debug_dir(rproc);
>  
>  	/* if rproc is marked always-on, request it to boot */
> -	if (rproc->auto_boot) {
> -		ret = rproc_trigger_auto_boot(rproc);
> -		if (ret < 0)
> -			goto rproc_remove_dev;
> -	}
> +	if (rproc->auto_boot)
> +		rproc_trigger_auto_boot(rproc);
>  
>  	/* expose to rproc_get_by_phandle users */
>  	mutex_lock(&rproc_list_mutex);
> @@ -2361,10 +2335,6 @@ int rproc_add(struct rproc *rproc)
>  
>  	return 0;
>  
> -rproc_remove_dev:
> -	cancel_work_sync(&rproc->crash_handler);
> -	rproc_delete_debug_dir(rproc);
> -	device_del(dev);
>  rproc_remove_cdev:
>  	rproc_char_device_remove(rproc);
>  	return ret;
> @@ -2552,7 +2522,7 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
>  	INIT_LIST_HEAD(&rproc->subdevs);
>  	INIT_LIST_HEAD(&rproc->dump_segments);
>  
> -	INIT_WORK(&rproc->attach_work, rproc_attach_work);
> +	INIT_WORK(&rproc->boot_work, rproc_boot_work);
>  	INIT_WORK(&rproc->crash_handler, rproc_crash_handler_work);
>  	spin_lock_init(&rproc->crash_handler_lock);
>  
> @@ -2630,6 +2600,9 @@ int rproc_del(struct rproc *rproc)
>  	if (cancel_work_sync(&rproc->crash_handler))
>  		pm_relax(rproc->dev.parent);
>  
> +	/* auto-boot may still be fetching firmware: wait for it here */
> +	cancel_work_sync(&rproc->boot_work);
> +
>  	__rproc_shutdown(rproc, true);
>  
>  	rproc_delete_debug_dir(rproc);
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index a44368737b39..d77e24539133 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -231,7 +231,7 @@ enum rproc_features {
>   * @subdevs: list of subdevices, to following the running state
>   * @notifyids: idr for dynamically assigning rproc-wide unique notify ids
>   * @index: index of this rproc device
> - * @attach_work: workqueue for attaching rproc
> + * @boot_work: workqueue for booting rproc
>   * @crash_handler: workqueue for handling a crash
>   * @crash_handler_lock: serializes crash handler queueing and deletion
>   * @deleting: remoteproc deletion has begun
> @@ -277,7 +277,7 @@ struct rproc {
>  	struct list_head subdevs;
>  	struct idr notifyids;
>  	int index;
> -	struct work_struct attach_work;
> +	struct work_struct boot_work;
>  	struct work_struct crash_handler;
>  	spinlock_t crash_handler_lock;
>  	bool deleting;
> -- 
> 2.34.1
> 
