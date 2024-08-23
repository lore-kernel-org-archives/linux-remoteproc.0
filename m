Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37413F9F9;
	Fri, 23 Aug 2024 06:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724394319; cv=none; b=RikP9pej3yiqCaYwLfIKjMTQpJWqhXbDDZTRCYhj8Ikng4jkQAG5CBEGoErbDS0sInv2zGxe1wWL+sxUfRLOHLMhIt1MinxY9XMRGSfRba9sud5pOwHV6r2ap/6SjXABtuWgThFScr2B4yqUqrtntQOxrL+dSr9Htl5I0dnFrKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724394319; c=relaxed/simple;
	bh=b8+xbNGFFvZbVGIexd79/RcpSXAvJrYf5MtQPw1Ekwc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=URG+/blS8GCnvdOzK4mWu8i4QMUaMwklpV0fRKKgGPam91BftpVkYFQie3kVdXwt4QtAm14G/IJNCAKKAiDHHU7zFf7cioXJxA9FZk8jT6M5QM+km44WX/0uvwXbqGAtMqY240dr1YVZ5aT/4mLVFOorA51cRMYGlYHXAHfHvDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qQRba9Vp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qQRba9Vp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C50A0C32786;
	Fri, 23 Aug 2024 06:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724394318;
	bh=b8+xbNGFFvZbVGIexd79/RcpSXAvJrYf5MtQPw1Ekwc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qQRba9Vp2fQAnj5NBv733OgeOIJPKOiIjvmObyInyW2R04kw4bXgvMWuEe1QME8Jq
	 mmzzSoXqa30HT+OpFd/N2P20zKoWGFhfB/W0m5YTl9be+xPo/0qBzkTeumRnFzfOSW
	 OdgKtQYCH7EyPXUP3ZFJPpoDuW99QryzMMRiHpB25pIRbc6ry9BtKFMZNQwuOC55Gp
	 5JKBQHBaIRVfSGnCUqV4lt81ff2HNCRmloRN0ml85tO+KYX1TWus8VhbriMGdC776N
	 lFkqQVlB6qtJ98JVgftuEPb9OQp5qgfudRQE4UnYvti4yR0DxSb4vUg4UnKox0g9+A
	 lhWlh0Rreol0Q==
Date: Fri, 23 Aug 2024 08:25:08 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Cc: mathieu.poirier@linaro.org, Adam.Johnston@arm.com, 
	Hugues.KambaMpiana@arm.com, Drew.Reed@arm.com, andersson@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	liviu.dudau@arm.com, lpieralisi@kernel.org, robh@kernel.org, sudeep.holla@arm.com, 
	robin.murphy@arm.com
Subject: Re: [PATCH v2 2/5] dt-bindings: arm: sse710: Add Host Base System
 Control
Message-ID: <s6zorfinldyjslnsv2z6quyahvt6yurfe3mxflbcdftumishm5@wwgsjqb2vg2u>
References: <CANLsYkwOrtXxObL5MKf30OrUYB_uT=DnGEXUtfjH503r_LyMQA@mail.gmail.com>
 <20240822170951.339492-1-abdellatif.elkhlifi@arm.com>
 <20240822170951.339492-3-abdellatif.elkhlifi@arm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240822170951.339492-3-abdellatif.elkhlifi@arm.com>

On Thu, Aug 22, 2024 at 06:09:48PM +0100, Abdellatif El Khlifi wrote:
> Add devicetree binding schema for the SSE-710 Host Base System Control
> 
> SSE-710 is implemented by the Corstone-1000 IoT Reference Design
> Platform [1].
> 
> The Host Base System Control has registers to control the clocks, power,
> and reset for SSE-710 subsystem [2]. It resides within AONTOP power domain.
> The registers are mapped under the SSE-710 Host System memory map [3].
> 
> [1]: https://developer.arm.com/Processors/Corstone-1000
> [2]: https://developer.arm.com/documentation/102342/latest/
> [3]: https://developer.arm.com/documentation/102342/0000/Programmers-model/Register-descriptions/Host-Base-System-Control-register-summary
> 
> Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
> ---
>  .../arm/arm,sse710-host-base-sysctrl.yaml     | 56 +++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/arm,sse710-host-base-sysctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/arm,sse710-host-base-sysctrl.yaml b/Documentation/devicetree/bindings/arm/arm,sse710-host-base-sysctrl.yaml
> new file mode 100644
> index 000000000000..e344a73e329d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/arm,sse710-host-base-sysctrl.yaml
> @@ -0,0 +1,56 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/arm,sse710-host-base-sysctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SSE-710 Host Base System Control
> +
> +maintainers:
> +  - Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
> +  - Hugues Kamba Mpiana <hugues.kambampiana@arm.com>
> +
> +description: |+

Drop |+

> +  The Host Base System Control has registers to control the clocks, power, and
> +  reset for SSE-710 subsystem. It resides within AONTOP power domain.
> +  The registers are mapped under the SSE-710 Host System memory map.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - arm,sse710-host-base-sysctrl
> +      - const: simple-mfd
> +      - const: syscon
> +
> +  reg:
> +    maxItems: 1
> +
> +patternProperties:
> +  "^extsys[0-1]$":

^remoteproc-[01]$

> +    description:
> +      SSE-710 subsystem supports up to two External Systems.
> +    $ref: /schemas/remoteproc/arm,sse710-extsys.yaml#
> +    unevaluatedProperties: false
> +
> +additionalProperties: false

This goes after "required:" block.

> +
> +required:
> +  - compatible

Best regards,
Krzysztof

