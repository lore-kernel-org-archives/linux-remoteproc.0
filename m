Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8218E270EBA;
	Fri, 10 Oct 2025 19:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760124725; cv=none; b=V1LwM5g63BzUluzSV2zOi5PgLSJswROmXl1XLzv44+vsSRiOXaBsqjiObD1LoMbK2UJNnlNSq1W5b1fa/tUfe2OEakp8SdvpnQRId3tgyifbYZxbIJGJTiy0Ujji9Py0GGx1j442F7pu3UXfqKSnwziQtP57yuUURytpG7hoyFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760124725; c=relaxed/simple;
	bh=qtnSzonR6W0Cv1rX5Y6WVUNsvtka5ChSZBJBbqU7rgo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f43/xHohgA60uh2goaf6sqOxlY+aP8VKYs7FA7MJFBcIAkFEEOHphCDzTPEHTaKT9DiMF5V24mFNzMcm9twQAMtb4w6+muEG7qoSmU+xU4i2v6tWoqZ6lcfEfBM+zNvG9m1S4hsIZ88Xqi8YiXATSMEWe8MyZ/Ks5rLfztlo88w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=27QRfO0E; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="27QRfO0E"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=sPg6tFmE44GO59Osmm6OJOsXJFjD9dOzK+Pou3aQd1c=; b=27QRfO0Egr4ssojusmNF/vvsXi
	6sPZztKOfe+I3ZeGlmigAgpjzzSxVViZTvdyVqzi/1WpBAAreUqrl3eg8oRMEhWk15NhHNVnoeOkf
	RavLSNw0COOTLc0bZ9h1DoJ/+no6V6J5tmj/zYPBaWJv40C9NRS57bCzvQ8XS7R6edmU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1v7IqJ-00Acyl-Qt; Fri, 10 Oct 2025 21:31:55 +0200
Date: Fri, 10 Oct 2025 21:31:55 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH v3 3/4] gpio: imx-rpmsg: add imx-rpmsg GPIO driver
Message-ID: <6025be80-7007-48bb-bdd1-c8198e951400@lunn.ch>
References: <20251009222716.394806-1-shenwei.wang@nxp.com>
 <20251009222716.394806-4-shenwei.wang@nxp.com>
 <eb99d9a8-eb96-445d-899a-6e1d9b6f6c69@lunn.ch>
 <PAXPR04MB9185A829534963B22D1C49FD89EFA@PAXPR04MB9185.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB9185A829534963B22D1C49FD89EFA@PAXPR04MB9185.eurprd04.prod.outlook.com>

> The only platform-specific part is the message format exchanged between Linux and the remote processors.
> As long as the remote processor follows the same message protocol, the driver should work as expected.
> 
> Here's the layout of the message packets:
> 
> +--------+--------+--------+--------+--------+----------------+--------+--------+---------------+---------------+
> |0x00    |0x01    |0x02    |0x03    |0x04    |0x05..0x09      |0x0A    |0x0B    |0x0C           |0x0D           |
> |cate    |major   |minor   |type    |cmd     |reserved[5]     |pin_idx |port_idx|out:{evt/rc/v} |in:{wkup/val}  |
> +--------+--------+--------+--------+--------+----------------+--------+--------+---------------+---------------+
> 
> Cate (Category field ): can be GPIO /I2C/PMIC/AUDIO ... etc
> Major : Major version number
> Minor: Minor version number
> Type (Message Type): Can be SETUP / REPLY /NOTIFY for GPIO category
> Cmd (Command): Can be Input INIT / Output INIT / Input GET for GPIO category
> Pin_idx: The GPIO line index
> Port_idx: The GPIO controller index
> 
> For Out packet:  
> 	if it is OUPUT INIT, the out field value is the gpio output level.
> 	If it is INPUT INIT, the out filed is 0.
> 
> For In packet:
> 	If it is a REPLY message, the out field is return code. 0 means success.  
> 	If it is a REPLY of INPUT GET, the in field is the value of GPIO line level.
> 	If it is an NOTIFY type of message, it simulates an interrupt event from the remote processor.
> 
> I can add above comments in the commit log or the beginning of the driver source file.

Maybe Documentation/admin-guide/gpio-rpmsg.rst would be better.  You
should also document how to handle features the device does not
support. e.g. i _think_ your hardware supports all 4 interrupt
types. But maybe other hardware needs to return something meaning
-EOPNOTSUP?

	Andrew
