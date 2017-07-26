Return-Path: <bjorn.andersson@linaro.org>
Date: Wed, 26 Jul 2017 10:11:55 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v1 1/2] remoteproc: dt: Provide bindings for iMX6SX/7D
 Remote Processor Controller driver
Message-ID: <20170726171155.GE20643@builder>
References: <20170710144220.31594-1-o.rempel@pengutronix.de>
 <20170710144220.31594-2-o.rempel@pengutronix.de>
 <20170710221408.GD1618@tuxbook>
 <91bfe236-0410-b26e-7ef6-73d14ebf120d@pengutronix.de>
 <20170718163814.GD20973@minitux>
 <ebaaf7ba-e177-0b90-bb0a-9371923bce44@rempel-privat.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ebaaf7ba-e177-0b90-bb0a-9371923bce44@rempel-privat.de>
To: Oleksij Rempel <linux@rempel-privat.de>
Cc: Oleksij Rempel <ore@pengutronix.de>, Oleksij Rempel <o.rempel@pengutronix.de>, devicetree@vger.kernel.org, kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Sun 23 Jul 22:56 PDT 2017, Oleksij Rempel wrote:

> Am 18.07.2017 um 18:38 schrieb Bjorn Andersson:
> > On Tue 18 Jul 01:45 PDT 2017, Oleksij Rempel wrote:
> >> On 11.07.2017 00:14, Bjorn Andersson wrote:
[..]
> >>> Also, as you warn about the user needing to pick the values for "ddr",
> >>> does that mean that it's a carveout of System RAM?
> >>
> >> Yes, it is a part of System RAM.
> >>
> > 
> > Then there will be an associated reserved-memory region for the
> > region(s), you should add a label to this and use "memory-region" to get
> > hold of the addresses instead.
> 
> Ok. Should only system memory region be assigned over reserved-memory or
> all of named regions?
> 

You can do it either way, but unless you see a strong reason against it
I would recommend just having a single region, for simplicity.

Regards,
Bjorn
