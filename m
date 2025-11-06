Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012044.outbound.protection.outlook.com [52.101.66.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5FE2F83B8;
	Thu,  6 Nov 2025 23:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762470805; cv=fail; b=F6ckG6NXwveBOSnrJNPW0vd5MHgaAnf1lkF8lb08hZcW4ma9Ig+9+OOCS5isrhH8NYY62kRW0oFRlsCkTbaDoP8y7eX095b0lAAKTtZfhAB/KUXVJUnyMf0/R1gH5lD0wBRfF+gWMK89mMaDSgz55/csO4plkOEuy7S3byqvU2o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762470805; c=relaxed/simple;
	bh=dOpeZmj34mntP5jmD2WIiSVhNEo+iOmgxVb7nQNeQzU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dHKjCoUzMcVXXqJyA0Nr4mHk3+jIF+dGq68ltsvW+NNfckyNTOtDiGSXcC1SI/bAJjI0+AondYE3ccSDw1zfy1Ev21vbQKv7w0ekSqHJA5CN6xPlFRHweOnFRwMpIh3OA/Ena/dN60thXf+BdS/LkUavzi2+I0vWYeEYwRdmldw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Kp6CJwEe; arc=fail smtp.client-ip=52.101.66.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Kp6CJwEe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xpXRZOswDw7vOdRLNZ4lpF8tHrl0G78eLnB9cK8shOGyLaaE0WeFLQtHTm+Y3buYyaOIIXxw2HElgEAVPdgLTKSSuyoyEej+kzBX//KFLmUg3tQyE96cCaH1nlgk+muT1GLv+CMmYFnOp+Bu76e++qV82V362pNa2U2aI5u3eMUktc/1dvG3AKaHxYiObk8lFKnCWcnMWHvbtZe5/kwELFuouC9+UhnHt9SOrxAxhO4e2VVxB3xtnPrq80a9G1fIf1oe7/lyrzfbBP+Pe3e6YyEFnBKnRrwEA/m3NQMYJYuMAxmUbca2VRQRlhpNHmFGHNzO4zWhXaUBiY2OjdSDYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gGv7ev4drJ72lBCR35riOzYtlufZ1YMl6d8IdNaY3xo=;
 b=ovKLBizwAuoGbCiccOUL+SWwoBbviOBXCsnuPGUBip8dGiUP7A76BE+7FMgJ+Lvn3pyyWF8jz6C3nyWxq8U1deYgsY7Y0yq/ZSIhH8mQS/hRlXP1SBZRzES1YSMkkPEQ2zlM8PASj6p45NK1PXKB70SL2oI40fhPlkWCGvzhamrrgewTXfX8lbO4ZQlCoheNisBrvmcujkAeh2voVlVffecg6Wb6i4JwGlMhEYcrVXxedfayjyolleky488/qxvl9T0PaEvXhHJ8HZ4qEsyQMZqeaBTtRDNTMPHaod2WXX5Rmp4BLrVVRmmQ//B+18lH93K07abiHpcnt1uBVS65KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gGv7ev4drJ72lBCR35riOzYtlufZ1YMl6d8IdNaY3xo=;
 b=Kp6CJwEeEsjSOLhcNW8ZCfj7y7yMZuIkyxAES+KOzgHDGiTPs/e9wu7x4k67jSkONdiL+2Fyd/CNpNwqE0G5+6mqQidUh5UVMskPYkirhOogJxJ0jKkauP9pKzAht7OysbJUBDRzz8iCk4C5wa3zxCL7ukEhiyGOCFLxhBkbOtELLIC33q9zzPClfCG9VFcJs/7+QpU4SJyOX9EKvNP0/LO7lqyoQU+hCpQD5F9vBYM6wJDSYyVDlKHGYda/3O3M8WjGsh3zNEz6Air20TxYO9X+21fGWZynKjW8wEfFw/OfHWSUvohJIyfmP5kOtIYKbQGpPncZ4AGDcetVPe2cqg==
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by PAXPR04MB9075.eurprd04.prod.outlook.com (2603:10a6:102:229::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Thu, 6 Nov
 2025 23:13:18 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612%5]) with mapi id 15.20.9298.010; Thu, 6 Nov 2025
 23:13:18 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Andrew Lunn <andrew@lunn.ch>
