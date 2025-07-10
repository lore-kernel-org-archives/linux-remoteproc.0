Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011045.outbound.protection.outlook.com [40.107.130.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0C62566F5;
	Thu, 10 Jul 2025 12:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752149424; cv=fail; b=q3DdeAXkIAnAiGIzevQc3DwJZNB84Dzlbvu1oJZl/LwhqSIzP16ROeybQHHgccvz58k8Pq/pc8MBIR63dH7s1v1cSRJdXweRPzULVN2cI+xLxpngSqMpl0e9QOSie1weCcY6PU0+YucZQPIgosVquLrsHij6SD3Az2s5l1t0uBk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752149424; c=relaxed/simple;
	bh=6NpyIcNhuN4aluiztKEA8QtPdBNAjhyBjZofRTym8f8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=hPy2t+BFP9ddzi6Z3ltOBfH/MjqXLN0BmptbTCX1bo6InnjpCfDAmKi5ifh+pOxfN26+v19ieuRAwf9CELVwUD+rq13Rpk33cZtMsp3Dw5p0SoLPCrH668cdxkR4DBHaqBWSQPM5HeatlPS/xz3bd52XpcXBU2sItPIKr6VpFL0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Dxwu8kfo; arc=fail smtp.client-ip=40.107.130.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Dxwu8kfo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f+iBYk9ZglWsYTNW29omVpIIKHWgSZRHccGbiAIE1JXdj6j0yD5J7TDkC/yGSFf+ORxdy7R3uzGw2yWdsjraebDPvy9Ho9X+76aeY7ZYwaVZ/nk26qrSOwm20EI6SyU5JVGMbw7aAS2rgwzM/MF7I66O1vxwyMQ8Mlx9QbaDUvvVBTz9IjiJZU+JylZVDqvPyOdE1zbuDcHFOYWHwOMpArWT8SqBP3P2OZ//8t/zC1hiIfPJobMrcsR0F5ZXskb3BApxoZ0pgy4fJeo0AQUdGJ19KN+4FsCXFCL2k/2GzxAHGWM1eGx+bJQHzWu8A+n0ZKyS5IM36sDt9y2gZYbksw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/CsJHeFGasyq93TylhD94m1ga1lKxfV0M6YOVept5Lw=;
 b=Q5jt5qNa+kdw4MnPvwoimLGM56UQFlLKXJoQ2Ie0hgzyE/wozoQ5m5hmPG3u9ZHs1a2OqTA3tEgMDePYYALgWA3p/yybjuUXoir3gTTL4VyeNYKZUm2gPcU5NX9uh6xiky0x3sQ2XAYKe8vmm0nEAAjBI96IzQsVCvlAQImKCD5XOQSswDTt4BIG15cZwwa7HvIk3rra495RYD/sTyziqvof/IAYrrC+GIgeQ8OoOEXtssDcHbSPgt9IubEcC6GF9kGTiYSs163YqFf4rhceU1Iakr95OlxEsaHWXPovfVOfCwOKjZvZ1qB/9LsbtJXQwOs/wcn0Qhxrx+E6cCFWWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/CsJHeFGasyq93TylhD94m1ga1lKxfV0M6YOVept5Lw=;
 b=Dxwu8kfoYhiT4zN33DlhduC+EOeSplK0TuW1zld7umFBBV2WpqD5YuKYBwXEaEgpX9GiWUJXsdkElhyu5DAyahxsDlIPnnWQlG/n8Gn+7RATDRM8i+zfZyPh2ouRykgklEdeVFNQ2GWV4cE8PBsxpJcqshNs5BfCWY4XCT7JYC8rweuTgSmgXhYsR9LxrI/sTD+DMs8l/NR2VgWQ67izhO1XZ9ygk3FrNMpzkXXsgGLsaFuDLBQMH59xjo+oGPZXvoNEsXqCEY6lX8hPxBXTvBQuc//heviyxZ/7OOLlhSDig/1Nm00p1X8FhvKu6RJVK2E08Mly+PiN7S39NOXimw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA4PR04MB7983.eurprd04.prod.outlook.com (2603:10a6:102:c9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.29; Thu, 10 Jul
 2025 12:10:18 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%7]) with mapi id 15.20.8901.028; Thu, 10 Jul 2025
 12:10:18 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Thu, 10 Jul 2025 20:08:03 +0800
