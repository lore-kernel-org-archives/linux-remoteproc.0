Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B372557A;
	Sat,  8 Nov 2025 17:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762623958; cv=none; b=EgLyucr2tkTsJA12loV1z+Syi9hBaH6jZYZxmsxxEYCrMFUQjUEFBzZ9PkKzNom9S/H16XjsJDJBRUFgjNGAL8uqT2WG1ptxzluY4hI4svlIABMtXXc2etNMyud0QZEFzmRFAJXVy3IqSxkW9ZovklFZmMI3R6ySwZz3OES2X/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762623958; c=relaxed/simple;
	bh=h55D+lP2GX+jwsy3UaeykKcNMiEK8XbrLBMFZ4c2xOg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hmP35LQ8645He4xaSvT1GE/VU8Qa6V7SDIQusmPXXPtcDaOH1Cuqj+/tw5wktuj84RgvBXMQdlthgTa+MUbF6McLq+wXwZqgmr3UjfPKuuE6wbebdVfo/l+skWHUAi1LTYJwbcdZQPd/nW8ZhLaBgNsPQslzXs70gNz3zKoTqEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=JZRzBBIK; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="JZRzBBIK"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=MWJj2IKmfkjlDaYikKg3q12CWfCVWJj+lx+cL84vUVE=; b=JZRzBBIK66o7ZHzuevluHIKnZM
	BNfmpmQTzA2Ht1mPskilZBX+DsNdzqvtxLB5MzMnUKIDInB/YAnlUjAE942hjlVzBFtZmeu/Fj33a
	5m/BxcNbyWHd35gB2ecqg+aT1PDKZQK6w2sURgQV17WUU9c0b97WuJD9pWEuzze3CZFo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vHn0U-00DOYO-NZ; Sat, 08 Nov 2025 18:45:46 +0100
Date: Sat, 8 Nov 2025 18:45:46 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH v5 3/5] docs: staging: gpio-rpmsg: gpio over rpmsg bus
Message-ID: <0980eb35-b3fd-4383-af86-433769a4fd97@lunn.ch>
References: <20251104203315.85706-1-shenwei.wang@nxp.com>
 <20251104203315.85706-4-shenwei.wang@nxp.com>
 <9fd8ccd9-560a-43b4-a48d-f7a3eaa07eb1@lunn.ch>
 <PAXPR04MB9185C4A4B91F863CFD49718E89C2A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <0be8c911-3c31-40da-b431-e5a24339c0f9@lunn.ch>
 <PAXPR04MB9185D9EBE8F46715FD114A2989C2A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <cadcbbc7-2024-413a-8e9b-bde5fa233df5@lunn.ch>
 <PAXPR04MB9185E2C3E50D365F64F10E3A89C3A@PAXPR04MB9185.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB9185E2C3E50D365F64F10E3A89C3A@PAXPR04MB9185.eurprd04.prod.outlook.com>

> > > The power state of the remote GPIO controller is entirely managed by the
> > remote firmware.
> > > The remote firmware operates as an independent system from Linux, with
> > > its own power states and policies for transitioning between modes. The
> > > wakeup field is solely intended to inform the remote firmware whether the
> > GPIO line should be used as a wakeup source for the Linux system.
> > 
> > O.K. How does the firmware use this information? How should it change its
> > behaviour?
> > 
> 
> The remote system should always aim to stay in a power-efficient state by shutting down 
> or clock-gating any blocks that aren't in use. In this wakeup scenario, if no GPIO lines are 
> requested or marked as wakeup sources for Linux, the remote firmware should put the 
> GPIO controller into a low-power state.

There are no messages defined to tell the GPIO controller Linux is
suspended.

Since the firmware has no idea Linux is asleep, the firmware is
performing all the usual processing, driving output pins, monitoring
input pins, delivering interrupt notifications. If no pins are marked
as wakeup, it can then enter some sort of low-power state, which
allows it to do all this work, plus save power? How?

I've also been thinking about what a wake up source actually
means. I've been looking at this from one use case i know, an Ethernet
PHY performing Wake on LAN? What normally happens is that Linux
suspends, but leaves the main SoC interrupt controller enabled, and
parts of the GPIO controller. The GPIO controller has a hard wired
connection to the interrupt controller. When the PHY indicated WoL by
driving its output pin low, triggering an interrupt, the GPIO triggers
the main interrupt controller, which wakes the CPU.

How does this work here, in a message passing system? Linux is
asleep. While asleep, does it still process all remote proc messages?
How? Does it wake up for each message and go back to sleep once it
finds it is a non wake notification? Since the firmware does not know
Linux is asleep, it will still be sending notifications for non-wake
interrupts. How does Linux actually know to wake up? Do you require
that the low level remote proc mechanism is also wake capable? So in
effect, Linux needs to go up the device chain and enable wake source
not only in the GPIO layer but also the remote proc layer? And
whatever mechanism that is based on, until you get to an interrupt
which can actually wake the system?

> Okay. To fully simulate a level-triggered interrupt, a notification reply message is required.

I would not word it like that. All you currently have is edge. To
simulate level triggered interrupts you need a notification reply
message.

> Remote firmware sequence:
> Receive the level-triggered GPIO interrupt.
> Mask the interrupt for the corresponding line.
> Send a notification message to Linux.
> Wait for the notification reply, then unmask the interrupt for the line.
> 
> Linux sequence:
> Receive the notification message.
> Invoke the interrupt handler for the line.
> Send a notification reply to the remote firmware to indicate End of Interrupt (EOI).

That sounds more reasonable.

	Andrew
