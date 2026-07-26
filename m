Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1B537DE85
	for <linux-remoteproc@vger.kernel.org>; Sun, 26 Jul 2026 21:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785101204; cv=none; b=khdRTayT4NivCSvFY4bqk4FMzXZkNJnYOj9OhVjCjNWG5gPTXmPVqVV3CMuJm5QH0Ejph+KdmAAR17cFAxJKZHvc6acvnZyrpbzgPa9S5/hRnN+kYN2hDTvZ119r1x5vmJwzz3uCkM7fAPPLrPhMSlPjVUPa8Sg9XlOw/iwcOSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785101204; c=relaxed/simple;
	bh=gBhQFqI2dKG9qfaD5pwmU/NWcDbEkP3Nw3AxTVGTNMc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CuK/9xHu5yIZtUvV5Nu8RBZUkZkHSxRjeDlyi7ssxYAXLZA0mhfKkQjsDTZY5jzhhGuhaIrSNfqxZYQ5BT4LkHH+Ri+dlQ1bimMCoOb19VSww9zJdotZkXqmFvyHsFF126cMRNnzRcf0q7IwxjI9kJBlJZs8ACmijZjagJUAERs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=aldk/zlQ; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="aldk/zlQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=fOXt
	0+DW8AwoHMy364Zh96oH5kpK8jw2a5xo15FcbZs=; b=aldk/zlQqt+KXBhkLoUZ
	LHwhB1FjVUohxf+en3aZCaVaXBXWJoVWGtnQkEe41zNYIRFWem1n+owocDbwRH0I
	6NFkIZ1tBEyYq/FBB2hiRojsWZ1oY3d7fNS/r9y2DnG3/qBDbjg3szMu0aZUw6SU
	KoLnWxiC6JHOG3skd3IfZkNdFnBrQqTh7wJe2Il4ybsEJJ+vPNmDR0sJ8BASbuKE
	Ep9SpEl7B5BoE9GELAhyjDqT+EMEVQDBfKwwrXxreqToysWAp97Ytt4I6wIe6rMx
	qRCPbwI5B8nYf+5pvLxIvwPCo7UxkpdZ8Rl+BXw6i2ab2BEj9gMXfLYD8q1VArSf
	Jw==
Received: (qmail 381745 invoked from network); 26 Jul 2026 23:26:40 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Jul 2026 23:26:40 +0200
X-UD-Smtp-Session: l3s3148p1@vTHoQopXQpUujnsw
Date: Sun, 26 Jul 2026 23:26:39 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Matthew Wilcox <willy@infradead.org>, linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v4 3/3] hwspinlock: add low level debug capabilities
Message-ID: <amZ7j59YnuQBaz2m@ninjato>
References: <20260718163024.1726-1-wsa+renesas@sang-engineering.com>
 <20260718163024.1726-4-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260718163024.1726-4-wsa+renesas@sang-engineering.com>


> > +static struct hwspinlock *hwspin_lock_ll_debug_get(u64 id)
> > +{
> > +	struct hwspinlock *hwlock;
> > +	unsigned long index = id;
> 
> [Severity: Low]
> Does casting the u64 id to an unsigned long truncate the value on
> 32-bit architectures, causing operations to mistakenly target a different
> lock if the provided ID exceeds 32 bits?

Addressed in v5.

> 
> > +
> > +	rcu_read_lock();
> > +	hwlock = xa_find(&hwspinlocks, &index, ULONG_MAX, XA_PRESENT);
> 
> [Severity: Medium]
> Since xa_find() searches for the first present entry at or above the index
> and updates the index variable, will this silently operate on an
> unrelated active lock if the exact requested id is not present, instead
> of using xa_load() for an exact-ID lookup?

Addressed in v5.

> [Severity: Low]
> hwspin_lock_request_specific() expects an unsigned int id. Does passing
> the u64 id here silently truncate it on 64-bit architectures as well?

Addressed in v5.

> > +static int fops_trylock_raw_set(void *data, u64 id)
> > +{
> > +	struct hwspinlock *hwlock = hwspin_lock_ll_debug_get(id);
> > +
> > +	return hwlock ? hwspin_trylock_raw(hwlock) : -ENOENT;
> > +}
> 
> [Severity: High]
> Do these raw debugfs accessors invoke memory-mapped I/O registers without
> ensuring the device's clocks and power domains are active?
> 
> Since this interface explicitly allows operating on unrequested locks
> (which are likely powered off), can accessing the registers trigger an
> asynchronous external abort or synchronous bus fault on typical SoCs?

True but it is still a great debugging help. I extended the comment to
explain this potential problem.

> > +		ret = hwspin_trylock(hwlock);
> > +		if (ret != -EBUSY) {
> > +			hwspin_lock_free(hwlock);
> > +			return -EACCES;
> > +		}
> 
> [Severity: High]
> If the second hwspin_trylock() unexpectedly succeeds, it enters this
> error path and returns -EACCES. Since the first hwspin_trylock()
> disabled preemption and took the hardware lock, does returning here
> without calling hwspin_unlock() leave preemption permanently disabled?

Addressed in v5.

The rest were pre-existing UAF issues to be fixed in the next series.
