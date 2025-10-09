Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10FE072625;
	Thu,  9 Oct 2025 22:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760050728; cv=none; b=SLUPS1UY4TBfkaAo9Bts6WwzxweLUfrRxiMJp6gI8mOV1SnCcXVxEm8H7xIIPueXivYGx8eq2SbD9ewt4+v/Yqtv1wpeCoh6vXaOEcbZdLC4zflsghAF0ZhnOa0QeymP6BGS6qE1f/CJZogDuYQoC+ol1DvB7OxP+s3ZZ3Xy4WU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760050728; c=relaxed/simple;
	bh=+TjM9Esl2EGZ9SogEgKHjaYZvKO6EnnlHlRkwk3aL9A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OIPWnj+ARHcUKboZ2XU7HsPHzZlQ4BIJ2cQJYDERkZqDcJ+WcamTikOUcmadVSiz+N0DgClBtnGsX3CgFY5QxjPiEjspeak47prE/pCFyJv1Vce61KCytq7OtCcVLkJ/D+OdckIMAuUV3WNa7vxIb8Go6XR1SiiQ0lghZW+/WEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=a8ct4zO2; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="a8ct4zO2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=YZgk97je7BvnBwtTZvJvAprknS458qImb1v2YAT0hgU=; b=a8ct4zO2EH1bTh8uSTZ0eRMk29
	ClMuYBzuXEm/xC2ak0GE5naZl7uE8puV28N6Ru0JgmNQRpmNN8N3t49LKKCYEyF+oPoVHlVIVQVAR
	dNFG2Hr4SzTKZpsLQwCpyBmpcZqDsA/5gpTOM9O50vqjzaa70fIiSDxNXXYf2oc29c6s=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1v6zao-00AYxZ-PI; Fri, 10 Oct 2025 00:58:38 +0200
Date: Fri, 10 Oct 2025 00:58:38 +0200
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
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-imx@nxp.com
Subject: Re: [PATCH v3 3/4] gpio: imx-rpmsg: add imx-rpmsg GPIO driver
Message-ID: <eb99d9a8-eb96-445d-899a-6e1d9b6f6c69@lunn.ch>
References: <20251009222716.394806-1-shenwei.wang@nxp.com>
 <20251009222716.394806-4-shenwei.wang@nxp.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251009222716.394806-4-shenwei.wang@nxp.com>

On Thu, Oct 09, 2025 at 05:27:15PM -0500, Shenwei Wang wrote:
> On i.MX SoCs, the system may include two processors:
> 	- An MCU running an RTOS
> 	- An MPU running Linux
> 
> These processors communicate via the RPMSG protocol.
> The driver implements the standard GPIO interface, allowing
> the Linux side to control GPIO controllers which reside in
> the remote processor via RPMSG protocol.

I've not seen the discussion on earlier versions of this patchset, so
i might be asking something already asked and answered. Sorry if i am.

Is there anything IMX specific in here? This appears to be the first
RPMSG GPIO driver. Do we have the opportunity here to define a
protocol for all future RPMSG GPIO drivers, which any/all vendors
should follow, so we don't have lots of different implementations of
basically they same thing? So this would become gpio-rpmsg.c and a
Document somewhere describing the protocol?

	Andrew
