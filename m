Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013005.outbound.protection.outlook.com [40.107.162.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1D61A262D;
	Wed, 17 Sep 2025 13:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758115196; cv=fail; b=ml0NoNNkZnhzDlmYvkOkQF4iA4ewKq1xD3LuQg9p+Ugdst9FCUtPfW7Nz9tYY17QaJc7QIMWulLeC7yL1Zn0nsTOYr/UEx1hTxz6tTHN/d4cWYwel33/bpuykCNjCayTBGjfN5ZtYdqGIWF1sqkZmczbWh7NpWBJLYxd68nteRY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758115196; c=relaxed/simple;
	bh=PqqGJoxSvEH+lfUeLuE4bZoVyQT7HHUA2RLx3qfsCEg=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=LjZfWH2skAW1IGHqXKge/hFmjiUVGUJRiWqY4lL4XnNmoreKLzmUmaAMb52KmnyzE4rGjt+hbrwbSE06Wa7tlEmaDgrOuBO5MuYZUCBCsyRYM/Xj6em2XUcLLzpJRYzkhmdBevNf3Nc/AIUBMEK4wz9rx973+ov30bYpf7PyF4k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=C/latQfm; arc=fail smtp.client-ip=40.107.162.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="C/latQfm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sdK4BP/YscZ3ud6hPNahp52LitSd/0V+gb2vamVZs5G0X3Gbl744uB72eNLm/fLHTWGC12xE4D35cMUYU0RKQGRsOqM0IeJIrjEY/CviIuF7I2R3ZroVeO6yK8iZppbomMhCtaTxszpZKJPfEQlSWkn/uD1B8HYtlIVyQzcLCK956+wtSzLlNGQVVQ45F45lfjGW+SHWo52KYtS3OpWjxnOkAPxaqHHqZvpbr4rUkrKN+L6WjrK4JjyUq6M3G52LRZAIvd2d9QZmYS1ueppk7LfkbsNRgGmYOOEAeLwtvTUREVIfewvm9S6e7J8A/61FVYRQGvzMnBPgkNJzPUp3qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LYCZImqUbrRLDLO7pcrdDy0R4T7m0LqbZG5PZWwIDVY=;
 b=Xihu5s02AWPQ/AKu73alDXP0H7SIicQm5bwB9saxMCCzMcpIsQecDXAk997TxND/l/78gGpC4ZvtXmY4I638/F5eeI+N0xu/1DxyJTA0hv+7KAiHy/wulwS3uLGc3ThaHt+xzTqO3MP+bAusEXtt4zFHSiHHKk2ySg2S+6Lqq+MLBZpHynzLvAMqZ5x388P3LSHqqiCFbN8F2BrffGpMXmvKEJvvUv4Lb3KD3UJbzudknX7RDFe72U/mxnqcMs8JJzrZWgr78ZEdqIcTsV75UA9H/e50+4zlaUpQzFnVNFF9KEjTZzJxTNL8aasm6hqidpDMEgLAp6VKIbSb0/Ucjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LYCZImqUbrRLDLO7pcrdDy0R4T7m0LqbZG5PZWwIDVY=;
 b=C/latQfmpT1GK3LudpUkvF7MySP3fWIeo1uMQYyGSZqfwr7w7tZ01rZxnqYPUX2d+dFP7OjJZ7wHeKDC/ms2a4R2NpS7EQXONUQHQeyASk4qO1oLH1Ks1EZ+vIW0NNrtlXU+Hr8GZOsHze/I3IYwWXah5xIzwYyzYGNFc19W438/TPnldEvoTVmP+E5Iv1W6Io4EJRbF3rjRhGmxxMjbYzRCOtjL305ywjhlRSb/zP3JCXo2IMCWprSmRC13nCRXWGBNzk3qlCMuFlvk3TUM7LN9YRu99Gb3FmiW9p73M09PFZrXgdi8TZLhN9fNw7l1YC+n0Fmx3xjQFr6H9OkkaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB9PR04MB9751.eurprd04.prod.outlook.com (2603:10a6:10:4ce::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.11; Wed, 17 Sep
 2025 13:19:46 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9137.012; Wed, 17 Sep 2025
 13:19:46 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Wed, 17 Sep 2025 21:19:14 +0800
Subject: [PATCH 2/6] remoteproc: imx_rproc: Use devm_add_action_or_reset()
 for workqueue cleanup
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250917-imx_rproc_c2-v1-2-00ce23dc9c6e@nxp.com>
References: <20250917-imx_rproc_c2-v1-0-00ce23dc9c6e@nxp.com>
In-Reply-To: <20250917-imx_rproc_c2-v1-0-00ce23dc9c6e@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Hiago De Franco <hiago.franco@toradex.com>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758115170; l=2091;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=PqqGJoxSvEH+lfUeLuE4bZoVyQT7HHUA2RLx3qfsCEg=;
 b=4p9QlK45+TgkjZOtCR1r6oGGqwL9Opw7AaIrWwgv0TH6XhI0r8y/W2qbYUeZC1tpq5MHmhleW
 TpXOUFZuKbSBIKJ+FXFUJc7o+RCj6Aqf5LKp+U2mz0Tq6E+xUReT7+P
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG3P274CA0016.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::28)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DB9PR04MB9751:EE_
X-MS-Office365-Filtering-Correlation-Id: e0d63f3d-1a88-4416-7e26-08ddf5ecdf6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|19092799006|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VjhEc1B4eVF4eDNqN1Z0RkZybUl2RlhaMC94eUFwM0ZnTEJZdFdjQ1lIajZV?=
 =?utf-8?B?ZVdvY3RkNGpIUDJaVXhCVFZOdUhaTGZ3M09WOE00Rk4xQzlkMjRwRjM4TEUv?=
 =?utf-8?B?TTBDQ3dnS1RpMm5nVWNMeGMvMDAzVGxpb2JWMjc5TWtzakd2SlV0bzN5NDd0?=
 =?utf-8?B?SnJZMFBWc242Q0dnaHNHYXBOSDcrR0c5cUp0ZnY2bmtFZlRJMlk5Z0dPUW5T?=
 =?utf-8?B?WW1yYTZ1c1l4UG5jRWprTzhlNTA2TDllNXBCKzllU1p1NTFCR2NZMXJxN2l2?=
 =?utf-8?B?OURHOEpQNHdVOEhES2pPc1lYdkMyU3BaSlRaVUdrb2hzQllHLzM1NDRCZXhv?=
 =?utf-8?B?dDBQWnRIQmxaMGpBYXFuVWJPRUxWejRDN1liWUROaXRiSnBnVFFMWWM5Rlhh?=
 =?utf-8?B?WExwaFF4cXplQlYyNUdwaTZDUWF2dSs3SEdHbzBUcTQ2alpsMWRWQzdWUnQ1?=
 =?utf-8?B?M2NpT2drRDVFaUN5dFdCWlVxWE1PQmxBN1krYWtxM3dCOU5qbHc0bmhZOXdi?=
 =?utf-8?B?MnBVNFJOM2VvNEZVVTBRSjNGdDIwYnNyKzExNmdRZDc5aGlobVhVZTM2VWNr?=
 =?utf-8?B?Y3FEV0JyOEI5dzdNS0ZFWG1CSmgvbVkzZEora1ZwT0pKRUJJcUFmU0I4S005?=
 =?utf-8?B?dm43ei9JajRYbEZydk5KQjlKNzk1ZDlJVHZBTk9pQ0VKSnZmaTBJczBwWUdP?=
 =?utf-8?B?bVo2RUZ5VlFZUkRIRFQwMUxPcTlvZDJQNG5aRkl1Vkw4NHlQNTJubjM0MnB6?=
 =?utf-8?B?QlFFWWdTZUd3UFlGbGpiTWIvanFHcmhQbG1wNURkM2VMem0rUGZZaC80WFB4?=
 =?utf-8?B?NU9GTWxTOXVlZmgzc2V6VHpTZWE2MEJ2RzhTSkxqTFlmczJwenJ0akFGbjll?=
 =?utf-8?B?KzNOT2ZDc3luL3dsOCswdmxGVEMxQzhLZ3RiaVRBQmhuTXd0d2Q3bjd5S0JB?=
 =?utf-8?B?a2VxQ1VrTXk3a2pMcWVyME5URnpEamJvT2tHNzdoZ09vMVAxeHk0Tldac1Vy?=
 =?utf-8?B?cGYzUm1JU2N3eWVxQVlLcVA1YittUDJPbG9UZFNwc0xsSllrSU1GdGF5YTU2?=
 =?utf-8?B?VktxTUk4UXdzL1VuTTlrdGhlUE9BQkNKdHpJTWNMMm42clhCektrR29DNmx4?=
 =?utf-8?B?NDl0WTltWFFlWEYraEZZZnJZaTFWaXJJbDNUa2g0Z1pPM0xiOWdydCtCQm81?=
 =?utf-8?B?UXU1ZUw5UENYaGtmN2p1b3R4VmRoZHF3ZHJCMHZHamdJeWMyUTRncDduWTF6?=
 =?utf-8?B?WGlwWTJkRXpjWm15eU53TE8zOERBaFhzZ2c1Z3o1enNwWVFaMnBrcy9WMHVp?=
 =?utf-8?B?eDI0UEFmWTc5K1p6andidVdIcS84bEN1NUwwOUR5YzlxWlFxT1lyaXM1bFMw?=
 =?utf-8?B?ZVhnZWxNTDJQV0NnYnZGOG02MU1qK2MzVmVlNG5wVTFxaDduSnltM2dQVitY?=
 =?utf-8?B?ZFpZcWVPUFBCalNpdTFMbDlHbm9IRUJCUEJXT1R4N3FNSTJzdVMyZ2JPY1J3?=
 =?utf-8?B?WE9LaXBHVk1WZjZ3bVQyWVVuOXc4RzNzWVdQTnBsOTVNMURsVFhKRUQrVzlR?=
 =?utf-8?B?V29obVBvQUR5Q2xJWEtGQmZCamx1bzJjQjlpYVQvNnJDS0FpWFpvcFVNb0JV?=
 =?utf-8?B?aE5QODAzc1RjN000dzJlbXhFUnY4RXlkUXBKZzZNMml3UmZMZUVvb1ptZkRy?=
 =?utf-8?B?cmpaVXZUNytVZ0VNblExazhRR1NGZUlHTWZwRkxhbElNWkZzenl5ZWxTKzNY?=
 =?utf-8?B?eE9FN2lxYkVJbG40SjBOQzlTY0tsK3pQejFMbERtOHBsUFU2aGZ1cGxBZS9m?=
 =?utf-8?B?blFlNHJsck1BMFJTakxBZnd6WkZrOUZtREpJOC9ZWnNNNlpkbnJoUlBtcGVJ?=
 =?utf-8?B?UXNhNmp4RXppMTYzQ1V6MHUwalNjMzRrbVhQV1dvNU5EeHpOOFJHTk5SMTd0?=
 =?utf-8?B?ZmZZaXV4ckxzOTdocW5xdEZsWE4yOUF1ayt5L3p6MENvNmhPNXRKWTd2bW9L?=
 =?utf-8?B?TURtMmhabWhnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(19092799006)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T0J5NWRlc3RxWEhXZGxoMVlVRlBnYzR0dmV5RkxnMmdzL3RJcVI5SittdnA4?=
 =?utf-8?B?QlRFTXU0cmdxOEhHaGNjRkhtWElNUEZRRmdVZnQ2QTM1a2ViS1d6eWlQemc3?=
 =?utf-8?B?L2ZEallJUXpCRjFOZzJSSTB0S0lZelcyN09WYlRYeWFucGxBVUZsUFdVellt?=
 =?utf-8?B?bDEyVUlMNE9jekpRU1crN0pCYWkyM0toQUNTTFVqNW8rL0E0RHZPQnFMZUhk?=
 =?utf-8?B?c0JMVG10dDJXMXEvNkxONDFKNFFXbGc3YzFxNUFTdGtKUlNDeGxVL21WTC85?=
 =?utf-8?B?QnMxeVc3NFNiV3I5R0pyWUQySTJYazMxN0t0QTQyU3FDTXI1NlZHTyt4LzU5?=
 =?utf-8?B?eHRNQnJTSDM4NTYwQ0k3UFZ2anNaNEgzYmVlZDNGS0hYQ2NKcThYcXk5eGhw?=
 =?utf-8?B?SllHUng5Z0FHL0l0d3dEVXorUmJILzh0LzNEVGFtVm9pSlBLakVsVENrTWdp?=
 =?utf-8?B?Q2NOOVBmOGlwMzZCTXpWdHo4amFxS2ZZeWNPQUxHNG0xTm1CeElndDdaYVhU?=
 =?utf-8?B?ZTRVdnMrZmNxMk9KN0VPbWFNQXVOR255cE5sRjRlWCs4ckJRMzVUKzVlUkJi?=
 =?utf-8?B?dUpFZjFMdjBYSDlWRmFKS0dLYXhrVVozdHZNWjJEMzJoamMwRWY0WEUraXNL?=
 =?utf-8?B?M05OWDQwQnlvZGI2SiswbTdpZFBzbHYra2Vld0Q1eVRUTnZBRGs5OHBIc0pj?=
 =?utf-8?B?Q2EvVTZLVWJUOFBvbGFEd2pTcWFOT3BBUXF4Nlg4Y0tycDRjU3pYcC81MDNI?=
 =?utf-8?B?NjFlQjV3RnhvcHV4VUM2aTc2NVVBdHhSQXFHVlVDdzJWZWlMRTV3QzNqQitz?=
 =?utf-8?B?cThGWXM0a1p4eG53bDJodUkvRmdVdUNTTWtZNloxVVJWbG5yYXFVSWR5Qmhq?=
 =?utf-8?B?bi9IR0dXczAweVpTSEhjeGhpZXFCV3p2RE4wVGRPWkMzUUFUalA0bFVZNHVk?=
 =?utf-8?B?WUVTUTNCVWIydnBSLzl1VEZka0RmTmdkbGcrTDRkdkFOdTVFaU1scVc2WUF1?=
 =?utf-8?B?YnVQeTJtWlAvL09MNlFMRUMvSjBpcERBaGxxL00xeGg3SDRjVUdhZk5QcHRS?=
 =?utf-8?B?c2xlY1BpRENvaXhpOHV0eTBIMnNuZXBYaVg1cWYvTHk5b0dOdXd3ZC9vMERM?=
 =?utf-8?B?QzFvSk56clpEL1VQZ2VqRWtYY3dPYzVYRmsweXNYNk5oSDl1dVN0Y3grTHJD?=
 =?utf-8?B?c3gzaDJHSlAxUVNUSk1wdkhVTXVmOEJDV1lZays3Nmt6MnV6Mmx3NWh3cWpx?=
 =?utf-8?B?VEhNakJLMGNBNWszZ3hwRTluNlhtYzV4Q2Zvd1JMVnk0akg2bk9JcEd4ZVFp?=
 =?utf-8?B?cmR0MmFjSStjL241cFRwejJkRzJSM3Z5dmVMZlRHTCtPbGlIUlJvOGFRS3l2?=
 =?utf-8?B?MTFaQ0RtUHhoRWNmWitoTGMxNzBDNnBIV3EwdHdMTmk5a2x3TkVraThyaEp1?=
 =?utf-8?B?bFJKVWRDbExZeHY0WHJraHJGVWZvZGRnU2J4OUp1alRFdU1qSUtzQ3lhdnI3?=
 =?utf-8?B?ZWNBblJEWEwzcWVMTGp0SUtiTm5uc3ViZzY4SlhMVlovQzB1aDZIUmtpUEty?=
 =?utf-8?B?U0FEU3BXZEtLSllMS284dHlOUkM4ZHBobEJ4ck1aY1ZoUUdSMDY3TCt2MTdz?=
 =?utf-8?B?V3JzbndneUxzTTFrTkx4dHZGcHpyaFdpeXlFQ0pUeUprRWs4Wk91VWRwQ2pz?=
 =?utf-8?B?VFVCVHY4Ti83aU1HTzZDUTN0SDVzSmNqYjJHRjY5ZFl0L0dnVFI2VVkxM21a?=
 =?utf-8?B?U0E2THY1TUJsdnBRTC83U05tWE1VbmNmbXZTL0JWeXY2R1JGbXUvTCthZ0cr?=
 =?utf-8?B?azRyZktQcmpBMHlZZWNIMTdWN3JaMDhGR3dGNnMvMjlKWDRMUSthOERtMWxM?=
 =?utf-8?B?RkhLaXRvanBPWkMxeXZjUXZrUzM2cm9mU3doK3ZleUx5SXdDRVVlNE1mcTVK?=
 =?utf-8?B?QXN1ZFU5TlptVXRsS0dkdURRcVVSQTZkVXN6eS9pVnQ0UURWVEQ3RGhld25P?=
 =?utf-8?B?bnN4S3Btajl5OEZLMjRxYTFmS3M3OWRRVWFBemRjb0ZxUm4wN2d6bzFidEVL?=
 =?utf-8?B?NjJoZHlTN3g2KzBPNFYzVDZCUW05eC9GZDNDNmRvUHVzMWRUMURCNXBINTJZ?=
 =?utf-8?Q?3M733BIGuR38kK9aIq0T7no0U?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0d63f3d-1a88-4416-7e26-08ddf5ecdf6c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 13:19:46.7932
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CLMBkuBSPyWSbkCH2iBukCmD+6UNsBBVtmvjQ4f0NilF8BvZ12rX6WF+pf5R9p6VtodaFnO7YZf9SHvlr56HdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9751

Replace manual destroy_workqueue() calls in error and remove paths with a
devm_add_action_or_reset() helper. Ensure the workqueue is properly
cleaned up with the device lifecycle, and simplify error handling in probe
by removing now-unnecessary labels and cleanup steps.

No functional changes.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 12305f36552fb5265b0953a099ea0d561880e3ff..cc776f5d75f1f614943c05250877f17537837068 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -1046,6 +1046,13 @@ static int imx_rproc_sys_off_handler(struct sys_off_data *data)
 	return NOTIFY_DONE;
 }
 
