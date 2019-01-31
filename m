Return-Path: <sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu, 31 Jan 2019 22:39:44 +0530
From: Sibi Sankar <sibis@codeaurora.org>
Subject: Re: [PATCH v5 02/10] arm64: dts: qcom: sdm845: Define rmtfs memory
In-Reply-To: <20190131003933.11436-3-bjorn.andersson@linaro.org>
References: <20190131003933.11436-1-bjorn.andersson@linaro.org>
 <20190131003933.11436-3-bjorn.andersson@linaro.org>
Message-ID: <fabd30bb14cf174bbee06f6c1844cd98@codeaurora.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ohad Ben-Cohen <ohad@wizery.com>, Arun Kumar Neelakantam <aneela@codeaurora.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On 2019-01-31 06:09, Bjorn Andersson wrote:
> Define the rmtfs memory node. As the memory region specified in version
> 10 of the memory map is only 1MB a chunk of unallocated memory is
> chosen.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Changes since v4:
> - Moved rmtfs_mem, to not collide with xbl_mem
> 
> Changes since v3:
> - Labeled the node
> 
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index 45b1616392aa..d19486ba1e5e 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -104,6 +104,15 @@
>  			no-map;
>  		};
> 
> +		rmtfs_mem: memory@88f0000 {

Hey Bjorn,
we are missing a trailing zero here ^^
rmtfs_mem: memory@88f00000

Tested-by: Sibi Sankar <sibis@codeaurora.org>
Reviewed-by: Sibi Sankar <sibis@codeaurora.org>

> +			compatible = "qcom,rmtfs-mem";
> +			reg = <0 0x88f00000 0 0x200000>;
> +			no-map;
> +
> +			qcom,client-id = <1>;
> +			qcom,vmid = <15>;
> +		};
> +
>  		qseecom_mem: memory@8ab00000 {
>  			reg = <0 0x8ab00000 0 0x1400000>;
>  			no-map;

-- 
-- Sibi Sankar --
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
