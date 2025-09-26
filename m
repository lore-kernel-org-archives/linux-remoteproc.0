Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010052.outbound.protection.outlook.com [52.101.84.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D346123E347;
	Fri, 26 Sep 2025 12:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758890041; cv=fail; b=S9njhgYptX68Ucmo53UsdoB08MYYCXobhq7n/vaYE/D6wRzEgAm0ZEeQuIso2xFgvXxHPBqqOD3tH6GeKcPA2tLQ388E16YvdBc2TsOubrVMSAtg6fEVzkIJM+FkED49Uq+pkCPClJac1qA+9Usvb2RQx637JrvLAMozejDLnKg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758890041; c=relaxed/simple;
	bh=/+qAXachW8UJdl7xjt5l3dl4HFy2UlQ+gsMiBYhAO+Q=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=jJHCXNeC4N/Otgxt/c0/ghQequXJz88vSsN2DnKl5EEopxcJUB4CFDsGxXjxIqcqJ4HrZhtT5Cg94BXW6LGFZkBQSsXEpjL91Kte+a1fvZDdPPXpuHzQ/ZNi8S8uSCsUz6B65SOqv/cp/A0GFgt3x7sAHGlC9bl/nEux8NyC4wA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=X85zikLe; arc=fail smtp.client-ip=52.101.84.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="X85zikLe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MEn+qYiJrQquwLxpxdpx22Q5KnsGVt/FgyItpx1eWrGuoMA0sbGPZcefDvA4cjQMh2bnG71aF8Q7Z2hr8IRsQUI79XPee8k8vUPo4gv4mEkhIsmz2L4TvAI0gtyZ8PKUcG62MtJmBE6cf/eQgqyGKZY+2R63I4ht0GIDZX+Kj6FVbLd/tZ6kcMpqSag+/Sdmnd6Fva7hJl760W3Xs6wF5Xa7M+CT1YrLF+cZK8yAk0ddd6UpRdt0MT4jvOZigZK4RKHCleLxj+CFc0oZNc7hnE0ZUEOg3EmmldJnpMAapFmDJ/wXmCWDU7xp1of66pmPj4LPjz/NzmTatyXQA9Wn2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dHetD7b0iANOwxLEzIIhmux9Ix3UYv40GAapoXweAUA=;
 b=DQ+9aF9H52652gWNZQBFvM3d8/QBBhrjtT8RTwAvPDAJUyZl/N20+BIdtIr4BqikkxrCEyd/jDrpUDMxKjOmKbnglVQa8+k2V4soLJl4xptd23uQQvkWB7IxrklGrYZzZRWsFckJty+ghzzty3+pyz0HgwvgV7Q308qvDevGYjzkbSoRtxnT7sfWYl6ZV3H/+4+NQDJHGQ87vts5tXVRWVIyWELiyh0OJmsUO6bma5mGJHvIWfOujRoR7S0vBZJXSyuDEBzDGnb4KrYQYD1LzficKdFa00pvXlX9JYgwFH4+THre5avfZFN4ShIPBRRSeF5Fb9aAr9r40/wbloyXoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dHetD7b0iANOwxLEzIIhmux9Ix3UYv40GAapoXweAUA=;
 b=X85zikLeey9526W3Rn9npbcAUrgs9y2QFMcxgoj9Q4cZ0C6FqykpqOxtM8Jmtzcda/8IvGv990AKLhD8BG50oYdhpfF8qQhG4+0lU3s8GPqlvI5ZCzd+pWjd3DQTJAm45vkmDvpB+1iFiP4nRWdfQl3lxuzX4nKeN2nv/b78Q5ksFDYMQ/JMLAofkEmzlF1R7yR/+gDoovGbw5M3nsbP7Kp1gJfjylkJXQNKQuHbdP0P2FKjpVUX2UQzyIFwJmN+GIuS99fI4xQqArBYq1NxtU2hFAacvU0KOfUbPgxq9ZyqLuY/Bej8I9r4BhSl7Y9vf4cHpHVpgX9tJVpyT1pK5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PR3PR04MB7403.eurprd04.prod.outlook.com (2603:10a6:102:8b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.11; Fri, 26 Sep
 2025 12:33:57 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9160.010; Fri, 26 Sep 2025
 12:33:57 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Fri, 26 Sep 2025 20:33:18 +0800
Subject: [PATCH v3 4/6] remoteproc: imx_rproc: Use devm_clk_get_enabled()
 and simplify cleanup
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250926-imx_rproc_v3-v3-4-4c0ec279cc5f@nxp.com>
References: <20250926-imx_rproc_v3-v3-0-4c0ec279cc5f@nxp.com>
In-Reply-To: <20250926-imx_rproc_v3-v3-0-4c0ec279cc5f@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Hiago De Franco <hiago.franco@toradex.com>, Frank Li <Frank.Li@nxp.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758890010; l=3249;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=/+qAXachW8UJdl7xjt5l3dl4HFy2UlQ+gsMiBYhAO+Q=;
 b=c4Qfm2VghJX2Bp6kNCepsfk1iUuOwFObhjD06oCpcwnrceqw9/KCwvrK9G66Op8VyXt8ub+rt
 et8QAk7kDUTCNietqegXDDdTUSkgAmi/6LNuOSRWE6txu1i5sVesDok
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR03CA0115.apcprd03.prod.outlook.com
 (2603:1096:4:91::19) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PR3PR04MB7403:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c821b91-c917-4c62-c347-08ddfcf8f638
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|19092799006|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SFEwNmRUOGNjcjJhY1NteFJmTjU3MVFvUlRyQnk5VmVyQ1h0aDB2VWcyVWh0?=
 =?utf-8?B?aWxkRjdjVml1RkxGTytXTXMwSVZOTndBOEcwQ3d6d2RVSVdidDUwczJHZGFJ?=
 =?utf-8?B?UTJmMDloTUxSOVRQMkdFZG01OVVyRU1qSHNFc0hmYjByc3JxeEZFcDcvekMr?=
 =?utf-8?B?N09sTmhkSk1SVndjZkxtUEJPRlU5M25TOVQvRjFDdSsydm9kZUNlWkFRQjht?=
 =?utf-8?B?bSt3ZGVIQjdueVpXNzhDeGorUUMrN3MrNHNFM3Y4NUJBQVBwSW12My82UnVZ?=
 =?utf-8?B?TlNwVlMvbUpPZmU2VFJPbmhPQVU2SmhiS25Ndmh1TUpPenNqMmtPaEF2RjUx?=
 =?utf-8?B?RnpSV2M4dG1nUTZFZ2hqUm5JMHpwTGZLS2RJQXl6ZDJrYmRPSkNORkFaZWNm?=
 =?utf-8?B?TEhXdnRTNmxtOG10a3BlbGV3RWp1aXdqQUQ1RC9rVXJ2MUtBZTV0cFh6RXQ0?=
 =?utf-8?B?bTdydkRBWVFJZUNXblZuVGZrNkMwR1ZCZ3dDZmtOdmhqZjFTK2NDaWQwUEcv?=
 =?utf-8?B?TTVBMnQ0UjFHWUVRQk81dWszT1NHZWNZMkxDWGlMQXJUV1MyZkg5a0ZuWHNB?=
 =?utf-8?B?dWJqeGFhelo0ak4xbnlWSk15U2xqOWZWVVcyblFzOHFrbHd5MUpTdWhqV0xy?=
 =?utf-8?B?YXo4dnZ3b1ZlSjVZWUNmamkwazFwUVZQbmJGRitsNzNLcFd1dFRrWWUzRUtO?=
 =?utf-8?B?aXdCNEp0WlJkUDVqdGhKdVZoeTZQU002ei9iSVBvQ1p1U1JpK3JuOGgyMjB6?=
 =?utf-8?B?TUdSNVhVTEhzRllzdSsybm1HRy9uSWc0akJya2R1UUN0VStPUEcwUDgwaUFt?=
 =?utf-8?B?VGxJaFlQK3JqMDRJRG1jYXg2T1BNNHh2bU51Tk94MjY2eVF1Mm9PQ3hKZlV0?=
 =?utf-8?B?VU02VEJ5RnNSamFOVTYyVE1VK25tUXFta2Q0SGtBV3dLUTFBZUJjb0NwRk5O?=
 =?utf-8?B?ckNpclVnb3pKZ1hwei9PVGdscnZHS2lPY043NUpQMWR4VllzZHFZbld2c3NT?=
 =?utf-8?B?V0kxdkpNWEhDZ0d3ZXV3VjYybVdac0hiSUpqUHdEYXdkRC9yOHErRmwxV2Nk?=
 =?utf-8?B?SWVQbXp2Q2lKTjFWL28zaGpROXRFbkFvaEZveGM5YlFtcFY5enJ4NklSbWg4?=
 =?utf-8?B?N2t2S3JhcFJtaGErNEZ2b29qWWlUYnoxV2VabUxvVTNVRUVEWjJGVFpEMHNO?=
 =?utf-8?B?QW9CNUx4bmRoZGttRTVCdGs2RVN6Qk9vYzdrejJiM3VnUWFlbEhKNVgrVlVs?=
 =?utf-8?B?NGVOWE96RVZreWtCbWNvcmhUMExMM3BRUWRvWnozT1FKWjZUekxhSVV0UXF3?=
 =?utf-8?B?WnRVYSthUjZOdS9hN3FBWXd3YjFWRFN1UWNSaGI1U2hQSUYyeGVOR2xNS3kw?=
 =?utf-8?B?eForYUpWK2pFQ2lkWHJpdTJJYWg2SVFZQWdWZVBKbHZkYzBnUnd4VVUvSktR?=
 =?utf-8?B?Y3ltTGY1WHNRUlVaYW9tcC9ZTm1nUjR1MzR5ZmhQN0dyemFsMi9yMHQ4TTV1?=
 =?utf-8?B?R0VucnVKTGcwQWV4ZU9BdkEvcG1Kbm1wdWQ1MVBUSEdLZmhPUkc1N2dhV2NJ?=
 =?utf-8?B?dTM4L2M0UWJ1eEIybUJzNzZBdU1jV1BPeEhhY3dLTWdRNFU4L1hWWXJlZnd6?=
 =?utf-8?B?U0pNb0tyeTg3Qjl6dWZNYWNjOFZTeEdZblYycHBpRU80ZTNDelZPM1VsRjB3?=
 =?utf-8?B?K1VDNXpxVGkzQS9sdnJ0MHRVN3hISUEzL0xJcS95OEJKVWloWTlsUFNjT2dp?=
 =?utf-8?B?TnlYNkVDaWFVTVVnMjRVTlV0eE81dXpHRU01Wkg3dlZROGowMnUzYzhXMU54?=
 =?utf-8?B?ZVh0bkN2amRGMzhxcFZXNExBV3gyd0pmQ3lBTFlvY1pDa01QZ2hNMUJTVklG?=
 =?utf-8?B?WVFHU09rYnd5ek56Ny96RWo2VlEwd05ITWJZRWpwdFhmU0tqS1hDbnFvbWha?=
 =?utf-8?B?amdjQzNqcjlybzhUVEp5a2lVdDFqdnRUYnBMbGRic2wrL2N4cWpSOXRYU0w2?=
 =?utf-8?B?TGV3OTBLckpNZHJTZHNnc05pUlpoTnNLLzZyMEV4Yi8wMmpVWjJ0Z0xic1oy?=
 =?utf-8?B?ZURjQTRxK3h3elZhMnZGTng3eTYvTzZaRnlMZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(19092799006)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eE92VFJWblRMN0lWbFNWNWM2STd2N0hVcjg0dlhEY1YyY25tTGJCc3N4RFE1?=
 =?utf-8?B?djF3WldOdTMzZW53RjBTUGRLdlZXV1hzeVZyUmxUdU9USFZ6R0tVNDFjVGE1?=
 =?utf-8?B?UXNlUHdnNy9CTUdaTXoxdzVrWlhIakZhTkNtSU1sTmVvZTlmT2tGWCtzaUE5?=
 =?utf-8?B?RkMxR0E4VGljckpSYkZ0UHdoUmgrM3BKSVo4S3l5eVl3U09RaUVEbkR0VGpv?=
 =?utf-8?B?Y1pDOVFSd1oxQXFWRDIzT2g2czE4M2JmSTRCaXE4R0srbThyYVNSM1lHRWNR?=
 =?utf-8?B?QkNocjJ2UWtRNFk3TmhHMmw2aU9GaXJKWG9JcmhoVERFbDMxemo1bml3MUt2?=
 =?utf-8?B?TW0zSk1wVENlN1NBZndpRXlWcXZkalMvSy9zYTZJSW04UWhpbFdmV1ZSN1Nk?=
 =?utf-8?B?WmtJeDZ3Y3NIYWhYcGJLMVArZXp5eStpRloyR0NLLzJJVis2L3dUS3BzR0RI?=
 =?utf-8?B?dWhRMHgvalRTWVBwdkhvY3doQmVsNHNabjJLU0ZJYjI4MUpGRmxRKzF2RGdk?=
 =?utf-8?B?Z24xc0NiTFhML3dnQjNOWlRMaVhWSTZtV1AycjFoL1hDd054TVo0My8xZlNq?=
 =?utf-8?B?V3Q3WHZQNi81Sm56alZHeHRMTlE3d0JuT1pqNDhsLzBVek9walNGYzF0Qklx?=
 =?utf-8?B?OFUyWG03cHYyRlY4alVjMWpuSll4dSttSlNWVVF6ekNQbDB0VzFOWElkRXcv?=
 =?utf-8?B?S0EvcVRtRVZDRWU5Ri81SUplNkN6enluUzlRWTN0ZVBoaXp4M2xTN1BKdVc1?=
 =?utf-8?B?ampYVDlrSUZHQStmZTg5Ujl1b1B5cFJEK0xqMXFSa3cwVlZ5TWNRR1VnWkFC?=
 =?utf-8?B?ZHkxRGtMY0RmZTgvY2hsVmxaQ2d3d2tWditjNlgrcURaSU85dlFHcE1SWDRW?=
 =?utf-8?B?Q2VoOHZkbGNibE1tc1E1VHNtRko3WDZzTmhrTklWSmtUZGRzd1paQ0U0bm51?=
 =?utf-8?B?bHBRQlozbDRFVXpkNWJjektzcUo3ZHBaRUhlR1lHdk9sL2Nvd1Zxczl0Umhp?=
 =?utf-8?B?QzlOWmJmS0RydE1UWmIxdkkzNmVJclZPcng2d29lWGtGa2ZkM3M4eE9DTyt0?=
 =?utf-8?B?bjZHTEZkZHJmKy9QQmVtQnVodFFiZTRwZisxbnB2K0hXWkxIVmU5L3M2Rm02?=
 =?utf-8?B?bjMyVVREZXNqZXAydmQ3ZFBxVU9RYXhJQlZFTUo2RVc4SFgvL1FmVWEwR3Rw?=
 =?utf-8?B?bnpRN3pjUCttcU1yTG85UWpVREZqZitWMzdXUTB3Zk84SVhxUElXTTZ0VFVa?=
 =?utf-8?B?ejBUUVBqSTBaUmluNnVvTUVFV1R5MHc4ZlJ0djRWZ0xwR2ZlRCtWbVhjNS83?=
 =?utf-8?B?dGkxUEw2WEo3WDlLQzFXT21yZzVlL2M3bDZPN29ZSXNRWHBDRGtEdkk3UmFR?=
 =?utf-8?B?c1d5MzE3QWlEdm0zZ21kRnBZdXkveDhmaEl4RjVzOGs0elkrbm1PdmoweHNK?=
 =?utf-8?B?VzlsdUYrdkh1VDRxQ214YURyOWQ2T3ptd0kzZVBGTENJWEJ1aU1ZalN0WE1v?=
 =?utf-8?B?L0RzYjluWksxM0lLWkFuaTdFRXZZNURPRWFidTBYL09pUjVOTWlLN0x5OHRo?=
 =?utf-8?B?aytNU3dLTXU4Wmh0STRTMUJERFhxT05IVHpEZVFVb2ZzZ05rUS90bFQ2NWh5?=
 =?utf-8?B?eXRhNVhCcFpZbzFSN2NuRGluMkNhZGFmeXdORGRsbmplMXVVd2NlVDFZa3Vh?=
 =?utf-8?B?djdrWTFKRW5vTHAvYzArQTJxTGxvN2FqbnJIT3g0S2xxYzgzdnlyK05NanYw?=
 =?utf-8?B?S3BjQXZZUU43d1h1eHVuODVsRFFDaEhNMXJJMGhDd3I5djMrM2dyaVNQdzQz?=
 =?utf-8?B?M1V6NnQxM3B6SEJZZ0RKNzIxZE42YXZ3UEVkck5NNDdhSExSWGVjZGZHUXlE?=
 =?utf-8?B?QTJtV1VqZEpMLy9mNzlOd0w3cWZVQzhsT3huREl5M09uK2lGVmJ6aFcwMlcy?=
 =?utf-8?B?bmY1RVZHRlp1SVJjRldlRk5EK1VBSExKOWdZRlJ6MHRmV3hBK3RlT2I2U3V1?=
 =?utf-8?B?RXNObDJVVHhmOENTSkZOMTJ1TGV3OUJ4dkRDUkY3Y21TWDBPdzR3ZXhzRmRG?=
 =?utf-8?B?eWtPWXJmeXNDSnBYS250dlVQVTAvVjk5dTl2cFNINWJZbWFnOEtmMUFOMmM3?=
 =?utf-8?Q?y9iszI6G0oNKXW0bzHLbxZW3d?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c821b91-c917-4c62-c347-08ddfcf8f638
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 12:33:57.3912
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fV94ZqlEZQuYzvslwAW1XFmjOUlN8qJvS/ihp4Qj4qdx+yV8eZl5XTaLvMJaPXqYdnqcmmjJ+H1Zw8i0p+0bIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7403

Replace separate calls to devm_clk_get() and clk_prepare_enable() with
devm_clk_get_enabled(), which combines clock acquisition and enabling
into a single managed step. Simplify the probe logic and remove the need
for manual clock disable in error and remove paths.

Also, update error handling to eliminate redundant cleanup steps and use
return-based error propagation where appropriate. Improve code clarity and
reduce the chance of resource leaks or incorrect ordering in cleanup paths.

No functional changes.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 22 ++++++----------------
 1 file changed, 6 insertions(+), 16 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 3260fd55a713994e1d39cdf677265edd4192ae45..f353a680ba993dbe3dd7866ca725d18aa58303a1 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -1006,26 +1006,19 @@ static int imx_rproc_clk_enable(struct imx_rproc *priv)
 {
 	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
 	struct device *dev = priv->dev;
-	int ret;
 
 	/* Remote core is not under control of Linux or it is managed by SCU API */
 	if (dcfg->method == IMX_RPROC_NONE || dcfg->method == IMX_RPROC_SCU_API)
 		return 0;
 
-	priv->clk = devm_clk_get(dev, NULL);
-	if (IS_ERR(priv->clk)) {
-		dev_err(dev, "Failed to get clock\n");
-		return PTR_ERR(priv->clk);
-	}
-
 	/*
 	 * clk for M4 block including memory. Should be
 	 * enabled before .start for FW transfer.
 	 */
-	ret = clk_prepare_enable(priv->clk);
-	if (ret) {
+	priv->clk = devm_clk_get_enabled(dev, NULL);
+	if (IS_ERR(priv->clk)) {
 		dev_err(dev, "Failed to enable clock\n");
-		return ret;
+		return PTR_ERR(priv->clk);
 	}
 
 	return 0;
@@ -1127,7 +1120,7 @@ static int imx_rproc_probe(struct platform_device *pdev)
 						    imx_rproc_sys_off_handler, rproc);
 		if (ret) {
 			dev_err(dev, "register power off handler failure\n");
-			goto err_put_clk;
+			goto err_put_scu;
 		}
 
 		ret = devm_register_sys_off_handler(dev, SYS_OFF_MODE_RESTART_PREPARE,
@@ -1135,7 +1128,7 @@ static int imx_rproc_probe(struct platform_device *pdev)
 						    imx_rproc_sys_off_handler, rproc);
 		if (ret) {
 			dev_err(dev, "register restart handler failure\n");
-			goto err_put_clk;
+			goto err_put_scu;
 		}
 	}
 
@@ -1144,7 +1137,7 @@ static int imx_rproc_probe(struct platform_device *pdev)
 		ret = pm_runtime_resume_and_get(dev);
 		if (ret) {
 			dev_err(dev, "pm_runtime get failed: %d\n", ret);
-			goto err_put_clk;
+			goto err_put_scu;
 		}
 	}
 
@@ -1161,8 +1154,6 @@ static int imx_rproc_probe(struct platform_device *pdev)
 		pm_runtime_disable(dev);
 		pm_runtime_put_noidle(dev);
 	}
-err_put_clk:
-	clk_disable_unprepare(priv->clk);
 err_put_scu:
 	imx_rproc_put_scu(rproc);
 
@@ -1178,7 +1169,6 @@ static void imx_rproc_remove(struct platform_device *pdev)
 		pm_runtime_disable(priv->dev);
 		pm_runtime_put_noidle(priv->dev);
 	}
-	clk_disable_unprepare(priv->clk);
 	rproc_del(rproc);
 	imx_rproc_put_scu(rproc);
 }

-- 
2.37.1

