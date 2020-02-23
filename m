Return-Path: <peng.fan@nxp.com>
From: Peng Fan <peng.fan@nxp.com>
Subject: RE: [PATCH 5/9] remoteproc: imx_rproc: parse early-booted property
Date: Sun, 23 Feb 2020 00:11:51 +0000
Message-ID: 
 <AM0PR04MB4481882E603D1C83C637183788EF0@AM0PR04MB4481.eurprd04.prod.outlook.com>
References: <1582097265-20170-1-git-send-email-peng.fan@nxp.com>
 <1582097265-20170-6-git-send-email-peng.fan@nxp.com>
 <20200221215605.GC10368@xps15>
In-Reply-To: <20200221215605.GC10368@xps15>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: "ohad@wizery.com" <ohad@wizery.com>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, dl-linux-imx <linux-imx@nxp.com>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

> Subject: Re: [PATCH 5/9] remoteproc: imx_rproc: parse early-booted proper=
ty
>=20
> On Wed, Feb 19, 2020 at 03:27:41PM +0800, peng.fan@nxp.com wrote:
> > From: Peng Fan <peng.fan@nxp.com>
> >
> > If early-property exists, there is no need to check syscon.
> > Just mark early_boot as true.
> >
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > ---
> >  drivers/remoteproc/imx_rproc.c | 18 +++++++++++-------
> >  1 file changed, 11 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/remoteproc/imx_rproc.c
> > b/drivers/remoteproc/imx_rproc.c index b9fabe269fd2..e31ea1090cf3
> > 100644
> > --- a/drivers/remoteproc/imx_rproc.c
> > +++ b/drivers/remoteproc/imx_rproc.c
> > @@ -483,7 +483,9 @@ static int imx_rproc_configure_mode(struct
> imx_rproc *priv)
> >  	int ret;
> >  	u32 val;
> >
> > -	if (of_get_property(dev->of_node, "early-booted", NULL)) {
> > +	if (dcfg->variants =3D=3D IMX7ULP) {
>=20
> Where does dcfg->variants comes from?
>=20
> This patch doesn't compile, nor does the one before it.  I will not revie=
w
> another patchset like that.

Ah. Weird. variants should be variant.=20
See https://patchwork.kernel.org/patch/11390559/

I need wait early boot related functions in
remoteproc-core.c ready, then post v2.

Thanks,
Peng.
>=20
> > +		priv->early_boot =3D true;
> > +	} else if (of_get_property(dev->of_node, "early-booted", NULL)) {
> >  		priv->early_boot =3D true;
> >  	} else {
> >  		ret =3D regmap_read(priv->regmap, dcfg->src_reg, &val); @@ -509,15
> > +511,17 @@ static int imx_rproc_probe(struct platform_device *pdev)
> >  	struct rproc *rproc;
> >  	struct regmap_config config =3D { .name =3D "imx-rproc" };
> >  	const struct imx_rproc_dcfg *dcfg;
> > -	struct regmap *regmap;
> > +	struct regmap *regmap =3D NULL;
> >  	int ret;
> >
> > -	regmap =3D syscon_regmap_lookup_by_phandle(np, "syscon");
> > -	if (IS_ERR(regmap)) {
> > -		dev_err(dev, "failed to find syscon\n");
> > -		return PTR_ERR(regmap);
> > +	if (!of_get_property(np, "early-booted", NULL)) {
> > +		regmap =3D syscon_regmap_lookup_by_phandle(np, "syscon");
> > +		if (IS_ERR(regmap)) {
> > +			dev_err(dev, "failed to find syscon\n");
> > +			return PTR_ERR(regmap);
> > +		}
> > +		regmap_attach_dev(dev, regmap, &config);
> >  	}
> > -	regmap_attach_dev(dev, regmap, &config);
> >
> >  	/* set some other name then imx */
> >  	rproc =3D rproc_alloc(dev, "imx-rproc", &imx_rproc_ops,
> > --
> > 2.16.4
> >
