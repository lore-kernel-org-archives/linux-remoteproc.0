Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1524FECF7;
	Wed,  9 Sep 2026 10:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788949651; cv=none; b=gaf8vqibj4YyLl1NZYKoEBqbK7cdSN4jHSQ74IYlwqH0+QSvRJzY3+tMa23I/EK4BOAySQW+FQJuSVQ7UUFQbggZaIVm1tNtcSyXi5kGcCIG7eJ/2W7W4OiUZoivhhsFFYNBMuosnypXj9K8znrVIZXMrE2FySSSUMCHmH5e+lU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788949651; c=relaxed/simple;
	bh=P7m1xreo9JGMJmKvbhgFOIgg8EIMEx6Ym1OUZGwcCx0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RMrdq53uohjSKg6+HIRUs1L0d8LIqdA3Pj5mT2Je3CtZWSZADaeMl8LtylNlc1fHzk8+FSuIPU+J3O3/9p5bs1B4lpliNrlQOMiTesUhMj4coL0h2B70cJZgdd4aLEQv3PbNQmjy+qaL6c/hnW1QbfFmX1H2QA2MuT98dJhEhag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HWerjKj2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HWerjKj2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BB731F00A3A;
	Wed,  9 Sep 2026 10:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788949649;
	bh=IJ+qdNg3MCIzb18kTEgm799ACjNQKIR29M7zlHPbVn8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HWerjKj2V/Lwz5KkY95t0kwmt/4BE6TCah1sFrtOLS1iUV3c8aSIyKZ4b3ucEg8gS
	 ytw1ZgPMbnfHsAjLhWiMu5IYvY3t46t8/PfITy1KSfUa5P0p/uQb+p1s/aezqOQ46V
	 aQBTD6KF033oqXedFRsff8HShcaR8MxUs3NJzHQuknZv1wbnBNHWKSOL+NwNFCnpIB
	 2Kce9FGc3s47GupJgPhSo0DWYfe/6SsdU+P3IpZncSvHCqvnKdD27NA4KDyi/VZc/X
	 IfXs22vxsw6H6CtQJUqrUpfaEAGWFQZBgci6ZCO8Qe/+CaDFQBF3PzRxwSXgL7XIn5
	 QvRagvWprXv3w==
Date: Wed, 9 Sep 2026 12:27:21 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sdx75: Use SM8650 MPSS as
 fallback compatible
Message-ID: <y6mxnp57awwbu4dm2khpch3hbbopgvdap4lrh2ogttgkqjvl43@cqbgagbtgcl6>
References: <20260805132129.2713174-1-mukesh.ojha@oss.qualcomm.com>
 <20260805132129.2713174-4-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260805132129.2713174-4-mukesh.ojha@oss.qualcomm.com>

On Wed, Aug 05, 2026 at 06:51:29PM +0530, Mukesh Ojha wrote:
> Following the dt-bindings change that expresses the SDX75 MPSS PAS as
> a SM8650 MPSS fallback, list the SM8650 compatible alongside the
> SDX75 one so the node validates against the updated schema.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
