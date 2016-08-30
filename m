Return-Path: <lee.jones@linaro.org>
Return-Path: <lee.jones@linaro.org>
Date: Tue, 30 Aug 2016 10:56:46 +0100
From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v8 16/18] ARM: DT: STi: stihxxx-b2120: Add DT nodes for
 STi audio card
Message-ID: <20160830095646.GM1661@dell>
References: <1472223413-7254-1-git-send-email-peter.griffin@linaro.org>
 <1472223413-7254-17-git-send-email-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1472223413-7254-17-git-send-email-peter.griffin@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, vinod.koul@intel.com, patrice.chotard@st.com, dan.j.williams@intel.com, airlied@linux.ie, kraxel@redhat.com, ohad@wizery.com, bjorn.andersson@linaro.org, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org, linux-remoteproc@vger.kernel.org, Arnaud Pouliquen <arnaud.pouliquen@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri, 26 Aug 2016, Peter Griffin wrote:

> This patch enables the uniperif players 2 & 3 for b2120 boards
> and also adds the "simple-audio-card" device node to interconnect
> the SoC sound device and the codec.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  arch/arm/boot/dts/stihxxx-b2120.dtsi | 45 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 45 insertions(+)

Acked-by: Lee Jones <lee.jones@linaro.org>

> diff --git a/arch/arm/boot/dts/stihxxx-b2120.dtsi b/arch/arm/boot/dts/stihxxx-b2120.dtsi
> index 722c63f..1f64bb6 100644
> --- a/arch/arm/boot/dts/stihxxx-b2120.dtsi
> +++ b/arch/arm/boot/dts/stihxxx-b2120.dtsi
> @@ -131,5 +131,50 @@
>  				dvb-card	= <STV0367_TDA18212_NIMA_1>;
>  			};
>  		};
> +
> +		sti_uni_player2: sti-uni-player@2 {
> +			status = "okay";
> +		};
> +
> +		sti_uni_player3: sti-uni-player@3 {
> +			status = "okay";
> +		};
> +
> +		sti_sasg_codec: sti-sasg-codec {
> +			status = "okay";
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&pinctrl_spdif_out>;
> +		};
> +
> +		sound {
> +			compatible = "simple-audio-card";
> +			simple-audio-card,name = "sti audio card";
> +			status = "okay";
> +
> +			simple-audio-card,dai-link@0 {
> +				/* DAC */
> +				format = "i2s";
> +				mclk-fs = <256>;
> +				cpu {
> +					sound-dai = <&sti_uni_player2>;
> +				};
> +
> +				codec {
> +					sound-dai = <&sti_sasg_codec 1>;
> +				};
> +			};
> +			simple-audio-card,dai-link@1 {
> +				/* SPDIF */
> +				format = "left_j";
> +				mclk-fs = <128>;
> +				cpu {
> +					sound-dai = <&sti_uni_player3>;
> +				};
> +
> +				codec {
> +					sound-dai = <&sti_sasg_codec 0>;
> +				};
> +			};
> +		};
>  	};
>  };

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
