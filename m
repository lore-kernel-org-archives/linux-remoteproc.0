Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013071.outbound.protection.outlook.com [52.101.83.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB5F26CE0A;
	Thu, 18 Dec 2025 05:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766037101; cv=fail; b=G+oK5eyOyBfkGesQqlNZM2wedE7zjiZ/cNlE+xZkrl/9uU3086FoBZqO+ygSFmU+lpuk8j5Hg7x0Cwj+PitIUVEGEoGZlYB0EyhvS4Mnugf2YZhyoelUuFSSAn9ldMsWz72FdoHtNRxpCD8kPs9DHLGWlwzN1y1MZ2X8NNJyTac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766037101; c=relaxed/simple;
	bh=sKWY1neH+hf8T8f4Zv88HE7fld1YZoTuKauubZydgmM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ZgYMP2nlwnPr2Mt/VYKu7tzPazmoomZd28q6r4dS5z0PkqvSErbQEwI2p8YSwTwK2FgmOtpCWY9/u8ad8HTibiIzVxGX1j84+V37UdxDKaU1o5J7orqjA36js2UEeGaWWdIBc92pDN1CEkUnKoVtm77/0y0KTtRfbtCax3iG4a4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=T9kns8Ts; arc=fail smtp.client-ip=52.101.83.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="T9kns8Ts"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SlbnZ5Bl11mkikEK8/y374prywZstiCU9/n+f4qjFDOIOJgMIgXHZMDELeurCTtc3+KGbl5H/XE8zdpNCMXotyANfLlKM+PU8KTLlpSl955a0x3TBgsxtV2GWPZdOQoz3taeKTTpItLQ2nfvLCmj912BcpQ2TakwLZMzZ4Nv31dR7g+Ly3KpCaeqyF7tzRhDzBVm8XNq0DTGnHvphaSlO4YQDhATGOvbrH5Jiy9MwlNl6RUe+iyK2M3TqMUAPCXrbkXJxZZKmtNgHtebATITJ66h2EQZtJvw6AeAPJqhsvjWEEKTCpz5SL4gBfa/cgP6fXY7DgJ9Q3fcvtDOwqXxgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0cG8sTmECmyc4ir+5XOivlhebh6o9hPtcBqgFFDkmnY=;
 b=xUcMhuWs1rIVv2Y99COtM0yiqyOXzl80m8QSPaDM/8v3y5OxDJKUOBiILWVKopUHpnVSUOv4M6P7xUlICD5cTRNH0G2gIknk/rCHDe9kUqC9gYg4VynYo36DJhQWFfEc5LOuiXbDiBonvwICumAiNPBv97vmcHei8BTq8FG1oiLQzFuo8AHK9atWgdffMmhZliy9GbEnUWIuzewyN4//khML8CGQg2oIX+G12KQaA29SrO6US57vq9fcquUv2k9WgSEnjQ/uoZDIDml6JD44BfbIpsLAlNAm6FVPw76awIlZa7lFCAZubjiaCbe9zaSxWrWrhlJrYJGMcsKKRRU8RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0cG8sTmECmyc4ir+5XOivlhebh6o9hPtcBqgFFDkmnY=;
 b=T9kns8TsAswn0LgnimgzB9B28Ph90AzU/Gw/jQU88STrGvRDCguye4hxUrhMKZ6ZPHSQcc8Md2Zq1s7UnAr2R2CPpKKxb3Ia3vw8tXraHRbT8Fm06OauWdFudMTeif+G9J2xl+feo3ylgonN+P7rQV068V4+WxG9Nk60f/tvjkG/Mlw68xylPYNhm8Nv906JwF+b20Wfe3PH8yVI7XY1socnniNYn+V/0fOyFKYK0BzLtvazqo7MQOPZnfJKgorttD3/5EiB3Ss2gYJR22dZmVLW1Dlq5Q0YyySle+tcmAENIDjxplhx1mMXLePsS3bVYE3RG1jqV0blLyeigIat/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by PAWPR04MB9839.eurprd04.prod.outlook.com (2603:10a6:102:38b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Thu, 18 Dec
 2025 05:18:20 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197%4]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 05:18:20 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Thu, 18 Dec 2025 13:17:37 +0800
Subject: [PATCH v5 3/5] remoteproc: imx_rproc: Introduce prepare ops for
 imx_rproc_dcfg
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-imx95-rproc-2025-12-18-v5-3-b56a27d4158f@nxp.com>
References: <20251218-imx95-rproc-2025-12-18-v5-0-b56a27d4158f@nxp.com>
In-Reply-To: <20251218-imx95-rproc-2025-12-18-v5-0-b56a27d4158f@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SGBP274CA0024.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::36)
 To DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8461:EE_|PAWPR04MB9839:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e6a78f3-8dba-486a-cb10-08de3df4db92
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|7416014|19092799006|376014|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M0NpeCtUMTJyKytWTXF3RHVpRHowbC93WC9lcUlPZnJqenRwYTFRczM0SUJ1?=
 =?utf-8?B?S2ZRVDZ6WGJuQVRJWlpZcnAxcTdKZm8wOXUvSWZqamxzQ1k0RnFPTDJzamZY?=
 =?utf-8?B?NE16ZEhWam5mblphYjB0elBTeGFZOWdua2Rjb2RMNnNLY2Y2WWRGd1YvNDdx?=
 =?utf-8?B?dXEzUTUwL01jdzBZR2NSbjl5V2lVYWFLZkl2bGxmU2M5SWtIVG9mYW8vL09k?=
 =?utf-8?B?Und4dlg2TFIxdk80bEc3NkRvZGxGYWw1VFh2VmhwNXkvenNTR2llQm9VZjFB?=
 =?utf-8?B?bUlDNEZBWXNTVGM4Nk9zdUlTWEZEWEN2V0Vuc0RUUGRFd096bXlRSHpsRlBr?=
 =?utf-8?B?OCtNRk5xRnE0b2ZzaXBRMGRSNjBWNWhqVFkrSjdqUi9uOXV5Um45a2hRZGdD?=
 =?utf-8?B?SkVVUkJzL0wzcE9VWUlHWmxhNllrZVNZMDFRNUJTb0NuY3p5aGVNVk5vdFAv?=
 =?utf-8?B?bzZGc00xSU9UR3B6dGMweDluWGFTM1pLNUF5Vnpod3VjZ3ZmZmI2Mnp6ZVZx?=
 =?utf-8?B?dGhFZWh3LzBxVnpJOHg0NzRMS1hOejZ2SFNWTHJqNlR4QWVwQjgwVUtBbzJa?=
 =?utf-8?B?emlyNEI0RmFxdkpaU0ZBUlNZMVdHMDluREJFUFJYR1d2SXZtOXB0UGpwMDdF?=
 =?utf-8?B?bENtcHF2YkVPek9VQ3pUY0JiUGRENnQrQmhJaVZSQzl3T0cxZHNWaXByYUZJ?=
 =?utf-8?B?bUhFVVROcmt3dmxOUURHbEV2MnkwbzBxbWdFaFloNEp1cU5RTE9DczMyR0ZM?=
 =?utf-8?B?VDJBU0FZN1NSRFlyWlZjSmxHalBGY1Zva1ljZUlKTGlQcmt5RTNoaU51UUdt?=
 =?utf-8?B?SWFkWk1XelJ1VUg2WW9xblVoeDdyK1A1L3E5V1ZUenR2TmN2cmUxaklXZGZR?=
 =?utf-8?B?c0dkV3hlRVFjQlh1N2RWSndCNzRVWDM4U3kvQlBKY3FtU211OTdBZk0zdHRF?=
 =?utf-8?B?WnBUUWxmV0lubjA3cWIwMFhidndXUmFZM3lxdHg2T0V4SlU1YS80c0UxNTlH?=
 =?utf-8?B?S2JWTmovL0N4VXY2NmxLRDY4ZmZadnpuYk1icWt2SDUrRUdzZGtFZU5aTG9K?=
 =?utf-8?B?UXhhNjZBMDhLRDFmWTAyMDZCR3JvSkNNdFZsOVhPL2gzSGRzcEo2Rkp6dnNi?=
 =?utf-8?B?d1hpV05wSkRUS1c3eFNlcGxpRmZxeENCdEhDMHhqS1ppK2RtRGRKOWdxSjlq?=
 =?utf-8?B?R0dOYWRpWTVzb09qbFJLTG53ZDMzZ0Jqc0tRTDIzRGxzS3lzdmVMWmZiR296?=
 =?utf-8?B?SXYreG1jY05LQWVpQklCZXpXMTM5Njc2M1g0eVhQbFVHS3F5UVI1NkQ0ZE5P?=
 =?utf-8?B?MUt4NVRPWEI3MFNZWEF1b1kwaG53dUEvUHEwSXF5WnJpMmRiTGtodkMvQUtC?=
 =?utf-8?B?UC9KUDFtZjh1VDJPTWwxRjVHSEttdUxLdUw5Q29DKzl0V1h2Z1JrcWRlRkIz?=
 =?utf-8?B?eERjMnNsbHFsNkg3T2hPcVhjQS9DTFE3NFhiNFYzOU1rWldjNjBOdktLMVo5?=
 =?utf-8?B?ZUFMQTZtcWJyVGNxMzlOckxrV2lDbmtRTldBelVVMDRHeFdLU3RDT2dEcjlk?=
 =?utf-8?B?TCtaeWlSRmg5ekMwNnMzM3JuSVowMHNxWXZaWmRUUjJSZ1NTNmQva0tqeHox?=
 =?utf-8?B?WitjZi9MT2tYRStONXVFYm9sYkkveFNGZVJJM0NON2NYakF6SEdkY3pHUU9m?=
 =?utf-8?B?OWhDL3lZVlJVSFBxTkRwait0V0dPRnlUVzl5QWRqL2J4L2lIVEN3eUc3bW5V?=
 =?utf-8?B?bWJQSVZ2OHFmcUxtYTNJalhkV1VDYXBmdUlnRXZlNHczeHphK3Fidk1ETm5T?=
 =?utf-8?B?MFA3d1hIMHRYL0E3ZjF0WkZ6REJVOXgybkswTHByRy9LaWpyK0IreU5VWG9P?=
 =?utf-8?B?N3FKT1VLRDU4bUFsRUlwQUpRN2E2VmFsUlQ1dVEvV1BGa0ZUeVZ4a1dpRjA1?=
 =?utf-8?B?YlRJMHFDeWZ4VUdhMXNKNExmRUxHOEpCczFQMkxLM0xzY1dIcnJIZGNhQmNU?=
 =?utf-8?B?RVlxMHZZQVVmbUQrZWUxZUlvRExCWituazArTUQ2dVNGZ24zcng3bnRIQ0FR?=
 =?utf-8?B?WXVJcmhnT3ZTRHBJUzRZUnFzc01kU3NMUE5Rdz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(19092799006)(376014)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SGQ3b1g2RFBaelZ3RGVRY0VFcnlzeFZaRFZvR0ZobmYwMVM2MVhROU9ncnR3?=
 =?utf-8?B?RWlTWkkzVDBBT2ZzK3gzTmZ4WTVIUEcrS0Q4bWN5WVBPenBnK1pLN3RmdDEv?=
 =?utf-8?B?OVh6OVlrdkZBblI0NmI1eGQzQU5LdWxZU1pCUldwYlBOQlF1YUJuVXYvUzdx?=
 =?utf-8?B?YjJEdHVieUJzYTRLTnFFaUlKUk9odVFCeHk1ODJwWDdkb0ZNZmtaRlVVRFcv?=
 =?utf-8?B?QUs2bjR0SFYxWFVLRmNpUEhpbGgvZGN1TS9BZXZDTkx3dzk2Q2lMcDltYlpZ?=
 =?utf-8?B?TlRFMGZaY0FxUFhpb2lYUWd6RUFOMkFUazV5VU9abnZJZ3g1dkxGamVQdlJj?=
 =?utf-8?B?YXhtYjV6TGdONUQ4YTNkMlZBTTRVZGo4OXFZY0ZuWVg0UXhqVlNDT3FUTU16?=
 =?utf-8?B?RzJIbjRuOHQra3VGbG1qb1RDd0tBa3VzcFE1eDN2OVp0dFpqYUhGYW9SWEVl?=
 =?utf-8?B?UWpNeEt1SlRPaFBWdzdRckhVMW94cEt4WGE2R3RtYkhhSXFLRjMwSVlQMExD?=
 =?utf-8?B?TEtuVUFNZEl3VVJkcDc5bkF1d3haOFdEckVsZkdpSEY1RkJ5OHltcEZuWlpI?=
 =?utf-8?B?MHBHaW9aM0V4WWlQQ0FCWEdNY0tFU0dYT3VSYTI0b0lhdzFUQm9kd1RaRW5n?=
 =?utf-8?B?YjlhNTE0aGw2cms3YkpWeXdRQys5clVWYk53RWhLdTloTXRmSHVueW5Wa2o1?=
 =?utf-8?B?R0tsa0dHS2FPajVnLzZ0blgwSEZ1TGx0UFZadUJqTVUvMStxbzJGK1l6MVNT?=
 =?utf-8?B?a3RQR3JPOG1NaUMwckh3Ny9BdUtMclp3OXg0dGJiWGpwQVc2bjZSbG8vb1p6?=
 =?utf-8?B?eHM0RzlYc0RBL1U5bE9DMm9hWGFrblJab2xFdUtLZ3pVVjBqOHQrK0w2TnJW?=
 =?utf-8?B?UEhGR0xoOVJBNHp6d0IxL20yVzA2VW15WVIvSlVNNHZqeThla29EMi9OZHdq?=
 =?utf-8?B?eDJCVit1T1dBUFJ6VnljOHQzZkthb1hxb0pySkNzQVcrZHNLK2tnaXRxb21N?=
 =?utf-8?B?bmxGck5EK2x2S05nNDJIakVYU0xKeDZNb05DQ2haWVc5U3YzYVduTmhhbDVR?=
 =?utf-8?B?b2UyK3FiZ01SNFUyT2h3cXo0ODRUZ0pUMlVPQ0tRMUQ1eEU4d2tvbDhiTXpI?=
 =?utf-8?B?WHpvU1VCK2JndlM0T1l5c2FlQklQT1BTQ1V0L0hvaXIzV3Bvc2wyWVNtTTFI?=
 =?utf-8?B?VXNmdlJaOFhrdERUeGFUaGY3NTJmTHNZYWxWbWZHWndKRElZc2svbUpCNFdN?=
 =?utf-8?B?VUNEY05LTUNycHM4SkNSZ0paejJrV2d2RmV5M3BvQVZpSU94RXBjM2hmM2pj?=
 =?utf-8?B?allFaDNXWWkrS3dUc0xhQXlsQitDa0pmR21STjBsVk9Ya28vNzB3SlVxcC8v?=
 =?utf-8?B?TDUwd2NhTjdtVWxtRWxkNFgzMzVYQnJ5MHhDUG9rMTduSEJucW9xRlBYQ0JO?=
 =?utf-8?B?MndmUEpzMkhUZGF2Z1lwVTFLZmErSWMySk5YMGtPMk12WlVYSkJ6OTh4THBx?=
 =?utf-8?B?encyT3liWTZDQitFV2hzNnN3d0tkaVpITys0ZXZCYVhNTW9GUXRtenEzL3E3?=
 =?utf-8?B?Mk5EWXBPVVE1d0JMZEtLN1NpSGRjaElRc0ZPWGRERVpVeTRlSDVKRnBnaUpO?=
 =?utf-8?B?MnZmTEN2bjZRKzRIbWxwWnRBcmZtZUMybTRiRGFFOTd1UGZzVUFpREJnM0I0?=
 =?utf-8?B?NzBFRkt4eXVCM2p6dkZOd2E2NlRXODBJWmZ1VGtyMDdiSTNhRXBQVmpidEUx?=
 =?utf-8?B?WXdqMkR4dFkzUW5BbnR6ZXJsK1FtZ2VSQUdQYjZSMmxZd0dIQkNsRmVGZFBX?=
 =?utf-8?B?NDVteS9VMzhMQVdja1U0R0N3Q21BZDRQWnpzdDNCK3hZL3FlTERsekNPSnBS?=
 =?utf-8?B?YnMxRWVYU1FpZEFKQVRVQ205bXk1Sk1lTzN4ZmhHc3owY1RvY1Y0d0pKTTYy?=
 =?utf-8?B?cEJLZCtocy9nZmFDd3daTy8rbXJncHVIb0c1YktZb09xV1BHOWNEbEIxSlVP?=
 =?utf-8?B?YU1COTljL2o2MCtFdC9OK05udWNGMjFKbUwwZUQySXpmbmpHak16a1ZGRFFZ?=
 =?utf-8?B?Q2x0Vy9wUUlycUd3bGFUUFU5cS9CZlU1NC82bmVPWnRuZ1JwZGZJQmFTS0ZI?=
 =?utf-8?Q?TXDwU2DurdfvFX8qicG6MSWJF?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e6a78f3-8dba-486a-cb10-08de3df4db92
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 05:18:20.1529
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yplXiBrLvkFe+ktRcy8P+/VK/AV96nck1kAGrNR+arsjph3++g4jdYhvq0YlAZ2emjwbMaWXkr9eTHLQN2wK3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9839

