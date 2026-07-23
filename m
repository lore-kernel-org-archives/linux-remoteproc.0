Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8F4340A7D;
	Thu, 23 Jul 2026 22:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784845747; cv=none; b=af+F8v4zGAnjdjOkq86+Y9UcGZTuiFBaxvmVKch4P51a8kOLv5s6fK9KT/Gk8q1G6OiQcMXbP055VjWJI8/y3UFI793hXUjPJrzDVzlyaWgyWBUCrugOqI16g7ylYzNkv0Cm6n8GPAK0YT70PIE3rKelEi/kXXOW9+t9768D0sE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784845747; c=relaxed/simple;
	bh=qu5CxMIWIJVaJK+7CNsQYxhAlBR7RKgtK3OVp2ALemc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PsQi3J2hi6LurQDCY9PlsUWpJSo0jAndkevoX/AESE2Tvsg71zvBihQWlLyOmBbmxI06iD8J5TtRwaRqJ/jl0zRYC+SABNLs+Rw5yCTreypwTrJYGftEcEUsDitAeG0lcRoU84D8WYofQsYN0PN6JDiNZC9Yqm2aM67+2fHFOpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bQht/QPy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bQht/QPy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FC3D1F000E9;
	Thu, 23 Jul 2026 22:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784845746;
	bh=6mKt/jRCWhMk1ySH969VHmthfM8d3CXYUfheeUxwT1k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bQht/QPyUzS6Gtwprfc2GgZtoNaS0W7YzItW9SX3ylx116aNgg7W3knhxwU8VHzVA
	 ie65PF9K/PJ/I5Xtq7EaC0vGl7PeA4roaaaAWndUL7TRqOZOuzzNOXo/jAbM6kedML
	 mA9apxRKnmT4HvdRCULNfY5/rnQEjH90zj1fxmkaL2rOlFLyUwYbqk9crL8zLosCbo
	 Np4c3J5JM6hYlbG4E7k7tVxRy7PBSN4i1/MUF/NevcgkTkEWhIFpvG7VROkNXmfONQ
	 k86FMQr2p15ueFlz/dwjGL+4SKvQ+m1WefhJlut2TvWOQpRZZJvepgAUJd6rUSE8sR
	 uEi2aFnejH0jQ==
Date: Thu, 23 Jul 2026 17:29:02 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
	Fernando Guzman Lugo <fernando.lugo@ti.com>, Ohad Ben-Cohen <ohad@wizery.com>, linux-arm-msm@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] remoteproc: Prevent crash handling to race with
 rproc_del()
Message-ID: <amKTZInKqMX48PWE@baldur>
References: <20260723-rproc-rmmod-not-crashing-v1-0-546dfd5de0e6@oss.qualcomm.com>
 <20260723-rproc-rmmod-not-crashing-v1-2-546dfd5de0e6@oss.qualcomm.com>
 <fffb231d-32a4-482d-91d1-b6932d16de59@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fffb231d-32a4-482d-91d1-b6932d16de59@oss.qualcomm.com>

On Thu, Jul 23, 2026 at 12:09:52PM +0200, Konrad Dybcio wrote:
> On 7/23/26 5:52 AM, Bjorn Andersson wrote:
> > There's no synchronization between rproc_crash_handler_work() and
> > rproc_del(), as such it's possible for a driver to be removed while
> > crash-handler work is scheduled, or even executing - resulting in
> > use-after-free issues.
> 
> [...]
> 
> > +	spin_lock_irqsave(&rproc->crash_handler_lock, flags);
> > +	if (READ_ONCE(rproc->deleting)) {
> > +		spin_unlock_irqrestore(&rproc->crash_handler_lock, flags);
> > +		return;
> > +	}
> > +
> >  	/* Prevent suspend while the remoteproc is being recovered */
> >  	pm_stay_awake(rproc->dev.parent);
> > +	queue_work(rproc_recovery_wq, &rproc->crash_handler);
> > +	spin_unlock_irqrestore(&rproc->crash_handler_lock, flags);
> >  
> >  	dev_err(&rproc->dev, "crash detected in %s: type %s\n",
> >  		rproc->name, rproc_crash_to_string(type));
> 
> GPT reported that the rproc may be gone/deleting at the time of
> this print since it's outside the lock, so it's not a given that
> rproc->dev and rproc->name are valid (although the window is pretty
> slim..)
> 

rproc->dev will be a valid object as long as the caller is holding a
reference to the rproc device (explicitly through rproc_get_by_phandle()
or implicitly through the device hierarchy), so there's no problem
there.

rproc->name has two different life cycles:

1) rproc_alloc(name) with name living on the heap or stack, will result
in `name` being owned by the rproc->dev life cycle and hence there's no
problem - as long as adequate references are held.

2) rproc_alloc(name) with name being a constant, here the rproc context
will hold a reference to the name in constant memory, and rmmod might
in this window have unmapped that constant.

So, the case when `name` is referencing a constant is a possible
problem, but unrelated to this patch.

Regards,
Bjorn
