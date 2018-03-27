Return-Path: <david@lechnology.com>
Subject: Re: [PATCH v3 0/8] ARM: davinci: complete the conversion to using the
 reset framework
References: <20180327092031.11251-1-brgl@bgdev.pl>
From: David Lechner <david@lechnology.com>
Message-ID: <6166e140-b417-dd22-10cf-843db3958226@lechnology.com>
Date: Tue, 27 Mar 2018 11:48:47 -0500
MIME-Version: 1.0
In-Reply-To: <20180327092031.11251-1-brgl@bgdev.pl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Bartosz Golaszewski <brgl@bgdev.pl>, Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-remoteproc@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Wasn't there a v4 already? Is this really v5 instead of v3?


On 03/27/2018 04:20 AM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> This series converts the only user of the handcoded, mach-specific reset
> routines in the davinci platform to using the reset framework.
> 
> Patches 1-3 add necessary lookups/DT-properties.

Should I just squash the DT changes into my common-clock-v9 branch
since those patches haven't been picked up yet anyway? That will be
2 fewer patches to keep track of.
