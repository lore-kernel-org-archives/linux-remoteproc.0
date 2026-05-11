Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56FB23128B2
	for <linux-remoteproc@vger.kernel.org>; Mon, 11 May 2026 17:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778522344; cv=pass; b=LKAKvfb3ICWLKlt/2do9ujHGZJFfzRej4w+s8/Vav1fox3rAW7XbPSIkjVY7QD/uw9D8Nl9AHt+AsElvHOgDSF0JuISNWRA7QhvScRMmYnVrQcUZYt0KOHvWnR+tGxPl8uBIugT+GUsCagNMs+N3iZw0JXQGQEA+VGAZXM8Mwzw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778522344; c=relaxed/simple;
	bh=JaGpdsFrrzmCM6mlcJ28PmzHDZaATmxVAIXJ5VZ3yfU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k2IsNRktASzNB0/u5qj7xZInk4EXG+CU9K9dhVAcLsgcu/V4RW9syYqtCO5StDSXDV1wNDc7aCSkQLJgYjiDgh8JiauKJ3Hc4ZbnwZ3vCzkwQ9RUlmIkFyxizE8j+n7UwDpdoA5XIEL7fzPC7174yAitWDE8lEXaZtBOtTwvEdQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uuwF6gQR; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uuwF6gQR"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-67929ff6dbfso7063429a12.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 11 May 2026 10:59:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778522339; cv=none;
        d=google.com; s=arc-20240605;
        b=hSCDzU5PW0VFz4Z9Gigwv4YJZmomOwUoxS7rSSgKHvLzixGZSze7WL9fmCixCKE+j7
         JVZ4oEaD1CFBMU/OEowhFCtq3OIkXnxHYxa/5lefs+stw6K4IM5IdpUDgGdQCQOxdlkt
         KioO8mwl1PHEsrYRy/jA6E34YdbLX2wkuwGYCyytxcwYiEXLRtFHVyokCh1lWtOlECko
         Ql6DW985AXOCS+IGfiU4Xx6ytzErwPWGx2cZOGvrVIiUPBxhEoyQQTKtU2gM9eg8YZhb
         j7alHrWqrCvsCeqlEufiVvWTan/4AWqB2PVPcjlS/rxz0dHr3s4vVDCmSQ7u3GSnPlLD
         JEYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jBWPDHMyvzCYC9AKRdR5wN3XXuUjWEgPTTlpz7YE57o=;
        fh=r3I4rympfP7UOF/SYZzjRsOfbTobpNk/ueO9F1ye+sc=;
        b=YNI+SLbSeozxUBzGHfe63xUPKnzecM3WyY5uib4bokga9Dlm1h3Sp+WEJFaD5jCV3V
         vXhr8yMg6QNROaRUfT3YULd1PlJ3Ffdq+AimfaaYBm/vS5igWvzaAV83MlE5mCtOxBlz
         93MuOSbCufQBndnObl7Ahp1ohtbE715G+s7kyKeOu2qiyKvV5LBVBx930MfQV8vT/2xi
         jleEyN/UAvpENNSq7wtQlU7vub+IaY/ct6izHhXMLXJoOoXgEJBLk2wU2V8hWxNksHCu
         G02GWQyEuq4MO6CbKyTFXh/Uf+cBdyw7B3vHfTPKdJISsA9gf39LA+aQ76ISRwo5K79b
         PvFw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778522339; x=1779127139; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jBWPDHMyvzCYC9AKRdR5wN3XXuUjWEgPTTlpz7YE57o=;
        b=uuwF6gQRpECBkWcFIVAUODcHAxRDP1NrogBjLbaPH9HwJ7XShTSNPmTZrC+dWLt0es
         8cV66t4Slg0OFYdOa8Wcpsp48ukSRFFSo260bmuf6SyDAcZ9jzC76NTbC5UkdOEfxuMj
         j9q7s4BoXXi2/9ynOIfKYQgY5YB53AFDF7ZEs9djEC+Mijm5zxrXiXHDFzU+i+xoL7Iz
         8n/e7l4UH/abXVo0LcuPtoX7px4j/uHhu7UNc5Kq+NLKNs84OHOkBv6ZHDWI7F4JRBKJ
         dJ+fLAWFGwlvU0v1AN6rZUZq2Ev2d609GzAlKZtYsrZC+DW3qAz2YOBn2XTVvpzDaXl8
         BSDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778522339; x=1779127139;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jBWPDHMyvzCYC9AKRdR5wN3XXuUjWEgPTTlpz7YE57o=;
        b=Pt1BKmb7DxKZGPOS6YOcijJ3ZvMdoA33CsGJsA3nHumK6mIZyLmljUZtrJ3pkbQzeq
         8NdMHjvrNj1pwmPVtiKPAcThwEBwb8kT4Ztyjv5ZSwbKPBAk8OvyeO7GYSPjH9S814md
         BGrcqtcb9sPUArDIrJPlI9D0SaFbmnAplmfvw1m/wUUA0dhmSh4nNyFR9rBZvXQq5Sgs
         oY/7ic9/Gp9G0ofDUhBN6ORxL90qAWv6QpD3swdO3zceMB2RObfrpSQnpufiPH+TktkY
         w+D9XQB8yPZmZv86XqbbzW6LkAEkp8qUjNgo50O6QAPYu3HS6XjYkzmyDU7n/XudLBD9
         mxrw==
