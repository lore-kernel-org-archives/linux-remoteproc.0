Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74DEE33DEED
	for <linux-remoteproc@vger.kernel.org>; Mon, 26 Jan 2026 15:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769442449; cv=none; b=XDXlW36MBptcXEPRkj7TYHEzP0oudF+i9rWiAF0K/lnPGkAjIWnDq+wtKtg0Jxvu5N2YzCifAIhESreY3IdvZuNlQYHvW3TQBP2+Cipz7VLcIZESZdrepdiqJNpqMNIZk4dZtYttDEoj3qIZl7cIYppsUQSs4RepPN5osuqNFPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769442449; c=relaxed/simple;
	bh=+C8S8/3umsYjxM4gR3d6qgPcacyphjhf8CqViqELrZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VTfvHs3qMHeHj4uoSmTPHilkZWWYYrdnSvR9sT6ZBQLLu4ANR35tUgWHoUW7JacLYXDQdLlPN1ZSAIztxUWKmWP5p6l6i7pOPhWls9Ph69D+nQl6tpNoGNkvke/AmLH3ulhh+0+ihqCjYnxdy5Sfx+wOc5eVJNbmhNOiZE1tjEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bIH5RlLn; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bIH5RlLn"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-823075fed75so2502629b3a.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 26 Jan 2026 07:47:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769442448; x=1770047248; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Onpoby8TzgYOiBiFEP1WwP/Cbvb++rQ+q0VOL7clC5Y=;
        b=bIH5RlLnm6sHjnVLdwmKjrkLts53mWG2USmkkFZZEhUs7Sbkajtnj//wIuK29tf4XB
         pQzFOQhOwtlTcXmGGBu8nzCOSOUa/X+QJCcIQVfrCX2gjBEfaL/ZO+E5xG19SvamcQQ1
         AUYqjYXRBZfLiIIUpfijJhleBO5BIpH2ujSFu8UjI6lXJwv4LiKdXTBHA7FX4oJ/kbVy
         02UT3rFE4NTJavZajFjq4empZ0sKmTXSLmZzCFp9SVng6nkwheWJcbmQ1k4l9vLa2q7Y
         s7OIhe8MELGDVUMzXTw9WAbmtbiO6+2vpvs7jIl+nlYItqpnA48ts/DNHJKuWqnIDY5f
         i8VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769442448; x=1770047248;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Onpoby8TzgYOiBiFEP1WwP/Cbvb++rQ+q0VOL7clC5Y=;
        b=fSUQgl3aLi3vxwQf16A0Yt3IMk16zb96CQG6P0uldQPHnrr8/f3DpZgalrxNBFG1P8
         3+rgqy++XfHK/4UaQpyfXMitdUYvoNhjh7t+HU+k4TEy2p/z/EExaxHeBN1V02EcPnLT
         duwoFGH1JMdYIBQagjLD31cefpr0aZotnCml43f0VKuzwpZ1I1d6bQBoE1LWkWjH4jMM
         Ec8XLPvPBVNA6CCm8ioLf9rakgxcSL6t+02OPW/tntbEvgVAIbC7QxsV/cUoM+tyDWTY
         ihuC/F3gEUgcYRWbrgHzVatWjrSKv0BDcvdy835Ctd+52/uirB444tPZCgllJ4FKy00y
         Bldg==
X-Forwarded-Encrypted: i=1; AJvYcCUlPys7bUTQCrQKtogNsiKbg7apiNBRe3BT5JzhMhEA0sLm4JpYGgO2UJbTXzBTrx9FWzWDyXFkl68SKpdpWVm5@vger.kernel.org
X-Gm-Message-State: AOJu0YymUbW5o/6Ob27bfi23ASbjsUlhTKLnHQfI/AkTV9Rrgrv+g86i
	H4jze4j1KCeOn5/3evybAoj4ieuqZbrepvy7JSYht/dm7iNSZEGck2UXXahoLjvpyMw=
