Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF74541A563
	for <linux-remoteproc@vger.kernel.org>; Fri,  2 Oct 2026 07:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790927427; cv=none; b=GVmrHtgYZMnfmQ6pbNGrvHQNvXJm/+qjg9uLhNaXGiHIMjjrXgXDkCHW+uyIL+a/jWDJzZ22FBQUG1nGMaPiGCKZeCigdPOiRXQi/JnCBvNODJfPpTHcHtX8BJUgzSh1j8lyFjwImTqrhtzSpfsvN2yy/cPlr7BG+H4fXE3Lfk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790927427; c=relaxed/simple;
	bh=Uuw9YcGk9lfdEVRwjqrzUmYDlAJl7TAqXFgwWW6Q8r8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KuUxOAjsz7aLu7PQWARw3mii2Rothj/OfMzCBMwV/9+Vg6QJ6xuI8Rb7UwRN4uRvTCAiFUquX1NxSsVfRolVPVyXeAjU8VDQBomw1ynLM/1HaloNz8CPdFt8P8MRRrQgl2o/pLwgn98GhbC963H8oYqfBPXe/0M+Ib5C/zEnqxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=opAULVzs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="opAULVzs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DE5D1F0089A
	for <linux-remoteproc@vger.kernel.org>; Fri,  2 Oct 2026 07:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790927425;
	bh=Uuw9YcGk9lfdEVRwjqrzUmYDlAJl7TAqXFgwWW6Q8r8=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=opAULVzserwDb623yWkTcdiUML85+eUnznNSm2bz9BbqvYiGAwrYmMs4N5G3AI2Do
	 SRosiiL4LqIJdn0j+5KRGCF1G3rI/z7WcudA0XxY2wuaOUQNGF8GzuhELil6VrQcbJ
	 v+TtUe+v2C1s+wtC3hMFSXsxHqN1FKtST0gYH+D7h7EmZfo0fHDxSX+eIdcwsLqHnu
	 EFnpu+wg5W/KoHhGajA0x9yUeS5bjGFxqyZsD6terQGNrPrL27SuXwsYIg196Tt1fC
	 XqubiQjLbY8o+gzwBYblVy+/WkIt0LHmaHO2rXQrKBashx7FIBhHhrwuY19KS9LYe9
	 12slgzEAXYrqA==
Received: by mail-lr2-f34.google.com with SMTP id 38308e7fff4ca-3a783ec301dso13403531fa.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 02 Oct 2026 00:50:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzQlb7A6T/ac47Gjd4AeOl5ay0GfRfH5vZxEGaFkGi3/xd/SRtl6Vp0fPLZMNu4joTPWLTB94IVGjkU3PAXj5N0@vger.kernel.org
X-Gm-Message-State: AFq9FYKY6tikKUshNKWQQL7bTh7eNlGhRdqOSx7eO+35nEeyjl4idxyJ
	hsYM8A9etjxfMPw5IinrtiDgcpR7YHDUlZ2wekRQFBTP8n+Qnvqt9+65qyRFRWWGm76CvntQ3nj
	Lm1+L8UahyJQ24E/4u+ul4WF1aWJROqs=
X-Received: by 2002:a05:651c:a107:10b0:3a3:74b9:8a79 with SMTP id
 38308e7fff4ca-3a8877f2af4mr3028011fa.18.1790927423980; Fri, 02 Oct 2026
 00:50:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260927025626.69614-1-tien.nguyenminh@embeddedlinux.blog>
 <20260927025626.69614-4-tien.nguyenminh@embeddedlinux.blog>
 <20260927132707.5f484946@posteo.net> <20260930130221.129529-1-tien.nguyenminh@embeddedlinux.blog>
 <20260930160541.040ccc0e@posteo.net> <20261002-matted-tux-5b4059bc305a@wendy> <20261002094816.64349979@posteo.net>
