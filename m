Return-Path: <vkoul@kernel.org>
Date: Thu, 16 Apr 2020 13:37:10 +0530
From: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: Clean-up schema indentation formatting
Message-ID: <20200416080710.GI72691@vkoul-mobl>
References: <20200416005549.9683-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200416005549.9683-1-robh@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Alexandre Torgue <alexandre.torgue@st.com>, Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Guenter Roeck <linux@roeck-us.net>, Jonathan Cameron <jic23@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee.jones@linaro.org>, Ulf Hansson <ulf.hansson@linaro.org>, Heiko Stuebner <heiko@sntech.de>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Fabio Estevam <festevam@gmail.com>, Mark Brown <broonie@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Amit Kucheria <amit.kucheria@linaro.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-i2c@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-iio@vger.kernel.org, linux-input@vger.kernel.org, linux-leds@vger.kernel.org, linux-media@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org, linux-can@vger.kernel.org, netdev@vger.kernel.org, linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org, linux-pwm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-riscv@lists.infradead.org, linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org, alsa-devel@alsa-project.org, linux-spi@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On 15-04-20, 19:55, Rob Herring wrote:
> Fix various inconsistencies in schema indentation. Most of these are
> list indentation which should be 2 spaces more than the start of the
> enclosing keyword. This doesn't matter functionally, but affects running
> scripts which do transforms on the schema files.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/arm/altera.yaml       |  6 +-
>  .../amlogic/amlogic,meson-gx-ao-secure.yaml   |  2 +-
>  .../devicetree/bindings/arm/bitmain.yaml      |  2 +-
>  .../devicetree/bindings/arm/nxp/lpc32xx.yaml  |  9 ++-
>  .../bindings/arm/socionext/uniphier.yaml      | 26 ++++----
>  .../bindings/arm/stm32/st,mlahb.yaml          |  2 +-
>  .../bindings/arm/stm32/st,stm32-syscon.yaml   |  6 +-
>  .../bindings/ata/faraday,ftide010.yaml        |  4 +-
>  .../bindings/bus/allwinner,sun8i-a23-rsb.yaml |  4 +-
>  .../clock/allwinner,sun4i-a10-gates-clk.yaml  |  8 +--
>  .../devicetree/bindings/clock/fsl,plldig.yaml | 17 +++--
>  .../devicetree/bindings/clock/qcom,mmcc.yaml  | 16 ++---
>  .../bindings/connector/usb-connector.yaml     |  6 +-
>  .../crypto/allwinner,sun4i-a10-crypto.yaml    | 14 ++--
>  .../bindings/crypto/allwinner,sun8i-ce.yaml   | 16 ++---
>  .../bindings/crypto/amlogic,gxl-crypto.yaml   |  2 +-
>  .../display/allwinner,sun4i-a10-hdmi.yaml     | 40 ++++++------
>  .../display/allwinner,sun4i-a10-tcon.yaml     | 58 ++++++++---------
>  .../display/allwinner,sun6i-a31-mipi-dsi.yaml | 28 ++++----
>  .../display/allwinner,sun8i-a83t-dw-hdmi.yaml | 10 +--
>  .../bindings/display/bridge/lvds-codec.yaml   | 18 +++---
>  .../display/panel/sony,acx424akp.yaml         |  2 +-
>  .../display/panel/xinpeng,xpp055c272.yaml     |  4 +-
>  .../bindings/display/renesas,cmm.yaml         | 16 ++---
>  .../devicetree/bindings/dma/ti/k3-udma.yaml   |  8 +--

Acked-By: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
