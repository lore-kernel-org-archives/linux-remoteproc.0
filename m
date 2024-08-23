Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0762241746;
	Fri, 23 Aug 2024 06:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724394207; cv=none; b=YaZrvxxjJCur6CorxY0bHa5FVWEy4xlhgg6UxAt2sAlkcm1c3zHpGhZgDwhiu8wfPAzmTbQ+3oyZ288d4VlA423VW0Ci6iZn9okrrsJ6Far5Z/2ga3bgVTmHlkpUYeYgN/0zcQl1ZEqxYPhPoNjZvEZguhpYftiwEL3jd+IN6/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724394207; c=relaxed/simple;
	bh=F9j6/99Wp8zwbHk0+R/u1d0bSQKJJlhKEVeaCimqaFg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hQ41NO2DEgawlNLQL2a28DuDp1q6xmUNcYWONan2PPNmLJaW98heatHr+yFzR2+Ux2B4TcZn9rzp3dt+vWBqcsFi3q7PkX2t3hjTaLg6UNKSk/C4X6NBoNrt+6+SGFqpPbHKR1bvCKMMWprwn3sxiJtERT1Ym+JE0sk/Mi6MXEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YYVf2b5H; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YYVf2b5H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54F9EC32786;
	Fri, 23 Aug 2024 06:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724394206;
	bh=F9j6/99Wp8zwbHk0+R/u1d0bSQKJJlhKEVeaCimqaFg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YYVf2b5HSPWz4aJRASqJsNkzn7bFqCTToBYapTv9Rw983fP0EESsFc3CMELlAvGei
	 KqyMcYpRV5bfk8w3sNY5GP70N7D9r1K4Hy9hynA8Q2ihlaX2KvcrVyyjkjCqKORtvr
	 tt1KH6YzJA1/WhtW65unj6oLbCJcmNUKa1gf3wsu9/tYnTMASiPoaHYmEk9g7xF91x
	 zURpEvUENgS8Nt6x49YagRKhTOA4rnMt/DofUL1OMSEpyahDCE9Gk6F1r0x9Mt6zxN
	 eWmqouvDKD2KE65hM2vVSGYG2CTDANgw6nm3kwMg2PjHuqLjaFOG3g/k12+EOhyMc7
	 8X7rb5EFcgX5A==
Date: Fri, 23 Aug 2024 08:23:17 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Cc: mathieu.poirier@linaro.org, Adam.Johnston@arm.com, 
	Hugues.KambaMpiana@arm.com, Drew.Reed@arm.com, andersson@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	liviu.dudau@arm.com, lpieralisi@kernel.org, robh@kernel.org, sudeep.holla@arm.com, 
	robin.murphy@arm.com
Subject: Re: [PATCH v2 1/5] dt-bindings: remoteproc: sse710: Add the External
 Systems remote processors
Message-ID: <gzlncpyzwm7x4jcxtdrthrlv2dofk7u3oxn4taadwog5tt37wo@ot6s6kwukd4k>
References: <CANLsYkwOrtXxObL5MKf30OrUYB_uT=DnGEXUtfjH503r_LyMQA@mail.gmail.com>
 <20240822170951.339492-1-abdellatif.elkhlifi@arm.com>
 <20240822170951.339492-2-abdellatif.elkhlifi@arm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240822170951.339492-2-abdellatif.elkhlifi@arm.com>

On Thu, Aug 22, 2024 at 06:09:47PM +0100, Abdellatif El Khlifi wrote:
> Add devicetree binding schema for the External Systems remote processors
> 
> The External Systems remote processors are provided on the Corstone-1000
> IoT Reference Design Platform via the SSE-710 subsystem.
> 
> For more details about the External Systems, please see Corstone SSE-710
> subsystem features [1].
> 

Do not attach (thread) your patchsets to some other threads (unrelated
or older versions). This buries them deep in the mailbox and might
interfere with applying entire sets.

> [1]: https://developer.arm.com/documentation/102360/0000/Overview-of-Corstone-1000/Corstone-SSE-710-subsystem-features
> 
> Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
> ---
>  .../remoteproc/arm,sse710-extsys.yaml         | 90 +++++++++++++++++++
>  1 file changed, 90 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/arm,sse710-extsys.yaml
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/arm,sse710-extsys.yaml b/Documentation/devicetree/bindings/remoteproc/arm,sse710-extsys.yaml
> new file mode 100644
> index 000000000000..827ba8d962f1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/arm,sse710-extsys.yaml
> @@ -0,0 +1,90 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/remoteproc/arm,sse710-extsys.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SSE-710 External System Remote Processor
> +
> +maintainers:
> +  - Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
> +  - Hugues Kamba Mpiana <hugues.kambampiana@arm.com>
> +
> +description: |

dt-preserve-formatting

> +  SSE-710 is an heterogeneous subsystem supporting up to two remote
> +  processors aka the External Systems.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - arm,sse710-extsys
> +
> +  firmware-name:
> +    description:
> +      The default name of the firmware to load to the remote processor.
> +
> +  '#extsys-id':

'#' is not correct for sure, that's not a cell specifier.

But anyway, we do not accept in general instance IDs.

> +    description:
> +      The External System ID.

This tells me nothing. You basically copied property name.

> +    enum: [0, 1]
> +
> +  mbox-names:
> +    items:
> +      - const: txes0
> +      - const: rxes0
> +
> +  mboxes:
> +    description:
> +      The list of Message Handling Unit (MHU) channels used for bidirectional
> +      communication. This property is only required if the virtio-based Rpmsg
> +      messaging bus is used. For more details see the Arm MHUv2 Mailbox
> +      Controller at devicetree/bindings/mailbox/arm,mhuv2.yaml
> +

Drop blank line

> +    minItems: 2

This is redundant if equals to maxItemns, drop.

> +    maxItems: 2
> +
> +  memory-region:
> +    description:
> +      If present, a phandle for a reserved memory area that used for vdev
> +      buffer, resource table, vring region and others used by the remote
> +      processor.
> +    minItems: 2
> +    maxItems: 32
> +
> +required:
> +  - compatible
> +  - firmware-name
> +  - '#extsys-id'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    reserved-memory {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        extsys0_vring0: vdev0vring0@82001000 {
> +            reg = <0 0x82001000 0 0x8000>;
> +            no-map;
> +        };
> +
> +        extsys0_vring1: vdev0vring1@82009000 {
> +            reg = <0 0x82009000 0 0x8000>;
> +            no-map;
> +        };
> +    };

Drop, it is fairly common.

> +
> +    syscon@1a010000 {
> +        compatible = "arm,sse710-host-base-sysctrl", "simple-mfd", "syscon";
> +        reg = <0x1a010000 0x1000>;

So this is a part of other block? Then make one complete example in the
parent device bindings.

> +
> +        extsys0 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
e.g. remoteproc


> +            compatible = "arm,sse710-extsys";
> +            #extsys-id = <0>;
> +            firmware-name = "es_flashfw.elf";
> +            mbox-names = "txes0", "rxes0";
> +            mboxes = <&mhu0_hes0 0 1>, <&mhu0_es0h 0 1>;

First go mboxes, then mbox-names. The same in the binding, BTW.

Best regards,
Krzysztof

