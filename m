Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2110.outbound.protection.partner.outlook.cn [139.219.146.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107902773E5;
	Mon, 27 Apr 2026 06:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777271102; cv=fail; b=QJdHzr+1PmXmhQtNHSfuVCuZcgIoL/xZH6Y3gg5SCx24A4baJJwDcCVXJbCKMq5+nx5WO3/BaVu3HSc+pgZEbVHT/sFvkBj5iicvVtANGAzJiCi08kvjXbV91iBrhKj5hnvcRiRd8uwUDyyTgxf2WYPaKTHYVNZ+KGEoJV/5bqU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777271102; c=relaxed/simple;
	bh=v5177G2ye4s0jOEwm11+j1M1RcA46ozCULi1PUR8YUU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qmL3vuQgR/ysd42XDQ5JnF7hXy0MWxZntjMF0PtuHIgQrUJjq83gxnHz73EkYskHmRuD5MG9+wAfHzrq+oXjGnqwg+Srv1u4IAhMFMsY6NX1p22Qk329aFMaImLF2cD7MpWYDvWw0CgO+5SmnTq5e5WWNCNcm8/EIWqVPwG1Vy8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KESoyE7EZv5AUTUEz5ujx87pY1kVqsev+I9jN5yeP/5AHmcmXkDEm0CtTnNtZfCoEsyUWsscAKIWLtvLpH8a9I+394oO6j8Ll+H187nKXiYbsM3F/MPoR9F6vNxgz2PZySVN5Qdf+f5tmop/22y9RxY8EOj4nnd0XBUn5yt0SWOOHrC8fr/n1ZdKONHKcnC7JBk2VhAVGORP0imYUcbzIWfmV0Ss2tTCymPPu2kRIoJFjKBHcerB/VyLiJZPDlJOwmS/vRIUWQsjIzRUL4fkY5jN2vnqExLJrS7AdrqEf8ZMuTluEYyqtTrtUsXjYiZg01E/Nf3sUZs28W8qsKpubA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v5177G2ye4s0jOEwm11+j1M1RcA46ozCULi1PUR8YUU=;
 b=auKESfVxaEUfxxW1h1CYAF8+oDmSBwi6yGSfe9iMkEN2RwrSokODqtqCvbAPlce+qtFpNsjMCU187eYumj2w2CXhoTXAQn+TOiwA3jybNf8WCKMKtJMQBXTM78wJHArK0HYzMABaPW2dqQnI4JMEaF/wrIHk6XSqNbIh3CZNnDJzZtNQ8IAr60NsxkAWfNZ/QUeZ5WNgyORKf4vBtREH3qzkoppTbSr3sBOhb9uD7Fe4r5qTLIZRAYf56SJcvCu/UDg80gCm2GZJkfxbc4MIHSCSQd3aC2cWoWto2nTEFKBRes/rP2LKUJMd48Y2qT4X2yQmhrtCbBu5buBbQKaPgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:8::10) by NTZPR01MB1097.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:a::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 27 Apr
 2026 06:24:48 +0000
Received: from NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
 ([fe80::d8e2:3f39:6ae7:bdf2]) by
 NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn ([fe80::d8e2:3f39:6ae7:bdf2%6])
 with mapi id 15.20.9846.025; Mon, 27 Apr 2026 06:24:48 +0000
From: Xingyu Wu <xingyu.wu@starfivetech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Bjorn Andersson <andersson@kernel.org>, Baolin Wang
	<baolin.wang@linux.alibaba.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Mason Huo
	<mason.huo@starfivetech.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>
Subject: RE: [PATCH v1 1/2] dt-bindings: hwlock: Add the support of HWspinlock
 for StarFive JHB100
Thread-Topic: [PATCH v1 1/2] dt-bindings: hwlock: Add the support of
 HWspinlock for StarFive JHB100
Thread-Index: AQHc05lR5+eLrDl5rUSuAiEMyjSTWLXvkc0AgALhxuA=
Date: Mon, 27 Apr 2026 06:24:48 +0000
Message-ID:
 <NTZPR01MB095606CF0DA4E6DBA49267259F362@NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn>
References: <20260424032026.62301-1-xingyu.wu@starfivetech.com>
 <20260424032026.62301-2-xingyu.wu@starfivetech.com>
 <20260425-didactic-junglefowl-of-science-096e34@quoll>
