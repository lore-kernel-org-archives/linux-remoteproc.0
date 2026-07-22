Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9423408031;
	Wed, 22 Jul 2026 08:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784707284; cv=none; b=rahQll+kZ851Pr6g3WOGcYw5m6y+Rtjo4xVTrBBrIRAlDQSdjeBcIsQRKJCopQM0C4x9pZ6jiLAezn83oiT30cIw3VOOo+oV8aidDGKuS3IpfdRBp/f6mtQwuj94RaxriTvPNVaFwfdSstc/8x85iQoh/MVSvNORSPctpAgJmLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784707284; c=relaxed/simple;
	bh=Z9n4wOw/xowDxkAWFZO/fDRbkp/dKP4/Z2dPr2DrODE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q41xUANvKBSL2RPG+8wESIHDRY3XSCj5yqhLHcI+OtxTTj/k8GAasLI/k5rRpTrBdpYC4jCAev2Idr02IKy4X2Ue7GAjxzC6fZZ75U3D3FBIhg30ZQtTEPiRMQzXrX50LKkMOH8edZ968X29ImA31g5U0B0dFpEtSRJsFNHpwwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N/KwXoT8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N/KwXoT8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81D8A1F000E9;
	Wed, 22 Jul 2026 08:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784707282;
	bh=B1yJnNqHXV9rbcUE/C4o1/VYS46I9G3C/5V0oFaVY8I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=N/KwXoT8LxB7/CsnHv0K9JqnVqBn+xWW3jjCy+RodPZkZi9h56nX8jeT5YiMyjGog
	 5XNH6Y/qfVotsxHwAPKzX8PHD5gJM09pw+770K3ve4ve8BTKLn+cArhhwlB55FAqa0
	 iEEJjbG812Pv6v0zZW2sDCk+3GIKNwVOtIbTcug7tpZKdZxQ6Lv4P1Czv0DN1B3Hxs
	 GwoHcOWpBMeTqqTwIpVCu2tJKLTVlm0NDOouE/9vbqr6xEelgkjzvZeBGJBE2a3pXA
	 FELI4zUc6+4/aVrEDzJ0/7xXxFJqqBa27pqeTECCRDXkIsvgwXo8m9+Atpjg+XO4As
	 awLlf6xBb4QPA==
Date: Wed, 22 Jul 2026 10:01:18 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: remoteproc: qcom,sm8550-pas: Add
 Eliza CDSP compatible
Message-ID: <20260722-tunneling-perch-of-completion-779399@quoll>
References: <20260721-remoteproc-eliza-cdsp-v3-0-557b5d02fdd9@oss.qualcomm.com>
 <20260721-remoteproc-eliza-cdsp-v3-1-557b5d02fdd9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260721-remoteproc-eliza-cdsp-v3-1-557b5d02fdd9@oss.qualcomm.com>

On Tue, Jul 21, 2026 at 05:19:57PM +0300, Abel Vesa wrote:
> Document compatible string for the CDSP Peripheral Authentication Service
> on the Eliza SoC. It is not compatible with any other.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  .../bindings/remoteproc/qcom,sm8550-pas.yaml        | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> index 019db91be7fd..5492a88bb100 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> @@ -17,6 +17,7 @@ properties:
>    compatible:
>      oneOf:
>        - enum:
> +          - qcom,eliza-cdsp-pas
>            - qcom,sdx75-mpss-pas
>            - qcom,sm8550-adsp-pas
>            - qcom,sm8550-cdsp-pas
> @@ -173,6 +174,7 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - qcom,eliza-cdsp-pas
>                - qcom,sm8750-cdsp-pas
>      then:
>        properties:
> @@ -288,6 +290,25 @@ allOf:
>              - const: mxc
>              - const: nsp
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,eliza-cdsp-pas
> +    then:
> +      properties:
> +        power-domains:
> +          items:
> +            - description: CX power domain
> +            - description: MX power domain
> +            - description: NSP power domain
> +        power-domain-names:
> +          items:
> +            - const: cx
> +            - const: mx

We need to stop using here provider names. This is the same as mxc of
other generations like SM8650, because it is for this core a VDD_M or
VDD_M_2 power domain.

Using provider names causes unnecessary bindings bloat and possibly fake
driver differences.

Well, not a problem of this patch.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

