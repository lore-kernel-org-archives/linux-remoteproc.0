Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010052.outbound.protection.outlook.com [52.101.84.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F88C34889B;
	Tue, 11 Nov 2025 01:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762825324; cv=fail; b=aZ/0Dd7qwRFUzNyEyupAV3GWIIuYT6YpQjaAQ5lAjKzadnf9LRgLIoQ7IG7DfmbG0X3Hlbs9ecC17604Ja51mCVubUcxYX6BCm/C4vLBB6Wd8lKCsJ2V2H4QBpuzzIg1WdOJPnep9QA2USeSuAbvr35RdD+0uzNTdFQ2cHNlGzU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762825324; c=relaxed/simple;
	bh=KCk9mh7/uWYK2DCvZ111I9yYzTE/Qx7N0VfajvOhA1I=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=pdpDBMHcbw00a7WYodqg5QLXDCqHiGl06MPlavqG6oB7/siX/DJGluy5N7uxwB1ANgz9RWR+neXzXsFC0lU7lq23jSkcx2R+07kfmVNEwgEQXN8JPVpajuW6psMG4JUaYtIZztdvK8njcfOe6Kc6KcLAor7r1Q4IQPHKzf14Lpc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=rKbZsZlA; arc=fail smtp.client-ip=52.101.84.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="rKbZsZlA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZRihuABj7sOPaQQiMk11eo0UnlY7e7ILJkRanZTSw+aYnDuRiYv0xM2Lbo/2XLgPjAu/aJVfG7jPyJugyXxbJvjC7fhdvaTbUsbAFv3eFcITvQH19xWxjez8f+k3BHVHLr5GxzlQHkmhA+WevvYry62ljx4qpBL6qZqWu1byzjHf4EqRudi7wfMdjv/pr3vXV5U2gSSj3OOKCz70qKyrDAWcnNPbd3TrAOOF25CvGd/utxCc27yfUM0h2dMqRe7mn2EPaFDgEQ0EV1tBtmKOyLYmaXALVSKtJ6v/UCb/s51vOOlPC1Y+e/JgwSxnzsAzaaMRInFcTgUmLrKLyC0nkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D7oZrjjFQjLTk5G2jMvxwb2d2bcKT2Xztpz9wSQiML8=;
 b=BG/NODGVVvZIRxRqsxEBijRNQD3ASYR06rNFA2LkJFG6m5tvjxbYnOTOAShmU9/WVSEX9g+pfksGKAHcTtTg0nW8+oqIAoGX8S+OGbJjscTG9HC6wXh7hTR8XBTiBur/d1FnwU94wAxTZwWr5Xt4tJ1EcAVoUjqzoghEi2Fs0nXgkF95cRbhusjmIH1qvs/1KTZHkLmAu33B0s45uDRy2oZtlKoX3jA2xx3q/M+zo/VvCOFwIHTwsbFj8E7rlprEfH3xm+tbm5ema4XH40wggZGt3LGXO+3dPa2sMPJPp8zdok43mnrvATpj9+kuRaZYJN6nGdV09IuOFRrfHCeHbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D7oZrjjFQjLTk5G2jMvxwb2d2bcKT2Xztpz9wSQiML8=;
 b=rKbZsZlA4gQ2A4Eg+c1aIeQqLPDRla3Sm/ZIr5rzUjuOMRg7eNJh99oONVfODzBY2O3T7kiqLj9bHGT9h2xOA0rebGoHPr4/h2KDt9v/Q/ATurStpngGzQaSl/rWEnU3BJxp4EjHq88T8KhQGFLY++i5y0rfZOqV341q6wHjgKV9N4LOWvbcoH1Yp0md9twK9zafkUNGzt1tFvXTZaSRC9yVmgM5a7bwCsQt1ayABeZu2pEir2ePkG1Sgb8b4WXWrh2asUGvWS1ZAITRyj/YbScV57WSMuue33hkW3XWM15BfjuKuAzOX2+q+NGfiQiIqB4w2IHdnR07GZMQ8JAhtA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB8039.eurprd04.prod.outlook.com (2603:10a6:20b:2a2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 01:41:59 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 01:41:59 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 11 Nov 2025 09:41:18 +0800
Subject: [PATCH v3 07/11] remoteproc: imx_dsp_rproc: Move
 imx_dsp_rproc_dcfg closer to imx_dsp_rproc_of_match
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251111-imx-dsp-2025-11-11-v3-7-d05dcba737fa@nxp.com>
References: <20251111-imx-dsp-2025-11-11-v3-0-d05dcba737fa@nxp.com>
In-Reply-To: <20251111-imx-dsp-2025-11-11-v3-0-d05dcba737fa@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: fc0db1d6-0a67-47d7-8597-08de20c3817e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bk1xMFNWdXZmWnFncVZIMlFFbFN5QWRab1V0eStMeGYzUUpUNVhxWXdwTVpZ?=
 =?utf-8?B?WTlYZzBDR1o2MVoyTUo2amw5THFvMVF1QjVXL3g1QU5jTlluaG84bW15M0ZV?=
 =?utf-8?B?cHhLYjdGVkNMOVRzUkd5M3hmZ294K0FZMHExNTMzQ0c0VW1maEtVME8yMFRh?=
 =?utf-8?B?WExMcGxoNjBpUWxmaTAra3pJcUloM3JuanpnSDNwRVpoOXJ3Rk54QTVZL3dG?=
 =?utf-8?B?bVJJeURJWTFrdzhuODB6THprWFhYVUF4UmVnRHVPcllXbm4wdU9QY3YybDZu?=
 =?utf-8?B?dkVZOU03TklqazlOQkR1SGl4UlhxeFAxNjRXMjRlNFBtbmJPK0lTb2FZb1I2?=
 =?utf-8?B?Nkp0aFAybVFHeFo3NHd1a1ZYV1F6RCtmQTlVOVkxNkFPUHkrUnphVG0xcVpH?=
 =?utf-8?B?N0tpbTh1MHhVTzZyV0RlbG1nSyttMmVReFp0bkd4c0dmTHJOQXBqaUMzMEpu?=
 =?utf-8?B?bU03Y0F1YWxmbHpXdk9VVmJnbjdkOWVTZW15QjhNT2hDaE5TSi9HSzdPbW9y?=
 =?utf-8?B?RE5LcjVGeWxxWjk0VUR5bndNRWtUbzV4dW1EaHk4UkppOEZzK04vUHMxNHJJ?=
 =?utf-8?B?cWQ1bnF6ZHUvK0pOcFFEVkxvY1JWVjN4M3VzcmZDTDJRcEh1eGlHc1RGTUxl?=
 =?utf-8?B?VHkrcVRJWWxXNlNlbTVJYStXaW5xK21RSzN4TVRLMXUvVUM4WjRCQ0gyU2Fk?=
 =?utf-8?B?V1IrZ1pjMmdnMDc4aU5RS0ROeURtQXhrTWVxKzRjZUd0b1VFaDZsMDlqM3V2?=
 =?utf-8?B?Y3RGWlE4dE0vcnZia3NwcU5lcVMzcDgybVlFSkUzbkRKY0NhOCt4Ujk5NEtQ?=
 =?utf-8?B?K1lFcjhKc2xUR3N6RHZGUTl5ODJLa1BEaEVYbWNJSXhCM21MMmgzYldjOUhy?=
 =?utf-8?B?eThyU3FVSk1UMTFMZTBsbGplTTVuUzVlYlBDaUNYaDNDY3pJWWZCakVKOFVN?=
 =?utf-8?B?WmloUWV4SGRCUkFVSk5zR2o1a01qeGVTWnBQQ0xMemJNdGVYbmFNVUE4SDV0?=
 =?utf-8?B?Y3Z0b1VpU1h5YnRxTWVndTRFZ3JVcjZKK3pOMVNYQ2dkWUpEQ3ZTZlN2VFRU?=
 =?utf-8?B?NERMYm1RUDZ3UHhoMVFWS255eHhqenRPcFR2WllCRmY5eFJablRwTmo4Rkkz?=
 =?utf-8?B?RC9qTTd3Y0Ivakx2Z2FFLzYyRVVRWjMreTc2VGhKeXZZR24zMmFKcm5tZU5K?=
 =?utf-8?B?eTJUUW42UUhNV2NUV3MwLzJ1QlZrUno3L3B1OER1dTlxYkFZUEhCRURXSGNO?=
 =?utf-8?B?V09PWnB0RTdKSEZocmZlb0RWeVM1S0MyMnVTTEQ0YkpkYmpQQlUvWDlqU1Zv?=
 =?utf-8?B?clUwM1VONHN1SkVBQ0ZHdEdDdUtKRFNWR091UUp0Rzk3RXBnTVB5ZC9Jc2hU?=
 =?utf-8?B?ZVA1TFd2Kzd2NXJzVEVHRkhzTngxL0d4ZExrWHJLUCtjMFR5UU14UkJYRGd4?=
 =?utf-8?B?ZHd3aS8xMDJtRy9sVGI3eHRrb0xIbHRtOEZnTWRhQlNEbldYKzVGUUVJU0ZD?=
 =?utf-8?B?d1JOT1ZDS3J0NDJuRW1kR200dnVPVkdLNDd6aHkwTHNjOXpkcXRtQ1lBcHlr?=
 =?utf-8?B?RGI5Ni9FaTk4ZWJjb2VUUmpLSE1aY1pLRlJKVGNJVFh3RDZzZDVVMmlDc2xl?=
 =?utf-8?B?dmZWMEtrWkNlTmpCL09LWmR5SWNiU3RQRmJaMCtKblRremZWYkcvTmJ1aEJa?=
 =?utf-8?B?M3hERm1US1EzaERrT2pXWU5od3lVWkczMSs3bkE4RDlHRWc2aTg1aWNITWVE?=
 =?utf-8?B?TWFXT1gwQUpJdW9uQStvOXhrRGJCSkh2M1ljS3I4MW0xaHhZek05bnVHdzQx?=
 =?utf-8?B?SEhDWTlqeDlFQzMyeWxsWGNLQXNvcFc2K20xc01xZFAyQ2E5L2MxWWZINDYv?=
 =?utf-8?B?aytBaGc0YWxjenUvbjNtNGViNnpETnhPSlJCNS82emt6M3JMeGlsbUlLVHR2?=
 =?utf-8?B?MHVJdVF5dUxCa0hYVjFBd3hoaFlFeHNRSlBpVzBoNDYxNmVuRS9uZUdrcTVB?=
 =?utf-8?B?M0tKb0UrNEQ3VmdwV2c2aVlLdUJxcjVaTElMbm1pUVNlcUJVNUhiWHdISjJq?=
 =?utf-8?Q?08eb01?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K0VyNWt0U2ZvY2pUVVkrYXJXVEU2dmw1aENZSFVLODlaY0p3bmZidURLLzBJ?=
 =?utf-8?B?ZDVBSjZNVVoyek56MERLNlJxclorNTc5dnJLbFgrQlo1MGN6NTBjU0QxRGFY?=
 =?utf-8?B?d2FRNE5nL2JJOE50Qy8xUko5Yi9UVzcxcGZjTFRGeXlxc25YT3dDNytodGZu?=
 =?utf-8?B?bE4yczhGRXR2OHVOejMvUDVEK1FpRjNDdFRvbDJQMHBPYXRlWnUyekFaeFNh?=
 =?utf-8?B?UDYzSkY3YU95SmtYWE5rT0ladGVURzIxVEVPOFEwU2ppOHB0VHRBNVkvNzA1?=
 =?utf-8?B?bERTU1JKMlpPOGV5MjR0bUJKZk1FVjZTR29WNDE2UHRFYUhzOE5RUmhnUWxB?=
 =?utf-8?B?QVN5V1d0VGJsRVphdVpWZW9oYXhHdTFzTHhzbmlHbkV0dWRnaitIdlZyN29M?=
 =?utf-8?B?aVlvYTkzd2RWV2h6WUdTbWlLWHhvK0RIaVhyc3M1dGxOV244djdBaGZNbUJk?=
 =?utf-8?B?aXZreDZvWjZ6bkFHSy9IaFk3Rm9MaW5WdHVrRU92VDNGL29hSzk5YnZ1cWxO?=
 =?utf-8?B?Z0laQklhZjBkaXJrU3hSUkFkdmxqZVlBZUNCZ3hqSzk3eEtKYjluZFpuWkFh?=
 =?utf-8?B?VnBkVU5VMWRLMTJXMy8rWnlMejhQMFBBMkxNcGI5NGlDY1kvbksrWmo4UExO?=
 =?utf-8?B?YUVJKzF4NGdUMnVlL0NpNjVPTDZzN1JzQnkzeU1LTjlmY05yZC84R0dML1o1?=
 =?utf-8?B?SDhXMEI1aWpHVHg3VHhHTmhmK3RCUjJ4RWtxMVZJQy9lSnhkWlVyZk9ZN3Vj?=
 =?utf-8?B?VXRtRmVzR25TVlNjVlFlZzhjbjYvRHg2T0ZKWk9DRHRnWndKT1pmUG11V1Vk?=
 =?utf-8?B?dDdicllXYUxNbzdpcUVlVmN2UGY2c25pQit6QytJcm9zSlA5RDZsOWhrbHlN?=
 =?utf-8?B?UDZMbjVlTlN5S2hxVnFqaUl1ZnVZN01BTmNTUnRiQkZlS2RtTlNiNWdHNWxD?=
 =?utf-8?B?ekpOWi9ybENIUktVUHZONUp2WGdqY2Qrc2tDcDhvaW9McTJObU5DSHM3TmJE?=
 =?utf-8?B?ZUNjQ1JNR25OUlU5VE1WSXQ3WmJpbTcvRm9ocGx4OEpvUkZnbzRYTHg1WjZ3?=
 =?utf-8?B?NlR4eXE2anhYTWpnK3RLcDBEWWpnYWpMRjlQSi9lMXRQTWZzTGI5RXR0dXAx?=
 =?utf-8?B?cTZkRFp3M0p1VmxvVjQvandZRExnWkpsSGg4S1B1aFdVb1BwMlFySDFvRzg2?=
 =?utf-8?B?WnRCOW5BQkdxZUYwUExDK0RtcnBXTWxXMUJFK1RWL1ZKMms1R24vVm83aXNS?=
 =?utf-8?B?NndIL3lyWXFRRTVmNTh1K2JEd2w4WnorVVo0OGVnQUlXankwbFljNlFqaDhY?=
 =?utf-8?B?ek82c0t6NEtWVVY3Y1V1UVI1clhmRTJDZWMyNWQwMUYvOWpwRnBRQzVMNVpW?=
 =?utf-8?B?dldjN1Z4cVFGS05nVTNxVUdhN2ZHQmp0RHJPSFBEeEhSa1YyeUI1Q0NkSTRq?=
 =?utf-8?B?MkhQZStzckRjMXJ3eGJ3UVZaTWRNcmJ6TkUrWWpiMGhYeExuUG05bVZLcmdx?=
 =?utf-8?B?OVJ5dERiVThtbCsyZTNHUm5QSEk2Q3crNTdrMUxDVDRqeGJEeG5NZHhHRWlj?=
 =?utf-8?B?L0VONXE2dFFFOHo1cy9DRWpCUFVLWFpEeStMTERmMGdhci9WTHMzby81Nzkx?=
 =?utf-8?B?UjhlUElaVlJwR1N1SE10dHl5Ylg2dU5FV3lvZiszcjJ1Rk03enNDQ2ppdzRn?=
 =?utf-8?B?WHU1bm16WW9wMkcyTjFGWEpxVDM0MVB6MUwxRnJzdGZCdWE1T2NxY0xScFZy?=
 =?utf-8?B?UVI1dENoTTYvT1JQMnpXYVlZVXBEQTNZWk1sQ09NWHZKak0zUHQwZTN3Z3l3?=
 =?utf-8?B?MVpQUlV5SWs2UDZVWjBFc0xKdWx5Y1RZWXI0eGFRVDQveHJtRUhOUmpWc0lS?=
 =?utf-8?B?cEpvVHl2clFRdlZBU0FoSlRhK3JCSDdNMHBFZUZ2VzFtVVRPTXRwR1BxNjBn?=
 =?utf-8?B?UlhsSTRKKzZVYk9YM2FoVHlvc0dqREIxTDVJTlEvcStjZS9MTkY1NGpqOWJk?=
 =?utf-8?B?NUtCeVE3cGlRbmZ6SnY4V00rUnBGV1FBQXUvVlBzYzNiR2JVVk1ZM2VjZ3Ex?=
 =?utf-8?B?UFdSb2VRZ0RVV3BRbmRTQktadHF3TnpvblhoMWxmSkM1TGd4Z0tSd2d1WVgx?=
 =?utf-8?Q?2Hg5IhUhE1BNn2kf6pkl/6pP2?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc0db1d6-0a67-47d7-8597-08de20c3817e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 01:41:59.8104
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fbKxxhzNKb2d2ImVtwLggn3SExkCcKi0W50Wnl/v3dtI3vY4BNgKZr9gBdXbeZ3pzVtal5SAPdm9eAmBswsTQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8039

From: Peng Fan <peng.fan@nxp.com>

Move the imx_dsp_rproc_dcfg structure definitions closer to
imx_dsp_rproc_of_match to prepare for adding start/stop/detect_mode ops for
each i.MX variant.

Avoids the need to declare function prototypes such as
'static int imx_dsp_rproc_mbox_init(struct imx_dsp_rproc *priv)' at the
beginning of the file, improving code organization and readability.

No functional changes.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_dsp_rproc.c | 100 ++++++++++++++++++-------------------
 1 file changed, 50 insertions(+), 50 deletions(-)

diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
index 833b1bd4019614157f0bedf09bd348caab802eef..f28d25cab3f1d89e5cde37a04b528870a59abeed 100644
--- a/drivers/remoteproc/imx_dsp_rproc.c
+++ b/drivers/remoteproc/imx_dsp_rproc.c
@@ -261,56 +261,6 @@ static int imx8ulp_dsp_reset(struct imx_dsp_rproc *priv)
 	return 0;
 }
 
-/* Specific configuration for i.MX8MP */
-static const struct imx_rproc_dcfg dsp_rproc_cfg_imx8mp = {
-	.att		= imx_dsp_rproc_att_imx8mp,
-	.att_size	= ARRAY_SIZE(imx_dsp_rproc_att_imx8mp),
-	.method		= IMX_RPROC_RESET_CONTROLLER,
-};
-
-static const struct imx_dsp_rproc_dcfg imx_dsp_rproc_cfg_imx8mp = {
-	.dcfg		= &dsp_rproc_cfg_imx8mp,
-	.reset          = imx8mp_dsp_reset,
-};
-
-/* Specific configuration for i.MX8ULP */
-static const struct imx_rproc_dcfg dsp_rproc_cfg_imx8ulp = {
-	.src_reg	= IMX8ULP_SIM_LPAV_REG_SYSCTRL0,
-	.src_mask	= IMX8ULP_SYSCTRL0_DSP_STALL,
-	.src_start	= 0,
-	.src_stop	= IMX8ULP_SYSCTRL0_DSP_STALL,
-	.att		= imx_dsp_rproc_att_imx8ulp,
-	.att_size	= ARRAY_SIZE(imx_dsp_rproc_att_imx8ulp),
-	.method		= IMX_RPROC_MMIO,
-};
-
-static const struct imx_dsp_rproc_dcfg imx_dsp_rproc_cfg_imx8ulp = {
-	.dcfg		= &dsp_rproc_cfg_imx8ulp,
-	.reset          = imx8ulp_dsp_reset,
-};
-
-/* Specific configuration for i.MX8QXP */
-static const struct imx_rproc_dcfg dsp_rproc_cfg_imx8qxp = {
-	.att		= imx_dsp_rproc_att_imx8qxp,
-	.att_size	= ARRAY_SIZE(imx_dsp_rproc_att_imx8qxp),
-	.method		= IMX_RPROC_SCU_API,
-};
-
-static const struct imx_dsp_rproc_dcfg imx_dsp_rproc_cfg_imx8qxp = {
-	.dcfg		= &dsp_rproc_cfg_imx8qxp,
-};
-
-/* Specific configuration for i.MX8QM */
-static const struct imx_rproc_dcfg dsp_rproc_cfg_imx8qm = {
-	.att		= imx_dsp_rproc_att_imx8qm,
-	.att_size	= ARRAY_SIZE(imx_dsp_rproc_att_imx8qm),
-	.method		= IMX_RPROC_SCU_API,
-};
-
-static const struct imx_dsp_rproc_dcfg imx_dsp_rproc_cfg_imx8qm = {
-	.dcfg		= &dsp_rproc_cfg_imx8qm,
-};
-
 static int imx_dsp_rproc_ready(struct rproc *rproc)
 {
 	struct imx_dsp_rproc *priv = rproc->priv;
@@ -1351,6 +1301,56 @@ static const struct dev_pm_ops imx_dsp_rproc_pm_ops = {
 	RUNTIME_PM_OPS(imx_dsp_runtime_suspend, imx_dsp_runtime_resume, NULL)
 };
 
+/* Specific configuration for i.MX8MP */
+static const struct imx_rproc_dcfg dsp_rproc_cfg_imx8mp = {
+	.att		= imx_dsp_rproc_att_imx8mp,
+	.att_size	= ARRAY_SIZE(imx_dsp_rproc_att_imx8mp),
+	.method		= IMX_RPROC_RESET_CONTROLLER,
+};
+
+static const struct imx_dsp_rproc_dcfg imx_dsp_rproc_cfg_imx8mp = {
+	.dcfg		= &dsp_rproc_cfg_imx8mp,
+	.reset          = imx8mp_dsp_reset,
+};
+
+/* Specific configuration for i.MX8ULP */
+static const struct imx_rproc_dcfg dsp_rproc_cfg_imx8ulp = {
+	.src_reg	= IMX8ULP_SIM_LPAV_REG_SYSCTRL0,
+	.src_mask	= IMX8ULP_SYSCTRL0_DSP_STALL,
+	.src_start	= 0,
+	.src_stop	= IMX8ULP_SYSCTRL0_DSP_STALL,
+	.att		= imx_dsp_rproc_att_imx8ulp,
+	.att_size	= ARRAY_SIZE(imx_dsp_rproc_att_imx8ulp),
+	.method		= IMX_RPROC_MMIO,
+};
+
+static const struct imx_dsp_rproc_dcfg imx_dsp_rproc_cfg_imx8ulp = {
+	.dcfg		= &dsp_rproc_cfg_imx8ulp,
+	.reset          = imx8ulp_dsp_reset,
+};
+
+/* Specific configuration for i.MX8QXP */
+static const struct imx_rproc_dcfg dsp_rproc_cfg_imx8qxp = {
+	.att		= imx_dsp_rproc_att_imx8qxp,
+	.att_size	= ARRAY_SIZE(imx_dsp_rproc_att_imx8qxp),
+	.method		= IMX_RPROC_SCU_API,
+};
+
+static const struct imx_dsp_rproc_dcfg imx_dsp_rproc_cfg_imx8qxp = {
+	.dcfg		= &dsp_rproc_cfg_imx8qxp,
+};
+
+/* Specific configuration for i.MX8QM */
+static const struct imx_rproc_dcfg dsp_rproc_cfg_imx8qm = {
+	.att		= imx_dsp_rproc_att_imx8qm,
+	.att_size	= ARRAY_SIZE(imx_dsp_rproc_att_imx8qm),
+	.method		= IMX_RPROC_SCU_API,
+};
+
+static const struct imx_dsp_rproc_dcfg imx_dsp_rproc_cfg_imx8qm = {
+	.dcfg		= &dsp_rproc_cfg_imx8qm,
+};
+
 static const struct of_device_id imx_dsp_rproc_of_match[] = {
 	{ .compatible = "fsl,imx8qxp-hifi4", .data = &imx_dsp_rproc_cfg_imx8qxp },
 	{ .compatible = "fsl,imx8qm-hifi4",  .data = &imx_dsp_rproc_cfg_imx8qm },

-- 
2.37.1

