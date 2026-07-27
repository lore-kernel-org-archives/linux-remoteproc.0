Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5373E1682
	for <linux-remoteproc@vger.kernel.org>; Mon, 27 Jul 2026 08:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785139398; cv=none; b=P9u/rxCY3RQmo0w37INmicSUX0gjJaenvATeSmj2rZ5C789QaFgRZLBOxW0pujIxrTXiFuvGErw5QFW21enkkFSCDbJZuj9somDf5diEO9wrsNC24HMJeh/oSBwF/Hv0tqhusCBPJC2A+4mrnVKH0WYGq3mJ9DnTws2DGabPpmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785139398; c=relaxed/simple;
	bh=t5kaYCeu1Ezzn4lCug++xzUb8zc7ByA/ieLJ5lUmBCI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h33Hx2q73UksTm6rk8ocMOuHhtI9ap1OpdYVLoVZIio7ev9g+jDGh6PAyFSeTQeEMnNOgMTce4k1KiCqfFG9aFvUW44tMIkKn/6FEj4QpikKBVhSdbghxDABpJXT0MPsRG/h+kfUuHLwiqTaeSlL5aRze2TbT+UM0+oWzfeKXu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=XhoghJI5; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="XhoghJI5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=+H93
	fKZkBTV6FWeCjYIDQCHvIzMcOAZvw+Btc/3nxgk=; b=XhoghJI5/gP0bUUiqodq
	w9H2Xe4EK0z5qxUC8AG8bBpBEdE7RFWx/z5RjNgaPgdtJasRXXp9CG8CvmDmrrhI
	I9neb9/QF11Rcrxm6tLGpROlIpXrAzGci1SiTLXnw9hGLHZEeIMUEkzvYyXV9oeC
	M+RFXuU5m6rdB7eBEZolSGHJR8K9yut9mabQdeP3ccgZqY4mcPY92XHMFPPbWhLX
	j2FcDeOdGK3uNgCMXk1hEVqr01gjTMWWgA1uXO8kRVhghYIrwwfg6CGxSGTIUpgx
	fP+CnHlyymIIHk9nSr9Rt0ffWjysUMdog+T3yJESrgtLonxTx0JH5z+7ipPSnj/D
	bw==
Received: (qmail 527372 invoked from network); 27 Jul 2026 10:03:11 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Jul 2026 10:03:11 +0200
X-UD-Smtp-Session: l3s3148p1@Zs5EJ5NXTpQujnuy
Date: Mon, 27 Jul 2026 10:03:10 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Matthew Wilcox <willy@infradead.org>, linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v5 3/3] hwspinlock: add low level debug capabilities
Message-ID: <amcQvjpxQHzUNrIx@ninjato>
References: <20260726214219.17703-5-wsa+renesas@sang-engineering.com>
 <20260726214219.17703-8-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260726214219.17703-8-wsa+renesas@sang-engineering.com>


> However, hwspin_lock_request_specific() takes an unsigned int, which
> will truncate the value.

True. XArray uses ulong, but hwspinlocks are actually uint. I'll replace
the ULONG_MAX with UINT_MAX.

> > +		ret = hwspin_trylock(hwlock);
> > +		if (ret != -EBUSY) {
> 
> [Severity: Medium]
> Does this actually test the hardware lock exclusion?
> 
> hwspin_trylock() internally invokes spin_trylock() to acquire a local CPU
> software lock. On the second call, the local software spinlock will fail and
> immediately return -EBUSY without ever testing the actual hardware lock
> operations (like hwlock->bank->ops->trylock()).

Bummer, I was quite sure to have used hwspin_trylock_raw already here.
Seems to have fallen through the cracks.

v6 on the way...

