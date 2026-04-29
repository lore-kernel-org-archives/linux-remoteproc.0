Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB0A33ADAE
	for <linux-remoteproc@vger.kernel.org>; Wed, 29 Apr 2026 19:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777490453; cv=pass; b=lNfcC6hNq3qmeD9up8+6/appGs7EQCo5YHxvLEbwQfgKq/mqEdg/5JIZYp6ck3L2BFyYeqCttRpdkQRQ5VqfwcJ+F0g4O+7EQuulHdzyOdMtIi5ZSrPPhz7/GhDzCAM0amKgD03QDsFieNNyt1qiPa+c12m4XUEWF+hukXA7r5w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777490453; c=relaxed/simple;
	bh=braCilAYzfWSvAWMEDj3jzrbXNaOgTJxXed3C2N+6Jg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bobwk3ZRv/wDv08dUMgOJ0CV8VH9NE+aOvhU08pwoXGV9K06uwlDz2UX93WOJOXPb5Y8VLnBjGTeZdyzqMVM61KkBitl8FSqmQZTjJE6jAaMAOonJQC4SscLS8NsIr7RJcXxbPMEh3dRCLOO8SWZWc9Zm9MhBkUwZ3y3f/K9FA0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J2foeINB; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J2foeINB"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-672c12e95e9so225123a12.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 29 Apr 2026 12:20:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777490450; cv=none;
        d=google.com; s=arc-20240605;
        b=JSoZKRQIdL+GtpAE10TJNk+ll216M0/bb0VKjgmAIKaUlWtCBDPwcyl7gJdg9k7v5R
         U2Lj67+yE1p0s0Sd8vDp/SwG77q+BlCEEIxjqoUvjsqxjx/bsCC1iuVJJ5WyK211k9mQ
         7TGj3qexmooKQH/gzH62uwnzPv3YgPbH5qtCfpOY+AZmPZskOoIWTOlMeuk5FGFp6WqT
         pJHgDN2O+daXJqxwO4sni1DIQaKkbErrAB5+T+ZEO7nEp6scQFV36d0ciAkO/yabndMp
         VX/nIIwFXPbsLh38L2BdMsfI9cc8CBSfA3uj5DJfHo0Yu17sCyKbHfUIU8GreYc9Tvkg
         3aaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=P1oUs/Abu5g3UxUIAO0ZwpBJwwKm0pg05ZGOCVCeRmU=;
        fh=6Bl8oC7OjYgX8JENhPw3DMQFduAeUFm7qJuPnhnmhps=;
        b=LquXjNI1D1/DBHO+SFJw9GOoRlUUxGb0sHJ3334Mhq54v1LWl7ETHDnNbzk6iTt9EZ
         Rkv7Ev45dAKe8LthMVK+kvh77rb1LhyVpk3i8dT98TWy6BfnHINlJsAuQU1UvqjxFfTl
         r1dUoxwjrr3/df/WwZrqI8gPE4FHI3lsyjH3ndO6xh4LzID/vtMoSnj2T8+8SGOEdA/D
         BmHuU9TmgFNvlmRpuFQBS6LgpukUr3oTo/AvFpNKjRZDUYc6VAfjU1+IBMmme2AJzQSm
         iRl5UNC7EUvHXvukRMhVJpB8x4NL8CUqpin2KiJIPYDW0VkBW+LETn4ZCBfI4jfFb6yT
         Oigw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777490450; x=1778095250; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=P1oUs/Abu5g3UxUIAO0ZwpBJwwKm0pg05ZGOCVCeRmU=;
        b=J2foeINBIxLUD/f5R5WCd8ndy0IbWzi/9CzJczqdjXtlw3YvhYiQE77BGYYg802I1z
         FU7njl6BiHtLe3JY6/7kGsC0q7dMD10OotdhXQE1POQ1294rIB/dSnUyv8U9JWzg9I7z
         ei2wT5CCNdjjv7V/7nPaZqlx/s5ohLlUREbCnoy6ZxM5WPZJ3do4UglWe/Q5L6Yh/wG5
         +lVzgL382uWvsVNf56voBRSwgdyTSRe4OQzSinlaX3hYxvfO8bEIDCu0H+9RV5Hp6pQk
         wahqe1IZeEtXZfap/DQ8iXjAABs1J6tBCF+iq5oazzubo8McZnAlVggbYlGFlfY71b7u
         Ie3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777490450; x=1778095250;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P1oUs/Abu5g3UxUIAO0ZwpBJwwKm0pg05ZGOCVCeRmU=;
        b=A8NQwom+EgQCn67YdOuxYiO5tjI1nkLyrTbVNcCQOexr7Si19Q1g9rcyTdPVNT1YY5
         1Q8NLqPL+FksPmC+vIc0QR2UI0h716FQ41W6l6Irw6YIH9JEZEWjaHZPOVwNSihSpP1W
         xi8I+QogCyyY5MZUmAzqAz020SrWUhUn6IXXnNRjROn12XHDORKD5ykncM8NJYafVNTJ
         Qul/+lGYSCtV4HS/KDHZ7TYPR50ImVgrTvdFMCUeW7Ywac9QiXZ049QHFEySW2zNexBX
         FXF7seWr3RTZ/AlcF5vJuIa7tq3egyKQ8q/vhG1aeDErHk4TXYw20uSWF19DlohJS6Jc
         hfyA==
