Return-Path: <lee.jones@linaro.org>
Return-Path: <lee.jones@linaro.org>
Date: Tue, 30 Aug 2016 11:23:50 +0100
From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v8 11/18] ARM: DT: STiH407: Add i2s_in pinctrl
 configuration
Message-ID: <20160830102350.GT1661@dell>
References: <1472223413-7254-1-git-send-email-peter.griffin@linaro.org>
 <1472223413-7254-12-git-send-email-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1472223413-7254-12-git-send-email-peter.griffin@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, vinod.koul@intel.com, patrice.chotard@st.com, dan.j.williams@intel.com, airlied@linux.ie, kraxel@redhat.com, ohad@wizery.com, bjorn.andersson@linaro.org, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org, linux-remoteproc@vger.kernel.org, Arnaud Pouliquen <arnaud.pouliquen@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri, 26 Aug 2016, Peter Griffin wrote:

> This patch adds the pinctrl config for the i2s_in pins
> used by the uniperif reader IP.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  arch/arm/boot/dts/stih407-pinctrl.dtsi | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)

Acked-by: Lee Jones <lee.jones@linaro.org>
  
> diff --git a/arch/arm/boot/dts/stih407-pinctrl.dtsi b/arch/arm/boot/dts/stih407-pinctrl.dtsi
> index 0fb5c8a..537db7e 100644
> --- a/arch/arm/boot/dts/stih407-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/stih407-pinctrl.dtsi
> @@ -1090,6 +1090,30 @@
>  				};
>  			};
>  
> +			i2s_in {
> +				pinctrl_i2s_8ch_in: i2s_8ch_in{
> +					st,pins {
> +						mclk = <&pio32 5 ALT1 IN>;
> +						lrclk = <&pio32 7 ALT1 IN>;
> +						sclk = <&pio32 6 ALT1 IN>;
> +						data0 = <&pio32 4 ALT1 IN>;
> +						data1 = <&pio33 0 ALT1 IN>;
> +						data2 = <&pio33 1 ALT1 IN>;
> +						data3 = <&pio33 2 ALT1 IN>;
> +						data4 = <&pio33 3 ALT1 IN>;
> +					};
> +				};
> +
> +				pinctrl_i2s_2ch_in: i2s_2ch_in{
> +					st,pins {
> +						mclk = <&pio32 5 ALT1 IN>;
> +						lrclk = <&pio32 7 ALT1 IN>;
> +						sclk = <&pio32 6 ALT1 IN>;
> +						data0 = <&pio32 4 ALT1 IN>;
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
