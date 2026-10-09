Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F096446EC6A;
	Fri,  9 Oct 2026 06:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791528751; cv=none; b=jBiqfBb7kxdjM2uufNWIeQfuMm3h0oMxY3in6UyZxsCIXeRgNR2xxoHuaLboL2hd2wAdTkgXZqyeSElC6f0pXPSjcn6xgz63FNJq0udWSq43y+xUbZLuK1G6AgG9J3sJGaL93P8Grhv3EHKjgTNjZ5WuZCFOom9SwvSvoqEx3Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791528751; c=relaxed/simple;
	bh=bdUVcZu4xwxhfv/AI6DfEom+UnGUNhMGXNV6I2NkXRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qx78uDVq8Lunec73wjU0vgtRSC+jlzBPxupbvtYiY8MqgAiintSn160ARfUQEmfG4R6hTocXQrpHRfdmDgPBz9l/T/6zxFUdD2c1CDwhJT1tu4XxbPHBBsCb+hiKQr0bzjGyrLM7a7liGGh8kY4BiyDHISPpT4Ro/Nwi5VutqQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IZYTjec8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IZYTjec8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 972CF1F000FF;
	Fri,  9 Oct 2026 06:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791528748;
	bh=0OCkWtzuds5SF127yInSdLxNNq+2g4Evm0mzpVyjPCk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IZYTjec8RrKD19hpbpi4yXFzy6MZ3Qkr0x+KA5DU3QeqpTvlNynfjUiIULbPzCf08
	 qD5W8MBtAS0bDn4zVVGzyod5RQi/IlMBtVOtxz5MFCpvEjGKVGVCCH9QONWyr7C0gC
	 L44ebDis/FMjzVIwVwUEpHyFFLUHTHFBBmxdKiij3HblBw+mR4G2ZodVgbB7yvHcBa
	 CE5c8CG5AWVYr4nXhvZwK2liTajLismpo2NmT//ezrkwsmabZtpvQQly6k+oE0emyE
	 BZ4EFhVYCOs/HMQIEA8Ts3uddjpVuUeTR97oEJtM88ioX0xVAH9OvfWlHMrGu4HnTP
	 cJo9lsS82zSXQ==
Date: Fri, 9 Oct 2026 08:52:24 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 04/11] dt-bindings: remoteproc: qcom: adsp: Add SDM670
 ADSP compatible
Message-ID: <20261009-glittering-watchful-caracal-47aeb3@quoll>
References: <20261003175659.23536-1-mailingradian@gmail.com>
 <20261003175659.23536-5-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261003175659.23536-5-mailingradian@gmail.com>

On Sat, Oct 03, 2026 at 01:56:52PM -0400, Richard Acayan wrote:
> The SDM670 ADSP is like the SDM845 ADSP. Add the compatible for the
> Audio DSP on SDM670, with the fallback as SDM845.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  .../bindings/remoteproc/qcom,adsp.yaml        | 33 +++++++++++--------
>  1 file changed, 20 insertions(+), 13 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
> index 7e8ecae8e6cb..6cf1f11efe04 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
> @@ -15,19 +15,26 @@ description:
>  
>  properties:
>    compatible:
> -    enum:
> -      - qcom,msm8226-adsp-pil
> -      - qcom,msm8953-adsp-pil
> -      - qcom,msm8974-adsp-pil
> -      - qcom,msm8996-adsp-pil
> -      - qcom,msm8996-slpi-pil
> -      - qcom,msm8998-adsp-pas
> -      - qcom,msm8998-slpi-pas
> -      - qcom,sdm660-adsp-pas
> -      - qcom,sdm660-cdsp-pas
> -      - qcom,sdm845-adsp-pas
> -      - qcom,sdm845-cdsp-pas
> -      - qcom,sdm845-slpi-pas
> +    oneOf:
> +      - enum:
> +          - qcom,msm8226-adsp-pil
> +          - qcom,msm8953-adsp-pil
> +          - qcom,msm8974-adsp-pil
> +          - qcom,msm8996-adsp-pil
> +          - qcom,msm8996-slpi-pil
> +          - qcom,msm8998-adsp-pas
> +          - qcom,msm8998-slpi-pas
> +          - qcom,sdm660-adsp-pas
> +          - qcom,sdm660-cdsp-pas
> +          - qcom,sdm670-adsp-pas

Why is it here?

> +          - qcom,sdm845-adsp-pas
> +          - qcom,sdm845-cdsp-pas
> +          - qcom,sdm845-slpi-pas
> +
> +      - items:
> +          - enum:
> +              - qcom,sdm670-adsp-pas

And here?

How is it supposed to work?

> +          - const: qcom,sdm845-adsp-pas

Best regards,
Krzysztof

