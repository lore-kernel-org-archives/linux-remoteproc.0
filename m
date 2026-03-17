Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E6D3E276C;
	Tue, 17 Mar 2026 14:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773757354; cv=none; b=kEs4r3Sp78cDxeb8Sa2nvUtwvprJHvVOdlBVYaAJYM6ZtewrTSUgQsC981ntszuvxniS/xLQPG4DTs5nmx6VljrRhoxhj8H7FqVCjsbOviARTmV9hiME9qEaE5BuSQkGxt78CyKnrxFieRwpzK13Dpu2j+h/I1qyIa/UQYel+OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773757354; c=relaxed/simple;
	bh=28yViGP6bassgTvap2oH91NclsVYHfgNoQlH2l9XYMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vy44xWHbhy0AWnHuIGnYyXcCuO6Tjx7T6MDXatxzd4S7x0o/GhN5mltY6/4YXPZ2A4xU7uFGpFnNu6IekkCy04V5cavDbbDYo+kEictv3zFIqWypTtg8EZ6GEKCX4BcTCQqsSpNFLXm9MO/hPhbQbwn58b4nsN97V9mvfJXPeco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=0KUmaox7; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="0KUmaox7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=I6Y4ZFhW4cSATcogRMbcAzq1BU+egoD9LUl6g+F51PA=; b=0KUmaox7WptcPUgpyYu6zf8gmx
	OuQhHCtBY1RmDCddkr8WPd7/OqPtgIAqv3DZazZKjnYAtGsf7kv0jzozr0f6Nli51WdnXtTl1fNQE
	5SN/WJghoZzlYvj4Htq9wxoxVWZoQw6jwhr4VF7p2KDhKgD67YTd14XUtDWt6KrkaJzQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1w2VJQ-00C2Ig-J1; Tue, 17 Mar 2026 15:22:24 +0100
Date: Tue, 17 Mar 2026 15:22:24 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc: Shenwei Wang <shenwei.wang@nxp.com>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-imx@nxp.com, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v12 3/5] gpio: rpmsg: add generic rpmsg GPIO driver
Message-ID: <0f880475-a850-4138-b79d-d3c88765b0e0@lunn.ch>
References: <20260313195801.2043306-1-shenwei.wang@nxp.com>
 <20260313195801.2043306-4-shenwei.wang@nxp.com>
 <2aa1d063-181f-4145-9f1f-7e3012c4d0af@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2aa1d063-181f-4145-9f1f-7e3012c4d0af@foss.st.com>

> > +static int rpmsg_gpio_send_message(struct rpmsg_gpio_port *port,
> > +				   struct rpmsg_gpio_packet *msg,
> > +				   bool sync)
> > +{
> > +	struct rpmsg_gpio_info *info = &port->info;
> > +	struct rpdev_drvdata *drvdata;
> > +	int ret;
> > +
> > +	drvdata = dev_get_drvdata(&info->rpdev->dev);
> > +	reinit_completion(&info->cmd_complete);
> > +
> > +	if (drvdata->protocol_fixed_up)
> > +		ret = drvdata->protocol_fixed_up->send_fixed_up(info, msg);
> 
> Seems not part of a generic implementation

Agreed. Lets have a clean generic implementation first, and then
patches on top for legacy stuff.

> > +	ret = of_property_read_u32(np, "ngpios", &port->ngpios);
> 
> The number of GPIOs should be obtained from the remote side, as done in
> virtio_gpio. In virtio_gpio, this is retrieved via a get_config operation.
> Here, you could implement a specific RPMsg to retrieve the remote topology.

The DT property ngpios is pretty standard, so i think it makes a lot
of sense to have. But i also agree that asking the other side makes
sense. What is being implemented here with rpmsg is not that different
to greybus, and the greybus GPIO driver also ask the other side how
many GPIO lines it has. So yes, it should be part of the protocol, but
maybe optional?

	  Andrew
