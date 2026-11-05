Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793885739;
	b=bSx5WnFSL9RzN9i0bs1OdkPvo8wK8vCPeh1zt3C3I5x47H+VQsX3OdMLU38d9bOgdG8j
	 ArKHK5h8Vm2CaNQOuXQSce1t5190ST0WP7J6i2wAVR9erxe0ZPNp6IGBtSUsAglie7KSQ
	 zTv17pGZoFwZ0Kto00vfRqS1Ca3/YnAGQtl6oZHGHhcPWFvQFKg6JHnZm/rfP4KUPPHb5
	 tVNj//8o+WLe7bkiqjr9lxTQFeVmSu5WcfMA18P3kZEBfzweSIYJrTFWdRUBn/d6147nj
	 c4RfE+mw2xeLBcZRG8FxJOhiFtGB/Zi3U64h9BLcL/+/0zrn69OjoD9loa8X2qepbkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793885739;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=/4rvKwRIglvYRwIgS6IQLtjNEyMjmnKfoT8x3zloGeo=;
	b=VlGX0PzGsrMz5XU1z1tJhiQXjVW7/yCBorSBG8Q1ttoL4ERwisX5PoqHLCcWc9m4AKie
	 /F9JBCCusvg9jProuF700FV8DK/m+lYubRKswCdtiAParnsEesNnwQM8O/Yb0mnYj5e2y
	 AstCogIjBHUKMXz1KDpKFusExHJ+MlSg37Ma05QgDBZAH7JYQP82jQIpUxuix5BUUryGm
	 out1Vk6mfkNf7FZT/65oCJYPnrcCQuNvng3pJYikdBxdsDPYzl/CSmYh2XqW7lrFueU2n
	 pOcaptV2kE2SIhHY4co5AadhFvLxmcwvarr/JnyGls+0rSZlR8J9Ct/xwNX/j7+jPmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YvNez+Si;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209A0606A31B;
	Thu,  5 Nov 2026 13:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YvNez+Si
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADDAC1F000C1;
	Thu,  5 Nov 2026 13:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793885738;
	bh=/4rvKwRIglvYRwIgS6IQLtjNEyMjmnKfoT8x3zloGeo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YvNez+Siq8dZYOfIDgC4pJWbuRW3y32DUcfg8vAy/zKsKXSkZDPbtUe9pavelxyGa
	 iBZ8jdw23851qiFKvHiU7CDnyKBj9qSo3O2e/a6MTkOtTskZ6BdsLXwJfEd42/Qk3a
	 XNEq/ppqfcsCbQqmdSBHn2LUTk9SjaI+ewwStoxb1VlEut3Bn55xXQhPLsFO4y7iTs
	 LpriA33WqZ0Qj+mul2nY4uTUW2LlBGc4LqyO1W+u458p9/Ia7BoZ2RphYME/C6E0XD
	 aBswMYKuEXorqJz2XXWHdlyhUW58stx4Q0FdvUwCmwuZjOhjfBEoXKcLWqk5gFxc0B
	 W5KaJZYPMGZlw==
Date: Thu, 5 Nov 2026 14:35:35 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Kumar Patro <bibek.patro@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: remoteproc: Move iommus constraint
 to SoC-specific bindings
Message-ID: <20261105-cunning-whippet-of-success-e4fd3d@quoll>
References: <20261104-shikra-el2-v4-0-97e7019debff@oss.qualcomm.com>
 <20261104-shikra-el2-v4-1-97e7019debff@oss.qualcomm.com>
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
In-Reply-To: <20261104-shikra-el2-v4-1-97e7019debff@oss.qualcomm.com>

On Wed, Nov 04, 2026 at 07:33:30PM +0530, Komal Bajaj wrote:
> The `iommus` property constraint in qcom,pas-common.yaml is too
> restrictive with `maxItems: 1`, preventing SoCs that require multiple
> IOMMU entries from being properly described.

 From here

> 
> Remove `iommus` constraint from qcom,pas-common.yaml and add it to
> SoC-specific binding files that have EL2 support and require IOMMU
> configuration:
> 
> - qcom,sa8775p-pas.yaml: Add `iommus: maxItems: 1` for all sa8775p
>   and qcs8300 remoteproc compatibles (lemans-el2, monaco-el2)
> 
> - qcom,sm8150-pas.yaml: Add `iommus: maxItems: 1` for qcs615
>   remoteproc compatibles (talos-el2)
> 
> - qcom,sm8550-pas.yaml: Add `iommus: maxItems: 1` for x1e80100
>   remoteproc compatibles (x1-el2)

to here - all this repeats the diff.

> 
> This allows each SoC to define its own IOMMU requirements while
> maintaining backward compatibility.
> 
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/remoteproc/qcom,pas-common.yaml      |  3 ---
>  .../devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml     |  6 ++++++
>  .../devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml      | 12 ++++++++++++
>  .../devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml      | 12 ++++++++++++

While you are not answering the unknown - what about all other devices?

>  4 files changed, 30 insertions(+), 3 deletions(-)
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
> index dda2d144b720..711c2f723b17 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
> @@ -106,6 +106,8 @@ allOf:
>            items:
>              - const: lcx
>              - const: lmx
> +        iommus:
> +          maxItems: 1

Missing property definition in top-level.

>  
>    - if:
>        properties:
> @@ -126,6 +128,8 @@ allOf:
>              - const: cx
>              - const: mxc
>              - const: nsp
> +        iommus:
> +          maxItems: 1
>  
>    - if:
>        properties:
> @@ -144,6 +148,8 @@ allOf:
>            items:
>              - const: cx
>              - const: mxc
> +        iommus:
> +          maxItems: 1

Not sure what is the point of repeating it multiple times.

Best regards,
Krzysztof

