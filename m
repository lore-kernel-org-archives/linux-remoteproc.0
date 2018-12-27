Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Thu, 27 Dec 2018 15:21:05 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 2/8] dt-bindings: remoteproc: qcom: Add missing clocks
 for SDM845
Message-ID: <20181227212105.GA19897@bogus>
References: <20181226125229.20149-1-sibis@codeaurora.org>
 <20181226125229.20149-2-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181226125229.20149-2-sibis@codeaurora.org>
To: Sibi Sankar <sibis@codeaurora.org>
Cc: bjorn.andersson@linaro.org, andy.gross@linaro.org, david.brown@linaro.org, dianders@chromium.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, tsoni@codeaurora.org, clew@codeaurora.org, akdwived@codeaurora.org, mark.rutland@arm.com, linux-remoteproc@vger.kernel.org, evgreen@chromium.org, briannorris@chromium.org, sricharan@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed, Dec 26, 2018 at 06:22:23PM +0530, Sibi Sankar wrote:
> Add missing clock bindings for Q6V5 MSS on SDM845 SoCs.
> 
> Fixes: fb22022ff63d ("dt-bindings: remoteproc: Add Q6v5 Modem PIL
> binding for SDM845")
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
> 
> v3:
>   * Fixup dt-binding documentation as suggested by Doug
> 
>  .../devicetree/bindings/remoteproc/qcom,q6v5.txt   | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
> index 9ff5b0309417..20dd19f9ed99 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
> @@ -39,13 +39,21 @@ on the Qualcomm Hexagon core.
>  - clocks:
>  	Usage: required
>  	Value type: <phandle>
> -	Definition: reference to the iface, bus and mem clocks to be held on
> -		    behalf of the booting of the Hexagon core
> +	Definition: reference to the clocks that match clock-names
>  
>  - clock-names:
>  	Usage: required
>  	Value type: <stringlist>
> -	Definition: must be "iface", "bus", "mem"
> +	Definition: The clocks needed depend on the compatible string:
> +	qcom,ipq8074-wcss-pil:
> +		    no clock names required
> +	qcom,q6v5-pil:
> +	qcom,msm8916-mss-pil:
> +	qcom,msm8974-mss-pil:
> +		    must be "iface", "bus", "mem", "xo"
> +	qcom,sdm845-mss-pil:
> +		    must be "xo", "prng", "iface", "bus", "mem", "gpll0_mss",
> +		    "snoc_axi", "mnoc_axi"

Please keep the same order for the 4 clocks which are the same.

Rob
