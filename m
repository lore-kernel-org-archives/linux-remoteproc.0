Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75FC16F0FE
	for <linux-remoteproc@vger.kernel.org>; Wed, 18 Mar 2026 19:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773860641; cv=pass; b=dKcKcEsEbsKpBDHGgkxO4Zo80MQcXCtS2NxEpheeZQ08yq58dBPO5vxtfy3Lynct5Vfkxf2QgORA3UKXvKuGwGxx7QWfkuOwGPJVq1zwCLJ3JXZ5AdGfgx8Rh2Ffle0Zg5hZ7ngfU+ZymbVIljJzevP27B5kKlrisv2JuyVg5qs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773860641; c=relaxed/simple;
	bh=T1+fx/WLpTfB9SQJibZ6lWXK3GEnUtk5g7rLlawTyh0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nr5CY5+7DamhG069gRlmTCt0VJQannfrhi2RCBxhsd/hDhD/ZMMjpB6O4B/SszysDB7r1fYQJXgSho6sMpe8f7TTWnQOksHjIsd2W/utuITr17J6mOyHlUGso1V56N3nJSHwcOjxu1HkWs/UgngCo/+ewiIXXzipuaJCLCie6r4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dnP9N4NH; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dnP9N4NH"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b8f97c626aaso19147566b.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 18 Mar 2026 12:03:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773860638; cv=none;
        d=google.com; s=arc-20240605;
        b=ETyA4OzKcUIxGRzpk57wgbTV5csrG3sfIrhMSHB7Ajd7+I5N5e9O7cOTyswZtfKg0t
         Vc++jrVLz3AhKcGylLu4p55RdKq+hI8gmcVy9CDLYtEwo9eFzhcrk4gzl7kUEmcehnu1
         p/Xk0s3usCvQ/Oi/fK+6tX3Qt/2EZY1mf7eQYjYgcdUoQL4bdiG+okIZIF1wKAMgbacP
         T5Hn+I5qnQjU27zBOX7V5uR7rL1r988+fskubS8sXtKWCW5aQEC8MAgA5keBoi23X3/Y
         +iyE1irEKZy3MzcNcuPXGWr5+304fpWligx971yPybxKxYzjynaW0bEDZnSIuTcXyxcW
         guRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=04ig8Jpnhmqmb93VFIyiBP6MR+wj/njfRfrqGD7STpI=;
        fh=lv/htMkbfU53p+/oc1VNos7ld03P9Q0tNILrijnUZ88=;
        b=enGd7XQ0vWp15cjsD9BdCBCaZp6PMhMyqJ8DNps4p7j/twjbUzkOFzSZRPWfMieSTw
         Jcxztx6X0FDJ1U1Zz2xZ9q6Gnorlsly8WXlAm1w+qc8Hw1TKKs2jccGkFdC9iFeOS1XQ
         vmHr189/YiYxvF3KAiGXwrR1didhrBFb9ISylhm2OZzehFTNy/h0k4grBCXJ5rDGNl3P
         DYu8XRw6koDmJfGDzU8LPEDwrlM/xsE3z1PMBLpQXDuse4bjj4/BtH3SoxTbcJa6X/4Z
         lmvQNguvBSEXoCefQ5reekSRnYOJpY4KizWV9AONTfxrc6n+qh1qF3AfZeKnJ4mvlmb1
         zgaw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773860638; x=1774465438; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=04ig8Jpnhmqmb93VFIyiBP6MR+wj/njfRfrqGD7STpI=;
        b=dnP9N4NHO/fn1NCR86BmlTLBnppX+fJI2qrty6KzVKEs+tKSvODc/CXKU8byDw4x0g
         vNcXT+YR0sXFcWS/Pw3Q5+p0q6jdExZPksq9Zkv8vOt0ZfcKsQGpn4JaXZcCO8BCd1jk
         KSO6K47zEPI8al/jqeQH9YnEbDQyGc/X2xDHnVXjZyR9ZFmnfE7YNjuhdu4GUVKfgBUS
         3NkRw3FPfCKndw0oizKf/lA1UzTZAq2Pry5A8fPIPhvN3ax4L9NB5P6Sdxw6eZkNFRJL
         O//3njHue7pjHuI1wVCTWX/qzmYHG56HqkyqWZxE9+2S7u7o1VVdMyeU9vUydZxUpdM3
         gwqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773860638; x=1774465438;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=04ig8Jpnhmqmb93VFIyiBP6MR+wj/njfRfrqGD7STpI=;
        b=jgVZqKftFBa4BHW7EzsQkGum5D4daZMnWnOU/7qfT8paB+QCH1/SR8E+l+jJ4+2BNU
         Gb5KrQG/XoNNLHOoVMPKFpzxiOM9b3otY043Hh0Kq5G1x8XPL4y4K9CXU95MmOQLmt85
         //03ch12mGHw/VDkbK5vKtZmarYg3Dtvy/47exn0oLR0yopLZf1ol+C/y1HJhIG/GbBi
         QLuu5fQlYJOYeKj9xqloF9FK1A+/PYUYMIG46jDQ1v6NHc81Owc4wlVYHZY8y29ktRqr
         em2lwbmOBDN30UWOi8fgZeBtLf9qtENZWSUCiK1pubEwPNMplcl9ZOQos+wlGzhkaamp
         dWTw==
