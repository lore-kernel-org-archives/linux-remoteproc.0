Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011021.outbound.protection.outlook.com [52.101.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BEE21FE46D;
	Sat, 20 Sep 2025 13:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758374100; cv=fail; b=O/k9lZ9DK9UbPCJI7GJJKhT2BcCeSLFiFTPF7UcT5hS8rpfc9jmufxk35YhNjqnVorYWkO2Ib9Hrs7DxhAmXLY2nAA82+hX4wqK87ubzGuISan6fxphnRHDAxaNzv1m/gkwKGgVs7hjY02Uz4YTkBZoQc1unlsluPAwPumKjSJA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758374100; c=relaxed/simple;
	bh=wM8JYYmxs+lFyCOykX3s7+w35W+xRG3Q7MCYzxH5FjQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=i88RwDrvH92XsmGrj0rlP3Nu285AIIszRjvXZo1j53o/6PhFtliACvDtqmnPJuec8nnlszFPGE7OYLJI/krGyKRj+9mDEbNf5lan2WoprY/8EZbR3UTbGaeXh714FBosiNgQkJqBMIy3e5x0p2rkxr33YkHWktehGDfyRL74i2I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=cg4PEoo+; arc=fail smtp.client-ip=52.101.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="cg4PEoo+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QvHCSP8TIo2qEGBSoV3hijaSH5RGsvXyf9Yf+s2t+chGx6Iq4+xdN4AQBwPKG611Nlvlj7TnwGANvEhMkrdELzvc9hDxLiuCCpNYAE0UxwOqQbuwLjrtbefRnIuVprYy1h6B5EzurYGDQVj2mld/aMQWZaUMBdB6YO4Fx9e2OPTyoI8dIQBBbnxVTtEKneMIrJOcKHfXXI2eMaPgrpUxWzOgMNrDVBkla11d7Mm/6dmtVKwPf7txOCrvEW3+c58ihyHtr5vOPAG5I9qv6vnOYQyLaiF0zXT+ZjLhP8fgExafV4x/Swx0Tpg7PVLQ5Y4q7UqI1qm923tyM3CMO9cpXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d8AuhvZmj906JvgKygWeMyeov9OFeG6E0X8bNdDBxis=;
 b=kVpoo2SdIDJkSLRi+gwoZ0a1ExTugfGiU4f7edM9gdNwh5mfuak7QbMsXenQ4xvMS36Bm9rcV4Gh76ZkBvn5ldHxC2eK4nIz9y/q+3bkMVneGG88abedbyhmAt17KJgP82fcPEgsi+lgMileNUyAz5h039MTWqqaT0ELYIh4a5AGf5tT5RQHVpKHDNtX9OC831K1cIPRuJPfAgG2DToNITLhk/L8H84uvvNvemNh4O7HvIvWh6D4YuX0vkgVTL1jNpo2Y9u90N5ASLobkLdV9XVP9QY/iXeH6Kzaq4bhTZrMXdALVL9tjjjUzTOkaeG5ttvhOOMFK1WjFrU9O2OO4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d8AuhvZmj906JvgKygWeMyeov9OFeG6E0X8bNdDBxis=;
 b=cg4PEoo+jv6X4rZWKN9vMqIcbxq+IBrHUMPafJnaVDLXyrgnvrDvryYMgG1NEjqF/W2FC2C3ttGH4BY6a2Gw3QT5SLQbcKkufEOirCGIhE9CXBnZHhWPhtoN5cQ86hhsCVDu44wD36SXBwGx9uisph0Xy46R3RXMvD5cBqUv5og3LqjOgNCtnHXYICcHJejB/8byV4qliUM6qUm9kBIQ5icAosKO7Lj17ElqurEc6BTO6TIUXCXEHBQnMaoC3ei7vyiX1sjhWWhaLzwwzfqMQkabPoFHoyUbGWeETPiv2USUQtBqnLqHyAmWqQ8H0z27qbWMMQBesWcDk9aY58G71Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB8833.eurprd04.prod.outlook.com (2603:10a6:20b:42c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.18; Sat, 20 Sep
 2025 13:14:57 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9137.017; Sat, 20 Sep 2025
 13:14:57 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Sat, 20 Sep 2025 21:14:34 +0800
Subject: [PATCH v2 1/5] remoteproc: imx_rproc: Simplify clock enable logic
 using dcfg flags
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250920-imx_rproc_c2-v2-1-3351c4c96df5@nxp.com>
References: <20250920-imx_rproc_c2-v2-0-3351c4c96df5@nxp.com>
In-Reply-To: <20250920-imx_rproc_c2-v2-0-3351c4c96df5@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758374085; l=4888;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=wM8JYYmxs+lFyCOykX3s7+w35W+xRG3Q7MCYzxH5FjQ=;
 b=qMpS3CwKb32f7jjNsegIfFOUziKrO9zNS0O/KOLY+dQEYB1EQVEYqaN/zkfBcsNGvkFximKCV
 woRPPowTskhCUPEhrXQFOOxADlJhLaMnALyyCMWVoZA7vKkDYCVlpBd
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SGXP274CA0003.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::15)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS8PR04MB8833:EE_
X-MS-Office365-Filtering-Correlation-Id: 88746d08-ae68-4f7e-54e0-08ddf847b1f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|19092799006|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aEdDMVRzZU9veFRKYXdBUExOdXZ1R0xITWVwR1FOUmVMaWM1WTNTTk83dzlu?=
 =?utf-8?B?S3J0TnBmb0M3aUJ4VHg0RVZUazdsNW11QjVrQlF1RmlzUzdMc1lhdVYzU0Jw?=
 =?utf-8?B?VTJzT0F6Q3pzRDdTczZGU1RFS1hCMXllcWlpcHNtNlJxRlhJcHA4bGxYNnpL?=
 =?utf-8?B?ZUxFKzhxZW5xRjNsQm9NOFh3OG5DNXBoYld3b1crSTd6TEQ1N3dSVTdsNHhm?=
 =?utf-8?B?dWdGc0dwRnkwd1QzUU9yaUUzTjI1bm5Ib3NvZ1NaU0xSVm9oMmFINzNnMFd6?=
 =?utf-8?B?eEgxZm11SHludEFtWFdTMnVxVS8remMzRU5oSzJ4RW1EWDZxeW1GMStDNlJx?=
 =?utf-8?B?K2JhZUoxQUNxY1haemI3NjNDNFhQY3ErbjRSR3hJMzFLOHljRW5VaUxhaURk?=
 =?utf-8?B?UUl6LzRLNTRlWjlFaHl4WmV3d3pSdGRHWjg2QmhEVGoxUTlFcm9kT09YdWgy?=
 =?utf-8?B?N1AzQ3Iyc0tmV3dSM3BwNWtQeGk5YitUbFZEc3E4ckhYRkpKVjFITUsrblRR?=
 =?utf-8?B?UEZMMmYrOVczd1ZPQWlvT1A0UTNRbVg1dU5aOVBiOVJMeVRIMFBYeG51Tjc3?=
 =?utf-8?B?cmd1ZnRqWittZk41TEFCSmRLaklNbG1WVW1kOUwwNXlQNGc1SUdrMGtCMEVt?=
 =?utf-8?B?bENjOTB1QXd3dkRKNDROWHZtQlVVZGpVK283SGYxYmtaTVcyTkttWlAvaWR4?=
 =?utf-8?B?ajdSTDl4MHpTWlpVenQ4RjlRbEtYanFmRnFESHMxV2UzUkQ4VmZFek1WQ0tK?=
 =?utf-8?B?M2UxcnhybUd6TmcycHk2VWNsQlhtS083dWJjb2VKU1lQV3ZWV0FmemxIZG9M?=
 =?utf-8?B?Sy8rMFZZNVlRTm1qUlBRSytGOFlPaS9xeWhUb2JuTzdMRHpEbzZuRE51Tkps?=
 =?utf-8?B?N3ZyS3VBdzF1QmxZbHBwOVJMNmVuS3BvamJoUzZRWjBERUY5UjlDWmtnUFhB?=
 =?utf-8?B?NjhxVFJEQkJrbWczVlJ4U0Jyd1kxeFh2cnNHT2xWWmRQSERCVVRSQTdrWXpK?=
 =?utf-8?B?dXE0L0xGcU14REJLL1JyeWhTbk5IOXZqQm1ma2pTNDBjZnZRMUlabUluSEZS?=
 =?utf-8?B?dkRGWXoyM1JiMnBQYjVmTFVSUUJxSmUyZE5BWVdSWk9SMnRRTHFDQ0VyeGZZ?=
 =?utf-8?B?M2VKMCtwOVgyN0RiVTVqUlpxWGgrb1JkZDdXWUllWjMrRU9BVTJCZXZaOTdV?=
 =?utf-8?B?M3dSaVAxQ2tGV3Y1QzMzNnBBTm04ak50T1pwUGhldVNRUFozYjJGSEQvOHRr?=
 =?utf-8?B?dDJpWVFPdytkRURwQ2x6RkNkRHZ5K1VmdTdMRmZxRFBHdzRXUkpBVTZpWVND?=
 =?utf-8?B?dDdUVy9QQTNGanBZL3lXSHpDQ2RVT1JDTVpCUzdzYndxNHBrNFo4aEhDV0cv?=
 =?utf-8?B?MEhPOEdhWk14dnhNNHBOSUFqZm10Nm9pUVJpYUF3THh1cjdiT29RWGpHQkc3?=
 =?utf-8?B?Q0pqenk2VXdCT2ozZWg1c1k4bjFwV1pCdWNJaXFwU1VhZ2VxR3hPeDdkN1VH?=
 =?utf-8?B?U1pwVDhqTS9zRWVVVDltd3Z4VjZDVmtzUnE5N29sQzBZQlRqcXp4TnBoRmUz?=
 =?utf-8?B?MjlFa3dUcjVNNkJpS0NaZ0dMUmF3eXpocmtLaUcvYUVpNS9oQitGSEQ5OXky?=
 =?utf-8?B?d2RYRHluVmxTK1F0WDN2QmVwS3pacCtXSVRsSU5FV0FyNEdsOEoraElZMllR?=
 =?utf-8?B?b3hkWWFXV0hTeCt3UUNNN0dSU3Zkai8xQUZLNyt4NWJNZ0VtTEcvWWxZSGVG?=
 =?utf-8?B?RDM0RHA4OXdMMmtaUmRKcW5JM1doQk9oYVA4OHdiVG9sN3dJTi9tRU5GamFD?=
 =?utf-8?B?Z1BscFNWRTNrZnhhVS9ONHJXL00xS0xHNzVRMlhwVWc5UXZaRUd2S2VRTmgw?=
 =?utf-8?B?Zm1UNUZIS0lRcHFLeW93UmE1NUJ4NlU5V0h6WDBXOHRpWmtuTThIWmR0YXAx?=
 =?utf-8?B?Rnl0bi9PRUpjUnVIMklkSUVtZXNob0dIZnZzcU5KWUtUNERLL2hQb3Y0Sk4r?=
 =?utf-8?B?djlaK3JNSjhnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(19092799006)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SVZWNGc3SU80b2VUQnlGSzVITkU4MUVPTjVYS3AyaFEweERRKytLWjNVYURE?=
 =?utf-8?B?MnVVdmVrOFdlVU15akdjTDhiSlczYXpPVVZOdVFQRFc1TmsyVXN0Y1lHRFQv?=
 =?utf-8?B?QkFrSllSMGlucWhMaHdkNm9ycjVvREpVNFlEVWhyZitNK0dzaktZUUdVMHRV?=
 =?utf-8?B?WUp4RlNuQTlzWkl1cmp0Q1REOE5CWnVVcWZmRnFHSm1BQlZuUlVEOG1zZzN4?=
 =?utf-8?B?NnhQb1VPOXRIU2xXeXBVTXNJdmcvbFBObFkycXdFUEJSVExkS2djNG84cDYz?=
 =?utf-8?B?RDlaVUUvT2VtWjBCaXdzZlhHcGx1aU9BZ0NqVXY5Tkh4cGRpV3ZrdG1xeTB3?=
 =?utf-8?B?ZXBaSU0yV1pLWmFvbFVra0t4K0VVdXZTMUU1aEhPOU1TK2RrQ1FoeFNEWUJV?=
 =?utf-8?B?ZmFjTk9hRkE1bjl2bWpsYW45OXRZWWY3TEtPL3VHdkFRTmxQcllCNUk1dWNL?=
 =?utf-8?B?WDZFUnVBM1J6NEZDMjFud0YvQzQ1WVVmcDlFd1BwbElkRjJxN0VkdGh4L1p1?=
 =?utf-8?B?QTh2QkJmMlZiWldJVDI3cHBISkxSSG9rdm1IdXQ1elR0dTNNREoxWWJWNGg2?=
 =?utf-8?B?a2V0bGsvUHhLMWMvM0wrRUJ1ekk0em1tTmFmNVJBVkpTZzVhSzRYNkpPYkZK?=
 =?utf-8?B?eXVkcWZBUGlvdVNKSGN6WWVERDNKYzJzWE1VTElBbnlNck9UNllJaHZBUStx?=
 =?utf-8?B?MGlwVmt4ZWtLenIzY1VGaXJGZzd1QTAxWm1YaDhQOHRuYnpDTEQ4ZXlESDFB?=
 =?utf-8?B?SllGVElsRTZ0NU1YTjdFVFV1WDY5VXVweW9RNVJTSlFUdzBidHRDb3ZPZmNz?=
 =?utf-8?B?U0Y0TE5ZUDFPMUNLd3ljeXB5MlhFcmRwdllnVW9QS2F2SW4zY0U3S0Q2ZGh2?=
 =?utf-8?B?OUx0WmZCQVgwOCtWNTVnU21jaGI3TFpFY05YaTQ2Y2x1NFNOMkt6YjEzelIv?=
 =?utf-8?B?dk9aVDF2RE9lWEc2bkRXelFubS9QTklQYkNPemwzNFJZUUNUMWZ0Y1BYOC9n?=
 =?utf-8?B?Vnhob2dQakMyQzBtazJ5VS9wVW5YUkJEZTl1RnZIMjBwT0tYSW9BOFN2bzhU?=
 =?utf-8?B?NWpieEx3ekRhSmFCUjNVdUJEVFZOaXFabmtzZ3JJakNJNlV0dnhrOXBCWDZQ?=
 =?utf-8?B?WVVOc0NCdVV6V2dGTHMrcWpXOENwOHpUUFlFTmg2Q2dBL0c5OFZRZmN1M3p5?=
 =?utf-8?B?d3RtMk9VTUMyVDdjZkxIOHNndUYreHlXWEp4RGZMSDVMZEQ5Y1BMSTJhK1NW?=
 =?utf-8?B?TFZSY1NXUkN0dWZacGNuWXltRHp4cHpvZXVJamg2a0VlUHppTFI1R3hNQ1po?=
 =?utf-8?B?Rzc2TEtJclpYbWVsZ2xvcTFzem1acnR2Tjg1TmUzNkFNTXhXZGpCcDl1UFRR?=
 =?utf-8?B?c2E5S3V5R1Z6NS9jM2U2ck04TWUyOHFpK0cxeWZ3NUtvdmNpdjRaZ1dLR2dQ?=
 =?utf-8?B?MTkySVhXbC9CeFNObnBqYkMxcU4yUXB1YUJENVVEQTJ4YTNCWlhLNlB1YnFx?=
 =?utf-8?B?Y2pjZk16bXBlbnVCQmtkNS8rbkdBbEx5MWFORXpSRngvbll6eHkweFlyY3NK?=
 =?utf-8?B?UGhVL3Q4T01tWFd3WG1FcnA1S3JmT1REK3FOYzB1a1VKc0pDdExkaEdYWFFv?=
 =?utf-8?B?WjMzdjArNnltbjdQKzY3TkxnV3F6d1dnNU9rTktYYXVveHJIOE4yVXZUQzlt?=
 =?utf-8?B?VVZmNkYxL3VqVkNQZUtaNFozTUNTZ1FhZW03NCtIRnRGMHYvK3pPQ0d4djV5?=
 =?utf-8?B?V0pDOE9IYWxDQUhJNnRpdG1VK2VJa3N1Z3lQUEp0R1dVczFwa0Frcnd5czJJ?=
 =?utf-8?B?SElUV3JIWEZ0c3JoK2ZvMnFRM2JQdCtLenlwb1FucXd3Q2lUaHl4TTM0VmpN?=
 =?utf-8?B?OFdML1poNkVrbmMvaTJuektIMDFZd1hOWGIxVEs1ZWV6SGJ5S3I5TmdMaHpv?=
 =?utf-8?B?cDZuUCtaRm9YUS9kOXRSWkFVckh3bzd4ZCtSNUJPOTlraU9GelFCSmRWZDND?=
 =?utf-8?B?OCtKTG43b0t6UE5zVlBGQTRNMVlGcXFxdmFvWWpCandDYVhFLzRoaXJZbU4x?=
 =?utf-8?B?OC9QeVNpSmNXb0Z0Z0g0aU1HWmRRRUMwWm16OXorZWQwckJmMFMxQ1R0ODl4?=
 =?utf-8?Q?KdkuE/JdaIiFuj/skm+BWw4k7?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88746d08-ae68-4f7e-54e0-08ddf847b1f3
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2025 13:14:56.9626
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2ntKvIVFcPcGk5Zl1J+mFCeUYWv11OnYgXDChFgnNZ797T+EyX8slMXP/2hM10YGBXIfgp++59I81oLlsBljvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8833

Simplify the clock enable logic by removing the dedicated
imx_rproc_clk_enable() function and integrate the clock handling directly
into the probe function to simplify the code.

Add a new IMX_RPROC_NEED_CLKS flag in dcfg to indicate whether clock
management is required for a given SoC. Update probe logic to conditionally
enable clocks based on the new flag.

Set the flag for applicable SoCs (e.g., i.MX7D, i.MX8MQ, i.MX93, etc.).

No functional changes.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 40 +++++++++++++++-------------------------
 drivers/remoteproc/imx_rproc.h |  1 +
 2 files changed, 16 insertions(+), 25 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 694fbbb2f34061de22a3a815f8a6114159585f9e..a5fc21982f09d000ff3bc664b52e8ef18a0a6fef 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -1002,28 +1002,6 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
 	return dcfg->ops->detect_mode(priv->rproc);
 }
 
