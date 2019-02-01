Return-Path: <sibis@codeaurora.org>
Subject: Re: [PATCH v5 03/10] arm64: dts: sdm845: Introduce ADSP and CDSP PAS
 nodes
References: <20190131003933.11436-1-bjorn.andersson@linaro.org>
 <20190131003933.11436-4-bjorn.andersson@linaro.org>
From: Sibi Sankar <sibis@codeaurora.org>
Message-ID: <4539b3ca-cace-9c71-0453-94427ad79b73@codeaurora.org>
Date: Fri, 1 Feb 2019 11:19:51 +0530
MIME-Version: 1.0
In-Reply-To: <20190131003933.11436-4-bjorn.andersson@linaro.org>
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
> Add the Audio DSP (ADSP) and Compute DSP (CDSP) nodes for TrustZone
> based remoteproc, supporting booting these cores on e.g. the MTP, and
> enable the same for the MTP.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Changes since v4:
> - None
> 
> Changes since v3:
> - Make xo reference the actual CXO clock
> 
>   arch/arm64/boot/dts/qcom/sdm845-mtp.dts |  8 ++++
>   arch/arm64/boot/dts/qcom/sdm845.dtsi    | 58 +++++++++++++++++++++++++
>   2 files changed, 66 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> index af8c6a2445a2..02b8357c8ce8 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> @@ -48,6 +48,10 @@
>   	};
>   };
>   
> +&adsp_pas {
> +	status = "okay";
> +};
> +
>   &apps_rsc {
>   	pm8998-rpmh-regulators {
>   		compatible = "qcom,pm8998-rpmh-regulators";
> @@ -344,6 +348,10 @@
>   	};
>   };
>   
> +&cdsp_pas {
> +	status = "okay";
> +};
> +
>   &gcc {
>   	protected-clocks = <GCC_QSPI_CORE_CLK>,
>   			   <GCC_QSPI_CORE_CLK_SRC>,
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index d19486ba1e5e..07d9cd6fba7d 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -325,6 +325,64 @@
>   		};
>   	};
>   
> +	adsp_pas: remoteproc-adsp {
> +		compatible = "qcom,sdm845-adsp-pas";
> +
> +		interrupts-extended = <&intc GIC_SPI 162 IRQ_TYPE_EDGE_RISING>,
> +				      <&adsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
> +				      <&adsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
> +				      <&adsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
> +				      <&adsp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-names = "wdog", "fatal", "ready",
> +				  "handover", "stop-ack";
> +
> +		clocks = <&rpmhcc RPMH_CXO_CLK>;
> +		clock-names = "xo";
> +
> +		memory-region = <&adsp_mem>;
> +
> +		qcom,smem-states = <&adsp_smp2p_out 0>;
> +		qcom,smem-state-names = "stop";
> +
> +		status = "disabled";
> +
> +		glink-edge {
> +			interrupts = <GIC_SPI 156 IRQ_TYPE_EDGE_RISING>;
> +			label = "lpass";
> +			qcom,remote-pid = <2>;
> +			mboxes = <&apss_shared 8>;
> +		};
> +	};
> +
> +	cdsp_pas: remoteproc-cdsp {
> +		compatible = "qcom,sdm845-cdsp-pas";
> +
> +		interrupts-extended = <&intc GIC_SPI 578 IRQ_TYPE_EDGE_RISING>,
> +				      <&cdsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
> +				      <&cdsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
> +				      <&cdsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
> +				      <&cdsp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-names = "wdog", "fatal", "ready",
> +				  "handover", "stop-ack";
> +
> +		clocks = <&rpmhcc RPMH_CXO_CLK>;
> +		clock-names = "xo";
> +
> +		memory-region = <&cdsp_mem>;
> +
> +		qcom,smem-states = <&cdsp_smp2p_out 0>;
> +		qcom,smem-state-names = "stop";
> +
> +		status = "disabled";
> +
> +		glink-edge {
> +			interrupts = <GIC_SPI 574 IRQ_TYPE_EDGE_RISING>;
> +			label = "turing";
> +			qcom,remote-pid = <5>;
> +			mboxes = <&apss_shared 4>;
> +		};
> +	};
> +
>   	tcsr_mutex: hwlock {
>   		compatible = "qcom,tcsr-mutex";
>   		syscon = <&tcsr_mutex_regs 0 0x1000>;
> 

-- 
Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc, is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
