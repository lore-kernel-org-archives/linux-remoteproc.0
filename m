Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F178392B8C
	for <linux-remoteproc@vger.kernel.org>; Wed,  7 Jan 2026 15:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767799782; cv=none; b=Ih2UZD/1Ct/mV4tJK8LPEV0RwYYqhm6dQ+7Ff/9UpoxRaeWBf2jDmvkaPlsF4Gy04ojjQu4mmr/TiqdvC7uljveHUQfopxsH5R8iHlCNO2o4WM7NFnzodjUG2uWp6sYpVZGy949iIDzJTGSyCQtQkcadw9gttQP/8VKOQAalbyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767799782; c=relaxed/simple;
	bh=CHCmBLNmGhkB75IOglbedkzSH7qQK1bVET7toOu8COI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Eks69PR9KNL5yriJFmWAnG7IzRqMODuuoLpVluJ0O7tbkDlGeKBChapYLjMVohHtg9FfuKTEIBL8hwiO/t1Ch/SVRGuscbZAsTV7Z0kqt35tYGGI5ajRQpHdzQ0b5a9k0IAd0as4hqsJSD0vSH5VifXpCzp/LTGE5f78MvA0NTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DxVI3lNF; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DxVI3lNF"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7f1243792f2so1221044b3a.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 07 Jan 2026 07:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767799778; x=1768404578; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M7ti2ZsSBs6BaW10SxBm3tdhBa1xYNo4bRZH+Kb0/2k=;
        b=DxVI3lNFGw6n3FkflU3fVCLwoTz9WXVvFZ2Pxablcm5hOBJClxd82dytyEje+zZMhw
         GSbRj9RX76WtyIcitolJOSJfuQakdDjM/ueqwUjyo9xLmrnJW48rcyYpSfIqvKHBr3ic
         dmnXNJLTxCGk7xFuE+LEZtcW0MCfIIeHLcrFM2pDzAOW5nxU5lpCkAXyeTIBhAuQm9VD
         76NYR2ryAJs8Cb0/fV89Ris7kGi1tiqCXD+Bsy5gHLemjN0/N2YtW+jhTEiEoRbaW78N
         rY8QkrrmEWEFhfR02l+o6yXojxp2K2ioQHq5WhKDCXiMIcwXJQjLq6Sh57xhcoGG2aUE
         0IqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767799778; x=1768404578;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M7ti2ZsSBs6BaW10SxBm3tdhBa1xYNo4bRZH+Kb0/2k=;
        b=F1Sy6kiqFVFUnnu/qht//epiW3z+aVrQjX+q0wOhwTQhx+0402tFKhVu6eiRro2Tga
         gQJPP9pXzcBip0GY6eBS34surAU0zGYQ9gPmw/Tzu2BCsMZgwCcAmoybKfJJdEnNRPnB
         DbM1IO8Me0LiBWHXB1Y2CHg+7r4zvkPgskGuVYF4JOCn7aW8UAEvmfl53B7rlg4BXAdG
         jcnHpYA+KiewGrWu2mGZZtecpMSy+SEQkyQ6xeajKR40MOhhpRgRBf2G6qPO+cQ1XuU7
         DJb6zSkEGNJUWd7xWrgv1WEEgYnWMhnaO5w9NuKaxTFMFI6bdid+FTtk9Udp3VvpueZr
         LlnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZlHQ0aGdBEO2frY2qyTyCfgBhRwJwjQXojpw5dp7V0OxRaEWN74cGtWtj2FXGzuFu2XcCWl8zEq4JyguMcm/u@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1OqZPlOAdLyizDuICok1qkd0/nj9zGD0xvb/W7V73f5No1qQs
	6u6oVDcCzufDT0y4XaSJU2Zgm1puu3YrqCX0FQ1ESfv4M3JSP6nXWfq30YTwSECGr2Q=
X-Gm-Gg: AY/fxX6Gn9PQdgcUAaz7SU0BcLbTVKHqAX8EnCU/v+PgL45c1XQ2KwXnryOMjjUVqO0
	Kk95wvP51N2dDYsCco0QW9wFmq0ALJfE7TlbjXYyguL3ynskRpkzJs/B86jmM34ABO41FwrHAxi
	DeKIV246LpGJnShyi/Q4oKOY2tUjlhRnmaUQZEwqzUOxvFkYuP/szRSQwDENzLTAXTfQ2Zu17sA
	f50zDeNZZ4LSbJHwPnwKNrJobjMpTgSLJVqRBkxmgLMI5V03EoxnEeYEJuxr0+feiUbwB+uJwa0
	5LCv/T+RWdFy2BnPpGgsNxAYhraQu4w7BKL52LtkCg0ZaVNrC4i0Zg15HniNZCxMNaphrZQ4O6N
	OFBiJkwTN2iAKgKDLiamULcDL+d7XQTzeypLYqkwlfPtkFhiR6zTgeEy+++gsgDrRnAutwrjLgY
	Blns0UOb+1yNW7tA==
X-Google-Smtp-Source: AGHT+IElKLdFn879OtAvmFvwXJ1ZamVYHpzEPzVJ1OffNR29Z6BAVmJm3WV6d7OfkFXx84SFGEf1aQ==
X-Received: by 2002:a05:6a00:6c82:b0:7e8:43f5:bd4b with SMTP id d2e1a72fcca58-81b7fbcbd0amr2490638b3a.55.1767799778184;
        Wed, 07 Jan 2026 07:29:38 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:9510:cc09:7589:5527])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c52fc9bdsm5313254b3a.32.2026.01.07.07.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 07:29:37 -0800 (PST)
