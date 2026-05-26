Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011069.outbound.protection.outlook.com [40.107.130.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01123274B4A;
	Tue, 26 May 2026 00:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779756185; cv=fail; b=HPyWv8U1m/4IyKoMC5+os6Q9nifXsWsKep50s4o8rF3Ro9Ec/06Q9WPCT3GdqONEV/xEySTkO2+LM+J5aI6+1Xz/3UAtlyYDbQu7b2Njc4D3c2oqQmoiiamWwTsMWrhceTD/53wOduTP57xcrI6eoegicys7bkoW9Ut0pbPHnKk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779756185; c=relaxed/simple;
	bh=gH/RctJtdkYSX0SWedJe1RlW/VK1yn2IQpQEB6I/Dxw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QyJj+95+BXH/IJ+dJE6tfXd1Ad51g5p8Ell/JD6pcLDJ+mv39j+khUY9oTe47eWNASinJyOSOMr1hn8pDdK30XnlOipBmFwFCoMOLfEiDwZNkLqE9U5sFTIOJt59OpsNfTyr48RVLIjw2DywfDe5g7YyL9ltdF2W0c4r4VP2s6Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=iBjMiCMp; arc=fail smtp.client-ip=40.107.130.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="iBjMiCMp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X7gKu0YuJSraVfCSTsqJ/lSquHi1qZf0PzwGEwSuHdMKDQhw6aD96B7tc/cGAvBsgiaY3plo1UCqJIEkzvFUtMXxCiCfCpC2KRfwGMnsMpMjpb4dplym5LWqtTRoDOvm/1My2dikWen72695a7GHmphW89LoeZFR+e/8ipbJiZ8dbiQfKSoQHhY1R5Cuod4FxKEE7Sgd2weennwIainr3DJWlnnV7DDzrthmYvwWNRY0kccoGUdZCUTiRx03Xim04zudo4TtBUBmccfYjYYfIXr8Oca3Fuiz+GsPVXHM9hfWFs+wO5xNl4GZZp43zLCjzzrFOu/FcOT+sHSgAimk3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gH/RctJtdkYSX0SWedJe1RlW/VK1yn2IQpQEB6I/Dxw=;
 b=ZlJLGO+tePhVU0Z9x+GyTNd+bKP6zx6E8g92lDb6ISGa8CvnmTZqsFxvC9zOUY5E3y4HkC8BJv0DQODMQ/mvH8uQg2En/66TgyYVZ+Qev+BkiavUupNwC/2+GsuGI5JTSzGrQXCsODXs3b+xLLfzWHQWM1/pL4kmkm/6jy97HR4zwdl02vxjqjvmWVjxcxHE51qFthaZbNTbq68uSCzzQahYRuASzDzyKGdNcJJxyW2aqeJqIaH30epen8hx1PrO7hfNFqbmVnee2GoE7eLB5z3yYZghSx5WRKLKjl+dB+j4rvzw0JNfd1WAYXHqIadU1D27vGCMgyWPgTn3INFEVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gH/RctJtdkYSX0SWedJe1RlW/VK1yn2IQpQEB6I/Dxw=;
 b=iBjMiCMpt7uBM+54q8pt5FMaBM1MTYKkf7h8I4KgrP5JtsEfMc19EWOFkF9evDj6r7zXk1XdWBDaUqWwJTEZffPSgnKCw7rWjs5+d5NASBs06omBaMbCrp3V/KvPG7LZ0iweoIUeoUPIgQZ+74FTW95YM+G2NYRjeWMxUSWN0W2YU97isUgNkS0aHjiLK4cxujhz511a+DDzFNl/BfQES70RGkxs5Y1ukEJSqnHUKWXjMQmGxYW3RuzfwbJEMRhF2iq09VTsbssc/GqYUQvjexW/qbdVDweBbjWp6jIxC7EPmo7BGYgish3+C+FQhhSCn7p4i81queZiXB59+jCTZw==
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com (2603:10a6:501:7f::23)
 by GV2PR04MB11688.eurprd04.prod.outlook.com (2603:10a6:150:2ca::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 00:42:59 +0000
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889]) by MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889%6]) with mapi id 15.21.0048.016; Tue, 26 May 2026
 00:42:59 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>, "Peng Fan (OSS)"
	<peng.fan@oss.nxp.com>
CC: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li
	<frank.li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 2/5] remoteproc: imx_rpoc: fix carveout name parsing