X-Forwarded-Encrypted: i=1; AFNElJ+IsrHB5bBhPn833y9FIV+JZ9Sj7XqXwqNUspsqHhchykWeaFvOYvcjithz+FI8PdXMIGe3RWeQ5rKghB7etaqm@vger.kernel.org
X-Gm-Message-State: AOJu0YwPaULBhNrgbhu8KWzGwoobKqPGfqd82MLhjwZSck4qUx17TA4X
	Vt7heJQmISKyae5iGG2aXMYwTCWcezZs8JGF48nB/ER6nv8op1h/1mlu3Qa3cC0nJadg+otcaii
	/XsjC4fK/mfbVLbwILpgXa8a7ILg98TP+pQfabCRnuQ==
X-Gm-Gg: Acq92OHPdqmAPKI1+ADOgxUH/xVD7Xa6Z7U55/lPNMdw03j5UHTk/71A2erUnsu4IQb
	/J9onwFhSxTko41ggeyUzlfucWV8Zh25QtZxHO/eUqYfbLBnB5RlZK8p8H3/8IsZuP52pJ4F+Zo
	zH6spX8bkmpJ/Yd5a575GRm3FutBBeKJpXOS12PvZqPWn4o4yzjbVlHts7z0xnAWIjxUaPxYCD2
	LwtBJNF8tqfxE0K97/2bjeJULvb4i23t1QX8Lfvqfzp1BHIzXiqyMnM9784oN66qCvLwOitMJN9
	1pjM/qBjzE7Bztio2gPy9b0zg3VDQ1/Z1V/50+PWl4hEC17129wh
X-Received: by 2002:a05:6402:29a:b0:674:b355:555e with SMTP id
 4fb4d7f45d1cf-67d643bfa26mr9102781a12.17.1778522338617; Mon, 11 May 2026
 10:58:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260422212849.1240591-1-shenwei.wang@nxp.com>
 <PAXPR04MB91850A11C58419C03909145F89362@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <6412a758-4560-4cf1-a0d0-5b24d1a715f1@lunn.ch> <PAXPR04MB9185009A17DFDF3D6C8B44E789362@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <6e01e114-e336-4744-b6b4-563ec42e321b@lunn.ch> <PAXPR04MB9185A098D894B6A6EBCC13F889372@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <afImuoeHolxGgw3H@p14s> <PAXPR04MB9185F2F6DDB55AC56C92D63B89342@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <CANLsYkwvL0Z3+12MD=J+Dc2yAU2T8ypizyG=6AhYoWOh55odHA@mail.gmail.com>
 <472f85bd-42c2-40c6-abfd-b76924797069@ti.com> <CANLsYkzt9xUczxSU28u-TfZAAjr0ufZKXAj8Eqfq=45gufXW3w@mail.gmail.com>
 <f7ef3417-eb84-4467-ac72-a9bc8b0c81e8@foss.st.com> <21de8440-adf7-454b-acfc-06e50882e075@ti.com>
 <4c526816-b127-43e7-86e9-eee4dc1152bc@foss.st.com> <c6f68ab5-271a-41ed-b285-75b739f1edd6@amd.com>
 <87850f70-5275-4393-941f-d01146a9cffc@foss.st.com> <da3b79b7-9dad-48cb-b552-cf6df445899f@amd.com>
 <08c815f5-ccbe-404a-95a1-a549aac8a55d@amd.com>
In-Reply-To: <08c815f5-ccbe-404a-95a1-a549aac8a55d@amd.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Mon, 11 May 2026 11:58:46 -0600
X-Gm-Features: AVHnY4Ks4ecjbQ4FR9Bx6MhS_TSHS7dzL0j_vs5tX3-_TPSmKC4AqOnyubTOcKw
Message-ID: <CANLsYkz8HpM_8eS7DjN_jmYs4T7P9xY0jYmdiAx5WO=_1zvFpQ@mail.gmail.com>
Subject: Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
To: tanmay.shah@amd.com
Cc: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, Beleswar Prasad Padhi <b-padhi@ti.com>, 
	Shenwei Wang <shenwei.wang@nxp.com>, Andrew Lunn <andrew@lunn.ch>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
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

