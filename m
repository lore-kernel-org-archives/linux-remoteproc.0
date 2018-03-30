Return-Path: <david@lechnology.com>
Subject: Re: [PATCH v5 1/8] ARM: davinci: dts: make psc0 a reset provider
References: <20180330152856.12297-1-brgl@bgdev.pl>
 <20180330152856.12297-2-brgl@bgdev.pl>
From: David Lechner <david@lechnology.com>
Message-ID: <7a069665-966e-9277-2b4c-a0505804e94a@lechnology.com>
Date: Fri, 30 Mar 2018 12:10:20 -0500
MIME-Version: 1.0
In-Reply-To: <20180330152856.12297-2-brgl@bgdev.pl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Bartosz Golaszewski <brgl@bgdev.pl>, Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-remoteproc@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-ID: <linux-remoteproc@vger.kernel.org>



On 3/30/18 10:28 AM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> The psc driver registers with the reset framework as a provider. Add
> the #reset-cells property to the psc0 node.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>   arch/arm/boot/dts/da850.dtsi | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/boot/dts/da850.dtsi b/arch/arm/boot/dts/da850.dtsi
> index a3b9a99b43ca..dad64dbf1f23 100644
> --- a/arch/arm/boot/dts/da850.dtsi
> +++ b/arch/arm/boot/dts/da850.dtsi
> @@ -123,6 +123,7 @@
>   			compatible = "ti,da850-psc0";
>   			reg = <0x10000 0x1000>;
>   			#clock-cells = <1>;
> +			#reset-cells = <1>;
>   			#power-domain-cells = <1>;
>   			clocks = <&pll0_sysclk 1>, <&pll0_sysclk 2>,
>   				 <&pll0_sysclk 4>, <&pll0_sysclk 6>,
> 

Reviewed-by: David Lechner <david@lechnology.com>
