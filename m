Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B906E47ECF2;
	Tue,  1 Sep 2026 16:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788280166; cv=none; b=MIGAcJSaJArg/rPJNSjnVrh8IICKWUg4CBOgW5lyXM2jCZ2w1EZuPNSKD10YTB9B3f5NI9iIQ6sHgsE0EqSQ6OCZaMQuaGpc7cG2T4TAgKsyTIh/VTa8EPAc9LVTHMUSfSGJ2UP/mYiCAi3+qk0SIhpgtPY7vbabNi+chXYFN3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788280166; c=relaxed/simple;
	bh=th4ubNF8dBGbLsDXD6EYwk0jOfUaxe8JIQ8RaSUqxww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qBaHecFFK1wI8bM81n+qGwo/Fym0GfVJz/EsJvZsTVZKrL2wDsmeG+qBdB/d5ijXn+Cm0s5Eqh3vVtm3Owy2QdodEq8Rl78cyNLpplkECw6lhCl1XZk25Fpyba9//agotJ8tEzrhh6r7GyODoeN7CPh48QxkrXlFg079CtX4NBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZH69xuDE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZH69xuDE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E67541F000E9;
	Tue,  1 Sep 2026 16:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788280165;
	bh=tI6rVXujdWCxuL6bz98vqTArf9TgDE5iPNcNe4oZjdU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZH69xuDEu9qMTb7wZRAoizE/yzVDfWfHRcIpDG7EGeH6oYao+6RTn4k8gv5c2cn7Z
	 QYL08MopEfIbEFdhwkDMBnAaOjHwdOql1FQShfRyWQCbYfuo7pekZ+WVZipHU3qa0A
	 Qbc8se//N3LFA0NhgAqEg4+f79BU7xefEUNb84o8fk1ay7diSLqbDi9nANJauoSlUM
	 pi3iyFa9guZUPtb3b9rNWcPmEPVzAwo0VNP+59qb1a9cunV5A+Dq1WbS6+zLGqwM3L
	 DBYdtsFBAM3PFIj30EXdXqso+arCiA7uESctM66loOPRZmh+X+U8TiXwH/IjbbDn6K
	 PvYnBqeE5pogw==
Date: Tue, 1 Sep 2026 11:28:45 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>, Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] remoteproc: qcom_q6v5_pas: Add per-PD proxy
 performance states for Hawi CDSP
Message-ID: <apb86I2HGXcUAoG9@baldur>
References: <20260828181311.4038346-1-mukesh.ojha@oss.qualcomm.com>
 <20260828181311.4038346-3-mukesh.ojha@oss.qualcomm.com>
 <apWhseqV8vdufajf@baldur>
 <20260831191621.ogqnsmvzv3o5mlbq@hu-mojha-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831191621.ogqnsmvzv3o5mlbq@hu-mojha-hyd.qualcomm.com>

On Tue, Sep 01, 2026 at 12:46:21AM +0530, Mukesh Ojha wrote:
> On Mon, Aug 31, 2026 at 10:56:55AM -0500, Bjorn Andersson wrote:
> > On Fri, Aug 28, 2026 at 11:43:11PM +0530, Mukesh Ojha wrote:
> > > The proxy power domain enable path currently requests INT_MAX performance
> > > state for every proxy PD.  While this serves as a "take highest available"
> > > hint, some SoCs require specific per-domain RPMH levels for correct
> > > operation during firmware load rather than a blanket maximum.
> > > 
> > > Introduce a proxy_pd_performance_states array in qcom_pas_data to allow
> > > each proxy PD to declare its required RPMH performance level explicitly.
> > > Platforms that do not populate this field retain the existing INT_MAX
> > > behaviour.
> > > 
> > 
> > Is it possible to encode this using an optional opp-table instead of
> > filling the driver with such details? (This is a question, not a direct
> > suggestion)
> 
> Technically yes, via required-opps, each proxy PD would need its own
> opp-table and the remoteproc node would reference specific OPP entries via
> phandles. That is heavyweight machinery for three scalar values used only
> during the transient firmware-load window. But let me know if you see the
> benefit.
> 

I don't like sprinkling these details throughout drivers, but if that's
the alternative I guess your proposed solution is the lesser of two
evils.

Thank you,
Bjorn
