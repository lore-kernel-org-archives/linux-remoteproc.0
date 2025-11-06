Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F55A239567;
	Thu,  6 Nov 2025 21:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762464765; cv=none; b=TRVOV6vyCk+11xCpdZ+fGM1A3anx2fUms3nFOIOdCSYRgp3XfOYoiRpMYlOG+CdOX7nrXGfOohY+pTFaJ9Ih1wiftWtxMGK4AkwlWNoAzgjENgUTb9879QVjO5T82d3w2dmdV+aVKhIdlURlAwY8zXRNByVJtpLkIEqSMuf8Y5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762464765; c=relaxed/simple;
	bh=/7yuDKRZYJkwyUGsf8pnuwI7Ii8l6sHCkJYUVinW1Ss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hXVnB59mNOCXhu5rGUjs9shBanJ6j2d3HMifis4zIa2HqToj314ouRp+WyXKNtnc6f+ma3xNNrCjJ1v3KAG0bmquX+qp9/rQXbDurB1aXmZknwfebnEwdadOg32HwGQ1wVgyZPvUIfJu3QHVCriCcGCZwgDUfXDWzKiYgP82zH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=ZeaRwZOW; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="ZeaRwZOW"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=S2Kjk2KM6kniWDXtpu1Ri26LklToAnJTS4ZWg7pthK0=; b=ZeaRwZOWoh4y/YQbTKyKyJB9Wm
	EnHJIkUEgDfKO3BTZ5elhaP4MHh3COFg+p2w3GtSuTGygCwXx+7H8o4TyPIHc/Xskc+A3CRrZYGlN
	Uws41HaNWHQBTPVf2uQNZ1unBi2N6HER02kBBhXlqkFY3Y05pzmQKmVZnuG6phkBPOVs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vH7ar-00D9hP-ER; Thu, 06 Nov 2025 22:32:33 +0100
Date: Thu, 6 Nov 2025 22:32:33 +0100
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
Message-ID: <0be8c911-3c31-40da-b431-e5a24339c0f9@lunn.ch>
References: <20251104203315.85706-1-shenwei.wang@nxp.com>
 <20251104203315.85706-4-shenwei.wang@nxp.com>
 <9fd8ccd9-560a-43b4-a48d-f7a3eaa07eb1@lunn.ch>
 <PAXPR04MB9185C4A4B91F863CFD49718E89C2A@PAXPR04MB9185.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB9185C4A4B91F863CFD49718E89C2A@PAXPR04MB9185.eurprd04.prod.outlook.com>

On Thu, Nov 06, 2025 at 08:40:05PM +0000, Shenwei Wang wrote:
> Hi Andrew,
> 
> > -----Original Message-----
> > From: Andrew Lunn <andrew@lunn.ch>
> > Sent: Thursday, November 6, 2025 1:06 PM
> > To: Shenwei Wang <shenwei.wang@nxp.com>
> > Cc: Bjorn Andersson <andersson@kernel.org>; Mathieu Poirier
> > <mathieu.poirier@linaro.org>; Rob Herring <robh@kernel.org>; Krzysztof
> > Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Shawn
> > Guo <shawnguo@kernel.org>; Sascha Hauer <s.hauer@pengutronix.de>;
> > Jonathan Corbet <corbet@lwn.net>; Linus Walleij <linus.walleij@linaro.org>;
> > Bartosz Golaszewski <brgl@bgdev.pl>; Pengutronix Kernel Team
> > <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; Peng Fan
> > <peng.fan@nxp.com>; linux-remoteproc@vger.kernel.org;
> > devicetree@vger.kernel.org; imx@lists.linux.dev; linux-arm-
> > kernel@lists.infradead.org; linux-kernel@vger.kernel.org; linux-
> > doc@vger.kernel.org; dl-linux-imx <linux-imx@nxp.com>
> > Subject: [EXT] Re: [PATCH v5 3/5] docs: staging: gpio-rpmsg: gpio over rpmsg bus
> > > +   +-----+------+------+-----+-----+------------+-----+-----+-----+----+
> > > +   |0x00 |0x01  |0x02  |0x03 |0x04 |0x05..0x09  |0x0A |0x0B |0x0C |0x0D|
> > > +   |cate |major |minor |type |cmd  |reserved[5] |line |port |  data    |
> > > +
> > > + +-----+------+------+-----+-----+------------+-----+-----+-----+----
> > > + +
> > > +
> > > +- **Cate (Category field)**: Indicates the category of the message, such as
> > GPIO, I2C, PMIC, AUDIO, etc.
> > 
> > We know it is a GPIO message, this document is titled "GPIO RPMSG Protocol". So
> > i don't see the need for cate. I can however understand that your device does
> > support multiple functions, but to make this generic, it would be better if each
> > function had its own channel.
> > 
> 
> These details are defined in the message header to support multiple functions. For 
> the GPIO-specific implementation, the header values are fixed and do not require 
> modification, provided the transport protocol version remains unchanged.
> 
> Then I should remove those unrelated definitions from this document. Is my understanding
> correct?

