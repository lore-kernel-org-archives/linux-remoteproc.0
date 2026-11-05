Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793885803;
	b=PWioBtQ/J8fSCdWmVxoT426Wgv5YBsImos4sbB4dkrLUGWwIVVvxSFSFvfmTSlLxVSer
	 sIeWi5MCbtbjJK7aKz4gS4AadXSvtAN9r9qGnTdyL8J3X0EWE7xkJBtyhW2SJVVGylq7G
	 uOuafeuA9yXIKUio06VGr3EAAmlawu+flqP5crbq6QbHsKYwpQW80G8oOL9bLSC/6EK6H
	 67v735vz5dock/LFxF9cQmobJrLzrPZ5ReTckRg/EdvNUHzQSitZ9Y64K37r6y4DDnEcq
	 Jk+IY83RyDiDTn8PoAr5B3ilfAXDjEiGuYkRYfaPboWHSwasvi5PRAIQ0HYEWk2P7bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793885803;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=f4wyFW7t2aluUkTE2UORbmYOG8oR4+EQhw49iv+SBDM=;
	b=hrPCuPvECqve8ioc3cR+Uuzrf8eDroaPKQYuM00C1vzAcKopWmdLL1XBphMHQt/rDd7M
	 Uy30sY/52dT5YzIkJB4qo4H3IDSUW18Q5xkA4dKgw8gieKqDWbytW0WxjbrT5KqQEst4E
	 18iJgJoSG/LX8L7lln3fwAwwZOUDbXdQ8GXaD/HzpV8sMHOSoY4fJCUwF7bCJ5gg3gW2m
	 tU0TWP6wge1QkNbM94NyhrVKM76OGV4jT9ulyrElVM39rJYKZYj63f1dFXXhgKqryW3pt
	 v2nrYDeVBYx3dqXf/8wwRVA2Bpmds3oKEI8CkmOx7jzAp7gyTMT45yrv5J60r63BDnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aBXiAoUR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB640606A31B;
	Thu,  5 Nov 2026 13:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aBXiAoUR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93BE01F000C1;
	Thu,  5 Nov 2026 13:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793885802;
	bh=f4wyFW7t2aluUkTE2UORbmYOG8oR4+EQhw49iv+SBDM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aBXiAoURz9wrjN+sO5w/i+LRLrkno2jeTwjbzYnflUMDCoP/Vxp1K9GtrnKiKB8hr
	 JXl3HhbCG8hMiSjj5PtVaAq0/ZQOrBfm1KqAf969MY2QDDGuKFKHb9IODcUedxao3O
	 2aq3xxeI6oeeBrDFKX/HRhDFgMUmeiTAtbW1HvEKAd8OW6F0EKLvfHGBRIORso2ub2
	 EOXswqcO7n9brI8XxmJQu4xzDwGDU/WOB51wGATC6ZP/2oRujiQO9ET4NIgLsFzhfQ
	 Ln/TubLvueo+g//1AUVkWR2rTKHdITzCbxH/5PatuStKIXi1eob2vNq79+HIAvVzUZ
	 utLOOAqWF6sSA==
Date: Thu, 5 Nov 2026 14:36:39 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Kumar Patro <bibek.patro@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v4 2/3] dt-bindings: remoteproc: qcom,shikra-pas: Add
 iommus constraints
Message-ID: <20261105-bold-seahorse-of-reputation-8db98f@quoll>
References: <20261104-shikra-el2-v4-0-97e7019debff@oss.qualcomm.com>
 <20261104-shikra-el2-v4-2-97e7019debff@oss.qualcomm.com>
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
In-Reply-To: <20261104-shikra-el2-v4-2-97e7019debff@oss.qualcomm.com>

On Wed, Nov 04, 2026 at 07:33:31PM +0530, Komal Bajaj wrote:
> Add iommus constraints for Shikra PAS compatible:
> - qcom,shikra-cdsp-pas: maxItems: 1
> - qcom,shikra-lpaicp-pas: minItems: 3, maxItems: 3
> 
> CDSP uses single IOMMU stream, while LPAICP firmware uses three.
> These are needed to describe the firmware streams when Linux boots
> at EL2 without the hypervisor.
> 
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
> index 34a2f15e9361..8c8a7616d478 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
> @@ -112,6 +112,8 @@ allOf:
>            maxItems: 1
>          firmware-name:
>            maxItems: 1
> +        iommus:
> +          maxItems: 1
>          power-domains:
>            items:
>              - description: CX power domain
> @@ -134,6 +136,9 @@ allOf:
>            minItems: 2
>          firmware-name:
>            minItems: 2
> +        iommus:
> +          minItems: 3
> +          maxItems: 3

You need to list the items.

Why maxItems? What is the limit defined by top-level?

Best regards,
Krzysztof

