Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3480910F1;
	Mon, 29 Dec 2025 05:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766986778; cv=none; b=oilWU3oICHRAyMlxxV8uIHNlckb/8iEJWEHBVytC31/yVG0Weigfgb6WzwCzbVuo88SO2rSNwv+bI4tCZmOuzMvQ+YPIhVEox0BW8yZvCETUKIDaejakbbD6TpdRMeNo2v75HIX5xW01znaQaxJ5HI5kEBLG1jvxhTdpm0s92OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766986778; c=relaxed/simple;
	bh=hUD0ESZR0fiGX+5i+A4WD58O6b8Rleo0ARVfBQND1fg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ryfkeBQCjZlw0UFv+FWs1kv4jOLHC93hTPwZbUt5CN7r4y2HScRCGnZdgGZKjefn0ubTK2cgXLHIJhgunpOhDxi5xLsozUsLUn/2HzQs0Q05ya6vkHEauTDXBvAxpG+nW6DtGdLDPlzZE14TYFt3917IsDjAfd34If+hJQ6P2mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=crfK7hGE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="crfK7hGE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37B43C4CEF7;
	Mon, 29 Dec 2025 05:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766986778;
	bh=hUD0ESZR0fiGX+5i+A4WD58O6b8Rleo0ARVfBQND1fg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=crfK7hGEKJQd+jZ/mzVVllUGC53q1JtiM6l0nfgK0VmZ+jHGITOazGfxXJsgGjzhk
	 w+SOgDsDiiDVFhcjFx1MwfiTWZ4iCOnfJ5EpkBzLLWt/b9jfx4VxULNYVllvN1APN4
	 uP9z7nLzBszdSpkTIk2HnRHyVqAYtM/5D1uVgjcTZIEUeFCGzWV1E/CK4ZZsoYLvVJ
	 Pdx7fX6aZsz1Wh0NTY94/o1DY+6Z7T2Yu3GA8BDwQ7eCMrdCy6OkzGQbPbZsxhT/rF
	 9SDLMgTzaZnjdXrCdRo8HKNS0FEwwW2jwb2iPYJjAPtXUv/IMpJLD4dKLvBVPFr6gi
	 MQpYWX6j4BHyg==
Date: Mon, 29 Dec 2025 11:09:29 +0530
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
Subject: Re: [PATCH v20 1/6] dt-bindings: firmware: Add TEE remoteproc
 service binding
Message-ID: <aVIUEafDoVQv0rHf@sumit-xelite>
References: <20251217153917.3998544-1-arnaud.pouliquen@foss.st.com>
 <20251217153917.3998544-2-arnaud.pouliquen@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251217153917.3998544-2-arnaud.pouliquen@foss.st.com>

On Wed, Dec 17, 2025 at 04:39:12PM +0100, Arnaud Pouliquen wrote:
> Add a device tree binding for the TEE-based remote processor control
> service implemented as an OP-TEE Trusted Application identified by
> UUID 80a4c275-0a47-4905-8285-1486a9771a08.
> 
> The TEE service node is a child of the "linaro,optee-tz" firmware node and
> acts as a container for remoteproc devices that are controlled via TEE.
> 
> In addition, the "linaro,optee-tz" binding is updated to specify the
> '#address-cells' and '#size-cells' values used for child TEE service
> nodes.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  .../arm/firmware/linaro,optee-tz.yaml         |  6 +++
>  .../bindings/remoteproc/remoteproc-tee.yaml   | 47 +++++++++++++++++++
>  2 files changed, 53 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/remoteproc-tee.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/firmware/linaro,optee-tz.yaml b/Documentation/devicetree/bindings/arm/firmware/linaro,optee-tz.yaml
> index 5d033570b57b..ab69eecba9ad 100644
> --- a/Documentation/devicetree/bindings/arm/firmware/linaro,optee-tz.yaml
> +++ b/Documentation/devicetree/bindings/arm/firmware/linaro,optee-tz.yaml
> @@ -41,6 +41,12 @@ properties:
>        HVC #0, register assignments
>        register assignments are specified in drivers/tee/optee/optee_smc.h
>  
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
>  required:
>    - compatible
>    - method
> diff --git a/Documentation/devicetree/bindings/remoteproc/remoteproc-tee.yaml b/Documentation/devicetree/bindings/remoteproc/remoteproc-tee.yaml
> new file mode 100644
> index 000000000000..083ecf1f38cf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/remoteproc-tee.yaml
> @@ -0,0 +1,47 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/remoteproc/remoteproc-tee.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: TEE Remote Processor Control Service (UUID 80a4c275-0a47-4905-8285-1486a9771a08)
> +
> +maintainers:
> +  - Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> +
> +description: |
> +  Node describing a TEE-based remote processor control service implemented as
> +  a Trusted Application identified by UUID 80a4c275-0a47-4905-8285-1486a9771a08.
> +
> +  It is a child of the OP-TEE firmware node ("linaro,optee-tz") and acts as a
> +  container for child remoteproc devices (for example, the STM32MP15 M4 core
> +  described by "st,stm32mp1-tee").
> +
> +properties:
> +  compatible:
> +    const: rproc-service-80a4c275-0a47-4905-8285-1486a9771a08

This should just be "80a4c275-0a47-4905-8285-1486a9771a08" which is the
device/service identity on TEE bus.

-Sumit

> +
> +  reg:
> +    description: |
> +      Logical identifier of the TEE remoteproc service instance.
> +    maxItems: 1
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +patternProperties:
> +  "^[a-zA-Z0-9,._-]+@[0-9a-fA-F]+$":
> +    type: object
> +
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +additionalProperties: false
> +...
> -- 
> 2.43.0
> 
