Return-Path: <mka@chromium.org>
Return-Path: <mka@chromium.org>
Date: Mon, 27 Aug 2018 17:38:23 -0700
From: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH v2 1/6] dt-bindings: reset: Add PDC Global binding for
 SDM845 SoCs
Message-ID: <20180828003823.GY160295@google.com>
References: <20180824131900.5353-1-sibis@codeaurora.org>
 <20180824131900.5353-2-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20180824131900.5353-2-sibis@codeaurora.org>
To: Sibi Sankar <sibis@codeaurora.org>
Cc: bjorn.andersson@linaro.org, p.zabel@pengutronix.de, robh+dt@kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, ohad@wizery.com, mark.rutland@arm.com, sricharan@codeaurora.org, akdwived@codeaurora.org, linux-arm-msm@vger.kernel.org, tsoni@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Sibi,

On Fri, Aug 24, 2018 at 06:48:55PM +0530, Sibi Sankar wrote:
> Add PDC Global(Power Domain Controller) binding for SDM845 SoCs.

nit: missing blank before the opening parenthesis.

> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  .../bindings/reset/qcom,pdc-global.txt        | 52 +++++++++++++++++++
>  include/dt-bindings/reset/qcom,sdm845-pdc.h   | 20 +++++++
>  2 files changed, 72 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/qcom,pdc-global.txt
>  create mode 100644 include/dt-bindings/reset/qcom,sdm845-pdc.h
> 
> diff --git a/Documentation/devicetree/bindings/reset/qcom,pdc-global.txt b/Documentation/devicetree/bindings/reset/qcom,pdc-global.txt
> new file mode 100644
> index 000000000000..69f9edca9503
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reset/qcom,pdc-global.txt
> @@ -0,0 +1,52 @@
> +PDC Global
> +======================================
> +
> +This binding describes a reset-controller found on PDC-Global(Power Domain
> +Controller) block for Qualcomm Technologies Inc SDM845 SoCs.

Are there other PDC reset controllers that aren't 'global'? Otherwise
I'd suggest to use 'pdc-reset' instead of 'pdc-global', which is more
specific and in line with the name of the driver added by this series.
Or something like 'pdc-reset-global/main' if there are other
controllers?

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
> +	compatible = "qcom,sdm845-pdc-global";
> +	reg = <0xb2e0000 0x20000>;
> +	#reset-cells = <1>;
> +};
> +
> +PDC reset clients
> +======================================
> +
> +Device nodes that need access to reset lines should
> +specify them as a reset phandle in their corresponding node as
> +specified in reset.txt.
> +
> +For list of all valid reset indicies see

s/indicies/indices/ (or s/indicies/lines/ ?)

Cheers

Matthias
