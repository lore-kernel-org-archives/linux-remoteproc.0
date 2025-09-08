Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013067.outbound.protection.outlook.com [52.101.83.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC9330B50A;
	Mon,  8 Sep 2025 13:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757336908; cv=fail; b=XYQJWav0G+XCStOs00j2VHd668SE+ar1KG6LT+K0HtWumux3OFlRoz8wTcJKrJONM7eGer7TLbc+jRcLCQMR1YJIO1Eq/xTxyBGkGalShY7tomQcC/pa5/vgSrdoupUCxpDGaA9u6fYlyAsH0440EPVLb/9WORBTziPTY7jn5WY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757336908; c=relaxed/simple;
	bh=6GASo9v8yQZfVfwa1TM8JFSiJ4rhYZwtavJNBGHqU08=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=nvLetcW+VYDLvjkJJQVJ/3OUVlNc9LNbDhwcYYC0EMBaMTccGNXzqJZEmRZuD+Z6Y/UFiH5YYnAKcGVXM1BvtUZGmWENe3sCY9fNUHlWsrtC37WwiptG2dqu2egB5dSdYm5zoZiqnFq/3ubUHVhmJqmk9TAtddwBnuC1WOzTiaE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=YoISQueR; arc=fail smtp.client-ip=52.101.83.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="YoISQueR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n2SMxvGyToLfIGrIphP1e4BnLEnsGYvodqCIlZi82pANw1dRYeCxgtlkJ1UtR+hftT2yY3rboer+D+gU6nzU0P39m2/N1bzUpKow6DUF4FE74cTAhCjdC7JMA6Ts45LVjW31ZusZexQEWORDsx+qxlFRuR9Jz7RUXDHGAKSHxGYTCg5YciDxUxoo4bTcAkeI0YW5MDgZ0ut+MiXF3DLSDb7w/ELwouXylH0MOS9hly3CiBxUvfRl4Puj+isM9aVvrw1/WXCF9CAIDAi1bls2z2JgyzpSfge8Dz5aRAV1e8LUiDv4eJ2Q7J3kbY6gKRlAq8HENRv2k7aL6SToD88e2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8lX8bcT77AN4kyCi1Y8/buPj/MXD4Nh1MGrcsMUb4Ys=;
 b=D142K4LMMdcrKRVdGdbCxNy0++dN/UiKL7QAbNAHQcFKOFtAkVIdk4eUQYOhFx6ES00aJA1DibIBKnb77fYUDCWfVf0lVbe5WbdUpUCvajvDotQuIGPhCQ41xt6LU57tVeY8Ax+vE0p9203ERSnqsfWfmukodK4RB6fekVC2hucbD0JyG895jiW6V5R94cFNm2o+IR7RWoYvgl9HvImBSfL2NCqhekg+7tycKUpt8mbCjzUfw4RM/e8jdDssGcA5RyY6vVzVitC5N/jYnW52reKUBr5UPF2chQngQK0fVRlpGaKlAQEAABKP4sPEWntjOH+c1C3TC3/FIDZMM2/Q6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8lX8bcT77AN4kyCi1Y8/buPj/MXD4Nh1MGrcsMUb4Ys=;
 b=YoISQueRK+b1/PgCJAKZf/1npu/h6B3JhYNVc2NQDf0WRwI9PZD9GoecH8FgK/u0ZFzWD8ElmFs3Cd9SYcXnk6DYZybpwchlLb8DBkMlsUiZkKoc2LbxFoJFndqUzZHjCy/X3+RH+aRRB56ClSI89pitc2fHb1NuXdHPUM3mn/EFDo7nkEm0Gh7zjy2ZtKfOkh/xx6/u2des0L4OUP7Y7uwo5EISP65kTSnTaV5dqZQEXzCLKaLR5CvscnN58sjbeUKBPhTVq38tuNDVHyyaEYnP0AvonWdMYvqe4qSKfq72NcFEgrBeELausbba068BxlL0OtLCmrVqI9x6h/Fy+g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI2PR04MB10977.eurprd04.prod.outlook.com (2603:10a6:800:271::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.13; Mon, 8 Sep
 2025 13:08:23 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9115.010; Mon, 8 Sep 2025
 13:08:23 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Mon, 08 Sep 2025 21:07:36 +0800
Subject: [PATCH 3/6] remoteproc: imx_rproc: Simplify IMX_RPROC_MMIO switch
 case
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-imx-rproc-cleanup-v1-3-e838cb14436c@nxp.com>
References: <20250908-imx-rproc-cleanup-v1-0-e838cb14436c@nxp.com>
In-Reply-To: <20250908-imx-rproc-cleanup-v1-0-e838cb14436c@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
 Frank Li <frank.li@nxp.com>
Cc: Hiago De Franco <hiago.franco@toradex.com>, 
 linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757336884; l=7564;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=6GASo9v8yQZfVfwa1TM8JFSiJ4rhYZwtavJNBGHqU08=;
 b=9wePspCJP6RV94Wfp7WYziEReWJ/Qk/209fv67Bvtu1fiU37PnQxPu5birIckJwepnkVKo/tW
 qvsVJ5Ljt+rDjMP3wpslOH5LAWLHWDzo6iyAeewVP8meEWI6KFjlPcR
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI1PR02CA0022.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::16) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI2PR04MB10977:EE_
X-MS-Office365-Filtering-Correlation-Id: 32e06693-8df7-4b81-4c54-08ddeed8ca7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YXlTWm00Qkx2SStrSWJrNnloYkFpVENlQVVVVjNRN1pNZG9PZVp6RENSd3VG?=
 =?utf-8?B?WDUzWTVRalI5YlFWWGNHTnFERXZkOU5yVlNoa3BYN21OSDVaclZlNGtDNDA4?=
 =?utf-8?B?NGhoa3o5QVFBVmd0RTVobUxuWW93T3FmY3ptYXZESkFBc21HdG41ZFliN0Rw?=
 =?utf-8?B?dzdBRlkzRGNWckJVWDExeE1jalRaQjkyTGFHTHRlc01BNDJaTTFqWTZ3Z0tJ?=
 =?utf-8?B?Ry9iRS9sVjFMOVpmZW9ZekJwVUxwam9EMjdiK2JkZnl3U3FISThYV0pUZ1dV?=
 =?utf-8?B?NytzcVEzOEg1ZHV0ZlVzOGlHWitpMllFTkRsQ2JkT1MrYkpUR3dhQVZnQVJM?=
 =?utf-8?B?b1hkZ2krS002endHTzFBbWVCSGY5QXBtMlBVbVhWb0xBNExSOHA2d0RNc0d0?=
 =?utf-8?B?VC8rcEtKVVJKWjAzYjhqUXZqRUJydTI2YmR2dElJdFhSUk8xV3FpV0FtZDNs?=
 =?utf-8?B?dTB4bUxmQ1Y1ZzBmSHZsZUEvTjFMeXl3VzRSOTAzMUJNYWwrUndhYnU4eWtt?=
 =?utf-8?B?cUNuN2lkaDBKdHVTUmlIbkRDbWhnTXd6bjF3cTlMU2pqakhhRk56VUZlTVFC?=
 =?utf-8?B?SHA5cXAxL2xnQ2tuNXNpSHNUWTVSckVCbHFQdmk0dzYvMTI5U1BUai9SNXVw?=
 =?utf-8?B?WGtEUnprUFY1RVJtemZlZ0R6ZEo4VlhqYkVLNjNVbnZmZjBMejZSN2xxM3ow?=
 =?utf-8?B?MnNlVllPa3lsNFdCRXNXYnJjcC82RjBxODhNTlVWLzN4ZzhIOU5UeXdRWmRB?=
 =?utf-8?B?N25QRFc3Q3BUQkpGZUlaTlBaY1FDQUxmdGhUcGVYMTBoZkUycmZGL3NCdXlH?=
 =?utf-8?B?OGZ4TzVrZ0prQ25IeEEwRWZsa3dPcDIvTFRYSno3SjRpcE1JOVhkYVMwckx0?=
 =?utf-8?B?dWhxSmFmRGtaL3Y0b3NPZ092cmVzMm5obk91UUNsMzBHRHhsd0xrY3A5ZjNZ?=
 =?utf-8?B?blZiVDNEVkUwalV3cSt5ZXpxTG5IR0c1ZE51czhtUW5NZDZhTVh5MDU1YTZ0?=
 =?utf-8?B?YllIc2x2TWhXQytCcXdBRktKTHRWSlRFeng4clB4UFRlK08wVDAzZ2RjenRj?=
 =?utf-8?B?cEVHVDkrM3h3QTJBdDR2WXpVYVRIcFJrZG5VMnljV3VabXFENjJBRmFhTTRq?=
 =?utf-8?B?czJsYUREbnBYWFp2dWpzUHRxOU9sOHdZNmZLZjBCUm1teW81TWFPMERyeU5r?=
 =?utf-8?B?ZzJLRTJZdkh0STlCNno0UWFnRjlJSG9EM2J0Q0wvc0hyam5kZWV3aHUyM3Rl?=
 =?utf-8?B?ZTN4V1ZHOVBIdFY4NnBPbnhZTGlwaldxcGM2UVRibEgvSDlsanJGbVlyUW5h?=
 =?utf-8?B?R2RaOXhXaGgxaVQ3MXlkS0FTOTQwcnhubHlOZmE3ZDJWV1N2T25hM3NKNEtJ?=
 =?utf-8?B?UTY0eHErSVQ2S1FoRFFERnd3czZqMFJlM29Eb1pDMHpzdnNOTzRNUXhzMDJX?=
 =?utf-8?B?ZjVwdWVvMFdBUnVhd0JzcnVWNmVYbUhtbm5vdzBidkNSWG9JamZ6S1pudFZG?=
 =?utf-8?B?NzhMWWdpeXdLZ25BdmtVWnZGQytlT0lIamxsaE9Lbmdtb1dYWnB3RXVNWm9T?=
 =?utf-8?B?eWprMVZocHdsNkVTSG9jVHYzMUYxaVRaTmprZEhJeTkxRFZGYkpyanN0eC9y?=
 =?utf-8?B?SGtOaklRU1cyWDRCUDIrWU16RmxuZlZJRXZ1SGhvRW16enJhdXUwMHE2Ykc3?=
 =?utf-8?B?UExzZEdvblFpbFFsUm51TG04aHhBSHRTYTlmcW1WOXJwdlVuQ0J0ZUY5ZTZS?=
 =?utf-8?B?RE1wVE44QnQraFV5U01aUmhMTjdMYkhycUEwV2NDRlJtZC8zUlZ4YzUzZkdo?=
 =?utf-8?B?OFl1WEFwcUNBWlRBeU9yN3JFSmlmQTkxbStOYThDRDJhTTcyU1gxeWsvdG9j?=
 =?utf-8?B?WUJacmFvWitodmUxWVU1QWNXSDhpdkVUYkdxMWhrR3UvbE9lcmFLT014RU4y?=
 =?utf-8?B?bHQ1bkJQdjV2NlBjUnc1dnU3V0FYMkwzQmZ0Q0JkemdKVCtUbm1uTUhvcG9o?=
 =?utf-8?B?Q2dMSjZzdEF3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Zk9LSytJK1BUM2IxaUdLUmFGQXk0eHIyemhMUU9zZ3VlbkxpTXN6d3lYQkpM?=
 =?utf-8?B?MnFKR1ozTFovUjRrSDVkcFZyaG1HL3UrK0U0WnJma2hITCtSTEVROUFmb3Rx?=
 =?utf-8?B?cHJ3SUFDTU1aUWhrUmRiUjZPRWsrbWZxNkhSb2hwbVJMNkdDaEtwU0FYSjV1?=
 =?utf-8?B?cFBpcTRiVytHSnUyeXBpSThjbXVSTzNoYjFqVkhmcTd1Y3hsQ2Jua2dnL2hR?=
 =?utf-8?B?WE4rT1k5QjA5OHRWK08wSG96aXdEaDJJSXhCcVczTEJsRHZvYmUyS044WHEw?=
 =?utf-8?B?S1Yza0tOUDR1V202UTkzcU5mYU9BR3RrZFdhN0hEMUxTUWN5ZWNwVEZXS3JF?=
 =?utf-8?B?eTFiUHI1N2dwRG10RGFlVjB2K2RBeEgzeVh1MDN3Q29Va2ZlSVh0c29xeTFj?=
 =?utf-8?B?VFVHSy9meHRLblIzK1NwQ3dQSjBlbjZDRXR3N09rdUtZbWkreWhWcjFVWnhX?=
 =?utf-8?B?enA5VnlPdzVVRkZ2TXhEUmhpUnJocVFqZzFnZ3diQmo0YjRUemhOdTdnNGJs?=
 =?utf-8?B?eFRsT0ZvYW4xMVBZNWsvTGk0bDBKclF6Nlh0ZzAvSFg3TTU3K25QdXFsY3NG?=
 =?utf-8?B?cWdrWHFpb3ZQYW5LUkZMR0V4ZU9JWmJhbnkvRnhadEpMM2dydW54ajQxK0Nx?=
 =?utf-8?B?a1hQSmMzMFh5b1N5K21IUzVOSFNZamFxZXdvbHB3Y2dQVGQwR2pzanhSNlow?=
 =?utf-8?B?dkg0NkRNM3VLVW5IVjhxVkNiMUdicVBpamhQSUliSEVZS09rNi9WbHlXUndo?=
 =?utf-8?B?c3JoZTl0cVp1Um0yU1k4N3lUbjI1a1V5Q2pQTUZHOXpkWjJSUEZ1TjJ6Rnl3?=
 =?utf-8?B?VEhJVThIYWxYNW9PNGI2WU1wNTB0cHVmWlJjQ2JidGVPWkMzV2ZKbUV1UU55?=
 =?utf-8?B?ZkNtTjhuSjdlTmYvM2FkcUswMFNVNFdpcU94SENwL0N5SGhhTkU4TEpQZFFN?=
 =?utf-8?B?cUFFdGhNK3FsTUVEK1VPbFZpY0VqWHB2WEdob1orWnlOcnRRNmRQT0RoazZL?=
 =?utf-8?B?V0ZKdkQ3Qm1YaUxJU0NBaDJRWVI5ZGtibk5SRkc0OVFNandyM0s4NGg4SlFM?=
 =?utf-8?B?cVZnUkdEbDZENFYwU1FaL0lmeFFIdU5abE1Ud1JUWHY4QXhFdmxicUdKdFdV?=
 =?utf-8?B?RmhuRDJVc1dmMkM0cERhQXlXOVdDSHEvdnNTWkhjNER1aWdROTYzNlpxQXZH?=
 =?utf-8?B?L3hvam5jc2tJSHFYcW12QjJwek1IM2ZkSkVjeERQbkdBY2IxZGFRVHIxbU9J?=
 =?utf-8?B?ajVoSEJzU0VITXBrZTUxMmFDMDBYQWpsQy9RNVQ2L053bXFycXMzcGFpekNs?=
 =?utf-8?B?UU1HT2hqWktNQVozVDNVaVBHMW1PSnErNVVOcmZCM0hUN3hWZGNKdlBkVUgr?=
 =?utf-8?B?aHdlOEdCSlRWRXd1aHM1RDdxVHdWby9lcmlEeEVuWlNVZ01LZTFHYW9oNDRw?=
 =?utf-8?B?VjdmcUwrMlpPZVltN1g4bUVIeFMyR2JNUDZOYjQ0d1hhVTF6V0g2MkRBbGti?=
 =?utf-8?B?WXh2eTBRY0Z0MjM1QWloWVVtLy9YT0JIaGE2emFSOE81QjVJcytybFp2ZStJ?=
 =?utf-8?B?b3duMGx2Y3B1WW5PMGNIbHQ4OEp6Q1I1RDVZWlF4L21ncGs3aks0cWE2Njdz?=
 =?utf-8?B?STFSWFBVL1d6ZFlTc0ZNQit1TThuWGRkMTZOa05XUHRrUDhpc3paWjh5Mjc2?=
 =?utf-8?B?cW9rWlV1eWNMZjc3cHRIdXlYNGxVSnhTVnNrTVl0Ri9HZ09QOExndVl6ekxn?=
 =?utf-8?B?N0NOM3V3bHlxeVc0UkN0TjNtY3V5bTNUVGQ2STlsTVNieUUvRXRJaEVxR0Zn?=
 =?utf-8?B?Rm9JQ1UxdTBQUWVPOUlvT0Q2NzVZVHNLNEV0MjZvdGJjbGh3d0RwaDBobjg2?=
 =?utf-8?B?RnpJbS91YVNGYlRUNjJ2U1VtN1cxZitFcTRieDZVVVpQZFpzVjY2QWU3cHFl?=
 =?utf-8?B?eUF5TVNiMW5abEsvYjc2cGlHRUxqcm0zbzUzSzd6cXNXOTU5ZXU4QzBzODR6?=
 =?utf-8?B?WUNrNFZnRXJaYkU1WVFtbVcxRUVjeDFUZHgxVkduUG12WXdoaVU2OVkvSXkx?=
 =?utf-8?B?ZUpKOFZBTWg3TDZiTFRuSkRuNXkreUgvblRqUDF2UXVhQVg0a1NCYkVsbkVZ?=
 =?utf-8?Q?ZgxQKVFoYF202PViMXnEALRFU?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32e06693-8df7-4b81-4c54-08ddeed8ca7d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 13:08:23.6016
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mjhsmZyHk+P5pHdi+GTjEEuJzo5otm7L5JpUWm21kRZJmbM/i3IeoMJfoNDr8gtXsP+ptv7LHZemIHkMljysxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10977

Introduce imx_rproc_mmio_{start, stop, detect_mode}() helper functions for
all i.MX variants using IMX_RPROC_MMIO to manage remote processors.

This allows the removal of the IMX_RPROC_MMIO switch-case blocks from
imx_rproc_start(), imx_rproc_stop(), and imx_rproc_detect_mode(), resulting
in cleaner and more maintainable code.

No functional changes.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 148 ++++++++++++++++++++++++-----------------
 1 file changed, 86 insertions(+), 62 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index af7b69d750deed734668cb413b29378e5ca7c64e..c37dd67595960f08fd85c0b516d0d03855cec9fc 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -285,6 +285,17 @@ static const struct imx_rproc_att imx_rproc_att_imx6sx[] = {
 	{ 0x80000000, 0x80000000, 0x60000000, 0 },
 };
 
+static int imx_rproc_mmio_start(struct rproc *rproc)
+{
+	struct imx_rproc *priv = rproc->priv;
+	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
+
+	if (priv->gpr)
+		return regmap_clear_bits(priv->gpr, dcfg->gpr_reg, dcfg->gpr_wait);
+
+	return regmap_update_bits(priv->regmap, dcfg->src_reg, dcfg->src_mask, dcfg->src_start);
+}
+
 static int imx_rproc_start(struct rproc *rproc)
 {
 	struct imx_rproc *priv = rproc->priv;
@@ -303,16 +314,6 @@ static int imx_rproc_start(struct rproc *rproc)
 	}
 
 	switch (dcfg->method) {
-	case IMX_RPROC_MMIO:
-		if (priv->gpr) {
-			ret = regmap_clear_bits(priv->gpr, dcfg->gpr_reg,
-						dcfg->gpr_wait);
-		} else {
-			ret = regmap_update_bits(priv->regmap, dcfg->src_reg,
-						 dcfg->src_mask,
-						 dcfg->src_start);
-		}
-		break;
 	case IMX_RPROC_SMC:
 		arm_smccc_smc(IMX_SIP_RPROC, IMX_SIP_RPROC_START, 0, 0, 0, 0, 0, 0, &res);
 		ret = res.a0;
@@ -331,6 +332,23 @@ static int imx_rproc_start(struct rproc *rproc)
 	return ret;
 }
 
+static int imx_rproc_mmio_stop(struct rproc *rproc)
+{
+	struct imx_rproc *priv = rproc->priv;
+	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
+	int ret;
+
+	if (priv->gpr) {
+		ret = regmap_set_bits(priv->gpr, dcfg->gpr_reg, dcfg->gpr_wait);
+		if (ret) {
+			dev_err(priv->dev, "Failed to quiescence M4 platform!\n");
+			return ret;
+		}
+	}
+
+	return regmap_update_bits(priv->regmap, dcfg->src_reg, dcfg->src_mask, dcfg->src_stop);
+}
+
 static int imx_rproc_stop(struct rproc *rproc)
 {
 	struct imx_rproc *priv = rproc->priv;
@@ -345,20 +363,6 @@ static int imx_rproc_stop(struct rproc *rproc)
 	}
 
 	switch (dcfg->method) {
-	case IMX_RPROC_MMIO:
-		if (priv->gpr) {
-			ret = regmap_set_bits(priv->gpr, dcfg->gpr_reg,
-					      dcfg->gpr_wait);
-			if (ret) {
-				dev_err(priv->dev,
-					"Failed to quiescence M4 platform!\n");
-				return ret;
-			}
-		}
-
-		ret = regmap_update_bits(priv->regmap, dcfg->src_reg, dcfg->src_mask,
-					 dcfg->src_stop);
-		break;
 	case IMX_RPROC_SMC:
 		arm_smccc_smc(IMX_SIP_RPROC, IMX_SIP_RPROC_STOP, 0, 0, 0, 0, 0, 0, &res);
 		ret = res.a0;
@@ -855,15 +859,60 @@ static int imx_rproc_attach_pd(struct imx_rproc *priv)
 	return 0;
 }
 
-static int imx_rproc_detect_mode(struct imx_rproc *priv)
+static int imx_rproc_mmio_detect_mode(struct rproc *rproc)
 {
-	struct regmap_config config = { .name = "imx-rproc" };
+	const struct regmap_config config = { .name = "imx-rproc" };
+	struct imx_rproc *priv = rproc->priv;
 	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
 	struct device *dev = priv->dev;
 	struct regmap *regmap;
+	u32 val;
+	int ret;
+
+	priv->gpr = syscon_regmap_lookup_by_phandle(dev->of_node, "fsl,iomuxc-gpr");
+	if (IS_ERR(priv->gpr))
+		priv->gpr = NULL;
+
+	regmap = syscon_regmap_lookup_by_phandle(dev->of_node, "syscon");
+	if (IS_ERR(regmap)) {
+		dev_err(dev, "failed to find syscon\n");
+		return PTR_ERR(regmap);
+	}
+
+	priv->regmap = regmap;
+	regmap_attach_dev(dev, regmap, &config);
+
+	if (priv->gpr) {
+		ret = regmap_read(priv->gpr, dcfg->gpr_reg, &val);
+		if (val & dcfg->gpr_wait) {
+			/*
+			 * After cold boot, the CM indicates its in wait
+			 * state, but not fully powered off. Power it off
+			 * fully so firmware can be loaded into it.
+			 */
+			imx_rproc_stop(priv->rproc);
+			return 0;
+		}
+	}
+
+	ret = regmap_read(regmap, dcfg->src_reg, &val);
+	if (ret) {
+		dev_err(dev, "Failed to read src\n");
+		return ret;
+	}
+
+	if ((val & dcfg->src_mask) != dcfg->src_stop)
+		priv->rproc->state = RPROC_DETACHED;
+
+	return 0;
+}
+
+static int imx_rproc_detect_mode(struct imx_rproc *priv)
+{
+	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
+	struct device *dev = priv->dev;
 	struct arm_smccc_res res;
 	int ret;
-	u32 val;
 	u8 pt;
 
 	if (dcfg->ops && dcfg->ops->detect_mode)
@@ -937,41 +986,6 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
 		break;
 	}
 
-	priv->gpr = syscon_regmap_lookup_by_phandle(dev->of_node, "fsl,iomuxc-gpr");
-	if (IS_ERR(priv->gpr))
-		priv->gpr = NULL;
-
-	regmap = syscon_regmap_lookup_by_phandle(dev->of_node, "syscon");
-	if (IS_ERR(regmap)) {
-		dev_err(dev, "failed to find syscon\n");
-		return PTR_ERR(regmap);
-	}
-
-	priv->regmap = regmap;
-	regmap_attach_dev(dev, regmap, &config);
-
-	if (priv->gpr) {
-		ret = regmap_read(priv->gpr, dcfg->gpr_reg, &val);
-		if (val & dcfg->gpr_wait) {
-			/*
-			 * After cold boot, the CM indicates its in wait
-			 * state, but not fully powered off. Power it off
-			 * fully so firmware can be loaded into it.
-			 */
-			imx_rproc_stop(priv->rproc);
-			return 0;
-		}
-	}
-
-	ret = regmap_read(regmap, dcfg->src_reg, &val);
-	if (ret) {
-		dev_err(dev, "Failed to read src\n");
-		return ret;
-	}
-
-	if ((val & dcfg->src_mask) != dcfg->src_stop)
-		priv->rproc->state = RPROC_DETACHED;
-
 	return 0;
 }
 