In-Reply-To: <20260425-didactic-junglefowl-of-science-096e34@quoll>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: NTZPR01MB0956:EE_|NTZPR01MB1097:EE_
x-ms-office365-filtering-correlation-id: e7f07352-5eda-4b87-0ec3-08dea425ae77
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 vNvwceBliOuj/zdhI6FNv/5C3jl2qwysOyR6IoxIEG9R8Kq5Xdf8c5f8cPZX91s/D6J+KYa/uTsVaiyd6ZkqtQuqOMuVAavMpJtTbLINbOm93mNjzPwbFm1McLPQ6DUb3vb08GY3D9xL230s4nvY2uCPQGKsjRHGY5X0huJpwIc6bENBVntvs+KA+XP5Wal7HmQmFLtdO+BRf7jq5cojI4k8y6Pz+m7g8UZstnEam/kn8ZyeH5afioZrcqTI7TXah82JNkwTAkk79DoAXArV7qcYQHqHA+Ds8X/XzLNoEZJx4r2d16OE/E1dWJznj6dJvAIx7oGKj4zdTtj0PzAGGLAKfBVXwnuQdiZfV7phigGm1KVkBbgBPTxY6uHZkbrUMz82zpyaTpYfjYysL1+MLSsPvm7UpeG8LBk5AArhmXqjT4B/+2ROS3sbMMjahW1Egq0oRkbxHYv/tz+TUNKo/Gamp5youB4Qnart7g6MtnMOXuJFwe0OzFcz+dr0oiGow9WQtag7687BZaUXsPuwRXW78erfnn839E7zUVBNQo/6BkVYIp5FY+dYuZMQY2ktn9bDdyCp03tFt2iyVjsZKmV6slNNqBhybWvDWiFfwfg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Q0YzMkNTL21LblBpbEp3bm94c2h0L3hXdHlGNkFSQzkrcnlNODZiWFJkTnMv?=
 =?utf-8?B?eTZoNEZndlRZa0F3STMyV3BpQjB1N2VNdmw5STVuaElqdUtUNFBTZkxEaTYy?=
 =?utf-8?B?STNSaVc2U0l2R1gxcWRrNit0UDQvSExIbGtXVjlyR3dkSFMyeXBWaUJkWnZp?=
 =?utf-8?B?eXhIUFdTcXlzelVJZjJPMGxORHduTCtGSzYrbDkzT2Rra1VoTVFCYUhmcGF0?=
 =?utf-8?B?L2V5VUlTY3RCMXdCdFBUNzZGclp4bVMrNDdzR1locGUyTFg1QkJjZ2xKaHBy?=
 =?utf-8?B?SEZZbzF1SXA1UTZrc0ltbHpIVFVqTVZCMmErclhkdzJxOE1WNHFMTkpxTjRs?=
 =?utf-8?B?L0Jzb1lLd3FVa3FHVnhOM3pzcEg5ZmdUNlFKdWlXSWFXT1NuSkZrNlo3ckJj?=
 =?utf-8?B?NVBrMHpPemw1dEl5Qkp5eGFQNklLNTJUQVFTbVUxbmQ0NU9zSHVYelpoMStv?=
 =?utf-8?B?QmllNk5jdE1YS3R4WjNQd05QbmJucnViK1J4eUF5U2xTc3FoaHB4QkRWRmNH?=
 =?utf-8?B?N0pUL1o1ZElRNmgrM3J5SnNyVngyN2gzZ1pjc3kzMmtIZUdvQXpDRHcvcEEv?=
 =?utf-8?B?T0thZlpEb1dpQnpPTzB0WkFyWVJoMXpkMWgxbVByTktLQ2ZDellpUnFHcXR1?=
 =?utf-8?B?Q29IQzBiSUE5VG5IdEEwNG1tcDNOMDh2RDYvSmxIc0NRbzhoVHJlTUNRRTVY?=
 =?utf-8?B?YzU3L1BLZnNYNFY5QllSZC83dEVvNHdZMFV4OTFUNG5VZkM5U0svTnJ6djRv?=
 =?utf-8?B?VTdFTHZhY1VmektwekxWSEtLSTBjSU1RemxYUTlyenRJOVFEMjVVNEZCeDdz?=
 =?utf-8?B?YXJsK1FlS05hb0xuUDBvK0dnMnFMcnNFNHVwM0x4bUpYVVJIWWtSaTdHVHdk?=
 =?utf-8?B?U01NTnQ4UFM0aUp0VExBT1hRUkpuQWVpSW5PeW55T3pGZVBrZWhuem83VHlF?=
 =?utf-8?B?SUxOYWpZaUxVZ0M5bWRKZUZmdzMyaEpiR0dyN2FVV0xMRWMwc1BIRUl4ZGw0?=
 =?utf-8?B?aWIvTThVRnMwREtxd0ZsUEJ1T00zMG5seFNhZCtLczVvV3drak1CbWN6TkE5?=
 =?utf-8?B?d3JzZ256MzFoNmVDMmJHK1hKcDA3VW1QcXBUN0RiQ2xTSnRLZzBYRUxWditi?=
 =?utf-8?B?TGlmK1g1ZFJ3bGRIN0praU5pSS9CbXZBaTJtWlJkNVpkVGxONGxPVmJoaWxI?=
 =?utf-8?B?RTlHWWt5dDM2TE9LU3VrR3RYcnJWNW1semhrTjh0bEVsblhNZjZXN3F1ZXh3?=
 =?utf-8?B?L2h0WS9GTU1IdHNFKzhqQWU2MmVoaU1TZEowc09xWWZJaWQ3NTkxejZzQ2Vj?=
 =?utf-8?B?SjV3UEFhL1hSejBnYmtHdWgrL0dPSmlkaVQ3UWR2ZHphRy9mWDFqalNYeVdJ?=
 =?utf-8?B?bXhQUUxIbjM2NEYzcG9UYXlGVm5wRXJPcHZFMXBqSkF5eFRHTkFINEdPZXFY?=
 =?utf-8?B?QmZJbUN1UW1ZUUhxc1AyNWo3WHNtVXEvZm5hRVhXK2ZZV0lEc1lUVFNQUE1I?=
 =?utf-8?B?K2hZSDR5VWs4YmRWWldkZnFyZGRyZXZBZnR4SjlkQVVjaWh3TVRPR2ZyNVZH?=
 =?utf-8?B?UDcrNlF6VDllRUFZTHpTY1ZBNExHakRMbEQ3M2xZL1RJQzVXalc2MDVrUEVT?=
 =?utf-8?B?WDNZaG5pZG8wU2J1STNZZ00yY2dnVmwybkZpNnpIWklqSkE4bW1YWXFkNEFE?=
 =?utf-8?B?TEhCMlhsdVV1Z3VoblV5cW5LQmxrWmhUQk0xNUNhYkh4b0R4cWhUY2RBaWNx?=
 =?utf-8?B?VWFIWDlxR3Q3V1RNZWpobzJBT1FFUXlqaGtBNUdzd2E3aDVQRldNSDVyeUJt?=
 =?utf-8?B?TjVDS05Ua2JHam84cUU1bHRrWUhubVF1Q1BoM0V4clRja04xNTk3RzNMcHVL?=
 =?utf-8?B?RkhsN2t0MkdhVy9uSlBVQUV4eDVDUnJ0SnhxWFd5L1BQNlYrK2JneVYzN3NO?=
 =?utf-8?B?bk1MMXJ2ekdCZzc3Q0ovRmtCLytUTHVyTWN5Z0lFem5wYVVwNlVDZkdWSUNq?=
 =?utf-8?B?ajBwM0p6UjZaWThUVzRRNzkxYXhXNkxHU1VMUDQvaDlWUWd3M2FhNk1qQk8r?=
 =?utf-8?B?cGFNV011aGlnV1BWU3Vkc3Y4NC9XUkZLUU1RNFN1UzNGT1Fqb2IrN1M5bFVs?=
 =?utf-8?B?clBPT204SG9kS2owWHpXV0phcllJWitYVzZNYlkrTTFYUmljdmYzRHhZTDVK?=
 =?utf-8?B?MlZ1aTkwcFF5STdrVWdBcWxxcm11K1puQjB0eTlSSEdtNGNCVG9KU0FmMjAv?=
 =?utf-8?B?Ulo3QUxGa2hzWXBXQlRjaFdqTEZTUW5mL1JOWGpCc29KbWNVMTFTWm8yMUoy?=
 =?utf-8?B?WlVtTkt6MGRiZ0ZiNUcvVk1TK1RZeVRFQnphNUkvRzRrL2ZHeENhQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: e7f07352-5eda-4b87-0ec3-08dea425ae77
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2026 06:24:48.0749
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0lh6PILp7jeG/ajABBKlPPP+6i9/1qNF1ymAzOgBKzWdpJ3LdJCLK/X798p48RsXb3sX1pd11XPvWPBMRLrButLN64KdizNFGYWUG4H/fIo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NTZPR01MB1097