On Mon, 11 May 2026 at 10:47, Shah, Tanmay <tanmays@amd.com> wrote:
>
>
>
> On 5/5/2026 10:52 AM, Shah, Tanmay wrote:
> >
> >
> > On 5/5/2026 4:28 AM, Arnaud POULIQUEN wrote:
> >> Hi Tanmay,
> >>
> >> On 5/4/26 21:19, Shah, Tanmay wrote:
> >>>
> >>> Hello all,
> >>>
> >>> I have started reviewing this work as well.
> >>> Thanks Shenwei for this work.
> >>>
> >>> I have gone through only the current revision, and would like to prov=
ide
> >>> idea on how to achieve GPIO number multiplexing with the RPMsg protoc=
ol.
> >>> Also, have some bindings related question.
> >>>
> >>> Please see below:
> >>>
> >>> On 4/30/2026 11:40 AM, Arnaud POULIQUEN wrote:
> >>>>
> >>>>
> >>>> On 4/30/26 14:56, Beleswar Prasad Padhi wrote:
> >>>>> Hello Arnaud,
> >>>>>
> >>>>> On 30/04/26 13:05, Arnaud POULIQUEN wrote:
> >>>>>> Hello,
> >>>>>>
> >>>>>> On 4/29/26 21:20, Mathieu Poirier wrote:
> >>>>>>> On Wed, 29 Apr 2026 at 12:07, Padhi, Beleswar <b-padhi@ti.com> wr=
ote:
> >>>>>>>>
> >>>>>>>> Hi Mathieu,
> >>>>>>>>
> >>>>>>>> On 4/29/2026 11:03 PM, Mathieu Poirier wrote:
> >>>>>>>>> On Wed, 29 Apr 2026 at 10:53, Shenwei Wang <shenwei.wang@nxp.co=
m>
> >>>>>>>>> wrote:
> >>>>>>>>>>
> >>>>>>>>>>
> >>>>>>>>>>> -----Original Message-----
> >>>>>>>>>>> From: Mathieu Poirier <mathieu.poirier@linaro.org>
> >>>>>>>>>>> Sent: Wednesday, April 29, 2026 10:42 AM
> >>>>>>>>>>> To: Shenwei Wang <shenwei.wang@nxp.com>
> >>>>>>>>>>> Cc: Andrew Lunn <andrew@lunn.ch>; Padhi, Beleswar <b-
> >>>>>>>>>>> padhi@ti.com>; Linus
> >>>>>>>>>>> Walleij <linusw@kernel.org>; Bartosz Golaszewski
> >>>>>>>>>>> <brgl@kernel.org>; Jonathan
> >>>>>>>>>>> Corbet <corbet@lwn.net>; Rob Herring <robh@kernel.org>;
> >>>>>>>>>>> Krzysztof Kozlowski
> >>>>>>>>>>> <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Bjo=
rn
> >>>>>>>>>>> Andersson
> >>>>>>>>>>> <andersson@kernel.org>; Frank Li <frank.li@nxp.com>; Sascha H=
auer
> >>>>>>>>>>> <s.hauer@pengutronix.de>; Shuah Khan
> >>>>>>>>>>> <skhan@linuxfoundation.org>; linux-
> >>>>>>>>>>> gpio@vger.kernel.org; linux-doc@vger.kernel.org; linux-
> >>>>>>>>>>> kernel@vger.kernel.org;
> >>>>>>>>>>> Pengutronix Kernel Team <kernel@pengutronix.de>; Fabio Esteva=
m
> >>>>>>>>>>> <festevam@gmail.com>; Peng Fan <peng.fan@nxp.com>;
> >>>>>>>>>>> devicetree@vger.kernel.org; linux-remoteproc@vger.kernel.org;
> >>>>>>>>>>> imx@lists.linux.dev; linux-arm-kernel@lists.infradead.org; dl=
-
> >>>>>>>>>>> linux-imx <linux-
> >>>>>>>>>>> imx@nxp.com>; Bartosz Golaszewski <brgl@bgdev.pl>
> >>>>>>>>>>> Subject: [EXT] Re: [PATCH v13 3/4] gpio: rpmsg: add generic
> >>>>>>>>>>> rpmsg GPIO driver
> >>>>>>>>>>> On Tue, Apr 28, 2026 at 03:24:59PM +0000, Shenwei Wang wrote:
> >>>>>>>>>>>>
> >>>>>>>>>>>>> -----Original Message-----
> >>>>>>>>>>>>> From: Andrew Lunn <andrew@lunn.ch>
> >>>>>>>>>>>>> Sent: Monday, April 27, 2026 3:49 PM
> >>>>>>>>>>>>> To: Shenwei Wang <shenwei.wang@nxp.com>
> >>>>>>>>>>>>> Cc: Padhi, Beleswar <b-padhi@ti.com>; Linus Walleij
> >>>>>>>>>>>>> <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>;
> >>>>>>>>>>>>> Jonathan
> >>>>>>>>>>>>> Corbet <corbet@lwn.net>; Rob Herring <robh@kernel.org>;
> >>>>>>>>>>>>> Krzysztof
> >>>>>>>>>>>>> Kozlowski <krzk+dt@kernel.org>; Conor Dooley
> >>>>>>>>>>>>> <conor+dt@kernel.org>;
> >>>>>>>>>>>>> Bjorn Andersson <andersson@kernel.org>; Mathieu Poirier
> >>>>>>>>>>>>> <mathieu.poirier@linaro.org>; Frank Li <frank.li@nxp.com>;
> >>>>>>>>>>>>> Sascha
> >>>>>>>>>>>>> Hauer <s.hauer@pengutronix.de>; Shuah Khan
> >>>>>>>>>>>>> <skhan@linuxfoundation.org>; linux-gpio@vger.kernel.org; li=
nux-
> >>>>>>>>>>>>> doc@vger.kernel.org; linux-kernel@vger.kernel.org; Pengutro=
nix
> >>>>>>>>>>>>> Kernel Team <kernel@pengutronix.de>; Fabio Estevam
> >>>>>>>>>>>>> <festevam@gmail.com>; Peng Fan <peng.fan@nxp.com>;
> >>>>>>>>>>>>> devicetree@vger.kernel.org; linux- remoteproc@vger.kernel.o=
rg;
> >>>>>>>>>>>>> imx@lists.linux.dev; linux-arm- kernel@lists.infradead.org;
> >>>>>>>>>>>>> dl-linux-imx <linux-imx@nxp.com>; Bartosz Golaszewski
> >>>>>>>>>>>>> <brgl@bgdev.pl>
> >>>>>>>>>>>>> Subject: [EXT] Re: [PATCH v13 3/4] gpio: rpmsg: add generic
> >>>>>>>>>>>>> rpmsg
> >>>>>>>>>>>>> GPIO driver
> >>>>>>>>>>>>>>> struct virtio_gpio_response {
> >>>>>>>>>>>>>>>             __u8 status;
> >>>>>>>>>>>>>>>             __u8 value;
> >>>>>>>>>>>>>>> };
> >>>>>>>>>>>>>> It is the same message format. Please see the message
> >>>>>>>>>>>>>> definition
> >>>>>>>>>>>>> (GET_DIRECTION) below:
> >>>>>>>>>>>>>
> >>>>>>>>>>>>>> +   +-----+-----+-----+-----+-----+----+
> >>>>>>>>>>>>>> +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
> >>>>>>>>>>>>>> +   | 1   | 2   |port |line | err | dir|
> >>>>>>>>>>>>>> +   +-----+-----+-----+-----+-----+----+
> >>>>>>>>>>>>> Sorry, but i don't see how two u8 vs six u8 are the same
> >>>>>>>>>>>>> message format.
> >>>>>>>>>>>>>
> >>>>>>>>>>>> Some changes to the message format are necessary.
> >>>>>>>>>>>>
> >>>>>>>>>>>> Virtio uses two communication channels (virtqueues): one for
> >>>>>>>>>>>> requests and
> >>>>>>>>>>> replies, and a second one for events.
> >>>>>>>>>>>> In contrast, rpmsg provides only a single communication
> >>>>>>>>>>>> channel, so a
> >>>>>>>>>>>> type field is required to distinguish between different kind=
s
> >>>>>>>>>>>> of messages.
> >>>>>>>>>>>>
> >>>>>>>>>>>> Since rpmsg replies and events share the same message format=
,
> >>>>>>>>>>>> an additional
> >>>>>>>>>>> line is introduced to handle both cases.
> >>>>>>>>>>>> Finally, rpmsg supports multiple GPIO controllers, so a port
> >>>>>>>>>>>> field is added to
> >>>>>>>>>>> uniquely identify the target controller.
> >>>>>>>>>>>
> >>>>>>>>>>> I have commented on this before - RPMSG is already providing
> >>>>>>>>>>> multiplexing
> >>>>>>>>>>> capability by way of endpoints.  There is no need for a port
> >>>>>>>>>>> field.  One endpoint,
> >>>>>>>>>>> one GPIO controller.
> >>>>>>>>>>>
> >>>>>>>>>> You still need a way to let the remote side know which port th=
e
> >>>>>>>>>> endpoint maps to, either
> >>>>>>>>>> by embedding the port information in the message (the current
> >>>>>>>>>> way), or by sending it
> >>>>>>>>>> separately.
> >>>>>>>>>>
> >>>>>>>>> An endpoint is created with every namespace request.  There
> >>>>>>>>> should be
> >>>>>>>>> one namespace request for every GPIO controller, which yields a
> >>>>>>>>> unique
> >>>>>>>>> endpoint for each controller and eliminates the need for an ext=
ra
> >>>>>>>>> field to identify them.
> >>>>>>>>
> >>>>>>>>
> >>>>>>>> Right, but this can still be done by just having one namespace
> >>>>>>>> request.
> >>>>>>>> We can create new endpoints bound to an existing namespace/
> >>>>>>>> channel by
> >>>>>>>> invoking rpmsg_create_ept(). This is what I suggested here too:
> >>>>>>>> https://lore.kernel.org/all/29485742-6e49-482e-
> >>>>>>>> b73d-228295daaeec@ti.com/
> >>>>>>>>
> >>>>>>>
> >>>>>>> I will look at your suggestion (i.e link above) later this week o=
r
> >>>>>>> next week.
> >>>>>>>
> >>>>>>>> My mental model looks like this for the complete picture:
> >>>>>>>>
> >>>>>>>> 1. namespace/channel#1 =3D rpmsg-io
> >>>>>>>>        a. ept1 -> gpio-controller@1
> >>>>>>>>        b. ept2 -> gpio-controller@2
> >>>>>>>>
> >>>
> >>> If my understanding of what gpio-controller is right, than this won't
> >>> work. We need one rpmsg channel per gpio-controller, and in most case=
s
> >>> there will be only one GPIO-controller on the remote side. If there a=
re
> >>> multiple or multiple instances of same controller, than we need separ=
ate
> >>> channel name for that controller just like we would have separate dev=
ice
> >>> on the Linux.
> >>
> >> As done in ehe rpmsg_tty driver it could be instantiated several times=
 with
