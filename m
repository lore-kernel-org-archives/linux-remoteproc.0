Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48BBB3E6DFF
	for <linux-remoteproc@vger.kernel.org>; Wed, 18 Mar 2026 16:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773849804; cv=pass; b=d5WCYQoTxViltkqaHUEOmnVxMiZnZLmMuy9X1QpMRusLCFhfu/2Pwjj03U9HL570xXl4IPjOL1DuRLkod7Imi1b6uGCJRSYzkaKYXqH1xRhsy3Jcs8BSjAnyWipuS6e3wjgRmsb7OTP4gCGBCII3ywj6hEoqpApEawQ+lkCBEeo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773849804; c=relaxed/simple;
	bh=whUst5kD5E4ZE3YDOSV+OSVwVL0wed8ch5z/VyWCXig=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a4ICWbyxdvaX+bVOFlaHFDX5sk83QoFHMKlSrphHNqpTp59w7/GC9ID/sz9vxknMVKjMDwjWyPvSq4ZShvQ40nJHrTRBoiP2vJ6miCxVuGZHwS7CqxKH/R9KMfMuClFIh2kWns1fje2itePAlL8awHUE8IKn/lUClcDuFTcZKiI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NrvFKfJy; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NrvFKfJy"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-661d20c9787so139553a12.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 18 Mar 2026 09:03:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773849796; cv=none;
        d=google.com; s=arc-20240605;
        b=NWIG87xiBAP/jdLRNk9wWZPuKC8PtK1eHbeQoYeFDOA7gkLv3Ube2ZFlPFEJTcANZH
         hA81triYQ+6/DMzCZ7IhXB1qsX2DdGu7Xy9wkB5s3owlT5xTyf9kowsJQxJ8LMrhG4zv
         4BX5tQULYZ9yE+6oDv4Auj9sfFwZz6thN8atLS5FZ/qncacVhYVIDh+hSGf93ZwGPA/u
         n5BxzD41JRnbjH/Qt2l9mb26oKk0J5exkBKpW7WN15pg0uTCKB2wrjw5GRonEBMa99L6
         MQU+FiPlGGMl626vb3cx5yZfRw5rY2BrYkINgdYcJhLFFaTBNVDid2hMNcHLhgzbhAKu
         8eSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Swz0XhdroxzWkDHIYYyMmBF0VrlYEkeUluciyU8bDwM=;
        fh=fTa84XLuY/oHUwhdsk8NkWR0MiikzpDn4e6j2mbQEBU=;
        b=Do2/Eif7n+cNBL4qeCEkP6nSQFKteKN7EFCI7wD+AD9/Nhx/jWJv3WQlPHel2w27Jj
         DKzG7bJDqzew8LUQLEFC38kJ5fe3+UZZ+MVsBpH9ysiBjxU2rjJiZGOLB4rcTidJuXzu
         huE5O3Gvj5R52BwGDyEiR5t1wjEFSO6s0QeW+QmB7466EfeB5uA6ytvg4Z6nO/MBob4o
         MzPJ4KqOHyWOPk3JlaBV6nuIxaifyXLEc+1tE9vWdICyW3omVxidAjtioA4U0JwuRpmC
         6hzd0+Ppy+PhTyVq4N0T1Gv97AA/sQxMT4uHe8HZAHzY2/eJETYnmBOg3h2GwHBqfP35
         vMGg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773849796; x=1774454596; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Swz0XhdroxzWkDHIYYyMmBF0VrlYEkeUluciyU8bDwM=;
        b=NrvFKfJy8CtNVdNccGFS39F+Doot4zdly3PsBWy04M7efbIcf6JilwzgwZ5tKcxYvE
         CRsztuu8mCaeVzWm8JS8NQJo8NiV+qUdakCj+PcJCY5f9k47Y9Bzl/s2JryZnZYbIQJ4
         Us/Q6uozSXjJ2OHxxlKdUPPtzhCLXNQV88EcL9igVFlszfsI1/PHUPIpZQ42UUpMqSQM
         Qb1vV55lgYIoRD0ARNuuIEsSzK7rgFpdNAbbklTL6awoS2ak9qKkt/HctA0Lqi+BKIO9
         yW/TET3gQkdUt+yvJpODff1zYn7V7WIgZZMyyEUk4J6HO/ZMfVW4Fn4uELApzY2iMTeA
         IOIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773849796; x=1774454596;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Swz0XhdroxzWkDHIYYyMmBF0VrlYEkeUluciyU8bDwM=;
        b=XZcyoXoeVuNjkRxfkR4aS9FqchHamyyyjTj/Kn4s6vhIoUUm8EN8Zrq6AvmOpdgoLs
         eYoaG1Sf6OTta+Jctuy4LpGbiY1OEWzfpZStdYgFPPf2KTEPBvuaAfkvnyl4wcDG9fAQ
         wPFDkoQT8MXfDP76cDbodIIcWlfztUMtIGpbXghMZld86kJqk2QCekttHXS68JDLm35r
         EnfHSEw44IHJhz9zZpVIl0QKMW+HrD+GUWrfDQdrZsKU7wh81Qngm7X6smvzN1DheL6v
         rrTYwQ+vPjoaC/Wdd2E5d6Xjh4q8tjY2bvAa5exX7AJv0XFiVbWkI+XRH/31ywLsUB4f
         e/cg==
