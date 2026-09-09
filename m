Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6373DC4C6;
	Wed,  9 Sep 2026 10:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788949614; cv=none; b=pqC8FpyT7fqHw1VG5WMZzRquwKwfL/Km5FKHagGhkSyZqaR+ClNz4Y2Yr6jXDl8OjzER+QFymfn8h8brxTH36ZuRDeF9VNSiG3sYzGNbnWC9dnsGxv6WOqvJaTqN0X+p5OQmh/tjcSplhshNvnOp8VhUxD5eMurqhvfOFDUE08E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788949614; c=relaxed/simple;
	bh=gjU+y53VuFs4qc69F+whfgeZPiasXLqKjLQnb4dT9b0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MP3GKBF9vyLq5QfFEkipE+xqW8GYWuP1saFWVfUx12NloPtMmUy/vsoOx+f0VTUOrOoowZ/6nVkMQJoZkytzgWrC1OdqfOC9ojOJERsuz8rpq9WlJoshN7otZ3OfV6i27vVAGo3pjKDkMigGRfofCmG6Gja2zJL/TgpixeWVuvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tdxie8KY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tdxie8KY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33EF01F00A3A;
	Wed,  9 Sep 2026 10:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788949613;
	bh=T32laqy/9ijCBrOdu2YGPAwdiMk8piodvpihsjbuIWs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Tdxie8KYeYT0SPGJNYNVsBZliar/8g7/RRsKG0HIm5E6DQi/ufTbkyJlMIhNvF1fn
	 h0v4Uj91dctCj3SQYr4DXJSkvwP/DPvzDIA4RZZbLwKuwKzSvuLLH7F9Z3i/JsqCFl
	 tCfLjguzltySjiUP8LrW9OB7DXQqXubsmBoiAD5yADGDqXhojEULzVzp5LYlxyAaBY
	 Z/NC4flSUq0k5zSlCzIeZDljvjj3/33m6eUTUC/v3eZI52rF6dKVi5IU/YsOJu5b17
	 ps69BgBBH6E9+11a75VLydEzCKQ6uOWG0I2nHHnWDoSfrQ1FcLo36hKaSZQtnnpS9f
	 e4ZXJFrY1APFw==
Date: Wed, 9 Sep 2026 12:26:45 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: remoteproc: qcom,sm8550-pas: Make
 SDX75 MPSS fallback to SM8650
Message-ID: <amxup3opaxx33xx6zvrcbozixisxhdjyfgkvzyowszbmsc5qmp@cn7j37hhlyo4>
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
Content-Transfer-Encoding: 8bit
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

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
