Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016F01FDE01;
	Fri,  7 Nov 2025 00:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762475514; cv=none; b=W+wotvs+Vek/pzlKgZx5MoSLC16dxYKxfc4rOA9XvcpN+203wHi9y5o9teVPeMWRpCBmVXJFkCsPA4UAnVF+KVqoCInSaG1ajvp9vh5NO3D0YO22ln7Aq+yWDbAenltADIzXg3hPzkacKJ+JcMOnZcJjrwNWkJjULqwxxQ++oS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762475514; c=relaxed/simple;
	bh=Bhw06MzPVitzuw9ZzTSxcfKyEvizNYpmQ1+N96EYn7I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OLRAcjLt1NWUWyk9iFabz14ppH74y71Wf5i4RSxDuLOg6K+R3FAvcuze8J+WRgB1/AdWiC5TjV31DPDUpS9V2gdBlPK08WeA1n8we9UiuGT81LZIlrWze8vrzGNwZPr9rBrav0PrVZ94a2b0jfU9GhHrHS6cSzWvt79LL3OaEUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=CZPOYo3u; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="CZPOYo3u"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=nm+ruK6YXpYa0FVN7vklPuk3dDu/x7WWIncBNwCg4gA=; b=CZPOYo3uFzYmwxaWAr1YlkKO9N
	NR/Bn3Kz7EoMQNnQlc/T5FUNhctQMu99TI/7cgmTGZ4XkBRvykElfAlbzPRYS5jEPTaMqoOK4Ytjf
	aCFJpMonKjUiYJtq02T9DdnYSn8az6Sr4FFVKJK9tGRSPIuz/Ergw4/4AJ/99Y8spqq8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vHAOD-00DAQV-VJ; Fri, 07 Nov 2025 01:31:41 +0100
Date: Fri, 7 Nov 2025 01:31:41 +0100
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
Message-ID: <cadcbbc7-2024-413a-8e9b-bde5fa233df5@lunn.ch>
References: <20251104203315.85706-1-shenwei.wang@nxp.com>
 <20251104203315.85706-4-shenwei.wang@nxp.com>
 <9fd8ccd9-560a-43b4-a48d-f7a3eaa07eb1@lunn.ch>
 <PAXPR04MB9185C4A4B91F863CFD49718E89C2A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <0be8c911-3c31-40da-b431-e5a24339c0f9@lunn.ch>
 <PAXPR04MB9185D9EBE8F46715FD114A2989C2A@PAXPR04MB9185.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB9185D9EBE8F46715FD114A2989C2A@PAXPR04MB9185.eurprd04.prod.outlook.com>

> > > > > +- **wk**: Wakeup enable.
> > > > > +
> > > > > +  - 0: Disable wakeup from GPIO
> > > > > +  - 1: Enable wakeup from GPIO
> > > >
> > > > What do you mean by wakeup?
> > > >
> > >
> > > The gpio line can be enabled as an wakeup source for the system.
> > 
> > Keep going.....
> > 
> > Does that imply if none of the lines have wakeup enabled, the GPIO controller can
> > be suspended when Linux suspends? How does the GPIO controller know it can
> > suspend? There is no message for that. How does it know to come out of
> > suspension?
> > 
> 
> The power state of the remote GPIO controller is entirely managed by the remote firmware. 
> The remote firmware operates as an independent system from Linux, with its own power states 
> and policies for transitioning between modes. The wakeup field is solely intended to inform the 
> remote firmware whether the GPIO line should be used as a wakeup source for the Linux system.

O.K. How does the firmware use this information? How should it change
its behaviour? 

> > > > > +Notification Message
> > > > > +--------------------
> > > > > +
> > > > > +Notifications are sent with **Type=2 (GPIO_RPMSG_NOTIFY)**:
> > > > > +
> > > > > +.. code-block:: none
> > > > > +
> > > > > +   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
> > > > > +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05..0x09 |0x0A |0x0B |0x0C |0x0D|
> > > > > +   | 5   | 1   | 0   | 2   | 0   |  0        |line |port | 0   | 0  |
> > > > > +
> > > > > + +-----+-----+-----+-----+-----+-----------+-----+-----+-----+---
> > > > > + -+
> > > > > +
> > > > > +- **line**: The GPIO line index.
> > > > > +- **port**: The GPIO controller index.
> > > >
> > > > There is no need to acknowledge the notification? How do level interrupts
> > work?
> > > >
> > >
> > > Currently, there is no need to acknowledge the message, as the
> > > interrupt is managed entirely by the remote firmware. On the Linux
> > > side, a single notification message is received when an interrupt is triggered.
> > 
> > That sounds broken.
> > 
> > A level interrupt is not cleared until the level changes. The typical flow is:
> > 
> > Interrupt fires.
> > 
> > Interrupt is masked
> > 
> > Interrupt handler is called, which reads/write registers in the device who pin is
> > connected to the GPIO
> > 
> > Interrupt is unmasked
> > 
> 
> The sequences you mentioned above are managed entirely by the remote firmware. On the Linux 
> side, it only receives a notification message when a GPIO line is triggered, which then invokes the 
> corresponding interrupt handler.
> 
> Since the interrupt handling sequences are implemented in the remote firmware, the Linux driver 
> can treat level-triggered and edge-triggered types in the same manner.

That is wrong. Edge and level are different and need different
handling. That is why the GPIO framework and the interrupt core
handles them differently.

The devices i mostly deal with are Ethernet PHYs. These are level
devices, the interrupt is active low. Within the PHY there are
multiple interrupt sources, which all get logically NORed together to
form the interrupt output line. Talking to the PHY over MDIO is
slow. Sometimes you need to read multiple registers to find out what
caused the interrupt and clear it. So your initial read suggests
interrupt source Y triggered the interrupt. While you are clearing Y,
source X becomes active. After you have cleared Y, the NORed interrupt
line is still active, because of X. The interrupt handler exits, the
IRQ core reenabled the interrupt, and you expect it to fire again so
that you go handle source X. If it does not fire again, you have lost
an interrupt, and potentially the hardware stops working.

There are also other use cases of level interrupts. You sometimes see
two PHY devices sharing one level interrupt. You get the same sort of
race condition. PHY #1 pulls the interrupt low, triggering an
interrupt. While handling it, PHY #2 also pulls it low. When the
handler exits, it has only handled the interrupt from PHY #1. PHY #2
is still pulling the interrupt low, and needs its handler calling. So
it is required the interrupt fires again when it is re-enabled.

Given the protocol you have defined, how do you tell the firmware that
Linux has finished handling the interrupt, and it should notify Linux
again if the interrupt is still active?

	Andrew
