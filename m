Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3BDC316184;
	Wed, 12 Nov 2025 13:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762954900; cv=none; b=MdvY67pCY7xLPrBd3oyMWiBDr87KpIwqbNBOacmTcf5sd7c92EkExlm7csbYAMTVHGtskH5ZjKJSfdk1ufcAM3iOVymeVmx+f18ienmOYdv1bTjf23r9yCMJQPPbPHFuQk4859CeYt8kgQ/ZOniVSV3hQs7XVRRvLRztlCQeDOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762954900; c=relaxed/simple;
	bh=EykT/IKQHYP/MOb3HirDVe/VNCjQTaPgAa6O9n5Zd40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X3KMWwlbETFzsM19HC6H1ynRfn62d4RNA+bwuv0G0fw7IUOwLc66Mys7HQKiT1cBeWV6iFJO6Yni1Ls90y9VPoIAzNbSjQpgkjfvqI+UkAeJJrF6GlcLFTU47ggWdCMrvxND98TBmwwT3v4TgaORzEWjDR5OHUcIOXZwHvsZ5iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=ACMQ03cC; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="ACMQ03cC"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=R+vUWpJtVmzOn5MTORlZ3b/sdwMlGIAQws10+cLlGxQ=; b=ACMQ03cCbAnsPU6sBkJXhbIgOq
	mEJdROqQbkotw5sR7Ju16UitwLqSNDMbrJx1T2LdTNQFt5vZ10u60Gv1t2kJck6bmgFdpGgatkxvH
	MtKrAtOy035ybPOc/OeXEz/0bcsE3twKCQoKGNZSsibTSFrr7Z67JsPW7zKywAtTqPPg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vJB6I-00Dke3-O3; Wed, 12 Nov 2025 14:41:30 +0100
Date: Wed, 12 Nov 2025 14:41:30 +0100
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
Message-ID: <9bcd63d2-f75f-4cb6-a81f-eefc983a99bb@lunn.ch>
References: <20251104203315.85706-1-shenwei.wang@nxp.com>
 <20251104203315.85706-4-shenwei.wang@nxp.com>
 <CACRpkdZR2C=+ssYOKnF=hyOqTakGjVxzp5_qz=3-uYRpzaZgNQ@mail.gmail.com>
 <AS8PR04MB9176F105B09FF939B22B85E589CFA@AS8PR04MB9176.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AS8PR04MB9176F105B09FF939B22B85E589CFA@AS8PR04MB9176.eurprd04.prod.outlook.com>

> Hi Linus,
> 
> Thank you very much for the review and suggestions.
> 
> Would it be feasible to use the reserved field for this purpose? This approach would maintain 
> compatibility with the existing system.

Since this has not been merged yet, there are no existing systems.

It is well known that what gets merged into mainline is often
different to the initial out of tree version. You just need to deal
with it. One option you have is to set the vendor byte to 1, so
indicating NXP. If Linux uses vendor 0, it might be your out of tree
vendor driver, not the in kernel driver. Just document in the
specification vendor 0 is reserved.

You are going to have to modify your firmware anyway, level interrupts
are broken. And this is an example of why quirks are needed.

	Andrew
