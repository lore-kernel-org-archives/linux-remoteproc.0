Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75851280324
	for <linux-remoteproc@vger.kernel.org>; Fri, 20 Feb 2026 20:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771618894; cv=pass; b=boaE2zdDDy4AKgVdLfd9piZIivcFjM0L0CDS/Iw5UJmXGPI73+73QBFe/X0S6vgI0Ri7XNJnNGzu7GxjCOGFx7z9I2NvaZQnTogPie6wCdFs4O2d2Hu3/+afr5TxUY9IXhsSN1YuhcpNkqmgdulGpGX45CQrOBPBjNM6sfICNJ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771618894; c=relaxed/simple;
	bh=/MQjPz3AFp9hJYRg6RaO7nd5l2K1vMZNwkI3RJIJr/s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m6CxCu+W2wsI5z0oRhsWHNEffQXBqJ7mLsOlQIuG63kAPEBP/hom4jMwM1x7F/FlfjxWGAweUr7X3I5uZuotPGcepKscqdfDpErugTxcld5k+2DmZqNH8Cc8AiGS4yYVPmcHXnS9565Ck5IA5+5tS1q/YXypnw23DGNtHoxPMt0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xr7d4Qoj; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xr7d4Qoj"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-65c5a778923so3645549a12.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 20 Feb 2026 12:21:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771618891; cv=none;
        d=google.com; s=arc-20240605;
        b=ODiK1DPhTM6ZsCGT3Ul3St+i20TH5DJzuhyPLloKKxRzBm916SXb2NdUN35Mr5tcRD
         162p1kHhcFJcLie/dyhuOzAa3uOBx2XstiZ6+YZ3Gt6SodDhANR2DuHTzN83USFkW9T6
         zcUfoTYsF9Ve3PA/mMnl9bG0U9ZQdNkOowBdqnm+PVUWC8pifJX7ZmYTa3lUzr3bCfZ1
         Q6QWZLDBVk7lbCPdL8i/WuFw6XFuJuWu1L+3jk23+dJlhT2le7S4u/+zXPA/7nPyi0//
         CxCAg0RypEt5SlEfy/+O3mYO2GiJbS+a7OIyRALrPGSG8sJMW7N5kUy7ri3NYL/t/U/d
         q82w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CWagENeZ05MKy23i76GqV0Kg7bzJ28L44P2dnAeTMoc=;
        fh=TQPzKIDfkPb2XxPFI9/iFcueVffu0qNZ5hEoRyjB8i0=;
        b=awArX6/SrAA+L0KmjKMimVY5wjOgute2NiAjS5OB51JHVYck5EYSqBJ/jFYTn0cPlX
         bHo+0rEPTsOJBWaVAZt622TFfN9jAZIdN22gPfTYr/moBZy3FEMsejGnyyujHZO0g51Y
         swZ1S4Jr+lrQ2SfFCZtgzmwSBY4t8T2uk5bJkXzAh5HeBbhkSRS9YL0epH3mVzkM/P+e
         6zZqHCISslyxOmovINxKZd/2xD3vEGuDfMq+C4u8SWyAbATjfIO+gANLdVRFGZ9FQhR0
         X3STnlOGL9rZfP2JsjMP3/C9rY4a/fTqoTgUTp88tD89h8Me9QLosoPjFQrP1iGyIO/s
         D88g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771618891; x=1772223691; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CWagENeZ05MKy23i76GqV0Kg7bzJ28L44P2dnAeTMoc=;
        b=xr7d4QojHNK9zrZ4MdKJDM+AOXyfokLc1h1vWUBN4t7a2bELnxrwhtSV/I2cLP5bpE
         suKa13NWnDXp+yh/+ONEY1Y3rWxnViFCF0591/RaiS44zOL9E3TQEs16A29oEdifuHr8
         Gzjs8RPM8dimS4NrQ6agpqQvyBseoev18AeXXnnZC00SnZJYnjSoTo2Ue5dT/U5tTRUU
         hsWfCGdSyGWLFYmcfdI/F+m5R7RZo36s1S7cto11L8G4CQzpC1WKPStx4Jn/P83ZOTgM
         U2RrsDITF+ZktPG5JB9xKYtrN98GDujYTnrGjjI6881VnFwiAS5DtBPI7DEI0EhE3aD1
         /Q2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771618891; x=1772223691;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CWagENeZ05MKy23i76GqV0Kg7bzJ28L44P2dnAeTMoc=;
        b=Hgd+br9/1BWcaDokyhjmXTvbZn9s7BYvROdCLJ6IpgezyRG3lSYHcNt+9CMR4vmxTu
         BKekx3000aTl19p6LzytZkAHNUHES9Xe1bntGRs+ceHiWDDzdSU/VHQO9VMWLzkWZM7z
         x90IGkvZiH9EWfQcRmPMLFDEmWxm9+ZXL5yKRc4jCyEjN34KScg9ZnD6NwNoDrVVf5B0
         Y96VKW5J8ZbHeptci1C9cSYhm9yn8yxcX2XXbslGx4DC326UwmJVaqh8L379ek/wXEOH
         0SfAd8gdf8Q+h8Yghe0QL/3yk7dVbUrYcP9WabjMqDMBKPclkYY4ihjOalg6AjkkTtnn
         b8HA==
