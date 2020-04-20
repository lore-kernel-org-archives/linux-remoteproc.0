Return-Path: <wsa@the-dreams.de>
Date: Mon, 20 Apr 2020 18:27:47 +0200
From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH 1/2] dt-bindings: Clean-up schema indentation formatting
Message-ID: <20200420162747.GA3721@ninjato>
References: <20200416005549.9683-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tKW2IUtsqtDRztdT"
Content-Disposition: inline
In-Reply-To: <20200416005549.9683-1-robh@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Alexandre Torgue <alexandre.torgue@st.com>, Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Vinod Koul <vkoul@kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Guenter Roeck <linux@roeck-us.net>, Jonathan Cameron <jic23@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee.jones@linaro.org>, Ulf Hansson <ulf.hansson@linaro.org>, Heiko Stuebner <heiko@sntech.de>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Fabio Estevam <festevam@gmail.com>, Mark Brown <broonie@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Amit Kucheria <amit.kucheria@linaro.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-i2c@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-iio@vger.kernel.org, linux-input@vger.kernel.org, linux-leds@vger.kernel.org, linux-media@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org, linux-can@vger.kernel.org, netdev@vger.kernel.org, linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org, linux-pwm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-riscv@lists.infradead.org, linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org, alsa-devel@alsa-project.org, linux-spi@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>


--tKW2IUtsqtDRztdT
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

I see that people had comments but I can't judge the topics raised. So,
I trust you guys that you find out when it is good to go and for that,
here is my ack:

Acked-by: Wolfram Sang <wsa@the-dreams.de>


--tKW2IUtsqtDRztdT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6dzX8ACgkQFA3kzBSg
KbauIw//UsNN3sTG1Vo4Bgtp5Vw0s3m8ojCBjku/VuI/dnL/nKMqOKViAqP/ihOW
epD4QCANZZ0InnhrhnkpKlsCZ3/i+OME4nuCopTRpWH5TUrX4T0f+1NLegcwoxw/
UZ1N+HIQrTXUqpkvVw677OEH4fd4qO2mulRZYu7EPi1zhsQs8tyc0spdKvLPg8IR
Wi165b1RDDsH6+ZFy9+KMDjPmklcrXxWRF/Qc5ATOmaSGMEFc3BTb2uVzVO64Oh0
dZXGDontJcsz+7KQSXatmu38Xwys1bGGxhG7nvkSS/DmaFwnbkLx2jBZFz9GzVNm
QZz3tC7olD6edfkgyL76W7dGYQfeA03MZZ88Sgq304Cgv0QwbTM26C0MXhpG1LZR
sIxf8ZSbwOVUAuXRtABR6Pqu4xm9qbIXtth68kmF8KGPPXIaInqZPOaL0T0ApXm8
ggBIcp2KoH117WlUDqmLOWlvSjecvUh5WxegsaGpmzxU/XTs9YxYvWvLNG5tGBs7
Se2LAoLynrGy7LuUQYtRfbYSULgv0cyhO3V6oRjeqNpgekKCqpzStLFWVdCniiuq
z3guYyMgQ13m1XwXHpeXwhUaak/dp7MvZeg9YxXn1g5MGCVQBMKBAak4aBGnxPLR
OZq32nBakfGpLUy17vQXKQ0FsM9g8+mMc0xbGgzyyjca0mQuJCs=
=5aFH
-----END PGP SIGNATURE-----

--tKW2IUtsqtDRztdT--