CC: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Jonathan Corbet
	<corbet@lwn.net>, Linus Walleij <linus.walleij@linaro.org>, Bartosz
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
Thread-Index: AQHcT3LvIbr9XJVbGkKDlKab1SwwZg==
Date: Thu, 6 Nov 2025 23:13:18 +0000
Message-ID:
 <PAXPR04MB9185D9EBE8F46715FD114A2989C2A@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20251104203315.85706-1-shenwei.wang@nxp.com>
 <20251104203315.85706-4-shenwei.wang@nxp.com>
 <9fd8ccd9-560a-43b4-a48d-f7a3eaa07eb1@lunn.ch>
 <PAXPR04MB9185C4A4B91F863CFD49718E89C2A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <0be8c911-3c31-40da-b431-e5a24339c0f9@lunn.ch>
In-Reply-To: <0be8c911-3c31-40da-b431-e5a24339c0f9@lunn.ch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|PAXPR04MB9075:EE_
x-ms-office365-filtering-correlation-id: e1a946f0-23dd-4c27-bcf7-08de1d8a123d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|7416014|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?ERy4P4h+Pp0OKbY6XQVwPTa+nl08u38zXjRUa/+lMr/lzAjyanqnOsYffk/H?=
 =?us-ascii?Q?TpQf7W8E7MCFSCq7qXP2a0i/8HkmY0/asdQ44tzGskLBDztBqWM5MFYxIFaG?=
 =?us-ascii?Q?Arb1T+tkbe44CbOxG6sloLRqHhDbNz9mJcgRp/BX/xvzxHKhzd1Tbm9/L0ms?=
 =?us-ascii?Q?3ktv7J0zi6Xigc2f1Zo5OHO7zPdeIXXXWTCraEYXme1TSexIcWeKovR0XQHw?=
 =?us-ascii?Q?LfyDKcV+w0TCKgoxocsxKC7GJzfmlI0IQYiTiuNWQMB6Tb34KlWaI4Q0Ta0S?=
 =?us-ascii?Q?8UzEyXArfMCczP98hWM1XPT9d5VzxeBK8yRFKVWwKIUZpXmOSZn0vUk3lwJm?=
 =?us-ascii?Q?nAqEy0tl+vr+IBneiVBkzMKMHz1e5qsz4Le/lIkG9z5W9UlLCqRhulwqgkNW?=
 =?us-ascii?Q?aEVJdZRfRpZqkz25HFV1a4RK8p+8vdEWu7Nj5/FjkBTva92i9f32MnFlU/Jt?=
 =?us-ascii?Q?yaQaKn4HbVg+VnA2ggtnb1hDKTedmzy+yzEJ+PQ+shNl1lmkne+IAXvw0mTI?=
 =?us-ascii?Q?HelOhrDs+GKDWSRbOtXjCd5LXKoumPwy+oBahVNZhRLOukYAMOxSzmf6kWLB?=
 =?us-ascii?Q?9ytOobnitXBxP2a/8NQRCgCYsBoEz7SPodLOIcdB3ypNKw0mGus/ddbF7Gnk?=
 =?us-ascii?Q?Jf09R1lkpgayEbfIyTtqw12vCBnHgB+8ZXdyfklNIoZSTPyPn/MYNAe7uw+w?=
 =?us-ascii?Q?KK3x0ehrZFj/g/BGzlzoLqMRN40kepjFN9Ij6gP/fsPhEscr8QQyn8bEzlFs?=
 =?us-ascii?Q?LTa2lJOjLC18FdQNFeq3tbBtA58Mx+eTWMJjwb9g6EqTFfanricwIG5ZUyhw?=
 =?us-ascii?Q?K2QN0esS9SM6Xbhc861Fd5vk0vqNJEiD6sPcsAutivMPy0ePvV2OK9/DXGQ6?=
 =?us-ascii?Q?CX18IdER7dnIx7LbSFCeStxCBvEpcnv8q4k+AiwQmVwT43LkneMks8CsLbOU?=
 =?us-ascii?Q?+gMLno/Z3mYPC8Pz39ZAgAH41iXaJnL+radZq1H62+9USLNqJPgbfhkz3lFv?=
 =?us-ascii?Q?jWlFSnECaA62xyeXexYkFd9k11ZqRB+HBTSbmcCaot/yHi3Rt94XfLLD4JFj?=
 =?us-ascii?Q?uoNYVcC9H4CAmvLsdPtYnrMMKh9iM/4U15pkI3UEL2msK6IkI3vUYu/5e9fv?=
 =?us-ascii?Q?2MiaB8xujtCxXbkzYwgPLUkLeZhkgXaYmZg9M3Y4SdcUyNG3BJ7E3Oi4LECl?=
 =?us-ascii?Q?iKTLspFMtcrhTnlat68tgGl4CWKDAnPTxfwn9OtTg9x9SG3eDiIHpV04Ou1f?=
 =?us-ascii?Q?2Jq7p4Z8bIl9U5yGDCkql54szD0CIUgFASsq9RDXglX23fqVs90lK/lVjUqI?=
 =?us-ascii?Q?cnNcim+iuf69Klf20DYL1aWdnvr0NV5TvjWJ41ZpJNtRMUS574UdAlv4us/i?=
 =?us-ascii?Q?lItTE+4aeJgIu3cx0nT47YM9EIuPuikv/ZK+EAEBQn1EfWkJP0dHlEy5Lfzg?=
 =?us-ascii?Q?zkPuSBSGY+tQAXOLNe95UTz9Zc39reQSYbD5UsHlQTiqqOI0TCDZTkWFo8VO?=
 =?us-ascii?Q?39wo1MHBITCMftbsANB3RMfAbfMz9TO9S+pj?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Xxylu1YiLx38agiJ5ewA5AgA9/BY+7k3T3qK9CwUc0gQtRXfb/z+CbKp1MWY?=
 =?us-ascii?Q?4W6bRzPFZIcu7wgkLex+cYKhTbI2k0dON+OfLpcgWWVKqegbNeucSOE7x3j9?=
 =?us-ascii?Q?uZ2J6WHPbN2NIbUIGFfB0gD6XiovMj6dj//+GlngQPAPwZ0l6X+47HfANZ/i?=
 =?us-ascii?Q?twSaTjpBc+LAgYtEqpXcNxm91dAIVeuwHBK90y+y0yY43OfbuMvpnEtk2nbj?=
 =?us-ascii?Q?Nu7+bAyG/EaKMexwd64YWvVr37jKc0iPYogsD2fHs/0XvmbJu0yuruPTu9VX?=
 =?us-ascii?Q?Erx8mPbPUd/grYORnavZM07BjgRy5YZNg86jNMmDIJNz2jmvbXQDT84E99uJ?=
 =?us-ascii?Q?IPy+sm6+0mdWl0DMdY4n/1PtMJVbZ5sLoYue5UMtfMBX76FCZSFzJHGLvGLF?=
 =?us-ascii?Q?AnY0K31Eh8VGHUUbYNLxr/0HAslYUfSNcvpeUAwD2u9wrj8lmPjVVUXdk6Ro?=
 =?us-ascii?Q?hCSc/crcRSa/acTTXeu7K/Wfde2Bx2sxc81VVQXedxSEuPQxPk9cJEuRFI9m?=
 =?us-ascii?Q?dIV0OmJdcp1VxABh+KkA6Rdp2d3gtXKr5E82ONRk8HAX1y7raXZxlMA38Bn2?=
 =?us-ascii?Q?489KzH3/RJn38Ey8g3IHyOzGvL7305INnTtZ5mEu4eYJX4dxUcZV80wSMriJ?=
 =?us-ascii?Q?nrrCIhKSDuSzB2Dl6A2ImsWGrjeB0hf6rF2IVkntMyrKrlv59wuaXAmXscGF?=
 =?us-ascii?Q?LSN3njFO9sJY6+PkQWtG2DsvwO4D0/wSmX/WzA7chvyhTPYNYHhtYT/deJ4Q?=
 =?us-ascii?Q?35xzqjaZmniifDd0NbSbk6JGVP9UMVah5roFF8QxZw7m3IzMtUbOGt3lzs2E?=
 =?us-ascii?Q?cLdC3qOoMntCTfl2OFHgW43HNN7VYC7G907MBfmOAJ2ekUB9VONTmFNNp4HR?=
 =?us-ascii?Q?kQJ4f95QP76FKLWhpbypiYxg1rpmo5nJxZ8cbTLd9k7g6LdVa5rB4K81gq2q?=
 =?us-ascii?Q?IkJO+8uZayhfnG+MkgsMim/Y8RkEbqMdX113tV1deHMlp4pbz+IiRWmHZLAW?=
 =?us-ascii?Q?tbEeGEQx3iGJLbTLb91Jm8+1sY2gyrSTb79lVtwaUi6oo+eK4nJsLKYVqUAB?=
 =?us-ascii?Q?jiqtGl27yFHRKGCBJcGVDj5YsHSbU3sbs6FFItOoyk+4RnkzqmJ4vLNLC1rF?=
 =?us-ascii?Q?ArTbhQWxp6icxQMCYlRWYdIIHIt83vbah3OWLNDXOzKFIjF8rt7RaLfJjKcM?=
 =?us-ascii?Q?rcx4E+yo9xMNK8rNLOYS/gTOHNamuwju0VP57W6OH8UwHooWbc+V11m7IUW6?=
 =?us-ascii?Q?E1rQPtz9pNFflB2QXXVjkm44XB9HGQtApdQWbxAy8e5oeAi+1WXlr9q/pj9X?=
 =?us-ascii?Q?XNM/aK0c4qxg8wdb4eZZeHQpJOoL3BeerEjzlu8ze7VoSYl706PQSSZOAH2S?=
 =?us-ascii?Q?b+I/md1v38hWo2SoCCTjcg12EOTO55r8KSd619QVa3VhkzOjv87gJXYMNFGq?=
 =?us-ascii?Q?Z9o+xV19Aw7KmkbIcdSOHIEwOj2jHdIoQGPuvF1hCpilSDG93/x3LmqoR4n8?=
 =?us-ascii?Q?Y2dRZgfG8GddDWekNF/QMuDB1IhxtWVZrxJKGdpQCNBtHwXHKreavyXRS2c5?=
 =?us-ascii?Q?GLnQ9qXcz1es/Z1EpRk=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e1a946f0-23dd-4c27-bcf7-08de1d8a123d
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2025 23:13:18.1708
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jdTDqvZOu3+ZEf7ycZI01ow2fce30ESNIVvoodo/eF5cuDjfRzZtaxHkAo1VaTt0dH3Xwb+e+fyH8LoqtbvBag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9075



