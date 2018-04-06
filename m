Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180330152856.12297-4-brgl@bgdev.pl>
References: <20180330152856.12297-1-brgl@bgdev.pl> <20180330152856.12297-4-brgl@bgdev.pl>
Message-ID: <152304711592.94378.4448268823064394140@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v5 3/8] clk: davinci: add a reset lookup table for psc0
Date: Fri, 06 Apr 2018 13:38:35 -0700
To: Bartosz Golaszewski <brgl@bgdev.pl>, Bjorn Andersson <bjorn.andersson@linaro.org>, David Lechner <david@lechnology.com>, Kevin Hilman <khilman@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Ohad Ben-Cohen <ohad@wizery.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, Sekhar Nori <nsekhar@ti.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-remoteproc@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Quoting Bartosz Golaszewski (2018-03-30 08:28:51)
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> =

> In order to be able to use the reset framework in legacy boot mode as
> well, add the reset lookup table to the psc driver for da850 variant.
> =

> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---

Applied to clk-next