> >> the same channel/service name. This would imply a specific rpmsg to
> >> retreive
> >> the gpio controller index from the remote side.
> >>>
> >>>>>>>
> >>>>>>> I've asked for one endpoint per GPIO controller since the very
> >>>>>>> beginning.  I don't yet have a strong opinion on whether to use o=
ne
> >>>>>>> namespace request per GPIO controller or a single request that sp=
ins
> >>>>>>> off multiple endpoints.  I'll have to look at your link and
> >>>>>>> reflect on
> >>>>>>> that.  Regardless of how we proceed on that front, multiplexing n=
eeds
> >>>>>>> to happen at the endpoint level rather than the packet level.
> >>>>>>> This is
> >>>>>>> the only way this work can move forward.
> >>>>>>>
> >>>>>>
> >>>>>> I would be more in favor of Mathieu=E2=80=99s proposal: =E2=80=9CA=
n endpoint is
> >>>>>> created with every namespace request.=E2=80=9D
> >>>>>>
> >>>>>> If the endpoint is created only on the Linux side, how do we match
> >>>>>> the Linux endpoint address with the local port field on the remote
> >>>>>> side?
> >>>>>
> >>>>>
> >>>>> Simply by sending a message to the remote containing the newly crea=
ted
> >>>>> endpoint and the port idx. Note that is this done just one time, af=
ter
> >>>>> this
> >>>>> Linux need not have the port field in the message everytime its sen=
ding
> >>>>> a message.
> >>>>>
> >>>>>>
> >>>>>> With a multi-namespace approach, the namespace could be rpmsg-io-
> >>>>>> [addr], where [addr] corresponds to the GPIO controller address in
> >>>>>> the DT. This would:
> >>>>>
> >>>>>
> >>>>> You will face the same problem in this case also that you asked abo=
ve:
> >>>>> "how do we match the Linux endpoint address with the local port fie=
ld
> >>>>> on the remote side?"
> >>>>
> >>>> Sorry I probably introduced confusion here
> >>>> my sentence should be;
> >>>>   With a multi-namespace approach, the namespace could be rpmsg-io-
> >>>> [port],
> >>>>   where [port] corresponds to the GPIO controller port in the DT.
> >>>>
> >>>>
> >>>> For instance:
> >>>>
> >>>>        rpmsg {
> >>>>          rpmsg-io {
> >>>>            #address-cells =3D <1>;
> >>>>            #size-cells =3D <0>;
> >>>>
> >>>>            gpio@25 {
> >>>>              compatible =3D "rpmsg-gpio";
> >>>>              reg =3D <25>;
> >>>>              gpio-controller;
> >>>>              #gpio-cells =3D <2>;
> >>>>              #interrupt-cells =3D <2>;
> >>>>              interrupt-controller;
> >>>>            };
> >>>>
> >>>>            gpio@32 {
> >>>>              compatible =3D "rpmsg-gpio";
> >>>>              reg =3D <32>;
> >>>>              gpio-controller;
> >>>>              #gpio-cells =3D <2>;
> >>>>              #interrupt-cells =3D <2>;
> >>>>              interrupt-controller;
> >>>>            };
> >>>>          };
> >>>>        };
> >>>>
> >>>>   rpmsg-io-25  would match with gpio@25
> >>>>   rpmsg-io-32  would match with gpio@32
> >>>>
> >>>
> >>> The problem with this approach is, we will endup creating way too man=
y
> >>> RPMsg devices/channels. i.e. one channel per one GPIO. That limits ho=
w
> >>> many GPIOs can be handled by remote from memory perspective. At
> >>> somepoint we might just run-out of number ept & channels created by t=
he
> >>> remote. As of now, open-amp library supports 128 epts I think.
> >>
> >> Right, I proposed a solution in my previous answer to Beleswar who has
> >> the same concern.
> >>
> >>>
> >>>>
> >>>>>
> >>>>> Because the endpoint that is created on a namespace request is also
> >>>>> dynamic in nature. How will the remote know which endpoint addr
> >>>>> Linux allocated for a namespace that it announced?
> >>>>>
> >>>>> As an example/PoC, I created a firmware example which announces
> >>>>> 2 name services to Linux, one is the standard "rpmsg_chrdev" and
> >>>>> the other is a TI specific name service "ti.ipc4.ping-pong". You ca=
n
> >>>>> see it created 2 different addresses (0x400 and 0x401) for each of
> >>>>> the name service request from the same firmware:
> >>>>>
> >>>>> root@j784s4-evm:~# dmesg | grep virtio0 | grep -i channel
> >>>>> [    9.290275] virtio_rpmsg_bus virtio0: creating channel
> >>>>> ti.ipc4.ping-pong addr 0xd
> >>>>> [    9.311230] virtio_rpmsg_bus virtio0: creating channel rpmsg_chr=
dev
> >>>>> addr 0xe
> >>>>> [    9.496645] rpmsg_chrdev virtio0.rpmsg_chrdev.-1.14: DEBUG: Chan=
nel
> >>>>> formed from src =3D 0x400 to dst =3D 0xe
> >>>>> [    9.707255] rpmsg_client_sample virtio0.ti.ipc4.ping-pong.-1.13:
> >>>>> new channel: 0x401 -> 0xd!
> >>>>>
> >>>>> So in this case, rpmsg-io-1 can have different ept addr than rpmsg-=
io-2
> >>>>> Back to same problem. Simple solution is to reply to remote with th=
e
> >>>>> created ept addr and the index.
> >>>>
> >>>> That why I would like to suggest to use the name service field to
> >>>> identify the port/controller, instead of the endpoint address.
> >>>>>
> >>>>>>
> >>>>>> - match the RPMsg probe with the DT,
> >>>>>
> >>>>>
> >>>>> We can probe from all controllers with a single name service
> >>>>> announcement too.
> >>>>>
> >>>>>> - provide a simple mapping between the port and the endpoint on bo=
th
> >>>>>> sides,
> >>>>>
> >>>>>
> >>>>> We are trying to get rid of this mapping from Linux side to adapt
> >>>>> the gpio-virtio design.
> >>>>>
> >>>>>> - allow multiple endpoints on the remote side,
> >>>>>
> >>>>>
> >>>>> We can support this as well with single nameservice model.
> >>>>> There is no limitation. Remote has to send a message with
> >>>>> its newly created ept that's all.
> >>>>>
> >>>>>> - provide a simple discovery mechanism for remote capabilities.
> >>>>>
> >>>>>
> >>>>> A single announcement: "rpmsg-io" is also discovery mechanism.
> >>>>>
> >>>>> Feel free to let me know if you have concerns with any of the
> >>>>> suggestions!
> >>>>
> >>>> My only concern, whatever the solution, is that we find a smart
> >>>> solution to associate the correct endpoint with the correct GPIO
> >>>> port/controller defined in the DT.
> >>>>
> >>>> I may have misunderstood your solution. Could you please help me
> >>>> understand your proposal by explaining how you would handle three
> >>>> GPIO ports defined in the DT, considering that the endpoint
> >>>> addresses on the Linux side can be random?
> >>>> If I assume there is a unique endpoint on the remote side,
> >>>> I do not understand how you can match, on the firmware side,
> >>>> the Linux endpoint address to the GPIO port.
> >>>>
> >>>> Thanks and Regards,Arnaud
> >>>>
> >>>>>
> >>>>> Thanks,
> >>>>> Beleswar
> >>>>>
> >>>>>>
> >>>>>> Regards,
> >>>>>> Arnaud
> >>>>>>
> >>>>>>>> 2. namespace/channel#2 =3D rpmsg-i2c
> >>>>>>>>        a. ept1 -> i2c@1
> >>>>>>>>        b. ept2 -> i2c@2
> >>>>>>>>        c. ept3 -> i2c@3
> >>>>>>>>
> >>>>>>>> etc...
> >>>>>>>>
> >>>
> >>> Just want to clear-up few terms before I jump to the solution:
> >>>
> >>> **RPMsg channel/device**:
> >>>    - These are devices announced by the remote processor, and created=
 by
