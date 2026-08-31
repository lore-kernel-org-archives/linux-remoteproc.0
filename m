Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7FB361DDC;
	Mon, 31 Aug 2026 16:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788194497; cv=none; b=sqgaF/w802AFzYu4ONaAYCaORlH6fysjOGSShXNK9Rl2XEVfMkTjMWT2Os30HU/zPdIp+ALNkD6cnfSNGDPEXqP54JZc/Sawy5mn+tT/4R9dxeM6T+Fpo/f+O0Eq2cmYDXSEn+gP29CH7nVP7jpTGY4sae5rIttaEx9PJPbDsPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788194497; c=relaxed/simple;
	bh=H4uLsh4+x7BMINmUx/uXuXQj6VNdABwRJ7gGtqwrrDc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YV9Yr+9t98ASoOMwAWIDZN0At4PPYvoeXTiV3gYncCWEZPKAdxxbELfBlJO2LXPj8heLX1uBhGir9QM/fvXoIuOm/aUTylDiJ6dGFFLMvH9odd9Xz83qCiiv3e47WWm7WPUQbz/JeBfv6Oj3h05p2TM75PF20LkhNTsKJjs+ZNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=al/lyN5c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="al/lyN5c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B2041F000E9;
	Mon, 31 Aug 2026 16:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788194496;
	bh=b3pOHSjHHgrHY/ZzY4kD/4G1luZ2J0OAOvWRgeJCqIA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=al/lyN5cPpPIhEbFkCZrxd9p7Pj9vIx/0Ww8TzaWr1+Lqw2idxDrLIafHbqtKfdJ9
	 j/3wDoxmz/hi965oi3jtJtYDb9IdMqeMl0p0moBmy1jo0MVX7R88yhzDYvgcotSxvv
	 AyYOF9blWibKkzyvZw/hg/Q01J3DTzK3A7INVBLFAt+XDxpEm+a0gV9hQLEE9PpLIZ
	 b7kGHVVrDLhvFtPrH1Q3fyMU6vDIeE7HRV9NRR9VUvghQEAgI9xeWIyAhDZzmS6nte
	 +wYY3C6VIpNWAcci0HvI7zI49FiEkL6F/sIJ70S9UvmRd6qae4n4rmpmzPRAcGYjOs
	 ztmPRK513ROiQ==
Date: Mon, 31 Aug 2026 11:41:33 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kumar Patro <bibek.patro@oss.qualcomm.com>, Komal Bajaj <komal.bajaj@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Subject: Re: [PATCH v3] dt-bindings: remoteproc: qcom,shikra-pas: Allow
 bam-dmux subnode
Message-ID: <apWtSgfpTz4RQWPh@baldur>
References: <20260813-shikra-pas-bam-dmux-binding-v3-1-167a3fb50d21@oss.qualcomm.com>
 <20260814-modest-rose-salmon-7bb60b@quoll>
 <b523b910-c645-44b1-9e76-1d25fac16468@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b523b910-c645-44b1-9e76-1d25fac16468@oss.qualcomm.com>

On Wed, Aug 19, 2026 at 04:53:36PM +0530, Vishnu Santhosh wrote:
> 
> On 14-08-2026 02:35 pm, Krzysztof Kozlowski wrote:
> > On Thu, Aug 13, 2026 at 04:55:54PM +0530, Vishnu Santhosh wrote:
> > > Allow an optional bam-dmux subnode under qcom,shikra-mpss-pas by
> > > referencing qcom,bam-dmux.yaml.
> > I still miss the answer why. Last time you said in present tense that
> > this node exists there, which I objected. The answer to my objections is
> > to provide proper reason why you are adding this, why you are doing it.
> > Answer almost never is: repeat what the diff is doing.
> > 
> > You change something in the bindings because something exists in the
> > hardware and it was missed in initial submission, and you explain the
> > impact of that "missing".
> > 
> > Best regards,
> > Krzysztof
> 
> Understood. The reason is not that there is already an in-tree DTS that
> fails validation today. Rather, it is driven by the intended Shikra MPSS
> topology.
> 

If that's the actual problem, then the fix seems to be to just remove
the offending snippet! But this isn't the actual problem you're trying
to solve.

> In the earlier Shikra BAM-DMUX DTS posting, the bam-dmux node was initially
> placed outside the modem remoteproc node. Based on review feedback from
> Stephan [1], it was requested that bam-dmux be moved under the modem remoteproc
> node instead. The rationale was that placing the bam-dmux node at the top level
> makes it impossible for userspace to associate it with a remoteproc instance
> (in this case, the modem). This binding change therefore exists to describe
> the intended Shikra MPSS child-node topology.
> 
> The DTS user of this binding has not been merged yet. Its next revision is being
> held until a separate discussion regarding an XPU violation is concluded. Our
> intention is to get the required binding changes merged first so that the DT patch
> can be sent once those discussions are complete.
> 
> Please let me know if adding the above context to the commit message is what you
> are expecting.
> 

Don't describe the path that took you here, explain why there should be
a bam-dmux subnode.

Regards,
Bjorn

> [1] https://lore.kernel.org/all/airpBYZ2pRdNaE1v@linaro.org/
> 
> Thanks,
> Vishnu
> 
> > 
