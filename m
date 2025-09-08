Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012067.outbound.protection.outlook.com [52.101.66.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A8D30ACFD;
	Mon,  8 Sep 2025 13:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757336914; cv=fail; b=WJFb1V+b8IPtrmuNwCsDe0M6vPmSD/BDUlFO6apTfEoLD3XhknyH7zA6bac5EUc3TfYL/a6WaJYxxZVweruSvvfmEds8zdD0oegVcGv3NLOUSLuZhK6Yveu/JYTWHADPF3199wVvuyjUDeexKBasGn7WX/vf1Ffaa6lUZj+xwFA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757336914; c=relaxed/simple;
	bh=fFdy4GWtWZ9gkc+MJDVpiTWuz69q9eCQtx0+SsNyjDw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=RGBi7jb3gs6QnwtiDl8s9rcq3IEGS1fxyGzSxh/hZ484u/e8O1LMikCHmzJBu+KJXHEd2Osydh1Fvwew5Gz0SxaK7yBL7Bj7aWQdkipjQQgUEV8a25RgeXvArvh7TA7zY78g5zmtE2fq1gqm7H0gHVkFGmmGlDb7P+8yQTRagI4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=loQu14/Q; arc=fail smtp.client-ip=52.101.66.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="loQu14/Q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yyiVzPhxaF52rS1Ahd2Kz/YKVCuH0x9AgLCm5u9z3FjWlW6udd9I45XOccF9NDyebUEZv59pR4KdNiK6UEWfGp0uUBDCmaArmxpjDaS4IiMgK46ic4/gXEws9brhGV9NExlRNj/170EIhusE3zRGluw8latqfTI56BDBHktLd8+yLMbaf2mFml/GIl2iC1YjsGdgCsEcFneeHV/AKTW7BN5p1Fga66Y7k9weqzqG88DGX+2dwSwElCpxwhcE6JmRwdWDeaNkKMs1Ew9A5GiGht4p3vJ/m6Cap6aNJLJAAHQ3/BSnQ+JeQebeZ/RBBTwAjIEhvPJTErSuwOfRNau+ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dKJW2gF61465ma9yL3dbdHFvemXR2ypy8f0vgNgvkG4=;
 b=PoCfcCTWO93EoXT89M6OtsPGNmJ7XSlJ7AYFT6hua9jnmoG9Mx8JG/J8jTgspoDPDgboa0obGOlkXTzJ/mSWD2MG2fnlSmR4kU9g7mxynnNQ49ce6thdPPmBlmgsdUPiX+BHAhItciSMnWi1ouoVVwjhGwJmmmc9innnkU6gy4akLHznMi6Jes9wQO8C46o4IjAM7bj5egmWdwVaXiX+f9pTRxgfvRIQ3ia0S2uMfU10rmIkwDP/ysTF/5TOyFsIiwN+Ik8UDBxjXxZvXlpKfTRFQUzpOIxWnHOkZiquToJndjImClDqYQ3CyywD8UA5ioBEyQLTgLQtawv835+sDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dKJW2gF61465ma9yL3dbdHFvemXR2ypy8f0vgNgvkG4=;
 b=loQu14/QfWTB4F6IlGxmTXdDLCP1bK4UlVfpuX4p3ScPyJiAoOA1ykPV/VVoIHhSao+9JcKm4hOFuIrh71qu1nTjazbLDKFyJI3bX19NQ8Ayt5LKG7hLmAFjIPmTXCgpY5V5y0PLxM2ggpLI7MmLo4G3e1brkCnC7fXjSnGM2SEvbUkA/Nu730mtXP3loUuxtUil8vIAblkc+TbusFCSoNqaYIe+j3WkuG3gNx41zG2j56JCkL01o5s3yPXGd+ajJy37rxf3yF5Gv6rpX3yTjn6SYnjfWcCWlGkf0uSXd/YiulKzAc1xarN1WU02ZRCW3qIvWoNW4+d3OGXhd3hoxQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI2PR04MB10977.eurprd04.prod.outlook.com (2603:10a6:800:271::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.13; Mon, 8 Sep
 2025 13:08:28 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9115.010; Mon, 8 Sep 2025
 13:08:28 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Mon, 08 Sep 2025 21:07:37 +0800
Subject: [PATCH 4/6] remoteproc: imx_rproc: Simplify IMX_RPROC_SCU_API
 switch case
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-imx-rproc-cleanup-v1-4-e838cb14436c@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757336884; l=7522;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=fFdy4GWtWZ9gkc+MJDVpiTWuz69q9eCQtx0+SsNyjDw=;
 b=uvjEwyHLysXx40gHqVJu/UsRj040dgYwBmEmadGSd6DqgCmAiAEOyBd398xCGfZlcmmAwtkrX
 uhrBU0jpvVZBlSNH//RoJJhbV0/iSosdW8OCFaKx54OxDU208LWA1t0
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
X-MS-Office365-Filtering-Correlation-Id: 186fdfa5-2a37-487b-5a1d-08ddeed8cd40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bmFqcjFrQ0VNNEZRN3UxaHp3bFc1MU0xN1lEMjlacXJhajh1N3l3K2daVHlG?=
 =?utf-8?B?a1lIRS9JYnMxcXdzQ2RtTDcrK2VhOEd5SGloQ25ZVmJrRU10d1M4Uy8rWEQz?=
 =?utf-8?B?b20zRHlzWnhCaHVmQWJCanBvUFBPNERWT1UwQU5SWWhiSzR2elI1Wmo4ZTZp?=
 =?utf-8?B?VEZqSy9jb3NOMzBIZnAwL0Vmd2ZsdTljYkV1WjNMSGo0Mk83eG9iRzA2UHBX?=
 =?utf-8?B?MklzL3l4b0YrdWppTVZHMGpFL1dMWHZnSVNGUjkrRElBbVpBK205bE00RXFs?=
 =?utf-8?B?eWt4UkppN0VSK1cxa0R5cWFJUldBSlhjams5dkhjSXlFblhzaERsRktSRCtT?=
 =?utf-8?B?ZG82ajNvei8zeGw2VlluQ0pGbWlMU2Z3Ymo1QUdOUWIvbE1hYVNMSzB0aFBK?=
 =?utf-8?B?cnNxb0dEZ1hoNjZNUlF6VUFKVlFJWjVnSm5Ia0JCZmdyMndRVjVPRUdKaDht?=
 =?utf-8?B?RXJJdXREYkNxbk8wUm93SDNHbHFSRnZjR3VzOUppaDVmVk1XVW54Y2dYVHdp?=
 =?utf-8?B?MGdIZ21RRDhPb2l3bWUrK3NDajE2SGNrMVI4aTh2SFhDU0VCOU1KSVk0ODZR?=
 =?utf-8?B?d1ZmWGFBbGJXNUozTjlOdkhEY2g2cGI5L05XMkhqR2xDMzQ0MVVlWmlhajVW?=
 =?utf-8?B?NGhpNndidml5b3NjV28vUmI5aHU3UUl4UkN1MDJkV0Z4MDYyTWw3bFI3K1kx?=
 =?utf-8?B?bHZRdUtmbVRhcEhzdmE1VUtYT3dPbXI3c1FtMUMzNGxEOFJpcUJTMk84ZXdW?=
 =?utf-8?B?T2ZLVmFGQXFxaEMydXFmUFBaOWpGenpvclAyaEx2OHVxTDEyVHhQWkZOU0Vz?=
 =?utf-8?B?UVRmQ2Z3c3Vsa3BCbGhFWVI0SkliTW1JWCsrTnlkdjc5RDlxMUozOWgyY3Y4?=
 =?utf-8?B?YVRWdGxkbmhUeHU4SDFWb2lOdVRtT3FlUys2UEJxcHE3ZXdRZU1XUzFjNUZq?=
 =?utf-8?B?ZW56Zy91eEJZM1FuTHhKaytEZ3QrTGU2ODR4MVEvaUdyNGhUNUxzaUsrUTYw?=
 =?utf-8?B?OFlZcEdXdmp4Q2VSMDY3aFZHakhXNjlSK3hqR2FseEttTE5HR0kySlJ5bDBk?=
 =?utf-8?B?STJjM1c1a2luSFJyZHlFdGNLcVBzWDMwLzZhRk5kUmllaFFGWkcwd0FpeWsr?=
 =?utf-8?B?R1ZPRVpzMzZjVnJhS003bzY2WGFCNW53ZnRFWVpkbkFWS21GYi8zYiticGxR?=
 =?utf-8?B?MFJWakNPQ2tPMXBGdzMvcEpPMmFhTzZjR1RyOG8yYS9mL1NoVVFMYnhSTHRR?=
 =?utf-8?B?MnFuYU85Qkh3c1lwQlZBd0FhOWYzY1cveUwyVmxyZDNOVCt3WlB2UzhBWU5y?=
 =?utf-8?B?Q2NMUUQvUFEzTzJHMW5iajFlcTRTYUFjalp3Q1lwTWUyTlUyd0doT1BkSXh4?=
 =?utf-8?B?LzI0cC9VbXlTSzd2bnltNndnWW1sQVNaWE54RXVOMmtoVVJEbC8xT3ZjNjBx?=
 =?utf-8?B?SElvWEllQVJyK1lXc1FqbDdNVFU4TkNWamJxc21icWZRbnNhSkZ3TGJrWTdm?=
 =?utf-8?B?dFJFanZKUjdMUFAxTkZ1RUV5SHVQQmRFajVHZ1BHRDhwV3pibnkzNk9sN21p?=
 =?utf-8?B?aVY2S3Bia1F5cGl3VWRHVTZsTkpyTEFIb3NhMmdzNVNYdnZsRmRDbloxYXlo?=
 =?utf-8?B?ZHc2NEN2RXBvSzNHM3lnc2MxMmhab3dXQmVQdjkvSHcvUEFrMlVDbEkyc3Q4?=
 =?utf-8?B?dmpHR081TFFyM2ZCRGRGd0tCVVlEYWtYcjI1VTFGQ1BNZTVwcWIwTEphZ0J5?=
 =?utf-8?B?RjBQR0plbWhXUXBYU0U1eTdzRFVmQ3U2Q0t2ekZrc0Q1ak44UnkrM0xxNGRs?=
 =?utf-8?B?K1BTZHFISUR5dXBNa0YzWXNuTGlaN2NjS1hvQ0xMM3puM1FyWFNkRVRNSFRl?=
 =?utf-8?B?djY1SE5UK1BTM2hJN3dLNzhkTlcvYkFGdVdRTFFuUHRoQXkrTVl0MVpIM2VB?=
 =?utf-8?B?bWw2eDZ1ckFZNlF4dTB4T283Z09mdjIwK2dCODFCTGMyM29JRGVQa20vMVU5?=
 =?utf-8?B?cUZCanJkbVNRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cSt0NUNVNW5VdU10cGtFMlpjUndhRzlESGtDZGdEY0ZVYkIzelFhTUowbGU4?=
 =?utf-8?B?K1V1WHN0QUZOcE9qUUIrbTAvUmU5REhzWFlPSnZDUmZHbWZ5TVlGY2xNdjB6?=
 =?utf-8?B?cVM0YThHRzFrTlVlekpMTUZvczcvcmNoNlJYTnk0WEE5dFIzclh1Z3pYcVMv?=
 =?utf-8?B?MG5XRm1DYjNvNjI4S3lMU2c0bFpBSzUzemozRG94c0haOVp5ZnIrYVludmEw?=
 =?utf-8?B?MGYwNlZvMnBjNUNCOFRid1VBN0tmVUl0dkRLZTM0Nk9uRXRNT0NxUzBLVjZU?=
 =?utf-8?B?WTNPditBNUsybGxmWE0zL1BUcHFqdmpUbDRaWGF2L2Y3TlRFWENaTEtYQXR3?=
 =?utf-8?B?TFZLRzUwR3J5SGsvNnl5K0VpcWJvL1U2K3Z3MWZIUmFGeTJHbU1aazRqSldZ?=
 =?utf-8?B?aWt1N1lYV3hlRUlqaDNJTVRNZXlFS1lGbUhmRkNvOE9Qb1VKRngwN2owRE1P?=
 =?utf-8?B?RHdyYldXUDNLNDdBTW5uc2k0K2ZLVEtKdWtDeG5yVDhrMG9BUlpBOXRManQ2?=
 =?utf-8?B?UEVZc0JKU0oycktHTEM0bHc4dDA1Tm5aTWlDMkQrOGd5SDlZRXFFVjJzSGdi?=
 =?utf-8?B?WCthcFlkRzZqZWxkUFBNL21iWGdNVkxxVEdsS2lrNW43N3FMMU5NeEwxM1F2?=
 =?utf-8?B?TEd3ZjVxZWJYeTJaVkt2OHBWdHI4QVh6eUI3WE5Xd29SVGJxbnI1OTNSZVhn?=
 =?utf-8?B?ajRYVnhkOHpzRUt0ekluREtMT0h6TGZ1d0ZZRGc3cDFlTGNDcXVuQnZoSFF0?=
 =?utf-8?B?Ukxwa3RtN3Q0cTYyZHZjc2pYdXl1VzdqZjlvUE1kTU5OUnNEUzRzc3JzT0J0?=
 =?utf-8?B?eDdJM2FSTU9KeEl6ZkxqaVl5dXFZbXZQYk5IUUVpUkNLS0wwdFhjbUdjYTM3?=
 =?utf-8?B?TXVPWVhuc2VUdDdsTG94dHVmVXRRY3h6Rjl1YmdlN0kzNFF0d0FqSm5QVEJt?=
 =?utf-8?B?RExGdG5SVXlmMEVXRCt1RmRRb1EzMEdvMS9nWXQ4Z0lYRHArME9Nd3pXWXBq?=
 =?utf-8?B?U1FQYmRDaWxtck5VdEdhUWxydWlPMXdpanF5cjhDMjhWbmNSWWkwOXBZd21X?=
 =?utf-8?B?UUlvcXdvK2tOcHhYM2w1dm9SNnpHSkxtakhpU3V3d2pSd3hvVU0xMDM0S2Nk?=
 =?utf-8?B?NlpleWJsK1Yya1dySU9UL1pIQVA0MHRyejFROFErWTA5aURsV2RRa251Q3Rj?=
 =?utf-8?B?bzFsSlllMUordnpPcU9HVE42VFJ6NTZHWXgzZzFDam9SVlNOOHlnUzMwbG9j?=
 =?utf-8?B?NmNLMFc3OXl1UFJzVUdtSUgzZW1kc1dXNWZvZ3A0TGNPWEloMjl2aW9DTEJ1?=
 =?utf-8?B?a1F4bFhVSzk1Qlh3bTg3NjdaYThFWkJKeitHYldXM3ZGMk9oR25DRzBoT1Zt?=
 =?utf-8?B?bkZUL1k3VW5MMERSdXRwQi9YQ0ppbGJCM3JwcHdYVWwyMmxUZGpPeHBPMmF1?=
 =?utf-8?B?SzFhQklyaTFsbmV0NTVXWnRkWTF4YzlNeERyL0JwSldqdUNlRjVNcGd3TVc5?=
 =?utf-8?B?VmU3bXh2a3F2WXRCRHJOd296L1BhV1Z3WHlIZTNSN2RsYmNMbGRVVWpZTlhJ?=
 =?utf-8?B?RUNvU3kxcDhleVptelNBN3I3SGhPTFpXOS8rbzdnaXhMK1puV2VGSlMrM3RX?=
 =?utf-8?B?L2cveG5tQmgyaUN5OGh2SWUzbWFZVkVFTGZRL0dmQjJlaVR1ZDlmeW11WHF6?=
 =?utf-8?B?K1RkTHdYMDZhMG1KLzVZK20vUzdHWkl6ekxCUVR0WWloLytqMUVDQTl0aUFP?=
 =?utf-8?B?aHUyY3kveGRDNU52UFJXMzZBdTMrbjVvZWc5SU1GaEVqY0NYSUpmM09tbmZW?=
 =?utf-8?B?TTNqdzdaWHRnNjRQaEgvYVdPaDN5aDhXZDZiTGMwZ3pDb1NCSW9Sc2ZuRFZq?=
 =?utf-8?B?MlQxOFlmN1RLc2EyejExMFhmRGJtK2ZZZTAvVGxBTzg1eXNzekpPQnlIREZp?=
 =?utf-8?B?OUZhN0ZnQjVqZklIUjh3bjhqekNzbGhYZHptT25ZcWdqeXVScXQ4MGdsREds?=
 =?utf-8?B?NERqUDN0MWM4SldYdFlEYlUrc1QvZlhucFJaa09Mek96KzY2c1BQYVRLQzVU?=
 =?utf-8?B?NjlPZk0ydGZSZnJUWmd5d0V1WU1tMjhUUzRNL1I2Q0dkLzByNEt0QktiZVY2?=
 =?utf-8?Q?9Phn9rxYuL0yHI0Qjuy01i+gs?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 186fdfa5-2a37-487b-5a1d-08ddeed8cd40
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 13:08:28.1704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cs6h9QHVesfprmyVdvds+g47hZfYBMivN4I2EfamKTEyQTFf5YZQKaQXlaPLXJNZrKu/wZfT6qqoWCc8JIhENw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10977

Introduce imx_rproc_scu_api_{start, stop, detect_mode}() helper functions
for all i.MX variants using IMX_RPROC_SCU_API to manage remote processors.

This allows the removal of the IMX_RPROC_SCU_API switch-case blocks from
imx_rproc_start(), imx_rproc_stop(), and imx_rproc_detect_mode(), resulting
in cleaner and more maintainable code.

No functional changes.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 149 +++++++++++++++++++++++------------------
 1 file changed, 85 insertions(+), 64 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index c37dd67595960f08fd85c0b516d0d03855cec9fc..ea34080970c6a5a9b035ef0d389014b8268660a9 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -296,6 +296,13 @@ static int imx_rproc_mmio_start(struct rproc *rproc)
 	return regmap_update_bits(priv->regmap, dcfg->src_reg, dcfg->src_mask, dcfg->src_start);
 }
 
+static int imx_rproc_scu_api_start(struct rproc *rproc)
+{
+	struct imx_rproc *priv = rproc->priv;
+
+	return imx_sc_pm_cpu_start(priv->ipc_handle, priv->rsrc_id, true, priv->entry);
+}
+
 static int imx_rproc_start(struct rproc *rproc)
 {
 	struct imx_rproc *priv = rproc->priv;
@@ -318,9 +325,6 @@ static int imx_rproc_start(struct rproc *rproc)
 		arm_smccc_smc(IMX_SIP_RPROC, IMX_SIP_RPROC_START, 0, 0, 0, 0, 0, 0, &res);
 		ret = res.a0;
 		break;
-	case IMX_RPROC_SCU_API:
-		ret = imx_sc_pm_cpu_start(priv->ipc_handle, priv->rsrc_id, true, priv->entry);
-		break;
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -349,6 +353,13 @@ static int imx_rproc_mmio_stop(struct rproc *rproc)
 	return regmap_update_bits(priv->regmap, dcfg->src_reg, dcfg->src_mask, dcfg->src_stop);
 }
 
+static int imx_rproc_scu_api_stop(struct rproc *rproc)
+{
+	struct imx_rproc *priv = rproc->priv;
+
+	return imx_sc_pm_cpu_start(priv->ipc_handle, priv->rsrc_id, false, priv->entry);
+}
+
 static int imx_rproc_stop(struct rproc *rproc)
 {
 	struct imx_rproc *priv = rproc->priv;
@@ -369,9 +380,6 @@ static int imx_rproc_stop(struct rproc *rproc)
 		if (res.a1)
 			dev_info(dev, "Not in wfi, force stopped\n");
 		break;
-	case IMX_RPROC_SCU_API:
-		ret = imx_sc_pm_cpu_start(priv->ipc_handle, priv->rsrc_id, false, priv->entry);
-		break;
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -907,14 +915,74 @@ static int imx_rproc_mmio_detect_mode(struct rproc *rproc)
 	return 0;
 }
 
-static int imx_rproc_detect_mode(struct imx_rproc *priv)
+static int imx_rproc_scu_api_detect_mode(struct rproc *rproc)
 {
-	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
+	struct imx_rproc *priv = rproc->priv;
 	struct device *dev = priv->dev;
-	struct arm_smccc_res res;
 	int ret;
 	u8 pt;
 
+	ret = imx_scu_get_handle(&priv->ipc_handle);
+	if (ret)
+		return ret;
+	ret = of_property_read_u32(dev->of_node, "fsl,resource-id", &priv->rsrc_id);
+	if (ret) {
+		dev_err(dev, "No fsl,resource-id property\n");
+		return ret;
+	}
+
+	if (priv->rsrc_id == IMX_SC_R_M4_1_PID0)
+		priv->core_index = 1;
+	else
+		priv->core_index = 0;
+
+	/*
+	 * If Mcore resource is not owned by Acore partition, It is kicked by ROM,
+	 * and Linux could only do IPC with Mcore and nothing else.
+	 */
+	if (imx_sc_rm_is_resource_owned(priv->ipc_handle, priv->rsrc_id)) {
+		if (of_property_read_u32(dev->of_node, "fsl,entry-address", &priv->entry))
+			return -EINVAL;
+
+		return imx_rproc_attach_pd(priv);
+	}
+
+	priv->rproc->state = RPROC_DETACHED;
+	priv->rproc->recovery_disabled = false;
+	rproc_set_feature(priv->rproc, RPROC_FEAT_ATTACH_ON_RECOVERY);
+
+	/* Get partition id and enable irq in SCFW */
+	ret = imx_sc_rm_get_resource_owner(priv->ipc_handle, priv->rsrc_id, &pt);
+	if (ret) {
+		dev_err(dev, "not able to get resource owner\n");
+		return ret;
+	}
+
+	priv->rproc_pt = pt;
+	priv->rproc_nb.notifier_call = imx_rproc_partition_notify;
+
+	ret = imx_scu_irq_register_notifier(&priv->rproc_nb);
+	if (ret) {
+		dev_err(dev, "register scu notifier failed, %d\n", ret);
+		return ret;
+	}
+
+	ret = imx_scu_irq_group_enable(IMX_SC_IRQ_GROUP_REBOOTED, BIT(priv->rproc_pt),
+				       true);
+	if (ret) {
+		imx_scu_irq_unregister_notifier(&priv->rproc_nb);
+		dev_err(dev, "Enable irq failed, %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int imx_rproc_detect_mode(struct imx_rproc *priv)
+{
+	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
+	struct arm_smccc_res res;
+
 	if (dcfg->ops && dcfg->ops->detect_mode)
 		return dcfg->ops->detect_mode(priv->rproc);
 
@@ -927,61 +995,6 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
 		if (res.a0)
 			priv->rproc->state = RPROC_DETACHED;
 		return 0;
-	case IMX_RPROC_SCU_API:
-		ret = imx_scu_get_handle(&priv->ipc_handle);
-		if (ret)
-			return ret;
-		ret = of_property_read_u32(dev->of_node, "fsl,resource-id", &priv->rsrc_id);
-		if (ret) {
-			dev_err(dev, "No fsl,resource-id property\n");
-			return ret;
-		}
-
-		if (priv->rsrc_id == IMX_SC_R_M4_1_PID0)
-			priv->core_index = 1;
-		else
-			priv->core_index = 0;
-
-		/*
-		 * If Mcore resource is not owned by Acore partition, It is kicked by ROM,
-		 * and Linux could only do IPC with Mcore and nothing else.
-		 */
-		if (imx_sc_rm_is_resource_owned(priv->ipc_handle, priv->rsrc_id)) {
-			if (of_property_read_u32(dev->of_node, "fsl,entry-address", &priv->entry))
-				return -EINVAL;
-
-			return imx_rproc_attach_pd(priv);
-		}
-
-		priv->rproc->state = RPROC_DETACHED;
-		priv->rproc->recovery_disabled = false;
-		rproc_set_feature(priv->rproc, RPROC_FEAT_ATTACH_ON_RECOVERY);
-
-		/* Get partition id and enable irq in SCFW */
-		ret = imx_sc_rm_get_resource_owner(priv->ipc_handle, priv->rsrc_id, &pt);
-		if (ret) {
-			dev_err(dev, "not able to get resource owner\n");
-			return ret;
-		}
-
-		priv->rproc_pt = pt;
-		priv->rproc_nb.notifier_call = imx_rproc_partition_notify;
-
-		ret = imx_scu_irq_register_notifier(&priv->rproc_nb);
-		if (ret) {
-			dev_err(dev, "register scu notifier failed, %d\n", ret);
-			return ret;
-		}
-
-		ret = imx_scu_irq_group_enable(IMX_SC_IRQ_GROUP_REBOOTED, BIT(priv->rproc_pt),
-					       true);
-		if (ret) {
-			imx_scu_irq_unregister_notifier(&priv->rproc_nb);
-			dev_err(dev, "Enable irq failed, %d\n", ret);
-			return ret;
-		}
-
-		return 0;
 	default:
 		break;
 	}
@@ -1163,6 +1176,12 @@ static const struct imx_rproc_plat_ops imx_rproc_ops_mmio = {
 	.detect_mode	= imx_rproc_mmio_detect_mode,
 };
 
+static const struct imx_rproc_plat_ops imx_rproc_ops_scu_api = {
+	.start		= imx_rproc_scu_api_start,
+	.stop		= imx_rproc_scu_api_stop,
+	.detect_mode	= imx_rproc_scu_api_detect_mode,
+};
+
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mn_mmio = {
 	.src_reg	= IMX7D_SRC_SCR,
 	.src_mask	= IMX7D_M4_RST_MASK,
@@ -1197,12 +1216,14 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx8qm = {
 	.att            = imx_rproc_att_imx8qm,
 	.att_size       = ARRAY_SIZE(imx_rproc_att_imx8qm),
 	.method         = IMX_RPROC_SCU_API,
+	.ops		= &imx_rproc_ops_scu_api,
 };
 
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx8qxp = {
 	.att		= imx_rproc_att_imx8qxp,
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8qxp),
 	.method		= IMX_RPROC_SCU_API,
+	.ops		= &imx_rproc_ops_scu_api,
 };
 
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx8ulp = {

-- 
2.37.1

