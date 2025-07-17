Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA252F7D08
	for <linux-remoteproc@vger.kernel.org>; Thu, 17 Jul 2025 14:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752763729; cv=none; b=uh+o8zaKC6qQ78H/NqREezLUc2oBGrkoaOc8hJ95qB1BgM1qclVjYgk0mJMKkPHgRZNsV/usa1866KL3S494P+iVdZiyhxAmRk+R4rGa7WMtrVBPSSnimac0PC72JJ6Fh+pv5V3aPTb4aant7zMoZ7lzpwdqgALVn62CgRH+eKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752763729; c=relaxed/simple;
	bh=ldkUDsWevUUrBgtiC0hxtuONfzCw4mF+Y3RShzs3xlc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RxjmxWsnELrOin12cqUcAZkS45WQ1u22ykRuhEg0BjCisYG0ylgij56oPnHosEdkOdXfjcmfS6e/aSz+tRRkaYcomnLUNkKSxiXfMynkyBs0+l74XauX7pqt0rfn/TFOygJOrB5nBKX/IA8awO68CxyXgZrXQBT/gj7ZNzhEVJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZdRsHXdn; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZdRsHXdn"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b34ab678931so773260a12.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 17 Jul 2025 07:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752763727; x=1753368527; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AJ7IJB52s/jxggmQRLZiB7BTzZN6vUYP9vPaGdcZBU4=;
        b=ZdRsHXdnpC/N7S4TKrVMl239qD0Eqe184eATML5npWxTW9YUaL67gxdQFzV61/AKzZ
         40wIDMADfD+BUFEA2TKuo0UpaEYEPjGOBRm6HR7kCCtH0XVa8VaC77vFJu70VkUEsSZ6
         eFee2mEpoKXcxGOsrtBbg2pGu9b/uPjkoNv9zhH8oeyn3Gzge+mSC0d6Q5pEeALZTKgh
         ORkaZi+XE7rHtVbNaBq33bt8k/bEJa3Ek86+r+Xt9cWbUZm7VvZC6eTiDJIdEP2iLfk9
         GNjaVo5aTpR4B7nlod8+HsY0AOe8OLmPz2IHuksHk/R1CBE+pk4Y+lIf1pbc+H/jIOrD
         BE+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752763727; x=1753368527;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AJ7IJB52s/jxggmQRLZiB7BTzZN6vUYP9vPaGdcZBU4=;
        b=GIbQPP+trPDELeZC+9hV2pMwBnNdQmR51ZmWn4scZCCVIZgwfH0wQWNeM7tYP6m3O6
         EUdpdtE7vufnFPcYjzJrJA0J8in6NluduHPngRedM95gfQiIIY5YZvex8YmhFa9ALoQ0
         KbrT8HaJi2ym8R+1Haz/Xxnb1ErzXYe7DmaFrBTLJy8wGdrWPd70ItHvypW7ANH5RtxP
         bG8uYI6C0PoCL4lThWB9MkWSrrFIuw+upk5lGfzrTsld0VZT7DoF6Vbz4O/OC80XI0hC
         3rywcIpYvVk3aUrQ17LEE4GBA5OGCoB1b5Fhh3iA/PNUmFIwE9dVplf5mLzrq5WqiNqu
         9kmg==
X-Forwarded-Encrypted: i=1; AJvYcCX9mi6+PZLv4GeqbcwpaS344I9rkpfpsj//fl5b2Vt8NLYtxPrN0iWECJMuziL1zyoj2SalTFNI6WtTzDycbOTO@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0p2CLPoHhTTmd/GSI3m21W/ikF2r1YpNy/P9+MzEYoVpLLXSN
	c+j7BoL9iWnAe6OpdObjXjHPPO+2Lo3h1arfJ8lMcvdIBe2y6qEH5LSSzuCeeLqgJEE=
X-Gm-Gg: ASbGncuGVCM/oZgcxJ/uBeOUbJHFIbdTA7vCrswnmY8O1Vo67MfUhdOx4lCoGSCSv/i
	hW34ZmoKXLNbauifPki/V0T50p5ys4s1HGrUSGGE5IqMvWi7k/QRJWlaG0INSWZnH4NVe5SYaGV
	SC7H844DUJmZ2fSNDorUyEkjAzOWH5ZOV6w1LbU5pSkBuZgd/jcH9ga5IAFXeDH7/9SSA3fXTqr
	mogWUl4xe7nn7FFjxmEL0EC1yD/ClXHM0TUwS6GK+l1oxc9wp7V4xhPGf+sPbKFrrkuJ5vplleN
	48mIpPsAr1Pj/VonCoartZ2/0xw43JFAej2Y22WjZ9Ffx9myCNq+ziW7HUx+mVW5ntnjAwjZu97
	7nxtMUgRc7bfts/xqcQg3ElIu
X-Google-Smtp-Source: AGHT+IHN4pdN+q1y537irHaqdVIJwMrH6auGVoGM+UN248YAGpQVjPDa0P891RmdfAyjRaEDEvnJPg==
X-Received: by 2002:a17:90b:3d05:b0:311:c1ec:7cfd with SMTP id 98e67ed59e1d1-31c9e76bb39mr9637297a91.26.1752763726789;
        Thu, 17 Jul 2025 07:48:46 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:e0c8:a1e8:3882:b37])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c9f1e684csm3578940a91.12.2025.07.17.07.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 07:48:46 -0700 (PDT)
Date: Thu, 17 Jul 2025 08:48:43 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: "Rob Herring (Arm)" <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Frank Li <frank.li@nxp.com>, Bjorn Andersson <andersson@kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: Re: [PATCH v4 0/5] remoteproc: imx_rproc: Support i.MX95
Message-ID: <aHkNS51jgV5ulsNB@p14s>
References: <20250710-imx95-rproc-1-v4-0-a7123e857dfb@nxp.com>
 <175224423523.783161.17907302929832941912.robh@kernel.org>
 <PAXPR04MB845959EF2767C96794EAE6DD8854A@PAXPR04MB8459.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB845959EF2767C96794EAE6DD8854A@PAXPR04MB8459.eurprd04.prod.outlook.com>

On Mon, Jul 14, 2025 at 11:52:05AM +0000, Peng Fan wrote:
> > Subject: Re: [PATCH v4 0/5] remoteproc: imx_rproc: Support i.MX95
> > 
> [...] 
> > New warnings running 'make CHECK_DTBS=y for
> > arch/arm64/boot/dts/freescale/' for 20250710-imx95-rproc-1-v4-0-
> > a7123e857dfb@nxp.com:
> > 
> > arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dtb:
> > scmi (arm,scmi): Unevaluated properties are not allowed
> > ('protocol@80', 'protocol@81', 'protocol@82', 'protocol@84' were
> > unexpected)
> 
> Same as replied in v3.
> This is because [1] is still not picked, not because of my patchset.

I won't move on this patchset until this is resolved.

> 
> [1]https://lore.kernel.org/imx/20250513-whimsical-almond-quoll-e3ad5b@sudeepholla/
> 
> Thanks,
> Peng.
