Return-Path: <lee.jones@linaro.org>
Return-Path: <lee.jones@linaro.org>
Date: Tue, 30 Aug 2016 11:24:13 +0100
From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v8 10/18] ARM: DT: STiH407: Add i2s_out pinctrl
 configuration
Message-ID: <20160830102413.GU1661@dell>
References: <1472223413-7254-1-git-send-email-peter.griffin@linaro.org>
 <1472223413-7254-11-git-send-email-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1472223413-7254-11-git-send-email-peter.griffin@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, vinod.koul@intel.com, patrice.chotard@st.com, dan.j.williams@intel.com, airlied@linux.ie, kraxel@redhat.com, ohad@wizery.com, bjorn.andersson@linaro.org, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org, linux-remoteproc@vger.kernel.org, Arnaud Pouliquen <arnaud.pouliquen@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri, 26 Aug 2016, Peter Griffin wrote:

> This patch adds the pinctrl config for the i2s_out pins
> used by the uniperif player IP.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  arch/arm/boot/dts/stih407-pinctrl.dtsi | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)

Acked-by: Lee Jones <lee.jones@linaro.org>

> diff --git a/arch/arm/boot/dts/stih407-pinctrl.dtsi b/arch/arm/boot/dts/stih407-pinctrl.dtsi
> index a538ae5..0fb5c8a 100644
> --- a/arch/arm/boot/dts/stih407-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/stih407-pinctrl.dtsi
> @@ -1067,6 +1067,29 @@
>  				};
>  			};
>  
> +			i2s_out {
> +				pinctrl_i2s_8ch_out: i2s_8ch_out{
> +					st,pins {
> +						mclk = <&pio33 5 ALT1 OUT>;
> +						lrclk = <&pio33 7 ALT1 OUT>;
> +						sclk = <&pio33 6 ALT1 OUT>;
> +						data0 = <&pio33 4 ALT1 OUT>;
> +						data1 = <&pio34 0 ALT1 OUT>;
> +						data2 = <&pio34 1 ALT1 OUT>;
> +						data3 = <&pio34 2 ALT1 OUT>;
> +					};
> +				};
> +
> +				pinctrl_i2s_2ch_out: i2s_2ch_out{
> +					st,pins {
> +						mclk = <&pio33 5 ALT1 OUT>;
> +						lrclk = <&pio33 7 ALT1 OUT>;
> +						sclk = <&pio33 6 ALT1 OUT>;
> +						data0 = <&pio33 4 ALT1 OUT>;
> +					};
> +				};
> +			};
> +
>  			serial3 {
>  				pinctrl_serial3: serial3-0 {
>  					st,pins {

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