Subject: [PATCH v4 3/5] remoteproc: imx_rproc: Add support for i.MX95
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-imx95-rproc-1-v4-3-a7123e857dfb@nxp.com>
References: <20250710-imx95-rproc-1-v4-0-a7123e857dfb@nxp.com>
In-Reply-To: <20250710-imx95-rproc-1-v4-0-a7123e857dfb@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Iuliana Prodan <iuliana.prodan@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752149291; l=2355;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=6NpyIcNhuN4aluiztKEA8QtPdBNAjhyBjZofRTym8f8=;
 b=LIEz9hzoKiN3vYgRpEUcx3a6icU8wAmSb+XB6GISUbiH64HzaROpuJShN5kRdmNd+2PApDWZM
 O1wbtneSVGqDgLA0T4l75ujFK3k/yuZgLUJkKEFmYtIKNKxQymHkPix
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: MA0PR01CA0071.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::11) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA4PR04MB7983:EE_
X-MS-Office365-Filtering-Correlation-Id: de3e8af1-a8be-4df9-2146-08ddbfaabc8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|19092799006|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eWIxUDk3SXJZeVlnVkh1YWR5ZlFGRzY4VFJPOC9SelZXQUpEVzZQRGw4RlQ3?=
 =?utf-8?B?MllMTzNBU1BjMHVWUGY3UWxyM1lvcjVYTm9kalVhZUhDaDdNa0J2ZWJjL0dn?=
 =?utf-8?B?VnRWUWZoSDdmaUlMZFlZWmJSSCtsd29CS2xTaFlETDlkeVZuOGdld211L2Fs?=
 =?utf-8?B?NWx0YVRGMVl1RUhGR1FsZWN0NlN4YTZxYm4vY0YvMzk5SHQwbTdBdGh6cUd0?=
 =?utf-8?B?NTRObmUySlRtOXhhZ2UxbWRDM3BSYm5uaFRDTGRoMkFTVFNBcVNKTzBRSGFj?=
 =?utf-8?B?YWVzdVBiT3dMZVVad2lDWS9IeEVibzdQeW0wMjJZaE9YNDhwMlVURWZjZkRk?=
 =?utf-8?B?TU9KNmZUT0xENFd6MmpFdUZVdjBWY1dXYnhhY1dLcHNmamdOQUE3VE9wNVpv?=
 =?utf-8?B?M1VwaUlJTHAwNkhMZjdwYXcxNmkwRktIT0RFZGtKaXVLcXJlbG1Qa0FSUkFK?=
 =?utf-8?B?YUxWc3dNb0k2eVB5a0UyblZSTGhYWUV0Uk1ERDdXNXN2UEhSUnZGMUJEQ2Q1?=
 =?utf-8?B?VE0xVkJMVzdZcGpUcjF4SGgyVklJeWVieUlyTHNOVjhMMlNBcFVwa09sUjZY?=
 =?utf-8?B?djNnSjQ2cm0zVCtyY3JsYTZXQU1hOE5lMkxvWVIvc1pQNzBCUExicDlYaHlz?=
 =?utf-8?B?QnBUeWdkYW1OdjNUWEN2WHc4SlZNZDRDNytFVStUbmFCWWx3U3BaL2FkMldr?=
 =?utf-8?B?Mkc4QXVXQ0tWdmx2eXJoZGZJWHN2R0VKZ1U1UStId083UThLZWZpMWdvTW5D?=
 =?utf-8?B?azFkZ1M4R0xNQk51TFROTkpQQVAvdkhjdU1SKzZ2SUEwRlE4QjdJOXFvNkNO?=
 =?utf-8?B?SWJ4ZVlaQ3ArSWRZRGRtcG0yT05rdWNET09mcnhLNlNvejFsT3lHWW5vWjBP?=
 =?utf-8?B?V00vbEJaT2c0blkrTEFialNYaXN4MWJzMTB4T25qS2E4d21hZHlVTTBveVF3?=
 =?utf-8?B?T1k4eFJBMkExanlrd2ppbk1JMjhHQy9XQ0prblVYRHB1c25yaEdWY1pyMjEz?=
 =?utf-8?B?Nnl2d2d5YWtlMlhIS29rZk9XTzAxWUFtRk5UN0VFdHJ6QkxxUUtoU0EvSWdF?=
 =?utf-8?B?VHRXVHM4YUQ3ZFdVUmpENWowOUU2V1M3ODFhVmdCOEhhV2Z0TWttYUJOREYr?=
 =?utf-8?B?L2VvNGJHcloyZXR6K1g4Y1ZQOVlpVDY4Vm1vUHBRMUVUOC9DdlhKeExheWd0?=
 =?utf-8?B?cG8vamREWjFiUG5WUkZxWGlXV1BtREZ1NHRHWldyV3NvSUZycmlzc2RLOXZM?=
 =?utf-8?B?N1FHcnREMEVudFFVdXRIWDZEQS80K3grbWFOL1VNSG5EQTh5cTZhdEVvSDZP?=
 =?utf-8?B?RE9aWkhENXNkWDRBR053YS9CeGRYeGg4MjRoYWluRUtER2duaVZXM0YzYTJx?=
 =?utf-8?B?ZE5DSmZXbXJsSXZneGJRbnZKT21EY0JUTmFWN0JjT3FLSDZBd0cvK1IrYS9q?=
 =?utf-8?B?ZktzZ28veWtvb3BqaW9hMnJtV1ArMmZEZjZvc3pwVWhhUFRTREFBRThHYi9m?=
 =?utf-8?B?a3prVkNnS3I1QWJCNCsvZ0FNZ3RPY01tQkZ2eG5IS3YwZDhZSWYrY1JBOGRB?=
 =?utf-8?B?STUyLzdvRjJXVjRFK1dWbFV5Z1RocGptRTA4NVN5MHR0N1RWRnFXbllhUXUz?=
 =?utf-8?B?RHdYak1lS0ltcTNqZHhsUkhhSXhkUmR1a2o4VjlHdncvYTdkVUhCL1dzeHB5?=
 =?utf-8?B?MHg3MU03aTlhdFo5L3NnMTBCV3pZOHE4VDE0SDI5cVI0U0NmRFpySkY3eExx?=
 =?utf-8?B?cW96UE43RUE0WnpGYldmdWhJZmkvcW9uOSs1QUhNN3E2K1UwTHljTGlsNXZG?=
 =?utf-8?B?MXUvSkJNY3EyRnY2VXVya1NoaVF0ak0rUXZxWGRXZHRQcEVUdC9JYVlBQ2Yx?=
 =?utf-8?B?QmkvUDRKSnBnenJSQThHMzFGNlN4bWIvNC9Ra0RoT1JlV3hxckQwYmVJUjBo?=
 =?utf-8?B?a0dqZkpFcTZDcm5tZ3FvdmcwV0VyT0kyTlNHajRJWGtzcGVvcFJMMXVqeFhP?=
 =?utf-8?Q?xnjdEbvQ3Gnl23J9zQtUhmI6iCX6rY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(19092799006)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eHlobFBiWjNUQlZQQmd1dVdKZWlkQm5wNlJBYjgxakRCTkdjMUd0YmFxZHFq?=
 =?utf-8?B?RFQyR0lUWFVPcVpZY3BUTXlPcEs3bFhqbi9NOTVHcUVWSFY1aGNHNHUwOWYw?=
 =?utf-8?B?QTZVQk9jSFpYVnhMNGZOMy9FMGZSZmhHRWg2a2I4WUtobWJSVFhCNko1Y1Ir?=
 =?utf-8?B?NGZyelk5MVo2UCtWVTB2RjJXZmpZYXU1UEZnUm5CYnhrN0poNkFmK2d2T2lU?=
 =?utf-8?B?UCtuVE10K3FpTHJRVTFxZ1A3TzVoMkRMUDRHdDBYTENnYTZXaTVtYmpoaEVy?=
 =?utf-8?B?Zk9lMXZDeE85aVlQV2YzMU0rRGxzMkFGMjVLR1dhV05VTGV6TjRKSzlub0o2?=
 =?utf-8?B?U3J6Y3pidThEZHNuaUlDNFdWem1sWm1kYkYvQ2RNU0hOMkxHM1RhT25MdU1G?=
 =?utf-8?B?QXI4cE1RcTMvTWhyUnpXVHBVWThRSVlEbE5JU1RMckFjM3JuVXNLVkRzTkt5?=
 =?utf-8?B?UXNZTlRHc2twZXQ0N0NXUjNjaDhiRUZvMHRBdTJPcktQNWR3SHhEaTNRcjhT?=
 =?utf-8?B?SWh1bWYrVHV1NE9sdmtZQVpWZkJycythOXJFV0llZlR3U1ExZnY5N1FWZFV6?=
 =?utf-8?B?aDJNaVJienh6bHpyaGZsVk5PcmgzdnFsNmJSNHoyTi9ReEZTcXhmWnpVV1ln?=
 =?utf-8?B?SlVVcSs2bWZkZk1tUUJaWkpHYTJablhiaEdrT3M1VjB2V00vdXZ3dVJrY2RL?=
 =?utf-8?B?ZjVkakdBaUE0anJ5eUpoVkZDWjlrNUNqZFBTQ2NuOCtHU0F5Z3p0MFlTemlD?=
 =?utf-8?B?aGN5ZVpkTkdBYWxEZDQxNDhyNUpTNkYyaktGWlpmNUtQMXFMVWxwejhDRWFo?=
 =?utf-8?B?T0UxVXRHaFdvZDZDWVNsU3F4YzNrSmZqVnNEbVpFQ0tCNU9ra3VVVDhaVndD?=
 =?utf-8?B?d3ZpSkdUckRSYzFiOFJYVSsxV3RWSGdiUzd2bFF0aDQxOVJnMktjb3FaU3Fu?=
 =?utf-8?B?T21ZaTVxNm9IdjUvNk5Va0tFRWE0Y29IN2Z6RnQrcFFtZjhIc3R3cUZiQjNW?=
 =?utf-8?B?Nm9EdWU1VDk1dXNFMVI0TzFKbjdhUEl2NXpNTFVldFRiZ2xUMnpxbWlVS2FN?=
 =?utf-8?B?RXhoZ0pXNjNKZXZGTWN1VHUrS1ZqTXVzY3dnUGVhWUNjQXpZYVR4eEJSR2dG?=
 =?utf-8?B?UWNkdFZlQW1RdGY1S2dNVjNUVlhONDdYcEhvYlF5V1kzbkc2MG9YSkZiYUVr?=
 =?utf-8?B?bzZBRi9XSVJsMXdPdmVVUEdMcE5lVmpnemRPcTJjWDhUb1kzZGpqdk5VVFFS?=
 =?utf-8?B?ZEtTNEJoRnVGdXU1cWxscDkwOXdUbzZoR0p4NjRlc0VjdFpvR1dQdUFsNis2?=
 =?utf-8?B?bFNzNGd0TzdSVlBwSDVPSGNGS1NMVVN3d2k5aXpwbUZxeERPWnFPeXJjL2Vh?=
 =?utf-8?B?aU9mMERUZG9UZkxMMTlXYnRnWWlMdDMwZWxzSkdnMHFieGVQN2EzVXJPVDhj?=
 =?utf-8?B?ZVErNHd2c3VmeVNzb3F5c3hHWEo5WWMvUHdVbCsvc3loN0Z0cVdFRVpxaTl5?=
 =?utf-8?B?ZEJubWUra0pHWU9PUTNaMHJ6bGVqakxLM1dRTUxYOFBtYk1La1RLMDdNMnVL?=
 =?utf-8?B?U0ZBTlNyS0JsMnIvNndTVW9NMUF2aWk2RnhIdTltK09lL0J6SGxDdVBiUHg1?=
 =?utf-8?B?SHNCS0RKYnErdGRUbmpiKzVBVXcyNHRMazNiMFN4QzNwSllWblZ3b3RvMDky?=
 =?utf-8?B?dWlpeUR5bkFhVWk0cEVMNmV4VkY4cWNTam91YkcxYTU0NTROMm1aVGdQZTRm?=
 =?utf-8?B?QnNPMWw5WXVpdm9QSjk2ZEdPZjNscDVsam94eDVtVzRkWlpVeWd0Nkx2SkZU?=
 =?utf-8?B?TTJBVW8vMWY2MC9LQ2lOVVR3VXJMMkM1aDRZMkhaS0J2OW5VajFmTVNmUHBS?=
 =?utf-8?B?a1BmK0FWK1BWN3g4d092OUUzbDdpakN6ZlJnL2JxU1g5cXltd25RczBRQ3F4?=
 =?utf-8?B?dFdhNHRsdFRHY3puWjh5WjZScDFleVdKNTdmSHc5MEs5Yy83RHJEd29mN245?=
 =?utf-8?B?Q2JndE51RkFlYkFUc0xpMi9MTGhRYWNRNGtzNVZzc0hjMDVxQ1YyMk9GeDBy?=
 =?utf-8?B?cThQalErbnB1S0xXSUFmS29aRGRIYXBGWndjVTNneDFteXFCL3NNeXBKTjJk?=
 =?utf-8?Q?CPezCEAAZRfDow66ddUhYQpVq?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de3e8af1-a8be-4df9-2146-08ddbfaabc8b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 12:10:18.7652
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1C9nOi29q8g8KdU9QpF4w6D5DRuZxWY3FB9DI0Wsz7RCxUqMCxnXRx6bGthwVuP3YxxVvDhA6K9INmF2Aw//Wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7983

