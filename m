Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFCC929A9C3;
	Mon,  9 Feb 2026 15:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770650640; cv=none; b=iFKdgfmEL0pEEuXR0EgclyQdIe2CWsp/X+0YXma3sD8/y048INbn3gj0iPbivlx5wuwqlpd9BeHHD3MFTEAt4HGElge1oFE0KxGsnUNrrZlLmPMQzNypoMUTNxTgn+TOwxxXu3lNghj1Dt8bkN/g6EBht1hrEhR1sCVbsAAl3M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770650640; c=relaxed/simple;
	bh=CATv9n8/6UVhKAt6xSMvM8ZPSENEtVF49mw0FRzE/8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MDkSMAuIzWhYBJ4DoM5IR0/j5psj7eei3A2HOBJXwTDdnbdLDlL6nhvVzb0RtEnrG/tuK6WQAidFzYfTrqy/wo/vgqUsIn1tDL/aAKM2zLP+fs22KBfM3S2FczS12YZDfnD79jYuMnITGL4g2ljr0i5z1g+k9euEwjGzdbu7Fs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IaGQUU6M; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IaGQUU6M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A822C116C6;
	Mon,  9 Feb 2026 15:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770650640;
	bh=CATv9n8/6UVhKAt6xSMvM8ZPSENEtVF49mw0FRzE/8Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IaGQUU6MZiYnBwbZV+WB6yl0LNLcHbFtCwOafK7v3aP9dNH6203w4KEZw+7MfEC4p
	 83Wgv8mmFdTftmAFnx8rL/0BstQ/LljdeZcqY9QXbbtbvsZPj5g060jDq/IIb/ECzy
	 mEqpXgr55tVRNNvmMytI2u+8Xf8Xnx+nCebj4Xag10AvuvTsukawTkaYHokUzqdE/R
	 dYF4izP3eLQp1iKlJ9DC0/fr6nMgpMCWgQS82PyQuVIWIFTmPTk7o/svkZnFSvrx7+
	 3nt8NXynVrm8Hc2Kw5RtqdN08lDOGLtlPDDvKBlNu6+F+dz11nnmThloWb5dTA8XHg
	 Ef1ciNGC6eavQ==
Date: Mon, 9 Feb 2026 09:23:57 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc: Andrew Davis <afd@ti.com>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v3 1/2] remoteproc: core: support fixed device index from
 DT aliases
Message-ID: <a62kzllm4dgqavg47utvhb6m7oswcgenvq5nhw7tutyrs436lr@vtilvllrxkfb>
References: <20260204105216.3929071-1-arnaud.pouliquen@foss.st.com>
 <20260204105216.3929071-2-arnaud.pouliquen@foss.st.com>
 <4a4e50f4-9e02-4ca2-8b3f-b01caa7df35e@ti.com>
 <1a175145-d29f-426a-a163-1d185b8b0348@foss.st.com>
 <b9b478ea-cec7-4b5b-8ae9-d0574c4eb02a@ti.com>
 <25df6720-da97-4f81-9124-bdb7e9542d56@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <25df6720-da97-4f81-9124-bdb7e9542d56@foss.st.com>

On Mon, Feb 09, 2026 at 10:51:07AM +0100, Arnaud POULIQUEN wrote:
> On 2/5/26 21:07, Andrew Davis wrote:
> > On 2/5/26 11:58 AM, Arnaud POULIQUEN wrote:
> > > On 2/4/26 15:57, Andrew Davis wrote:
> > > > On 2/4/26 4:52 AM, Arnaud Pouliquen wrote:
[..]
> > 
> > It becomes immediately obvious this is valid only for a given platform.
> > 
> > The other thing I want to avoid is the ever-growing alias lists in DT.
> 
> For my understanding, is this only your expectation, or is it a general
> direction recommended by the Linux maintainers?
> 

If I remember correctly I did stand by the idea of using aliases to get
stable numbering in /sys/class/remoteproc when we spoke about it several
years ago (6-7?). But remoteprocs are coming and going, and any
information we would have encoded in those numbers would have been
confusing.

A big problem is that your numbering scheme will not be consistent over
time and as such prevent your customers from reusing the same userspace
between different platforms.

Another one is for the developer, who need to remember that on platform
A the R5F is id 2, but on platform B it's id 3 - when they sit and write
their echo commands.

Replying on properly maintained rproc->name handles both of these cases
for you.

> > Could be done without having to add a list of aliases to every DT. Is
> > there no other heuristic that we could use to produce an static ordering?
> 
> Other alternatives I can see are:
> - use of the reg property: whould break legacy.

That obviously wouldn't work if you remoteproc is a mmio device.

> - add a new proc node property: would do the same than the
>   existing alias.

If we decide that a global id-scheme is the right way to go, then alias
is the mechanism to express that. There's no reason to hack around it...

But I don't think it is the right solution. How about providing our
users a reference snippet, licensed as public domain, that just resolves
a remoteproc by the name property?

Regards,
Bjorn