X-Forwarded-Encrypted: i=1; AJvYcCUTDXeAydGYYTGcNjmMdyOPvRfzgYMs4rrR3Cm2jG8hSju/0+mcOCHiVqrkPNt5AMU1ByWLF6cHbUgQUsBFMakq@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2J3UY73B6asRt8QkXg6lmir7reoT3ddqiZ+t+CkjVhkjjsmqq
	bcOpN32p/TBQ5fbfkvKX1ZD8uXUgeJIgCQJo/bgDQmzppph+ppOIW9HRjBTuyGCqjO8bwW1e9J8
	3hMAV0+b6lBzqd64bQF/qZHIw5TSM1zxmwb/avYxn5g==
X-Gm-Gg: ATEYQzyxTZFXMT2+IrOOH94YD50URnTHEXWjqlRdeBeSNqPS6N+4FrkV5KDQzmdoO5Z
	5I3IMX7PrMstCzOoXGwY4nBqmZJy51kxIThiSnUOeg1F5FM1j9SJ6rtJ3pSqBmVtId15EZhv9ib
	pzlqTjCXpqmHvsSuYGozUzWuB7W/NPRQH6saTdt1F4nMH4YQ6O5CpzDUeGQyOyOsubS9gkVEEPw
	qKRZIEobLd26/6FyICnm0TjPwmUFk4gf+ULjkmSEqZOT867DyfCtYtMhmMr2bh/P0M6AEweW704
	k0MzhossLpTKpYK82P1JjBRkq+1VRZdQ2N3xL82u
X-Received: by 2002:a17:907:9811:b0:b94:24:44bb with SMTP id
 a640c23a62f3a-b97f49bd1dfmr258135566b.42.1773849796081; Wed, 18 Mar 2026
 09:03:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260313195801.2043306-1-shenwei.wang@nxp.com>
 <20260313195801.2043306-4-shenwei.wang@nxp.com> <2aa1d063-181f-4145-9f1f-7e3012c4d0af@foss.st.com>
 <104e9861-bfd4-4e0f-8967-a849edf7e6fb@lunn.ch>
In-Reply-To: <104e9861-bfd4-4e0f-8967-a849edf7e6fb@lunn.ch>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed, 18 Mar 2026 10:03:03 -0600
X-Gm-Features: AaiRm50ET16GLgpYC6lwF0jbLmfq5CygllZIeseBjuujZbOA5MhL0hZ6kP_Zg-Y
Message-ID: <CANLsYkx6KhspTjzpk51ywfgWcf-FR7-3XrH=MmBi_W6yZmMukA@mail.gmail.com>
Subject: Re: [PATCH v12 3/5] gpio: rpmsg: add generic rpmsg GPIO driver
To: Andrew Lunn <andrew@lunn.ch>
Cc: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, Shenwei Wang <shenwei.wang@nxp.com>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, devicetree@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"