Thread-Topic: [PATCH 2/5] remoteproc: imx_rpoc: fix carveout name parsing
Thread-Index: AQHc6d0D7AvuRNwNBEKp4jwjIPn457YeBFyAgACstgCAAMxLcA==
Date: Tue, 26 May 2026 00:42:58 +0000
Message-ID:
 <MRWPR04MB123307BD250F317565A0A94EE880B2@MRWPR04MB12330.eurprd04.prod.outlook.com>
References: <20260522111849.783-1-laurentiumihalcea111@gmail.com>
 <20260522111849.783-3-laurentiumihalcea111@gmail.com>
 <ahOwO7LBXCYFIngw@shlinux89> <9fb59c65-8cee-4502-bc10-1375f276e25c@gmail.com>
In-Reply-To: <9fb59c65-8cee-4502-bc10-1375f276e25c@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRWPR04MB12330:EE_|GV2PR04MB11688:EE_
x-ms-office365-filtering-correlation-id: 577e6f40-69d2-491b-7bca-08debabfbc08
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|19092799006|11063799006|56012099003|18002099003|22082099003|4143699003|38070700021;
x-microsoft-antispam-message-info:
 /6QR/jj36rCsZNe5moNdO1TLHjzQAGSblOQXhb4iVaPvbqqUjAD4FoQs7V/vX0WG4nPOQsYaAKkUflN/iFmcITDsTSGO2JLGL5w5g5RgmJaX4LUm4LjMqszO5Kk8NOwdnIRWFjj2AGihC24925yIJhvPg9Ify8vw2fdRliTO4sc5kehLQndkT8H3P8/Ssh2g/HE4/SwG9PwkOeGLqGjHQ6lPvyLvstRPLMIfNY0z9Jm3w1548KkX6k2jwxw9WJYp7iHzg00ACuN2tpMfCYvIKJhVXVHcdsUjMGBBOQMr3Z06qRBb7xf7TjMX10gnx4OzCkBeufR774hQXYvxoKALJ5eUk58h0aTXfEKlxIV8ixt5nQEWfMLoFMF3VpUddsOhYcErarycdTTNp1EwlMuXzRQtBCLmJ/3O5bDzxxCxNp+iwLn8DrEMcfyvARS3gGQe6WLnbAmjVr9HqKUqtp3i1/y9eR3Woh+V2Rh89dikjRt6jbgcxyg/ybd2L6ofGtozxLIJYMMY0ey+zNV0OpA+kTTQlN+HwF06paKDGYPzXrdvOhPPYIfX2+lZjsah/1by6PDRxeyyiJFZAvZG7334OZTndMWpwPBLDliNNEnBf2UUbT2FbuIL7/TgqPIm6IftFTDmiU9N+9LtJ+Or/HITFOkmuqtLUYDxyPfXSpmDWOIt9xgcCBCvcYoHqqnXUr8pvGbIcx4F78CrG1nNZJYgh0u9R2C/AgJeGa9+shAKjzc9ppieaL208WErvqHwv+Fp
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWPR04MB12330.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(19092799006)(11063799006)(56012099003)(18002099003)(22082099003)(4143699003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?STJVVTJjSTYvbzZIemRPVVdQWkdISFlFL1RlUUFnbFFYSUJzVGRCSVNKaDA1?=
 =?utf-8?B?alpxZURqaGFMdEo0dU5VdndKZFdtOGNuYlZURWtPeW1FOWpNUWtVNC9BbVQ2?=
 =?utf-8?B?c2swNjYrNFhiMUN3bVkydXVvbnY4M0VhZmFkVDh0SlI5di9ERWhqZnE1Tlhl?=
 =?utf-8?B?ZFVpaXJ0b1REQkJrS2pWTjJ5cXpYZkUxbGxoMERPdUdCOW1MQy9wdHJ2dk14?=
 =?utf-8?B?ajRoSU80LytyWDJ5SFNvWVg2YThEVlVSam5GZ1ZYZjJyaStHYmN3NFdqTjk0?=
 =?utf-8?B?eUVpNE4vWDY1L0M3TUYxWU1NaXcya212eUVkRHBPM0pkRTE0UDFCQ1h5NVJk?=
 =?utf-8?B?WkprU0lqckZQeEJpV3Q2bGFLMDRaM3JsSnh6Si9kdGZRQzRHVUdOWkxxVUZp?=
 =?utf-8?B?cXBxZ1lTVzVlRkVGYm95NEQ3T2tSS2JzVEV3YlQxVUZ5SG55eWgwZ3hRckFW?=
 =?utf-8?B?Rk95ajBjVlUwaDhWd2R5NzYvOTBoek43OU9YZHJSS0tCd3kybUpKb2t5YVFS?=
 =?utf-8?B?T0p0VHB6QkVsUkZUUWZ0U1lsNEpCRWQ1RTJPbXJTelQzajFiQWFWR0pIa2FT?=
 =?utf-8?B?dXZkYkNVa1pKTk41bHByWHlIRzlCWVZYOFpvSEVMencrbkpJTlB1dEtnNjlu?=
 =?utf-8?B?L2dhbzRqNWh0aFM0eE1rTm5qWVY3azNFb2RaYldoaFQydVpFQ0ZEYUk2RkZK?=
 =?utf-8?B?bE5uOVZUOW9uWHUxazJVWUFCY3NxSFlQM2U2N25yaHJSVm5wUk9jV0ZhSXVP?=
 =?utf-8?B?dWJ2cTUyanBHUmFxL2xhMGhRakhEQVhMMTNEZjA3dkRlN1dUOU5zZFZNcDAx?=
 =?utf-8?B?VTRpb002bHQ4L3JtNEZxY1VnSFFkekZwc1dET1FCRTF2SUcxc1Fjc0FsMUR1?=
 =?utf-8?B?M242dHk4MEhEQ1pJK1B6d2l1TEtqdm90YzZENGhYblhiOXdnOVZkekNWVjVl?=
 =?utf-8?B?ZisxMkswL0cvRStLeG1nM3hvZS9OR013SjA3K0Y1cGxSQTZXcjk1WXRoRVpr?=
 =?utf-8?B?Y043SlR0YkVlS0gwcFoxY2xtQzBDTWloRmJ4a1dNMm1TSmtUTXVYL3JoMTAy?=
 =?utf-8?B?NEx4NXFIQStMMnIra0JDZzBhclF4c3RhSTQxeVY5Qnp0Qng1d2d1dnFZYnJD?=
 =?utf-8?B?L3gvbXV6VXN4Tmp2bXJ4cXJVK1RQakxIcXNyZFhhWUpSZTRnV0ZwbE02ekU2?=
 =?utf-8?B?a3R6Q0hSeUI0dzRDaERMODJteWlpQ1UzVjB1TG9mMnNNeGU5ZWJ5WlIrYjRR?=
 =?utf-8?B?VnA3YlJaMVlYeXI1enRROEZ5Z0VtL3BtZEZ6R1pGMnZzVGFXTXlBbnk1ZmRu?=
 =?utf-8?B?MG5OZ2RGWThJa2EyamhSK3Q3cWMrbHRKbWpiVWt1MTRpcGRDdlZ4bXRIN3Zo?=
 =?utf-8?B?TWZvak1RNTdvQkZBSll3VFZ0b1M0Z3dlMG9pbzBoNXlqcms3U0Q5TlBjRG83?=
 =?utf-8?B?dTEvQ2xuZDlTTlB0OGFIQXFRU3h4aUJwcnNzTGY2bDhLZ2VENC8rYWRhWXFK?=
 =?utf-8?B?NEpkT0ZFZzl0V2M5R2xCYTMrWlpRVkhFYlBaU1Q0UG03Z3JWMGNlbHF0M0dP?=
 =?utf-8?B?Ym5MaUdhWW80WnQ4SmpBQ2pDT2J3SGQ4Um1KbWtXcks2QVBKWXk0SXhST0ds?=
 =?utf-8?B?Y3gxWUpNVDZLREJyQUh1Vi9MV29COWpJbVZ2VDU1Y2Y3Rlo5Sk10aGwrUGJI?=
 =?utf-8?B?V3NvYVFKSXVxbGhWTGw0UFJEQjlKb2diUWZvQm1uTjY5NHlNN1RnWVkzaUdW?=
 =?utf-8?B?WDI4RmNCOG1RRjg5QUFCRVM0b2MrMGpuS1JMUzZXNktCWEo1OWE4WTYrL21r?=
 =?utf-8?B?Nng1N1NUNUZyUkJHVGYzYzVmWXBQSVZLd085alEyQzRtUFpCOXIwWVhjdEI1?=
 =?utf-8?B?QnFXZDl5K0EwR1RKb3V0SXlLWjJBdWNCdWdTcGhzNHZlV2lZVTliVHJ0WW1Q?=
 =?utf-8?B?QTF6djMwY1BheENnS3JBaGJ5V0U0Q0xTTHhiS0tuUDd1ZnFOTDRjd2ZMM1dt?=
 =?utf-8?B?M0tRc2NIc2FEV3gxSzh1bmNkN1kzR1NQWExlVCtmeWNWK2VseUlDczVaSkhT?=
 =?utf-8?B?bWJpVTVDQVNnTTRJTkg2dEZCRDFoZktGaC9WUnVVQmtNRVNkOW1SYlFFT2Zn?=
 =?utf-8?B?ZkVaUjAwN1BxN0kvVVVyZkxGbXJkZ2xRRDBOTlNhZnBUQ2JkMmRMVGh3aDY0?=
 =?utf-8?B?YS9IUWxYK2tuYXY4SXdVVzlwSENGL28rWGZFSXBWaU5wdTJmT1BqSTdkdzZn?=
 =?utf-8?B?Sm8yNW1oOGZ5bWZxL2hlaU9CNmlHNjdYcDdRMlBsWDdKSVJzZllmMGNzSkNu?=
 =?utf-8?Q?FSE4kRLLmED3AOgPiA?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 577e6f40-69d2-491b-7bca-08debabfbc08
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2026 00:42:58.8824
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iTrU7wxnBfNZikvjznOrgMdp+UlSbAikJTbQR2MVaBQQXoiS/LepYY4U+fbfZx8dkKtxywp0orhllGBH9NPD5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11688

PiBTdWJqZWN0OiBSZTogW1BBVENIIDIvNV0gcmVtb3RlcHJvYzogaW14X3Jwb2M6IGZpeCBjYXJ2
ZW91dCBuYW1lDQo+IHBhcnNpbmcNCj4gDQo+IA0KPiANCj4gT24gNS8yNC8yMDI2IDc6MTMgUE0s
IFBlbmcgRmFuIHdyb3RlOg0KPiA+IE9uIEZyaSwgTWF5IDIyLCAyMDI2IGF0IDA0OjE4OjQ2QU0g
LTA3MDAsIExhdXJlbnRpdSBNaWhhbGNlYQ0KPiB3cm90ZToNCj4gPj4gRnJvbTogTGF1cmVudGl1
IE1paGFsY2VhIDxsYXVyZW50aXUubWloYWxjZWFAbnhwLmNvbT4NCj4gPj4NCj4gPj4gVGhlIGlt
eCByZW1vdGVwcm9jIGRyaXZlciBhc3N1bWVzIHRoYXQgdGhlIG5hbWVzIG9mIHRoZSByZXNlcnZl
ZA0KPiA+PiBtZW1vcnkgcmVnaW9ucyByZWZsZWN0IHRoZWlyIHVzYWdlIChlLmcuICJ2ZGV2YnVm
ZmVyIiwgInZkZXYwdnJpbmcwIiwNCj4gPj4gZXRjLikuIFRoaXMgY29uZmxpY3RzIHdpdGggdGhl
IGRldmljZXRyZWUgc3BlY2lmaWNhdGlvbidzDQo+ID4+IHJlY29tbWVuZGF0aW9uLCB3aGljaCBz
dGF0ZXMgdGhhdCB0aGUgbmFtZXMgb2YgdGhlIGRldmljZXRyZWUNCj4gbm9kZXMgc2hvdWxkIGJl
IGdlbmVyaWMuDQo+ID4+DQo+ID4+IFRoZXJlZm9yZSwgaW5zdGVhZCBvZiByZWx5aW5nIG9uIHRo
ZSBub2RlIG5hbWVzLCB1c2UgdGhlIG5hbWVzDQo+IHBhc3NlZA0KPiA+PiB2aWEgdGhlICJtZW1v
cnktcmVnaW9uLW5hbWVzIiBwcm9wZXJ0eSBpZiBwcmVzZW50LiBPdGhlcndpc2UsDQo+IGtlZXAN
Cj4gPj4gdGhlIG9sZCBiZWhhdmlvci4NCj4gPj4NCj4gPj4gVGhlIGRlZmluaXRpb24gb2YgaW14
X3Jwcm9jX3JtZW1fdG9fcmVzb3VyY2UoKSBpcyBhZGRlZCB0byBhDQo+IGNvbW1vbg0KPiA+PiBw
bGFjZSBhcyBpbXhfZHNwX3Jwcm9jLmMgY2FuIGFsc28gdXNlIGl0IGdpdmVuIHRoYXQgaXQgc3Vm
ZmVycyBmcm9tDQo+ID4+IHRoZSBzYW1lIGFmb3JlbWVudGlvbmVkIHByb2JsZW0uDQo+ID4+DQo+
ID4+IFNpZ25lZC1vZmYtYnk6IExhdXJlbnRpdSBNaWhhbGNlYSA8bGF1cmVudGl1Lm1paGFsY2Vh
QG54cC5jb20+DQo+ID4+IC0tLQ0KPiA+PiBkcml2ZXJzL3JlbW90ZXByb2MvaW14X3Jwcm9jLmMg
fCAgNyArKysrKy0tDQo+ID4+IGRyaXZlcnMvcmVtb3RlcHJvYy9pbXhfcnByb2MuaCB8IDE5ICsr
KysrKysrKysrKysrKysrKysNCj4gPj4gMiBmaWxlcyBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQ0KPiA+Pg0KPiA+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9yZW1vdGVw
cm9jL2lteF9ycHJvYy5jDQo+ID4+IGIvZHJpdmVycy9yZW1vdGVwcm9jL2lteF9ycHJvYy5jIGlu
ZGV4DQo+IDdmNTQzMjIyNDRhYy4uMWVlMWM2NThkY2MxDQo+ID4+IDEwMDY0NA0KPiA+PiAtLS0g
YS9kcml2ZXJzL3JlbW90ZXByb2MvaW14X3Jwcm9jLmMNCj4gPj4gKysrIGIvZHJpdmVycy9yZW1v
dGVwcm9jL2lteF9ycHJvYy5jDQo+ID4+IEBAIC02NzIsNyArNjcyLDcgQEAgc3RhdGljIGludCBp
bXhfcnByb2NfcHJlcGFyZShzdHJ1Y3QgcnByb2MNCj4gKnJwcm9jKQ0KPiA+PiAJCWludCBlcnI7
DQo+ID4+IAkJc3RydWN0IHJlc291cmNlIHJlczsNCj4gPj4NCj4gPj4gLQkJZXJyID0gb2ZfcmVz
ZXJ2ZWRfbWVtX3JlZ2lvbl90b19yZXNvdXJjZShucCwgaSsrLA0KPiAmcmVzKTsNCj4gPj4gKwkJ
ZXJyID0gaW14X3Jwcm9jX3JtZW1fdG9fcmVzb3VyY2UobnAsIGkrKywgJnJlcyk7DQo+ID4+IAkJ
aWYgKGVycikNCj4gPj4gCQkJYnJlYWs7DQo+ID4+DQo+ID4+IEBAIC04NTAsMTEgKzg1MCwxNCBA
QCBzdGF0aWMgaW50IGlteF9ycHJvY19hZGRyX2luaXQoc3RydWN0DQo+IGlteF9ycHJvYyAqcHJp
diwNCj4gPj4gCWlmIChucGggPD0gMCkNCj4gPj4gCQlyZXR1cm4gMDsNCj4gPj4NCj4gPj4gKwlp
ZiAoIW9mX3Byb3BlcnR5X3ByZXNlbnQobnAsICJtZW1vcnktcmVnaW9uLW5hbWVzIikpDQo+ID4+
ICsJCWRldl93YXJuKGRldiwgInVzaW5nIG5vZGUgbmFtZXMgZm9yIGNhcnZlb3V0cw0KPiBzaG91
bGQgYmUNCj4gPj4gK2F2b2lkZWRcbiIpOw0KPiA+DQo+ID4gUGxlYXNlIGNoZWNrICdtZW1vcnkt
cmVnaW9ucyAmJiAhbWVtb3J5LXJlZ2lvbi1uYW1lcycsIHNvbWUNCj4gZGVtb3MgbWF5DQo+ID4g
bm90IG5lZWQgdG8gdXNlIG1lbW9yeSByZWdpb25zLg0KPiA+DQo+ID4gUmVnYXJkcw0KPiA+IFBl
bmcNCj4gPg0KPiANCj4gV2hhdCBmb3I/IFlvdSdsbCBub3QgcmVhY2ggdGhpcyBjaGVjayB1bmxl
c3MgIm1lbW9yeS1yZWdpb25zIiBpcw0KPiBzcGVjaWZpZWQ/DQoNClNvcnJ5LCBpZ25vcmUgbXkg
bGFzdCBjb21tZW50Lg0KDQpUaGFua3MsDQpQZW5nLg0KDQo=