From: Peng Fan <peng.fan@nxp.com>

Allow each platform to provide its own prepare operations, preparing
for i.MX95 LMM and CPU ops support.

No functional changes.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 5 +++++
 drivers/remoteproc/imx_rproc.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 78659c8fb84d95f3d258c21af76cefea1c82850e..b0857a1a9660503ee7cd5473c06dacb5262286b8 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -527,6 +527,11 @@ static int imx_rproc_prepare(struct rproc *rproc)
 		rproc_coredump_add_segment(rproc, da, resource_size(&res));
 		rproc_add_carveout(rproc, mem);
 	}
+
+	if (priv->ops && priv->ops->prepare)
+		return priv->ops->prepare(rproc);
+
+	return 0;
 }
 
 static int imx_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
index 1b2d9f4d6d19dcdc215be97f7e2ab3488281916a..37417568a0ade2ae4d6a4e3d0f139ea52b185254 100644
--- a/drivers/remoteproc/imx_rproc.h
+++ b/drivers/remoteproc/imx_rproc.h
@@ -24,6 +24,7 @@ struct imx_rproc_plat_ops {
 	int (*stop)(struct rproc *rproc);
 	int (*detach)(struct rproc *rproc);
 	int (*detect_mode)(struct rproc *rproc);
+	int (*prepare)(struct rproc *rproc);
 };
 
 struct imx_rproc_dcfg {

-- 
2.37.1

