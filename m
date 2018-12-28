Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Fri, 28 Dec 2018 16:13:21 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 2/8] dt-bindings: remoteproc: qcom: Add missing clocks
 for SDM845
Message-ID: <20181228221321.GA16248@bogus>
References: <20181228185307.25645-1-sibis@codeaurora.org>
 <20181228185307.25645-2-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181228185307.25645-2-sibis@codeaurora.org>
To: Sibi Sankar <sibis@codeaurora.org>
Cc: bjorn.andersson@linaro.org, robh+dt@kernel.org, andy.gross@linaro.org, david.brown@linaro.org, dianders@chromium.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, tsoni@codeaurora.org, clew@codeaurora.org, akdwived@codeaurora.org, mark.rutland@arm.com, linux-remoteproc@vger.kernel.org, evgreen@chromium.org, briannorris@chromium.org, sricharan@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Sat, 29 Dec 2018 00:23:01 +0530, Sibi Sankar wrote:
> Add missing clock bindings for Q6V5 MSS on SDM845 SoCs.
> 
> Fixes: fb22022ff63d ("dt-bindings: remoteproc: Add Q6v5 Modem PIL
> binding for SDM845")
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
> 
> v4:
>   * Re-order clocks for consistency as suggested by Rob
> 
> v3:
>   * Fixup dt-binding documentation as suggested by Doug
> 
>  .../devicetree/bindings/remoteproc/qcom,q6v5.txt   | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
