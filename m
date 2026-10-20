Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.2
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792515046;
	b=44mUJkhepHOp+daYvkGERbsv7kwgJQzqBcwIt5nXRkcpCJcZ9W46NKkd3pJWnMtyL5JW
	 2qOgWmkoXkhVTCNiHa/67gDh2da/LjH42hS/8jj1fahCNNuNqC+xZhPxO8RiM6GmrySQT
	 Y5XcIyK6q2KQajzl0XEI3477qMSa8S1w3xl+L5Qs8SW+bq0pWgmud9yqtonKMraUHIWi3
	 w1InqbQweYAJkyhlm9QH6spGxboPLRRoezeol8yAM9LEZSQG5b440eaKIq5SESoDqcdm0
	 e2JDtmkajpgO8o/9p+dNHwG+IvcackVizMlch/6CnxN2e8T2YCKXV3fW/imjjWMcylA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792515046;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
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
	bh=fBLG0k2pzlrByEjHSUrj5ObpXIigdGzenZSiJU3oNc8=;
	b=Xzk3qdK9PXaVcL7iszaabQ8NAOVOo8Sn6VUpbKPO90syMb94yjwq88lkA/q6fUBRPKEM
	 kZEjr0nvlRV3/2R8htaQGqCijDH37p4/mARqj/trLCxnL65D/GyxNim+2Rga6yE6d9d21
	 7Oxc8kMYQ3gsKuj0xxvgc4IVYqnu/DWAS0nwqc5IJu4n8WMe8djKHyaHzXvuRL+Pwa+Ql
	 M0KLDxN6m7xS+id7wW3kFqAe/PD8nZAqHNxbeEdvR/vhhIRyVf5ZTx0XF252NS7FqWFAo
	 D3/BAMpddmQ1YRGxw6Q2reFvWbJh9/HIYmkBmWesMZpRtU+kmMSKcEL5Ekz85OvFn2A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=nAlUQ8kZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.2
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013002.outbound.protection.outlook.com [52.101.83.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4568060A261C;
	Tue, 20 Oct 2026 16:50:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4568060A261C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=nAlUQ8kZ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T+OjUH9m9MTOLPj3n7Sa2bU0P+okGBs7SDogxPPj+wyf2CrndNlxphMtunEHd4yjrtptm/fh3/GLbW8OD9XRY86UEMxQI0/9tb8XBPmSNIUIWGSP4HuEMrM7PInA44y4bZKb3juBBn0vQtHKg1fOOV0Mq0y9SmhFlxnxdBcEv1CH5ggC/cYgWO8uFkX0xe//srFM3tZHKkeHgN56+z656/SgjkQcKE8/K8tZBddphigGUSlZcHTbox0oBFl0IEpNXtnyKXMrVKE6O1TBW50V25DGTtFqyhSsyHSvJ0zzjHqWjMq4ZsQrObGS01S0BHVjn7D567iCfADcZTsrIIPxXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fBLG0k2pzlrByEjHSUrj5ObpXIigdGzenZSiJU3oNc8=;
 b=Q8Dty4/s2FkDNEQDBDqlhQs6MF19yuunj0XPvPjE56dS6GwPajj8p/xQxEX81aulp7WRO2pmKmtd+P9u4dysQOsmPZn/bO63vilg9EWzLRr4bEhb10ENrjQdi93GE10wkcH9a0C7ge8AEur4QDSPV83I/vm6fNfH7HHeRjIVfdZrGRfXn5JKOhv92mPOL+Vod2eU2kSkkJqUoDLIQyUxJqMKWMi7bUDCVOp98CEaAxNpKRIHON5vwF0+dhitW0GTB3A4HZdLYzNvUzcEOLlAha2kJYuoCSKk7BUw1G9d06UfcemKvb1g2GyAhqH+xoMhZwSP5556vDxx8dqsn5W86w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fBLG0k2pzlrByEjHSUrj5ObpXIigdGzenZSiJU3oNc8=;
 b=nAlUQ8kZRtUdleUm9XmFjke664ZAn2GFgIdJ09OFW0Nf4lXfn1fItMVxrURcCc2DcksPYE5hT8gXIPK2DZRpUw0miJMvioHudUwjnfob0LuFE0u7fe5Vgm9077amsffjGkXkd66o8q2bDXprsOGei5a1ImQuKJlGg66iKXBqOH8Cc2McY+j05OjnnNABgdmKxI3unAgZjOB/JWEn6TDqb45FcxB+Vi3N/U7ctH/NeuHwj089ccN1USCPg021Q9wcc0b0Cjwpdkf8GlXhP9HwKjvR8WY6lfA7wny4rDEreaQZeR7l2iANe+rLhflRAyRzYXaHVHUWbrHLotredyhAIw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by MI9PR04MB787466.eurprd04.prod.outlook.com (2603:10a6:290:86::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 16:50:43 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0522.017; Tue, 20 Oct 2026
 16:50:43 +0000
From: Frank.Li@oss.nxp.com
Date: Tue, 20 Oct 2026 12:50:23 -0400
Subject: [PATCH v7 3/3] arm64: dts: freescale: add DT overlay for
 MX95-15x15-FRDM RPMSG usage
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261020-memory-region-name-v7-3-1413d5928340@nxp.com>
References: <20261020-memory-region-name-v7-0-1413d5928340@nxp.com>
In-Reply-To: <20261020-memory-region-name-v7-0-1413d5928340@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792515024; l=4768;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=FJBJF5Gng7ZW/QfibZr+BNRtv7UEa0EQZgF5WVuT4TU=;
 b=udrXM5SUdLKh8Ff/q3WLXNdRpsEh/KxT4nvWOLhAMiUGo7HLIuah5nwcgxBXW4/I9CYlVOdoA
 ashLrNBvJm7D4VearohH3z2ha4XHfygGicgXYjfZR/I89M3ucwKO0ql
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: DS1PR04CA0011.namprd04.prod.outlook.com
 (2603:10b6:8:44f::14) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|MI9PR04MB787466:EE_
X-MS-Office365-Filtering-Correlation-Id: b930a052-2fbb-4634-2422-08df2eca47ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|23010399003|366016|7416014|1800799024|6133799003|18002099003|22082099003|11063799006|261009223027099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	KPJ7y/rCqzxb8+qPgZNQjwGq0zlHX8djkbsIp2XFG13AVIxh2a5ZcPP0ONO5l8yxjA8teC+6B1rXkYiR5C0cl5pPhVlNrtFKqoNyfDmi+Jz3X6gCFHDSsiXAzR5TnJq9s1/0G9yAdl8KyUGID8zU+Dgiamy1/066FGJ66YW4tE48lWcsLTxOEkXq9mpkIOJ3AwwZk+JORCFpLZWenA7z+aN5q3daTz3vwbgdep6GdQ6NK0n5S+ABaO6FQ7HvGDQug/JUk0F0jUATlOTXEOwvMjUI5zG1dQMU9XU9qqNdYQtpqwPS2pWBFdp2lGVLwInmN5MmmtRNYg8jPH8kUyy1/BO14DaaydoqJOuFdT4U37EOhWZUfgMjtDrosxPchX81j4XerlaRoLbRRNwI1Fm1NS7m4ukY0HWm5E8PKVsgmaHmXlGLVTjr+ePoggKz7F7sYNyS1IUNQDDzhohiw0JHUx6iCKHkQTcLn+VXs2FMZISaDmLyKWwLwKnQMkGZSufzLIWS8mkmdYAQ0JbrITgWCwS4c0CJY1ECX0eDa16uEI6/GhC4gXFugltZ6GK8Ji99emY3RkpRLfqbpOe6Rj1dFafWLOc0pIMF1uqZDnMZ5WbsBtQHrIJOu22tUUjgZ6okM5oSW+/0kb78H5bO9JcJjvJBKFQCwkPF24+33086Bj0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(23010399003)(366016)(7416014)(1800799024)(6133799003)(18002099003)(22082099003)(11063799006)(261009223027099003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bWNHTThsUVpyRy9GSTRsajVFMWdqK2I4OXlTRWpkdFRzUjB3dmp2TjNIMTB6?=
 =?utf-8?B?c0JHNUY2RUQwZ1k2Ti91TFZXVGhRVVNJbW1UMlhJQVJaQUxrNVlhY0llazFI?=
 =?utf-8?B?V2s0Z0s2cDIvZC9KZEVaZ1JpN0liNCtFUTNRTGpvY3ZUeWl3alRDcFhZU29M?=
 =?utf-8?B?ajZpYm8zRWZiU1pGVjYwRHAxT3h1eVU2eEpoelhYUTY3dmsyU1hhOWV6Vm9i?=
 =?utf-8?B?VGt3Ym9VcDRLaFYvSmZBck9uTk9Remk2a01mMjhHYml6UEZINWNseVJsVzhK?=
 =?utf-8?B?QXY3MnFJYXg0dTVMWWRWQ0JCYk1zNlA4eS9kSEhjSnBpU2Rib2hkTHJhK3VZ?=
 =?utf-8?B?dFNYamN2QjdaaSs4QldjaGFJdEJITEZvL05rN2FVS05NVUZCN3NiMHhOZU1u?=
 =?utf-8?B?WVZnSkFOWSs0WERLN2lERnBDaDFJNEJqNTFWazBNZGpINis0ZnRDaUFjSkRx?=
 =?utf-8?B?Q0Z4ZnJsZnNkRnA0L2drVDZnRW9ETWY1RnIvYytnbFdObU1jSDN0d3BzRER3?=
 =?utf-8?B?eDJZNzJYWkJNOFp3UC9IemhqTlh6c1pKUHBOWXZJeSswVkZXZUxBbGJFbkVG?=
 =?utf-8?B?T2drUVR6YmF6MWN3ZzZoQXUxWHVTWUV6ZldPZTZJbWo0Y1dMbnMvSXNHOGdU?=
 =?utf-8?B?bmhnYW1XSjRQalVjSFJ4bmlwaUkzU3pIZ0M4QWZyT2ltbTI3b2EzTDlDckJD?=
 =?utf-8?B?SHY1N2J0ZnJUcW1scjkraUlJblVZLzExYStLNlRSZGJOOWIrRGZWK0s2blZD?=
 =?utf-8?B?YkFsWTl1aGtBcXJocisrc0lMejB0d3EwMkFBZnNQT1gxK3pMMzNLM1lUL0lF?=
 =?utf-8?B?YnF6SGMvOVBadmp6SmkrQStIL2xLZk96cUY5Qjh3RTBVeDdnS0FocnJrY1ZQ?=
 =?utf-8?B?blVDQ2NVL0J4YXh5U3ZOTmswK0JqN0lNWWJTS3NSVWpVNFNMNDZFc0tqTndK?=
 =?utf-8?B?M0tnS2RocUZ6UFNyMm5SQndhWU10OEdxVEpuWjhaWEVPVmw0REdtOWphdENP?=
 =?utf-8?B?a3lGbW45YmJxeUVqRVZoeVVlaVUraHhvU1Z0WGtNbGlyQzE2bUVBUUExSDlq?=
 =?utf-8?B?OGJtTVpONTlPZUhTRUIzdnBmZDZDT1NSSTRaT1lkTURUd2hkMXF3SURnS09r?=
 =?utf-8?B?YzRJZ3NsK0JzeXlsZ25DejdwMnpDWnREQVF5TU5EaDV0azN4MHJuUmJhUGlm?=
 =?utf-8?B?REZxaUNiRm5rZXJ5a3p3Wlkrdy9pa0RWdGp5SVBScklVd3ZqSmtKM2I3aFpT?=
 =?utf-8?B?eS9NbHBtZHgyK2UrODk1Tm9DNzdWaXdjQWVoVDhhSU00bXJITUlYMTg0TmVk?=
 =?utf-8?B?c1VXa3FLeWlZTjZQL3VxQUJ5QUlDTWU1RW1kTVlkaHdtbWQyOS9nYXNyM1Np?=
 =?utf-8?B?eTZyY28ra1p4cytQcTNzNWxpcEhRUUdYcUZORUYxV244UWd4UUdjc05JT0tK?=
 =?utf-8?B?Y3kyOGVzbkNtMHFNSUNiNGZwQnY0QmdSMmNDZE1CZHBzRFN4cUxYeXJkNEtT?=
 =?utf-8?B?Z1NmeG53clIvRGlpRThWTWd1b1I5YnRDZ01RYkNRVm4wUjN2TFEzaU1SUUMx?=
 =?utf-8?B?OUZjekxhSVVTK20wODVnYjFveUZ4ZUJLNWVab1IwOExmUVArd2JsTzcrSmFK?=
 =?utf-8?B?VCtub1cweXNVaUhrVVI2a29vemlkSWRuR2Zib0JzSDJXWjlpVmxpVGJHUW9P?=
 =?utf-8?B?QUVNMUpCTmhCbWd0amdEVmZqQUVOM1NUSFp0cElwRnAyc2lvUWNOZFpJdk5S?=
 =?utf-8?B?NkhXSTFJWTZValpJdTFiU0U4a2RZU3RlVGlid2hZVTVRU3AxMFprWUtMZHo1?=
 =?utf-8?B?eHdOMnU3eVRac0ZhbmVRRHdYWjhudTd4LzliWlFiSGNqUnhIS3JCNjhtaWRH?=
 =?utf-8?B?VWdYWDJaU1VtbjlzTkMzdUNSVmFrZHQvZVk1NkFjN0ZTM3F1UGIveHBHTkx4?=
 =?utf-8?B?MUZERTJnWjY4K2V3L3VEUmlDbVVuNkxicnVNVUI5OFdIdHgzSzdLdW1mUW5V?=
 =?utf-8?B?Vlp5NzBtV2x4eXpwTms3T2FYRk1MbUhTdnRSOXlDSFZ4STgwZEQvMGZtdjh3?=
 =?utf-8?B?WGhlendaM251TEVHS0RvTTlJd0FWT3ltZ3RUNXZna1QrMld0WE1EZXNkejJX?=
 =?utf-8?B?a3U4N25QVUM2K2d2TmkxVmo2T1Ftc0MydFZ6b05LOTBxZldQR1hCK3l3SGpF?=
 =?utf-8?B?akpwYlFoTmFhWlFDeTdvUVRBNGZLc3Z0K2hMNWZ3dDdJbDREUmRuSUdMTVRP?=
 =?utf-8?B?ejFQWVIwTzNSK0xmVjBONnBYZWtsamh3bnJ4NmJjRnhCV3A3bjRMSGFKQldX?=
 =?utf-8?B?N3lCaE5sVWJPbjltVFZtdms3R2p2ckc3RzFTNUZBNzQ1bUtJcmZsS0VUZUdr?=
 =?utf-8?Q?bpL3LWNTtuZ0b4wlw27g02rfmf7DPYpZQ4GKA?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b930a052-2fbb-4634-2422-08df2eca47ca
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 16:50:43.3332
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IVJUS81TyhADThq0JrzSvLbanRTZbb1kMagytus2kT023FVQUPpenXt+SArqsSsnfqFytQ7vsZ/Di/754bNjF8J+ev/wHb3GEzI/ZCeLHQVLDc1DbavA5sY3y1sZm1WF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI9PR04MB787466

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Move related memory region to overlay files.

Add RPMSG DT overlay for the MX95-15x15-FRDM board. This overlay is meant
to be used with the mx95evkrpmsg system manager configuration for
remoteproc and audio over rpmsg-usecases.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |  3 +
 .../boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtso | 81 ++++++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts | 31 ---------
 3 files changed, 84 insertions(+), 31 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index a80cccf34eb56..f3b19f3b1488e 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -960,6 +960,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx943-evk-mqs.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-ab2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-frdm.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-frdm-rpmsg.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-sof.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-frdm-pro.dtb
@@ -984,6 +985,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-zinnia.dtb
 
+imx95-15x15-frdm-rpmsg-dtbs = imx95-15x15-frdm.dtb imx95-15x15-frdm-rpmsg.dtbo
+
 imx95-15x15-evk-pcie-dtbs += imx95-15x15-evk.dtb imx-m2-pcie.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk-pcie.dtb
 
diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtso b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtso
new file mode 100644
index 0000000000000..c3deb277edabf
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtso
@@ -0,0 +1,81 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 NXP
+ *
+ * This DT overlay is meant to be used alongside the mx95evkrpmsg SM
+ * configuration for remoteproc and audio over rpmsg.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	remoteproc-cm7 {
+		compatible = "fsl,imx95-cm7";
+		mboxes = <&mu7 0 1>, <&mu7 1 1>, <&mu7 3 1>;
+		mbox-names = "tx", "rx", "rxdb";
+		memory-region = <&vdev0buffer>,
+				<&vdev0vring0>, <&vdev0vring1>,
+				<&vdev1vring0>, <&vdev1vring1>,
+				<&rsc_table>;
+		memory-region-names = "vdev0buffer",
+				      "vdev0vring0", "vdev0vring1",
+				      "vdev1vring0", "vdev1vring1",
+				      "rsc-table";
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		vdev0vring0: memory@88000000 {
+			reg = <0 0x88000000 0 0x8000>;
+			no-map;
+		};
+
+		vdev0vring1: memory@88008000 {
+			reg = <0 0x88008000 0 0x8000>;
+			no-map;
+		};
+
+		vdev1vring0: memory@88010000 {
+			reg = <0 0x88010000 0 0x8000>;
+			no-map;
+		};
+
+		vdev1vring1: memory@88018000 {
+			reg = <0 0x88018000 0 0x8000>;
+			no-map;
+		};
+
+		vdev0buffer: memory@88020000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x88020000 0 0x100000>;
+			no-map;
+		};
+
+		rsc_table: memory@88220000 {
+			reg = <0 0x88220000 0 0x1000>;
+			no-map;
+		};
+	};
+
+	sound-micfil {
+		status = "disabled";
+	};
+};
+
+&edma1 {
+	/* reserved for M7 */
+	dma-channel-mask = <0x40>;
+};
+
+&edma2 {
+	/* reserved for M7 and V2X */
+	dma-channel-mask = <0xf>;
+};
+
+&micfil {
+	/* reserved for M7 */
+	status = "reserved";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
index f82e149323d34..3ab679e5a4740 100644
--- a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
@@ -189,37 +189,6 @@ linux_cma: linux,cma {
 			linux,cma-default;
 		};
 
-		vdev0vring0: vdev0vring0@88000000 {
-			reg = <0 0x88000000 0 0x8000>;
-			no-map;
-		};
-
-		vdev0vring1: vdev0vring1@88008000 {
-			reg = <0 0x88008000 0 0x8000>;
-			no-map;
-		};
-
-		vdev1vring0: vdev1vring0@88010000 {
-			reg = <0 0x88010000 0 0x8000>;
-			no-map;
-		};
-
-		vdev1vring1: vdev1vring1@88018000 {
-			reg = <0 0x88018000 0 0x8000>;
-			no-map;
-		};
-
-		vdev0buffer: vdev0buffer@88020000 {
-			compatible = "shared-dma-pool";
-			reg = <0 0x88020000 0 0x100000>;
-			no-map;
-		};
-
-		rsc_table: rsc-table@88220000 {
-			reg = <0 0x88220000 0 0x1000>;
-			no-map;
-		};
-
 		vpu_boot: memory@a0000000 {
 			reg = <0 0xa0000000 0 0x100000>;
 			no-map;

-- 
2.43.0

