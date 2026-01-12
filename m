Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C5630171A
	for <linux-remoteproc@vger.kernel.org>; Mon, 12 Jan 2026 11:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768216399; cv=none; b=jl9PBhQ2v4SFwTUy/Be2yRNwbNfoDuruBrXMbw6oKIREeLaQEAsBM5yk5SADBPX0Sm94Xzc5zqmADqoWIxgdnfcwcdL2WInq5bQnKg0sEy2tqka2Q3jTuWLklBwXP5thLk/fxWcykKsBcJ5HUVzFF2T7EdxEAouvOGD55FXfJh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768216399; c=relaxed/simple;
	bh=tiFf2Hax6qiohmjLxT9EJq13kbkFEMihpUrXcadA+yM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HZ9gJphyQCawes5V8sJAZJSWrrVY6bsOKzm46FJTAdo2XUiiL8Lay8vDPg/MeylEA/OtyOVcutDvVbYXFHDFhnQ4zcmc5qklmffsIjEUAaaTHCTtJmgopv0vZeLWqCagYZvsNT3zLRVivuHw34OXtdjkUwJGwAZLXRmA6Cq/4QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d0+dU8cF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d0+dU8cF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FDB1C16AAE;
	Mon, 12 Jan 2026 11:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768216399;
	bh=tiFf2Hax6qiohmjLxT9EJq13kbkFEMihpUrXcadA+yM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d0+dU8cFO0JZbjcLt1ek31AKogkcQbNNCaOCyuZuSSGW/weNh5ABkmh75/6H4eKBX
	 MonYQjR8gezW6I46OTGhOT32qZau+uUh5PbXVBV5VnUznC4cTkSfeQEZQQIVy++gzH
	 OGUBnrMlzHniMna1dELhmvBwKl3cdj5qwBzFtAVie7MqHis/sE/YC+IWtea5fxMI/l
	 F20g15e8T6QQJA49n1Yn9zCgQJEZ0OYfFAAJRib+tNbNQ/aEX5ETLEuXwYOzjtec8L
	 KdIdIjROIgrGmDl95CIKzGbaoNEP4+Qw6UXYw56doXJZLDwww42lfLkDA2UYUB2lpb
	 z6vjU/yQGpKfg==
Date: Mon, 12 Jan 2026 11:13:16 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-remoteproc@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] remoteproc: mediatek: Break lock dependency to
 `prepare_lock`
Message-ID: <aWTXTMTanGj1io3b@google.com>
References: <20251229043146.4102967-1-tzungbi@kernel.org>
 <kkwqx4h3oqmfimejyy73hreq5pcjwbijwy2chnve5bjmcq4fli@ty4n5adbo5oy>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <kkwqx4h3oqmfimejyy73hreq5pcjwbijwy2chnve5bjmcq4fli@ty4n5adbo5oy>

On Sat, Jan 10, 2026 at 01:10:22PM -0600, Bjorn Andersson wrote:
> On Mon, Dec 29, 2025 at 04:31:46AM +0000, Tzung-Bi Shih wrote:
> > `scp_ipi_send` acquires `prepare_lock` via `clk_prepare_enable` while
> 
> Please suffix functions with (), instead of treating it just like any
> other `symbol`, this makes it easier to see what is a function and what
> is an object/variable.
> 
> > the caller often holds `ec_dev->lock` (e.g., `cros_ec_cmd_xfer`).  The
> > reverse dependency exists where `clk_prepare` can trigger operations
> > that eventually take `ec_dev->lock` (e.g., via sysfs/regulator/genpd).
> 
> Can you please expand this explanation slightly. You're hinting that
> there's an ABBA issue, but you're leaving it to the reader to know/guess
> what that issue is.
> 
> I believe you have some concrete case where this is a probelm, please
> include this, if nothing else as an example.
> 
> > 
> > Move clock prepare / unprepare operations to remoteproc prepare() /
> > unprepare() callbacks to break the lock dependency from `ec_dev->lock`
> > to `prepare_lock`.
> 
> Please expand this with an argumentation that the prolonged "prepared
> time" will not have any negative impact.
> 
> > 
> > This breaks the dependency chain in the lockdep report:
> > > WARNING: possible circular locking dependency detected
> > > ...
> > > the existing dependency chain (in reverse order) is:
> > > ...
> > > -> #0 (prepare_lock){+.+.}-{3:3}:
> > >        __lock_acquire
> > >        lock_acquire
> > >        __mutex_lock_common
> > >        mutex_lock_nested
> > >        clk_prepare
> > >        scp_ipi_send [mtk_scp_ipi]
> > >        scp_send_ipi [mtk_scp]
> > >        mtk_rpmsg_send [mtk_rpmsg]
> > >        rpmsg_send [rpmsg_core]
> > >        cros_ec_pkt_xfer_rpmsg [cros_ec_rpmsg]
> 
> If this is the AB case, can you please include a stack for the BA case
> as well in the commit message?
> 
> 
> With these things clarified, I expect that your patch is the correct way
> to solve the problem.

An attempt: https://lore.kernel.org/r/20260112110755.2435899-1-tzungbi@kernel.org
