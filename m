Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Tue, 15 Nov 2016 16:08:43 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-binding: remoteproc: Introduce ADSP loader binding
Message-ID: <20161115220843.d4oxylbodzrrknq3@rob-hp-laptop>
References: <1478757009-11522-1-git-send-email-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1478757009-11522-1-git-send-email-bjorn.andersson@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Mark Rutland <mark.rutland@arm.com>, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Sarangdhar Joshi <spjoshi@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed, Nov 09, 2016 at 09:50:09PM -0800, Bjorn Andersson wrote:
> This document defines the binding for a component that loads firmware
> and control the life cycle of the Qualcomm ADSP Hexagon core.
> 
> Cc: Sarangdhar Joshi <spjoshi@codeaurora.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Changes since v2:
> - Added the required "xo" clock, from Sarangdhar
> - Added smd-edge node
> - Corrected example
> 
> Changes since v1:
> - Added platform names to compatible
> 
>  .../devicetree/bindings/remoteproc/qcom,adsp.txt   | 98 ++++++++++++++++++++++
>  1 file changed, 98 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt

Acked-by: Rob Herring <robh@kernel.org>
