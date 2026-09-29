Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5C630F92E
	for <linux-remoteproc@vger.kernel.org>; Tue, 29 Sep 2026 04:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790657001; cv=none; b=YNyAyrdXUIbmCue61jF+GaDWMY2OxBOK2agJtpPBh5SPEhVoq16puA4RaHYNpdYWOU5dTrQu1E29tvucMW1CaFBXHYQ5VUxxfO63A4qzJo5yON1hcFx9WxPXYl0F7jA2r17nMrpi2OaPkAhMLBWEjjkw8Yc4WS26VVsVBVqn3yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790657001; c=relaxed/simple;
	bh=gN5HHle4qZT9OTM09PmZCe55bkttySvPLex8eGl9hQU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kF2cJkMU5MCwpc2lrjnQZrO26OiESdzbEnqOH04JsQto42oTgZyK9+xpltajfvKw3+EArs2P2rAUT8ZBMbbk0irohrem8Bo/CTKtz076igEtACJkhl2lmWwS62MQ8ajVrWqFvgdIerfD5xbWQE7iFHALQy3VRhpCs9/prw8ZbjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ruAO6wbY; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ruAO6wbY"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747f0b25dso23878365ad.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 28 Sep 2026 21:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790657000; x=1791261800; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MWVCbqxGfrFo7fMMSA0VxRpuXW7FVh+O7YcQyCOsfok=;
        b=ruAO6wbYvBmELa9aRK8UWLOml4h+cqCNq1iz81YZA3LRuzqK8UXnBbbEPyqk5UIpnR
         VG8TpHqY3lDNdVtQaaUviUMiTC7dKCLoekFYlOrYsBS4xG2TbqcuUVFWWbojt942/dbQ
         1HxoWRxjlUnxqXPjpAdK92cnmbj6/n65mlUjI2YhEyn3bh0N4eKwHqGD6Pl8raclEqs6
         dx3thXVsuloQ9H+QtfGQV3O5/op0mlPeugCVK+1vi/ooT6M66us+EwVO0JJL089eoT2t
         TX+I4O4dbw0Vpf84cEOWMIxcgyJePpbBhpI1i4q8lhPhqEyIZ0O7yptUXi+Yz8BjSVJd
         MG7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790657000; x=1791261800;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MWVCbqxGfrFo7fMMSA0VxRpuXW7FVh+O7YcQyCOsfok=;
        b=fqq7oBJmX+rVROdoQhDe/etIrFN/WzuCosOAXz9Z4kqrP43r4Gm/WKHCd2fIWCaIav
         1DqcB2nKgq8IPbni0q2n7sQB7Gm3/BKjpK5kc/I1/jNviLaYtKSLTqEva7JZB+g8rMkr
         2qVOUE4SE8VHk76hmEMQroyySa3c4K1QMQr9dPTgS7QboVLmFWS6sazJigZ2gVCD5ch1
         KjyT8LjyEC4nzId/XXggGYJSdupMEJWUzKqIApEyKl6wrQL6mwFImp+4mfpwkkRH5618
         g5mngPZTD7pXExLfBanoyM1+LuUdEHwyCswhPp5EsdRwx0c9DXlFsZz73eHCRLE9TWCx
         bh4w==
X-Forwarded-Encrypted: i=1; AKwUvBxYximsqU6A7dtE6M4CHB0S9m5Hf+5X4rpVVSEqZn2YDzg0Uy3MS1ys7+ZETQG7rSpPs8A2Xam7UEOdVuFX+LdG@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9zEqaUrTaFGipQ5x0QSBdud5bHMDh8/R+PF3ug6NNyVU5dPda
	fd5+I7T+o9c2IHb1Ith75kJwhtSApa+7mas0rERgJ5TL2oBL17MMZCHUbZDQm1Y6
X-Gm-Gg: AYBFou3tFrHMVqjHgxpdrN/Qo/JZx7f7RN7HkKMIdv2AbQq4WGIICgVZCmaY7S/uIqV
	+rd98xWz4yXRCxiewQFOGN1CbFQhDb7JRAGzdsGNiiCcmRaxJNAF9ru3kDVm70TCYy0Lr68L88R
	yFCYLKXmzTiRvzBEX+0IMIvZgeUuKo4juBHfjwaXnnQ0YjjHXjZ5R327T8BUV9CtsQj3t7lyP52
	pc94cmPQAhVCfDgQJBBrF760liaiMA0CJNVeRk/T3Xm29tbzRMgvjkL4Ev96QUTntd5KuOUiVaP
	ncls2/hRRLIzEfWaeSc3ZhJ+JXDW9G89/oFIctdhU/RUEuco663x0mSuXpnr5eHpDyOaRQ1g4D3
	JfeLh4v1iV64aDkIfro/xYMW5Oi0g3OcnqIk0EBFBI/FXjDqKonT68ft8RQ2R/Iw+tZ019gH2Uw
	JczHI7MfoM01JmXzUQJU7w5+6eHm1Gg7Mj8ZDqTbvgHv8qqiKYXDfxICtM2PBoWRGMxHXM5NqG7
	FRo7Vt6Ufxki8RbcNMn6Wnet5BP
