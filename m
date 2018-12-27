Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Thu, 27 Dec 2018 15:23:50 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 5/8] dt-bindings: remoteproc: qcom: Fixup regulator
 dependencies
Message-ID: <20181227212350.GA26216@bogus>
References: <20181226125229.20149-1-sibis@codeaurora.org>
 <20181226125229.20149-5-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181226125229.20149-5-sibis@codeaurora.org>
To: Sibi Sankar <sibis@codeaurora.org>
Cc: bjorn.andersson@linaro.org, robh+dt@kernel.org, andy.gross@linaro.org, david.brown@linaro.org, dianders@chromium.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, tsoni@codeaurora.org, clew@codeaurora.org, akdwived@codeaurora.org, mark.rutland@arm.com, linux-remoteproc@vger.kernel.org, evgreen@chromium.org, briannorris@chromium.org, sricharan@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed, 26 Dec 2018 18:22:26 +0530, Sibi Sankar wrote:
> Fixup regulator supply dependencies for Q6V5 MSS on MSM996 SoCs.
> 
> Fixes: 9f058fa2efb1 ("remoteproc: qcom: Add support for mss remoteproc
> on msm8996")
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
> 
> v3:
>   * Fixup dt-binding documentation as suggested by Doug
> 
>  .../bindings/remoteproc/qcom,q6v5.txt         | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