On Tue, 17 Mar 2026 at 08:11, Andrew Lunn <andrew@lunn.ch> wrote:
>
> > > +struct rpmsg_gpio_info {
> > > +   struct rpmsg_device *rpdev;
> > > +   struct rpmsg_gpio_packet *reply_msg;
> > > +   struct completion cmd_complete;
> > > +   struct mutex lock;
> > > +   void **port_store;
> > > +};
> >
> > Except if I missunderstood Mathieu and Bjorn's request:
> > "reuse all the design-work done in the gpio-virtio"
> > We should find similar structures here to those defined
> > in virtio_gpio.h.
> > struct rpmsg_gpio_config {
> >       __le16 ngpio;
> >       __u8 padding[2];
> >       __le32 gpio_names_size;
> > };
> >
> > /* Virtio GPIO Request / Response */
> > struct virtio_gpio_request {
> >       __le16 type;
> >       __le16 gpio;
> >       __le32 value;
> > };
>
> The core of the issue is that Shenwei is stone walling any change
> which makes it hard to keep the legacy firmware. It is possible to use
> these structures, but it makes the extra code Shenwei needs to
> translate this protocol to the legacy protocol more difficult. It
> might need to keep state, etc.
>

I agree with everything Andrew points out above.

> Two points...
>
> The firmware implements more than GPIO. There is definitely I2C as
> well, the first version of the patch has bits of I2C code. Looking at:
>
> https://lwn.net/ml/all/20250922200413.309707-3-shenwei.wang@nxp.com/
>
> There is also RTC, and a few other things which don't directly map to
> Linux subsystems, but maybe do have Linux drivers?
>
> Give how much pushback there has been on the existing protocol for
> GPIO, it would be wise to assume that I2C, and RTC is going to get the
> same amount of pushback. If any of these three, GPIO, I2C, or RTC
> decide that only a new, clean protocol will be accepted, no legacy
> shims, the firmware has to change, breaking compatibility to legacy
> protocols, and the accepted shims become pointless Maintenance burden.
>

I have made this point clear before: modeling legacy protocols in
mainline doesn't scale.  Mainline uses a single generic protocol, and
yes, it means breaking legacy protocols.  This is the cost of moving
to a mainline kernel.  If people want to use the legacy firmware, they
must stick with a legacy kernel.

> Point two is that the customers who are pushing for these drivers to
> be added to Mainline probably know that nearly nothing gets into
> Mainline without some changes. There is some short term pain to
> swapping to Mainline because of these changes, in this case, firmware
> upgrades. But in the long run, it is worth the pain to be able to use
> Mainline. And those customers who don't want to upgrade the firmware
> can keep with the out of tree drives.
>
> So, what are our choices?
>
> 1) We accept the code as it is now, with the shim?
>

NAK

> 2) We keep pushing for the virtio protocol, with the shim?
>

NAK

> 3) We keep pushing for the virtio protocol, no shim, firmware changes
>

Nothing will get merged in the RPMSG subsystem that includes support
for the legacy protocol.  Not today, not in a month, not in 5 years.

> 4) We pause GPIO where it is today, and restart all the arguments with
>    the I2C driver. We can come back to the GPIO driver in a few months
>    time once we have a better idea how I2C is going. And maybe we also
>    need to see the watchdog driver, and argue about its protocol.
>
> I also understand ST has a generic I2C driver nearly ready, if that
> gets merged first, that probably kills the NXP I2C protocol, and maybe
> the NXP GPIO and RTC protocols.
>
> My vote is for 3. If not 3, then 4.
>

Strong vote for 3.

>      Andrew
>