> -----Original Message-----
> From: Andrew Lunn <andrew@lunn.ch>
> Sent: Thursday, November 6, 2025 3:33 PM
> To: Shenwei Wang <shenwei.wang@nxp.com>
> Cc: Bjorn Andersson <andersson@kernel.org>; Mathieu Poirier
> <mathieu.poirier@linaro.org>; Rob Herring <robh@kernel.org>; Krzysztof
> Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Shawn
> Guo <shawnguo@kernel.org>; Sascha Hauer <s.hauer@pengutronix.de>;
> Jonathan Corbet <corbet@lwn.net>; Linus Walleij <linus.walleij@linaro.org=
>;
> Bartosz Golaszewski <brgl@bgdev.pl>; Pengutronix Kernel Team
> <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; Peng Fan
> <peng.fan@nxp.com>; linux-remoteproc@vger.kernel.org;
> devicetree@vger.kernel.org; imx@lists.linux.dev; linux-arm-
> kernel@lists.infradead.org; linux-kernel@vger.kernel.org; linux-
> doc@vger.kernel.org; dl-linux-imx <linux-imx@nxp.com>
> Subject: [EXT] Re: [PATCH v5 3/5] docs: staging: gpio-rpmsg: gpio over rp=
msg bus
> > > > +
> > > > +- **Cate (Category field)**: Indicates the category of the
> > > > +message, such as
> > > GPIO, I2C, PMIC, AUDIO, etc.
> > >
> > > We know it is a GPIO message, this document is titled "GPIO RPMSG
> > > Protocol". So i don't see the need for cate. I can however
> > > understand that your device does support multiple functions, but to
> > > make this generic, it would be better if each function had its own ch=
annel.
> > >
> >
> > These details are defined in the message header to support multiple
> > functions. For the GPIO-specific implementation, the header values are
> > fixed and do not require modification, provided the transport protocol =
version
> remains unchanged.
> >
> > Then I should remove those unrelated definitions from this document.
> > Is my understanding correct?
>=20
> I think we need to know more about your system. Why does cate exist?
> Why are you mixing different functions onto one channel, rather than havi=
ng a
> channel per function?
>=20

