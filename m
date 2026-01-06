Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53343322537
	for <linux-remoteproc@vger.kernel.org>; Tue,  6 Jan 2026 17:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767719433; cv=none; b=elXDxBM6g0QbSRPNAZgDtKwpGNzeq+yanF4RWmkCaANelRo6fw9r/QDJsKZAh4QrLzSJ6wlEs6/kF/Pwi9FFsrJB1p9NAss0ei4VfY2jFrYoClO8iIWAe+nw0BD96+Ymg5qyvWLx5OvOqzC5lvWpzT9b4/Th8QcFBpYBVjatUno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767719433; c=relaxed/simple;
	bh=/Km/htF/hTRzAOoXl3Zx70k/qfaG3yYjXXzQdqrKJBg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b3EJ7Mb2+VREKzPmZxsoeVFCKuM1cygz67BHNmKeQ2ZwTZUFyBS2ESQEk7Zj4PAGA+RdeSlcB2X+UthWxYPCNAioTxHHI7z1N60lnyeJ4jR1mdhy09Rv8FmclWLLXvOpp5zXHAEUFNQduHwd/xrukXANsHfSAdw3Gl2ta9Kt/cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IT93YToB; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IT93YToB"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7aa2170adf9so933120b3a.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 06 Jan 2026 09:10:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767719431; x=1768324231; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zxLZ7cXYCqtefP/2kqs1Yn+FZp/lqC2bn6GLc6crZxE=;
        b=IT93YToBhuLUtMi6RlJcVd+kvmyYMKuUq/3nm5Qn8thA0edRKwLF8XLWic2lRpx1kr
         2UM8WNJaI8jZfVD3JMNAWW3Fu5kmV/nR1v17Ezp+Y0EDngqHizz2nx5q2OZ2GFMDdfWi
         OrHpWXP2LN0jJCZeuOHjlnRlRjDLVMFK5DFIRZx3baqmEfTkXNdYbBGOqgivVy/p90Hv
         7Fnv0399AxLfQDUzvlqh1DEKygKhxLOeUKDhgM+Dm0Qz8L5Edg6Qm8UFTZ3pBWRpMZJU
         txo0/vNA9shcl9RIJsYR5ICOPdt1gkBvto4qKwLnXayD2BDZ4r3jTuGnh47I6URTQA1e
         5syQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767719431; x=1768324231;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zxLZ7cXYCqtefP/2kqs1Yn+FZp/lqC2bn6GLc6crZxE=;
        b=SZwZF1FblonQy/KAQlonPLk0Y5K6rmTxStvFapg9PkYp3v4iKtq3dbY4AmJ4sA/GXj
         XGTJmaRmyrPYA6u7E6rnGr7A1NsITEdsQSvHSBEq3lyiF1ZKMK5JDnUpbzVzKPPaD4Zq
         9HOXp8vGI4AlZdX4ULsnc2AVLLhNJv8EUPTGq+ZUgcxB7D3r4KwUoP2aAqV1nyBvJsPj
         JgOPae+QH47MPXQ0NRTH+8XcMIeFXm/ZJyC/YxwtWIpVVrvsUvSWC7grMulXY5Br3FLX
         InIx5W7MOaQClKyxf/FYgrRzAW6z6YmXpUDjhC8aK4Oh+EY6J9D+G4uttgEP87hJPW12
         G35Q==
X-Forwarded-Encrypted: i=1; AJvYcCUl5VJjGqEihH5ScRzYChNnMbG7uuJTJwD60q681eXYGLWuqRjHdnMfArTgHTSE/NHux0JwG1SgB743qecpPUCa@vger.kernel.org
X-Gm-Message-State: AOJu0YxYyeV/shDkNtlCJTE+uGNWFhtzfOQdwIMlkmK8VQyZ8C1DvRGu
	N9i/x2k9zu1ve7qqRZaWvtnke9xxVhFHsesArusENcjpyXg7PtdK55/Bg3EHVNv/79w=
X-Gm-Gg: AY/fxX6kaQRC1DFEeRiJ08nSCndM7bol3yOOncDVrcMxGxG8GSDqBEorDkrJ2gR5AtQ
	izhhqXPSyGvpOcu9D2nzRRSDeeWUEDbw9Z0PQ9IWawtK1TeQ/O0iyVikCMdqxk2Z30abHqW94VT
	iY0cadA9n01LFOgKlaYUKEzAhl81Pye+JKuAVIMN00pnLJSxiC4UoG+81mWMHvEvC7Rew/OVA0M
	0cVXgqb3bMDxYAr0ZmXkz/GL2gRW25f79iWJ7Ps+m/ty5dYJAosLfZ1BumRzX8Zv+Gn0ueefOkT
	oXnOxBsAsHm+HRlsx+PYbEe+lTMicCZ/1gpmOtiwWuc+HmKZSka8QVWmJlyrYjj9BVvJ635qFyb
	iFbb9fmM2evj0vomafQVGs6/200PALPD8Xt5SBhXs/OoOAE3QUSAh1Do3bMPBmO36uxhzPeAMJj
	H+0IMXKD750zXAaA==
