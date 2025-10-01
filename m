Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011061.outbound.protection.outlook.com [52.101.70.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89DF627146B;
	Wed,  1 Oct 2025 20:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759349393; cv=fail; b=YVi97elhdq6b97L9Th6U8+69017HvZpQWFCbHo41YnWkKrr/8ixa5L5VRkOvaL/jB6gDgyCj9uN4GUn4MihVzkiiutfvNGpgE3hs9IUWPpmvavmN20yIqWV/8LFeYEUr9gX1PHthc9Ded2iJMgkW4W4qLfUodTdh7oJNM5QDEVU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759349393; c=relaxed/simple;
	bh=OxcdilawAgVhKGrESNfURNwn4AxwrIrZUKEemrOjLsY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MKzWtRm/FYrCTNIO4q3PJXe3Po1bshoczCNNLdPMZFoj5DqEnJ6dwlgXJ8eai/pCX+JaxKi/0YtbELnKUvKmHnXNmbd5wiJJrnvP/DNgbxbk2iUjwd8C3qpM3xbJSLXeIKXidW4lqXl3OiLW6/TP+y23N7dqqKMnyUJDSdzVkxo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=l0g7Gvgf; arc=fail smtp.client-ip=52.101.70.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="l0g7Gvgf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dHAHdbW6X1Fwzpu9FTsnk/8d39y3xWgfJwGhHbD9W2A+a3jePuONTgpGSg2lpWi1Dy6HR4wU+WBSe/5Wg8f4ooRn9cgU8ZRlelOUnCCIqblAd96nRH1/f+tauSOx/tcvNnZSeaM4ypuc8+xobnwIVZOhlIRFEwcDY1n63DHdhiiVF+8I9XkXg9DiSn/+skpxpDnACB9962Ey9ucugfMaj7p+BPSK+nzlYb3T22KP2nyPNzEbRPcyLJz9V3kVhaXoU0HJlnqc5nitACFCOX6vZmon6tSb3Fjsy1HlpDvsRJItpPP07KWfkgufkzestdiF1gTJL5RpSBgi0R0hUpnvxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r12MnguW8L5mvyMD2zTs9NXdaqYFLRmMYAGm7E6tPS8=;
 b=KzGVj/2iibM9yp14UUekolcKkNmvWoQvQWINOQxcOTaQPSQNBL8heC9dEJHnd3VyonoUKWdDIKAGD0E7K74+da8pHJhmUWbKy+V/4A56J8TqgQ9D9B/Xf4pZA+bXUuycqlLk2bpP6u65uHmVTCg9k6UR2XFjTChRWGtqJ7SkZJWR2kwb8x79GWRJZFT3TWYfpqXE6Y+4vJPcnKQBKicUabP6+TRcg4NzimuMaA1Mmmf7dt4/Dt7Z/9uWa3ADbtm1oHOxfCUGm3G2AJwVu+eH8Ht/iDHbzi7LMX34dlhgaXn6gcfHhIgBXsVfK7OEgtzFAcmVg0Dy2RSjY7vbfXdDTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r12MnguW8L5mvyMD2zTs9NXdaqYFLRmMYAGm7E6tPS8=;
 b=l0g7GvgfVWN5h7cDvdCnMHwjP7pKN1aysm6Jf2GSdzOKecerdseAqQxAHqmZ/WKSH6wNvWHN9jpLVMeush7UMltAhUu6kq09Gg9OfNRRRJiRVjSpg2+feguunJLLg5TbscJrPlugxDyudhdF0Jot2uJW97YNvbnW/yPNqugy2Vs6HNLCEgRz+bGRaOKUndrQfA9n049DUWUye8SsyCaiQOAPOsdnc2kSRrheFjA16+jzcc2Rvh4q/P0gS8JT7KhbHC3XSI74lgkTWtF83YULgPpAPzWSNs6NwyXuCfuf3qbeP3POPxv5Flc4tsICvwpb1/V2XI/jUPe2DWCOUji7sw==
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by VI1PR04MB9737.eurprd04.prod.outlook.com (2603:10a6:800:1dc::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.14; Wed, 1 Oct
 2025 20:09:46 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612%4]) with mapi id 15.20.9182.013; Wed, 1 Oct 2025
 20:09:46 +0000
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
Subject: RE: [PATCH v2 2/4] remoteproc: imx_rproc: Populate devices under
 "rpmsg" subnode
