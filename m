Return-Path: <hdegoede@redhat.com>
Subject: Re: [linux-sunxi] [PATCH RFC 3/3] ARM: dts: sun8i: add hwspinlock
 device to sun8i-h3
References: <1471002394-1106-1-git-send-email-clabbe.montjoie@gmail.com>
 <1471002394-1106-3-git-send-email-clabbe.montjoie@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <72a2d7ef-54c9-a2dd-c83a-bf994b3005ce@redhat.com>
Date: Fri, 12 Aug 2016 13:49:23 +0200
MIME-Version: 1.0
In-Reply-To: <1471002394-1106-3-git-send-email-clabbe.montjoie@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
To: clabbe.montjoie@gmail.com, ohad@wizery.com, bjorn.andersson@linaro.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
List-ID: <linux-remoteproc@vger.kernel.org>

Hi,

On 12-08-16 13:46, LABBE Corentin wrote:
> Add the hwspinlock device tree node for the device present on H3.
>
> Signed-off-by: LABBE Corentin <clabbe.montjoie@gmail.com>
> ---
>  arch/arm/boot/dts/sun8i-h3.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/arch/arm/boot/dts/sun8i-h3.dtsi b/arch/arm/boot/dts/sun8i-h3.dtsi
> index 439e8ed..c801389 100644
> --- a/arch/arm/boot/dts/sun8i-h3.dtsi
> +++ b/arch/arm/boot/dts/sun8i-h3.dtsi
> @@ -489,6 +489,16 @@
>  			status = "disabled";
>  		};
>
> +		hwspinlock: hwspinlock@1c18000 {
> +			compatible = "allwinner,sun8i-hwspinlock";
> +			reg = <0x01c18000 0x400>;
> +			resets = <&ccu RST_BUS_SPINLOCK>;
> +			reset-names = "ahb";
> +			clocks = <&ccu CLK_BUS_SPINLOCK>;
> +			clock-names = "ahb";
> +			status = "disabled";
> +		};
> +
>  		gic: interrupt-controller@01c81000 {
>  			compatible = "arm,cortex-a7-gic", "arm,cortex-a15-gic";
>  			reg = <0x01c81000 0x1000>,
>

Why status=disabled? If this is a core part of the SoC, which Linux
can use, then IMHO it should be always enabled, like e.g. we also
always enable the timers.

Regards,

Habs
