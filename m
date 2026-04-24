Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012011.outbound.protection.outlook.com [52.101.66.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E11C34BA53;
	Fri, 24 Apr 2026 06:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777011481; cv=fail; b=NR+dx2NR3BQalkszunkMsEAYzmLnCBNefKnIqkSWQtMdT7e/o5mnR685/M1gbDpZhbpKv8yHwffS5E6w+pKIECAoR1V0/SlBgggeC+J3Stx6jHuXjcz6lu2Tl5fM/0Gf/OFiQyVHYo7URnApFfBtsON9WAKp/H4kl+G/WjaXDHI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777011481; c=relaxed/simple;
	bh=alL+hUyAA8CVFqDPoDSZLKNyvSeKhYA06+IaqdFocCk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bWOqJebUkIuztaJaLevpz5Bt3I8TAi4v4M0UNE3lzAOTj97AXXhgeYtCJz+2Cz4LaTNJ6vSKDyJ1jNGcIUTVCeR9VH5yV5yumF8KRXEymYVZQHboSQqIeYRNJNP/JidJ/hDo8WOn7Q18guk/+A105YEF5aC0n8hRS23MuPdY0E0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ZVSCws0e; arc=fail smtp.client-ip=52.101.66.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ZVSCws0e"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JX9MMaePSVzQ5Q2tEGTkNMYtMgwIul5O2Hl65ISGDvc+31Xc4P28pF8wRO1ZyDAxpaOAMAMeFoHA+LR7TA4NBqcDAWl4+K/CLXUYFBBVeYgOeHP2Ycx98anGo8xVYVeXK+hydfZ3ylNa8t1pjvBRsqw1ZK05mibkq5Tu0Eawchzw2lebBxKlSuDicJ/5hjrWR87BhUTmJqivyx9HFN8jfA+UTuzouP8A4qtXgBQtaajiljNG3EtHzBn1v5pZUSVU3qkyM0mbFQdYhn0Z3lNL2oCxDDGimjZ8O0/WyD+8I7htAYfb2VjDClTdRCDO/kF7kFYMugkRpyoNP8Rb5TJhLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=alL+hUyAA8CVFqDPoDSZLKNyvSeKhYA06+IaqdFocCk=;
 b=ZZeEgiUdcGf0abMxuMBo/K7eNVXgwcQIw2ImpeYgfyvdB0rRWiGz45VeJMNAJMrg5G+BqJks3XmXg4jlB1fgpotgKaQeZ0XtPrkd7PxIesAxkfg2bNX4iP4BqvxPDee1OkkO6dZFTy0zupZ0kt9btxkPSriLRBHZan5rf0oTsRK0bfv6+e/ZKWaLindYy94WoeFtOG/O/W4VgkdpYm3cjqNr3tP6P4PDaRvq0YgJhqiAg65PS4c8kOhg6fusEl6K7/dZ0/hKO55foddOAaLfg6hFInzhK5MoJmFV8TJAmNhbRaLn6ObRxemZV8EkzqHPsTjZFL9k8DY4qEz7mFqBBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=alL+hUyAA8CVFqDPoDSZLKNyvSeKhYA06+IaqdFocCk=;
 b=ZVSCws0eg5MkF/BMgSMn/JIXfJVqys3uaM/FwqoCySY3nwTZX8+E/wDAscHmedCcGEU4ZFTpadL/XxwLIy8zihXgICIlyiGniLcQ8RMAn/g6P0hAIKnsV3LiRN1OQqVSeJvLGs1GByRLNFuK1tyjbLNsWTbBh/Yf/5juxgWnz9ncek6gitFwUYItR8GMJX562Swkxj5GbBywmeOeI91RY7x4eAL3msqq+pCGVhws7gyw7QjGmi3OLkB0rRD953RQi3s2n/D2ywy4GPE9t8JN4Frr9MqIorBecyHLJP+70m4cn9CBDoBgytmj3QhujsjXpjjnZ0dIOc/H1GClLvN/HA==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GV4PR04MB11289.eurprd04.prod.outlook.com (2603:10a6:150:28f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 06:17:55 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%3]) with mapi id 15.20.9846.021; Fri, 24 Apr 2026
 06:17:54 +0000
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
Subject: RE: [PATCH v3 0/3] Add i.MX94 remoteproc support and reset vector
 handling improvements
Thread-Topic: [PATCH v3 0/3] Add i.MX94 remoteproc support and reset vector
 handling improvements
