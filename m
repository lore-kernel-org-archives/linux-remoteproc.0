Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1C83164D4;
	Thu, 19 Feb 2026 20:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771534273; cv=none; b=BO5hpIgfxIr245lc/ykgpqzkKz5AeLJObPoeAFyO/6UbwNmkzumYvPMbuVADlKLmnokFktp4K7EmNDf5sNr24IDr3scwqCMe5egX5VZHLKAVtXvKbkjcrcVy+7tPvKEi+HxzFJC7vdbKzsZCEao6K2U0gLxMq83PzHwE+kkG05o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771534273; c=relaxed/simple;
	bh=0z345Mt+RpEe0+soOBOrs0wFlKM6Sg4VkSb84PJJH9k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aNwJg/lh8VpiZCNUg8TF9hy1ouJTQLngZmuuj3l1siBxJMumPfEWi3/Q6bQHmpOCHTalx9ztyxfwPCsa103+aG4axsSU+qEcz4zaodAdvU8qEQeIXk0Sf/NtJaYMRYnSWG0aq1vd5SPg5gSHkHttctVpiIiLiD9Dfnyvhh2aK5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=xfe7+PHl; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="xfe7+PHl"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=ZzPwbLjUAkNplEI23OCOxh2OE4CZBd1XmoANWE/vbD8=; b=xfe7+PHlMRj7FybqC4/3VYvads
	VWqrYaHTlZlU+BNx03tU4oow/3hQlohGm2bfq1js8Meohln1Bi4cPBz0XDZjqBkNh2iWjuqO+q+Rw
	b7nh6g3UABvl/c5kkTQ2uHJd81dFU9sZww/VbrDnqpzrIOOa01AYhM538pcJET1/HXZU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vtAz5-007yDV-1S; Thu, 19 Feb 2026 21:50:51 +0100
Date: Thu, 19 Feb 2026 21:50:51 +0100
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
Message-ID: <d3215b75-46c9-4875-abd7-fe17eb139820@lunn.ch>
References: <20260212213656.662437-1-shenwei.wang@nxp.com>
 <20260212213656.662437-4-shenwei.wang@nxp.com>
 <aae7c851-a93b-4d57-a118-43c6e68c4790@foss.st.com>
 <PAXPR04MB918582EE33F7BD5C26259BB2896BA@PAXPR04MB9185.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB918582EE33F7BD5C26259BB2896BA@PAXPR04MB9185.eurprd04.prod.outlook.com>

> > Any reason to use __packed and alignement here?
> > This structure will be copied in a vring buffer right?
> > 
> 
> Using __packed together with an explicit alignment is a common pattern for defining 
> communication packets. The goal is to ensure a stable and predictable layout across 
> different architectures and compilers.

Being mostly a netdev person, i can say that the network Maintainers
actually refuses patches with __packed. If you have designed your
protocol correctly, defined your structure correctly, you should not
need them.

We do however accept things like

	BUILD_BUG_ON(sizeof(strcut foo) != 8);

just to make sure the compile is doing what you expect.

	Andrew
