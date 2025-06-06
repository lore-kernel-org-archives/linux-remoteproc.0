Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010025.outbound.protection.outlook.com [52.101.84.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942981BCA07;
	Fri,  6 Jun 2025 01:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749175029; cv=fail; b=YbP0nRQpJxzBpJOp/FMy+J7EbqTvgVlg/E8hyaLD+2CSloaJJ4J/TZjmUsgOSWXIpXxgSjDAmMh5scIyMhBnD9Wc+cKsjaeFB4znp87LTMx+KnKuE0GH6UvM7+G1XA/1Swzs3ZkGQ1qeUWahOt+jiONlK1eeEB9US4qJ1SEqEVk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749175029; c=relaxed/simple;
	bh=6Xbf8tQoZi8sEgZOs5Kv1N44OIjQGX2inBnHnS/mI3Y=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=KjSvUjEFdKIKzocuP7wjUb2KG9X/plpF/EzpDV8GZDwuBxH0bK26fl0N5OBJoTHTvyHjpnHJOqzaVyAIFgUSzEFJnmGLp4bqtLrZVz8Do6DD9VJl3FwXYFpv21gfJSr5S5E1sFeXf4+4ThsLKUVT3CL0dK1PEp5HENkswyMINIA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=K1nnidIZ; arc=fail smtp.client-ip=52.101.84.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="K1nnidIZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dhq4ITc2CajXEgYqujURbmbwVJpzDrDLmJx6LXJq+5/44obokcD2L9nZ282EQ+7ERlt2VBknWMjoFiK4bUfjPGNjwauhoSGdBDK6Lz6kIJXuqQx6QcRpJfWACWrEVNxGi+Hx3vNMMaA82sF6KY1F/5OVo6db6NKjbVEiFjjmvtyKFBnz1kG01ajzu28NEGuJfzkdmvHbIHtX2Px/TLsVokYQfunJnpd/43MHFzP9+WOEwePwhRIoUem70a+KaWa87kHzmei6i34Hm6rLo9uuSCIWHG1ovtr/rYLKPWTXR1kknn77K+5/PNpuWwo+bhEMjPe/KJgV0h2uE278QFDiNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZGCwPeqTY9eEqdPIn774pWf9VUBMXeMUmdVYJrl6Pvw=;
 b=akK/jT/Jtdkc7VtULUAG1wIUC9q7C4kwslVCJhtIeRdD5DAyELDEfeqGG2TUQk03xKPanqvXIf6E64mC1CJrLD0iO7pBpMAztrQJ3mO+qrq5x4W9cHcIfRwNe6YFfKClcqoYKVBeQrRXbpkHjoSTQcBSuBxlOblovlQE5uz6p27DNPq/zckUbUoo03WnFhCUwX7CCUpaeURwJiLAg25V502O//jGCyTsh/TA4YSZIgLkBee6D4SNmaCo8IYB2YV0V626SMvaXmQfItnf+uBquQYnneAZvPkX83WIn/9fmljTMmWNO++/kptff1Dek9Bh/u/4LpClmDn3SyJmaE5CaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZGCwPeqTY9eEqdPIn774pWf9VUBMXeMUmdVYJrl6Pvw=;
 b=K1nnidIZnloJJtTlc/O/K25zXmsTdQuz7kMG90pFX0l7MBrotNhxTRwWACf/vmFIwxVZYeEe+0mDtmgqUjsRaEp2uLwEg1dbRPzYna3N3027CdIIsbQPKPJR3kevBX1tFewEl50t0V7sihvQXDbc12NnWpsVj/HPJNo8/B1uY6pDcP3787EizumtCZzXoA7QVzonP55IGdwTHG/kngLtm8TsfDnqCXsq9o0KJhkPkCb0Hu62bKeB1klSSIkqhmceZiIUbTx/2TLuYTGmyw8k6hGHtXhU9VJaf0gZeMbhJYN+rQ9qsCNOh58pRO76PYfc1Ftsv4b8bQuHd2nLAuHKjA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU0PR04MB9657.eurprd04.prod.outlook.com (2603:10a6:10:31c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.39; Fri, 6 Jun
 2025 01:57:05 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8813.018; Fri, 6 Jun 2025
 01:57:05 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 06 Jun 2025 09:55:14 +0800
Subject: [PATCH v2 3/3] remoteproc: imx_rproc: Add support for i.MX95
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250606-imx95-rproc-1-v2-3-a2bd64438be9@nxp.com>
References: <20250606-imx95-rproc-1-v2-0-a2bd64438be9@nxp.com>
In-Reply-To: <20250606-imx95-rproc-1-v2-0-a2bd64438be9@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Iuliana Prodan <iuliana.prodan@nxp.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749174921; l=1955;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=bZEjHN+mbOlKuM4Cpzqi3XRlMawF7+ckQTbxfaeaDs0=;
 b=o8R6rNnlAYKbczVEGrTekuk2B4ifUDMBhGs19dKxzR10JaixTyQ5RQkxJXFO31Q0ywhLkiLr8
 L2zC+KDrZ15BbMY76fI/7CjOWmmpKqwkQ4lOBiyj7uLzIcgTocOxsOM
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2P153CA0053.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::22)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DU0PR04MB9657:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c84bb3d-b0ff-4def-f420-08dda49d702c
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aEV6QzkyVGRXYVpaNFZta2o0ZGU4UDBNWWMwRk1kL29NU0E2bmdVSUplaWVm?=
 =?utf-8?B?NC9LOHRPMzd2MXo2ejZTVDI5dEVGS0FFaDE5YlVOQTZSMlM2ZDRSb2k0aC9n?=
 =?utf-8?B?ckFFTGpkKzlDNXl3NklZSlQyMVJKWnU0bFNUc0JiRWtBZUdiZjh5dE5RampS?=
 =?utf-8?B?VmtoL0tLUzhZZ0MzMzM2MGtoRlVSKzY5RjNXc3VzVXJhdTlONGFuYkg3VHow?=
 =?utf-8?B?dmpnc1JKYWZncGJQUzBVdllkZlZLbWtKZ2RsVFJ0bVQ5VUtuT2daWnhadEZi?=
 =?utf-8?B?V0hJdFFlRjFodG9OYlVZcTVTemZRblVlOWoybm0xSXNxazFKbWVrZ1VCelFK?=
 =?utf-8?B?NXVPdnNtK21NNkwzNlpuVmR1eWdNaWI4bmNEMExONStTVzFQemNuMTYyTU1P?=
 =?utf-8?B?azExejhsWGs0Z2haZ3dhQUQ0djh1WUFJalczSTVoY0c5blc5dmR2Q2t6VE9W?=
 =?utf-8?B?SlJickFHSlhWZXBhTkJpTGJOUFF0L3duYUR0d0VlZ3ErK1NQZEI1SlZrdEpE?=
 =?utf-8?B?RUlEckZnTktTcVdIczR6ZFFQc29hRXJVK1owUEJCUTYvZGlqcXFBc3FyczQ5?=
 =?utf-8?B?d09wTXhwYVNKSEFTd2dnbWtPdGwzUWM0ZFV4K1huYWxicThrUi9oTDBXU2Ju?=
 =?utf-8?B?U0lLMkpnRjg1M1RZL2xSL3RuckUzOWhxcTZsNE52Q2NvbEpUVlV0K1NVSzh0?=
 =?utf-8?B?WDRCMlNOaWc4a0x0L01WUGpyTUtFd1laUjRGb1pXcSs2ZzJaT2tBNDkvcGIy?=
 =?utf-8?B?dFduemU3djZWWlZwSUtvTzFHQit0MktNTWRaVlJoa2ZvNmp1QTNSb3hCL3Nm?=
 =?utf-8?B?Z1pFdWFESkRBTlNxc21HNUhxSEp5cW9Hc1JNYmRvcVJzdE0yQzNOZEsydzV5?=
 =?utf-8?B?QmUvWjhXU2thQkRpRWxWY09tTXlnZk9UQnRiRzl5OUZEamhsWUtocmhicU5K?=
 =?utf-8?B?cENRczNvaDdXcCs2cklLbjdzWW9LUFBUVytPUmQyL003RTJPZXczQWVLUUF0?=
 =?utf-8?B?L1JGVlpDMUFmdTQ5amp6dXZKOS80TjZqMEh0SmE5YlBxckRvTTMrcXZWaGhG?=
 =?utf-8?B?NjluRlZaT0NhaFRMaXVXcHJyMVFtQkVINS9PSUVNdlc1M003cDZocFJEaUNp?=
 =?utf-8?B?V0JvS3dCYkh3bXZNVXJuek5uRGVTRE1mTE5kb3lna2N2Uis0YWxUR25XOHBP?=
 =?utf-8?B?QlBFRyt1a3MrMEFTaGJ0SlA5bmJIdGkvd2dHTHBEcDFXNkcyZE5ZWm1jaFNl?=
 =?utf-8?B?b1NlVDFvN0VVbi9vQ3I4NDUrdldNYWdjZ0tzRGEyOWpBeEloYWJmd3VneUZP?=
 =?utf-8?B?SlZkUnlPVkZCMWVwMFhzZ2o0Ri9SeU1yVWFrU1dqdTArdk0vbHJqY3c4Zjk5?=
 =?utf-8?B?UDBpWm5HSFd4Vnpyc240Rk1nSlhtQkpMWEJMR3lkUEZmSC9KakJMUWZXZ1BC?=
 =?utf-8?B?K1ZMOE80aTNlN3FvWUpjaTVBVzFoYk5Yb2hYZUh6RWFSUEIrSEN6VUtiRWpX?=
 =?utf-8?B?TzZYQ05jenBFNHMraTh4VE05RURsVlcyWUxDMHNXU2laUHAxU2JlZVJrTHVI?=
 =?utf-8?B?V3hLRzVhaVNXZFJvZmp5REd4QUJJck80d0NnTSt1b0Zzdk5CTFJrMXlkSE9W?=
 =?utf-8?B?UXBPc0VSWmxjbm80bE83RzV6dFpxZTBmZHVpZ1lBeDdlMWlGN2FhWHNPd2N6?=
 =?utf-8?B?TVlJN3M2UDlrRkFpU2orQjBGY2ZIdVdDd2drRXRqaGVOY29lRXEvaTQ5ZStn?=
 =?utf-8?B?S1VqdlhiV09OM3lPK1dZZlJjYkZqenkvNnpGTW5HbnlEelVJei94bjVmcmNJ?=
 =?utf-8?B?ZEdEcTBlM0ZLTUpPNTVLTVhqZVA1N1VSenhoYmZNR1pFcTRQOFRSaXhuc2RJ?=
 =?utf-8?B?OFNDdHF1UGFRM3U2Z0poZVBtZUZUY2x3bnMzUGYzRE5DQWJQVHdoSEdEa1pL?=
 =?utf-8?B?RTVjN2t2c2JFRHNwa2JSSFJWSkNNRXpBZHVuNFNPQkh6NWNXd2tpTWp3YnUy?=
 =?utf-8?Q?Uc7frFGwHxsNK0vZoh7Khsj+TNV+1c=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aHA3bXg3emJlMzhZNHJSNG1GTDRyRW1VU3BzNWQ5ejl3cEp6N25pVzRCSndw?=
 =?utf-8?B?ZzFSRVo0c0t1akpUNnFxdTJiQVlrTnFBbjYyNzRxN2lzOThZakpyTFFjOWpo?=
 =?utf-8?B?eHpjRWJGYytxbnhvMWVNa0Z4RlV0d1hRM1RrMk1pNzJoajdhbTUvejdyWC92?=
 =?utf-8?B?QVVGV1BsK0tZT0VIOTdMY0RJbmwvNTNNS0h0bW1FalJ2TUppbW9zSlFtZXJ5?=
 =?utf-8?B?bVJGamhtK3NMTG5kWm4yRVlqVGN3VDdxVlR3SWJ3eW9LMFpFTnNsOHFxWVFz?=
 =?utf-8?B?Z29WSUp0cjZqWkFyL2dhWEQxSkpiaVpnR0JtTDZVN0lmeWxGVDJBMUgvd0M5?=
 =?utf-8?B?MTRmTEp0U2gzQWgzRlBuYm5SbE1CNndnZ2lYWW16TVlSTGJEejdxVFc1OENt?=
 =?utf-8?B?alM1WDBJUzA0bFVXS2ZvQTQ5MWVLVXVUMEI3SjFvQUVycFlZMWh0R1RzejNt?=
 =?utf-8?B?UU1yak1xbldYc29IeER2OHFKNE1NR0R0U3M1Z3U5SHFDYk0wNkMxNksva2V2?=
 =?utf-8?B?ZkVvUVNhVHc5a2haRVRscGUzeXhrWXFRdFhwdnZndDRtYzdZblhoKzZ5SENS?=
 =?utf-8?B?cy9rSnJYbnpKMEdIQlE4TE5vS21lcks2YkVIOGJVaXNMWHNldGJUT1FQOCtJ?=
 =?utf-8?B?elk5TG90M2d5eWFXdFpxdWtJNEtlZlFxdFVOdDBabXpuNE5aZXoreENBbzNI?=
 =?utf-8?B?VmpZRnVJWVRsZHBtOVJCMkVmWFYzME5nTTlnVjdCbUswMFJ6eXJuNUFURlZz?=
 =?utf-8?B?ZFZDV3ZpU2R3STg0cGluTHpYWVFMS1UyT05SeTFXQnNuOWh0aW96QkVOODVt?=
 =?utf-8?B?RUIrTFNWNTNzTDkwQWVHdk9MRlpDci82bmJ2KzZTUG5idjhiTytNRktzMlVl?=
 =?utf-8?B?NVk4ak5CZm9QU0RZaExSWTFEVURNSzNGelUrNUh5aU13M2hoWFp2NFdPd3pv?=
 =?utf-8?B?VzRuMWg1bEtHTndncHVwQWZYUW5JdldwQnNuTndGaVljYktjMmxqVWhaeWdF?=
 =?utf-8?B?VFAzMDhCeHV1Q25oZUxhbkwzRXVkbVZzOXREZWJ2eVl4M3pEcm41T3RzbDU4?=
 =?utf-8?B?U3FSZkpGK3BUa1FiVHNEWnJBZWV4QlI3ck5oN040UmtFUHNYY08vSGFNN05u?=
 =?utf-8?B?Y095ZjQ1RGNvREMrNVRqaEt1c1hQTytnZXdJQTV4MlhrcDdkZ2dmbnZsTGFV?=
 =?utf-8?B?NVB5K24zbXZvNk15L0J0Nk1FMEswZ3Q3K2RqbTV6a3o5NERyL0RsK2Nsamov?=
 =?utf-8?B?MzB6aEtqcHpua09Kc0ZxdzkwZnNLV1o0M1FoaitPNWRwMVFiNmtSZjVTaTRF?=
 =?utf-8?B?ZS8wQW94d2xncXhGb1VlS0FCcElKV09qTE9zZGlWZmhjVGRDblBSSW0xODRW?=
 =?utf-8?B?NXJOR2J6UmFqV2NaQlNUeUhWWTN3YmdGSUJuR3FYTDR0Y05uZlV3ZE81RHdm?=
 =?utf-8?B?M1FCZmxQMHhXSWFKbUgraTJkR3Z2UjRPeDF2cUo3c1VaR282VjJPV3JLeUJN?=
 =?utf-8?B?TzBPVnlEalUvaHVGR1U3ajdjaG9MYjJRbmNqQ09mT0VOMHk0eWNKZ1UwM3gz?=
 =?utf-8?B?bitQVVZHME9obXpJUEJFRE1tTENreFJ4cEtWM2ZOQ29TMTU0cVVnaHRJMUt5?=
 =?utf-8?B?N0VJdzNyNkRBU2NRVk5pN084b2xzR3paWEhyOEQ4R1B1bElaRkhrQnJic0pm?=
 =?utf-8?B?VzZkeDMwTkZyeTIxSDZ5L1dBSVRrWFQyUzBWSGtCdDBJeVVZbUFwaHBHQmFz?=
 =?utf-8?B?b05QV0NyN3p6b3ZWMm5MNCtZa3ZTN0JxbU9wb1owbWhPMWlENVVVeUh2eFVO?=
 =?utf-8?B?TnNVcVRoWmFoeTNzVStjT3UvTmpjZSthUTlWS1BUOTJiY2lnSVM1L0FYSXpy?=
 =?utf-8?B?N3BaWUJ6RWVSU3NPU0t4ZWVMNHRMTkJCNENoZDJ1N1JCNEFWSGtrbEpxL1B6?=
 =?utf-8?B?RjBDdWpxb2VPSEZmY3htRS85R0k3Qy90Y3RaeVdiRWdmdmtpb1RCZ2tKWm9m?=
 =?utf-8?B?bjNBM0tVK0FSaHRZK0dYRm4xeURzSERJNCtyVE5NNUY3RkZUQ1dycjY0cXFj?=
 =?utf-8?B?d1FwanVob1hWVUwwWTZ6cXNJb2VuQ0kxanI5ZEM4dHFad2pZcDk3T3Rybnln?=
 =?utf-8?Q?P/hllGtk1EbMAU4553zBLJ99P?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c84bb3d-b0ff-4def-f420-08dda49d702c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 01:57:05.6478
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: umvoKHBF7zEVxJA2izNMu8Dx/pjhnrlTQcr8S3ycACd0GHGtVB0XLarQ0R5+7CCljgcXPm5MiqmWYzloyj1Kag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9657

From: Peng Fan <peng.fan@nxp.com>

Add imx_rproc_cfg_imx95_m7 and address(TCM and DDR) mapping
Add i.MX95 of_device_id entry

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 8fe3c76c9b30ed9e66d4e8c8e2e178a21f3b5bd2..53354c634d8a2e03e6064830cca4ead66e2eebdf 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -128,6 +128,18 @@ struct imx_rproc {
 	u32				flags;
 };
 
+static const struct imx_rproc_att imx_rproc_att_imx95_m7[] = {
+	/* dev addr , sys addr  , size	    , flags */
+	/* TCM CODE NON-SECURE */
+	{ 0x00000000, 0x203C0000, 0x00040000, ATT_OWN | ATT_IOMEM },
+
+	/* TCM SYS NON-SECURE*/
+	{ 0x20000000, 0x20400000, 0x00040000, ATT_OWN | ATT_IOMEM },
+
+	/* DDR */
+	{ 0x80000000, 0x80000000, 0x50000000, 0 },
+};
+
 static const struct imx_rproc_att imx_rproc_att_imx93[] = {
 	/* dev addr , sys addr  , size	    , flags */
 	/* TCM CODE NON-SECURE */
@@ -374,6 +386,12 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx93 = {
 	.method		= IMX_RPROC_SMC,
 };
 
+static const struct imx_rproc_dcfg imx_rproc_cfg_imx95_m7 = {
+	.att		= imx_rproc_att_imx95_m7,
+	.att_size	= ARRAY_SIZE(imx_rproc_att_imx95_m7),
+	.method		= IMX_RPROC_SM,
+};
+
 static int imx_rproc_start(struct rproc *rproc)
 {
 	struct imx_rproc *priv = rproc->priv;
@@ -1315,6 +1333,7 @@ static const struct of_device_id imx_rproc_of_match[] = {
 	{ .compatible = "fsl,imx8qm-cm4", .data = &imx_rproc_cfg_imx8qm },
 	{ .compatible = "fsl,imx8ulp-cm33", .data = &imx_rproc_cfg_imx8ulp },
 	{ .compatible = "fsl,imx93-cm33", .data = &imx_rproc_cfg_imx93 },
+	{ .compatible = "fsl,imx95-cm7", .data = &imx_rproc_cfg_imx95_m7 },
 	{},
 };
 MODULE_DEVICE_TABLE(of, imx_rproc_of_match);

-- 
2.37.1

