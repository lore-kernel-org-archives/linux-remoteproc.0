Return-Path: <sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu, 31 Jan 2019 22:28:32 +0530
From: Sibi Sankar <sibis@codeaurora.org>
Subject: Re: [PATCH v5 01/10] arm64: dts: qcom: sdm845: Update reserved memory
 map
In-Reply-To: <20190131003933.11436-2-bjorn.andersson@linaro.org>
References: <20190131003933.11436-1-bjorn.andersson@linaro.org>
 <20190131003933.11436-2-bjorn.andersson@linaro.org>
Message-ID: <0c5cc8f10e3c78f4d0eead81abb90d85@codeaurora.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ohad Ben-Cohen <ohad@wizery.com>, Arun Kumar Neelakantam <aneela@codeaurora.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hey Bjorn,

On 2019-01-31 06:09, Bjorn Andersson wrote:
> Update existing and add missing regions to the reserved memory map, as
> described in version 10.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Changes since v4:
> - Labeled aop_mem, aop_cmd_db_mem and made tz_mem span the last TZ
> related segment
> 
> Changes since v3:
> - Added hyp and xbl memory nodes.
> - Labeled all PIL nodes
> 
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 72 +++++++++++++++++++++++++---
>  1 file changed, 66 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index 33f5f4ba6160..45b1616392aa 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -73,12 +73,22 @@
>  		#size-cells = <2>;
>  		ranges;
> 
> -		memory@85fc0000 {
> +		hyp_mem: memory@85700000 {
> +			reg = <0x0 0x85700000 0 0x600000>;
> +			no-map;
> +		};
> +
> +		xbl_mem: memory@85e00000 {
> +			reg = <0x0 0x85e00000 0 0x100000>;
> +			no-map;
> +		};
> +
> +		aop_mem: memory@85fc0000 {
>  			reg = <0 0x85fc0000 0 0x20000>;
>  			no-map;
>  		};
> 
> -		memory@85fe0000 {
> +		aop_cmd_db_mem: memory@85fe0000 {
>  			compatible = "qcom,cmd-db";
>  			reg = <0x0 0x85fe0000 0x0 0x20000>;
>  			no-map;
> @@ -89,13 +99,43 @@
>  			no-map;
>  		};
> 
> -		memory@86200000 {
> -			reg = <0 0x86200000 0 0x2d00000>;
> +		tz_mem: memory@86200000 {
> +			reg = <0 0x86200000 0 0x3c00000>;

should be 0x2d00000 instead of 0x3c00000
tz_mem ends at 0x88F00000 :-)

nit: Also for hyp_mem and xbl_mem you could
use 0 instead of 0x0

Reviewed-by: Sibi Sankar <sibis@codeaurora.org>

> +			no-map;
> +		};
> +
> +		qseecom_mem: memory@8ab00000 {
> +			reg = <0 0x8ab00000 0 0x1400000>;
> +			no-map;
> +		};
> +
> +		camera_mem: memory@8bf00000 {
> +			reg = <0 0x8bf00000 0 0x500000>;
> +			no-map;
> +		};
> +
> +		ipa_fw_mem: memory@8c400000 {
> +			reg = <0 0x8c400000 0 0x10000>;
> +			no-map;
> +		};
> +
> +		ipa_gsi_mem: memory@8c410000 {
> +			reg = <0 0x8c410000 0 0x5000>;
>  			no-map;
>  		};
> 
> -		wlan_msa_mem: memory@96700000 {
> -			reg = <0 0x96700000 0 0x100000>;
> +		gpu_mem: memory@8c415000 {
> +			reg = <0 0x8c415000 0 0x2000>;
> +			no-map;
> +		};
> +
> +		adsp_mem: memory@8c500000 {
> +			reg = <0 0x8c500000 0 0x1a00000>;
> +			no-map;
> +		};
> +
> +		wlan_msa_mem: memory@8df00000 {
> +			reg = <0 0x8df00000 0 0x100000>;
>  			no-map;
>  		};
> 
> @@ -104,10 +144,30 @@
>  			no-map;
>  		};
> 
> +		venus_mem: memory@95800000 {
> +			reg = <0 0x95800000 0 0x500000>;
> +			no-map;
> +		};
> +
> +		cdsp_mem: memory@95d00000 {
> +			reg = <0 0x95d00000 0 0x800000>;
> +			no-map;
> +		};
> +
>  		mba_region: memory@96500000 {
>  			reg = <0 0x96500000 0 0x200000>;
>  			no-map;
>  		};
> +
> +		slpi_mem: memory@96700000 {
> +			reg = <0 0x96700000 0 0x1400000>;
> +			no-map;
> +		};
> +
> +		spss_mem: memory@97b00000 {
> +			reg = <0 0x97b00000 0 0x100000>;
> +			no-map;
> +		};
>  	};
> 
>  	cpus {

-- 
-- Sibi Sankar --
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