I think we need to know more about your system. Why does cate exist?
Why are you mixing different functions onto one channel, rather than
having a channel per function?

I think you should remove cate from the GPIO protocol.

> > > +  Defined categories:
> > > +
> > > +  - 1: RPMSG_LIFECYCLE
> > > +  - 2: RPMSG_PMIC
> > > +  - 3: RPMSG_AUDIO
> > > +  - 4: RPMSG_KEY
> > > +  - 5: RPMSG_GPIO
> > > +  - 6: RPMSG_RTC
> > > +  - 7: RPMSG_SENSOR
> > > +  - 8: RPMSG_AUTO
> > > +  - 9: RPMSG_CATEGORY
> > > +  - A: RPMSG_PWM
> > > +  - B: RPMSG_UART
> > > +
> > > +- **Major**: Major version number.
> > > +
> > > +- **Minor**: Minor version number.
> > 
> > What is the purpose of Major and Minor? What values are valid. What should
> > happen if an invalid value is passed?
> > 
> > What you should think about is, if you gave this specification to somebody else,
> > could they implement it?
> > 
> 
> Okay. Will change those fields to fixed number and remove the above definitions.

What does not answer my question: What should happen if an invalid
value is passed?

You must have major:minor for a reason. You expect to change
them. Then what happens? How should forward/backwards compatibility
work? Must version 0:0 always be implemented, were as 0:1 is optional?
How do you find out if 0:1 is implemented?

> > > +- **Type (Message Type)**: For the GPIO category, can be one of:
> > > +
> > > +  - 0: GPIO_RPMSG_SETUP
> > > +  - 1: GPIO_RPMSG_REPLY
> > > +  - 2: GPIO_RPMSG_NOTIFY
> > 
> > Is _SETUP always from Linux to the firmware? Is a setup always followed by a
> > _REPLY? Do you need to wait for the _REPLY before sending the next _SETUP? If
> > there is no _REPLY within X seconds, should Linux retry? Can an _NOTIFY arrive
> > between a _SETUP and a _REPLY?
> > 
> 
> Yes, the SETUP message is always sent from Linux to the remote firmware. Each SETUP 
> corresponds to a single REPLY message. The GPIO driver serializes messages and determines 
> whether a REPLY is required. If a REPLY is expected but not received within the timeout 
> period (currently 1 second in the driver), the driver returns -ETIMEOUT.

You need to specify this in the protocol. Looking at the messages, i
don't see why i could not send off a batch of requests with different
line values, and later expect a batch of replies with different line
values. The linux driver can then match the replies to the request and
know they are all answered. The current specification allows that.

You really need to forget about your implementation. Look at the
specification, and think about all the different ways it can be
implemented, and conform to the specification. If there is only one
possible implementation, your specification is good. If it can be
implemented in multiple ways, you need to improve the specification.

> A NOTIFY message can arrive between a SETUP and the REPLY, and the driver is designed to handle this scenario.

