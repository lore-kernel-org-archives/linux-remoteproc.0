Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Mon, 2 Mar 2020 19:27:39 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 2/3] dt-bindings: soc: qcom: apr: Add protection
 domain bindings
Message-ID: <20200303012739.GA6699@bogus>
References: <20200302184723.16420-1-sibis@codeaurora.org>
 <20200302184723.16420-3-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200302184723.16420-3-sibis@codeaurora.org>
To: Sibi Sankar <sibis@codeaurora.org>
Cc: bjorn.andersson@linaro.org, srinivas.kandagatla@linaro.org, robh+dt@kernel.org, agross@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, tsoni@codeaurora.org, vnkgutta@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Tue,  3 Mar 2020 00:17:22 +0530, Sibi Sankar wrote:
> Qualcomm SoCs (starting with MSM8998) allow for multiple protection
> domains (PDs) to run on the same Q6 sub-system. This allows for
> services like AVS AUDIO to have their own separate address space and
> crash/recover without disrupting the other PDs running on the same Q6
> ADSP. Add "qcom,protection-domain" bindings to capture the dependencies
> between the APR service and the PD on which the apr service runs.
> 
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
> 
> V5:
>  * Picked up Bjorn's R-b
> 
>  .../devicetree/bindings/soc/qcom/qcom,apr.txt | 50 +++++++++++++++++++
>  1 file changed, 50 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