> >>> linux. They are created at: /sys/bus/rpmsg/devices
> >>>    - The channel format: <name>.<src ept>.<dst ept>
> >>>
> >>> **RPMsg endpoint**:
> >>>    - Endpoint is differnt than channel. Single channel can have multi=
ple
> >>> endpoints, and represented in the linux with: /dev/rpmsg? devices.
> >>>
> >>> To create endpoint device, we have rpmsg_create_ept API, which takes
> >>> channel information as input, which has src-ept, dst-ept.
> >>>
> >>> Following is proposed solution:
> >>>
> >>> 1) Assign RPMsg channel/device per rpmsg-gpio controller (Not per GPI=
O
> >>> pin/port).
> >>>    - In our case that would be, single rpmsg-io node. (That makes me
> >>> question if bindings are correct or not).
> >>>
> >>> 2) Assign GPIO number as src ept.
> >>>
> >>> i.e. *rpmsg-io.<GPIO number>.<dst ept>*. Do not randomly assign src
> >>> endpoint.
> >>>
> >>> Now, RPMSG channel by spec reserves first 1024 endpoints [1], so we c=
an
> >>> add 1024 offset to the GPIO number:
> >>>
> >>> so, when calling rpmsg_create_ept() API, we assing src_endpoint as:
> >>> (GPIO_NUMBER + RPMSG_RESERVED_ADDRESSES)
> >>>
> >>> Now on the remote side, there is single channel and only single-endpo=
int
> >>> is needed that is mapped to the rpmsg-io channel callback.
> >>>
> >>> That callback will receive all the payloads from the Linux, which wil=
l
> >>> have src-ept i.e. (RPMSG_RESERVED_ADDRESSES + GPIO_NUMBER).
> >>
> >>
> >> Interesting approach. I also tried to find a similar solution.
> >>
> >> The question here is: how can we guarantee continuous addresses? Given
> >> the static and dynamic allocation of endpoint addresses that are
> >> implemented, my conclusion was that it is not reliable enough.
> >>
> >> but perhaps I missed something...
> >>
> >>>
> >>> It can retrieve GPIO_NUMBER easily, and convert to appropriate pin ba=
sed
> >>> on platform specific logic.
> >>>
> >>> This doesn't need PORT information at all. Also it makes sure that
> >>> remote is using only single-endpoint so not much memory is used.
> >>>
> >>> *Example*:
> >>> If only rpmsg-gpio channel is created by the remote side, than follow=
ing
> >>> is the representation of the devices when GPIO 25, 26, 27 is assigned=
 to
