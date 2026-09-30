Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2E54FC8E6
	for <linux-remoteproc@vger.kernel.org>; Wed, 30 Sep 2026 14:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790777163; cv=none; b=cVw9GswGwGXE5WteG/MYon1iZ3d60KkP9Q0Vh9ULb4YGtillBffz716a/dkHQBE30qs2K6cbA7r7GBptl7WukUBuhG3J7MJvJkjlVr0hSP+/eFtpj4qXIKS2wDCn7YMVafZulffWJVCFafVA2/xp+dHPi15Yd92Bf7U8zxEtkEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790777163; c=relaxed/simple;
	bh=9bx6coMoBdOLnpZ1etpmYrgE196fZ3EXrtZZ7FD3iVU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OrO7DVqfbjWygMjSp5ouRNmvJ7WVjJ3AyShQZrAdM3A3BYXpWFbgBDUGsjmgzyfVsUaYNqMZgqp/1ONXbX+TAe8WltNx7TUX5iqjSo8jiXREnUI13VAKEeu1InAprbt1oFECpsYleDDzGBPtAOpEscXmf7lkdMLLdYbmXuLyLuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=SAHqxUi6; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="SAHqxUi6"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id E643C240105
	for <linux-remoteproc@vger.kernel.org>; Wed, 30 Sep 2026 16:05:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1790777147;
	bh=z8s3bGJeeJqZuJkbjfTcGgrs2VSs73dz7rSX2XlTyr8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=SAHqxUi6lCbmYp932P1f2i/YrVBBZQ/P2YoNuXKzcnDZ69H9JfyTG4dw2Y9oavRDY
	 AELQS5IF9UeTg2VK1JZb5vZXFeh3lcR5vQZFeJZxvgcyNuoEB1qJVLW2go1WnvIC9P
	 3FajJYyMSjYaLSOsKNsQF3Nnk/OiwWHsMMOeTeFtANXyd7ub0zvBL4aTiqzmSB3oFl
	 sA8MHsz2FI0UYMP5Wg/5xnXS6IfLuMB/MnjdqdnQKb8xZQF45DllVNJ82h3qehLOXR
	 IjN6HokgmhsUtPXfZhrkpwIQKd3rAjwWcOI12MqTMnfmGwNF7h40Pm+pr5KAkkQihf
	 kW59komk6TUrg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4hvxdy1xn9z9rxb;
	Wed, 30 Sep 2026 16:05:42 +0200 (CEST)
Date: Wed, 30 Sep 2026 14:05:47 +0000
From: Wilken Gottwalt <wilken.gottwalt@posteo.net>
To: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
Cc: Bjorn Andersson <andersson@kernel.org>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu
 Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, Philipp Zabel <p.zabel@pengutronix.de>, Andre
 Przywara <andre.przywara@arm.com>, Bastian Germann <bage@debian.org>,
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] riscv: dts: allwinner: d1-t113: Add the hardware
 spinlock
Message-ID: <20260930160541.040ccc0e@posteo.net>
In-Reply-To: <20260930130221.129529-1-tien.nguyenminh@embeddedlinux.blog>
References: <20260927025626.69614-1-tien.nguyenminh@embeddedlinux.blog>
	<20260927025626.69614-4-tien.nguyenminh@embeddedlinux.blog>
	<20260927132707.5f484946@posteo.net>
	<20260930130221.129529-1-tien.nguyenminh@embeddedlinux.blog>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 30 Sep 2026 20:02:21 +0700
Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog> wrote:

> Hi Wilken,
> 
> > Wouldn't it make more sense to add the "allwinner,sun20i-d1-hwspinlock" line to
> > the driver in the sun6i_hwspinlock_ids struct, drop
> > "allwinner,sun6i-a31-hwspinlock" here in the D1 device tree and update the yaml
> > file accordingly?
> 
> Thanks for looking at it. Bjorn hasn't replied yet, so I looked a bit
> more at the naming. I'd like to keep the A31 fallback: it's the usual
> pattern, other blocks in this dtsi do the same (timer, I2S, LED
> controller), and Conor already acked the binding in 2/3. If Bjorn
> prefers a driver entry instead, I'm fine to change it.

Yeah, Conor was a bit quick to act here, such things happen often with patchsets
made out of documentation/devicetrees and code. Though, the get clock and resets
patch is fine. The driver could use some modernization.

> > Oh, and I may be able to test it against the D1, I own a Sipeed Nezha.
> 
> That would be great. You don't need FreeRTOS for it: I tested with a
> small Linux module that takes each lock and checks the status
> register. I can clean it up for the single-core D1 and send it.

Uhm, the Linux-only test doesn't work as a hwspinlock test, it misses the entire
point of the primitive. A hwspinlock arbitrates between two independent agents,
in this case, Linux running on the C906 core and FreeRTOS running on the HiFi
DSP, both sharing the same memory bus and other hardware. If Linux is the only
one who ever takes the locks, it is simultaneously writer and reader of the status
register, so the test cannot fail even for a broken (or fake) implementation. That
would basically test nothing at all, well, maybe it would be some kind of bring-up
test, but overall quite useless.

greetings,
Wilken
