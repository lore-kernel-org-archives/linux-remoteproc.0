Return-Path: <bjorn.andersson@linaro.org>
Date: Tue, 29 Jan 2019 22:47:40 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v4 02/10] arm64: dts: qcom: sdm845: Define rmtfs memory
Message-ID: <20190130064740.GB2387@tuxbook-pro>
References: <20190129232009.5033-1-bjorn.andersson@linaro.org>
 <20190129232009.5033-3-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190129232009.5033-3-bjorn.andersson@linaro.org>
To: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ohad Ben-Cohen <ohad@wizery.com>, Arun Kumar Neelakantam <aneela@codeaurora.org>, Sibi Sankar <sibis@codeaurora.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Tue 29 Jan 15:20 PST 2019, Bjorn Andersson wrote:

> Define the rmtfs memory node, as described in version 10 of the memory
> map.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Changes since v3:
> - Labeled the node
> 
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index c363848e9001..afaffcc1e835 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -78,6 +78,15 @@
>  			no-map;
>  		};
>  
> +		mpss_efs: memory@85d00000 {
> +			compatible = "qcom,rmtfs-mem";
> +			reg = <0 0x85d00000 0 0x200000>;

It would be nice if this is how math works, but unfortunately I missed
that this overlaps with the xbl_mem below.

Will fix and resend the series.

Regards,
Bjorn

> +			no-map;
> +
> +			qcom,client-id = <1>;
> +			qcom,vmid = <15>;
> +		};
> +
>  		xbl_mem: memory@85e00000 {
>  			reg = <0x0 0x85e00000 0 0x100000>;
>  			no-map;
> -- 
> 2.18.0
> 
