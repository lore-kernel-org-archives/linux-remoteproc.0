Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3183B2D0D;
	Mon, 20 Jul 2026 06:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784527951; cv=none; b=rl/JmP45OZ904hyrmgcdjQ4+XlugPMMXi9ljtVJtr2BsLkBRjPDscbL9fJVV1BkaBw/7tnTT0ndyVrSRGhq9ibcN3h3vJDY2wiD7NXVml0CN+7T4lSAOpScop6gvgrbCL/bl13e8PjBNNRn4gROVNp3Hg7/JKhQxyhkrCYZBsBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784527951; c=relaxed/simple;
	bh=aDC0kWA/VuguVxvwOf9EGjbOx2hA88gJX/1u8DjPaBI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rtoSnLX2kxZmHtU8ZM5WxN+jIVfMQksY1d3q7ML/z1P4lBdhPd2nZnRnXc/Ij5r0ZIcUR5OLhScieoks0yVhYYxy+FzN9dA4xoLF81jI1lDbLzeQCKURIkvl4zlvp539wj1iO/zlpWF8RMHreF6vHN8m5AaQJZjOGqZ1dy8qGYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SMfZvFjX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SMfZvFjX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DD0B1F000E9;
	Mon, 20 Jul 2026 06:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784527934;
	bh=Pcwn9wFu3i3DuvHi5Jf0oCX/V+l18oX99Yfs2UkS4uE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SMfZvFjXcmuI/wjb92TilBqGwXiBcbukRPo330IYfAqLDGswi7rXZMxMnzjsbeNHy
	 m2OfuId7O8nnU6REVpkzzzWPv34FSJff6lk1DzvxUg3zMYBlnJ+LnSRYYTCq/CuBXf
	 cao5rXZdCLN6UqVAKI1AhMK5UQYhzpEVA5H4sEYbOJ8465jTI8t4L6/GGfn1JUFd9F
	 IiXbMQFDmoF1p9jjtNQ2MMXoBXykuQgKynMXSTZ8TBcPM1pvvisQVSjoj5i8x7904K
	 Gb9NnGf46So396cGs19k/S4mPh/1H0Dhl7ahBbFZOLnW2QSvZfjUbgUlgjtQp3nXmn
	 20sqHbefTqdhg==
Date: Mon, 20 Jul 2026 08:12:10 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Pratyush Meduri <pratyush.meduri@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: lemans: enable audio ML offload
 memory and SMMU mappings
Message-ID: <20260720-omniscient-shaggy-kelpie-17efa1@quoll>
References: <20260717095825.3962666-1-pratyush.meduri@oss.qualcomm.com>
 <20260717095825.3962666-3-pratyush.meduri@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260717095825.3962666-3-pratyush.meduri@oss.qualcomm.com>

On Fri, Jul 17, 2026 at 03:28:24PM +0530, Pratyush Meduri wrote:
> The audio ML (machine-learning) offload use case requires a contiguous,
> physically addressable buffer shared with the audio DSP/SPF, and issues
> DMA transactions through additional SMMU stream IDs that are not
> covered by the existing ADSP mapping.
> 
> Add a dedicated reusable shared-dma-pool CMA region (16 MiB, 4 MiB
> aligned) and wire it to the q6apm DAIs node via memory-region. A
> dedicated pool guarantees the alignment and contiguity the DSP expects
> and isolates these allocations from the default CMA region.
> 
> Under the EL2 (Gunyah/hypervisor) configuration the SMMU is fully
> enforcing, so the ML transactions are otherwise blocked and faulted:
> 
>  arm-smmu 15000000.iommu: Blocked unknown Stream ID 0x3060
>  arm-smmu 15000000.iommu: Blocked unknown Stream ID 0x3062
> 
> Add the ML-related stream IDs (0x3060 mask 0x9, 0x3062 mask 0x1) to the
> remoteproc_adsp iommus property in the EL2 overlay so these buffers are
> translated by the SMMU instead of being rejected.
> 
> Signed-off-by: Pratyush Meduri <pratyush.meduri@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans-el2.dtso | 4 +++-
>  arch/arm64/boot/dts/qcom/lemans.dtsi     | 9 +++++++++
>  2 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/lemans-el2.dtso b/arch/arm64/boot/dts/qcom/lemans-el2.dtso
> index 621ad930cf54..5b477346ef90 100644
> --- a/arch/arm64/boot/dts/qcom/lemans-el2.dtso
> +++ b/arch/arm64/boot/dts/qcom/lemans-el2.dtso
> @@ -19,7 +19,9 @@ &iris {
>  };
>  
>  &remoteproc_adsp {
> -	iommus = <&apps_smmu 0x3000 0x0>;
> +	iommus = <&apps_smmu 0x3000 0x0>,
> +		<&apps_smmu 0x3060 0x9>,
> +		<&apps_smmu 0x3062 0x1>;
>  };
>  
>  &remoteproc_cdsp0 {
> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
> index 3b0539e27b51..060565113784 100644
> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> @@ -624,6 +624,14 @@ reserved-memory {
>  		#size-cells = <2>;
>  		ranges;
>  
> +		audio_cma_mem: qcom,audio-ml {

NAK. You ignore feedback and keep sending us downstream junk
directly.

DO NOT SEND downstream code. EVER.

Best regards,
Krzysztof

