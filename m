Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3063445629A;
	Tue,  4 Aug 2026 16:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785859894; cv=none; b=SgIbXEq1N2RhIzX/bdCE0s201pkM/lYhxf9zvN3hnytjBUnqfMHLunOPo+b1Qe+HDQeBYpm/JCG2CQy+0ZZJjZ0LJX3I49SO39stmTl9dN2ffoQ0fP5pSWq/uNX1K59idsSYBKZhAz2lAbvdOV6WAllinFOcBr7XFSR41V2rRL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785859894; c=relaxed/simple;
	bh=kBaA9vqZIwgJxdB0pbwJ+Mya1z6kQSG5jatUJeULY8o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MuxShoubw4KAx53g/UzLIfCguccz0J7AMMXONX9J/bsxk7rqysvaWhCZNsgP3EwTWo7lGMr7BlhEsae6zINj3sauBgEekUWb+NDlyAgvPggROkmnGOBhxCI9GlfPKwTHBTY7LFOT6oeDkCG9YFLz7BmQhpqPXzU/IDODBZ0d/pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MBGCC4sX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MBGCC4sX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7D9C1F000E9;
	Tue,  4 Aug 2026 16:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785859892;
	bh=5cRnG4jGKRpBxr2oloTRQwKHT0yuYe7inkzO/pguT7k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MBGCC4sXvzuTY7wExAEXByaeAwV0EdUnP0WTBkBNwfT97ZLqHrPR3JFf3aqAxcbvj
	 ZmuzuyMyS4jw3CRMlTIbPmdNe1jXqJDerIe1x4D25EHWrhzxaqQCLz2snMJkBbXWQ5
	 afln5rvcCYeYqLVl1WTdqyrYE1eDWJwX5GxDh0KetDQopLlf7ggc6TMlboVwS0qIgX
	 mLUBeOE9tiNdL92aX85f/CyZRLDwYTQfIYPYGa7DInWM9Va5OqTP6+VTttcLlJKRPj
	 1KN5OtTYqsLPlGbTBn6gs0uYYtcfKN+6IxE9zq1I1EEBDCwFqLWX8DVV9mrFDZYDNW
	 R0aMr8bV2QOeQ==
Date: Tue, 4 Aug 2026 11:11:29 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: qcom,sm8550-pas: Make
 SDX75, Hawi and Maili MPSS fallback to SM8650
Message-ID: <anIM8yN-r1wrTErT@baldur>
References: <20260803180021.20368-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803180021.20368-1-mukesh.ojha@oss.qualcomm.com>

On Mon, Aug 03, 2026 at 11:30:20PM +0530, Mukesh Ojha wrote:
> SDX75, Hawi and Maili MPSS are compatible with the SM8650 MPSS as
> they share the same set of interrupts, memory regions and power domains.
> Rather than describing them as standalone compatibles, model them as
> fallbacks to qcom,sm8650-mpss-pas.
> 

This will introduce a dt-validation error in
arch/arm64/boot/dts/qcom/sdx75.dtsi, which you fix in patch 2.

But while the binding says qcom,sdx75-mpss-pas alone isn't a valid
compatible, we support that in the driver, so we're maintaining
backwards compatibility with current DT - until someone cleans up the
driver to match the contract defined by the binding.

It might be reasonable to accept both of these hiccups, but you need to
document the upside of it.


But if I read this correctly, it seems I merged qcom,hawi-mpss-pas and
qcom,maili-mpss-pas prematurely. Based on the commit message in [1] I
thought they would fall back to sm8650, but this patch says that was
wrong of me - meaning that [1] should have contained a driver change as
well. I.e. you didn't test [1], right?

As I said in the reply to Krzysztof, I have dropped [1] again from my
queue.

[1] https://lore.kernel.org/all/20260713093237.691117-1-mukesh.ojha@oss.qualcomm.com/

Regards,
Bjorn

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
> -          - qcom,maili-mpss-pas
> -          - qcom,sdx75-mpss-pas
>            - qcom,sm8550-adsp-pas
>            - qcom,sm8550-cdsp-pas
>            - qcom,sm8550-mpss-pas
> @@ -49,6 +46,12 @@ properties:
>        - items:
>            - const: qcom,sm8750-cdsp-pas
>            - const: qcom,sm8650-cdsp-pas
> +      - items:
> +          - enum:
> +              - qcom,hawi-mpss-pas
> +              - qcom,maili-mpss-pas
> +              - qcom,sdx75-mpss-pas
> +          - const: qcom,sm8650-mpss-pas
>  
>    reg:
>      maxItems: 1
> @@ -205,11 +208,9 @@ allOf:
>    - if:
>        properties:
>          compatible:
> -          enum:
> -            - qcom,hawi-mpss-pas
> -            - qcom,maili-mpss-pas
> -            - qcom,sdx75-mpss-pas
> -            - qcom,sm8650-mpss-pas
> +          contains:
> +            enum:
> +              - qcom,sm8650-mpss-pas
>      then:
>        properties:
>          interrupts:
> @@ -257,13 +258,11 @@ allOf:
>    - if:
>        properties:
>          compatible:
> -          enum:
> -            - qcom,hawi-mpss-pas
> -            - qcom,maili-mpss-pas
> -            - qcom,sdx75-mpss-pas
> -            - qcom,sm8550-mpss-pas
> -            - qcom,sm8650-mpss-pas
> -            - qcom,sm8750-mpss-pas
> +          contains:
> +            enum:
> +              - qcom,sm8550-mpss-pas
> +              - qcom,sm8650-mpss-pas
> +              - qcom,sm8750-mpss-pas
>      then:
>        properties:
>          power-domains:
> -- 
> 2.53.0
> 
