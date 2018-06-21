Return-Path: <nsekhar@ti.com>
Subject: Re: [PATCH v7 0/4] ARM: davinci: complete the conversion to using the
 reset framework
References: <20180621073706.22812-1-brgl@bgdev.pl>
From: Sekhar Nori <nsekhar@ti.com>
Message-ID: <9ec10627-49a5-07ad-8c9d-5ac873096cc0@ti.com>
Date: Thu, 21 Jun 2018 16:22:24 +0530
MIME-Version: 1.0
In-Reply-To: <20180621073706.22812-1-brgl@bgdev.pl>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Bartosz Golaszewski <brgl@bgdev.pl>, Kevin Hilman <khilman@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, David Lechner <david@lechnology.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-remoteproc@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Bartosz,

On Thursday 21 June 2018 01:07 PM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> These are the remaining patches that still need to be merged in order
> to complete the conversion of the davinci dsp driver to using the reset
> framework.
> 
> They apply on top of v4.18-rc1 with David Lechner's remaining patches
> merged.

Series looks good to me.

To preserve bisect, shouldn't the order of applying be patch #3, #4, #1
and #2 ?

Given the dependencies and to preserve bisect its easiest if I take the
series with acks from remoteproc and clock maintainers.

Open to other suggestions as well.

Thanks,
Sekhar
