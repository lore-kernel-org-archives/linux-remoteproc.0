Return-Path: <wsa@the-dreams.de>
Date: Thu, 16 Apr 2020 09:27:54 +0200
From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH 1/2] dt-bindings: Clean-up schema indentation formatting
Message-ID: <20200416072754.GB1023@kunai>
References: <20200416005549.9683-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PmA2V3Z32TCmWXqI"
Content-Disposition: inline
In-Reply-To: <20200416005549.9683-1-robh@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Alexandre Torgue <alexandre.torgue@st.com>, Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Vinod Koul <vkoul@kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Guenter Roeck <linux@roeck-us.net>, Jonathan Cameron <jic23@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee.jones@linaro.org>, Ulf Hansson <ulf.hansson@linaro.org>, Heiko Stuebner <heiko@sntech.de>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Fabio Estevam <festevam@gmail.com>, Mark Brown <broonie@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Amit Kucheria <amit.kucheria@linaro.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-i2c@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-iio@vger.kernel.org, linux-input@vger.kernel.org, linux-leds@vger.kernel.org, linux-media@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org, linux-can@vger.kernel.org, netdev@vger.kernel.org, linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org, linux-pwm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-riscv@lists.infradead.org, linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org, alsa-devel@alsa-project.org, linux-spi@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>


--PmA2V3Z32TCmWXqI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 15, 2020 at 07:55:48PM -0500, Rob Herring wrote:
> Fix various inconsistencies in schema indentation. Most of these are
> list indentation which should be 2 spaces more than the start of the
> enclosing keyword. This doesn't matter functionally, but affects running
> scripts which do transforms on the schema files.
>=20
> Signed-off-by: Rob Herring <robh@kernel.org>

Acked-by: Wolfram Sang <wsa@the-dreams.de> # for I2C


--PmA2V3Z32TCmWXqI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6YCPoACgkQFA3kzBSg
KbYO9w/+I4SkxzsKIBEPYPlNhQjpS6257EsfctnShX5MtTXuuVlEM9PKrWOlHqUv
VPZp1gNSi0U/GchhYvzhAQ0yia0RzJoIb9lP8a+B/i2n77CDCgIRyWBqSA/dX2Ts
FqwsTUS4HND9WJve1vPA6xRF0GlFYSCgXTHGgqxWNOdZHkTjIog1Pm+3C6pk+CbX
eKDEHPFiVzkgUvkspatPeh/+nVLQSJ1CA0V0Qstqqu6+c2ciLJxYnh3cstsjThRS
u+Hp1Tj1TGmJtiHEoDYpNbUuGxu8dE+iHMeM4EnePh2KraRRQ+o35bx0QdhhzcU2
2AZf2VMtoqV5XgcyRM6B05wxjD5XQWSEcRPaA4KSiR2G3tFi+WYiVRHI8Pekbgzl
0HPDsprCCwqNPUVqeqcyMOlYPYpOCIcCz17nZKd0ZDv9SphmwAXjvc2KNHg3lnVi
U7BU6i+P4fM8P7Lx496uw1CjUOKtLdM74WYDliTT3timGh1ZYB9l2AC8yTJqBQDY
zRnBeFyItoXVtZbkAQgoGOTuIn6ZUY+ZzUquour0XK2PGJuxxArp0rFcEFAAeccC
/iHPV6k2vWKT/r/wRa5qjwZZrvi0N98xyWX89B0rfqjVasG6DqrTcEnfY/0g8JOo
S0O569k351VYcMrKIrtqc6RsnSOAwPpJskVLGf4j5KhQ1waxcTg=
=JRiG
-----END PGP SIGNATURE-----

--PmA2V3Z32TCmWXqI--
