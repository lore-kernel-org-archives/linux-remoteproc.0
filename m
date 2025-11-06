Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CED11FF7D7;
	Thu,  6 Nov 2025 18:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762453428; cv=none; b=RYa+XBNuNa/jOpf67Mn37qa1XvHg5uWF//jmtJilNK3npfcjMXnWI3weS123AXqbrUGvsNTk9gvLO0P0u4BYzxVFtORqTPSqShASImcPZpKBPlFdCt+IzrWN7kr3BwrXU582ARwz/hIn4rSW40NbMaS26CrkkHn05eznCvZ8MmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762453428; c=relaxed/simple;
	bh=1CAitfW4KX9nLgHnyW0t1edW561hoYkP4z5icFu8Yuc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I2T+FHUBI7RrMuivYKirBmatRlD5WWMuUAlqwN2slOwB1w//nXaDO+C2oL2z0gLKMJPrX/AUKa991vFmt/sRfcEmS6DMBor1Zjk0w7CVGef0TwEdHJKlOAjlyzi88QW0oEU62LppCClMURxNFUh2cYBt5VLZuNXW1Q/ZX66OBLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=j9d9o3Y0; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="j9d9o3Y0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=HHVpwSQIb4q6nngEnig8Xv2gBIL4ELmw4Ak6nVDC940=; b=j9d9o3Y07ktzUn6n29Y1ZcnV3a
	FnLSKV7cn77y2r+jS40bDPROLV4qkSLlKJe1N5ikg9SG8DmcIJ/S40thoWPxaJjgaFo1ZOOxpj1iB
	5sHsXmzY4o+UTG0kwtoedlUZNPEddEUFxiB5+9D5tHagI2P4ijcFzJiEM6lco3lHMnOk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vH4e3-00D99N-FT; Thu, 06 Nov 2025 19:23:39 +0100
Date: Thu, 6 Nov 2025 19:23:39 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Shenwei Wang <shenwei.wang@nxp.com>,
	Bjorn Andersson <andersson@kernel.org>,
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
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-imx@nxp.com
Subject: Re: [PATCH v5 2/5] remoteproc: imx_rproc: Populate devices under
 "rpmsg" subnode
Message-ID: <c034023e-94e0-4a64-9d9c-b463a6ab1e34@lunn.ch>
References: <20251104203315.85706-1-shenwei.wang@nxp.com>
 <20251104203315.85706-3-shenwei.wang@nxp.com>
 <aQxUtqkvcH0ob2yq@shlinux89>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQxUtqkvcH0ob2yq@shlinux89>

> >			rpmsg-i2c-channel {
> >				i2c@0 {
> >					compatible = "fsl,imx-rpmsg-i2c";
> >					reg = <0>;
> 
> i2c channel could be removed, it is not included in this patchset.

And i also expect a similar sort of generic driver for i2c. There
should not be anything IMX specific needed.

	Andrew