X-Received: by 2002:a17:902:f60d:b0:2dd:c054:1983 with SMTP id d9443c01a7336-2df7e11e305mr117805645ad.40.1790656999583;
        Mon, 28 Sep 2026 21:43:19 -0700 (PDT)
Received: from embedsky001.tail6d6b2f.ts.net ([183.12.106.39])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e2c9d06766sm2213975ad.54.2026.09.28.21.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 21:43:19 -0700 (PDT)
Date: Tue, 29 Sep 2026 12:43:12 +0800
From: Yonghao Zhang <hyz3367@gmail.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: core: Fetch the auto-boot firmware only once
Message-ID: <20260929044312.kkqnizsdtg2axg7c@embedsky001.tail6d6b2f.ts.net>
References: <20260923025855.2523147-1-hyz3367@gmail.com>
 <arqlFtvlN2LI6cT2@p14s>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arqlFtvlN2LI6cT2@p14s>

Hi Mathieu,

Thanks for the review.

On Mon, Sep 28, 2026 at 11:34:14AM -0600, Mathieu Poirier wrote:
> Good day,
> 
> On Wed, Sep 23, 2026 at 10:58:55AM +0800, Yonghao Zhang wrote:
> > Auto-boot for an always-on remote processor registers an asynchronous
> > request_firmware_nowait() whose callback discards the fetched image
> 
> The callback function is rproc_auto_boot_callback() but I don't see where the
> image fetched by request_firmware_nowait() is discarded.

It is the release_firmware(fw) called at the end of this callback.
The image fetched by request_firmware_nowait() is never consumed:
rproc_boot() doesn't take it as an argument and fetches it's own copy
with a synchronous request_firmware(). It is that second copy which
rproc_fw_boot() parses and which is release at the end of rproc_boot().
The asynchronous copy is only ever touched by the final
release_firmware(fw) -- fetched, never read, freed.

"Discarded" in the commit message refers to exactly that. I can send
a v2 that names this release_firmware() explicitly in the first
paragraph if you want the message to be verifiable at a glance.

Thanks,
Yonghao

