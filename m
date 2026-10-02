Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED794398F5
	for <linux-remoteproc@vger.kernel.org>; Fri,  2 Oct 2026 07:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790927336; cv=none; b=expnXWo5oM9+mPTEVc1bLGTOLSgQCyg/nxKOdXf2L3gspyQbA8n84NgHbnkS5kWipDbVmG35kvztbULQOGIXml5BDHDH3wb4uKtT0es2VMtwGHvVKSTxTvRSKwqkx8HFSSplaAN+nCXjyGqWG4Tz8JisafvYBkxh6KDVosoDwYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790927336; c=relaxed/simple;
	bh=K/6dk9nrqC/MKrnHwwRY81eqOJFcj++Fe93uSmAxRa8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TP98h73VB3ckrzqo8ElduXmrT8/3chzISU2r/Q3GM6/RxaYi2in/oOHnEmiKoCYhfecg5+xggkr6S+2n7ObdEG+v+rbXv/go2WdfHgfBsFC7XQ2ge4dJMTzSn5cwSue/hax1jh2K1dAvlKwAHXe9SxH2xUHpMn8ss2nSXnR4UBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WSkLxcBV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WSkLxcBV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BF841F008BE
	for <linux-remoteproc@vger.kernel.org>; Fri,  2 Oct 2026 07:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790927335;
	bh=K/6dk9nrqC/MKrnHwwRY81eqOJFcj++Fe93uSmAxRa8=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=WSkLxcBV8rOs1pRakbDhFdSdzRUyIybCbVyESybWpJEoxHEI3bOnqFnDOf8+zKHr0
	 rDC+w/uzqqxpyhYxFQYnCdrZr2yR/vUOUQuDkpjWikmYFE9ZkNGlaV4Pav458TKY5e
	 tZH1RGFqG6HdYOyOuhY5n+i27May7nzMphKSwS0on2OpLZfDtJzJ1oMzfMINn89Yv0
	 ku9wVJKH8Qg0gty6LeSD2XLGjcXCXRa/J5DbD1hzZpWCjQPH3uIWRMXLspS5ssASVX
	 gxIiexEs7f/Ya3Fb6vvgcdtB0ULyp9Bun8rJtF6rE5Aee6mCwdSpiwjokwQ8dH+asI
	 Hxf26SfFBLLcA==
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a5e548cd7dso65962141fa.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 02 Oct 2026 00:48:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzG5MnCnb6C20o1IOQjpKVbx93x76E+Ydl1gLIP/safAvIteeROOpqsiWuwLYh5xPsp3z2xdohT6y2/uXqbngR+@vger.kernel.org
X-Gm-Message-State: AFq9FYJfo/2oIHVQ08N5M6gCJHXBJ8tqvNhmHQ+oDFFztrmWGfvUWkpS
	dg8ZkdWDvLjNu7xlO79Um7ygdkcDETWe0vSASTphjx66VPLS4rFE2EN8haunBjbtX7u7SWavDYH
	Uy2vnZdxuW8Ivj02wF0OVyzFE1vrHG2c=
X-Received: by 2002:a05:651c:a214:10b0:3a6:58fb:8540 with SMTP id
 38308e7fff4ca-3a8877acfdbmr2899761fa.19.1790927333136; Fri, 02 Oct 2026
 00:48:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260927025626.69614-1-tien.nguyenminh@embeddedlinux.blog>
 <20260927025626.69614-4-tien.nguyenminh@embeddedlinux.blog>
 <20260927132707.5f484946@posteo.net> <20260930130221.129529-1-tien.nguyenminh@embeddedlinux.blog>
 <20260930160541.040ccc0e@posteo.net> <20261002-matted-tux-5b4059bc305a@wendy>
