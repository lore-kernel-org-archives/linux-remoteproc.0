Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011031.outbound.protection.outlook.com [52.101.65.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01D526AC3;
	Wed,  8 Apr 2026 01:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775611823; cv=fail; b=tsZkyR/EguZK1G221txbbTNSpPx7wZloQOv9yv6r/k/hn2NDlMDwSGT9Dj3UD8yGmF33wI65PfEfr4syrgjZCzc+S/kfQiJLMZD8YTE9qqof5fsXrKNJsWx4fANMklX0CwTuzD36F5dQlQYOQLUUfDXykvEYhNdg22PhHM562Oc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775611823; c=relaxed/simple;
	bh=GSGmrOTPb4kMD7vUZS33vJyiKjk/oOEgxvQa/PZhSNI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UOexY/KMSiZ8Lgvenu8KPuY0GAOqQWYG1tBpVDqYQF4or5u/vxP3A3A4kde4KvBzJwDEL+7d7yqFt3V/XBLxF8awA5/fff4qFG9GxXeJS9zUjn15ZP2AsGp7BX6kZBBTYHyx31Waj1Oo3UJYPVyh7+Cy/hUGqwMf3umiGY0I+UM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=nYeeHAcl; arc=fail smtp.client-ip=52.101.65.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="nYeeHAcl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fIZQUJhYn7xEfz2uSoUBjvUsQ9Gs+4ieD9sXh0sqHWabYdotT9WwA8mIEzw9H2PU/mrsCDRNHy/VJcz04h6P7kJis5cybuKqUdtdIhmOawGuQ+KcZEBcQK94KXmr7v164xgIsnvvhnpynX9H3yx6SOOVfMU8ZsaFdkHeD4An5HfqR2mgaQEu84CpzeK8gQrFuvPf1yInq+IoU3HbGOe+gmwWkQP7dsc+TcmUuOdiTry07j4jxH+2XO+lrR4sAU6pOiSvA5zmA3IHAiuwAcdrBkETNf6l3aL1lBtbyzhEzkW7Hpk83j347UEMyeMivFt7bwKyrOp4h5NedD8bdI9phw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GSGmrOTPb4kMD7vUZS33vJyiKjk/oOEgxvQa/PZhSNI=;
 b=OUzmg4ZVmAyHdahzCZaY4fbE4tyythzSE4NcBAgsVwA+voSiKvuTtTTFEoa0B2VCpak/ggw0Its09Qp/uSL4D5YVsBrdw0MnBonJZiu5G46hczeIb67ShMT9X/sNChEqM63F2sDdJVD5oLNGAK6mS9lkwLwCBISPGAZw9LoDfVXcWUi//47e/PzGi+JWb954JNaWaT2LyYcTG7ndSLX/DyMQtij/Fe8Onzs6M0P5b/v9249Of7mtPBIyJj9PIL3suoIkPAsv+s8pHk6BanPoJ2ySWI5qp+rUmBYVioMlv0bz2ICXPZWpymjQQpz1EuGfFPWtiNTC7I6864bZK9Ttfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GSGmrOTPb4kMD7vUZS33vJyiKjk/oOEgxvQa/PZhSNI=;
 b=nYeeHAcl0SjOH8AmzzzM01WzhhxXsQRpl9S5H+sm/UVvteldx1n2oZ1QTB2BFAE+nZKJ5jaJbWE0WOBa6HqHqndXgjw/Pvc3eXZ9fqt37WIc8WNaweypSyzcJt1s4NCXxRoCsmZE9SWpXERVG6ACH55I8hRNTMllr8kEJXqzQcB50+2ntYPix3XLpbBbxVTSren6ehfMfHFwYU/uRQrWjiQBm00dCkhfCnaFHKn7Y8QWHOtwD6N7J8wejHoP+K4aOCObJqNj45WoNkCNoF5LHIeCMz4R2B8XNMMWdu+29cINPcKnVWnfWf9vEZSPMe8BcJ61jz2lApy0PK3tu73CDg==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU0PR04MB9227.eurprd04.prod.outlook.com (2603:10a6:10:352::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 8 Apr
 2026 01:30:16 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%3]) with mapi id 15.20.9723.030; Wed, 8 Apr 2026
 01:30:16 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>, "Peng Fan (OSS)"
	<peng.fan@oss.nxp.com>
CC: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Frank Li <frank.li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 2/3] remoteproc: imx_rproc: Pass bootaddr to SM CPU/LMM
 reset vector
