Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011036.outbound.protection.outlook.com [52.101.65.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B783BBFAE;
	Thu, 15 Oct 2026 14:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792075194; cv=fail; b=SdftSn2m1TV4OlNe8fn1ydUMSnI5q+TyvW/SMeKx3fGqDMGw3n2j/vSrtqlAUUy+NlCe5PhQFi1Mw85itzWuo+1ojyc+Jk+fp28ZoiC9x0BbzHHBchrBcNv0VRPb/Nauf/OoLwCrJY80R74Mc7hXbO2aMthsXvaj/INcHnI2334=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792075194; c=relaxed/simple;
	bh=LXSkPZXIYHHfyU4qXJ/pG4l/o16rbcKa9/4ghs2JaK4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=j7eI4kTegsh9WgmYpIIwsk1L0PsrMj7I1qKoP91qFgniMhn0RL9+SMy83SeecWHK2kNYg3IvyLKtdNJ7GHe4rXH/SYInr8X24HMZuDHie6fV7iSRbvR0rJN/idCHeMATzHqjvo/q+sCXLsm0VMN9STDChRYWHieuKwssyRD9iJo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=mHbp8WSz; arc=fail smtp.client-ip=52.101.65.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="mHbp8WSz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vcax7CLzET6phG2erNLdt+x46f2PN6ZEdTzmANA9P7ay37D86plJy73xzL2WpiTPYMBJAwNehISYVpD0ChdgkGYgcMAnetfAKlJiMn6JZxvuO/zDK7Im11BLCLNBUP/eCKypfQF1W2lE9B5no0S6YeUY+/vd1uONuzDK8GfyYCyDNnVZcYpCmzFAsxiPeBgJBecuI4fN2kpn4BL4nIVDJ/SOakr/sTDVNgG9LLGCyUo8CeqwwbbA5LinavCswGZglLC3mR5eR3jWue40DwLBs9G5VT5pmfrkxb2qxy3pMz1Yp9krd4F+6VK3izjGbYYnuC2rHGLzsAjB2aA4LTXe1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fiZWd8AlTiZ+tcFUreyvujFn/ipmSR8uZ1sabdahXZw=;
 b=c5/+AbMsBGPV5tzelg8a9rDw00iBo2vfGPvdugCARxiLTWtsquSRVCYSqQjX0m4Jvhsvc8eYEmV0uH2WS1D3mGakFpOWpt89yNjIPZyJ2ckqR3CPVOXXBAX1Ios5UfsDGJ3fa3XzSeHssu6cOpdhp73yZ9eXepmLIIg71jrF1ET9UlQuEZiI/LMdjA+wXDbAnbzgXH+xtbWYhDaUNfetej229U7PKpDf7kYO5e/poTUMyI7AsvKpRU57SRguN0feSIKldmmPsLX5I5T7WwonkSHPI8Il1Ft5/HljzBEUwqM0ti/ufMD+Ajt97br25LQluqs9M9uXmAQug/0kgPGQlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fiZWd8AlTiZ+tcFUreyvujFn/ipmSR8uZ1sabdahXZw=;
 b=mHbp8WSz+hl+Nmqfvi2JqEvB0GJRZiNhgxlgjd2bch4KNU/enbj6vrHa2+p74SXNOZ7ewyy2Kg3OAntvFLCV3v8Vkub99xBq5GVDKf07+26bdHfLFWAQKSd/8EjaN+e0V7FzaFduPIvjb1zYanq7i68z0x0xeivp/b0huZAtyZxVzw6JH60q6FbvYnNf7QZZgMujMneSTMGcc+jRsAZIfCt2cDz7X0nzfzEwCz87enXmw2QqJvcoZLqDRHGosFWNBqUAfkRgaDyaUc+ekEF/SIBJQ1i1uVh5PpFZkCk3vioGDhJesT1YovXdbjk+aKA6NsNGc/2wmg/t89HFIOp78A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GVXPR04MB10755.eurprd04.prod.outlook.com (2603:10a6:150:220::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Thu, 15 Oct
 2026 14:39:45 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0522.012; Thu, 15 Oct 2026
 14:39:45 +0000
From: Frank.Li@oss.nxp.com
Date: Thu, 15 Oct 2026 10:39:24 -0400
Subject: [PATCH v5 3/3] arm64: dts: freescale: add DT overlay for
 MX95-15x15-FRDM RPMSG usage
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-memory-region-name-v5-3-abc358b39a96@nxp.com>
References: <20261015-memory-region-name-v5-0-abc358b39a96@nxp.com>
In-Reply-To: <20261015-memory-region-name-v5-0-abc358b39a96@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792075166; l=3525;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=xE1XRUTnNpL+MpbKEKt1DoCVFlhqAbth/FxePUpAeJw=;
 b=cOB+6KzghLxPhRV90qeQ3OtnPB39ww8LjqbIKOZcFwU/rHegS4wz3okwvNqwCxlnUh7qTdUBk
 tIgaDiBijRYDDay2m53MP0KU2Wc072/E6Za70Jv45hrmjFyXSLDhF1+
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: DS7PR03CA0184.namprd03.prod.outlook.com
 (2603:10b6:5:3b6::9) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GVXPR04MB10755:EE_
X-MS-Office365-Filtering-Correlation-Id: f74ad555-3342-4bc6-c9e8-08df2aca27e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|19092799006|23010399003|56012099006|11063799006|261009223027099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	vEncw9K4yK0zwdUzwfpiCIAQjtya58r6x64cg1XaPcXyQc/Y2d8DOJJMX4U+d5fEhra+qLbyfR0DvyzdVnxNNEyzpcr7/WiyM3aiFQTfSrB21d/V33tAFi++PWxCB9QlJowKtaOKLtJNPLtwp11e0w7YPebUFh/ErmWnOGjl1bL6xCi//h5Zn/4WHHyzHLGaj03iry8yLqk0OtNS/DXPJ6Bu0/a8gr0AEBe54nWivqUE0tCOfVz8CND3+LLZdqkCnn29P9sHE4M6IpKInhd1Du9gDUf2UB7Za+QX+qdRobS+J2Of3x04y66ZD3h00DepsNWc7j2j32Bt4NbKXjv9h9fdOn3p+IGGgBo2DA4s23MIhOYvDTrhCqf6EFEwNXf9vngzsIhFAaKRHg41iAze6WafALzSyFcvKA4zKAzC+cT6Skjt3jWEt9BmzDHNF1+GJrHqya6qpIpIKXEPPnYDoQ40nKoJicNmrwl8MXxXK+CvtHTZwF5Nwk4oOM/QxxOkGzA0iNcJwvb1XYZMKwcUbpUo78ByaG+dtyQLDUdxRThDWM/Awni044gP7aAk862WNocI5avUqJyzYBOkkTdTW9vvrpluNIvIWW4c042eoLe26J+6Ne4PexGOyte60kd83S806IGhhxXK6Nc0FkUU4qLgN12ZvYT0CYaNndliNXA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(19092799006)(23010399003)(56012099006)(11063799006)(261009223027099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?STZpRWZxaWJhY1JsNWEzTkc3WTB2Rm1uanhRbWlWTVFuYzIyVEcyMjNDSFVI?=
 =?utf-8?B?NlptTE9WV3pGVzZvNS9jK2g2NzhwWm12OTEvdmlDeHhMNFBuY2o3QWpjd3Fq?=
 =?utf-8?B?MEVuVnY3dFJNYmtsYUgycEFGbjltVHY3NWY4ZGpmTmUrKzdjUWkzemlmenov?=
 =?utf-8?B?TzczSmNnREtuc2lvam1sS05KWGdqcDNLN1RWbitocWkrQUNmWG1VbTBCbXZN?=
 =?utf-8?B?aDNFem1tQm0rUHMvcm55cWU0cGJhVElCZWxiVGlGclYrcEw3SXM5Nk5ENDA5?=
 =?utf-8?B?SjNldEI3UVZuNUVTSk5iNDgzNzkvOGhwM0hKZ1R0UlRJQ0VjUXJsZEQveEp5?=
 =?utf-8?B?RFQxU1Q3VGMzRVJFalVLTmw4Z01KYUxEczAwYVJYbjJVd2ZOQzBUZ3ZQbmND?=
 =?utf-8?B?TjQ3M0J6NUZnK29yclE1aGNPMmJsQ3BoeGhjd3IrdS9qcmlld09DOTN0U0xK?=
 =?utf-8?B?OXR3VHkyWTBnTk1DcXdxakVKdnQ2ZWpaMElUQkY5K3FsOXltOFZhNlRKSm9H?=
 =?utf-8?B?MzVJaDZ5RzZ0TzlJeVFyckhUUld1NElaRUxYRVQwSEFyNktTZ1JpYXRaYTMr?=
 =?utf-8?B?TUxDWFZBUEh2VFZtTmxqcUxINlBUR3Z4anMyZ0ZBaEVtNlBGeTV1YWgwNGFp?=
 =?utf-8?B?WGQvamxsSW5ZK3ovbktPUDZJajdFU2dlcGRkOXBEUFVybVpLRzdTcFg2TjJR?=
 =?utf-8?B?K0x1KzRna2Vxb2RUSVhCQThjaXJ3bWpCNGpsQTcxKzhoT0szVEsxMTlrWGNB?=
 =?utf-8?B?cVBqMm1lSEVCdnBiY2RvRHUxQW1UeEpjaXhQNFEwRTZ3cWZsWTF1N0FmeEZJ?=
 =?utf-8?B?RFdTSE01UUNKMVFENXh6TTVNa1pTK0luOU1oSHFRMW5QY1FjR2xNR1lkb0tI?=
 =?utf-8?B?dEk5UnlHK25kL1FVa2ZtMUExSm8vVkZxb1VPNlVkdjVFQy9xY1VFM0ZLTyt4?=
 =?utf-8?B?MWdRcFdYTjhoNkcxMnhkdm9ZbU1UM2FNc2FMOUFxUVp6WlBmeHBoa0tmbkgy?=
 =?utf-8?B?RWdWa2gvcWZFdlpHQWJHZ1E3ZTY2WXE0b1RLdlJVckRNZnVCN0VDVFIrL3Ja?=
 =?utf-8?B?Uks4Q0tNZWlnMldoMUZlQUVWQWhHM0Q1ZGl5NWd0cmI3UCtkN1hCbGFZZTVB?=
 =?utf-8?B?bC9hcW9NQXBUZk16TDRtUXdoYys5eWZkSGh5OXdNWlQ3dnlrbEw3QVI3V0pR?=
 =?utf-8?B?czA5SjVldm1nNFpmSEtqaXY4QS9EUzlJWTBSemtTODBKWEIvQXJUUlNLVmRH?=
 =?utf-8?B?RjhiaWVPbnA4ampVVExLNk9oeDY1a0d3NnlLOEZlRXN3L0MvYUJKQXZuMVow?=
 =?utf-8?B?OEZIRmw4Tjg2VVIvZm9BdkltNHNCSVlJQmFLeGh5UlExNnk3dUttSjc3NFhh?=
 =?utf-8?B?ZDJyczJ4bHF3L0RORzc4OWdVNExVNTNxK0dBZG9GMS90OVdLdW1TRGdtalhP?=
 =?utf-8?B?RlpvQ3l3VUJTZjlFWGZkdWFta2FBTUxwYXV3cmZQN202TEZneFkyY25aeHpm?=
 =?utf-8?B?akNYYlVmangwWC9meThEa2FFTjlhdXdyUFVVdkR3U3M2WDZxNHl5c2hpSkt4?=
 =?utf-8?B?Z1ZTeGlMckpRVVFDK05zcy9ManVJQ285VkRzQ2FGbzRFZDZwcHhCTmNLTUxp?=
 =?utf-8?B?dWtwdTVVeUdseTBSSW0xUEVYbWNma3NpNzFweUtWU2wza1pSRGxYRzNaSWdr?=
 =?utf-8?B?dFZjQzJSUkU1c2NpTTJib0hRdU4yUjhXRTgzYTdqOTN2Zy9VY1JmVXRobnRw?=
 =?utf-8?B?aisxUkJvQVc2NUh2YklScEk0RWYrK201WFVRcjVHcHF2OTdaZXNzSmh4Smpy?=
 =?utf-8?B?STR3YXlQNjlraDU4azMvbnBRY2hucFVVcVVBenJwMFVjQVdXUXREQ3VFQXR2?=
 =?utf-8?B?Qkx1SE1sOUtRQkhPRFI5TXJXZFNydjJtbHBCSC9lWFJxOXFpb0dqeXdtRDJC?=
 =?utf-8?B?RnlTMHRLL2c4Sy9QY1g4N1UybEV3Nm1kd21oMXlmRWxRTlJyQktvUmFkd3dT?=
 =?utf-8?B?U1ZsOWtqRDhPWER4cEp0aXMwNnR5Mmd2c1A2WkVFUXBxZ2FPWjVxQzlmOENR?=
 =?utf-8?B?Z0pXMGtieEQ5alYxak9OODAySkdzSGRKcUlaa1o1d3NraVdsWTlDL2FuOHlh?=
 =?utf-8?B?RWxBU2l3Q0I1VGRTZHhKdUZ4eUdCYmhLc0VYNk8weUFmcXMwL1VIS1Y1SE5p?=
 =?utf-8?B?akxCRVB3azViZU95cExwQk13WVBUNUYwbDR2K2Z2anZpbk5uMUFQd0FwaEdw?=
 =?utf-8?B?NTVheWxhTmFlaU5hbjF5ZnlSS1ZkdkQ5VEtSTGJoM1RsTWh0RXNiVThXb0tB?=
 =?utf-8?B?Z0ZVdTFYdlJHM09KOG9HQTB3NUp4eXduMmlYbmNDNGN3bnVrUkhNampxMkRr?=
 =?utf-8?Q?WAcA5CIx4NzRxc4uAlsRgXtikuTjLmFXkk92o?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f74ad555-3342-4bc6-c9e8-08df2aca27e4
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 14:39:45.2427
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: InKyjLjjNRtxUYNPWXdyy4wQlbFvDbF9s02k5wZpZGCO/DBuFx2C6Ie0xiv3oO9kGmFUri3Prx7r288zomwN9V3ibjA5MzWqSl4MyYy2i4N8l71is5VTdvdFT/+GDxgt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10755

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add RPMSG DT overlay for the MX95-15x15-FRDM board. This overlay is meant
to be used with the mx95evkrpmsg system manager configuration for
remoteproc and audio over rpmsg-usecases.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |  3 +
 .../boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtso | 81 ++++++++++++++++++++++
 2 files changed, 84 insertions(+)

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

-- 
2.43.0

