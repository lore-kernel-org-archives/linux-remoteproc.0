Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF92AE555;
	Tue, 24 Feb 2026 17:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771954301; cv=none; b=QVraWpTQXdImyY1JUgfmKUis5O4791v3IgXltKqWJZSPH5br9VXouhwGHcYtZp1zpkOT9bJmeJvjYGx7jr6Ue97/Um488DC6rohG+7gwzdoLNC0BczEbSaSlr4+oRH0VZmXP9fdwaJpUsvupnTkXPVAKPPh8T7lNiEZ1GkTnAMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771954301; c=relaxed/simple;
	bh=GpEIF7KYQIRf2iyonqo4UgkLPNTeDqqiI7kXWlHhk8w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CVv8i+Ce1h13aeiELuF7wycH5z8+++GnO0PSfIYwuJDwuG31Q4IEwDT4wZLXHChULo5sDhV52nAHe/q8obe6nMErQPf1R5CPyCs7srDcq2VGjiOSAvRY5auitx7uhgEE0UYd7gKX53Q5MVvg7yUCeeAP/Bo5RUFwbD874NP9jeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=mJOKozCo; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="mJOKozCo"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=0B3jcTNUQM4dYgkUTVaMAfAHtbtRMSVxu9Gvpkl5SlM=; b=mJ
	OKozCogVPMZiP3rAW+cNmMDp/bx1jxiidjm/0T1emzMGXkyvjcbPuG7xbf1irH4tyZi5C/H1186zj
	3v3vUGoMw3yAK/uybiMfdAFagVF/FGPYDZBSwntv45jfu+UQoVmWE78v4zcslAvbV2rJjehE1ydmC
	EMd07yKG45mshgI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vuwFr-008dOV-Dl; Tue, 24 Feb 2026 18:31:27 +0100
Date: Tue, 24 Feb 2026 18:31:27 +0100
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
Message-ID: <79eb8bb8-83cb-4b24-8e56-42a53c710055@lunn.ch>
References: <fd257c80-d97f-45b0-a12f-3a1888ba81db@foss.st.com>
 <396819f2-dd00-4c09-8bc7-c035a5282a56@lunn.ch>
 <PAXPR04MB9185A908F5090F0CA4FF05F78968A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <b21b9ee5-d84e-47f8-86b5-c111ecc3d43d@lunn.ch>
 <PAXPR04MB918576D67A268E59242964A08968A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <CAD++jLkUVFckLTq=SoivNFoFymhJo4KM=qGmajFcv9T9+7tPmg@mail.gmail.com>
 <b4c422ce-3538-40aa-8bfa-b70f02774b5d@foss.st.com>
 <PAXPR04MB91859B642802813F908B03DA8977A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <64ef5dbf-6264-4758-a5d8-d8c52c359fcc@foss.st.com>
 <PAXPR04MB9185934EB640E8B21905FF878974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PAXPR04MB9185934EB640E8B21905FF878974A@PAXPR04MB9185.eurprd04.prod.outlook.com>

> Hi Arnaud,
> Glad to hear you find this approach reasonable.
> To be more specific, I’m proposing to do the following modifications for the protocol:
> 
>   - remove the “id” field (Message ID Code)
>   - remove the “reserved[5]” field
>   - and also reorder the fields so that port_idx appears before pin_idx
> 
> If you think additional fields should be removed or adjusted, please let me know.

I would squash head and body into one. Remove vendor and version. Do
we need both cmd and type? It seems like they can be combined. And is
port_idx needed? Don't you just instantiate more instances of the
device, one per port. That is how you would do it with MMIO GPIOs.

struct gpio_rpmsg_packet {
	u8 cmd;
	u8 pin;
	union {
		u8 event;
		u8 retcode;
		u8 value;
	} out;
	union {
		u8 wakeup;
		u8 value;
	} in;
}

4 bytes, a nice size.

#define GPIO_RPMSG_CMD_DIR_INPUT 	1
#define GPIO_RPMSG_CMD_DIR_OUTPUT 	2
#define GPIO_RPMSG_CMD_GET_DIR		3
#define GPIO_RPMSG_CMD_GET		4
#define GPIO_RPMSG_CMD_SET		5

These map onto the gpio_chip ops. And i leave space for the _multiple
ops if they are needed in the future.

#define GPIO_PRMSG_CMD_INTR_CONFIG	32
#define GPIO_PRMSG_CMD_INTR_EVENT	33

And then interrupt handling. These are less obvious, struct irq_chip
has a lot more ops, so i'm not very confident this is sufficient.

	Andrew
