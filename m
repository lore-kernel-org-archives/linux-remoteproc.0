Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D534632D45E
	for <linux-remoteproc@vger.kernel.org>; Thu, 22 Jan 2026 08:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769071865; cv=pass; b=DsGS0LTitw9qfK39RX3lGOq82FS9IgApr6IGG3VDmWYe7vblY+UDDRwdU9pRME/ow0kPpHLJREyALBbrNFyJWxflYG7z6Ry6X2iBgg0C8q+EMwl6Jb+Jz89UGUBHTBaRn78et3MdX6TR78Qml/Q1lLcSbiMBmnhIbQV+/Iam5kA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769071865; c=relaxed/simple;
	bh=SXZOVVWfD6OKrOnU6U/jmaGfmaOY5JSoT7fhggRy+nQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qowItmcVXhUqAMQFl5ZWKQC2ZahfpEy0o0xMogNPzeFt0Uf+hlhOjN+916ZafwTvC9pbGm5L8JcA9T4+vjR+KoTwt5DpwMDUjIFMp1ijyES7OiqDgyaMRqqFR0Os3RpuvpStOhBeAIFA8lilzpGlt4mILkJ3Yv4ML0LYT8xVXcQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Rk8jmcma; arc=pass smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Rk8jmcma"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-59b6f59c4f5so651079e87.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 22 Jan 2026 00:51:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769071861; cv=none;
        d=google.com; s=arc-20240605;
        b=kzbntKtupO9x+aMp1r9dCQYMFZDk8qksD38qjgvccuqHxEEqx5vcdm8nqpztRJZUcx
         0JoGZZe/OdhKZyqgff+UivGD0F28/8WBoJtsUf6BCZOfuT57oIKbBHjvCuuZNr9Dr6OA
         xEat3aVytRClT9fNGTjF7rBib4jNvhJRRENCVLDArB49ZO3UwKqP7BRoBdou0im7+G7T
         VGc1p0hC+e73zq2mkGmDTKjrexYvE8MqW8RyK5O48NwKBFUDPU/q2jRNpA4nQO2XviLF
         g82smzEXFx+e83JtJF+aNLmc77E1LW9snJ1WHwK+9gbam5tbo9pkL0LUqAm/fX5DWlvm
         Q05g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=94w4uSDyTamepOy3HjdXK7yBFSu/jNoIL8m3quNA2nU=;
        fh=8LY+Fjv/eyX5t86n00Mgr4higc8+20mzrmrzIcZrRrE=;
        b=BeCBDoCMCBwpNHBBuvRNOq2Jg2om58Nhcm1Bwss+e3gHzMuP9i35aXjVsJI/clxg92
         R0oqrxJ9uqvm/MJZ+ogzaRXQ7txdFyO4so0nCzUdqQcUEzLyZM4qLRuKi6v/wFBPypWW
         SUuv1eilkW55KzUmG2nQ6A1Mq43txTbPbSvXdPXiw8/mAf7bqpV4BmY8PlUiPIJXeSav
         UKkglnUFNZBAHkb1Xk/svOFfWSdtbL5HvVu9gVrinWSIg21ED2OGwduPNVJXyiyFj3Il
         fvmQh+gXhRCkNXQMIuLi6ZjsY1BOYCcnQ6rZjhy2i98BgPr2aXaKJK4UqwjknQ5Opsr4
         Zitw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1769071861; x=1769676661; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=94w4uSDyTamepOy3HjdXK7yBFSu/jNoIL8m3quNA2nU=;
        b=Rk8jmcma7a0wUsftKueoeniZRtvDyWGstv23hCkOoTK0l1ind9i9BfWy+HZyVO4NtJ
         tRBoADeZCGUkNWdhckKQayoue/jBy57m23tJDUdZZHX7U+PSR/WZq0ae07Hv1LddVyca
         xzvwNdE57nMFq2o7CkG/y8NVv3Dt2c/N7hAaY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769071861; x=1769676661;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=94w4uSDyTamepOy3HjdXK7yBFSu/jNoIL8m3quNA2nU=;
        b=EV+o6USR0zB/YXUKPicQ0d3RERwqsi9xyIa90BmiysOe17PCtAmssp0CPxOysKWYS3
         gf7ji+el1kjjW3MRgbFufIcacSODl4meL1+z2DrBlIrJSbTNO2q+whRYX16xALF3bV/6
         MPVpb8bEdCjoWgV2jzrP3PAClGHs9Rr9Qtcoh7vWwtuBB1+Wa6VZPcuFj+QG1HHVItxD
         BIJ7bWgHjrVXUoz5cHrAFN4X4X0zlKlsZTZoL67VOFThSd6i73nB0BQryN+PRikkNucQ
         d+4AXNku/u7ze8n+epIfHvp66XnqnepytxYPqzNtu/RxMR5EcUGj+QRHfokfqFt7JdY9
         EUbw==
X-Forwarded-Encrypted: i=1; AJvYcCUE+16oCRIGKTtD07ky/6LrIbZUYuznPiZCD6rxRvSlUIxNNQQCZ2paji5LQFzINu+atK3krg7LN8MQiFaJ8Okb@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm+jaJFgJEv9ci+JRCWAqWVAoh/K4H+N7HgA36nD/KMz3HT69t
	k4CWai5vr0taf1ltoAMD68YwkvrInU3S20rZHlMRYwb8ntiU+XkgHV/W682Cq2+b4Rw+ItgLtLe
	yAv4Lq9RrHLQfnH+/myk6uzRwee/L9WtUWCMaiz3A
X-Gm-Gg: AZuq6aJD8vjXdvTqpp9QPPqWwxoToGWGerGrBy72krg8qtMudZuMM5c6wq8CZEmeLNy
	ooAte3w4J8CrLx/IjYARKCRSgcdKJOFtJ+bFQz+fAMlxKV7tuhxOXGYAT5nUyrLWcTL8nTKNF2B
	Zml/lQmpjk0WOXYtZlu9fRcwxk95X79IYjqu3JY5kBK06JxAVhRDHjP4skBs9LzP3VqFQ6EhCkn
	5rXG4idgaKDIoybPaS0Xvm1TGw1uvyYXKPCtu/hhk47IZZ09s91b2sPM+jTaglQBMpQS9TwVlwO
	P/YcFTxVKMTjm1QDEos6H9yw
X-Received: by 2002:a05:6512:b0d:b0:59b:71f4:3de9 with SMTP id
 2adb3069b0e04-59baef00149mr6980941e87.39.1769071860888; Thu, 22 Jan 2026
 00:51:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260112110755.2435899-1-tzungbi@kernel.org>
In-Reply-To: <20260112110755.2435899-1-tzungbi@kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 22 Jan 2026 16:50:49 +0800
X-Gm-Features: AZwV_Qg5dxj_2w51xU5BsupL9WV0BUnu7Ybn-tnvwj0lQPJsdFVmHAfqqHMP6iE
Message-ID: <CAGXv+5GDd44NDv2WWhpUsjsE7QnjjsmJDii-qSG-VuX6hHgJGg@mail.gmail.com>
Subject: Re: [PATCH v2] remoteproc: mediatek: Break lock dependency to `prepare_lock`
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-remoteproc@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 12, 2026 at 7:08=E2=80=AFPM Tzung-Bi Shih <tzungbi@kernel.org> =
wrote:
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

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Tested-by: Chen-Yu Tsai <wenst@chromium.org> # MT8183 & MT8188 no regressio=
ns

AFAIU this works because the SCP clock is internal MMIO based, and the
prepare op is a no-op; so splitting the clk_prepare() call out helps
to break the dependency while not incurring additional cost.
