Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B7E943CE59
	for <linux-remoteproc@vger.kernel.org>; Mon, 24 Aug 2026 14:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787582334; cv=pass; b=YoKbSwHxdGDJB2M6Fywfvvskv174XZf3NQ9ZTvVtgPliXyGEST5uvQwBM3Ku5DL12Q4zft0Vi7CXYSVP/7Zor9FOlF2VIvTVGGbTiOqzBcpAPmeXI77Q7EOR2yutZEIofBKeVh2Ozda00S46SQNUQ3MibTzXpteqOpF63a9p+H8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787582334; c=relaxed/simple;
	bh=uIVVpMDmMGX0h/fu4HXu0BYDldpKQW0ZxH1umBAPys0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MjLGq6JXLKc8sT6qe8dzk+8l5ZeIZMZvNvrXIApPYREWenhHzwJXvK27jSXfBBM2qHuPMdzM1mdlYV9tre35O9csR97WzRdvW6CWEEkyyHLkTWTEeoCg7Lp5KT09K5x8D4CsuZYSDpr0NSb1NZ2trEUM/hjNaI/lwezSVMRhZfg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VvZkwirj; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VvZkwirj"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6a1542cdb53so4351814a12.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 24 Aug 2026 07:38:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787582330; cv=none;
        d=google.com; s=arc-20260327;
        b=XAcA6fih9LhKMdJrtlZouO4XWdAUslNa+MFEeVNrxx4+EwhnUszv258uOgV4I4pl+W
         IpB90yT/lTRW2OREawdVTaPYIq9zdYKG2SRCOEP4A2qkTMh2dmqCY/rkd4dKlJaiOO0g
         PTG27WSew6NHcU0yqrnhD/J2daS2R0EflHcpm9ixCPU3qt/j9HOPtvnbmZhbzqkrcBMI
         LO1RU3Z4KnDLOBBELc9EnWcTbNeT0tRoVpxuxDEwU1FkeVDsSvcuBITpUTrT5iMFK1Go
         loe5ow+13ZeuM9NCKs5SCVGdkIpbCv22p0YLIRCpNsSbp3Qcy/qdrmXtdJjSGJPG1UTQ
         gVEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Vm1p9M4lR0nH2xefCtH9dUaY37Y2P9W6T0kJp4WGVyI=;
        fh=ZgfsZQ0PPe8+LcFyt/MbLyWF2iW303ajEH3ZNnnstCU=;
        b=RWWtyBW8ys0dtjsXMNUnTXKL/lmrzEclGxr+seWyaUuadzdTV2m02+1fvB8f2srbgw
         JjlElaCaEg060iAvm2F6oJobQSkT//i1h+gqw/NGFc14JDIeHsTCZgD5Cg1BQWP8YL6j
         gJiqMqL5xQvp4sPenxvO+G96LPqszWeDYI37XHBrQZ8mWvah0MFWi3eo26wPp4tOpe0q
         xmH7JstTcEXOGfYiZzfFmHOn4WwYUwXKbi9X9WIpDyprAtLMACn4screCCnrFFhsAaV3
         YXtq7bTRrSChh0jgTTZLoNoccdBnZCsmdAJQgwQfmIjNFweX9kI+VhW3j3NHMT0LVCFo
         5ecw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787582330; x=1788187130; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vm1p9M4lR0nH2xefCtH9dUaY37Y2P9W6T0kJp4WGVyI=;
        b=VvZkwirjYSsd3dI2r3gNzvi5pI3wSfJrsSArNnW9Y2ROIlS/8QRqNL7LGDH9aypVsc
         23FFX6uhpzplKWd9Tpj7WM7Upx/qo58j3lnRS+OpS2bSjfCKL2vV60oEyXYqJFvszkS3
         sOj43oeVmWALH3aG3FgepLaidHbJf1cZ1J2UMl+DbxeRlgCMuebqjY0i3h492P9LXFSD
         Ku5qlv5/1IaE5Bryclv5tUNCFYY1gbwZYrSNXeAWy40WyrDTiPMH0h9YsmThxk+ATW1s
         pzvzRncB89LCfhFdxCyWHj2T2ytuIhdFRSNun2OBa5y4UKTa9XL1y6pTWgkNMqdkytUa
         Tqzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787582330; x=1788187130;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Vm1p9M4lR0nH2xefCtH9dUaY37Y2P9W6T0kJp4WGVyI=;
        b=Ncp+jS/vy+ZH18b8CHrCZsZD5nQ+OQtu0JSwsq8qYHioRRlW2CBeleBLCcmqRknChP
         FuPUM8TatZ9Drfq8fu23LSV9j/+pljc3zHnUX5eCKi/x5vGGSkoHAN0FER7/ZoVXKzIt
         6rsGuucK0ZMV4MBJDq2oG/XV2vQQu4nHdBNiDNBOl9io+OT60znY5cEq7lbR7BTEh7f9
         Buq/m6jS23NYK+2uf4l+DIjMYxTD1XpoCAeUdr6O4GlYW6A+VIiHMjoE4YolsFvv7SbU
         EOhRmTGxfQQiQv7Ueykb/b9SUe82hCl5HjxwcVBJSCwfGRJday6LYDBIfR3DgjlyXyjS
         m+zw==
