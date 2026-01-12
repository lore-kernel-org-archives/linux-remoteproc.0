Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA56374161
	for <linux-remoteproc@vger.kernel.org>; Mon, 12 Jan 2026 17:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768238060; cv=none; b=uGa9VET2EA5IpTw4lGaDz3xIY27Zjac1kwn+NUoVLf4m3KdU82Q1eqpRFTglIXXUFdc4FxiOgZbdHkXJtnUPugHHypMngn2y39+j0G/h5qJdqwAuLNjxLnKeGqDWbCmOl7L7eVvQt1gBxJ3jCCBKZteZVgqJKVZr4hKXnfXiwrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768238060; c=relaxed/simple;
	bh=BAfZ+kV7cVQvT74234sqWohDrc+KKHH1+6Hubs2WK2k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ETsXYEI8viDSYMXKKrXXgUYzSydPYxAJsyCu2jBHnTHITIP1DDaHJHiJ1EMLeFmcIBHH0GCPk866vnaFpe4eNfssKrQ2eomNS7nQlzFuS6zAuZZHkoiJWJUnzxe9fL9nA9RyeCzVoOU14SB6L3aqx2mIWCV+HMn2cN5uEuWfPzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PWIjX8U+; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PWIjX8U+"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-64d4d8b3ad7so10868376a12.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 12 Jan 2026 09:14:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768238057; x=1768842857; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LaqVKjn3HybXAaQGlHj3Cj3gxHUmIRrjkoaUVWLdE+o=;
        b=PWIjX8U+ASk7iJl5a/eHcANIchJDbEtWzTqQv+CuGl64JoxAhnJaTNitz7en0hjyg3
         7akMxymI0Ff/Va11+3WoJ4CXFP4na5+nYsJSmjD9G734DmSHBz4Vg3/dyoUabgUWr/e1
         NDEiZXoksgS+BiqfGOdiHE3D59i+/+qU95y4QIiawNc+jEr21e6NDd3KSs4gsndyhedy
         uu2f1zsMrlyJvVUBLv0X8qxkx6cTzfy//kKgG2AVIOJ7WdTMgyTp3oYRB+nyXp/nqHli
         vcG/oLe+2Tndfa1teJw4yA3YmjeZxzjVGZA1SmmNBZ3XGKkYkhplPFKb0jF+pjRgM5xB
         8YeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768238057; x=1768842857;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LaqVKjn3HybXAaQGlHj3Cj3gxHUmIRrjkoaUVWLdE+o=;
        b=uG0IRBeTlbp2Tk5mq8CvHR45QS41ZlgQ3HvtpYHAg9gZilKbArBR/1aU0GqmvXuMbJ
         i0HdRTwh1eg5yLbYN4m6/FLm94Iondf87o+QA1YHzBJvxWpAqWtZUFdDGeMPOdmzQ7js
         R5Jd/CPYAMIh/SqceFDcUwEa6ZGp/Pf687EDd3ekzctlgKJKPZseBEuuNeRq7h2x5MYB
         ewcDGJHORfRA+aLnm95EZi/Qhto+Pb9re3qFD0owrZJbqp+zCjGGO4mC3he4xE2XeIpL
         ve9pm7+9NKsjrrME6yhSBnQr7iLXVCLk/likZK0D/r1mVVrfg2Oyc87m8/qnHU9PEFsz
         lJlw==
X-Forwarded-Encrypted: i=1; AJvYcCVEJ7VTd/YWposy0walkjqJEufw1Zgp94j0s5IYtTntpIjad57uP8aFWiKR1M+2sb6MRTubeHsnngxV0OYwIvuH@vger.kernel.org
X-Gm-Message-State: AOJu0YyaqxHxnxAhwbG1BkkQnwHapi+BevgOoW4BVmrYo8RvSWFTX6gy
	WWTBb4S8AHhSb2TOrh+lHYhQrtEva8IammqTaU6pGoKNBKKeoHKVLtog/n9YfqGkEZGeT5UUtzN
	CMsVQ2fKjNChahCXAJ9YyIz+TL/N/9a82cvcLDsPxzw==
