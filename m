Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011014.outbound.protection.outlook.com [52.101.70.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A66130AD14;
	Mon, 29 Sep 2025 15:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759158004; cv=fail; b=ibetiYeqDGCQXIxU+HvTqlyKUNFrKL/9Hxo5Mb4P81UwCZFwL/NOX/ys+CchVDb6nTcurS/EHYZM1D9s5Zhcdqt8/JnR9of2JUoygZrAwRko0MLBbHWXyNl6aNFmfDdTg9y32Qp16q+k/1EGTpOlPozXppy2GCxPQoEN/uGX3Dc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759158004; c=relaxed/simple;
	bh=PUzhr8RQFAeUCbb7T2i9rfONWPKXjDxRWBZUvR6aK5w=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qv4Zd1clojoI7EbsHgghwDlEhsS+j9Dn02LK9McYyuD4ZktchYHuxhM77aCkKYLqyReU9vF5DHW2TYuT8HGNFSftpDBtvAlyUVgOi1q/V7DfbuqqxJ3prkdoiIkgxyotXBEsuvO9kAVMGSxj3SK9IVXoIfzpdfUl0KkqRFOEBDE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=RoVFwGUL; arc=fail smtp.client-ip=52.101.70.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="RoVFwGUL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i1qhF4psyI71Wds9fEvNqPpwQLnwiJaGTSZ2es/h1rbo1GZxKLfcKawbTdZF2YDgH9TJJq5vgZFKnBnss+9N3n27J4gcYFnrgU/ZUlVjz5p2p+XphpY6YkRifmV8/bWFW963zTCPr8tpOuy2WFm/QK2PmgM/p9oVfoYwZIPFNluq2Mq4gzDvz+s+9khrLhe08TDuqmRWnu74ieH/SMuSxN8QFgubt4JCl45uvDJDchCA2b1lW8Poj+A28NsR6Gb/N19/Zih8lJqC/k80iptRHhCl6KSMPTHgBXrlU6jNdZk+7SwqTDqBJBs08d8NNetRs87AcM7LiO+dtHF0GS2T9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s54dWxUBcO+5ROxgAPakUJtFjBVA0gMIfismE6hXwjQ=;
 b=Yc8JdL1vm9dWAWm58QkY1NQi4c7VlKGH5nIvURurNbi3N/SKiEQikZfOj7YsiQMX6RffeysYkyVsM7bvr28+qHk6i8yAreo/8bT5Lv7oj651AXYXGAtDx6WAgnsLsFTOKLkj53hBzJQPkm0CembfpUzJApbzKzaLWcV2yB+Fy7FEmIMbylp7ODPTlOR8/A4CcAuqh0xd9dIG8hnrwg4xI+a/FnwNANoP6oXdjhRpATFxN3NwsvjoHXAdLaP9Hr+asXPc3l1kDjWO37cRD0S3q+/D0hmqwqq7vZfz053hxlKs4ZkDqSwkUaLArBNzTrBp9AVapTdITgMd8Dj2Ua2Lzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s54dWxUBcO+5ROxgAPakUJtFjBVA0gMIfismE6hXwjQ=;
 b=RoVFwGULShZpWwaAA7Ll7JjGJsv/Tq8FAvQNU9t/bamQ58t2LJKnzxI5ALo44sKEjeaH5f37uNCfiiJYWacsR4wVYOmRph6VxYbTmVVDkMbPY5l8arsbIWABC5A3IIK9aUlCjwRJQ9eUwUzj37is/dQG0E8DgwPwyCLuDoP69C0V6vN6aKheUB9z6GULisBtazLFN8tWJIZ/vnSlT0A8SJ/+nwRwaPxfDfhHFWLyX8wrkVzj+mu8woI2uHsjynJFECjCmyPWC7zT//siDI+w29Zgf08pQ+TmdkGwRsgsVO/Q+oBsR/Uz5unijMMTTA4yH+8zSA87xgLOM021Yy/Ztg==
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by DBBPR04MB7500.eurprd04.prod.outlook.com (2603:10a6:10:1f4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Mon, 29 Sep
 2025 14:59:56 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612%4]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 14:59:56 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
CC: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Linus Walleij
	<linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng
 Fan <peng.fan@nxp.com>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH v2 3/4] gpio: imx-rpmsg: add imx-rpmsg GPIO driver
