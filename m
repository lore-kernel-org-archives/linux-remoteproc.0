Return-Path: <bjorn.andersson@linaro.org>
Date: Fri, 20 Jan 2017 10:15:37 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [RFC PATCH v2 3/3] arm64: dts: msm8996: Add SLPI SMP2P dt node.
Message-ID: <20170120181537.GZ10531@minitux>
References: <1484928636-27351-1-git-send-email-akdwived@codeaurora.org>
 <1484928636-27351-4-git-send-email-akdwived@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1484928636-27351-4-git-send-email-akdwived@codeaurora.org>
To: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Cc: sboyd@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri 20 Jan 08:10 PST 2017, Avaneesh Kumar Dwivedi wrote:

> Add smp2p support to communicate with slpi processor.
> 
> Signed-off-by: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index 9d1d7ad..c60472b 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -541,5 +541,29 @@
>  			#interrupt-cells = <2>;
>  		};
>  	};
> +
> +	smp2p-slpi {
> +		compatible = "qcom,smp2p";
> +		qcom,smem = <481>, <430>;
> +
> +		interrupts = <GIC_SPI 178 IRQ_TYPE_EDGE_RISING>;
> +
> +		qcom,ipc = <&apcs 16 26>;
> +
> +		qcom,local-pid = <0>;
> +		qcom,remote-pid = <3>;
> +
> +		slpi_smp2p_in: slave-kernel {
> +			qcom,entry-name = "slave-kernel";
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +
> +		slpi_smp2p_out: master-kernel {
> +			qcom,entry-name = "master-kernel";
> +			#qcom,state-cells = <1>;

Sorry for missing this earlier, but this is "#qcom,smem-state-cells" in
mainline.

Apart of that:

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn
