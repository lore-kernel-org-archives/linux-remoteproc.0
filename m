Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D685172FA
	for <linux-remoteproc@vger.kernel.org>; Tue, 13 Oct 2026 15:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791906953; cv=pass; b=USjROtlkho7PxWRWPsJ4/Uh8Qofih6qzs42TmpzgXIt3A11fg7fv0VBsurGhAqDXXpVIa3ekPwIZtqTq75LwVBsIYi4zL8qHLYdmzFemc90PKBB2DMZxW697W32Gy+h3CFBkqZCkTZYu1YkKbzPnO1GKfHRRytxrkcLWJh9JpHQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791906953; c=relaxed/simple;
	bh=Fl+I6QVmx6SGoeU7QJN/faQtgRpSfWj+gi8dO4AbAF4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CIWv82MwV+NldECLpSE8pilHseKKKYZ0wEtMhWcy+LE6MsSsCnv8jsZYq0+UCQw6O1FzhHJ0bCbGYz3apT313tuSCH4Zz3CNr2GVh1QGeqo3Jc/rSSaDX6L643m6/JAtkEdbLIPpG1yXt51zhUOpNMZzt+YjMZxS0fB+TN7zb1s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u198AWQi; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u198AWQi"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b203527bceso106147a12.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 13 Oct 2026 08:55:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791906949; cv=none;
        d=google.com; s=arc-20260327;
        b=NOD+Mq2IpwcVzLtOLRSVQCzMYOUcJtR9WSDOuFyqNrlj3bOnY1A1k4qStLVPN+tx1x
         whDE3NrGz8Y7bPQ2AWFk5z8lq+vysNJaZr51QV29YyvifHrN2QyRdrWDkiaf0wt0blvq
         Ph45OdxQ0roczalOBYtGz2aMVOIypR8Z+emBc4jy+fwtQNYU5L5G6cuXO11KYU5EzYGZ
         i3hzEHiFKpS27HP/KR6KEK21uJYTiUx0/GIrHli/2ey51qiANOg+ZD5pwdJJVjI/15Gr
         n6XI5P/RELgJ6XGNogwDRC0hNhg3NvZXQKpMmfNjK3e/WrofBZKfCF7xoZhEtfD6xWQL
         sCdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=z8gOX9MZoG0nwlbKtzFc0ROF710/exmQ1whe7/AMGWw=;
        fh=qkkRCM8SiAOcGFqSwtxZ1mk9Ix73v41+jgaXne6840g=;
        b=bYCnkxnvjJFUSrhLhDnhjKQxC1DK1Tg+8SXRFLdYdHzabpxuaR9mI2p60IIm6y9VcL
         iYxuZf/x2+rFRtIZ51u9J4PdvsK+HIEduqAXxUImqJ8cnwtkqDWtShPDjVFv2RTvRhra
         ovK+q1nsK2XiCuXPY0L3ruShkq28cjyn1MOe07rNIFsrX8RTaVTIKGK7sJ7v/y/cMDhl
         af/cI2HdjTG+brwxhkZf/yUH9a5Jwgc5fXOMk7JKjyBN9geer0x/5Kr9nVCbUlyCWzUa
         CeHxShW4dA6xS9ipNDZN0zEs0+8KeXv3zryfhngzDLjHeu1DRgYk8k1W/wUPs7FliGB/
         vCKg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791906949; x=1792511749; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z8gOX9MZoG0nwlbKtzFc0ROF710/exmQ1whe7/AMGWw=;
        b=u198AWQim7aWA09f3k8kbTwG0Wo3C4/pR3A+sobGku7Wc/MBV5+b1q/8RuUx6gVg94
         aXSf1R9wQw3dYOr8/eL8we/Ml2bjlmULz+5lhiBb9cyn0Tw/sToIIgkniAPMgXfaYAgm
         LXDSZTLOw8+dKQr7n9mmrLeM9ZoQziWTyMGegeiX3wB9/OLsQWSaLaSnM3543ZSPGURD
         JvDrQQd1suRPyKkPFArza0l3MuXjWUC+nM7c8gWHQHMHpoKhv+yH5Ko8QCsrRPvcRbSJ
         kNZctb5FGfVNV1HKsJHRs3iA2gu+frPhdK3iotRmy08MK+4OBIVwTEnWt+3ykqQ1ky1q
         Fjfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791906949; x=1792511749;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=z8gOX9MZoG0nwlbKtzFc0ROF710/exmQ1whe7/AMGWw=;
        b=ANtc29IoXwJ/dqwP/X3cLDd32fZF0Hd15eAyhld1YzGo6ql4XwXssoi4LHC5LZHtR5
         NP9bSahLenfHBHcD2nfKsNul1CB6Ubu8/2na6wDzMFc6GUxGUVGKlR2SXxpWJNamzoiH
         1pUC/pGKADgpH6qPdzbUyusEl5SJaanroCl4ErEw1MjLxCulKLHCUqxJHbUSRob3uKdN
         1d5I9JBlZxzTwfPaL4G0N2fbR9YO7wSQFHxXmBQfjM82PZea19xelf7NspQUHSKYJwJA
         8w9W0KzbiB4R7ftvgxs/pOr0AcVQJ2X8lAmD/NNZPWurRLMDytQI7yttmPQJZjrmgcN5
         WTnw==