+static void imx_rproc_destroy_workqueue(void *data)
+{
+	struct workqueue_struct *workqueue = data;
+
+	destroy_workqueue(workqueue);
+}
+
 static void imx_rproc_pm_runtime_put(void *data)
 {
 	struct device *dev = data;
@@ -1084,11 +1091,15 @@ static int imx_rproc_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	}
 
+	ret = devm_add_action_or_reset(dev, imx_rproc_destroy_workqueue, priv->workqueue);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to add devm destroy workqueue action\n");
+
 	INIT_WORK(&priv->rproc_work, imx_rproc_vq_work);
 
 	ret = imx_rproc_xtr_mbox_init(rproc, true);
 	if (ret)
-		goto err_put_wkq;
+		return ret;
 
 	ret = imx_rproc_addr_init(priv, pdev);
 	if (ret) {
@@ -1165,8 +1176,6 @@ static int imx_rproc_probe(struct platform_device *pdev)
 	imx_rproc_put_scu(rproc);
 err_put_mbox:
 	imx_rproc_free_mbox(rproc);
-err_put_wkq:
-	destroy_workqueue(priv->workqueue);
 
 	return ret;
 }
@@ -1180,7 +1189,6 @@ static void imx_rproc_remove(struct platform_device *pdev)
 	rproc_del(rproc);
 	imx_rproc_put_scu(rproc);
 	imx_rproc_free_mbox(rproc);
-	destroy_workqueue(priv->workqueue);
 }
 
 static const struct imx_rproc_plat_ops imx_rproc_ops_arm_smc = {

-- 
2.37.1

