Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9924235F8AB;
	Tue,  9 Jun 2026 02:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780973980; cv=none; b=EgJ7nrG3cvldGTJBT8t8zrqk+z3IBmS/cgoX+H0dtd5rRCwNqfZKI32G7XezC8QOBl0Rj+rjcl6Gs83JCj95bwNKi2x30GJgK8Sv/SQ6L0frEGQbk+Hs3Fcw3V24UXQI55Zcocc6mRP7HC1jnAtoIU4F2BP8RC0B9OllO3WpmBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780973980; c=relaxed/simple;
	bh=CY7GnMNMxFLSCdOX9ba6ArdZuJL64a8mLbfFOJHf26A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SDq+fy37Up6xumQYKO3lnT8A1BtMV9Usx44C8lDGUGr1oMWnTs/qcEDSRNQF0YGT01BRttO3H/RZRYqUdvLZycEqGao7dd1iji/Hn3C5/X/NWXVV3Q1LNl/N2gqzBzijK+0Nns9I//FYMyiTUBFwhg66dA1kvY86v3dvdOTv41I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IMHm1KWS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IMHm1KWS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52BBE1F00893;
	Tue,  9 Jun 2026 02:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780973979;
	bh=H5W6g+S3Ap/ynjfGlE97P7oY3ui6rxwMYGeYaKfbBII=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IMHm1KWS/orVR1gKwnzb+T1foGy6vE0DQgSIsjv+mUz1PPPe8N26o7+mPk8PI/C/3
	 EuI2gc0DJaNJzhpU7mMKtBN09/3e8IwvfAknPEYqU10tiaoaEBL2kazUVZq2wp6DK8
	 a6nOWI3Z+n5HafgR8X88oCaHzq/XuD4ETMtYHEacU0N0DGmnJcuCLxDSwMMNQjbzOG
	 TebEiGrYuaBzMJHODe1OZVEhZMq8DhgGyVlOYAtd74sWgBW4d93hIp9VTr9fe0VcI3
	 fPaz8RVwo53MpUjz1QwWF6zQdZ08B8R76Lc9TnUKJYC36ZTeKc6/Yezwn5Too1Y93V
	 MXztN6HXmsNVA==
Date: Mon, 8 Jun 2026 21:59:35 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, sumit.garg@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Add support for IPQ9650 CDSP remoteproc
Message-ID: <aieAnN35K_WarmUD@baldur>
References: <20260520-ipq9650-remoteproc-v1-0-542feb6efb2a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520-ipq9650-remoteproc-v1-0-542feb6efb2a@oss.qualcomm.com>

On Wed, May 20, 2026 at 12:56:16AM +0530, Vignesh Viswanathan wrote:
> Add changes to enable IPQ9650 CDSP. This series adds new Devicetree
> bindings for IPQ9650 PAS and also adds required changes in qcom_q6v5_pas
> driver to support IPQ9650 CDSP remoteproc.
> 
> This series depends on [1], [2] and [3] to functionally bring up the CDSP
> remoteproc on IPQ9650, but does not contain any compilation dependencies.
> 
> [1] https://lore.kernel.org/linux-arm-msm/20260518072856.22790-1-sumit.garg@kernel.org/

I'm not able to determine why this is a dependency from cover letter,
commit messages, or the patches. If you have a dependency on this series
this isn't your typical PAS-based subsystem, so describing what it is in
the cover letter would be wonderful.

> [2] https://lore.kernel.org/linux-arm-msm/20260519-mp8899-regulator-driver-v1-0-30d14421b7f1@oss.qualcomm.com/T/#t
> [3] https://lore.kernel.org/linux-arm-msm/20260520-cdsp-power-v1-0-85eb9501a1cd@oss.qualcomm.com/T/#t

#3 is a fundamental part of the addition of this remoteproc driver and
the solution would be better reviewed as a whole - so you should send
the two parts in the same series.

PS. If you run "git log --oneline" you will see that there shouldn't be
a "drivers:" prefix in your subject.

Regards,
Bjorn

> 
> ---
> Vignesh Viswanathan (2):
>       dt-bindings: remoteproc: Document IPQ9650 Compute DSP
>       drivers: remoteproc: qcom_q6v5_pas: Add support for IPQ9650 CDSP
> 
>  .../bindings/remoteproc/qcom,ipq9650-pas.yaml      | 136 +++++++++++++++++++++
>  drivers/remoteproc/qcom_q6v5_pas.c                 |  38 +++++-
>  2 files changed, 172 insertions(+), 2 deletions(-)
> ---
> base-commit: 6a50ba100ace43f43c87384367eb2d2605fcc16c
> change-id: 20260520-ipq9650-remoteproc-9aa8c6d05de3
> 
> Best regards,
> -- 
> Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
> 
