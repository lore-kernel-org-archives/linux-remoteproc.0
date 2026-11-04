Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793787950;
	b=5VrEZg8tTcQc18pJqeARez/+2Ksus04YJeaR0q1SgAxt/cnPS00AKUetAc5/4JcN1QaS
	 QUXauHWy0cND731R+d0D6vRTITLxm+0B9/3U0TWYyLpt4eGcRUzHhCQj+G2/MNHlG5WAO
	 T5Eaytdt/N5ZtuRQPvo7QwUkFPbSFZmO6+KTLfOZc8f4/EMIe/y4w19ymComPG9CHlwmA
	 8Yju79QJtQtzVUo00yXuNzpy3YPSb6jVeKMvY7aWhTlOgeFmmRdFwwc+bUPVynu9LgilQ
	 NH/HeaOgI+DAgh64f+Pmud2PiE9JK5v2D3oxuzTqHvvKNvcMdnEHs/CGXg5NMn/bwrA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793787950;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=o3uO33BWTvRzGT589zK5XHXlVqQazzRdbRxGw4lkcXk=;
	b=5n7Q1Yc2Q9LbPPeUwU0PBnqSEWJ/vAwO5awYqXuBR/w1HzszN879hhO5iPXJLJGC3Z75
	 zYTepNzTuv/o7gpqkDv0ptzKpU7PwMwP4f2QK6efP0q53vZoPWj/eqHgMdfB1D2WDvnjA
	 0ClE2YG04lLU/DPjma43Zd747wqYfVHuLaHvtPvmGTcNVUyDLBmU2IYfZM7m/sTxjv0ih
	 +V6aHw4g/WqjGjvz3WJQafa7wIztFc2Bc1HjO9PeIBTN7WINfHj9OhNKzNgo1N4EVdpxz
	 Kmz+2ZSLHfZyAz3S0GFmwhkJQIkmpReobFPLHXhrWClWUNEOA7FmQ2YSOFba1oeD6ZQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=R10bR+nG;
	arc=fail smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99282606A326;
	Wed,  4 Nov 2026 10:25:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99282606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=R10bR+nG
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 60653200AD7;
	Wed, 04 Nov 2026 11:25:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793787941;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o3uO33BWTvRzGT589zK5XHXlVqQazzRdbRxGw4lkcXk=;
	b=R10bR+nGpDOBHsBsgfY6x5gF6MVODYpe6zLWjOZvK+UTPbvF0HfqI/A/FRWV1xQ4rLOnJG
	Hb8X0WX7j8MES5DZFlHTx+H0VDKdNkdnDXrwpBmZQD9uxqA2KqMQa+cD/tPkBFUbCD/bzy
	HDEzMn4V9OjGUW4bx9vc1i1mW99gnJJv7Kker8hWZzv4E56jco3hpM2e6rpueAOWLuKM/c
	hC7UWblK3ZcwnjcxAgxFp/foAklOa+fGZBqbfdfoPH3N4tWeIrqEcoIWLYNbphD/LSX+Y6
	Cj5o9sYMg6E8rkMq1xVDrb3oQEqgDJt4gK6LDpJsPOTicIIrL87fbOnc7srrHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793787941;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o3uO33BWTvRzGT589zK5XHXlVqQazzRdbRxGw4lkcXk=;
	b=aFCcuWhsp1Rz+FS39uH9Jep8WwzbEDt5X9Up5FrfhiHMupYvat/6ZsySEzPCJQbFFbrwdF
	KxQfsflbd/FGbjgketDjDxiEn+2hXdq/QUXfdX/hn9MkcRlUk4K7KZQPX5inZV51ngDGxH
	oIB7VXZOgAg4jv6zK11cAa1CH+MPVj8pg+Uf6/8qUbf5eMCW7rNfx49qebB3SqkOXX7wCK
	u9AmNrsZPEEUK10aJK3NUbySExb7xvJ9jQPNOt1owma2lxC7CWI6AgDNp1UFTgKoXS0iiU
	MOHCpL73RQg2QI3XWSMy8OMvGqtPnFpWcm8xM+tuBQynPUYBWfjXIlQnceVmUQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1793787941; a=rsa-sha256;
	cv=none;
	b=W2SKAYeDEhEpB+KWH744MC/8Zua/10/EdN1knlfwc1zu3oHnUZNBLRDhvIToO9Czib2rc8
	ttW6//vcBNO82+tOTuPweTyX/nRR4Z7AbC3GD6HS726LZbYk++LEDxksFPWHt9BHbnWpcK
	OG+b2US90SeGVwPL6nQbqQWGLAdr9wssj3RIJH12VMFyi59Hyocz+TvK3UUS3TJdi4aTo6
	rOBFxvK4R//wbiwbT556vl5gcqkF+t/7KkgN4E14J4r8OYUCcJa7eKz9jyp3oyB9AD4FBa
	1rSsYoeu/4NZAATdwpGICbJiZk7+wqYyVkVOJBfhgH6VBVLUGxaHyUfOYokBsQ==