Thread-Topic: [PATCH v2 3/4] gpio: imx-rpmsg: add imx-rpmsg GPIO driver
Thread-Index: AQHcK/wx2iUEcIZWSkSwbhQhQayDwbSpjLeAgAC7MhA=
Date: Mon, 29 Sep 2025 14:59:56 +0000
Message-ID:
 <PAXPR04MB9185CD0AC1396865AE82BF77891BA@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20250922200413.309707-1-shenwei.wang@nxp.com>
 <20250922200413.309707-4-shenwei.wang@nxp.com>
 <20250929033713.GC29690@nxa18884-linux.ap.freescale.net>
In-Reply-To: <20250929033713.GC29690@nxa18884-linux.ap.freescale.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|DBBPR04MB7500:EE_
x-ms-office365-filtering-correlation-id: 58bd7e1d-d571-4a4d-c0f2-08ddff68da93
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|19092799006|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?0LQtxkT14e6bQYfe+j8g/aigniPLPl8m+BJgoHTSWYOOjOC/CUp58yGJVFW4?=
 =?us-ascii?Q?67ZJhu6zjNnahdELLGgwZASAzfg7zSD33oEvh/niwsqGVP1aQ3gwM/Li8Ftd?=
 =?us-ascii?Q?QDcwvDdyq00jMQrJ4rVtG+nhZwV9qUJoPwidlicM3XA0loJMd9A7iiDy/GXm?=
 =?us-ascii?Q?VIP6Yu4ZPExTtclReEALafzO/bhCSPNFZ30UX9UsNf+W8IGIpZUBdS/7Z0+U?=
 =?us-ascii?Q?H7mUGZUymQhR3ORR/shwCKi11nTUpr2e/remWbGMMsvjqaAljWJCDJ3Yv6yf?=
 =?us-ascii?Q?jGWOYMSsDzoM3zL2Fk1WBsdC9d3kV4HMzpVVvHnkDv2IOqSAeLh50GVykqiH?=
 =?us-ascii?Q?DrCFftyZkF7LdJ/kMnHhyXQRnNkPik5YUgqMkk66hvX0LXzSw4JEiUZ3DlKy?=
 =?us-ascii?Q?8GgsjG6kzdOzYddjorTjNe7UWyB7ZK9SA/zILqECe8aCp1q8cajIwuv0AhH3?=
 =?us-ascii?Q?yPO1ZkBZmzwo9x3ZA/g5aZNWhIDZ4Ex8PlmIiDT4LAq36yEFxjkedtjEP709?=
 =?us-ascii?Q?KTm3xdtlLqre4vM19icCCG1nTIrT5cknExsVBWBt3q2YoPQY3wthBG9AQPt4?=
 =?us-ascii?Q?fgxW3lJNRyteqqSvTptyWmasZa1rUWocdZcX/dtH0BsnRHbzyvTLxAaYU3Jq?=
 =?us-ascii?Q?bvJjCWxOOIoRHlyypt0vloKcyOHkDCYAqZELXlm9gzMY3E5R2ZBpztr/FqfZ?=
 =?us-ascii?Q?W8PHXmD8/vE3CTtAt4mekSiGhEW+JWaWBO6g4wYCgaTXW48TheJvfcmc11+8?=
 =?us-ascii?Q?0J8iKUUtSVmopntiYbXnyaeO+Ki+b5nn7FXK7a4rsZznKI10nrofdeVAQoYY?=
 =?us-ascii?Q?bXS3JaCZpIMLIPaSBbKuJtqOwfhOgUwytbuNxDCXlQ2kASs8fmj9ksCr1ynu?=
 =?us-ascii?Q?IhRgw9fnyTEB8vLBHQRP/oBBQE8xe46lcGVfAhKhzgYM1TCKHt2wOmwFUAez?=
 =?us-ascii?Q?cqI0WEM92B8vRX33nf3GgMHIifhUimKUNcSUd8bLH1Q6dpzcu0q4Wjd+Sdb4?=
 =?us-ascii?Q?0/d//LMFO4BrB8sBRg6D9h3vRT/PL1EStm4GDS02p+K159aRjaVabsHao9Vu?=
 =?us-ascii?Q?+OPp+XGKv/oCBeuvYmpRpuwrvTy7qVoMoOfJCz9cFl+zB8730LJzeUz73JbL?=
 =?us-ascii?Q?GgMNx2MwRwJZVBJkUpKWcALzd82nz2lDqSgHJM3Y0arZGj0xEFzlbah4W0dT?=
 =?us-ascii?Q?OOfemDR2tf/hpeihvJI36H4h8Xh/UK6YoiVOVOHDQD3a1q+8hryw9q+bbG/t?=
 =?us-ascii?Q?eJXvyZ4PczfCrLFl2kLr25iBPa5pmfvaRR4H+8hAlxkL/Y36P9IZK3CztSw5?=
 =?us-ascii?Q?THBrB0q8H66wxxwbHnE5+8OVmRNrTxANHfgSp/8jxrs9LaIcQk60qah/Uy04?=
 =?us-ascii?Q?t2vFgzT+GQoTUFV0ndMWX636a5BopE4WPnaF3BdCuqKQ94CSOWZrPqGUvFCI?=
 =?us-ascii?Q?T9xJfeM/534lBPxkldq0b9Y1v+ZjffclDct5lNid3YkrompOeXYE+Vvszw+/?=
 =?us-ascii?Q?ubCxkiYMk/vJgvWtmgeoIsjKhVn6h8/7e8ZM?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?zMeoCMLxiUFspYH2awHtniGy6hmWXvg8hn60JnK6p+RiMEFj4PVzNgyHbGke?=
 =?us-ascii?Q?RwYu0WGFPtZXTP7moVsGie9mtgUtSRhv5Ne9KR+MDGcDziLEDMWiflli/Yv3?=
 =?us-ascii?Q?v4UZSc90dx9juyOZsiiFqjy68VHpxtr5kM0QT+PQGquUFDw9NkVH8qmyC1mT?=
 =?us-ascii?Q?A8HaCND+UilZVEcPLpet4xsTWKobAQUqWW/nTUKwbHjRGwQnn6+ozF192VGx?=
 =?us-ascii?Q?U3VBrgKvSZcxmMQjsz4gN44uUmshav/UuNhd/EHT52WlPOkdpLNjRYekW8Ol?=
 =?us-ascii?Q?c3eZ2ltfzgjy2MQ2CqC5cDREIo0MrbafYBPspATM1KDdpZmAPXPvfbBlzt1f?=
 =?us-ascii?Q?RpRDAqo6MT0DTH6pNzSUD5Glxnjc7DHR4VT4kSs79ZN5dLIvsJE4btGw38Pb?=
 =?us-ascii?Q?eygnNoZLSOKnbKwMNH7KjrfxKHEpTagOfRTXyBYnMsF5LdBmEwuLzpdwziye?=
 =?us-ascii?Q?ki1APa6u8t8wiu8tuL/wEIhiIodaMl4oQw5dFJ8o5dYAaqzdN8nUBaWGmwi3?=
 =?us-ascii?Q?di33LJid/we1oI7zL8H5nHCtHVGSEDtfQsz8/BCPO7Cuv8ucCqaZ7eUUhbv2?=
 =?us-ascii?Q?mjgkPpeQkkyjSfaqWSAr0pZ97FCNSqz1/+1dyM/XtBchXMyZGrr3YZ/0XCzq?=
 =?us-ascii?Q?MvKI3+5xzIMLpWMw8s8Fe/ZSOqKvBQVhSuVgzE1KEvd0dpmr/J9iEwbbsk7c?=
 =?us-ascii?Q?E84uVpxEBNgS4ZaE3PZHbEw680TsMnDgxKLrk4YfPPksQS7TWQ9y0i6nf+AI?=
 =?us-ascii?Q?mSiNyYfIKksfI186oUV5zm74y3dyjg8EK4iYN2Cu8A2x4EZvpfPKEyCEMO3v?=
 =?us-ascii?Q?WOZOgOaE+OuO6E37A8Du9cdCIJwwoGmn9dhsBf86WoH0X7nVS4lJSvkrTUFQ?=
 =?us-ascii?Q?rQ1EFyHr1EJamjG/GeWyxXRc8rneSr0gt6TBD4iS2oVKxr/BAiS2701AKylX?=
 =?us-ascii?Q?tue0s81eLm8Ddi2jIMmSaxWZdEaydXQ8I2caq/M4+sI1lZ25UxEVUzP/ups3?=
 =?us-ascii?Q?xDCvYFU1n6xBQBzH5faVU2xui8bFIfhM3lMR3WzQpDU0YtLMsnFq+tsJuAy+?=
 =?us-ascii?Q?LUAQkvr4L42ZhhokoOgRHnigE2f4WZT6/xQAwrg8gBAjZXr3Z8ur1OYqsXBW?=
 =?us-ascii?Q?+/YkifUu5I7BshBthWktjpFiluOeP1/OIypy/izPdX2fWZN1s4w+NkzkWorl?=
 =?us-ascii?Q?X4YLBLSiw0JIurqKIQtj3Q7r19hjQw7VQu+D2DBjDipiAcnJxYW0aWgDlMtY?=
 =?us-ascii?Q?+6Ohmwylcin+Jypd+44ynlEUwmYPVEOkVTzhWwlKx9nbb/nwFIoaaPSt1ouK?=
 =?us-ascii?Q?xeMbBCjkW35AkS6bzhq5nj1UF0dxxNhv9kjHPndJxuA8oUElqBcwUUK2mKFL?=
 =?us-ascii?Q?PaTGBNtAUOsv6wZBYzjTMi52F+2w20nmS2Ljq8DOLiUanrArEvondnBEmr7I?=
 =?us-ascii?Q?Mjf+f/01MzVm7JnZs6tLEu5lf/7exXXWaWSU8/9tSW5EREmQ4wCAJZwIRzYQ?=
 =?us-ascii?Q?5kmzEZtdWJdhMkTqwMDTjUz/22zcvgG0atizhF6tqGQpC8ag+4eBBbmANL2R?=
 =?us-ascii?Q?FzBk5enbYrPFdyloosIrJKAfvo0nehLrfn98+DI6?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 58bd7e1d-d571-4a4d-c0f2-08ddff68da93
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2025 14:59:56.4656
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4zVcUjuk3OcGGKHh8Je4cFt8nzm+ck1Erx/aG/F9j6aGO5mhZTITOW7Vn7AX9PMSSMeU+78FI5fGlAltH5QRKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7500



