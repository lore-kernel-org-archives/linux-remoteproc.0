Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.56.87.5
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794435733;
	b=XfB9P4+0DZMIPFDyP4odmEY1kYq5Vcd4JED+panC7UYGdTiE0dM92tE8ALmrIagi5vV7
	 XbywWhIc14taBqEM/5FVWXMltk+GsMEvrroUcj2AwbfmVyU1rSMGVG9UWTqpLPoRXfnmZ
	 3VHc07pHnLqrdyTfof58uWwcxDzCRvT0S5rzB4JdlNhu7DiRVgtJoNu1dMUsruoJfmo3V
	 GYOFoHodf9cRgNvl/VVJkBB4cPRr1s0YgJOkhSDTq/7HqSIT9B6rkPzbZBQWGPJZLQZDe
	 gfyqvpIPZVaRBMnOnx0id0uEx07qln5SpizBoiDZTxuR470Eud9UE4NFVY7e7NjyT3g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794435733;
	h=DMARC-Filter:DKIM-Signature:Received:DKIM-Signature:Received:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-Source:X-Source-Args:X-Source-Dir:
	 X-SGantispam-id:X-AntiAbuse:AntiSpam-DLS:AntiSpam-DLSP:AntiSpam-DLSRS:
	 AntiSpam-TS:CFBL-Address:CFBL-Feedback-ID;
	bh=7cTCcGXBezpytdcayghG2BH5NlVzbXA8KkJRrmoLFxA=;
	b=EptnLuptREKgenBpTPhvyrykEk0B5/VRfuKz9up27W4ECgc410f4ihOSBwfaWAsv/bxp
	 4XYQxQlVLXWgJVcsfLSWqgH+R4eQJAumNALguBP4PgLPpjdS3Rva8rPx/tVy0VMIfCfKx
	 oisaVcBvTky7AD1KKSIHdgI75KQqrct1vbtecXgcHAfH9HknIXhAZDMeRfoROYRIuthgb
	 A/dn31/xVrgDyIXS1Xp2HPUVdQSOCcfAxay5YtLweOYTuUVnEvxgmcZGn5gz0FhEAojND
	 1mfGAMJjhhV0Jlx+zIuLYUzEEsK7A2at7xzLHl/tY+yfPAZudZqH80gVdAQIkHbeCmw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=valla.it;
	spf=pass smtp.mailfrom=valla.it;
	dkim=pass header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=GHFZR35R;
	dkim=pass header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=R3S3IJB3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.56.87.5
Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661F7606A326;
	Wed, 11 Nov 2026 22:22:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 661F7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=GHFZR35R;
	dkim=pass (1024-bit key, unprotected) header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=R3S3IJB3
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-ssp3.prod.antispam.mailspamprotection.com; s=arckey; t=1794435732;
	 b=M43IQTNYik6rMgAT/EJDZl5wL/5nR/WJAfvOYLbt5jFhNlwcPk3ksY0VUV6feuSEiwZ2YHku4j
	  F9X+f5Lx/JaCqQbiJhp+xvEKz/STUQfk+5frZvKCnpcoNXYv5DNrH3v6Q9IbRVIYj9ZCh/lwPv
	  jiFFlHuXH4rE7+gx+DkmiQ0l6+HRgZEc/Fq6+q0YNlTrMjjBbvJ/nM5r6eIHJ8bClwiqZHhKLv
	  7K56xghtOE3TL7VWBAxfX/vNy2D2EFyLRptfq5xyv29hyYe9b9dDFaI2mGDfTT7hIw2kZrgBVi
	  2exX+FHxx99G8bgsCJLsdIueInqrmbwYpC8+iINrsvHXQw==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-ssp3.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-ssp3.prod.antispam.mailspamprotection.com; s=arckey; t=1794435732;
	bh=bkn+2okFpyouLkYg2+qrterp2SbLwOmfFBx9UZfdWr4=;
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:
	  From:Date:DKIM-Signature:DKIM-Signature;
	b=Ho810c0eUFW/GG1Mtg1lvLNEF1/wy257KRrJcK8iKOg1g3CStIeeyYzpsFRUSFizXnITmWO8GZ
	  Qv/VawtfeqcHlp/yLNikA8EaOfTfaUKkdfqWK8kT0b7fXS0vhID++rZLtIc5L6DzHg0xZ9HoGd
	  o4RI7MZ/ZfgKFh+WEB1gi0Fwjau9My0MFOENDpVcqnusDowKAH8J7WJ+58xiQdHJE3uCVQE0yc
	  y+m2d81hYpp3IXhYZaY74FcUBd1RJ6wv9g0kZdavUBD83SeY3jgzfMX490+P3QSyGOtru2qiUq
	  gYkV1O+wtEWiRdCYDB+XO9GIsS5HnkM3+ZscfFM8ZpydPw==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	List-Unsubscribe:Content-Transfer-Encoding;
	bh=7cTCcGXBezpytdcayghG2BH5NlVzbXA8KkJRrmoLFxA=; b=GHFZR35RnY7rpM5S7MB7Gt8zS8
	LNKOYuAQQlbLTBggoVxJBpNCf685bXbrqJOrhX7ClAYjnSlLWUYIMVkaod93wKRlHVr2RT+OoXlxe
	FNy1FN4t4X2d7zKp5Aff0VKqO2cN/1+Ah7e96vPVQ8V1DU0IRc4vYUxPHRtS9DKyPkaA=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-ssp3.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xRGhg-00000000j0F-1oHa;
	Wed, 11 Nov 2026 22:22:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Subject:Cc:To:From:Date:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=7cTCcGXBezpytdcayghG2BH5NlVzbXA8KkJRrmoLFxA=; b=R3S3IJB3I6btqMRM8mm1EGkQxg
	N9y5sBN0y4W4MEGboAte5dC8ZYtvj7D/tKe+BMbgfBnVZKAgrDAE1gXYwpkl0F4pps0uf9rfV2q6b
	0NTo/QLMfx5IJQwEnrcmvyooSOZ/BTke5tEABNJMB5RobHUPBQwNJd2pJIMDxsnxCNv8=;