X-Forwarded-Encrypted: i=1; AJvYcCVOIL+SkqbaDDKj5UcOplHwAezs5IstOEu+lV6NdajDeqXDiE+tttyhHdupqKNtnmBgZ7fsEhwoKCQfsFzfaV8L@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl4B+KBf/haZhRNSeN+JhLL1dF66bfSb/V7q1RhTWWotmGtRBh
	YVsFV6KEpNjRHgKyGqxBvVGGiMaMRE4ZZXQALIYO45Z/vmofNnGOMBkswU1C0XYBlcf3GgzGqbZ
	XTMECV3ca2Aw3oT4OTs6dl+ZB0GtFIklmtAGYdNHR2w==
X-Gm-Gg: ATEYQzz3VseM3kAlXwfc/Y1OEFWgrnYRLfS61+JoV4VH0j6imP4CyUsvHr37qssMda4
	6c0d3tr7oF7tv5lniDDFCZovKM95ACE9wcYQ4PDrBhEk98iBpO0AASnJ2A6A1VkKr7JWEY6JOjh
	M2O1JQYvJXw7MFVdECsuPQ+P+1WSiGL/UxA2aoE/EpuewAwJD7u1HjAECaTC6AxkHjAukb42r4D
	bW5EYj12ffcdBizPvkhtkIV0c07wEuSU+oInW6kJAjN8QoAJBWYplRgNE79u7MP7/KfAWv7/KwH
	mVzHPedcAythGgaZc4rmhuT5XX4glNMrVhzMcklm0EIaQKhVG+s=
X-Received: by 2002:a17:907:96a3:b0:b94:1bd:13fa with SMTP id
 a640c23a62f3a-b97f493bde3mr266129966b.21.1773860638142; Wed, 18 Mar 2026
 12:03:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260313195801.2043306-1-shenwei.wang@nxp.com>
 <20260313195801.2043306-4-shenwei.wang@nxp.com> <2aa1d063-181f-4145-9f1f-7e3012c4d0af@foss.st.com>
 <104e9861-bfd4-4e0f-8967-a849edf7e6fb@lunn.ch> <CANLsYkx6KhspTjzpk51ywfgWcf-FR7-3XrH=MmBi_W6yZmMukA@mail.gmail.com>
 <PAXPR04MB9185E1D7543DB60DE089423B894EA@PAXPR04MB9185.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB9185E1D7543DB60DE089423B894EA@PAXPR04MB9185.eurprd04.prod.outlook.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed, 18 Mar 2026 13:03:47 -0600
