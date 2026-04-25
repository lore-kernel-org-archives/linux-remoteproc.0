Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34CD29898F;
	Sat, 25 Apr 2026 10:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777112157; cv=none; b=Nii20xYWqLvxNCQcdcYMeBRm4qr8Z4jBVWboHnTI4sUO2T5F6FpBMj/P/cZRimm9h1SKb3V6Xan5rb7mU7+jS53pxvU0wEm8hkgBG1owuZHkBA4NugKV6DM7dp9G/9JysBenejKYDIx3Q3FLP7ytweUkrJRJe7lXRTdjjAXrPFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777112157; c=relaxed/simple;
	bh=/Fi4KBZSuwahGziSSvfPYbgoDm2sFpiwbfvgpYBAR1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nP0U4XLAYIcgSOD+kqv560BUawe9HZorHykp+vPgM7qc2HB0zNIkcfM5ZXpcNOl3dxJ8e7vLG5DAGmAovBtgzhdIY9CGR54Gr58Tf5Catu4UjJMfJDm78IuLmOtmra5I4b0Encag65f/GrLTVjT8QtEQXQErKORAk/FoW4I91Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=roPFzf6o; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="roPFzf6o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C19A2C2BCB0;
	Sat, 25 Apr 2026 10:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777112157;
	bh=/Fi4KBZSuwahGziSSvfPYbgoDm2sFpiwbfvgpYBAR1Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=roPFzf6o21rr2/JZVPfx7lp7MWWRoO4MZhz9oFvFZky+6i91/TvU3F1rkZP0/NgUN
	 wjOjZvD6++l8fvjsJ6dGEaRijQkWLnGQYVDx1+UHhyS5+0B5aeWY9i8vuz31OARIG3
	 bHl7w/gtLS469M0vGRqeFTefxQ1DN3bsMT+e6bkK79RdlbftUJzuHyGI9teESzmtr2
	 3MGcqPhcAzKwO6pa3RItpd5sRmbAh4zsp0ppcfvKttL819ooy7ZqNnwO4LuAz0wbW9
	 k0ziPBo7CrWtqQ/FOtR0pMFc/hjzFdPK2WRagfgzR45F1JdiuNC7A4k41YiloJC3/L
	 9/N1SewPCQ2LQ==
Date: Sat, 25 Apr 2026 12:15:54 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mason Huo <mason.huo@starfivetech.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: hwlock: Add the support of
 HWspinlock for StarFive JHB100
Message-ID: <20260425-didactic-junglefowl-of-science-096e34@quoll>
References: <20260424032026.62301-1-xingyu.wu@starfivetech.com>
 <20260424032026.62301-2-xingyu.wu@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260424032026.62301-2-xingyu.wu@starfivetech.com>

On Fri, Apr 24, 2026 at 11:20:25AM +0800, Xingyu Wu wrote:
> Add the new documentation of hardware spinlock for the StarFive JHB100 SoC.

Simplify the subject. You cannot add here support for a device, you just
add a device simply.

"Add StarFive JHB100 HW lock"

> 
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> ---
>  .../hwlock/starfive,jhb100-hwspinlock.yaml    | 40 +++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwlock/starfive,jhb100-hwspinlock.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwlock/starfive,jhb100-hwspinlock.yaml b/Documentation/devicetree/bindings/hwlock/starfive,jhb100-hwspinlock.yaml
> new file mode 100644
> index 000000000000..b1b27fafe9bc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwlock/starfive,jhb100-hwspinlock.yaml
> @@ -0,0 +1,40 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwlock/starfive,jhb100-hwspinlock.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive Hardware Spinlock

StarFive JHB100?

> +
> +maintainers:
> +  - Xingyu Wu <xingyu.wu@starfivetech.com>
> +
> +properties:
> +  compatible:
> +    const: starfive,jhb100-hwspinlock
> +
> +  reg:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  "#hwlock-cells":
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - resets
> +  - "#hwlock-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    hwspinlock@13012000 {

name: hwlock

Best regards,
Krzysztof

