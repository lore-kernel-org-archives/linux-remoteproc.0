Return-Path: <nsekhar@ti.com>
Subject: Re: [PATCH v6 0/7] ARM: davinci: complete the conversion to using the
 reset framework
References: <20180417173038.25510-1-brgl@bgdev.pl>
From: Sekhar Nori <nsekhar@ti.com>
Message-ID: <08106d9b-6350-9aa1-9c58-50dd0aaf690c@ti.com>
Date: Tue, 1 May 2018 16:22:29 +0530
MIME-Version: 1.0
In-Reply-To: <20180417173038.25510-1-brgl@bgdev.pl>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Bartosz Golaszewski <brgl@bgdev.pl>, Suman Anna <s-anna@ti.com>, Kevin Hilman <khilman@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, David Lechner <david@lechnology.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-remoteproc@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Bartosz,

On Tuesday 17 April 2018 11:00 PM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> This series converts the only user of the handcoded, mach-specific reset
> routines in the davinci platform to using the reset framework.
> 
> Patches 1-2 add necessary lookups/DT-properties.
> 
> Patches 3-5 fix issues found in the remoteproc davinci driver.
> 
> Patch 6 converts the davinci-rproc driver to the reset framework.
> 
> Patch 7 removes now dead code.
> 
> Tested both in DT and legacy modes by booting the examples from
> ti-ipc-rtos recipe in meta-ti.
> 
> This series applies on top of David Lechner's common-clk-v9 branch[1].

To make it easier for Bjorn to apply his patches, can you please
separate out the remoteproc parts which are safe to apply to v4.17-rc1
and repost the series? Please collect the reviews and acks too.

Thanks,
Sekhar
