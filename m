Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8AF364E9E
	for <linux-remoteproc@vger.kernel.org>; Sun, 27 Sep 2026 11:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790508445; cv=none; b=WahglUuLfUZBEAAur2xgdI8tTaJPvWmIj19/2C+A6bEVv9u3jTg2y3gMfhbTns7hYEo29R7qNl+KKMzonQPue0z9leU6DpZtR0yHIOY9YFnAOf3p+VjdMOuLHMVGP++25t0Vo/wNJ2E29uyCvtQeo0h0djVSEPEjXT2tg7tyZPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790508445; c=relaxed/simple;
	bh=/jd6LhjvZzB3GrpgY3GTZItiW0r9hx23Ea5i9/zjsnk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BE43A/EeflQi5nAF2AMXOSNTWo+LZzuEW8N0PPDqXMbM64lToVNRYnoYL4HfG10KUceHbNxs+/b7ktFsCRU86FDGuq26BgPipMGBtWqEyORK6ISmdq4hqJ8BKC2i0Yn1UhNMhPqGU84JmkZnPpzWPLMtZatN0HgvdChKwWgUxOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=FDKqYl2m; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="FDKqYl2m"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id C32F3240103
	for <linux-remoteproc@vger.kernel.org>; Sun, 27 Sep 2026 13:27:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1790508433;
	bh=HWuajKBzp5P29va8dZADm3KIQPoT99vey4Xoq4mmV6I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=FDKqYl2m9mgBMrcaQyDOw6uuRDzKZaAbEYIcvYmyKRN8YMH8VxaNmWINo/KxF4E1c
	 jMolL98c40uz3uSA4R4YSar3nduTbBbjC9kwaUSYbxoHImr+1iHiZTW0sYlHctmmYZ
	 38YwBJLxkKbdWsaTAGC3jjwobkf6wLXX6W9Jlv7Y3HRFOlVfYptrux0AEi7fRLCXsm
	 N02+RP1BSxYzaiXS5J6KutQ1fPOFVLB2wSHjkFNNFmX5Ma+ywTH2ihEI6DzxKz+X91
	 Ob/MCPng6t1dlgrNewOcUTxgGVh30PlDy/sIFtmcxizn2NZsmY8m8DnAc8U8fCzVQm
	 Oi0BPfG1QDPqw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4ht2GN34T4z9rxB;
	Sun, 27 Sep 2026 13:27:08 +0200 (CEST)
Date: Sun, 27 Sep 2026 11:27:12 +0000
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
Message-ID: <20260927132707.5f484946@posteo.net>
In-Reply-To: <20260927025626.69614-4-tien.nguyenminh@embeddedlinux.blog>
References: <20260927025626.69614-1-tien.nguyenminh@embeddedlinux.blog>
	<20260927025626.69614-4-tien.nguyenminh@embeddedlinux.blog>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 27 Sep 2026 09:56:26 +0700
Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog> wrote:

> Add the hardware spinlock of the D1 and T113. It goes in
> sunxi-d1-t113.dtsi rather than sunxi-d1s-t113.dtsi, as the D1s manual
> has no spinlock in its memory map.
> 
> Signed-off-by: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
> ---
>  arch/riscv/boot/dts/allwinner/sunxi-d1-t113.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1-t113.dtsi
> b/arch/riscv/boot/dts/allwinner/sunxi-d1-t113.dtsi index 3b077dc086..228cc5c074 100644
> --- a/arch/riscv/boot/dts/allwinner/sunxi-d1-t113.dtsi
> +++ b/arch/riscv/boot/dts/allwinner/sunxi-d1-t113.dtsi
> @@ -11,5 +11,14 @@ dsp_wdt: watchdog@1700400 {
>  			clock-names = "hosc", "losc";
>  			status = "reserved";
>  		};
> +
> +		hwlock: hwlock@3005000 {
> +			compatible = "allwinner,sun20i-d1-hwspinlock",
> +				     "allwinner,sun6i-a31-hwspinlock";
> +			reg = <0x3005000 0x1000>;
> +			clocks = <&ccu CLK_BUS_SPINLOCK>;
> +			resets = <&ccu RST_BUS_SPINLOCK>;
> +			#hwlock-cells = <1>;
> +		};
>  	};
>  };

Wouldn't it make more sense to add the "allwinner,sun20i-d1-hwspinlock" line to
the driver in the sun6i_hwspinlock_ids struct, drop
"allwinner,sun6i-a31-hwspinlock" here in the D1 device tree and update the yaml
file accordingly? Hmm, there are actually a lot more devices, which support that
spinlock (H2, H2+, H3, H5, H6...). A31 was the first one introducing that IP
core, but newer reference manuals removed the spinlock section completely.
There it is an unnamed 4k block in the memory map.

Bjorn, what do you think? Just stay with the "allwinner,sun6i-a31-hwspinlock"
string or add all the possible combinations like
"allwinner,sun8i-h2-plus-hwspinlock" or "allwinner,sun8i-a83t-hwspinlock".
I mean, it is just a naming game and there are 10+ SoCs supporting this
spinlock register file.

Oh, and I may be able to test it against the D1, I own a Sipeed Nezha. Though,
setting that one up for kernel + FreeRTOS testing is really, uhm, annoying.

greetings,
Wilken
