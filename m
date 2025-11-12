Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010011.outbound.protection.outlook.com [52.101.84.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234273101A6;
	Wed, 12 Nov 2025 16:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762965119; cv=fail; b=AszCdeDjIhl3ICdLxpg+VFrY3HfaMGP/HZibU9LQe15SYtk7unA4D7Ci4v4BkFfD8hk2yzJ7dlcQa5iUZCQeWqGogWdy/rVy7CAgSMY2uDLo35N63i1QoaGCPjmZ/nkeNj4HZG0KAFPHOnsiqu1ZrHh9wKUslMJqsNeqBLFvy4E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762965119; c=relaxed/simple;
	bh=6OGS4cYpSB+yGxBO5Apb/pneCFZl1L5GLevDsl8pAvI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RTVFFCNbvubNZaxZNc1S6sKlTg9VdyvAesNycMLbBbt0WA8P255ieA44A/I+56F9QWXPfAg51u+fFHaLzjeCxKD7BncH06Czc5xyXKvMEcuT6pdO7p7IWGp2hN0sf4Ov9ntRvRRd02JDVyfV8L/ZSm0/AG+3OKdqtXHZJaN8v64=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=iUv2T3X6; arc=fail smtp.client-ip=52.101.84.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="iUv2T3X6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uAG3RFMP8rPRQ1SXcMn/Fv9dEADG3/qvh0sS28lo/ujchOkQxCDOUqwKymEwOl4CVpdfrmofArx1x8Z+TrDIRRZ2ixlsRUj/AtMdV7+Cs/QivacADDwIbGAzuLCvfQECEc7ZmAQQPai8JbPx9QIXzgijUmGiM2rWq5f++B7e1aFfGTEsciS/g/pGWpq/6piHPcn/ULK0AkxlaW8+lZjyTCaI3XVJHbVvdzrq4eT9BzOQYH5UWx+V58GPw0ZDvIl4Pa/6Z8ElE8mrdEQ2TqvRuW5XPS1GGHbhYmr97W1OhX3z3YR6xdYf2cKEYPA1dd6+cMXDGjnfKswgxc5gbfJkuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nEk3efs5UmYqOp9HsUBbVk+JLXOej1iukWHljM6N/CA=;
 b=fy/7+Ig3GbqQS0q8HB8TMKL/zLznNspfPjJDlC8DgZ/k4VpiqE31OezcQcFLsrS7g4wDJDZ0W9O0yEnE4/dVM4AY7Na1n7wToQ4dr3E6qkBiwxGVNsXVTfVV+fD347mlgindQNpj+I1cMXeOTvEWBwGjjFY14lVD+C/q4sT7sKTNNqwcOl8yJB5D3BPGXojKWVYEpC4Tj0Z/tEMon91L1p5rDncUJqq2wyhZME43rSnYVfn1/+UEu+rAS/T4GPPuTbSvZMNNdwQz5oz/eKXjEHYzf4DqX4qiIYrBobBECQNPl5DGxFQtsTY3uo/QRR5miPXa/XSnj380VhdYGE4qvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nEk3efs5UmYqOp9HsUBbVk+JLXOej1iukWHljM6N/CA=;
 b=iUv2T3X6VMT8zJijiATenWiMttFQfXc0yCSBGQCWeVvWruPBVfKgX/NAa/9CE7Y2SNhxee7CShWgo3nztt6My6yFdKsqYArMeEt3o7UnTiQ73qGXihGO64Xpg4ojrfSnePwVHsvnPsCTlOMwZtHSRjGVKJ4YnJRNIoGcsxrYAA5kltAaqtgJeYXKF99pNKrYYbKuhAbYXMsAoUgmvISHckwTU4R8wtxRMwUEyCRS0Ei5CkgaRtD0+tWzzbnOHKepjPyglBJUDjcl09PHgmSxa2FQNWOUU0/ccz2S+89srdV0NvkfVDpdCdc3yEufQ1VJuq4YY+n+kn6tcWgWouPD6g==
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by AM8PR04MB7329.eurprd04.prod.outlook.com (2603:10a6:20b:1d0::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Wed, 12 Nov
 2025 16:31:53 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612%5]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 16:31:52 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Andrew Lunn <andrew@lunn.ch>
CC: Linus Walleij <linus.walleij@linaro.org>, Bjorn Andersson
	<andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>, Bartosz
 Golaszewski <brgl@bgdev.pl>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH v5 3/5] docs: staging: gpio-rpmsg: gpio over rpmsg bus
