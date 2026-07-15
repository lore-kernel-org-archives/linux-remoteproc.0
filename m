Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39EB847A0B8;
	Wed, 15 Jul 2026 17:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784136174; cv=none; b=VwyEaorNe8/KEclMrAs/EyNkyHt2zSIwPhZ5giGGjaRepkb4sZG8CgLpwyZS+D6EDICgEpeaMlet51yuu8xcio7qKQ0roXy8eo+2emciGp7AOqDYwrBlYoB6ktzzNTCLP+BZKERCzRwTsQ0jy8bTmUA2wu+0wiJ9jabsBgxruxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784136174; c=relaxed/simple;
	bh=HVErGlLF+dnztHcNMHi4w5JlAg+xGy/zsv+HTBBaDDg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M6qGXz1Q++CvSESqS6AMTvfnjSwsmXBOg/O6zbpG1nZPTM9T6iKtEI9qnslNQI0xnLQpxhaj2lsFLTGp+f21ZxtcBeAkLvQmggbAQMJCSUvryC4cRNpACGOA7qfU02A9V61ul7EyD3kTt6/UV7J4Y6/ZGjY5rULLx/U7n5RVdb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bi0xmwQk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bi0xmwQk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98C4D1F000E9;
	Wed, 15 Jul 2026 17:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784136170;
	bh=wyyEWav4MVzun5/KCm1qNMqiiNQ6+CPjHHnawrFHi70=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bi0xmwQkbfPMjCfaJWTU2h0MpLfQoxiCTbhaj902Jn6drO4twciRUuVCjFQ8ej3KL
	 biEwsUEL2OgV+GCl3DHBwA50cnANxKo9PB36pNKpSyBQ+N6ZO7fal1VycbkEBJ19Mp
	 5INo98iUZbYBVK5fozq8vYwGwvSNBueogVFBM1iiPCLg7OyVVhMAoLCrnSlk7wkZzI
	 YUIWKqSC44q/BK+YPPX65iQtnnU2HEPb50uOKLQpDpnN118B3XKNIGhI2OGE9J0tZh
	 eRscK2jSHZSROUJT+8XvP+cAgHlEEFKmqqQIRy7N1XuHmI45QoIMR1jUn05C4IMpoo
	 Be0UXVYWSXibg==
Date: Wed, 15 Jul 2026 12:22:47 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: krzk+dt@kernel.org, mturquette@baylibre.com, 
	linux-remoteproc@vger.kernel.org, Alexandru Gagniuc <mr.nuke.me@gmail.com>, 
	mathieu.poirier@linaro.org, conor+dt@kernel.org, konradybcio@kernel.org, sboyd@kernel.org, 
	p.zabel@pengutronix.de, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/9] remoteproc: qcom_q6v5_wcss: add native
 ipq9574 support
Message-ID: <alfBg2Z0sSP6Znem@baldur>
References: <20260109043352.3072933-1-mr.nuke.me@gmail.com>
 <178370682987.2572738.13491033810212556744.b4-ty@kernel.org>
 <20260714214519.GA2851152-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714214519.GA2851152-robh@kernel.org>

On Tue, Jul 14, 2026 at 04:45:19PM -0500, Rob Herring wrote:
> On Fri, Jul 10, 2026 at 01:07:04PM -0500, Bjorn Andersson wrote:
> > 
> > On Thu, 08 Jan 2026 22:33:35 -0600, Alexandru Gagniuc wrote:
> > > Support loading remoteproc firmware on IPQ9574 with the qcom_q6v5_wcss
> > > driver. This firmware is usually used to run ath11k firmware and enable
> > > wifi with chips such as QCN5024.
> > > 
> > > When submitting v1, I learned that the firmware can also be loaded by
> > > the trustzone firmware. Since TZ is not shipped with the kernel, it
> > > makes sense to have the option of a native init sequence, as not all
> > > devices come with the latest TZ firmware.
> > > 
> > > [...]
> > 
> > Applied, thanks!
> > 
> > [1/9] remoteproc: qcom_q6v5_wcss: drop unused clocks from q6v5 struct
> >       commit: 22afc6163c0c7a144d24a09352b87719d64d5f65
> > [2/9] dt-bindings: remoteproc: qcom,ipq8074-wcss-pil: convert to DT schema
> >       commit: 2a756ac4d98efc97503629fcaddb2e7c46255824
> > [4/9] dt-bindings: remoteproc: qcom: add IPQ9574 image loader
> >       commit: bc33b5b5e23a389e660c3d696cd2e043fdf33ef7
> 
> Why is a 6 month old patchset with reported errors being applied? 

I did some needed cleaning in the patchwork inbox, but not sure why I
didn't see your feedback.

> Anyways, linux-next is now broken. Please fix.
> 

Done, I've dropped the changes from the branch again.

Regards,
Bjorn

> Rob