-static int imx_rproc_clk_enable(struct imx_rproc *priv)
-{
-	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
-	struct device *dev = priv->dev;
-
-	/* Remote core is not under control of Linux or it is managed by SCU API */
-	if (dcfg->method == IMX_RPROC_NONE || dcfg->method == IMX_RPROC_SCU_API)
-		return 0;
-
-	/*
-	 * clk for M4 block including memory. Should be
-	 * enabled before .start for FW transfer.
-	 */
-	priv->clk = devm_clk_get_enabled(dev, NULL);
-	if (IS_ERR(priv->clk)) {
-		dev_err(dev, "Failed to enable clock\n");
-		return PTR_ERR(priv->clk);
-	}
-
-	return 0;
-}
-
 static int imx_rproc_sys_off_handler(struct sys_off_data *data)
 {
 	struct rproc *rproc = data->cb_data;
@@ -1108,9 +1086,15 @@ static int imx_rproc_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "failed on detect mode\n");
 
-	ret = imx_rproc_clk_enable(priv);
-	if (ret)
-		return dev_err_probe(dev, ret, "failed to enable clks\n");
+	/*
+	 * Handle clocks when remote core is under control of Linux AND the
+	 * clocks are not managed by system firmware.
+	 */
+	if (dcfg->flags & IMX_RPROC_NEED_CLKS) {
+		priv->clk = devm_clk_get_enabled(dev, NULL);
+		if (IS_ERR(priv->clk))
+			return dev_err_probe(dev, PTR_ERR(priv->clk), "Failed to enable clock\n");
+	}
 
 	if (rproc->state != RPROC_DETACHED)
 		rproc->auto_boot = of_property_read_bool(np, "fsl,auto-boot");
