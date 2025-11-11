Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012010.outbound.protection.outlook.com [52.101.66.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D5E34A3B0;
	Tue, 11 Nov 2025 01:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762825330; cv=fail; b=IrkWqqG/4Ttxkalf2RBEi+9ALFxCCQ/WLl7s7Gp80GHoE4somFe01FHhiTYqiN3raSXhL5QONUauZUi0UFP6C2wnXFH5SCFzxnjzvJsxHe1PMj4zOp06oDR/tgkIrYIJ0r/Ov6j6tQwPRV9j5ghHwaxhAEE5Z7onL+3WNRoRPWE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762825330; c=relaxed/simple;
	bh=3skxHG5eTvTfqhxA6se84MamT3XZ6yUVVsdpc9To+cI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=D/B3/uPU1kKUNIeIYe1Ob+8zCrNbYhfmTN3At60S+lXDNJScNmYNsdIui6RKvlyNICtyvdJLRp4UJSy6QiExeI8c33ShdZuvCq51qZAQPQkv9UWmMFRDcPbK/Kq7Z3e1kTSfSvJyQ5RmgGlYofQjGI9cLiLDuSFoVeGkfmErKvo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=CA8mcEFI; arc=fail smtp.client-ip=52.101.66.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="CA8mcEFI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LAD66I91SABbqQcsGrwXDh0KCF9c/oHoIs2gzK2+VR3/XXSumuyRlVRaClG3atDyhtu4OcFpcfk8nR2Ag5Q931R8Y1jtpUNoRffB1f54b2Fd2u6N62DLj0+QIpX3FJZj4pVETIo+E8OqrYvTQe/9FWy/gfEZJ1yQPtAeI5+juFItxPl6GV5A/pluSYD9JFI5LS+ypiBCapi2L7RvQTkxpqnx1Ebv7qDJ+IWLhPS6tk8LIdAaGRCdP32nc0nyMDZllssvJYsbzm7Jtmh8wVIiAq5ClJO5LbE+Pd1w+Jq9foBKQZPU8zA5uzOG1oLnNExt9hP4yj59A9PTMx8vAxyH8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qdEbKpQBjO6zYQ4fL7uDVaCSR0keCG4Jka1GdP0gWHg=;
 b=ZM/vQf9kHbIuDy5AXNmkuYhGIj0KTQ+485QGkeR6odJi4MGY5rpCpwSLYGkHp+OwdxodU5oUcZCVeZRptVWCSoQSRX9HlPkfwptZH+WmNoIC11FLIa17s/0zmIx0gpGudLjbfhDF13sVtyMC1LvJIVN7/Zi3h+kX971xeYzu9kWt9Jzd8H0WYX6szcLS51jp7XvL2NoDXeVrFGmiU6RWmIyta8jgT6y4huYCVlrBoBag7agKalVAM9+gJJIdqrWCHsBGWqJ5dmhxW3eTtGpRDVCB0JZkthw2IAqnh42DnmnALWgsyd1m0x3HZJph1tDC1kT8eJPJcEjZm1DLXC6HLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qdEbKpQBjO6zYQ4fL7uDVaCSR0keCG4Jka1GdP0gWHg=;
 b=CA8mcEFIRLyq4BqrixE9rFWMikc5x0wZe1FLhRB10x08v5LuI0A0X7GJDbCW6qM/yGJITv+gyCj+O69VB1TnGPe4/1CRoF8Dkfa5Kw0NrpDnHRLo3Y6AmbPWhgM/ixfVyPd9AIjGEbMMtxo8WZjE7dKrAcr3sXLP4BltgYGRk2fe+nT0OTzf2W6Er+0dEGtmleQj91OrZbwsRrjoBLoMpnpvOExFXvrI5MMJwHQu5QhMU6K4JOwrzcis6pUVzOFpvy3uw0YjXGENvL7t+FNUDoNJlWfl1wOnDml+r5+ds7p5lYNU4oo0cR3py3J7Chk5riJbfu51shS2WDnm0FSCIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB8039.eurprd04.prod.outlook.com (2603:10a6:20b:2a2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 01:42:04 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 01:42:04 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 11 Nov 2025 09:41:19 +0800
Subject: [PATCH v3 08/11] remoteproc: imx_dsp_rproc: Simplify
 IMX_RPROC_MMIO switch case
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251111-imx-dsp-2025-11-11-v3-8-d05dcba737fa@nxp.com>
References: <20251111-imx-dsp-2025-11-11-v3-0-d05dcba737fa@nxp.com>
In-Reply-To: <20251111-imx-dsp-2025-11-11-v3-0-d05dcba737fa@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2P153CA0017.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::10) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS8PR04MB8039:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dd9b37d-b843-47aa-4d10-08de20c38414
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SDF4RGVSNTI2RzBDLzdVR3cxUElKS0dneWhXTFd4L3ZZb0d1KzA4bU5aZGxY?=
 =?utf-8?B?N3NWWEVRekk1R2FPdi90c1BzVUZYeHlTNGQ3UXFTN0pGOEFxL0krcEhjMlpq?=
 =?utf-8?B?WHcrcVpLODlpTExNdGltZVFhTTc5MUZBc20xVFlLWUNUS2RXS3BXaEd1bmRo?=
 =?utf-8?B?aUIzdVVXNWs0a1RuWjlZMzBiNWhtelZXTnVFWnI4UzhJdHgyakhRSnR0M0VW?=
 =?utf-8?B?SlRwb1VMNzh2M2tuaCtrNkRaNk51Tm40bjkweDl5YUlFT2txM1U2K1ZzMUN4?=
 =?utf-8?B?MlpIVTBLcGxtZXVhNjdGYlhjRG1oS0o2TUE4dHhGOEFnYlhUVFNoQ2t3UC95?=
 =?utf-8?B?Q0VWTGZFSC90djk4QjZXbW5ZK0VJYmNWQkRiMW9ramNORERyTjlmQ3hTLzMw?=
 =?utf-8?B?YnBrTWpNZVlxWlRSZmh1Z2VWYVdLVXVaa3dNU0RsMjUxOUpJdHlwN1JaaXFn?=
 =?utf-8?B?c3JVY2JlUUpaUkREaDhEYjdKdnBEMWcxN2xrbHlpTGNLeWJTT0lJQWxSeEds?=
 =?utf-8?B?QnV3U3BZenlrVzh5cXlEZUxCbEZTQmdvYTNHL0pSSk9XQXpDQXFZbTJtL3dD?=
 =?utf-8?B?M2NKb0ZMVXo3QzhWU3paNm01SnhUcDBIblZiV1NpZjFMQ3FpOHJ0OWEwMG5u?=
 =?utf-8?B?L3FxWHhDTG9QcVEwY1VXcENPR2dNeWxLZEQ2TkdzNk1IZFJBRllpcnUycEJx?=
 =?utf-8?B?UVdvU2JZbnJhWUc4Y3hwb1lwUGQzYzh5L1RSRzlaRi82UWNaYUp4a1dhUUlT?=
 =?utf-8?B?WGduWDdRYmJoWXJNK0N0dUthTGYxL3RLRmwyaWc3QnV2Zk9YSXIydmRnVjJM?=
 =?utf-8?B?cVJnODRkK01KdU5mTk5LUW1PdE1tWHdBYlNaSVA3YkxrNm1mZmtQNlRPY0hu?=
 =?utf-8?B?NW5Cajh1UG1EczBrYU05dFZZWi9rUXFoOG1GVUUyQjF2YWRtRngxZllmeE9V?=
 =?utf-8?B?VkdmSFFYQ05ZNnQxcXFwNzNEYnZrd3NvMmthcGtBY3RrT2drS0tlT0F1dTFC?=
 =?utf-8?B?QlJqcnIranpNdURpdmlPV3RjZ0Z2S3l1OWg4ZmcvVWpQOWtIK3FVQ2dsSW1p?=
 =?utf-8?B?ZXJEeU1QMjl2dkp4UFFSL2dhUGl0dDlBQVJxcjZjRkNCcXAzeHZxMTZsM2Fr?=
 =?utf-8?B?QVEzV0lmR1I1cldhR0c2WlROM1FQbG1KNW9GQ2IrS3RqQ1VXSDhzeXEzRHI3?=
 =?utf-8?B?Sk9CZDlLMjlVWDlKZWJMdnZ2YUhkc3A5T0NVYUhMcjdDK2JmT1NsdnZobVd4?=
 =?utf-8?B?dmU3V3NwYXNQQWNMcE5ocUZQNGh5NXEvSHZDcTFrcWhmaC83emdJSmxUWHQ2?=
 =?utf-8?B?aVdpbUVPKzBPZjFxLzhwYW9XSkpEZFNJdnJYcWpwbTJicjdpWk5RTTIrclF6?=
 =?utf-8?B?K0U2S1NXSDc4d3k3QlNTeWl1RnlrYjZxNW5VdTZpKzJYdnpoV0xPZ3Zydk4v?=
 =?utf-8?B?MHVRMkZNUkVkVUd6cjF6c2JDVVkxUkFGd0JSVi83M1E4Y0pzdHlDbVlXdTU0?=
 =?utf-8?B?NkFtM0M3L0IxUXl0MjhFNlljZGdKT29teGdrVGxXY1I4YXYya2VrdXBRRGRQ?=
 =?utf-8?B?cndxWUJ5NFYzbXcraGwxQ1RjS3RTdmJ6TUF6TTIzT2lCUGJwREpjWEVzTW1i?=
 =?utf-8?B?b1Y1UWZaSnAyNjJOZkNwU0o4OGpIQ2trcWF4SmE2SnNuenpRak5kL3dXRm54?=
 =?utf-8?B?WUtmQWRHS0xueDU2UnN2UkdOdnZyVVJ6Y1F2Z2hkc0xocENPSm1TVnBzN0I2?=
 =?utf-8?B?djNWOXdUeFBPdW9yYUdubU1NZW9MaDk3ZlhnS2FEakZUbGRIT2U4V2VHWVJt?=
 =?utf-8?B?M21CaitxV2VnbmpiMG9BdGs2MkE4eTkyV2VLa2NkVVhuOVppanJmd2I5SEU5?=
 =?utf-8?B?bTJteTNjMkJjald6K3NrWjFTQVlFWXQ5UEpnQ2NhZ0ZZVmhSYVhaR2prc2M3?=
 =?utf-8?B?bWVEWUtDc2NUemtVTURXUVNpUjdoS3NrUkxZSnVxTlJ3dmdLcEVERWdRcUYx?=
 =?utf-8?B?Z1lJT3lpOXd4RDFkd2JIamcxSTBVVngxdHZyU0hPencxSnRWUFZ4dEJxZ21E?=
 =?utf-8?Q?CHsron?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TGhnSnZrNGUxdFlOMnBYRVVXaG4yNmQwNXpNOVo4WXdWanJFZlJDR0R0SGl5?=
 =?utf-8?B?cVhHelM4UDJGZ0FJNDgvODFtOG1iTDQxZWpwTHgyZjFRNUVRK1BaRjlEaHBz?=
 =?utf-8?B?NEQ3dUZzdEozVWtmVjNpNi8zY0REN2VCY3oxZ2NKbTVuVlEzNEZ0N21kQVZJ?=
 =?utf-8?B?SHZBWExMOTF0cm1PWEpqT2lsSVF4akYwWlJIMnlLZjltMmNqVjdOR1UvWGNE?=
 =?utf-8?B?UU9FQko5UGlyNHFDSm5ZNnE4czJJMVpvTHl2YTNlMFRzd0h3L1JRc3AyWVFw?=
 =?utf-8?B?Z3E5NGNFQWVVd0Z0bTRYMldMTkJxa2tGTGJWVmh6U2xCNktWcFZMR1lQM2sv?=
 =?utf-8?B?b0RqaWprdDI2Q1g3Z3Jic04zMW1tR0tUZ21pS2JPaDh4bW85MW0vMnlZcGRX?=
 =?utf-8?B?eCt2dmVXbVRJZVdsS3VVU1BxTDlvTmJSRmhjdUNhdGlkSlJOSUdrR1pGM0lm?=
 =?utf-8?B?UE5RZXk1TVhMd2pvc1JJZVBZby9XTlZFVmNnS0cvZVVHQUtiN2YrSFF5NUEy?=
 =?utf-8?B?Yk51OEZUTFg0QVVOSDZQaFNCVU1ZZmwvcTlBQmlvOS80SmRDeGJiT0tSeEhI?=
 =?utf-8?B?US9rd1NuMk1wQUlmSXNEUE1wdkpCTjlKMnhjSU9UWXlKaWRhZnBCMjR5WWpZ?=
 =?utf-8?B?NXNLMVhDRzF6ZTZGdWVNb2hOYzYxRDN6TTdJMlBKL1R1NEcyYkJ6UWU5U282?=
 =?utf-8?B?VFJLMFNyUksrM2tRbE0xV1lDRVBaK0htbG1odEJoYmdhRC8wb0RBaG5BbUZm?=
 =?utf-8?B?UWhNSGxuVlppUzMyejBNdFJ3alh4MnpVaEJMakw2T1FLMUtMaEQ3YUhaWERj?=
 =?utf-8?B?bTUzREVmd0VhZjMrMWRHRkU2Z29ZeVcyYnJnZ3ptakQ1THVkSktlN1RSU0c2?=
 =?utf-8?B?enFLN2o2WmtYWVB2NC8vVzZGbjBpUnVVbG51MU4yLy9qdyswQ2RYNFo3TFZq?=
 =?utf-8?B?TStpWnREdjNkQ0UyeDJCMWpHZDFWNzdxKzFwQVRMdGlrYTYwdUU3b29mNG1o?=
 =?utf-8?B?VDluYXJESWdoRU5FVlJ1L2lQUXFpUTJKUnZKSk93OGZYWjRlTnR4TG84cXJ1?=
 =?utf-8?B?aUVHYXRTVWxuRWxOeVoxU285UHo3OUpCbStNRS8ydmw2WTI4Sk1Da2Y0WkFu?=
 =?utf-8?B?QjhvY1YxaTFVeTJQZW9PL1BZQVVUVldVWHZveStGWTdIL09RUXdkTW9GVFVB?=
 =?utf-8?B?bUUwTnN0Z1NER2RXcVJua0ZodGZITmZ0d28wZGxiRXJNY21BODRkR2QvYXpZ?=
 =?utf-8?B?MWNGdm4vUC85Z0thUXRZdi9rNnFkN0szeTRNUEYwRDJhbWxnbmxJOUxiS3gw?=
 =?utf-8?B?Z25hMlB3dktsa3RYQ25Vd0F5V3VxNjd3MVN2azgxaHc0Z1BzQ00rdTFyRmN1?=
 =?utf-8?B?d2RhUHR0dWtnQ3pQOEhJYVYrajJ1MVVud3pObVhaUC9udkNhb0h1dEdnUlpR?=
 =?utf-8?B?RGpiWGdvSmVKVFhCS1IzWis5K1BGeEZtaTZuZjZaYXBVb0ZrWVhnS0c5R3VX?=
 =?utf-8?B?WFBmeStFTzkwVVMxZHhWWEppczE5eEU0Njc1RFp6ek5mM0FPVUgxdWQ3aTFk?=
 =?utf-8?B?Q1I5dERROTl0VFFocWp1V1JaWHpFK0V5czh3YkgwbnA2MXVJdlFpbHJWRkdO?=
 =?utf-8?B?STVSc2wrK2Zib3BFbkl6QVV4bC9NdkZFbnIvN3N6dGZ0RStMOVJWK1k1MHVS?=
 =?utf-8?B?OWJ2dXlicWZQcDg3QURvN3NyaUZXV0tWQURBbXRmQ0dBSXA1L2hiT1NSVUJS?=
 =?utf-8?B?Q2t6Qzd3b3lZQkM1S0svVGNpUTcybFNhaHZkTXVNQWVEUWplL0pKVkJEMVd4?=
 =?utf-8?B?aHVpcVRNTTh4MDN3dEYyQmVoYzVBcUgxSXVSOGI4b1FiSlhYNGdNeGFLZGY0?=
 =?utf-8?B?dmMvdnVScjA2UThsbzh1VUs5RGdWYUhKRkp5SGQyQVFxODlkU1NTWHozSjhn?=
 =?utf-8?B?Q3JtY01abHc4VHhSM1lKYS9ORElDU0tEdFZ4MjJkSWk0STVoemFTVHF1c1Bp?=
 =?utf-8?B?ajdFU0NpNHF6K2FDTHByM3FRUjFBcVFoK3hVMG9KWWdLdVkwSTBzeTN0UnI0?=
 =?utf-8?B?eE91cUVmM3lrVGN0Nmc3TThmdUl0cVVDK3l4WkU1L0RMdXpkUDBCY3JRenhB?=
 =?utf-8?Q?6mhq85MLtO8WQRoQ9J1H/Ecqm?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dd9b37d-b843-47aa-4d10-08de20c38414
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 01:42:04.1536
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WMWI3IKsa514za7jxIichcL2PWvI9vcaIVxI9iqwO1ofcwRPMjz4Z98D0n3wmWbKaOQqnnpfbdtZp9ZN9C2Z4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8039

From: Peng Fan <peng.fan@nxp.com>

Introduce imx_dsp_rproc_mmio_{start, stop, detect_mode}() helper functions
for i.MX variants using IMX_RPROC_MMIO to manage remote processors.

Allows the removal of the IMX_RPROC_MMIO switch-case blocks from
imx_dsp_rproc_[start,stop,detect_mode](), resulting in cleaner and more
maintainable code.

No functional changes.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_dsp_rproc.c | 61 +++++++++++++++++++++++++-------------
 drivers/remoteproc/imx_rproc.h     |  2 --
 2 files changed, 40 insertions(+), 23 deletions(-)

diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
index f28d25cab3f1d89e5cde37a04b528870a59abeed..71776816c3508a86bf7b8a09ac45827a83a7bb3a 100644
--- a/drivers/remoteproc/imx_dsp_rproc.c
+++ b/drivers/remoteproc/imx_dsp_rproc.c
@@ -338,6 +338,14 @@ static int imx_dsp_rproc_handle_rsc(struct rproc *rproc, u32 rsc_type,
 	return RSC_HANDLED;
 }
 
+static int imx_dsp_rproc_mmio_start(struct rproc *rproc)
+{
+	struct imx_dsp_rproc *priv = rproc->priv;
+	const struct imx_rproc_dcfg *dcfg = priv->dsp_dcfg->dcfg;
+
+	return regmap_update_bits(priv->regmap, dcfg->src_reg, dcfg->src_mask, dcfg->src_start);
+}
+
 /*
  * Start function for rproc_ops
  *
@@ -360,12 +368,6 @@ static int imx_dsp_rproc_start(struct rproc *rproc)
 	}
 
 	switch (dcfg->method) {
-	case IMX_RPROC_MMIO:
-		ret = regmap_update_bits(priv->regmap,
-					 dcfg->src_reg,
-					 dcfg->src_mask,
-					 dcfg->src_start);
-		break;
 	case IMX_RPROC_SCU_API:
 		ret = imx_sc_pm_cpu_start(priv->ipc_handle,
 					  IMX_SC_R_DSP,
@@ -388,6 +390,14 @@ static int imx_dsp_rproc_start(struct rproc *rproc)
 	return ret;
 }
 
+static int imx_dsp_rproc_mmio_stop(struct rproc *rproc)
+{
+	struct imx_dsp_rproc *priv = rproc->priv;
+	const struct imx_rproc_dcfg *dcfg = priv->dsp_dcfg->dcfg;
+
+	return regmap_update_bits(priv->regmap, dcfg->src_reg, dcfg->src_mask, dcfg->src_stop);
+}
+
 /*
  * Stop function for rproc_ops
  * It clears the REMOTE_IS_READY flags
@@ -411,10 +421,6 @@ static int imx_dsp_rproc_stop(struct rproc *rproc)
 	}
 
 	switch (dcfg->method) {
-	case IMX_RPROC_MMIO:
-		ret = regmap_update_bits(priv->regmap, dcfg->src_reg, dcfg->src_mask,
-					 dcfg->src_stop);
-		break;
 	case IMX_RPROC_SCU_API:
 		ret = imx_sc_pm_cpu_start(priv->ipc_handle,
 					  IMX_SC_R_DSP,
@@ -1032,6 +1038,23 @@ static int imx_dsp_attach_pm_domains(struct imx_dsp_rproc *priv)
 	return devm_pm_domain_attach_list(dev, NULL, &priv->pd_list);
 }
 
+static int imx_dsp_rproc_mmio_detect_mode(struct rproc *rproc)
+{
+	struct imx_dsp_rproc *priv = rproc->priv;
+	struct device *dev = rproc->dev.parent;
+	struct regmap *regmap;
+
+	regmap = syscon_regmap_lookup_by_phandle(dev->of_node, "fsl,dsp-ctrl");
+	if (IS_ERR(regmap)) {
+		dev_err(dev, "failed to find syscon\n");
+		return PTR_ERR(regmap);
+	}
+
+	priv->regmap = regmap;
+
+	return 0;
+}
+
 /**
  * imx_dsp_rproc_detect_mode() - detect DSP control mode
  * @priv: private data pointer
@@ -1049,7 +1072,6 @@ static int imx_dsp_rproc_detect_mode(struct imx_dsp_rproc *priv)
 	const struct imx_dsp_rproc_dcfg *dsp_dcfg = priv->dsp_dcfg;
 	const struct imx_rproc_dcfg *dcfg = dsp_dcfg->dcfg;
 	struct device *dev = priv->rproc->dev.parent;
-	struct regmap *regmap;
 	int ret = 0;
 
 	if (dcfg->ops && dcfg->ops->detect_mode)
@@ -1061,15 +1083,6 @@ static int imx_dsp_rproc_detect_mode(struct imx_dsp_rproc *priv)
 		if (ret)
 			return ret;
 		break;
-	case IMX_RPROC_MMIO:
-		regmap = syscon_regmap_lookup_by_phandle(dev->of_node, "fsl,dsp-ctrl");
-		if (IS_ERR(regmap)) {
-			dev_err(dev, "failed to find syscon\n");
-			return PTR_ERR(regmap);
-		}
-
-		priv->regmap = regmap;
-		break;
 	case IMX_RPROC_RESET_CONTROLLER:
 		priv->run_stall = devm_reset_control_get_exclusive(dev, "runstall");
 		if (IS_ERR(priv->run_stall)) {
@@ -1301,6 +1314,12 @@ static const struct dev_pm_ops imx_dsp_rproc_pm_ops = {
 	RUNTIME_PM_OPS(imx_dsp_runtime_suspend, imx_dsp_runtime_resume, NULL)
 };
 
+static const struct imx_rproc_plat_ops imx_dsp_rproc_ops_mmio = {
+	.start		= imx_dsp_rproc_mmio_start,
+	.stop		= imx_dsp_rproc_mmio_stop,
+	.detect_mode	= imx_dsp_rproc_mmio_detect_mode,
+};
+
 /* Specific configuration for i.MX8MP */
 static const struct imx_rproc_dcfg dsp_rproc_cfg_imx8mp = {
 	.att		= imx_dsp_rproc_att_imx8mp,
@@ -1321,7 +1340,7 @@ static const struct imx_rproc_dcfg dsp_rproc_cfg_imx8ulp = {
 	.src_stop	= IMX8ULP_SYSCTRL0_DSP_STALL,
 	.att		= imx_dsp_rproc_att_imx8ulp,
 	.att_size	= ARRAY_SIZE(imx_dsp_rproc_att_imx8ulp),
-	.method		= IMX_RPROC_MMIO,
+	.ops		= &imx_dsp_rproc_ops_mmio,
 };
 
 static const struct imx_dsp_rproc_dcfg imx_dsp_rproc_cfg_imx8ulp = {
diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
index aeed08bdfb5619c7afd7201589f417cfd6745818..912827c39c0dedeed76c13740efd42a8e7cf9c45 100644
--- a/drivers/remoteproc/imx_rproc.h
+++ b/drivers/remoteproc/imx_rproc.h
@@ -18,8 +18,6 @@ struct imx_rproc_att {
 /* Remote core start/stop method */
 enum imx_rproc_method {
 	IMX_RPROC_NONE,
-	/* Through syscon regmap */
-	IMX_RPROC_MMIO,
 	/* Through ARM SMCCC */
 	IMX_RPROC_SMC,
 	/* Through System Control Unit API */

-- 
2.37.1

