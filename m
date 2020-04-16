Return-Path: <broonie@kernel.org>
Date: Thu, 16 Apr 2020 11:40:24 +0100
From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: Clean-up schema indentation formatting
Message-ID: <20200416104024.GD5354@sirena.org.uk>
References: <20200416005549.9683-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wLAMOaPNJ0fu1fTG"
Content-Disposition: inline
In-Reply-To: <20200416005549.9683-1-robh@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Alexandre Torgue <alexandre.torgue@st.com>, Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Vinod Koul <vkoul@kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Guenter Roeck <linux@roeck-us.net>, Jonathan Cameron <jic23@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee.jones@linaro.org>, Ulf Hansson <ulf.hansson@linaro.org>, Heiko Stuebner <heiko@sntech.de>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Amit Kucheria <amit.kucheria@linaro.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-i2c@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-iio@vger.kernel.org, linux-input@vger.kernel.org, linux-leds@vger.kernel.org, linux-media@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org, linux-can@vger.kernel.org, netdev@vger.kernel.org, linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org, linux-pwm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-riscv@lists.infradead.org, linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org, alsa-devel@alsa-project.org, linux-spi@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>


--wLAMOaPNJ0fu1fTG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 15, 2020 at 07:55:48PM -0500, Rob Herring wrote:
> Fix various inconsistencies in schema indentation. Most of these are
> list indentation which should be 2 spaces more than the start of the
> enclosing keyword. This doesn't matter functionally, but affects running
> scripts which do transforms on the schema files.

Acked-by: Mark Brown <broonie@kernel.org>

--wLAMOaPNJ0fu1fTG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6YNhcACgkQJNaLcl1U
h9CTpAf+IW4icH5zPKy5c7TecTxfEyWNDjNTt8Pa69ga67NVmMDHKzueRcPb7D3e
ihhK7zM0HDSd8aebO5YtW3GiVBBUyJ0m1CNYvbcsJscIhoOoco+NPJUss00w/0Zs
L0RHGHcgc6lhNve8n+r6QbzSYEeeT9QhqTaPtyPnvMDRUkAYgShAD0ejHjNQWYOt
3KuH8RD18xfK/PWSRsrrxCY3flOTx0RIpS9+oyO+JWIcKd6Y5lCZiBAXGrXEdEjx
bgRsC/mO1YSE03iuDgQnodKThzIoJrygjOkGGDJuYsKY5erh8JZ93l5KPoLkyKCT
SSA9qjNaVs+wMuSlq8WJ3w8m+z5cOA==
=dNaD
-----END PGP SIGNATURE-----

--wLAMOaPNJ0fu1fTG--
