Return-Path: <vkoul@kernel.org>
Date: Thu, 16 Apr 2020 13:37:34 +0530
From: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH 2/2] dt-bindings: Remove cases of 'allOf' containing a
 '$ref'
Message-ID: <20200416080734.GJ72691@vkoul-mobl>
References: <20200416005549.9683-1-robh@kernel.org>
 <20200416005549.9683-2-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200416005549.9683-2-robh@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Alexandre Torgue <alexandre.torgue@st.com>, Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Guenter Roeck <linux@roeck-us.net>, Jonathan Cameron <jic23@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee.jones@linaro.org>, Ulf Hansson <ulf.hansson@linaro.org>, Heiko Stuebner <heiko@sntech.de>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Fabio Estevam <festevam@gmail.com>, Mark Brown <broonie@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Amit Kucheria <amit.kucheria@linaro.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-i2c@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-iio@vger.kernel.org, linux-input@vger.kernel.org, linux-leds@vger.kernel.org, linux-media@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org, linux-can@vger.kernel.org, netdev@vger.kernel.org, linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org, linux-pwm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-riscv@lists.infradead.org, linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org, alsa-devel@alsa-project.org, linux-spi@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On 15-04-20, 19:55, Rob Herring wrote:
> json-schema versions draft7 and earlier have a weird behavior in that
> any keywords combined with a '$ref' are ignored (silently). The correct
> form was to put a '$ref' under an 'allOf'. This behavior is now changed
> in the 2019-09 json-schema spec and '$ref' can be mixed with other
> keywords. The json-schema library doesn't yet support this, but the
> tooling now does a fixup for this and either way works.
> 
> This has been a constant source of review comments, so let's change this
> treewide so everyone copies the simpler syntax.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/arm/cpus.yaml         |  81 +++---
>  .../devicetree/bindings/arm/l2c2x0.yaml       |  87 +++---
>  .../devicetree/bindings/arm/psci.yaml         |  15 +-
>  .../bindings/arm/samsung/exynos-chipid.yaml   |   5 +-
>  .../bus/allwinner,sun50i-a64-de2.yaml         |   5 +-
>  .../bindings/clock/fixed-factor-clock.yaml    |   5 +-
>  .../bindings/connector/usb-connector.yaml     |  28 +-
>  .../bindings/crypto/st,stm32-hash.yaml        |   9 +-
>  .../allwinner,sun4i-a10-display-engine.yaml   |   7 +-
>  .../display/allwinner,sun4i-a10-tcon.yaml     |   5 +-
>  .../bindings/display/panel/panel-common.yaml  |   5 +-
>  .../devicetree/bindings/dma/dma-common.yaml   |   3 +-
>  .../devicetree/bindings/dma/ti/k3-udma.yaml   |  18 +-

Acked-By: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