X-Gm-Gg: AZuq6aJHmtZS0dMIwlaLER/I3QopuiiRgnTmPvq0aFcS0wkKSZaVEb/a1k6W9/AwDdN
	106hi52pgCm5H3NNN++SOEOvpPHlHuGEO+514sEr4PiWgHZ70ZLjI/IgghCIEoBvzy59Z5pP0vr
	rO1Wv9Z22xatSLmjLWtlauGYCvNNo4mf0bRqNraU6EAzXebif53bcJUO72/uvLim+BwbNOj1V0B
	rRkx+fp5U8k01vtQ8FQ2yD8PnGpwRjTH86pBXQxCt6M3KNz1FF4ZSz/L8PDWTSTNgFFxTIjHvgt
	CrdFxJnD2imKRVkVvusVsgiNGkbwn3UmEqDhXYGHskRytgpA7i7YlF9cDwFjfTD67iCw9CZcjBj
	x7QWwAuTFKZWr57pFHusjRjT4QCkEkuNf4vsHflDwKCxXIaGve5+O7bZ9kJ4cY5VwuSuGLgOK+V
	QFtGtLGiBihbTKJQ==
X-Received: by 2002:a05:6a00:4b51:b0:81e:b93a:ab09 with SMTP id d2e1a72fcca58-8234119b7e6mr4073196b3a.1.1769442447588;
        Mon, 26 Jan 2026 07:47:27 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:6260:7bcf:7e2d:fa8d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c635a142e5asm8664137a12.12.2026.01.26.07.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 07:47:27 -0800 (PST)
Date: Mon, 26 Jan 2026 08:47:24 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-remoteproc@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2] remoteproc: mediatek: Break lock dependency to
 `prepare_lock`
Message-ID: <aXeMjN4ziJ-w63sB@p14s>
References: <20260112110755.2435899-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112110755.2435899-1-tzungbi@kernel.org>

On Mon, Jan 12, 2026 at 11:07:55AM +0000, Tzung-Bi Shih wrote:
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

