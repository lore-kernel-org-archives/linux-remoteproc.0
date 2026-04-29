Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E5B421EE5;
	Wed, 29 Apr 2026 18:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777486930; cv=none; b=EPUVgkLZWESaugZlJmBQZz+E5dWif/6INUdJzsVoBUV0lzhWXnaW8eeFNbGAhHqfgT6LQv/PY4+SA0c51puqadhq3x9bFboE8Qz9xCCVsMvLuRUeo5KiFL1nHKQXNda8pvmr7Xy1CZbX2yzPREdlQoDwMhucONhR8f2znplLDNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777486930; c=relaxed/simple;
	bh=A2HWuygo9laZl+MF0ZT85lu9bwwS8oO/uA3OEJNjKOs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NBOrlRxhaSzjv5bD2wWx6N3cdeCZ4KjkfKB7qWeni0lAMyfGsR7hZmWjXMPdySfQDv55B1yziM7xJ3qKSzjJfQl3ZIKhHPma7//tc5vHbFEkhNUk+8Ik3ZOSbooItQqibkOhIl16tkL0jiOyLqADtoSNRxn1mbDX7641Gq6Lwi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=SQVWa/55; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="SQVWa/55"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=z3GtHk/ol4lljLIonjZbUzzf+Kywq4ueWS/Omn2wpWg=; b=SQVWa/55JM8wQBVpqHDNM1xFfS
	mXU4TJjeNC4nMrKXqeH6Pxpu44WvN93U2Dka+zbZRN6hDJAI/EfQr1KElAYio7tNyxC15K45AcvWc
	EwYY1ynlGZTtB0O9GYa8BrqxnIE8+zcVB41N3akHQx8P4e4bI+Bb9cqlfks8drQY8Wfc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wI9Xo-000ZDq-JK; Wed, 29 Apr 2026 20:21:56 +0200
Date: Wed, 29 Apr 2026 20:21:56 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Padhi, Beleswar" <b-padhi@ti.com>
Cc: Shenwei Wang <shenwei.wang@nxp.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
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
Subject: Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
Message-ID: <9837070a-f096-4e8f-a83d-efda0570e62a@lunn.ch>
References: <20260422212849.1240591-4-shenwei.wang@nxp.com>
 <22fb5fac-2568-42be-a7e3-7e89d0017eb3@ti.com>
 <PAXPR04MB91850A11C58419C03909145F89362@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <6412a758-4560-4cf1-a0d0-5b24d1a715f1@lunn.ch>
 <PAXPR04MB9185009A17DFDF3D6C8B44E789362@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <6e01e114-e336-4744-b6b4-563ec42e321b@lunn.ch>
 <PAXPR04MB9185A098D894B6A6EBCC13F889372@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <afImuoeHolxGgw3H@p14s>
 <PAXPR04MB9185F2F6DDB55AC56C92D63B89342@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <b80e17fb-7986-4a95-a845-48a7d318ff33@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b80e17fb-7986-4a95-a845-48a7d318ff33@ti.com>

> About this, we only need to do this because you are defining the gpio
> controller instances "statically" in the device tree. I understand gpio
> nodes can act as providers, but I do not see any device referencing the
> gpio nodes you are defining in the device tree.

They probably come later, and a board specific. The GPIO controllers
are probably SoC specific, so can be defined at the SoC .dtsi
level. The users are then in the board .dts files.

This is how GPIOs are typically used. Same will be true of I2C, the
SoC provides the I2C adaptor, the boards have devices on the bus,
again, described in DT.

       Andrew

     
