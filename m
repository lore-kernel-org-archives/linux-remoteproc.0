Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013042.outbound.protection.outlook.com [40.107.159.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD1125F96D;
	Sat, 30 Aug 2025 17:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756575855; cv=fail; b=hlTkDjOdnJtuKnIaFaO12r3Z6GUOuVwmGofdpWDryiMokNXyOeBjmnmkNvF8JIEJmOxQtZxnkfRrDBtoE9sBTeo/mOpQuT8q8L73m4zxuT+Qrmpv46FHrv28TPq1pd87jOEfHpMzCw8yZ6dj+YNi/5PpfLhCqJrpbdiAuXsg4fY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756575855; c=relaxed/simple;
	bh=5lHz8ODVhqXSzGG6MYJTlob1Z7WEWpQD4as+FMbHfUw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=uwfB1JvfkHNF/z5svaVooKUYc04N3BLtQ5w6UoG5QrwjHuDkRC6iK7xI68F16RazE7DRk14ZNOf+HJKK59J7YfXjYi6R/h5krSZUiiPrFzXC7sUWLGcJ18zijusJrGyTdv47yn86rH4vzvpg7PUCgcMpIKAS+Rdo12vfvT2dHiQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=XIhO+p+9; arc=fail smtp.client-ip=40.107.159.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="XIhO+p+9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iLyR/Iw+ZWjoTwpQJxrjgrDd7MznGCXJ+YAlJczFCJoO+y8XyXl9WHxKY8FhQu5HedVtGJa4SIr8csPpJq9ZgIgi204nCpjTM+r3quoMWqYvbAZaq7SWXZrnQeFW/EbxcwBQbY/iNdFfemEqXTLnVXBUZ1czEedAwM6nkjtPM22T7PFtvQRHyLZADEKHjI+ToI9+TOPAh3OhhKt8Urzwl3O7o/DwAHWOs0yRkCvc+Ee4qgvtNOVobuHwQpEBBGxTU980V0w6xtfnLeuFdzOv6D2MrOPz8DyvevbeYP+eD8ycPBzLrH4ViEXCzsiFlKPqcOfD6aXa+rG1eZdFEBv/Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E0o0zbZ1leBqoT/C2lQiuVjLsxOFTJwcCrRDGQg1YJo=;
 b=W4syP0awY4AwCitv+2BshXDOpqyHqFzsg/4Z2wRmp6Qi4J/NCMdXLrOX2XgvPTde8U0AalWICbIF7JT8UAMI/I2+sqZeoMdNGX8GsmxuWO1EM7lrdeR1i7jJ9iNMA0x2GM+ABxYEeu53iVj9pML5Ox9IjFDbpPBIZP3MjlRltwsA58SnV+Mmc+xLC7Enb6eccse+DappgNK/MBGtk0IqWtjmr3++KvElg9xFEQWtLsKND8ytkCEkO5ZniezCgATvPB7loj5Obm+5a+6naLZDIzDDC7Ra+yEkeelPRwD9ry/DbEmNtH2deiHEYCWgf/tLWGNv/JeWmrI/UyrTIDCrHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E0o0zbZ1leBqoT/C2lQiuVjLsxOFTJwcCrRDGQg1YJo=;
 b=XIhO+p+9s2UB/zWq5Ksi1mfbSLCZMBoTGfsGAVCuP1xoGFk9Hfz0VGYo0XsL8dy85pbjVS65eLdy/G3Z05p6FC0OOH6qTifVaRBzhlRWf9Vg1UYcN8JQC8odfjsWgSejCvLWsmMmJiiN9XlIZJT0GmSXVeG3OJJPcu+twY848TNaKDLCdglwGDGvBE39JD4Pzi6kUDxmHuHeIW2YPQAyaZeKO3BkTqkD6sk7LONnbrc9VpHC+s/nsKnB3zqMlSRmdxdfXO1ADMKbyEbCZfCa9/hZOPz85wxLNgIpbcBDWA9m6p3miRApgruCnraCWX9DF8/5CpaG9/kHtPaB8pRMdg==
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by AM7PR04MB6823.eurprd04.prod.outlook.com (2603:10a6:20b:102::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.12; Sat, 30 Aug
 2025 17:44:09 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612%7]) with mapi id 15.20.9094.011; Sat, 30 Aug 2025
 17:44:08 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Rob Herring <robh@kernel.org>
CC: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>, Bartosz
 Golaszewski <brgl@bgdev.pl>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH 1/4] dt-bindings: remoteproc: imx_rproc: Add "rpmsg"
 subnode support
