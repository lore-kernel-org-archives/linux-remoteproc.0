Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D7B3358D2;
	Fri, 20 Feb 2026 17:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771609340; cv=none; b=P50lHXxbn0qbEzD9wv0ojZnMRN0Q9kprdpLqJgFdfNOXc3RYWsSVboYW3N6LrCQKKhkf/2DVkSjPbUMItlTdPT1OMTGvHmO9sT31ds8K8HdWfCle9j0cLZiFfB+49l2uAdVrLBxqPOPLfvj+cGMAsP3EpgqOIYxVKk38D10iFnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771609340; c=relaxed/simple;
	bh=Z/YROkrVmESRZ8RkdQlsESe9sZcMqjo+0c2DoGATHLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fBtP8K9AbbtkCy8lBiUqvdoIh68zjmOof6p6sSaNPJUu3KS/Me4mQo+ElnM3h3SGZl/Hgy4FBvVuwqMbqRPxB7EM+TO7V7gnj8cdjDUFTP6NyBtqK2UJVBdSKWpRcQdkhkp0XsbrJ4mQX9jVdssYoOITd5Lm7RCnEKl56rDzsC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=i8sVh473; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="i8sVh473"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=vdZF070E8JEKFJ0ME18+O+yF2DoTp5fyPreGsFn+SZ0=; b=i8
	sVh473vtyNr0NN+4ABdvFxzHyvBLjizBTrtIxTnRKAjRoaWKMkWJHu463u8nW+OWkYS3tckuj74YM
	uAKLnhkU90bukc0fg8jxUzzyKyBpfRlORCLdxZN1V4t1wHtvdvuD2p6pVW1EcjeUHrr5dEJSO2EVx
	jdU0AIYbJQG9X1Q=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vtUVx-008670-UJ; Fri, 20 Feb 2026 18:42:05 +0100
Date: Fri, 20 Feb 2026 18:42:05 +0100
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
Message-ID: <68c5f96c-124f-4d81-9dda-8e4b6bacbeab@lunn.ch>
References: <20260212213656.662437-1-shenwei.wang@nxp.com>
 <20260212213656.662437-4-shenwei.wang@nxp.com>
 <aae7c851-a93b-4d57-a118-43c6e68c4790@foss.st.com>
 <PAXPR04MB918582EE33F7BD5C26259BB2896BA@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <7669d7dd-96a5-48a9-b051-875e9fbdad58@foss.st.com>
 <PAXPR04MB91858E7125B2A4F21DDB78FD8968A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <c9d73e40-ab27-4403-9ff6-a3503568fe3d@lunn.ch>
 <PAXPR04MB91851BF97AEF1C5B728865448968A@PAXPR04MB9185.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PAXPR04MB91851BF97AEF1C5B728865448968A@PAXPR04MB9185.eurprd04.prod.outlook.com>

> > > struct msg_hdr {
> > >     u8  id;
> > >     u32 size;
> > >     u8  flags;
> > > };
> > 
> > That is just a bad design. The point of not allowing __packed is that it forces you
> > to design your structures correctly. Maybe AI has no idea of taste, but Maintainer
> > do and would not allow a u32 to be unaligned like this.
> > 
> 
> Let’s keep the discussion technical instead of taste. 😊
> 
> My point with the earlier example was simply to illustrate how layout differences can 
> happen across architectures or compilers. I’m more interested in understanding how 
> you would prefer this specific structure to be defined so that it avoids unaligned fields 
> while still maintaining a stable on‑wire format.

struct msg_hdr {
    u32 size;
    u8  id;
    u8  flags;
};

The compiler will lay this out as you expect, it won't add any padding
between the fields.

You need to be careful with sizeof(struct msg_hdr). On 8 and 16 bit
machines, it is probably 6. On 32, or 64 bit machine it is probably 8.

I would say having a 6 byte message is probably a bad design, and you
should try to make the u32 a u16 if you can. Again, not using the
__packed is making you think about the design, and probably makes the
design better as a result.

    Andrew

