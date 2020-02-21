Return-Path: <peng.fan@nxp.com>
From: Peng Fan <peng.fan@nxp.com>
Subject: RE: [PATCH 0/9] remoteproc: imx_rproc: support i.MX8/8M/7ULP
Date: Fri, 21 Feb 2020 07:08:57 +0000
Message-ID: 
 <AM0PR04MB4481DFEF5C53E3B749496FDB88120@AM0PR04MB4481.eurprd04.prod.outlook.com>
References: <1582097265-20170-1-git-send-email-peng.fan@nxp.com>
 <20200221065140.mn4wxk5c2xayqwan@pengutronix.de>
 <AM0PR04MB4481C4C811F139665AB1C54088120@AM0PR04MB4481.eurprd04.prod.outlook.com>
 <20200221070303.kndekskjj6cvwtkb@pengutronix.de>
In-Reply-To: <20200221070303.kndekskjj6cvwtkb@pengutronix.de>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: =?iso-8859-1?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, "ohad@wizery.com" <ohad@wizery.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "festevam@gmail.com" <festevam@gmail.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-ID: <linux-remoteproc@vger.kernel.org>

> Subject: Re: [PATCH 0/9] remoteproc: imx_rproc: support i.MX8/8M/7ULP
>=20
> Hello,
>=20
> On Fri, Feb 21, 2020 at 06:56:02AM +0000, Peng Fan wrote:
> > > Subject: Re: [PATCH 0/9] remoteproc: imx_rproc: support
> > > i.MX8/8M/7ULP i can't apply your patches on kernel master HEAD. Do I
> need some extras?
> >
> > The patchset is based on Shawn's for-next branch. With Loic' V4 patch
> > applied as showed in cover-letter.
>=20
> BTW, the generic approach to formalize that is using --base to
> git-format-patch (or git-send-email). See

Thanks for tips. I'll follow when do new patches.

Thanks,
Peng.

> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fpeopl=
e
> .kernel.org%2Fmonsieuricon%2Fall-patches-must-include-base-commit-info&
> amp;data=3D02%7C01%7Cpeng.fan%40nxp.com%7C9cd4c63fe8974353439408
> d7b69c1b2f%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C63717
> 8653890207488&amp;sdata=3D6fvjPjemWlSzZVcDMqWPtjuyEFdOBOttGcO7bS
> uxsyY%3D&amp;reserved=3D0
>=20
> Best regards
> Uwe
>=20
> --
> Pengutronix e.K.                           | Uwe Kleine-K=F6nig
> |
> Industrial Linux Solutions                 |
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww.
> pengutronix.de%2F&amp;data=3D02%7C01%7Cpeng.fan%40nxp.com%7C9cd4c
> 63fe8974353439408d7b69c1b2f%7C686ea1d3bc2b4c6fa92cd99c5c301635%
> 7C0%7C0%7C637178653890207488&amp;sdata=3D1XRpT97ML%2FLpYjdbZb%
> 2BTdp6DfW6FSMq0Jnxv%2B7%2BX59Y%3D&amp;reserved=3D0 |
