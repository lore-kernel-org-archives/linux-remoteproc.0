Return-Path: <david@lechnology.com>
Subject: Re: [PATCH v5 5/8] remoteproc/davinci: prepare and unprepare the
 clock where needed
References: <20180330152856.12297-1-brgl@bgdev.pl>
 <20180330152856.12297-6-brgl@bgdev.pl>
From: David Lechner <david@lechnology.com>
Message-ID: <4122b904-ee40-db8b-ecd5-813d75b3cba2@lechnology.com>
Date: Fri, 30 Mar 2018 12:14:03 -0500
MIME-Version: 1.0
In-Reply-To: <20180330152856.12297-6-brgl@bgdev.pl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Bartosz Golaszewski <brgl@bgdev.pl>, Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-remoteproc@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-ID: <linux-remoteproc@vger.kernel.org>



On 3/30/18 10:28 AM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> We're currently switching the platform to using the common clock
> framework. We need to explicitly prepare and unprepare the rproc
> clock.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Acked-by: Suman Anna <s-anna@ti.com>
> ---

Reviewed-by: David Lechner <david@lechnology.com>
