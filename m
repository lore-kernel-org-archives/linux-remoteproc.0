Return-Path: <sibis@codeaurora.org>
Subject: Re: [PATCH v5 09/10] arm64: dts: qcom: Add AOSS QMP node
References: <20190131003933.11436-1-bjorn.andersson@linaro.org>
 <20190131003933.11436-10-bjorn.andersson@linaro.org>
From: Sibi Sankar <sibis@codeaurora.org>
Message-ID: <fe4c1e15-ae5d-3f10-e265-39df3230c30c@codeaurora.org>
Date: Fri, 1 Feb 2019 12:47:25 +0530
MIME-Version: 1.0
In-Reply-To: <20190131003933.11436-10-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ohad Ben-Cohen <ohad@wizery.com>, Arun Kumar Neelakantam <aneela@codeaurora.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hey Bjorn,

Tested-by: Sibi Sankar <sibis@codeaurora.org>
Reviewed-by: Sibi Sankar <sibis@codeaurora.org>


On 01/31/2019 06:09 AM, Bjorn Andersson wrote:
> The AOSS QMP provides a number of power domains, used for QDSS and
> PIL, add the node for this.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Changes since v4:
> - None
> 
> Changes since v3:
> - None
> 
>   arch/arm64/boot/dts/qcom/sdm845.dtsi | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index 07d9cd6fba7d..dc43fee8bb90 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -14,6 +14,7 @@
>   #include <dt-bindings/interconnect/qcom,sdm845.h>
>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>   #include <dt-bindings/phy/phy-qcom-qusb2.h>
> +#include <dt-bindings/power/qcom-aoss-qmp.h>
>   #include <dt-bindings/power/qcom-rpmpd.h>
>   #include <dt-bindings/reset/qcom,sdm845-aoss.h>
>   #include <dt-bindings/reset/qcom,sdm845-pdc.h>
> @@ -2076,6 +2077,15 @@
>   			#reset-cells = <1>;
>   		};
>   
> +		aoss_qmp: qmp@c300000 {
> +			compatible = "qcom,sdm845-aoss-qmp";
> +			reg = <0 0x0c300000 0 0x100000>;
> +			interrupts = <GIC_SPI 389 IRQ_TYPE_EDGE_RISING>;
> +			mboxes = <&apss_shared 0>;
> +
> +			#power-domain-cells = <1>;
> +		};
> +
>   		spmi_bus: spmi@c440000 {
>   			compatible = "qcom,spmi-pmic-arb";
>   			reg = <0 0x0c440000 0 0x1100>,
> 

-- 
Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc, is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
