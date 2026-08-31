Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F5B3769E9;
	Mon, 31 Aug 2026 16:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788194666; cv=none; b=bwcrK6KldslnTEAR7lrrtyK3+G8apC2DMRkDePUp59TkTNJeNX+8s6PxbeICq1dPCsMSGHAFnHlmNUu77mFBq6+ttCqKFC4rKg9Hsglqs4slpVEft4IJZt65J3/t/nTQgwJeD5XeSopnT8kT/HooKyWts63oS4bQTKV6T1fyfJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788194666; c=relaxed/simple;
	bh=cTjS1sNyMZ2Otq9z44fl5XQpdh49D9y5MyunMZVYntA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uw8Vyza4phG5xJfbkuwihYOIRFd3lYmBgovDEwnycoGVUuAg56dbVRjXmfIUPpURfTU3QI2ryfCXbwbd/ZaJ8bG6aTDvhcxPCTxQLzWz1VhqOxNjyBlZhlQae91rUVx3lGA1EeKsBAQpE8LlZFFSrk1MVTjrlHQ60Giv73jhqrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UeVfIDzk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UeVfIDzk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D25E61F000E9;
	Mon, 31 Aug 2026 16:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788194664;
	bh=4v0mx06evZs1sPMJwb4YhjbX7KUV8XSNoBH+LemztZA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UeVfIDzkGiO2xNDjn6hcWJTotXxBJ4mK//cvx4jm3uAcLDQLAFqjv6L52XLIzXXXY
	 M/McslhLsszJiBqzQDial1RxuUOYBwAUs+RBuQlN0+a/2r7/T2ottL6yvEPdil8g7v
	 yfmxccoP/V651WNwziIlbkV/Cg/vtrxvOMUhmvQQTwyfXXnPB6O4MjVQ+rHVihplt0
	 2cVXgHmYoK26nhIGTHBop+ENnfWblxEZfrKB9xN/sZGiWtU06NRxjBUzWruPCHGWOG
	 YYW05GRDgaGB+dSebyUo78FgMJMV0kCsrbzXwzaY0NfsU75Gc7P15mCxV1W9ZVPDoH
	 hk+8/AYsOMtqQ==
Date: Mon, 31 Aug 2026 11:44:21 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kumar Patro <bibek.patro@oss.qualcomm.com>, 
	Komal Bajaj <komal.bajaj@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Subject: Re: [PATCH v3] dt-bindings: remoteproc: qcom,shikra-pas: Allow
 bam-dmux subnode
Message-ID: <apWuwq78D8lEBbeA@baldur>
References: <20260813-shikra-pas-bam-dmux-binding-v3-1-167a3fb50d21@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813-shikra-pas-bam-dmux-binding-v3-1-167a3fb50d21@oss.qualcomm.com>

On Thu, Aug 13, 2026 at 04:55:54PM +0530, Vishnu Santhosh wrote:
> Allow an optional bam-dmux subnode under qcom,shikra-mpss-pas by
> referencing qcom,bam-dmux.yaml.
> 

This is a statement, not a problem description. From
https://docs.kernel.org/process/submitting-patches.html#describe-your-changes:

"""
Describe your problem. Whether your patch is a one-line bug fix or 5000
lines of a new feature, there must be an underlying problem that
motivated you to do this work. Convince the reviewer that there is a
problem worth fixing and that it makes sense for them to read past the
first paragraph.
"""

> Retarget the example to qcom,shikra-mpss-pas so the new subnode is
> exercised by dt_binding_check.

It's not clear to me why you're changing the existing example. Seems
like a lot of churn.

If you want to use dt_binding_check as a test-case for bam-dmux, perhaps
adding an additional example would allow us to test both cases?

Regards,
Bjorn