Please state that. 

> 
> > > +
> > > +- **Cmd**: Command code, used for GPIO_RPMSG_SETUP messages.
> > > +
> > > +- **reserved[5]**: Reserved bytes.
> > 
> > Why are these in the middle. It is more normal to have reserved bytes at the end.
> > 
> 
> The reserved[5] bytes may be used for other type of functions. For GPIO, all should be 0.

We don't care about other functions. This is all about GPIO.

> > You should also specify these bytes should be set to 0. If you don't it will be hard
> > to use them in the future, because they will contain 42, or some other random
> > values.
> > 
> > Is there a relationship between major:minor and reserved?
> > 
> 
> No so far. Maybe it could be related if the protocol is updated in the future.

That implies that you cannot look at major:minor and know if the
reserved bits are reserved, or have some actual meaning?

Again, think about forward/backwards compatibility. How do you turn a
reserved bit into a used bit? Is the specification sufficient to make
that possible.

> > > +GPIO_RPMSG_INPUT_INIT (Cmd=0)
> > > +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > +
> > > +**Request:**
> > > +
> > > +.. code-block:: none
> > > +
> > > +   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
> > > +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05..0x09 |0x0A |0x0B |0x0C |0x0D|
> > > +   | 5   | 1   | 0   | 0   | 0   |  0        |line |port | val | wk |
> > > +   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
> > > +
> > > +- **val**: Interrupt trigger type.
> > > +
> > > +  - 0: Interrupt disabled
> > > +  - 1: Rising edge trigger
> > > +  - 2: Falling edge trigger
> > > +  - 3: Both edge trigger
> > > +  - 4: Low level trigger
> > > +  - 5: High level trigger
> > > +
> > > +- **wk**: Wakeup enable.
> > > +
> > > +  - 0: Disable wakeup from GPIO
> > > +  - 1: Enable wakeup from GPIO
> > 
> > What do you mean by wakeup?
> > 
> 
> The gpio line can be enabled as an wakeup source for the system.

Keep going.....

Does that imply if none of the lines have wakeup enabled, the GPIO
controller can be suspended when Linux suspends? How does the GPIO
controller know it can suspend? There is no message for that. How does
it know to come out of suspension?

> > > +Notification Message
> > > +--------------------
> > > +
> > > +Notifications are sent with **Type=2 (GPIO_RPMSG_NOTIFY)**:
> > > +
> > > +.. code-block:: none
> > > +
> > > +   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
> > > +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05..0x09 |0x0A |0x0B |0x0C |0x0D|
> > > +   | 5   | 1   | 0   | 2   | 0   |  0        |line |port | 0   | 0  |
> > > +   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
> > > +
> > > +- **line**: The GPIO line index.
> > > +- **port**: The GPIO controller index.
> > 
> > There is no need to acknowledge the notification? How do level interrupts work?
> > 
> 
> Currently, there is no need to acknowledge the message, as the interrupt is managed entirely 
> by the remote firmware. On the Linux side, a single notification message is received when an 
> interrupt is triggered.

At sounds broken.

A level interrupt is not cleared until the level changes. The typical
flow is:

Interrupt fires.

Interrupt is masked

Interrupt handler is called, which reads/write registers in the device
who pin is connected to the GPIO

Interrupt is unmasked



At the unmask point, the interrupt will fire again, if the level is
still in the active state. You need this because while reading/writing
registers in the device, another event can happen, which needs
handling. Generally, the interrupt output of a device is an OR of many
different sources. You only release the interrupt when all sources
have been cleared.

So for the protocol, you need to acknowledge the notification after
the interrupt handler has executed. And that could cause another
notification to be immediately sent if the line is still active.

I'm not too sure how edge interrupts should work. If we are still busy
in an edge interrupt handler, do we want to know about the next edge?
Should edge interrupts be disabled until the previous edge has been
handled? I'm not too familiar with edge interrupts, most of the device
i've handled are level.

	Andrew
