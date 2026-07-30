Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013056.outbound.protection.outlook.com [52.101.83.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB883845D8;
	Thu, 30 Jul 2026 03:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785381922; cv=fail; b=WQawvvhak/T7Cl71yfRLmHuDld7XH8mChA1a+VPrI4WNagrlGLnollddIgU3K/uK7FGPQc6J5e5WJJnMCDrPp/Q6YB3T7F3I2autf2t9mhac5mB4L78OYIbjuklz93SnJz8nJdY0b0wEbfN0C/Ok1cb3E37oRbaC3O6QVop6ki4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785381922; c=relaxed/simple;
	bh=bHjoS9l3LbxbMM0B1IehSP4XCQrsf9xxvsvISp5MCcU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tehSbXUQWBjLY7SGU2fZE5w8U6caNwHb2AdwXouAUeazM2QZ3xZu8a+xLPfa90ir4ScrHaCK1fjjxvQW5aPhGAS5Vqrah8J2gZiLar25nBCAkZUJMkYCOaI5k15UEh4uh/97ZiaB1jn8QSVCIe0RTwBo3mugzl0HV1vb+bxPmcY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=n+4vsaBQ; arc=fail smtp.client-ip=52.101.83.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="n+4vsaBQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SnyKkgMOp1XtvVGmHmtZXyEYyGHFD4yDYwVPnaqcPs99Boro9tk3dDXyP7+MmiVbGuMnIf5v9d67JOtryaFoPODtoPZRjTO3Xr0qxKmNM3E2d9UI3N/ntq9yLZ9y5neQjv2zugbr3ZxfK6eRjcL+/pJqJNipFXNhPUFUkefKU+tgUxrT7zTjoL+OCDQtDzdc9+CbnRuqlUaewdDY1Bi80uqsWitFnVFUOqMzbHxCmhNibL6C2bw9m8X39c371wFOy7w9R5yqeXh90V5vzLyVQR90U+pR+rU05BVd1XKyIjBuqD5+3cdANrO9Q+ueJa5E0xsznKlgKlXTf4bY1T10dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bHjoS9l3LbxbMM0B1IehSP4XCQrsf9xxvsvISp5MCcU=;
 b=mN7M4jrm7WPUbFQSAZDflF9TNe2a76wHhqxIugroKbJ1MaH8iF/wCdcbv5qh+jxBNdQ0UTzhqkdJWjCkD6VOQr/bhFbyfY35tNdtwjc53VEpFKzCzx7s/FXqZHxf9+EV53vjGVYZV579n1Hn7Ml4JZ07L447Ad62w3BDRiA7RF90tJ0vcsqaMwXGfdr1xrcmYljGwswG4KW1fxsovcAPP1srnppVh7/5JtlEiwISz0xCSNlqdIe81KJMXG2a0oEXTESOYDsw2IN1vXnD7XJuEyJoYOUW5juCw808KErzUSjxpnh34Q9CtBL8PBravUB583kaiSuuYUy1Kki7ukO9WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bHjoS9l3LbxbMM0B1IehSP4XCQrsf9xxvsvISp5MCcU=;
 b=n+4vsaBQaB5K99d/hosZJPpW/vOynpbx7wR+KtF2qvBFqTiEVxbIV558scfMJ77jmBC/0SmimxEoKCwzu24R4jdl64GOmCDPkgwmFlzhTc/2h88a6OMJk5ViZ2/hk0IYhp2ju5O2von8OD9Ez3GAoH/wuHqjAoYJ23FvRAdgWG6XLYyhAq/psbFratOnR1I9rL0RvodQGl9xMlAjN7g3geAnr/1yglvuDnuJKmC+eWMmvsNf2Qyc/w3UTEljuMGt/P8OfjfAvyylo5joT0CwzlyBlp0Jwb6OLKca/dzLdSCbQIlGMYtZWKhUThMMpIOTN8RDU3bJZfbHd0/WXpg9uw==
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com (2603:10a6:501:7f::23)
 by AS8PR04MB9126.eurprd04.prod.outlook.com (2603:10a6:20b:449::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.13; Thu, 30 Jul
 2026 03:25:15 +0000
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889]) by MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889%6]) with mapi id 15.21.0270.009; Thu, 30 Jul 2026
 03:25:15 +0000
From: Peng Fan <peng.fan@nxp.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Bjorn Andersson
	<andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, Frank
 Li <frank.li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Sashiko <sashiko-bot@kernel.org>
Subject: RE: [PATCH] remoteproc: imx_rproc: Fix off-by-one in address
 translation
Thread-Topic: [PATCH] remoteproc: imx_rproc: Fix off-by-one in address
 translation
