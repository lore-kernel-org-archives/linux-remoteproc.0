Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010040.outbound.protection.outlook.com [52.101.84.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A34E2F747D;
	Wed, 19 Nov 2025 04:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763526132; cv=fail; b=sHxy8SxpUdtOEu9M9srYKlnNTChrI3Cs5inyWb+xwyUnB09ObF5iYLGd37o6WNwVVJyqbGfHX8fjBI7OdU6E9inRPBxOuMgl9FwUjiaeS3bnSjPPQWxyCpXbJSEMY5UHjMKXhzCmfiRHNwDcxi9ASt0weWM4QTTTjYtt3F+D8nU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763526132; c=relaxed/simple;
	bh=e9KKBSqRpzPY6grKYsXAmX2B+obxuFcMUZuGS3g4dmA=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=dScbubj7GAPDciGcZ2bhA/YSgWV/UaVEngD/iUbV7AlUbzipXAwoY4XGNBmuBjdDU78jMs0KgmlGusytRS0oa0TsNcxfQ0u1Yo0ex/nij2etpKjvi8UiKQnG7TO6nizMpbl0SikA0tYmmIomFZSHl5RwnD/Uslgj9iLjWjA6jB8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=e+oIZjvU; arc=fail smtp.client-ip=52.101.84.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="e+oIZjvU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iEO6ukEuqBdxZ0IHd3eDhnVc0dFUtbhxUdrf1kc0neY9L+5jgtGTQIgPN43hPkrP0jhzBdaY+ueIV6hcw74XgIkAgY9S+8FRSYFwhoasX/k2NxiV0PLqCtY24ZdWyCJudSJH/NDFwH4CFaUhGdXOtEdvS/EwdD4gyzUdG+PsyRBcoE4iOk3qiZMe0yjxlN4KLcGmBHVg1RTYwPaCD2Mm+16T/GmvvTGFCFv/mz/RupiXrir9z1XoQaVWZA2T8roaAwxTLNNLY9peKa8AjDCSWP9/+/jh22EOfYfCTowxdnyHS/PMCaZLkhPpF2MHlRo+ZSpswKLKNsZmnwRTeMVXig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wgWH9VIOsiI6vKzuzv045rzFk970gPtqDF/iqQO7bCU=;
 b=nt90wzC+J4mmrsNygb4QB2nh+uxh+EWyOUNMtP0PyZfxDD61fYdXhtG7tuIJMHdHg45jacGBnFfFICh2PgB07owk/EpmzPo030KTwsWUGv3j7SlDfX2M8slKn71NUKqAZVwXRlM6s2jhOoot8L5hE68d7zMeZjfoPN5tOvEWudBLS9t1XZGct/tDWNr1r65x83z+oYT8TwrjerInu7xWeqZt7Gu/4PB1U0sfcGFfsIvj/+0aWLpLegjhjtrYv9EHWmNsWRGFno3q+R+oJW03e0K834YCi7GrSbfaAyekOhcaMI7RJohlBEeeqDcYtHzBiN/2GbFPWc0V2mBi/A8nog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wgWH9VIOsiI6vKzuzv045rzFk970gPtqDF/iqQO7bCU=;
 b=e+oIZjvUcgdjFfkbEbFYOnCnswTBDE/BjhK5VaUr5j4Lbjai0phLfFW1xram6yQGnNgovVIs9jvHGZb4dxhsxcnc8ocVqXIJW+llexahk9dr8zp28LVSnugUuG+Q8Cjtq8SoTARwuNiKP13obtrQgf+fWX51P9OCFoVTDwMo5XvW2fKfsBSsg3FyxXPrWqyUVh/Dr0nY+PnZG97YLmvL3q1vaLdI8hz1UOPE+wtlQy9oe9B0k9nbklBZlsBBHiscOuRe/+P07P4dCQ7FP+9RiuuFEeHZpqLUQpHs4kngflIY9/HsWT4UE8detGKSUmS+HVzKtIOlqGHnCrMhtXKgNQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA4PR04MB9319.eurprd04.prod.outlook.com (2603:10a6:102:2a6::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 04:22:02 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9320.013; Wed, 19 Nov 2025
 04:22:02 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH v4 00/12] remoteproc: imx_dsp_rproc: Refactor to use new
 ops and remove switch-case logic
Date: Wed, 19 Nov 2025 12:21:45 +0800
Message-Id: <20251119-imx-dsp-2025-11-19-v4-0-adafd342d07b@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIANlFHWkC/x2MQQqAIBAAvxJ7bqEVo+wr0UF0qz1kohBB+Pes4
 wzMPJA5CWeYmgcSX5LlDBV024DbbdgYxVcG1ameiAzKcaPPET+BRFjVao3xgxu1MwQ1jIlXuf/
 pvJTyApHDbwNkAAAA
X-Change-ID: 20251119-imx-dsp-2025-11-19-fa99d7c84c91
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
X-MS-Office365-Filtering-Correlation-Id: 57648076-0fbb-4167-7621-08de27233055
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|366016|52116014|7416014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dG41dlFiMVVhR2VsRzdmUUdvVGhlSXhFNUQ2YmxLY09ReVMyRklOWnFQOTVa?=
 =?utf-8?B?TURxc2RRbFlGR3h4c2NaOHQrVjlsY1dDZm9XY3p6R3JYNnZLbk9JWHJZN0h3?=
 =?utf-8?B?b2wrdkVGWi9iaWRXczB6R1hyd2hjbjVlQUI2dVM1RXZWQzd2VUlsbEJHcnFk?=
 =?utf-8?B?aE1idmNrRFlLT0c3R1RLa1hSc2w3MGxKK3RNQmdOTEZkOHdEOG14VStTOTBS?=
 =?utf-8?B?TUNzWmpvMWNKVnNubGlPc2Y1NEJaVE52T20vZEdBeWx0ODg2c2ZiVzViZlFW?=
 =?utf-8?B?YjZUYlQ0Mk52cFZiQURGNGhJQWxuSk45NHhjTzBpbWtkeEdVdWZBSFRvTit1?=
 =?utf-8?B?RGxsYXM2eGZHOEtoS2UwbU9PcTVxL3FINk4zK1k3WnR2MHlMbk40QkMxQWto?=
 =?utf-8?B?dFFwajkrNXh5N2lSREg2OGNoZDVJb2Q2OGw1MHpmcURtMUZpdlVRZHE1RURu?=
 =?utf-8?B?U2dSMDVBSm9VQ3JRNXFpcU44UTY2aDZOZFBhV0VydElnQThOd01KZXhleXRu?=
 =?utf-8?B?RFFlSjVuR256eExrbE5YLytuYm1iZ21WNkNuMWU4aGM2b05Db09qeE8wRElB?=
 =?utf-8?B?aGtDc3pzb1ZWTUVGc2FrUG5Hb09RY2R5TER4VkVyeE5aY0YwdHc3RmQ2QU9z?=
 =?utf-8?B?bXpYdnQ1NytQYi9yVXJLcG00QUg4R3NuWlVzVFdwZk0xSlRJYktvNUV1U3Ex?=
 =?utf-8?B?NDB2WldQaFBuTmovV1RHUUJVd0tIdzBBNXNVS2htS0d6b1FaS3VHaWNFaWho?=
 =?utf-8?B?QnBHZVZaUWZnNGthci9TMXQ3ODUrQmhqUnpPN0M2eGE1KzhhenZQaE1Bb3Vs?=
 =?utf-8?B?bDl5MDc2VTZEbTVlRVhUYi9SdFBFS1RlY3krbFN6QlQwalNWQkxmUk1YdmRT?=
 =?utf-8?B?YUxsNnVKdlNaOWl3VlYzYTJpWUIrSmdwMFo2ZmtZaGlxTWRUeEg4Yi9McTgz?=
 =?utf-8?B?YTRBMXF5eGg0SGN5ajFXNkFiMXFRTlNMRnJCWUhoOEV4THdCTzlBV0tMVnFy?=
 =?utf-8?B?RHo4Uk9zYm5vUXFIN0FlOVRTd1ZpYzgzekJvMFlBNmI4ai9OVDFHdFpJMWpo?=
 =?utf-8?B?Q2lTQloxRHg3OW9sM1JuaUN4MTZwV0s2b05LZGZHMk16R1VIRWE1bEtOOG5w?=
 =?utf-8?B?a2c3dktrd016bkRKVmlCVlptY0k2eUQ3SVhBMzN4cERUeEpxZmNOdnNZbytk?=
 =?utf-8?B?SkVqRmdBcFVnMG11ZkhTTVZLU3RwQ2dJdk5DcUc2YXBocjI2dEtUVHQ5bDVS?=
 =?utf-8?B?SklmUVlIWXlNODFOOCtENE1panRNWE41QUl0NnBvTHpWSG1kQzk0eTZmU29Z?=
 =?utf-8?B?enFBQ3IrRGxoamozR0NUUnBVRW5UdDcvVkRSNVZkUmVjYnA3ZGd4SWhiRS9x?=
 =?utf-8?B?TFNYMHhuSFdVOVFqS0JCWmxWN1hVTlBUUlZ1OGF3VUNsSSs2VVJhMkNYVExT?=
 =?utf-8?B?YUZoSXJWalh0TlIzNUtYMFlGb2JEMVVacGtXc21iVTE2Mmx4MGJKblVmdk9h?=
 =?utf-8?B?ai8xK1RudjBDSVdiTDJuVnEvUmJFRXNXY2lUL3dqNURZT3VYb1ExLzRKbGFh?=
 =?utf-8?B?T2w4dmZSNzI1YmdETTRTSHJDZnc2cVcwN1U1bjZOcUlwWmVhYWdXa21lTHZF?=
 =?utf-8?B?WUg0MWxKTy9FRklJcE1QZ2VsZi9LTjREZUJtWEZSV2dhdGFEWDVXQzl0WDhO?=
 =?utf-8?B?WVF4bUR2NFcyY3U0OWpMT3pqWFJPNFZvektDQmMvQzhhcWljOFVHb0c0d1JK?=
 =?utf-8?B?NHl2dVF6UzZxYTEvcE45WlVjMzR2SnJJTStzWUNPbXdhYWEzN3ZhVWRoc0xk?=
 =?utf-8?B?S00yWXI1akk5NjAxUWhsSTgvdExNRFkvS3I0KzhKRDZpUmZqdHN1TEtwSVhx?=
 =?utf-8?B?Y3c2RjNVVkwrUG81RE9OUTQzdVJ3bVVFQzRTb2tCVHE0UGE3Qmp6TnQzd1Bs?=
 =?utf-8?B?YStDV0tST1ZDaS9PcnlLQ1hpSmNhV2tJYThMZENOQ2E3MmNvMG1HRVY4ODU2?=
 =?utf-8?Q?7zmIG9XL76MPOf6a8FMlZ6pKGEhBoA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(52116014)(7416014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SCtzSDlFejRPSUFUZUltRmt4UFJ1OGt3UDMzL1IvaVZEK0E1OFJyYUYvQ0JE?=
 =?utf-8?B?WE8rZEg3ekNqUENGRVhYQXp4TEJyVkpwTnh3UXMxbW5DQ1NxNWxqc2FJZTBZ?=
 =?utf-8?B?cngxTHdpM3ZUYlVlQmEyWEpjOHMrZTEyaExrUmhaM1hFdk1JMm1BelJ0bDV0?=
 =?utf-8?B?THJ2SmgvQlpWRjExR1hHd2pKQ3JvNWpmcUw3a3ZOc3h5VGJpRHoyamxVU01t?=
 =?utf-8?B?WkZ3MG1JQmcraGpacXBrSHIwbWUxZldXc1p5cjd3YmY5M1BzRklteEs5RGhm?=
 =?utf-8?B?Y1VvZWtZQnIxMnpsTG52OXUzelpoTStpMEJqdjBYUU1YSGpOSVNoTXpOVGhI?=
 =?utf-8?B?dUcydGI1b3pPOVhmY2N5Q0RqMEVkODA0MWthclAwTUVYSS9KTkxHMXJNWExH?=
 =?utf-8?B?alIwMjRzTjNQdFBrRjI1cmNsenIvZHBweUVVdFdVYy9iMVdGalpqNU9vTjZn?=
 =?utf-8?B?WGxDWlhRZUdPcWMwVXF2TWtvVDMwTzdxZytFVURndko0UlFGNTBBWDBvRXhN?=
 =?utf-8?B?RHNEVFZxeGx4Y2ZlcjhWU2pVQ2xhYWM3R2lmUC9pWTZGbWtVOFVQUVpqVzlv?=
 =?utf-8?B?MXpGbU5lV0NhSlpzYUpwM1ZXRDFFOFM2SERielU5WHQzYjAvNkhpWE9Qa2Jw?=
 =?utf-8?B?dFo3Ylg0MHcrdjV3bWYwc2RUVnIvb3c2ZEpkU24reG4xMHhkd0VaYjdZY3k0?=
 =?utf-8?B?UWNRN2tUc3pvY1QyallpL1dGVHpJbGtoUW1DZTNLVW9UYUJ6MGNHVGQvLy9j?=
 =?utf-8?B?cSs4NEVBK1JRcmdyYmUwaHhQT3k1cE5tdXV5VDBQWVUwNEpCeS9kcFNweXlK?=
 =?utf-8?B?dHJrRWtYOFhUcGVLQlRpaWlQTmdKeldib1kxakM3MzZ0TXpTSVE3Z1FrQzBS?=
 =?utf-8?B?TUpkMnlvWGtNT1dSUWMzMHJWQWZsVmF0cUk5MzhDUUJYMFNtRDg3dmF6S2Ra?=
 =?utf-8?B?Q2pIYjMrZUFYKzlYRzhXdUpzMGtuQUR5bVczeVR6a3NjVEcwSHBaVVRhczdH?=
 =?utf-8?B?KytmOE1EZFJaYUlKTGNyOGR2dEF6N0Yrd3VpMFRNTWZvTlRHZGM1SlpHVW5X?=
 =?utf-8?B?bllNa2doRGpqS3NSRjQ4NldlVG1qVWFENG1sUTB6V2dMMnA1eUt2aDllQUZj?=
 =?utf-8?B?THQwOVVvUFBQTUliSzlpT1pNN0NhdFdMeklVOWZMbU1DKzBsbnRJdFRpUEFh?=
 =?utf-8?B?anNpSVdRTGhXQUM2OVB3NVhOeWZBbFZmZllZVlpINlo5Y09qZlB2K28zNFY5?=
 =?utf-8?B?SmcrY0lXVGNSS1lxcDVxMUR2d0hLemNEVzR1ejZDZXgrUytaMklzbGlzNXdw?=
 =?utf-8?B?eXYwQzAyWDRUOC9TdTJUSkdvTmxyM3FaVjNXNlJWU2gvUTg3aEQrQ2lHaEtp?=
 =?utf-8?B?NTFKWHhCZ2M2SnpiSUV6aFI3aXRjVTVPbCsveEU2aHpOeUw0SkJEMkJnZnJJ?=
 =?utf-8?B?bTFhcWlKMEtBeENnYlVUMXArSlR4WVkwRXIweis3VGI1V09icWwrWk9FdHBW?=
 =?utf-8?B?b1gzK1lvU3kzM0lHV1V6ODFjdE9BN1dkejA2cDJpc2lrZllteWw0aWxSQ2hW?=
 =?utf-8?B?ZDlWdWQ5dk54ampLcXFhR3RQL2M5Mm1KQ1N2SkUrTHFSS3pmOUt0SnplV0ZB?=
 =?utf-8?B?dmRpWVNtd01kN24wTDErNzREclp6elBhdm5KQUNRcnhtYzBDb0cxd0dBdWZx?=
 =?utf-8?B?eUZhUG9BZ3dTUWVNUExzUHZaYXlsVHU5b2g3MHRwVzdtNlNLY2N3a3hXS3Fw?=
 =?utf-8?B?V09IQXd1VGNweElMOUFsbU9UUkZBVG5ZdkRjNEFYN1dVZVU5VnI3dEJwbHZV?=
 =?utf-8?B?KzY4bnVibE16WkczYk9WL1AzNUUxRWtMWVJPSUMwOEVNdGRPd3huYkJvVFI5?=
 =?utf-8?B?WVdlSG9hUDlDdzJkejlEM3hEWE5ZQ2NKNmhBSkJBNUE4ZWdPc0lySm5EWTV4?=
 =?utf-8?B?SFl0RmVtVlJtS3pjV2NnbmhwTGVNRWxnZ1JvSjdKTzZmek9YOE1keFJZY0dG?=
 =?utf-8?B?UzhOZ21MNEtKVFdoU29sdEtpeEJHbWxabGdJUExwd3AxaU53R0o5dmJuY1pn?=
 =?utf-8?B?SjQyc3o4d3duYTZ2dVlzaDN3S0ZWekZIM2QrZTBkb0pIQUtvVWVkS0k2a0E4?=
 =?utf-8?Q?B3HKEeeQsH5a/1Ypb1i2R0Gu8?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57648076-0fbb-4167-7621-08de27233055
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 04:22:02.4493
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n5Onb6j0KqMWPrJNJKkjagccrhX0bPf3Oar8SV2LbV/GndBvnLFMOoEBx/8pj9iuPd9PJx28HRYix4y9MWBIkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9319

This patchset aligns imx_dsp_rproc with the cleanup and modernization
previously applied to imx_rproc.c. The goal is to simplify the driver by
transitioning to the new ops-based method, eliminating the legacy
switch-case logic for a cleaner and more maintainable design.

Patches 1–5: General cleanup, including code simplification and adoption
             of the devres API.
Patches 6–10: Transition to the new ops-based approach, removing the
              switch-case structure.
Patch 11: Remove the obsolete enum imx_rproc_method.
Patch 12: Cleanup goto based logic.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Changes in v4:
- Collected R-b and T-b
- Address the build warning in patch 1
- Add a new patch 12 to cleanup the goto based logic
- Link to V3: https://lore.kernel.org/imx/20251111-imx-dsp-2025-11-11-v3-0-d05dcba737fa@nxp.com/

Changes in v3:
- Collected R-b
- Simplify commit log for patch 4 per Frank.
- Link to V2: https://lore.kernel.org/all/20251106-imx-dsp-2025-11-06-v1-0-46028bc3459a@nxp.com/

Changes in v2:
- Collected R-b
- Patch 3: Update commit per Frank/Daniel
- patch 8: Use priv->dsp_dcfg->dcfg to avoid adding "const struct imx_rproc_dsp_dcfg *dsp_dcfg"
- Link to v1: https://lore.kernel.org/linux-remoteproc/CAEnQRZAOTFw=sBppHTYQAdfDBuNqkqk6gVO4FyP0EBsva3Oi+Q@mail.gmail.com/T/#m27c93af9fb1e7fdeb0766bdbffbaae39d79eefab

---
Peng Fan (12):
      remoteproc: imx_dsp_rproc: simplify power domain attach and error handling
      remoteproc: imx_dsp_rproc: Use devm_rproc_add() helper
      remoteproc: imx_dsp_rproc: Use devm_pm_runtime_enable() helper
      remoteproc: imx_dsp_rproc: Use dev_err_probe() for firmware and mode errors
      remoteproc: imx_dsp_rproc: Drop extra space
      remoteproc: imx_dsp_rproc: Use start/stop/detect_mode ops from imx_rproc_dcfg
      remoteproc: imx_dsp_rproc: Move imx_dsp_rproc_dcfg closer to imx_dsp_rproc_of_match
      remoteproc: imx_dsp_rproc: Simplify IMX_RPROC_MMIO switch case
      remoteproc: imx_dsp_rproc: Simplify IMX_RPROC_SCU_API switch case
      remoteproc: imx_dsp_rproc: Simplify IMX_RPROC_RESET_CONTROLLER switch case
      remoteproc: imx_rproc: Remove enum imx_rproc_method
      remoteproc: imx_dsp_rproc: simplify start/stop error handling

 drivers/remoteproc/imx_dsp_rproc.c | 353 +++++++++++++++++++------------------
 drivers/remoteproc/imx_rproc.h     |  14 --
 2 files changed, 186 insertions(+), 181 deletions(-)
---
base-commit: 187dac290bfd0741b9d7d5490af825c33fd9baa4
change-id: 20251119-imx-dsp-2025-11-19-fa99d7c84c91

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>

