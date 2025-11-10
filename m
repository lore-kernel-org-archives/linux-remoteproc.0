Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00DCD26F2AB;
	Mon, 10 Nov 2025 15:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762790377; cv=none; b=TAwP6BCwZlR4BlxQy+WRDSI13yXifC62TZ9lcVvZ6pYOYZvLMQPUaRS4HVP71O8/JfvTVjgeLwKqGj5r5Z/cyuyttxGmUDgUpHZQuu0+VR3GtJI7AHjVIKpsPVSzPGNQZPhxMITfKZhS4GoTVGgGlE/ENKPcxLYzP4rNfrnUV4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762790377; c=relaxed/simple;
	bh=aVjo65n8JMiOdMaIDnZuK3b1Ua/36ApF5ZunmCQlPsA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sye40yQOkbv/ExVgTgFE+tRNMpYUYOcriv8kR/dZZ/DKAIAzDtv8K/EB59IuTQehtMWzbudsG84HZDG7u/9r8iXtNNYT/XqbMgI4AkfFTMkj1NsE2vAZGbEH3g3pcE5NrQcs+UzmPmDvRCWEw4uud7Fe3NyU7gCh+ZwyBrO+GmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=Ox6XwAOd; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="Ox6XwAOd"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=u6EdUrtGOgPUXIy8ofOhog5nFCSibC5nE5AJRWXwH2A=; b=Ox6XwAOdURwqkScwgJ8DNjCjRY
	uWzTHKNjxNlzagA73QE5DzDgE+I3YQNw8jLQXx8sVaoeAcu6ArCpjXL4xvTysJSHI2/p8mNzXXdsW
	SKEl0LDR4mbTNZ1yaiDeTWJHVEv3JIRxKO2422IJC/vGyvhb8wT6G7K5J0YYMNcHRa88=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vIUIh-00DXM5-90; Mon, 10 Nov 2025 16:59:27 +0100
Date: Mon, 10 Nov 2025 16:59:27 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH v5 3/5] docs: staging: gpio-rpmsg: gpio over rpmsg bus
Message-ID: <638dac3d-ddcb-4d53-b06d-e0bd3d9077c3@lunn.ch>
References: <20251104203315.85706-1-shenwei.wang@nxp.com>
 <20251104203315.85706-4-shenwei.wang@nxp.com>
 <9fd8ccd9-560a-43b4-a48d-f7a3eaa07eb1@lunn.ch>
 <PAXPR04MB9185C4A4B91F863CFD49718E89C2A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <0be8c911-3c31-40da-b431-e5a24339c0f9@lunn.ch>
 <PAXPR04MB9185D9EBE8F46715FD114A2989C2A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <cadcbbc7-2024-413a-8e9b-bde5fa233df5@lunn.ch>
 <PAXPR04MB9185E2C3E50D365F64F10E3A89C3A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <0980eb35-b3fd-4383-af86-433769a4fd97@lunn.ch>
 <PAXPR04MB9185156672C7B334E717F11789CEA@PAXPR04MB9185.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB9185156672C7B334E717F11789CEA@PAXPR04MB9185.eurprd04.prod.outlook.com>

> The remote firmware does not need to know whether Linux is asleep. The GPIO is not used 
> to wake Linux directly; instead, it serves as a wake-up source for the remote firmware if configured 
> accordingly. Once the remote firmware is awake, it sends a notification message to Linux. This 
> notification is the actual event that wakes Linux.
> 
> This works because there is always a physical interface connecting Linux and the remote firmware. 
> On i.MX platforms, this interface is the MU block. When the remoteproc driver is running, the MU 
> block is automatically configured as a wake-up source for Linux by default. As a result, the notification 
> message can wake the Linux system if it is asleep.

You need to add a lot more documentation to the specification to make
this clear. As you said, the firmware and Linux have different
sleep/wake life cycles. How does the firmware know it is safe to go to
sleep, if it has no idea Linux is running or suspended?

	Andrew