X-Forwarded-Encrypted: i=1; AFNElJ8V+t8arUxOE/GPr0xWs9al2HmsEVVtRYCq5Ys9p2PdzDZHRFKUZrSUXNNP5YmTOEzgNp8DHY162G9eLgBnY0Z+@vger.kernel.org
X-Gm-Message-State: AOJu0YzfGzZhWaNt8WEH3LnietArg6udIOKSQcWdPhOpEWfhvtBUDicT
	wRTCT0mb0cMKwkbqD5sWzLcHfzYsbxFZzAGsNTBWas0iFD2iEf1dha1NunSdSj+DFThQcF4oNma
	VGqvMtELrCEQo5XJt4YDxtfVHTe8nppZINjl5cbcMYg==
X-Gm-Gg: AeBDievWmTNA4NQd9oTP5FIQrpdT02jLJcoDDHe0sSmMdbAM+1ldJPizHZJTlvU1g4I
	NLKTLk25U4TVr4yaDpJayN/u8He2sH1gWgg5Gdx6kHl4bY039ZMxr1oFuRQd99JDT5tMF5ON5Cr
	8rhHVRggZQqGql+OEdA4GZbH85oScHkFeLOrgesHIIdn/QufGDMhGZ3fUOJoXAfdnp9AM8W6JI/
	XPD7j1/s41M1BZ42X1Gqxczx4TlxNCfy4zUa3p9vmoPwi8uMkX4oXwAFKB9OmylW26JzlV9W74x
	Tlz1m6U8YoiXFtRiffs2ETSCsDQfv0fU5iKdSVvI5iV72DDQP8dW3AucunTGjGE=
X-Received: by 2002:a05:6402:5024:b0:674:2565:f27a with SMTP id
 4fb4d7f45d1cf-679bb095b4amr4292362a12.19.1777490449661; Wed, 29 Apr 2026
 12:20:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260422212849.1240591-1-shenwei.wang@nxp.com>
 <20260422212849.1240591-4-shenwei.wang@nxp.com> <22fb5fac-2568-42be-a7e3-7e89d0017eb3@ti.com>
 <PAXPR04MB91850A11C58419C03909145F89362@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <6412a758-4560-4cf1-a0d0-5b24d1a715f1@lunn.ch> <PAXPR04MB9185009A17DFDF3D6C8B44E789362@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <6e01e114-e336-4744-b6b4-563ec42e321b@lunn.ch> <PAXPR04MB9185A098D894B6A6EBCC13F889372@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <afImuoeHolxGgw3H@p14s> <PAXPR04MB9185F2F6DDB55AC56C92D63B89342@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <CANLsYkwvL0Z3+12MD=J+Dc2yAU2T8ypizyG=6AhYoWOh55odHA@mail.gmail.com> <472f85bd-42c2-40c6-abfd-b76924797069@ti.com>