X-Gm-Gg: AY/fxX7gGuQFwDVOzvYlgOAAmdKW3RXsCVMd+xHyIhs2fDYvMJJqKp4K7Ll6CDjUb0D
	qY3tUNKdrwM1JhOIWzA/xJpOplbaqB8Rsc+NmDxK+2Zmw9ifpEuhC+Q5WWGwx8RMvqOyFJu6tO1
	/5/dytde+WHqfEvKMDjHUt6iyLaHSgC1vSWo3vb2+tL2147z9icyHpn4z5MCTmyL0Z7aKpEWkZX
	zcjJV/isD6VQSSj4xmliua3XSDSucyGVyoqOuIwtHtIzkUuIIjyoihWeHW4v7cjwyHSitxq3JoB
	cnUaqi6zf8QZH46U251p0KUYKslVAw==
X-Google-Smtp-Source: AGHT+IF5+xfVIsZA2wr8JPc/95fH1etbn20R3Fu8kJxC0WL69/X8MM6hCVu3p0Vm0yktQncN5rrF9RQBGHp7Wczm3Z4=
X-Received: by 2002:a17:907:2d2c:b0:b87:29a3:27f9 with SMTP id
 a640c23a62f3a-b8729a3328bmr215457466b.18.1768238057187; Mon, 12 Jan 2026
 09:14:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260112110755.2435899-1-tzungbi@kernel.org>
In-Reply-To: <20260112110755.2435899-1-tzungbi@kernel.org>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Mon, 12 Jan 2026 10:14:06 -0700
X-Gm-Features: AZwV_QhFTOKB8Mb4toZTdxIgZzuORUy3V9mQRfv_0RLRLo19pmsGVWf9Wr41giU
Message-ID: <CANLsYkxuh6duedGuzR7We4T1KSXA613SXg+HWL=TONdhtP4XMQ@mail.gmail.com>
Subject: Re: [PATCH v2] remoteproc: mediatek: Break lock dependency to `prepare_lock`
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-remoteproc@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 12 Jan 2026 at 04:08, Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> A potential circular locking dependency (ABBA deadlock) exists between
> `ec_dev->lock` and the clock framework's `prepare_lock`.
>
> The first order (A -> B) occurs when scp_ipi_send() is called while
> `ec_dev->lock` is held (e.g., within cros_ec_cmd_xfer()):
> 1. cros_ec_cmd_xfer() acquires `ec_dev->lock` and calls scp_ipi_send().
> 2. scp_ipi_send() calls clk_prepare_enable(), which acquires
>    `prepare_lock`.
> See #0 in the following example calling trace.
> (Lock Order: `ec_dev->lock` -> `prepare_lock`)
>
> The reverse order (B -> A) is more complex and has been observed
> (learned) by lockdep.  It involves the clock prepare operation
> triggering power domain changes, which then propagates through sysfs
> and power supply uevents, eventually calling back into the ChromeOS EC
> driver and attempting to acquire `ec_dev->lock`:
> 1. Something calls clk_prepare(), which acquires `prepare_lock`.  It
>    then triggers genpd operations like genpd_runtime_resume(), which
>    takes `&genpd->mlock`.
> 2. Power domain changes can trigger regulator changes; regulator
>    changes can then trigger device link changes; device link changes
>    can then trigger sysfs changes.  Eventually, power_supply_uevent()
>    is called.
> 3. This leads to calls like cros_usbpd_charger_get_prop(), which calls
>    cros_ec_cmd_xfer_status(), which then attempts to acquire
>    `ec_dev->lock`.
> See #1 ~ #6 in the following example calling trace.
> (Lock Order: `prepare_lock` -> `&genpd->mlock` -> ... -> `&ec_dev->lock`)
>
> Move the clk_prepare()/clk_unprepare() operations for `scp->clk` to the
> remoteproc prepare()/unprepare() callbacks.  This ensures `prepare_lock`
> is only acquired in prepare()/unprepare() callbacks.  Since
> `ec_dev->lock` is not involved in the callbacks, the dependency loop is
> broken.
>
> This means the clock is always "prepared" when the SCP is running.  The
> prolonged "prepared time" for the clock should be acceptable as SCP is
> designed to be a very power efficient processor.  The power consumption
> impact can be negligible.
>

