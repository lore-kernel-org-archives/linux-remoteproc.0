Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010040.outbound.protection.outlook.com [52.101.84.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5CA12F7AC1;
	Wed, 19 Nov 2025 04:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763526135; cv=fail; b=t7AUP4y3uQXU2x50jhdGEHZKybqPN/qaI4bPd+GPpFYoMyIDtpbemADrOn4flw8P+eEldF+ZfwhFMh/ppd7zXeSVcREdaYj+hZ1OxecTkAH0pXCfn5AvnrvUJuLOz9HZ/JtRjnRmn8nRgqea/ha7BwGYHaGn0zW9l3rmyOKZeKw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763526135; c=relaxed/simple;
	bh=KeI567OKUvAlmPOT1KzJdpkec9P/E1kAZ+S2e1GFxZ4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=N9KqVKJ7LD3uTBhmTCPjvNua1SjC9XX94acoFWJ/o9mNvv8/NxwyXTkkHolNqxABRl+uXG1j2Qkl824S+Zb/d3Bt3eqCYWANkHsCOd8VykOf7ribsKwk4DBWisgo+GT9seKxImDRKZZefuXmvErZiO83EbaHI2DhAO9NhKFbO9A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=AFVcR5qC; arc=fail smtp.client-ip=52.101.84.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="AFVcR5qC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TZ+PpAbDcCa2mlx2CIMeDSlcG6iuLj7US6qdgw1spFEhOuPT2+8Y3VNFCxBlv/tGJRkUQcWIW/3JhxF23D71cmB8EhESEPqwoYxNGUFOkBkCJ17R0URSbn+E6Wv//yUtgCVEbBg60g0TdPrOg0EuEymsJ+RyUbXax7qBxCEpgVpIR+qMaSvDthJIO6ldi/UE45m7v/1PwDTu70RWiIjpOu3KFeHwzjEhj1KGWOMtMHLl4x8YfPsqFjxsw8GGna0WVx8qmdqJaacg9SY/QpnA2W5SG9R1Jz8d4C93kcnp898G+UUmSZ2+7JYcU+rQNg2RD/dJ6MxQ+PeVmh8dBGFwJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VrPgNiKvSX9jsS3EDBsOZuKIMOD/ncgnQkk6gizsFQ4=;
 b=hRLH4bWUD45PtLJRHfbquLQIPu6DNMJY6JL+vkWtlOvgbiaxXfsELSrXVTkuOxxBGJ5q1e9Vln+pvpskVdaOAGmIaWBGun3p/zUkuhNZK2ktkrkLTVaa5W45Y2jAGWsF7s50/JBFQVT2rjcHp/ec+GJIeJAoz6qOcI8oE3Npjyev9BwXxKOxgKErKuh7ZFYG9hZQcKlEUtgdpAwQdADiha8r3AMpqxiTuAHRdl0DqkxKXcR4lQYuhyTill06Mes6AlJm1E/lMNvJbufoAYHHkt2nnhuwbMkylAG5hPZFV83+O+k3MqE8eoCWT/i8ClegWqhGeI8m9BQ/tND8UwziGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VrPgNiKvSX9jsS3EDBsOZuKIMOD/ncgnQkk6gizsFQ4=;
 b=AFVcR5qCuyEKiIBloiLK6eWUHAX9fBsy9HhcoO4dwajZxx9jjk/bx55zjBmLZuDDNNSLQYO9ZWaED+Mer8V1E/TISgKqdGUtsLvii1SrOPHav+OjAVv6S+j3R9vjzFXtE6PUcDBOcU/XsabEQe4NusxrE4GwwD9yVX0AGNp9hvCnN+wFnvFgZiUbTpS+e5KWpS60dEdzLeKDKSv74bgs5IlEwUT7DhC8W6Ub9vb4A/jKIXEuquo58xnUDzspyIgpHe+bTC9j+NIS287Mt3gc5nqWUs2T8mbZpa879LGNMgTra1V5nvx37T8BbGebmCoYu4N/xTEBp7jX8VTEUe02SA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA4PR04MB9319.eurprd04.prod.outlook.com (2603:10a6:102:2a6::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 04:22:07 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9320.013; Wed, 19 Nov 2025
 04:22:07 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 19 Nov 2025 12:21:46 +0800
Subject: [PATCH v4 01/12] remoteproc: imx_dsp_rproc: simplify power domain
 attach and error handling
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-imx-dsp-2025-11-19-v4-1-adafd342d07b@nxp.com>
References: <20251119-imx-dsp-2025-11-19-v4-0-adafd342d07b@nxp.com>
In-Reply-To: <20251119-imx-dsp-2025-11-19-v4-0-adafd342d07b@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Frank Li <Frank.Li@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, 
 Iuliana Prodan <iuliana.prodan@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI1PR02CA0005.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::13) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA4PR04MB9319:EE_
X-MS-Office365-Filtering-Correlation-Id: 471efa9d-e181-4647-e3d2-08de2723334f
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|366016|52116014|7416014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bitma0VRSFY3RTJBUk4rL3IvSWk1WUlmb1ZObGs4ZHYrWXVoRXh3cEhGY3Bs?=
 =?utf-8?B?NVI5cjZ0SkhCRm5KaGJDSnBlbU5ZYnFZZkphWDhvYXpyYWlFY2dPQ0NXWktt?=
 =?utf-8?B?WnJYWkdNNHVyMDl5RlpNbUthMVhVc1ZvY25uaTl1RnR1c2JqV1IvMGJBcHNI?=
 =?utf-8?B?QzZDNUl4a3R5bzcrcHN3SlNCalZnRVBGODhUZXl4dFFIVTBtTHh4eTN1VDNp?=
 =?utf-8?B?NXdXdVRSUDVMV2hOd09qL25lMVhhdEJobWJ6NkJHWC9CSXBBSk9KeVBkVGov?=
 =?utf-8?B?QS95QVdXSmJIZG1zcVRHSnFkWmY5ZXNuSXJFUlJJdXBXVU1xNmdhUG9rWDU1?=
 =?utf-8?B?YnhFR2xTOExoOE0rdEtzMzBiR0ZDY2VHOG1PQys3OC94bkV1T3owM3d4ZTYy?=
 =?utf-8?B?WCtuZE9udTZ3QzdxdUM4UXB0SzU5RnY2Q0poZ21odzNjWDhZczFmZ2ROUWtQ?=
 =?utf-8?B?RHF0Ny9FS0w3YUpUTWRYTUR3cVFMQW1UOEVpMmVsMituRGswRW5iZzNWUmcx?=
 =?utf-8?B?cEh6ZXZNYlZMWlZXRVRTdXVKNWFzV1lqdjlBODJEb2QyRTNJVlR3eEpncERH?=
 =?utf-8?B?ZEJoU2ZURWxKNGZrNTY4aWZqM1lmRkVQa0lYR3RHSUZoeGt1WUxpTXVCNGdY?=
 =?utf-8?B?eC94UzJUendKK0FCT2FmSnZEcHIzY2xTL3RhUDZvbE5KSnhheXNQdW5rWFJW?=
 =?utf-8?B?SlJIUHhYRVlNWGRHclRHZmRzU1h2SWlSc1dOVGpRb3BnQmJVa245TVVQdnE1?=
 =?utf-8?B?eEdENjRhbHNpUFhKUHBXQnlRZTllQjBoSUptU1lQdDJBV24yK0t6ZU11YkN0?=
 =?utf-8?B?UW9PcEtCTFc0dHRXNjEwNEo5b1U1YzNyWWxyd3UxQUhTaEw1UHkvUlVJNk1o?=
 =?utf-8?B?YW9QMFdxekt3bjVoSVFHOGNBNkxqcktoaXQ2Z0pEZkFZOUdkcStLTW1VQlJJ?=
 =?utf-8?B?SmZGNzJPU1NhUXo3Y3FNZ2hHSHFjRGJZTTAveTkyc1gvRWh3bllVNWpMM2xy?=
 =?utf-8?B?K0VCU01rUDJ6TDN2aVNMeFNvbGx5MyttOGtNWnVCT1VnVEYwTTFTVHI3Qlh5?=
 =?utf-8?B?ckZ6WFlPbUltdlhnTVB3ckNHdEVYU0FrYk9YVFVoVndxdDFKa0dKUWtKR0Qz?=
 =?utf-8?B?ckRzbk1GM0tLM0V2WURKYWVuc0lrZjVZNkN1SDBpSURsU0lWekl3TWFXMjcx?=
 =?utf-8?B?TmIzeE9GUjVyUlVlbThNaGptWklLaWZDbnBEM3pCOVlmZjRmQmdDZWw4TzVG?=
 =?utf-8?B?Q05KMWZYajRxM0JqeEF3bUJYSjhxaUZieEd0WkVYYWI3bncwN3BJRjQ2ZHFz?=
 =?utf-8?B?WEFEUm95RjFtUlZnWStmQ0Z3ajkraUNJZUFNL010V1I5aGF6ODR3STZBeFNK?=
 =?utf-8?B?WjBzYzlxSnVZZ3o0a1B5YWd2NWtFZEh6dmFyUWVjWFpxT1hyYTdBa0ZNRFRC?=
 =?utf-8?B?WHBjMW1JbThveXJWWVBRb29YMHY1SjBDVVFuVnFCRGpubkpLZXRScG82NWI5?=
 =?utf-8?B?QXBJM1B1TllmaGE1SUE4Vk5oT3dJd1hTTkFIeFZjcEFJYnpBUE5NZjFxeVZ4?=
 =?utf-8?B?Z0hELzhEN0t0MTBKaFBJUmVoZlZSZHZUVGduS1d3TlRwOEdYREhodmlja2Zw?=
 =?utf-8?B?ak93ZTdUdHovNWp4NzJXdGpjekRIYkNRR1l4SXkzN2NYdHRPMTZBd0xJK1dy?=
 =?utf-8?B?RjNPN2YwVkh3UXBuM2diR0h5aHpyUllxd3h6SExWNjRMY1JlMFd5dzM0MHIw?=
 =?utf-8?B?QS9NNE9uSmdWUTVXQzV1YmhZL0REWTR5Y3pkU2dibDJqc1V1dHhRQzVySlNo?=
 =?utf-8?B?NDdMemxFT2tWSlVQQUd0RVNLOGppMFhMbUR4YkJCY2ZpbWdNOEN4UUtmV3cv?=
 =?utf-8?B?VGdpNnZqd0g1QlozdzM2OG83TnlmNUViV1VDV1lRKzdNdURFZWoxWVJHYnBz?=
 =?utf-8?B?NkdTUHgrM04zdk1KRGNSYXZNTElxeVkzSm5lTVM4L3BTRGZZR08wdE40QU9p?=
 =?utf-8?B?eVBVSHFnNGNRdGVUalBHZ3REVi84YkREK0JtTkUyKzMrc29mOG1DRzBNQ2dk?=
 =?utf-8?B?d0JUd3RpYVo1czNDTXVNdXN0dFZwWWNlMlVRZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(52116014)(7416014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bHRBZXc4RW5XT2NmK29PVHhWQTFvc3ZGK0JpRDZKTGVXMlVPVVlFVDZwYXdI?=
 =?utf-8?B?cHVSaFJpcnAvUVdtSmQvdHdtZjlJRUVZYVFxT1VxcVZCaGVpR291Yy9GRTJN?=
 =?utf-8?B?akVJUjJ0dFBmQjIwMVVwRzhhOFJ5Q2ROb2hPaVFhQ0E3alFNV0VPMnNHanA2?=
 =?utf-8?B?RVVPdVc1NFZ6bkgxbnBCN2NaRk1UVlNzdjEvOWRoN1BSUjFrWEY1bmE4akIr?=
 =?utf-8?B?aUhFeStPaHo0MTY1Q2tEWFppMHhvZFdWUi9wbGh3SWJGeEhlSnNRMTZWalBr?=
 =?utf-8?B?YkdOTmZBWjVFMmFaUW9rUDJkMnVQcXAyNkNXY0VrUVVaUWx4Tk1odWxQc1I3?=
 =?utf-8?B?T2JCVXEvS0E0MjI0WWZDY0l1WVBEM1h1QnZkOGt6MTIrQk9DbnB3TG9kNHFj?=
 =?utf-8?B?d2ovQU5Ya0crRW1tdHhaV0kzc1lKWlNpanBSZmZsYytWR3E2Q3lqaEJhZTV3?=
 =?utf-8?B?bXFHRWZXOE5DdmgwK3FHazR2akZCYzJBeTJ1NVpEell5UG1remg2YUNyTm15?=
 =?utf-8?B?Rm45WGlKWXo4b0ozZnRpU29nMzdFQktYZFJlcFAyZVhDREUySndqOTc2VWZF?=
 =?utf-8?B?bnoycGtqblFqb2pKNU04M1EvNWpwcjkxY1lVY21sNUt1ek5PV09GVnNFSjZD?=
 =?utf-8?B?WjBGOGZSbXNtZVB2UllBK3YybVNwWWdZT25DZm10WjN6VVdFdFk1UmdROVh3?=
 =?utf-8?B?SmFYNFJPRU1ZdFNndXkvNjVFVTN1T3I1SzVyR01aaFhoWk40eCt4czJGSGVF?=
 =?utf-8?B?Y0FGSUJYaHVnYnVuZFRDbVJwUEdLTzJGS0FNYWVTdG1xcFpBdGk0MkJNWlFh?=
 =?utf-8?B?Qlh2ZldLS0dBV0JqeHJJNDg0VzZWQ2dnVHJienNEYW1QSmxxWUxPMnJxVmhH?=
 =?utf-8?B?eWNVUElxb0s3VkhXZlNQQ0FrRm0yRmUxVTVlMW9VbUN3TytOMFdLU0RwMW9V?=
 =?utf-8?B?YzlXK20xZnB2bW9oYlpvRDRIMy9UNzBxYkV5Z0pPUEVTTUs5V1RXaU43Z1Bp?=
 =?utf-8?B?VDJlN2VmM0tRai9nTk9QVVBGOER0RDRNRklUb1VwTFFiY3YvSTY0MEVTWC82?=
 =?utf-8?B?Wk5NTzY4Y1ZadnNjRUxodVFFWG0rMDN1bEtxc3UvZkQycXdjQjluK3IwMFBE?=
 =?utf-8?B?L1czUVd5MlhOZWdQcUZwRDFaWmJtUUt2bmxzYkdxZ0FDNnNpZ2NzT2Y5WkN4?=
 =?utf-8?B?UTFiNFJ5R2lJTjZxMmhreU0yZ1BIVUpCSHUyb2RJNGZOSzdYcUdUTXdXOXBS?=
 =?utf-8?B?dGZSbU5wWnZEMVNsVHpJK0s5VHVSM0tNMU43TkpuLzhmMXAxVjVYcXlpOGpj?=
 =?utf-8?B?N21PQ0YvMDcyd3hlQTFqUHQ3L3NuWWVtQWJyc01TazhBQmxWVk5zeEJJanBV?=
 =?utf-8?B?NzZDRURUSGZDS1NiLzdVb0wyRm53Yk5HTmc3UWlScG45bjRwbHZIQ29ieVN6?=
 =?utf-8?B?cGt1OEZTUFlBRS82VzlaUW1xYmRsR0paVjZKS0JXaDBhbi9GKzYvL2ZMUW95?=
 =?utf-8?B?M0pPS01haUNMeDU1OFVrV1FzU0lwNDVxQ3JPVExWVzNxYUhGYVNwOVNBQk1p?=
 =?utf-8?B?SjZXYmJHRkRPeExJRTVONzFiSVEwZVdWUmxYdlFhUE1zMG9veUoxQkdHc2lq?=
 =?utf-8?B?eGR3b2NUL2ZORXpmQ1B0YXlSSTU3T1VJbzZNd2RZdjhCdEdENUx5UUg2L05P?=
 =?utf-8?B?b21jcmpRQTNXc0R5dHNSZ0lTZVNJRnA4THRLdlNlbDltMzYvNzRSdGZFb2U3?=
 =?utf-8?B?aFFXeUJ4blVLd0ZGc3R6amljTnhZUldrcEhqNVBWaXowZ2IwODFFdUVQTjJo?=
 =?utf-8?B?WnlqZFV1WDZ1alBrMUpib252eGsrRE9sdlpVZENrVkhkNHkzMmUrV2JoSDRr?=
 =?utf-8?B?WGhaTi8rTnk2cmhZWHg0WENHVVRDQldnUFZpU3VjM09zbDhXeGwrV0g1czBS?=
 =?utf-8?B?djhCbzdpbUVaakNHaEJZRWltOGFPS21vL3NLeGoxRUpyYkthSzR0RFdsZS9G?=
 =?utf-8?B?bXZTa0pkd3lpNjkzcTRyQ1ZTKzJoMi9kZ0ZlbFI0OHN0UW52TnM1eUxxU2dO?=
 =?utf-8?B?MGdLVHJPNUJsT3FQS0VwUkxlZng1RXUxQ0lqMDVnMmFTQ3htMFY3ZWZLNVdM?=
 =?utf-8?Q?rbKm9+lRIa3GIT4HYF9czni1i?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 471efa9d-e181-4647-e3d2-08de2723334f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 04:22:07.3389
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M3dCdN8P3RfkCbGYIeGzdVmiR+mvZvYcjhaMxcwy6k08f6nlAkck0FDQ1awfi+a+oPhsGI7n8JLEjB0zWnlGRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9319

From: Peng Fan <peng.fan@nxp.com>

Refactor imx_dsp_attach_pm_domains() to use devm_pm_domain_attach_list()
directly, removing manual detach logic and simplifying resource management.

Also replace verbose error handling in imx_dsp_rproc_probe() with
dev_err_probe() for cleaner and more consistent error reporting.

No functional changes.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
Tested-by: Iuliana Prodan <iuliana.prodan@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_dsp_rproc.c | 30 ++++++++----------------------
 1 file changed, 8 insertions(+), 22 deletions(-)

diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
index 6e78a01755c7bdc28cd93f00fe6f74affc3d96b0..1f7d15227ce4fad46ab4c6d71774cf0560b9529e 100644
--- a/drivers/remoteproc/imx_dsp_rproc.c
+++ b/drivers/remoteproc/imx_dsp_rproc.c
@@ -1062,14 +1062,12 @@ static const struct rproc_ops imx_dsp_rproc_ops = {
 static int imx_dsp_attach_pm_domains(struct imx_dsp_rproc *priv)
 {
 	struct device *dev = priv->rproc->dev.parent;
-	int ret;
 
 	/* A single PM domain is already attached. */
 	if (dev->pm_domain)
 		return 0;
 
-	ret = dev_pm_domain_attach_list(dev, NULL, &priv->pd_list);
-	return ret < 0 ? ret : 0;
+	return devm_pm_domain_attach_list(dev, NULL, &priv->pd_list);
 }
 
 /**
@@ -1186,45 +1184,33 @@ static int imx_dsp_rproc_probe(struct platform_device *pdev)
 
 	/* There are multiple power domains required by DSP on some platform */
 	ret = imx_dsp_attach_pm_domains(priv);
-	if (ret) {
-		dev_err(dev, "failed on imx_dsp_attach_pm_domains\n");
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed on imx_dsp_attach_pm_domains\n");
+
 	/* Get clocks */
 	ret = imx_dsp_rproc_clk_get(priv);
-	if (ret) {
-		dev_err(dev, "failed on imx_dsp_rproc_clk_get\n");
-		goto err_detach_domains;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed on imx_dsp_rproc_clk_get\n");
 
 	init_completion(&priv->pm_comp);
 	rproc->auto_boot = false;
 	ret = rproc_add(rproc);
-	if (ret) {
-		dev_err(dev, "rproc_add failed\n");
-		goto err_detach_domains;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "rproc_add failed\n");
 
 	rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_XTENSA);
 
 	pm_runtime_enable(dev);
 
 	return 0;
-
-err_detach_domains:
-	dev_pm_domain_detach_list(priv->pd_list);
-
-	return ret;
 }
 
 static void imx_dsp_rproc_remove(struct platform_device *pdev)
 {
 	struct rproc *rproc = platform_get_drvdata(pdev);
-	struct imx_dsp_rproc *priv = rproc->priv;
 
 	pm_runtime_disable(&pdev->dev);
 	rproc_del(rproc);
-	dev_pm_domain_detach_list(priv->pd_list);
 }
 
 /* pm runtime functions */

-- 
2.37.1

