Return-Path: <bjorn.andersson@linaro.org>
Date: Tue, 21 Aug 2018 15:08:26 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 1/4] dt-bindings: reset: Add PDC reset binding for SDM845
 SoCs
Message-ID: <20180821220826.GA2353@minitux>
References: <20180727152811.15258-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180727152811.15258-1-sibis@codeaurora.org>
To: Sibi Sankar <sibis@codeaurora.org>
Cc: p.zabel@pengutronix.de, robh+dt@kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, ohad@wizery.com, mark.rutland@arm.com, sricharan@codeaurora.org, akdwived@codeaurora.org, linux-arm-msm@vger.kernel.org, tsoni@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri 27 Jul 08:28 PDT 2018, Sibi Sankar wrote:

> Add SDM845 PDC (Power Domain Controller) reset controller binding
> 

Even though this is currently describing only a reset controller I think
this binding better be talking about the "PDC Global" hardware.

> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  .../bindings/reset/qcom,pdc-reset.txt         | 52 +++++++++++++++++++
>  include/dt-bindings/reset/qcom,sdm845-pdc.h   | 20 +++++++
>  2 files changed, 72 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/qcom,pdc-reset.txt
>  create mode 100644 include/dt-bindings/reset/qcom,sdm845-pdc.h
> 
> diff --git a/Documentation/devicetree/bindings/reset/qcom,pdc-reset.txt b/Documentation/devicetree/bindings/reset/qcom,pdc-reset.txt

Rename this qcom,pdc-global to match the compatible, and hardware name.

> new file mode 100644
> index 000000000000..85e159962e08
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reset/qcom,pdc-reset.txt
> @@ -0,0 +1,52 @@
> +PDC Reset Controller

PDC Global

> +======================================
> +
> +This binding describes a reset-controller found on PDC-Global(Power Domain
> +Controller) block for Qualcomm Technologies Inc SDM845 SoCs.

This looks good.

> +
> +Required properties:
> +- compatible:
> +	Usage: required
> +	Value type: <string>
> +	Definition: must be:
> +		    "qcom,sdm845-pdc-global"
> +
> +- reg:
> +	Usage: required
> +	Value type: <prop-encoded-array>
> +	Definition: must specify the base address and size of the register
> +	            space.
> +
> +- #reset-cells:
> +	Usage: required
> +	Value type: <uint>
> +	Definition: must be 1; cell entry represents the reset index.
> +
> +Example:
> +
> +pdc_reset: reset-controller@b2e0000 {

This is perfectly fine, in its current form it is a reset-controller.

> +	compatible = "qcom,sdm845-pdc-global";
> +	reg = <0xb2e0000 0x20000>;
> +	#reset-cells = <1>;
> +};
> +

Apart from this, the binding looks good!

Regards,
Bjorn
