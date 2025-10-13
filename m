Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764CB28B4F0;
	Mon, 13 Oct 2025 16:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760374547; cv=none; b=GH1Ez9li1n5ZQLbHOiNRJ6zB1lvQIMbdCIgawIhAxP3Gv/MqWONoso+er2wTV+339DoceyMftOnVlaLdJpN2W11oftSiwqthfmH/qgWgiUGieWet1ezw1n64nkoLcEXx+rpOKe/kLSiVcVe3f9mekPUwriBOUMH8jvEwg/JNyug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760374547; c=relaxed/simple;
	bh=wlwWwsOaGymy2W8eGgiEpASjFWKBeDo7iH2NE6LILLw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QvH9bv5J8Y2zxL+ur1nm8XGeMuo3GXa0+C5xMUkYFqvHOvnV7S1p+pebNq8u3i42DRL3OWIp70Ucj3pG4fZth/5VRA4W4rqRW3UCvtI5kHF8b2QHObNqdmH9yDowBruJkl3HoWSAnZaRgZPzylb4nvIX5ezShK4TparrmtedmVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=T4hxPhCE; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="T4hxPhCE"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=CBULL6DgUe9CggCYIRWgvIG8dAx0oc/6eJPoZVfJcfA=; b=T4hxPhCElqyDUJn4At/i47NzZu
	2DY8dI0GRwfjMqDSf9GAUK9rWrPMGkZStwDQEmZxpE1q8fApUkTxFxNZ1ry054Z9NLTCS4PQCjV7n
	saL8ocOQr0vVqHRKluj481AJzVhgyiTZHjgFsKPB/AAWcvGKPkW4/xAKF5vievn+M5d4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1v8Lpj-00Aoea-Hd; Mon, 13 Oct 2025 18:55:39 +0200
Date: Mon, 13 Oct 2025 18:55:39 +0200
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
Message-ID: <08a8e0d6-f486-40bd-a2f1-43e33ccde1d2@lunn.ch>
References: <20251009222716.394806-1-shenwei.wang@nxp.com>
 <20251009222716.394806-4-shenwei.wang@nxp.com>
 <eb99d9a8-eb96-445d-899a-6e1d9b6f6c69@lunn.ch>
 <PAXPR04MB9185A829534963B22D1C49FD89EFA@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <6025be80-7007-48bb-bdd1-c8198e951400@lunn.ch>
 <PAXPR04MB918524EAA74F72D64AE0ACA489EAA@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <f5b15eeb-a183-40bc-993a-49736739c0f5@lunn.ch>
 <PAXPR04MB9185A0A5494A00280F97676C89EAA@PAXPR04MB9185.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB9185A0A5494A00280F97676C89EAA@PAXPR04MB9185.eurprd04.prod.outlook.com>

> > Notice how ENOPNOTSUPP can be 45, 122, 223, or 95. Returning EL2NSYNC or
> > EDQUOT to user space is going to cause confusion...
> >
> 

> I think we should just follow the definitions in
> include/uapi/asm-generic/errno.h, right?

No.

Try a make for mips, and look at includes you end up with. You will
find it goes something like:

# 1 "./arch/mips/include/asm/errno.h" 1
# 11 "./arch/mips/include/asm/errno.h"
# 1 "./arch/mips/include/uapi/asm/errno.h" 1
# 16 "./arch/mips/include/uapi/asm/errno.h"
# 1 "./include/uapi/asm-generic/errno-base.h" 1
# 17 "./arch/mips/include/uapi/asm/errno.h" 2

and this results in

#define EOPNOTSUPP      122     /* Operation not supported on transport endpoint */

not what you get from asm-generic/errno.h:

#define	EOPNOTSUPP	95	/* Operation not supported on transport endpoint */

	Andrew
