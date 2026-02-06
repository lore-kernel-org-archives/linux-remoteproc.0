Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013067.outbound.protection.outlook.com [52.101.72.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B00F33067A;
	Fri,  6 Feb 2026 03:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770349265; cv=fail; b=tiDpL5MOxSMs/jHu5c1kYzykLxBUJFToUQIA9jt9mhh/7noPFaQAB7gK/2vKoqGkoigsbEhPUQFA7/sJKva8MXJR6O/Vu2Aib0Bsdqibjt7qaUqW+cJI4R4RfB+sFOxUKEZo54owI3jtG6V6gC2uXs6uBgq3Haizq8SLQhWoVr0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770349265; c=relaxed/simple;
	bh=daokGMFzHAzanxPND+J6jfiPLGtJ/Qg1cGjhHoHmcoA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Na7Tq6lS/l1yutgt4JptuYjzcmDjb/YVkr77FiBOyshjISrVdqHdHzRiq7Vd7XoheJijI9YQeJLTgo7xk4QJfpFnAUYDPeol1sARGMWDDP2sZ+IqsEnlfAdVq2AQlqsQAOh5+0y9+R2ZdNuoloyHDGJYdYBOMX3PN+ZgvL1M9jM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=A35D+IeB; arc=fail smtp.client-ip=52.101.72.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="A35D+IeB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ThxbHsDK66D81vhb3abb72V9RpNDcsDz2R7x0roP5X+Q+cd8Zd5diBduNelVo1aCi4SFMNW6G708T29fqFhpY9nnB8mKfArzzdmd/PeefiO1y+PToHYW6XEGuRWEkqIRwMc7zGRMT3TNezHJeRXGmijyQ/9Fte47vaITUG0twWUjdHsn1f4H0roB3zcFNv7rZJpCwHB41b+O0D/5v7V4HF66+4EqOAKHhM69ghb7exxz7lcM+IQrbT145oqFGqOZIimBbUEj1ehN+UFdBgUzS7qXEQWoi5yV5oeBZ76uQANzxOoHuSxgnYvw0agOjfMLXSQBFkrtHNWmfVq8+ydu8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xqwUpwpoH16uUJzc2Umu7lzsJ/v4WE0clWGUz4MvJPA=;
 b=esgT+P2tdtcc9qh5xAN04av+Q69llXUBCvTnEfoT6yKOk42uERtfvuL5/I+xJuNQ+hbVS7zLEPfcPo2a/oKfrfKCeY0l64Yl1Iov68Qj4823qI6UQ93IiUCAIAfluTtg1YydYk0IXSiIVb5SUWWj5Z4RbOh0ljB3Lg9Hl4xXlKhtJmhiJxP1m20bs2NjK7fsWRfm2i0db+A7EPBaX63zmQx7p6Mbu8mkW+iSQTm10Np0MHj95j4OBaA+JXBcpE2sr68vpfC14QRmoWfaromlfRfhsSR4tcToNe23TO19t7LvMQENFnlJlJsORDdzY27q61g7Ub5pU2x1AwToDSmxuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xqwUpwpoH16uUJzc2Umu7lzsJ/v4WE0clWGUz4MvJPA=;
 b=A35D+IeBRNSF7we1B/kZcgZ00sgsh5h53UQXALpKAzqbWqkvfvASaQ3NbHTHTf6YwCa+zSazwLDN58TCzugZA9LLAZrzjxoWFc1jWsla4iDB2RBcGvgRDQSs/RZRt6GgRdbcpZkSUUDr2Kt1or8DdH7NOxJj2SDlC5jX+yuxaOG5WMQL1pYUHwfuJflpDKaUQiKY7n6kn4LGZVPef/YVrMjtKz5Qdl8jvuIXt7P8nAqN2ONK2IwSUcKthG2O446wRKcJ2opn1OBS8ZH2FM/d41kAhmDvbi1fj1MqHzAP9OFDUgq3urNdx9SOOt8NXsCWO87N3hjd9z0bYhPuCqe3xQ==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS4PR04MB9362.eurprd04.prod.outlook.com (2603:10a6:20b:4e7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Fri, 6 Feb
 2026 03:41:02 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 03:41:02 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Peng Fan <peng.fan@nxp.com>, Chen Ni <nichen@iscas.ac.cn>,
	"andersson@kernel.org" <andersson@kernel.org>, "mathieu.poirier@linaro.org"
	<mathieu.poirier@linaro.org>, Frank Li <frank.li@nxp.com>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de"
	<kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>
CC: "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] remoteproc: imx_rproc: Check return value of
 regmap_attach_dev() in imx_rproc_mmio_detect_mode()
Thread-Topic: [PATCH] remoteproc: imx_rproc: Check return value of
 regmap_attach_dev() in imx_rproc_mmio_detect_mode()
Thread-Index: AQHcll2pMFTvYKAP80u/OoIeFR6/IrV1BMzAgAACuAA=
Date: Fri, 6 Feb 2026 03:41:02 +0000
Message-ID:
 <PAXPR04MB845965AFE2E08959C4CCB2BF8866A@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20260205050905.3031134-1-nichen@iscas.ac.cn>
 <PAXPR04MB8459ABF483274720F6BB23188866A@PAXPR04MB8459.eurprd04.prod.outlook.com>
In-Reply-To:
 <PAXPR04MB8459ABF483274720F6BB23188866A@PAXPR04MB8459.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|AS4PR04MB9362:EE_
x-ms-office365-filtering-correlation-id: 004be7e7-3d85-4ec4-73bf-08de65318cc2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|19092799006|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?w933RpGaJbo5kTU4oiAVYmLZERPve3iukYztwJPN/1IEiyHE2/dzvb5jlqic?=
 =?us-ascii?Q?55FMH2eL79U1C2LgYlQpnK+W0cx8hbY6VdAyxnr143SSMJ3d9Mga1FhEduq0?=
 =?us-ascii?Q?YN0BxDdSoNYyhMYSdDDrmsO3HkDg0MZEPL3w1XzZSor/jgpaK3DD56HX1z83?=
 =?us-ascii?Q?BKeRGquvwlhpIwDvT/nXCEUF2Y/T2Ctb+P0yOzjboDyPjsmSmjf/c4are49v?=
 =?us-ascii?Q?qpoJcPKcOTUfAjwBIz5T7I9a2Yn5cBgEms1UtT3qbF7/CoM1uWP3DrYfs9SF?=
 =?us-ascii?Q?FdZmsO9bzc9oorZtCnKM50nk2Asy5VM/lG2z8TUVwybfhaFPcGFouKf3cBhZ?=
 =?us-ascii?Q?Sv83BGx4bKtvlJkEBPXNOv3PHLachbdTWniNR0WHdhScoiyAtMW/3cYCqiNr?=
 =?us-ascii?Q?qDvBwNw/7v+xmtG9QH6GN1U+q6q4DRX5acs3LjE9N7+500ySh7NAnQVe4/C8?=
 =?us-ascii?Q?H7JsJDNV7iW0uE8C8Rq9ZE3xsYT0mfgcloj0BD5zSCPQcf2UFJxviLEJlrwy?=
 =?us-ascii?Q?QlxBGSIQiaHR+O8wpF/BZQusjed4wvtA199mqpMgAQRhvFBBsIWK/BYkML+H?=
 =?us-ascii?Q?yrCEr6b/EUMZtNnym8Urun8umrizEOHIySQF+zjF2zqJmeiFuRJlBU91nP1G?=
 =?us-ascii?Q?MmMTFboXc7I3mqi4MsQrvduxFkEgITJXpdg9vSpNNRtmHbSlB1EQSL/OgWOo?=
 =?us-ascii?Q?iF8GFUinYlFjPVKj7+V797JDgV29uZHKbBhwvwg9/DIBL/rv5k24SkiGu5RO?=
 =?us-ascii?Q?qkAqQW7vzoaEO+z6HR8cjTwkq9n9k38cUVZKZcqy2K3z3SVhFJnrtOkQnvIY?=
 =?us-ascii?Q?AHpzDcOJYm7XecnVMsEwzCB8FsDZrvfk9s7FVB8MmIywimHP4pfhr29Rgleq?=
 =?us-ascii?Q?4xUfRkBhG1PY04qfGa3j1R34RwEoXfhGnEIrttSVXIMvhknsERNATQbwm9CD?=
 =?us-ascii?Q?ACAMPP21SYcY0ZpinMjyM+G5KLMlOmMZUn6qIq6GtYRkn834d78p80S20ah/?=
 =?us-ascii?Q?r2r/KpPW99sfyVxi+31zj1RnnCmUQs/N2WXkfpXkrgwcj6ULrqnGq57JlRVP?=
 =?us-ascii?Q?6Zp24/ThAc529Xqn9ytdIKdmD1kknuXrUtXLTZZP7Ded+Hp+6qhtpUUCv65k?=
 =?us-ascii?Q?7VHL8IJ9WmDPRJ9pHWPPWXg8F8ul+gjQmBJuTnHDJEpZRLQPfgc+65V/Ov7D?=
 =?us-ascii?Q?CFsGFO8DTUmV29h4olTXxRVvlfXO+9LhWz1ao5pqTa/amnbQaFmWbWwaN4gx?=
 =?us-ascii?Q?LXhDF2C5tQqDyANuYvg32JF0Kb/yFIg4Y/SXx5iTQBPNwtvkqP7Nj0kY47D9?=
 =?us-ascii?Q?5qruO01xl19jj1tji1P9A6hiiluTVSSDxCPbQOn2KekoJogCCa0VwZWqE5O1?=
 =?us-ascii?Q?6b5a3HXzA1ZbN53hUlFNfK24Xwg2m4LWovrzpMfd9qiA3MU69sx0meiiuAy2?=
 =?us-ascii?Q?cDgmNqBZOAwaEOwmmov8thddb1A4//qj9PED1CpHHMWGuxrM078UcE5pd5qn?=
 =?us-ascii?Q?dXixBsIjIQ+H9FVAZsGRMNmj+W0JZS2AynLrZT4Uc3xf4gZ+8Vdt5no6vSku?=
 =?us-ascii?Q?UJXWqRFWa49Euht15/vptCiYC0/evALQ3Jb2O7Sc?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(19092799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?VoxqLIvHyIRvXh0esKziMZDrLLRULLTZz9D9fo8BLF9XyGFgpUuv2VXMYfM5?=
 =?us-ascii?Q?R2/OdKYVSuA1x1T99LNOU2fOoWBjBe43PlQ2QdDaWobvAV3Rf+2ZJUfF1qyf?=
 =?us-ascii?Q?gVKP6M+InQSFLfLh1HZG/lquRHKRdzQAzf7iOP40aC9633L3H0m4zh0ld7dv?=
 =?us-ascii?Q?jpCsrVBmhQ23CQX7qIo5NkUc3FYhdElXQTLLR6l7nuWpx5ijpGsSddbtT8tP?=
 =?us-ascii?Q?k97lnuuHXAl2zVqQM71iM/oxgsesLcxj2zO870qfYVvo+sq1zPUpIhMLXACB?=
 =?us-ascii?Q?ivFCiEelgZ6OJHZKujchh+JktY/RmjywRN8Rt8lJ1aTrSgpOCTDT2KJ988/A?=
 =?us-ascii?Q?9S0pWkaSNIXWIKOxyNS+afm5oPmZ3k+6hMZFArWTtosDPcO9EY6smaM794ae?=
 =?us-ascii?Q?tk0B91LgBpWKiXPGv652toSxawy9plKX4E2CcT++o6fnahBjYwB5tuw6v7V3?=
 =?us-ascii?Q?Fl9IUW3XVeZXMejfWcwIPqxKT4ZF6KjGPmOzla11K0w/p2MN3lp9cR2KfaZD?=
 =?us-ascii?Q?N7ZxgajrYEinTyVKipkye5zg7FlENN4XFtX6GAUV+wvAg84TQZGlzpGA2yu8?=
 =?us-ascii?Q?12HpWZhPWES+ssTJtx677lbkDqM4EnyyTrTAU9J0/3Z7gLCZvqA077DeGoBx?=
 =?us-ascii?Q?lFn8lKs1nio/E4bpJh42DQmXcXh1636PQAuLMTA54r1r+u8LhuUkDz7vcpOG?=
 =?us-ascii?Q?HtSdRkvAKW5UN/3hO1M+wbzPaMXwov/XVgEKYeCOYbkNQ/sqSA5mioTPEsG6?=
 =?us-ascii?Q?LtoUbqgzusty5AVBhJgknOgachHkTzQXbKNhCFiVPlBd49LVE1qlBDlZp7AN?=
 =?us-ascii?Q?lgYfLwWFxGowBErMlshgOxLWA/0gqXD4LkO13/gR6iuHCoQRuHtOQbnWHB8K?=
 =?us-ascii?Q?mU0JTno9LsnDG3L/+r4vXiWNy2crZS7WQQ+eLPeDapXGDl7GxSnR1n1zaehd?=
 =?us-ascii?Q?5xtpoY0TfgXfC4X3XmF1Lh1Ujmzikm3c2BjCMCMpOghpy9pZwthqtY9ge1vP?=
 =?us-ascii?Q?RLs4gpQWdD/FiM3535KRoxB1Ktefp7MXycULWpVXWlrQDKERb+anq9hTHB9H?=
 =?us-ascii?Q?7LCS6fGvWWlIjLPajO8RwmGUGb0CN3qpUMxTTbZTh4o/blX8WIeT4LpSOxwi?=
 =?us-ascii?Q?semlYTb1Kz/0eJbx+SXC7yzAnQ+zJZ5VLHQC5U8NpuTBjXjzDpAoR38/NiIP?=
 =?us-ascii?Q?3LWX7yQrBBu0eSIMW7E2O+kKisTdorRaTjwJPCTGbFGe8jI6Xdt41v5fxZ4z?=
 =?us-ascii?Q?FJlBVS+yUekwn6w3LYXayBjpioou/7uUxdgjl8zUoWQoDD7iGek0ZIm+eGuo?=
 =?us-ascii?Q?alzhGwa5WKHOl4uXs9epTmS3YR383C98/KNyqM+odISFGK0P2+MnNL+JL65Q?=
 =?us-ascii?Q?37c7+ufevH+0pac1R27mT/4fs9PQ5jXYt4cJETNpps6VtFB4MLoe6C9BkoIX?=
 =?us-ascii?Q?IdZ+dzajr2SPS92LKtcT7l1cVkchyCPd2a4vFt34ZbMhqOQAEVgoltgIXl7U?=
 =?us-ascii?Q?mcUVSro40Qd2Qxa9yFoUyja50DcEpFr0anNZYxyKTYmf8zTTcKl5bThlGsek?=
 =?us-ascii?Q?lZZ9a4f7MLZOvLgtldxQGBYUTm3CX1nvVlslbXPIYAWMZ8h1Imx4CYCi5rZI?=
 =?us-ascii?Q?Dux1NlMXgU9REtyb582wafnSJ8BQRI8UUJ5VwdnADCWu0obY9cp3GYOUOV+T?=
 =?us-ascii?Q?vLBT+4k8vMjlkNdYyq9E2qxzHXR9m8r8JjPk5XHE6Z3US9B1?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 004be7e7-3d85-4ec4-73bf-08de65318cc2
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2026 03:41:02.2136
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YvCdXeLGAJzAtoPBmFKHuoD6F9fGc5zorbT5vdXBaNoMHs7rX9KbIffMGxydxMwFQVWFvma3bEuFJ3nsLs+Z9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9362

> Subject: RE: [PATCH] remoteproc: imx_rproc: Check return value of
> regmap_attach_dev() in imx_rproc_mmio_detect_mode()
>=20
> > Subject: [PATCH] remoteproc: imx_rproc: Check return value of
> > regmap_attach_dev() in imx_rproc_mmio_detect_mode()
> >
> > Add error checking for regmap_attach_dev() call in
> > imx_rproc_mmio_detect_mode() function to ensure proper error
> > propagation.
> >
> > Return the value of regmap_attach_dev() if it fails to prevent
> > proceeding with an incomplete regmap setup.
> >
> > Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> > ---
> >  drivers/remoteproc/imx_rproc.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/remoteproc/imx_rproc.c
> > b/drivers/remoteproc/imx_rproc.c index
> f5f916d67905..0e23f519c247
> > 100644
> > --- a/drivers/remoteproc/imx_rproc.c
> > +++ b/drivers/remoteproc/imx_rproc.c
> > @@ -1007,7 +1007,9 @@ static int
> > imx_rproc_mmio_detect_mode(struct rproc *rproc)
> >  	}
> >
> >  	priv->regmap =3D regmap;
> > -	regmap_attach_dev(dev, regmap, &config);
> > +	ret =3D regmap_attach_dev(dev, regmap, &config);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "regmap attach
> > failed\n");
>=20
>=20
> In the main probe, there is already dev_err_probe for detect_mode. So
> I would use below style as other error return in
> imx_rproc_mmio_detect_mode():
> dev_err("regmap attach failed\n");
> return ret;

BTW, as Philipp mentioned in [1].
dev_err_probe is unnecessary here

[1] https://lore.kernel.org/imx/fb5e20b7-b858-4099-ad8b-900c367e1b22@web.de=
/T/#mc9a0a582fae1c7a0e9a203691549dfa7bccfa8f8

Regards
Peng
>=20
> Let's wait Mathieu's view.
>=20
> Regards
> Peng.
>=20
> >
> >  	if (priv->gpr) {
> >  		ret =3D regmap_read(priv->gpr, dcfg->gpr_reg, &val);
> > --
> > 2.25.1
> >
>=20

