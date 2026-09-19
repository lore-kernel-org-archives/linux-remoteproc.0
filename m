Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05F43B4E95;
	Sat, 19 Sep 2026 07:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.56.87.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789803259; cv=pass; b=padjqNC3uxe8rdlaBw9Qr1Lbrsgl6OXUSzTnK8XvLKir+f3QiG8goiNzEp/raG7N1Ue1/Vll1XuUn/W6y7qcBGPC3ZB5bSe/QylDWiNplKUFJ+xB81u6PDE5RNhEl5lYbYYIRA/2Cee5E/4ex19VFjx1M+98eI98gfALg2mzUuA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789803259; c=relaxed/simple;
	bh=llg/PF8nMnnpezaHPpy9KBWeZf3PiiHR8A/GPkRQCtQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ASjBJxtbHyce6I9RDWhKy+3a9Rj9Daamt34clL+LspOkyuN00BO7KuGg5rFYhV8DKMKNUyk9pYx0y8TrCgZ2MPSyyk1en9LUGGn6V49iemWPHfdKjQmWEj4Sf4iTwyjjRpWqxe7geUB2gZJksDJ2/jWXiqrUcpGSXxcFb50+Nds=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it; spf=pass smtp.mailfrom=valla.it; dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b=vmDl3blU; dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b=UpO1qiOn; arc=pass smtp.client-ip=185.56.87.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="vmDl3blU";
	dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b="UpO1qiOn"
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-h0bm.prod.antispam.mailspamprotection.com; s=arckey; t=1789803256;
	 b=eBn+xMPZWsM1o/HNsgNgXYeZSYY3oZUJvD8KhN3/mxc2ku6JRFNYokoUv3YF/R3+rSzokrSrg2
	  zNB9yyEDrH2I8WAGhNWyr1cxgljiwf2NYQdF9YxGkSDw/HvmlBsjZmNeeHsKhAA9HDflr6A5ST
	  urKATI05qtqW7102UzdGcPHEmXV9H1vFmQVVfwM4N4pXiCYolwrvNt1PpI2v+YwCd1kRhfRUQG
	  8qjloH457nM2K/eySLKdl6MqspQKJB0XZmRVUT4ojy48O9a3Sl6cU1vz8jptAU8m8KzmrTSbQP
	  /l4nyVyHdLxoDohnLjYtGbGdw6v0Z+kF+Qc/81/XjD9H4g==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-h0bm.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-h0bm.prod.antispam.mailspamprotection.com; s=arckey; t=1789803256;
	bh=llg/PF8nMnnpezaHPpy9KBWeZf3PiiHR8A/GPkRQCtQ=;
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:
	  From:Date:DKIM-Signature:DKIM-Signature;
	b=NqaNR07IvGyjneb+o9l3TxXzXr7Pw5GS1W0sr3WnBsYJ0JCUzb0UVCXBvfZQoRMpIWVLG7hjG9
	  x4gMs2smY97iY82gO+9o1FdJWte25+1qWhx5Z9ydYU4b3lJ51VoaUvs0Mt+mGZycQkta4KRFgO
	  6Dm8IqWYt7v/KXRmitR3qQ4GTA9f7m5iwN3sJHR9AEEdPQVevNDZg1wtA2Hd4u74n+XYUE59yl
	  Z+ShecXvPZLdCOEGqntsEQDO1LsPrpa1ezkrpfDee21zfKJ4VDWVbViLeYi2hgi9jtNywxLS85
	  jKeYrewiP0PbFXDRXPSzFzEkalXco/EtqnSD2Lcs0fRLDQ==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	List-Unsubscribe:Content-Transfer-Encoding;
	bh=1CgMYzN7u/XA+bnop2JDgsNdowKH5ww277Ab2jeFzYI=; b=vmDl3blUtrxlreVSwjC4zi2qOJ
	TwjCHnZAHzqDVUUypijxRLygjfCBdVWwqPfTflaCsd+WSBEuTo5cTU+Y0BkGBgFr/A6909k1F2jFs
	q6iQ3zdiKNgcfBB7HaUgri9hkf5aFwP6ZK+tfmh+3JU2/XQq7hpz1LkhrGVLrxF/yT0s=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-h0bm.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <francesco@valla.it>)
	id 1x7pa8-00000005bxT-3Rgn;
	Sat, 19 Sep 2026 07:34:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Subject:Cc:To:From:Date:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=1CgMYzN7u/XA+bnop2JDgsNdowKH5ww277Ab2jeFzYI=; b=UpO1qiOnq7xdcWjgHZmVoz6PH6
	qnX8EWkbIbCQnHos0YlsXjQrPVX98//3jAxv0fogZLwImFWx8HL4sgPGe3Cd6N7yD0LUfSxLJvPzr
	CCHTUlfULmZRgWrMaDWDzF0qYbREJFaOi177rp4/VFmpRK+nl7GD9XvXkPWjmtJwzthc=;
Received: from [95.75.45.71] (port=45394 helo=bywater)
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <francesco@valla.it>)
	id 1x7pZp-000000006o5-4BDY;
	Sat, 19 Sep 2026 07:33:38 +0000
Date: Sat, 19 Sep 2026 09:33:36 +0200
From: Francesco Valla <francesco@valla.it>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Robin Murphy <robin.murphy@arm.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Peng Fan <peng.fan@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	virtualization@lists.linux.dev, imx@lists.linux.dev, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC 00/12] remoteproc: add support for any virtio device
Message-ID: <aq453yukMHiNb1jp@bywater>
References: <20260916-remoteproc_virtio_map-v1-0-dac8c5eb4aa9@valla.it>
 <aq1sooGCYUiWbhMH@p14s>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aq1sooGCYUiWbhMH@p14s>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 96599686283de8ba6277d57333ca4895
X-AntiAbuse: ID - 96599686283de8ba6277d57333ca4895
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1x7pa8-00000005bxT-3Rgn-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-h0bm.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

Hi Mathieu,

On Fri, Sep 18, 2026 at 10:53:54AM -0600, Mathieu Poirier wrote:
> Hi Francesco,
> 
> I have started reviewing this set but given the size and implications, it will
> take me a few days to get through.

I'm going through the review done by sashiko - would you prefer me
sending a v2 with the trivial errors already ironed out before doing
a complete review?

> 
> Thanks,
> Mathieu
> 

Thank you!

Regards,
Francesco