Add imx_rproc_cfg_imx95_m7 and address(TCM and DDR) mapping.
Add i.MX95 of_device_id entry.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 11e911ac80bafbc58e10e6fec9f703a30a686c3f..e40d40e208e5f485c2da3a0f06d6775a10c2fb47 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -73,6 +73,10 @@
 
 #define IMX_SC_IRQ_GROUP_REBOOTED	5
 
+/* Must align with System Manager Firmware */
+#define IMX95_M7_CPUID			1
+#define IMX95_M7_LMID			1
+
 /**
  * struct imx_rproc_mem - slim internal memory structure
  * @cpu_addr: MPU virtual address of the memory region
@@ -126,6 +130,18 @@ struct imx_rproc {
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
@@ -372,6 +388,14 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx93 = {
 	.method		= IMX_RPROC_SMC,
 };
 
+static const struct imx_rproc_dcfg imx_rproc_cfg_imx95_m7 = {
+	.att		= imx_rproc_att_imx95_m7,
+	.att_size	= ARRAY_SIZE(imx_rproc_att_imx95_m7),
+	.method		= IMX_RPROC_SM,
+	.cpuid		= IMX95_M7_CPUID,
+	.lmid		= IMX95_M7_LMID,
+};
+
 static int imx_rproc_start(struct rproc *rproc)
 {
 	struct imx_rproc *priv = rproc->priv;
@@ -1308,6 +1332,7 @@ static const struct of_device_id imx_rproc_of_match[] = {
 	{ .compatible = "fsl,imx8qm-cm4", .data = &imx_rproc_cfg_imx8qm },
 	{ .compatible = "fsl,imx8ulp-cm33", .data = &imx_rproc_cfg_imx8ulp },
 	{ .compatible = "fsl,imx93-cm33", .data = &imx_rproc_cfg_imx93 },
+	{ .compatible = "fsl,imx95-cm7", .data = &imx_rproc_cfg_imx95_m7 },
 	{},
 };
 MODULE_DEVICE_TABLE(of, imx_rproc_of_match);

-- 
2.37.1

