Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013068.outbound.protection.outlook.com [52.101.72.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E603FE5F;
	Wed, 27 Aug 2025 14:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756306199; cv=fail; b=rhK3oPJmFgQnnR/8rIOGIipWP3ezEAIWxQjjXWuaktStDKMZAYo2E1wogL2iGyDIq0XQ05dmnd0y+0YgR4+vPABM4UZCRW2cXrLRpQ3Q8K0i/2RGUflwhicxZAncsxiWKgr84IjipdXHg/p0/d7HB8fZ1YjmAppL5AlMYKNFcas=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756306199; c=relaxed/simple;
	bh=QrgXyy7us0K+oZQ1qmoujiUcLMNSr/5rbh/KsOrPLAw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=I0jLgtGxjrO0XhHpeaWVs1Be60XUE+PW2euWd7/hmwXrQWRvqetjjx29RAOP28DukeMKNR7mQtcbI6mYcEN3Owmw2ObzP6KEgDLVGONxV1HUB5/rYw5nszgWqEk/u9wjzWvq3t5/pn+ex2ZtB17Ltl3pZAN9nUqgofz08tOLLzk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Rsuunksy; arc=fail smtp.client-ip=52.101.72.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Rsuunksy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hyu3Dfanmfokz1B0JnvJQKyBBT+pm1F6xHD67Lo0rTFmjgTmK7QzZFFyh1GoLXYDy4OGj/n1uUx2y2Q+XWnUAebI2RMltuRgL0U+s6u0NrFAQa7TAmOoIKNSppYh+ORT+50pJU8CZbHgEutaRAW+mTH7FPpCv+eSTrWPyakoqx0OcoZBN91YH6k69ifrfBx4BZlvgXge28UHVhsgwAfaFX0nTYz+7XDdBt1AsO0drqh/e4CjMv1NaJKMc1n0ODVcgOuOD6RKqLPgRluZ4y0nf7jYdBDUIgDsY1XrvQ+V3j/JIyxBgATX0IPsLqIxh8ts7uXsCr0MUiCc8/3ALWgUGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zkN/nEWprBZQMDOAgnciFMdXDUh0hrE0nP6GT0MYP4I=;
 b=kDXHczRNcqCLMUDcpXW4MhtDEqYZPjxlE75oOK27UozSRWf++2QzNZVIAY7JO8J4W8qR9qZf8HlmNCJAL+jGdNcqvoHC/8E0mGVRZ798jrjdaeDBJxdYxVGxY5CmCoBEOTpEF56FpSW80FceddfqhHtP0YRQiqNC9dCzPl52boK/nTrn29OT/sTPNt9ti8pwas2nEfargrWtE2Hi8R+uU46RZp8dMPwZocHcMrF4Y7EWAPOLuaObMAYm2iOYVL2o3NnmwR8NfFCA64Tj+jmY7rQomyaj0fkUtF6cbqn9g4OVGDP4ZFWhhn4NymckI1FdtwpEtO0QDejaX2YQeq7lSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zkN/nEWprBZQMDOAgnciFMdXDUh0hrE0nP6GT0MYP4I=;
 b=RsuunksyB3EnAjfs4G6faFZsLBVQcKzznqIMy7G6qI9E3FDOPVvIzPv5hOThN3L3gUw2Z2252tuduLaKT/0aRtub4wLXFtN+ahfe04tVKEZIcYtwg0irS9YlAEKZOaCjuoDxy+4Mzz9LSfbEM4aVXmFSNfT6KGbCRmwefHJcesdabVdluZr0P+apyU+Z3/Vo/D9yxHk1i/tRAqTx+TKCC7OJjKNjfmLghXAsNfXUpKemfobS23k/WGx8iadkVC9TlTQb+8QJ9v/7za0EYiBSNtB+tJcThpTClfvnP6yY5RJsqZOO2wN0sijTzqzI68fXhVWd5nuDm1strfD5UPRBpw==
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by AS8PR04MB8420.eurprd04.prod.outlook.com (2603:10a6:20b:3fd::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.10; Wed, 27 Aug
 2025 14:49:55 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612%7]) with mapi id 15.20.9073.010; Wed, 27 Aug 2025
 14:49:54 +0000
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
Thread-Index: AQHcF2HZVK4EWn6VeUO9omg5Ec066w==
Date: Wed, 27 Aug 2025 14:49:54 +0000
Message-ID:
 <PAXPR04MB9185EAFBDF13143860910C3A8938A@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20250818204420.794554-1-shenwei.wang@nxp.com>
 <20250818204420.794554-2-shenwei.wang@nxp.com>
 <20250826200904.GA375876-robh@kernel.org>