@@ -1185,6 +1169,7 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mn_mmio = {
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8mn),
 	.method		= IMX_RPROC_MMIO,
 	.ops		= &imx_rproc_ops_mmio,
+	.flags		= IMX_RPROC_NEED_CLKS,
 };
 
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mn = {
@@ -1192,6 +1177,7 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mn = {
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8mn),
 	.method		= IMX_RPROC_SMC,
 	.ops		= &imx_rproc_ops_arm_smc,
+	.flags		= IMX_RPROC_NEED_CLKS,
 };
 
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mq = {
@@ -1203,6 +1189,7 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mq = {
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8mq),
 	.method		= IMX_RPROC_MMIO,
 	.ops		= &imx_rproc_ops_mmio,
+	.flags		= IMX_RPROC_NEED_CLKS,
 };
 
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx8qm = {
@@ -1241,6 +1228,7 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx7d = {
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx7d),
 	.method		= IMX_RPROC_MMIO,
 	.ops		= &imx_rproc_ops_mmio,
+	.flags		= IMX_RPROC_NEED_CLKS,
 };
 
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx6sx = {
@@ -1252,6 +1240,7 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx6sx = {
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx6sx),
 	.method		= IMX_RPROC_MMIO,
 	.ops		= &imx_rproc_ops_mmio,
+	.flags		= IMX_RPROC_NEED_CLKS,
 };
 
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx93 = {
@@ -1259,6 +1248,7 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx93 = {
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx93),
 	.method		= IMX_RPROC_SMC,
 	.ops		= &imx_rproc_ops_arm_smc,
+	.flags		= IMX_RPROC_NEED_CLKS,
 };
 
 static const struct of_device_id imx_rproc_of_match[] = {
diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
index 3a9adaaf048b396102feeb45488cd2ff125a807a..a9cba623560c85ea37e47401c392c06dada500aa 100644
--- a/drivers/remoteproc/imx_rproc.h
+++ b/drivers/remoteproc/imx_rproc.h
@@ -30,6 +30,7 @@ enum imx_rproc_method {
 
 /* dcfg flags */
 #define IMX_RPROC_NEED_SYSTEM_OFF	BIT(0)
+#define IMX_RPROC_NEED_CLKS		BIT(1)
 
 struct imx_rproc_plat_ops {
 	int (*start)(struct rproc *rproc);

-- 
2.37.1

