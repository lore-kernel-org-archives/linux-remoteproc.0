Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013056.outbound.protection.outlook.com [40.107.162.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18232B9BF;
	Tue, 10 Jun 2025 01:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749517845; cv=fail; b=oCyCJXJ1PoRz2YUKXS40ueE/XWJshxnjX1GCv7ir+Ima+RxW+7jH8jGl5kzXOb++JQ5iUqdbREKRO9M/kMAX5ABa1twQZHfLXMZtz7ZRtmi1dxiLzpnRttlIpkwkLJo9UEXb0aG5KcGLJKWe4+NzWDMrzFYK2sGErv6UnDm8jEg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749517845; c=relaxed/simple;
	bh=e3RYNvw96crCj8GTpMy4nC4PnJXXILZjjKvNMUygQ6c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YNHhNaCKVmmVp12ulnxxT0e5+OOsME4AnBtmVZTv0Tc8P2F/e7wKM4wnRfSkaPkwnb+V+gOA0TcalOtQPAkh/BOzSWkuaoWOK+KYnDT3m3z8pz/0DceT70+mRhxTQhCHHSaJdhrOU0SonNOoGD6feWe8bQy60Vv8hU80J9jES24=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=nmJcYIPU; arc=fail smtp.client-ip=40.107.162.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="nmJcYIPU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tLXo5e7kLnGGOTpdc4A88AyIqGmgRK5V6+08eR/0oRpHFZ3y+T48c2Z6IH19+6+/Ha3WBzpt7hcMw1coYbopuAhVqIvAvTT1x4vLASotmbRUO3K4CNCH3khpvSiU9v6C1SBpgLjusKCWQCTICnbkT1iwoD5qtQaFgxPqs96bd2DU4JwT8ihpC1sZqf7A04JjtszJAt+7xxe3Zq/NnfCUfzDk3Fjzm3kUPa6FwLbTrGE22a/bdgbgMSAg/XpMNI3ZVM0gsHE0xL78BwpL1wmvFep4oN3NekXQ5nd4WEBQtxrTl52ztmYISSI+GcqDFBocOdS7LoWwDvN1Fe1ICWn31A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XJTV1ggYB/WK4hcYeB+vyW2FGjXnNh+160oOcelNLI0=;
 b=WlC2bqEiu64HYG20j+61eO5/Rhxjyl5jrh9eM9vMX1j1Y9e9XmsqJR8RIo+1z6TgBR/a23o8Et7lhSEHnFSCm7OjggZcW2mjGi0ScjbYLMz8mj0Fj4VktOwdayW9H6C26o9hakktVzPl0+/gBmnm/4bFSEYqWrKiW2P1RHcgFs6N06egcmraMvuL+7d10dt3FHgbrWu7zaK7O4828y2U4qP+6v0qGv+cdXBxJ/UzZ+734KgnF9LOx7Ad9LpMaBCyrD/xBM5MX3xBwzJoYpwvQ/KTFmxhcPdFZkRwOjxaMgyKGTUwZ4mRtM/mvpaO+qzCLtpwleDNVFfMm/6Zdh4JqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XJTV1ggYB/WK4hcYeB+vyW2FGjXnNh+160oOcelNLI0=;
 b=nmJcYIPUvjZYK307icQ2ZSvB6FCBmqDbW9vPNuBmsfyvVsQFgmeKs+Y1KAEgFyrKmTmgHSU0l9swp6mEGPFu8sFxFRUr1YdfiIoYM3cvbAIP6LJ5l3qUgTbsZFzDpFC/6uGBkxcV1HiX3G8ziEK3OF9Xm6r9iMV+4hWBDDmGECYTEQNftbUFRT5W3vCUoWex/7Z4xNL6ILHJ6RoYAxVBz3uggdinAO0livHTipIMTfm+Xhqj8KoTY4cIHd/1C8TlIpio6v3aOXgSSoJHHuDve7uV6FWV7oc2fkk836rnxh/Z0/3DURqSWpGz+DZu/5KOCswgq4Z3WndowlagsP8OTg==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM9PR04MB8273.eurprd04.prod.outlook.com (2603:10a6:20b:3e5::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.31; Tue, 10 Jun
 2025 01:10:40 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 01:10:39 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Tanmay Shah <tanmay.shah@amd.com>, "andersson@kernel.org"
	<andersson@kernel.org>, "mathieu.poirier@linaro.org"
	<mathieu.poirier@linaro.org>
CC: "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] remoteproc: xlnx: allow single core use in split mode
Thread-Topic: [PATCH] remoteproc: xlnx: allow single core use in split mode
Thread-Index: AQHb2ZBVV1Xzcjo/kkemQE9g2IN9hrP7lO8w
Date: Tue, 10 Jun 2025 01:10:39 +0000
Message-ID:
 <PAXPR04MB8459348088DB7A4FF4253DDA886AA@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20250609224612.2428151-1-tanmay.shah@amd.com>
In-Reply-To: <20250609224612.2428151-1-tanmay.shah@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|AM9PR04MB8273:EE_
x-ms-office365-filtering-correlation-id: d062a2dd-4269-4f40-663c-08dda7bb9d33
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?FM/k/27o3hlxTX02L71NVxsoCZOeckEEbTHdDpyEs8uOPbgTcsid2giXypHZ?=
 =?us-ascii?Q?QnMiyxNnzcYf7dzslujEF+gf4U3aSrJaf0VgJSkhIWi+tIXjO3mx0cbpbyvR?=
 =?us-ascii?Q?cgW4HWWaICpg1rCB0YDEWFaHRhNl8tTgyro3Qtmom+0cDqY4/Vrb01BOsAWf?=
 =?us-ascii?Q?LtT3XMD8o+2MjSxyKA6LS3qe06F3+9mzGTzrYQ9CPjFr6pUR6gFRRZ9GtcB4?=
 =?us-ascii?Q?98s1cSQbTIEF4zkyP/ee+DFl5umxVaOC1LiGvMk14pQzn9WgOgEmEdVAbke7?=
 =?us-ascii?Q?1Jzz2kAeG665sbV7ikkHyc0g6IjF+Jp/TEiV9Q2NwjuNxDlK8LEgBOZTk4UP?=
 =?us-ascii?Q?SajaOMqzOEEZgkONdN72kWwRqHYfddRPez8iBF5Sn2ygXG1LghawSFZHMEZN?=
 =?us-ascii?Q?stosKDJAxmCrDoF0mr+QOw60pOTO2het/Cp/Rg2oJ1ZL6MJFaQELr1lSi6GP?=
 =?us-ascii?Q?2M1MGhXJdr0w7lbqXADoMUQLlvtynpVnEYbdQDX2oGihwaTb2VDdWwazwDhE?=
 =?us-ascii?Q?3irreTY55FhK4avnNakpehEnopMCNb3jVy3pmDtSBQfcBGMGA0G9rwKwuwDw?=
 =?us-ascii?Q?2YIHnRWL3EJyvmvP2TyZGdtQj6KCZGL1GMmXLjfGSG7sOt1U3htnT5qBCfMl?=
 =?us-ascii?Q?uAHnrhro4tzgrCoSOahJ2aIgqHmQoZDSQd0ocU87++sOKg53LS4PFv2WOBTQ?=
 =?us-ascii?Q?vRx5sH8EvhIwUPlCOnjX97KxhCmdVJiNJiBzbIZBgWAl8Etui+h9jhh++B02?=
 =?us-ascii?Q?4GldrnRWl61vGRxpnhWMU7eywA3k8v82T6RVB01yV55mEGgp/2leMiUoHO0Y?=
 =?us-ascii?Q?4X2911sguMl8cbCT3Va2fMz/v+SYS6mro2uPd5XtDR1sM6oN3VfuQqx6zIFl?=
 =?us-ascii?Q?phILhQHIA7HzoBQ1Iv+ObcjXbJUyZSJMdb3tFxWSX7ybIDdO5/prvtnOwog4?=
 =?us-ascii?Q?NCGgl4xH7N0q+9S/UlJiZKiX1/NEm6GP4J3VQUjms5lTpYJHyFkQTMhnPU3n?=
 =?us-ascii?Q?OSJ9TDkNWqBuYIYk9kF41Xa5tzXloymXKQlqj8xPmBzIUrceVRj+DuHGMcMn?=
 =?us-ascii?Q?rFD9RLIlC7jEM+WI1mwlJch6bN82p0SC4edSgk9SSO8+B8kRG1/ZuNCt7Ml9?=
 =?us-ascii?Q?jsbLyUFB0Da8MshBaoI+i/iUXxOmCMYsiYYDpRn7TajV62Ah7BjnkbpRrW43?=
 =?us-ascii?Q?0Y5pCj5DO5T+vEUTCvC0fU/fdhOdjaKs6PE8hWrzqxTfoI0UG9/Rl+YpNApJ?=
 =?us-ascii?Q?jwfhoZxhCHcT1WMmwHnYo8jno0SjseZulGkvW84akad96svJMDx+CiT3wgjj?=
 =?us-ascii?Q?T73jaQl6X3Knyv04VVK87KDAC0l3BB/oCgPUTgrHw3ZCApf5M5CsITy9IPhc?=
 =?us-ascii?Q?/QR3LAUrU9Rcu/WcWFoNWnTQ6kgPvVbe7yA8FuhLMTC407PsfDEDlFRMl2tB?=
 =?us-ascii?Q?nvG55k+ryZirnLkM//EmOyX8/SgtsKn3dacmrQPjhyMSJfaX8MKvWQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?jUGW0xGqtWRP3n6N3UJo+wk29YFjSSrDT7LqzQShJRO4L30PE9kJuaC9APkO?=
 =?us-ascii?Q?vZ2OfnIjdYs3Ysz9wcG7/xcm/jdeg0jGshqAdb6dW3wFO7L32y4QQ7WJ+Vhm?=
 =?us-ascii?Q?YSejDSHrSNIAiItt4iFvnWrjvlzPuKI9GNQAr4McNDPlrtdYxLsB6lF5ICpp?=
 =?us-ascii?Q?1jvTg39vHx7tgFcWaf4GEM/gLsw0pgPuZIxZONFeK/x5L6MiUJEFKNWdRaFD?=
 =?us-ascii?Q?LSiGPql93R0m/W4PlhY5jAN0q7mGfr7G6MgE3z9Re6X4tDGvefKZhYMqIWCg?=
 =?us-ascii?Q?Yu6nXSJqP3fnuScAQRxw981Qx7ukaB/+TTxmV78uIgSHEykfykgS0r0D3e6n?=
 =?us-ascii?Q?QDNjLxTh62KoBohH7c3dBLtYXvNBLdrljVSwEcfKGutCpUQW4l6kZRj53HbW?=
 =?us-ascii?Q?Xu4OZ5uTjZOSkMpLipU0EISK45J07UgqtU5abqbytAAjRnkVUMIDCkyNpidU?=
 =?us-ascii?Q?reHshiamHZ/6AvxSVbcvYRd9lIJQr+8PnlnmLk9TTnzBZHvtPwYdtHA8EadS?=
 =?us-ascii?Q?OdhKW/bmWC13+msghdev8JLcKhh4yY3aLNxMAvBmFv5/vdVoFawcuAF5C6JK?=
 =?us-ascii?Q?K0XGu/NvIk8gxfbb02WMsuo2gXjVBuRWMocrMHrAizqIOspc1juNwXqdTHm7?=
 =?us-ascii?Q?pLmQt+F8i3wy2I65viAUhzkgVQCrBknT66/TcM8nHyflMPa6vgVN4oTMcMhb?=
 =?us-ascii?Q?AZePJhsA0By1ymAstM2AdCk7Pp3apveEiJeIN0mTsLAGWmi8dWaM7BaFU5Yo?=
 =?us-ascii?Q?X/hQLisKeYX3+BDJIq68VX1thsxjkg6UEdXsjyHkoKyHfVlFbO8lXuNsBeM1?=
 =?us-ascii?Q?MsxcGB5rA9+tMpAeqrI58yRi0wZL4wMDxpNN12ubmQ6e4vmVwVywWKB5jNrj?=
 =?us-ascii?Q?O/ihFj2/5WSuWV2OHGno2/iqZ/LF6EmrvqX0GZoL8+qcZ8Aze7dHIRcnMU8L?=
 =?us-ascii?Q?DQ9pSC4+l/XptgLv1O7s9Ve8KYIfkLoXF6OlW8+Bbcq44sIedcCqWTuUx2lg?=
 =?us-ascii?Q?7An6GWtFM0BNHa6CPyUDSFkE3gnMrOZo/V9D98zeTb9JTgIcLfk2FOYnLzpv?=
 =?us-ascii?Q?FcsQds0HDZSoxYWS2DahMe+bgjnlPFQKdT+EhK12Zx1SMTvmDheG46EmhA6e?=
 =?us-ascii?Q?LxyJ87hYuW0MAHNpISSxqpoECnWPaAzXqSu5+nGGhQLUI0ZgjB9fq9SmoRYV?=
 =?us-ascii?Q?3+qPwZKa3b2p99I5+mxzGhwX1KieIRekFNvlC0wOvyDvlJ/Rs6vq77OdIsjz?=
 =?us-ascii?Q?XjCvK2LTUwKvtgKDFVCcZJdNFFjPxPjv/GlyfZ/PO8MiAVGtpSt8Q6p107iR?=
 =?us-ascii?Q?XVaDYLkADw6gGKWNT0hZjTMa8QWQuTLTJ/ne/mBS/a096hHoEg1XlGFMF2y6?=
 =?us-ascii?Q?RhL4HE47zX72kl9qBTuAB8GwG5pCxeK5RANgzcflBiPgywaQdtqBACn+J+QO?=
 =?us-ascii?Q?1keJM/5YNGnMUYLalj1f/ENmOeJSF/AURI5BTVYPlb6zkomW6AP/JwHrHCyl?=
 =?us-ascii?Q?RjSLdYOk9698aMtv2eNSkY+GNNDZdz848UFK78wo/Soz1Crz51HnN/9v5lFY?=
 =?us-ascii?Q?R0zC1UnUOZnh+YstA4A=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d062a2dd-4269-4f40-663c-08dda7bb9d33
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2025 01:10:39.4157
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1hQdIUHe2s0LREmKI018o1IuQ8AbkrrBddDcA7/bljTh0B3+flkMOXTgolORejbBd996xPxcrJINwcwZF+qAxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8273

> Subject: [PATCH] remoteproc: xlnx: allow single core use in split mode
>=20
> It's a valid use case to have only one core enabled in cluster in split
> mode. Remove exact core count expecatation from the driver.
>=20
> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> ---
>  drivers/remoteproc/xlnx_r5_remoteproc.c | 3 ---
>  1 file changed, 3 deletions(-)
>=20
> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c
> b/drivers/remoteproc/xlnx_r5_remoteproc.c
> index 1af89782e116..f314dd5bdb26 100644
> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> @@ -1339,9 +1339,6 @@ static int zynqmp_r5_cluster_init(struct
> zynqmp_r5_cluster *cluster)
>  	if (core_count =3D=3D 0) {

"if ((count =3D=3D 0 || (count > 2))"
should be used to here.=20

>  		dev_err(dev, "Invalid number of r5 cores %d",
> core_count);
>  		return -EINVAL;
> -	} else if (cluster_mode =3D=3D SPLIT_MODE && core_count !=3D 2) {
> -		dev_err(dev, "Invalid number of r5 cores for split
> mode\n");
> -		return -EINVAL;


Then it is safe to drop this code piece, otherwise if hacked devicetree
being used with 3 r5 cores included, things will go wrong.

Regards,
Peng
>  	} else if (cluster_mode =3D=3D LOCKSTEP_MODE && core_count =3D=3D
> 2) {
>  		dev_warn(dev, "Only r5 core0 will be used\n");
>  		core_count =3D 1;
>=20
> base-commit: dc8417021bcd01914a416bf8bab811a6c5e7d99a
> --
> 2.34.1
>=20