> >>> the rpmsg-io controller:
> >>>
> >>> Linux                                                      Remote
> >>>
> >>> rpmsg-channel: rpmsg-gpio.0x400.0x400
> >>>
> >>> /dev/rpmsg0 - GPIO25 ept (rpmsg-gpio.0x419.0x400)-|
> >>>                                                    |
> >>> /dev/rpmsg1 - GPIO26 ept (rpmsg-gpio.0x41a.0x400)-|-> rpmsg-gpio.*.0x=
400
> >>>                                                    |
> >>> /dev/rpmsg2 - GPIO27 ept (rpmsg-gpio.0x41b.0x400)-|  0x400 ept callba=
ck.
> >>>
> >>>
> >>> *On remote side*:
> >>>
> >>> ept_0x400_callback(..., int src_ept, ...,)
> >>> {
> >>>     int gpio_num =3D src_ept - RPMSG_RESERVED_ADDRESSES;
> >>>     // platform specific logic to convert gpio num to proper pin,
> >>>     // just like you would convert gpio num to pin on a linux gpio
> >>> controller.
> >>> }
> >>>
> >>> My question on the binding:
> >>>
> >>> Why each GPIO is represented with the separate node? I think rpmsg-gp=
io
> >>> can be represented just any other GPIO controller? Please let me know=
 if
