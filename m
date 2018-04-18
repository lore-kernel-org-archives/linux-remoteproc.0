Return-Path: <nsekhar@ti.com>
Subject: Re: [PATCH v6 3/7] remoteproc/davinci: add the missing retval check
 for clk_enable()
References: <20180417173038.25510-1-brgl@bgdev.pl>
 <20180417173038.25510-4-brgl@bgdev.pl>
From: Sekhar Nori <nsekhar@ti.com>
Message-ID: <887cabcb-ebb5-0ad9-5bf4-8bb5eba2a017@ti.com>
Date: Wed, 18 Apr 2018 10:34:42 +0530
MIME-Version: 1.0
In-Reply-To: <20180417173038.25510-4-brgl@bgdev.pl>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Bartosz Golaszewski <brgl@bgdev.pl>, Suman Anna <s-anna@ti.com>, Kevin Hilman <khilman@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, David Lechner <david@lechnology.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-remoteproc@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On Tuesday 17 April 2018 11:00 PM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> The davinci platform is being switched to using the common clock
> framework, where clk_enable() can fail. Add the return value check.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Acked-by: Suman Anna <s-anna@ti.com>
> Reviewed-by: David Lechner <david@lechnology.com>

Reviewed-by: Sekhar Nori <nsekhar@ti.com>

This should be safe to apply to v4.17-rc1 and should be queued by Ohad /
Bjorn.

Thanks,
Sekhar
