Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Sun, 18 Mar 2018 07:49:43 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/7] dt-bindings: reset: Add AOSS reset bindings for
 SDM845 SoCs
Message-ID: <20180318124943.4ixek2mnalfvqwbu@rob-hp-laptop>
References: <1521019283-32212-1-git-send-email-sibis@codeaurora.org>
 <1521019283-32212-2-git-send-email-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1521019283-32212-2-git-send-email-sibis@codeaurora.org>
To: Sibi S <sibis@codeaurora.org>
Cc: bjorn.andersson@linaro.org, p.zabel@pengutronix.de, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, georgi.djakov@linaro.org, jassisinghbrar@gmail.com, ohad@wizery.com, mark.rutland@arm.com, kyan@codeaurora.org, sricharan@codeaurora.org, akdwived@codeaurora.org, linux-arm-msm@vger.kernel.org, tsoni@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed, Mar 14, 2018 at 02:51:17PM +0530, Sibi S wrote:
> Add SDM845 AOSS (always on subsystem) reset controller binding
> 
> Signed-off-by: Sibi S <sibis@codeaurora.org>

Still need a full name.

Otherwise, looks fine.

> ---
>  .../devicetree/bindings/reset/qcom,aoss-reset.txt  | 54 ++++++++++++++++++++++
>  include/dt-bindings/reset/qcom,sdm845-aoss.h       | 17 +++++++
>  2 files changed, 71 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/qcom,aoss-reset.txt
>  create mode 100644 include/dt-bindings/reset/qcom,sdm845-aoss.h
