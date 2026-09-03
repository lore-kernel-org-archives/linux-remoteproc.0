Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A4E38DC68
	for <linux-remoteproc@vger.kernel.org>; Thu,  3 Sep 2026 17:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788456613; cv=none; b=mQekz3NpRz0rOV1XmpEz+Zls2y4swoGkV0kg0SoPOBFzST8bbe/xiQpiAwX+RYpkoqg5uNeFP56LxIgqiAvzFBUWSs6ddwm2mYsl5w4/TOdKdyzfmDd80zywFOUmSJAGyiYO8IET6Lnp7GbUuArDk/xhb6zjvekI/kkP3LAhRQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788456613; c=relaxed/simple;
	bh=kqRN0KkwKLzlSD27WEYVj3mqo9lQk4t/pj6M2HD1yFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ka0bMVBzQTw0t4BNsHR8Tp11G3T8u8S8KoWc0V7PnGX/1cy+YZwqjGxUNwkhqA1DVvbafJkWuEGSkC03yvUr0GAuJwmKXXCcy03C0RfpkLoMmG0QJSx0eI6r2/9oGWaVUHGrbl3ukEiAxCgfcLoxwC+rbfCBZhOb3MLAWEX/bC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IckVsKCY; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IckVsKCY"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d6e954afbdso501065ad.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 03 Sep 2026 10:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788456610; x=1789061410; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oBzdii0EUHFGQFKd8zeKRUm0f/svlYti0FerJr5HoZQ=;
        b=IckVsKCYqYhh5YhHpLKYfr3a0FpBdFNfYd2rJXNZUreCDSFCPMs7MxqgcwBWpVi7IY
         fHnZOlbM1GvZugchNB4c2cBMEefxc3GbgclGGyIbyDSZK897d3bcfs86zlAU2AztzAxr
         OrVaILhP3PkMRwXWXWmwlzOBXg60vg+USB1z1yU7jPiGTsj4ESKmNO+xbGQizOotAKZG
         cvvY2TDP5XE+nyM6xLZW5e9RZp6IoEB5u1wiNcWKe6+tCMxeCNXTwehQgaB0TKz/dbrF
         F3lw4hIiT/6j4/6sccPT0OKu4lHFGn7d6xD2bhuWoTewJS8XsmLcj/vWBH7/BGd2uLen
         KTtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788456610; x=1789061410;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oBzdii0EUHFGQFKd8zeKRUm0f/svlYti0FerJr5HoZQ=;
        b=avvnC1eGzerwHgBr6IJAncl7dXQ/KXSbBvLcwglSYaHN5NzBWlItdH+JuKfWiAdYkz
         i+UAv2vf7ImxT9n6K1gz7ZRweGDc7raMipPdQDI6Djidy23YX+YrE8ym7nmW9tayO1VG
         SyPbLLenvsUCwwxdPjyOIRuuGR/joBvyONI+307jwz5BDwgwxv01tZeewjj3P2i6SbbR
         SbpUfmV7+UI0NnIc/OalbGarRqVH8/K5A5SxcdX9PSCs6m5/p5kjUxRWc18FJ5GmF5Rs
         6cAYt5MYqTKynivTbFrHhfg77iK2BRCR9KeyYHdSkejsdooqu3Jg69MZm7NLtLmm9oV7
         CUww==
X-Forwarded-Encrypted: i=1; AKwUvBwvvWlNiHBWiZTPh05mmWJuZRzDgy6eLCkzGE0EJais4yjpefu3C/pLFAKRRMrKJu5aVS7mfTd11WhCY/6YHR6i@vger.kernel.org
X-Gm-Message-State: AFuF++mWdM8kVNZpld/eroNfUwbpicm+AzeEsizxB27qhdd/L+4UO1uS
	8PjypK21z6ptoWovAiFZneyFTyHA6rSZng+nAmN/IWIYnAoXXRtSgsnMFFSRshYWCNw=
X-Gm-Gg: AYBFou1uo2yqf2ZPY3YfAzEBhDifg+7g8VHMs6wHY5vkj5ZC2lQ//ARFAagElNZ4M9g
	tApuSM2ncDmiJmObaDbKx/eJd+xlrQsv94gAMCqeqLtS6MCXmppclNQp6S2uMhaFo4Gizo/eCd/
	y/mxm1Dp8N3AZ9RvcS16ivABNkFqm35B9ilDCMRzzctbeA7e50jwWwT6MrD2Pwaz6gQINWIsWr3
	YHrjecFhbG9Xe7zFiaESl6ToWX/XmBC1UVDxry6PNOPyKWTDwLbgB5o3/88NsULNoFM6bePF5st
	8GtJFbgcfvBMaVMGeyOzvHzmIXZwqizYkSOHrigrqVAY/Dwic4OxE/Ryp0ToUFPVJVMoECZ2Rs8
	N/8lq4ta0N/VwcjPGTDoJGL5d/JbgGcM/srre9ra7pxvOe0XeGKYPPkMuGwCu5zK+J3DLFiccd8
	YvN9BFKPtQhTpIbYSeoRuA55lIOuiiKplhqju0trFXT3jRZaHq3sGayAako2grcEYwxKi8gOs+n
	1s=
