Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Fri, 28 Dec 2018 16:13:33 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 3/8] dt-bindings: remoteproc: qcom: Add missing clocks
 for MSM8996
Message-ID: <20181228221333.GA16672@bogus>
References: <20181228185307.25645-1-sibis@codeaurora.org>
 <20181228185307.25645-3-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181228185307.25645-3-sibis@codeaurora.org>
To: Sibi Sankar <sibis@codeaurora.org>
Cc: bjorn.andersson@linaro.org, robh+dt@kernel.org, andy.gross@linaro.org, david.brown@linaro.org, dianders@chromium.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, tsoni@codeaurora.org, clew@codeaurora.org, akdwived@codeaurora.org, mark.rutland@arm.com, linux-remoteproc@vger.kernel.org, evgreen@chromium.org, briannorris@chromium.org, sricharan@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Sat, 29 Dec 2018 00:23:02 +0530, Sibi Sankar wrote:
> Add missing clock bindings for Q6V5 MSS on MSM8996 SoCs.
> 
> Fixes: 9f058fa2efb1 ("remoteproc: qcom: Add support for mss remoteproc
> on msm8996")
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
>  Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