Thread-Topic: [PATCH v5 3/5] docs: staging: gpio-rpmsg: gpio over rpmsg bus
Thread-Index: AQHcU/HZrq6NLJx0oEuky2ze4vYHyg==
Date: Wed, 12 Nov 2025 16:31:52 +0000
Message-ID:
 <PAXPR04MB91854DD6096AD550074FA16189CCA@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20251104203315.85706-1-shenwei.wang@nxp.com>
 <20251104203315.85706-4-shenwei.wang@nxp.com>
 <CACRpkdZR2C=+ssYOKnF=hyOqTakGjVxzp5_qz=3-uYRpzaZgNQ@mail.gmail.com>
 <AS8PR04MB9176F105B09FF939B22B85E589CFA@AS8PR04MB9176.eurprd04.prod.outlook.com>
 <9bcd63d2-f75f-4cb6-a81f-eefc983a99bb@lunn.ch>
In-Reply-To: <9bcd63d2-f75f-4cb6-a81f-eefc983a99bb@lunn.ch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|AM8PR04MB7329:EE_
x-ms-office365-filtering-correlation-id: 0774cfaa-f168-44c4-cb7b-08de2208fc60
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|376014|366016|7416014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?TuA2YYDMrKVzKtWwaZP/xElhvCWxNWIpnocSCjxiyRIb/EoJ8Kg7Ui4ZOTmY?=
 =?us-ascii?Q?e8h2P3vnQaYH6JLvIKkTwf3mXzzTq2ZktFjkEscQn07OopG3HRiq3SZSymuj?=
 =?us-ascii?Q?OYJfiwEwLrk3DteQGc9Rvs0SECaGFhtR+T1jRm7f/srtSgSw/fS7DlzjQkim?=
 =?us-ascii?Q?QOraFSPi2GyrEWzAwhblmcc+Xqp3Oed4hF5kgqQNNxjcCeNyffuOiCMQnJru?=
 =?us-ascii?Q?bZYgPoJeQx+vNvIV8oStwfUS+SqZ9kxHTKWadUXeMOoVIdYGoncvFGRQlXW0?=
 =?us-ascii?Q?6AM7VVl6P6SbaOKBqL1IAMhelOZjoPwgaiPMHK2M/0XKfXT7US1S9QiubaS+?=
 =?us-ascii?Q?2XnsBEtT9BlD1hPaZegjWwefmihnkA57nnHW3M72rQithyZ39dl+bNj1tbow?=
 =?us-ascii?Q?TlWzm8R+sXbdQK/4tx+CqZQq5HXISvVlVDjnUot3klGLRqZXBJR0Z/I0WiIh?=
 =?us-ascii?Q?Vmgq0CRYETD4ufihY8hDyH5mfcrnNx+n5GVFAVZkTE/YexIutx6bH11yFBnH?=
 =?us-ascii?Q?Wc4Nv3KDUG4Woz+qoxRjduWlzSZMdJpLsfDveks5wHrNREbZjEbfT3WWEL0h?=
 =?us-ascii?Q?CbOrfGzUHZgQ7TQa/CvplBVEmK0mDpQOWQITz2zpTWM1JCFCzYG59EBPcmZx?=
 =?us-ascii?Q?5nYhH41v2sVWCNBJAueJfs3FU32jUIfquvWHnmX9jZxdw4izDI19Fs8JPYtD?=
 =?us-ascii?Q?1qMkR/XP3IBNvvvMMdSLVCPr0oMb7gdz81kxsogESxdQxz0HSCzXUsiba929?=
 =?us-ascii?Q?n3aDue9aJlAhOk8W5qvelABL3C/F3gK8fhVH3GKQySicqnMyy3rcrR286vnH?=
 =?us-ascii?Q?f+m7mgZI7gGSklixZzs9URjrHORXqsoPgoULQL6g9Q/tF5YLAHG/mLvclGKP?=
 =?us-ascii?Q?Bc7xPzd9kg1VJBFfuYDA37R6+BqlMCc8LIOVzRiF0Xi2iN634Wt5jhTXG2ZC?=
 =?us-ascii?Q?mVn9melup1MnPO9zJs1S+1n2tWTaNreOTrOrzAxdqmFx+/BOE/fqkINe0jjE?=
 =?us-ascii?Q?cddA4hZvhg3mT/4N5smT2m63FeiigJJnve9muA5QXXSNgu1Gnb714C/Ilf3K?=
 =?us-ascii?Q?u3XXOb9rx3SN4yM+dLNXU5N9aerA2VoUtnzzxzNWfELCh52q+gxscxXCx9LK?=
 =?us-ascii?Q?5Y1w/3y7nwIYuPN4H8qCB5G4VEk1FlQEnOf3d7/SeIgMWwmn2ZetCABsGCSa?=
 =?us-ascii?Q?AVeJHZalaNhBIQYJQ2acQzyfyvBFZDu2f4LwfsSDqUoClxPFiRZFvNwrUjm1?=
 =?us-ascii?Q?gtdYVRkyxC9+5dpRrsms0NhBQ1RFc4o2zDzzvPBIg9mb8yx/RcFCqaaHBHAX?=
 =?us-ascii?Q?Yy04mdbXvkoaTrUOjli9PpuQ37X43JwP8xw0sCDjAwTnn+5iulzFyeaJl2uX?=
 =?us-ascii?Q?5Xpf/iPrKTSAUP1+ZiF9WVD0AlFv0sAvO3GRGs6VJpmZdmy4iSYBsgNQ5ptD?=
 =?us-ascii?Q?RN9dt5cH9H3mVpsuR89j+2KcQ1NeF1MvoXLnjM1bHYp50pOSI0nUHI9135NP?=
 =?us-ascii?Q?+vXhOv6Ab3s3S/EB0j90wopDMuA6dv23+8Bp?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(366016)(7416014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?JDCwVe917qONsx4FKHua0wavI28kwCPaplzU36WBtLR1t2OrxZnA5iOlZWPS?=
 =?us-ascii?Q?unEHbepAr9fNJOCAC3c3ZoNP54+54zttv4gDyaTolNKyxmzsxUi5+wKGYwMw?=
 =?us-ascii?Q?c+IAUc8JgzI44JhyJbLuJKi+JmFgfsoydT/MiJ0N/ecsOVeFW3LboXPNyrBf?=
 =?us-ascii?Q?7hn6T4dAC32wz3aZDMoqIWOuDbvQZ+1mO02Wy+f7iy9oufb64MfM4l2l84m/?=
 =?us-ascii?Q?Qbva7FiEqNvSSmQyK1lxqEUmA4Z6uGHNYrymlc6uOOTSsELLqmuM7u+1nBfw?=
 =?us-ascii?Q?eDR6n0dx/4Mzq3ulwJSe5hUnz+EaUB8vx5r5EcfriGYaTGEl+3GMm9h/lE/m?=
 =?us-ascii?Q?AyGrBgJZTlCoWCq0lO9ySavBqn4pbUjuyz3v1rXGxfmOL1YAiR9TCNz8V006?=
 =?us-ascii?Q?cSY8yjwAABAZuBuZFoMdkJ/Hwn4PN5fCj6N/w5QB7HOAAPFxLRWV9AapNurf?=
 =?us-ascii?Q?5JLEcdoU+8dsFAv7M4i7EUxjn/hqUHkgCr6pO8coHWD7x9fbSRW5Kup49gkA?=
 =?us-ascii?Q?6Dd0G0BgSuJK224/YX/AGRwOLtitjr7ZBYRu7zwl+VB13wvmGDDrSXrILKmF?=
 =?us-ascii?Q?ndrnogcEyJJTCwbyFS7/RbfCzU96XiYpOxtv/irbLtlO/43XkGngprcShpjp?=
 =?us-ascii?Q?jFAsZKA4DelUCLwCBruCEDjPgU36yS+glXHJke/3Z4olwFsGH0kUvpxzhqKE?=
 =?us-ascii?Q?stTW8wWtMvs9OL1u5qeBMSCZ1uaxJ8KOuX2Aa6C1N+7Z9ABNX5PPtvux70AU?=
 =?us-ascii?Q?Ka8cI/Qzd0CTUO4jNl+vetuKaiIEb1B6DFxXPy3aijny0rYH6LAJbAvj33tX?=
 =?us-ascii?Q?AgXJsbZiVmO2PUW1d+fEkQGhvfVG235jRGd+4F/sf3g4Z3RaPU9KJ8SrbCy1?=
 =?us-ascii?Q?Fxzcc6nBvcDpGJyasOAgHYtEMso1XSY6v4YgdCvptxfNIGbBePOWXVPqjuYl?=
 =?us-ascii?Q?XP8j8HKJvaCC5RtWfvfgS2pOuxPqjzNTVBIbNnpHuKDyeRuz87u4Ov7243x8?=
 =?us-ascii?Q?/WZfkt+EASE3AFxbucFZdRh41YsLntkqajmLH45QG6WF5143Wl4GLE8L/pJv?=
 =?us-ascii?Q?KC2Z0AFclCgmCPED1mjgP35GPE3CSgOpYhZX55Bjvb89EfWyjllDTZ9ujA6d?=
 =?us-ascii?Q?UGqqAtZEr5Qsipg8ID7m7trglNGWs64aW0GoS/DrcVexyopYBcBsKcqpsBqO?=
 =?us-ascii?Q?Pf87fDMEa9AFU+Bk3ssVkYw2z7m0Ck2eaTPV4Mm/8ER1VdgPxkUYdT/8xBgM?=
 =?us-ascii?Q?mb3cirwVNxZ85+pOwKj67RUqiQcOPB3NZ9VXIu8tQT4whEEkZkzwoYW0Zl7N?=
 =?us-ascii?Q?R9BNyMYjRjtnSjs0tDcC+0cOEWX3WZzlZEgVCYIWecoW/RM2jEoFP46a0d1/?=
 =?us-ascii?Q?0oPJWG0+TuyYXib1ZI7qJqmjbHypqd6FnWyeEl/x0TFaoepVwzo2YbyCNyBh?=
 =?us-ascii?Q?tdssTbCmtloxhUaNn97fvPtywlwia3wLVjA0EVGb5i8OMCreX59zDX1SsbuQ?=
 =?us-ascii?Q?jUsvj6mLo6O/f4wCAhHGHx7BeVKZHaZK0PL3ttYCM0vpy7DxRVL4HtBmvChO?=
 =?us-ascii?Q?ZkfDfUVu+TMJMNaZx1g=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0774cfaa-f168-44c4-cb7b-08de2208fc60
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2025 16:31:52.2038
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fVSaI4HG91WRVVkIQ9svLmzy/T5jmYfLMFv8U5VDOlX/2jTEYteq2Pk8ljBWg7NcWmQCTgfz0evrFFdNOW3Mag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7329



> -----Original Message-----
> From: Andrew Lunn <andrew@lunn.ch>
> Sent: Wednesday, November 12, 2025 7:42 AM
> To: Shenwei Wang <shenwei.wang@nxp.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>; Bjorn Andersson
> <andersson@kernel.org>; Mathieu Poirier <mathieu.poirier@linaro.org>; Rob
> Herring <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; Cono=
r
> Dooley <conor+dt@kernel.org>; Shawn Guo <shawnguo@kernel.org>; Sascha
> Hauer <s.hauer@pengutronix.de>; Jonathan Corbet <corbet@lwn.net>; Bartosz
> Golaszewski <brgl@bgdev.pl>; Pengutronix Kernel Team
> <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; Peng Fan
> <peng.fan@nxp.com>; linux-remoteproc@vger.kernel.org;
> devicetree@vger.kernel.org; imx@lists.linux.dev; linux-arm-
> kernel@lists.infradead.org; linux-kernel@vger.kernel.org; linux-
> doc@vger.kernel.org; dl-linux-imx <linux-imx@nxp.com>
> Subject: [EXT] Re: [PATCH v5 3/5] docs: staging: gpio-rpmsg: gpio over rp=
msg bus
>=20
> Since this has not been merged yet, there are no existing systems.
>=20

In this context, "system" refers to both Linux and the remote firmware. The=
 remote firmware=20
for i.MX platforms has already been released and widely used by our custome=
rs. Maintaining=20
compatibility with the existing firmware would provide a better solution fo=
r customers.

Thanks,
Shenwei

> It is well known that what gets merged into mainline is often different t=
o the
> initial out of tree version. You just need to deal with it. One option yo=
u have is to
> set the vendor byte to 1, so indicating NXP. If Linux uses vendor 0, it m=
ight be
> your out of tree vendor driver, not the in kernel driver. Just document i=
n the
> specification vendor 0 is reserved.
>=20
> You are going to have to modify your firmware anyway, level interrupts ar=
e
> broken. And this is an example of why quirks are needed.
>=20
>         Andrew
