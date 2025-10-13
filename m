Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FCB830DD1D;
	Mon, 13 Oct 2025 14:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760367377; cv=none; b=koQIpLGYcaCB5tAiIXUYoZP0EVWH1gCLolRSw4ukYOeGM5jXkAZGj+dMCDyhNPWhkTY2vo1y/gU+QDJxGg9DNrS5OTrwDkFY7kDz5MSuY3JX157xp6t3Kme5vzC3WqTzPoUnFxPoY+ZteRLqgt1gMewJPqW/k/cPQiN71E/aU4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760367377; c=relaxed/simple;
	bh=w/omJbNT4x72wb+nQF8ohpq3gHn9aanfrR54LexT5pw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OgytPOaVxgZ1IkdZ1PoshPK230CoueBPPKrN7LcE1nDGa2hKd01BOOaSUPFBZJY5OLXHD8Wzqii4TwDwAEwLfMieouK+5XcUngyWhXshy0OsPmL9OUYuw0QKrSk/xNTpjwcHowe66+xs8Qa23NQZpTh3pRyG3iwWMDCKvIpZWRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=I9+6rhSn; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="I9+6rhSn"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=0U6kFGimkqum2GFBGCMz+lQcGUUrU07CQbrnu3JOJdk=; b=I9+6rhSnHziVfbSBw3fbS6Gb9Z
	/4rGeaA/cv5ok3Ql3ezORHK0h0fNw3DrM7mWEYnOstI/MLbwvX0eAU1gv8aoc1hR/7jsMt21mgIbW
	6myA59Xad8mIMXgKha2c+G1bEuTqz8Xkwzn0b9eewhOTWYWnPN/d0ajj24U8uKeTJGs0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1v8Jy6-00Anad-BJ; Mon, 13 Oct 2025 16:56:10 +0200
Date: Mon, 13 Oct 2025 16:56:10 +0200
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
Message-ID: <f5b15eeb-a183-40bc-993a-49736739c0f5@lunn.ch>
References: <20251009222716.394806-1-shenwei.wang@nxp.com>
 <20251009222716.394806-4-shenwei.wang@nxp.com>
 <eb99d9a8-eb96-445d-899a-6e1d9b6f6c69@lunn.ch>
 <PAXPR04MB9185A829534963B22D1C49FD89EFA@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <6025be80-7007-48bb-bdd1-c8198e951400@lunn.ch>
 <PAXPR04MB918524EAA74F72D64AE0ACA489EAA@PAXPR04MB9185.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB918524EAA74F72D64AE0ACA489EAA@PAXPR04MB9185.eurprd04.prod.outlook.com>

> > Maybe Documentation/admin-guide/gpio-rpmsg.rst would be better.  You should
> > also document how to handle features the device does not support. e.g. i _think_
> > your hardware supports all 4 interrupt types. But maybe other hardware needs to
> > return something meaning -EOPNOTSUP?
> > 
> 
> That should be one type of the error return code in the out field of REPLY message. 
> The return code of 0 means success, and the others are error codes. 

You need to be careful of architecture code:

https://elixir.bootlin.com/linux/v6.17.1/A/ident/EOPNOTSUPP

Notice how ENOPNOTSUPP can be 45, 122, 223, or 95. Returning EL2NSYNC
or EDQUOT to user space is going to cause confusion...

       Andrew