At the protocol layer, there is no restriction of one function per channel =
because the=20
Cate field in the message header is designed to differentiate multiple func=
tions within=20
the same channel. This provides flexibility for implementations that need t=
o support=20
multiple functionalities over a single communication path.

However, for a specific implementation, you may choose to enforce a one-fun=
ction-per-channel=20
approach by assigning a fixed value to the Cate field.

> I think you should remove cate from the GPIO protocol.
>=20


The original proposal was to use a single transport message header to suppo=
rt multiple functions.=20
Removing the Cate field would require significant changes to the current re=
mote firmware.=20
Therefore, I recommend keeping this field.

For implementations that do not need to support multiple functions, a fixed=
 value (e.g., 5) can be used=20
for the Cate field. This approach can run smoothly with the existing system=
 and give the option for systems
that doesn't want to support multiple functions.=20

> > > > +  Defined categories:
> > > > +
> > > > +  - 1: RPMSG_LIFECYCLE
> > > > +  - 2: RPMSG_PMIC
> > > > +  - 3: RPMSG_AUDIO
> > > > +  - 4: RPMSG_KEY
> > > > +  - 5: RPMSG_GPIO
> > > > +  - 6: RPMSG_RTC
> > > > +  - 7: RPMSG_SENSOR
> > > > +  - 8: RPMSG_AUTO
> > > > +  - 9: RPMSG_CATEGORY
> > > > +  - A: RPMSG_PWM
> > > > +  - B: RPMSG_UART
> > > > +
> > > > +- **Major**: Major version number.
> > > > +
> > > > +- **Minor**: Minor version number.
> > >
> > > What is the purpose of Major and Minor? What values are valid. What
> > > should happen if an invalid value is passed?
> > >
> > > What you should think about is, if you gave this specification to
> > > somebody else, could they implement it?
> > >
> >
> > Okay. Will change those fields to fixed number and remove the above
> definitions.
>=20
> What does not answer my question: What should happen if an invalid value =
is
> passed?
>=20