Applied.
 
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index 328541e62158..4651311aeb07 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -283,7 +283,7 @@ static irqreturn_t scp_irq_handler(int irq, void *priv)
>  	struct mtk_scp *scp = priv;
>  	int ret;
>  
> -	ret = clk_prepare_enable(scp->clk);
> +	ret = clk_enable(scp->clk);
>  	if (ret) {
>  		dev_err(scp->dev, "failed to enable clocks\n");
>  		return IRQ_NONE;
> @@ -291,7 +291,7 @@ static irqreturn_t scp_irq_handler(int irq, void *priv)
>  
>  	scp->data->scp_irq_handler(scp);
>  
> -	clk_disable_unprepare(scp->clk);
> +	clk_disable(scp->clk);
>  
>  	return IRQ_HANDLED;
>  }
> @@ -665,7 +665,7 @@ static int scp_load(struct rproc *rproc, const struct firmware *fw)
>  	struct device *dev = scp->dev;
>  	int ret;
>  
> -	ret = clk_prepare_enable(scp->clk);
> +	ret = clk_enable(scp->clk);
>  	if (ret) {
>  		dev_err(dev, "failed to enable clocks\n");
>  		return ret;
> @@ -680,7 +680,7 @@ static int scp_load(struct rproc *rproc, const struct firmware *fw)
>  
>  	ret = scp_elf_load_segments(rproc, fw);
>  leave:
> -	clk_disable_unprepare(scp->clk);
> +	clk_disable(scp->clk);
>  
>  	return ret;
>  }
> @@ -691,14 +691,14 @@ static int scp_parse_fw(struct rproc *rproc, const struct firmware *fw)
>  	struct device *dev = scp->dev;
>  	int ret;
>  
> -	ret = clk_prepare_enable(scp->clk);
> +	ret = clk_enable(scp->clk);
>  	if (ret) {
>  		dev_err(dev, "failed to enable clocks\n");
>  		return ret;
>  	}
>  
>  	ret = scp_ipi_init(scp, fw);
> -	clk_disable_unprepare(scp->clk);
> +	clk_disable(scp->clk);
>  	return ret;
>  }
>  
> @@ -709,7 +709,7 @@ static int scp_start(struct rproc *rproc)
>  	struct scp_run *run = &scp->run;
>  	int ret;
>  
> -	ret = clk_prepare_enable(scp->clk);
> +	ret = clk_enable(scp->clk);
>  	if (ret) {
>  		dev_err(dev, "failed to enable clocks\n");
>  		return ret;
> @@ -734,14 +734,14 @@ static int scp_start(struct rproc *rproc)
>  		goto stop;
>  	}
>  
> -	clk_disable_unprepare(scp->clk);
> +	clk_disable(scp->clk);
>  	dev_info(dev, "SCP is ready. FW version %s\n", run->fw_ver);
>  
>  	return 0;
>  
>  stop:
>  	scp->data->scp_reset_assert(scp);
> -	clk_disable_unprepare(scp->clk);
> +	clk_disable(scp->clk);
>  	return ret;
>  }
>  
> @@ -909,7 +909,7 @@ static int scp_stop(struct rproc *rproc)
>  	struct mtk_scp *scp = rproc->priv;
>  	int ret;
>  
> -	ret = clk_prepare_enable(scp->clk);
> +	ret = clk_enable(scp->clk);
>  	if (ret) {
>  		dev_err(scp->dev, "failed to enable clocks\n");
>  		return ret;
> @@ -917,12 +917,29 @@ static int scp_stop(struct rproc *rproc)
>  
>  	scp->data->scp_reset_assert(scp);
>  	scp->data->scp_stop(scp);
> -	clk_disable_unprepare(scp->clk);
> +	clk_disable(scp->clk);
>  
>  	return 0;
>  }
>  
> +static int scp_prepare(struct rproc *rproc)
> +{
> +	struct mtk_scp *scp = rproc->priv;
> +
> +	return clk_prepare(scp->clk);
> +}
> +
> +static int scp_unprepare(struct rproc *rproc)
> +{
> +	struct mtk_scp *scp = rproc->priv;
> +
> +	clk_unprepare(scp->clk);
> +	return 0;
> +}
> +
>  static const struct rproc_ops scp_ops = {
> +	.prepare	= scp_prepare,
> +	.unprepare	= scp_unprepare,
>  	.start		= scp_start,
>  	.stop		= scp_stop,
>  	.load		= scp_load,
> diff --git a/drivers/remoteproc/mtk_scp_ipi.c b/drivers/remoteproc/mtk_scp_ipi.c
> index c068227e251e..7a37e273b3af 100644
> --- a/drivers/remoteproc/mtk_scp_ipi.c
> +++ b/drivers/remoteproc/mtk_scp_ipi.c
> @@ -171,7 +171,7 @@ int scp_ipi_send(struct mtk_scp *scp, u32 id, void *buf, unsigned int len,
>  	    WARN_ON(len > scp_sizes->ipi_share_buffer_size) || WARN_ON(!buf))
>  		return -EINVAL;
>  
> -	ret = clk_prepare_enable(scp->clk);
> +	ret = clk_enable(scp->clk);
>  	if (ret) {
>  		dev_err(scp->dev, "failed to enable clock\n");
>  		return ret;
> @@ -211,7 +211,7 @@ int scp_ipi_send(struct mtk_scp *scp, u32 id, void *buf, unsigned int len,
>  
>  unlock_mutex:
>  	mutex_unlock(&scp->send_lock);
> -	clk_disable_unprepare(scp->clk);
> +	clk_disable(scp->clk);
>  
>  	return ret;
>  }
> -- 
> 2.52.0.457.g6b5491de43-goog
> 
> 