X-Google-Smtp-Source: AGHT+IEdipTkUCIxnS1Bbq+IOp8ao5Nso3cbUVg9+zVhDOJBQ9Eh0Txq53A/Fg3j7H+EdDYyooTgJQ==
X-Received: by 2002:a05:6a20:12d2:b0:366:14af:9bc8 with SMTP id adf61e73a8af0-389823f0d2cmr3089203637.62.1767719430496;
        Tue, 06 Jan 2026 09:10:30 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:da23:dd36:3f11:b647])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cb5352268sm2839268a12.0.2026.01.06.09.10.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 09:10:30 -0800 (PST)
Date: Tue, 6 Jan 2026 10:10:27 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-remoteproc@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] remoteproc: mediatek: Break lock dependency to
 `prepare_lock`
Message-ID: <aV1CA1Kf0D6HNVli@p14s>
References: <20251229043146.4102967-1-tzungbi@kernel.org>
 <aVw4QUp6j4vBOrOF@p14s>
 <aVx90sSLgRzSPazF@google.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aVx90sSLgRzSPazF@google.com>

On Tue, Jan 06, 2026 at 03:13:22AM +0000, Tzung-Bi Shih wrote:
> On Mon, Jan 05, 2026 at 03:16:33PM -0700, Mathieu Poirier wrote:
> > On Mon, Dec 29, 2025 at 04:31:46AM +0000, Tzung-Bi Shih wrote:
> > > `scp_ipi_send` acquires `prepare_lock` via `clk_prepare_enable` while
> > > the caller often holds `ec_dev->lock` (e.g., `cros_ec_cmd_xfer`).  The
> > > reverse dependency exists where `clk_prepare` can trigger operations
> > > that eventually take `ec_dev->lock` (e.g., via sysfs/regulator/genpd).
> > 
> > What operation would that be?  Please be specific so that I can trace the code.
> 
> The chain is discovered by lockdep: &ec_dev->lock -> prepare_lock ->
> &genpd->mlock -> ... -> kn->active#2 -> &ec_dev->lock.
> 
> -> #6 (&ec_dev->lock){+.+.}-{3:3}:
>        __mutex_lock_common
>        mutex_lock_nested
>        cros_ec_cmd_xfer
>        cros_ec_cmd_xfer_status
>        cros_usbpd_charger_get_port_status
>        cros_usbpd_charger_get_prop
>        power_supply_get_property
>        power_supply_show_property
>        power_supply_uevent
>        dev_uevent
>        uevent_show
>        dev_attr_show
>        sysfs_kf_seq_show
>        kernfs_seq_show
>        seq_read_iter
>        kernfs_fop_read_iter
>        vfs_read
> -> #5 (kn->active#2){++++}-{0:0}:
>        kernfs_drain
>        __kernfs_remove
>        kernfs_remove_by_name_ns
>        sysfs_remove_file_ns
>        device_del
>        __device_link_del
>        device_links_driver_bound
>        driver_bound
> -> #4 (device_links_lock){+.+.}-{3:3}:
>        __mutex_lock_common
>        mutex_lock_nested
>        device_link_remove
>        _regulator_put
>        regulator_put
>        devm_regulator_release
> ...
> -> #1 (&genpd->mlock){+.+.}-{3:3}:
>        __mutex_lock_common
>        mutex_lock_nested
>        genpd_lock_mtx
>        genpd_runtime_resume
>        __rpm_callback
>        rpm_callback
>        rpm_resume
>        __pm_runtime_resume
>        clk_core_prepare
>        clk_prepare
> -> #0 (prepare_lock){+.+.}-{3:3}:
>        __lock_acquire
>        lock_acquire
>        __mutex_lock_common
>        mutex_lock_nested
>        clk_prepare
>        scp_ipi_send
>        scp_send_ipi
>        mtk_rpmsg_send
>        rpmsg_send
>        cros_ec_pkt_xfer_rpmsg
>

From what I understand, cros_ec_cmd_xfer() gets called and takes @ec_dev->lock.
From there scp_ipi_send() and clk_prepare_enable() are eventually called.  The
latter takes @prepare_lock and proceeds to enable the mechanic that will get the
clock prepared.  The process to enable the clock mechanic, which may happen on
a different CPU, involves calling cros_ec_cmd_xfer() and lockdep complains
because @ec_dev->lock is already held. 
 
> > > Move clock prepare / unprepare operations to remoteproc prepare() /
> > > unprepare() callbacks to break the lock dependency from `ec_dev->lock`
> > > to `prepare_lock`.
> > 
> > With the information presented to me, I don't see how doing that changes
> > anything.  @prepare_lock is simply held for a longer period of time.  
> 
> In prepare() callback, the clock becomes prepared and prepare_lock won't be
> held after that.

If my theory (above) is correct, you are proposing to avoid the condition by
preparing the clock ahead of time before any IPI can take place.  Is this
correct?