I certainly would have appreciated this kind of information upon first
looking at this patch.  It would have saved me valuable time, time
that could have been spent on reviewing other people's work.

> A simplified calling trace reported by lockdep:
> > -> #6 (&ec_dev->lock)
> >        cros_ec_cmd_xfer
> >        cros_ec_cmd_xfer_status
> >        cros_usbpd_charger_get_port_status
> >        cros_usbpd_charger_get_prop
> >        power_supply_get_property
> >        power_supply_show_property
> >        power_supply_uevent
> >        dev_uevent
> >        uevent_show
> >        dev_attr_show
> >        sysfs_kf_seq_show
> >        kernfs_seq_show
> > -> #5 (kn->active#2)
> >        kernfs_drain
> >        __kernfs_remove
> >        kernfs_remove_by_name_ns
> >        sysfs_remove_file_ns
> >        device_del
> >        __device_link_del
> >        device_links_driver_bound
> > -> #4 (device_links_lock)
> >        device_link_remove
> >        _regulator_put
> >        regulator_put
> > -> #3 (regulator_list_mutex)
> >        regulator_lock_dependent
> >        regulator_disable
> >        scpsys_power_off
> >        _genpd_power_off
> >        genpd_power_off
> > -> #2 (&genpd->mlock/1)
> >        genpd_add_subdomain
> >        pm_genpd_add_subdomain
> >        scpsys_add_subdomain
> >        scpsys_probe
> > -> #1 (&genpd->mlock)
> >        genpd_runtime_resume
> >        __rpm_callback
> >        rpm_callback
> >        rpm_resume
> >        __pm_runtime_resume
> >        clk_core_prepare
> >        clk_prepare
> > -> #0 (prepare_lock)
> >        clk_prepare
> >        scp_ipi_send
> >        scp_send_ipi
> >        mtk_rpmsg_send
> >        rpmsg_send
> >        cros_ec_pkt_xfer_rpmsg
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> ---
> v2:
> - Re-organized commit message.
> - Rebased to next-20260109.
>
> v1: https://lore.kernel.org/r/20251229043146.4102967-1-tzungbi@kernel.org
>
>  drivers/remoteproc/mtk_scp.c     | 39 +++++++++++++++++++++++---------
>  drivers/remoteproc/mtk_scp_ipi.c |  4 ++--
>  2 files changed, 30 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index 328541e62158..4651311aeb07 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -283,7 +283,7 @@ static irqreturn_t scp_irq_handler(int irq, void *priv)
>         struct mtk_scp *scp = priv;
>         int ret;
>
> -       ret = clk_prepare_enable(scp->clk);
> +       ret = clk_enable(scp->clk);
>         if (ret) {
>                 dev_err(scp->dev, "failed to enable clocks\n");
>                 return IRQ_NONE;
> @@ -291,7 +291,7 @@ static irqreturn_t scp_irq_handler(int irq, void *priv)
>
>         scp->data->scp_irq_handler(scp);
>
> -       clk_disable_unprepare(scp->clk);
> +       clk_disable(scp->clk);
>
>         return IRQ_HANDLED;
>  }
> @@ -665,7 +665,7 @@ static int scp_load(struct rproc *rproc, const struct firmware *fw)
>         struct device *dev = scp->dev;
>         int ret;
>
> -       ret = clk_prepare_enable(scp->clk);
> +       ret = clk_enable(scp->clk);
>         if (ret) {
>                 dev_err(dev, "failed to enable clocks\n");
>                 return ret;
> @@ -680,7 +680,7 @@ static int scp_load(struct rproc *rproc, const struct firmware *fw)
>
>         ret = scp_elf_load_segments(rproc, fw);
>  leave:
> -       clk_disable_unprepare(scp->clk);
> +       clk_disable(scp->clk);
>
>         return ret;
>  }
> @@ -691,14 +691,14 @@ static int scp_parse_fw(struct rproc *rproc, const struct firmware *fw)
>         struct device *dev = scp->dev;
>         int ret;
>
> -       ret = clk_prepare_enable(scp->clk);
> +       ret = clk_enable(scp->clk);
>         if (ret) {
>                 dev_err(dev, "failed to enable clocks\n");
>                 return ret;
>         }
>
>         ret = scp_ipi_init(scp, fw);
> -       clk_disable_unprepare(scp->clk);
> +       clk_disable(scp->clk);
>         return ret;
>  }
>
> @@ -709,7 +709,7 @@ static int scp_start(struct rproc *rproc)
>         struct scp_run *run = &scp->run;
>         int ret;
>
> -       ret = clk_prepare_enable(scp->clk);
> +       ret = clk_enable(scp->clk);
>         if (ret) {
>                 dev_err(dev, "failed to enable clocks\n");
>                 return ret;
> @@ -734,14 +734,14 @@ static int scp_start(struct rproc *rproc)
>                 goto stop;
>         }
>
> -       clk_disable_unprepare(scp->clk);
> +       clk_disable(scp->clk);
>         dev_info(dev, "SCP is ready. FW version %s\n", run->fw_ver);
>
>         return 0;
>
>  stop:
>         scp->data->scp_reset_assert(scp);
> -       clk_disable_unprepare(scp->clk);
> +       clk_disable(scp->clk);
>         return ret;
>  }
>
> @@ -909,7 +909,7 @@ static int scp_stop(struct rproc *rproc)
>         struct mtk_scp *scp = rproc->priv;
>         int ret;
>
> -       ret = clk_prepare_enable(scp->clk);
> +       ret = clk_enable(scp->clk);
>         if (ret) {
>                 dev_err(scp->dev, "failed to enable clocks\n");
>                 return ret;
> @@ -917,12 +917,29 @@ static int scp_stop(struct rproc *rproc)
>
>         scp->data->scp_reset_assert(scp);
>         scp->data->scp_stop(scp);
> -       clk_disable_unprepare(scp->clk);
> +       clk_disable(scp->clk);
>
>         return 0;
>  }
>
> +static int scp_prepare(struct rproc *rproc)
> +{
> +       struct mtk_scp *scp = rproc->priv;
> +
> +       return clk_prepare(scp->clk);
> +}
> +
> +static int scp_unprepare(struct rproc *rproc)
> +{
> +       struct mtk_scp *scp = rproc->priv;
> +
> +       clk_unprepare(scp->clk);
> +       return 0;
> +}
> +
>  static const struct rproc_ops scp_ops = {
> +       .prepare        = scp_prepare,
> +       .unprepare      = scp_unprepare,
>         .start          = scp_start,
>         .stop           = scp_stop,
>         .load           = scp_load,
> diff --git a/drivers/remoteproc/mtk_scp_ipi.c b/drivers/remoteproc/mtk_scp_ipi.c
> index c068227e251e..7a37e273b3af 100644
> --- a/drivers/remoteproc/mtk_scp_ipi.c
> +++ b/drivers/remoteproc/mtk_scp_ipi.c
> @@ -171,7 +171,7 @@ int scp_ipi_send(struct mtk_scp *scp, u32 id, void *buf, unsigned int len,
>             WARN_ON(len > scp_sizes->ipi_share_buffer_size) || WARN_ON(!buf))
>                 return -EINVAL;
>
> -       ret = clk_prepare_enable(scp->clk);
> +       ret = clk_enable(scp->clk);
>         if (ret) {
>                 dev_err(scp->dev, "failed to enable clock\n");
>                 return ret;
> @@ -211,7 +211,7 @@ int scp_ipi_send(struct mtk_scp *scp, u32 id, void *buf, unsigned int len,
>
>  unlock_mutex:
>         mutex_unlock(&scp->send_lock);
> -       clk_disable_unprepare(scp->clk);
> +       clk_disable(scp->clk);
>
>         return ret;
>  }
> --
> 2.52.0.457.g6b5491de43-goog
>
>