> -----Original Message-----
> From: Peng Fan (OSS) <peng.fan@oss.nxp.com>
> Sent: Sunday, September 28, 2025 10:37 PM
> To: Shenwei Wang <shenwei.wang@nxp.com>
> Cc: Bjorn Andersson <andersson@kernel.org>; Mathieu Poirier
> <mathieu.poirier@linaro.org>; Rob Herring <robh@kernel.org>; Krzysztof
> Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Shawn
> Guo <shawnguo@kernel.org>; Sascha Hauer <s.hauer@pengutronix.de>; Linus
> Walleij <linus.walleij@linaro.org>; Bartosz Golaszewski <brgl@bgdev.pl>;
> Pengutronix Kernel Team <kernel@pengutronix.de>; Fabio Estevam
> <festevam@gmail.com>; Peng Fan <peng.fan@nxp.com>; linux-
> remoteproc@vger.kernel.org; devicetree@vger.kernel.org; imx@lists.linux.d=
ev;
> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org; dl-li=
nux-imx
> >+	if (!port)
> >+		return -ENODEV;
> >+
> >+	if (msg->header.type =3D=3D GPIO_RPMSG_REPLY) {
> >+		port->info.reply_msg =3D msg;
> >+		complete(&port->info.cmd_complete);
> >+	} else if (msg->header.type =3D=3D GPIO_RPMSG_NOTIFY) {
> >+		port->info.notify_msg =3D msg;
> >+		local_irq_save(flags);
>=20
> Would you explain a bit on why need to disable IRQ on current core.
>=20

The generic_handle_domain_irq is required to be called in an IRQ context.  =
Seems it can=20
be replaced with the generic_handle_domain_irq_safe here.

Thanks,
Shenwei

> >+		generic_handle_domain_irq(port->gc.irq.domain, msg->pin_idx);
> >+		local_irq_restore(flags);
> >+	} else
> >+		dev_err(&rpdev->dev, "wrong command type!\n");
> >+
> >+	return 0;
> >+}
> >+
> >+static void imx_rpmsg_gpio_remove_action(void *data) {
> >+	struct imx_rpmsg_gpio_port *port =3D data;
> >+
> >+	port->info.port_store[port->idx] =3D 0; }
> >+
> >+static int imx_rpmsg_gpio_probe(struct platform_device *pdev) {
> >+	struct imx_rpmsg_driver_data *pltdata =3D pdev->dev.platform_data;
> >+	struct device_node *np =3D pdev->dev.of_node;
> >+	struct imx_rpmsg_gpio_port *port;
> >+	struct gpio_irq_chip *girq;
> >+	struct gpio_chip *gc;
> >+	int ret;
> >+
> >+	if (!pltdata)
> >+		return -EPROBE_DEFER;
> >+
> >+	port =3D devm_kzalloc(&pdev->dev, sizeof(*port), GFP_KERNEL);
> >+	if (!port)
> >+		return -ENOMEM;
> >+
> >+	ret =3D of_property_read_u32(np, "reg", &port->idx);
>=20
> "device_property_read_u32" should be better.
>=20
> >+	if (ret)
> >+		return ret;
> >+
> >+	if (port->idx > MAX_DEV_PER_CHANNEL)
> >+		return -EINVAL;
> >+
> >+	mutex_init(&port->info.lock);
> >+	init_completion(&port->info.cmd_complete);
> >+	port->info.rpdev =3D pltdata->rpdev;
> >+	port->info.port_store =3D pltdata->channel_devices;
> >+	port->info.port_store[port->idx] =3D port;
> >+	if (!pltdata->rx_callback)
> >+		pltdata->rx_callback =3D imx_rpmsg_gpio_callback;
> >+
> >+	gc =3D &port->gc;
> >+	gc->owner =3D THIS_MODULE;
> >+	gc->parent =3D &pltdata->rpdev->dev;
> >+	gc->label =3D devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s-gpio%d",
> >+				   pltdata->rproc_name, port->idx);
> >+	gc->ngpio =3D IMX_RPMSG_GPIO_PER_PORT;
> >+	gc->base =3D -1;
> >+
> >+	gc->direction_input =3D imx_rpmsg_gpio_direction_input;
> >+	gc->direction_output =3D imx_rpmsg_gpio_direction_output;
> >+	gc->get =3D imx_rpmsg_gpio_get;
> >+	gc->set =3D imx_rpmsg_gpio_set;
> >+
> >+	platform_set_drvdata(pdev, port);
> >+	girq =3D &gc->irq;
> >+	gpio_irq_chip_set_chip(girq, &imx_rpmsg_irq_chip);
> >+	girq->parent_handler =3D NULL;
> >+	girq->num_parents =3D 0;
> >+	girq->parents =3D NULL;
> >+	girq->chip->name =3D devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s-
> gpio%d",
> >+				 pltdata->rproc_name, port->idx);
>=20
> Align pltdata->rproc_name with the upper line '('.
>=20
> >+
> >+	devm_add_action_or_reset(&pdev->dev,
> imx_rpmsg_gpio_remove_action,
> >+port);
>=20
> return value should be checked.
>=20
> >+
> >+	return devm_gpiochip_add_data(&pdev->dev, gc, port); }
> >+
>=20
> Thanks,
> Peng
