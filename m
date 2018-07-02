Return-Path: <nsekhar@ti.com>
Subject: Re: [PATCH v7 4/4] ARM: davinci: dts: add a reset control to the dsp
 node
References: <20180621073706.22812-1-brgl@bgdev.pl>
 <20180621073706.22812-5-brgl@bgdev.pl>
From: Sekhar Nori <nsekhar@ti.com>
Message-ID: <b3fafb57-86e0-3124-1322-9020b793ccf7@ti.com>
Date: Mon, 2 Jul 2018 17:32:11 +0530
MIME-Version: 1.0
In-Reply-To: <20180621073706.22812-5-brgl@bgdev.pl>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Bartosz Golaszewski <brgl@bgdev.pl>, Kevin Hilman <khilman@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, David Lechner <david@lechnology.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-remoteproc@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On Thursday 21 June 2018 01:07 PM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> The davinci-rproc driver will soon use the reset framework. Add the
> resets property to the dsp node in da850.dtsi.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Reviewed-by: David Lechner <david@lechnology.com>
> ---
>  arch/arm/boot/dts/da850.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/boot/dts/da850.dtsi b/arch/arm/boot/dts/da850.dtsi
> index 1bc0e4bc0697..225e0cf4b7bc 100644
> --- a/arch/arm/boot/dts/da850.dtsi
> +++ b/arch/arm/boot/dts/da850.dtsi
> @@ -118,6 +118,7 @@
>  		interrupt-parent = <&intc>;
>  		interrupts = <28>;
>  		clocks = <&psc0 15>;
> +		resets = <&psc0 15>;

Applied to v4.19/dt

Thanks,
Sekhar
