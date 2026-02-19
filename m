Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F37B31C567;
	Thu, 19 Feb 2026 13:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771507634; cv=none; b=fAaOkzVSbnW0YHC0TtM5ZEuNkBYAAe+AsngMYdizv5mjbTg57YFISlF/QHT/yH5PhZjNFATXFkFemeurOEGlgbHuW+dT1Z44hT8csaNUc7omgKByxzr5BdaptfNBCxPkDdzzfH2332FB5HgNQtOfFT8i/y/jDkOFCS38MWYOtms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771507634; c=relaxed/simple;
	bh=fYby79ddVirT7D8yoSoby7rf0tIAQwLqM1soMItKJoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lwta85JJvxXeP49cN2lwgRFCIg7rg0grJmaNU26d6S+/FHMOZ7kcj+oQKXv9AUC9n4D4brWHtIQljlqg6C1/54aQu0afOGUsFCE8FZG0tOdNA4fB0Ht7HLuWebCrr7l1PoefHeLbSWM2HU+wAGpbasSdDCbjRzrMxinUDziVHJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=klslBckA; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="klslBckA"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=OTx5xYUSGsOyZu92DsCx1SvBwbu3nc6Z9peJKy6aG94=; b=klslBckAQ9ua5SE2P5JljVjvSQ
	ZD6yujfTr8QwvZqsbYgjbIsmmFx0ZZtWMBtuGoRKA1BpMNh5P+uzGinNCZG3EolLk1Hn+auQTOD/W
	kmgjnUO3B2S70xdA4KFlmZaPFjs27Ls79w0i19HUi0OK6VdUrP7LZFlx4vrsFPG8K2eI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vt43S-007uuW-8t; Thu, 19 Feb 2026 14:26:54 +0100
Date: Thu, 19 Feb 2026 14:26:54 +0100
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
Subject: Re: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
Message-ID: <44804825-5e61-4c3c-96bf-e5a3f3eacec1@lunn.ch>
References: <20260212213656.662437-1-shenwei.wang@nxp.com>
 <20260212213656.662437-4-shenwei.wang@nxp.com>
 <aae7c851-a93b-4d57-a118-43c6e68c4790@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aae7c851-a93b-4d57-a118-43c6e68c4790@foss.st.com>

> > +	if (sync) {
> > +		err = wait_for_completion_timeout(&info->cmd_complete,
> > +						  msecs_to_jiffies(RPMSG_TIMEOUT));
> > +		if (err == 0) {
> > +			dev_err(&info->rpdev->dev, "rpmsg_send timeout!\n");
> > +			return -ETIMEDOUT;
> 
> strange condition you return an error if err == 0, for redability use 'ret'
> variable or simply:
> 
> 		if(!wait_for_completion_timeout(&info->cmd_complete,
> 				  msecs_to_jiffies(RPMSG_TIMEOUT)) {
> 			dev_err(&info->rpdev->dev, "rpmsg_send timeout!\n");
> 			return -ETIMEDOUT;
> 		}

This will be from a comment i made. It appears that
do_wait_for_common() can return -ERESTARTSYS. I assume that should be
returned to user space?

	Andrew
