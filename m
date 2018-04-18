Return-Path: <nsekhar@ti.com>
Subject: Re: [PATCH v6 6/7] remoteproc/davinci: use the reset framework
References: <20180417173038.25510-1-brgl@bgdev.pl>
 <20180417173038.25510-7-brgl@bgdev.pl>
From: Sekhar Nori <nsekhar@ti.com>
Message-ID: <14b8384d-707d-42b7-b3ac-1ad914997a2e@ti.com>
Date: Wed, 18 Apr 2018 11:14:47 +0530
MIME-Version: 1.0
In-Reply-To: <20180417173038.25510-7-brgl@bgdev.pl>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Bartosz Golaszewski <brgl@bgdev.pl>, Suman Anna <s-anna@ti.com>, Kevin Hilman <khilman@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, David Lechner <david@lechnology.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-remoteproc@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On Tuesday 17 April 2018 11:00 PM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> Switch to using the reset framework instead of handcoded reset routines
> we used so far.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Looks good!

Reviewed-by: Sekhar Nori <nsekhar@ti.com>

This depends on DaVinci gaining common clock / reset framework support
though. I am guessing remoteproc maintainers will have to be reminded
when its safe to apply.

Thanks,
Sekhar