In-Reply-To: <20261002-matted-tux-5b4059bc305a@wendy>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Fri, 2 Oct 2026 15:48:40 +0800
X-Gmail-Original-Message-ID: <CAGb2v67N_c9qQYCkO3qyAJBD_AiS7121w7TdzaEo+oCHejZz4A@mail.gmail.com>
X-Gm-Features: AclHuK_MycTfrXnUdqDSD2u0CizqQBnqOmkhjG3IcG03pU3h9DtnRs-NxqNzvuk
Message-ID: <CAGb2v67N_c9qQYCkO3qyAJBD_AiS7121w7TdzaEo+oCHejZz4A@mail.gmail.com>
Subject: Re: [PATCH 3/3] riscv: dts: allwinner: d1-t113: Add the hardware spinlock
To: Wilken Gottwalt <wilken.gottwalt@posteo.net>, 
	Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
Cc: Conor Dooley <conor.dooley@microchip.com>, Bjorn Andersson <andersson@kernel.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Andre Przywara <andre.przywara@arm.com>, Bastian Germann <bage@debian.org>, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 2, 2026 at 3:34=E2=80=AFPM Conor Dooley <conor.dooley@microchip=
.com> wrote:
>
> On Wed, Sep 30, 2026 at 02:05:47PM +0000, Wilken Gottwalt wrote:
> > On Wed, 30 Sep 2026 20:02:21 +0700
> > Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog> wrote:
> >
> > > Hi Wilken,
> > >
> > > > Wouldn't it make more sense to add the "allwinner,sun20i-d1-hwspinl=
ock" line to
> > > > the driver in the sun6i_hwspinlock_ids struct, drop
> > > > "allwinner,sun6i-a31-hwspinlock" here in the D1 device tree and upd=
ate the yaml
> > > > file accordingly?
> > >
> > > Thanks for looking at it. Bjorn hasn't replied yet, so I looked a bit
> > > more at the naming. I'd like to keep the A31 fallback: it's the usual
> > > pattern, other blocks in this dtsi do the same (timer, I2S, LED
> > > controller), and Conor already acked the binding in 2/3. If Bjorn
> > > prefers a driver entry instead, I'm fine to change it.
> >
> > Yeah, Conor was a bit quick to act here, such things happen often with =
patchsets
> > made out of documentation/devicetrees and code. Though, the get clock a=
nd resets
> > patch is fine. The driver could use some modernization.
>
> I dunno, was I too quick to act? The patched looked correct to me, since
> it was using a fallback to a device that it appears to be compatible
> with. Had the series done what you're suggesting, my review feedback
> would have been to tell the Tien to add a fallback.
>
> > > Bjorn, what do you think? Just stay with the "allwinner,sun6i-a31-hws=
pinlock"
> > > string or add all the possible combinations like
> > > "allwinner,sun8i-h2-plus-hwspinlock" or "allwinner,sun8i-a83t-hwspinl=
ock".
> > > I mean, it is just a naming game and there are 10+ SoCs supporting th=
is
> > > spinlock register file
>
> All devices compatible with the a31 should use the a31 as a fallback.

+1.

If the hardware is backward compatible, then with the fallback compatible
everything works.

We ask folks to always add SoC-specific compatibles just in case.


ChenYu

> >
> > > > Oh, and I may be able to test it against the D1, I own a Sipeed Nez=
ha.
> > >
> > > That would be great. You don't need FreeRTOS for it: I tested with a
> > > small Linux module that takes each lock and checks the status
> > > register. I can clean it up for the single-core D1 and send it.
> >
> > Uhm, the Linux-only test doesn't work as a hwspinlock test, it misses t=
he entire
> > point of the primitive. A hwspinlock arbitrates between two independent=
 agents,
> > in this case, Linux running on the C906 core and FreeRTOS running on th=
e HiFi
> > DSP, both sharing the same memory bus and other hardware. If Linux is t=
he only
> > one who ever takes the locks, it is simultaneously writer and reader of=
 the status
> > register, so the test cannot fail even for a broken (or fake) implement=
ation. That
> > would basically test nothing at all, well, maybe it would be some kind =
of bring-up
> > test, but overall quite useless.
> >
> > greetings,
> > Wilken
