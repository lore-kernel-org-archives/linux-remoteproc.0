Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Tue, 7 Aug 2018 12:18:35 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 4/4] remoteproc: qcom: q6v5-pil: Add PDC restart for
 modem on SDM845 SoCs
Message-ID: <20180807181835.GA28960@rob-hp-laptop>
References: <20180727152811.15258-1-sibis@codeaurora.org>
 <20180727152811.15258-4-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180727152811.15258-4-sibis@codeaurora.org>
To: Sibi Sankar <sibis@codeaurora.org>
Cc: bjorn.andersson@linaro.org, p.zabel@pengutronix.de, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, ohad@wizery.com, mark.rutland@arm.com, sricharan@codeaurora.org, akdwived@codeaurora.org, linux-arm-msm@vger.kernel.org, tsoni@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri, Jul 27, 2018 at 08:58:11PM +0530, Sibi Sankar wrote:
> In the presence of a PDC block working with subsystem RSC,
> assert/deassert PDC restart in modem start/stop path.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  .../bindings/remoteproc/qcom,q6v5.txt         |  4 +++

Please split bindings to separate patch.

>  drivers/remoteproc/qcom_q6v5_pil.c            | 27 ++++++++++++++++---
>  2 files changed, 27 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
> index 601dd9f389aa..124fb1dc6fb8 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
> @@ -51,6 +51,8 @@ on the Qualcomm Hexagon core.
>  	Usage: required
>  	Value type: <phandle>
>  	Definition: reference to the reset-controller for the modem sub-system
> +		    reference to the list of 2 reset-controllers for the modem
> +		    sub-system on SDM845 SoCs
>  		    reference to the list of 3 reset-controllers for the
>  		    wcss sub-system
>  
> @@ -58,6 +60,8 @@ on the Qualcomm Hexagon core.
>  	Usage: required
>  	Value type: <stringlist>
>  	Definition: must be "mss_restart" for the modem sub-system
> +	Definition: must be "mss_restart", "pdc_restart" for the modem
> +		    sub-system on SDM845 SoCs
>  	Definition: must be "wcss_aon_reset", "wcss_reset", "wcss_q6_reset"
>  		    for the wcss syb-system
>  
