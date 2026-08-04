Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3237435F5F7;
	Tue,  4 Aug 2026 08:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785832885; cv=none; b=ifZ1/EEZU/Exl6dDkJ9z2fUvSaXi2PsDEcJ2DmsdI6HaTTmq0Iw8PqFsg3Zl4r7toj/Zsl8zYqcI7iVcogJwsUpR7lsuxU1TPuAsfiJ4MB7Lf7Z7n8DUTlpXYVCES+IVTsF0HA9F92tQyh0VgrfxQCNOjBtKrcEFTcptbs0jikY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785832885; c=relaxed/simple;
	bh=1Gz7Cq41Gq3HbTejsLLwDv6Xsb56RHEgY456tfsbeeQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L6z5SfsW7UpS1mb80l5EeUSQ8p8iQUUlH5tr5jBJftxgXUiUqqWNPQ6A3kwPLw9XUCP1qvOAOTOb3bwEcmZ/5JNOOyOnf1Yrfbn7PWEbANu2U86/8zIspOjH9gPLxiQVcbeLoXKZYjb4HrkaQi0yIzVJ/jU+JBSxLcmBt5kAxBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cgn1hGbh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cgn1hGbh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA3D71F00A3A;
	Tue,  4 Aug 2026 08:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785832883;
	bh=rLXO0wn17NB5KRKIzrneF1bLJ85yHM4ocnpF41BuBa8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Cgn1hGbh0wY1ZeyoVrSd725Zc4OspUGt9G/1L/eg9+g2PriZeVNmop9+lNcOg+eC9
	 Su4WKA8CRN/bu929IFtJQZeNEvV/l5SJ3Wm8bUEBJHwg9gDmse0mdWPRUIWg9e+mus
	 xXRNbakruhUeX6sRSDaaBWSQeVoWxMDacNsxugXVrHLeIC9TN6NtyZRsAsyYeaTjpM
	 yFNm5B3etVmh2AfYhXrruv9TOG4Uhi9NDmEXDy0maiWL+ixLdOCcBut10te5G4Uy88
	 a+hueDs4VdQOGuUhJ6UneePNypZotvwt6DECQ4amploukBHt2lSeviVcMtOs3sqUET
	 W1IfVu+kaCqKQ==
Date: Tue, 4 Aug 2026 10:41:19 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: qcom,sm8550-pas: Make
 SDX75, Hawi and Maili MPSS fallback to SM8650
Message-ID: <20260804-acoustic-military-coua-cb0caf@quoll>
References: <20260803180021.20368-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260803180021.20368-1-mukesh.ojha@oss.qualcomm.com>

On Mon, Aug 03, 2026 at 11:30:20PM +0530, Mukesh Ojha wrote:
> SDX75, Hawi and Maili MPSS are compatible with the SM8650 MPSS as
> they share the same set of interrupts, memory regions and power domains.
> Rather than describing them as standalone compatibles, model them as
> fallbacks to qcom,sm8650-mpss-pas.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  .../bindings/remoteproc/qcom,sm8550-pas.yaml  | 29 +++++++++----------
>  1 file changed, 14 insertions(+), 15 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> index a062188861ff..f722c55aadf4 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> @@ -18,9 +18,6 @@ properties:
>      oneOf:
>        - enum:
>            - qcom,eliza-cdsp-pas
> -          - qcom,hawi-mpss-pas

There is no known user of this.

Why do we even document this?

This is unfortunately one more example why I should accept early
bindings without users.

Best regards,
Krzysztof

