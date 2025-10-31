Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012054.outbound.protection.outlook.com [52.101.66.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D280332EAD;
	Fri, 31 Oct 2025 09:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761901766; cv=fail; b=qgh5sux9eloW/pNBchguqn9o1SaXjBGywzTXJGi5hWspKcYrz0SmpitFbO1qe4nLSi2gLVk+Qvr+pGkuVxAdrqcLAkDpj0a3oCOtPrQC57efl2Jip3+s0LWm0cTiggWQABmmwDlSb0sClcClD6zdK8amtE4aNprWx5BTpgkb0zM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761901766; c=relaxed/simple;
	bh=V1wY2whHoYIs6LbpNSL/+L2nJSdPC8RsEInrOIRqgk0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ThBLSqO1J24fQ5wijGA71asnMPTv1d8U3ExomIYwDlDPH0Csr5HfYw1elYlSaaVzfzn3rBpgDRJ6raqDfqB9QnHN4VkMlsdO+FOZpSNzTiFGZbqV5TEJ0K6hApFb9nTD2g6MGvxm+inMq89rMVZOPYL+CVkY5/GTQY0AldDZXMs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=h2OpX47H; arc=fail smtp.client-ip=52.101.66.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="h2OpX47H"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dS1mr7QYzjyhmvvhjQPr9V2kkNUDJx0oxvGEz4iFas/LY8zhcsTqKjf6NNRY9cUrL/KF+hnGMIhydxh2DAS8i2xSBImpvDquQ9/5q3Jy9DSxMmI1KERAdqHKp/6J9kALJpC/63kGhoAbnw8rcrjuQZXblHFh88hMoQMsehyrM84szZdm/j2GdyiAe1g06ooLNXDpXY2YFCQ9C2pE6WHSAr4vkZZ6kGWlpQl3q+rPGu13kyb9F8McdgbUujjWOdH7AF0XLi5ZkBf98CpcRLjVrrqMhOBYiAe9l/aaZY4v1C+BX7pO8fzPMOn3RnGafsHNrJHZmOMWywHqkPRQKoC3mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iifP2+n4W8WztHeb1dwl8zJOUZ/WW8C6A3vbODMHHkI=;
 b=RDg9MzvPb386wK1uF/2g+mcZ2HHAi31fqzO9qOIna3csmeJkvQMX5LK1tswd4Jhxgcwg+4/v1uOPBQvEj4PGeu7gqOfIVo8qSJEK765V85rQDQANIFB3rNkNr8i+/AvvzyndXAo4VC9l0LMJqGQCKXYXsVyvR250AFoD7gKCBu/9z0ZLONR8xwznuAvDPzx2DVWu54mk2QnKth02tbf0bG4+30um53OKXmX0b/PZJ76qqw/YDHtXiMfZhqzyrDgkaE2XdW0BS3kDyKm7VqU5nSnsQzP2ioNO/OohBVOzD83RubkL1o6PVr22PGA97re9jI4P4ERY7V35aGzkYpcS7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iifP2+n4W8WztHeb1dwl8zJOUZ/WW8C6A3vbODMHHkI=;
 b=h2OpX47HSXlE08+UyiufVITtdI4NfVmGF5nh5yVcEnn6/BwLd5uxGQOtUYlLgqOx0m9INL6YlLUciDKxOui7mUHBtw9SfB+4SBr+ZbQRZRRanIa1f2FRueaHxiYaL1h5A5CfU+0r3QECVEciTjBWbz0QSZiAnUAkoOecJemRmQrh1KnnnbizZ505D2YkuH2UAQZwSztD8hBccAEYrIg+yeySJZNpc4tQvcDcupuHub1YMAx8so1rWMpVCQjXT1GLsRS6TJSGYfa0XVHhgISPqkkzeRI//52qase1CbXqLzz5OpucX68af2czk2gQr9jfLMokPN9keZe7nrKLd9Wgtw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAXPR04MB8093.eurprd04.prod.outlook.com (2603:10a6:102:1c9::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Fri, 31 Oct
 2025 09:09:22 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 09:09:22 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Fri, 31 Oct 2025 17:08:34 +0800
Subject: [PATCH 05/11] remoteproc: imx_dsp_rproc: Drop extra space
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-imx-dsp-2025-10-31-v1-5-282f66f55804@nxp.com>
References: <20251031-imx-dsp-2025-10-31-v1-0-282f66f55804@nxp.com>
In-Reply-To: <20251031-imx-dsp-2025-10-31-v1-0-282f66f55804@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <frank.li@nxp.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Iuliana Prodan <iuliana.prodan@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761901729; l=856;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=V1wY2whHoYIs6LbpNSL/+L2nJSdPC8RsEInrOIRqgk0=;
 b=SvYSMuZvZ5YdXntMbFqFk026ZbPW3nmuBEfk7Wt3mylhPjJJ4WJhAYCbBTBMJK3y32UmDxDtE
 g4744W6/1HCA+8R6sNVaZDjRXyL13yOqNCLzrSF4zfxfQwkJ15jGviA
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI2P153CA0010.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::13) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PAXPR04MB8093:EE_
X-MS-Office365-Filtering-Correlation-Id: 797b0f0d-0252-4f2d-bc12-08de185d2e50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N05wK2VDdW83bHJZNkFuU29hWC9Yb3VSUzgxQlBqODF6TTZqSTVzUTJEaktz?=
 =?utf-8?B?eTg2NDRFcERHL2RFZWpJOG5lOEFYUHdDaXlobklqSTdoMUg4MkZrUVRjcElh?=
 =?utf-8?B?MGNUZ2VwMzhrVHFBVkliS0hjZXR2NnI0cTJxUW1sVE84NVZBL3B4MXFYWEJp?=
 =?utf-8?B?c3haV3JqNjV5eUNqNVo2Nlc0Z1YydkVzWTFJdFhkQzhSV0cydEtXMmVoR3Z4?=
 =?utf-8?B?VzdwV0x3S25tVk1tTXd5bkpDUEx2b0x6SVNzZ0xqOWk2dnBaVDkxQXFZL3hv?=
 =?utf-8?B?MmlSNlNjcnlncUhwdTZQUjJwb1p0dGs3dXRscGFYb3E2TUR3dGdxdEFkUmh6?=
 =?utf-8?B?Q0I5NDQ4R2pHcytRdnZxL0ZEOXJ2RVN3MGg0T2ptZWlWaTVRK3BFZlhueTBs?=
 =?utf-8?B?Z1ZNQStEcXZEdGhoWkc3UGR6LzdTSlRnZnltZnJRNzQ1UjB0dXhNWGlldmRF?=
 =?utf-8?B?ZDdYQVRROVlnd3B5V1hCd0FjMEJFRGtZbXNYa3lCVmdETVA3SkpXTkw2L0JB?=
 =?utf-8?B?K1J4TDd2bHR5a0I2VVBpejBGVEFUcnhCY2xmajNFQk9TZDFWOTlMZFB6YXB5?=
 =?utf-8?B?RXFpSlpsMnFJR2ZkNHY1QjhpVWhXalZCNW8ydGpMZzlZL1FVdUtGSjNwamxF?=
 =?utf-8?B?aEphTlBLQzZlVXVBV1AzK0l0WndxVkRYT0dOU0owNDl0alpIbkJOUVJqWm92?=
 =?utf-8?B?a2gwVVBtYStLMXhLdUxxMVIveUIvWjBFSDdjaGZaSHRWVEU4L3BnL2U3M3Jn?=
 =?utf-8?B?WXhMc3ltTTQybnpsdit1dTQ3MHhTZTZXUEh5R0YyVTFYT0RJOXhaRUlLcU5w?=
 =?utf-8?B?Sk5vSStXL0t5MFRTODF6R0pCNDljc0dTK1Zua2x0bW1QVG41dWtHTzFVRGE2?=
 =?utf-8?B?YnBJTytaMmd3eUhQYUZEQ3JQT3k1bWd5Lzk4ZWljK0JKWnpCWHRNT1lsRmRh?=
 =?utf-8?B?a3NETHg1K2U4N0pYRWw5VGlub0ZGYlNOMEh2Y2tNaTJQZWxhSDEvRXdpYUtJ?=
 =?utf-8?B?c2w1bk4xRjVTZmRZLzQ5NEpzbEVYOWMwNlFaV2RMS3JCSVFYOFhRMzZDK0Jn?=
 =?utf-8?B?em5LSWc2SGVLR0RwMDJzK0Zzc1R6VmYxMm9SeXNqWXpUUnNQb2Q5dGkwUnR2?=
 =?utf-8?B?dHVuTzAzZU9rTXRpZkFVRFNyaU1FWEwrOEpGbGdNRjA5T0VnVXdyMndIZHV1?=
 =?utf-8?B?ZVdkZU1ReGR1ck12V2xha202WUxyZXpXbWRZcG5HTUU0TlFJTXpUdExHTmFM?=
 =?utf-8?B?WGpVV2VWR0ZNNDVQZ2x1OGx1UUluLzhSdjFKTkQ0R1BwYkFVWUdkMzlTZC8r?=
 =?utf-8?B?USsrLzR3UThpVVp6YlNtY2VQNWRRSmlsYmtzTEN4OUI4cU9SSmo2TThmRHJX?=
 =?utf-8?B?MDdvTFk0dXhIeWx2WmdrcEdvL25oWENISnBQTjlHYlZUcEpMeDRnR3loa01a?=
 =?utf-8?B?QnZRd3p2US9QTDd1anRUUitJdmxEaTI0eVphTy9yUTd0WEREbVpGazNjSTBH?=
 =?utf-8?B?Y2wyaEN0K1VydDIwYTh3K1FBclhXa04zdUNSd3QyajNscXhlWlUxVUJxbjBX?=
 =?utf-8?B?ZU1PbmZDbWprU1RDU2pyamFSWjNZaHZHcFM5Q1J2N2tHVTFCeHBLaG83UUt1?=
 =?utf-8?B?ZCtjeHVncVUvNHFvSWhzdmg1NkU3NGZXSkFVU1FKbHhBcWVMV243a011a0Jw?=
 =?utf-8?B?QnJmN0hUQlBMazZmZ0hreEpUVUllU2FyQjVKNFkyR3hkZmpDaFdVdkNVSktk?=
 =?utf-8?B?aW1JRkdFQzlDSWxmUTVEOXByM1RzcHZSNm5uRXlPUndQeFhLTWY5OWRDL0FC?=
 =?utf-8?B?V09nR0N2OGJpZ0MxYjZrdzFlT2MzblhDbVN2QndsNnFRMTEvMDZ5aVE2dlFr?=
 =?utf-8?B?ajJkSndWY2YreDFIVU96c2pnSWpXUUpjRmpLRmtWMzZMRGdrVE1sTTZ1Umcr?=
 =?utf-8?B?bHU0dVFpQTRwSFJsMm9VclFrcHM4TDJkUlN1MzNZZVhLZHRMKzgyZ3ZCbGtM?=
 =?utf-8?B?THVLT1BPT2picUUzSEFEY0swaTZuZCtVU0pmUFdtVlRBYVNJb3NxTjJjWmZt?=
 =?utf-8?B?QUFTQkQyZXlhSTBqM3dOeGJOZlYvdDNud3VOdz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(19092799006)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K2VYVWZpR042RGhIZklBRkVxbk1pcGQxQVlBTUcxWlZsZXFCV2RKVUMwQlZr?=
 =?utf-8?B?Ky9JRmpnOUVKRE5ZeEE3SVUxRld5S2VtNHFjSFRVSjY2TWxEU3VZRktMcTdD?=
 =?utf-8?B?bXVIc2xDZmJoKzREdWRZUVV3WEZSYXdKdllPUEh0cWV6N0ZFNDNmQWJOMW1t?=
 =?utf-8?B?MFJLWTdBU29HWnNsU0xZL0xYbUZWSEM1MTgwRmJQVk1rT3R5eFlqRTF4MTA3?=
 =?utf-8?B?bU95MUozQitRZ0Irczh5UVpneWtzYmV4OHNkUE1iaGl1bEpFYnRkZXlaVTVy?=
 =?utf-8?B?My9CWksvZHVHOVEyQ053U2pwQk5nYThrcW1mcmp2UXZjV3NaVzNOdWxEOGNW?=
 =?utf-8?B?QThYR0FwbXZUNk9Gd21yc09uS0dwU1lkSWViL2lrU1J6d1RXbjU3a3dNM3Ri?=
 =?utf-8?B?Q2hXNFlwdVFJcjdteU1WRC9TWklyZUFVdHBMUCtoa2p2d09tTkVVeWJtY3hJ?=
 =?utf-8?B?Y0hMYWFqNGhCUmNOTGhZREQwRmtiQ0tRNGIwVmJ1UXNiZmx5RUYyZ29SRDI0?=
 =?utf-8?B?RC9Yd01rTHJ4aDVDZWNtU2hQbndTVlhkVWdocW41YVg1WU1OYStEOVI5NzZG?=
 =?utf-8?B?VVJWaS8vU25ScXFkK096YUpseEdYRTlXanpCOXhqTGR5OTdoek9TUVVKdFkr?=
 =?utf-8?B?dlA4RytWQ1ZNYitWdmZRUzR5YStzZSt6UHlyZDY2ZEd4RkJEdHlXams3M1Y4?=
 =?utf-8?B?RGtESTN6eFVKQitDMTJVaDlzakF6RE92MnB0a3AvK1NRSGp0R2FiNmUwU282?=
 =?utf-8?B?SkVKblZHSitVZVBRSjQrR250Y3d2bERhMzVIcFN5R3RUenQ0UkRDaWZ4SFJZ?=
 =?utf-8?B?L2tyRy90Y0JXVnJlZG9HdldJMWdObjBJRUhycFFNYnhNaXZ3ODFBN1NTRmpq?=
 =?utf-8?B?RkFHc3NzU3lpK0xLQUhxWWVDdk1FTnVZdlpKTUMwcmJ0alc2OVZZR0FmdytR?=
 =?utf-8?B?MXFSWGdQMXFuM3B6aEU5czlpNVNZT3VHZnpZSndFS2p5OVhpVkJJRGMzd1lL?=
 =?utf-8?B?TWxVUmhoVkZnZTZqbElGRHZ4dlJIV1lKSnQvT1ozZ01IVFc4Rk5vZjZUc3U1?=
 =?utf-8?B?NmowQjRDWGd4L21vTWtWeEVsbGlvd0pNanVidnh5SW1tUzJKd0JCQ05OODBQ?=
 =?utf-8?B?TUo4ZXoxUXRybElsanh6QlBuVzJndnoweGhjUDRVWkptTlhQMlk4QTdON2gv?=
 =?utf-8?B?WS9ydEkyemZoZUZiTmgvYUZYZDBQbEZWeHRxdlRMMGF1RmNxMVJIRDBQYWNq?=
 =?utf-8?B?WDRHNzNSVUVoSFVYQ085M0VSN05SR0d0RDR3cFVzODlSRW5sR1QyQVNtZU1C?=
 =?utf-8?B?Q1Rmdzd0enVna2dNNE42Z2UrOWsvaWVaR0FmbWR3WFg1cU4ya3ZETjlpMHZz?=
 =?utf-8?B?UTBvYUF2OUVRK0NqdnZIdWJ6VmE4bnQ1cVcxRy9qUGJtL0N0TnZFNkRTU1Fh?=
 =?utf-8?B?S1JlenJjSzRPSVJvR2gwNWRIRjVKdVhEL3cvbDFGRTBaWjdDVG1BdVdKQnRq?=
 =?utf-8?B?b1hEVFdGSWVGenYvOXBoT2dnTXpJWTZhWko4SDJ0RXdUT0d6RnBJTkFPTFVS?=
 =?utf-8?B?d3RhNnlBSVY5UVNxVGVMMTh1eWdpMjNTbmxaaWNLck9kdit1cTRDVFhzRXlU?=
 =?utf-8?B?TnlLNkVsUm9VSDVFR0RiTjZpMTFtVVBRb2xaRGVoakFaWUpiS2wrRk9uY1Jl?=
 =?utf-8?B?emxmT1FDaEFKTFVOb3RDQ0pONHo0cE5tNm9RRkw4WkxBUXFUTnR0cXFjQnVM?=
 =?utf-8?B?UWlLOHAvcHY0YlZsbWsxWDJwbk1NdEpZNHF3UHlUaENocHpmL2xiYktXUFJI?=
 =?utf-8?B?bFFMcDNtaFdwKy9xelVKaDBHL2lYSXRDZTBHdVNSdnQ5OVhCc3FjRzdPMEZk?=
 =?utf-8?B?cEhwMUphY2l3LzVrdHJaTW9oSDE2aGtlaGpJQ1BER25uWnpGNFh4Y3NSM3Qx?=
 =?utf-8?B?dk5wdmhlSzJodnBQUzZjUTJIeEUwNks4YmJLdExJMmdzTGRiaXBPaUxPM2Vl?=
 =?utf-8?B?M3ZvdzBxSHg1UnM1TlMrbTVLWHYzZzlqcStmMm1ITERrc3ZSeTRTY0JkZDNH?=
 =?utf-8?B?ZDROY2tYNHJtMWJ0ZGY0cHVYRVFEZlJaMnkrNjlKajNCUDY4Yis0SlZPcWFt?=
 =?utf-8?Q?Z7cVQZCbKUNv8Db7PLGgQaj+6?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 797b0f0d-0252-4f2d-bc12-08de185d2e50
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 09:09:22.2937
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w5T3Vc0e5nR0zbO4gY4EcnVFLKJ2GQdF6PNAXDPP2z66Ze4eW9x+XXHmFWSrLurDxPuy9kpo9vY/ROAK+97AiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8093

Drop extra space between return and zero.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_dsp_rproc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
index 87f4a026c05fbf1c9371058290b2d33cb94b9e54..1726aaa1eafb9ac1a913e3e2caea73801b86dc09 100644
--- a/drivers/remoteproc/imx_dsp_rproc.c
+++ b/drivers/remoteproc/imx_dsp_rproc.c
@@ -784,7 +784,7 @@ static int imx_dsp_rproc_prepare(struct rproc *rproc)
 
 	pm_runtime_get_sync(dev);
 
-	return  0;
+	return 0;
 }
 
 /* Unprepare function for rproc_ops */
@@ -792,7 +792,7 @@ static int imx_dsp_rproc_unprepare(struct rproc *rproc)
 {
 	pm_runtime_put_sync(rproc->dev.parent);
 
-	return  0;
+	return 0;
 }
 
 /* Kick function for rproc_ops */

-- 
2.37.1