T24gMjAyNi80LzI1IDE4OjE2LCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOg0KPiBPbiBGcmks
IEFwciAyNCwgMjAyNiBhdCAxMToyMDoyNUFNICswODAwLCBYaW5neXUgV3Ugd3JvdGU6DQo+ID4g
QWRkIHRoZSBuZXcgZG9jdW1lbnRhdGlvbiBvZiBoYXJkd2FyZSBzcGlubG9jayBmb3IgdGhlIFN0
YXJGaXZlIEpIQjEwMCBTb0MuDQo+IA0KPiBTaW1wbGlmeSB0aGUgc3ViamVjdC4gWW91IGNhbm5v
dCBhZGQgaGVyZSBzdXBwb3J0IGZvciBhIGRldmljZSwgeW91IGp1c3QgYWRkIGENCj4gZGV2aWNl
IHNpbXBseS4NCj4gDQo+ICJBZGQgU3RhckZpdmUgSkhCMTAwIEhXIGxvY2siDQo+IA0KPiA+DQo+
ID4gU2lnbmVkLW9mZi1ieTogWGluZ3l1IFd1IDx4aW5neXUud3VAc3RhcmZpdmV0ZWNoLmNvbT4N
Cj4gPiAtLS0NCj4gPiAgLi4uL2h3bG9jay9zdGFyZml2ZSxqaGIxMDAtaHdzcGlubG9jay55YW1s
ICAgIHwgNDAgKysrKysrKysrKysrKysrKysrKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNDAgaW5z
ZXJ0aW9ucygrKQ0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQNCj4gPiBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvaHdsb2NrL3N0YXJmaXZlLGpoYjEwMC1od3NwaW5sb2NrLnlhDQo+
ID4gbWwNCj4gPg0KPiA+IGRpZmYgLS1naXQNCj4gPiBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9od2xvY2svc3RhcmZpdmUsamhiMTAwLWh3c3BpbmxvY2suDQo+ID4geWFtbA0K
PiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2h3bG9jay9zdGFyZml2ZSxq
aGIxMDAtaHdzcGlubG9jay4NCj4gPiB5YW1sDQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4g
PiBpbmRleCAwMDAwMDAwMDAwMDAuLmIxYjI3ZmFmZTliYw0KPiA+IC0tLSAvZGV2L251bGwNCj4g
PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaHdsb2NrL3N0YXJmaXZl
LGpoYjEwMC1od3NwaW5sDQo+ID4gKysrIG9jay55YW1sDQo+ID4gQEAgLTAsMCArMSw0MCBAQA0K
PiA+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNs
YXVzZSkgJVlBTUwgMS4yDQo+ID4gKy0tLQ0KPiA+ICskaWQ6DQo+ID4gK2h0dHA6Ly9kZXZpY2V0
cmVlLm9yZy9zY2hlbWFzL2h3bG9jay9zdGFyZml2ZSxqaGIxMDAtaHdzcGlubG9jay55YW1sIw0K
PiA+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFt
bCMNCj4gPiArDQo+ID4gK3RpdGxlOiBTdGFyRml2ZSBIYXJkd2FyZSBTcGlubG9jaw0KPiANCj4g
U3RhckZpdmUgSkhCMTAwPw0KDQpOb3RlZC4NCg0KPiANCj4gPiArDQo+ID4gK21haW50YWluZXJz
Og0KPiA+ICsgIC0gWGluZ3l1IFd1IDx4aW5neXUud3VAc3RhcmZpdmV0ZWNoLmNvbT4NCj4gPiAr
DQo+ID4gK3Byb3BlcnRpZXM6DQo+ID4gKyAgY29tcGF0aWJsZToNCj4gPiArICAgIGNvbnN0OiBz
dGFyZml2ZSxqaGIxMDAtaHdzcGlubG9jaw0KPiA+ICsNCj4gPiArICByZWc6DQo+ID4gKyAgICBt
YXhJdGVtczogMQ0KPiA+ICsNCj4gPiArICByZXNldHM6DQo+ID4gKyAgICBtYXhJdGVtczogMQ0K
PiA+ICsNCj4gPiArICAiI2h3bG9jay1jZWxscyI6DQo+ID4gKyAgICBjb25zdDogMQ0KPiA+ICsN
Cj4gPiArcmVxdWlyZWQ6DQo+ID4gKyAgLSBjb21wYXRpYmxlDQo+ID4gKyAgLSByZWcNCj4gPiAr
ICAtIHJlc2V0cw0KPiA+ICsgIC0gIiNod2xvY2stY2VsbHMiDQo+ID4gKw0KPiA+ICthZGRpdGlv
bmFsUHJvcGVydGllczogZmFsc2UNCj4gPiArDQo+ID4gK2V4YW1wbGVzOg0KPiA+ICsgIC0gfA0K
PiA+ICsgICAgaHdzcGlubG9ja0AxMzAxMjAwMCB7DQo+IA0KPiBuYW1lOiBod2xvY2sNCg0KTm90
ZWQuDQoNCkJlc3QgcmVnYXJkcywNClhpbmd5dSBXdQ0K
