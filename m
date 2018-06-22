Return-Path: <bjorn.andersson@linaro.org>
Date: Fri, 22 Jun 2018 15:15:08 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v1 1/2] imx-rproc: dt: provide new remote-nodes option
Message-ID: <20180622221508.GK3402@tuxbook-pro>
References: <20180615115731.18424-1-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180615115731.18424-1-o.rempel@pengutronix.de>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "A.s. Dong" <aisheng.dong@nxp.com>, kernel@pengutronix.de, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, dl-linux-imx <linux-imx@nxp.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri 15 Jun 04:57 PDT 2018, Oleksij Rempel wrote:

> On AMP systems we need to make sure that some device
> nodes are not used by main system and reserved for
> external system. Some of configuration should be
> maintained by main system. For example clocks and pins.
> 

I think you should reverse the order of this message, because what you
really care about is the clock rate for some resources, then you see
that there's a chance that you would like pinctrl states and lastly it
would be nice to help the system integrator not accidentally using the
same hardware from the two sides.

> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  .../devicetree/bindings/remoteproc/imx-rproc.txt    | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/imx-rproc.txt b/Documentation/devicetree/bindings/remoteproc/imx-rproc.txt
> index fbcefd965dc4..40bec03e094c 100644
> --- a/Documentation/devicetree/bindings/remoteproc/imx-rproc.txt
> +++ b/Documentation/devicetree/bindings/remoteproc/imx-rproc.txt
> @@ -15,6 +15,7 @@ Required properties:
>  Optional properties:
>  - memory-region		list of phandels to the reserved memory regions.
>  			(See: ../reserved-memory/reserved-memory.txt)
> +- remote-nodes		list of device node phandels used by remote system.
>  
>  Example:
>  	m4_reserved_sysmem1: cm4@80000000 {
> @@ -25,9 +26,21 @@ Example:
>  		reg = <0x81000000 0x80000>;
>  	};
>  
> +	/* node reserved for rproc */
> +	&uart1 {
> +		assigned-clock-rates = <240000000>;
> +		status = "disabled";
> +	};
> +
> +	&gpt2 {
> +		assigned-clock-rates = <24000000>;
> +		status = "disabled";
> +	};
> +
>  	imx7d-cm4 {
>  		compatible	= "fsl,imx7d-cm4";
>  		memory-region	= <&m4_reserved_sysmem1>, <&m4_reserved_sysmem2>;
>  		syscon		= <&src>;
>  		clocks		= <&clks IMX7D_ARM_M4_ROOT_CLK>;
> +		remote-nodes	= <&gpt2>, <&uart1>;

As I told Arnaud I think it would be better to describe resources used
by the remoteproc firmware as those of the remoteproc node, i.e. add the
uart and gpt clocks to the remoteproc node directly.

The reason for this is that even though your system does have many of
the peripherals accessible from all instances of the AMP you're still
going to run them off different views of the hardware.

We typically say "DeviceTree should represent the hardware", but when
taking AMP in consideration I see this needs to be "DeviceTree should
represent the hardware, as seen from this particular OS instance".

Regards,
Bjorn