X-Forwarded-Encrypted: i=1; AJvYcCV0u93L0d+PO27KXxs5G5hQ2cIt+7LpqZzUvcgIH/CRwmoT0YJmPm9wEbef2WPADOG9bM8X5pl0DyJdM21e/2lJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yzob/I/nYlPRoEhD2ZJTl8fF4Y4xJddFoSvyWdWpDYTFYE6+BN3
	Gg01hr/SsDYBLOnoiIVJFBL6QqRgehXN6AQcJ+5w/HILCuSVsE1jaI2jNqkgxn1XxYbOKF4Gxix
	teiJwmzc3WL24yim3FXK60+2zsuZ3k3qv1bwyhv5oEA==
X-Gm-Gg: AZuq6aKKCwpoo+3xasOuRw5TgIWJbiifR/PzAIIje+M/fXyZoW4/HNXCbaBJlrRQTd4
	ldlkwtxo0ZpcKRtTC89cjO2cwu9oREvk8R7rIQKLVN/EJTs6G3l93OVYxryjDLZ7Tlv3wx7YBDX
	KAv+nCCdYuz+TVKoY2ptQ1z7614jF7lmWYaZVVw+u+22RNDMCFzPM6pmbi3PWZL0fP69ahCtOgc
	95DFLFsDa4v3mpW/nzDbfQy1YJQkhZ1uhLHIYGHNLEMAFLPYFxSVYwzW63xe8jt5Tcz5K5NCJjq
	NMJ5KI7nV4YXnGh0bOGYl0RpoIqYYi/2LSBPVgDX8Q==
X-Received: by 2002:a05:6402:3547:b0:64b:83cb:d943 with SMTP id
 4fb4d7f45d1cf-65ea4ebf346mr552702a12.6.1771618890856; Fri, 20 Feb 2026
 12:21:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260212213656.662437-1-shenwei.wang@nxp.com> <20260212213656.662437-4-shenwei.wang@nxp.com>
 <aae7c851-a93b-4d57-a118-43c6e68c4790@foss.st.com> <13f9d767-61d6-4e29-b36e-6dcc860ccb11@lunn.ch>
 <fd257c80-d97f-45b0-a12f-3a1888ba81db@foss.st.com> <396819f2-dd00-4c09-8bc7-c035a5282a56@lunn.ch>
 <PAXPR04MB9185A908F5090F0CA4FF05F78968A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <b21b9ee5-d84e-47f8-86b5-c111ecc3d43d@lunn.ch> <PAXPR04MB918576D67A268E59242964A08968A@PAXPR04MB9185.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB918576D67A268E59242964A08968A@PAXPR04MB9185.eurprd04.prod.outlook.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Fri, 20 Feb 2026 13:21:19 -0700
X-Gm-Features: AaiRm50Kkz1w5MRtvgIyG-wO2YfHNIXg4Tb2fsX628-LWgxPRUtWFjuasLWIuqk
Message-ID: <CANLsYkx0Wubx0FiV8ypEnHcstXc2shfEc+87Jn_p=RDe8ib1xg@mail.gmail.com>
Subject: Re: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Frank Li <frank.li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 20 Feb 2026 at 11:57, Shenwei Wang <shenwei.wang@nxp.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Andrew Lunn <andrew@lunn.ch>
> > Sent: Friday, February 20, 2026 11:45 AM
> > To: Shenwei Wang <shenwei.wang@nxp.com>
> > Cc: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>; Linus Walleij
> > <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>; Jonathan Co=
rbet
> > <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof Kozlowski
> > <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Bjorn Anderss=
on
> > <andersson@kernel.org>; Mathieu Poirier <mathieu.poirier@linaro.org>; F=
rank Li
> > <frank.li@nxp.com>; Sascha Hauer <s.hauer@pengutronix.de>; Shuah Khan
> > <skhan@linuxfoundation.org>; linux-gpio@vger.kernel.org; linux-
> > doc@vger.kernel.org; linux-kernel@vger.kernel.org; Pengutronix Kernel T=
eam
> > <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; Peng Fan
> > <peng.fan@nxp.com>; devicetree@vger.kernel.org; linux-
> > remoteproc@vger.kernel.org; imx@lists.linux.dev; linux-arm-
> > kernel@lists.infradead.org; dl-linux-imx <linux-imx@nxp.com>; Bartosz
> > Golaszewski <brgl@bgdev.pl>
> > Subject: [EXT] Re: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO d=
river
> > > If there are concerns about specific design elements within the
> > > driver, I=E2=80=99m happy to address those, but redesigning the hardw=
are/firmware
> > interface is not something this series can solve.
> >
> > Then i think you are limited to using the out of tree driver.
> >
>
> Thanks for the feedback.
>
> To clarify: is Linux moving toward supporting only fully open hardware pl=
atforms? I=E2=80=99m
> not aware of any rule that prevents a company from upstreaming a driver t=
hat implements
> support for an existing hardware/firmware interface.
>
> Given that, I=E2=80=99d like to hear from the GPIO subsystem maintainers =
=E2=80=94 @Linus Walleij and
> @Bartosz Golaszewski =E2=80=94 on whether a driver that works with the cu=
rrent hardware/firmware
> design could still be acceptable for upstream inclusion. My understanding=
 is that upstream
> generally supports existing, real-world hardware as long as the driver me=
ets subsystem standards.
>

The HW can't be changed but firmware can.  It is not realistic to
think upstream can accommodate all the quirks happening in downstream
trees - this approach simply doesn't scale.

As if I wasn't clear enough already (along with many others), the
current implementation will not be merged upstream for reasons that
have been amply discussed.  You either comply with the comments we
provided or use the existing out of tree driver.

> Regards,
> Shenwei
>
> > Sorry.
> >
> >         Andrew