Date: Wed, 7 Jan 2026 08:29:35 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-remoteproc@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] remoteproc: mediatek: Break lock dependency to
 `prepare_lock`
Message-ID: <aV57397Ie41nww9W@p14s>
References: <20251229043146.4102967-1-tzungbi@kernel.org>
 <aVw4QUp6j4vBOrOF@p14s>
 <aVx90sSLgRzSPazF@google.com>
 <aV1CA1Kf0D6HNVli@p14s>
 <aV3DOTpoTr5RoDL2@google.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aV3DOTpoTr5RoDL2@google.com>

On Wed, Jan 07, 2026 at 02:21:45AM +0000, Tzung-Bi Shih wrote:
> On Tue, Jan 06, 2026 at 10:10:27AM -0700, Mathieu Poirier wrote:
> > On Tue, Jan 06, 2026 at 03:13:22AM +0000, Tzung-Bi Shih wrote:
> > > On Mon, Jan 05, 2026 at 03:16:33PM -0700, Mathieu Poirier wrote:
> > > > On Mon, Dec 29, 2025 at 04:31:46AM +0000, Tzung-Bi Shih wrote:
> > > > > `scp_ipi_send` acquires `prepare_lock` via `clk_prepare_enable` while
> > > > > the caller often holds `ec_dev->lock` (e.g., `cros_ec_cmd_xfer`).  The
> > > > > reverse dependency exists where `clk_prepare` can trigger operations
> > > > > that eventually take `ec_dev->lock` (e.g., via sysfs/regulator/genpd).
> > > > 
> > > > What operation would that be?  Please be specific so that I can trace the code.
> > > 
> > > The chain is discovered by lockdep: &ec_dev->lock -> prepare_lock ->
> > > &genpd->mlock -> ... -> kn->active#2 -> &ec_dev->lock.
> > > 
> > > -> #6 (&ec_dev->lock){+.+.}-{3:3}:
> > >        __mutex_lock_common
> > >        mutex_lock_nested
> > >        cros_ec_cmd_xfer
> > >        cros_ec_cmd_xfer_status
> > >        cros_usbpd_charger_get_port_status
> > >        cros_usbpd_charger_get_prop
> > >        power_supply_get_property
> > >        power_supply_show_property
> > >        power_supply_uevent
> > >        dev_uevent
> > >        uevent_show
> > >        dev_attr_show
> > >        sysfs_kf_seq_show
> > >        kernfs_seq_show
> > >        seq_read_iter
> > >        kernfs_fop_read_iter
> > >        vfs_read
> > > -> #5 (kn->active#2){++++}-{0:0}:
> > >        kernfs_drain
> > >        __kernfs_remove
> > >        kernfs_remove_by_name_ns
> > >        sysfs_remove_file_ns
> > >        device_del
> > >        __device_link_del
> > >        device_links_driver_bound
> > >        driver_bound
> > > -> #4 (device_links_lock){+.+.}-{3:3}:
> > >        __mutex_lock_common
> > >        mutex_lock_nested
> > >        device_link_remove
> > >        _regulator_put
> > >        regulator_put
> > >        devm_regulator_release
> > > ...
> > > -> #1 (&genpd->mlock){+.+.}-{3:3}:
> > >        __mutex_lock_common
> > >        mutex_lock_nested
> > >        genpd_lock_mtx
> > >        genpd_runtime_resume
> > >        __rpm_callback
> > >        rpm_callback
> > >        rpm_resume
> > >        __pm_runtime_resume
> > >        clk_core_prepare
> > >        clk_prepare
> > > -> #0 (prepare_lock){+.+.}-{3:3}:
> > >        __lock_acquire
> > >        lock_acquire
> > >        __mutex_lock_common
> > >        mutex_lock_nested
> > >        clk_prepare
> > >        scp_ipi_send
> > >        scp_send_ipi
> > >        mtk_rpmsg_send
> > >        rpmsg_send
> > >        cros_ec_pkt_xfer_rpmsg
> > >
> > 
> > From what I understand, cros_ec_cmd_xfer() gets called and takes @ec_dev->lock.
> > From there scp_ipi_send() and clk_prepare_enable() are eventually called.  The
> > latter takes @prepare_lock and proceeds to enable the mechanic that will get the
> > clock prepared.  The process to enable the clock mechanic, which may happen on
> > a different CPU, involves calling cros_ec_cmd_xfer() and lockdep complains
> > because @ec_dev->lock is already held. 
> >  
> > > > > Move clock prepare / unprepare operations to remoteproc prepare() /
> > > > > unprepare() callbacks to break the lock dependency from `ec_dev->lock`
> > > > > to `prepare_lock`.
> > > > 
> > > > With the information presented to me, I don't see how doing that changes
> > > > anything.  @prepare_lock is simply held for a longer period of time.  
> > > 
> > > In prepare() callback, the clock becomes prepared and prepare_lock won't be
> > > held after that.
> > 
> > If my theory (above) is correct, you are proposing to avoid the condition by
> > preparing the clock ahead of time before any IPI can take place.  Is this
> > correct?
> 
> Correct, so that it doesn't need to prepare the clock (i.e., acquire the
> @prepare_lock) when @ec_dev->lock is held.

Is there anyone else that can review and test this patch?

