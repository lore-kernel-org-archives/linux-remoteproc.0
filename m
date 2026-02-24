Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96CD7344050;
	Tue, 24 Feb 2026 22:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771971296; cv=none; b=CbqjMSc5WMKINJHj1yf0kTioC/8/iqzKqP8ED8Bb67czcVVvVDhiib8ywey47yXmNghnlxPP/SD7e1H+KlZReXduSkg5pzJ2pil7Fhi/rwYotzSLvc6kCpB9cYCKQ0AK4IypHzvwPlGojK1hFvv2ooM/q0XQrZ9qD3dODhsweak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771971296; c=relaxed/simple;
	bh=vc4HY2RnF90ABS5+N8yZ//pgPQUDHh3gdxhiHn8nx3w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YXvf9GqrmAWSE6iJWLR3NQnFV/+mwFnXtF93ne2F+9PwULq6SUfK92I0vzFpfL9t4Owenuiwz2ApUYDoxT2uwseFdjmTp6Yva0faQPLM+z18/yj7zXmskTQtHpIn088+y0xPsrTOB5AedEqHeJlcFOmZNg/laqn+QsaGYoN+BhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=p622hnM2; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="p622hnM2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=wSMvibqFIXnSrhEo4Yq41qf3Qn33861byKDHLMe6728=; b=p622hnM2rQ1iYj6N1cX+NwBtGb
	pcW4aKEyh8PnP+NieeKKkhtHtNLSmCf6cK/4A6gyo9GgO6juP4nuUnC/VWokyfPTVlm3doSFDOjaj
	r7fI+MouWfjh1o7nEerDyo9U2qjBFCDzsmYCm/X+ON8yYkpVlBDapy/ZuAtcdpmiHsT4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vv0fz-008f2e-LF; Tue, 24 Feb 2026 23:14:43 +0100
Date: Tue, 24 Feb 2026 23:14:43 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <frank.li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
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
Message-ID: <d4c8f7dd-c0a8-4721-9750-47429637d8c1@lunn.ch>
References: <b21b9ee5-d84e-47f8-86b5-c111ecc3d43d@lunn.ch>
 <PAXPR04MB918576D67A268E59242964A08968A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <CAD++jLkUVFckLTq=SoivNFoFymhJo4KM=qGmajFcv9T9+7tPmg@mail.gmail.com>
 <b4c422ce-3538-40aa-8bfa-b70f02774b5d@foss.st.com>
 <nbzdtngifwrx2kyu4tsiwwua5v4i5cjtaotemq5hubaets3bcn@fk25twf5rv6x>
 <PAXPR04MB9185588C1DB71B1FEFA1DEE38974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <CANLsYkxAwgG1WkMRr8EJZuSUnN_jKVnsWhWTakVqhvtMBO365A@mail.gmail.com>
 <PAXPR04MB91851D3DA6A92669CB5926A18974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <CANLsYkw-8ERXy3v8Sv55Cpq=+41Toez3EjLMbENAkavvr8STeQ@mail.gmail.com>
 <PAXPR04MB9185B68BC640D940534E44098974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB9185B68BC640D940534E44098974A@PAXPR04MB9185.eurprd04.prod.outlook.com>

> Please explain how you would design your generic rpmsg-gpio driver which is derived
> From gpio-virtio?

We have already seen the virtio commands are pretty much identical to
what i suggested.

You could just replace virtqueue_add_sgs() with rpmsg_sendto() and
reimplement virtio_gpio_request_vq() to be the callback registered
with rpmsg_create_ept(). The rest of basic GPIO handling should not
need any changes at all.

Interrupt support does however need some changes. The
virtio_gpio_request_vq() replacement would need to see if the received
message indicates an interrupt and call the equivalent of
virtio_gpio_event_vq(), since rpmsg does not have a separate mechanism
to deliver interrupts, unlike rpmsg.

At a guess, 90% of the code would stay the same?

   Andrew
