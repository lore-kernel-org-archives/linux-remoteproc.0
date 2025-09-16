Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30CE29A310;
	Tue, 16 Sep 2025 09:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758014097; cv=none; b=EI2YXoFPdUSG+iRroFZ75gjvDKych2HIcdmLXyuAH13qgYo3ym8ZqEA91M0lwEhrYizeezPi6m1o0uWCWbuKYIRqhE3oC2luvj80gGfYZrMCvXvt9RpYH5XmOfgQUaQT1abkQ55zFKFmCMqiQuxzJuXZX4MX28I4Xcc0QqUCXAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758014097; c=relaxed/simple;
	bh=lWa38QWpQKBheh2+8pa3IIFdfHdW+eC2aXKWV7xfz+E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K9t+wFj41NRZQG26XZnoCl3tNPl5pXvwsX5KBx+XK6h9SCE9Rw8FDo8kqS/S0ww5EEJmd1pZk7Gj2+oNNbk98NKOTQ2Bkt1k6T+U/j6p2SURxZUXvHlMcOpZ6T/4TQBieiaEaAbuRPBztxP7caMNQVukDPuHldmMPPnK4ogxvM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N0zirtnh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N0zirtnh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06F39C4CEFD;
	Tue, 16 Sep 2025 09:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758014097;
	bh=lWa38QWpQKBheh2+8pa3IIFdfHdW+eC2aXKWV7xfz+E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N0zirtnhTBVOiXpUexGzhnv1iQ/q+CWOJgJKWTOLGOASvxhhj+Bv9NubaV4y7JaJS
	 MqdEdfBJoIVu4GFO2aiejrWspeBeSfhQwZvUpmVzro5c1Mo1o/AGAcZR2vkamUUWrT
	 pjKKrSIuE9Lw8jBBE+OrQ4otNtlpyRUDF8JzNqjz7EjBiKLg1DsGjYfWiTeiPR4UsP
	 plbwEvzdOEvN98EGCUvGXetxDz6fb2UrOIe02rLnfkdIfoB5986CWiDP6gx6Y5EbQZ
	 PHqGcVEOmfwzgaPxgDcr2mc+W0sdCrbzVItMt4HvYo/va3p7gP1iOtYCX3oX4EUOPJ
	 EsCIF/J2p7MFg==
Date: Tue, 16 Sep 2025 14:44:49 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v19 4/6] dt-bindings: remoteproc: Add compatibility for
 TEE support
Message-ID: <aMkqifHSdlCs4VjA@sumit-X1>
References: <20250625094028.758016-1-arnaud.pouliquen@foss.st.com>
 <20250625094028.758016-5-arnaud.pouliquen@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625094028.758016-5-arnaud.pouliquen@foss.st.com>

Hi Arnaud,

First of all apologies for such a late review comment as previously I
wasn't CCed or involved in the review of this patch-set. In case any of
my following comments have been discussed in the past then feel free to
point me at relevant discussions.

On Wed, Jun 25, 2025 at 11:40:26AM +0200, Arnaud Pouliquen wrote:
> The "st,stm32mp1-m4-tee" compatible is utilized in a system configuration
> where the Cortex-M4 firmware is loaded by the Trusted Execution Environment
> (TEE).

Having a DT based compatible for a TEE service to me just feels like it
is redundant here. I can see you have also used a TEE bus based device
too but that is not being properly used. I know subsystems like
remoteproc, SCMI and others heavily rely on DT to hardcode properties of
system firmware which are rather better to be discovered dynamically.

So I have an open question for you and the remoteproc subsystem
maintainers being:

Is it feasible to rather leverage the benefits of a fully discoverable
TEE bus rather than relying on platform bus/ DT to hardcode firmware
properties?

