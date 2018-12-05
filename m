Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Wed, 5 Dec 2018 16:54:34 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: qcom: Add shutdown-ack irq
 for Q6v5
Message-ID: <20181205225434.GA5059@bogus>
References: <20181120210209.9029-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181120210209.9029-1-sibis@codeaurora.org>
To: Sibi Sankar <sibis@codeaurora.org>
Cc: bjorn.andersson@linaro.org, robh+dt@kernel.org, andy.gross@linaro.org, david.brown@linaro.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, tsoni@codeaurora.org, clew@codeaurora.org, akdwived@codeaurora.org, ohad@wizery.com, mark.rutland@arm.com, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed, 21 Nov 2018 02:32:07 +0530, Sibi Sankar wrote:
> Add optional shutdown-irq binding required for sysmon shutdown on
> SDM845/MSM8996/QCS404 SoCs.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
