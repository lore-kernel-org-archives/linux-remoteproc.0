Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013011.outbound.protection.outlook.com [40.107.159.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2DC26E704;
	Mon, 13 Oct 2025 18:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760380877; cv=fail; b=ZJcg2r/yOnBqmokNf23djEYlrSb9LJ4t0CFhBVNPCo6tlXFq43HYK/mKpJUCJdEU9dWh2DqOAqY61xWwDxlmlA1dg9a4kWQcN8fsWZtRZI5UEDCUBGdEkPXbQKsse9CLISS7hZXrfsDNbzGBgX7QBqX5WXaOBt+Zr730wnJz+ew=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760380877; c=relaxed/simple;
	bh=AGoS9HhbY1y2gfF23qMo7B85x24dLra2m0NKVvQk2tU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XC4ORVX3L9ZYCpXxJgDD+VW57bteuL1V0kC/BSDn2KhAl/gETGtEsM/e2Mv68EBZj3OuDT5Rzwz1zuAJB8RI/M2STwWQa6A9dZOLLjqNnpQ+B3fydkFxAijJnGnIqepWO+3am81CHM6aefWip8TmDXfekO1mSjs2jICKgLMIFrw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=H2cyQ2BR; arc=fail smtp.client-ip=40.107.159.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="H2cyQ2BR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sV/bYcVklyZFM5ksRrUqoqlAUiY2XHzogXkYCcLtK2wEZ/TCATc6KqvW+sl02YScZWKRJtVVvQK5P/Se/9VTW1D4G4Ed/sJwJ5o3wXY0Jb+ZMikI+CNx+OQ2u5l04tx075Vb4Jw0s4yIWuJP7l5SBdw+cM8JIa6gAZCNoWheb4fXb9jK0QVT1EDBA0NAUjGfgbk/aEF5KRy5OBcKcZFhUv8+6U3zod1Isl0cgwN5iJqs6pi8cR1xzJC01RCZXtP10B2OZu191q14133Lr79iS73uj6r+o/awhMxiEwniYu9/JeTx4+JmFB67tuJP+mU/c70rQ/nmNP0HY2ycRI7kkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VcZD7PYUjCBEbDj/wu3dEGtOw9P6eOXn7RfnhvBryR4=;
 b=lIunFSrVfdpZcHx9uZo0hkqHUmHANEe/xfP60DcLE39T5e5yOjxt9jlnPiDPGWPitTRSYAyW8hYrimBbyiiUz0PgbHNWuQ7cTTqpaLAjEFtCpJkPp5jX7G8XaTXmuSVvWs5pAhdUpsc+Zf1HBYVvJY5S6mue+pTPMQKF1BnISvUY7L2YX/60rlnwFWt3uSCSKJRwaqbmd0yjGMCTqBZHW/gXQm45E7EcvINRkzFkvlX3ulmXxfzEF8ihEe5kL19OGsXHSwCO1D6dL+aY0y/OE6NI4LkI/uSqAkkrCHBXLx8kMzBEeX4zV0CQv8ZuiRvGieP+pqBcNf8bUfe+LDPCPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VcZD7PYUjCBEbDj/wu3dEGtOw9P6eOXn7RfnhvBryR4=;
 b=H2cyQ2BRBF05rN5tdRFxwyX8VDcu2rSdAmCNKTHwsIPjAJ8yFIRt9VeQ1B3GLJzh1vJl6QipcVO6ksiaUjZVbgJ7uj6R/jBwcmqju1thLopcyJWBBX+UVjlqRGWXD7yZ8o5Td8ULqcwTMN4d043W0D03NV1uF/USRSVJ4filGvO399nv5pwIisYEl/FE3Giqx8OjQP6pU9DI0L6aQiuPquDLM0LroU5vnrRXdKGgfHsBNS+NvfyihEwlB04qC7cuYaW14qwu1LcQkk8h2ivi4VqfYhA3GxdtmV507g1YI7p6OuQUz85uSvQnJ/MvkRDFZsYmg0fuAcKAYEUCoz0XBw==
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by VE1PR04MB7278.eurprd04.prod.outlook.com (2603:10a6:800:1b1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 18:41:11 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612%4]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 18:41:11 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Andrew Lunn <andrew@lunn.ch>
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
Subject: Re: [PATCH v3 3/4] gpio: imx-rpmsg: add imx-rpmsg GPIO driver
Thread-Topic: [PATCH v3 3/4] gpio: imx-rpmsg: add imx-rpmsg GPIO driver
Thread-Index: AQHcPHDxrwBNnphHPkW1XfQLsNQyvQ==
Date: Mon, 13 Oct 2025 18:41:10 +0000
Message-ID:
 <PAXPR04MB9185DB2E801B8A2139C7C29089EAA@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20251009222716.394806-1-shenwei.wang@nxp.com>
 <20251009222716.394806-4-shenwei.wang@nxp.com>
 <eb99d9a8-eb96-445d-899a-6e1d9b6f6c69@lunn.ch>
 <PAXPR04MB9185A829534963B22D1C49FD89EFA@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <6025be80-7007-48bb-bdd1-c8198e951400@lunn.ch>
 <PAXPR04MB918524EAA74F72D64AE0ACA489EAA@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <f5b15eeb-a183-40bc-993a-49736739c0f5@lunn.ch>
 <PAXPR04MB9185A0A5494A00280F97676C89EAA@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <08a8e0d6-f486-40bd-a2f1-43e33ccde1d2@lunn.ch>
In-Reply-To: <08a8e0d6-f486-40bd-a2f1-43e33ccde1d2@lunn.ch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|VE1PR04MB7278:EE_
x-ms-office365-filtering-correlation-id: 4a159cec-bbc4-4508-388e-08de0a881483
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|19092799006|7416014|376014|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?+T1qFpMNEZNSKa+WRt+XcC8nwtqPysBCqtzjovPWwF1fRScqqPhQ23JWe6Bw?=
 =?us-ascii?Q?Zbt5rllqRAg8fmaUe/jsTW8zbB+m49I87c8m+amXXojMT72hUy5l99A9euvz?=
 =?us-ascii?Q?SbdDONMWERWLThN1BQQnXv5GM3pEChtx9/2ovfOeJ7rya8za4+d3l98c9pw0?=
 =?us-ascii?Q?4q7HWwc1mIpnw+pmHSaDEcA95ImXDcWRLXCV1DZenmC71c/ykI/tMHelRZoc?=
 =?us-ascii?Q?Rn9z33ttsi/tYZ1fm0pqWj61BoyCiMvSyEFZv46JWb1mldqmibUWH6T1f2zZ?=
 =?us-ascii?Q?lWZ4Sqgeh8y+T+oPz7m1qvSJtj0cVvhANbEX20qNUDetyG1qbpkkgQSHEazU?=
 =?us-ascii?Q?l4zml+uXi2/bHBwpiS4BhMegA/H7OLIKrJB1ruh8Ku+4QCTH+0m7vCawbFAv?=
 =?us-ascii?Q?GpuVWIRPGBQl3gV4nqAxWnK1O93eQXbZofzo0KdQB41PbXn/HMPW+rybE3Px?=
 =?us-ascii?Q?BnrkmLNGXb6fMf4EC1nKuIR1VOGqwr1emhwbPvD6MX6OJ0g5oNYZhrZ6KXTo?=
 =?us-ascii?Q?dpxV0VdcseFAR58I+7xLCaN3v57YEPlvobZeVNAQPSsXUfdHMNfqLLZS8P8+?=
 =?us-ascii?Q?1IK47dI6sfCeejc9tY0feXYw0X9QczMA5ml2bd1Q9MFhA44hhjFZyyxLRiwB?=
 =?us-ascii?Q?VmP2Xm8T2lhePpWW2uqF0mdu8S9h5FejVkl8dB3CBAB4CvTvG0gDnSr7FxQY?=
 =?us-ascii?Q?98RkOcuRFHc/trfClRQWbeYGEBoCxpUN1CYklgpRrqPSO+5t8COEER3WkXjY?=
 =?us-ascii?Q?y7QGF8WcElD7ks87crXp7+kt4PMGiH2fei5iZp7Pz+FVIQ6b6xLGVmvEDDzN?=
 =?us-ascii?Q?QWErKu/MGVSexKMGWlCY3PiGCi7HsqySTQn11qW/3PzqbE61Fqm6D7iUl/92?=
 =?us-ascii?Q?FVN7sn5cfWCDUq8fd93SbKPICcAb24DBJ71WdQZ/JjEwzo9ovGDGTfxhwlFR?=
 =?us-ascii?Q?tCVrkrA+47M2CJMOF/Dde1Z12bp7l4wLhh1ZWENNs+n42tvmWcTv87F0kApw?=
 =?us-ascii?Q?Q+pioTbU+bc4SV80kpQeN6M3OE9bWEleD56bQBYNfIqNI+8FB0Ht0cUqNIaF?=
 =?us-ascii?Q?roht9FOgHTeTS3yvmfgAZPOj1gfrogWOCa6p0iZYFnMHsxvwesfc7wy9Zhfr?=
 =?us-ascii?Q?8bwwrpVZka8/h/NlML+tc7j1KOf/M19nDiwe3E8/oEJYsc9S6OahVI8m50CT?=
 =?us-ascii?Q?jaBF6NYkbV77zKhVPxfz6XdoDZPHXBqbGl3mtNUQKKInyVmNf/FcEdHxCccy?=
 =?us-ascii?Q?LDt36IA7tEoix8sPML7lqsa85ONnzVawxKiqSHCLk1BFUv3ludH04lcgur+U?=
 =?us-ascii?Q?dF/hlUJHVHmfbhx7Itzmk3hhM+B9ksiQQjddQce4UpbRMPLyiVggcgHdpMos?=
 =?us-ascii?Q?dSNtduSpp+Nc/WdJcgIaGlhBwY5Zc0+SffOPgGFR3GmBX/Gu0+1uASVNFZp3?=
 =?us-ascii?Q?9AAP0kQAVhpBg/wmyQNlttR9eutXL6AEZtt+TgKSOTB/aK11CR8Wdgjt+8ob?=
 =?us-ascii?Q?AbsPYjH4JWSLGxGM5UXm97sTVCrX4g5NjSW5?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(7416014)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?nZBTuCQezDrQF83x+pDDP3pfvfN1Ar9UhRJMlxOw+K+lmGxSFu6lfnDWr+h9?=
 =?us-ascii?Q?ec5g5KgHSQ0QA01n/OBVuIijzANayl5AiQ9S+h/6psLD9thCBTl2MDjwimuu?=
 =?us-ascii?Q?X1wq0AzhZfU3evmJdF3QPieSkIox+Pkq6TQUC0NuEL0+QGP/R3bvV3B4t4EX?=
 =?us-ascii?Q?lmuV/SnFo9fY9ukALsXrV8hPQxb1tYKvFPtj4It/C3DJzVk01w/Xg2dr0wUf?=
 =?us-ascii?Q?h0KZcArm7d5kP/IsGqsSrMpck3hQWeIjQuMOI0WlYJz4kmahg8nIOlNjgK8u?=
 =?us-ascii?Q?biD596l3kpxQVlFT3Oos6QlFvBHkscdZvZUeobhLddphzV+vklgCE210kJga?=
 =?us-ascii?Q?3Tc8MNPV9J/2dp+BGm8mMLDNQDrSGf8+GX2JK10LbjgMXxly2uZzZgt3ME79?=
 =?us-ascii?Q?/0/PDLAWI8HGvo3yOHB/l4zPEiDcejB2023ri0EBsqseyOFjRYYf9kUEmcKD?=
 =?us-ascii?Q?XvBQ2hrbeNnoVt3QF/LUw6jQ7M128Rr5jZgzH6wgWqach/rwcxW1AwUnE3P2?=
 =?us-ascii?Q?K5eC6gzt8BoKrdDvRBMPIjtdfLk7HuKQW47hXvlwCXr7eQujfHy2jMlpDr5Y?=
 =?us-ascii?Q?OVj+lr0fKuEVU1Xt0H8vcuvnKJsR7BNfVoDXBxpIYKRHHQRkJr5v5/BS2P5+?=
 =?us-ascii?Q?XXGme+TT9DJYfxkH78DaeN3ufl8AIRaNTwghPTAjpNLyQCNzXX9iaKZpYZCP?=
 =?us-ascii?Q?iYD0yxlZf8+GxYD/QRR3sshRNSx8BzgxJb3/p+oJaWsWeuFE5X4dXYoWBJyF?=
 =?us-ascii?Q?2sBV3h+TZkCjmhdyo2i4mZZRmxfrJNXfIEdnyfjWWGUxAe4OX2qgq/i5DwGv?=
 =?us-ascii?Q?/c7LpmtRLg0pF7gHEb4neW4O5AKLNGHlWL8qMUJ66swr/72QBRaigJv5Ma/D?=
 =?us-ascii?Q?z5THcWXslXuIYgJfehVpCpQoCAFsPm7UeS32fGrZMGfXHZ52SE1votbnCovR?=
 =?us-ascii?Q?hid8NLYFqhSq04547mifuA0vQEXWDGSMp4LCcxzV38nX3VvRsvcaCPQ8JgEJ?=
 =?us-ascii?Q?HXYlH+wdDUfbiPMVG5IcsAViHHqLd93aJoExrtxdoBPuprvBgWQkBqXhkZ76?=
 =?us-ascii?Q?Mh0S4Mq3vTjYmVeT7V5d1D/c+KCPAm8TEJn8scLQFsmHbEWvyGeVGU/LUVYU?=
 =?us-ascii?Q?aU2OQeYFf4vA7uLY0zeUqe8yPieVtKoIczVEfIKhMCBN/BssTvMXNeJYYd3J?=
 =?us-ascii?Q?yHSu8gXc30VP72IcEoMg+V9Qv15urHk9rZD9f/OzcMp7xU5x7ICBT1IsyuCi?=
 =?us-ascii?Q?w0PNs58E5hG2mJ4RKYBcfx5LDJ+k//j6BZdaNKowqpm8dP+S9Wog0flRCfb0?=
 =?us-ascii?Q?v0+U95HA1lE5huoPu/7I9ijpa3hUB/yoV3yFmhSRwpBMHzLjFugA2Uc0TobS?=
 =?us-ascii?Q?yLlKZf86a8CL4W3jrAgcGP+e3fjfxZgAHpo5eX1iPvo4F5csenWZKCMqyr3A?=
 =?us-ascii?Q?/NMWyJHxzm5YpRE2sP9XQ4mD1+wNZhnJcaD6rKZvrq96DfPmi3l1Gn0L2BF4?=
 =?us-ascii?Q?AK4yxvbzuP88yj6GS1Ka0U0LdsAaqqvHCJaS9PsMQjGhjuS+vC/MXXRBs/3Q?=
 =?us-ascii?Q?sRyrOM3aU8183Hn4Bo0=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a159cec-bbc4-4508-388e-08de0a881483
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2025 18:41:10.9018
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /fdCp+zotIa+skk+P6hUGCVD7zgOQKwRv23+5mYrj+0+b+fji7gP7SCDFEyprdyIcwa32fbK+Yyfh8Fuggb2hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7278



> -----Original Message-----
> From: Andrew Lunn <andrew@lunn.ch>
> Sent: Monday, October 13, 2025 11:56 AM
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
> <linux-imx@nxp.com>
> Subject: [EXT] Re: [PATCH v3 3/4] gpio: imx-rpmsg: add imx-rpmsg GPIO dri=
ver
> > > Notice how ENOPNOTSUPP can be 45, 122, 223, or 95. Returning
> > > EL2NSYNC or EDQUOT to user space is going to cause confusion...
> > >
> >
>=20
> > I think we should just follow the definitions in
> > include/uapi/asm-generic/errno.h, right?
>=20
> No.
>=20
> Try a make for mips, and look at includes you end up with. You will find =
it goes
> something like:
>=20
> # 1 "./arch/mips/include/asm/errno.h" 1
> # 11 "./arch/mips/include/asm/errno.h"
> # 1 "./arch/mips/include/uapi/asm/errno.h" 1 # 16
> "./arch/mips/include/uapi/asm/errno.h"
> # 1 "./include/uapi/asm-generic/errno-base.h" 1 # 17
> "./arch/mips/include/uapi/asm/errno.h" 2
>=20
> and this results in
>=20
> #define EOPNOTSUPP      122     /* Operation not supported on transport
> endpoint */
>=20
> not what you get from asm-generic/errno.h:
>=20
> #define EOPNOTSUPP      95      /* Operation not supported on transport e=
ndpoint
> */
>=20

That shouldn't be an issue in this case.=20
For instance, if we define the error code as 1 in the return message, the d=
river will interpret it and just return -EOPNOTSUPP, regardless of the arch=
itecture.

Thanks,
Shenwei

>         Andrew
