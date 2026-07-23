Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9201C84DC;
	Thu, 23 Jul 2026 08:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784794596; cv=none; b=U4Lgor+fSLMX1811/DVQEZNOp2jabjvevD4LXOTI/497qIqoC6U4RArFFju6f+gfPeh4nAw36V6B3v7UgxY+mAwNqNYj65XUbZRiU1h3024xnHGhe64dRteMor7yrW/twjq1znPWE7xrZE6LKPQfotaH7x/iiyHbO4FLutfoKYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784794596; c=relaxed/simple;
	bh=Db06DjC13KTIAtn18YIfAw4hcRZK/rWfcuovltGQpLI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F7lxiOqLOZBeNnszCGMRzaYJ+8zRAaomv+xkgDla3iDeuIWpKJDP7ikp8RWuVuaXU3Hv/tdBYOTz7QlQqXtitf5Rm11wYDSqwZK7DJkSa0cmjHHnP91aeQZxdycYQaVbZmZ38uaYx6lSKRI2xaO83RhWMB6WpT/QQgbWHDTtYJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DCwPTd5/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DCwPTd5/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DB131F000E9;
	Thu, 23 Jul 2026 08:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784794595;
	bh=k3tYzMOomz0n/q4CFIUHLWASxB4EW3LL1b4OjiW5III=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DCwPTd5/LRJ9qcMB448i9UQ93xmM5lZhvTIvvJhYoG0LBLJYqT/+uQnE4jbkdozs2
	 IXSU05kPAHz1Vh0CjQdS5CKbLCczEgqR95qA2sJag99XuTrS5FvyJrvJQycuXPVWcx
	 OK6lM2ePhZHCzWlddOop78rDygnbsPUGCgllkDKpf8twXrA4E6S2PA4T5vEVr7tS3c
	 y0FMMFHIIGLAeUMvASOTK4cO8K9Q/Q2Dz+49qx2pnRkrMYvdzKuJGbi35KgxlM4hma
	 jQy2xsvua81C2gixB0/NlF/KjsULU7P9muFvFlB0vb+9fQiUuR4s7nkOrhchksjd8c
	 5Neo7QIUz8zPg==
Date: Thu, 23 Jul 2026 10:16:31 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Luca Weiss <luca.weiss@fairphone.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: remoteproc: qcom,milos-pas: Move
 Eliza ADSP to SM8550 schema
Message-ID: <20260723-cunning-sensible-raptor-1daf3c@quoll>
References: <20260722-dts-qcom-eliza-fix-adsp-binding-v2-0-e1e98ae15533@oss.qualcomm.com>
 <20260722-dts-qcom-eliza-fix-adsp-binding-v2-1-e1e98ae15533@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260722-dts-qcom-eliza-fix-adsp-binding-v2-1-e1e98ae15533@oss.qualcomm.com>

On Wed, Jul 22, 2026 at 12:40:52PM +0300, Abel Vesa wrote:
> The ADSP PAS found on Eliza SoC looks fully compatible with SM8750, which
> can fallback to SM8550 except for the extra interrupt ("shutdown-ack").
> 
> So document its bindings in the SM8550 schema instead.
> 
> Fixes: 7cf2f07f949c ("dt-bindings: remoteproc: qcom,milos-pas: Document Eliza ADSP")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml  | 3 ---
>  Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml | 2 ++
>  2 files changed, 2 insertions(+), 3 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