X-Forwarded-Encrypted: i=1; AKwUvByEp8QAJk4RUpHWbqU1qmorZwnfvv1XiiVxts+SR2wIow4nrk8ShHgTvktp6Ek33VHIoYROORNbKfjvvrlapss6@vger.kernel.org
X-Gm-Message-State: AFq9FYK8CL8uKysArqI6DvIAsmqt4z8nkzLJr1RWmhqfNNz0Clil0Fj2
	eJWWibINteA+OWzNbUjPA5i5Y1JlvQ+6KlyXFPqEns1Na4H2nIyYi5x/AqlHaS+ESC6oa/7CQBU
	R6JEcREUuYfVVuq5IMBNedynvPqWDxJCIho2qs3CKBA==
X-Gm-Gg: AYBFou25NJKAItWJVmiMxyu9WC+CRVpObn6bYY8w3olMYB6ov2VovBQD9yvTPqVFlzj
	GLeXql9tgXJUmyOAPWHGzUAB0NXliNB7pxoEjAfEZZhd2QLIghQBa+92vZZlXL3tRNfFBs8LE/v
	MG5uyWum7DklQS/Do8fG9j37O5AwYZ4ZUIeUt5zy6S9iyvkRa+Iv7e88lbfLM4K3aHY3ilV9Tvp
	ciUSBvqy8eCtOVGnm4WvxKAtIx8x6CGi++DmmXtSrJKzkNcPyBh3DBjUF5Q3AQbYtqgQiJgjMjn
	57rV3RW+nBs6vLbM3Jcpn9eEwg1JjzDdNYDjMbjga1btsBdZ53M8uxpLrhxPZtKipB5OHRzjTbq
	z39zSEjD74MLAcQ==
X-Received: by 2002:a05:6402:52c6:b0:6b1:d8e4:f93 with SMTP id
 4fb4d7f45d1cf-6b1d8e42e76mr3731578a12.33.1791906949171; Tue, 13 Oct 2026
 08:55:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ar0lvsu80miGJdGS@p14s> <20261001081056.38293-1-hyz3367@gmail.com>
In-Reply-To: <20261001081056.38293-1-hyz3367@gmail.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 13 Oct 2026 09:55:37 -0600
X-Gm-Features: AclHuK9k6982zEoNoGluocWt9T3eTL3nhoi7JX355Oac8ApeVuUVqsbrnakim8I
Message-ID: <CANLsYkxz2vNE1rsc_sRQVC7YJHw5hyB8YD-zFi1DujUd5b02cQ@mail.gmail.com>
Subject: Re: [PATCH v3] remoteproc: core: Fetch the auto-boot firmware only once
To: Yonghao Zhang <hyz3367@gmail.com>
Cc: andersson@kernel.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 1 Oct 2026 at 02:11, Yonghao Zhang <hyz3367@gmail.com> wrote:
>
> Auto-boot for an always-on remote processor registers an asynchronous
> request_firmware_nowait() whose callback, rproc_auto_boot_callback(),
> calls rproc_boot() first and only releases the fetched image at the
> very end of the callback.  rproc_boot() does not take this image as an
> argument: it fetches the very same image again with a synchronous
> request_firmware(), so every auto-boot reads the firmware image twice
> and allocates the buffer twice; on kernels with the sysfs fallback
> enabled, the uevent round-trip is repeated as well.
>
> The asynchronous request exists only so that rproc_add() does not
> block on the filesystem read; the image it fetches is never used.
> The core already defers rproc_boot() to a worker for detached
> processors (attach_work).  Reuse that worker for offline processors
> too and drop the asynchronous firmware request: rproc_boot() fetches
> the image exactly once and dispatches between a firmware boot and
> an attach based on the processor state.  The work is renamed to
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
> Changes in v3:
> - Drop rproc_trigger_auto_boot() wrapper and schedule boot_work
>   directly in rproc_add() (Mathieu).
>
> Changes in v2:
> - Fix the order described in the changelog: the callback calls
>   rproc_boot() first and releases the asynchronously fetched image at
>   the end of the callback (Mathieu).
> - Fix typo "proccessor".
>
>  drivers/remoteproc/remoteproc_core.c | 66 +++++++---------------------
>  include/linux/remoteproc.h           |  4 +-
>  2 files changed, 19 insertions(+), 51 deletions(-)
>

