Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F043E3546F9;
	Wed, 12 Aug 2026 12:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786539065; cv=none; b=gN+MY2MDdBi9o4dS0HxR52tQ7ulQoKERqzsurC2zqLYc1+KWJKk97KeKnBTXpO8+hvg9g3tMgNvb8zMRVV0AVh9dm3vdVdR3irDd7hxfZwOvM9A1DO/ccI800oy590/hah0IVkZbw3iUGrVpvOCdAJRtdh51gx/0l+Pa4gapRcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786539065; c=relaxed/simple;
	bh=n5us2DDP4NWj8ExRnyGl3cqoJJpHTcNt7yGzXkLqV7A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vGkzeQ1HhHUWYoeuGN8yGQ+lio4G42EtcgqmQ3TY8C90ke5tkIGX1iCmDUOXwMmxkudCWXeyrdeinfvD8+FqIJfdPZ+3ED5ZcW4fOTN2xzyommwO5Qk1P7J8KpHlxjuitNOmZ+ZhzFj1WMBwslsn1tnMVh+8Ydp1754eh+jFeAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nRaiQGxE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nRaiQGxE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EE791F000E9;
	Wed, 12 Aug 2026 12:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786539063;
	bh=L4elurd1f7nZOQreeo691M/WVuSqsyMGZpvGzfR/pOU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nRaiQGxE7fq6UC74njZb4YL7b8RD1bnBfpESPajvPyGPKmeHCPilxjGpcfEx/KxqP
	 keV0CBt+1PjNudKYcGcJwpxhMScDfZfs6MiAKI8Q+Hkk565OUMOVcwo1WCSrfiHKch
	 FWC6z/1AIiOwhP7S5Q6minER9ZdfJ0tXAL589s0sQP6D1QkjeJlI4b28sHKUvhIoJ8
	 pT14nFv0+Y51N1IAHBF/d0OjdHY4NAzewEusc37qghS7S9h90gC5IM6bnG6eO2bvwM
	 xzRo5AsBLplX2yZynGpz07gjhXLyY9pPSGBzMtcrIGStL4FAag77VqVBK82AS+N5pj
	 zb7VM5cGklJWw==
Date: Wed, 12 Aug 2026 14:50:56 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: remoteproc: qcom,sm8550-pas: Make
 SDX75 MPSS fallback to SM8650
Message-ID: <20260812-heron-of-amazing-might-0e1974@quoll>
References: <20260805132129.2713174-1-mukesh.ojha@oss.qualcomm.com>
 <20260805132129.2713174-3-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260805132129.2713174-3-mukesh.ojha@oss.qualcomm.com>

On Wed, Aug 05, 2026 at 06:51:28PM +0530, Mukesh Ojha wrote:
> The SDX75 MPSS is an instance of the SM8650 MPSS: same interrupts,
> memory regions and power domain topology. It is currently modelled as
> a standalone compatible and lives alongside sm8650 in every mpss
> allOf conditional, which duplicates the constraint and hides the
> hardware relationship.
> 
> Move qcom,sdx75-mpss-pas out of the standalone enum into the fallback
> items block alongside Hawi and Maili, and drop it from the mpss
> memory-region and power-domain conditional lists. contains: on the
> fallback compatible qcom,sm8650-mpss-pas keeps the constraints firing
> for the array form.
> 
> Two consequences of the tightening are worth calling out:
> 
> - qcom,sdx75-mpss-pas as a single-string compatible is no longer
>   valid per the binding, so the in-tree sdx75.dtsi form fails
>   dt_binding_check. That is fixed by the follow-up DTS patch which
>   switches sdx75.dtsi to the fallback array form.
> 
> - The driver keeps its standalone qcom,sdx75-mpss-pas of_match entry
>   so already-deployed DTBs continue to probe. The binding is
>   intentionally stricter than the driver here; pruning the driver
>   match is left as a separate cleanup once the DTB rollout is
>   complete.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml       | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

