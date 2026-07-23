Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC702E7BB6;
	Thu, 23 Jul 2026 22:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784845002; cv=none; b=DOku0HtItEpTFvsc+anVx1xCsx1XnQTiuPyEZlutBeib94e+w/sqMBaBL/x0o7kTBPA1/nby7Z6EzDmzM7EkThM4/g7XQDgvkfMEtS2lh4V1eF0aduxupFSqGPE1a/SV6IPvRfscoxV9adzx/oZf8Nx23gtI8cXaKwX2mmWitjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784845002; c=relaxed/simple;
	bh=0aD7Hgf8Oi6XEZzMZmtMG2x3TFGZ7rtNDTVh0XSpsAw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MJANSN/q1no+mX+Syx5jUm/gBuFafdP9VOPAJy0JYoC1YHTePyRXBKVOF2IxsKo8dqltNhzJBRsa+u+HRPbeiMKTUhuSGcM7VWjQtNo24gyQ8Xf/3e0Zpr94JIIxHYzMHWQ+fzPA6ac8BXkiY6ikVJojFyA2mMT4eC5JZocCXao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nxYMV9NF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nxYMV9NF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EECC61F000E9;
	Thu, 23 Jul 2026 22:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784845000;
	bh=MOiPGZUgNHqvzzITjL3Ov1rdCr/yoWyW5vpVpAFdmZM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nxYMV9NFe+sneBayqubQ4MgQVt1lk+Nv5R51W0QZCZQgHmRE6vVexo2wt6IhEMN+z
	 Gyt+BcrmhfL/mvu7CqoJlb0iCDIE4FANQxm1mLa0TeMatW3M/yf2wMYPFIaf/IpgcB
	 EVtQqZmp8vwAyjT+Qn0MYsFrtoDpx3MCPtt2qyoOybt/EAGho3X2CvbbPHDafAfIX/
	 mPwGw8ZfLjIKidPrxY1nCLe+jdCg9oujG2qhRNvvUD5U7J1959ioQXybAK5YpB/Zew
	 AktmRmDLCXofsa0uvDYlvLD0czXftWthvC0Oz55425nnozTtfbt3c72E3xxmfBiTa0
	 HfAdVDXzpKhpQ==
Date: Thu, 23 Jul 2026 17:16:37 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
	Fernando Guzman Lugo <fernando.lugo@ti.com>, Ohad Ben-Cohen <ohad@wizery.com>, linux-arm-msm@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] remoteproc: Force shutdown during device removal
Message-ID: <amKMdP-CTbyuXHun@baldur>
References: <20260723-rproc-rmmod-not-crashing-v1-0-546dfd5de0e6@oss.qualcomm.com>
 <20260723-rproc-rmmod-not-crashing-v1-3-546dfd5de0e6@oss.qualcomm.com>
 <413bcb02-4823-4c2f-8e0e-c9a40664caf9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <413bcb02-4823-4c2f-8e0e-c9a40664caf9@oss.qualcomm.com>

On Thu, Jul 23, 2026 at 12:54:58PM +0200, Konrad Dybcio wrote:
> On 7/23/26 5:52 AM, Bjorn Andersson wrote:
> > rproc_del() is subjected to the reference counted shutdown path, as such
> > a remoteproc with more than one reference will be left running as its
> > resources are released underneath it.
> > 
> > Refactor the shutdown path such that the reference count value is
> > ignored when called from rproc_del().
> > 
> > Assisted-by: OpenCode:GPT-5.5
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +static int __rproc_shutdown(struct rproc *rproc, bool force)
> >  {
> >  	struct device *dev = &rproc->dev;
> >  	bool crashed;
> > @@ -2029,9 +2008,10 @@ int rproc_shutdown(struct rproc *rproc)
> >  	}
> >  	crashed = rproc->state == RPROC_CRASHED;
> >  
> > -	/* if the remote proc is still needed, bail out */
> > -	if (!atomic_dec_and_test(&rproc->power))
> > +	if (!atomic_dec_and_test(&rproc->power) && !force) {
> > +		/* The remote processor is still needed by another user. */
> >  		goto out;
> > +	}
> 
> GPT makes some unclear suggestions, effectively saying that rproc_shutdown(),
> unlike other paths, seems not to first check whether the rproc is deleting
> if the shutdown isn't forced. I think it's a valid concern.
> 

I believe you're saying that there's nothing preventing a call to
rproc_shutdown() from racing with rproc_del()?

As far as I can tell, it's possible that while rproc_del() has set
`deleting` but hasn't yet called __rproc_shutdown() another reference
holder calls rproc_shutdown().

In the event that state is RUNNING or CRASHED that caller will stop the
remoteproc under mutual exclusion and leave it in OFFLINE, then let
the rproc_del() context proceed to find that the rproc is not RUNNING or
CRASHED and will as such return an error which is ignored.

If the contexts arrives to the mutual exclusion zone in opposite order,
the secondary caller will find the rproc in OFFLINE and fail the
rproc_shutdown() call.

So, I'm not able to see why we'd need to also guard against `deleting`.


That said, and as I stated in the cover-letter, there's more dragons
hidden in these code paths.

Regards,
Bjorn

> Konrad