Thread-Index: AQHczKxE5lBZehqJIEuxbd2exx0dCLXs8NsAgADYWwA=
Date: Fri, 24 Apr 2026 06:17:54 +0000
Message-ID:
 <PAXPR04MB845952CD7B5BB52C672DAFEC882B2@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20260415-imx943-rproc-v3-0-9fa7528db8ca@nxp.com>
 <aepUOjXBOWK-0wt9@p14s>
In-Reply-To: <aepUOjXBOWK-0wt9@p14s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|GV4PR04MB11289:EE_
x-ms-office365-filtering-correlation-id: 83806825-5987-4257-eb45-08dea1c938f0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|19092799006|366016|376014|7416014|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info:
 XXoW9kpzUClUZkM3J9Kjf2XY/4yaWaKD1GuwN8N5S6VyFMhtvlza/3Br/SDjz2W2YwVCZn5uvkB7ZhfPp0V229orMEUONfT55hPBxcmKWs9kQS6GUJnx5DkTL9Z2oyNjdaAsBbgycYIx5202VaXZY9yE9l1R/oGK8G9ImYto0aa9sAnnVunUPRdIIdA+CqQ9AoxeKzDSc5rLu7Rz/JV0ea+5W0KJ/JZjZETJNwzSeopOt8gyFNo6lBfvEUmmih3QCiy0PqkLzYvqseEszsHh0gha1pydIW0zGmQfk9GSlz7tb7d4SfwwMvZcytyMOdCHjQxzIFnXTvSjm0NMi+Ihlnivf6bXuZY9fMudED0QF4xIBSX91WGICqeBOrX/twTggacdTh9CtGE/wCNklWLzX3rjA5CFuFw/KH+zXZEJxppZZRcFCkMgTT0Fz9ZYDed8k8N1HePuTvcCtSTxYP3jWO3G27Dryvm8ICVr+TxihoF0IN3MQTCTvkMDYbJhBAeA3/Z/C1hwby5gn1BNXHlCMTIcJ7hGYsrDBO/lLBz1zaw05b0/J5LST7xb5AxiTibGdujXrmKZho1sF8Ciyg3eYSgGY0nqzkZAPregcD459iL4AmOzyC4tx/q2o5YZipFoxrOeF6QA/J0m1nOlswwZCcZm5Jt09iYhqOfWELDu5dL6eIozh2QrDrR/zKPxet9xfDYt3tQv1YTWiD56TMwWRuy9EHlX13glOi+s6hFiNrz3T0Tz8VsdgJDBs4h391WjcOe1XQppB8nGMOFJ/3KZTMwZh2YrKpiFJfb1tfc1OLo=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(376014)(7416014)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?a2h1SHVNaFA2T1FGcWpsbXk3R1VsN3RkeERaUFhtbEdKNllBTmZDL0NyL3A1?=
 =?utf-8?B?VG84Yys1R0NHcW94TUJCZklmdDYzT0YyUWVVQVFMK1lVQUJ0d20rTUlsZTI1?=
 =?utf-8?B?S0dJbmVOYk1DNENpR1U5cDYyVmdGYmRlWlpVby9vdTNNRGZibnZKTUFpTTBm?=
 =?utf-8?B?cFVWcXRNWEtObE5CeTNZWm1VREZ3MzFlcWl2VlRXM0N3SDVVeWFuVGl2aE45?=
 =?utf-8?B?Ykg4LzVweU9XRHZtbkpYMjFmQStkY1JLcjdYcGM4am9VRFAwR2R0OXNDdGpx?=
 =?utf-8?B?d2c4cll2WFdNZmhTQzNaRHB0NHd4QVZ5ZHZZZGNuY3ZOamJNcFZaSENtQlVo?=
 =?utf-8?B?U2JGUHAvNUp1UlphTWNGNEM2YXYvS1JnUlo1WVRlM2NLbDFlWTJtTHdnT1Zk?=
 =?utf-8?B?clh2UnpHY1Y3T081Z3JNSTQ1bFBBdlM2QTdtVFFyZGpkMVRhbWs1OVpwWFRx?=
 =?utf-8?B?T2Q1azhuWTd4ZmQzdVI4NkJHVGYyakJOUWZsczFmdkhwb2NEMUZJVUcvcHRQ?=
 =?utf-8?B?b0V0ZXkyRDFrWkRUQTEzcldMdk5rWjFsWWkyNDRkMkN3M2NrSjRJLzlDQkRx?=
 =?utf-8?B?WjI4MnhrRXp0N3Y5ZXhkR056NGpYYTZPSW00am1FbWdEU3NwNFcvQURJMXhu?=
 =?utf-8?B?OXhBZVdlY1A2M2FJdFdFeUlVdTZLeXd2QkhLaVMvdGZIUTdLTUw0NG0vWnBw?=
 =?utf-8?B?Rml1K0NVUG5KSGpVbXRHOG5wMGVKZStPazJERlRZMlpIcjdybkgySE1JN012?=
 =?utf-8?B?SHZySHNHYkQreGk3WmFYbWN6RVhmenhUOWlUOGNoUEJRdzA3em9TTkJzTHRV?=
 =?utf-8?B?NmtOT2FLdHZ5QWU0TmN2cG9nakxSTk8reVRPSHlrMWw3NzQ2eVlzd0JGb0Fs?=
 =?utf-8?B?YWZDdm1FREQyTjlpa0RUS0l5Vkc4YWZFZllhalJ6cVFmSVJ0ZmZYWGQvMDhL?=
 =?utf-8?B?cTcvUkpuaVhIS0lPM01CUEZXS2o3Q2JWV1lISFZMYmtGZDBnOTYyV3ljZ1hu?=
 =?utf-8?B?Y1lCdzh0b25wSWlGR0w0REtENFNPMFR0UnlKN253YWpvcUNCVkptelAxMEFa?=
 =?utf-8?B?VWhTMFRzdzJPVkIwbGg1NnpZZFQzUTh2a09WM0I3UlFLWVNETEh3THVvTTZW?=
 =?utf-8?B?YjZhSDR3QVRTNUQ4aUJscXdmRithTmVoNWx4T3JvODdFMWgrdk5iTkE5K1h2?=
 =?utf-8?B?YzFlaVA0U3ZJa0ExNEEvWERhYTBDemRzYVdKMndrR1R6K0VrMW9ZSk05dWI3?=
 =?utf-8?B?Yk1KWHRZRWo3MG5QYmpYT0VNeHBaSkZDZjBqc3VtTnlOSnZGalRXdlZDc0Fq?=
 =?utf-8?B?aXRScFhBYmZ6QWpicUtTbTFFR3RVTEMyQlBUcU1IZGc5LzN1NWkxajRuRzRH?=
 =?utf-8?B?b1M3ZXZhZGR1R2IyWGs3dGlzSGNmdTRBdEtKK2cvNDNYYTFqMGQrNCt6VVdO?=
 =?utf-8?B?SmIyT3pRRjhYMk9aelFod1B0VmtHcG5kYTQ1YVg2QW4rOWFOYm80cEd2SUQ1?=
 =?utf-8?B?MmVrZHJpSjRNQnRaRUU4cngwV1dtaHliTlNPL1dFdytDcCthd2QvRjNCdWNp?=
 =?utf-8?B?OS8vdXNUYnVteFQ4ZzlGN3pVc2xSTnNiNGZ3K0Z5T0tudmxsN3V1NFdPVVFE?=
 =?utf-8?B?eDFwYUZaS3Z1eGY2RXFvT0dmaytockNFV1lvZ1JYS2EvVms2NkVpZGR3bUdW?=
 =?utf-8?B?cHB6SEtIam9JOGQxOHBDWEVXRFVTQmxEbWs1dXp4M1N2d3JVVk1xWmE3T2Np?=
 =?utf-8?B?UHUxQ2Q4Y1lLU04rRWYyNVUyMVBuUFFGTFFxeEV0dFM1RGs3WmY4SW5IMzdP?=
 =?utf-8?B?UkFpOWlTVkZ5bE0zeUE4MW9ESFZBKzRvN2JmOGNuWHJlcEFjd1NWNFlZQlY3?=
 =?utf-8?B?TzV6SVN0WS85LzJRUmdLa21lbFQyek8vL0x0MzBMbTBxam85dnUxTk5UK2Mv?=
 =?utf-8?B?RS9KY2ZqMW1IOVFleW1MRWVHeXdsdnBhRytKUWloeGFhb0ttRHA2dGtOdGQr?=
 =?utf-8?B?QnFxYkRNazVqTXBteU9QNnhPTnBVT0xVaGd0YmFJcXdYZ20xMWUxd1d3Y1dv?=
 =?utf-8?B?WE5GR25RL2RIMzVCOVJ4Y2UxR0hnQ09rNnIxcCtuNHVIU24vVy9nVitrZ0FL?=
 =?utf-8?B?cENXZWovK1ViTmhOZzBzRTlMbWV2b3Zndi80L05DVC9RdXIzeGUwTGxLWHp0?=
 =?utf-8?B?VnBhbE1SSFNEcFBsaDZUR01WeFN1UmRVSVhwZHlzbjc2VzBxMXNxTHh0S3Bp?=
 =?utf-8?B?b0hnK1dyOVJuYW5lT2tQNkFsZVVSWCtKSHo0ZnROZDl2ZmZJMWN5RXcyRnda?=
 =?utf-8?Q?wrXH+wQ9ZlNqomAL1R?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 83806825-5987-4257-eb45-08dea1c938f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2026 06:17:54.8437
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AWCpkboDFRTrgTmTRIktcIf9ykR+XAbdA9jMaEw0qZHQs8H+UnGnlb1QxvovS+Lvbk9QOS8o3Vll6KsgjckJsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11289

