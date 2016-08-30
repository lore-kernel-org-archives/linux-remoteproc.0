Return-Path: <lee.jones@linaro.org>
Return-Path: <lee.jones@linaro.org>
Date: Tue, 30 Aug 2016 11:26:19 +0100
From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v8 06/18] ARM: STi: DT: STiH407: Add FDMA driver dt nodes.
Message-ID: <20160830102619.GA10121@dell>
References: <1472223413-7254-1-git-send-email-peter.griffin@linaro.org>
 <1472223413-7254-7-git-send-email-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1472223413-7254-7-git-send-email-peter.griffin@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, vinod.koul@intel.com, patrice.chotard@st.com, dan.j.williams@intel.com, airlied@linux.ie, kraxel@redhat.com, ohad@wizery.com, bjorn.andersson@linaro.org, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri, 26 Aug 2016, Peter Griffin wrote:

> These nodes are required to get the fdma driver working
> on STiH407 based silicon.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  arch/arm/boot/dts/stih407-family.dtsi | 52 +++++++++++++++++++++++++++++++++++
>  1 file changed, 52 insertions(+)

Acked-by: Lee Jones <lee.jones@linaro.org>
  
> diff --git a/arch/arm/boot/dts/stih407-family.dtsi b/arch/arm/boot/dts/stih407-family.dtsi
> index d294e82..45cab30 100644
> --- a/arch/arm/boot/dts/stih407-family.dtsi
> +++ b/arch/arm/boot/dts/stih407-family.dtsi
> @@ -821,5 +821,57 @@
>  			clock-frequency	= <600000000>;
>  			st,syscfg	= <&syscfg_core 0x224>;
>  		};
> +
> +		/* fdma audio */
> +		fdma0: dma-controller@8e20000 {
> +			compatible = "st,stih407-fdma-mpe31-11", "st,slim-rproc";
> +			reg = <0x8e20000 0x8000>,
> +			      <0x8e30000 0x3000>,
> +			      <0x8e37000 0x1000>,
> +			      <0x8e38000 0x8000>;
> +			reg-names = "slimcore", "dmem", "peripherals", "imem";
> +			clocks = <&clk_s_c0_flexgen CLK_FDMA>,
> +				 <&clk_s_c0_flexgen CLK_EXT2F_A9>,
> +				 <&clk_s_c0_flexgen CLK_EXT2F_A9>,
> +				 <&clk_s_c0_flexgen CLK_EXT2F_A9>;
> +			interrupts = <GIC_SPI 5 IRQ_TYPE_NONE>;
> +			dma-channels = <16>;
> +			#dma-cells = <3>;
> +		};
> +
> +		/* fdma app */
> +		fdma1: dma-controller@8e40000 {
> +			compatible = "st,stih407-fdma-mpe31-12", "st,slim-rproc";
> +			reg = <0x8e40000 0x8000>,
> +			      <0x8e50000 0x3000>,
> +			      <0x8e57000 0x1000>,
> +			      <0x8e58000 0x8000>;
> +			reg-names = "slimcore", "dmem", "peripherals", "imem";
> +			clocks = <&clk_s_c0_flexgen CLK_FDMA>,
> +				<&clk_s_c0_flexgen CLK_TX_ICN_DMU>,
> +				<&clk_s_c0_flexgen CLK_TX_ICN_DMU>,
> +				<&clk_s_c0_flexgen CLK_EXT2F_A9>;
> +
> +			interrupts = <GIC_SPI 7 IRQ_TYPE_NONE>;
> +			dma-channels = <16>;
> +			#dma-cells = <3>;
> +		};
> +
> +		/* fdma free running */
> +		fdma2: dma-controller@8e60000 {
> +			compatible = "st,stih407-fdma-mpe31-13", "st,slim-rproc";
> +			reg = <0x8e60000 0x8000>,
> +			      <0x8e70000 0x3000>,
> +			      <0x8e77000 0x1000>,
> +			      <0x8e78000 0x8000>;
> +			reg-names = "slimcore", "dmem", "peripherals", "imem";
> +			interrupts = <GIC_SPI 9 IRQ_TYPE_NONE>;
> +			dma-channels = <16>;
> +			#dma-cells = <3>;
> +			clocks = <&clk_s_c0_flexgen CLK_FDMA>,
> +				<&clk_s_c0_flexgen CLK_EXT2F_A9>,
> +				<&clk_s_c0_flexgen CLK_TX_ICN_DISP_0>,
> +				<&clk_s_c0_flexgen CLK_EXT2F_A9>;
> +		};
>  	};
>  };

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