Thread-Topic: [PATCH v2 2/3] remoteproc: imx_rproc: Pass bootaddr to SM
 CPU/LMM reset vector
Thread-Index: AQHcvZMMZcXx1YnQb0Wxg/HvT7VMArXHR6+AgACvKwCAC9HgAIAAo2qw
Date: Wed, 8 Apr 2026 01:30:16 +0000
Message-ID:
 <PAXPR04MB8459AA009C932EB9D6139A11885BA@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20260327-imx943-rproc-v2-0-a547a3588730@nxp.com>
 <20260327-imx943-rproc-v2-2-a547a3588730@nxp.com> <acqjS440STRl2sK2@p14s>
 <acs2PAZq2k3zjmDW@shlinux89> <adUghiyZbe3fmcNX@p14s>
In-Reply-To: <adUghiyZbe3fmcNX@p14s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|DU0PR04MB9227:EE_
x-ms-office365-filtering-correlation-id: 27e3b8e2-04c7-4655-9feb-08de950e63b9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|7416014|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 nzSGKs4g23/AqpPdq+cm7u71KJN/B1p/+pz/Hy+m6JYRt9dn9rTBOwk2x2I5vh+wbjbfEIt5IYUl+ly70mQ1XASHuoRK3rAXSOYknLKDCOpSwzqXA2ffhkniyPwAKcNJTuxXDPgM70AJK+sG5t1k7W4R3rmcylIXobcs22aNozkgwX8dT911hH5Ha/z0yUYmxUxitTA6xJ9I56KlWpSRzsBLVwjSUsYGpeY80Kj294mgxm5mNozaZXGdakVpL2x7/BcOs0+ly0qtwa/j+3L74BIJcH0sEjzLrKG7ClE7ldaveIfWgLVIU7nIutKaO4CGadmduHWzNM3IIubOeKlp9ykIc4ZJgivcZIzF9BCDUwrg0Hp8VH8x3Cs7hjv+pvRRmOEfxY4JpWqCnJ0Dodrs3qpzQrYq48dfPfdg+sX+uaCowjQDVlG0NYneO4KmCXgEV+TECnfKB50wvN4FXPT4Gng3jfUp7ZVCAgZpzph3gUUIOG0GwCNuaNCw+iy9EUz+3l7+Z9xsTsJUYrsORm7ZUtD6dAQJrUkfq9MwJToLXkUQr4GR1XFr2qBt9nzMHWF068cmGgo43iIDGhu91Be1lDbfX5XhSxjoGDKc5yQkS49YJj1PAkUv08AebWqlvpnGiMoo3DnseDPQGJv/sI9SnATSg15Qn6ZDhNpTNoe9I6TPFn0Qef01ac0za4N6EZeDn+LjOIrZ2FWfvuB8IXtqmBQ0T50vQK2YvsgNnz5MdVPf6bl2DFemtA8RF1OMb29kXua4uFLATAkE9oUEBFV6VRtuNBSLo88d7SUrbdqK4nk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(7416014)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aTU2dDRxM3pUa3E1Y2E4My9Zck9BTGJBVlpqblNTVUhoeU9GTmc1MlRxSEph?=
 =?utf-8?B?VVpSQjh5ajhwdFg1UUZjbTRuV3JyYmU4ZmRpV2FtK2xhMTFrK3AvQzZiNlVn?=
 =?utf-8?B?UWhCRVB3blFWbnhDWUVNQUdSYjlDM0E5VS9STk5Wam9nYzdMZmVXNW5sV0pG?=
 =?utf-8?B?SmpadUVnejlMUzI3TnVpTU5uNDlESUs3OFBvZWNkSmREZSs5aVNmUjFteFVp?=
 =?utf-8?B?N0Y2YmtiQTJuSzV5L0hMYWJ4NTUwS1YxSVFGVUZmUWtvRXU0TDArUVdtUGY0?=
 =?utf-8?B?bHVRSDRZa0NPdjJkZktMcXFJd2F5bGZvclVtVGNOQU93L3FKV0hzVHJXaUdV?=
 =?utf-8?B?UDg1bGxqbGlnMXVDZVZaUmk4WDFDSjluQjdOZVBDVVpDUHFNSWVHcUVTNUpL?=
 =?utf-8?B?VHNjMzBLaGxHcTVKSG9aUFZrWEZsZkpydms2ektTK2ZnRE54aGQ2anVvRnlk?=
 =?utf-8?B?dnJRZktTK3JQT3JpUFp1T0FYd0t6bTRXbWp6QnV2Y3NCaFNGdlRlTVU4WEhQ?=
 =?utf-8?B?bVBHTVZqTkRiVWM5ZE9UdzdYd2N5Ly9KY2loME1IVThRbXZjYUxQNU9FWVBu?=
 =?utf-8?B?bldqN0VsR2pJSlVYckRwMVFoNSt2Y0gxaWp2UWV5ZmZha0FMVjQzZWgrYnZD?=
 =?utf-8?B?ajkyYWptQ1JCdVA0bVYrT2pqblFTQkJHdklERzVVTERDQ1VlcEVsV2Q3eGFN?=
 =?utf-8?B?eUNyUWNJRms5ZUhXUmVaMFpReUx6UEhYby92S0hHQVpicVpQcXpBK3JSSGM3?=
 =?utf-8?B?R0Z6MFJFYWNHWWFibTFvWFZud3JWWmdOSlIweHBWQ2ZWaXBSNjFZaENtYmwz?=
 =?utf-8?B?aU1yWHBKdVhpWS9VcW53NERZbm9nTEtrVTVOUDFwdUwrb0RwWUdtZVptdjI3?=
 =?utf-8?B?TGdsR2wwVnBWNmFPRnQvejYzek44R1pocWpmbWtVeVIvWnl2SFRpTnlGV0E1?=
 =?utf-8?B?OTNmVi9rMXVSUDMrSURxU3VIQkJ5RzdJaHJrbGdRZUdWNEZ1bEdoT0o5ejJW?=
 =?utf-8?B?UGZWQkU0RTRjMm9MMm1zUFdqRTlKZG9iTTJWZ0UxZjVMU0syd2JPd3BuWHZ1?=
 =?utf-8?B?Q05sSHpzVUJwWTdhbVB3RjNBRU85QlgreFk3aTM2R2tFcEVYWmovekpZcTFV?=
 =?utf-8?B?bHE4Tlk5YUgzcEpHTG1HQm94b0ZDVDM0KzlrWXorVE1qM3NsdzllOWozT3pI?=
 =?utf-8?B?THZsTjg0TnVObzJlZnU5MFA2SGhGYWt3RDBqbU02S0UxU2s5bGRJSGhnUUFk?=
 =?utf-8?B?Qmg2Ym0zUXNKRWFtendmUURJa1ZaSnZBMVlPaGd6alFXV1R5SkNkMXhNV3h1?=
 =?utf-8?B?NmREUHAyL09FUExZb0Mxa1lLZm9ubGpkZzMrdFZxY2VOYTZyV3VxVm9RZ3hU?=
 =?utf-8?B?ZXM0VzhoRjAxdkVvVFNZbUZzUlFQR1VZYklJbi9ZdkxOeTRhQ291UzdVZ3hP?=
 =?utf-8?B?U1ZRTkdaRjRPZmhKWnFUbUNQNDZub1ZGTThxUTZiODMyS2tIZkltcUxNZ01x?=
 =?utf-8?B?MnZ1bWNwbGtORDd6TEFINnRWcW9XS3NpRDM0VTN5Ti9oemtqYmNzQjR3NEdE?=
 =?utf-8?B?TWFjTTRaOWcvYjNIZDhhNjRGZ2x6MU1WOVJzRWlzWHFDTTIxSWtRNDZONzlU?=
 =?utf-8?B?Z2NQQjVYcWIzQzlWeW1mYWlNRERmVERYOFVNa1NUUkpJb0JUTk1VVG9BNlYz?=
 =?utf-8?B?QjFGdFoyYzk2dU5KMmE3bmhWTGdDM2tuQ0ZiQkRoVVJSc2lyMXJDKzFhbXJa?=
 =?utf-8?B?cWdqV2svTDNOdHNZT29TNDBFb2R5ZzFXK3R3MEw2d3hNOGxaYzh2aVR5UE5n?=
 =?utf-8?B?dUZKcEQzbzF6V3hqTXZyK0FYNjJoV3hSVDJYQ1pUUGplUzlsN2pOcFI4cm8v?=
 =?utf-8?B?TTNBNStiNlBReDY5RC9lQlZ6bXhockF2ZGdhYnZ1WXQvelQrNXljU3Rzemgz?=
 =?utf-8?B?RnB0WXVEWmtMSERSN1l0VlRjSmZtYU8wbnVJb1BYVWhSakt2dGJ5eE52ZjY4?=
 =?utf-8?B?VFFYTk9wZFo0eEJOUi9YL3hyYXpEMHYvNEF6bjVjcFI0VzluV0h3bGhydXZC?=
 =?utf-8?B?WnBzelM4ZlF2UTE3M1A4WXBqdmZaek5QQk9ER3FubFl6M2xqY3ZYNWhZdHo0?=
 =?utf-8?B?MElKRzBHSjJWSVRjYXhwaDIwbWZzNml3R2xuc0w3MEltRXYrUFNCRlpyYVM0?=
 =?utf-8?B?eG5GNXk4a0d2TWtSbVpSSTVodm5VV0MxMDBGNzU5M3hTQ0NHVlJvcmZpN1lF?=
 =?utf-8?B?K3BUMEw1MzVpcnVUVGdmdUh3bVdNdjZZK3NoU0lSQ0Z6c0xXd2wzai81TTgy?=
 =?utf-8?Q?AAGVNr27XltpOlUoZ1?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27e3b8e2-04c7-4655-9feb-08de950e63b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2026 01:30:16.8225
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FFfxhrzSlAlfPA3kRCYSQfkYFjQraxadB2GqhfwSRPklGemASGsHfWdlpl9Z+W6aBLEE+1uiBLk4fyxqE1K6WQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9227

PiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDIvM10gcmVtb3RlcHJvYzogaW14X3Jwcm9jOiBQYXNz
IGJvb3RhZGRyIHRvDQo+IFNNIENQVS9MTU0gcmVzZXQgdmVjdG9yDQo+IA0KWy4uLl0NCj4gDQo+
ID4NCj4gPiBBbGlnbmluZyB0aGUgRUxGIGVudHJ5IHBvaW50IHdpdGggdGhlIGhhcmR3YXJlIHJl
c2V0IGJhc2Ugb24NCj4gQ29ydGV44oCRTQ0KPiA+IHN5c3RlbXMgaXMgcG9zc2libGUsIGJ1dCBp
dCBjb21lcyB3aXRoIHNldmVyYWwgcmlza3MuDQo+IA0KPiBJJ20gbm90IGFza2luZyB0byBhbGln
biB0aGUgRUxGIGVudHJ5IHBvaW50IHdpdGggdGhlIGhhcmR3YXJlIHJlc2V0IGJhc2UuDQo+IEFs
bCBJIHdhbnQgaXMgdG8gaGF2ZSB0aGUgY29ycmVjdCBzdGFydCBhZGRyZXNzIGVtYmVkZGVkIGlu
IHRoZSBFTEYgZmlsZQ0KPiB0byBhdm9pZCBoYXZpbmcgdG8gdXNlIGEgbWFzay4NCg0KSSBzZWUs
IHBlciBteSB1bmRlcnN0YW5kaW5nOg0KRnJlZVJUT1MgdHlwaWNhbGx5IGV4cG9zZXMgX19pc3Jf
dmVjdG9yLCB3aGljaCBjb3JyZXNwb25kcyB0byB0aGUgaGFyZHdhcmUNCnJlc2V0IC8gdmVjdG9y
IHRhYmxlIGJhc2UuDQpaZXBoeXIgKENvcnRleOKAkU0pIGV4cG9zZXMgX3ZlY3Rvcl90YWJsZSwg
d2hpY2ggc2VydmVzIHRoZSBzYW1lIHB1cnBvc2UuDQpJIGFtIG5vdCBjZXJ0YWluIGFib3V0IG90
aGVyIFJUT1NlcywgYnV0IHRoZSBwYXR0ZXJuIHNlZW1zIGNvbnNpc3RlbnQ6DQp0aGUgdmVjdG9y
IHRhYmxlIGJhc2UgaXMgYWxyZWFkeSBhdmFpbGFibGUgYXMgYSBuYW1lZCBFTEYgc3ltYm9sLg0K
DQpHaXZlbiB0aGF0LCBpZiB0aGUgcHJlZmVycmVkIGFwcHJvYWNoIGlzIHRvIHBhcnNlIHRoZSBF
TEYgYW5kIGV4cGxpY2l0bHkNCnJldHJpZXZlIHRoZSBoYXJkd2FyZSByZXNldCBiYXNlLCBJIGNh
biB1cGRhdGUgdGhlIGltcGxlbWVudGF0aW9uIGFjY29yZGluZ2x5Lg0KSWYgeW91IHByZWZlciB0
byBwYXJzZSB0aGUgZWxmIGZpbGUgdG8gZ2V0IHRoZSBoYXJkd2FyZSByZXNldCBiYXNlLA0KSSBj
b3VsZCB1cGRhdGUgdG8gdXNlIHRoZW0uDQoNCk9wdGlvbnMxOiBTb21ldGhpbmcgYXMgYmVsb3c6
DQoxLiBJbmNsdWRlIHJwcm9jX2VsZl9maW5kX3N5bWJvbCBpbiByZW1vdGVwcm9jX2VsZl9sb2Fk
ZXIuYw0KMi4gVXNlIGJlbG93IGluIGlteF9ycHJvYy5jDQpyZXQgPSBycHJvY19lbGZfZmluZF9z
eW1ib2wocnByb2MsIGZ3LCAiX19pc3JfdmVjdG9yIiwgJnZlY3Rvcl9iYXNlKTsNCmlmIChyZXQp
DQogICAgcmV0ID0gcnByb2NfZWxmX2ZpbmRfc3ltYm9sKHJwcm9jLCBmdywgIl9fdmVjdG9yX3Rh
YmxlIiwgJnZlY3Rvcl9iYXNlKTsNCg0KaWYgKCFyZXQpDQogICAgcnByb2MtPmJvb3RhZGRyID0g
dmVjdG9yX2Jhc2UNCmVsc2UNCiAgIGRldl9pbmZvKGRldiwgIm5vIF9faXNyX3ZlY3RvciBvciBf
X3ZlY3Rvcl90YWJsZVxuIikNCg0KVGhpcyBtYWtlcyB0aGUgaGFyZHdhcmUgcmVzZXQgYmFzZSBl
eHBsaWNpdCwgYXZvaWRzIG1hc2tpbmcgZV9lbnRyeS4NCg0KT3B0aW9uIDI6IFVzZXLigJFwcm92
aWRlZCByZXNldCBzeW1ib2wgdmlhIHN5c2ZzIA0KQXMgYW4gYWx0ZXJuYXRpdmUsIHdlIGNvdWxk
IGV4cG9zZSBhIHN5c2ZzIGF0dHJpYnV0ZSwNCmUuZy4gcmVzZXRfc3ltYm9sLCBhbGxvd2luZyB1
c2VycyB0byBzcGVjaWZ5IHRoZSBzeW1ib2wgbmFtZQ0KdG8gYmUgdXNlZCBhcyB0aGUgcmVzZXQg
YmFzZToNCg0KZWNobyBfX2lzcl92ZWN0b3IgPiAvc3lzL2NsYXNzL3JlbW90ZXByb2MvcmVtb3Rl
cHJvY1gvcmVzZXRfc3ltYm9sDQoNClRoZSByZW1vdGVwcm9jIGNvcmUgd291bGQgdGhlbiByZXNv
bHZlIHRoYXQgc3ltYm9sIGZyb20NCnRoZSBFTEYgYW5kIHNldCBycHJvYy0+Ym9vdGFkZHIgYWNj
b3JkaW5nbHkuDQpUaGlzIHByb3ZpZGVzIG1heGltdW0gZmxleGliaWxpdHkgYnV0IGRvZXMgaW50
cm9kdWNlIGEgbmV3IHVzZXLigJF2aXNpYmxlIEFCSSwNCnNvIEkgc2VlIGl0IG1vcmUgYXMgYW4g
b3B04oCRaW4gb3IgZmFsbGJhY2sgbWVjaGFuaXNtLg0KDQpQbGVhc2UgbGV0IG1lIGtub3cgd2hp
Y2ggYXBwcm9hY2ggeW91IHByZWZlciwgYW5kIEkgd2lsbCB1cGRhdGUNCnRoaXMgc2VyaWVzIGFj
Y29yZGluZ2x5IGluIHYzLi4NCg0KVGhhbmtzLA0KUGVuZy4NCg0KDQo+IA0KPiA+IDEsIFNlbWFu
dGljIG1pc21hdGNoIChFTEYgdnMuIGhhcmR3YXJlIGJlaGF2aW9yKSAyLCBEZWJ1Z2dlcnMgbWF5
DQo+ID4gYXR0ZW1wdCB0byBzZXQgYnJlYWtwb2ludHMgb3Igc3RhcnQgZXhlY3V0aW9uIGF0IHRo
ZSBlbnRyeSBzeW1ib2wNCj4gPg0K
