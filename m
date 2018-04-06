Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180330152856.12297-9-brgl@bgdev.pl>
References: <20180330152856.12297-1-brgl@bgdev.pl> <20180330152856.12297-9-brgl@bgdev.pl>
Message-ID: <152304721717.94378.15508132666893079542@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v5 8/8] clk: davinci: kill davinci_clk_reset_assert/deassert()
Date: Fri, 06 Apr 2018 13:40:17 -0700
To: Bartosz Golaszewski <brgl@bgdev.pl>, Bjorn Andersson <bjorn.andersson@linaro.org>, David Lechner <david@lechnology.com>, Kevin Hilman <khilman@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Ohad Ben-Cohen <ohad@wizery.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, Sekhar Nori <nsekhar@ti.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-remoteproc@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Quoting Bartosz Golaszewski (2018-03-30 08:28:56)
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> =

> This code is no longer used. Remove it.
> =

> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Reviewed-by: David Lechner <david@lechnology.com>
> ---

I'll try to remember, but please send this again if we need to apply it
to the clk tree for 4.18.

Acked-by: Stephen Boyd <sboyd@kernel.org>