Thread-Topic: [PATCH 1/4] dt-bindings: remoteproc: imx_rproc: Add "rpmsg"
 subnode support
Thread-Index: AQHcGdWvuXRrlT06BUO4LAXqOCqHSQ==
Date: Sat, 30 Aug 2025 17:44:08 +0000
Message-ID:
 <PAXPR04MB9185E259C9BD4AC05AF785518905A@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20250818204420.794554-1-shenwei.wang@nxp.com>
 <20250818204420.794554-2-shenwei.wang@nxp.com>
 <20250826200904.GA375876-robh@kernel.org>
 <PAXPR04MB9185EAFBDF13143860910C3A8938A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <20250829150655.GA782291-robh@kernel.org>
In-Reply-To: <20250829150655.GA782291-robh@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|AM7PR04MB6823:EE_
x-ms-office365-filtering-correlation-id: 9879ae61-c045-48dd-c50d-08dde7ecd286
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?AzHkxGg2BFkzMsKopMeFpve4NLZeqRFgjlBiE9tlM31Qnysgzl9bOeq2l4/l?=
 =?us-ascii?Q?BzyuG6huplFxNw1fhZ2mghrmAAs6A2o98SvCUAaTdlHYrew0xDh2C2DwTM58?=
 =?us-ascii?Q?P5/fgLjrQ6guxbuIw61XNnwChJoNKTWM1LJkwP3+yIlU/7dCqXWmuvARJU+C?=
 =?us-ascii?Q?RC++n7JERReEohfJZdqrje7cV436AfPsLvu10KDAFAxbLs+P0KYA7mlgIRhB?=
 =?us-ascii?Q?fwLsi7OYV0qWEqu1bMvGjHQcSVv5EGUPG/NJPqkybNWVvEL9K6FX0MpPUzBc?=
 =?us-ascii?Q?L41825DzKLZ/vpzxAOVb83H7KXTCiCSQ7/3xFiHupfjbSY6c9tvzu0BYM9pL?=
 =?us-ascii?Q?od6YTGVSBLrwzT3BQEZ+Pyi4TDchH14XwGaDQ4VyhtT7YCkQjTRwUSRNDPB5?=
 =?us-ascii?Q?yERyIOzgQ7IGQ2snjcaW3RrvOieZfSXA0z4+urGgS93uD0n/o0xsPE7cMBDR?=
 =?us-ascii?Q?h9s0EySek8NWI1+rlWonUsSbUVpZ+0oZgbOLt93fCpKvrr77F+KtxvJO53Pd?=
 =?us-ascii?Q?wQmm/nI9ShMEZW8YBftVxFWm+DFMe5gvKxGa4UXeBn9xLIyJoY3/Rb3fOjzK?=
 =?us-ascii?Q?TAOMHdY6OiV5gcjXObZiTFn5mWZrhL3WzZjxVaba48x6Td72TQzLpWKYicMq?=
 =?us-ascii?Q?e2OsuyBzoBaTG7cdVkUysX7J7Lat2gM5AyLU9tTT1yL2iqLRco1OL9/BgMcK?=
 =?us-ascii?Q?w3GZo4lEj7CXAHGIvl4ACeAl6PttjGrlaqQblNyfp9YoCWgDG9x5M1p9jcT5?=
 =?us-ascii?Q?/0kbhYmKNF+D6kzYTEvNE7N6pWpWxk8Eh4vv+FZRRjonl1C7KLrTa6LhXXSn?=
 =?us-ascii?Q?2BwtoZSphbs8aG6e1xR11ri0vgrtFf0YWUGQ7vA90Cn/JoAJV+cKLbE7DqMf?=
 =?us-ascii?Q?QNQLPL0+vW6EYkiXRO3Vk6S6Je3+FDIMKLRaRaLxYL2mgK/aolXtyJSwsm/N?=
 =?us-ascii?Q?n4ia9TUUt40D6j9vl+/bZvjD2wbKkw3KhMJXyvLSaZFsyFcLAiwFFiaESGUu?=
 =?us-ascii?Q?Kasa2i57PeS/bLtoXPm628DVlg1kZMkk6bC3Bu4Ln916DbjJgyN1fNqepbXY?=
 =?us-ascii?Q?WNh8/Y2H5ZK/2cIopMRXdJLzE/Fso8Z2/+wtIOEUsw2lF/UPUTmuMnlPbf4q?=
 =?us-ascii?Q?MaaJda5u8u7Sv4UjAql+hxa4YQvkdiEpbHQaflnjQVegp6b+orsrSHU3ygf4?=
 =?us-ascii?Q?owTc4fi42ARyofuctszIn9Xf5dGwj6ndEHtPRDl9TIA8XLgdjUOjp/FshmKb?=
 =?us-ascii?Q?D6o5J0qc7AydKjzdjOcP0YhKISyUVehgWRgZ0ho6GL0YLpmfaXFkTjTJsVjw?=
 =?us-ascii?Q?7Y9BGelF/rPueTog7OH9jxRnf2xbu+rIFcnXcrCLvorcJ9N8Asj85juO33Ag?=
 =?us-ascii?Q?hzbdhphMTquWIq4im2sFcQ95rChxvtjYfTjnEyR4/+e9lZnUt7k/kSEk2Phn?=
 =?us-ascii?Q?2rizBkut5GfER2b3aDdpZbMsE4LGXCee7K7nKOsYatwMOvrM11IiMw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?yn3+dVjcjSw/ZP9eQgciUCwlloXnnf8BpwPMo8/eyMzXbdERcPS8j/Uw/xq0?=
 =?us-ascii?Q?RyKy0BNBM92OhKjfIMNE9SJ/zqoIrjrygKb7mKUggL4VTSZade6/ynxYLosu?=
 =?us-ascii?Q?V5Ode/aUDSSqyT2LT1mIcQfLXQj55XrB/NC9bVxkVf0aqAAI4G6SX8lF//Bc?=
 =?us-ascii?Q?0xDq4ClV2eVO3PoPs95miN+j3PY2czpCdvGcFy/z4lBnlKovDlVuROnYME3a?=
 =?us-ascii?Q?t9veCXycxPHvq6yvOiQTyIxCAneuq75oSph8oE+w+IVE/rB/MMl7YGtB1bp4?=
 =?us-ascii?Q?3Wnv1jnPqcJX8HgAnqMbGnsR/Uf/neRPnvjIpoNbBAT52oBy4ywQh8ZB2OB9?=
 =?us-ascii?Q?gUYhWE59HZPhN6DDWAZyD851p4UZFsFDw6NWRdlffUazKY/lMy7XvH6NNtA6?=
 =?us-ascii?Q?/1vxtRUenlZQ7IfLYH0YHVK3nKsVX6gH3mpOQZG8+kK8lf+8iV6rYaMSpQ/E?=
 =?us-ascii?Q?ovsvLgeT0/Ac6ngyGX+9hYHulU24IaKgJ90zC5BHBb3dh47g/cj0JWp99n1Y?=
 =?us-ascii?Q?pTlKFRj1zeIqMyuBmjJ7Xch292iJjLaPHJOjwYqysfzZgWvUuZpr5zFYWNkv?=
 =?us-ascii?Q?ZxPchnWFRlFMxUR6Wye3LIZ9NuBwezcvfax37bUCQveQfYXpgOc+whBGZ4KL?=
 =?us-ascii?Q?ifuGnZy/8+8Uq+hWSM5iigoRn7HJybmvt96ZpxEkXOD1bo157JphKMOhLMST?=
 =?us-ascii?Q?mx6vEoc3ujivYkNOwLHEnDr+EkmJ7Zi4N9gFw6uYMxXF/T6EUZlV5hQARsUd?=
 =?us-ascii?Q?/ABxt+tdN34IsXc6xO4cTVDO7v3aF3zx/VXYE9vmgvEx/qoaoFe1NLtJ4GZv?=
 =?us-ascii?Q?cxc0+4mbo/IcxvMiX5vFeA1eInY1aah+xoAlwBQNIA7RhBOZbWEhf/tymkJR?=
 =?us-ascii?Q?kWV0TsfjGnTNYee2hnEcd6vBr2VBz3q/EUGj2WZshZiYCIboma/WVbBrT8ou?=
 =?us-ascii?Q?YHrRg1Yfj+ueG619nW+MfPXDOGljNCwnYnl6bFRxvBlPrkj5GjtHjPbGb2/r?=
 =?us-ascii?Q?xZJImzk2pDLrEMAekPz9eide4s263KuWKhoYyg+bo8Fop4FulBRRtyJuhQq3?=
 =?us-ascii?Q?jCefxhnhNqXkA24ra2aI4UlZollWrdLsG/PwP1rwEliprUBB5n3iZmIG6tT3?=
 =?us-ascii?Q?89b3cn+7IVok3/pwciQB8QQp26wgo0QsNp28+yplu1SJDUKlUly/Ow5JIRvW?=
 =?us-ascii?Q?TqLo9TFWZLGw+dOA6NOsecnOfBGAUQpPar6olNT3xYp+3mCCDuiX5Jp4RhYG?=
 =?us-ascii?Q?gn1CzdcvCoSBShAOK1SsdTwZnoie/+UyYL7CsIw3sEu2X1dcBEf1m8trUOIN?=
 =?us-ascii?Q?wiKH+KHCce1DUHLlsP6GfsT9nElEjN1pMZCDbQE1jX+E69t7sMHguJqRv+Vc?=
 =?us-ascii?Q?YvtAtU2Gtj8Q5SG/HOkN7jaf1OZBnqOO0cg9/Q1m0YhmQIdJ2L4wXUGm8yoj?=
 =?us-ascii?Q?xsy7yJFp6dYmv5wsnc5+6zUNR8EMygY2nWXGrPhdwe9fk/cVhK8E1f24lCMl?=
 =?us-ascii?Q?8a+3eIbdJPA0FeFXtXFaae5J3f4MfqcArfRLk98wRXG0SqrT5YQ/p0QS/Cvt?=
 =?us-ascii?Q?/N9NrM3ZeTodnQzau2Up6q4bv6E6hpAvzizFSS95?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 9879ae61-c045-48dd-c50d-08dde7ecd286
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2025 17:44:08.6429
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AbeC71x915nRLC3AlHzv7YE9kMc/cGnTMZmMgTg6GlEeCxacon6p5DxYHaEQGGZFufpfkRN5Q9iJMpLW1c5FOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6823