X-Forwarded-Encrypted: i=1; AHgh+RoA807/SRgltVEggxZLIeVjxDPJmXzy3eabIcmRrEUq581z1Qf35cVwdGlM5r900UWT1yi82GEnpWqd0dXYEm6E@vger.kernel.org
X-Gm-Message-State: AFuF++n2mZ5Qk9Fu+RjlKH6OO3iR7xLN//vuJK2xEyQhQPe/uaXyoHmr
	fOCFRLqbOhasHRitTtLvRJ0qhY1tlp8FGuiZh+ms+tMwbYbjOuVO/4bEkOad3rpEcB0Ng/Jl0rP
	QIMWPb4pRdg1zG9R2Z5ZFyMBPtemH2ZPzfuskViOW3A==
X-Gm-Gg: AR+sD13ZnF5zK7PPSUzzmleyXfOtJTl6I+qYB5xr9oXQ3QNMogKyRyQ/cTCf+Pg0o31
	sGZEnkFqxSQAYMHBD7EQnmuvueVaQkiAS6DgKNahCs4Gr0Cn3w1yW5iaH0JkyLBGJLp9OxA2QNK
	28PFWXMRsrJnXL9br6B/zqa5H0Gfdi9y/kYm9zRZes3PdvAaiWv8BEFTDUofy8K3NiQsdJT73dM
	QiLKyKOrUSbjGV1aZyqQnp8GN7jb9Xef8neUmaKQUBXSfEhdaGQ/1DQRWCOFpz1MERasx8veu8I
	8O+slt6lNsNZXtAAt5Xjfrfvfijr7Ghi92rcXHDx+cXsrr1LmOOQD2+FA1CQuX9pj8WfkE0L/WH
	cYJI=
X-Received: by 2002:a05:6402:a50a:10b0:6a4:cc9:e32b with SMTP id
 4fb4d7f45d1cf-6a582b608b0mr13946214a12.9.1787582330522; Mon, 24 Aug 2026
 07:38:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721204704.400781-1-shenwei.wang@oss.nxp.com> <20260721204704.400781-3-shenwei.wang@oss.nxp.com>
In-Reply-To: <20260721204704.400781-3-shenwei.wang@oss.nxp.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Mon, 24 Aug 2026 08:38:38 -0600
X-Gm-Features: AcwNN1WkCFZbvWxe4PQA8OwbQcV2Qi4oWD0S_a9VEHwbP89HadQ5rWBGiqMxI74
Message-ID: <CANLsYkxZbr9hKaJJGXwYXErLwQ-A07eb-oeNXY1CceHHa0Tdmg@mail.gmail.com>
Subject: Re: [PATCH v15 2/5] dt-bindings: remoteproc: imx_rproc: Add "rpmsg"
 subnode support
To: Shenwei Wang <shenwei.wang@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com, 
	Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, b-padhi@ti.com, Andrew Lunn <andrew@lunn.ch>
Content-Type: text/plain; charset="UTF-8"