> 
> Co-developed-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
> Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> ---
> Changes in v3:
> - Reword commit message to keep it scoped to the binding change. 
> - Retarget the example to qcom,shikra-mpss-pas and add a bam-dmux child.
> - Link to v2: https://lore.kernel.org/r/20260729-shikra-pas-bam-dmux-binding-v2-1-d85fea84c141@oss.qualcomm.com
> 
> Changes in v2:
> - Restrict bam-dmux to the qcom,shikra-mpss-pas compatible.
> - Link to v1: https://lore.kernel.org/r/20260727-shikra-pas-bam-dmux-binding-v1-1-c0159c7c3ed4@oss.qualcomm.com
> ---
>  .../bindings/remoteproc/qcom,shikra-pas.yaml       | 61 ++++++++++++++++------
>  1 file changed, 45 insertions(+), 16 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
> index 253b14eb2b598f0ca91854c8ff4d0b785090e621..dd779b595677c0aa58708b4fde725e64d8918434 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
> @@ -44,6 +44,11 @@ properties:
>        - description: Firmware name of the Hexagon core
>        - description: Firmware name of the Hexagon Devicetree
>  
> +  bam-dmux:
> +    $ref: /schemas/net/qcom,bam-dmux.yaml#
> +    description:
> +      Qualcomm BAM Data Multiplexer (provides network interface to the modem)
> +
>    glink-edge:
>      $ref: /schemas/remoteproc/qcom,glink-edge.yaml#
>      description:
> @@ -117,6 +122,16 @@ allOf:
>          power-domains: false
>          power-domain-names: false
>  
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - qcom,shikra-cdsp-pas
> +            - qcom,shikra-lpaicp-pas
> +    then:
> +      properties:
> +        bam-dmux: false
> +
>  unevaluatedProperties: false
>  
>  examples:
> @@ -129,16 +144,16 @@ examples:
>      #include <dt-bindings/interrupt-controller/irq.h>
>      #include <dt-bindings/power/qcom-rpmpd.h>
>  
> -    remoteproc@b300000 {
> -        compatible = "qcom,shikra-cdsp-pas";
> -        reg = <0x0b300000 0x100000>;
> +    remoteproc@6080000 {
> +        compatible = "qcom,shikra-mpss-pas";
> +        reg = <0x06080000 0x100>;
>  
> -        interrupts-extended = <&intc GIC_SPI 265 IRQ_TYPE_EDGE_RISING>,
> -                              <&cdsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
> -                              <&cdsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
> -                              <&cdsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
> -                              <&cdsp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
> -                              <&cdsp_smp2p_in 7 IRQ_TYPE_EDGE_RISING>;
> +        interrupts-extended = <&intc GIC_SPI 307 IRQ_TYPE_EDGE_RISING>,
> +                              <&modem_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
> +                              <&modem_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
> +                              <&modem_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
> +                              <&modem_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
> +                              <&modem_smp2p_in 7 IRQ_TYPE_EDGE_RISING>;
>          interrupt-names = "wdog", "fatal", "ready",
>                            "handover", "stop-ack", "shutdown-ack";
>  
> @@ -151,17 +166,31 @@ examples:
>          power-domains = <&rpmpd RPMHPD_CX>;
>          power-domain-names = "cx";
>  
> -        memory-region = <&cdsp_mem>;
> +        memory-region = <&mpss_wlan_mem>;
>  
> -        qcom,smem-states = <&cdsp_smp2p_out 0>;
> +        qcom,smem-states = <&modem_smp2p_out 0>;
>          qcom,smem-state-names = "stop";
>  
> -        firmware-name = "qcom/shikra/cdsp.mbn";
> +        firmware-name = "qcom/shikra/modem.mbn";
>  
>          glink-edge {
> -            interrupts = <GIC_SPI 261 IRQ_TYPE_EDGE_RISING>;
> -            mboxes = <&apcs_glb 4>;
> -            qcom,remote-pid = <5>;
> -            label = "cdsp";
> +            interrupts = <GIC_SPI 68 IRQ_TYPE_EDGE_RISING>;
> +            mboxes = <&apcs_glb 12>;
> +            qcom,remote-pid = <1>;
> +            label = "mpss";
> +        };
> +
> +        bam-dmux {
> +            compatible = "qcom,bam-dmux";
> +
> +            interrupt-parent = <&modem_smsm>;
> +            interrupts = <1 IRQ_TYPE_EDGE_BOTH>, <11 IRQ_TYPE_EDGE_BOTH>;
> +            interrupt-names = "pc", "pc-ack";
> +
> +            qcom,smem-states = <&apps_smsm 1>, <&apps_smsm 11>;
> +            qcom,smem-state-names = "pc", "pc-ack";
> +
> +            dmas = <&bam_dmux_dma 4>, <&bam_dmux_dma 5>;
> +            dma-names = "tx", "rx";
>          };
>      };
> 
> ---
> base-commit: 3d6d817622b0a9721e3cc404df3469171582be13
> change-id: 20260727-shikra-pas-bam-dmux-binding-28a6bf97857c
> 
> Best regards,
> -- 
> Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> 