X-Gm-Features: AaiRm50DCHDfwwIrpEvrd6IARu-OJyOKkB98w-Mz3i8yabOEb0YcC2ELSE3lijw
Message-ID: <CANLsYkyvHBKVuRB9abg=WijMLAfaboBxb_eHWETQ6hU3C9Zmew@mail.gmail.com>
Subject: Re: [PATCH v12 3/5] gpio: rpmsg: add generic rpmsg GPIO driver
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

On Wed, 18 Mar 2026 at 12:46, Shenwei Wang <shenwei.wang@nxp.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Mathieu Poirier <mathieu.poirier@linaro.org>
> > Sent: Wednesday, March 18, 2026 11:03 AM
> > To: Andrew Lunn <andrew@lunn.ch>
> > Cc: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>; Shenwei Wang
> > <shenwei.wang@nxp.com>; Linus Walleij <linusw@kernel.org>; Bartosz
> > Golaszewski <brgl@kernel.org>; Jonathan Corbet <corbet@lwn.net>; Rob He=
rring
> > <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dool=
ey
> > <conor+dt@kernel.org>; Bjorn Andersson <andersson@kernel.org>; Frank Li
> > <frank.li@nxp.com>; Sascha Hauer <s.hauer@pengutronix.de>; Shuah Khan
> > <skhan@linuxfoundation.org>; linux-gpio@vger.kernel.org; linux-
> > doc@vger.kernel.org; linux-kernel@vger.kernel.org; Pengutronix Kernel T=
eam
> > <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; Peng Fan
> > <peng.fan@nxp.com>; devicetree@vger.kernel.org; linux-
> > remoteproc@vger.kernel.org; imx@lists.linux.dev; linux-arm-
> > kernel@lists.infradead.org; dl-linux-imx <linux-imx@nxp.com>; Bartosz
> > Golaszewski <brgl@bgdev.pl>
> > Subject: [EXT] Re: [PATCH v12 3/5] gpio: rpmsg: add generic rpmsg GPIO =
driver
> > On Tue, 17 Mar 2026 at 08:11, Andrew Lunn <andrew@lunn.ch> wrote:
> > >
> > > > > +struct rpmsg_gpio_info {
> > > > > +   struct rpmsg_device *rpdev;
> > > > > +   struct rpmsg_gpio_packet *reply_msg;
> > > > > +   struct completion cmd_complete;
> > > > > +   struct mutex lock;
> > > > > +   void **port_store;
> > > > > +};
> > > >
> > > > Except if I missunderstood Mathieu and Bjorn's request:
> > > > "reuse all the design-work done in the gpio-virtio"
> > > > We should find similar structures here to those defined in
> > > > virtio_gpio.h.
> > > > struct rpmsg_gpio_config {
> > > >       __le16 ngpio;
> > > >       __u8 padding[2];
> > > >       __le32 gpio_names_size;
> > > > };
> > > >
> > > > /* Virtio GPIO Request / Response */ struct virtio_gpio_request {
> > > >       __le16 type;
> > > >       __le16 gpio;
> > > >       __le32 value;
> > > > };
> > >
> > > The core of the issue is that Shenwei is stone walling any change
> > > which makes it hard to keep the legacy firmware. It is possible to us=
e
> > > these structures, but it makes the extra code Shenwei needs to
> > > translate this protocol to the legacy protocol more difficult. It
> > > might need to keep state, etc.
> > >
> >
> > I agree with everything Andrew points out above.
> >
> > > Two points...
> > >
> > > The firmware implements more than GPIO. There is definitely I2C as
> > > well, the first version of the patch has bits of I2C code. Looking at=
:
> > >
> > > https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fl=
wn.
> > > net%2Fml%2Fall%2F20250922200413.309707-3-
> > shenwei.wang%40nxp.com%2F&dat
> > >
> > a=3D05%7C02%7Cshenwei.wang%40nxp.com%7C4b8879a9c89a4a831cf508de850
> > 7de18%
> > >
> > 7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C639094465992371367%
> > 7CUnkn
> > >
> > own%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIl
> > AiOiJX
> > >
> > aW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3Ds8tl8n
> > m3eD
> > > 9l%2FetyyE%2FPWwJh4wQalaaHr4OEwzpQ7NY%3D&reserved=3D0
> > >
> > > There is also RTC, and a few other things which don't directly map to
> > > Linux subsystems, but maybe do have Linux drivers?
> > >
> > > Give how much pushback there has been on the existing protocol for
> > > GPIO, it would be wise to assume that I2C, and RTC is going to get th=
e
> > > same amount of pushback. If any of these three, GPIO, I2C, or RTC
> > > decide that only a new, clean protocol will be accepted, no legacy
> > > shims, the firmware has to change, breaking compatibility to legacy
> > > protocols, and the accepted shims become pointless Maintenance burden=
.
> > >
> >
> > I have made this point clear before: modeling legacy protocols in mainl=
ine doesn't
> > scale.  Mainline uses a single generic protocol, and yes, it means brea=
king legacy
> > protocols.  This is the cost of moving to a mainline kernel.  If people=
 want to use