On Tue, 21 Jul 2026 at 14:48, Shenwei Wang <shenwei.wang@oss.nxp.com> wrote:
>
> From: Shenwei Wang <shenwei.wang@nxp.com>
>
> Remote processors may announce multiple GPIO controllers over an RPMSG
> channel. These GPIO controllers may require corresponding device tree
> nodes, especially when acting as providers, to supply phandles for their
> consumers.
>
> Define an RPMSG node to work as a container for a group of RPMSG channels
> under the imx_rproc node. Each subnode within "rpmsg" represents an
> individual RPMSG channel. The name of each subnode corresponds to the
> channel name as defined by the remote processor.
>
> All remote devices associated with a given channel are defined as child
> nodes under the corresponding channel node.
>
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> ---
>  .../devicetree/bindings/gpio/gpio-rpmsg.yaml  | 55 +++++++++++++++++++
>  .../bindings/remoteproc/fsl,imx-rproc.yaml    | 53 ++++++++++++++++++
>  2 files changed, 108 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml
>
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml b/Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml
> new file mode 100644
> index 000000000000..41eb2e149942
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml
> @@ -0,0 +1,55 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/gpio-rpmsg.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Generic RPMSG GPIO Controller
> +
> +maintainers:
> +  - Shenwei Wang <shenwei.wang@nxp.com>
> +
> +description:
> +  On an AMP platform, some GPIO controllers are exposed by the remote processor
> +  through the RPMSG bus. The RPMSG GPIO transport protocol defines the packet
> +  structure and communication flow between Linux and the remote firmware. Those
> +  controllers are managed via this transport protocol. For more details of the
> +  protocol, check the document below.
> +  Documentation/driver-api/gpio/gpio-rpmsg.rst
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - fsl,rpmsg-gpio
> +          - const: rpmsg-gpio
> +      - const: rpmsg-gpio
> +
> +  reg:
> +    description:
> +      The reg property represents the index of the GPIO controllers. Since
> +      the driver manages controllers on a remote system, this index tells
> +      the remote system which controller to operate.
> +    maxItems: 1
> +
> +  "#gpio-cells":
> +    const: 2
> +
> +  gpio-controller: true
> +
> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    const: 2
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#gpio-cells"
> +  - gpio-controller
> +
> +allOf:
> +  - $ref: /schemas/gpio/gpio.yaml#
> +
> +unevaluatedProperties: false
> diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> index c18f71b64889..b9b559b186af 100644
> --- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> @@ -88,6 +88,34 @@ properties:
>        This property is to specify the resource id of the remote processor in SoC
>        which supports SCFW
>
> +  rpmsg:
> +    type: object
> +    additionalProperties: false
> +    description:
> +      Represents the RPMSG bus between Linux and the remote system. Contains
> +      a group of RPMSG channel devices running on the bus.
> +
> +    properties:
> +      rpmsg-io:
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
> +          "^gpio@[0-9a-f]+$":
> +            type: object
> +            $ref: /schemas/gpio/gpio-rpmsg.yaml#
> +            unevaluatedProperties: false
> +
> +        required:
> +          - '#address-cells'
> +          - '#size-cells'
> +
>  required:
>    - compatible
>
> @@ -150,5 +178,30 @@ examples:
>                  &mu 3 1>;
>        memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>, <&rsc_table>;
>        syscon = <&src>;
> +
> +      rpmsg {
> +        rpmsg-io {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          gpio@0 {
> +            compatible = "rpmsg-gpio";
> +            reg = <0>;
> +            gpio-controller;
> +            #gpio-cells = <2>;
> +            #interrupt-cells = <2>;
> +            interrupt-controller;
> +          };
> +
> +          gpio@1 {
> +            compatible = "rpmsg-gpio";
> +            reg = <1>;
> +            gpio-controller;
> +            #gpio-cells = <2>;
> +            #interrupt-cells = <2>;
> +            interrupt-controller;
> +          };
> +        };

As I (and Arnaud) have stated before, I don't think this is the best
way to lay out bindings for rpmsg-gpio nodes.  I am currently thinking
about a representation that aligns better with other virtio devices.

> +      };
>      };
>  ...
> --
> 2.43.0
>