I will apply this patch when 7.4-rc1 comes out.

> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 263e12f022ea..b88bf179507d 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1662,51 +1662,23 @@ static int rproc_attach(struct rproc *rproc)
>  }
>
>  /*
> - * take a firmware and boot it up.
> - *
> - * Note: this function is called asynchronously upon registration of the
> - * remote processor (so we must wait until it completes before we try
> - * to unregister the device. one other option is just to use kref here,
> - * that might be cleaner).
> + * Boot or attach the remote processor in the background: rproc_add()
> + * runs in probe context and must not block while the firmware image is
> + * read from storage.  rproc_boot() dispatches on the processor state,
> + * so this covers both a firmware boot and an attach to a processor
> + * started by another entity.
> + *
> + * Note: rproc_del() waits for this work to complete with
> + * cancel_work_sync(), so the rproc instance remains valid for the
> + * entire lifetime of this function.
>   */
> -static void rproc_auto_boot_callback(const struct firmware *fw, void *context)
> -{
> -       struct rproc *rproc = context;
> -
> -       rproc_boot(rproc);
> -
> -       release_firmware(fw);
> -}
> -
> -static void rproc_attach_work(struct work_struct *work)
> +static void rproc_boot_work(struct work_struct *work)
>  {
> -       struct rproc *rproc = container_of(work, struct rproc, attach_work);
> +       struct rproc *rproc = container_of(work, struct rproc, boot_work);
>
>         rproc_boot(rproc);
>  }
>
> -static int rproc_trigger_auto_boot(struct rproc *rproc)
> -{
> -       int ret;
> -
> -       if (rproc->state == RPROC_DETACHED) {
> -               schedule_work(&rproc->attach_work);
> -               return 0;
> -       }
> -
> -       /*
> -        * We're initiating an asynchronous firmware loading, so we can
> -        * be built-in kernel code, without hanging the boot process.
> -        */
> -       ret = request_firmware_nowait(THIS_MODULE, FW_ACTION_UEVENT,
> -                                     rproc->firmware, &rproc->dev, GFP_KERNEL,
> -                                     rproc, rproc_auto_boot_callback);
> -       if (ret < 0)
> -               dev_err(&rproc->dev, "request_firmware_nowait err: %d\n", ret);
> -
> -       return ret;
> -}
> -
>  static int rproc_stop(struct rproc *rproc, bool crashed)
>  {
>         struct device *dev = &rproc->dev;
> @@ -2348,11 +2320,8 @@ int rproc_add(struct rproc *rproc)
>         rproc_create_debug_dir(rproc);
>
>         /* if rproc is marked always-on, request it to boot */
> -       if (rproc->auto_boot) {
> -               ret = rproc_trigger_auto_boot(rproc);
> -               if (ret < 0)
> -                       goto rproc_remove_dev;
> -       }
> +       if (rproc->auto_boot)
> +               schedule_work(&rproc->boot_work);
>
>         /* expose to rproc_get_by_phandle users */
>         mutex_lock(&rproc_list_mutex);
> @@ -2361,10 +2330,6 @@ int rproc_add(struct rproc *rproc)
>
>         return 0;
>
> -rproc_remove_dev:
> -       cancel_work_sync(&rproc->crash_handler);
> -       rproc_delete_debug_dir(rproc);
> -       device_del(dev);
>  rproc_remove_cdev:
>         rproc_char_device_remove(rproc);
>         return ret;
> @@ -2552,7 +2517,7 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
>         INIT_LIST_HEAD(&rproc->subdevs);
>         INIT_LIST_HEAD(&rproc->dump_segments);
>
> -       INIT_WORK(&rproc->attach_work, rproc_attach_work);
> +       INIT_WORK(&rproc->boot_work, rproc_boot_work);
>         INIT_WORK(&rproc->crash_handler, rproc_crash_handler_work);
>         spin_lock_init(&rproc->crash_handler_lock);
>
> @@ -2630,6 +2595,9 @@ int rproc_del(struct rproc *rproc)
>         if (cancel_work_sync(&rproc->crash_handler))
>                 pm_relax(rproc->dev.parent);
>
> +       /* auto-boot may still be fetching firmware: wait for it here */
> +       cancel_work_sync(&rproc->boot_work);
> +
>         __rproc_shutdown(rproc, true);
>
>         rproc_delete_debug_dir(rproc);
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
>         struct list_head subdevs;
>         struct idr notifyids;
>         int index;
> -       struct work_struct attach_work;
> +       struct work_struct boot_work;
>         struct work_struct crash_handler;
>         spinlock_t crash_handler_lock;
>         bool deleting;
> --
> 2.34.1
>
