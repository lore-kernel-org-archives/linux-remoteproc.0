Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC57366072;
	Mon, 27 Apr 2026 20:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777321697; cv=none; b=MUE2A+qG/oqG6MOYrIy/0ZGRKyWQAbEq9evW4wXj9Ft7u9Ih85fydQMkGgYTo0k6DSdMU3XudL7Y+Z7xlRUTX8Bv0F/abNtH9vG6vNiGuamf460O75CTDNuF7ZSnpIvbT8AyTGQ69pbAqitf5bDJo3UKq70MAaGVljhGBlM1D9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777321697; c=relaxed/simple;
	bh=V23+FncfRih0vg6hWFTVq/hfs0/6m3e5YdaqQfSqJpA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cp0gOh3NrGktw1goqqwoev8s42Kw+KMzyeC1HnhHK7kTqPpP+s1kjUzcs9N9D82xujnjz+wRqt+rnCH9m6FchYJXoqr/xnDUypAdRacsCtnqjD5KA/1IXazWfmREXs8cyw20Gn7vJl47HJEokyAPOaCqRWOUu6LY67U07H/8tR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=rLlesqLi; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="rLlesqLi"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=bCKUIAH5AFpDTEzRcLChuiZZK/DaK7fLHicMM3GjPeU=; b=rLlesqLi6cgTfWUu5jNjMHVnJc
	WFSU29sFZ7PYpE/EtDJrxlyl9K4R4lTFz3LpB3gxa3gy6IjKwY0rG8OaHwJUN5RJGxmXdMCZuuAfW
	AhzQWMvhNGLPqSnoCVhJCMAATNyF4t3Z8rO3EO6V0Zj2ca/0yQjQaKX7UIsq5FxqX4+M=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wHSYk-000Dgw-4C; Mon, 27 Apr 2026 22:28:02 +0200
Date: Mon, 27 Apr 2026 22:28:02 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: "Padhi, Beleswar" <b-padhi@ti.com>, Linus Walleij <linusw@kernel.org>,
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
Subject: Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
Message-ID: <6412a758-4560-4cf1-a0d0-5b24d1a715f1@lunn.ch>
References: <20260422212849.1240591-1-shenwei.wang@nxp.com>
 <20260422212849.1240591-4-shenwei.wang@nxp.com>
 <22fb5fac-2568-42be-a7e3-7e89d0017eb3@ti.com>
 <PAXPR04MB91850A11C58419C03909145F89362@PAXPR04MB9185.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB91850A11C58419C03909145F89362@PAXPR04MB9185.eurprd04.prod.outlook.com>

> > > +struct rpmsg_gpio_packet {
> > > +     u8 type;        /* Message type */
> > > +     u8 cmd;         /* Command code */
> > > +     u8 port_idx;
> > > +     u8 line;
> > > +     u8 val1;
> > > +     u8 val2;
> > > +};
> > 
> > 
> > Could you please document the fields in these structs (and the below ones too)?
> > From the code, it looks like while sending a message from Linux to Firmware; val1
> > and val2 are used to describe the values to set. Whereas while receiving a
> > response, val1 represents a possible error code, and val2 represents the actual
> > message of get type queries. If that is so, you might want to change the variable
> > names to be more descriptive and also use a union.
> > 
> 
> The fields in the two structs are fairly self-explanatory. Do we really need the additional comments?
> The previous version of the patch used a union, which was updated to support the fixed_up hooks. 
> Now that the fixed_up hooks have been removed, I can revert this back to the union-based implementation.

I thought you had already adopted the virtio message format?


/* Possible values of the status field */
#define VIRTIO_GPIO_STATUS_OK			0x0
#define VIRTIO_GPIO_STATUS_ERR			0x1

struct virtio_gpio_response {
	__u8 status;
	__u8 value;
};

Seems pretty obvious what status means. value depends on the request,
get_direction actually uses it, and it can be one of

#define VIRTIO_GPIO_DIRECTION_NONE		0x00
#define VIRTIO_GPIO_DIRECTION_OUT		0x01
#define VIRTIO_GPIO_DIRECTION_IN		0x02

and gpio_get uses it as a bool for the state of the GPIO.

Why do we need all the complexity for val1, val2, etc?

  Andrew