Thread-Topic: [PATCH v2 2/4] remoteproc: imx_rproc: Populate devices under
 "rpmsg" subnode
Thread-Index: AQHcK/wu+aOBwXRWf0WFo1ZHzvDRXrSoUS4AgAV0X7A=
Date: Wed, 1 Oct 2025 20:09:46 +0000
Message-ID:
 <PAXPR04MB9185B231F18733127969B47489E6A@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20250922200413.309707-1-shenwei.wang@nxp.com>
 <20250922200413.309707-3-shenwei.wang@nxp.com>
 <20250928084752.GB29690@nxa18884-linux.ap.freescale.net>
In-Reply-To: <20250928084752.GB29690@nxa18884-linux.ap.freescale.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|VI1PR04MB9737:EE_
x-ms-office365-filtering-correlation-id: 21320c8c-2847-4ab2-a946-08de01267801
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|19092799006|7416014|376014|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?wM3OaXpP6SL6npoWC1NeVyNKSZGiNxs9H0TqNEra6WAGMfFk2uXRVZSPeLhE?=
 =?us-ascii?Q?pxNMKCWnn2Dt4FcIZ8uDgB9/ZkL6Oyj1nQfI3jyld20uZ5tXXcLEHcfgM1kf?=
 =?us-ascii?Q?4nYnxKs8VQ6tlOpHPxFoz1b8yIB2inNSThBG2PJ6gu1wRHNVLoaM0wBditHc?=
 =?us-ascii?Q?kZOK8eaC/UmVsrgvTqr4RJI47M6sUpinfACevLHBNua9rMY+Ro2WOca3xOTH?=
 =?us-ascii?Q?tv1aMW5NsWwbt61yXLNTzm19Bq2d6C7e69VUXeJ7AaN2NGn7bTRQMhmJwByN?=
 =?us-ascii?Q?FkLZMlRX+AxU/PBdIy2NxT0ikSIWk7WS4nADA+iakLYxvQQKXmbbPqP/DnXq?=
 =?us-ascii?Q?8fDZ9bkw1EB1kFqdIwFoA6KA0LWfuLL8n8N0qoixJAgOSx02Xu9+ZJKCvrpM?=
 =?us-ascii?Q?j8ZIW9t0qhJ6m/oDIblVTGR8FFP3J6EC07ud47oneZyyVq/E6SvoFmin+oRv?=
 =?us-ascii?Q?WEKPLZlIkplBF0NEOp7nHTVVFd7VTxjG8JTIiNc+dPjSme7u+VWcCfUyv0j+?=
 =?us-ascii?Q?1J0sb6fxqQgCNc1UxKqYjzJaE3Fh7LuE1JyJ/6Xi3/yS6aExEnfOEmoUR5F/?=
 =?us-ascii?Q?cCCfSwp1q1p2xhp5coPfxsrHgHyqp6i+cvfeNpxMB+Sfnr2HyEdLSzVJ/GCv?=
 =?us-ascii?Q?RgSd/kS+JcEEmTthDeD70UWvKvFXgALwvKyjX6KuTYK4BBTSVQcNzXeeX7sX?=
 =?us-ascii?Q?421Wp6cIBHK9fFebFNVNPCuNVlg/OF2M6wZt+1tqo4VQgdtkc3KtRU6RGSKt?=
 =?us-ascii?Q?jqEArRbDq0PSLE4gj8COuJJaR8Vl82IKBjzTUZQ+wJRlLeFO/Aj5Y81FoBMY?=
 =?us-ascii?Q?SC2JpjnkpUxaGIhnjY3t3DSMaH9rQEFuZx8pmgEz89QNPgADc+8hLdOH4Zzu?=
 =?us-ascii?Q?8ro5dY4yE8x2I+eBGPIX52CIcRObb7oBvmAf4J/RNiHKNSpHaMdL5JCFhsRR?=
 =?us-ascii?Q?0L+BpM2NyA/qhq7uCrb+q2EM0zbM/LNFCj+NuCgiEtM/t92LJrVsYKriyA6i?=
 =?us-ascii?Q?FcCcSTp7zCli9t+UK+zjkcLhf9ZHdeG9v+QuX2uVpbFKlfeXpFyfXnSbovcR?=
 =?us-ascii?Q?7IwHXu34eF6u2X1wZK3ETZBkQJdxlZsKmBDOyHvHpeLx7+NMKLDDnGyVFjDJ?=
 =?us-ascii?Q?NHON14U294C41Qn2wYe+jmxQGPAR11BQa6apMsPjgUF61zmt8GQbI8EBAb+9?=
 =?us-ascii?Q?NprnLMnyHx8TrIFuqc5L7N5qRgUAvPi1cfS+L1hMWaGQvfJWD+6YBBVc+k5g?=
 =?us-ascii?Q?4nwZ11sXy20PGr+9uU/+Q5obr8lhy1130vgW7yMbjfcwJxrf96B5b2QEEUrA?=
 =?us-ascii?Q?Ly1GN8gCBlBdXDY0viOwXlqvpBp5a47mLRLZF/VEmKQWUCvLOMViv5LqVP21?=
 =?us-ascii?Q?QD/RcNHaqtE7Gcy+GYX2/InQevzyLSJFP6n/DUvvvuUUTQdpVRsjV1ZInoGI?=
 =?us-ascii?Q?8s4ef4MQK1K2ddnmdG8wctwoc44T/29iyXBwefXhv0HseCWq7GfX5Ub0FtG+?=
 =?us-ascii?Q?BhAKKswu6sgxUfbNFUQYZZMwWmuq9OhjfvUZ?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(7416014)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?1tbizWQXLDvamJT9AapdOb9SqTW/vlTrYigl4Pht+G3G6aSmTV1nldB3Z6u2?=
 =?us-ascii?Q?Z/EdoTyZkJzm8ZFMSnZTHx08MfI521/34P7OE5buCBJZtAEfAeuB1PChkyIq?=
 =?us-ascii?Q?FshsX/ADLCI/tgC1oHIAFx9rzlKcMLUaFjwrfkhrqlvdRY9ctP3yVsFpyuxA?=
 =?us-ascii?Q?QdRODuzIRmbCoor9sy3EctzQBm/NEPyNQvN1PgazHYkOldCtROBTsQAngK0U?=
 =?us-ascii?Q?iPfK52vMxfu+HYhYicwR/9NHMc9u8MDq0zEMksAAzyTnnyzdSmq2fohBwjP2?=
 =?us-ascii?Q?vndJzUZRRg4BOLRvF3uiLUEiv80A9+YehlBu18pqCH1mLt2NJ1twE7caRY2h?=
 =?us-ascii?Q?aGsk/MzaupYcXxvoNINNwZRMKQYwuZirs8lWesVm5jsTrR5U/5sYrBHj9fEU?=
 =?us-ascii?Q?tl6CT8zR/bhQSDEpqAPwMewr+CD0Y/r7O6UFmFO0fVllOmA1SGGliJqn3/V+?=
 =?us-ascii?Q?ZJNpye4d4Xoqmzr8MPw3ByUZocoK+IPwl1TTZ5pt2qg+NA8JO+HpYK2CY1nn?=
 =?us-ascii?Q?q2nsQyd+kaphz5214HjWYXWUF5hkKpUPXXLgeftWBJvxsiaX8rOnveN6CN9v?=
 =?us-ascii?Q?WYvs3QSpUS7tnXSXl59WTW1Xjfb4cegCFu/B9JM8KZLpgRcnw9KOeSRDD2sT?=
 =?us-ascii?Q?eHxsyhqD3cMjfWcD0ybAVjqt5zn1sLJqLBn1XslsP8Ub/LQ5uQF5zhVXyMXX?=
 =?us-ascii?Q?h2TwAp0XzzhhFLz8vI0RSTWvulrcemHyHDVvKXKYVSemigsvywT8DKZ4qsnM?=
 =?us-ascii?Q?4/2CVadNO65Lmd3/PAuvpMMCHNKCLP2pB7Ya9FDEduwZV+aADitTJQP1m5Qg?=
 =?us-ascii?Q?kgSaRif4moCyJQUaKIgTOtDIbjNnizM2MKvSp7JSpr30u/Urfeq81iGXgP+p?=
 =?us-ascii?Q?QDjA+NSvOrF7Jq61dS9a/aj6VXvgJq4yTKcNpXxU17/32VE70lKvUBudCq+z?=
 =?us-ascii?Q?QPK2Zwp3ySGy69KzdJlhklYDA1BE6GE3DGiUSvW1v3NGpZZKM/UkcT1sge5f?=
 =?us-ascii?Q?EZ1k9msXPKDmG9u2BkAZyyrYBS/xv0CQizpugluV24bVz3hPvDNr6XIP0D5p?=
 =?us-ascii?Q?gnqxYHoTyW/vxyVOSpDuBJPHUvoeNBveqqXBXLeyG2EORem2bhlPWXruIa+j?=
 =?us-ascii?Q?fB//iK4WApkaagOe3pmgbpcRk1hvSS5AaezH/nNt9wyotTytsRxezZl6mJeg?=
 =?us-ascii?Q?4hDVFQa9PMqoFOzmVMcz6Si9t178LbtF2XKak0TCKYetJickzHWdl7avyPP3?=
 =?us-ascii?Q?h48YWz/cMHP47qphNl3wRS7I8Ubq2Q1A9gi6r1sNQ6OaWb6+AS6m/2SkUnBK?=
 =?us-ascii?Q?Qv9Lo24zFMPshZ2eHddHUuycxMnbT5u0d/v4+UTP2pPnRUKpW7rI1UnViAJ7?=
 =?us-ascii?Q?O33544NgRe/htMqms3AZyC352M721026Lma9IsR3NxG3lBBHOx9oAfVG8Xth?=
 =?us-ascii?Q?I9lQJSyqV4kgZVQdPAC34YsQgaKDV2ad1PLf/BYvtKPw5frF+xSo/dXCuiMU?=
 =?us-ascii?Q?UgHOC3pIaflgJkmZFo0OAtI/cXcYHM+4RVvN5+qTfBI1SNAiDfTNfezv+Yjq?=
 =?us-ascii?Q?YYUr2nP4ujvoH1UeHaQ=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 21320c8c-2847-4ab2-a946-08de01267801
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2025 20:09:46.6743
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PDobZZUjOK7N66bEtive8RHiD64edgjXMMOW0mDLymRHERwo4Iw2b52MUtXEdKHWqZSeRqRNm8+GuJ3vClHgYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9737

