Return-Path: <david@lechnology.com>
Subject: Re: [PATCH v5 2/8] ARM: davinci: dts: add a reset control to the dsp
 node
References: <20180330152856.12297-1-brgl@bgdev.pl>
 <20180330152856.12297-3-brgl@bgdev.pl>
From: David Lechner <david@lechnology.com>
Message-ID: <72775f3d-8b89-9aae-833c-1d6779b94b5e@lechnology.com>
Date: Fri, 30 Mar 2018 12:10:56 -0500
MIME-Version: 1.0
In-Reply-To: <20180330152856.12297-3-brgl@bgdev.pl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Bartosz Golaszewski <brgl@bgdev.pl>, Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-remoteproc@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-ID: <linux-remoteproc@vger.kernel.org>



On 3/30/18 10:28 AM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> The davinci-rproc driver will soon use the reset framework. Add the
> resets property to the dsp node in da850.dtsi.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>   arch/arm/boot/dts/da850.dtsi | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/boot/dts/da850.dtsi b/arch/arm/boot/dts/da850.dtsi
> index dad64dbf1f23..5b485e44b83e 100644
> --- a/arch/arm/boot/dts/da850.dtsi
> +++ b/arch/arm/boot/dts/da850.dtsi
> @@ -109,6 +109,7 @@
>   		interrupt-parent = <&intc>;
>   		interrupts = <28>;
>   		clocks = <&psc0 15>;
> +		resets = <&psc0 15>;
>   		status = "disabled";
>   	};
>   	soc@1c00000 {
> 

Reviewed-by: David Lechner <david@lechnology.com>