> >>> I am missing something. So rpmsg channel/rpmsg device is not created =
per
> >>> GPIO, but per controller. GPIO number multiplexing should be done wit=
h
> >>> rpmsg src ept, that removes the need of having each GPIO as a separat=
e
> >>> node.
> >>>
> >>>
> >>> rpmsg_gpio: rpmsg-gpio@0 {
> >>>         compatible =3D "rpmsg-gpio";
> >>>         reg =3D <0>;
> >>>         gpio-controller;
> >>>         #gpio-cells =3D <2>;
> >>>         #interrupt-cells =3D <2>;
> >>>         interrupt-controller;
> >>>     };
> >>>
> >>> Then in DT, use like regular GPIO, but with the rpmsg-gpio controller=
:
> >>>
> >>> rpmsg-gpios =3D <&rpmsg_gpio (GPIO NUM) (flags)>;
> >>>
> >>> If the intent to create separate gpio nodes was only for the channel
> >>> creation, then it's not really needed.
> >>>
> >>> [1]
> >>> https://github.com/torvalds/linux/
> >>> blob/6d35786de28116ecf78797a62b84e6bf3c45aa5a/drivers/rpmsg/
> >>> virtio_rpmsg_bus.c#L136
> >>>
> >>
> >> It is already the case. bindings declare GPIO controllers, not directl=
y
> >> GPIOs in:
> >>
> >> [PATCH v13 2/4] dt-bindings: remoteproc: imx_rproc: Add "rpmsg" subnod=
e
> >> support
> >>
> >> The discussion is around having an unique RPmsg endpoint for all
> >> GPIO controller or one RPmsg endpoint per GPIO controller.
> >>
> >
> > Endpoint where remote side or linux side?
> >
> > If unique endpoint on remote side per gpio controller then it makes sen=
se.
> >
> > Unique endpoint on linux side doesn't make sense. Instead, unique
> > channel per gpio controller makes sense, and each channel will have
> > multiple endpoints on linux side. As I replied to Beleswar on the other
> > email, I will copy past my answer here too:
> >
> >
> > To be more specific:
> >
> > Linux:                               remote:
> >
> > ch1: rpmsg-gpio.-1.1024 ->     gpio-controller@1024
> >     - gpio-line ept1
> >     - gpio-line ept2    ->     They all map to same callback_ept_1024.
> >     - gpio-line ept3
> >
> > ch2: rpmsg-gpio.-1.1025 ->     gpio-controller@1025
> >     - gpio-line ept1
> >     - gpio-line ept2    ->     They all map to same callback_ept_1025.
> >     - gpio-line ept3
> >
>
>
> Hi Mathieu,
>
> So upon more brain storming in this approach I found limitation:
>
> This approach won't work if host OS is any other OS but Linux. For
> example, if the remote OS is zephyr/baremetal using open-amp, then Only
> Linux <-> zephyr combination will work, and we won't be able to re-use
> this approach for zephyr <-> zephyr use case. The concept of rpmsg
> channel/device exist only in the linux kernel implementation. This
> brings another question: Should the protocol we decide work on other use
> cases as well? Or Linux must be the Host OS for this protocol ?
>

