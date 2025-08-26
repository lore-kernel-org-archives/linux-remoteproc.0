Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729C5211C;
	Tue, 26 Aug 2025 20:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756238946; cv=none; b=Xw7IMkmTwz0zrGPyv7s5ng1ksxudCCbwySX98qp8u7kQX8icK0gTroZ2D5clff26dvNH4ZpdFekJT2rstwfIgYIepR2UgqUOH/uHYsYeYtmKWz+1/CCtIMQd2qZo+W6A4hPCgub9Uw+XnmrzouWo2gopHBQZfIl/pmOHjoatETE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756238946; c=relaxed/simple;
	bh=De6tXlh/83GdnOt9bMTPx+Vmn3L3ISZ/uryMZcIrB5w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WBEGLMRc1N/IptR+Hfq9kvKb+0KvAIRGhH49Ti338nsavxok8tmPJ6yjhdLLhgEUe9VtBDJz4QLMG39lv/BpsJw56dCQkewjH414Hh1iCHsdG+yHmWfuXs2nWHYzcS20oum1XbdcJEN/vVP0pgjLohsg8qG5YVFaJCrLyKg/hDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rsze/N9t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rsze/N9t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BA1AC4CEF1;
	Tue, 26 Aug 2025 20:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756238945;
	bh=De6tXlh/83GdnOt9bMTPx+Vmn3L3ISZ/uryMZcIrB5w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rsze/N9tQPzXjNLqiKo/xJtWAqCNAVk3sr4XHPf755WUo82wNXx9PTkEMrWRq1uBI
	 8UNuaJdpCWxB/fpnvFIJW5YM2VVLdH7nXkRSXRHTeyRhCGRQAlFfrP0684iNyWY3pz
	 zK+RDB3Q6k1xR3nyG37s5imD22axHTdFaqAdpoXrtQaugje8iVFo1lFp4nAEAOs9cT
	 2egbEcuTbBBU6WfsKkFhBlLL130t/V3VqFEnCqhNWhnG8WrTkuqoYCK5YbN7WsD60b
	 jxS/3iDWzefeMq6U4Fr/AdEmLEeEruKsW2AGRbPzMsIY2WKvEY4F/xqoTAOAplHEIp
	 dXBKIEF0FCieg==
Date: Tue, 26 Aug 2025 15:09:04 -0500
From: Rob Herring <robh@kernel.org>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-imx@nxp.com
Subject: Re: [PATCH 1/4] dt-bindings: remoteproc: imx_rproc: Add "rpmsg"
 subnode support
Message-ID: <20250826200904.GA375876-robh@kernel.org>
References: <20250818204420.794554-1-shenwei.wang@nxp.com>
 <20250818204420.794554-2-shenwei.wang@nxp.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818204420.794554-2-shenwei.wang@nxp.com>

On Mon, Aug 18, 2025 at 03:44:17PM -0500, Shenwei Wang wrote:
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

How is each channel addressed? Are they really grouped by type first 
(i2c, gpio, etc.) then an address within the group? Or is there some 
flat channel numbering? If the latter, then the addresses in the DT 
shoulc match the channel number.

> 
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> ---
>  .../bindings/remoteproc/fsl,imx-rproc.yaml    | 117 ++++++++++++++++++
>  1 file changed, 117 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> index 57d75acb0b5e..a105aac798d0 100644
> --- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> @@ -84,6 +84,86 @@ properties:
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
> +      '#address-cells':
> +        const: 1
> +
> +      '#size-cells':
> +        const: 0
> +
> +      rpmsg-io-channel:
> +        type: object
> +        unevaluatedProperties: false
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
> +
> +              reg:
> +                maxItems: 1
> +
> +            required:
> +              - compatible
> +              - reg
> +
> +            allOf:
> +              - $ref: /schemas/gpio/gpio.yaml#
> +              - $ref: /schemas/interrupt-controller.yaml#

This is not needed nor sufficient. You need to define the cell sizes for 
gpio and interrupt cells.

> +
> +        required:
> +          - '#address-cells'
> +          - '#size-cells'
> +
> +      rpmsg-i2c-channel:
> +        type: object
> +        unevaluatedProperties: false
> +        properties:
> +          '#address-cells':
> +            const: 1
> +
> +          '#size-cells':
> +            const: 0
> +
> +        patternProperties:
> +          "i2c@[0-9a-f]+$":
> +            type: object
> +            unevaluatedProperties: false
> +            properties:
> +              compatible:
> +                enum:
> +                  - fsl,imx-rpmsg-i2c
> +
> +              reg:
> +                maxItems: 1
> +
> +            required:
> +              - compatible
> +              - reg
> +
> +            allOf:
> +              - $ref: /schemas/i2c/i2c-controller.yaml#
> +
> +        required:
> +          - '#address-cells'
> +          - '#size-cells'
> +
>  required:
>    - compatible
>  
> @@ -146,5 +226,42 @@ examples:
>                  &mu 3 1>;
>        memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>, <&rsc_table>;
>        syscon = <&src>;
> +
> +      rpmsg {
> +        rpmsg-io-channel {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          gpio@0 {
> +            compatible = "fsl,imx-rpmsg-gpio";
> +            reg = <0>;
> +            gpio-controller;
> +            #gpio-cells = <2>;
> +            #interrupt-cells = <2>;
> +            interrupt-controller;
> +            interrupt-parent = <&rpmsg_gpioa>;
> +          };
> +
> +          gpio@1 {
> +            compatible = "fsl,imx-rpmsg-gpio";
> +            reg = <1>;
> +            gpio-controller;
> +            #gpio-cells = <2>;
> +            #interrupt-cells = <2>;
> +            interrupt-controller;
> +            interrupt-parent = <&rpmsg_gpiob>;
> +          };
> +        };
> +
> +        rpmsg-i2c-channel {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          i2c@0 {
> +            compatible = "fsl,imx-rpmsg-i2c";
> +            reg = <0>;
> +          };
> +        };
> +      };
>      };
>  ...
> -- 
> 2.43.0
> 
