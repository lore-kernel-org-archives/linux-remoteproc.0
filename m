Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011011.outbound.protection.outlook.com [52.101.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8333F3D0C5;
	Fri, 19 Jul 2024 05:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721368232; cv=fail; b=BWEFet2v9E0IN3fPYzqvCcQUuQqsWY8Enn4B1Nu2cJLMsnbtHwq+FfqlrjQm+N5CR+lvkDu2Q6H+swGdU7LVXIdz3M2UloNXMcqdnC/RfxmLlaBu6AOkpp+FrPAkU25zAm9o62OBq31QPyghX6fSHNzQTPx/5O670o5lYA87Fr8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721368232; c=relaxed/simple;
	bh=k56DOfuqUXqnyvNm8NwkPTJy81h4z+GYk7Zl+iki9ss=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bSFG7/vIyp6nXFGqW07YIzu6h5GCaNMDGGBHOyjViP/RyM05da4kQH5YRM+t8uyw0Skz14PTMzBamPMleLYHiXAlJudy8QZWbGNUUYQQM8uLLDHo5IkjqAKcJN/GUyhk6ju1Exy21mGwg8ecHHdrrlN2Mo9LLSvnO8TN8iPClUU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=qkXHQAt4; arc=fail smtp.client-ip=52.101.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="qkXHQAt4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c+WA+6rxzghHl+PmHnpLzXjJ4IBsu1AkVkXKnRzzkqYcJS3vHWNrsyXesXHdGWWyRosX8bw2Juc1vASwkBqEYjbY+a3z85L2L9xCO6Enpb2SK7L8O/vFYK6XXbKGtDECUsyxI6I5MB4uwgwZDevFVXMJ9UFrUkgD/DhsGoe/xfItiGz8zZHG8gDPI2YOTfHwKzstLTW4uCZb88tzyQIuIxcaOa4j0NaaNQue/AWbIAxB0umpsgkBWKbcCPae8slTHVkoZdhuby98auakz8nMoVrr1bWYs6BkMIPnnC5voGCGs0ukVl/IW7NuFC/5gg0MP5BAMXGxU78gmposF8/iMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2xeDSEpZ6a05mgeKuZaluN5SwGN/2t5siOIhnCNuZkI=;
 b=hFQW+6AT1i/RzJ8PgvlUcnjbCHSlKXcfRcNDxV0y8OdGAMPuS21vr2+gj4wquLwMmhEjBoQFHGQRKyri+V1RlRYuP0LqrKlDW/FechpLWMtpoYDSV0a4fjs1tPzR41xQZAJiOZE1fQS1KsXiyfr2lYFtfemh7Yn898FPr9iO1SyFvC/Hu10TxASsL5obs5KK+gX79Q1hyXCIwPXALh3KFKDoceu3+whnsOyMxFVY86A72U37pxpRWNlq6gx9X5CzbKOswaGUU9FUOeWUY1xdk8xUS9C9JSYpQHHiBfyoFMuH3vpvY+Fn4Cec4TWb+3++Eh/YRJdHvWREUW45qJraXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2xeDSEpZ6a05mgeKuZaluN5SwGN/2t5siOIhnCNuZkI=;
 b=qkXHQAt4FXxfKPkkbtNFjH/ARq43fuFh5tAPQKlSqmDYYcLE5i7PU3RzlZ/rCTsDWM6fnlIi0xD+2NT5bWtBB/H5dhMBGWMWdtnPTRhOmdpLZT5nXcTujGkrjx46qeoOt6uzi45OjO2vRytWXQKBiqvaC2x78jKxdys2D3pB4R0=
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM7PR04MB7013.eurprd04.prod.outlook.com (2603:10a6:20b:116::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Fri, 19 Jul
 2024 05:50:27 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.7762.020; Fri, 19 Jul 2024
 05:50:27 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>, "Peng Fan (OSS)"
	<peng.fan@oss.nxp.com>, "marex@denx.de" <marex@denx.de>, Iuliana Prodan
	<iuliana.prodan@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>
CC: Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Hongxing Zhu
	<hongxing.zhu@nxp.com>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 4/6] remoteproc: imx_rproc: merge TCML/U
Thread-Topic: [PATCH 4/6] remoteproc: imx_rproc: merge TCML/U
Thread-Index: AQHa1DUnnPJUTNZdPkKxaso7bQ+e8bH5hSaAgAQRayA=
Date: Fri, 19 Jul 2024 05:50:27 +0000
Message-ID:
 <PAXPR04MB8459F24BFB860412DF5B1A7F88AD2@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20240712-imx_rproc-v1-0-7bcf6732d328@nxp.com>
 <20240712-imx_rproc-v1-4-7bcf6732d328@nxp.com> <ZpaU7TBfCQ7Tha1L@p14s>
In-Reply-To: <ZpaU7TBfCQ7Tha1L@p14s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|AM7PR04MB7013:EE_
x-ms-office365-filtering-correlation-id: f26e624d-e1f3-4ea2-8b87-08dca7b6b0fb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?j42k0TofduA3nnvHTT3XJXA6iDF8izs3c74Wl5SYdsoODx7ezOZIBdYGHwmh?=
 =?us-ascii?Q?t6UAsSyWlzj/hmy9sKpcVmxuakFvOLPWpJoWEAD+W9GQcNYPrnuCTLej5CKM?=
 =?us-ascii?Q?gN6wCyCfL+Ss6B7Ob/P6xHse9EYaP2+FQWhqrzL2Syz4B7OTpt5aEPy6xLJ+?=
 =?us-ascii?Q?DogYMb9VYQvi5T52f6WvfiK38rmzQrP8tJqIM1b5z7+ILl7CILTIKABxMrYu?=
 =?us-ascii?Q?GjqcSeCbbweOgmNeHc3757Qsf+uqxWKVo0+2HNmu83+OpBViA38Pva7qeKzl?=
 =?us-ascii?Q?5T2eJD5y4Y2Gpst8hMIIk1vxe1fMojDqYh5i4z+Fkv+B9xK/N23MHJIPFuFB?=
 =?us-ascii?Q?wWlf6ICUThxmEpFHFF4TKcDE2F/qY4705dXzTF9Ed4ygQy4ggB6z3Rdkdv2n?=
 =?us-ascii?Q?J7a847KMN+I2Ai1nvAIPa17WIAisfnSPNjktDmZpFMrsVqKvnlSQ+zaL5M5d?=
 =?us-ascii?Q?a4w4SQh3I+BHmLI5TapJ+K7ElXjd0Y+ZtIdo0qc/pwyv0zHGBVlTlEi8H3Jf?=
 =?us-ascii?Q?N/CZ1U/j3Fibq5cAw4FjehfjQ7t6ucTi0vG9NjNpsrqMzV/NcGdV/4RhPHCS?=
 =?us-ascii?Q?6y/xM++g5xPfgadIjG8Ok4P3as/yXOyaMlT+38Sj2oylyUb4I9GRZ7hoe9dR?=
 =?us-ascii?Q?BrVpLJSqBgCpfAVIuaNHpREtbMtS6QuDUUK66jHZFIHYCb7Vmfn4xwVOiEIo?=
 =?us-ascii?Q?utH36PIf7i9DoTGCdcrZA5FO979qs3GkuxEXHANPMN2/avW8NHDUcqMcdka/?=
 =?us-ascii?Q?3KgI9ggmofpD9gPt2l4JxwZGKiyq6YJyCcONewPxQmGdRoP/xDHtsy6bCxgI?=
 =?us-ascii?Q?DWrYyNqsSI+yFnyPrKABWkKXQmUWONG7h/02oZ0ARv0hYlPfKOAHOPQTcwa7?=
 =?us-ascii?Q?BZSuszLMuYIugz4mKMiL0lBtpjnO2RczgQo3yEx8JWgGzUoaktdggPnJLXIT?=
 =?us-ascii?Q?anGc/S5di1/GgZJjj5iHEtWIGIi0kkFrysbngouGE94cpIdK+ZRhE9NyDNCh?=
 =?us-ascii?Q?/FkH6JrT4CZKrJ9pWVdenlUX2JxAozF+szRtHZU+74aGafK8ns2oeGrbvzdH?=
 =?us-ascii?Q?B1eYC1FXVIo0iYCavXFErKxUM3v7MYQ/kvqSnP3gZmK8hWdwcTtwbt5L8Q3I?=
 =?us-ascii?Q?XaF5cQYfXxe9R0HxLFVUKSgVZtPsGwgsyRTm68cdpyEVpJtdMy4PNZmhUVGg?=
 =?us-ascii?Q?iRmIsiBv0sF+Ha2ap2W9s2zjnCbng0/gNLAWcfZJbwgnbFD6UTteojsbXml1?=
 =?us-ascii?Q?rYg8i/TuRPTEe+uHS2s4QWRBynTIdTlIMZY3kl+eY21JR7o2IMoq4et//B7o?=
 =?us-ascii?Q?aI/mLdTr4odOL5YPbgaQ4xLRh5bkaWvCvUJm6S/nndHxRCKK2SpoTFQOE0SX?=
 =?us-ascii?Q?+vR7gQ4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?ckp0t6KIqK5PMf4nMeH9mtBZNfrgc+7rUd8awO1Ob3ga8tz1/P1XP8JniWMf?=
 =?us-ascii?Q?Tatqv+SB5r8U/5LgLBdm51oUfTFK6BN6AboLC96LUy2GPILTA1uTkcR1opF5?=
 =?us-ascii?Q?ZaISoGYtsNQw1aNDrRFGOjowEUmwX617lROVnjMUX6nqjwY7jY2vIrWCh55c?=
 =?us-ascii?Q?2loSghZEJ5Gjr9QbTX8alud6onWXDttSSjQrvOTTlvmvQO4RSM3eFERtUStz?=
 =?us-ascii?Q?J4FyNRBAsJLdSNlHXi3nXxh9KxHb3xw4cf2NHEGgZMHSSE5JQaIlaxALcqqG?=
 =?us-ascii?Q?YPCXcDkgEN9BQDuDosoLOb5cHGCXz+c38KoL/jW3QSVNDc9Nq02zNQIV3Z8c?=
 =?us-ascii?Q?cXzOcIm0C+dM0JcxpFN+Bny+xBYduC/1AvJtSXdMGSFy2FrPS71x4ejJutuu?=
 =?us-ascii?Q?jZxqcAeiMtKzig9meWHuXCWqWkvlti3jOVCOAdmGuqOEfs62OBh/Odf9PyTX?=
 =?us-ascii?Q?wzDiQZq8tZzKhtqKXkdJ+qA89H47bmasqdNw2cWWxiREmFHiZa4plAAXXbzG?=
 =?us-ascii?Q?SySRye4grLVsj3lyJqZm2RK4PcSynRQ7FhDzUXWvmA9SDuZCeNlxTd4YKe33?=
 =?us-ascii?Q?wo9PhjEeVHKYEYxLsvIBmHXbhMXpqbFg8ihlvaN/JudRDORZd7GenaMyMnIN?=
 =?us-ascii?Q?Np4myEKSlesrskWN6/gV43+QEoUfC5E2nIxiyhVR8K/+X2YQcSEUNxmkM9ki?=
 =?us-ascii?Q?cAcjr6vwg41FcsSgMDnOWGGzceLmCjsCmmEISQdgLEqeSjE6tGbfJINvLAra?=
 =?us-ascii?Q?aIDn0vcQ7L13jTdjVdtxdhXyLK7rvrFs9+Mb4VBdKUkxtWEhJWcXKX1819zT?=
 =?us-ascii?Q?gut4b1hTxVgmSGXMEKpd0D4pTEucwjE4DTcN7RD8tPbJW7bxwhTp6++I9XNu?=
 =?us-ascii?Q?fR7m5fvvDtwVwgBIBRTEhuYrWGCOKdwno3d4oB840EydjzqSQVkWRUhUac7/?=
 =?us-ascii?Q?hUpoQR8ezkq+xIF61/LcFWDDT5g3uMiJmJhTwD2BvKDLPlNoI4b2nmJWieYv?=
 =?us-ascii?Q?RyNaNVBZDaP7DwK6ZEz6hzuGk7F/GerFWxUHmjBspa7whlBSR/CHS/RKmX+4?=
 =?us-ascii?Q?wVmfnzPI6KUY4WmsyeH3UxnwML8ov/boW1jEpKlbuWEcVofALT5Drq8BgIJV?=
 =?us-ascii?Q?xWghV6pFDLfsM5mVytT5I5KLeKYQ3v+arV5QwaCyMyuFKOqBLGdaD6sJR/5F?=
 =?us-ascii?Q?rheOK89UeGzrl4QEVgV1hYp+ryCw3xJ0URa/d0CjbfvWZ5PX2tF2ktsq7EWQ?=
 =?us-ascii?Q?CVd56Jrg8VPQ9W3wrq7kd6LaEwJ+x5e78xKupsjBVi+xRaDd1H8BOY3+DJA/?=
 =?us-ascii?Q?R5yTbhCQpzfRHW083hMcN1n2Y/xCznSwLXF6IG7OjkRiUn5vE4Es8E83ZFRc?=
 =?us-ascii?Q?f0JEEiMC5BuGLhOzGqfTU6EqZtkhCeOgKiA8hJCY6HldZ0TZFDzESp6ST1Ng?=
 =?us-ascii?Q?N9cVX1NGFMcy8fCPt1A9WEkA4mk+xId4DKs0Al6QSQprM7+E3cqJtCu6qBDz?=
 =?us-ascii?Q?v9WPYLEFkkoHV25ETl0m1SX6ZEaANZXm2Tpie3UBP5Xym1BWsSxOV/ObPAYh?=
 =?us-ascii?Q?FcpX791HvZDieYp/0z8=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f26e624d-e1f3-4ea2-8b87-08dca7b6b0fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2024 05:50:27.4708
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 71Y7HJd0TBhZICAXvdJk6VtEIGLWcd6JmKeEVh0HL5TGL0tLu5Hce9sBMY6o4CxFuBu7a7r7lS/rv2AA4SkrhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7013

> Subject: Re: [PATCH 4/6] remoteproc: imx_rproc: merge TCML/U
>=20
> On Fri, Jul 12, 2024 at 04:34:57PM +0800, Peng Fan (OSS) wrote:
> > From: Peng Fan <peng.fan@nxp.com>
> >
> > Merge contiguous TCML/U regions into one to avoid load elf files
> which
> > has large sections failure.
> >
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > ---
> >  drivers/remoteproc/imx_rproc.c | 18 ++++++------------
> >  1 file changed, 6 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/remoteproc/imx_rproc.c
> > b/drivers/remoteproc/imx_rproc.c index
> 9e99bb27c033..552fccebf7e2
> > 100644
> > --- a/drivers/remoteproc/imx_rproc.c
> > +++ b/drivers/remoteproc/imx_rproc.c
> > @@ -119,20 +119,16 @@ struct imx_rproc {  static const struct
> > imx_rproc_att imx_rproc_att_imx93[] =3D {
> >  	/* dev addr , sys addr  , size	    , flags */
> >  	/* TCM CODE NON-SECURE */
> > -	{ 0x0FFC0000, 0x201C0000, 0x00020000, ATT_OWN |
> ATT_IOMEM },
> > -	{ 0x0FFE0000, 0x201E0000, 0x00020000, ATT_OWN |
> ATT_IOMEM },
> > +	{ 0x0FFC0000, 0x201C0000, 0x00040000, ATT_OWN |
> ATT_IOMEM },
> >
> >  	/* TCM CODE SECURE */
> > -	{ 0x1FFC0000, 0x201C0000, 0x00020000, ATT_OWN |
> ATT_IOMEM },
> > -	{ 0x1FFE0000, 0x201E0000, 0x00020000, ATT_OWN |
> ATT_IOMEM },
> > +	{ 0x1FFC0000, 0x201C0000, 0x00040000, ATT_OWN |
> ATT_IOMEM },
> >
> >  	/* TCM SYS NON-SECURE*/
> > -	{ 0x20000000, 0x20200000, 0x00020000, ATT_OWN |
> ATT_IOMEM },
> > -	{ 0x20020000, 0x20220000, 0x00020000, ATT_OWN |
> ATT_IOMEM },
> > +	{ 0x20000000, 0x20200000, 0x00040000, ATT_OWN |
> ATT_IOMEM },
> >
> >  	/* TCM SYS SECURE*/
> > -	{ 0x30000000, 0x20200000, 0x00020000, ATT_OWN |
> ATT_IOMEM },
> > -	{ 0x30020000, 0x20220000, 0x00020000, ATT_OWN |
> ATT_IOMEM },
> > +	{ 0x30000000, 0x20200000, 0x00040000, ATT_OWN |
> ATT_IOMEM },
> >
> >  	/* DDR */
> >  	{ 0x80000000, 0x80000000, 0x10000000, 0 }, @@ -211,10
> +207,8 @@
> > static const struct imx_rproc_att imx_rproc_att_imx8mq[] =3D {
> >  	{ 0x08000000, 0x08000000, 0x08000000, 0 },
> >  	/* DDR (Code) - alias */
> >  	{ 0x10000000, 0x40000000, 0x0FFE0000, 0 },
> > -	/* TCML */
> > -	{ 0x1FFE0000, 0x007E0000, 0x00020000, ATT_OWN  |
> ATT_IOMEM},
> > -	/* TCMU */
> > -	{ 0x20000000, 0x00800000, 0x00020000, ATT_OWN  |
> ATT_IOMEM},
> > +	/* TCML/U */
> > +	{ 0x1FFE0000, 0x007E0000, 0x00040000, ATT_OWN  |
> ATT_IOMEM},
>=20
> Here too I will need an RB tag by Marek, Iuliana or Daniel.

BTW, downstream release code:
https://github.com/nxp-imx/linux-imx/blob/lf-6.6.y/drivers/remoteproc/imx_r=
proc.c#L142

Thanks,
Peng.

>=20
> >  	/* OCRAM_S */
> >  	{ 0x20180000, 0x00180000, 0x00008000, ATT_OWN },
> >  	/* OCRAM */
> >
> > --
> > 2.37.1
> >
