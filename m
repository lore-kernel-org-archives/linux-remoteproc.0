Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162C73F074A;
	Wed, 18 Mar 2026 20:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773864693; cv=none; b=NKL+oNbEVbF9DXeDnue0+tWhRzbUALfydZDhbBqF7TAejlwb61byzp93eGb5VFWD8HQcCx1vD7ahyKZvIdh5/kfkEZJeO7C4SxTyC0DVS00uIG9Zhry9cyv6n9M9pgacXeiT23x5DF4I6VUyRRGZBnPqXIeyw6MUuMEwtcyY8VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773864693; c=relaxed/simple;
	bh=l04pMHrOXsOeormL73HiGUzeMtq1SP4nxOS0DxlliPU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bBqgwvYjTn9j8uBKhVsvSTfuXVlPyWc1GInM49Hhi8MIq2JA6aCJU17rR0EMmH6AdM4nvFw6vffYqvRoCpW76GOaw9AGeq/i9Y1rurZg9LbB2ofWIs/88N3BiTaklsn4sbiDNBiVd5x/Cr+E+NiEWFnqWhrX/F4NAioDfq62IOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=HVDCm123; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="HVDCm123"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=DgBApf3Qzsyu+MAYekJD8rS07VZTysH8D8y9E4yORdo=; b=HVDCm123zlkXqMYH/LVlvv7e9Z
	g6WqH+umRVLoPYjG/LiIvDimSVT+jDYsYxpk6t1PvV4a/rbiPpXf+o7+2fUpYWnDJ8KgACMyNDYsa
	LRSCLphdyeF6gS7LocwwzCVDcXRu58Y2eXYRvPWvjZXtchXPVN0hlh8JS5ZoJpar1CNI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1w2xEf-00CHRK-Br; Wed, 18 Mar 2026 21:11:21 +0100
Date: Wed, 18 Mar 2026 21:11:21 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
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
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	dl-linux-imx <linux-imx@nxp.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v12 3/5] gpio: rpmsg: add generic rpmsg GPIO driver
Message-ID: <ba563541-f6c8-451b-8967-2c5c9199b231@lunn.ch>
References: <20260313195801.2043306-1-shenwei.wang@nxp.com>
 <20260313195801.2043306-4-shenwei.wang@nxp.com>
 <2aa1d063-181f-4145-9f1f-7e3012c4d0af@foss.st.com>
 <104e9861-bfd4-4e0f-8967-a849edf7e6fb@lunn.ch>
 <CANLsYkx6KhspTjzpk51ywfgWcf-FR7-3XrH=MmBi_W6yZmMukA@mail.gmail.com>
 <PAXPR04MB9185E1D7543DB60DE089423B894EA@PAXPR04MB9185.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB9185E1D7543DB60DE089423B894EA@PAXPR04MB9185.eurprd04.prod.outlook.com>

> @Linus Walleij,
> From a technical standpoint, this GPIO driver is no different from
> gpio-mxc, gpio-omap, or gpio-rda.

Yes it is different. The example you list are all silicon GPIO blocks.
This driver is not for silicon, is a protocol spoken over rpmsg.  The
concept of two CPUs connected by rpmsg in a SoC is used by a number of
vendors. Look in Documentation/devicetree/bindings/remoteproc you see:

amlogic, fsl, ingenic, mtk, qcom, reneses, st, ti, wkup and xlnx.

We want one generic protocol/implementation of GPIO over rpmsg which
all these vendors will use. That means we have one GPIO driver, not 10
drivers to maintain for the next 10-20 years. It also means those 10
vendors have 1/10 of a driver they need to maintain for the next 10-20
years. And likely less bugs to deal with, since the driver is more
heavily tested by 10 vendors, etc.

     Andrew
