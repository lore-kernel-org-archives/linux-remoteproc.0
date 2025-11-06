Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F2D28468B;
	Thu,  6 Nov 2025 18:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762453115; cv=none; b=oo/TMnVKtn2FnHDdiq3buv/dOjzMQ9i3W8zJR+kN/FE+mWvL369K028uBs9pnmuu9QJeUoqNZzFn0QG+bcZiFo9reZwjPfm46hLbh+vCfA2NGmVejBD0zjlHP8cu6QZ99Ou1JRii+MEvJXIjo1F1kWKU8M2WO0DUl9jukWmZXiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762453115; c=relaxed/simple;
	bh=lB6fDF1Zfl9wJ/kP2KwgZTsa6w8/Xh+hFv+xPfLNKi4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mCG+P7fo3b87OavbgnPU7j5IaaX9Gs8yaB2eZknwU6F7s4j7SRFoRtv6UMoMeqxNJAEUoAWR/fbf57Xjta/7BXp0lR5AEOYqoOHLRSc+B3N1Zdd8eEft1z2S5bwi2iauqeBun+qRwPODCeDzduYNUN/wqNUNuJDLpLSRzU9Px8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=N4PJSDn9; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="N4PJSDn9"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=vhHvTNreRheNZnwkv+jEyS0ZIZrro/GQVLO5u3qCIyA=; b=N4PJSDn9Y+nGaK5rdqlVuMzsHx
	4+Gc6CED93EJtPPFcXUmokKkE5BRTQuANAJ9oUuVqfXDS+mODt2Wkr/DVeqaIJr3qHiZuTFnSBN3U
	xeZlGKKOa9DI3e4sgzYk9XC3wuKuM4s2KLed1Lnpn+VssMwW7M960FFXI2b7PwtYc2+Q=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vH4Yr-00D982-3s; Thu, 06 Nov 2025 19:18:17 +0100
Date: Thu, 6 Nov 2025 19:18:17 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-imx@nxp.com
Subject: Re: [PATCH v5 1/5] dt-bindings: remoteproc: imx_rproc: Add "rpmsg"
 subnode support
Message-ID: <e2cc2645-9eb4-485b-9c18-650a1ba70e62@lunn.ch>
References: <20251104203315.85706-1-shenwei.wang@nxp.com>
 <20251104203315.85706-2-shenwei.wang@nxp.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251104203315.85706-2-shenwei.wang@nxp.com>

On Tue, Nov 04, 2025 at 02:33:11PM -0600, Shenwei Wang wrote:
> Remote processors may announce multiple devices (e.g., I2C, GPIO) over
> an RPMSG channel. These devices may require corresponding device tree
> nodes, especially when acting as providers, to supply phandles for their
> consumers.
> 
> Define an RPMSG node to work as a container for a group of RPMSG channels
> under the imx_rproc node.
> 
> Each subnode within "rpmsg" represents an individual RPMSG channel. The
> name of each subnode corresponds to the channel name as defined by the
> remote processor.
> 
> All remote devices associated with a given channel are defined as child
> nodes under the corresponding channel node.
> 
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> ---
>  .../bindings/remoteproc/fsl,imx-rproc.yaml    | 123 ++++++++++++++++++
>  1 file changed, 123 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> index 57d75acb0b5e..897a16c4f7db 100644
> --- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> @@ -84,6 +84,92 @@ properties:
>        This property is to specify the resource id of the remote processor in SoC
>        which supports SCFW
>  
> +  rpmsg:
> +    type: object
> +    additionalProperties: false
> +    description:
> +      Present a group of RPMSG channel devices.
> +
> +    properties:
> +      rpmsg-io-channel:
> +        type: object
> +        additionalProperties: false
> +        properties:
> +          '#address-cells':
> +            const: 1
> +
> +          '#size-cells':
> +            const: 0
> +
> +        patternProperties:
> +          "gpio@[0-9a-f]+$":
> +            type: object
> +            unevaluatedProperties: false
> +            properties:
> +              compatible:
> +                enum:
> +                  - fsl,imx-rpmsg-gpio

The compatible should be generic. Or at least, you need a generic
fallback, since the one driver should be able to handle all
implementation.

> +
> +              reg:
> +                maxItems: 1
> +
> +              "#gpio-cells":
> +                const: 2
> +
> +              gpio-controller: true
> +
> +              interrupt-controller: true
> +
> +              "#interrupt-cells":
> +                const: 2
> +
> +            required:
> +              - compatible
> +              - reg
> +              - "#gpio-cells"
> +              - "#interrupt-cells"
> +
> +            allOf:
> +              - $ref: /schemas/gpio/gpio.yaml#
> +              - $ref: /schemas/interrupt-controller.yaml#

The gpio part should really be pulled out into a separate .yaml file,
because it should be identical for all implementation. You just need
to reference it here.

	Andrew
