Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1792352C54
	for <linux-remoteproc@vger.kernel.org>; Fri,  2 Oct 2026 07:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790927311; cv=none; b=KPTPyAb0E0vIFheZlWxmwtQAoIKkAmyijgLjSeHXMyIdku1RIelvXUzSBQT+h6LPY5mNnFeBV8MVNYKCzmV95t0SmC/lIk8TGtvtOlAxwSivDvtJpkToCaiicorZ4j/0b+R4I/KvyRPmjJeo3RaV0HapP73T3D57eYkDw0exTmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790927311; c=relaxed/simple;
	bh=XzG3l1W0BtphUrvrRi+H9un8Xrl3W5tYO+TPzQWZE6s=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uCYRMQa44iq7xXQ12N6xef8g7YZO+opcI2DYSP1u9fQMlpeKzJIE3Q7vjBfsmjdLmKtsVpZrV8/ivc5vFamYZH1kEPSqZia+xLznjD3mIcjb3i6pxDzzUisb2mr3XU1oqsVJE12ZQFI2Pvorec3fn9V8AqcES9gVK5Zdegl0X0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=LkNO0LWf; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="LkNO0LWf"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 2E751240103
	for <linux-remoteproc@vger.kernel.org>; Fri,  2 Oct 2026 09:48:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1790927302;
	bh=TDtD1RuEvO0usfXj2x7thtiRxuzLJn150R30ry9M7hc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=LkNO0LWfhS3/tZymvtKqSFt3Ttbdc5qZUXCH9BnuTQpxYKANnCe4R1xRX4+WwJy9p
	 JoeE5JOd8wQyqL6MMHzy4o6IUlMkqVM4Iw3LdSKBD0IJLRNTcwxJhtT97Pzj/RdEvS
	 +E6TmAQkQsPu7KMRWnNkjWmTuaOEDBJTilM+JxqufApE85NDMe8LhlRuV5y5DZLgrE
	 6F7eBVg+gq9o6m+y+KPPzeYbvPss83zO4dR0Ms5kcewTaiRbH3AV05F1/PD9BLEQYL
	 RESPuZWCkTBFw3hIUHLY/hw/55HVyDARYIUmztqgXjKAgPLhfCqQv1P28h8aC6x130
	 vHSqQHE03j6zA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4hx19Y3Xh3z6twQ;
	Fri,  2 Oct 2026 09:48:17 +0200 (CEST)
Date: Fri, 02 Oct 2026 07:48:21 +0000
From: Wilken Gottwalt <wilken.gottwalt@posteo.net>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>, Bjorn Andersson
 <andersson@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert
 Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Philipp Zabel
 <p.zabel@pengutronix.de>, Andre Przywara <andre.przywara@arm.com>, Bastian
 Germann <bage@debian.org>, <linux-remoteproc@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-sunxi@lists.linux.dev>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] riscv: dts: allwinner: d1-t113: Add the hardware
 spinlock
Message-ID: <20261002094816.64349979@posteo.net>
In-Reply-To: <20261002-matted-tux-5b4059bc305a@wendy>
References: <20260927025626.69614-1-tien.nguyenminh@embeddedlinux.blog>
	<20260927025626.69614-4-tien.nguyenminh@embeddedlinux.blog>
	<20260927132707.5f484946@posteo.net>
	<20260930130221.129529-1-tien.nguyenminh@embeddedlinux.blog>
	<20260930160541.040ccc0e@posteo.net>
	<20261002-matted-tux-5b4059bc305a@wendy>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 2 Oct 2026 08:32:51 +0100
Conor Dooley <conor.dooley@microchip.com> wrote:

> On Wed, Sep 30, 2026 at 02:05:47PM +0000, Wilken Gottwalt wrote:
> > On Wed, 30 Sep 2026 20:02:21 +0700
> > Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog> wrote:
> > 
> > > Hi Wilken,
> > > 
> > > > Wouldn't it make more sense to add the "allwinner,sun20i-d1-hwspinlock" line to
> > > > the driver in the sun6i_hwspinlock_ids struct, drop
> > > > "allwinner,sun6i-a31-hwspinlock" here in the D1 device tree and update the yaml
> > > > file accordingly?
> > > 
> > > Thanks for looking at it. Bjorn hasn't replied yet, so I looked a bit
> > > more at the naming. I'd like to keep the A31 fallback: it's the usual
> > > pattern, other blocks in this dtsi do the same (timer, I2S, LED
> > > controller), and Conor already acked the binding in 2/3. If Bjorn
> > > prefers a driver entry instead, I'm fine to change it.
> > 
> > Yeah, Conor was a bit quick to act here, such things happen often with patchsets
> > made out of documentation/devicetrees and code. Though, the get clock and resets
> > patch is fine. The driver could use some modernization.
> 
> I dunno, was I too quick to act? The patched looked correct to me, since
> it was using a fallback to a device that it appears to be compatible
> with. Had the series done what you're suggesting, my review feedback
> would have been to tell the Tien to add a fallback.

I'm just not sure how to actually do it right, because so many SoCs include that
feature. That is why I asked how you would do it having more insight as a
subsystem maintainer. It just looks incomplete to me. In the past I actually
verified it working with H2, H2+ and H3, none of them being
"allwinner,sun6i-a31-hwspinlock".

> > > Bjorn, what do you think? Just stay with the "allwinner,sun6i-a31-hwspinlock"
> > > string or add all the possible combinations like
> > > "allwinner,sun8i-h2-plus-hwspinlock" or "allwinner,sun8i-a83t-hwspinlock".
> > > I mean, it is just a naming game and there are 10+ SoCs supporting this
> > > spinlock register file
> 
> All devices compatible with the a31 should use the a31 as a fallback.
> 
> > 
> > > > Oh, and I may be able to test it against the D1, I own a Sipeed Nezha.
> > > 
> > > That would be great. You don't need FreeRTOS for it: I tested with a
> > > small Linux module that takes each lock and checks the status
> > > register. I can clean it up for the single-core D1 and send it.
> > 
> > Uhm, the Linux-only test doesn't work as a hwspinlock test, it misses the entire
> > point of the primitive. A hwspinlock arbitrates between two independent agents,
> > in this case, Linux running on the C906 core and FreeRTOS running on the HiFi
> > DSP, both sharing the same memory bus and other hardware. If Linux is the only
> > one who ever takes the locks, it is simultaneously writer and reader of the status
> > register, so the test cannot fail even for a broken (or fake) implementation. That
> > would basically test nothing at all, well, maybe it would be some kind of bring-up
> > test, but overall quite useless.
