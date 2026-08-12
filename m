Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013003.outbound.protection.outlook.com [52.101.72.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B707D3E7145;
	Wed, 12 Aug 2026 09:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786526392; cv=fail; b=WczjE0t0ItpFEpTaLwTwnI5DeFcSt57a+kd+euchWvofW6Hl/f6TaxInAaG71CZwQW/rtXsjUR9pXDFVfCIjNHM8cr/I+meEjiUuGMoY42XPmr33eok6SuN6oNm6MZIP9zDcZ5F2uwJIQxwMzgDsSBBZgnxUtfvRbGSX3S+8Sfo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786526392; c=relaxed/simple;
	bh=QbWUCnhXTQxRVsqkl5WYglVZOa2U0SdsgaGY217H7A0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pVvOox4oxHCMobUEx0gyxiqiqU1xDVhesOOcdUgT8apRvK1TM1jVs8w/7dcB9GzM+ksyqhwnfwZin4040gpw+dV7NPgjVJo2aPNQW+SYitMF2wevlUOVCYsXo3bDuveVMsvcntwzD5JZgiTbPXt6E5n+muOkwMG7WiBvGuezyOo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=KJEzTbdv; arc=fail smtp.client-ip=52.101.72.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="KJEzTbdv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P82TsS3RIMSOJEldU2PZflHsPjjgxOWr4W2hUiAQbLiKmzzTS/Ml7mfbsM4aF48U9XGwQ+b1Z0Pdm48C03xiXa3CZNKiuQKu5LKRpkLn+9sB4IUJWPbu8oGbjIbzpoXJs6/KAuHYz24ykOx0wtIJJHlwzPzYUhPgn16ghs8T+GrJIWZRAt7EjxsJsv1gZ6q6Lq85559n0doQCmS5NDeM83U678JJ3ouimpWEvbfsCJNoKC29nH+1lEJOLGLSwdF0VndBRliBmy5LjuA8RghbohtDWeen7Fzk8orDY0/rjepZS+hfmSmI266fswMuX+TypqcG0mAYz4kE05nG/KLr/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QbWUCnhXTQxRVsqkl5WYglVZOa2U0SdsgaGY217H7A0=;
 b=nEErdU7h0iCZYOt1xw+gLqiWH3jD115eTcj4wNZHUwTEC8vzHo41IiHmib0ooDgPceFNDQi2Hlmc4t+5Ts0miqjunxY3q46v0eCuVsUQQh+aVs4DWgcTFBNpdxdpjtKasfPkkWEfBT/uuERQHg7MsawdAyMgo4iWNwH336f25hQfaSVd0NOInr/eSanhL4A4KY8mi4IV6dqAFYx7w+WzCgJwG61TZy8J4QBc/CkjE1vbZsDy0q8CHa7D7OmdovxZLRM6FEZKRjfW4dk+qkVZAfJO18J2J+CM4efUaRUfb8ZmUTf+XXbrYK1+Hz2Im7hEeysGJZvALsCMW4IwJmqGBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QbWUCnhXTQxRVsqkl5WYglVZOa2U0SdsgaGY217H7A0=;
 b=KJEzTbdvFSDZSXo3jDDIE56LOr0klfxiGbAS7IwkDwVeMqpCHDjWTV5KoG0SWxoEbEyUgmiGO6/nGphENVU7t4SsGnPcBn48g+nNhkTXur3n7JNQUX7JA4IAbLD+Uqn4SahP/Q64QSmrQKqkStV66t8gKFUP3ig9QnFBfiW4GwSfraAaupypnclX9/UDsXgdCEkKsr/D+WiDAITLWuFOdNAV0GrQs4D3PWdXJPTxHbA6udwWvv+PDQ9D39p1wxVSpQyAYhIdlonnb5jdkypy87pL2bKBVTM5+7r18eqD7ioKeu7xAkIQ4r6taCpBWzGnYyRD6q/lKdfsbEMAWNeoWg==
Received: from MRWPR04MB12277.eurprd04.prod.outlook.com (2603:10a6:501:81::19)
 by AM9PR04MB8569.eurprd04.prod.outlook.com (2603:10a6:20b:434::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Wed, 12 Aug
 2026 09:19:46 +0000
Received: from MRWPR04MB12277.eurprd04.prod.outlook.com
 ([fe80::b242:b18e:8fa3:56f]) by MRWPR04MB12277.eurprd04.prod.outlook.com
 ([fe80::b242:b18e:8fa3:56f%3]) with mapi id 15.21.0315.008; Wed, 12 Aug 2026
 09:19:46 +0000
From: Jiafei Pan <jiafei.pan@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "andersson@kernel.org" <andersson@kernel.org>,
	"mathieu.poirier@linaro.org" <mathieu.poirier@linaro.org>, Peng Fan
	<peng.fan@nxp.com>, Frank Li <frank.li@nxp.com>, "s.hauer@pengutronix.de"
	<s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "Z.Q. Hou" <zhiqiang.hou@nxp.com>, Mingkai Hu
	<mingkai.hu@nxp.com>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, Jiafei Pan <jiafei.pan@nxp.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: remoteproc: add imx-rproc-psci
Thread-Topic: [PATCH v3 1/4] dt-bindings: remoteproc: add imx-rproc-psci
Thread-Index: AQHdKju3n9+gWoLR30aPfO35H8veRA==
Date: Wed, 12 Aug 2026 09:19:46 +0000
Message-ID:
 <MRWPR04MB1227740CFAD4D4AAF1758F8A48ADC2@MRWPR04MB12277.eurprd04.prod.outlook.com>
References: <20260511023928.39640-1-Jiafei.Pan@nxp.com>
 <20260511023928.39640-2-Jiafei.Pan@nxp.com>
 <20260514-omniscient-futuristic-macaque-af0718@quoll>
In-Reply-To: <20260514-omniscient-futuristic-macaque-af0718@quoll>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Enabled=True;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_SiteId=686ea1d3-bc2b-4c6f-a92c-d99c5c301635;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_SetDate=2026-08-12T09:05:17.0000000Z;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Name=NXP
 Confidential;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_ContentBits=3;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRWPR04MB12277:EE_|AM9PR04MB8569:EE_
x-ms-office365-filtering-correlation-id: 7a4fa805-12f6-4eae-b217-08def852da16
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|19092799006|23010399003|366016|1800799024|56012099006|10067099003|11063799006|3023799007|4143699003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 5LiFioutdPby6NJzWi1XvGc3gBGRLolrZy3qbpw4MfiuUvtLNwcrw6YTauI3+28HBtQoxXI5HKg31nTyproNWKEsZvtN0LpBzt07zVflg0dRzNfsR4nJEW+tA3YudRU+tHaV9cdrPU23swuL+Fw8xpLXlBtUIYvaiy59rfQ7YuSoKpUZErfuVa92z4632mG5T34bvEivovPiSdbt9vrTkelYSuMTwcKP5Ct2Llwi76H0fY1i9l9//6uJrolBH6di5W5nR1O8lQEs0kvsULdQHxfYC2IQicUX8c0yg726iuvtZTXOQ4uPaYOoYgAjjb9aGTgn6fxg/hJ7lbpAN2SHL/3OGrhiQUK/Hkf7/HiLzriv9eDEHEnj2U9f5YkUI0WmaOos5QB3LQeDYBLCfPWskzDqw3YLux0/MsCL98zzwLZQ5ViXLL/n2sR+ZkjOgbVey+KAwFVp21U2ZUsfAZxKGc+EF6zxNDNIe0FjAOgpvhyrpwH1opv6t8qJYllkh9Tqc5tsfhbisv7B5vURBFr8sdUmaCvAzY5siT3e6fiy25p6bu42moHVIrNsu02dhsPfaFaXKTcUiFXRLMFm3Jdsrz+2NWesl3i7ngGCNIfoE8fQPbC6aW7KLpfmmV5akn3nKEAjwoH3CyG58QN92nXHp3fktn51RVKhre8WtBJ1t0C04yK4SYSJW1JJ36pgTUpPQEA2jU5r0spgAyfSvS6EQuvFejcynfS7AvEOOkMMrZc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWPR04MB12277.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(23010399003)(366016)(1800799024)(56012099006)(10067099003)(11063799006)(3023799007)(4143699003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UXBnMFhBNzZ1VWh6WVNaMGJ6S2pueW9LVW1PM2t2RHJKQ1JsOEZvQ3k5dGh0?=
 =?utf-8?B?MFJrV3NWTEhndEZUNTlja2ZOQXJlR1ZBb2NPZU4rY2FPb1dFb0lLSHFhemQz?=
 =?utf-8?B?aTh2cWxlM3BJV2dHbCsrRW1iSUdLZFVlcG5kbUVFTzJoNUt2REtnNXhDOUZz?=
 =?utf-8?B?WFQza09IVzhrSzk2cDkzRkZtM1JLd3R5RGlXczZwL1pGd2ZpZnlxWXZCQy9X?=
 =?utf-8?B?TUZYcExYV3p4OXYxUmdoRDFnRm12a0lUOExScUFvOXNxS2grdENKTVpFR1NE?=
 =?utf-8?B?V0FacDUxUXR2dDdxZndlQy9vRFRTODB4ODh1NXdaQWdVTXZ2MUpodFQ0TjZh?=
 =?utf-8?B?Tkk3aWllZkNabnFvemtOYTVJL0cySzBFTld4bDZYaVl1Y0NKbDIzKzYycVF6?=
 =?utf-8?B?bWM0d1BqdkFYU0hVLzZiakJBdVhKMEd0VTh5WDlad0VXcGNwbUEyYnpSRmxy?=
 =?utf-8?B?QVdBeVlkNWlFa2FBVGZCb003WU12QXViODRxTjNZSWNqMEIrVFlKWXIvdkdi?=
 =?utf-8?B?aE9IMThiSld4ZkpHOGhzRDNnU1d3ODdYT3Bmd3dRWmo1S2RxOTB3N0pGUDRG?=
 =?utf-8?B?djM4SWxEREsrbVEzdDk2cnV2UlVGaTV4S3krNk4yQXdaZWZWcXIwMitadVFx?=
 =?utf-8?B?dkQwanN0b3U4aDE2RlgvbWwxQno1VU05dUx0RVZKeVJiWEZmK0lrNWhNa01Z?=
 =?utf-8?B?SU1WbE5QVHJuQ1VxWncySlhpZWRTdzhoSTNwUG1JZjhwTTBjY05lUTVHRlQv?=
 =?utf-8?B?VFRnMVI0UWJOMWVDWE5UYVMwcUlrU1FJbkZaTFhSaTZ6QWgrRS9tWCtCQzdI?=
 =?utf-8?B?OUtFTGNTS2gvNmlpditjaFdicUNtK1JNZ1JGbzc4VFhkSnNyMlNGTjI1OWxR?=
 =?utf-8?B?WkRZeUxwTGZVSzRibE4wVnQyeVZHaDBVSHh2ZFFxSlR1c2t3dXdvUzk5Uk5E?=
 =?utf-8?B?QUVqVG9lVnYxV2NESjRoUWpyREpJVFc1N2h1NWJCQlpvWmVqSklHMW1yYTFO?=
 =?utf-8?B?WW95bm9QVTk3ZVluVWx1QWh5MFVkWHoxTlhMWWpFZ29CWTFNN2hEelUxMXFO?=
 =?utf-8?B?cEhMOWp4cnpac0lMY3VZc1BGNnB4NjFLNFlaNEJ5TklmQXhyNDNIdi9LRHBw?=
 =?utf-8?B?N0t3TlBUMUpKM0s4RFRKcmF6ckhJelJOeWtsdEhJMFVRZkRVTWU1ZmVhU0Iy?=
 =?utf-8?B?ZHBwU2xtcTIvdUVkeEYxR0MzNXVuQnNZVG5jU2Z0VXlxejR5WFA1QWV0R2tD?=
 =?utf-8?B?Q0pFRkphTlRwUE80dUtXTFJrRGYzcmRKV0kraEc3dk8vOGhjQmhWV0wzck04?=
 =?utf-8?B?bkZPdVZHMkhUbEJBWVNMa0VPTjFicjRQYXlzZUpaYUVzSWtKK1VnZjlUV0xq?=
 =?utf-8?B?MFFvazl6KzVLbXVCZmp6UWJPOHBDazkrVE5talRyTVFXK2Z4cWo5cG9Nc3RN?=
 =?utf-8?B?OWxvMDA0MEZKMTVrSExyOGRzbDNoWGNjN3JnTzJTYldzc3VxdDdEK0hQVUZx?=
 =?utf-8?B?MVlUdlRqZmZLTDJ6UGZ6S2FsQldoVE5qaWliZ0h3bE9jYjVJTFVESGRzaTVY?=
 =?utf-8?B?OUpJR2N2NitkZGpFOWRnL2U3YWYyQ3loYmt6a0pRNTJjM085TUF0NVFXSXFD?=
 =?utf-8?B?REt1TlkwMjltZnkvd0tPTXhSbXVLb0FiWURTdHI3WXBuZTJyY3NXTzF3blRo?=
 =?utf-8?B?SlE4dWM4OUFKcU5zZGpFR0xXV1lVQUZ5YTZFWHAwYm9WQ3ppTklQMGpFYW5W?=
 =?utf-8?B?VUtCWW5VWDgxUEhsL2pDZDI4WE5yYjF1OGJmWG1hZjVyMExBMkFGdEZJcDdO?=
 =?utf-8?B?eWl0YTFzUHNaWHFYcnpoR0VvNm1ueTZ6eVlkZHBuR08vQnhwN2srZFM2bmdP?=
 =?utf-8?B?dlFYM0hIdVdVTklaK2dCL1BuSXIwSHJqUEdQS01WL0RXalV0dCs3cGhXWVZa?=
 =?utf-8?B?NzdhK0UyT0cyYjl6SkVEL3BRTmtxSk4yUHR3OGs3aW52ejdtRGkyK1laWUlO?=
 =?utf-8?B?UTVuYUpFRGFoVWU0eGgwaXhKamdaMUZ4aFBwUUpRSEpkWVZvOHhBRUQra29v?=
 =?utf-8?B?Y1F3SkN3RGl0azlkSlBXTlNIeWR1SVR2dlRidFJmcFV1QnZBZGJBc2FwU0lV?=
 =?utf-8?B?aldKVC9SVmRoSTJRVW1LN2U2K0hVOHZ2T01JL3RsODR4ZEtJOE54YzNOM0du?=
 =?utf-8?B?RWNUZE9TM29vTU1IeEdlSnd5b3FkN2pkQm5ZOXJoRjJBS000T3YwU0lqTTRX?=
 =?utf-8?B?V1FZdTlqcnJvQXJ6VTI5SFhxNHBCaWNQaWJyMnd1QU1mUEloWFJXMXBCR1h4?=
 =?utf-8?Q?RWXD3f+PzhpvCi+u04?=
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
X-MS-Exchange-CrossTenant-AuthSource: MRWPR04MB12277.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a4fa805-12f6-4eae-b217-08def852da16
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2026 09:19:46.2715
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WVpXx6UiKXJ27ooVAmr0EArSZ2cMdounz5zWqDFo9RyzR4NsoMny8ca5JCLQPeIXhYgeU8alPsjMtioIZt+58w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8569

DQpOWFAgQ29uZmlkZW50aWFsDQpPbiBXZWQsIE1heSAxNCwgMjAyNiBhdCAxMTozODoxM0FNICsw
MDAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOg0KPiA+ICtkZXNjcmlwdGlvbjoNCj4gPiAr
ICBUaGlzIGJpbmRpbmcgcHJvdmlkZXMgc3VwcG9ydCBmb3IgbWFuYWdpbmcgQ29ydGV4LUEgY29y
ZXMgYXMgcmVtb3RlDQo+ID4gKyAgcHJvY2Vzc29ycyBvbiBpLk1YIHBsYXRmb3JtcyB1c2luZyB0
aGUgUFNDSSAoUG93ZXIgU3RhdGUgQ29vcmRpbmF0aW9uDQo+ID4gKyAgSW50ZXJmYWNlKSBmb3Ig
Q1BVIHBvd2VyIG1hbmFnZW1lbnQgb3BlcmF0aW9ucy4gVGhpcyBhbGxvd3Mgc2luZ2xlDQo+ID4g
KyAgQ29ydGV4LUEgY29yZSBvciBtdWx0aXBsZSBDb3J0ZXgtQSBjb3JlcyB0byBiZSBjb250cm9s
bGVkIGJ5IExpbnV4IGFzDQo+ID4gKyAgYSByZW1vdGUgcHJvY2Vzc29yLCBlbmFibGluZyB0aGVt
IHRvIHJ1biBSVE9TIG9yIGJhcmUtbWV0YWwgYXBwbGljYXRpb25zLg0KPg0KPiBEZXNjcmliZSB0
aGUgaGFyZHdhcmUsIG5vdCB0aGUgYmluZGluZy4NCg0KV2lsbCBmaXguIFVwZGF0ZWQgdG8gZGVz
Y3JpYmUgdGhlIGhhcmR3YXJlOg0KDQogIE5YUCBpLk1YIFNvQ3MgaW50ZWdyYXRlIG11bHRpcGxl
IENvcnRleC1BIGNvcmVzLiBPbiBjZXJ0YWluIGkuTVgNCiAgcGxhdGZvcm1zLCBvbmUgb3IgbW9y
ZSBvZiB0aGVzZSBjb3JlcyBjYW4gYmUgb2ZmbG9hZGVkIHRvIHJ1biBSVE9TDQogIG9yIGJhcmUt
bWV0YWwgZmlybXdhcmUgYXMgYSByZW1vdGUgcHJvY2Vzc29yLCB3aGlsZSB0aGUgcmVtYWluaW5n
DQogIGNvcmVzIHJ1biBMaW51eC4gVGhlIGNvcmVzIGFyZSBwb3dlcmVkIG9uIGFuZCBvZmYgdmlh
IFBTQ0kgKFBvd2VyDQogIFN0YXRlIENvb3JkaW5hdGlvbiBJbnRlcmZhY2UpIENQVV9PTi9DUFVf
T0ZGIGNhbGxzIHRvIHRoZSBmaXJtd2FyZS4NCg0KPiA+ICsgIGNvbXBhdGlibGU6DQo+ID4gKyAg
ICBjb25zdDogZnNsLGlteC1ycHJvYy1wc2NpDQo+DQo+IFdoeSBpc24ndCB0aGUgY29tcGF0aWJs
ZSBzcGVjaWZpYz8NCg0KV2lsbCBmaXguIFVwZGF0ZWQgdG8gdXNlIGEgU29DLXNwZWNpZmljIGNv
bXBhdGlibGUgd2l0aCBhIGdlbmVyaWMNCmZhbGxiYWNrOg0KDQogIGNvbXBhdGlibGU6DQogICAg
LSBpdGVtczoNCiAgICAgIC0gZW51bToNCiAgICAgICAgICAtIGZzbCxpbXg5My1jYTUzLXJwcm9j
LQ0KICAgICAgLSBjb25zdDogZnNsLGlteC1ycHJvYy1wc2NpDQoNCj4gPiArICBmc2wsY3B1cy1t
YXNrOg0KPiA+ICsgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWlu
dDMyDQo+ID4gKyAgICBkZXNjcmlwdGlvbjoNCj4gPiArICAgICAgQml0bWFzayBpbmRpY2F0aW5n
IHdoaWNoIENQVSBjb3JlcyBhcmUgYXNzaWduZWQgdG8gdGhpcyByZW1vdGUNCj4gPiArICAgICAg
cHJvY2Vzc29yIGluc3RhbmNlLiBFYWNoIGJpdCByZXByZXNlbnRzIGEgQ1BVIGNvcmUsIHdoZXJl
IGJpdCBODQo+ID4gKyAgICAgIGNvcnJlc3BvbmRzIHRvIENQVSBOLiBGb3IgZXhhbXBsZSwgMHgy
ICgwYjEwKSBhc3NpZ25zIENQVSBjb3JlIDEsDQo+ID4gKyAgICAgIHdoaWxlIDB4NiAoMGIxMTAp
IGFzc2lnbnMgQ1BVIGNvcmVzIDEgYW5kIDIuDQo+DQo+IFNvIHlvdSBwYXJ0aXRpb24gZXhpc3Rp
bmcgQ29ydGV4LUEgY29yZXM/IE9yIGhvdyBleGFjdGx5PyBXaHkgaXNuJ3QgdGhpcw0KPiBkZWR1
Y2libGUgZnJvbSB0aGUgY29tcGF0aWJsZSAoSSBhc3N1bWUgeW91IHJlYWQgY2FyZWZ1bGx5IHdy
aXRpbmcNCj4gYmluZGluZ3MpPw0KDQpZZXMsIHdlIHBhcnRpdGlvbiBleGlzdGluZyBDb3J0ZXgt
QSBjb3Jlcy4gT24gaS5NWDkzIGZvciBleGFtcGxlLA0KdGhlcmUgYXJlIDIgQ29ydGV4LUE1NSBj
b3Jlcy4gQ29yZSAwIHJ1bnMgTGludXggYXMgdGhlIHByaW1hcnkgT1MsDQp3aGlsZSBjb3JlIDEg
KG9yIGFueSBzdWJzZXQgb2YgdGhlIHJlbWFpbmluZyBjb3JlcyBvbiBTb0NzIHdpdGggbW9yZQ0K
Y29yZXMsIGUuZy4gNHggQTU1KSBjYW4gYmUgYXNzaWduZWQgdG8gYSByZW1vdGVwcm9jIGluc3Rh
bmNlIHRvIHJ1bg0KUlRPUyBvciBiYXJlLW1ldGFsIGZpcm13YXJlLg0KDQpUaGUgcmVhc29uIGZz
bCxjcHVzLW1hc2sgY2Fubm90IGJlIGRlZHVjZWQgZnJvbSB0aGUgY29tcGF0aWJsZSBpcw0KdGhh
dCB0aGUgYXNzaWdubWVudCBpcyBmbGV4aWJsZSBhbmQgYm9hcmQvdXNlLWNhc2Ugc3BlY2lmaWMu
IE9uIGENCjQtY29yZSBTb0MsIHRoZSB1c2VyIG1heSBhc3NpZ24gY29yZSAxIG9ubHksIGNvcmVz
IDErMiwgY29yZXMgMiszLA0Kb3IgYWxsIG5vbi1wcmltYXJ5IGNvcmVzIHRvIG9uZSBvciBtb3Jl
IHJlbW90ZXByb2MgaW5zdGFuY2VzLiBUaGlzDQpydW50aW1lIGZsZXhpYmlsaXR5IGNhbm5vdCBi
ZSBlbmNvZGVkIGluIHRoZSBjb21wYXRpYmxlIHN0cmluZy4NCg0KV2UgY29uc2lkZXJlZCB1c2lu
ZyBhIGBjcHVzYCBwaGFuZGxlIGxpc3QgaW5zdGVhZCwgYnV0IHRoZSBDUFUgbm9kZXMNCmluIHRo
ZSBEVCBhcmUgYWxyZWFkeSBjbGFpbWVkIGJ5IHRoZSBMaW51eCBDUFUgdG9wb2xvZ3kgYW5kIGRv
IG5vdA0KbmF0dXJhbGx5IHJlcHJlc2VudCAicmVtb3RlIHByb2Nlc3NvciIgYXNzaWdubWVudHMu
IFRoZSBiaXRtYXNrDQphcHByb2FjaCBkaXJlY3RseSBtYXBzIHRvIHRoZSBQU0NJIENQVV9PTi9D
UFVfT0ZGIE1QSURSLWJhc2VkDQppbnRlcmZhY2UgdXNlZCBieSB0aGUgZmlybXdhcmUuDQoNCj4g
PiArICAgICAgICByZW1vdGVwcm9jLWNhNTUtMSB7DQo+DQo+IEltcGxlbWVudCBwcmV2aW91cyBj
b21tZW50cy4NCg0KV2lsbCBmaXggdGhlIGV4YW1wbGUgbm9kZSBuYW1lIHRvIGZvbGxvdyBEVCBu
YW1pbmcgY29udmVudGlvbnMuDQoNCkJlc3QgcmVnYXJkcywNCkppYWZlaQ0K
