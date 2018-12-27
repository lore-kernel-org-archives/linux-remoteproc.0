Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Thu, 27 Dec 2018 15:19:51 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/8] dt-bindings: soc: qcom: Add remote-pid binding
 for GLINK SMEM
Message-ID: <20181227211951.GA19726@bogus>
References: <20181226125229.20149-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181226125229.20149-1-sibis@codeaurora.org>
To: Sibi Sankar <sibis@codeaurora.org>
Cc: bjorn.andersson@linaro.org, robh+dt@kernel.org, andy.gross@linaro.org, david.brown@linaro.org, dianders@chromium.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, tsoni@codeaurora.org, clew@codeaurora.org, akdwived@codeaurora.org, mark.rutland@arm.com, linux-remoteproc@vger.kernel.org, evgreen@chromium.org, briannorris@chromium.org, sricharan@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed, 26 Dec 2018 18:22:22 +0530, Sibi Sankar wrote:
> Add missing qcom,remote-pid dt binding required for GLINK SMEM
> which specifies the remote endpoint of the GLINK edge.
> 
> Fixes: 2b41d6c8e696 ("dt-bindings: soc: qcom: Extend GLINK to cover
> SMEM")
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> Reviewed-by: Doug Anderson <dianders@chromium.org>
> ---
> 
> v3:
>   * Fixed typo
> 
>  Documentation/devicetree/bindings/soc/qcom/qcom,glink.txt | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