X-Received: by 2002:a17:903:3848:b0:2d9:56dd:f804 with SMTP id d9443c01a7336-2db125f00c7mr7573775ad.13.1788456608541;
        Thu, 03 Sep 2026 10:30:08 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:40c0:ec33:6266:c275])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dafed70184sm13249205ad.75.2026.09.03.10.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 10:30:07 -0700 (PDT)
Date: Thu, 3 Sep 2026 11:30:04 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: robh@kernel.org, krzk+dt@kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-imx@nxp.com, Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
	b-padhi@ti.com, Andrew Lunn <andrew@lunn.ch>,
	viresh.kumar@linaro.org
Subject: Re: [PATCH v15 2/5] dt-bindings: remoteproc: imx_rproc: Add "rpmsg"
 subnode support
Message-ID: <apmunD8bkKOu5_Vm@p14s>
References: <20260721204704.400781-1-shenwei.wang@oss.nxp.com>
 <20260721204704.400781-3-shenwei.wang@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721204704.400781-3-shenwei.wang@oss.nxp.com>

Krzysztof and Rob - I'm seeking your advice on the best way to define bindings
for this use case.

Here is some background:

The transport mechanic between the kernel and remote processors can take
different forms.  As of this writing we have 'glink' and 'virtio'.  The protocol
that runs on top of the transport mechanic is RPMSG.  All this is already
implemented and stable.

In this use case, we have GPIO controllers connected to the remote processor and
we want to make them available to the kernel.  We also want to use the existing
virtio-gpio protocol on top of RPMSG, allowing the kernel to interface with the
GPIO controllers as if they were virtio-gpios.  This patchset is about providing
a driver that will enact the virtio-gpio procotol on top of the mechanic used
between the kernel and remote processor.

Shenwei has proposed some bindings (below).  I think they can be improved to
take into account the transport mechanic and be closer to what virtio-gpio
currently does.  I'm proposing something like this:

                        $(transport) {
                                compatible = "$(transport),rpmsg";
                                #address-cells = <1>;
                                #size-cells = <0>;

                                gpio {
                                        compatible = "virtio,device29";
                                        reg = <3>
                                        gpio-controller;
                                        #gpio-cells = <2>;
                                        interrupt-controller;
                                        #interrupt-cells = <2>;
                                };  
                                gpio {
                                        compatible = "virtio,device29";
                                        reg = <4>
                                        gpio-controller;
                                        #gpio-cells = <2>;
                                        interrupt-controller;
                                        #interrupt-cells = <2>;
                                };  
                        }

A complete example with a virtio transport mechanic would look like:

m4_rproc: m4@10000000 {
                        compatible = "st,stm32mp1-m4";
                        reg = <0x10000000 0x40000>,
                              <0x30000000 0x40000>,
                              <0x38000000 0x10000>;
                        resets = <&rcc MCU_R>;
                        reset-names = "mcu_rst";
                        st,syscfg-holdboot = <&rcc 0x10C 0x1>;
                        st,syscfg-pdds = <&pwr_mcu 0x0 0x1>;
                        st,syscfg-rsc-tbl = <&tamp 0x144 0xFFFFFFFF>;
                        st,syscfg-m4-state = <&tamp 0x148 0xFFFFFFFF>;
                        status = "disabled";

                        virtio {
                                compatible = "virtio,rpmsg";
                                #address-cells = <1>;
                                #size-cells = <0>;

                                gpio {
                                        compatible = "virtio,device29";
                                        reg = <3>
                                        gpio-controller;
                                        #gpio-cells = <2>;
                                        interrupt-controller;
                                        #interrupt-cells = <2>;
                                };  
                                gpio {
                                        compatible = "virtio,device29";
                                        reg = <4>
                                        gpio-controller;
                                        #gpio-cells = <2>;
                                        interrupt-controller;
                                        #interrupt-cells = <2>;
                                };  
                        }   
                };  
        };

Let me know what you think.

Thanks,
Mathieu


On Tue, Jul 21, 2026 at 03:46:45PM -0500, Shenwei Wang wrote:
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
> +      };
>      };
>  ...
> -- 
> 2.43.0
> 