In-Reply-To: <20261002094816.64349979@posteo.net>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Fri, 2 Oct 2026 15:50:08 +0800
X-Gmail-Original-Message-ID: <CAGb2v65YP7WM-FKKJJuEpGWO3xyY1KAhWjw39hgHE=Ns2a0zzw@mail.gmail.com>
X-Gm-Features: AclHuK_HVE57bDVsQlmhG-VM5VBilmJ8qnl2ozGwoiccAzLaGGbOy91FR-N2-UM
Message-ID: <CAGb2v65YP7WM-FKKJJuEpGWO3xyY1KAhWjw39hgHE=Ns2a0zzw@mail.gmail.com>
Subject: Re: [PATCH 3/3] riscv: dts: allwinner: d1-t113: Add the hardware spinlock
To: Wilken Gottwalt <wilken.gottwalt@posteo.net>
Cc: Conor Dooley <conor.dooley@microchip.com>, 
	Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>, Bjorn Andersson <andersson@kernel.org>, 
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

On Fri, Oct 2, 2026 at 3:48=E2=80=AFPM Wilken Gottwalt
<wilken.gottwalt@posteo.net> wrote:
>
> On Fri, 2 Oct 2026 08:32:51 +0100
> Conor Dooley <conor.dooley@microchip.com> wrote:
>
> > On Wed, Sep 30, 2026 at 02:05:47PM +0000, Wilken Gottwalt wrote:
> > > On Wed, 30 Sep 2026 20:02:21 +0700
> > > Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog> wrote:
> > >
> > > > Hi Wilken,
> > > >
> > > > > Wouldn't it make more sense to add the "allwinner,sun20i-d1-hwspi=
nlock" line to
> > > > > the driver in the sun6i_hwspinlock_ids struct, drop
> > > > > "allwinner,sun6i-a31-hwspinlock" here in the D1 device tree and u=
pdate the yaml
> > > > > file accordingly?
> > > >
> > > > Thanks for looking at it. Bjorn hasn't replied yet, so I looked a b=
it
> > > > more at the naming. I'd like to keep the A31 fallback: it's the usu=
al
> > > > pattern, other blocks in this dtsi do the same (timer, I2S, LED
> > > > controller), and Conor already acked the binding in 2/3. If Bjorn
> > > > prefers a driver entry instead, I'm fine to change it.
> > >
> > > Yeah, Conor was a bit quick to act here, such things happen often wit=
h patchsets
> > > made out of documentation/devicetrees and code. Though, the get clock=
 and resets
> > > patch is fine. The driver could use some modernization.
> >
> > I dunno, was I too quick to act? The patched looked correct to me, sinc=
e
> > it was using a fallback to a device that it appears to be compatible
> > with. Had the series done what you're suggesting, my review feedback
> > would have been to tell the Tien to add a fallback.
>
> I'm just not sure how to actually do it right, because so many SoCs inclu=
de that
> feature. That is why I asked how you would do it having more insight as a
> subsystem maintainer. It just looks incomplete to me. In the past I actua=
lly
> verified it working with H2, H2+ and H3, none of them being
> "allwinner,sun6i-a31-hwspinlock".

Even if all the SoCs had them, if no one enabled and tested them, then they
wouldn't have entries in the binding or dtsi files.

> > > > Bjorn, what do you think? Just stay with the "allwinner,sun6i-a31-h=
wspinlock"
> > > > string or add all the possible combinations like
> > > > "allwinner,sun8i-h2-plus-hwspinlock" or "allwinner,sun8i-a83t-hwspi=
nlock".
> > > > I mean, it is just a naming game and there are 10+ SoCs supporting =
this
> > > > spinlock register file
> >
> > All devices compatible with the a31 should use the a31 as a fallback.
> >
> > >
> > > > > Oh, and I may be able to test it against the D1, I own a Sipeed N=
ezha.
> > > >
> > > > That would be great. You don't need FreeRTOS for it: I tested with =
a
> > > > small Linux module that takes each lock and checks the status
> > > > register. I can clean it up for the single-core D1 and send it.
> > >
> > > Uhm, the Linux-only test doesn't work as a hwspinlock test, it misses=
 the entire
> > > point of the primitive. A hwspinlock arbitrates between two independe=
nt agents,
> > > in this case, Linux running on the C906 core and FreeRTOS running on =
the HiFi
> > > DSP, both sharing the same memory bus and other hardware. If Linux is=
 the only
> > > one who ever takes the locks, it is simultaneously writer and reader =
of the status
> > > register, so the test cannot fail even for a broken (or fake) impleme=
ntation. That
> > > would basically test nothing at all, well, maybe it would be some kin=
d of bring-up
> > > test, but overall quite useless.