Thread-Index: AQHdH9DLydvjnWC9sUWOgnw19y6ZubaFZkpQ
Date: Thu, 30 Jul 2026 03:25:15 +0000
Message-ID:
 <MRWPR04MB12330B0F711943B1F556204E288C92@MRWPR04MB12330.eurprd04.prod.outlook.com>
References: <20260730-imx-rproc-range-v1-1-97c9ca7a5658@nxp.com>
In-Reply-To: <20260730-imx-rproc-range-v1-1-97c9ca7a5658@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRWPR04MB12330:EE_|AS8PR04MB9126:EE_
x-ms-office365-filtering-correlation-id: dead7c40-0d45-4332-ebd8-08deedea2c44
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|1800799024|376014|7416014|366016|23010399003|38070700021|6133799003|56012099006|11063799006|10067099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 i0LCSNggNSUj8R4+mgp5m0t2xkDU+A8jFBIpu8hUXMOxYjYt9tN5Y1c2JHXLYO9PnkFH82gZuRwHOKK6+N2UCcuvOl8L8k/u5hUjr6RJWtKfUKUTiBVlLaNwTLbJHpx5dOhIZ7JEzeEZEBTWPIga79UPZeUviTBCdbKQ7UMUJx8+0IE6FHTS4B06xmAMHBk+UcQyH1i2BgVbjxazgBxBlEIwkcgvA1eoUU3yVEPaOhxfU7bczXw4vUPNK6jURjaa23d0BG51gclLZaLoe2w/RQkm7Xf90/sIkBc2yXCuesb00tNtTijP+ew38fEHIeVGk/TU5PRLk0kbLW+q95jCAm7kcRiTDGWhH6iYMhGMVd5tXLd/j+WHlIQEgNJbCZM2LlqVDQLeumxlmKrIh2//aZJCoq8I/F0X5FhSa/Q2/ayaH/Mc09jASD6nuJrz00MiqJfqLSdQeV1e5T10KMFfLKEKZxzGWfyIGE35Rns2nLKEDaD/FjpgqWt7+jH5oRo2JK81klRWSq8ffTIF7KDqDdIjfTQpXZAJe8PN0g9dH/g418IbLjkcVT4pfiG9uQyQtwYYXRAoQLQPVvXgrOrzHgKWD2VBz1Sl9CxdmCYbo/DtMIT9wbm4lkB/5lfjBXDjJuf+atLrn4JjpgC2F4/Q1wvTV0zVryULd5KgNlUPPN4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWPR04MB12330.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(7416014)(366016)(23010399003)(38070700021)(6133799003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bTRvb3U1SkZ3R0RFcXZVOVVYUWVSOFM4dnlaY21yZ1hvcUJ5M0Vid0ZNSU5I?=
 =?utf-8?B?ejE1c2p5TG93TURQd2UyYkx5cm5qNGo3UmVZNWp3WTdhUzFPLzRROXVrT0ln?=
 =?utf-8?B?RXpDYmtLRXZXdURzZFpBbXVnU080c0RZZ0YyUVB3T3ZuT3pBTVpsVmFxVDdY?=
 =?utf-8?B?eXVGdzBtZEliL0Z6U05PTnNwRW9kdW4zRGEzU2tMK3h2ejJLeStpSFFCUkFk?=
 =?utf-8?B?VU1lMkVEQXRPcHJFbEhmN2NFT05ZU3djeXJ4WDVCRmZyeGliWFVyaDVJT0Nv?=
 =?utf-8?B?KzBKMktpNWF6YVMvcThnME1VT1hQM2pmR3J5aFBucjZZMTdPMEJsUmRBTFlW?=
 =?utf-8?B?ZGNJYWV2cjdQU09WbWp3K243T2gzd2VLTE51MGlKbTNMYng3ejd1ZUFmNjJ2?=
 =?utf-8?B?RmFyekoyVDY3RzZ6VkM2M2tsNGlrTk1STlNZR09RT0wrMHR1dC91NXpoMVNu?=
 =?utf-8?B?enNPU1RkdkpyT21uREFBK3BTeDY5M01GUnRxL05qTm1HUnpFUUd1UDhGejNR?=
 =?utf-8?B?RmgwQ2laK3dQTnVvZWl2NmloWmRhM0ZHZm4ycHVNTGRYUFZBbWlvbXFrdDNu?=
 =?utf-8?B?UFJQVW16RkhGMTJrem9qKzk1SGNucnBBU0V6TkZyR3hZVDlMZXppNDNtWHVX?=
 =?utf-8?B?QXBUOURaWmdXcmlVd2hWazJ1dmdRaHZMeFZjTDVxdGZHQXBKdDhIYTFzazZ4?=
 =?utf-8?B?V3ViOTdXdEhsWlhOdXN6b0tQNWdvSG93eE13eW4zOW9wK3cydHRvdm5BbE5s?=
 =?utf-8?B?cWVnbWZVNzJlWkV4V0VnV3l3TUszb3N5dVRHejdjWHpMTXRGSmdGY2dtSlFv?=
 =?utf-8?B?MG1JdkduU3dveWRsNHlMRzdPQkRSenRCNE5ObUUzMnlpckdDTkYzb1R1VkVx?=
 =?utf-8?B?VEsweGY5NnBEVldTRFlPaWdQTC9pNGwzTGt3bjIxOC93MklTanVGK2RnZjZI?=
 =?utf-8?B?MmFHeHlLNkQ5NkFrVnlKNnc4RGVQbzNzNzdZOHA0S0ltdXBqVy82ZTlPbjJZ?=
 =?utf-8?B?bGFUdjJ2d3oxWUJyc1JiQkpJY1BPd0Vjb0FWZVZYSGJJNEkvS09qWGExa0k1?=
 =?utf-8?B?cUExRWN4b0xlRmN6ZTdOaUpUMjJCTkdMSjJnOThEUkpPcWQvdmp2SDEzNTZp?=
 =?utf-8?B?QUd2d1I1N3VSbHhZQmJGaXR1amZVdS94QUZnM2wyeHg0ZEZjbE5xQkxsQVNE?=
 =?utf-8?B?NVNmTDlreExKL2NOVit0V3RqeUJNNlE5REQ4d1pBeEk5OFpCVUgzeThvaFph?=
 =?utf-8?B?VElEQ2d0TlEramJtY3NzYnh6aGJ0eHRuQk11a3ZEUytwM1JFTkFRckRuWXZv?=
 =?utf-8?B?c1NTemxBbXl6MFpTYlpjS0ZXWm1LbkxBaFMwWktBbmhOSmdtM3ZBSHIxUmtM?=
 =?utf-8?B?UERQdWV2Unpqektka2xxQzEzaVQ5OG12cEMyMVdSRTl0TmdqTVpaS1VGSU1E?=
 =?utf-8?B?cjlkTy9WcmdKQkU0SDdQY2l3NEd3R0tydVFOOWlWWGJSaDVBUXdMM0laNjR4?=
 =?utf-8?B?NXpTNGcralJvM1NQZ3lSdk4raTRCUVdPY2RaVjUwNXZmR2wzOFd2czZ2eHZP?=
 =?utf-8?B?TE8yZlNSLzk3RWpIUnNhL0hPcGpRVmQvd2p4S2ZZNTdJMmJBUE10OTVRWEVu?=
 =?utf-8?B?M1VxL2hXSTJSR3dPYi9XVDJYcVU3djZwbG5YdHpwaXZ2MHF3WHhKdnhtS0pO?=
 =?utf-8?B?SUViaDZ1MHNJMDZqTnpLZDhaT0hCODVRaVU4RWhEODVWbmhvc1ByTTVmbnZr?=
 =?utf-8?B?MHpUNkdJMTBIeUFmbHA3Z1RuYm15WUFSb3RiRDZwQndJVTQ5T3AzQS96NmM3?=
 =?utf-8?B?V1NaaDVmOFUxbnFFcXIya2ZBWWE4MjZ4RnkxTlA0c29xZkcxR0wzT3pyS2I0?=
 =?utf-8?B?ZWs1ZzNXaFZXSU1tNFRIME9ENkp5bU5lbXYvUDR3NWZuK0FEZnJGa0d5a3VQ?=
 =?utf-8?B?ZndzdlBzRXFmWFRvcGNIRzBMMm90Ykl1NFducWpPYmRYWFZSMGpVbjZuemIr?=
 =?utf-8?B?VmZTb0hlcGVIOGZmYmNxU1hZTHdWTEIxYVpHczk1L1hZYmNUOEhwdCtLYXUx?=
 =?utf-8?B?NU83SmYydEpUYTI5V085Q2E4ai83SmYxTncyM2VYdnh2Qys3UWUxblJIUk1P?=
 =?utf-8?B?TVFObFhkV0lsVU5BOXVhNzB5L2tRV3p2T1hrNTlRN0xvWUpySHhiRVl0Zk84?=
 =?utf-8?B?dlFoRWNVbDJTNlJucjRhazROczIvVlBlc3hpRmFsV1ZIcTlrTGpxTVFKNjJK?=
 =?utf-8?B?WDRmSDB6dnlxa2Y0RWIydjdJamVoT1JQR1pwcjhMMFJFUjJ1cytDMW94emJK?=
 =?utf-8?Q?my5xYx5+tzRYQzZkwY?=
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
X-MS-Exchange-CrossTenant-AuthSource: MRWPR04MB12330.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dead7c40-0d45-4332-ebd8-08deedea2c44
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2026 03:25:15.4007
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5VSMCprfeY+EoZZCXIllnLW3PMkLj+CC1IwYvEuoUypW4hOer1L2O5GK6r+pMft+vwhlpzzY7k4oe1w3lRyAhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9126

