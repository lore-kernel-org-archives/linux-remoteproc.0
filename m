Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38BD033A9E5;
	Fri, 27 Feb 2026 03:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772164419; cv=none; b=U9P2co+7M1VdVnp/F3g8Hf1AhrLhpEGTzyFmI9+Y+9ZxfjU4buHDk66mBL7g8woZZGlMjGFgRVGqM49+MrBpXTiODp404Qfu29gjPWmdSsxuONmqQ6WYlK7SN+0U3b5T+71/SLZ2MUT0P2n8ks/rIZpk0bifMymPTeaX03TfCT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772164419; c=relaxed/simple;
	bh=9v0532ZHQguBgkAE8pS/q4kOnIWgIhGnRt0PCO35+Ik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DRACqWb+eXaUhcV5DftCGFS4TMVIiHI2DVSApQV9UN8s1UY1kAq56c9o69eBUJcfjj2wshciTXQ0ai1qXQy6rO9wOXO303shPUUIyP/VgyqsMfPebHUhgMHk84CmlwFVz9oZLekopMLRF0dnW6gFEXTTCDztGd3dGAM+9D+s1HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RpkA0tgF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RpkA0tgF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FA17C116C6;
	Fri, 27 Feb 2026 03:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772164419;
	bh=9v0532ZHQguBgkAE8pS/q4kOnIWgIhGnRt0PCO35+Ik=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RpkA0tgFsAPE0aGhlvroM+iMjRlqDApBlkx2pIee9YCxJ/7bcA6nKHr+/3C831Dl6
	 z0LQcshubsCm0DcyA9A3f1E1ovstugi1mU6vaUm7NO1FW//kRp35KZDv7SZ1xsBOAe
	 WtISeoGiWUiLlVopQxEZoRAau2j0CIJtH4Okbzr30dkjih1zwWmrEjkNpo7Po9IV69
	 PPDdYtecHOdeuCGmF1hIQccr24qxkUF1PWjqUN3/xm3ebXGhdCRNNqxpCot8tskD7D
	 hXz6BJOTG7BAtB0B7bg3VjXZTOHaVaTYS2BO3tVTEmTBg57R+FAwFoQ7DUvEwt29YO
	 PKddE+dLdwm5Q==
Date: Thu, 26 Feb 2026 21:53:35 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	tanmay.shah@amd.com, mathieu.poirier@linaro.org
Subject: Re: [PATCH] mailbox: add API to query available TX queue slots
Message-ID: <nelghqxyuwelah3op6ls6pflm5ujwayfzuchode44vjmagymmv@ptisap64ewkl>
References: <20260209234430.512492-1-jassisinghbrar@gmail.com>
 <jo4kugxook5b6fl7ifh3nuznehotkyqwnrgwq3olank7cvzhmj@hj5ibm3bbsln>
 <CABb+yY2vzczJ8ODc22P4hCDn1=epki9aXgJCySumeADBuHgaKg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABb+yY2vzczJ8ODc22P4hCDn1=epki9aXgJCySumeADBuHgaKg@mail.gmail.com>

On Mon, Feb 23, 2026 at 06:35:16PM -0600, Jassi Brar wrote:
> On Mon, Feb 23, 2026 at 9:29 AM Bjorn Andersson <andersson@kernel.org> wrote:
> >
> > On Mon, Feb 09, 2026 at 05:44:30PM -0600, jassisinghbrar@gmail.com wrote:
> > > From: Jassi Brar <jassisinghbrar@gmail.com>
> > >
> > > Clients sometimes need to know whether the mailbox TX queue has room
> > > before posting a new message.
> >
> > This is rather vague, could you be more specific?
> >
> > > Rather than exposing internal queue state
> > > through a struct field, provide a proper accessor function that returns
> > > the number of available slots for a given channel.
> > >
> > > This lets clients choose to back off when the queue is full instead of
> > > hitting the -ENOBUFS error path and the misleading "Try increasing
> > > MBOX_TX_QUEUE_LEN" warning.
> > >
> >
> > In the event that we're using the mailbox framework as a doorbell, I
> > presume that the queue is full of duplicate rings already - so backing
> > off it perfectly fine.
> >
> > But in the case where the client actually uses the interface to convey
> > data, what is the expected way for the client to know when to make
> > another attempt?
> >
> Whatever the client is currently using. It just backs off for another
> such signal when mbox_chan_tx_slots_available() returns 0.
> If a client submits periodically, it will back off for another period.
> If a client submits upon receiving ack packet for last submission, it
> will back off until it gets another ack packet.
> 

Thanks for clarifying.

Regards,
Bjorn

> Cheers!
> Jassi