In-Reply-To: <20250826200904.GA375876-robh@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|AS8PR04MB8420:EE_
x-ms-office365-filtering-correlation-id: d4100aa9-2873-4619-2b3b-08dde578fc34
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|19092799006|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?oaridN3fxsrnuHn4Fz7DlQ/6MAk38MniNH3iHACETkAQDHiCdtJAOqIVY59H?=
 =?us-ascii?Q?ePLV3ccTd2Qo57Zn8Z2jYhEY/RtdSXXREE/XSu5t4cWbuKkb6WcWnXvWk4K2?=
 =?us-ascii?Q?9XGTQnppzgnBkpqjDCNURMGPJ1cmtyplyZW/mMglzeYBIMNI/FjLnJk4SXss?=
 =?us-ascii?Q?22Dki0Wl9C11ALe4KdR2kLTp9SHrcPXHn/5xvoL7zMej7K2qhRxboU3PZ1Qo?=
 =?us-ascii?Q?wuT61l5VoebccLU/ps9njsjMXz/lq0VtAXcjJZtuqTNQW0BKqmZGVjLUc1AR?=
 =?us-ascii?Q?bPkrgeJZvxnwWCLazZVB67aRBeVQNeP2IUnE4RwoWwVjFL+gp7UBv4ieAbe1?=
 =?us-ascii?Q?6Yg5CZOwHxo0x/g88OK135RuqYckrdKbVpR/7XZcBLhi3BRDvkF44kbhCipk?=
 =?us-ascii?Q?fOST9fvRziUg6n1oB+h4hTpS4NHTkzu9lv0nH7cIvZ1D41xBbBobBFi0ukG0?=
 =?us-ascii?Q?hjA5kWzkFg/ph2oRgKREIlPUUzbD51eSoqXYv+k/BJCQ65W62QSzfl0llu9b?=
 =?us-ascii?Q?66fQKgedUxOM75xQs2RMOipSygCLUhcdD6mpsCXlB5H5DJRMl24GI71AE78a?=
 =?us-ascii?Q?WX60C/CWKxPD5WuKGraUWxheq3jHE/L9ib7pXPU1fLctayzeYahj0mWSmcom?=
 =?us-ascii?Q?+OeJbkOvyvcPo0jGBTTWLS4AgwWYXgCDVR0zqO2f7LqWoiv9WQh7MY2zZA1F?=
 =?us-ascii?Q?zv5Jo76ie9eGJou2DYB6IQ8qO8UmUO8yebF+Y3i9fUWAM8mi9cRgrHuL2ek1?=
 =?us-ascii?Q?ZJ1kZ4RSKlElwMN+owogFy7hI29GB2w2IOT1HmsMfc4Wd2XxmrO8IN9C/NBE?=
 =?us-ascii?Q?EU8cGEAhyroVOPJM/BaCVL8YaoCi3QLJAPPNu1K+uLwp9RPHnI4TiQDadN2h?=
 =?us-ascii?Q?nG3NE61UGO6b7IssmCpVRrHO0gNi7o2zlr6T5zIDRa24/Iz5rPZ9k1nEb7tI?=
 =?us-ascii?Q?Gc3IAMiSzRsn+7WmrodC2C8fbH402Ogr2N9nEh3i0M3SKOS9zdaMkM58qzhi?=
 =?us-ascii?Q?csVcxcPIrrkUqFgr71AnanWcqX1YYVcNy5RfOdR8RfdXjhGPN9VLWGM5jS8n?=
 =?us-ascii?Q?mH48YzLQNzici3PT9Q6cwtQ7I7JuxX6vMhPZJyuYUZYJWtdfLYpedkI5ExMA?=
 =?us-ascii?Q?ShR+g4MsDB7XRBXQm8aUBtsIGSsq41oh4mZgHGXQvI3cxHfQCcHn9flMHSm/?=
 =?us-ascii?Q?/X5C+L/DhroCdVaatKRdYFErcJ6iEl1sF1oIrIxu8xywN9fMwGSo1cT4rymI?=
 =?us-ascii?Q?lbEKeSOk1/45eDHhphAWNGTpHWd1qGtFtb/Q94g6epKf1QPctE1fcx92urzv?=
 =?us-ascii?Q?C1Tn3wi648w90FUYMhuHJY2EK2LvgEufe0TyX8nWXRdI8dEo/Umy8fT7NwiH?=
 =?us-ascii?Q?Xr4yeRORSgs/GS/iXYeQGl26JcrIGC0S2vvBCBw07wph5pOOSVJz0C9jewMD?=
 =?us-ascii?Q?6zwyP3oQVubYAFCkt5ab8pmgIpxkNm97DhvbU6XgkrPR2o2o/l4VmQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(19092799006)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?1IzWu9BKlJp02OT0utP3uCgKrAUS6lXDnAbDhmHGhtg0rbvRcZ5eDCNRcFn8?=
 =?us-ascii?Q?OR59PZ0FH+aySE8TQUaVKofVBumv0jcWrvsp+nRNgO96aLHm66T5Q4o0OiAN?=
 =?us-ascii?Q?Amt+fhAPYSyiLOuntuODqns/mdnDRjQqy0s/XhWF/64A2HB5nYXBRFZlqSYw?=
 =?us-ascii?Q?9DFYCeeNnZSuE+fK/pGadbop6lIsEKgMnYYjXddVRhh33ZlKSQ5GyR43AvAf?=
 =?us-ascii?Q?arMa9oVeS0SWHVObBg4BAkadTU/WEQ4t9Kn/Oi9UMs8cFzx+Cti99BV7WTW+?=
 =?us-ascii?Q?IgYMJbTgog1ospupeU0Kg8Q2agLc0NN0ttyh3EYSJmf70duSXF8C0rGrTiCY?=
 =?us-ascii?Q?OFEKMzsecnh0ZRt0a2oewSNQI6M1eEB8SFS5eRuANcB0xByqaNcJw4a2+/Ik?=
 =?us-ascii?Q?83ONubEWoLqUt9LdAuu4xTYEgzoi6i/lxv3CW9viCnS0RUF9qd5gOB9VP4Ba?=
 =?us-ascii?Q?8O+us97TdBoJfH936yO+hyzvei0K4zAApq7WOPGBc6xrkHuUQFoJ7hD+QY1V?=
 =?us-ascii?Q?6UtAChVPuBoiRG2hDMOjUcsU2je45WpSxLloivdfuRfJLkeBc0w8geXgWzPa?=
 =?us-ascii?Q?/l87PpM6iXnC6w1ngNv1yo2gln9ofqO3bJhj64vpyy3WPehmHzo7FAwkCV9k?=
 =?us-ascii?Q?W0iC8QgAeKBGGmGfM0GgcOUx59YjS5ybHRHQiy2WeKeiwnNXee+YGEIM7Wkf?=
 =?us-ascii?Q?FLKKf3JMGMDhqXHYhmYQoQO8J7AcFLdU4sDkCuxP80QaHeaprQOPVafMsF4x?=
 =?us-ascii?Q?wHsJAPZ5fCb07LuSBBjIPiU3K9QtvYbv9Z/1RakgQ91ytwo03Hm9YWuJ+dMx?=
 =?us-ascii?Q?V+59rnbv420XytC/ijIlK2ThP+M4lAZ4spIdvzcL08TpaTRTltYACMbFr/UR?=
 =?us-ascii?Q?/5uA4gkDumsmU4cCD/bnpKQ25ON3DS/Kh2HCi2uY4wmc3SAR5p21wz0xo6rB?=
 =?us-ascii?Q?pemFkruFFUOIwY9hx2HFPQeLjrM+nBod2UVet3cwdto0R/mFVhWdAfpJG7RI?=
 =?us-ascii?Q?6rI92MPBRqSTRBaRa6S6EZzVoK6llpst4H31dZosKBaeyTWL1yMvaLGlzbiu?=
 =?us-ascii?Q?usvpDORWuRw4tCWpJPqCNZwJVtAWE+4xRtDEF/0YXGxTKM5ILEpthZ7YDvr0?=
 =?us-ascii?Q?PmnbzzN9JZYL06eMSVCLK9qz4CLHEbPliHoKnu1ntLe0nvp9B3urLWeWObGP?=
 =?us-ascii?Q?uJDa1+ECCnFk0RdAjzjxD5Z7zIWWjRsofPspToIJ6fJTlmmL903dELIn0d+F?=
 =?us-ascii?Q?6RYqs/WE26/4uBpnf2xgKdRuYRzcfNpG06Q+Uqa+nkFrEpeedB95TSIm6Pse?=
 =?us-ascii?Q?eXQOmFkBfR9aCGQ5qhn++LdspoOsJiA6AoWrNwjAhCLyb77vJMHq6sd9tlfP?=
 =?us-ascii?Q?Z0syAPPvCdkiYEL8HRZGhZV7Mksc2y4WXHuXYBdiOysFUguhS0QJlBUOYcOn?=
 =?us-ascii?Q?thfm1xtRy3ml3tLlg0Q6v7PLA+jBXMgnxIhoutEeDspPR+zMq5AVCEPCCH7L?=
 =?us-ascii?Q?pSdmu80Q2dTv54bfL9tBxyUNha76q04tav6qRKFb1V8EY3oaQlr3SQPHk7wb?=
 =?us-ascii?Q?MptS2U+LfhxdzfHkjTCITbMDPZuJUPbw9RES3fRl?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d4100aa9-2873-4619-2b3b-08dde578fc34
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2025 14:49:54.5908
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mgJiMASAF4WD0FlF8LlnNN7enYUhA4WuHUPcLDgl2DVWXIa9o6eG82QR2VKTUjj54fOzecO7UQ6t2/+5SICJEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8420



> -----Original Message-----
> From: Rob Herring <robh@kernel.org>
> Sent: Tuesday, August 26, 2025 3:09 PM
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
> > Each subnode within "rpmsg" represents an individual RPMSG channel.
> > The name of each subnode corresponds to the channel name as defined by
> > the remote processor.
> >
> > All remote devices associated with a given channel are defined as
> > child nodes under the corresponding channel node.
>=20
> How is each channel addressed? Are they really grouped by type first (i2c=
, gpio,
> etc.) then an address within the group? Or is there some flat channel num=
bering?
> If the latter, then the addresses in the DT shoulc match the channel numb=
er.
>=20

Yes, the channels are grouped by type and identified by unique channel name=
s assigned=20
by the remote processor.

The RPMSG bus dynamically assigns addresses to each channel at runtime. Bec=
ause these=20
addresses are not static, they cannot be pre-defined in the dts.

Thanks,
Shenwei

> >
> > Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> > ---
> >  .../bindings/remoteproc/fsl,imx-rproc.yaml    | 117 ++++++++++++++++++
> >  1 file changed, 117 insertions(+)
> >
.43.0
> >
