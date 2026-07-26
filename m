Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25292848A7
	for <linux-remoteproc@vger.kernel.org>; Sun, 26 Jul 2026 21:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785100834; cv=none; b=T6C1db60EeyMAQ/enKoEd1JtWrkp6Hmx8urDRnjwHgSF+s0rXg5DiEDOnDLdOLyflpj2/FsTRMUW8+IAlF17GUohkJQggSjY5fmh0BHbGa7kyJKI4d4v+sDjxmgRAPV8dctX/r2EL2lNmISIoFq7tpGb6BXbfdLNKlZaa0Ta+RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785100834; c=relaxed/simple;
	bh=xaw0Mb+q5PkSb1MpzXU+wHMjqmQSLlSFi7jfkBfZ7dM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WbVHNlX1KkGefGclXWnlwJYnOv/p5kmaOFAYY8CmII468+dSxcx2gAi+neO4vGRS8EGSssr67vvoTuW4R5WSRrapj1Ft1KcniL+b74XornNmcDYoy/qefRAKyTYl5PFD/uhKWt1B6KV3G3YY76Sp3hrwrCZwYjbHwzp677bocjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Wl80x8WG; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Wl80x8WG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Ex3Q
	XXeVSUpIwVc+ohhPFgzuqPYiexsiLxiZQ9jpyQU=; b=Wl80x8WGMBMJ6d4z0gOR
	hOt29VRX3onF3wcYicPVGUUZAIURDYee1baF/CBs3843zHAOTP2G8QzAnzw/+ze9
	6iw4u2moLjjmiSvr0E/d9WymZkeZZdEiG/zoG6QjhsRfeNxKZr077KDxid8nykIm
	PJfuqOrIjyk/3YMkpf1Ia/pm+MzM9PpoppvaEENlyyCBnRPYf1cU3/JOmB/4iRHA
	pKzzowbb7vpKOEG+oZc/gsbftAL6kBWP+cWS3BYVup+V8cphsjPWIAdzCiuTpRyY
	tayDLannTHlGD9UKGBqqioR9UTWUb11r/7O9SgqCFKbdu1fqHXRM6YBT1q6ryd+P
	bw==
Received: (qmail 380533 invoked from network); 26 Jul 2026 23:20:22 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Jul 2026 23:20:22 +0200
X-UD-Smtp-Session: l3s3148p1@TxJfLIpX7oIujnsw
Date: Sun, 26 Jul 2026 23:20:21 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Matthew Wilcox <willy@infradead.org>, linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v4 1/3] hwspinlock: Convert to XArray
Message-ID: <amZ6FReXAVUCO-pr@ninjato>
References: <20260718163024.1726-1-wsa+renesas@sang-engineering.com>
 <20260718163024.1726-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260718163024.1726-2-wsa+renesas@sang-engineering.com>


> [Severity: High]
> This is a pre-existing issue, but does dereferencing hwlock->bank->dev under
> rcu_read_lock() and later accessing hwlock->bank->num_locks after dropping it
> in of_hwspin_lock_get_id() lead to a Use-After-Free?
> 
> While the XArray (and previously Radix Tree) lookup yields a pointer to
> hwlock, the hwlock structure is managed by devres (e.g. devm_kzalloc) which
> frees the memory synchronously on device unbind without waiting for an RCU
> grace period.

My next hwspinlock series will tackle the plenty of UAF issues.

> [Severity: High]
> This is a pre-existing issue, but does aborting here lead to dangling
> pointers in the XArray when devres subsequently frees the bank memory?

Ditto.

> > +	xas_unlock(&xas);
> >  
> > +	ret = hwspin_lock_prepare(hwlock);
> > +
> > +	xas_lock(&xas);
> > +	if (ret < 0) {
> > +		hwlock = NULL;
> > +		xas_set_mark(&xas, HWSPINLOCK_UNUSED);
> 
> [Severity: High]
> Can reusing the un-reset XA_STATE after dropping the XArray lock and sleeping
> in hwspin_lock_request_specific() lead to a Use-After-Free?
> 
> This function drops the XArray lock and calls hwspin_lock_prepare(), which can
> sleep via pm_runtime_get_sync(). While sleeping, concurrent modifications to
> the XArray can cause internal nodes to be reallocated or freed.
> 
> Upon waking, if hwspin_lock_prepare() fails, the function reacquires the lock
> and calls xas_set_mark(&xas, HWSPINLOCK_UNUSED) using the stale xas iterator,
> which might dereference the potentially freed xas.xa_node.

I fixed this in v5 to be sent soon.

