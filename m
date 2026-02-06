Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2841F5842
	for <linux-remoteproc@vger.kernel.org>; Fri,  6 Feb 2026 03:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770348986; cv=none; b=rwCi4/3DU+triXmUKZYZg801P/rDfIzdDBjK0qWJJoO7kZdCc9lyBfI4zjh19d8qNCuK/6QjquIXba3xS+nZpaAJQnH9SdL2EFfhVqMhLbDzmLcqj3jfj5+NupWS/9CQE+g4ei6TnRg0aZTqOMCu03YHK+9w121r8tnS1xpJipk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770348986; c=relaxed/simple;
	bh=3MP4Io1FQNfw2qWLKxUuFzooJmPrZrW7egR2WNYgQyo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c2TaZtOsfYDZmng8wE5eNfB/hbE6wlkuhIlBPC/bftUoXDG29HYzPYkUvj+I/Ifi8PI2fYVWrCIQPfWKh05gPVx18X2FlK0ly3Ei5+aZmnHlw7Sjafe+I2REHnjRNgRWnCmAMU9LoVGDF7dYNBlgj18OcdsdiRFWAUcjXLg9vfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PcXWaXHn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PcXWaXHn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1939BC4CEF7;
	Fri,  6 Feb 2026 03:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770348986;
	bh=3MP4Io1FQNfw2qWLKxUuFzooJmPrZrW7egR2WNYgQyo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PcXWaXHnWXrMpP6QccpsnPpusgRX3HGIa99QmRQUCUv+oKnuQp+1HhS9WiqBG+rb8
	 vUysoDmFr9SR+Fi11go0BDmC/XOByaUIyemB383sCfTC3d22nG2pfGv6W9VKeH7DLS
	 QtKSzl+MLSNLEMczijA35dqvQhZeg7kadKGOgIg787Zo7fwfE5Z7fhni9BRmXYQZJB
	 uVtGwLacLxoAq9zJcVA4ywpGg9bGcyRmFKDm4QNB0m0nrtpcWTRkhll8eJNzSDWYKV
	 eKlhsUb7tYXmEGZa+/0PYmIk7NTxaevN14yQW7FPG7D+unaUU9HnNkUV8kUi4sXHwu
	 v7ifhsY6UAs5g==
Date: Fri, 6 Feb 2026 03:36:22 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Chen-Yu Tsai <wenst@chromium.org>, linux-remoteproc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] remoteproc: mediatek: Unprepare SCP clock during system
 suspend
Message-ID: <aYVhtt_d0b22XxkV@google.com>
References: <20260204085442.1822123-1-tzungbi@kernel.org>
 <a880d5d9-348e-4777-ae7f-69bdf7794e58@collabora.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a880d5d9-348e-4777-ae7f-69bdf7794e58@collabora.com>

On Thu, Feb 05, 2026 at 01:30:42PM +0100, AngeloGioacchino Del Regno wrote:
> Il 04/02/26 09:54, Tzung-Bi Shih ha scritto:
> > Prior to commit d935187cfb27 ("remoteproc: mediatek: Break lock
> > dependency to prepare_lock"), `scp->clk` was prepared and enabled only
> > when it needs to communicate with the SCP.  The commit d935187cfb27
> > moved the prepare operation to remoteproc's prepare(), keeping the clock
> > prepared as long as the SCP is running.
> > 
> > The power consumption due to the prolonged clock preparation can be
> > negligible when the system is running, as SCP is designed to be a very
> > power efficient processor.
> > 
> > However, the clock remains prepared even when the system enters system
> > suspend.  This prevents the underlying clock controller (and potentially
> > the parent PLLs) from shutting down, which increases power consumption
> > and may block the system from entering deep sleep states.
> > 
> > Add suspend and resume callbacks.  Unprepare the clock in suspend() if
> > it was active and re-prepare it in resume() to ensure the clock is
> > properly disabled during system suspend, while maintaining the "always
> > prepared" semantics while the system is active.
> > 
> > Fixes: d935187cfb27 ("remoteproc: mediatek: Break lock dependency to prepare_lock")
> > Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> 
> Would be great if you could mention that in this driver, at the moment of writing,
> there is no .attach() callback, hence rproc->state can never be RPROC_ATTACHED (as
> in case that would also leave the clock prepared).

Thanks for your review.  Add it in the commit message and code comment in
v2[1].

[1] https://lore.kernel.org/all/20260206033034.3031781-1-tzungbi@kernel.org/

> > +#ifdef CONFIG_PM_SLEEP
> 
> ...you don't need this ifdef as when CONFIG_PM_SLEEP is not set the macro
> SET_SYSTEM_SLEEP_PM_OPS is stubbed out (check pm.h).
> 
> After removing the ifdef, there'll be something to change, specifically:
> 
> > +static int scp_suspend(struct device *dev)
> 
> static int __maybe_unused scp_suspend(struct device *dev)
> {
> 
> > +{
> > +	struct mtk_scp *scp = dev_get_drvdata(dev);
> > +	struct rproc *rproc = scp->rproc;
> > +
> > +	/* Only unprepare if the SCP is running and holding the clock */
> > +	if (rproc->state == RPROC_RUNNING)
> > +		clk_unprepare(scp->clk);
> > +	return 0;
> > +}
> > +
> > +static int scp_resume(struct device *dev)
> 
> static int __maybe_unused scp_resume(struct device *dev)
> {

Fix them in v2 too.