@@ -1143,6 +1157,12 @@ static void imx_rproc_remove(struct platform_device *pdev)
 	destroy_workqueue(priv->workqueue);
 }
 
+static const struct imx_rproc_plat_ops imx_rproc_ops_mmio = {
+	.start		= imx_rproc_mmio_start,
+	.stop		= imx_rproc_mmio_stop,
+	.detect_mode	= imx_rproc_mmio_detect_mode,
+};
+
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mn_mmio = {
 	.src_reg	= IMX7D_SRC_SCR,
 	.src_mask	= IMX7D_M4_RST_MASK,
@@ -1153,6 +1173,7 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mn_mmio = {
 	.att		= imx_rproc_att_imx8mn,
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8mn),
 	.method		= IMX_RPROC_MMIO,
+	.ops		= &imx_rproc_ops_mmio,
 };
 
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mn = {
@@ -1169,6 +1190,7 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mq = {
 	.att		= imx_rproc_att_imx8mq,
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8mq),
 	.method		= IMX_RPROC_MMIO,
+	.ops		= &imx_rproc_ops_mmio,
 };
 
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx8qm = {
@@ -1204,6 +1226,7 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx7d = {
 	.att		= imx_rproc_att_imx7d,
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx7d),
 	.method		= IMX_RPROC_MMIO,
+	.ops		= &imx_rproc_ops_mmio,
 };
 
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx6sx = {
@@ -1214,6 +1237,7 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx6sx = {
 	.att		= imx_rproc_att_imx6sx,
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx6sx),
 	.method		= IMX_RPROC_MMIO,
+	.ops		= &imx_rproc_ops_mmio,
 };
 
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx93 = {

-- 
2.37.1

