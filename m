Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FAE1341AAE;
	Fri, 14 Nov 2025 17:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763141956; cv=none; b=C9qtZnMfdCsOX0wxOkyD1ai9DYQdQL3vJItRqK8Ow8XUKbVb4HFYrJXmhgqreMFKaDruVAOcvppsqptEh6AaglS9XvfYo27kM/Ez1cPMWEJRy03x+P4XhJRUyqUl9LIUz5rc5YyLjsAZluYvuchDkdjM8V9ajVC6FomRn0wOR6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763141956; c=relaxed/simple;
	bh=6RrGHT2bPSbv3oW/d6l3Th3a8/G2DqdfYt9P09MdriI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bTpPt4YYmYVMgMCIPH5zdmSACWYUY01pBpGu3ZudtF6ozHesTLfSNAj/k90AMFlm16NqdSdfQjNf1rmuSU5OsT6ntKhO5IZVW6XUyA5tSTQW8naEkV3xUU6VUV2lz81IYNIvHZzD9EXetetn6qMORMCLk48Y8OT1Y8FMZGNOEGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=4kpHF5tY; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="4kpHF5tY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=6Ck6SOmONUUBFapcwaTAajZaO0W9Pz5IV9Dw+0dnbis=; b=4kpHF5tYp2Yz6vjrWw3CUwrXXh
	l8dl4e4oNdfuSFYI3a9N/QON/D4BNgazftXzA980LfiWzTzWj6UouLxL25prrHnradLIQ/H6sD/tU
	MJmUMRGukz9tVd1T79/2VyjYGixXBJpnmKrIjPbr7PRr+aL8yrboMKZjninYXpB5HBvE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vJxlH-00E0Yl-B0; Fri, 14 Nov 2025 18:39:03 +0100
Date: Fri, 14 Nov 2025 18:39:03 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Jonathan Corbet <corbet@lwn.net>,
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
Message-ID: <1b39ba56-e38c-4661-9973-b56fdaa1bcae@lunn.ch>
References: <20251104203315.85706-1-shenwei.wang@nxp.com>
 <20251104203315.85706-4-shenwei.wang@nxp.com>
 <CACRpkdZR2C=+ssYOKnF=hyOqTakGjVxzp5_qz=3-uYRpzaZgNQ@mail.gmail.com>
 <AS8PR04MB9176F105B09FF939B22B85E589CFA@AS8PR04MB9176.eurprd04.prod.outlook.com>
 <9bcd63d2-f75f-4cb6-a81f-eefc983a99bb@lunn.ch>
 <PAXPR04MB91854DD6096AD550074FA16189CCA@PAXPR04MB9185.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB91854DD6096AD550074FA16189CCA@PAXPR04MB9185.eurprd04.prod.outlook.com>

On Wed, Nov 12, 2025 at 04:31:52PM +0000, Shenwei Wang wrote:
> 
> 
> > -----Original Message-----
> > From: Andrew Lunn <andrew@lunn.ch>
> > Sent: Wednesday, November 12, 2025 7:42 AM
> > To: Shenwei Wang <shenwei.wang@nxp.com>
> > Cc: Linus Walleij <linus.walleij@linaro.org>; Bjorn Andersson
> > <andersson@kernel.org>; Mathieu Poirier <mathieu.poirier@linaro.org>; Rob
> > Herring <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor
> > Dooley <conor+dt@kernel.org>; Shawn Guo <shawnguo@kernel.org>; Sascha
> > Hauer <s.hauer@pengutronix.de>; Jonathan Corbet <corbet@lwn.net>; Bartosz
> > Golaszewski <brgl@bgdev.pl>; Pengutronix Kernel Team
> > <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; Peng Fan
> > <peng.fan@nxp.com>; linux-remoteproc@vger.kernel.org;
> > devicetree@vger.kernel.org; imx@lists.linux.dev; linux-arm-
> > kernel@lists.infradead.org; linux-kernel@vger.kernel.org; linux-
> > doc@vger.kernel.org; dl-linux-imx <linux-imx@nxp.com>
> > Subject: [EXT] Re: [PATCH v5 3/5] docs: staging: gpio-rpmsg: gpio over rpmsg bus
> > 
> > Since this has not been merged yet, there are no existing systems.
> > 
> 
> In this context, "system" refers to both Linux and the remote firmware. The remote firmware 
> for i.MX platforms has already been released and widely used by our customers. Maintaining 
> compatibility with the existing firmware would provide a better solution for customers.

From what i understand, this is not just GPIO. There is also I2C? And
RTC? I would expect a generic implementation of these as well? I find
it unlikely you can persuade all these subsystem Maintainers to accept
your protocols as is. You need to make changes so that GPIOs
interrupts work correctly, so i would just accept you need to change
the firmware. And i've given you a way you can keep backwards
compatible to your out of tree driver...

	  Andrew
