Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76873B71AA;
	Thu, 20 Aug 2026 06:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787209195; cv=none; b=nzPlXK27PgO9SOpBztN9uje6MlNk+CLHC6itP7hGE3/Gu+DdK8XFnhJDB0e2LRexI4k0B/sjBs2IHRdBaA7pPSqWqKM0h185ZLzmvo7ocsYlDENjpPzJFKDobFrV2R/zVRdd9mzIqD2D/juj84W2l9OIC2OUAntQjP00WO4jipk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787209195; c=relaxed/simple;
	bh=XFU63hRXbDc+cDHeczZs791xHD2IK7VshdWjnJvRzbc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tFCbnvICWzBLEc7w8rKR718UzbTH0zlWG51pW3H20fL5LKfIW+vrRMr/kfYNJBXGKNEWOvVlWUy9W+73lRHk4/9ymVq8KC75vuXZeTrpu4avNG9Pe4Le9MZtC9iePmPnC2JMYSrlbicGyAPC+04rW8K/xb8RiCuzMc4XDCycQP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ElcaT5Jl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ElcaT5Jl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58FF41F000E9;
	Thu, 20 Aug 2026 06:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787209193;
	bh=oGn8fOuy8oVvpGY+DXUVnjiYFZUagRhqbSRyQXZKQ98=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ElcaT5JleopP6H8bLbNUl2SPrT6/I/OUzvxFi/dAq3/SoSuRNh6kRY0ACdwKLj4d2
	 /Nh2vt+GofaizAxgdNIYUElX/3CRvjomp/qJx1dimiyWNsNAPXiSSA+WRbUl8K+1R1
	 j8hgCnqfnJB9m8kyhv4fV569zi6SzV0akyztaWrUv+p4FQa3P6uRUmO0LfgAjo5Nm9
	 8G5oJjS0Nm0vJpHNaDPkNWT1wDbXYiXvTvFptlxnuVizg7zCuRtlnde0JVwqei2/dH
	 SLFtwDWs8NglzRr4vNq3rKXvmZURW3pxLYsNdPEdZvH8rTULBGhVjQAaJ4I8VsuKuq
	 hOGvRuKo2GqFQ==
Date: Thu, 20 Aug 2026 08:59:48 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/8] dt-bindings: remoteproc: qcom,nord-pas: Add
 qcom,cluster-root property
Message-ID: <20260820-controversial-mussel-from-vega-aaba16@quoll>
References: <20260815132541.1575121-1-shengchao.guo@oss.qualcomm.com>
 <20260815132541.1575121-2-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260815132541.1575121-2-shengchao.guo@oss.qualcomm.com>

On Sat, Aug 15, 2026 at 09:25:34PM +0800, Shawn Guo wrote:
> Document the qcom,cluster-root phandle property used to describe HPASS's
> ADSP0/1/2 cluster relationship. Every member of a cluster carries the
> property, including the instance owning the shared resources, which
> references itself; instances referencing the same node form one cluster
> that boots in order and is torn down as a single unit.
> 
> The relationship is described with a phandle rather than by containment
> in a parent node, as ti,k3-r5f-rproc and xlnx,zynqmp-r5fss do, because
> the hardware does not express it by containment either: the three QDSP6SS
> blocks are register-independent, with no shared register window for a
> container node to describe.
> 
> Also add the qcom,nord-adsp1-pas and qcom,nord-adsp2-pas compatible
> strings used by the non-root cluster members.
> 
> Assisted-by: LLM
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  .../bindings/remoteproc/qcom,nord-pas.yaml      | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,nord-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,nord-pas.yaml
> index e90d2953ba69..58d88cb07e52 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,nord-pas.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,nord-pas.yaml
> @@ -17,6 +17,8 @@ properties:
>    compatible:
>      enum:
>        - qcom,nord-adsp-pas
> +      - qcom,nord-adsp1-pas
> +      - qcom,nord-adsp2-pas
>        - qcom,nord-cdsp0-pas
>        - qcom,nord-cdsp1-pas
>        - qcom,nord-cdsp2-pas
> @@ -89,6 +91,19 @@ properties:
>      maxItems: 1
>      description: The names of the state bits used for SMP2P output
>  
> +  qcom,cluster-root:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Reference to the Peripheral Authentication Service instance that owns the
> +      resources shared across this DSP's cluster. HPASS shares clock/reset/NoC
> +      resources between its ADSP0/1/2 QDSP6 instances, and the owning instance
> +      (ADSP0) has to boot first to initialize them before ADSP1/ADSP2 can cold

This feels way too much SW. We design hardware resources in
owner-independent, meaning each device is the owner. Most of Linux
frameworks, including listed clock, reset and ICC, support resource
sharing for multi-owner case.


If this is not SW related, then I claim that compatible defines whether
services is owner of the hardware or not.

Also, unresponded Sashiko comments.

Best regards,
Krzysztof

