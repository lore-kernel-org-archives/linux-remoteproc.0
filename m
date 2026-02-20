Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85FFA2FD1DA;
	Fri, 20 Feb 2026 20:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771620109; cv=none; b=Oncltdbw45DWMNW/MNuQ9YipeqvwPfsLbAoexTPzLnIHZC4PUpviV+5QptDPNurSq7wJyzFXbAxih3cHF9Xycufb0FDSg73+jc8ECD98ceYhq/i6cs9k/k3bxG4uvrOkUzoXBPCeG+dyOyspt59MkqMKR8HGqVgtsmtSrmtbUec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771620109; c=relaxed/simple;
	bh=EGdHmGSGcknQ7r7djb62HKQ32j5nWwlteQmbW/GFSJY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oP4fCtJOPjbK4da36e9/9W9Jlx5qSX00YfqRb+3CMRkMFS0UC60/9+HtST4DHr+Y+O72n24JWJzLNEvI6oMa73MVE9J3GHVrhtVj1mTO8J+1+owSCSg0HEFLWVWg56Rn5WrSWWaTgDjI+Pkn2Jly/8g9MnMCr58uVhB2pnbmnvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=xXgw4y4a; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="xXgw4y4a"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=WGq4tc2/8FniW3HL/KDpLr/I4aSlyDmzecJ4IotE1Zo=; b=xX
	gw4y4aYuoG+UhDMysddc3jSucegZHiQ6CKqHe4mdJBdsJH0obhlgqmsspJQc0u7kqLPiedzD69d8W
	Ex00uFYICfzXAeft2VOGXP4ELCPAp90u69orQzqLarK46rSMMSwONrPUb5k332N92ungN/wegPkNa
	GwMMJU6cTb92hEM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vtXJg-0086rn-7Q; Fri, 20 Feb 2026 21:41:36 +0100
Date: Fri, 20 Feb 2026 21:41:36 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
	Linus Walleij <linusw@kernel.org>,
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
Subject: Re: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
Message-ID: <f12d44e5-c2ea-42e5-ba5d-10408fdf3835@lunn.ch>
References: <20260212213656.662437-1-shenwei.wang@nxp.com>
 <20260212213656.662437-4-shenwei.wang@nxp.com>
 <aae7c851-a93b-4d57-a118-43c6e68c4790@foss.st.com>
 <PAXPR04MB918582EE33F7BD5C26259BB2896BA@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <7669d7dd-96a5-48a9-b051-875e9fbdad58@foss.st.com>
 <PAXPR04MB91858E7125B2A4F21DDB78FD8968A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <c9d73e40-ab27-4403-9ff6-a3503568fe3d@lunn.ch>
 <PAXPR04MB91851BF97AEF1C5B728865448968A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <68c5f96c-124f-4d81-9dda-8e4b6bacbeab@lunn.ch>
 <PAXPR04MB918503335D2349BCCFEC93848968A@PAXPR04MB9185.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PAXPR04MB918503335D2349BCCFEC93848968A@PAXPR04MB9185.eurprd04.prod.outlook.com>

> Yes, most compilers will lay this out without inserting padding between the fields. 
> However, for a communication packet, we cannot freely reorder or tweak members 
> just to satisfy alignment rules—the field order itself becomes part of the protocol definition.

Notice i've been saying design. If the design is poor, the
implementation has to jump through hoops to make it work, which is
when __packed it useful, it allows you to implement a bad design.

> Even within netdev, where you’re very familiar, the classic ethhdr still carries the packed annotation 
> despite being naturally aligned:
> 
> struct ethhdr {
> 	unsigned char	h_dest[ETH_ALEN];	/* destination eth addr	*/
> 	unsigned char	h_source[ETH_ALEN];	/* source ether addr	*/
> 	__be16		h_proto;		/* packet type ID field	*/
> } __attribute__((packed));

And a lot of engineers will agree that this header is badly
designed. The network stack goes to a lot of trouble to ensure the
Ethernet header is placed into an skbuf with an offset of 2 bytes, so
the IP header is 4 byte aligned. This also makes the DMA engines more
complex, having to do an unaligned transfer at the start. More hoops
to jump though because of bad design.

None of the IP, UDP, TCP headers etc have packed, because they are all
well designed. The IETF did a better design job than IEEE.

       Andrew
