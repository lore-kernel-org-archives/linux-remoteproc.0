Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Thu, 27 Dec 2018 15:11:29 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 7/8] dt-bindings: remoteproc: qcom: Add power-domain
 bindings for Q6V5
Message-ID: <20181227211129.GA27911@bogus>
References: <20181226125229.20149-1-sibis@codeaurora.org>
 <20181226125229.20149-7-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181226125229.20149-7-sibis@codeaurora.org>
To: Sibi Sankar <sibis@codeaurora.org>
Cc: bjorn.andersson@linaro.org, andy.gross@linaro.org, david.brown@linaro.org, dianders@chromium.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, tsoni@codeaurora.org, clew@codeaurora.org, akdwived@codeaurora.org, mark.rutland@arm.com, linux-remoteproc@vger.kernel.org, evgreen@chromium.org, briannorris@chromium.org, sricharan@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed, Dec 26, 2018 at 06:22:28PM +0530, Sibi Sankar wrote:
> Add power-domain bindings for Q6V5 MSS on MSM8996 and SDM845 SoCs.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
> 
> v3:
>   * Fixup dt-binding documentation as suggested by Doug
>   * Dropping Rob's Reviewed-by due to documentation style
>     change
> 
> v2:
>   * Add load_state power-domain
>   * List cx and mx power-domains for MSM8996
> 
>  .../bindings/remoteproc/qcom,q6v5.txt         | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
