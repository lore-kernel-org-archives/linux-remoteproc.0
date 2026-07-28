Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45EC872621;
	Tue, 28 Jul 2026 01:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785201494; cv=none; b=WQmpX+wv8JA6Vlv/1XtyoEBCiWbXslaxmk+NObFQXRLqP2m9l3Oa7e96sUtKvWpQKl53/MrgBtG1e2tcG/dqKTtqFIt5K9z51Y/oeRQPD//vmWZtdjCtbMnR3UZRwoT/L5qvkN448d0xMOJXddfGX+epwyivrugNPyvqBOaEZaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785201494; c=relaxed/simple;
	bh=yahYKBoX2cB7pwxkJ9ZPGYAuQ0tv85reWnhLlui9Dyo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BUHaHjt5Ln8NPVNIBC4JcbasUTW51ntURxryt9qZuVPEueo+32Hzj2ysi16txi0XgP0HMrE1l3r+RbysHNYa8SzfsRRbddwBGYLrCcEXs3oB75Uvq6xVHaIJ3pDjCWnZ/kVhb+a7JgfW8ht3m44kuHWBlyaDzbQPNflfebz3qdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iS3ky4ZM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iS3ky4ZM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 249D01F000E9;
	Tue, 28 Jul 2026 01:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785201492;
	bh=J0pP6jdRFfqFo4JChHBnNp3RKW3+MmR8pHBjBdLM9S4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iS3ky4ZM36qzMWyvjjDJbEgUUXVBSn2yaOGYmibLducesZdY6AGOreLeD3VMDnLqt
	 lsK+C3Tpmyb+BQrNWSO0bur4HIFZ+4haRN9PcPwTDJbdd1mI6ray4weZ44pQurb0wc
	 Q95PuiAPfVmNjhwFs7Qd8MjX/rbEf0RgP1pOw2QW+8j/8FLCD8AuaoXX9fw7vbJnYr
	 zVG62CplOrzj4twaYFJRmHdOjcGA9asZ/wqfDsZl3AllNn9S+tnuoOQ5S3PAHmb/8E
	 VGMhlYBITxxfbdgD71XWbBPahxv2F8ueLudyBjqx2M0zP4BcbVDWmU4XZTWMKuelzO
	 zxO46e1G9xQ+w==
Date: Mon, 27 Jul 2026 20:18:09 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Pradnya Dahiwale <pradnya.dahiwale@oss.qualcomm.com>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
	Fernando Guzman Lugo <fernando.lugo@ti.com>, Ohad Ben-Cohen <ohad@wizery.com>, linux-arm-msm@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] remoteproc: Prevent crash handling to race with
 rproc_del()
Message-ID: <amgCxllAAnFCp2TD@baldur>
References: <20260723-rproc-rmmod-not-crashing-v1-0-546dfd5de0e6@oss.qualcomm.com>
 <20260723-rproc-rmmod-not-crashing-v1-2-546dfd5de0e6@oss.qualcomm.com>
 <amel8GzMOTlIM8jL@hu-pdahiwal-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amel8GzMOTlIM8jL@hu-pdahiwal-hyd.qualcomm.com>

On Tue, Jul 28, 2026 at 12:09:44AM +0530, Pradnya Dahiwale wrote:
> On Thu, Jul 23, 2026 at 03:52:28AM +0000, Bjorn Andersson wrote:
> > @@ -2598,16 +2609,21 @@ EXPORT_SYMBOL(rproc_put);
> >   */
> >  int rproc_del(struct rproc *rproc)
> >  {
> > +	spin_lock_irqsave(&rproc->crash_handler_lock, flags);
> > +	WRITE_ONCE(rproc->deleting, true);
> > +	spin_unlock_irqrestore(&rproc->crash_handler_lock, flags);
> > +
> > +	if (cancel_work_sync(&rproc->crash_handler))
> > +		pm_relax(rproc->dev.parent);
> > +
> >  	/* TODO: make sure this works with rproc->power > 1 */
> >  	rproc_shutdown(rproc);
> 
> rproc_del() cancels the crash-handler work here - should there also be a
> matching cancel_work_sync(&rproc->attach_work)? If attach_work were still
> pending when rproc_del() finishes and rproc_free() drops the last reference,
> could it later run rproc_boot() on a freed rproc?
> 
> rproc_del()                        attach_work (still queued)
>      |
> WRITE_ONCE(deleting, true)
>      |
> cancel_work_sync(crash_handler)
>      |
> rproc_shutdown()
>      |
> device_del()
>      |
> rproc_del() returns
>      |
> (driver's remove path then calls)
>      |
> rproc_free()
>                                    attach_work runs
>                                    container_of(work, rproc, attach_work)
>                                    rproc_boot(rproc)  <- freed rproc?
> 
> The deleting check inside rproc_boot() dereferences rproc itself, so it can't
> guard a freed one. The request_firmware_nowait() / rproc_auto_boot_callback()
> path looks similar.
> 

I agree with your analysis! Let's continue this journey and make sure
these gaps are addressed.

> Reviewed-by: Pradnya Dahiwale <pradnya.dahiwale@oss.qualcomm.com>

Thank you,
Bjorn
