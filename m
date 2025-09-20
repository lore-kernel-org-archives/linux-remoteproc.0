Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010067.outbound.protection.outlook.com [52.101.69.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B492F83B6;
	Sat, 20 Sep 2025 13:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758374120; cv=fail; b=Ph26j1m7HsLRomlYa9F+sZ4cCwsDWY2DojudFeh8ZWeLtYtjKdqiiDHB6ZZKhYLCr8vqdAuo53f4clGovppfjlw9tyR0d/Yf5VHD2OPnVtfga4GojhVBn3EoxcarIEsHbF6xYaW3nU5pu414vQkx9VPQEUZx+mz5kd4LlZNi0jQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758374120; c=relaxed/simple;
	bh=WR69N5cyETfGhusgbn0C/a9Kpg6K/z6II1RH3228/hI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=cOUQih0tODLUbe4jSX0R+LB+yPyciZ7QkVNpYHWblwUqnwpdnq0qo7Dn49OWArPuBJf/ig62Cj/9+LUvuMEimzRQN6rd8g+3KaaydthOx43cbcQZcZHRxkFygND7N/gYmA0EbiAJgznngyI84e3AXHC9acOVxbeOdcOh2j4avEg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jI6khutJ; arc=fail smtp.client-ip=52.101.69.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jI6khutJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R/tguvKOdwJyszIvR+XnYj+KsPuXv0VsATth5XlemyqdmhQyyB/0hyZCto81CxsxWz29o/WRJKG7FAz/v2znw3A4BBHbvOF+hcfIgCgf6EB7cTMueJvobgLMXDG5EenC80vYe3p8Q2t1VHIHet3V3DmLGSahiUnY+4OAFQmBEHXaT5QUBjiM3pB6wOpeWM9WoXlD1vi9ZR05kewTcLTRuDr2S77ayG3fJJqARAIbZtxFx44QdPisMrWglNJUgx97R9OpVHcq9u4gHFtyRpsDM+YJ581SO94JtSO5/vYl7EmJWWYlZiCnPquHt78dToc6QkS3z8nnvAo2/UBHy2JafQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bYQTODwk6k/75Kf3BeJgvt0YCkGtjKd86R5WwP/ToVY=;
 b=rRqn2jvCsAoqUnp1AUN0UBi8lrjAfm8fQ2rIVBhFmywH4QPqDzaXlPlGGFNuDidjiGeE4o4mEX/pEgmMVO+9EAMI4vExVoBjswRiNGNC4aEm1ajP+1HiscSJXqJngYw5TDBh+IOPnnuHcV7jF9bDuLuYGJAtWUBAZUj8Pydp5wfqtAiIQ8lIMclBWCZP4KuPPzQd16VEDSr+9qQfrESHqCr5GZVMLDMSdcv4kx/Nzb/enR25jvjiTQeg3e6PMtk9U3QKqDSXUBMOcnlgEly6Zjk3vNx485PRUmTmo8p6whKSwog4vi1QaU93cLPYvpR5HKOfSVP4wcKSKkDLn8G8Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bYQTODwk6k/75Kf3BeJgvt0YCkGtjKd86R5WwP/ToVY=;
 b=jI6khutJ9JShO4YcaDLqu/1xas+gyIlqN7QpRc6yLkHXlcAQ0FgE7cKSJtPPFroocUe5Lrpc98B4g3WLv3v/dXO5HjJTc1VMm+vTukH7vnXdJ9dAccID1KTarzM4xgVkDHS+upJQ6/74PByzXKymj45qsWTDnuSkxjTZVz5WO510DNXegPsBnp8FAkxjUEp2pj+RDUmZ9iXAyidXmm4X42MDvt0DAdvweUYk8CGT2oMdsCjT4ssoRu1WazWoZj59o3QwNohA8z5cHXVDI+yjc7iTqI2XiZ2Wz5oSvxiYzwC/67YvrKHNpbCkj+Ttw2Fl82TPd4zbHeqIH5d0/XzfGw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB8833.eurprd04.prod.outlook.com (2603:10a6:20b:42c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.18; Sat, 20 Sep
 2025 13:15:15 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9137.017; Sat, 20 Sep 2025
 13:15:15 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Sat, 20 Sep 2025 21:14:38 +0800
Subject: [PATCH v2 5/5] MAINTAINERS: Add an entry for i.MX remoteproc
 driver
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250920-imx_rproc_c2-v2-5-3351c4c96df5@nxp.com>
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
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758374085; l=854;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=WR69N5cyETfGhusgbn0C/a9Kpg6K/z6II1RH3228/hI=;
 b=itztegndxWK1vsO+L5vJZFc0gLrK4SkO3GEJKHhE1dnBAhPQKx/oZ2EGwiyZTKNaLdxxrZsuT
 TuUAFmNutVjDp4SvjAyFJT5rDuzvBnBnUDCclelfjWFfhfd2iSu+WJw
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
X-MS-Office365-Filtering-Correlation-Id: 3a3cb9cb-186f-4074-1c70-08ddf847bd12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|19092799006|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K1BpSWg2bnhtQkdjcEdlc0FVMkpCb0pPbTFNdlhHOGp5ZkE3Vkt5bEIzTDhT?=
 =?utf-8?B?cFZodHJORUo3ZmxpUHR2c3FMczUxaXhtaEFwY3VuRk1rREZJVGFyandRcU1J?=
 =?utf-8?B?S3JVaFRTdC82Z0dldzIzSkxyZC9HdjBaYm9Yb3lOWm13U2VOUktLM3ZJVlpq?=
 =?utf-8?B?ZE9sdXkxRlhlL1E1UmEyT3J4cW1MYWpIMlc1NE9tMk5idHRqMmFkYWZERlYr?=
 =?utf-8?B?WHdja01MalVZRitIK3E3QVptSncwaE95WFRzMUt6bHN4cXI0MkhveFBlVEpw?=
 =?utf-8?B?QlcyZHZrRWhMVUlnVllJOS9sUEJKeXNoV3F0aHRualFCdkszbFVQam9ENnVn?=
 =?utf-8?B?eEJWWHlodk9LOHlkaFVTR0NpK1R1ZE9kclRsTGtUbnpNWURWcVFoT1c5WDBv?=
 =?utf-8?B?VDM3Y2w5VTN6OHNDZDNvdHcxbWlYbmdpd2FBNlB3UDQwTExiS3FMVzU1NVE4?=
 =?utf-8?B?cEpSTFhtdTNNR245YzJnTElVL1dFd3Ruc1k1U3ZBcitwWUloME5WRERuLzJr?=
 =?utf-8?B?RGpJa0VLRmhoV3dlS1dVZlZFRDVJRGk2V3dzRW8xVC80QTRyZ29ia044WDRM?=
 =?utf-8?B?Q0NRM1Uzc3dtblhacis3dXBoUWpzZDM5ZVJrd1JhVDNlSDYyYmN6SnJFYW9o?=
 =?utf-8?B?MVIzYzhCUG5BcnpMdnNFaFA1K2NTdC80bDhIWnlITmw1bCtmNm9ucTBwZnRS?=
 =?utf-8?B?TDdkL041TEhxV29xR3EzZSs5R1V2K2lTUkRoN1EwUi8vYUFTVWJ1M25zbkVO?=
 =?utf-8?B?QkIwY2htMzE1dktXL09lM0IvenIyaTZBN2I4UFF6RmNNclR2MXQ3QldLdHFh?=
 =?utf-8?B?TlBqb2svcEVVMnVmYzRVbmVwS0pST2tlOXprMEhhUUcvc3pGcHI1M2E4c09u?=
 =?utf-8?B?RytjaklkYWplb004dFFjUVRLVGJkMVJVeU9RZ0orSnBaWlBENXlMcEUzeFI2?=
 =?utf-8?B?S0VGc2t0aGlWZHJSL1FXZjc4TG54aWlvOXBoUFdGbzl3ajdyWkxLVjd3U1kz?=
 =?utf-8?B?ZmIvN2RtWkVMcGt4b3ZwSUVFQW40ME04VVZMSHJCNUJpUnZTSVFwVVo0Y2tG?=
 =?utf-8?B?SzdoQWF2ZG5OeUdoTllBMmthVkxUdkx5WU5yb0xDbHN6a01Ba1J5Y3RwakQ4?=
 =?utf-8?B?S2VNV0hXTFl6c04wdEJEZG9rSzlMa08vaWU1RC9zMGNhVmZTNXZTYTFKRXBs?=
 =?utf-8?B?N3M4ay81YVVaY1VtL21XdWVGTXNMQU5RNjR5K21CeE5rMUZML0lNNjJaRm1z?=
 =?utf-8?B?QlNxWnNCd0lKeElIREVXZ3pFQ3lURWZjMUVLRUZEL3pMR0huWjQvQTlCMUFN?=
 =?utf-8?B?bnVKN2o0Zjdub25uaEU0WlJ1OFIwU0dQWC9HZ3dVWGpvdE1kWVRDZkEvMyto?=
 =?utf-8?B?d2VPNlpwV3RNb2loN0RxeHBIUFkraFFuU0hFc29BSW5uQjJ3MDRNM2EyeEVR?=
 =?utf-8?B?YURoai94Ti9pTGJLWDBDY1dlMTVVVlV0VUdIaDh6aVU4Q0didnRSeHlYMlNs?=
 =?utf-8?B?RXJ5SGE1ajJVSW9veUwrTm1hTWJjMnNWNnhjR2lCT2w3QVBVTGZNN1B0ZGtw?=
 =?utf-8?B?Y291alJkYUMxNERFWTNrdGxrdzhNOFREUFRVZkoydVBuQXFMdVpXS2NXbkxn?=
 =?utf-8?B?WGdaakJLOHp1WjNVbUl5ODF0SWtMeEorbHh6dTVpWDlkRmVmNkRCdzJLd2RJ?=
 =?utf-8?B?S0JvUTNPRVB1Smp6TDI1M3NsWTlZc0dIZzdMVmJ3a1liSFRLalNna3VkUkFL?=
 =?utf-8?B?d3NuTzJNcXp1d25sRzBSVDBBOWNGT01vV3BIWFhLTyt1MWZsKzY1ODJzOFJl?=
 =?utf-8?B?R3poYldxVGM0cFdNSkpkeVNBYW91Wm1aSit3aUthQUxuUnpCc0Rpb05tSnJG?=
 =?utf-8?B?N0lDaDRjd2tNMG5rcGZ1T1FzQWxPTmpHVDQzMXpuOFRObFRhY3Z2cmdsSFkw?=
 =?utf-8?B?VDNCNUsyRnBPL1lmRkIrcjVrR1BjcXg5Zks0aG9zOWJrRXVoMmk1anVlbUVX?=
 =?utf-8?B?NHFLYWd1eUZnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(19092799006)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YWU4NnlVZ3pSL1JKZ2FQV1VoandpdHdGQ2hDL1pSdGl2M0JpVm8ySmVhTmw1?=
 =?utf-8?B?NmNMRms3TlVFaG9SSnR2TDFiS3ROSzI3cDVsSk9vbWdPU1o4V283bWZZVU43?=
 =?utf-8?B?a3F0V2xFdWNsWU1oMkdQSERxd2pxZnFuZFJteXlOd2tUaS9xWDF2cGk3aFRj?=
 =?utf-8?B?bWl0UDlWWXM2YVJXVjFXbUVPS1Mzc2JIL1ZPM1c2blRxZzljKzlxdGFHOGhK?=
 =?utf-8?B?UHNsNWhnOGgyaHcwWDNFbFk5UjJzMm9lZ2c4VXg1RVp5ais2Z2x3enRlaFV5?=
 =?utf-8?B?N3haWkltK2JObndsQmtXQWp3WS9POGwrWlpqOEhZTGljMEJyamwvbGwwM1pC?=
 =?utf-8?B?ZENaQ0Z1enI0d2lIZE1hNkFnU2g3RXBtYS81WWtUaUk4cEJEQ2oyTXVac1NV?=
 =?utf-8?B?ejd3bEIxTUFkZHdENFcyN1hNU2IrUHR1Uk1yKzNTejd2R0pvUTFaUzRYYXVp?=
 =?utf-8?B?bG4zQ29yL2FzM2RwVWdBQ2R2aU5DQUJxV3FFMktKT3RHOHFtMTBJVjJ4dElh?=
 =?utf-8?B?VGIxcFU3U1l5S1VvR043dGdwVXhYZGEvSHhiSVVYR3RoUzl1WEtSam9UUUJ3?=
 =?utf-8?B?U2JWMlFjaTUzNlczVEo0YWdCM2VlRlE4TjhXcmpwWlc2dGt5Y1R0NTQ0Wldp?=
 =?utf-8?B?MElZNmQzVHI2NUI5dXZ3ZFNHOW0vLy9XNWFhK2IvN1hweXFlaGEwMjM4SzRv?=
 =?utf-8?B?QXphNTM5TFlWVmhuZ3NINXBFRUR3QWFHRnBoMFhRZlhCQWZaZ3FWay9ZMnJ1?=
 =?utf-8?B?UExwRXRQanhLQ2N3aUQ2REF0L3RvNTZvdTJHTFJMK3BFWDBKankxVHlCUlho?=
 =?utf-8?B?Z1VxU2lGd1FuRTR1dUNrb3FNNG0yZG5UQ2NHVTE0aFpYS0NxREpNdzZKWHdW?=
 =?utf-8?B?SGZHWGZlN2Yya2VoZ1hzdERqV3h6U25Ua1JObTNrb0xNc1RYNVVleWk2SjN1?=
 =?utf-8?B?SzZxUmdVYnIyK1VURkhJaWtrRE14czlGV1pmN0gxSFZDZUErS0MwVnNQNzls?=
 =?utf-8?B?ekZJZmgvQmJzWVJNOFVjVlAzM2FTektEcUJwVERuRExlK2JWbFN2bFQwanJ5?=
 =?utf-8?B?amVvVjU4RXl4MFgwc0hPc3k2SDZwTWNlR1BPMWJGQVJabWZNL3hRRFdoT1Zv?=
 =?utf-8?B?RUZQUlA4WXYxUk01S3p4YWY3OHJmb0FJMVMrWGhWWERqLytWbU9wcnBEYjZC?=
 =?utf-8?B?TWtPSDZJZGhkRFdDOXM1aW1DZi9lVk5SRW5keEdBNVdQbXR5ZGV3U0Q3VGNw?=
 =?utf-8?B?ZWtuaitiSXRkamZTc3dsd3dFb2JJTTBDWjBqMXNHbU5RL3FFWjhlR01TbVgw?=
 =?utf-8?B?b1RQempra0dkTk1aYitIek5BQldwVklBQVg0TlJBMHp1ek9wNktJNFJkK3or?=
 =?utf-8?B?U0RSK1p6akZsRUQxbHU5QldyUGoxd0dOeE5iSjhiQWhtU1hnS2YveGdpeDh1?=
 =?utf-8?B?bGV4ZHFRdFM3elFTZE1yWTBJM2ljeU1WVmdsYkF0RFU0THpZQzZ3U0J4b3ZS?=
 =?utf-8?B?a0tnSE45US91bnBWR1o4MTlTK0hzZGIwem5tRjFtV2ptUldGdmoxQnRmck5X?=
 =?utf-8?B?WTJ4UStZZzNaaVhZejhwb2FHakZpMUdQZi9wQTBHZjl5LzJ1UE5pemVKVTF6?=
 =?utf-8?B?Y0hVK3JGRXRuTzRiMmg1Y0VqZGw2ZVRPSVFSb2FLNXJiMWdEQ2lCZytob1VG?=
 =?utf-8?B?UWVaRnRmaGZXbkFNSUxqV3hYMFd4T1lTc1dRZTBOTVhGM2ZVYkx4V0hETFJn?=
 =?utf-8?B?Unp4K1JEUDgzYTBieDFVaDhlNzdpSnNFRWZpN3Z1bnBUUlJodlJaT3BwcmxI?=
 =?utf-8?B?eCt1L0s5aUt3Y29hVTZGWTRlNS9mQlhtWmdJSmF1M1A4R1FqWjRQeGpVMFY5?=
 =?utf-8?B?OXlSZGRYQWlaVmo2cTBrMEpkOVJBTi9CdGwrSG12aEJRVDZHR21qYXlPMWE2?=
 =?utf-8?B?MnpIS2czS0dVdGRlQ3NmMitZcmxmc1N5VHdodXN5MGN4QzJ5c2JVQzB3UVpw?=
 =?utf-8?B?MzNTVE9LYmJ1ME4yeDV5RTdVNEEySVQ1R0tvZnN2T0k0bklGM0lueE5Kemdq?=
 =?utf-8?B?RE8wWXZPb0V1MHV1MWlMaWNucXdmekZwNmdVRG1yV203dWgrY0MzcW5ycSt3?=
 =?utf-8?Q?U/UWV77Do4xNM+cbEHrZUhWjt?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a3cb9cb-186f-4074-1c70-08ddf847bd12
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2025 13:15:15.6094
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +yrNFSjDnusomzGT6/UDx+5I/VilyQgcB1usWgPpCRKe4KnHVb3NmNIQPKUdkJvWG9fMLCJaQq3GEd03CZGeRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8833

Add an entry for the i.MX remoteproc driver

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index df319f9762b369a2746ee7f41334be9b57e7bf9b..c25aad1ad4386623065058d1a7cf92e1555ec7fe 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18508,6 +18508,15 @@ F:	Documentation/devicetree/bindings/clock/*imx*
 F:	drivers/clk/imx/
 F:	include/dt-bindings/clock/*imx*
 
+NXP i.MX REMOTEPROC DRIVERS
+M:	Peng Fan <peng.fan@nxp.com>
+M:	Daniel Baluta <daniel.baluta@nxp.com>
+M:	Shengjiu Wang <shengjiu.wang@nxp.com>
+L:	linux-remoteproc@vger.kernel.org
+L:	imx@lists.linux.dev
+S:	Maintained
+F:	drivers/remoteproc/imx*
+
 NXP NETC TIMER PTP CLOCK DRIVER
 M:	Wei Fang <wei.fang@nxp.com>
 M:	Clark Wang <xiaoning.wang@nxp.com>

-- 
2.37.1

