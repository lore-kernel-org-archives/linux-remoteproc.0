Return-Path: <briannorris@chromium.org>
Return-Path: <briannorris@chromium.org>
Date: Thu, 3 Jan 2019 15:30:15 -0800
From: Brian Norris <briannorris@chromium.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: remoteproc: qcom: Add firmware
 bindings for Q6V5
Message-ID: <20190103233014.GA181833@google.com>
References: <20181228044819.5697-1-sibis@codeaurora.org>
 <20181228044819.5697-2-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181228044819.5697-2-sibis@codeaurora.org>
To: Sibi Sankar <sibis@codeaurora.org>
Cc: bjorn.andersson@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, andy.gross@linaro.org, akdwived@codeaurora.org, clew@codeaurora.org, linux-kernel@vger.kernel.org, linux-arm-msm-owner@vger.kernel.org, ohad@wizery.com, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Sibi,

On Fri, Dec 28, 2018 at 10:18:18AM +0530, Sibi Sankar wrote:
> Add optional "firmware-name" bindings for Q6V5 MSS and PAS based
> remoteprocs. For Q6V5 MSS/PAS the two/one relative firmware
> paths/path are to be listed respectively. Fallback to the default
> images for mba/modem for Q6V5 MSS or the default Hexagon image
> for Q6V5 PAS if the "firmware-name" binding is not present.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt | 6 ++++++
>  Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt | 7 +++++++
>  2 files changed, 13 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
> index 9c0cff3a5ed8..60ee0f73071a 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
> @@ -27,6 +27,12 @@ on the Qualcomm ADSP Hexagon core.
>  	Value type: <stringlist>
>  	Definition: must be "wdog", "fatal", "ready", "handover", "stop-ack"
>  
> +- firmware-name:
> +	Usage: optional
> +	Value type: <string>
> +	Definition: must list the relative firmware image path for the
> +		    Hexagon Core.

Relative to what? I still think it's a terrible idea that your driver
looks for files at the top-level /lib/firmware/ directory, but now
you're leaking this into the device tree. This should at a bare minimum
be namespaced to something like the qcom/ sub-directory. But ideally,
the driver would automatically be deriving a further sub-directory of
qcom/ based on the chipset or something, and then the only thing you'd
describe here is some kind of variant string -- something akin to
ath10k's qcom,ath10k-calibration-variant (see
Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt), which
doesn't require a full path-name or any hierarchy.

Brian

> +
>  - clocks:
>  	Usage: required
>  	Value type: <prop-encoded-array>
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
> index 9ff5b0309417..3a99e7379d8c 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
> @@ -36,6 +36,13 @@ on the Qualcomm Hexagon core.
>  	Value type: <stringlist>
>  	Definition: must be "wdog", "fatal", "ready", "handover", "stop-ack"
>  
> +- firmware-name:
> +	Usage: optional
> +	Value type: <stringlist>
> +	Definition: must list the relative firmware image paths for mba and
> +		    modem. They are used for booting and authenticating the
> +		    Hexagon core.
> +
>  - clocks:
>  	Usage: required
>  	Value type: <phandle>
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
