Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F02279907
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 10:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773138147; cv=none; b=I8Rvcvi8NZGzJKNHkt4+zQ16nxsBTcmVcnrzAoi5KIe4oKX3QxPl54MMzL9+lCSGD90BpNHYXzKYpxuQTNVC+znpCaSCG2b9g2DQiAe1wsW75NC+Ws7vUwkzAxmgMn0SpkrcbJZ+Xcv+KyJK8OAxLF3ezIpocwQXncoVXOMZ3Ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773138147; c=relaxed/simple;
	bh=nvxXTf/sV9CgbG8+moWVBy4KxnCzU4XkJvUa7QTYppE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qD3CWwyuePAs2M8xmkChD89AuHmt8Pb+b1HbCMCT1VixP1Ln1VrTmu0A+Bk+lZiIj/6G+Y8dU1HU7+EoQhV4YWwX8rH9YG8ZWB/mjONIPfP+7sGkyp9FinfXkX920p9jrP8BkB1qMhaMfQ1zL0uxTJ6X2ejaNETkAcVTsOwkCF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=Uwqa4lYs; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="Uwqa4lYs"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id F38B2240027
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 11:22:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net; s=2017;
	t=1773138143; bh=tO8o5psNJZ2qR9UHpfV+KG0CtdqeJkCrtjFX1YzkKoM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=Uwqa4lYsNpP43G2zg11uvmEOOKPz92SdPpDaxbHb3+Z9uhehp9SM/FlHBEuruvb6E
	 SvzSzJxGTalathDr+pZ8qCN+6yqB/momRiRXF1IVch3CqSPIgOP0U7ASgJ6qTDMsWW
	 KYN/14dgmX0L/NdfjTOS0vlY+v1nG6d9uMHP0NY9wFYA44JHw/qUQwmozpIcjtmgWO
	 BT6AbNCk0TzDYE/VT4eW042V6nzEpfnsuVTWl/G74Cxg6bzWKMdl3aAksE9ghG9P4/
	 /RZfNPI+Odh+4LUGg5cq80MS9e9YuDu4DyUdyGE/hNqCrdQrvtPuT6pSBqfKuBLdrd
	 sTX+mqKvF6B5g==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4fVVLP2Xrvz6tx7;
	Tue, 10 Mar 2026 11:22:21 +0100 (CET)
Date: Tue, 10 Mar 2026 10:22:23 +0000
From: Wilken Gottwalt <wilken.gottwalt@posteo.net>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v4 09/15] hwspinlock: sun6i: use new callback to
 initialize hwspinlock priv
Message-ID: <20260310112220.771011e0@posteo.net>
In-Reply-To: <aa_sckE7C3kwqYxb@shikoro>
References: <20260310075539.11701-1-wsa+renesas@sang-engineering.com>
	<20260310075539.11701-10-wsa+renesas@sang-engineering.com>
	<CAGb2v64gTM41Q3aBkS+dqJ7w9fHtePte-6jeoFR3j-O1_aX9-Q@mail.gmail.com>
	<aa_sckE7C3kwqYxb@shikoro>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 10 Mar 2026 11:03:30 +0100
Wolfram Sang <wsa+renesas@sang-engineering.com> wrote:

> Hi ChenYu,
> 
> > >  bank_fail:
> > >         clk_disable_unprepare(priv->ahb_clk);
> > 
> > Just a note, I see further code savings in using the clk and reset devm_
> > helpers. I'll do this after this series is merged, as the context overlaps.
> 
> Yes, I saw this, too, but thought that this needs HW for proper testing.
> Great that you are up for it!

Not only that. You may also need to run the CRUST firmware on the OpenRISC
companion core. Getting that hwspinlock driver done and tested was some real
pain in the past. I still have everything on github for this
(https://github.com/wgottwalt/sunxi_hwspinlock). But I may not be able to test
that in time. I moved a while ago and, uhm, quite some hardware disappeared.

greetings