PiBTdWJqZWN0OiBbUEFUQ0hdIHJlbW90ZXByb2M6IGlteF9ycHJvYzogRml4IG9mZi1ieS1vbmUg
aW4gYWRkcmVzcw0KPiB0cmFuc2xhdGlvbg0KDQpJZ25vcmUgdGhpcyBwYXRjaC4gVGhlIGZpeCBp
cyBub3QgY29tcGxldGUuDQoNClRoYW5rcywNClBlbmcuDQoNCj4gDQo+IEZyb206IFBlbmcgRmFu
IDxwZW5nLmZhbkBueHAuY29tPg0KPiANCj4gSW4gaW14X3Jwcm9jX2RhX3RvX3N5cygpLCBhIGZp
cm13YXJlIHNlZ21lbnQgdGhhdCBleGFjdGx5IGZpbGxzIHRoZQ0KPiByZW1haW5kZXIgb2YgYSBt
ZW1vcnkgcmVnaW9uIChkYSArIGxlbiA9PSBhdHQtPmRhICsgYXR0LT5zaXplKSBpcw0KPiB3cm9u
Z2x5IHJlamVjdGVkIGR1ZSB0byBhIHN0cmljdCBsZXNzLXRoYW4gY29tcGFyaXNvbi4gVXNlIDw9
IHRvIGFjY2VwdA0KPiB0aGlzIHZhbGlkIGJvdW5kYXJ5IGNhc2UuDQo+IA0KPiBSZXBvcnRlZC1i
eTogU2FzaGlrbyA8c2FzaGlrby1ib3RAa2VybmVsLm9yZz4NCj4gQ2xvc2VzOg0KPiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNjA3MjkwMTM1MDYuNTg0MzIxRjAwMEU5QHNtdHAua2Vy
DQo+IG5lbC5vcmcvDQo+IFNpZ25lZC1vZmYtYnk6IFBlbmcgRmFuIDxwZW5nLmZhbkBueHAuY29t
Pg0KPiAtLS0NCj4gIGRyaXZlcnMvcmVtb3RlcHJvYy9pbXhfcnByb2MuYyB8IDIgKy0NCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvcmVtb3RlcHJvYy9pbXhfcnByb2MuYw0KPiBiL2RyaXZlcnMvcmVtb3Rl
cHJvYy9pbXhfcnByb2MuYyBpbmRleA0KPiA3NDVjZTUyY2Q4MjI2Li45YWYwYWEyNmNlOWI3IDEw
MDY0NA0KPiAtLS0gYS9kcml2ZXJzL3JlbW90ZXByb2MvaW14X3Jwcm9jLmMNCj4gKysrIGIvZHJp
dmVycy9yZW1vdGVwcm9jL2lteF9ycHJvYy5jDQo+IEBAIC01NTIsNyArNTUyLDcgQEAgc3RhdGlj
IGludCBpbXhfcnByb2NfZGFfdG9fc3lzKHN0cnVjdA0KPiBpbXhfcnByb2MgKnByaXYsIHU2NCBk
YSwNCj4gIAkJCQljb250aW51ZTsNCj4gIAkJfQ0KPiANCj4gLQkJaWYgKGRhID49IGF0dC0+ZGEg
JiYgZGEgKyBsZW4gPCBhdHQtPmRhICsgYXR0LT5zaXplKSB7DQo+ICsJCWlmIChkYSA+PSBhdHQt
PmRhICYmIGRhICsgbGVuIDw9IGF0dC0+ZGEgKyBhdHQtPnNpemUpIHsNCj4gIAkJCXVuc2lnbmVk
IGludCBvZmZzZXQgPSBkYSAtIGF0dC0+ZGE7DQo+IA0KPiAgCQkJKnN5cyA9IGF0dC0+c2EgKyBv
ZmZzZXQ7DQo+IA0KPiAtLS0NCj4gYmFzZS1jb21taXQ6IDM2NTJiNDlhZGFjMjY2YTNkMjdjYjQx
Y2RmZGI3ZDg3OTBmYzM2MzMNCj4gY2hhbmdlLWlkOiAyMDI2MDcyOS1pbXgtcnByb2MtcmFuZ2Ut
NjM4MzczNGFmZjQ5DQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IC0tDQo+IFBlbmcgRmFuIDxwZW5n
LmZhbkBueHAuY29tPg0KDQo=
