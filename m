Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C983338550C;
	Wed, 25 Feb 2026 23:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772062925; cv=none; b=TaKsV3+hcAsR4KiUhe8p+jAohJeRZB2wGppIz11rP7zl82Uedx4cjlEsfF0A4D1sdcRkkiSMYjK3GFeMvuUS63ENwOUkrUjcq0pKRwZZ0VnIngDGsqnh2/KDXILcA+mNo513zvtMP099NlM/bcEuFSIYTAVRJZnMxoMeJ8c5658=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772062925; c=relaxed/simple;
	bh=+kLd4kBxqmMOoBT2w4doXFJXq+I0YpcHX3PhBfW4T4g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bW2bw1Ocy+bXyiaGus8n+zb53nYstgGfwDAaFJteuCUJ7FM12fy0prhT/fE+lNFASTadlO1Yi8WyZM8iRtvBkinN2N7FEVfVjevdnjHT1zINh8plsLq1cU1cWDJritzg+cC05yTno8jp3doz6Q1+eUmvQMINp6RsBulIYO8coZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qx2s2gZP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qx2s2gZP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5D7CC116D0;
	Wed, 25 Feb 2026 23:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772062925;
	bh=+kLd4kBxqmMOoBT2w4doXFJXq+I0YpcHX3PhBfW4T4g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qx2s2gZPWUlpWU3jaT0R4i0YEVlBQ4j11iP6jI2NV/Ss/dmGq4ZBSSFftvZUz3rtZ
	 uGLENbYSxNmq1FMpgtr9J6vfZUuBv+16kAzHOf7OW/815BDbwThXcnLtFxtu+hAlz6
	 9m2lni9HBl6d/xAxTP9ZHdRMMPCYkyNWgHrdOFPa2mbfy6jlEhFHBSa+jG2jKTMRcF
	 z+VCdLP539Ofr043FQcr6k9q5ucR73RCH5XhqM8iEykW7O/M9risY9G/7eGBJRPRXz
	 vIfdR0DNzqUqhFwYvwq6sz0aZ4J4rr0olSqn62X0ug/ALfPwqtjmaYG+TCkggFHJdj
	 3U+xSLVDrqneg==
Date: Wed, 25 Feb 2026 17:42:01 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: tanmay.shah@amd.com
Cc: mathieu.poirier@linaro.org, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] remoteproc: core: full attach detach during
 recovery
Message-ID: <l7ar4qgfb7i4fsi2hclhokvmlln5wgkgwv3n6hdp3gehwsm72a@uz4ouv5kwlgk>
References: <20260223185006.1278518-1-tanmay.shah@amd.com>
 <20260223185006.1278518-2-tanmay.shah@amd.com>
 <tggyglgkgwj4skvyyeg74gdhlzmw45pmpakvrnghp5jsv6ujtp@z32a7g2s6sle>
 <fcbdd56d-7631-4ab1-adbf-48fd49c9a8cb@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fcbdd56d-7631-4ab1-adbf-48fd49c9a8cb@amd.com>

