Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62933412BED;
	Tue, 14 Jul 2026 20:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784060013; cv=none; b=mBs3GiHpFQKCKLcuUvzHo7Wm4+capB8bU9YsqpYrSHNOiP1z4Gz6wPYcO5An0YyzhVHLyA1ZGx7WhS3JakrM384fbyDIGw5Gri1KkBJDaqa2FVShG5RbquPGQamrjtZc/A0Ta5Cw+upZBUZj9XuPRkGpbUD+DLLY9XNhbnsrewg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784060013; c=relaxed/simple;
	bh=u+5POPI/BtTyXAnp0z7wIeJABK6jmiOfa+id3WMDL+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CX+HE/syb5PlRxWpyUpPeL9Z7a5ZYX6/vDz7rXWhHFhXXotxVeYvfdwHE0WqokBS4O7DNse2chAkYJGlk2yoGHLl5cJZgoIX4TCOOszWKMu/gDd3NaFl1CdlKrWhehd6wU22kV1Ppr3HrLL+IHzaNVSWMcNgRrMAiy3zt9KDcOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=pDJ4GOG2; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="pDJ4GOG2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=GZnKgW+PTI85uwSvBTZx6tE/LVkjSY/LHRD2fDPNzO0=; b=pDJ4GOG290nNbD7p9pehUqbd6J
	liRP7KZdmFIUYrnPXVRorJ+btZrptsNhTyOE6IcMio8Z7W0/PkmCvK/jiRDtGbzxLi5Rm1ihsYGcP
	D6XqGXjWUEYD1ptZjY+ed8cKUhRvmUeZyVFvFrqTJk3NuFUrKT/o+vUrikzcxituPc94=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wjjVG-00CFLL-Bi; Tue, 14 Jul 2026 22:13:18 +0200
Date: Tue, 14 Jul 2026 22:13:18 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Shenwei Wang (OSS)" <shenwei.wang@oss.nxp.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>, Frank Li <frank.li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	dl-linux-imx <linux-imx@nxp.com>,
	Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
	"b-padhi@ti.com" <b-padhi@ti.com>
Subject: Re: [PATCH v14 1/5] docs: driver-api: gpio: rpmsg gpio driver over
 rpmsg bus
Message-ID: <680d0633-cdec-4545-9114-79bfd6eaac41@lunn.ch>
References: <20260625155432.815185-1-shenwei.wang@oss.nxp.com>
 <20260625155432.815185-2-shenwei.wang@oss.nxp.com>
 <alUdg9iTysXCFUa5@p14s>
 <PAXPR04MB91852808D2C7491AEF98CF1589F92@PAXPR04MB9185.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB91852808D2C7491AEF98CF1589F92@PAXPR04MB9185.eurprd04.prod.outlook.com>

> > 1) You did not include messages that mask and unmask interrupts at the driver
> > side.
> 
> Interrupt masking and unmasking are handled entirely on the local processor.
> 
> When an interrupt occurs, the remote system masks the interrupt and then sends a notification 
> to Linux. After Linux processes the notification, it sends a SET_IRQ_TYPE message back to the 
> remote system, which then unmasks the interrupt.

Masking and unmasking an interrupt are orthogonal to the interrupt
type.

When the interrupt fires, the interrupt core calls the irq_mask()
operation on the interrupt. That should mask the interrupt. Once the
handler has finished, the interrupt core, will call irq_unmask() to
unmask the interrupt.

Edge, level, high, low, raising, falling has nothing to do with
masking. Please don't mix concepts which Linux keeps separate.

	 Andrew
