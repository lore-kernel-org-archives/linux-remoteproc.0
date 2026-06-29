Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C8626CE32;
	Mon, 29 Jun 2026 18:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782759288; cv=none; b=dt8s5Z7meGe1WxEin7gNRnqlrVu7RPfy9O/U3id1FawVFFOEjhxOOQ4B3NZVOD0PRlVBNwY2MhUiXUZopoohZYLXs0YCds3TQTRCI7XfI2/VUi3HWYSXkr8hli2DNUaxygvakjjadq/0iVRSWfPTAJ2VN76XKdnB8sdNBq8rVb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782759288; c=relaxed/simple;
	bh=1dScwq5mvPpkqBTf/ZkQ6UVEHKcK15WA1fApB1NZQ0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WIBKFwItC+mvu3yUn6HAUnLzyTVPMxaSb3q4pBTrDdP0/wWAH2+NDZpbNgusiMr8eVFJLLRxoIGaXSKnBKoLxMwrHMvP5KB1D+mbsewDU/UNgaGFWCLGlDEz3Y7YO32khmAhhPHLJS2LuBNvkliaiDN+1VWGX7QlI0LXayy0ejU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=SsWc27rx; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="SsWc27rx"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=qsl40fQIxqbdLz3hLybRnXOfEA8BxmxR3c+bMd3WtcA=; b=SsWc27rxvhfwvFy6G5b2yCifrw
	les5Ib4t68NPofFpRRWFKta04iT4ld/Ee2cqOKgIymyIjuy+H80NVQVamkTEbMxMeYkap2py9u5j3
	F5xsQgWzumg6kA6ejZVRKQVcU2LPyI577FXyTKOfxU/jnAh4W5CUvCSto+wlZUuABbutnVMkKAXyq
	7MAAeWZbMR1GBF428Z0dDOXG3Dnm8NYyVp4DYLqP6815S0JSn9lbXaPRHkP4rYUd4YUDRSP2qeSXr
	nNmFN885w3Jt3NbXv5T0i9lPEK/dc/5rZeWnTlnkmt8bpMH4i8ag0sgo0cVzo+TXkHnwjQMimlfOJ
	CjczTn1g==;
Received: from willy by casper.infradead.org with local (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weH7x-00000003hCU-3edV;
	Mon, 29 Jun 2026 18:54:41 +0000
Date: Mon, 29 Jun 2026 19:54:41 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org,
	Baolin Wang <baolin.wang@linux.alibaba.com>
Subject: Re: [PATCH v2 0/4] hwspinlock: add summary in debugfs
Message-ID: <akK_cc4ebZB29luf@casper.infradead.org>
References: <20260622085204.54248-1-wsa+renesas@sang-engineering.com>
 <ajk_u7TVT-kL8z2A@casper.infradead.org>
 <akIzahjROM4GAlOR@ninjato>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akIzahjROM4GAlOR@ninjato>

On Mon, Jun 29, 2026 at 10:57:14AM +0200, Wolfram Sang wrote:
> Okay, seems to work so far. Thank you again! Will merge your patch into
> my series with your credits. Now I just need to wrap XArray into struct
> seq_operations. Seems no one has needed that in the kernel so far.

Huh.  I thought I had done that at some point.  But it was pre-pandemic
that I was looking at it so maybe I either never did it or I never sent
it out.

> > @@ -16,7 +16,7 @@
> >  #include <linux/types.h>
> >  #include <linux/err.h>
> >  #include <linux/jiffies.h>
> > -#include <linux/radix-tree.h>
> > +#include <linux/xarray.h>
> 
> According to some quick grepping, there are 102 users of XArray
> including this header and 423 users which are not including this header.
> Do you think this is a useful improvement to add the header directly
> (per subsystem to keep the number of patches limited)?

Our header files are a mess.  Trying to fix tham and keep them fixed
is a Sisyphean exercise.  Unlike our Greek hero, I have stopped trying.

> > -	void **slot;
> 
> Great, this obsoletes a fix concerning RCU annotations I have sent
> previously!

Yes, this was one of the things I hated about the radix tree API.
When designing the XArray API, I wrapped the rcu annotations safely
inside the XA_STATE() so users didn't need to care.  I'm glad you like it.

> > @@ -389,15 +375,9 @@ int of_hwspin_lock_get_id(struct device_node *np, int index)
> >  	/* Find the hwspinlock device: we need its base_id */
> >  	ret = -EPROBE_DEFER;
> >  	rcu_read_lock();
> > -	radix_tree_for_each_slot(slot, &hwspinlock_tree, &iter, 0) {
> > -		hwlock = radix_tree_deref_slot(slot);
> > -		if (unlikely(!hwlock))
> > -			continue;
> > -		if (radix_tree_deref_retry(hwlock)) {
> > -			slot = radix_tree_iter_retry(&iter);
> > +	xas_for_each(&xas, hwlock, ULONG_MAX) {
> > +		if (xas_retry(&xas, hwlock))
> 
> So, the unlikely(!hwlock) case cannot happen with XArray?

That's right.  The iterator uses hwlock == NULL as the iteration
termination condition.  It skips over the NULL slots for you and only
returns the entries in the array which are present.  There are other
ways to iterate over each slot in the array (but we have very few users
of them and they've never been worth wrapping up into an iterator).

> > -	ret = radix_tree_tag_get(&hwspinlock_tree, id, HWSPINLOCK_UNUSED);
> > +	ret = xas_get_mark(&xas, HWSPINLOCK_UNUSED);
> 
> xas_get_mark() returns bool, so I will update the code to match that.
> Makes it more readable, too, IMO.

Thanks!

> The rest I could understand, I think. Looks much leaner, in deed. Will
> keep you in the loop once my next iteration is ready.

Fantastic!  I'll take the liberty of replying to your next email here
too ...

> In hwspin_lock_request_specific(), the spinlock is taken, then:
> 
> hwspin_lock_request_specific()
> 
> -> __hwspin_lock_request()
>   -> pm_runtime_get_sync()
>     -> __pm_runtime_resume()
> 
> This starts with:
> 
> 	might_sleep_if(!(rpmflags & RPM_ASYNC) && !dev->power.irq_safe &&
> 			dev->power.runtime_status != RPM_ACTIVE);
> 
> Isn't this a problem?

Ah, er, maybe?  I seem to have overlooked this.  I mean, if that warning
doesn't trigger, than it's not a problem, right?  Assuming you have the
applicable debugging config turned on.

Assuming that we don't want to call pm_runtime_get_sync() under the
spinlock (and maybe for cleanliness we shouldn't anyway?), I would clear
the HWSPINLOCK_UNUSED mark in hwspin_lock_request_specific(), drop the
lock, then if __hwspin_lock_request() fails, set the UNUSED mark again.

