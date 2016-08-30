Return-Path: <lee.jones@linaro.org>
Return-Path: <lee.jones@linaro.org>
Date: Tue, 30 Aug 2016 11:22:43 +0100
From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v8 12/18] ARM: DT: STiH407: Add spdif_out pinctrl config
Message-ID: <20160830102243.GS1661@dell>
References: <1472223413-7254-1-git-send-email-peter.griffin@linaro.org>
 <1472223413-7254-13-git-send-email-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1472223413-7254-13-git-send-email-peter.griffin@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, vinod.koul@intel.com, patrice.chotard@st.com, dan.j.williams@intel.com, airlied@linux.ie, kraxel@redhat.com, ohad@wizery.com, bjorn.andersson@linaro.org, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org, linux-remoteproc@vger.kernel.org, Arnaud Pouliquen <arnaud.pouliquen@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri, 26 Aug 2016, Peter Griffin wrote:

> This patch adds the pinctrl config for the spidf out
> pins used by the sasg codec IP.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  arch/arm/boot/dts/stih407-pinctrl.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)

Acked-by: Lee Jones <lee.jones@linaro.org>

> diff --git a/arch/arm/boot/dts/stih407-pinctrl.dtsi b/arch/arm/boot/dts/stih407-pinctrl.dtsi
> index 537db7e..598dbab 100644
> --- a/arch/arm/boot/dts/stih407-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/stih407-pinctrl.dtsi
> @@ -1114,6 +1114,14 @@
>  				};
>  			};
>  
> +			spdif_out {
> +				pinctrl_spdif_out: spdif_out{
> +					st,pins {
> +						spdif_out = <&pio34 7 ALT1 OUT>;
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
