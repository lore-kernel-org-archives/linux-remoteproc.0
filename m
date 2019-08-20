Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Tue, 20 Aug 2019 15:50:44 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: Document JZ47xx VPU auxiliary
 processor
Message-ID: <20190820205044.GA1223@bogus>
References: <20190729183109.18283-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190729183109.18283-1-paul@crapouillou.net>
To: Paul Cercueil <paul@crapouillou.net>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Paul Burton <paul.burton@mips.com>, od@zcrc.me, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Mon, Jul 29, 2019 at 02:31:07PM -0400, Paul Cercueil wrote:
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
> 
>  .../bindings/remoteproc/ingenic,vpu.txt       | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/ingenic,vpu.txt
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/ingenic,vpu.txt b/Documentation/devicetree/bindings/remoteproc/ingenic,vpu.txt
> new file mode 100644
> index 000000000000..576f9e582780
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/ingenic,vpu.txt
> @@ -0,0 +1,36 @@
> +* Ingenic JZ47xx auxiliary processor
> +
> +Inside the Video Processing Unit (VPU) of the recent JZ47xx SoCs from Ingenic
> +is a second Xburst MIPS CPU very similar to the main core.
> +This document describes the devicetree bindings for this auxiliary processor.
> +
> +Required properties:
> +- compatible: Should be "ingenic,jz4770-vpu-rproc"
> +- reg: Must contain the registers location and length for:
> +  * the auxiliary processor,
> +  * the Tightly Coupled Shared Memory 0 (TCSM0),
> +  * the Tightly Coupled Shared Memory 1 (TCSM1),
> +  * the shared SRAM.
> +- reg-names: Must contain "aux", "tcsm0", "tcsm1", "sram".
> +- clocks: Clock specifier for the AUX and VPU clocks.
> +- clock-names: Must contain "aux", "vpu".
> +- interrupts: Interrupt specifier for the VPU hardware block.
> +
> +Example:
> +
> +vpu: cpu@132a0000 {

cpu is reserved for CPUs under /cpus/. Use video-codec or video-decoder 
or ?? It's not clear what type of video processing this does.

> +	compatible = "ingenic,jz4770-vpu-rproc";
> +
> +	reg = <0x132a0000 0x20 /* AUX */
> +		   0x132b0000 0x4000 /* TCSM0 */
> +		   0x132c0000 0xc000 /* TCSM1 */
> +		   0x132f0000 0x7000 /* SRAM */
> +	>;
> +	reg-names = "aux", "tcsm0", "tcsm1", "sram";
> +
> +	clocks = <&cgu JZ4770_CLK_AUX>, <&cgu JZ4770_CLK_VPU>;
> +	clock-names = "aux", "vpu";
> +
> +	interrupt-parent = <&cpuintc>;
> +	interrupts = <3>;
> +};
> -- 
> 2.21.0.593.g511ec345e18
> 