Received: from [79.17.15.196] (port=64037 helo=bywater)
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xRGhc-000000009rf-0dJR;
	Wed, 11 Nov 2026 22:22:00 +0000
Date: Wed, 11 Nov 2026 23:21:58 +0100
From: Francesco Valla <francesco@valla.it>
To: Chrispine Tinega <dev@chrispinetinega.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] remoteproc: k3: Report a remote crash to the
 remoteproc core
Message-ID: <avTnp6EDSU-0BL_u@bywater>
References: <20261109054830.42715-1-dev@chrispinetinega.com>
 <20261109054830.42715-2-dev@chrispinetinega.com>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261109054830.42715-2-dev@chrispinetinega.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: b4ffac9a1755688dd7a5fd2e58e67c94
X-AntiAbuse: ID - b4ffac9a1755688dd7a5fd2e58e67c94
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xRGhg-00000000j0F-1oHa-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-ssp3.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

On Mon, Nov 09, 2026 at 08:48:29AM +0300, Chrispine Tinega wrote:
> A K3 remote core that faults can send RP_MBOX_CRASH over the mailbox,
> but k3_rproc_mbox_callback() only logs it. The remoteproc core never
> learns of the crash, so its recovery never runs, the crash is not
> counted, and the core stays halted with every rpmsg channel to it dead.
> 
> Call rproc_report_crash(), which may be called from atomic context. The
> core then moves to RPROC_CRASHED and the crash is counted. Where the
> driver leaves recovery enabled, recovery stops the core and boots it
> again. Where recovery is disabled, the core can still be stopped and
> started again through sysfs.
> 
> Signed-off-by: Chrispine Tinega <dev@chrispinetinega.com>
> ---
>  drivers/remoteproc/ti_k3_common.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
> index 4b6da3363..d799f377b 100644
> --- a/drivers/remoteproc/ti_k3_common.c
> +++ b/drivers/remoteproc/ti_k3_common.c
> @@ -60,11 +60,8 @@ void k3_rproc_mbox_callback(struct mbox_client *client, void *data)
>  
>  	switch (msg) {
>  	case RP_MBOX_CRASH:
> -		/*
> -		 * remoteproc detected an exception, but error recovery is not
> -		 * supported. So, just log this for now
> -		 */
>  		dev_err(dev, "K3 rproc %s crashed\n", rproc->name);

Since rproc_report_crash() is already logging the crash detection (also
printing the name of the rproc), maybe this print can be removed?
On the AM67A (MCU R5F remoteproc) the following prints appear on crash:

  [   29.107991] platform 79000000.r5f: K3 rproc 79000000.r5f crashed
  [   29.108025] remoteproc remoteproc2: crash detected in 79000000.r5f: type fatal error
  [   29.108032] remoteproc remoteproc2: handling crash #1 in 79000000.r5f

> +		rproc_report_crash(rproc, RPROC_FATAL_ERROR);
>  		break;
>  	case RP_MBOX_ECHO_REPLY:
>  		dev_info(dev, "received echo reply from %s\n", rproc->name);
> -- 
> 2.53.0
> 
> 

Regards,
Francesco

