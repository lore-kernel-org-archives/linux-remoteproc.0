Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D9236CDEF;
	Wed, 20 May 2026 10:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779274368; cv=none; b=WdFpPWtea/ESDPe/cGRLIhxzu+WBJLqsNO/uib/AWLBPNK1kxAsHQ4vqqi7xgTWL0IHFPQyQTQxTcOZU+8q/q8QzjQba8Bk67Hp/MAYB4pK4ERS7658pawwBvuLS3Gob+iiAn6M2e52sJtXEQJ9LDDLPQzNh71oxaXVdZmKlK0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779274368; c=relaxed/simple;
	bh=zXtexlQVCEbqs+OfK4YFzp4q2ZrzX3es5Nc76/n+KME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JUtbQEB3ABgDcaeG9fgTBgLgRbwkzk9rpSroWfQNXKJFIAv3YobxMUf6HfqR/XEjr8E92qMSA7h1TxOytqTSI11/OJJKT/aOniovMAKqeAOPubDjFI+EgxK8N4bBwMHW2UQv8fXFuTC0mZAi2ZLkJMNpnqABkJyIhE5eaJgAkSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cqV5TORO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cqV5TORO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10E931F000E9;
	Wed, 20 May 2026 10:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779274366;
	bh=DNwrWXV00W6j4SF3rDuWUfrAXoAetEJzwT90ivLlEuY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cqV5TOROF4e8PZdhz90DTG4r89oqDJxUcfEV5YqOcWyAVgJ+3xzsWJItuxC4yoBeF
	 65LItDuvHQTlMVePydSEg3wtn0OqYGiY0DLZSuJ8GvDgx2AB2L0wtoUixstDwLe2f5
	 sHAn9Ya47q+oWA6P/9wnEj+bO3L4Db6nyv3xQziizH9gjKzq3sX0bbE8VWQTWO0+6f
	 zKUhlqgpHy+diVlgvs7VeiksIjz/mfsVuk14kfBQjhMl/2la3/2NrQ806PxXqCKK6Q
	 i8l60BXY1scgW4OvWsGsJs9HSuiZG0dA1y7lPa1/63K4pAqTVDKdp0FGQh1WVrAE3C
	 +VEAPyQ8fN3nw==
Date: Wed, 20 May 2026 12:52:44 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, sumit.garg@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: Document IPQ9650 Compute DSP
Message-ID: <20260520-hallowed-icy-otter-db13aa@quoll>
References: <20260520-ipq9650-remoteproc-v1-0-542feb6efb2a@oss.qualcomm.com>
 <20260520-ipq9650-remoteproc-v1-1-542feb6efb2a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260520-ipq9650-remoteproc-v1-1-542feb6efb2a@oss.qualcomm.com>

On Wed, May 20, 2026 at 12:56:17AM +0530, Vignesh Viswanathan wrote:
> Add device tree binding documentation for the Qualcomm IPQ9650 CDSP
> Peripheral Authentication Service (PAS). Unlike existing PAS
> implementations, the IPQ9650 CDSP does not require power domains or an XO
> clock, requiring a separate binding.

You still need to reference common bindings, to get common properties
like smem-states.

Especially that you wrote this binding like it was including that ref.


> 
> Signed-off-by: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
> ---
>  .../bindings/remoteproc/qcom,ipq9650-pas.yaml      | 136 +++++++++++++++++++++
>  1 file changed, 136 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,ipq9650-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,ipq9650-pas.yaml
> new file mode 100644
> index 000000000000..58b3a9352d87
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,ipq9650-pas.yaml
> @@ -0,0 +1,136 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/remoteproc/qcom,ipq9650-pas.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm IPQ9650 Peripheral Authentication Service
> +
> +maintainers:
> +  - Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
> +
> +description:
> +  Qualcomm IPQ9650 SoC Peripheral Authentication Service loads and boots
> +  firmware on the Qualcomm CDSP Hexagon core.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,ipq9650-cdsp-pas
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 6
> +
> +  interrupt-names:
> +    maxItems: 6
> +
> +  memory-region:
> +    items:
> +      - description: Memory region for main Firmware authentication
> +      - description: Memory region for Devicetree Firmware authentication
> +
> +  firmware-name:
> +    items:
> +      - description: Firmware name of the Hexagon core
> +      - description: Firmware name of the Hexagon Devicetree
> +
> +  qcom,smem-states:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description: States used by the AP to signal the Hexagon core
> +    items:
> +      - description: Stop the modem
> +
> +  qcom,smem-state-names:
> +    description: The names of the state bits used for SMP2P output
> +    items:
> +      - const: stop
> +
> +  glink-edge:
> +    $ref: /schemas/remoteproc/qcom,glink-edge.yaml#
> +    description:
> +      Qualcomm G-Link subnode which represents communication edge, channels
> +      and devices related to the CDSP.
> +    unevaluatedProperties: false
> +
> +  smd-edge: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-names
> +  - memory-region
> +  - qcom,smem-states
> +  - qcom,smem-state-names
> +
> +allOf:
> +  - if:

Pointless. Why do you need if? There are no other devices.

Best regards,
Krzysztof

