Date: Mon, 16 Dec 2019 16:19:38 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 16/16] arm64: dts: qcom: sm8150: Add ADSP, CDSP, MPSS and
 SLPI remoteprocs
Message-ID: <20191217001934.GT3143381@builder>
References: <20191118214250.14002-1-sibis@codeaurora.org>
 <0101016e80794e1d-7c9ce825-6ba5-479e-bc98-f5d56ce6933f-000000@us-west-2.amazonses.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0101016e80794e1d-7c9ce825-6ba5-479e-bc98-f5d56ce6933f-000000@us-west-2.amazonses.com>
To: Sibi Sankar <sibis@codeaurora.org>
Cc: jhugo@codeaurora.org, robh+dt@kernel.org, jonathan@marek.ca, ohad@wizery.com, mark.rutland@arm.com, p.zabel@pengutronix.de, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, agross@kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Mon 18 Nov 13:44 PST 2019, Sibi Sankar wrote:

> Add ADSP, CDSP, MPSS and SLPI device tree nodes for SM8150 SoC.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8150-mtp.dts |  12 +++
>  arch/arm64/boot/dts/qcom/sm8150.dtsi    | 135 ++++++++++++++++++++++++
>  2 files changed, 147 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8150-mtp.dts b/arch/arm64/boot/dts/qcom/sm8150-mtp.dts
> index aa5de42fcae45..4d9bb8145dbba 100644
> --- a/arch/arm64/boot/dts/qcom/sm8150-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8150-mtp.dts
> @@ -348,6 +348,18 @@
>  	};
>  };
>  
> +&adsp_pas {
> +	status = "okay";
> +};
> +
> +&cdsp_pas {
> +	status = "okay";
> +};
> +
> +&slpi_pas {
> +	status = "okay";
> +};
> +
>  &qupv3_id_1 {
>  	status = "okay";
>  };
> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> index 98a96fd1d6117..58f4ce95bd966 100644
> --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> @@ -5,6 +5,8 @@
>   */
>  
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/clock/qcom,gcc-sm8150.h>
> +#include <dt-bindings/power/qcom-aoss-qmp.h>
>  #include <dt-bindings/power/qcom-rpmpd.h>
>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
>  #include <dt-bindings/clock/qcom,rpmh.h>
> @@ -278,6 +280,139 @@
>  		};
>  	};
>  
> +	adsp_pas: remoteproc-adsp {

Please move this in under /soc, name it "remoteproc" and slap a reg = <>
on it. Even if qcom,*-pas doesn't use the information I find it look
better in the DT and it becomes more consistent between PAS and non-PAS
targets.

Regards,
Bjorn