> 
> Otherwise I agree with this patch.
> 
> Thanks,
> Mathieu
> 
> > and calls rproc_boot().  rproc_boot() then fetches the very same image
> > again with a synchronous request_firmware(), so every auto-boot reads
> > the firmware image twice and allocates the buffer twice; on kernels
> > with the sysfs fallback enabled, the uevent round-trip is repeated
> > as well.
> > 
> > The asynchronous request exists only so that rproc_add() does not
> > block on the filesystem read; the image it fetches is never used.
> > The core already defers rproc_boot() to a worker for detached
> > processors (attach_work).  Reuse that worker for offline processors
> > too and drop the asynchronous firmware request: rproc_boot() fetches
> > the image exactly once and dispatches between a firmware boot and
> > an attach based on the proccessor state.  The work is renamed to
> > boot_work to match its widened role.
> > 
> > commit 400e64df6b23 ("remoteproc: add framework for controlling remote
> > processors") noted back in 2011 that "we must wait until it completes
> > before we try to unregister the device".  rproc_del() now does exactly
> > that: it waits for the boot work with cancel_work_sync(), which also
> > closes the theoretical window in which a pending attach work could
> > outlive the rproc instance.
> > 
> > The changed fallback behaviour only matters for legacy
> > configurations.  udev dropped its userspace firmware loader back in
> > 2014, as recorded in
> > Documentation/driver-api/firmware/fallback-mechanisms.rst, and the
> > kernel has documented since commit 02c399306826 ("firmware_loader:
> > enhance Kconfig documentation over FW_LOADER") that "Linux no longer
> > relies on or uses a fallback mechanism in userspace".  Auto-boot now
> > uses the same synchronous fallback semantics as every other explicit
> > boot source (sysfs, cdev).
> > 
> > Signed-off-by: Yonghao Zhang <hyz3367@gmail.com>
> > ---
> >  drivers/remoteproc/remoteproc_core.c | 65 ++++++++--------------------
> >  include/linux/remoteproc.h           |  4 +-
> >  2 files changed, 21 insertions(+), 48 deletions(-)
> > 
> > diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> > index 263e12f022ea..f329dc478170 100644
> > --- a/drivers/remoteproc/remoteproc_core.c
> > +++ b/drivers/remoteproc/remoteproc_core.c
> > @@ -1662,49 +1662,26 @@ static int rproc_attach(struct rproc *rproc)
> >  }
> >  
> >  /*
> > - * take a firmware and boot it up.
> > - *
> > - * Note: this function is called asynchronously upon registration of the
> > - * remote processor (so we must wait until it completes before we try
> > - * to unregister the device. one other option is just to use kref here,
> > - * that might be cleaner).
> > + * Boot or attach the remote processor in the background, on behalf of
> > + * rproc_trigger_auto_boot(): rproc_add() runs in probe context and must
> > + * not block while the firmware image is read from storage.  rproc_boot()
> > + * dispatches on the processor state, so this covers both a firmware boot
> > + * and an attach to a processor started by another entity.
> > + *
> > + * Note: rproc_del() waits for this work to complete with
> > + * cancel_work_sync(), so the rproc instance remains valid for the
> > + * entire lifetime of this function.
> >   */
> > -static void rproc_auto_boot_callback(const struct firmware *fw, void *context)
> > +static void rproc_boot_work(struct work_struct *work)
> >  {
> > -	struct rproc *rproc = context;
> > +	struct rproc *rproc = container_of(work, struct rproc, boot_work);
> >  
> >  	rproc_boot(rproc);
> > -
> > -	release_firmware(fw);
> >  }
> >  
> > -static void rproc_attach_work(struct work_struct *work)
> > +static void rproc_trigger_auto_boot(struct rproc *rproc)
> >  {
> > -	struct rproc *rproc = container_of(work, struct rproc, attach_work);
> > -
> > -	rproc_boot(rproc);
> > -}
> > -
> > -static int rproc_trigger_auto_boot(struct rproc *rproc)
> > -{
> > -	int ret;
> > -
> > -	if (rproc->state == RPROC_DETACHED) {
> > -		schedule_work(&rproc->attach_work);
> > -		return 0;
> > -	}
> > -
> > -	/*
> > -	 * We're initiating an asynchronous firmware loading, so we can
> > -	 * be built-in kernel code, without hanging the boot process.
> > -	 */
> > -	ret = request_firmware_nowait(THIS_MODULE, FW_ACTION_UEVENT,
> > -				      rproc->firmware, &rproc->dev, GFP_KERNEL,
> > -				      rproc, rproc_auto_boot_callback);
> > -	if (ret < 0)
> > -		dev_err(&rproc->dev, "request_firmware_nowait err: %d\n", ret);
> > -
> > -	return ret;
> > +	schedule_work(&rproc->boot_work);
> >  }
> >  
> >  static int rproc_stop(struct rproc *rproc, bool crashed)
> > @@ -2348,11 +2325,8 @@ int rproc_add(struct rproc *rproc)
> >  	rproc_create_debug_dir(rproc);
> >  
> >  	/* if rproc is marked always-on, request it to boot */
> > -	if (rproc->auto_boot) {
> > -		ret = rproc_trigger_auto_boot(rproc);
> > -		if (ret < 0)
> > -			goto rproc_remove_dev;
> > -	}
> > +	if (rproc->auto_boot)
> > +		rproc_trigger_auto_boot(rproc);
> >  
> >  	/* expose to rproc_get_by_phandle users */
> >  	mutex_lock(&rproc_list_mutex);
> > @@ -2361,10 +2335,6 @@ int rproc_add(struct rproc *rproc)
> >  
> >  	return 0;
> >  
> > -rproc_remove_dev:
> > -	cancel_work_sync(&rproc->crash_handler);
> > -	rproc_delete_debug_dir(rproc);
> > -	device_del(dev);
> >  rproc_remove_cdev:
> >  	rproc_char_device_remove(rproc);
> >  	return ret;
> > @@ -2552,7 +2522,7 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
> >  	INIT_LIST_HEAD(&rproc->subdevs);
> >  	INIT_LIST_HEAD(&rproc->dump_segments);
> >  
> > -	INIT_WORK(&rproc->attach_work, rproc_attach_work);
> > +	INIT_WORK(&rproc->boot_work, rproc_boot_work);
> >  	INIT_WORK(&rproc->crash_handler, rproc_crash_handler_work);
> >  	spin_lock_init(&rproc->crash_handler_lock);
> >  
> > @@ -2630,6 +2600,9 @@ int rproc_del(struct rproc *rproc)
> >  	if (cancel_work_sync(&rproc->crash_handler))
> >  		pm_relax(rproc->dev.parent);
> >  
> > +	/* auto-boot may still be fetching firmware: wait for it here */
> > +	cancel_work_sync(&rproc->boot_work);
> > +
> >  	__rproc_shutdown(rproc, true);
> >  
> >  	rproc_delete_debug_dir(rproc);
> > diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> > index a44368737b39..d77e24539133 100644
> > --- a/include/linux/remoteproc.h
> > +++ b/include/linux/remoteproc.h
> > @@ -231,7 +231,7 @@ enum rproc_features {
> >   * @subdevs: list of subdevices, to following the running state
> >   * @notifyids: idr for dynamically assigning rproc-wide unique notify ids
> >   * @index: index of this rproc device
> > - * @attach_work: workqueue for attaching rproc
> > + * @boot_work: workqueue for booting rproc
> >   * @crash_handler: workqueue for handling a crash
> >   * @crash_handler_lock: serializes crash handler queueing and deletion
> >   * @deleting: remoteproc deletion has begun
> > @@ -277,7 +277,7 @@ struct rproc {
> >  	struct list_head subdevs;
> >  	struct idr notifyids;
> >  	int index;
> > -	struct work_struct attach_work;
> > +	struct work_struct boot_work;
> >  	struct work_struct crash_handler;
> >  	spinlock_t crash_handler_lock;
> >  	bool deleting;
> > -- 
> > 2.34.1
> > 
