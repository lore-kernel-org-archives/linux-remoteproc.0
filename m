Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.56.87.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794776656;
	b=OTl25JsK2lO+PX6HucKOGLZz571oSUaRLKXefICzJ+pwNbZgihiuGGBvCe8TQBEw4lbl
	 yrRihTsydNorcOM0Px2r6x+gE//Pp8VMZSbqcKby0+eCZpY6ODXGBe2P0w+uTLr4jAPgi
	 TzE7FtUdVNYf8dSd/9mesCSbZdqMCoITxlnI+FoBm6d7yeyFmxIV1Fi57u5rhN096yior
	 KnzIqsW9ioHjV7vdiD0WaHMlbYwsjNkVJyVtHcHvGvZJVTtyV7x17wHRTKEDbU8e4cl/W
	 yyXDG3upDBflvJyCwUgAVBajUSkmllddoam+EGkbquFUaFF6YcR76LzZwPhP68s8Kyw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794776656;
	h=DMARC-Filter:DKIM-Signature:Received:DKIM-Signature:Received:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-Source:X-Source-Args:X-Source-Dir:
	 X-SGantispam-id:X-AntiAbuse:AntiSpam-DLS:AntiSpam-DLSP:AntiSpam-DLSRS:
	 AntiSpam-TS:CFBL-Address:CFBL-Feedback-ID;
	bh=KcTuZ8qvTe5vxloxi+f2kSeY+XTzTrKJaAUcmXZjzOA=;
	b=zPN7kw57IDIFhR6J/I3dc8Ub2T6eXb/HoVXZFtld/J2DomEM0Zg52l0HI8t8dTIv1RwO
	 RhMxwDcrY17lhGhrdi0YiXoNa2hAjC695/n2fCui65kFfNQ/G2y01vwzW6F0inZFuOMv6
	 VGGHnE2Ng74pUrm8bYcRBqP5MHNxN8k2dqbCnjOvgotbyClcUAtKjBbKFq/0s8I1pq0op
	 TgMNNS5dJTtborYDjL9am2vlWLW6WIxyuE/EhrCcUlNKeUfv3zZd0qCaUf64vUQTVyjAM
	 Jq21yXxYwAYkcgjCTaVFxL4wHBgg0EPHusE/io/9eE5qEsmSkpWFFWunPf+jsRM96mA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=valla.it;
	spf=pass smtp.mailfrom=valla.it;
	dkim=pass header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=0lLlcBtE;
	dkim=pass header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=Xi92WCZa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.56.87.9
Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4685E606A883;
	Sun, 15 Nov 2026 21:04:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4685E606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=0lLlcBtE;
	dkim=pass (1024-bit key, unprotected) header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=Xi92WCZa
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-qv6g.prod.antispam.mailspamprotection.com; s=arckey; t=1794776654;
	 b=GywlanzW7prYW7uTCF6Ku5cFUGYBBdqKeRBwFsdf8dRXWvu10uROfG/WKFSAPKQPF6Y9b/57ox
	  6LpeFC4Djvumq1d1Gx0Bo+mND75lL4DtaCSfjxtIMwl3rZq28C40ubkbRv12cYIxnWKxVGogId
	  LRKl10vANHXoDHpaQ59VbOUEoYwOf4jF7FMMvC4tUpOSEmNn+Ys2Ja2+SpMpMvxiHfxLgQWzbV
	  19m6p+cIuuxhd4BZ+kTKXZOrjRC5gzL67FPtljtWeWmCXOJXF5DaCeMyV44cMZqQP46TNQ44zh
	  Dnaj2HmXST0x503xrQYvC7veGU7i9e+EcwEVSCEVmIzODw==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-qv6g.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-qv6g.prod.antispam.mailspamprotection.com; s=arckey; t=1794776654;
	bh=qvRI87OhkfV8z5niOsxk7r8wNFzHIb/D2KlukgscIrI=;
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:
	  From:Date:DKIM-Signature:DKIM-Signature;
	b=JAyGpA490hLE3oj43C+t5GT7bK+XAf9OZjiPvbaQsg0cabkqbPY32YFO3e6rjlYwUeNSTPJcAi
	  5/dEielVkZY34HyolSMTjKozTHn66a58PrD58nsMvHG3IrGe9uvpmZKGbt28wpj6wy3/BmPi4W
	  +ptSyvFinhwJZ/1xK0PqslZ9uzBl//cUtoAQ8eycVUOgB7FDV4jcJ9BLQdSxGZ91flO+UeeQNo
	  oAUJngDkuP45wRP+we/EOG4ynJMtYLPvpEPin+KSyAA+Ct8LrIyu31Gr1AHrPNqU+IeES//2eI
	  FGvRX7LN7s+mjDnC9YeVpbqgjwaB3JOOhIw+JzEn2WkphA==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	List-Unsubscribe:Content-Transfer-Encoding;
	bh=KcTuZ8qvTe5vxloxi+f2kSeY+XTzTrKJaAUcmXZjzOA=; b=0lLlcBtE6bkSwCl6NYyldu33CQ
	6swDYIUqLLkntIY74XavMT/8OFDyBoFM1UxMdL/JKkZw/xnrjMzmmmU4uPJaD+fiJ74zXUpKvEaXc
	rtD1/wAcJ7F22eCKntRi0YpnDrrbMAJBP+TWtEn9DyT4aDSNA0EPoY8/IIt9URW7N2/U=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-qv6g.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xShOR-00000004PXy-0zGb;
	Sun, 15 Nov 2026 21:04:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Subject:Cc:To:From:Date:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=KcTuZ8qvTe5vxloxi+f2kSeY+XTzTrKJaAUcmXZjzOA=; b=Xi92WCZaOHLbVn47osgzkYrr6C
	9hOKcav24QJfuYzYnmQU+M1aImWXQeza4vqEnkIpLMwLb/pWwN8p60GWuG1OsOVZ9492MpkiHmxwl
	UNIBFGkhm8P2feOMxegL22sJc1cvbaZHkQdPVW1JSLgDcePt707Fy8nhdJkY1iFT1AEM=;
