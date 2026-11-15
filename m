Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.56.87.10
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794777076;
	b=BtTi6Yg8ZLfL9c5uFhLUrQoskdT7CKNgCfNKzCnl3e/grVttkV1YnjaJ/sGjrKR4heHW
	 rqEXwSVNGNW+5VPPqx/HWOMyYD/hrSmfuKON9EblsnJDhRkmGpaXI9Ecj5Hge+A7WyET5
	 4cFbpHmIflYvrw+bPkfDGdgD7H/SSuwwY+3iJ/vwNsPKh/Y6Ol82fy9xL4Q14JP1iN9S1
	 2tU1oEy/EFsLoMC5QKyICNUrngz96i7YZ3hh8MkZi0GFPhAvWJ0YCKXzss307fV687vfn
	 h1QjERl7xMYRyl9kk7sCTTK+yMeVw6D3O3Qsn68vHQVj4vkA4LWlRnwE9V8kS6Fg/gw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794777076;
	h=DMARC-Filter:DKIM-Signature:Received:DKIM-Signature:Received:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-Source:X-Source-Args:X-Source-Dir:
	 X-SGantispam-id:X-AntiAbuse:AntiSpam-DLS:AntiSpam-DLSP:AntiSpam-DLSRS:
	 AntiSpam-TS:CFBL-Address:CFBL-Feedback-ID;
	bh=b77iwUYAJh0ewHoZEG7nauEMCrRKOsPl8v2caBXId18=;
	b=t0Q048HWAZp80cIaot5EzPmNPqHbsTriGqQn9agfqP9L9T6hBO3WnYlpprS+rI4e0jed
	 2gj2Yjz3SJo1BdaTSWOP6yKxzXgxlOIKkYXmDaoHym84GT5QMFwKagsxK7kLcf9Kgsieu
	 fA4yjJdRTMvNqPYQ1+VTWydaIydeX7aPqZqxHXImXUJaKtrH5C+ZPQPy+SCPvzM9Scjgk
	 bgJPAYDAVAcxhFILlSl2sNqEtdrWs9JH+JUUa5P2lwOhhBi5V64hK5aAS6j3rCbFxwSIF
	 Wj91denIGrHrNUyA+t5bLdkUMX5EtZyL1YwkoetAODoRMfEGtoVQd0XtZ9rv9NjIO1g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=valla.it;
	spf=pass smtp.mailfrom=valla.it;
	dkim=pass header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b="f6TZ/K8m";
	dkim=pass header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=Stbe2Bzf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.56.87.10
Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A21F8606A323;
	Sun, 15 Nov 2026 21:11:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A21F8606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=f6TZ/K8m;
	dkim=pass (1024-bit key, unprotected) header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=Stbe2Bzf
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-c9nw.prod.antispam.mailspamprotection.com; s=arckey; t=1794777075;
	 b=IxZTzGxffattt16ulqfCTNRJ21tPvsPTj+TSxCCQv+QbZgmkkQ2VB2fB0T9P5HFxDESnIx+CjS
	  HXsahaTKtpW72K/q7ANVKr+fuj1ICKTUZhEqDmZPPcJfxERih1i0nAVK8UWUzL8v0/e+/TWWfA
	  DtHLSYSHxmnNcb0X3FEoTQDQ1nqwnmnRaAH/eXEERDce37nCta/P25uymSS1P1Ub6XnSEzVLCx
	  ppxWaBcm64Y7HP3o38Tu4ZZZjar2+QshgQC/PlAPKyna39+KPcd2GZPoRz3DPhfjMqJNTCUeEA
	  kTxPmw+4LA979aWvvGgTG/8Y5BNipg/HXVn4TQF7D41cBA==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-c9nw.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-c9nw.prod.antispam.mailspamprotection.com; s=arckey; t=1794777075;
	bh=Wi5IaarPhghlhyqSQAhMSH5yZO4UGYC1tXrfM03jcNQ=;
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:
	  From:Date:DKIM-Signature:DKIM-Signature;
	b=nwiX0llX69FeWdM+v1Y72eoucGQD2fw4h3ophH9usW4+i0W96nx5VsCTiF5mgUYHmAUL67xrwg
	  vSlwHG7iWflQCy6OF4Ga35SaovxyV8Qn3bpHMGvgwl3Tr1hBOSa/ygHGM+DbMMG27JTETcR5RV
	  kWJfYs4zcUD4iL7qOnWSx5I1TPk7mfDZvOWZHKK/Em2dpES331oyqMbBpk4dBeROMKWL4iqGAm
	  fLxapl8ADrEfKsB/gdQr+eIw5e0pKHeOsTAtKn29M9uDmNNOxkENTwss30HR/O3tCR3R5zw3vv
	  d/YdrlFNyJAUpBBUGm0y29ZmVanybEPQupqEn0QNoTISbA==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	List-Unsubscribe:Content-Transfer-Encoding;
	bh=b77iwUYAJh0ewHoZEG7nauEMCrRKOsPl8v2caBXId18=; b=f6TZ/K8mBj6VN/8dheNy6g3Yz0
	uEzX6DBA9v4OgH2QWMtCzive0ZSRJoCXpwK5Oktn3wTvbTjOEGHGAGICLAJ1d1TbYn0ca0STFqLrc
	GaF3uDbeE/OeeQo9SDmPjZNg9dr8p4JO7bRTnLBX+i1MrWOQJsTeWb4hFQQzk5qYEyEw=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-c9nw.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xShVD-00000005YFI-1j8j;
	Sun, 15 Nov 2026 21:11:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Subject:Cc:To:From:Date:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=b77iwUYAJh0ewHoZEG7nauEMCrRKOsPl8v2caBXId18=; b=Stbe2BzfAyhIiXLnHaaURdebdd
	WmGU0/EfLnyRvYeuBb7QLlmroybk227IxHLJ6Uvu2Xir2P/jzuq55bLYKY8HGdLhs8QY6zee/ZQb7
	maSe5ECJVbfPGum4Zk778HLHa0f4KsrD/xMp4Xijxdk4E961qMpZVb6BRVdMdZl4Rgpk=;
