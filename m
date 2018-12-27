Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Thu, 27 Dec 2018 15:55:29 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: remoteproc: qcom: Introduce
 shutdown-ack irq for Q6V5
Message-ID: <20181227215529.GA13758@bogus>
References: <20181224084824.25193-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181224084824.25193-1-sibis@codeaurora.org>
To: Sibi Sankar <sibis@codeaurora.org>
Cc: bjorn.andersson@linaro.org, robh+dt@kernel.org, andy.gross@linaro.org, david.brown@linaro.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, tsoni@codeaurora.org, clew@codeaurora.org, akdwived@codeaurora.org, ohad@wizery.com, mark.rutland@arm.com, linux-remoteproc@vger.kernel.org, dianders@chromium.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Mon, 24 Dec 2018 14:18:21 +0530, Sibi Sankar wrote:
> Introduce shutdown-irq binding required for sysmon shutdown for Q6V5 MSS
> on SDM845/MSM8996 SoCs and for WCSS Q6V5 on QCS404 SoC.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
> 
> v2:
>   Make shutdown-ack mandatory for MSS on SDM845/MSM8996 and
>   for WCSS on QCS404 (Dropping Rob's reviewed-by due to this)
> 
>  .../bindings/remoteproc/qcom,adsp.txt           | 17 ++++++++++++++---
>  .../bindings/remoteproc/qcom,q6v5.txt           | 15 ++++++++++++---
>  2 files changed, 26 insertions(+), 6 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