On Mon, Feb 23, 2026 at 03:43:56PM -0600, Shah, Tanmay wrote:
> Hello,
> 
> Thank you for the reviews. My response below:
> 
> On 2/23/2026 1:27 PM, Bjorn Andersson wrote:
> > On Mon, Feb 23, 2026 at 10:50:05AM -0800, Tanmay Shah wrote:
> >> Current attach on recovery mechanism loads the clean resource table
> >> during recovery, but doesn't re-allocate the resources. RPMsg
> >> communication will fail after recovery due to this. Fix this
> >> incorrect behavior by doing the full detach and attach of remote
> >> processor during the recovery. This will load the clean resource table
> >> and re-allocate all the resources, which will set up correct vring
> >> information in the resource table.
> >>
> >> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> >> ---
> >>
> >> Changes in v3:
> >>  - both rproc_attach_recovery() and
> >>    rproc_boot_recovery() are called the same way.
> >>  - remove unrelated changes
> >>
> >> Changes in v2:
> >>  - use rproc_boot instead of rproc_attach
> >>  - move debug message early in the function
> >>
> >>  drivers/remoteproc/remoteproc_core.c | 33 +++++++++++-----------------
> >>  1 file changed, 13 insertions(+), 20 deletions(-)
> >>
> >> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> >> index aada2780b343..790ad7c6d12e 100644
> >> --- a/drivers/remoteproc/remoteproc_core.c
> >> +++ b/drivers/remoteproc/remoteproc_core.c
> >> @@ -1777,11 +1777,11 @@ static int rproc_attach_recovery(struct rproc *rproc)
> >>  {
> >>  	int ret;
> >>  
> >> -	ret = __rproc_detach(rproc);
> >> +	ret = rproc_detach(rproc);
> >>  	if (ret)
> >>  		return ret;
> >>  
> >> -	return __rproc_attach(rproc);
> >> +	return rproc_boot(rproc);
> >>  }
> >>  
> >>  static int rproc_boot_recovery(struct rproc *rproc)
> >> @@ -1790,10 +1790,14 @@ static int rproc_boot_recovery(struct rproc *rproc)
> >>  	struct device *dev = &rproc->dev;
> >>  	int ret;
> >>  
> >> -	ret = rproc_stop(rproc, true);
> >> +	ret = mutex_lock_interruptible(&rproc->lock);
> >>  	if (ret)
> >>  		return ret;
> >>  
> >> +	ret = rproc_stop(rproc, true);
> >> +	if (ret)
> >> +		goto unlock_mutex;
> >> +
> >>  	/* generate coredump */
> >>  	rproc->ops->coredump(rproc);
> >>  
> >> @@ -1801,7 +1805,7 @@ static int rproc_boot_recovery(struct rproc *rproc)
> >>  	ret = request_firmware(&firmware_p, rproc->firmware, dev);
> >>  	if (ret < 0) {
> >>  		dev_err(dev, "request_firmware failed: %d\n", ret);
> >> -		return ret;
> >> +		goto unlock_mutex;
> >>  	}
> >>  
> >>  	/* boot the remote processor up again */
> >> @@ -1809,6 +1813,8 @@ static int rproc_boot_recovery(struct rproc *rproc)
> >>  
> >>  	release_firmware(firmware_p);
> >>  
> >> +unlock_mutex:
> >> +	mutex_unlock(&rproc->lock);
> >>  	return ret;
> >>  }
> >>  
> >> @@ -1827,26 +1833,13 @@ static int rproc_boot_recovery(struct rproc *rproc)
> >>  int rproc_trigger_recovery(struct rproc *rproc)
> >>  {
> >>  	struct device *dev = &rproc->dev;
> >> -	int ret;
> >> -
> >> -	ret = mutex_lock_interruptible(&rproc->lock);
> >> -	if (ret)
> >> -		return ret;
> >> -
> >> -	/* State could have changed before we got the mutex */
> >> -	if (rproc->state != RPROC_CRASHED)
> >> -		goto unlock_mutex;
> >>  
> >>  	dev_err(dev, "recovering %s\n", rproc->name);
> >>  
> >>  	if (rproc_has_feature(rproc, RPROC_FEAT_ATTACH_ON_RECOVERY))
> >> -		ret = rproc_attach_recovery(rproc);
> >> +		return rproc_attach_recovery(rproc);
> > 
> > rproc_trigger_recovery() can be called either from scheduled work or
> > directly from the debugfs/sysfs interface, it doesn't seem safe to me to
> > call rproc_attach_recovery() without ensuring mutual exclusion between
> > multiple parallel callers.
> > 
> 
> I think mutual exclusion is still maintained.
> 
> > In fact, I can see the relationship between the commit message and the
> > changes in rproc_attach_recovery() and rproc_detach(), but I'm not sure
> > why you need to change rproc_boot_recovery() and
> > rproc_trigger_recovery(). Perhaps you're just missing some explanation
> > in the commit message?
> > 
> 
> Here, I am refactoring how lock is used and that is why I have to modify
> rproc_trigger_recovery() and rproc_boot_recovery().
> 
> Before:
> 
> rproc_trigger_recovery() -> lock() -> __rproc_detach() /
> rproc_boot_recovery() -> unlock()
> 
> Now, __rproc_detach is replaced with rproc_detach(), which already has
> mutual exclusion implemented within the call.
> 
> After:
> 
> 1) for attach recovery
> rproc_trigger_recovery() -> rproc_attach_recovery() -> rproc_detach() ->
> lock() -> ... -> unlock() -> rproc_boot() -> lock() ... -> unlock()
> 

The concern I had was that we're letting others execute inbetween
rproc_detach() and rproc_boot(). But perhaps that's okay?

> 2) To call rproc_attach_recovery() and rproc_boot_recovery() in the same
> manner, I modified rproc_boot_recovery() and introduced mutual exclusion
> around it.
> 

No, in rproc_boot_recovery() you're locking around stop and start. In
rproc_attach_recovery() you're locking within each part.

Looking more at this, I dislike the asymmetry between rproc_detach() vs
rproc_boot(), and how I presume this then relies on rproc_boot() mostly
just calling rproc_attach().

This seems to come from the fact that rproc_attach() and rproc_start()
aren't symmetrical and rproc_detach() and rproc_stop() aren't.

It would be good if we could get this lined up, so that it's not so hard
to reason about the different code paths through the core.


Regardless of this though, the removal of the check for state !=
RPROC_CRASHED (under a lock) means that inbetween
rproc_crash_handler_work() and rproc_trigger_recovery() someone can
write "recover" into the "recovery" debugfs entry and we will recover
twice.

Regards,
Bjorn

> If you prefer, I can add commit message explaining this change. This is
> only refactoring of the code and no new feature though.
> Let me know if something is still missing in the implementation or in
> the above explanation.
> 
> Thank You,
> Tanmay
> 
> > Regards,
> > Bjorn
> > 
> >>  	else
> >> -		ret = rproc_boot_recovery(rproc);
> >> -
> >> -unlock_mutex:
> >> -	mutex_unlock(&rproc->lock);
> >> -	return ret;
> >> +		return rproc_boot_recovery(rproc);
> >>  }
> >>  
> >>  /**
> >> @@ -2057,7 +2050,7 @@ int rproc_detach(struct rproc *rproc)
> >>  		return ret;
> >>  	}
> >>  
> >> -	if (rproc->state != RPROC_ATTACHED) {
> >> +	if (rproc->state != RPROC_ATTACHED && rproc->state != RPROC_CRASHED) {
> >>  		ret = -EINVAL;
> >>  		goto out;
> >>  	}
> >> -- 
> >> 2.34.1
> >>
> 
