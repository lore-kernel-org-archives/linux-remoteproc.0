Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4560D19CCF5;
	Mon, 13 Oct 2025 19:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760382873; cv=none; b=YDPfmNw62+SZu9gLHrrEG4Km/ioTBoWSlBwa545p9vB87adL2US0ZmGPUT8XEXKpudhIDMYWgiDNkD6pjYG37d0G+X4J2t5MFKDkZ3VbQIBeJ7vmpNSywYxvu8u0mF56wFnbBlExEKFVpZzg4+fSCMP5FUrFPv1CZPh1CzA+OAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760382873; c=relaxed/simple;
	bh=RV1onNa6trTaACh0SxXnE7Y/niT0E1V+exPg6oqU83Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K8tHFjAB9TRy1yYAHtU81KD9YmIORK0Tq3RsO1rfu/CUMvym9XEJnHeWRSExLDSxxkzh9848cN3fkYdqnCQA+aJSV0EDEifcaK9tHJRYIPD415pUo4FNaaEl/pxi2d2tFvqjBTOVtgUYe++7vJ1SuyaDLZIXci9Tnza3FWNmyKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=Ji5cP4Pm; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="Ji5cP4Pm"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=tmCRu08IgcbJZYrB4NvC6vwyUprgkKxjzkV72squNuc=; b=Ji5cP4PmaexINKz39ahA6TAIpz
	50wm9RqjP8VbK6gc2PRWy8EuSIV3+2GEZa2kPTaX5lq5yJmK6+TQgbbMRaWmS11w2LdV6bC/qacjz
	hXU/yNC+NkSysM5yXd1QYmvMz5WNjsaEnUTZIEhjJvZxpsY4lsy6CPm1Z3CoLbzPfoa0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1v8Nzz-00ApOd-E3; Mon, 13 Oct 2025 21:14:23 +0200
Date: Mon, 13 Oct 2025 21:14:23 +0200
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
Message-ID: <e124b444-0427-448d-af74-aec22468893a@lunn.ch>
References: <20251009222716.394806-1-shenwei.wang@nxp.com>
 <20251009222716.394806-4-shenwei.wang@nxp.com>
 <eb99d9a8-eb96-445d-899a-6e1d9b6f6c69@lunn.ch>
 <PAXPR04MB9185A829534963B22D1C49FD89EFA@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <6025be80-7007-48bb-bdd1-c8198e951400@lunn.ch>
 <PAXPR04MB918524EAA74F72D64AE0ACA489EAA@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <f5b15eeb-a183-40bc-993a-49736739c0f5@lunn.ch>
 <PAXPR04MB9185A0A5494A00280F97676C89EAA@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <08a8e0d6-f486-40bd-a2f1-43e33ccde1d2@lunn.ch>
 <PAXPR04MB9185DB2E801B8A2139C7C29089EAA@PAXPR04MB9185.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB9185DB2E801B8A2139C7C29089EAA@PAXPR04MB9185.eurprd04.prod.outlook.com>

> For instance, if we define the error code as 1 in the return
> message, the driver will interpret it and just return -EOPNOTSUPP,
> regardless of the architecture.

Yes, that is fine. Document the values the return code can take, and
what the mean. What we don't want is the protocol directly returning
errno values, because they are architecture specific.

     Andrew