In-Reply-To: <472f85bd-42c2-40c6-abfd-b76924797069@ti.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed, 29 Apr 2026 13:20:38 -0600
X-Gm-Features: AVHnY4LS0q8rVhCWEM9jcgreDzRj6jHlyTeei6srw2bJ0kIdi0Mr181JcAK3ylA
Message-ID: <CANLsYkzt9xUczxSU28u-TfZAAjr0ufZKXAj8Eqfq=45gufXW3w@mail.gmail.com>
Subject: Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
To: "Padhi, Beleswar" <b-padhi@ti.com>
Cc: Shenwei Wang <shenwei.wang@nxp.com>, Andrew Lunn <andrew@lunn.ch>, 
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

On Wed, 29 Apr 2026 at 12:07, Padhi, Beleswar <b-padhi@ti.com> wrote:
>
> Hi Mathieu,
>
> On 4/29/2026 11:03 PM, Mathieu Poirier wrote:
> > On Wed, 29 Apr 2026 at 10:53, Shenwei Wang <shenwei.wang@nxp.com> wrote:
> >>
> >>
> >>> -----Original Message-----
> >>> From: Mathieu Poirier <mathieu.poirier@linaro.org>
> >>> Sent: Wednesday, April 29, 2026 10:42 AM
> >>> To: Shenwei Wang <shenwei.wang@nxp.com>
> >>> Cc: Andrew Lunn <andrew@lunn.ch>; Padhi, Beleswar <b-padhi@ti.com>; Linus
> >>> Walleij <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>; Jonathan
> >>> Corbet <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof Kozlowski
> >>> <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Bjorn Andersson
> >>> <andersson@kernel.org>; Frank Li <frank.li@nxp.com>; Sascha Hauer
> >>> <s.hauer@pengutronix.de>; Shuah Khan <skhan@linuxfoundation.org>; linux-
> >>> gpio@vger.kernel.org; linux-doc@vger.kernel.org; linux-kernel@vger.kernel.org;
> >>> Pengutronix Kernel Team <kernel@pengutronix.de>; Fabio Estevam
> >>> <festevam@gmail.com>; Peng Fan <peng.fan@nxp.com>;
> >>> devicetree@vger.kernel.org; linux-remoteproc@vger.kernel.org;
> >>> imx@lists.linux.dev; linux-arm-kernel@lists.infradead.org; dl-linux-imx <linux-
> >>> imx@nxp.com>; Bartosz Golaszewski <brgl@bgdev.pl>
> >>> Subject: [EXT] Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
> >>> On Tue, Apr 28, 2026 at 03:24:59PM +0000, Shenwei Wang wrote:
> >>>>
> >>>>> -----Original Message-----
> >>>>> From: Andrew Lunn <andrew@lunn.ch>
> >>>>> Sent: Monday, April 27, 2026 3:49 PM
> >>>>> To: Shenwei Wang <shenwei.wang@nxp.com>
> >>>>> Cc: Padhi, Beleswar <b-padhi@ti.com>; Linus Walleij
> >>>>> <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>; Jonathan
> >>>>> Corbet <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof
> >>>>> Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>;
> >>>>> Bjorn Andersson <andersson@kernel.org>; Mathieu Poirier
> >>>>> <mathieu.poirier@linaro.org>; Frank Li <frank.li@nxp.com>; Sascha
> >>>>> Hauer <s.hauer@pengutronix.de>; Shuah Khan
> >>>>> <skhan@linuxfoundation.org>; linux-gpio@vger.kernel.org; linux-
> >>>>> doc@vger.kernel.org; linux-kernel@vger.kernel.org; Pengutronix
> >>>>> Kernel Team <kernel@pengutronix.de>; Fabio Estevam
> >>>>> <festevam@gmail.com>; Peng Fan <peng.fan@nxp.com>;
> >>>>> devicetree@vger.kernel.org; linux- remoteproc@vger.kernel.org;
> >>>>> imx@lists.linux.dev; linux-arm- kernel@lists.infradead.org;
> >>>>> dl-linux-imx <linux-imx@nxp.com>; Bartosz Golaszewski
> >>>>> <brgl@bgdev.pl>
> >>>>> Subject: [EXT] Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg
> >>>>> GPIO driver
> >>>>>>> struct virtio_gpio_response {
> >>>>>>>          __u8 status;
> >>>>>>>          __u8 value;
> >>>>>>> };
> >>>>>> It is the same message format. Please see the message definition
> >>>>> (GET_DIRECTION) below:
> >>>>>
> >>>>>> +   +-----+-----+-----+-----+-----+----+
> >>>>>> +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
> >>>>>> +   | 1   | 2   |port |line | err | dir|
> >>>>>> +   +-----+-----+-----+-----+-----+----+
> >>>>> Sorry, but i don't see how two u8 vs six u8 are the same message format.
> >>>>>
> >>>> Some changes to the message format are necessary.
> >>>>
> >>>> Virtio uses two communication channels (virtqueues): one for requests and
> >>> replies, and a second one for events.
> >>>> In contrast, rpmsg provides only a single communication channel, so a
> >>>> type field is required to distinguish between different kinds of messages.
> >>>>
> >>>> Since rpmsg replies and events share the same message format, an additional
> >>> line is introduced to handle both cases.
> >>>> Finally, rpmsg supports multiple GPIO controllers, so a port field is added to
> >>> uniquely identify the target controller.
> >>>
> >>> I have commented on this before - RPMSG is already providing multiplexing
> >>> capability by way of endpoints.  There is no need for a port field.  One endpoint,
> >>> one GPIO controller.
> >>>
> >> You still need a way to let the remote side know which port the endpoint maps to, either
> >> by embedding the port information in the message (the current way), or by sending it
> >> separately.
> >>
> > An endpoint is created with every namespace request.  There should be
> > one namespace request for every GPIO controller, which yields a unique
> > endpoint for each controller and eliminates the need for an extra
> > field to identify them.
>
>
> Right, but this can still be done by just having one namespace request.
> We can create new endpoints bound to an existing namespace/channel by
> invoking rpmsg_create_ept(). This is what I suggested here too:
> https://lore.kernel.org/all/29485742-6e49-482e-b73d-228295daaeec@ti.com/
>

I will look at your suggestion (i.e link above) later this week or next week.

> My mental model looks like this for the complete picture:
>
> 1. namespace/channel#1 = rpmsg-io
>     a. ept1 -> gpio-controller@1
>     b. ept2 -> gpio-controller@2
>

I've asked for one endpoint per GPIO controller since the very
beginning.  I don't yet have a strong opinion on whether to use one
namespace request per GPIO controller or a single request that spins
off multiple endpoints.  I'll have to look at your link and reflect on
that.  Regardless of how we proceed on that front, multiplexing needs
to happen at the endpoint level rather than the packet level.  This is
the only way this work can move forward.

> 2. namespace/channel#2 = rpmsg-i2c
>     a. ept1 -> i2c@1
>     b. ept2 -> i2c@2
>     c. ept3 -> i2c@3
>
> etc...
>
> This way device groups are isolated with each channel/namespace, and
> instances within each device groups are also respected with specific
> endpoints.
>
> Thanks,
> Beleswar
>
