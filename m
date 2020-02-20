Return-Path: <mathieu.poirier@linaro.org>
Return-Path: <mathieu.poirier@linaro.org>
Date: Thu, 20 Feb 2020 13:47:46 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH v3 4/8] arm64: dts: qcom: qcs404: Add IMEM and PIL info
 region
Message-ID: <20200220204746.GD19352@xps15>
References: <20200211005059.1377279-1-bjorn.andersson@linaro.org>
 <20200211005059.1377279-5-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200211005059.1377279-5-bjorn.andersson@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Sibi Sankar <sibis@codeaurora.org>, Rishabh Bhatnagar <rishabhb@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Mon, Feb 10, 2020 at 04:50:55PM -0800, Bjorn Andersson wrote:
> Add a simple-mfd representing IMEM on QCS404 and define the PIL
> relocation info region, so that post mortem tools will be able to locate
> the loaded remoteprocs.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Changes since v2:
> - Replace offset with reg
> 
>  arch/arm64/boot/dts/qcom/qcs404.dtsi | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> index 4ee1e3d5f123..f539293b875c 100644
> --- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> @@ -997,6 +997,19 @@ blsp2_spi0: spi@7af5000 {
>  			status = "disabled";
>  		};
>  
> +		imem@8600000 {
> +			compatible = "syscon", "simple-mfd";
> +			reg = <0x08600000 0x1000>;
> +
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			pil-reloc@94c {
> +				compatible ="qcom,pil-reloc-info";

s/="/= "

> +				reg = <0x94c 200>;
> +			};
> +		};
> +
>  		intc: interrupt-controller@b000000 {
>  			compatible = "qcom,msm-qgic2";
>  			interrupt-controller;
> -- 
> 2.24.0
> 
