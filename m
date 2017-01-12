Return-Path: <bjorn.andersson@linaro.org>
Date: Thu, 12 Jan 2017 10:24:16 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [RFC 3/3] arm64: dts: msm8996: Add SMP2P node for Qualcomm SLPI
 rproc driver.
Message-ID: <20170112182416.GH10531@minitux>
References: <1484229217-23364-1-git-send-email-akdwived@codeaurora.org>
 <1484229217-23364-4-git-send-email-akdwived@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1484229217-23364-4-git-send-email-akdwived@codeaurora.org>
To: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Cc: sboyd@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, spjoshi@codeaurora.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu 12 Jan 05:53 PST 2017, Avaneesh Kumar Dwivedi wrote:
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index 9d1d7ad..2457b20 100644
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
> +		interrupts = <0 178 1>;

Please use <GIC_SPI 178 IRQ_TYPE_EDGE_RISING>;

> +
> +		qcom,ipc = <&apcs 4 8>;

Looking at qcom,smp2p-dsps downstream I get this to <&apcs 16 26>;

> +
> +		qcom,local-pid = <0>;
> +		qcom,remote-pid = <3>;
> +
> +		slpi_smp2p_in: slave-kernel {
> +				qcom,entry-name = "slave-kernel";
> +				interrupt-controller;
> +				#interrupt-cells = <2>;
> +			};

Please correct the indentation of this block.

> +
> +		slpi_smp2p_out: master-kernel {
> +			qcom,entry-name = "master-kernel";
> +			#qcom,state-cells = <1>;
> +		};
> +	};

Regards,
Bjorn
