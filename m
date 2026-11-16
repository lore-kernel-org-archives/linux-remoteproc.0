Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794826706;
	b=btVMfXvlpULVHtD0YGVtoY+aiI6nxZ4QFtK6Pc8Au36BGQQAco2zCXny6enpZ70jk8HW
	 pS4jQRS78IQHnlYElO8BnMdA/mKZf2D71qi40x6Hjxalo0fNB8d21/F/yU7pnhpcTHFST
	 2QTKN0RjPtv772EizwK6exlHrEGVVh92rYBqgDZHPjTofEl1x+jrBZYCY5ZyuoZctmRuJ
	 hFTx2jIiYaObJv5xQJypC6szc+SGdc3VYQEkYzB7oQflXb/ZFM8lS+S3Vpm6cTB4HR469
	 Uyucm1dMnA4n96yJLl7Rgh50yq1W7M4BxRoLnxqgCpi2LVnWQKoM0z6aysPdeo7bLFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794826706;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=LZNMzre3syHSnWp1Fvv61BL07p1gxzjeqm4GJqL8cS4=;
	b=1IHkllZnXn9QzaagrNgGilwz8frNJVhu+jNuEugnXAiRwR8fMCDlvCRe/1Q5l03GYFrf
	 6FqbPuZNAqeZ1EfHn9KAXXYADy+ys1ZiLSZpu7EYNd12Pqo2DN1pjBcMYRUAwZsf14n8w
	 1RIMBeuV+TZ22inaMiHImaOzviTdDBoBy3ix31jAUgpN4aCla4kQMq5HGrOqo1r6h7Ne+
	 tzsBgfSxZvPOI2iJqMRaTLsCcVyg70KgtpN2wcOQ0L/MuP31cRtS1VmMVWoq+hSOaMPNn
	 M/B3OpH36cZOPXrub2p+z3MAjWjHM1qHexlf4ID17hkTadOSsjfAQwUJJphzn6JCbsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zetoz1Gq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4EF606A31C;
	Mon, 16 Nov 2026 10:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zetoz1Gq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E0D51F000C4;
	Mon, 16 Nov 2026 10:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794826706;
	bh=LZNMzre3syHSnWp1Fvv61BL07p1gxzjeqm4GJqL8cS4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Zetoz1Gql1cc3g7uElb4W8Rc98kKVfYYXhtEtiH4ZJ4XdurD38KoPwtyEioy3vSsj
	 Q8Q2ZJIvig0qFm62ep1xlI/wuUudsJ3BdEppKFloGOqakDo4wGLOTRIvv1kqHABpEZ
	 lnhR2e7dmGuho9E/WTIJF+okvlWtqBxtc0PHUER/+ySTfn8sJfz3P7hLIDxqKJLVEr
	 8QvDfyK+VArzrr209JwwENosVk5wvCWK2bAAIVG7Um+y2UyWqLC6cJoMz9Xuz6uW3S
	 Jgu+4TpAsi3Z5yPk0BxBvhGRCw5KfXijIDYwSD3lhmKdMHLpDoQcdENVUq1Iliqo0e
	 vuUgtVMEtgc8g==
Date: Mon, 16 Nov 2026 11:58:20 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Kumar Patro <bibek.patro@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v5 1/3] dt-bindings: remoteproc: Move iommus constraint
 to SoC-specific bindings
Message-ID: <20261116-boisterous-ancient-macaw-8cc00e@quoll>
References: <20261113-shikra-el2-v5-0-8aca743de97f@oss.qualcomm.com>
 <20261113-shikra-el2-v5-1-8aca743de97f@oss.qualcomm.com>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261113-shikra-el2-v5-1-8aca743de97f@oss.qualcomm.com>

On Fri, Nov 13, 2026 at 08:02:20PM +0530, Komal Bajaj wrote:
> qcom,pas-common.yaml limits iommus to a single entry for every PAS
> remoteproc, which is too restrictive for SoCs whose firmware uses
> multiple IOMMU streams.
> 
> Drop iommus from common binding and let each SoC-specific binding declare
> it with its own limits. These bindings set unevaluatedProperties: false,
> so a compatible that does not declare iommus rejects it. Declare it for

I do not understand this sentence. Compatible cannot declare iommus, but
anyway the bindings do not reject it.

> every compatible whose nodes use it.
> 
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/remoteproc/qcom,pas-common.yaml   |  3 ---
>  .../devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml  |  4 ++++
>  .../devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml   | 12 ++++++++++++
>  .../devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml   | 13 +++++++++++++
>  .../devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml   | 15 +++++++++++++++
>  5 files changed, 44 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
> index f75cab6b4ed9..4662fe4cff62 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
> @@ -32,9 +32,6 @@ properties:
>      minItems: 5
>      maxItems: 6
>  
> -  iommus:
> -    maxItems: 1
> -
>    power-domains:
>      minItems: 1
>      maxItems: 3
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
> index dda2d144b720..3c35da52204d 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
> @@ -38,6 +38,10 @@ properties:
>    reg:
>      maxItems: 1
>  
> +  iommus:
> +    maxItems: 1
> +    description: Firmware Stream
> +
>    clocks:
>      items:
>        - description: XO clock
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml
> index b20780e5e26b..8aebc785f212 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml
> @@ -169,6 +169,18 @@ allOf:
>              - const: cx
>              - const: mx
>  
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - qcom,sc7280-adsp-pas
> +            - qcom,sc7280-cdsp-pas
> +    then:
> +      properties:
> +        iommus:
> +          maxItems: 1

Same comments as before - missing property definition. Properties should
not be defined in conditional blocks. If you remove property from common
schema, then you remove it from every device referencing it. Nothing in
commit msg explains such intention and reason why.

Either iommus is valid or is not. If it is not, then need mentioning in
commit msg for example and then you drop it from common schema and add
it to the bindings where it is valid.


Best regards,
Krzysztof