That is an implementation detail of the remote firmware. If it chooses to s=
upport a=20
specific protocol version, it can return an error when the version is not s=
upported.=20
For example, the existing i.MX remote firmware returns a "not supported" er=
ror in such cases.

> You must have major:minor for a reason. You expect to change them. Then w=
hat
> happens? How should forward/backwards compatibility work? Must version 0:=
0
> always be implemented, were as 0:1 is optional?
> How do you find out if 0:1 is implemented?
>=20

The remote firmware decides how to respond to the protocol version. By defa=
ult, it=20
should return a "not supported" error for any unknown version.

> > > > +- **Type (Message Type)**: For the GPIO category, can be one of:
> > > > +
> > > > +  - 0: GPIO_RPMSG_SETUP
> > > > +  - 1: GPIO_RPMSG_REPLY
> > > > +  - 2: GPIO_RPMSG_NOTIFY
> > >
> > > Is _SETUP always from Linux to the firmware? Is a setup always
> > > followed by a _REPLY? Do you need to wait for the _REPLY before
> > > sending the next _SETUP? If there is no _REPLY within X seconds,
> > > should Linux retry? Can an _NOTIFY arrive between a _SETUP and a _REP=
LY?
> > >
> >
> > Yes, the SETUP message is always sent from Linux to the remote
> > firmware. Each SETUP corresponds to a single REPLY message. The GPIO
> > driver serializes messages and determines whether a REPLY is required.
> > If a REPLY is expected but not received within the timeout period (curr=
ently 1
> second in the driver), the driver returns -ETIMEOUT.
>=20
> You need to specify this in the protocol. Looking at the messages, i don'=
t see why i
> could not send off a batch of requests with different line values, and la=
ter expect
> a batch of replies with different line values. The linux driver can then =
match the
> replies to the request and know they are all answered. The current specif=
ication
> allows that.
>=20
> You really need to forget about your implementation. Look at the specific=
ation,
> and think about all the different ways it can be implemented, and conform=
 to the
> specification. If there is only one possible implementation, your specifi=
cation is
> good. If it can be implemented in multiple ways, you need to improve the
> specification.
>=20
> > A NOTIFY message can arrive between a SETUP and the REPLY, and the driv=
er
> is designed to handle this scenario.
>=20
> Please state that.
>=20
> >
> > > > +
> > > > +- **Cmd**: Command code, used for GPIO_RPMSG_SETUP messages.
> > > > +
> > > > +- **reserved[5]**: Reserved bytes.
> > >
> > > Why are these in the middle. It is more normal to have reserved bytes=
 at the
> end.
> > >
> >
> > The reserved[5] bytes may be used for other type of functions. For GPIO=
, all
> should be 0.
>=20
> We don't care about other functions. This is all about GPIO.
>=20
> > > You should also specify these bytes should be set to 0. If you don't
> > > it will be hard to use them in the future, because they will contain
> > > 42, or some other random values.
> > >
> > > Is there a relationship between major:minor and reserved?
> > >
> >
> > No so far. Maybe it could be related if the protocol is updated in the =
future.
>=20
> That implies that you cannot look at major:minor and know if the reserved=
 bits
