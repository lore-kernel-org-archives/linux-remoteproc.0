Return-Path: <nsekhar@ti.com>
Subject: Re: [PATCH v6 5/7] remoteproc/davinci: use octal permissions for
 module_param()
References: <20180417173038.25510-1-brgl@bgdev.pl>
 <20180417173038.25510-6-brgl@bgdev.pl>
From: Sekhar Nori <nsekhar@ti.com>
Message-ID: <743a0d42-0760-e1ed-3e31-f40b65d6a985@ti.com>
Date: Wed, 18 Apr 2018 11:00:56 +0530
MIME-Version: 1.0
In-Reply-To: <20180417173038.25510-6-brgl@bgdev.pl>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Bartosz Golaszewski <brgl@bgdev.pl>, Suman Anna <s-anna@ti.com>, Kevin Hilman <khilman@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, David Lechner <david@lechnology.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-remoteproc@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On Tuesday 17 April 2018 11:00 PM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> Checkpatch recommends to use octal perms instead of S_IRUGO.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Reviewed-by: Sekhar Nori <nsekhar@ti.com>

Thanks,
Sekhar
