Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD6E3ACA42;
	Mon, 20 Jul 2026 06:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784527856; cv=none; b=fXoRKK+7Pk0gAS3o9aJUoKV9DkN/1CgzwwAgTwt+/mh9UOfBOm9D5iqDD8drT9G/IhOaibZQLjNkg+IzkBpkPVPSHDJb/Qi0AyZFYoTDzoJrnCrtkFZlH8CHB3orhoayL4SmuVAuZ3C23/8GWpwV8xVBC8Wuf1HPTT0OaUa+lwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784527856; c=relaxed/simple;
	bh=H4SAhF7VUo7u1LxDOpPD56os1KWxbeGpeP0AW7Wd850=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xd0Y6UMl7cHFiK4bZJggvBuZf3FEw9WmBkjsI1uRwvG2z9/yYrAARbO1QKXAL18D3GUFq7wHGsAOepn94RID6idECUqYYMZEFut9hbDFmrxjs3Wb/+2nvqlNoesadbG13pvNarKldNWUwH6NR37QjVBUYPfh+bmNsudXdjiDHnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CGE5K/q7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CGE5K/q7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AB411F000E9;
	Mon, 20 Jul 2026 06:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784527845;
	bh=V5eTTzERtM2s1SmY9yq6I4KJKoS1ghT2lt8nAkrxXS8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CGE5K/q7PY49cKwbG3R0P0wVR8L7JhHrDVFH9hCHbeLWyIQwEcDouRZu8RR3bSFzw
	 1D/icMwk0/tLPnCfwckatt0MTNa1772Gebt4y5ZmbNLsTiMeWWf0oSz/HwhzplgU7/
	 cVcS5/hbM47LMhrmfj8igNR8bSZcB3uPFlfL5sHP1l9SozOJfH81oR93Z3rMSmr+yw
	 hOb0CDNMmeyi/xXgrBvRPkneD7m5HxxY47HuxdEk3VqG6wQ4pLe5Z9eSn3P6ioSt45
	 W23Sj6ech8TOelwLnobBlMrfWCc83SLzhvZGK2MdbB3Dm/4dQP7nHIE7rgU/I/pd8Y
	 +3+ai5WsxzIBg==
Date: Mon, 20 Jul 2026 08:10:41 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Pratyush Meduri <pratyush.meduri@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: remoteproc: qcom,pas-common: allow
 up to 3 iommus
Message-ID: <20260720-steadfast-swinging-shrimp-196ac6@quoll>
References: <20260717095825.3962666-1-pratyush.meduri@oss.qualcomm.com>
 <20260717095825.3962666-2-pratyush.meduri@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260717095825.3962666-2-pratyush.meduri@oss.qualcomm.com>

On Fri, Jul 17, 2026 at 03:28:23PM +0530, Pratyush Meduri wrote:
> The ADSP PAS on several Qualcomm SoCs (e.g. SA8775P/lemans, QCS8300,
> Monaco) needs more than a single SMMU stream ID for the audio ML
> (machine-learning) offload use case. In addition to the primary
> ADSP stream ID, the DSP/SPF issues DMA transactions through extra
> stream IDs that are not covered by the existing single-entry mapping.
> 
> Relax the iommus constraint to allow between 1 and 3 entries so the
> additional ML offload stream IDs can be described, fixing dtb_check
> schema violations on device trees that add them.

What dtb_check violations? Do not reference non-existing warnings. If
this is real, then place the warning here - and be sure we can actually
reproduce it.

> 
> Signed-off-by: Pratyush Meduri <pratyush.meduri@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/remoteproc/qcom,pas-common.yaml        | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
> index 11faf655f530..fb656bda8527 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
> @@ -33,7 +33,8 @@ properties:
>      maxItems: 6
>  
>    iommus:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 3

So now all devices have three streams as well? Or only these three? You
said only newer, so why are you raising this also for sm8150?

Beside, you need to list the items.

Best regards,
Krzysztof