Hi Peng,

> -----Original Message-----
> From: Peng Fan (OSS) <peng.fan@oss.nxp.com>
> Sent: Sunday, September 28, 2025 3:48 AM
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
> >+
> >+	drvdata->rpdev =3D rpdev;
> >+	auxdata[0].compatible =3D channel_device_map[i][1];
> >+	auxdata[0].platform_data =3D drvdata;
> >+	dev_set_drvdata(dev, drvdata);
> >+
> >+	of_platform_populate(drvdata->channel_node, NULL, auxdata, dev);
> >+	of_node_put(drvdata->channel_node);
>=20
> of_platform_populate will decrement the reference to drvdata->channel_nod=
e
> before it return. I not see other places increment the reference to chann=
el_node,
> of_node_put here could be removed.
>=20

The of_node_put is to balance the reference counter which is increased by o=
f_get_child_by_name in imx_of_rpmsg_node_init function.

+static int imx_of_rpmsg_node_init(struct platform_device *pdev)
+{
...
+	for (i =3D 0; i < count; i++) {
+		ret =3D -ENOMEM;
+		channel =3D of_get_child_by_name(np, channel_device_map[i][0]);


Thanks,
Shenwei

> >+
> >+	return 0;
> >+}
> >+
> >+static int imx_of_rpmsg_node_init(struct platform_device *pdev) {
> >+	struct device_node *np __free(device_node), *channel;
> >+	struct imx_rpmsg_driver_data *driver_data;
> >+	struct imx_rpmsg_driver *rp_driver;
> >+	struct rpmsg_device_id *rpdev_id;
> >+	int i, ret;
> >+
> >+	int count =3D ARRAY_SIZE(channel_device_map);
> >+	struct device *dev =3D &pdev->dev;
> >+
