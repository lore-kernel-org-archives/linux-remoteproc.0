Received: from mail-pj2-f39.google.com (mail-pj2-f39.google.com [74.125.227.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63DA39CD0F
	for <linux-remoteproc@vger.kernel.org>; Wed, 30 Sep 2026 07:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790752706; cv=none; b=fTX432UEVrj7ILm6xLuOzvoOz7NwgsiLMM0F4SC9K6AMxsXI6ZmgGCdInixC04bhk7n5gHOD6O7HiuuLJOb/sdG5MMYX+hW1tO8qOauX+oFZWy1DJVitAEoT5ujDVejMR6bakRRPXuUgNPCF2enRvEkBZ5CuHk+kf2XC7aGRLb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790752706; c=relaxed/simple;
	bh=6wjP423QTF9B3utI0N0aSYizdz2qap+h7XWABKQTx3s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g9Nk6GUP6ziaAJrY3y2SwmpY3erd7VhfS0tsfZMSTJp6jHaV+clVq1ZehwKMl1WGtSLkvUYeH2J2XibSSqAuV25f3JsRhKSxmDfyR/E80OrSHR058l7+Sroo7dO+5wF8tm9WLsUrz+3vSi/rDa8RcFMR58AYDcKLwKysk7xM2z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MH4kvZ6f; arc=none smtp.client-ip=74.125.227.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MH4kvZ6f"
Received: by mail-pj2-f39.google.com with SMTP id d9443c01a7336-2e2d2bbcab2so4859575ad.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 30 Sep 2026 00:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790752704; x=1791357504; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L3CtCQSONkR2hFJ8XJZJB+FK0JQRnLp3oIZztRHfCoQ=;
        b=MH4kvZ6fKDpXJbmniGUwwcWDxu4zzxsADMREMdbFdvm+dFsGZrc2kNyjXtBtPgf3FK
         tsX3ZfcENh2lP4aF1NSgzciBqN2PYsmnB+6eHaIYMxKzjJNPrjf8jP112svCcqo9+igE
         S1C7B56TQ/XKFltVPSQT3NpVyizTP+v1KCY9yOExabtUtVgOXwl1sQkPpWkbVJRz6vpp
         iYVuaQq73pGHrDQcBzpA2zBNBmnd/LXwBvJC5NMIKuqgGlnrrtPBYgpEBLqY0PYo16wL
         7b0o4AyWzDvcIQfkgAy4vgP6aWmV3V083wkAcjOrjyWSMTg5t6QiWO/Y4cDKFtCDsIHs
         B8mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790752704; x=1791357504;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L3CtCQSONkR2hFJ8XJZJB+FK0JQRnLp3oIZztRHfCoQ=;
        b=zfr+Dm0k3ul6ST2ycoCEoB1Tgp5F3z4rvtsoSp89YxHrBta+4B3djtR6JRE9fHKtOa
         Fk3Tq3cWnMtoC1VoXjnq5NsMafVargiYnvUQRw/a5YHQfnoK0k+PYzsNdw++/fwt9PTY
         uB/LDpr1/ppPCXKUK3bL68AJ4hkAj8y5tyDjA/2PZzI2s+fRYvlmWa6WZqe4VZpk7TUA
         DEL9RtM105D/5dVTfgThi7QQLJWuTCu1M6wLuiUzQCe6BhoiBK0WdcChCbZ2mmWED1Y4
         AbAJafU0WRbteZJ6cwUy92Et6I1RfzBvzrHXcx5rij+Yhawhl0ijZygT5+x45k0zyyei
         70yQ==
X-Forwarded-Encrypted: i=1; AKwUvBwVDGD/7EXgN9xq1yPhyfhW8c2JIJj5USBy7eqmPVMP0pWEXOKngI/Z6weE5SAqsJF0vhmUDLn4CKkYUDbBCRHs@vger.kernel.org
X-Gm-Message-State: AFq9FYL+DVxwIzLhZYKUG6XmecC6LYDpQQF3IFZxpq9qfYsIn1C+x5R1
	0vGKNtUX7JTbCLdNG2+Ww4LwENLUEab7SRZP1VQ8Ukz0gr5BCAANfr7J
X-Gm-Gg: AYBFou06C2fZ7WTiC7wmAHNMnBn1FQ30wtJoGSV1GesQPb/3HSP5OmdW8S6w7haWz1f
	k3rrbdoCYa1AF3LcF0rgFtqAp1GK0SpfmkLJB3KBdYCV8/SMi39G1TgmpMzaMtZENLUUOWcsZxa
	La+UOUGqdlzMuUt5mJ9f2v4izRvTVazcVc9KL9XJbrxsA2B5tXHN9nKC/NHtoC3jrnBZjtdWtVr
	pNOhxhsmClnJSNwI1uDO17WTJ+Grsy8CLAcrDRT8FEyUSQmghoKiLlEAsUA+juKphW+MDKNrjCt
	HMJ+9iJoh9ZphmOoWbVWzdVbU9et1CqRXgFHlEA64bQSQotUURcnIZNTHB6+OUncDPw19rLM2h7
	l3chJMqomD2UkalHOFmBniAhP4uUfop8+TwnUGzilWcxNdTXXg+/+3WkOKnpOM1Lewvg8hdeF/9
	jzSKRW5RmQtxVzsCVvAzQgxf3gFDA96wxxQjCgUdwLf6iOhiUXqQNbxSHX1SZGtBLAtZYZc5f4Y
	KtZYR5t6fk1GIiBJQ==
X-Received: by 2002:a17:903:2b06:b0:2e2:b624:54b7 with SMTP id d9443c01a7336-2e2e4b5afe6mr4769285ad.17.1790752703950;
        Wed, 30 Sep 2026 00:18:23 -0700 (PDT)
Received: from embedsky001.tail6d6b2f.ts.net ([183.12.106.39])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e2e5c38be1sm2384395ad.77.2026.09.30.00.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 00:18:23 -0700 (PDT)
Date: Wed, 30 Sep 2026 15:18:19 +0800
From: Yonghao Zhang <hyz3367@gmail.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: core: Fetch the auto-boot firmware only once
Message-ID: <20260930071819.vse5i32snb744ay7@embedsky001.tail6d6b2f.ts.net>
References: <20260923025855.2523147-1-hyz3367@gmail.com>
 <arqlFtvlN2LI6cT2@p14s>
 <20260929044312.kkqnizsdtg2axg7c@embedsky001.tail6d6b2f.ts.net>
 <CANLsYkx5VVWsmhaYfMe=gj7nO-8YpOknMvM7gKZ-xFEbGg=zMg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANLsYkx5VVWsmhaYfMe=gj7nO-8YpOknMvM7gKZ-xFEbGg=zMg@mail.gmail.com>

On Tue, Sep 29, 2026 at 09:06:35AM -0600, Mathieu Poirier wrote:
> On Mon, 28 Sept 2026 at 22:43, Yonghao Zhang <hyz3367@gmail.com> wrote:
> >
> > Hi Mathieu,
> >
> > Thanks for the review.
> >
> > On Mon, Sep 28, 2026 at 11:34:14AM -0600, Mathieu Poirier wrote:
> > > Good day,
> > >
> > > On Wed, Sep 23, 2026 at 10:58:55AM +0800, Yonghao Zhang wrote:
> > > > Auto-boot for an always-on remote processor registers an asynchronous
> > > > request_firmware_nowait() whose callback discards the fetched image
> > >
> > > The callback function is rproc_auto_boot_callback() but I don't see where the
> > > image fetched by request_firmware_nowait() is discarded.
> >
> > It is the release_firmware(fw) called at the end of this callback.
> 
> Right, this is happening at the _end_ of the callback, but the
> changelog says the firmware is discarded and then rproc_boot() called.
> This is not accurate and needs to be fixed.
>

The [PATCH v2] I sent earlier today carries a wrong In-Reply-To and
won't show up in this thread on lore.  It is available here:

	https://lore.kernel.org/linux-remoteproc/20260930064144.645211-1-hyz3367@gmail.com/T/#u

Thanks,
Yonghao

> > The image fetched by request_firmware_nowait() is never consumed:
> > rproc_boot() doesn't take it as an argument and fetches it's own copy
> > with a synchronous request_firmware(). It is that second copy which
> > rproc_fw_boot() parses and which is release at the end of rproc_boot().
> > The asynchronous copy is only ever touched by the final
> > release_firmware(fw) -- fetched, never read, freed.
> >
> > "Discarded" in the commit message refers to exactly that. I can send
> > a v2 that names this release_firmware() explicitly in the first
> > paragraph if you want the message to be verifiable at a glance.
> >
> > Thanks,
> > Yonghao
> >
> > >
> > > Otherwise I agree with this patch.
> > >
> > > Thanks,
> > > Mathieu
> > >
> > > > and calls rproc_boot().  rproc_boot() then fetches the very same image
> > > > again with a synchronous request_firmware(), so every auto-boot reads
> > > > the firmware image twice and allocates the buffer twice; on kernels
> > > > with the sysfs fallback enabled, the uevent round-trip is repeated
> > > > as well.
> > > >
> > > > The asynchronous request exists only so that rproc_add() does not
> > > > block on the filesystem read; the image it fetches is never used.
> > > > The core already defers rproc_boot() to a worker for detached
> > > > processors (attach_work).  Reuse that worker for offline processors
> > > > too and drop the asynchronous firmware request: rproc_boot() fetches
> > > > the image exactly once and dispatches between a firmware boot and
> > > > an attach based on the proccessor state.  The work is renamed to
> > > > boot_work to match its widened role.
> > > >
> > > > commit 400e64df6b23 ("remoteproc: add framework for controlling remote
> > > > processors") noted back in 2011 that "we must wait until it completes
> > > > before we try to unregister the device".  rproc_del() now does exactly
> > > > that: it waits for the boot work with cancel_work_sync(), which also
> > > > closes the theoretical window in which a pending attach work could
> > > > outlive the rproc instance.
> > > >
> > > > The changed fallback behaviour only matters for legacy
> > > > configurations.  udev dropped its userspace firmware loader back in
> > > > 2014, as recorded in
> > > > Documentation/driver-api/firmware/fallback-mechanisms.rst, and the
> > > > kernel has documented since commit 02c399306826 ("firmware_loader:
> > > > enhance Kconfig documentation over FW_LOADER") that "Linux no longer
> > > > relies on or uses a fallback mechanism in userspace".  Auto-boot now
> > > > uses the same synchronous fallback semantics as every other explicit
> > > > boot source (sysfs, cdev).
> > > >
> > > > Signed-off-by: Yonghao Zhang <hyz3367@gmail.com>
> > > > ---
> > > >  drivers/remoteproc/remoteproc_core.c | 65 ++++++++--------------------
> > > >  include/linux/remoteproc.h           |  4 +-
> > > >  2 files changed, 21 insertions(+), 48 deletions(-)
> > > >
> > > > diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> > > > index 263e12f022ea..f329dc478170 100644
> > > > --- a/drivers/remoteproc/remoteproc_core.c
> > > > +++ b/drivers/remoteproc/remoteproc_core.c
> > > > @@ -1662,49 +1662,26 @@ static int rproc_attach(struct rproc *rproc)
> > > >  }
> > > >
> > > >  /*
> > > > - * take a firmware and boot it up.
> > > > - *
> > > > - * Note: this function is called asynchronously upon registration of the
> > > > - * remote processor (so we must wait until it completes before we try
> > > > - * to unregister the device. one other option is just to use kref here,
> > > > - * that might be cleaner).
> > > > + * Boot or attach the remote processor in the background, on behalf of
> > > > + * rproc_trigger_auto_boot(): rproc_add() runs in probe context and must
> > > > + * not block while the firmware image is read from storage.  rproc_boot()
> > > > + * dispatches on the processor state, so this covers both a firmware boot
> > > > + * and an attach to a processor started by another entity.
> > > > + *
> > > > + * Note: rproc_del() waits for this work to complete with
> > > > + * cancel_work_sync(), so the rproc instance remains valid for the
> > > > + * entire lifetime of this function.
> > > >   */
> > > > -static void rproc_auto_boot_callback(const struct firmware *fw, void *context)
> > > > +static void rproc_boot_work(struct work_struct *work)
> > > >  {
> > > > -   struct rproc *rproc = context;
> > > > +   struct rproc *rproc = container_of(work, struct rproc, boot_work);
> > > >
> > > >     rproc_boot(rproc);
> > > > -
> > > > -   release_firmware(fw);
> > > >  }
> > > >
> > > > -static void rproc_attach_work(struct work_struct *work)
> > > > +static void rproc_trigger_auto_boot(struct rproc *rproc)
> > > >  {
> > > > -   struct rproc *rproc = container_of(work, struct rproc, attach_work);
> > > > -
> > > > -   rproc_boot(rproc);
> > > > -}
> > > > -
> > > > -static int rproc_trigger_auto_boot(struct rproc *rproc)
> > > > -{
> > > > -   int ret;
> > > > -
> > > > -   if (rproc->state == RPROC_DETACHED) {
> > > > -           schedule_work(&rproc->attach_work);
> > > > -           return 0;
> > > > -   }
> > > > -
> > > > -   /*
> > > > -    * We're initiating an asynchronous firmware loading, so we can
> > > > -    * be built-in kernel code, without hanging the boot process.
> > > > -    */
> > > > -   ret = request_firmware_nowait(THIS_MODULE, FW_ACTION_UEVENT,
> > > > -                                 rproc->firmware, &rproc->dev, GFP_KERNEL,
> > > > -                                 rproc, rproc_auto_boot_callback);
> > > > -   if (ret < 0)
> > > > -           dev_err(&rproc->dev, "request_firmware_nowait err: %d\n", ret);
> > > > -
> > > > -   return ret;
> > > > +   schedule_work(&rproc->boot_work);
> > > >  }
> > > >
> > > >  static int rproc_stop(struct rproc *rproc, bool crashed)
> > > > @@ -2348,11 +2325,8 @@ int rproc_add(struct rproc *rproc)
> > > >     rproc_create_debug_dir(rproc);
> > > >
> > > >     /* if rproc is marked always-on, request it to boot */
> > > > -   if (rproc->auto_boot) {
> > > > -           ret = rproc_trigger_auto_boot(rproc);
> > > > -           if (ret < 0)
> > > > -                   goto rproc_remove_dev;
> > > > -   }
> > > > +   if (rproc->auto_boot)
> > > > +           rproc_trigger_auto_boot(rproc);
> > > >
> > > >     /* expose to rproc_get_by_phandle users */
> > > >     mutex_lock(&rproc_list_mutex);
> > > > @@ -2361,10 +2335,6 @@ int rproc_add(struct rproc *rproc)
> > > >
> > > >     return 0;
> > > >
> > > > -rproc_remove_dev:
> > > > -   cancel_work_sync(&rproc->crash_handler);
> > > > -   rproc_delete_debug_dir(rproc);
> > > > -   device_del(dev);
> > > >  rproc_remove_cdev:
> > > >     rproc_char_device_remove(rproc);
> > > >     return ret;
> > > > @@ -2552,7 +2522,7 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
> > > >     INIT_LIST_HEAD(&rproc->subdevs);
> > > >     INIT_LIST_HEAD(&rproc->dump_segments);
> > > >
> > > > -   INIT_WORK(&rproc->attach_work, rproc_attach_work);
> > > > +   INIT_WORK(&rproc->boot_work, rproc_boot_work);
> > > >     INIT_WORK(&rproc->crash_handler, rproc_crash_handler_work);
> > > >     spin_lock_init(&rproc->crash_handler_lock);
> > > >
> > > > @@ -2630,6 +2600,9 @@ int rproc_del(struct rproc *rproc)
> > > >     if (cancel_work_sync(&rproc->crash_handler))
> > > >             pm_relax(rproc->dev.parent);
> > > >
> > > > +   /* auto-boot may still be fetching firmware: wait for it here */
> > > > +   cancel_work_sync(&rproc->boot_work);
> > > > +
> > > >     __rproc_shutdown(rproc, true);
> > > >
> > > >     rproc_delete_debug_dir(rproc);
> > > > diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> > > > index a44368737b39..d77e24539133 100644
> > > > --- a/include/linux/remoteproc.h
> > > > +++ b/include/linux/remoteproc.h
> > > > @@ -231,7 +231,7 @@ enum rproc_features {
> > > >   * @subdevs: list of subdevices, to following the running state
> > > >   * @notifyids: idr for dynamically assigning rproc-wide unique notify ids
> > > >   * @index: index of this rproc device
> > > > - * @attach_work: workqueue for attaching rproc
> > > > + * @boot_work: workqueue for booting rproc
> > > >   * @crash_handler: workqueue for handling a crash
> > > >   * @crash_handler_lock: serializes crash handler queueing and deletion
> > > >   * @deleting: remoteproc deletion has begun
> > > > @@ -277,7 +277,7 @@ struct rproc {
> > > >     struct list_head subdevs;
> > > >     struct idr notifyids;
> > > >     int index;
> > > > -   struct work_struct attach_work;
> > > > +   struct work_struct boot_work;
> > > >     struct work_struct crash_handler;
> > > >     spinlock_t crash_handler_lock;
> > > >     bool deleting;
> > > > --
> > > > 2.34.1
> > > >
