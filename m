Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Wed, 27 Mar 2019 18:45:24 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: Rename and amend Hexagon
 v56 binding
Message-ID: <20190327234524.GA20594@bogus>
References: <20190307000318.1750-1-bjorn.andersson@linaro.org>
 <20190307000318.1750-2-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190307000318.1750-2-bjorn.andersson@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed, Mar 06, 2019 at 04:03:17PM -0800, Bjorn Andersson wrote:
> The SDM845 Audio DSP peripheral image loader binding describes the
> properties needed to load and boot firmware on a Hexagon v56. Rename the
> file and add the Compute DSP (CDSP) found in QCS404 to the binding.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  ...qcom,adsp-pil.txt => qcom,hexagon-v56.txt} | 34 +++++++++++++------
>  1 file changed, 24 insertions(+), 10 deletions(-)
>  rename Documentation/devicetree/bindings/remoteproc/{qcom,adsp-pil.txt => qcom,hexagon-v56.txt} (74%)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp-pil.txt b/Documentation/devicetree/bindings/remoteproc/qcom,hexagon-v56.txt
> similarity index 74%
> rename from Documentation/devicetree/bindings/remoteproc/qcom,adsp-pil.txt
> rename to Documentation/devicetree/bindings/remoteproc/qcom,hexagon-v56.txt
> index 66af2c30944f..8011f88f7c1f 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp-pil.txt
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,hexagon-v56.txt
> @@ -1,12 +1,13 @@
> -Qualcomm Technology Inc. ADSP Peripheral Image Loader
> +Qualcomm Technology Inc. Hexagon v56 Peripheral Image Loader
>  
>  This document defines the binding for a component that loads and boots firmware
> -on the Qualcomm Technology Inc. ADSP Hexagon core.
> +on the Qualcomm Technology Inc. Hexagon v56 core.
>  
>  - compatible:
>  	Usage: required
>  	Value type: <string>
>  	Definition: must be one of:
> +		    "qcom,qcs404-cdsp-pil",
>  		    "qcom,sdm845-adsp-pil"
>  
>  - reg:
> @@ -28,10 +29,10 @@ on the Qualcomm Technology Inc. ADSP Hexagon core.
>  - clocks:
>  	Usage: required
>  	Value type: <prop-encoded-array>
> -	Definition:  List of 8 phandle and clock specifier pairs for the adsp.
> +	Definition:  List of phandles and clock specifier pairs for the Hexagon.

Would be nice to keep some range of what is valid.

>  
>  - clock-names:
> -	Usage: required
> +	Usage: required for SDM845 ADSP
>  	Value type: <stringlist>
>  	Definition: List of clock input name strings sorted in the same
>  		    order as the clocks property. Definition must have
> @@ -39,6 +40,14 @@ on the Qualcomm Technology Inc. ADSP Hexagon core.
>  		    "lpass_ahbm_aon_cbcr", "qdsp6ss_xo", "qdsp6ss_sleep"
>  		    and "qdsp6ss_core".
>  
> +- clock-names:
> +	Usage: required for QCS404 CDSP
> +	Value type: <stringlist>
> +	Definition: List of clock input name strings sorted in the same
> +		    order as the clocks property. Definition must have
> +		    "xo", "sway", "tbu", "bimc", "ahb_aon", "q6ss_slave",
> +		    "q6ss_master", "q6_axim".
> +
>  - power-domains:
>  	Usage: required
>  	Value type: <phandle>
> @@ -47,28 +56,33 @@ on the Qualcomm Technology Inc. ADSP Hexagon core.
>  - resets:
>  	Usage: required
>  	Value type: <phandle>
> -	Definition: reference to the list of 2 reset-controller for the adsp.
> +	Definition: reference to the list of resets for the Hexagon.
>  
>  - reset-names:
> -        Usage: required
> +        Usage: required for SDM845 ADSP
>          Value type: <stringlist>
>          Definition: must be "pdc_sync" and "cc_lpass"
>  
> +- reset-names:
> +        Usage: required for QCS404 CDSP
> +        Value type: <stringlist>
> +        Definition: must be "restart"
> +
>  - qcom,halt-regs:
>  	Usage: required
>  	Value type: <prop-encoded-array>
>  	Definition: a phandle reference to a syscon representing TCSR followed
> -			by the offset within syscon for lpass halt register.
> +		    by the offset within syscon for Hexagon halt register.
>  
>  - memory-region:
>  	Usage: required
>  	Value type: <phandle>
> -	Definition: reference to the reserved-memory for the ADSP
> +	Definition: reference to the reserved-memory for the firmware
>  
>  - qcom,smem-states:
>  	Usage: required
>  	Value type: <phandle>
> -	Definition: reference to the smem state for requesting the ADSP to
> +	Definition: reference to the smem state for requesting the Hexagon to
>  		    shut down
>  
>  - qcom,smem-state-names:
> @@ -79,7 +93,7 @@ on the Qualcomm Technology Inc. ADSP Hexagon core.
>  
>  = SUBNODES
>  The adsp node may have an subnode named "glink-edge" that describes the
> -communication edge, channels and devices related to the ADSP.
> +communication edge, channels and devices related to the Hexagon.
>  See ../soc/qcom/qcom,glink.txt for details on how to describe these.
>  
>  = EXAMPLE
> -- 
> 2.18.0
> 
