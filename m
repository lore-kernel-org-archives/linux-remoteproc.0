Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013016.outbound.protection.outlook.com [52.101.72.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D32D265CC2;
	Fri,  6 Feb 2026 03:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770348885; cv=fail; b=R5gIS3bQ8fHXbI/xn9lOU6Qny3pTkqgDcSgMF5YrZWYs8UDuek0sqGYpZhtqD+gTCQbOIK42ur/NjNcAXrU24AnvO3HwlY4/IWNmIWX78hmzZddksW+/LY5I00Y3W8zHjmTHgeiBSKb2tYgCNR+4HRR5GOprsVqR8yxu21VIpH4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770348885; c=relaxed/simple;
	bh=62/LFKEOvbQDCfi0yz9atwTlP1O85GQFYwskDup7bVM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JlZj2zcFfDdkUYbvx0bu0ZHHilaFk8E2MIJ8qWXvZzr4ul3OkAMVECHqhrWuCsCh2Bpfplw2DHRYvntI2887GiopH26l5T7WilRk3ktpPJeQGfCX1c2lFy9y1JUb9DPY7mJ81JyjeGK2G7FfXX1Y4PBM3ltt+nGLoxwUSWwkVBs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=M0UN56OO; arc=fail smtp.client-ip=52.101.72.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="M0UN56OO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g5wbXLhA9iAnc8NOXUckxeVeBoUnHIMdmYmvxV/5Zw9KtDS86p2Kel17sFUlatBnpW178/MGe8hsNxSkhDm6QbyUUUYwDN/LsRcnxIUEmsM5ktCbdKdBEluk9BUUoE4t/QspYzqlqUSjzYdvtYkvdl0VMLXtLNKANPBbPha5sMwMTsCEUfbsHnJ5Wcys4ev+MdJveJnL4GqBIdbuU2OcXK5a7HqWVhgtRwdeY86981broDVx1cCjtkqnI6XBpYM1KogzCcuVk8mqyGn8HPONgIxagNp+T0qSn7tA6YAapgDcY0GUQomakz5ovXjBvHseLEyeWBVI6pPBwRg67qbbMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NM3xzMUDtPp5y9YfMTVb1sJu7YcNXN1qx/NZ9zirSgY=;
 b=ubWopcHBsYUo6AHZpM28FGDTcyv0rVs3EXbBHeeiDVu4w3aOKVUueFWa20LEJ7mk7e3/bakoS36Pl9YP8kGl+6EwxyuTuJIjqzt0jubGN/u6834cgAhm+HpRzblashRaYR1Q0jfN00o78ncmmt7ewQ41Dj7KumCUV51cQ8pBF/asEnozGRqxKoBDd4rUuJuB+OpVuzos0Fb6mO9RMiPusLnx14uothuYJAavYMY1OZcif6KWPjO6Unre+lqmuN+50p0U889xO0Sdi0pHDd1PXqM212CujmvYK1YMoRAB2nBVGdSwdBAonVlh+pYgXHx6R0PrnlgDchC6t7X3jyRUmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NM3xzMUDtPp5y9YfMTVb1sJu7YcNXN1qx/NZ9zirSgY=;
 b=M0UN56OOc08HWxqrkfxUjtlBN/zvIVAL+gIdCy5qHvEBE0LsDKaE+1V5ydn0NWkUDe0lWsZgyC7Vu0xiI7nxwcFcaXMlILXNJMFMWcGLdXEPVidFvu3lmXy1SRxHwnziHmkIt0Vl99OAjLqomDq6kxWRiEmCbZYaXujGuMQDoEpLHh5vzlFOFlutHmsAaHr51WYtkwPYFk1I0jrLfsfUb6/GhwAyT6ajt+PKQ14QaYY73FEbj1e0Ub9J3Eze1f3cxpLA1wlkG4H3kkeawvTL/ZZfx4bOE1KLeJPp2RMs7yoCP0DERtUFTyCdJEEiXD/3rjd2BBmQlVZbyeOJHXjREw==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAXPR04MB8942.eurprd04.prod.outlook.com (2603:10a6:102:20d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Fri, 6 Feb
 2026 03:34:42 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 03:34:41 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Chen Ni <nichen@iscas.ac.cn>, "andersson@kernel.org"
	<andersson@kernel.org>, "mathieu.poirier@linaro.org"
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
Thread-Index: AQHcll2pMFTvYKAP80u/OoIeFR6/IrV1BMzA
Date: Fri, 6 Feb 2026 03:34:41 +0000
Message-ID:
 <PAXPR04MB8459ABF483274720F6BB23188866A@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20260205050905.3031134-1-nichen@iscas.ac.cn>
In-Reply-To: <20260205050905.3031134-1-nichen@iscas.ac.cn>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|PAXPR04MB8942:EE_
x-ms-office365-filtering-correlation-id: 8f73d174-15e9-4552-953f-08de6530aa07
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|19092799006|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?Go8LMSVYVkNZ/wAKOmGsaxqqZtrqHQWk84lHMrADsveva0Gp7srTbw89WklD?=
 =?us-ascii?Q?7VacG+du2SHJW0GYqQVG8U6VDx5J3ZSf83FK6kLr4NvuldPq40ojqmEr+2/5?=
 =?us-ascii?Q?mAGh5wRIkgQK0No2iBDiTGZvrmIUTR354fxUcqKL23sb/edUHSORlOWzIs5f?=
 =?us-ascii?Q?yeOh7Dypiy0rs43wcZIWg3rQ+1aVNUtITJflKpxpei0BExezw4QzpMY6Sq+Q?=
 =?us-ascii?Q?5RvJVAn6IsBaYoZldLmicDzUT09l6VwU+Z75KGryqHeuvtBWN3Abx396fgnm?=
 =?us-ascii?Q?8Q4xD3SnjbT161a0yHH2FpibgZhMi9xeu0RCa6h/wBd//cY0FP7JiV8k7z5W?=
 =?us-ascii?Q?EapLosu94OsOlRA0kP2teUfqytjULypBRpojmpFBZSaMIDOYW8pn6oEO1T+v?=
 =?us-ascii?Q?wiCUxc7gQGALqgqURXnjKIsl7CKzXtazflRV6dfmS8XE26j+hSgzwyRaW5HJ?=
 =?us-ascii?Q?b4gofrgMLp/iveDBmnAZUW5k4dWWWdfefT/0nrw8W1Gf7DuWcWPaeoCZhf6l?=
 =?us-ascii?Q?eTEk4yTs6fp6eVYC/7e6/BkfzkhABNfDzAY4zdMCc2yXITT46rw13u0Cyw5r?=
 =?us-ascii?Q?oYNsTXitaxYkuEhaxvUU6nHzhOMdTi4wzmdncMLuerXKypEv8tluQxmWJ4L9?=
 =?us-ascii?Q?oXH7Oj6ZF6i7bSrPhRxnhQOWS4esSyBtzsg0fr67JnGnfuB9r1iW4ANDdtAB?=
 =?us-ascii?Q?mUKON6h1O5TEmJDoAcTkHxhTQwEgCb71tUs3EaiLhhOJv9eaUIXn/rOVuG2C?=
 =?us-ascii?Q?joI/utgNG95AgSKguFXgijXgU/bSlKmQZU+KZ29TUMVWhD6Ft6dr/RP+Ehqd?=
 =?us-ascii?Q?o4big7dOXxu2QL9Lt66NI9RBs0bXPopVhU8A5TH6vq3qI8mnZQJNZnC3Vxd+?=
 =?us-ascii?Q?tVwWhhy+OSbc47p1ZUXBaI49tw151T/oAU/WGPZYj9dWB0n51o78RLE/AfqS?=
 =?us-ascii?Q?bsjG8oQiOamoUpJQXmFvhca3DWIRncB32wCFtO9qKNMRdlWMic+AUXtmPbAm?=
 =?us-ascii?Q?ZTkyMo16bloVlEALEZqrQy707E7gNKH9K2Y1mPmBM4Qirpqklti9swcDLm4e?=
 =?us-ascii?Q?pQImk2W4AFA0Doi7dmicc1mWbRTc1Z0akjmCXYsP0M0C5NqJ5QvJCtz8f11K?=
 =?us-ascii?Q?93qU+1EptGNIlaUT8Y62EmuwqDQoYT1Leceg1U5+4puRuHqnnCYy1/fH7Mzq?=
 =?us-ascii?Q?R4oQiZVg9QcUE9k3Y5rti+02hn8xUtRKmkQi6HMjBA+pHFz4McYVplnvj4gW?=
 =?us-ascii?Q?DJAlkLAWiJVuM470Qi568rfCYd02goJOJy8SOmRKBSac47f1jgFjSFGaUQUM?=
 =?us-ascii?Q?AxOIauGbfvkNwHGIDp5ySeHlAJCu0Ww4HnmrYiwgjolBxDkqcvyw0OA0YHsr?=
 =?us-ascii?Q?9qN+hJjyvKNtXEce1yRlBl7kyP+UdfRsLC7r9exppTYstO7GilWMzEVBFEWx?=
 =?us-ascii?Q?obMru/m87+JErOwdXt0y+2xR1o2ghj/04SQQeeu/jJIJoLKfzkyR1PHT0cPG?=
 =?us-ascii?Q?EqtefOTGRQx+2cizV1B9CHTAPlwAgeaOYm031toxs2pYmN04L+4G/MXu4vaK?=
 =?us-ascii?Q?A/fM1dhpk/Gagi2mI7rQlfkPuaV2XvZSAZ5L9b206eMiqOZAg9mF4/qVh6JH?=
 =?us-ascii?Q?I/D7RZ+h/CradxUWDvdNSsk=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?ipc+jHDqsFtNenWvBzYqBMao0Wla5dAgvxNSXCTJpYzFwzBzm2M8fdf+yJVH?=
 =?us-ascii?Q?JJb23w3GFWG41NyQJx/bLV7Do6D0yx4ja367OgXFiUFyTXZcaQESF2RFJdBJ?=
 =?us-ascii?Q?o24J0fCg98r26/U/E/wHwYrr3gRaqsJBitB+lq5dRcruTZYFHMk+Vzcp0com?=
 =?us-ascii?Q?eWEWpPvUP6yiAUJyZvxtrTTnKZ4lUETlbXY+gqx4vm1ngFKr2OfaNoJxqDQt?=
 =?us-ascii?Q?nc4R6aOhqH1BfH2yMHrzl82p+QNMiCmVnVOqosVqulZloDAb9tDGfYYVRtcX?=
 =?us-ascii?Q?1xC8mukQ+3IP3t8/ytdcdK9ZBxgoZZQJFSz2tKsBe9WbomW00Jo/hJCBkS+m?=
 =?us-ascii?Q?B42ZKUoDlncu5u8WNomCmpIe16GtUiArFh+rTec4LNzu1vkNuS/P5G/3LmNL?=
 =?us-ascii?Q?1JtzBjPlBv+Ydd2NcfxXHF6moolxtNBzH+cuc78SY8ABUrSGFHn0TPQtBFHz?=
 =?us-ascii?Q?G7PhIvSmTAFRnSHoGWTJwwhnY58MlK4I2fbaFlwb1vItK0qtre/nLD6vSJP8?=
 =?us-ascii?Q?eNmbkpl3nBAcZfhyvS/nRDBdPXoxHTylNlFcXKLWeNH1xXoDSgV8sYk53FQX?=
 =?us-ascii?Q?g9gachC79Hk2M/sK93ywMbqUU4PppffooA0+9SZe1hUZEWzOtJkzNJI1Osz9?=
 =?us-ascii?Q?znhdNG2Zjp0C5juXR5iF47oY8ZbGgJ1VdSJaLcojFnI0t1S59readyaUhdNA?=
 =?us-ascii?Q?hUhVGmXTteS+y/ZvHhPSBk7Tpz+90n/HplVjc8IcETYekB4Yb6t6n1JNcFlk?=
 =?us-ascii?Q?YrDM5W/QxkZh4A41iJzswSM4UK5v5clUocPYAlgV/wQ3/2WA1weJCZwOV2Gn?=
 =?us-ascii?Q?QbYCO/Dv5UEr0xnXWE27Ta7BtfQAcW+9nKjfNYww7IchdztCDKZ9qFlHgG5V?=
 =?us-ascii?Q?5qt1ENdvMDT2YwkP2u7cXMeZzNsZMAHXy0VVXcUAKPT+qIHmPtQWraXgTiOK?=
 =?us-ascii?Q?THvI0IaZ+PYI/n8ykhso7Y+1Riu6DwcKjxVsrUTPNGF51pnHBZV8kFGZyzFd?=
 =?us-ascii?Q?DoLdL8aZbkOUdNfKv/7az6TKZ+PstmZLLbSSFE2K1ij0LthXJLMfClOD1W4V?=
 =?us-ascii?Q?USdYRTVOjC4Wpf1IQX/U5YfqSAuHgTymxLGDoB3aHxYiKyo529dCErMrv9Ci?=
 =?us-ascii?Q?Y3xR6UKnTV7dPuV45/3ELn8g13HL/aidN5OrByUeFoiVAL0ab41qU06e74u7?=
 =?us-ascii?Q?yyqUl5eQcw4p67qrYkEqXsXjStgQVDULwM5AWMEkuO9Dh0NNanVXlDz2mlK8?=
 =?us-ascii?Q?g1SHvq9nm4kDoCYDvulUszOWFITTHmR62U9VfZ7FswZSTWgl4evy+wBEe9Py?=
 =?us-ascii?Q?FezNxvJ4shcXUt+YmXQiD4C56oALASj25wA/gFpwrQIcz6tu8F9HG8X6jiJP?=
 =?us-ascii?Q?8gTpckz2nYWB5KqoBy6PKeOVXX6D41S9wTk4kZR2VpRVNz+dskdmt4wyL90F?=
 =?us-ascii?Q?SptkKU1hQBN0OABwxQllgSahwLXMgrz14JOE/2d5vvkfJsSZZZuBzPvhQfaa?=
 =?us-ascii?Q?IvepdCwV8SBcO2AthsC5Vmg5hKIHMxlAO/Sd9Uvb3MkC3QafylJOOSoVoY81?=
 =?us-ascii?Q?31Dju1af68ZH/hiSW/zihDxNfmFjc5ECq5pTsJK6al4tIzcXSwjhhklAi7v4?=
 =?us-ascii?Q?Bhm9bppmbyTH7lJ12iQO22DWeYSx2goiEbn8KaQKj7YyXLUg1R8A1WyWbyfc?=
 =?us-ascii?Q?jJwd7un14lFGPyXAfQqtiD1S8EYV2Ho+AWTNGIzXvMcQcTyb?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f73d174-15e9-4552-953f-08de6530aa07
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2026 03:34:41.8386
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WJFY26WH7/GhS6WCEFbbYcY4rSfetwyhGE6jmqmysxeUb98UiQ9jHPglCgq1XEgeXkEX/+nbEor+Lud+MQf9wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8942

> Subject: [PATCH] remoteproc: imx_rproc: Check return value of
> regmap_attach_dev() in imx_rproc_mmio_detect_mode()
>=20
> Add error checking for regmap_attach_dev() call in
> imx_rproc_mmio_detect_mode() function to ensure proper error
> propagation.
>=20
> Return the value of regmap_attach_dev() if it fails to prevent
> proceeding with an incomplete regmap setup.
>=20
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---
>  drivers/remoteproc/imx_rproc.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/remoteproc/imx_rproc.c
> b/drivers/remoteproc/imx_rproc.c index f5f916d67905..0e23f519c247
> 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -1007,7 +1007,9 @@ static int
> imx_rproc_mmio_detect_mode(struct rproc *rproc)
>  	}
>=20
>  	priv->regmap =3D regmap;
> -	regmap_attach_dev(dev, regmap, &config);
> +	ret =3D regmap_attach_dev(dev, regmap, &config);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "regmap attach
> failed\n");


In the main probe, there is already dev_err_probe for
detect_mode. So I would use below style as other error
return in imx_rproc_mmio_detect_mode():
dev_err("regmap attach failed\n");
return ret;

Let's wait Mathieu's view.

Regards
Peng.

>=20
>  	if (priv->gpr) {
>  		ret =3D regmap_read(priv->gpr, dcfg->gpr_reg, &val);
> --
> 2.25.1
>=20

