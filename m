Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306DF243951;
	Mon, 27 Apr 2026 20:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777322965; cv=none; b=sGKjkEEP5Y8KzZ5fxLJZtfbu669rkVhGAA8YPR0xrqCsmGP45fQ55Ddc/iWj1J8NSKYj/vx1HAVdFSsVmv18paMRwpVF1Au1KE55AEYbznGSL9ASrr/Y31x/JaylSilN1HU5sz4yNvXa11+xM4XEVBwvUp04bH7hsvPeFWOfLqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777322965; c=relaxed/simple;
	bh=uQ/YKk4y6AYZo+6AFX+AM0sFp8rKkf1QpU4q+remftM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Eh1dbnWVtO/LvchwBn5wM64lt+4cJZ5QyUtlAWzRTtGB1Vmiv2CSvDbOobnSl1BgHcy52+xGPC77yfkwrOa0RmaNwq7yWDkrV2N1aGj9zJYnn/0E4bsx++3rOEbCZhNC3fH8v6t/cSvKXRSNrmzTL2abnMT/uDHtLaw2DpEBXkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=EV7Rwp4G; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="EV7Rwp4G"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=MMLMoTlttTEwr271DiSMonjx8J90NXXfd9ve6+eILxM=; b=EV7Rwp4GVIMdKKqXd3daio4dni
	PYihHigVemQahqAa6RE+MXr56Knz1fOFHIbCByako21GgIrqitw04bALZWRWSpGRqLTcDXxCL0w8B
	oufkYJAoQF8/enNswTG0WJsiTz7K2M1ZhaYLcJNaVvYvFaIjHLsx8iF2gsW2BGMXi5LA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wHSt8-000DrS-6z; Mon, 27 Apr 2026 22:49:06 +0200
Date: Mon, 27 Apr 2026 22:49:06 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: "Padhi, Beleswar" <b-padhi@ti.com>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Frank Li <frank.li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	dl-linux-imx <linux-imx@nxp.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
Message-ID: <6e01e114-e336-4744-b6b4-563ec42e321b@lunn.ch>
References: <20260422212849.1240591-1-shenwei.wang@nxp.com>
 <20260422212849.1240591-4-shenwei.wang@nxp.com>
 <22fb5fac-2568-42be-a7e3-7e89d0017eb3@ti.com>
 <PAXPR04MB91850A11C58419C03909145F89362@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <6412a758-4560-4cf1-a0d0-5b24d1a715f1@lunn.ch>
 <PAXPR04MB9185009A17DFDF3D6C8B44E789362@PAXPR04MB9185.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB9185009A17DFDF3D6C8B44E789362@PAXPR04MB9185.eurprd04.prod.outlook.com>

> > struct virtio_gpio_response {
> >         __u8 status;
> >         __u8 value;
> > };

> It is the same message format. Please see the message definition (GET_DIRECTION) below:

> +   +-----+-----+-----+-----+-----+----+
> +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
> +   | 1   | 2   |port |line | err | dir|
> +   +-----+-----+-----+-----+-----+----+

Sorry, but i don't see how two u8 vs six u8 are the same message
format.

       Andrew
