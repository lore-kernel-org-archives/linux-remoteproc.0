Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Fri, 13 Dec 2019 13:02:00 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 1/5] dt-bindings: Document JZ47xx VPU auxiliary
 processor
Message-ID: <20191213190200.GA11267@bogus>
References: <20191210164014.50739-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191210164014.50739-1-paul@crapouillou.net>
To: Paul Cercueil <paul@crapouillou.net>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Mark Rutland <mark.rutland@arm.com>, od@zcrc.me, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Tue, Dec 10, 2019 at 05:40:10PM +0100, Paul Cercueil wrote:
> Inside the Video Processing Unit (VPU) of the recent JZ47xx SoCs from
> Ingenic is a second Xburst MIPS CPU very similar to the main core.
> This document describes the devicetree bindings for this auxiliary
> processor.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
> 
> Notes:
>     v2: Update TCSM0 address in example
>     v3: Change node name to 'video-decoder'
>     v4: Convert to YAML. I didn't add Rob's Ack on v3 because of that (sorry Rob)
> 
>  .../bindings/remoteproc/ingenic,vpu.yaml      | 76 +++++++++++++++++++
>  1 file changed, 76 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/ingenic,vpu.yaml
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/ingenic,vpu.yaml b/Documentation/devicetree/bindings/remoteproc/ingenic,vpu.yaml
> new file mode 100644
> index 000000000000..9f876d16a5a6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/ingenic,vpu.yaml
> @@ -0,0 +1,76 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/remoteproc/ingenic,vpu.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Ingenic Video Processing Unit bindings
> +
> +description:
> +  Inside the Video Processing Unit (VPU) of the recent JZ47xx SoCs from
> +  Ingenic is a second Xburst MIPS CPU very similar to the main core.
> +  This document describes the devicetree bindings for this auxiliary
> +  processor.
> +
> +maintainers:
> +  - Paul Cercueil <paul@crapouillou.net>
> +
> +properties:
> +  compatible:
> +    const: ingenic,jz4770-vpu-rproc
> +
> +  reg:
> +    items:
> +      - description: aux registers
> +      - description: tcsm0 registers
> +      - description: tcsm1 registers
> +      - description: sram registers
> +
> +  reg-names:
> +    items:
> +      - const: aux
> +      - const: tcsm0
> +      - const: tcsm1
> +      - const: sram
> +
> +  clocks:
> +    items:
> +      - description: aux clock
> +      - description: vpu clock
> +
> +  clock-names:
> +    items:
> +      - const: aux
> +      - const: vpu
> +
> +  interrupts:
> +    description: VPU hardware interrupt
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - clock-names
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    vpu: video-decoder@132a0000 {
> +      compatible = "ingenic,jz4770-vpu-rproc";
> +
> +      reg = <0x132a0000 0x20 /* AUX */
> +           0x132b0000 0x4000 /* TCSM0 */
> +           0x132c0000 0xc000 /* TCSM1 */
> +           0x132f0000 0x7000 /* SRAM */
> +      >;
> +      reg-names = "aux", "tcsm0", "tcsm1", "sram";
> +
> +      clocks = <&cgu JZ4770_CLK_AUX>, <&cgu JZ4770_CLK_VPU>;

Examples are built now by 'make dt_binding_check' and this fails. You 
need to add the include for these defines.

Also, the schema should complain after that on 'reg'. You need to <> 
each entry (addr and size).

> +      clock-names = "aux", "vpu";
> +
> +      interrupt-parent = <&cpuintc>;
> +      interrupts = <3>;
> +    };
> -- 
> 2.24.0
> 
