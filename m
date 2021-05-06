Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,PDS_BAD_THREAD_QP_64,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 214E8C433ED
	for <linux-remoteproc@archiver.kernel.org>; Thu,  6 May 2021 04:11:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EEDA761008
	for <linux-remoteproc@archiver.kernel.org>; Thu,  6 May 2021 04:11:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231283AbhEFEMr (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 6 May 2021 00:12:47 -0400
Received: from mail-eopbgr50074.outbound.protection.outlook.com ([40.107.5.74]:8566
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229756AbhEFEMr (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 6 May 2021 00:12:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JHyfyvURTZV4Avg8HHind6Gfde2EO0oOU+hsA9qkovb5cvTY1EavrJUjAveHwPp1mLYxh1y6SNAd0XJXPHOaJANmjQH/HmXnlljAhJXXqM4rRaAiDLfIvXe0eSAFDIH8jEjSWkudTbeJh9eJchTr/vnINdqzgav/Pg3dVAJ/kJeyOtSiuRQzLJGRtgztZatENVZ/f7RT6f7FlNcG9//9g/k4tjHrojE6aiTtMnC2fUd9lYUslW0ehIti91fW1sIFbFID1VUVVz+vCSJmpxs39XBjAz/nh8KYxWD5CvPohEcTTMF8eO8cM7dTIN8pNtCamzGugzwEULU2jMCpPFkdlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p+gQwfy+M1VVyrtjnI0AZSn4l+th0u8/XFU4xuSAeP0=;
 b=OzlDZ8zLevErOrMC/JG57fpLot1c1EMNc0oOk84RrbZ9CXGRWaQf5k27T9/7ehbti+s+UI1jyCq/GQ3RAEa/QQwy3wqNjaF7hH3QRc5ofmR7PShTrCPEHGnkQkVqWUCXUQlkmNFG8Xz8vK/uh8a1OSbv0HEgJZ9bTBkqdsOXEyf7C20glSyelBzrPAWAvID4zqAsB8QLx779O2eASwjICGyB820drk5d8Jh4h30tXUQq8zTCjIrXCixyKijGnZdtPUnbUIuzCe5lbhxx2bWsCUdiUBv/KzLEBdvmW673+HdmaQIupVpzhdEN2sZp9/7BPjU+fk/ZIB83YVfeyVK4uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p+gQwfy+M1VVyrtjnI0AZSn4l+th0u8/XFU4xuSAeP0=;
 b=h48ZTwvzjukgQ+tIw5cin1GxjmsN1yEiRent1aNMdhYczQDw/Nh/TAf72Qska8h8j8GbSd0NoAeJUoZpgTcpDoCdx9U5uoz6771jcFU66H78q+wVyC3YH+LL4Q6H30woDd5dTvDZWkGzkBxixyw07yPY4xYxzKt78Xh1PbxLzj0=
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB6PR0401MB2376.eurprd04.prod.outlook.com (2603:10a6:4:51::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.41; Thu, 6 May
 2021 04:11:47 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::45b9:c993:87ec:9a64]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::45b9:c993:87ec:9a64%8]) with mapi id 15.20.4065.039; Thu, 6 May 2021
 04:11:46 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
CC:     "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "o.rempel@pengutronix.de" <o.rempel@pengutronix.de>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH V5 7/8] remoteproc: imx_rproc: support i.MX7ULP
Thread-Topic: [PATCH V5 7/8] remoteproc: imx_rproc: support i.MX7ULP
Thread-Index: AQHXNlcbdnM4ul09mECETdVhOJQp4KrSBlOAgAPoqiA=
Date:   Thu, 6 May 2021 04:11:46 +0000
Message-ID: <DB6PR0402MB2760B8377D023ACFFED9F51988589@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <1618971622-30539-1-git-send-email-peng.fan@oss.nxp.com>
 <1618971622-30539-8-git-send-email-peng.fan@oss.nxp.com>
 <20210503162935.GB1699665@xps15>
In-Reply-To: <20210503162935.GB1699665@xps15>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [92.121.68.129]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d0104854-1e9a-43a3-4075-08d9104510c1
x-ms-traffictypediagnostic: DB6PR0401MB2376:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB6PR0401MB2376B1784566522833400D4B88589@DB6PR0401MB2376.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Jv7WQFT8vtYVGGStlGXHp9X9uD7OZki/++bWwhlLsoKOC2U8JCJLiI9Ll/R8xQN7dmm82s/fAzDlXrOEQnm5zzVa3kfaVZ/ZEWneh7EuVlOiMHhuGZ70rM77OCuMOklDGdPXDbjApn71apaOYAdrzar7EbmJ6tzQhbJUOk7S20qQ9ON9A+8bfjABDm69JjT1WPPZWU9IqO57ymrCHAPkWD391ZrfwiVpS/G2mymBOBEg6LMBtehBXY/QL4sWY8ABjvw+FuYn9oQaMg8+ozRdA0eemJmRknqRqyAbsTr9rEqyhYALJcr6Pj/RJo5aOuuScR1IXt6DZgRtlC74+pWR3YLSi2n7/Y7JUVM3Vw+14BP93RmX+2hmf61AD/A+mn6nCeUUGKpT815ucDzaegzcCl4wi+Zej8FuPjo/L4CIyDSbFdq5nTfg31lr+RBTVfjs3YMehoUzlmgzrKwh+R/rESE0nXm25wdGX1DYNr3bbXzu6urGVM905NG7S0lbH72+KdBosE5hFU+jSdaNy4IszMZQp+ayEm1E8wBjGpJwEetwu9bg1n1J6xgLDl7/giQjle54GAcjGfAqpbuf8YJPq190OlvSV6KmBB/B/RxxJVc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(396003)(376002)(39850400004)(366004)(66446008)(64756008)(83380400001)(76116006)(8676002)(7696005)(2906002)(54906003)(33656002)(86362001)(5660300002)(8936002)(44832011)(478600001)(55016002)(66556008)(66476007)(9686003)(38100700002)(52536014)(186003)(316002)(26005)(4326008)(7416002)(110136005)(122000001)(71200400001)(66946007)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?6TliBCz+quSe2WUuRb0rjfo+5u5B78AXNMxJVCNpgAchjIRO0bZ3UCxkDK+E?=
 =?us-ascii?Q?aR+8NS7iS7Fwqyna+EmX1qTxLiyZemDXnPqTHBk8YZjDaGIW6VGiW/F1qWQV?=
 =?us-ascii?Q?PKfNDN+0t9u6RXZUkHK4wSf8Q6uB4YFKCg0IoKTdr2mCMUhb6OGwVFJxnGka?=
 =?us-ascii?Q?Pvb90PkBWfsKNiAZR7u6cSgEfOtbbWn235svWCg9klShR1JVAepeXGEYzgR3?=
 =?us-ascii?Q?vbg3w15exJLRx6XC3HLdrJa7PmHWqXPj1Rhm6QmsmQVnU6lT67IQgiIPIGxF?=
 =?us-ascii?Q?+twFMO1BO/ztrs6p2r+9k2vBmE35cuLo2PProycAOU5Fy7A6XT94M/nwkgEQ?=
 =?us-ascii?Q?lpgT5qMnHwU9WhYBRVpADx8pVDpuXFA00fAjr+bGmShr1Rl2/6IYd3lV7EUX?=
 =?us-ascii?Q?n1iyGwwnLuMDATcyzKCiEJgW7J+FZ+TDkPI6kM7YrDNjsqsWJxTRJ344Ju1Z?=
 =?us-ascii?Q?3jsvPYucW/gf5inx0zCvWFOk/49Bql5QzClxMxeqVDJMynhIx1iuwPV9MO0s?=
 =?us-ascii?Q?RpXJCU9cz1xKFLnqFIduYekdbXKiCE2pQCR595f+XdlZIBibQcZyQSq0oXar?=
 =?us-ascii?Q?AsQt+nSRaZBIUjvBO2HD83m2amhJ0SO8HqjLTW4B9ljJiWdy7/HQ40KHdwx+?=
 =?us-ascii?Q?lo04pZqHMRuSr53SmRp+4JfbVGsyr8rjbrHoMi8gW59vGOHVxpZJ2w4LK5HZ?=
 =?us-ascii?Q?k5CnuD56A4Vuo0Ja6vdfLYL9GOyAZkhWH5qhGfMRro4YdV0KjYYdmCPOTUka?=
 =?us-ascii?Q?RY7sRTL3VDKzz4AXq2mrxXUl4+Hryi10YJqG9R3DH4/qsWg3PDC2+uaHSlY9?=
 =?us-ascii?Q?tImAHGxX9MkeADKDex0LJGOTG0ISQCXvGiVGwwTaQ8smQ76wwWtmZ2GM6MY3?=
 =?us-ascii?Q?Ljr0kkyTKFY7Nfp5VdwwH/fMTNXuFfWTEx2RBVrNsOodYeJtEFNK9zQLCx0f?=
 =?us-ascii?Q?wZN2RjJsqSDhZJNxcj/B9W9bPBA2ak+wPXwWJFzJcFFM/hmqpJ+xt0qWpV6F?=
 =?us-ascii?Q?KrZ9JeXG2o1gX0INGk2MJb5wzgEITvxjepSTzY/bIPwiNVWc2er2vDHeqaFY?=
 =?us-ascii?Q?tBYzHYYEI4JUG8fVOu0+H/49kLgRLRB0r4OPGgaAV+GGTfLorb7GGQQcU3SE?=
 =?us-ascii?Q?kFkaJx9wgykbqAt2bTcDYnHGNu9QciSgJuq3EA9SO25we9Pg/FPqzLGhibUE?=
 =?us-ascii?Q?BL8BQgPacvlSbFEaDJvX+DcB/gXb56lnuPa52R1Pp/HxgIuiKHdt3lBjjbg4?=
 =?us-ascii?Q?lfFFHNc0FBlomo9HQXEazG9Nw9JqQTVYVwN47m/l2+ocg6i37sk1t/jDCZt0?=
 =?us-ascii?Q?jAN0JzDu868/kvQNijxcrsOV?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0104854-1e9a-43a3-4075-08d9104510c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2021 04:11:46.7495
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C4jLiuvXA+E6+FW18+YVN9hlgzAEweSs4n+2t9awwLPHUWbeLUteoT9CqoYivK7HJbf5MZDm2wqa4ed/quyt4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2376
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

> Subject: Re: [PATCH V5 7/8] remoteproc: imx_rproc: support i.MX7ULP
>=20
> On Wed, Apr 21, 2021 at 10:20:21AM +0800, peng.fan@oss.nxp.com wrote:
> > From: Peng Fan <peng.fan@nxp.com>
> >
> > i.MX7ULP A7 core runs under control of M4 core, M4 core starts by ROM
> > and powers most serivces used by A7 core, so A7 core has no power to
>=20
> s/serivces/services
>=20
> I pointed that out on V4 - why do I have to do so again?

I forgot that comment, sorry. Thanks for your time.

Thanks,
Peng.

>=20
> With that:
>=20
> Reviwed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
>=20
> > start and stop M4 core. And the M4 core's state is default
> > RPROC_DETACHED and remoteproc framework not able to stop the M4
> core.
> >
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > ---
> >  drivers/remoteproc/imx_rproc.c | 49
> > ++++++++++++++++++++++++++--------
> >  1 file changed, 38 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/remoteproc/imx_rproc.c
> > b/drivers/remoteproc/imx_rproc.c index e9d9860e4fce..d26254609a52
> > 100644
> > --- a/drivers/remoteproc/imx_rproc.c
> > +++ b/drivers/remoteproc/imx_rproc.c
> > @@ -136,6 +136,14 @@ static const struct imx_rproc_att
> imx_rproc_att_imx8mq[] =3D {
> >  	{ 0x40000000, 0x40000000, 0x80000000, 0 },  };
> >
> > +static const struct imx_rproc_att imx_rproc_att_imx7ulp[] =3D {
> > +	{0x1FFD0000, 0x1FFD0000, 0x30000, ATT_OWN},
> > +	{0x20000000, 0x20000000, 0x10000, ATT_OWN},
> > +	{0x2F000000, 0x2F000000, 0x20000, ATT_OWN},
> > +	{0x2F020000, 0x2F020000, 0x20000, ATT_OWN},
> > +	{0x60000000, 0x60000000, 0x40000000, 0} };
> > +
> >  static const struct imx_rproc_att imx_rproc_att_imx7d[] =3D {
> >  	/* dev addr , sys addr  , size	    , flags */
> >  	/* OCRAM_S (M4 Boot code) - alias */ @@ -196,6 +204,12 @@ static
> > const struct imx_rproc_dcfg imx_rproc_cfg_imx8mq =3D {
> >  	.method		=3D IMX_RPROC_MMIO,
> >  };
> >
> > +static const struct imx_rproc_dcfg imx_rproc_cfg_imx7ulp =3D {
> > +	.att		=3D imx_rproc_att_imx7ulp,
> > +	.att_size	=3D ARRAY_SIZE(imx_rproc_att_imx7ulp),
> > +	.method		=3D IMX_RPROC_NONE,
> > +};
> > +
> >  static const struct imx_rproc_dcfg imx_rproc_cfg_imx7d =3D {
> >  	.src_reg	=3D IMX7D_SRC_SCR,
> >  	.src_mask	=3D IMX7D_M4_RST_MASK,
> > @@ -238,6 +252,9 @@ static int imx_rproc_stop(struct rproc *rproc)
> >  	struct device *dev =3D priv->dev;
> >  	int ret;
> >
> > +	if (dcfg->method =3D=3D IMX_RPROC_NONE)
> > +		return -EOPNOTSUPP;
> > +
> >  	ret =3D regmap_update_bits(priv->regmap, dcfg->src_reg,
> >  				 dcfg->src_mask, dcfg->src_stop);
> >  	if (ret)
> > @@ -573,12 +590,31 @@ static void imx_rproc_free_mbox(struct rproc
> > *rproc)
> >
> >  static int imx_rproc_detect_mode(struct imx_rproc *priv)  {
> > +	struct regmap_config config =3D { .name =3D "imx-rproc" };
> >  	const struct imx_rproc_dcfg *dcfg =3D priv->dcfg;
> >  	struct device *dev =3D priv->dev;
> > +	struct regmap *regmap;
> >  	int ret;
> >  	u32 val;
> >
> > -	ret =3D regmap_read(priv->regmap, dcfg->src_reg, &val);
> > +	switch (dcfg->method) {
> > +	case IMX_RPROC_NONE:
> > +		priv->rproc->state =3D RPROC_DETACHED;
> > +		return 0;
> > +	default:
> > +		break;
> > +	}
> > +
> > +	regmap =3D syscon_regmap_lookup_by_phandle(dev->of_node, "syscon");
> > +	if (IS_ERR(regmap)) {
> > +		dev_err(dev, "failed to find syscon\n");
> > +		return PTR_ERR(regmap);
> > +	}
> > +
> > +	priv->regmap =3D regmap;
> > +	regmap_attach_dev(dev, regmap, &config);
> > +
> > +	ret =3D regmap_read(regmap, dcfg->src_reg, &val);
> >  	if (ret) {
> >  		dev_err(dev, "Failed to read src\n");
> >  		return ret;
> > @@ -625,18 +661,9 @@ static int imx_rproc_probe(struct platform_device
> *pdev)
> >  	struct device_node *np =3D dev->of_node;
> >  	struct imx_rproc *priv;
> >  	struct rproc *rproc;
> > -	struct regmap_config config =3D { .name =3D "imx-rproc" };
> >  	const struct imx_rproc_dcfg *dcfg;
> > -	struct regmap *regmap;
> >  	int ret;
> >
> > -	regmap =3D syscon_regmap_lookup_by_phandle(np, "syscon");
> > -	if (IS_ERR(regmap)) {
> > -		dev_err(dev, "failed to find syscon\n");
> > -		return PTR_ERR(regmap);
> > -	}
> > -	regmap_attach_dev(dev, regmap, &config);
> > -
> >  	/* set some other name then imx */
> >  	rproc =3D rproc_alloc(dev, "imx-rproc", &imx_rproc_ops,
> >  			    NULL, sizeof(*priv));
> > @@ -651,7 +678,6 @@ static int imx_rproc_probe(struct platform_device
> > *pdev)
> >
> >  	priv =3D rproc->priv;
> >  	priv->rproc =3D rproc;
> > -	priv->regmap =3D regmap;
> >  	priv->dcfg =3D dcfg;
> >  	priv->dev =3D dev;
> >
> > @@ -720,6 +746,7 @@ static int imx_rproc_remove(struct platform_device
> > *pdev)  }
> >
> >  static const struct of_device_id imx_rproc_of_match[] =3D {
> > +	{ .compatible =3D "fsl,imx7ulp-cm4", .data =3D &imx_rproc_cfg_imx7ulp=
 },
> >  	{ .compatible =3D "fsl,imx7d-cm4", .data =3D &imx_rproc_cfg_imx7d },
> >  	{ .compatible =3D "fsl,imx6sx-cm4", .data =3D &imx_rproc_cfg_imx6sx }=
,
> >  	{ .compatible =3D "fsl,imx8mq-cm4", .data =3D &imx_rproc_cfg_imx8mq }=
,
> > --
> > 2.30.0
> >
