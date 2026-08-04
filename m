Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD603472547;
	Tue,  4 Aug 2026 16:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785859227; cv=none; b=KA5MW1Ihe6/H70CdKVeMxByPLPPViTOh9Uj7mfQahgGejgQaTCzEKO917W2Jrn/AnQwR3y6Cujb6N2b0LQ7rA93K1LIG+//gzmQo+PtVj1uiJVkDbxcnrBlMIvbxpECkSyIUoIfRetY7VvB4fOrczcSC68gfknNuDGComcMwFro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785859227; c=relaxed/simple;
	bh=5DeLJUnO5n2V7Fxarosk5g5/+JWfEPlsrjo8pnHXPqU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rTug1LntD4yui5/Q8eEhJR0A8A+eUjJoJ9hoDx/DjMYIkRxE3IRBh42+MAjxJwD4kEIN1zFBpY61nJovSCdft8NMAaQEKSlNDVrvBH5Ji3WIXM1rJf4GeLbNOiGvBXyZoAUayvzfonLz/TIOlQdHjdf6q2JZEcm5JRsdVENV5Vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WqthW6j+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WqthW6j+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A53C61F000E9;
	Tue,  4 Aug 2026 16:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785859225;
	bh=E5Tu8CBp9qOZSvEy9QudUXOOIvbJN+QcOgGi+o/hI04=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WqthW6j+QBjiqo3j1jhmqRrbouswkQw/2Ban4423CNhG6nPt/B2Z7s+u3V6uApYsf
	 At/K+cAjP8Cty5keD1WlZbJY6hmPNt40vY7VtdTZkhSfBHA4AUGetOa/MNUTcHCPrj
	 7MATdWATASi98C+yeoN5ModZ8RuSU1coyekLNrIIU7DACFrnEFyjwPyjQkiIXTCfFD
	 aVF6TcII6EG4LfzcyCxKXKB9cEf2+1HRaKV6nNaUd4nfHEVtom18rNJW8NkxSR2A9K
	 aG8Zs8JxEDsxGhP4Pips6yju0ILmYTB+pX43c7PxP24zGWadpCKkdp+1KGZarCAvPF
	 0xDWvGzFeJaqA==
Date: Tue, 4 Aug 2026 11:00:22 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: remoteproc: qcom,sm8550-pas: Add Hawi and
 Maili MPSS compatible
Message-ID: <anIJxadPvBQhKBRb@baldur>
References: <20260713093237.691117-1-mukesh.ojha@oss.qualcomm.com>
 <178546838834.317434.17458132438871669858.b4-ty@kernel.org>
 <0dbe41fe-e05b-4e5a-9de2-a682674ce40a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0dbe41fe-e05b-4e5a-9de2-a682674ce40a@kernel.org>

On Tue, Aug 04, 2026 at 10:43:46AM +0200, Krzysztof Kozlowski wrote:
> On 31/07/2026 05:26, Bjorn Andersson wrote:
> > 
> > On Mon, 13 Jul 2026 15:02:37 +0530, Mukesh Ojha wrote:
> >> Document compatible string for the MPSS Peripheral Authentication
> >> Service on the Hawi and Maili SoCs. The Hawi and Maili MPSS is
> >> compatible with the SM8650 MPSS (six interrupts, CX and MSS power
> >> domains, memory region).
> >>
> >>
> > 
> > Applied, thanks!
> > 
> > [1/1] dt-bindings: remoteproc: qcom,sm8550-pas: Add Hawi and Maili MPSS compatible
> >       commit: 77a6aafb404dda8ed6c2689dd78e10377ccebb4d
> 
> So this was applied and IMMEDIATELY after fixup was sent.

I presume you're referring to
https://lore.kernel.org/all/20260803180021.20368-1-mukesh.ojha@oss.qualcomm.com/#t
here?

> I assume the fixup was known and somehow was waiting till gets
> applied.
> 

It's hard to tell, as the commit message in the new commit doesn't make
any attempt to explain the situation. I have no data telling me that
your assumption is incorrect :(

> This is just wrong approach. Can we drop the patch instead?
> 

I've dropped the patch from -next.

Regards,
Bjorn

> Best regards,
> Krzysztof
