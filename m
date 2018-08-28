Return-Path: <mka@chromium.org>
Return-Path: <mka@chromium.org>
Date: Mon, 27 Aug 2018 17:44:22 -0700
From: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH v2 3/6] dt-bindings: remoteproc: Remove additional
 definition tag
Message-ID: <20180828004422.GZ160295@google.com>
References: <20180824131900.5353-1-sibis@codeaurora.org>
 <20180824131900.5353-4-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20180824131900.5353-4-sibis@codeaurora.org>
To: Sibi Sankar <sibis@codeaurora.org>
Cc: bjorn.andersson@linaro.org, p.zabel@pengutronix.de, robh+dt@kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, ohad@wizery.com, mark.rutland@arm.com, sricharan@codeaurora.org, akdwived@codeaurora.org, linux-arm-msm@vger.kernel.org, tsoni@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Sibi,

Subject: dt-bindings: remoteproc: Remove additional definition tag

nit: the subject is a bit generic, you probably should at least add
'qcom: ' to the 'path'.

On Fri, Aug 24, 2018 at 06:48:57PM +0530, Sibi Sankar wrote:
> Remove the additional definition tag declared for WCSS sub-system
> under reset-names.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
> index 601dd9f389aa..c45e4c131fa2 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
> @@ -58,7 +58,7 @@ on the Qualcomm Hexagon core.
>  	Usage: required
>  	Value type: <stringlist>
>  	Definition: must be "mss_restart" for the modem sub-system
> -	Definition: must be "wcss_aon_reset", "wcss_reset", "wcss_q6_reset"
> +		    must be "wcss_aon_reset", "wcss_reset", "wcss_q6_reset"
>  		    for the wcss syb-system

Since you are already at it you might also want to fix the typo in
'wcss syb-system'.

Other than the nits:

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
