Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.16
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792436160;
	b=0WGPRh3ZKznJWXtMYYuuy9fujBpUacSxZn0GSAw0SLTOOsWWIKaLOL75VvFZvpbE3Fu4
	 gfDFpT172bGHEsLfM7kLU8iZY/C1aw++UJuTYbHKqQSjD4P3fhGI9CAXzs76AmnScRWBj
	 bd61B1XM5G2cO1ZdM37WvN0b1m++cyoayVzKpgp2wN/JaA4juPq6fGtCY63Ei1Yh4x1Il
	 RHFqaWY4SfYchlTwuzrVaPtl3X3A+zhOVAQxdAbyyGqEP4TqxChKh0zmMTYHyAF5OOmKj
	 WUDu6PTKmPC0Po2Vf+aXX6GyV/oZq5mpyvxDq/WxHw8uiuPB+GtuVI/6XT1A6a4OzCA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792436160;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Subject:Date:
	 Message-Id:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=yJqabBMIzLSkDbsKKazuMCPw5G8S+GO+GexOLLCif3I=;
	b=O6qnG76UnbU8sZKxgGYSGHEklt9wmLxhnDWLVh95T7XFjqtqPTOYOTejR0nH6iMcA/Gn
	 KuCIqk+bjoxwV9oW9nf1dKlM2S/ax6fvhCu257HNekU8ib8LvCVC/6YBd67zd4B/Sz7AM
	 ovCiGcnKnhPwtimWMLmMKOhQXIqJAAM8W3FN4ddd9FaEIN0waj80PSwbDzHf9C/d8IJNY
	 6rea/0aqhZ9dYLoKspP6V57MdWtPWqOos3DNyDVhGc2A1gUK9gE0cZUG9wzx+e8WpM9ZL
	 NWm7VJ2cyp1ZnYCYmhL4e9tRwR1EgzQH1qbr1im4LJ/xu6wxion59ttlQT/jRZcmO/A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=p1VR0Cih;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.16
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010016.outbound.protection.outlook.com [52.101.69.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84EBA606A31A;
	Mon, 19 Oct 2026 18:55:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84EBA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=p1VR0Cih
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=txpP3pK5LF8fxOtxksQAQZNLb4VfBVVChuIZPuahdBewt8RzxqRYjIok0iQfWn+vHPHX5Eb7uO3SQ5H7EmzDoSZ18u/t9hT9IIvHy/VYOvkMOPDUdOekNn3UhO3h7eeJ4NWCcFTNMw3OB0lxJDk7nlxtNgW2Wl1ASjAyapLuMyF4RW4WuN/ZLDQmzNgoyHewD+CuryjzLUubaFNHClbso7T1w6w6qwXQ2l//wDIOUsEqc8FWm/RtKQ2qf3IggeiK2baOWBmTmLDd6Q18HIiEJEN1rZP6jS4T9/aspQiX4Y/EdaG8LM7QEfFvnevr8wcb7jidXQG4Df3cLn/3apSRog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yJqabBMIzLSkDbsKKazuMCPw5G8S+GO+GexOLLCif3I=;
 b=wAy8w2k3JtT/B2k0gmp4YG3nsmTZrNcfuKlcLLVnfXO5DTkbqehwXIPuMi7T8qlVxetS9q9fm4jTPWxDzhRPpSGgKY1RMCxD0CY3fmUp9IyGzv6H4Nqw3Z58WjXuiSgNxtU0pqDl+bCVO9dbzGbnE0XPxVCvO+F6G/bDMGDiuslBcjQyBluCisr+qAzFwwVOPsK19INeCrSIU8dsMIuvUEbpcQoV/64SiNBRxzGTk9/Bg2D1L8J6VdTi5CpWtRDRxD4RSWTnZKdzv70/P4wWulysU5ZpcgYkZXl+l8vj2R7SOc2scWQqcuEMs3/ZeLsrmrKTSyckkqxKP+TrJLF0hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yJqabBMIzLSkDbsKKazuMCPw5G8S+GO+GexOLLCif3I=;
 b=p1VR0CihcM59CG5dxz/VDvEBADWlM6VAlr+Ys/EDILKIrfW9qfKifWM8dXoqSC55XWZX9hNT4dxi51N5rc3VA59tWqXkNa8atYKRslR5b4S9bH6yAliES8gWACWnYK3tvgBw+40zsWcG2sNgYRiTKdnGsiyDJyUDeMCWFTX/tySXsxUO9d9Hz0KKFSo+Q6h3ObVa8DOiHb24Yrv7bsBt5E2tyXKS78h7wmAY3aeya8ZA+owLo51+aTbjGHkfZUTvOBdnDW0ziKU8bFRwLOcIJMFRmKERtmYp/9IGi7e4kV9iy8oM/nCjdcXaWV9Wd11hjBt1QURrAi+m3py9Ukqolg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by PA4PR04MB9319.eurprd04.prod.outlook.com (2603:10a6:102:2a6::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 18:55:55 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 18:55:55 +0000
From: Frank.Li@oss.nxp.com
Subject: [PATCH v6 0/3] remoteproc: imx_rpoc: use memory-region-names to
 avoid hidden ABI.
Date: Mon, 19 Oct 2026 14:55:47 -0400
Message-Id: <20261019-memory-region-name-v6-0-2e46b2e7d667@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALNn1moC/23OQQ6DIBQE0KsY1qVBFJWueo+mC8Cv0gQ0YImN8
 e4Fm7YblxPmv2FFHpwGjy7ZihwE7fVoY6hOGVKDsD1g3caMKKEV4TnDBszoXthBH5vYCgO444w
 ACCrrpkXxcHLQ6WVHb/dP9k/5ADUnKTUG7eeo7KuhTL3vQH00EEpMcHyuGeOUgOyudpnOajQo8
 YH9gJwc/zCwCAipCtbIggte/YFt297rZkXBBQEAAA==
X-Change-ID: 20260915-memory-region-name-f950eea2b78d
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792436151; l=3015;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=LvsDGkGCcai7eZrehvELTh9NxsF3s3x6X8LBIO7iorw=;
 b=E/BgihuyDXNMYQ0yJsp7rlrBG4DeozZvOA7R0zDpli6XbiKtwn1hXQZ0um5ID1nW0Kj/ckHW9
 FgYbNLkapCtAQ23GEiAwlBT5hZ7qEtQUdDsQbcnGuLgqu1Z946u1SI7
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH0PR07CA0089.namprd07.prod.outlook.com
 (2603:10b6:510:f::34) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|PA4PR04MB9319:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f81bfe4-6e2e-4954-bb98-08df2e129ac6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|19092799006|23010399003|1800799024|261009223027099003|10067099003|56012099006|18002099003|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info:
	klaNofZTEexorj6OHSaVP2WXS4m/cJMqzV6qA2+sRTNSes57FvtQ47XC4PnamYqQoYBjd1xUuQihepin5EQViFBpLZ4pdjLu/hdGSaAZWCCROs9P+dgBKjzOh7Ca0NF2Ubk1f4URAI2AlEBpz4CzyA9ltH+6CDkf53cz5wPRtqjISJNY2B+mvMFojMfod2uJ604IbVQQ1JOyEzyovt4nLVtXt/sioaztMrKg5Sl0foWR7qx00ZrnC2WuYHlmdroOwKH/F/IgH9VhUJVdX0JpM6aB/G0MPtbHKdSizvDxf7ire5XzHvMGfBbiKPt5mUhqv7uuNSHmtYMEvvSb/9T5ANaPrf4sTLMVF4M9x2/jjZACJ3zpYwiU1HwB/vbvF373f0WnAXXO1/qRQVGYp3C3nehIKvNSvgQJO2Up9i9A0KiH4TRpRMYafNBoQvf2qkokHK7msOF8ySrZAKGtYSIFswRD64GGXtJ5Y7avEYGLVZ2DMdxOfHBiOivgclY0gZzUd2B0lxl1V59Kx6jghOsmPgTg4NusJCPk1Rgi1Pxrt20MsntehWgHL3uPpiceUTAwZ/cwukgl4uQEKjjWx7it+Wrg00FmpGfMiO7/FxEVliwWxKk1K0+knx1wJpswad5R
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(19092799006)(23010399003)(1800799024)(261009223027099003)(10067099003)(56012099006)(18002099003)(5023799004)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SzNyUVF5MEx0dTE5Z291Vno5MkhzVU14L2hNd0dOWWhUUlhGQ1lwSUFQOGpY?=
 =?utf-8?B?ajRiKzVZdm5OdUl0U3hzSXR2K0ZCYk5sTDgxVjdKVFNYQ2tPRk1KZnNxVzBs?=
 =?utf-8?B?OWVvYnYwYXFiMXdBUHM5ekFsR0dxazRSbTB5OWVGZFhaY0tLRTBzQmlXM2RQ?=
 =?utf-8?B?SEwremZxZmNnbUlGK1BlRkVvb2ZMM0E4bFlJdkFpTFREbXg4SjgzQWVpeFJQ?=
 =?utf-8?B?RU53ZTkzNUxQVGFGSWMzWDd4N2NDeU5MeHViSlNaRmJndm16bnk2NHlISWRm?=
 =?utf-8?B?dHFHK0J5WHAxOGpmT3ZXeWk5ekZQRzRkYW11Y3FrMjcwZVlYOGhERnFQZHZN?=
 =?utf-8?B?L0Y1T21IYVJvYVYrQmRac2QwcDQzaG9XUFZsVUl2OFBic0ZpYzlVNWdBWEQ3?=
 =?utf-8?B?ck5qUEI5RFBWMjh3L1ZyTCtqazZNU1B1VGpPWXhGbitPQ2llUnZzUitNbTVV?=
 =?utf-8?B?ZFdOTFdrcFdEdXRYTTQ3bzZXMVpFNjZManYxTHhDcmlHOGtOZmViaUk1RXpF?=
 =?utf-8?B?dkk3SDdYSHREMGxqNmxLZXJXNnBDOFduemRFZnhKOWpRR2lwVEJuRnlpK3hJ?=
 =?utf-8?B?RUFieW1IeFhWbVpELy9rcVNmWFFFRGtZQkgzamRHNlJaSlRJMnlSVy81TDBh?=
 =?utf-8?B?Tlh2dWNVMlczbzNDNy8vZndFY3VuRHpkSTFRekRJM0RhVUM1S0hYcjlBeWpB?=
 =?utf-8?B?ZmZ6Z3FoOE1BRlhldzc4ckdXb3NIdm4zUytkcElMV2YyeisxY3BWUGJQUjhQ?=
 =?utf-8?B?MHp5N1VBaEIzQ2cvTGV2WFlURlBEcjliSi9ENVUrS0dKaTl2dEZWd2pocVkz?=
 =?utf-8?B?bWFLOGd6aEpyWUJGZkV0L1k2TzlSMVVobC8ybm0vaUx0Y091Uk1PMXdUcXpt?=
 =?utf-8?B?WFAxOG1TUWEvTXhDYzNia1VlN1JDRU01cTErNnJoOTdiQ2pKc2hRQUhQS0ov?=
 =?utf-8?B?cDlUSGZQZ0xuNjFBU0VVZXorQVdKZW9XaHdwS3Y2VFlkVFJ4Z0JGUDMrZW93?=
 =?utf-8?B?K2FqQW13WDJLemk3WDdDUk9uS3hsRzY1Yk83Y0NraTV6YTlqSzdEYW9NcVBQ?=
 =?utf-8?B?aVZSSXdNbFBpYjZwQWZNeFltVDgrcDJkVHJMaVl3MHhJZGYxdFR1VVhuL3hJ?=
 =?utf-8?B?WVgzaG1Wdkd4SkRYWkhLRTJFZTlIcEtvVWIwMENhVG1ad3FNbFRvNXdGd1B5?=
 =?utf-8?B?TWVudXY3WFlzZE9qalpwc2pJcXZWZzZPUEZuejhYK1hZd1d4eDh0VmdzbXdB?=
 =?utf-8?B?WE9wVGlTVUlqbExKUHNaS3RwbE5YUGdLa3pGNDlZenZSNnlMbElVQTM0YlBZ?=
 =?utf-8?B?Vnp1c2hnRy8vcnpXVTcwdmxRS2ZmMzhhZmtrRHo4blFueE1OZWNRakdJSlFq?=
 =?utf-8?B?MmhmelpYcXNLUUY2cXlGejN0aVgzaGdXTXRrRElzNVd2UTh4U0lSSW5ITFph?=
 =?utf-8?B?VHZMQkE2T0xlWmJnU1NVaVNPeDI1RUtlbUlzZ1MzemV3cmxCUDBXcUdvVTRX?=
 =?utf-8?B?Z3FIY21zSzNpUjNIZVc5SzBJOEhNQ3VUNTE4TndpanVzQi96cy9HRExYMWpV?=
 =?utf-8?B?ZjNFSXVsYWhYMGo0NkMvdUw1clplSFdwWUJObWFZRDhXbnhrUk9ic29VbWdI?=
 =?utf-8?B?Y3JqUncrRnpNb0xzTVhIcUV2OTVGL1NKOVdUWVBRRHNFcnd5UEZmM2ttcC9P?=
 =?utf-8?B?UW5FSFNsUHRESWlCN0R5dEwvSkx6WGlxR25tclZPSDQ1b3ZDUTZVRWNFVEVv?=
 =?utf-8?B?dTdOWlA4RlVnaHltdFJSN01Vdlp0UFBabmN0SWxYOGhRWGgyRGpnc3BSZnNu?=
 =?utf-8?B?cHRhZVo3YWdiZ3llR2NMeThYdEp1cWFsRE9TVERLT053T0xCSE5BMWU1eFRM?=
 =?utf-8?B?VmF1bThJZWpZWXIzVDhPSCtUWW1iMnY3TGlEZThRTjVEZXRicG5nSGxseHRC?=
 =?utf-8?B?bnFObnJ3WTFTVERSWmJkcXZ2cWQvREptYVpFUVlJeHZCdml1RHMvcEZUdWk2?=
 =?utf-8?B?c1c1YW5UdEU1Qm1VZnY3Zkw0bjc4QU1vYUFySEZSVWZvcitPRHhwMWN3eDhZ?=
 =?utf-8?B?NC85czdOZGk0OTdtaVNETWdKTlZObWMzTklhUHp1eTR5blMvSHNxRnBTcmVV?=
 =?utf-8?B?cUtSMUZjaVFQRnpDdEdweGUzNUJZRFdaZGhDcUg4TS94TmNPSXNHSisrcW9K?=
 =?utf-8?B?enBRcUlzRFd3WGhCVXIzaDdGd0tZaUZUOFZZRnAvc3hxalJlZ3hHUk5GUEhn?=
 =?utf-8?B?emN6MGIveld4aFA5bkE0TnVGd0NnQnJ2NFpudm1BREViVU5Dd0hySmJqdkU3?=
 =?utf-8?B?MmFmVVpua3RGSTRtZ3hJek5PZHprRU1Ua3V3UFY3eE9vUDgwdWFCa0VJRW5u?=
 =?utf-8?Q?oz+J9FK+vVe917+Qt6vDXgE9ooJ/ZGp5IHBQk?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f81bfe4-6e2e-4954-bb98-08df2e129ac6
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 18:55:55.2227
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WdOdyX+0ctHi3Ev5/B2ZS+EesfZnw+s8T0hqBQiV7hPlLa7kbH4Qj6XqXqxChLVX723fABBJcL15N2FMUUXPFZFFbKgH1GOnGRsSRVqJXgkrmDBZmx/4IU0mZZZJbD9b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9319

The driver currently derives the memory region type from the referenced
memory node name, creating a hidden DT ABI.

rsc_table: rsc-table@90000000
           ^^^^^^^^
{	ret  = <0x90000000>;
	no-map;
}

m4 {
	...
	memory-region = <&rsc_table>;
}

Current require node name have to be rsc-table, but no any binding doc
to restrict it.

Since memory node names are not constrained by the binding, incorrect names
can silently pass DT validation, as seen in examples using "vdevbuffer"
instead of "vdev0buffer" ([1] and [2]).

Add optional memory-region-names property to define such ABI. To keep
back compactiblity, use "optional".

Link: https://lore.kernel.org/imx/a3602ef8-2b77-4cc3-adef-2c4cba08a5d9@nabladev.com/ [1]
Link: https://lore.kernel.org/imx/alexXTYQHUs76J7v@SMW015318/T/#mb9dc709ff3adc24d9db6d30c973f37b580f6f1f9 [2]

Prevous version
https://lore.kernel.org/imx/ail0sH1UhnQBPRkr@SMW015318/

---
Changes in v6:
- collect rob's review-by tags for binding
- move imx_rproc_rmem_to_resource to c file
- dts move related memory region node into overlay file
- Link to v5: https://patch.msgid.link/20261015-memory-region-name-v5-0-abc358b39a96@nxp.com

Changes in v5:
- fix binding region-memory-names's pattern
- add vdev1vring0 and vdev1vring1 at dts
- collect pan peng's review by tags
- Link to v4: https://patch.msgid.link/20260917-memory-region-name-v4-0-260755920ebf@nxp.com

Change in v3
- rephrase commit message and cover letter to correct descritpion and
reasons.

To: Bjorn Andersson <andersson@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
To: Pengutronix Kernel Team <kernel@pengutronix.de>
To: Fabio Estevam <festevam@gmail.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: linux-remoteproc@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>

---
Laurentiu Mihalcea (3):
      dt-bindings: remoteproc: imx_rproc: document memory-region-names to avoid hidden ABI
      remoteproc: imx_rpoc: use memory-region-names to avoid hidden ABI
      arm64: dts: freescale: add DT overlay for MX95-15x15-FRDM RPMSG usage

 .../bindings/remoteproc/fsl,imx-rproc.yaml         | 11 +++
 arch/arm64/boot/dts/freescale/Makefile             |  3 +
 .../boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtso | 81 ++++++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts | 31 ---------
 drivers/remoteproc/imx_rproc.c                     | 32 ++++++++-
 5 files changed, 125 insertions(+), 33 deletions(-)
---
base-commit: d419d682257d813f6cb7a28e42b35d0edf4ad038
change-id: 20260915-memory-region-name-f950eea2b78d

Best regards,
--  
Frank Li <Frank.Li@nxp.com>

