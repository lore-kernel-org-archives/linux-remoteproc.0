Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D44B2C3245;
	Tue, 24 Feb 2026 18:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771957115; cv=none; b=bs0/WS0Us0x4fCFcdlSr00HEbR4tmzcg5UTKDsA64ke/onQ7Z3W7nHkg8ky0r3bdN9ow0crbLHASJhEG49qZi8J/FtwhmVMxOgxhM+UN2pyCOEe8c4Ntc91ppzvApbtlpMyM7larS+KIAFpnSsJs0i5sXESyBNRHONg9hvZJSw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771957115; c=relaxed/simple;
	bh=I5cTRWVPT51YjTSVWGJj8SnagR03MK1dLPlQ0cssyG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NOPpB55y7Vo3wgWo+zyxsQ2RRV6rEaODqt9UA7BsPBGhuqTiRZ+awxTfuLZ9tzUGXx3SnAhUJXhJvxRe/4L2UC3Ot7LRkqjT+u7A55YNsQvbfdZZMSd2BpzfXY/Jjp30xiZf+tl//fNjQLkL7Tgbwuk6OpNYndwhlJWBV38k9ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=BYhbTInM; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="BYhbTInM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=+rHMEYxhxWnVlTYkBQ9H9B9sZxXrhLq/EQmtuH5u3KI=; b=BY
	hbTInMfZeqTt8+8sggpv3adTRKtRfyZnF9o4HoPDSzLOB60TUN1Bq2K4aWmRN/k8qd+XauUx6O/eU
	8SkcE9x7i0tKMRe7yfLYM/WpXxPwX0aDDsexHxTvANsbyC6UpIejTWhaMAXxndGLg4IJHVMPH/918
	lbvk3qt5LKX++2A=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vuwzI-008e0Y-0e; Tue, 24 Feb 2026 19:18:24 +0100
Date: Tue, 24 Feb 2026 19:18:23 +0100
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
Message-ID: <91701822-df30-4feb-9e9a-4ee82e2a5d23@lunn.ch>
References: <PAXPR04MB9185A908F5090F0CA4FF05F78968A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <b21b9ee5-d84e-47f8-86b5-c111ecc3d43d@lunn.ch>
 <PAXPR04MB918576D67A268E59242964A08968A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <CAD++jLkUVFckLTq=SoivNFoFymhJo4KM=qGmajFcv9T9+7tPmg@mail.gmail.com>
 <b4c422ce-3538-40aa-8bfa-b70f02774b5d@foss.st.com>
 <PAXPR04MB91859B642802813F908B03DA8977A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <64ef5dbf-6264-4758-a5d8-d8c52c359fcc@foss.st.com>
 <PAXPR04MB9185934EB640E8B21905FF878974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <79eb8bb8-83cb-4b24-8e56-42a53c710055@lunn.ch>
 <PAXPR04MB9185F1A67384E4886282227A8974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PAXPR04MB9185F1A67384E4886282227A8974A@PAXPR04MB9185.eurprd04.prod.outlook.com>

> I don’t think we can remove port_idx if the protocol is expected to support multiple 
> instances. If you only ever support a single instance, then sure, it becomes redundant—but 
> imposing a single‑instance limitation on a generic protocol doesn’t seem appropriate.

The DT binding example is:

+      rpmsg {
+        rpmsg-io-channel {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          gpio@0 {
+            compatible = "rpmsg-gpio";
+            reg = <0>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            #interrupt-cells = <2>;
+            interrupt-controller;
+          };
+
+          gpio@1 {
+            compatible = "rpmsg-gpio";
+            reg = <1>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            #interrupt-cells = <2>;
+            interrupt-controller;
+          };
+        };
+      };

Doesn't this instantiates the driver twice, once on channel 0 and once
on channel 1?

How does port_idx fit into this?

> Regarding type, it’s needed, especially for the in packets. There are two distinct kinds of incoming 
> packets: notification‑in and reply‑in. Because of that differences, Combining cmd and type would 
> blur that distinction and complicate the implementation.

> > #define GPIO_RPMSG_CMD_DIR_INPUT        1
> > #define GPIO_RPMSG_CMD_DIR_OUTPUT       2
> > #define GPIO_RPMSG_CMD_GET_DIR          3
> > #define GPIO_RPMSG_CMD_GET              4
> > #define GPIO_RPMSG_CMD_SET              5

These are all simple RPCs. You make a request, your get a reply, using
the same CMD. I don't see how you can make any mixup here.

> > These map onto the gpio_chip ops. And i leave space for the _multiple ops if they
> > are needed in the future.
> > 
> > #define GPIO_PRMSG_CMD_INTR_CONFIG      32
> > #define GPIO_PRMSG_CMD_INTR_EVENT       33

GPIO_PRMSG_CMD_INTR_CONFIG is again just a plain RPC, request of
"please configure the interrupt handling like this", replay of
"yes, done".

GPIO_PRMSG_CMD_INTR_EVENT is more interesting. The other end can
spontaneously send this, indicating an interrupt. Once Linux has
handled the interrupt, especially level interrupts, it needs to be
acknowledged. So it sends back an GPIO_PRMSG_CMD_INTR_EVENT. It could
be considered an RPC in the opposite direction, but i think that would
be wrong. I expect there are multiple overlapping
GPIO_PRMSG_CMD_INTR_EVENT flying around, so you cannot enforce a
strict RPC style communication.

What is blurry or complicated here?

       Andrew
