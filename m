Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFBAE25486D;
	Wed,  8 Oct 2025 15:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759939001; cv=none; b=IV7i1zjlq+hiXxOsA7/HIVgQS8pUw0c2oAwfzcg73B9b9Xun/w/LD6nDQn7kk8FN5pHZRTvEZs2OsrKbuSU1OEX51dWYec46nHcxj9IwKJUwi0U1EIQuX9F9EhAV49ON8ueNyFqzsa5QRDYfIzFN0cMIHmEQQdhrEEyvc4OtsbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759939001; c=relaxed/simple;
	bh=OTtx94002DcN85g3AnhuB82aJANJNeLNX0xgDeQazR4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gxXwcX35tZJMmX9z/RN0RpJSAY5nUHj89MvAE38PU0noUlJDVCqQiWq+ttlQvskp9umBOEaV4istxqAlx69iyATdLWbRWI2dUbD871b7qavhKypjaBzOtHCfI1PltpM2eVdVOxYCOBmwMY4EmE45NGLTfVPjL8Wykzz010EJ0Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eJty5anI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eJty5anI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FE07C4CEE7;
	Wed,  8 Oct 2025 15:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759939000;
	bh=OTtx94002DcN85g3AnhuB82aJANJNeLNX0xgDeQazR4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eJty5anIU2p5TwpwV90XJuJKHmBucrx6RFXaizi9UQVrNGa1AIX1JQMotCiW7sZ6Y
	 UQu90FEZ/AHbz+b07lehm7d8ZND0VH3Z8bgWegnwXYWCMOTbRSHhmITPHTbi0PN7H5
	 nEFfqoQPMT2rXt0jeXw2jCmKWkU7PT8LBv9yhceoS3aky4DBYF4fHCWgvnIYrUKRfp
	 R2I9TKZ66YOYigL89ClOibXbmsWmHMXCSGfR12TccwtJsW0ND72z3wPq914xGSA79U
	 uYo3r45pLxSJu5SLV4sZvAflr4a+fQja2PN0Dp2EGxXPySklxdW3DQSgNJARnRvHjm
	 +te5uxkIu/hEA==
Date: Wed, 8 Oct 2025 10:56:39 -0500
From: Rob Herring <robh@kernel.org>
To: Kamal Dasu <kamal.dasu@broadcom.com>
Cc: peng.fan@oss.nxp.com, andersson@kernel.org,
	baolin.wang@linux.alibaba.com, krzk+dt@kernel.org,
	conor+dt@kernel.org, florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: hwlock:  Adding brcmstb-hwspinlock
 support
Message-ID: <20251008155639.GA3512742-robh@kernel.org>
References: <20251001181641.1561472-1-kamal.dasu@broadcom.com>
 <20251001181641.1561472-2-kamal.dasu@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251001181641.1561472-2-kamal.dasu@broadcom.com>

On Wed, Oct 01, 2025 at 02:16:39PM -0400, Kamal Dasu wrote:
> Adding brcmstb-hwspinlock bindings.

That's obvious from the diff. Tell us something about the h/w and 
convince me we don't need per SoC compatible which is standard practice.

> 
> Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
> ---
>  .../hwlock/brcm,brcmstb-hwspinlock.yaml       | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspinlock.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspinlock.yaml b/Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspinlock.yaml
> new file mode 100644
> index 000000000000..f45399b4fe0b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspinlock.yaml
> @@ -0,0 +1,36 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwlock/brcm,brcmstb-hwspinlock.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Broadcom settop Hardware Spinlock
> +
> +maintainers:
> +  - Kamal Dasu <kamal.dasu@broadcom.com>
> +
> +properties:
> +  compatible:
> +    const: brcm,brcmstb-hwspinlock

hwspinlock is the name of the h/w block? Use the name of the h/w, not 
linux subsystem names.

> +
> +  "#hwlock-cells":
> +    const: 1
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#hwlock-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    hwlock@8404038 {
> +        compatible = "brcm,brcmstb-hwspinlock";
> +        reg = <0x8404038 0x40>;

h/w blocks rarely start at an offset like that. Is this part of some 
other h/w block? If so, then just add '#hwlock-cells' to *that* node.

> +        #hwlock-cells = <1>;
> +    };
> +
> -- 
> 2.34.1
> 
