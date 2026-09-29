Received: from mail-ed2-f32.google.com (mail-ed2-f32.google.com [74.125.228.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5AE53A88D
	for <linux-remoteproc@vger.kernel.org>; Tue, 29 Sep 2026 15:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790694421; cv=pass; b=kgIFfok21yCaK9f5f0F6wtSEU4udaWcyBFv+vFLnpi2X+epsU7NyWZNvZxNt7qvCXRUSIyJ/JuuW8vxHAG7GNQ8gk0JQ46EaXnXvaSvQq5m3xb1cgMObdE+wavq84DrQyJ3shImibGa0pMGOujeLaBjua13I9XxrS3lfKb3aUdw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790694421; c=relaxed/simple;
	bh=Mf0CEE/Ndi3adNKcAPlzfcyXORehguVF2tBgfNIzSKc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qb3gdyvOgY7iKJhpHBtu97LTGBHq7ULyP+ngacx0ux1oh0GBq+F8udcRXG3K6evs4N34hHFOBRh3yKEBuDKxpdnUHK4eHthNsbqdzjyhQlfCXqxyJDmXQnIgl/OVCXstzbgIZMJGYYmVNQF2WX7GRjngbafTfi0j5j5AGt0Y1oM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Pj0WhG6H; arc=pass smtp.client-ip=74.125.228.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Pj0WhG6H"
Received: by mail-ed2-f32.google.com with SMTP id 4fb4d7f45d1cf-6acae8342d2so1524459a12.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 29 Sep 2026 08:06:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790694406; cv=none;
        d=google.com; s=arc-20260327;
        b=mi47Xdb802afkhXbegqcXRqGLSE8bVx//doGZZg7HCBBnvjmcwbwdO+H//TSEpctXW
         TdX785VdFvT2D2ksn+Y/CTQCNcS2fcRESBXF1cO2bhtqVAlEgAlgR72TQRRplvUAITSD
         tjifIIqI51SHjsF4jvcTGX/Us7zVK/XMCAviClbEZXdZi0WCVYEVB2GD8kpf1mdcsHZk
         7SQW99xI78k6X+qMjFmlZc3RxG/y21l4GC1Z8mEjeh4l975+Uk9tDe/yBxe84rBnUzUW
         J0fks5AlyQRJHtw8X2tw3SoezDm5XItIgsAXpZ2rMZWy5CwPfTjYVS9EizwRFtbTNDeh
         6onQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/sNOLTaNvoDiPUujM3BypTb7TAcwy52Xvqi64wDt2EA=;
        fh=WPoGb6rLYyye7e/DxPkE3uvYzSzY8M3cDKMc+bb5dec=;
        b=I6oJrWLMg2QNZJREvkUiRb7BE32YWWSkBbJsa+8JFLO/eczNulqmR4O9s5gRb1s7sv
         TF9M5Swvf16r7YVsfbe0/ybrU6CDeUngD2KjdZbHm+HaMw4Wil2lYHSts+PyLljlwEo4
         Y88VsilWie/PbiM9lgJDIBfM3ELz3MiGAmVdoI2pbG7bwmpk2HvSOn8LEC0WNXFL7Oax
         aAyrHzavVGuSn7KWzochOaYRzxyiwEe6XHwvgIRfVB1qRIWdDaom08ta0eEX+sUAi42L
         aW52JO2dqhc2T5cBkpAQGb1zdj5vS2GHzUMTf6saeXp35bOb0qX05qyAh2z20eRfnrdn
         Kekw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790694406; x=1791299206; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/sNOLTaNvoDiPUujM3BypTb7TAcwy52Xvqi64wDt2EA=;
        b=Pj0WhG6HAL73tA7TkqFYnxLoxnzJmXN68moNO7PiwCEC/DPooIJO6VM3QsSgxklUQj
         qx2R0iHu60PkIgkImq9CTX1828yJ/f/89k9YG4a1QmfGo5kswlMhRdN0cn50HickMX+K
         L2QDuCex/DtWTKxpOVpHe01mVQJsgLr0RM03HFH0m6ZBwpMz6FBbB7onW4vpIzrvg2NL
         MQ8sBJwcB97OisXt6apQ4+dW7gL/qv0VAMzej14aZ9imwJrzecrWnVWqd86c4EUHxZx0
         6PHwyoQewva+YokBDmp9HgO2Gjdf1Td/lk4fUEVqYWb2c08WLiKmWvh8vaM4X7EI6XnT
         CoHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790694406; x=1791299206;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/sNOLTaNvoDiPUujM3BypTb7TAcwy52Xvqi64wDt2EA=;
        b=ZlOVMjb2PJZ6NgcyUUZsr/KTOQQADdrXBOIA1jtem+Z8RWKZMM3obHOTDrIV7Fub7x
         zOPRYjSgiVNs/K6Y3uA2INkrrWSWTlk3HUElxHL3JPs3qwuDU5WlYcmp3CrfIsdSV07P
         x3j3j30Ch80W9toaEhFZNpoCO8Ql4A/s78slnHnf4j3fZs2F05mzPhJaDhY0v2iapOUW
         4phWQuug7NNnUwWYZ5EHcehLyTnz3LcNeGF1ejyYqsJVW4tbUz1QGPBe6q9RCSxuU3D7
         wKq/otJyxZDjzT1zvFVTa+jgK+8qFWa5fcDlUuhBVAquYhTrSt3PE49xHqGMP06uU/cB
         Ll5w==
X-Forwarded-Encrypted: i=1; AKwUvBzLSpxMr+Qt2x1TG/iTHPLHJNjFzMn9bH2popohmRieaQY27GMNTz/RGR9xJCBEWZWXwUpLm7rwTeF1CBl2I87j@vger.kernel.org
X-Gm-Message-State: AFq9FYLW5IHtGrwfB0ulb5Uqbf2smM6VZZ7ZKfSPZwCYPHuM0TU9XIuo
	bbCKn7p/Q767tsj6BkoCSL06o2FKkiDVT+4yI3ac2vZpLrsXeSxwWThFtH2azBw26ugWeDLazkC
	WBySop0AH/DtSn3rMVbLBCu6vFzR9n9FQpWjeraiuXg==
X-Gm-Gg: AYBFou1NktwG6HQEJjn4B7QyoaxEj7k8CF53n2NC9V7DP+iaC7O64fJ1BSpEn1lvuc4
	oGzMRNPnRl0BtsxIF2wndTr/Y8o71VYAnJC472SZFQLNeLy9SQ5zrG5TuNwIFKgWE6TvhCSxSL1
	6z9uRHYbKFobehqLqaVkeBfuGr9XLneLcsmhfhIeBlCERWVlKDLbaTy2FZeGB3gWDNLcbtMB7Sj
	rjjrUyFPkxCqKRZE1TSVUqEGUa1WQuRJfcaV8TeOeKoQv90mGjFsXn1Av7Y7s/aehXlrDmhuEct
	tdZO+TdDJ5ksbTzRiC5Az3tN8Gc2xUUIHEyffp75O2KUb//tBgLUsXfv2ftpAaV1YR+72xzoxHj
	OnHANnacJKGLt
X-Received: by 2002:a05:6402:1f44:b0:6aa:c3d8:da1 with SMTP id
 4fb4d7f45d1cf-6aac8ecf448mr11925620a12.9.1790694406120; Tue, 29 Sep 2026
 08:06:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923025855.2523147-1-hyz3367@gmail.com> <arqlFtvlN2LI6cT2@p14s>
 <20260929044312.kkqnizsdtg2axg7c@embedsky001.tail6d6b2f.ts.net>
In-Reply-To: <20260929044312.kkqnizsdtg2axg7c@embedsky001.tail6d6b2f.ts.net>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 29 Sep 2026 09:06:35 -0600
X-Gm-Features: AclHuK-ZMOUPEe4SsrWen_F7RhJdVsoX8XiLCVHlS8LsKTtnYzyq-BKQjbeFtos
Message-ID: <CANLsYkx5VVWsmhaYfMe=gj7nO-8YpOknMvM7gKZ-xFEbGg=zMg@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: core: Fetch the auto-boot firmware only once
To: Yonghao Zhang <hyz3367@gmail.com>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 28 Sept 2026 at 22:43, Yonghao Zhang <hyz3367@gmail.com> wrote:
>
> Hi Mathieu,
>
> Thanks for the review.
>
> On Mon, Sep 28, 2026 at 11:34:14AM -0600, Mathieu Poirier wrote:
> > Good day,
> >
> > On Wed, Sep 23, 2026 at 10:58:55AM +0800, Yonghao Zhang wrote:
> > > Auto-boot for an always-on remote processor registers an asynchronous
> > > request_firmware_nowait() whose callback discards the fetched image
> >
> > The callback function is rproc_auto_boot_callback() but I don't see where the
> > image fetched by request_firmware_nowait() is discarded.
>
> It is the release_firmware(fw) called at the end of this callback.

Right, this is happening at the _end_ of the callback, but the
changelog says the firmware is discarded and then rproc_boot() called.
This is not accurate and needs to be fixed.

> The image fetched by request_firmware_nowait() is never consumed:
> rproc_boot() doesn't take it as an argument and fetches it's own copy
> with a synchronous request_firmware(). It is that second copy which
> rproc_fw_boot() parses and which is release at the end of rproc_boot().
> The asynchronous copy is only ever touched by the final
> release_firmware(fw) -- fetched, never read, freed.
>
> "Discarded" in the commit message refers to exactly that. I can send
> a v2 that names this release_firmware() explicitly in the first
> paragraph if you want the message to be verifiable at a glance.
>
> Thanks,
> Yonghao
>
> >
> > Otherwise I agree with this patch.
> >
> > Thanks,
> > Mathieu
> >
> > > and calls rproc_boot().  rproc_boot() then fetches the very same image
> > > again with a synchronous request_firmware(), so every auto-boot reads
> > > the firmware image twice and allocates the buffer twice; on kernels
> > > with the sysfs fallback enabled, the uevent round-trip is repeated
> > > as well.
> > >
> > > The asynchronous request exists only so that rproc_add() does not
> > > block on the filesystem read; the image it fetches is never used.
> > > The core already defers rproc_boot() to a worker for detached
> > > processors (attach_work).  Reuse that worker for offline processors
> > > too and drop the asynchronous firmware request: rproc_boot() fetches
> > > the image exactly once and dispatches between a firmware boot and
> > > an attach based on the proccessor state.  The work is renamed to
> > > boot_work to match its widened role.
> > >
> > > commit 400e64df6b23 ("remoteproc: add framework for controlling remote
> > > processors") noted back in 2011 that "we must wait until it completes
> > > before we try to unregister the device".  rproc_del() now does exactly
> > > that: it waits for the boot work with cancel_work_sync(), which also
> > > closes the theoretical window in which a pending attach work could
> > > outlive the rproc instance.
> > >
> > > The changed fallback behaviour only matters for legacy
> > > configurations.  udev dropped its userspace firmware loader back in
> > > 2014, as recorded in
> > > Documentation/driver-api/firmware/fallback-mechanisms.rst, and the
> > > kernel has documented since commit 02c399306826 ("firmware_loader:
> > > enhance Kconfig documentation over FW_LOADER") that "Linux no longer
> > > relies on or uses a fallback mechanism in userspace".  Auto-boot now
> > > uses the same synchronous fallback semantics as every other explicit
> > > boot source (sysfs, cdev).
> > >
> > > Signed-off-by: Yonghao Zhang <hyz3367@gmail.com>
> > > ---
> > >  drivers/remoteproc/remoteproc_core.c | 65 ++++++++--------------------
> > >  include/linux/remoteproc.h           |  4 +-
> > >  2 files changed, 21 insertions(+), 48 deletions(-)
> > >
> > > diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> > > index 263e12f022ea..f329dc478170 100644
> > > --- a/drivers/remoteproc/remoteproc_core.c
> > > +++ b/drivers/remoteproc/remoteproc_core.c
> > > @@ -1662,49 +1662,26 @@ static int rproc_attach(struct rproc *rproc)
> > >  }
> > >
> > >  /*
> > > - * take a firmware and boot it up.
> > > - *
> > > - * Note: this function is called asynchronously upon registration of the
> > > - * remote processor (so we must wait until it completes before we try
> > > - * to unregister the device. one other option is just to use kref here,
> > > - * that might be cleaner).
> > > + * Boot or attach the remote processor in the background, on behalf of
> > > + * rproc_trigger_auto_boot(): rproc_add() runs in probe context and must
> > > + * not block while the firmware image is read from storage.  rproc_boot()
> > > + * dispatches on the processor state, so this covers both a firmware boot
> > > + * and an attach to a processor started by another entity.
> > > + *
> > > + * Note: rproc_del() waits for this work to complete with
> > > + * cancel_work_sync(), so the rproc instance remains valid for the
> > > + * entire lifetime of this function.
> > >   */
> > > -static void rproc_auto_boot_callback(const struct firmware *fw, void *context)
> > > +static void rproc_boot_work(struct work_struct *work)
> > >  {
> > > -   struct rproc *rproc = context;
> > > +   struct rproc *rproc = container_of(work, struct rproc, boot_work);
> > >
> > >     rproc_boot(rproc);
> > > -
> > > -   release_firmware(fw);
> > >  }
> > >
> > > -static void rproc_attach_work(struct work_struct *work)
> > > +static void rproc_trigger_auto_boot(struct rproc *rproc)
> > >  {
> > > -   struct rproc *rproc = container_of(work, struct rproc, attach_work);
> > > -
> > > -   rproc_boot(rproc);
> > > -}
> > > -
> > > -static int rproc_trigger_auto_boot(struct rproc *rproc)
> > > -{
> > > -   int ret;
> > > -
> > > -   if (rproc->state == RPROC_DETACHED) {
> > > -           schedule_work(&rproc->attach_work);
> > > -           return 0;
> > > -   }
> > > -
> > > -   /*
> > > -    * We're initiating an asynchronous firmware loading, so we can
> > > -    * be built-in kernel code, without hanging the boot process.
> > > -    */
> > > -   ret = request_firmware_nowait(THIS_MODULE, FW_ACTION_UEVENT,
> > > -                                 rproc->firmware, &rproc->dev, GFP_KERNEL,
> > > -                                 rproc, rproc_auto_boot_callback);
> > > -   if (ret < 0)
> > > -           dev_err(&rproc->dev, "request_firmware_nowait err: %d\n", ret);
> > > -
> > > -   return ret;
> > > +   schedule_work(&rproc->boot_work);
> > >  }
> > >
> > >  static int rproc_stop(struct rproc *rproc, bool crashed)
> > > @@ -2348,11 +2325,8 @@ int rproc_add(struct rproc *rproc)
> > >     rproc_create_debug_dir(rproc);
> > >
> > >     /* if rproc is marked always-on, request it to boot */
> > > -   if (rproc->auto_boot) {
> > > -           ret = rproc_trigger_auto_boot(rproc);
> > > -           if (ret < 0)
> > > -                   goto rproc_remove_dev;
> > > -   }
> > > +   if (rproc->auto_boot)
> > > +           rproc_trigger_auto_boot(rproc);
> > >
> > >     /* expose to rproc_get_by_phandle users */
> > >     mutex_lock(&rproc_list_mutex);
> > > @@ -2361,10 +2335,6 @@ int rproc_add(struct rproc *rproc)
> > >
> > >     return 0;
> > >
> > > -rproc_remove_dev:
> > > -   cancel_work_sync(&rproc->crash_handler);
> > > -   rproc_delete_debug_dir(rproc);
> > > -   device_del(dev);
> > >  rproc_remove_cdev:
> > >     rproc_char_device_remove(rproc);
> > >     return ret;
> > > @@ -2552,7 +2522,7 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
> > >     INIT_LIST_HEAD(&rproc->subdevs);
> > >     INIT_LIST_HEAD(&rproc->dump_segments);
> > >
> > > -   INIT_WORK(&rproc->attach_work, rproc_attach_work);
> > > +   INIT_WORK(&rproc->boot_work, rproc_boot_work);
> > >     INIT_WORK(&rproc->crash_handler, rproc_crash_handler_work);
> > >     spin_lock_init(&rproc->crash_handler_lock);
> > >
> > > @@ -2630,6 +2600,9 @@ int rproc_del(struct rproc *rproc)
> > >     if (cancel_work_sync(&rproc->crash_handler))
> > >             pm_relax(rproc->dev.parent);
> > >
> > > +   /* auto-boot may still be fetching firmware: wait for it here */
> > > +   cancel_work_sync(&rproc->boot_work);
> > > +
> > >     __rproc_shutdown(rproc, true);
> > >
> > >     rproc_delete_debug_dir(rproc);
> > > diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> > > index a44368737b39..d77e24539133 100644
> > > --- a/include/linux/remoteproc.h
> > > +++ b/include/linux/remoteproc.h
> > > @@ -231,7 +231,7 @@ enum rproc_features {
> > >   * @subdevs: list of subdevices, to following the running state
> > >   * @notifyids: idr for dynamically assigning rproc-wide unique notify ids
> > >   * @index: index of this rproc device
> > > - * @attach_work: workqueue for attaching rproc
> > > + * @boot_work: workqueue for booting rproc
> > >   * @crash_handler: workqueue for handling a crash
> > >   * @crash_handler_lock: serializes crash handler queueing and deletion
> > >   * @deleting: remoteproc deletion has begun
> > > @@ -277,7 +277,7 @@ struct rproc {
> > >     struct list_head subdevs;
> > >     struct idr notifyids;
> > >     int index;
> > > -   struct work_struct attach_work;
> > > +   struct work_struct boot_work;
> > >     struct work_struct crash_handler;
> > >     spinlock_t crash_handler_lock;
> > >     bool deleting;
> > > --
> > > 2.34.1
> > >