> > the legacy firmware, they must stick with a legacy kernel.
> >
> > > Point two is that the customers who are pushing for these drivers to
> > > be added to Mainline probably know that nearly nothing gets into
> > > Mainline without some changes. There is some short term pain to
> > > swapping to Mainline because of these changes, in this case, firmware
> > > upgrades. But in the long run, it is worth the pain to be able to use
> > > Mainline. And those customers who don't want to upgrade the firmware
> > > can keep with the out of tree drives.
> > >
> > > So, what are our choices?
> > >
> > > 1) We accept the code as it is now, with the shim?
> > >
> >
> > NAK
> >
> > > 2) We keep pushing for the virtio protocol, with the shim?
> > >
> >
> > NAK
> >
> > > 3) We keep pushing for the virtio protocol, no shim, firmware changes
> > >
> >
> > Nothing will get merged in the RPMSG subsystem that includes support fo=
r the
> > legacy protocol.  Not today, not in a month, not in 5 years.
> >
>
> @Mathieu,
> Your tone is unnecessary. If you believe this driver must
> comply with a specific virtio protocol, then please point to the exact
> specification instead of making blanket statements.
>
> If virtio is the direction you prefer, you are of course free to propose
> and implement such support yourself.
>
> My patches are contributed in good faith to improve the ecosystem, and
> this work clearly belongs to the GPIO subsystem. I don't understand why
> you are asserting authority here without providing any technical
> justification.
>

All arguments have already been presented to you, we are now going in circl=
es.

I am happy to look at a new revision of this work that complies with
the comments Andrew, Arnaud and I provided.  I will not engage with
you or your work until that time comes.

> @Linus Walleij,
> From a technical standpoint, this GPIO driver is no different from
> gpio-mxc, gpio-omap, or gpio-rda. If the concern is simply the use of
> the word =E2=80=9Cgeneric=E2=80=9D in the name, I=E2=80=99m perfectly fin=
e reverting it to an
> NXP=E2=80=91specific driver.
>
> If maintaining a private GPIO driver is no longer acceptable going
> forward, that=E2=80=99s also fine =E2=80=94 we can stop the discussion he=
re. If you think
> there are still technical limitations in the driver itself, I=E2=80=99m m=
ore than
> willing to continue improving it.
>
> But the goal is not to create a driver for another protocol that someone
> claims perfect.
>
> Thanks,
> Shenwei
>
> > > 4) We pause GPIO where it is today, and restart all the arguments wit=
h
> > >    the I2C driver. We can come back to the GPIO driver in a few month=
s
> > >    time once we have a better idea how I2C is going. And maybe we als=
o
> > >    need to see the watchdog driver, and argue about its protocol.
> > >
> > > I also understand ST has a generic I2C driver nearly ready, if that
> > > gets merged first, that probably kills the NXP I2C protocol, and mayb=
e
> > > the NXP GPIO and RTC protocols.
> > >
> > > My vote is for 3. If not 3, then 4.
> > >
> >
> > Strong vote for 3.
> >
> > >      Andrew
> > >
