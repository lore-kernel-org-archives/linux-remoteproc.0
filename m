Return-Path: <bjorn.andersson@linaro.org>
Date: Wed, 7 Nov 2018 22:51:03 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 3/5] ARM: dts: stm32: Add hwspinlock node for stm32mp157
 SoC
Message-ID: <20181108065103.GD12063@builder>
References: <20181031093032.20386-1-benjamin.gaignard@st.com>
 <20181031093032.20386-4-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181031093032.20386-4-benjamin.gaignard@st.com>
To: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Cc: ohad@wizery.com, robh+dt@kernel.org, mark.rutland@arm.com, alexandre.torgue@st.com, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, Benjamin Gaignard <benjamin.gaignard@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed 31 Oct 02:30 PDT 2018, Benjamin Gaignard wrote:

> Declare hwspinlock device for stm32mp157 SoC
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>

Pending the clock-names question,

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  arch/arm/boot/dts/stm32mp157c.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/stm32mp157c.dtsi b/arch/arm/boot/dts/stm32mp157c.dtsi
> index 185541a5b69f..9b16c28f8ac3 100644
> --- a/arch/arm/boot/dts/stm32mp157c.dtsi
> +++ b/arch/arm/boot/dts/stm32mp157c.dtsi
> @@ -803,6 +803,15 @@
>  			status = "disabled";
>  		};
>  
> +		hsem: hwspinlock@4c000000 {
> +			compatible = "st,stm32-hwspinlock";
> +			#hwlock-cells = <1>;
> +			reg = <0x4c000000 0x400>;
> +			clocks = <&rcc HSEM>;
> +			clock-names = "hwspinlock";
> +			status = "disabled";
> +		};
> +
>  		rcc: rcc@50000000 {
>  			compatible = "st,stm32mp1-rcc", "syscon";
>  			reg = <0x50000000 0x1000>;
> -- 
> 2.15.0
> 