Received: from [95.251.96.187] (port=63831 helo=bywater)
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xShOM-00000000Bb1-2Bhh;
	Sun, 15 Nov 2026 21:04:02 +0000
Date: Sun, 15 Nov 2026 22:04:00 +0100
From: Francesco Valla <francesco@valla.it>
To: Chrispine Tinega <dev@chrispinetinega.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] remoteproc: k3-m4: Leave crash recovery enabled
Message-ID: <avodrGAJY6tZtrpP@bywater>
References: <20261109054830.42715-1-dev@chrispinetinega.com>
 <20261109054830.42715-3-dev@chrispinetinega.com>
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
In-Reply-To: <20261109054830.42715-3-dev@chrispinetinega.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 89f2a380f271351277a7f0750beb8961
X-AntiAbuse: ID - 89f2a380f271351277a7f0750beb8961
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xShOR-00000004PXy-0zGb-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-qv6g.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

Hi Chrispine,

On Mon, Nov 09, 2026 at 08:48:30AM +0300, Chrispine Tinega wrote:
> The M4 driver disables recovery, but nothing reported a crash to the
> remoteproc core, so there was nothing to recover from. Now that
> RP_MBOX_CRASH reaches rproc_report_crash(), recovery resets the M4F and
> boots its firmware again, while Linux keeps running. The stop is a
> plain reset, so it does not need the crashed core's cooperation.
> 

This can be fine for a core started by Linux, but it's not for a core
working in IPC-only mode, where Linux only attaches. In that case, a
recovery action might start a firware living on the Linux userspace that
is different from the one originally started outside of it (and if this
is enabled by default, the user might not even notice this).

> Leave recovery enabled by default. Userspace can still disable it
> through /sys/class/remoteproc/remoteprocN/recovery.
> 
> Signed-off-by: Chrispine Tinega <dev@chrispinetinega.com>
> ---
>  drivers/remoteproc/ti_k3_m4_remoteproc.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
> index 4c46f4a25..fbd2b7c04 100644
> --- a/drivers/remoteproc/ti_k3_m4_remoteproc.c
> +++ b/drivers/remoteproc/ti_k3_m4_remoteproc.c
> @@ -56,7 +56,6 @@ static int k3_m4_rproc_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  
>  	rproc->has_iommu = false;
> -	rproc->recovery_disabled = true;
>  	kproc = rproc->priv;
>  	kproc->dev = dev;
>  	kproc->rproc = rproc;
> -- 
> 2.53.0
> 
> 

Regards,
Francesco