> -----Original Message-----
> From: Rob Herring <robh@kernel.org>
> Sent: Friday, August 29, 2025 10:07 AM
> To: Shenwei Wang <shenwei.wang@nxp.com>
> Cc: Bjorn Andersson <andersson@kernel.org>; Mathieu Poirier
> <mathieu.poirier@linaro.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; C=
onor
> Dooley <conor+dt@kernel.org>; Shawn Guo <shawnguo@kernel.org>; Sascha
> Hauer <s.hauer@pengutronix.de>; Linus Walleij <linus.walleij@linaro.org>;
> Bartosz Golaszewski <brgl@bgdev.pl>; Pengutronix Kernel Team
> <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; Peng Fan
> <peng.fan@nxp.com>; linux-remoteproc@vger.kernel.org;
> devicetree@vger.kernel.org; imx@lists.linux.dev; linux-arm-
> kernel@lists.infradead.org; linux-kernel@vger.kernel.org; dl-linux-imx <l=
inux-
> imx@nxp.com>
> Subject: [EXT] Re: [PATCH 1/4] dt-bindings: remoteproc: imx_rproc: Add "r=
pmsg"
> subnode support
> > > >
> > > > All remote devices associated with a given channel are defined as
> > > > child nodes under the corresponding channel node.
> > >
> > > How is each channel addressed? Are they really grouped by type first
> > > (i2c, gpio,
> > > etc.) then an address within the group? Or is there some flat channel
> numbering?
> > > If the latter, then the addresses in the DT shoulc match the channel =
number.
> > >
> >
> > Yes, the channels are grouped by type and identified by unique channel
> > names assigned by the remote processor.
> >
> > The RPMSG bus dynamically assigns addresses to each channel at
> > runtime. Because these addresses are not static, they cannot be pre-def=
ined in
> the dts.
>=20
> But you did define addresses. How do you know which channel 'gpio@1'
> corresponds to if RPMSG dynamically assigns addresses?
>=20

The remote devices within the rpmsg channels use pre-defined addresses spec=
ified in=20
the DTS. For example, the gpio@0 and gpio@1 nodes represent devices inside =
the=20
rpmsg-io-channel, each assigned a unique address within that channel.

The rpmsg-io-channel itself does not have a fixed address, as its address i=
s dynamically=20
allocated by the RPMSG bus. Therefore, we only use the unique channel name =
here.

            rpmsg {
                     rpmsg-io-channel {
                             gpio@0 {
                                     compatible =3D "fsl,imx-rpmsg-gpio";
                                     reg =3D <0>;
                             };

                             gpio@1 {
                                     compatible =3D "fsl,imx-rpmsg-gpio";
                                     reg =3D <1>;
                             };

                             ...
                     };
                     ...
             };

Thanks,
Shenwei

> Rob
