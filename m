Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013002.outbound.protection.outlook.com [52.101.72.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F8C29AB02;
	Mon, 15 Dec 2025 11:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765797193; cv=fail; b=OwoXX9hNbjHne8/hHQlUeol/Oy47wm9oNyITZ6NllTduJrQ1XRNYNv8zLzO5bfBDOlRq7fW0WgeA4LaZ4P4sfQkMkPr/96HNG1IWdMaQ8/sSttt7cTh8nWuYsqw06I4393a1CTQvs9eMHiD1JPEIL23l1TyRGVjpGZ4xGR46/YE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765797193; c=relaxed/simple;
	bh=BbDY9elopIDhn8ehtP84o0t8JK0x4RxD5+NUR89YoFk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fc2KQh7p2Am48QrLO8hz4Pnd100B0OS4BurU+YQcudKIKC0oOSAuzhEy7gZaolWlH1Mi4EbViUNYqhqAcPMf/Keu/Oqshfw4uZeJZDaSB84yaF732IWFQ0LMkqIBGBXWfYai4skfzOp0cG6ea6EqleMQbyjvxCSMswabwxiL0hg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Lydco5D8; arc=fail smtp.client-ip=52.101.72.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Lydco5D8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qzWfw3pFXB7DT6WKRpdCc8oo0agtKeoGNEAR+T/i8cYOn1Um+w5dqAlEjc/SWQOm/OGrZTxO9v4evngbwGo6ghW5504p+znEyz40x69w3DBbnG1rfGYZ8kHf8xWGfLGOYRuBrh7VmmRU3cCi4GWhXI4yyoVoDDeV636QFI63hnBky9tS8Z0QYk6lTec/QFHjnwf3RZtcJypeexcRgNCi1SWJx4N3ZnC8xgZhwx8sNJpNiWoEWU6GiTViQ5fEfSKZnNOBeUoj1xXltorVlwSnGYYGl3xbv3ewqZeK/XESVF3PacFe2QcqrodjAltFmrfZcHjXL9cxCa14WnLwuty5ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BxTMSnzDut4iGwZqwZ3AZm5wntN1G37oLh+yDnOFfjQ=;
 b=xqRQM7fyUu4zBCn9GyUjn1oHKqYXPSoMM9WAIJr1BHOdQxF3OtOQDF0g/tr4XqiJnbXoYCMYEMIof1BsNgrNg8eKW6EKR+F2QKOVoMF5QN4uDiQklUTzi6WRIzgwd6NX0PkmaIalGvIBNDJe9xBQJHFIcTK+fmWMVzEatv+s9hMaxpJ2BYp5QW3dx4UK8Iu9eqEHtEPnEcTiQ3tGhulQ8fKQ8xiYQtfK+EmilOge3+oRHTlh9IX2AdyFCDapHkYodo5FbBRphXr0qwTQOR+X31wElC9U8Lje6qxbgUnZd/emaJZ45pbXTHTHMcnZj6gFyd1Yew4ZLd4DHC88gFwW9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BxTMSnzDut4iGwZqwZ3AZm5wntN1G37oLh+yDnOFfjQ=;
 b=Lydco5D8B+skRJivDVRcwKvmaFnfJgmFTFobZAcXNgo1APLgCbYxSxQCm3wP+kmqv4jJbYHBsde1Itkj+JYaUctI9Gyp3BIphTkZzREJDmNNAgNepoyiCE8zOvquH0EpvGQP05Ux6hjWHxuimU039tjg4IixiWhz3cEy8oqjXLvLTkN4Yo0thxw6kyItUhh/r2HbNf00j5aTD15qpzInz/yfo0LEimYwz4cvx9BzT96hnXn3AOOAUGL7WzcEz5w1/RCPDuc1l+uiS77ipG2CroK40cU6M1NC57Ij+kKMB3h/W4IcObJ6FAM/4niatRS/7iETEapyVTm6ERUErRN1rg==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU0PR04MB9659.eurprd04.prod.outlook.com (2603:10a6:10:320::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 11:11:48 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 11:11:48 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>, Shenwei Wang
	<shenwei.wang@nxp.com>
CC: Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH] remoteproc: imx_rproc: Use strstarts for "rsc-table"
 check
Thread-Topic: [PATCH] remoteproc: imx_rproc: Use strstarts for "rsc-table"
 check
Thread-Index: AQHcaJsRpvSgZG43WEGbv/V//qPUhbUiAVaAgACTi1A=
Date: Mon, 15 Dec 2025 11:11:47 +0000
Message-ID:
 <PAXPR04MB8459542CF892C802061E162688ADA@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20251208233302.684139-1-shenwei.wang@nxp.com>
 <aT9wP_3olsf7WbPL@p14s>
In-Reply-To: <aT9wP_3olsf7WbPL@p14s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|DU0PR04MB9659:EE_
x-ms-office365-filtering-correlation-id: 9cf5dc1e-1ac1-4f02-6954-08de3bcabd5c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|19092799006|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?I7rb/+6PZQDT9l1ywzcwUkB0am7Ywis5cD1AapwZqkb//B6ppVKXTG2quXHj?=
 =?us-ascii?Q?JfbKjw8Bli7j49OP8z+O+3dryhyMWPbEPUJQUde41OEtrokFHPrlcyGmJgV5?=
 =?us-ascii?Q?us/nSV5mzxgGKkheSFPhZJfPblaqtG3uvlP1cylf98iFFppgtSYooiqTHgap?=
 =?us-ascii?Q?AaQJskSwGIU+gxTDb/FnCZmyMwkyUAPlKePVrW98pWvP9jw++7xvK31lQi9R?=
 =?us-ascii?Q?QOoKvMW8RnUyfH6P+ce03Y8H36uNreonktL+raV5Dd2Hqd3kjztqVcyFPIZV?=
 =?us-ascii?Q?FchFfhcf4GXF32kuw7X+FCqOx1qPwCsBPT6jrsHQPgPvxZGVI/Cg/5dN9UZZ?=
 =?us-ascii?Q?IKqRKGcyedzbwDG/rzKKmIRCqkRjv5GhjTzozHR3QVvLoJoNs4P+RvYboUqD?=
 =?us-ascii?Q?CMrDLJXw3ZS7wq55wZdeRExS2QQiGR5Ei3TNOISPhEuRl1X09ru8GKR57Q7c?=
 =?us-ascii?Q?mN/LWco/d1vU+LJE6FFNtebZa4CDDY8MlZ244huBs3FQuHLMGpJyf1JMroyt?=
 =?us-ascii?Q?VcUikobhzSklGTmL+uKmLzLcl8dYmRtrxqk1OL33tGZI6hXzMjKgZrvL4Xd+?=
 =?us-ascii?Q?i2BO8/ecRF8OyJFM8SjyPlDlSG/woY0j1MSc/1xrY67rRa8bHu38/g0VynwG?=
 =?us-ascii?Q?CIDpB5az7Ghtn/w/WaSvmBlMNEVxeABVA8MIm8i0h4OrevrWlQ3M1SnY2e6B?=
 =?us-ascii?Q?XdtPlqaIMVm7dNLp/tUjdg04O861l6hVrdAZokTzoGYz6ftX5kJgezWeBH/Q?=
 =?us-ascii?Q?l+8xWPF/oZpUnChTZcksX6OXzFG8yb6UxFFKAFYxIAd3OAYRirdPqjCZRDp+?=
 =?us-ascii?Q?xe2eHIIaAzKA+IaZf4SjyJa6wqRdiPKI3nQBVO94QuFTa4RW58biGShprKgl?=
 =?us-ascii?Q?psLfR0/EyFALAFfVQBKIceHB2MR6ShWwMLYlh57NETjrqu2yOledb/6qkmlE?=
 =?us-ascii?Q?G41JoWc96PN9AUDZpTjXqglNYSu4n6SVxI5t3BYJ8Gsovv1SVO3XoY4npxqH?=
 =?us-ascii?Q?Z3pFXLJ+Qfpt0kRdCa8DokGFUzHqbJKdoB6pZXKxM9dnOuEGePooCpp27r0Q?=
 =?us-ascii?Q?4vPLjZMbYt0HF6WIiuny/qD708w7wGd8dicO2TL0UlRon8WjMGPrPElJur6v?=
 =?us-ascii?Q?Xns/G8jbZkkyEp5jp1YVBmptJzL0WSPYe6uHLraSeY3SwQ7jG20emR2gQd9Q?=
 =?us-ascii?Q?9t5+q3Z4a4Y2XMxVPuCX/0VTp+sA6y/T/sobbRPAReZK/znD2J0MShrseN4y?=
 =?us-ascii?Q?4biVunhZuiEMx1RC1WJmS3fpowTBAo6WdZZ76bz0j7RlKBRIDfNb2E4dxNhi?=
 =?us-ascii?Q?lyjDuAOXA1LQRpaAOO9ZFTwqxFmPeKwkVrciAJsC8LV1ezkZHOuj3Jq5yWDA?=
 =?us-ascii?Q?tT+gS3tIPc6mRFU+uHluS0Bhp/uXTYAqhyxdWHk4JNwuK6C7AGnFs6583DiU?=
 =?us-ascii?Q?x4UIgeYWw0LrKA+FlMK92i5+bZA+MhM7tsx+pOapuwUqbPEYjitCIpkbzMJ4?=
 =?us-ascii?Q?oZui5aHY+BxiRex2lhYQDzyuxjS7eeUC5Q54?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(19092799006)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?tyjlnGk03nLuOHBBdIYhQ9URb6gfEq8klcAG7Rh8gpPlfpacelWqNQZGjvh8?=
 =?us-ascii?Q?ViilcDo+LQhNMPTb50IlNKLaD5nj998oj8OGDD80znCRZrPcBRWuvmTkz9vd?=
 =?us-ascii?Q?lqmoITzA0BZTDjWzQx/fPL8HoE2XnRsMZeKc1mTCmvwd6x22SmlSK3X0fu01?=
 =?us-ascii?Q?C5rZ+T80n2TOrdpM3d0SLU3AlElaJ58IEOP5YJaloO6hqr9zyGHaxqY1qQuw?=
 =?us-ascii?Q?JRKh57Hg2R4A7PGHf16abDrr64w8RLbRw601p5hBt99xZar/+O+t7bztvx4S?=
 =?us-ascii?Q?8P/LmuJ8T32m+lfxqawYWuJv++YklqToyQV176gH5L0PTFNINk66inBHFQzp?=
 =?us-ascii?Q?RcKqcNWizVwYWu2+fJywKJeKxzU80DfvebVF1gymW+IbWN3ZZJyHYvSejLt9?=
 =?us-ascii?Q?a+hNBcBTFfMES366jnhYQ0hpgnaOg1Gvy/bCU+tlUquBvAc8Zo6YIebELG3v?=
 =?us-ascii?Q?CvaOwg69B236KdYE7dDy2wOPdRMfeiPGY5lOHtGrL7V2nmI4xBOGA64JLNFF?=
 =?us-ascii?Q?DX+i5rZe9TnSfS3C1wWaGrZC1kdCpe12S3fJ9dpqOKm2ZICauYrAEXuM8QvW?=
 =?us-ascii?Q?+owjOGHThbEYxRlojiWN+oZho7Q47vCJ/x1ZG9xRxzxui9OEM1KjKs22HWBO?=
 =?us-ascii?Q?VuYjDWyGAcJXyraL1n361JrsPy76DzS0MY6/SJPZm4R5pI1AeSQ/5O/NQFHR?=
 =?us-ascii?Q?Y7w/vLFbUATVpsd6IVWkfFZSB3pyOz9mecz99CuFZTxwQJmpInRqIaL7FzKg?=
 =?us-ascii?Q?EPnCA95V4gVw4fI6YPfGwiMmXnOT+JAKbkwQsIWZ2Ix+fUri9FUoZrvigRGJ?=
 =?us-ascii?Q?ReQGwWWZEmbJUGP5EbQLy/nox1m8czDdDN3+Z+DvjGM9Vds3obnRrGu6hf0I?=
 =?us-ascii?Q?0IBT6dsVPHOupjTyrVDZZF6YXuHAl7elEsySGnvDBubiM6r/XNlxa4aS3bB9?=
 =?us-ascii?Q?S6oljgBsvkdhXlBtWmkGOm9ImBkMbUcmmo/ub/IDYXPKLY74oRNulI5QwE8B?=
 =?us-ascii?Q?apIQND0bElRiZQA7YJwKaIUdYql0AEpbypah7DylxgV8bJstVdjtAWFpjIJP?=
 =?us-ascii?Q?/LiYttalUD0WyVwYA/dRTGizg+juoF/fvC/3lE7YufOGikJ39TLz8XjD76nT?=
 =?us-ascii?Q?rxJFmhB0ZH1rPPoiInbMB24bOBIIbYTi1sm9UtCsbGZcPp7KG2HC1spKgq2Z?=
 =?us-ascii?Q?y9gKf1VxCG4YWBqF9VonP+rGcguAEdYTAxCzTj/Fr4+du5Jt5rhfAju+vdre?=
 =?us-ascii?Q?wQGVHdWwqc7afpesoCIEkKFuKX39f5mgEMVHUkpcChPcnp1GxEBXWbQBfPHw?=
 =?us-ascii?Q?Pr19pXfSv6SpBeTZzNqQdqI3RgBN30wBENERrqCTFDNS/J/AcmNI3eSHMdPw?=
 =?us-ascii?Q?kTMKpxoFmkjFTaUZanoMieqftbku2jId/D2edeCKK4DgdDn1GI5tJhryp2gC?=
 =?us-ascii?Q?mX40/ZwnLECSzOrd4dKVT7iGl6aEiNLEbdjTeRZOOcyaD/JnoieK62EM9hYY?=
 =?us-ascii?Q?xMjjvm2wQ8mhKMhgzoYzPRFjunKiOk0BOtXUMQWcbf/CnmtLkgkFIrKH0XlV?=
 =?us-ascii?Q?NLRWbeWgRkETMl6k288=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cf5dc1e-1ac1-4f02-6954-08de3bcabd5c
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2025 11:11:47.9392
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M92LRJC5NdJz04awFUbzV5IOc7L5DFXqImS3LP4iiEbP//80WXiDpvLh7dnCe4dCZXqS8r2oqCUrSz5o40nm3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9659

> Subject: Re: [PATCH] remoteproc: imx_rproc: Use strstarts for "rsc-
> table" check
>=20
> On Mon, Dec 08, 2025 at 05:33:02PM -0600, Shenwei Wang wrote:
> > The resource name may include an address suffix, for example:
> > rsc-table@1fff8000.
> >
> > To handle such cases, use strstarts() instead of strcmp() when
> > checking for "rsc-table".
> >
> > Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> > ---
> >  drivers/remoteproc/imx_rproc.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/remoteproc/imx_rproc.c
> > b/drivers/remoteproc/imx_rproc.c index
> 3be8790c14a2..33f21ab24c92
> > 100644
> > --- a/drivers/remoteproc/imx_rproc.c
> > +++ b/drivers/remoteproc/imx_rproc.c
> > @@ -694,7 +694,7 @@ static int imx_rproc_addr_init(struct
> imx_rproc *priv,
> >  		}
> >  		priv->mem[b].sys_addr =3D res.start;
> >  		priv->mem[b].size =3D resource_size(&res);
> > -		if (!strcmp(res.name, "rsc-table"))
> > +		if (strstarts(res.name, "rsc-table"))
> >  			priv->rsc_table =3D priv->mem[b].cpu_addr;
>=20
> Before applying this patch, I want to know how it ever worked before.
> How did DT with a suffix tested?

In Rob's v2 version[1], I gave my T-b in 2025-5-7, but I could not recall
whether I did rpmsg test, seems I only did start/stop test from the issue
Shenwei spotted.

[1] https://lore.kernel.org/linux-remoteproc/20250423-dt-memory-region-v2-v=
2-4-2fbd6ebd3c88@kernel.org/

Regards
Peng.

>=20
> >  		b++;
> >  	}
> > --
> > 2.43.0
> >
