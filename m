Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920BC207A32
	for <linux-remoteproc@vger.kernel.org>; Wed,  7 Jan 2026 02:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767752509; cv=none; b=ehNd6NdxBwAWRx6ViCU3bqkE5XJfG0OuUKLHemc2WUMRL5owZGEZGAaNHykpZE6ivhlYUlJ/uiZDhz4rXScTwAGYLBJAXqCuiZvc/Lpmdmseb/vQUcSABYDHftber93KkJGtNHs9ZSVGihrM2xjcYA5O1kPtb/V13QXdZ4GAieI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767752509; c=relaxed/simple;
	bh=NNlkap1WIoNQ/C5IHlrK+Nyl2tjWEttGhsTVXk1lpz0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Piq/67ge+656DoIeZTJ+Eesv+Nz9x3iSB9Dx653HiW4d6MK2RmfjHJcQYryfsh5cRrk9zvgWxhjUMAWGdC7z7/bxsauI60kF5YX7PZ6XqlhXhSefJAaPJUnzRjifeyK+CrDcSBWPfAv5uT8EEoFxSpVbsiHCKjHvxKP4UHCXqaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qcx/DRD+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qcx/DRD+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17C0BC19422;
	Wed,  7 Jan 2026 02:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767752509;
	bh=NNlkap1WIoNQ/C5IHlrK+Nyl2tjWEttGhsTVXk1lpz0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qcx/DRD+35EDM9m9yG74+boD8h6F4Ivnr85xBHBttdYkb6qDl32uXjw4MaYQQ32Xc
	 EryaHwo/M3HkE3lSod3quDktKtTuoHc5op3UlLirYuQzT74DgIDH1xYzjztiuVDK66
	 1r9/WGbLT9afrqCYmTvCT1Te79dbPzMWlr/UleeehYQPdD6P9XdmWBuGWCDw0sszSb
	 dpbCkI63frdWvtXowocYHq5i+G6P8goHR5I9tvkzC/PES+M+0UbxM+tQut+3VlMGxj
	 U7u8Z7FFeds+3kBLWAZQgU0UfORWp+DJ4/14IV3Uw0j984voAfxb88/wPClfkttwXn
	 mTwvpUpeDbsWw==
Date: Wed, 7 Jan 2026 02:21:45 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-remoteproc@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] remoteproc: mediatek: Break lock dependency to
 `prepare_lock`
Message-ID: <aV3DOTpoTr5RoDL2@google.com>
References: <20251229043146.4102967-1-tzungbi@kernel.org>
 <aVw4QUp6j4vBOrOF@p14s>
 <aVx90sSLgRzSPazF@google.com>
 <aV1CA1Kf0D6HNVli@p14s>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aV1CA1Kf0D6HNVli@p14s>

On Tue, Jan 06, 2026 at 10:10:27AM -0700, Mathieu Poirier wrote:
> On Tue, Jan 06, 2026 at 03:13:22AM +0000, Tzung-Bi Shih wrote:
> > On Mon, Jan 05, 2026 at 03:16:33PM -0700, Mathieu Poirier wrote:
> > > On Mon, Dec 29, 2025 at 04:31:46AM +0000, Tzung-Bi Shih wrote:
> > > > `scp_ipi_send` acquires `prepare_lock` via `clk_prepare_enable` while
> > > > the caller often holds `ec_dev->lock` (e.g., `cros_ec_cmd_xfer`).  The
> > > > reverse dependency exists where `clk_prepare` can trigger operations
> > > > that eventually take `ec_dev->lock` (e.g., via sysfs/regulator/genpd).
> > > 
> > > What operation would that be?  Please be specific so that I can trace the code.
> > 
> > The chain is discovered by lockdep: &ec_dev->lock -> prepare_lock ->
> > &genpd->mlock -> ... -> kn->active#2 -> &ec_dev->lock.
> > 
> > -> #6 (&ec_dev->lock){+.+.}-{3:3}:
> >        __mutex_lock_common
> >        mutex_lock_nested
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
> >        seq_read_iter
> >        kernfs_fop_read_iter
> >        vfs_read
> > -> #5 (kn->active#2){++++}-{0:0}:
> >        kernfs_drain
> >        __kernfs_remove
> >        kernfs_remove_by_name_ns
> >        sysfs_remove_file_ns
> >        device_del
> >        __device_link_del
> >        device_links_driver_bound
> >        driver_bound
> > -> #4 (device_links_lock){+.+.}-{3:3}:
> >        __mutex_lock_common
> >        mutex_lock_nested
> >        device_link_remove
> >        _regulator_put
> >        regulator_put
> >        devm_regulator_release
> > ...
> > -> #1 (&genpd->mlock){+.+.}-{3:3}:
> >        __mutex_lock_common
> >        mutex_lock_nested
> >        genpd_lock_mtx
> >        genpd_runtime_resume
> >        __rpm_callback
> >        rpm_callback
> >        rpm_resume
> >        __pm_runtime_resume
> >        clk_core_prepare
> >        clk_prepare
> > -> #0 (prepare_lock){+.+.}-{3:3}:
> >        __lock_acquire
> >        lock_acquire
> >        __mutex_lock_common
> >        mutex_lock_nested
> >        clk_prepare
> >        scp_ipi_send
> >        scp_send_ipi
> >        mtk_rpmsg_send
> >        rpmsg_send
> >        cros_ec_pkt_xfer_rpmsg
> >
> 
> From what I understand, cros_ec_cmd_xfer() gets called and takes @ec_dev->lock.
> From there scp_ipi_send() and clk_prepare_enable() are eventually called.  The
> latter takes @prepare_lock and proceeds to enable the mechanic that will get the
> clock prepared.  The process to enable the clock mechanic, which may happen on
> a different CPU, involves calling cros_ec_cmd_xfer() and lockdep complains
> because @ec_dev->lock is already held. 
>  
> > > > Move clock prepare / unprepare operations to remoteproc prepare() /
> > > > unprepare() callbacks to break the lock dependency from `ec_dev->lock`
> > > > to `prepare_lock`.
> > > 
> > > With the information presented to me, I don't see how doing that changes
> > > anything.  @prepare_lock is simply held for a longer period of time.  
> > 
> > In prepare() callback, the clock becomes prepared and prepare_lock won't be
> > held after that.
> 
> If my theory (above) is correct, you are proposing to avoid the condition by
> preparing the clock ahead of time before any IPI can take place.  Is this
> correct?

Correct, so that it doesn't need to prepare the clock (i.e., acquire the
@prepare_lock) when @ec_dev->lock is held.