Message-ID: <9afb8ddc8451afad4f7ff7b9a133dd8542d07205.camel@pengutronix.de>
Subject: Re: [PATCH 1/3] hwspinlock: sun6i: Get the clock and the reset
 without names
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>, Wilken Gottwalt
	 <wilken.gottwalt@posteo.net>, Bjorn Andersson <andersson@kernel.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai	 <wens@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland	 <samuel@sholland.org>, Paul
 Walmsley <pjw@kernel.org>, Palmer Dabbelt	 <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti	 <alex@ghiti.fr>, Andre Przywara
 <andre.przywara@arm.com>, Bastian Germann	 <bage@debian.org>,
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Wed, 04 Nov 2026 11:25:41 +0100
In-Reply-To: <20260927025626.69614-2-tien.nguyenminh@embeddedlinux.blog>
References: <20260927025626.69614-1-tien.nguyenminh@embeddedlinux.blog>
	 <20260927025626.69614-2-tien.nguyenminh@embeddedlinux.blog>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On So, 2026-09-27 at 09:56 +0700, Nguyen Minh Tien wrote:
> The driver looks up its clock and reset by the name "ahb", but the
> binding doesn't define clock-names or reset-names, so a node that
> follows the binding fails to probe:
>=20
>   sun6i_hwspinlock 3005000.hwlock: unable to get AHB clock (-2)
>=20
> There is only one of each, so get them without a name. That is what
> was asked for when the names were added to an A64 node, and nodes that
> do set "ahb" keep working. For the reset, call the explicit
> devm_reset_control_get_exclusive(), which devm_reset_control_get()
> only wraps.
>=20
> Fixes: 3c881e05c814 ("hwspinlock: add sun6i hardware spinlock support")
> Link: https://lore.kernel.org/f720eaf9-01d0-0e57-f6bf-9aade00aafb8@linaro=
.org
> Signed-off-by: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
> ---
>  drivers/hwspinlock/sun6i_hwspinlock.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/hwspinlock/sun6i_hwspinlock.c b/drivers/hwspinlock/s=
un6i_hwspinlock.c
> index c2d3145880..e7cc121310 100644
> --- a/drivers/hwspinlock/sun6i_hwspinlock.c
> +++ b/drivers/hwspinlock/sun6i_hwspinlock.c
> @@ -104,14 +104,14 @@ static int sun6i_hwspinlock_probe(struct platform_d=
evice *pdev)
>  	if (!priv)
>  		return -ENOMEM;
> =20
> -	priv->ahb_clk =3D devm_clk_get(&pdev->dev, "ahb");
> +	priv->ahb_clk =3D devm_clk_get(&pdev->dev, NULL);
>  	if (IS_ERR(priv->ahb_clk)) {
>  		err =3D PTR_ERR(priv->ahb_clk);
>  		dev_err(&pdev->dev, "unable to get AHB clock (%d)\n", err);
>  		return err;
>  	}
> =20
> -	priv->reset =3D devm_reset_control_get(&pdev->dev, "ahb");
> +	priv->reset =3D devm_reset_control_get_exclusive(&pdev->dev, NULL);

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
