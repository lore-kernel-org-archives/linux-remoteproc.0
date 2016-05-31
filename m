Return-Path: <arnaud.pouliquen@st.com>
Subject: Re: [PATCH v4 11/18] ARM: multi_v7_defconfig: Enable STi and
 simple-card drivers.
References: <1464192412-16386-1-git-send-email-peter.griffin@linaro.org>
 <1464192412-16386-13-git-send-email-peter.griffin@linaro.org>
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Message-ID: <574D5178.5030200@st.com>
Date: Tue, 31 May 2016 10:55:20 +0200
MIME-Version: 1.0
In-Reply-To: <1464192412-16386-13-git-send-email-peter.griffin@linaro.org>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit
To: Peter Griffin <peter.griffin@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, srinivas.kandagatla@gmail.com, maxime.coquelin@st.com, patrice.chotard@st.com, vinod.koul@intel.com, ohad@wizery.com, bjorn.andersson@linaro.org, arnd@arndb.de
Cc: lee.jones@linaro.org, devicetree@vger.kernel.org, dmaengine@vger.kernel.org, linux-remoteproc@vger.kernel.org, broonie@kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Peter,

On 05/25/2016 06:06 PM, Peter Griffin wrote:
> This patch enables the STi ALSA drivers found on STi platforms
> as well as the simple-card driver which is a dependency to have
> working sound.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> Cc: arnaud.pouliquen@st.com
> Cc: broonie@kernel.org
> ---
>  arch/arm/configs/multi_v7_defconfig | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
> index 5eee45b..0ced665 100644
> --- a/arch/arm/configs/multi_v7_defconfig
> +++ b/arch/arm/configs/multi_v7_defconfig
> @@ -589,6 +589,9 @@ CONFIG_SND_SOC_AK4642=m
>  CONFIG_SND_SOC_SGTL5000=m
>  CONFIG_SND_SOC_SPDIF=m
>  CONFIG_SND_SOC_WM8978=m
> +CONFIG_SND_SOC_STI=m
> +CONFIG_SND_SOC_STI_SAS=m
> +CONFIG_SND_SIMPLE_CARD=m
Simple card config seems enabled by default, at least on 4.7 rc1.

Regards,
Arnaud
>  CONFIG_USB=y
>  CONFIG_USB_XHCI_HCD=y
>  CONFIG_USB_XHCI_MVEBU=y
> 