> are reserved, or have some actual meaning?
>=20
> Again, think about forward/backwards compatibility. How do you turn a res=
erved
> bit into a used bit? Is the specification sufficient to make that possibl=
e.
>=20
> > > > +GPIO_RPMSG_INPUT_INIT (Cmd=3D0)
> > > > +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > > +
> > > > +**Request:**
> > > > +
> > > > +.. code-block:: none
> > > > +
> > > > +   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+--=
--+
> > > > +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05..0x09 |0x0A |0x0B |0x0C |0x=
0D|
> > > > +   | 5   | 1   | 0   | 0   | 0   |  0        |line |port | val | w=
k |
> > > > +
> > > > + +-----+-----+-----+-----+-----+-----------+-----+-----+-----+---
> > > > + -+
> > > > +
> > > > +- **val**: Interrupt trigger type.
> > > > +
> > > > +  - 0: Interrupt disabled
> > > > +  - 1: Rising edge trigger
> > > > +  - 2: Falling edge trigger
> > > > +  - 3: Both edge trigger
> > > > +  - 4: Low level trigger
> > > > +  - 5: High level trigger
> > > > +
> > > > +- **wk**: Wakeup enable.
> > > > +
> > > > +  - 0: Disable wakeup from GPIO
> > > > +  - 1: Enable wakeup from GPIO
> > >
> > > What do you mean by wakeup?
> > >
> >
> > The gpio line can be enabled as an wakeup source for the system.
>=20
> Keep going.....
>=20
> Does that imply if none of the lines have wakeup enabled, the GPIO contro=
ller can
> be suspended when Linux suspends? How does the GPIO controller know it ca=
n
> suspend? There is no message for that. How does it know to come out of
> suspension?
>=20

The power state of the remote GPIO controller is entirely managed by the re=
mote firmware.=20
The remote firmware operates as an independent system from Linux, with its =
own power states=20
and policies for transitioning between modes. The wakeup field is solely in=
tended to inform the=20
remote firmware whether the GPIO line should be used as a wakeup source for=
 the Linux system.

> > > > +Notification Message
> > > > +--------------------
> > > > +
> > > > +Notifications are sent with **Type=3D2 (GPIO_RPMSG_NOTIFY)**:
> > > > +
> > > > +.. code-block:: none
> > > > +
> > > > +   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+--=
--+
> > > > +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05..0x09 |0x0A |0x0B |0x0C |0x=
0D|
> > > > +   | 5   | 1   | 0   | 2   | 0   |  0        |line |port | 0   | 0=
  |
> > > > +
> > > > + +-----+-----+-----+-----+-----+-----------+-----+-----+-----+---
> > > > + -+
> > > > +
> > > > +- **line**: The GPIO line index.
> > > > +- **port**: The GPIO controller index.
> > >
> > > There is no need to acknowledge the notification? How do level interr=
upts
> work?
> > >
> >
> > Currently, there is no need to acknowledge the message, as the
> > interrupt is managed entirely by the remote firmware. On the Linux
> > side, a single notification message is received when an interrupt is tr=
iggered.
>=20
> At sounds broken.
>=20
> A level interrupt is not cleared until the level changes. The typical flo=
w is:
>=20
> Interrupt fires.
>=20
> Interrupt is masked
>=20
> Interrupt handler is called, which reads/write registers in the device wh=
o pin is
> connected to the GPIO
>=20
> Interrupt is unmasked
>=20

The sequences you mentioned above are managed entirely by the remote firmwa=
re. On the Linux=20
side, it only receives a notification message when a GPIO line is triggered=
, which then invokes the=20
corresponding interrupt handler.

Since the interrupt handling sequences are implemented in the remote firmwa=
re, the Linux driver=20
can treat level-triggered and edge-triggered types in the same manner.

Thanks,
Shenwei

>=20
>=20
> At the unmask point, the interrupt will fire again, if the level is still=
 in the active
> state. You need this because while reading/writing registers in the devic=
e,
> another event can happen, which needs handling. Generally, the interrupt =
output
> of a device is an OR of many different sources. You only release the inte=
rrupt
> when all sources have been cleared.
>=20
> So for the protocol, you need to acknowledge the notification after the i=
nterrupt
> handler has executed. And that could cause another notification to be
> immediately sent if the line is still active.
>=20
> I'm not too sure how edge interrupts should work. If we are still busy in=
 an edge
> interrupt handler, do we want to know about the next edge?
> Should edge interrupts be disabled until the previous edge has been handl=
ed? I'm
> not too familiar with edge interrupts, most of the device i've handled ar=
e level.
>=20
>         Andrew
