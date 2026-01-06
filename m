Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D69C145B3E
	for <linux-remoteproc@vger.kernel.org>; Tue,  6 Jan 2026 03:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767669206; cv=none; b=DN4rHLQ3MplwZ29spiYNu/eAtkwWgnYG+anBTE8Nn+IY6yG2OTqTlnq7E6snCrAv2uAT2xKcQeVN2cCVwknlSAOU1kN9YjojHvllnQFk5f1hQWT1+hCR52F7bpOj2zj2JDDULFv4fN70Ex03KlWd4Ee3LR8IMC11dVUQCk04duU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767669206; c=relaxed/simple;
	bh=dUFC7s03oGrbD46I+PtuWnS7TaJlTp9a/zaeUuuNCV4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JV4ruu4V8rlR9gPfcMgczahId8VZfU2RH7vr3dDfJRd/7wtAll8bLc313tx7uAFWT5vxNRXXQ4KktxV5ctwQe0Ob47PF0vGIEb4dUsHoJQ5ShJw0hcFRbsmusGtAhN6T1Ief/tJk5mE0/2l2zH9gko+OrIjEXFpnLuaW1ju9iX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=teBxi27/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="teBxi27/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6E48C116D0;
	Tue,  6 Jan 2026 03:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767669206;
	bh=dUFC7s03oGrbD46I+PtuWnS7TaJlTp9a/zaeUuuNCV4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=teBxi27/aDx6Fys+e2xyg0RkK5bQ/M02t610JSDZ3s1VGzarl6p7aIn9bCXPGIfFg
	 uktt4F1DlUVWXBgO+G5oReuTez0TNBmP479R+x+wv/mO8Oy8GNLckCrj/fCyQhjGy2
	 FHw+LVMatp48339kNmoSkKScaBxc/cPaeZ1zHujhXCn3jxhO/UNNKqk/L58ACSbolK
	 qlT9WA2AjYgbnixNApQ46Dvtle05gNxKRkfcdQoDgp89Dif/nf6UhaRE3ypvcut5eq
	 XZRD2JkIQgZMXKr4qyVAziE0e5NBaewuZpcdTFWJqj5zlvZZ6unIPbd8N+QJmQLKGn
	 +7iJBe6vmjHcw==
Date: Tue, 6 Jan 2026 03:13:22 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-remoteproc@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] remoteproc: mediatek: Break lock dependency to
 `prepare_lock`
Message-ID: <aVx90sSLgRzSPazF@google.com>
References: <20251229043146.4102967-1-tzungbi@kernel.org>
 <aVw4QUp6j4vBOrOF@p14s>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aVw4QUp6j4vBOrOF@p14s>

On Mon, Jan 05, 2026 at 03:16:33PM -0700, Mathieu Poirier wrote:
> On Mon, Dec 29, 2025 at 04:31:46AM +0000, Tzung-Bi Shih wrote:
> > `scp_ipi_send` acquires `prepare_lock` via `clk_prepare_enable` while
> > the caller often holds `ec_dev->lock` (e.g., `cros_ec_cmd_xfer`).  The
> > reverse dependency exists where `clk_prepare` can trigger operations
> > that eventually take `ec_dev->lock` (e.g., via sysfs/regulator/genpd).
> 
> What operation would that be?  Please be specific so that I can trace the code.

The chain is discovered by lockdep: &ec_dev->lock -> prepare_lock ->
&genpd->mlock -> ... -> kn->active#2 -> &ec_dev->lock.

-> #6 (&ec_dev->lock){+.+.}-{3:3}:
       __mutex_lock_common
       mutex_lock_nested
       cros_ec_cmd_xfer
       cros_ec_cmd_xfer_status
       cros_usbpd_charger_get_port_status
       cros_usbpd_charger_get_prop
       power_supply_get_property
       power_supply_show_property
       power_supply_uevent
       dev_uevent
       uevent_show
       dev_attr_show
       sysfs_kf_seq_show
       kernfs_seq_show
       seq_read_iter
       kernfs_fop_read_iter
       vfs_read
-> #5 (kn->active#2){++++}-{0:0}:
       kernfs_drain
       __kernfs_remove
       kernfs_remove_by_name_ns
       sysfs_remove_file_ns
       device_del
       __device_link_del
       device_links_driver_bound
       driver_bound
-> #4 (device_links_lock){+.+.}-{3:3}:
       __mutex_lock_common
       mutex_lock_nested
       device_link_remove
       _regulator_put
       regulator_put
       devm_regulator_release
...
-> #1 (&genpd->mlock){+.+.}-{3:3}:
       __mutex_lock_common
       mutex_lock_nested
       genpd_lock_mtx
       genpd_runtime_resume
       __rpm_callback
       rpm_callback
       rpm_resume
       __pm_runtime_resume
       clk_core_prepare
       clk_prepare
-> #0 (prepare_lock){+.+.}-{3:3}:
       __lock_acquire
       lock_acquire
       __mutex_lock_common
       mutex_lock_nested
       clk_prepare
       scp_ipi_send
       scp_send_ipi
       mtk_rpmsg_send
       rpmsg_send
       cros_ec_pkt_xfer_rpmsg

> > Move clock prepare / unprepare operations to remoteproc prepare() /
> > unprepare() callbacks to break the lock dependency from `ec_dev->lock`
> > to `prepare_lock`.
> 
> With the information presented to me, I don't see how doing that changes
> anything.  @prepare_lock is simply held for a longer period of time.  

In prepare() callback, the clock becomes prepared and prepare_lock won't be
held after that.