SGkgTWF0aGlldSwNCg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDAvM10gQWRkIGkuTVg5NCBy
ZW1vdGVwcm9jIHN1cHBvcnQgYW5kIHJlc2V0DQo+IHZlY3RvciBoYW5kbGluZyBpbXByb3ZlbWVu
dHMNClsuLi4uXQ0KPiA+DQo+ID4gLS0tDQo+ID4gUGVuZyBGYW4gKDMpOg0KPiA+ICAgICAgIGR0
LWJpbmRpbmdzOiByZW1vdGVwcm9jOiBpbXgtcnByb2M6IFN1cHBvcnQgaS5NWDk0DQo+ID4gICAg
ICAgcmVtb3RlcHJvYzogaW14X3Jwcm9jOiBQcm9ncmFtIG5vbi16ZXJvIFNNIENQVS9MTU0gcmVz
ZXQNCj4gdmVjdG9yDQo+ID4gICAgICAgcmVtb3RlcHJvYzogaW14X3Jwcm9jOiBBZGQgc3VwcG9y
dCBmb3IgaS5NWDk0DQo+ID4NCj4gPiAgLi4uL2JpbmRpbmdzL3JlbW90ZXByb2MvZnNsLGlteC1y
cHJvYy55YW1sICAgICAgICAgfCAgMyArDQo+ID4gIGRyaXZlcnMvcmVtb3RlcHJvYy9pbXhfcnBy
b2MuYyAgICAgICAgICAgICAgICAgICAgIHwgOTgNCj4gKysrKysrKysrKysrKysrKysrKysrLQ0K
PiA+ICBkcml2ZXJzL3JlbW90ZXByb2MvaW14X3Jwcm9jLmggICAgICAgICAgICAgICAgICAgICB8
ICAyICsNCj4gPiAgMyBmaWxlcyBjaGFuZ2VkLCAxMDEgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkNCj4gDQo+IE11Y2ggYmV0dGVyIC0gSSdsbCBwaWNrIHRoaXMgdXAgd2hlbiA3LjEtcmMx
IGNvbWVzIG91dC4NCg0KVGhhbmtzLg0KDQpEYW5pZWwgc2VudCBtZSBhIG5vdGUgaW4gV2VkbmVz
ZGF5IGR1cmluZyBhIHByaXZhdGUgY2hhdA0KdGhhdCBpbiBwYXRjaCAzLCB0aGUgTTMzUyBPQ1JB
TSBzZWN1cmUgcmVnaW9uIHdhcyBub3QNCmluY2x1ZGVkLCAgb25seSBub24gc2VjdXJlIHJlZ2lv
biB3YXMgaW5jbHVkZWQuDQoNCkkgd2lsbCBwb3N0IHBhdGNoIHY0IHRvIGFkZHJlc3MgRGFuaWVs
J3MgY29uZXJuLg0KDQpUaGFua3MsDQpQZW5nLg0KDQo+IA0KPiBUaGFua3MsDQo+IE1hdGhpZXUN
Cj4gDQo+ID4gLS0tDQo+ID4gYmFzZS1jb21taXQ6IDcyNDY5OWQ4ZDA1MjM5MDlkYTUxZmRhOGQx
ZTEwYzFmZjg2N2IyODANCj4gPiBjaGFuZ2UtaWQ6IDIwMjYwMzExLWlteDk0My1ycHJvYy0yMDUw
ZTAwYjY1ZjcNCj4gPg0KPiA+IEJlc3QgcmVnYXJkcywNCj4gPiAtLQ0KPiA+IFBlbmcgRmFuIDxw
ZW5nLmZhbkBueHAuY29tPg0KPiA+DQo=