Linux and Zephyr are very distinct OS, each with their own subsystems
and characteristics.  The design we choose here involves RPMSG and,
inherently, Linux.  We can't make decisions based on what may
potentially happen in Zephyr.

>
> I think your & Arnaud's proposed approach of single endpoint per
> gpio-controller on both side makes more sense, as it will work
> regardless of any OS on host or remote side.
>

Arnaud, Beleswar, Andrew and I are all advocating for one endpoint per
GPIO controller.  The remaining issue it about the best way to work
out source and destination addresses between Linux and the remote
processor.  I'm running out of time for today but I'll return to this
thread with a final analysis by the end of the week.

> To be more specific this will look like following:
>
> Host (Linux)                       Remote (baremetal/RTOS)
>
> rpmsg ch/device 1:
>     - rpmsg ept 1   <------>     rpmsg ept 1 gpio-controller 0
>
> rpmsg ch/device 2:
>      - rpmsg ept 2   <------>     rpmsg ept 2 gpio-controller 1
>
>
> The question is, how to decide src ept, and dest ept on both sides?
> I still think it should be static endpoints.
>
> I will get back with more reasoning on that.
>
> > On the remote side, we have to hardcode Which rpmsg controller is mappe=
d
> > to which endpoint.
> >
> >> Or did I misunderstand your questions?
> >>
> >> Thanks,
> >> Arnaud
> >>
> >
> >
> > I gave this patch more time yesterday, and I think the 'reg' property
> > should represent remote endpoint, instead of the gpio-controller index.
> >
> > So in this approach remote implementation is expected to provide
> > hard-coded (static) endpoints for each gpio-controller instance, and
> > that same number should be represented with the 'reg' property.
> >
> > On remote side:
> >
> > #define RPMSG_GPIO_0_CONTROLLER_EPT (RPMSG_RESERVED_ADDRESSES + 1) // 1=
024
> >
> > ept_1024_callback() {
> >
> >       // handle appropriate gpio port ()
> >
> > }
> >
> > On linux side:
> >
> > So new representation of controller:
> >
> >  rpmsg_gpio_0:   gpio@1024 {
> >              compatible =3D "rpmsg-gpio";
> >              reg =3D <1024>;
> >              gpio-controller;
> >              #gpio-cells =3D <2>;
> >              #interrupt-cells =3D <2>;
> >              interrupt-controller;
> >           };
> >
> >  rpmsg_gpio_1:   gpio@1025 {
> >              compatible =3D "rpmsg-gpio";
> >              reg =3D <1025>;
> >              gpio-controller;
> >              #gpio-cells =3D <2>;
> >              #interrupt-cells =3D <2>;
> >              interrupt-controller;
> >           };
> >
> > gpios =3D <&rpmsg_gpio_0 (GPIO NUM or PIN) flags>,
> >       <&rpmsg_gpio_1 (GPIO NUM or PIN) flags>;
> >
> > Now in the linux driver:
> >
> > You can easily retrieve destination endpoint when we want to send the
> > command to the gpio controller via device's "reg" property.
> >
> > This approach also provides built-in security as well. Because now
> > gpio-controller instance is hardcoded with the endpoint callback, it
> > can't be modified/addressed without changing the 'reg' property.
> >
> > Just like you wouldn't change device address for the instance of the
> > gpio-controller right?
> >
> > This approach can be easily adapted to all the other rpmsg controllers
> > as well.
> >
> > So, dynamic endpoint allocation doesn't make sense in this case. Dynami=
c
> > endpoint allocation makes more sense for user-space apps which don't
> > really care about endpoints and only payloads.
> >
> > But, here we are multiplexing device-addresses with endpoints, and so i=
t
> > has to be fixed, and presented via 'reg' property. So, firmware can't
> > change device-address without Linux knowing it.
> >
> > Thanks,
> > Tanmay
> >
> >
> >>
> >>>>>>>> This way device groups are isolated with each channel/namespace,=
 and
> >>>>>>>> instances within each device groups are also respected with spec=
ific
> >>>>>>>> endpoints.
> >>>>>>>>
> >>>>>>>> Thanks,
> >>>>>>>> Beleswar
> >>>>>>>>
> >>>>>>>
> >>>>>>
> >>>>
> >>>>
> >>>
> >>
> >
>