> 
> For instance, this compatible is used in both the Linux and OP-TEE device
> trees:
> - In OP-TEE, a node is defined in the device tree with the
>   "st,stm32mp1-m4-tee" compatible to support signed remoteproc firmware.
>   Based on DT properties, the OP-TEE remoteproc framework is initiated to
>   expose a trusted application service to authenticate and load the remote
>   processor firmware provided by the Linux remoteproc framework, as well
>   as to start and stop the remote processor.
> - In Linux, when the compatibility is set, the Cortex-M resets should not
>   be declared in the device tree. In such a configuration, the reset is
>   managed by the OP-TEE remoteproc driver and is no longer accessible from
>   the Linux kernel.
> 
> Associated with this new compatible, add the "st,proc-id" property to
> identify the remote processor. This ID is used to define a unique ID,
> common between Linux, U-Boot, and OP-TEE, to identify a coprocessor.

This "st,proc-id" is just one such property which can rather be directly
probed from the TEE/OP-TEE service rather than hardcoding it in DT here.
I think the same will apply to other properties as well.

-Sumit

> This ID will be used in requests to the OP-TEE remoteproc Trusted
> Application to specify the remote processor.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../bindings/remoteproc/st,stm32-rproc.yaml   | 58 ++++++++++++++++---
>  1 file changed, 50 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
> index 843679c557e7..58da07e536fc 100644
> --- a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
> @@ -16,7 +16,12 @@ maintainers:
>  
>  properties:
>    compatible:
> -    const: st,stm32mp1-m4
> +    enum:
> +      - st,stm32mp1-m4
> +      - st,stm32mp1-m4-tee
> +    description:
> +      Use "st,stm32mp1-m4" for the Cortex-M4 coprocessor management by non-secure context
> +      Use "st,stm32mp1-m4-tee" for the Cortex-M4 coprocessor management by secure context
>  
>    reg:
>      description:
> @@ -43,6 +48,10 @@ properties:
>            - description: The offset of the hold boot setting register
>            - description: The field mask of the hold boot
>  
> +  st,proc-id:
> +    description: remote processor identifier
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
>    st,syscfg-tz:
>      deprecated: true
>      description:
> @@ -146,21 +155,43 @@ properties:
>  required:
>    - compatible
>    - reg
> -  - resets
>  
>  allOf:
>    - if:
>        properties:
> -        reset-names:
> -          not:
> -            contains:
> -              const: hold_boot
> +        compatible:
> +          contains:
> +            const: st,stm32mp1-m4
>      then:
> +      if:
> +        properties:
> +          reset-names:
> +            not:
> +              contains:
> +                const: hold_boot
> +      then:
> +        required:
> +          - st,syscfg-holdboot
> +      else:
> +        properties:
> +          st,syscfg-holdboot: false
> +        required:
> +          - reset-names
>        required:
> -        - st,syscfg-holdboot
> -    else:
> +        - resets
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: st,stm32mp1-m4-tee
> +    then:
>        properties:
>          st,syscfg-holdboot: false
> +        reset-names: false
> +        resets: false
> +      required:
> +        - st,proc-id
>  
>  additionalProperties: false
>  
> @@ -192,5 +223,16 @@ examples:
>        st,syscfg-rsc-tbl = <&tamp 0x144 0xFFFFFFFF>;
>        st,syscfg-m4-state = <&tamp 0x148 0xFFFFFFFF>;
>      };
> +  - |
> +    #include <dt-bindings/reset/stm32mp1-resets.h>
> +    m4@10000000 {
> +      compatible = "st,stm32mp1-m4-tee";
> +      reg = <0x10000000 0x40000>,
> +            <0x30000000 0x40000>,
> +            <0x38000000 0x10000>;
> +      st,proc-id = <0>;
> +      st,syscfg-rsc-tbl = <&tamp 0x144 0xFFFFFFFF>;
> +      st,syscfg-m4-state = <&tamp 0x148 0xFFFFFFFF>;
> +    };
>  
>  ...
> -- 
> 2.25.1
> 
> 