Received: from [95.251.96.187] (port=60415 helo=bywater)
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xShV8-00000000G4s-3mAU;
	Sun, 15 Nov 2026 21:11:02 +0000
Date: Sun, 15 Nov 2026 22:11:01 +0100
From: Francesco Valla <francesco@valla.it>
To: Chrispine Tinega <dev@chrispinetinega.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] remoteproc: k3: Recover a crashed remote core
Message-ID: <avoem-QRseasexkV@bywater>
References: <d22a1ffd-cfbc-4122-b11a-7b680985defd@valla.it>
 <20261109160431.720498-1-dev@chrispinetinega.com>
 <avJbc4Aebflkjgap@bywater>
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
In-Reply-To: <avJbc4Aebflkjgap@bywater>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: eed9ac54d43cc178fc378b317069e8bb
X-AntiAbuse: ID - eed9ac54d43cc178fc378b317069e8bb
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xShVD-00000005YFI-1j8j-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-c9nw.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

Hi Chrispine,

On Tue, Nov 10, 2026 at 12:55:54AM +0100, Francesco Valla wrote:
> Hi Chrispine,
> 
> On Mon, Nov 09, 2026 at 07:04:30PM +0300, Chrispine Tinega wrote:
> > Hi Francesco,
> > 
> > On Mon, 9 Nov 2026, Francesco Valla wrote:
> > > If you share details on the Zephyr side of things, I can test this
> > > against rproc-next on a AM67A (BeagleY-AI).
> > 
> > Thank you, that would help. The AM67A has no M4F, so patch 2 does not
> > apply there. Patch 1 does: the R5F driver uses the same mailbox
> > callback, and it keeps recovery disabled. So on the main R5F I would
> > expect this:
> > 
> > - Without the series, the crash is only logged, and the core stays in
> >   "running" until the next boot.
> > - With the series, the core moves to "crashed", the crash is counted,
> >   and it can be stopped and started again through sysfs.
> > 
> > The Zephyr side is upstream's openamp_rsc_table sample with one file
> > added. The handler sends RP_MBOX_CRASH over the mailbox before it
> > halts, and a thread forces a fault 20 s after boot. This builds on
> > Zephyr v4.5.0 for beagley_ai/j722s/main_r5f0_0, but I have not run it
> > on that board.
> 
> I did run it on the "MCU" R5F, and I think I found a bug... in the Zephyr
> ti_dmtimer code! With that fixed, the functionality seems to be working
> as expected, but I'll stress it a bit before declaring a Tested-by.
> 

An update on this. Recovery is definitley _not_ working on R5F remote
cores in case of crash, because the reset action that is required from
them to re-start correctly is in do_unprepare(), which the recovery
action does not call (while sysfs does). This is of course out of the
scope of your patch set, but has to be considered (maybe deserves a
note in the commit message?).

Regards,
Francesco

