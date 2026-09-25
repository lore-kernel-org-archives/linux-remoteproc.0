Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775003BED2D;
	Fri, 25 Sep 2026 19:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.56.87.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790364411; cv=pass; b=aOZG/RtSxg99e8yW+FhJ7KLM3m3NQM3MK/KtTh2XVGaPJMMQuUbuMHewLZZzKSFSbebwWiTbKwltNjuM0TYTcpkz/e7bnteTcODDlQ0NsdTkW8PEOQNPV/shqFUSQz7EkR3KjeOYcjl2N5pBzim/EE7vAwZH8TQVpZAyAQzBEFk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790364411; c=relaxed/simple;
	bh=xgwXF789iMFU1tHJBCYfohzF1FMXCUeFcBdG42GdAwI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q3fJcvi7Ow7928OdpIKEG3baVo1LvDaMBB12laL92bop+oMdtHw/g5KjdHwSHZWRPj+hKjyIqOVc1JK7IF9m4ZD5DKmagYHmMoBjP3IaGuQEhdr6yPIsRfa4dY3ciwRnpTXmHiMoVF+6iKItYCX/cwpt52rPpWWVNXk71WxQ238=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it; spf=pass smtp.mailfrom=valla.it; dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b=2LEng0gb; dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b=TYJhyBN1; arc=pass smtp.client-ip=185.56.87.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="2LEng0gb";
	dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b="TYJhyBN1"
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-2q7f.prod.antispam.mailspamprotection.com; s=arckey; t=1790364409;
	 b=aVzn60tlrD5vs7gbcx+m4ZdzfUaQpZyAftHtZd3bSwgEjVrut1lZ3uO8NSq1/+fyBcrgm1iA3S
	  Z3d1663uhK7YGTzXagp1WVYIRqRmaCoNBxGzDsHru8C//19oehDh3binvWtejrKMxERZ4CsRh8
	  tiCWVbxdfnCTsk6MfVFlSM3HigVAXcbjaHhu4dvSTcY1trCJNf3skbMNNLE591bwjObssZUyJF
	  El7l/347JvdMER04wTqE/fUnoASEV/MGPsyYi202NAht/7JUax5RS0Qh+6Ce1fBdQfjF6JISv4
	  oYokRrIKh0ThPp/vrxynLCpcPSkrkqOWhW71h5L+3ZDrXg==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-2q7f.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-2q7f.prod.antispam.mailspamprotection.com; s=arckey; t=1790364409;
	bh=xgwXF789iMFU1tHJBCYfohzF1FMXCUeFcBdG42GdAwI=;
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:
	  From:Date:DKIM-Signature:DKIM-Signature;
	b=yOMOUZHSpH1E+i2R5bkK/lw93R1cuiitgAIygll4meeMHX8LBq9oqb6ljzOv9JZcDR4miQ58vH
	  m+N3Zn+wEZX98V6Rz8d+rYvJxaa0TTRhdm4fwhESnozH31aXv9wjIFPhSMkytDno5UuT/9KbXb
	  hs86lrY161A409muhfJYcZBPN9mZmMcdeUuS+hoJf7mwrWpt5BQ0ANwWQmLwIPDqrJWrfK2R6W
	  pn1r5bWSLq6LvtAbOOovdOeino//hRGI9BwPxpehIsKqBMOuroVyznAcbilR8S/tAQ0Hxgz44P
	  lBN+gB4jxryKx2mHkbnceGM5ENLgeDzxOQQ/oCrFFHjhfg==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	List-Unsubscribe:Content-Transfer-Encoding;
	bh=pe3VO7IOUXW8W+2mymQNpuRLjGNQ7piBXOGa6ZWGAGA=; b=2LEng0gb+r1XlJ4s46SYtuAnk0
	+hM+rAsIa2c48CkDmoeeThoOoIb4g7tUjrwDiGDT5ugMdETMeT29eWU9l8tlU1LYUfeR9wJFs7ZLD
	GcfHkG7L5Oh/8Kk5fLb+hzWuSXenLtTG0a6p/clIo0GKe8xwtmvQ/TF/fG/lDg1dODVk=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-2q7f.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xABZA-00000006fTs-15dS;
	Fri, 25 Sep 2026 19:26:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Subject:Cc:To:From:Date:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=pe3VO7IOUXW8W+2mymQNpuRLjGNQ7piBXOGa6ZWGAGA=; b=TYJhyBN1lLzM3j+8pakSQMWVuQ
	t9mPBySmzyc3WNNnz8yxKZciuJ4xoz92WA8IDQ9Cf+qyAtkbvu2kdW9CFkJo1rvQUlA6QAnv+Os09
	A/+p5mE4ALa7sex5tsF+sHPQqVKAeFRcuB359Jqm8Xwur31oJ9WFh59QQVbTtu6FCDtM=;
Received: from [79.45.60.29] (port=62628 helo=bywater)
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xABYu-000000007dA-1S38;
	Fri, 25 Sep 2026 19:26:24 +0000
Date: Fri, 25 Sep 2026 21:26:22 +0200
From: Francesco Valla <francesco@valla.it>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Robin Murphy <robin.murphy@arm.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Peng Fan <peng.fan@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	linux-arm-kernel@lists.infradead.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, virtualization@lists.linux.dev, imx@lists.linux.dev, 
	iommu@lists.linux.dev
Subject: Re: [PATCH RFC 12/12] PoC: arm64: dts: imx93-11x11-frdm: add
 multiple vdevs
Message-ID: <arbILwxDF9lZZtd7@bywater>
References: <20260916-remoteproc_virtio_map-v1-0-dac8c5eb4aa9@valla.it>
 <20260916-remoteproc_virtio_map-v1-12-dac8c5eb4aa9@valla.it>
 <3065678.e9J7NaK4W3@steina-w>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3065678.e9J7NaK4W3@steina-w>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 1c9dc338d8a14fb2ac9e92178055ff3e
X-AntiAbuse: ID - 1c9dc338d8a14fb2ac9e92178055ff3e
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xABZA-00000006fTs-15dS-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-2q7f.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

Hi Alexander,

On Fri, Sep 25, 2026 at 10:39:46AM +0200, Alexander Stein wrote:
> Am Mittwoch, 16. September 2026, 23:10:57 CEST schrieb Francesco Valla:
> > Add rings for multiple vdevs, as well as the required virtio nodes for
> > I2C, SPI and GPIO functionalities. On top of that, add example
> > peripherals using all of them.
> > 
> > NOTE: this is a Proof-Of-Concept, not meant to be integrated!
> > 
> > Signed-off-by: Francesco Valla <francesco@valla.it>
> 
> Just a general question, unrelated to virtio, but related to AMP: How do you
> manage the clocks, so that Linux doesn't disable clocks needed by the
> Cortex-M?
> 
> Best regards
> Alexander
>

Clock management for remote processors on i.MX93 (and other i.MX parts)
is... not really a management, AFAICT. If you want to use a remote
processor, the mcore_booted argument shall be specified in the kernel
cmdline; this forces the clock management driver to leave root clock
gates enabled for *everything*, leaving the possibility for the remote
processor to use anything it needs.

While out of scope for the current patchset, some work in this field
certainly is on my (long) TODO list.

Current implementation can be seen in [1] and [2].


Regards,
Francesco


[1] https://elixir.bootlin.com/linux/v7.2.7/source/drivers/clk/imx/clk-imx93.c
[2] https://elixir.bootlin.com/linux/v7.2.7/source/drivers/clk/imx/clk-composite-93.c#L83

