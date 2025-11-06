Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012003.outbound.protection.outlook.com [52.101.66.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4ED52DE6F7;
	Thu,  6 Nov 2025 03:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762399879; cv=fail; b=kJcOYvJjG8/X2aeF36TwnLIZuYi7lssi02kw9qK3lyL0SIj/AqZrW6u19PRbflPw/4RhJTX122sy6wCEwnQ6UTRM12Ob/7d+Hz0P3Wd70TPgBiKd6gcFGZfs9EseEKCeam66l/5KYcn0/rU7RAOKZKQtVArwEsDJ+Zk68ckeKb0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762399879; c=relaxed/simple;
	bh=MabbyjyoPbnWQv9vkkZtABhK4D5YWt7ZD821p5s8Gho=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=FKA8cfqrwPrlU8OjsTQtgLQ+cYA6SyHBiCn3JL2B97CgXw8D1DTJZwx4+eSlvdIk9SPhpbaeVp9D07Osccepsi56waOZhARTJICVIWQwHUHjJUG0qX4uxjvP5EB/Obijz8hXS/g7m3JZ7u30Xee+6jiBIg1Gr3NNQbTRLFvW4ro=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Ks1pu8kk; arc=fail smtp.client-ip=52.101.66.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Ks1pu8kk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c2JnBBx9Nrm3+85EZ53Mkmzfb3PjUBlFtZi+8o8ec31yIcEBr1eDK3doKLgcZz3bTUcWxkTBZgo4e8WNl9XMEzTUFptiVJ3fZEE1T0OpyAKiR+fE37ZrNEqrasnX3h8t/j0iiqMl36fws2TR5TLG2FMIs8ku75o5JClca6asXUrsK9o9QGEqFl7MtlAk6i1ntzosYWigucRESGtE+1pglNrg+voOSNvpCS4AJVCrtpOS/Cat5rDAWzty/c3U0C+NbCmA4ZdGlDjRjD4m1Bl6nJjwgCVx3THtGLpe8bujFaqHvmmMCC08J2Mw5CFvtnUwU8tmjuIIk7Y1BjLzGIeMWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fMwFQnF7q+YGW6rwyr0ioKajjHxxtxFwAJntznhH9IE=;
 b=XJJjyDB5xlN0Jzrgvhx8EBFCTBJsd0pqeaKMLqo9B8nrCdvA+yyVLhvGQwQUWZbTLbwuhft7FI8RzIK0et5i5w8oFbeM4UmGtNXr1oxb6GSjXc6/qqPKed9csF7HgqCSk9oCZq30ty9sDb6JDpKcVE6MAOiRlEijbSLtnkAfla8xFF7sXVIUT63ob72Ebe68P8qZK/hcSupIO4yheqOjjGQX8SzcjFtvbi6A1Fq0MooWoKM+LXd2Yqw7UpyCS1YJlkDhhS9xA17Ia0pMdZiQl3bydAx5uNkJRrOqMPkF0H9BPsWfYCg7z6lV3S6vV51dpdZl8MPxZpXWVq8FSa1mZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fMwFQnF7q+YGW6rwyr0ioKajjHxxtxFwAJntznhH9IE=;
 b=Ks1pu8kkK7FI7hxAgzRKo/a+HO317x1fUxP+8nNOyf8sW0Ze6e4La7w0VFNSOENkS9sRT+KBKRZ4YqjnAJaBeby040gMq2hUF9HMfdp2ai1SwzanCgqi2ihSL5DzIW5sJqDvFBYnKWt7GE78PKfATU0jIP27ZIOw/aJS4ImIshlPpBx3oZKOQP6e/qE1BlR2WmrYV9JnCgC4Py6g3EljMxLwErDYIxjIYyb8vEXFXxsxp0uACmSqhgEnxP7J+t5f/YLdxFdnoqXNk3WMqGvImoNRpwO/Rpe/PmTWgciiYIKbZ1oQeVcUov9ZKTHm1layRY2fXK7sfO3+WShyxK+qnQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI1PR04MB6813.eurprd04.prod.outlook.com (2603:10a6:803:13c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Thu, 6 Nov
 2025 03:31:15 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9298.010; Thu, 6 Nov 2025
 03:31:15 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Thu, 06 Nov 2025 11:30:31 +0800
Subject: [PATCH 05/11] remoteproc: imx_dsp_rproc: Drop extra space
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-imx-dsp-2025-11-06-v1-5-46028bc3459a@nxp.com>
References: <20251106-imx-dsp-2025-11-06-v1-0-46028bc3459a@nxp.com>
In-Reply-To: <20251106-imx-dsp-2025-11-06-v1-0-46028bc3459a@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <frank.li@nxp.com>, 
 Iuliana Prodan <iuliana.prodan@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762399839; l=1002;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=MabbyjyoPbnWQv9vkkZtABhK4D5YWt7ZD821p5s8Gho=;
 b=o5vMz1B1GxTjeX8Ma7CjWAuyTuXrkSidUaj3DBVwhIbXSSHF4dSbljaUlEai7Np7tvy4BTFAf
 eEs7bUdJGWcBQeU9cLURa4dCC1ApOvJGT1hrkHAmakSEok7Xd/7GbBl
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2P153CA0028.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::15)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI1PR04MB6813:EE_
X-MS-Office365-Filtering-Correlation-Id: 833ee535-3b68-4756-aa69-08de1ce4f0b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|19092799006|366016|7416014|376014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b2R4VklNYjJjTzdjdFhPRE1FTDNBcHFnNTYxZEsvOXNvVy9SQW5iMjgrMHBv?=
 =?utf-8?B?TFZ5ZjlwSWlmdm9qM2xhTDBXTTJaZ0MweWR3dEVVOEthdHBYYkhzdHVDMHlY?=
 =?utf-8?B?eEJtVVVSL3c1NkZYem5ONHJOZlBPMGo3bEVIOXBTbG01eUF1YWs2WkJ3aFRi?=
 =?utf-8?B?d0s2aWo2cVpyUnU4UWdRU0pHMDZEZ1c1RTF1OWk3a2pMZUVGa1NKR3NTZmE5?=
 =?utf-8?B?V2JTMnAzK3VBMVE1N1JldFgwWnMwWnU1cDlmWUZOTlZTOFN6OWxZeFE5aTdy?=
 =?utf-8?B?RlVvb0dEYjBWNDdRbDJrNU14ZkJ1c3FjTUpYQ0FiOGtTcmlXay93TmJObnlY?=
 =?utf-8?B?RzRIWVpRU0FNb2RBb2oxZW94bXA4OElHUHBWL1dlTlh3d1hZQWZobVo3RUkv?=
 =?utf-8?B?bDE2WEZFUWMxRExSM0NCVVlkQUcxbHR6VDZ3dXJoUGgxRTlOdXBnM0poK3Vx?=
 =?utf-8?B?YXhFWmE1eHlULy9udW1zOFFjRXZFcWdLMzB0YmRGekh0cHVqTGVCVFp2SjlP?=
 =?utf-8?B?WHFLdWxVajdidlFqa1h4ZkQ5ek5LZXhDOTJlbEsxeXEwRlZuM1o0ZGphSDNH?=
 =?utf-8?B?TkFHZGhwMHBvWjhJWldtTDYwZlRKSG9IVTNULzZveDd6KzYxZTFZMjNWYWUr?=
 =?utf-8?B?Q0pvSTNzN1dtcHNmT3dQcGIyQVNqR2JGNEtkMk9mVnc2WmFkeVdwVjRXK2gx?=
 =?utf-8?B?aTJFRWd2RWkzb21ndDU2RkN3QnNqZGlickZPQnl1K1ZzVlg5OFhCVm45SWJp?=
 =?utf-8?B?Z2p0NC9GTUZkVnVSMFFQOFBKaWQ4TVZobFRBcmR0OGZpYzNKM3JINHFPdlQw?=
 =?utf-8?B?WkNNUDVLMjk2emcyeTlBUXdhZm1GODk4ZXhNSGFZK3dValBFVjdpQUpZMnpp?=
 =?utf-8?B?bkxRQ0N3SXljblAydkMycW1Lei8yd2dPUkhXZHFlT1psdVZmamtMQ3gvdmE1?=
 =?utf-8?B?dG5qL1BkR2ZLcnJjZVA1U2Z0eWVZMEp5UUlFbHlBd2d1bFIrbDhNM3dWZncw?=
 =?utf-8?B?dFpueTQzNW82MHRjK3V0ZFFjNUkvaTE4Z01Tb0Y2UXh4VlFzREt3bVdObDdU?=
 =?utf-8?B?M3B6dG1tamJabXVGc0JSNVlSWW15aXQ0QUNQdkpNLzhYQnVvWU9BQlg2YlM0?=
 =?utf-8?B?Mno5SzNuVE9mbXduY1IxN0RPM2U1V285Yjh1L1orcFR2MENWRFVYOHBIYUJu?=
 =?utf-8?B?K2srbERRRGI3SVJVU29tR2E2cFI5YU1qTnQ2dHNvVUt1UXBSYjRZOTNYN3lW?=
 =?utf-8?B?Z3F4NXN5NTdZSkNzV2ZMU2hSMGN5OHp5dmhGcXltbWpMQ3Q0RHhqc0dxSmt5?=
 =?utf-8?B?OEszZUxVSUtlR3RGQXRpazQ0MGJXK2hYVW5jY1NkdCtES244djdCaWJSWXU1?=
 =?utf-8?B?Mll0QzJRY2crMEZTRk5jeWIvekJTRk9YUm9yZjM2MTNYUGNaQnc2bXZoVnFw?=
 =?utf-8?B?Z2dXSVNuSzB0ZlJuZnp6VzdPRlBuMS9jYytlSEV1WnRvSzVhUEFCL1RCbkU0?=
 =?utf-8?B?OTJFeVRZa2RqZnkzZGpIQUo2QVFlMlUvTTlBZVg3WnBXckZTbFBtS0FzNzlL?=
 =?utf-8?B?K2I1WUphd0JQYlJDTEIzaWdXTzhwcmhseVByczB1UUxFR3BURDMySzNQSkxT?=
 =?utf-8?B?RGI3NDZBL2JySCtCTVRXeHB2RUR2a3lpU2xIYmo5VTd3bjJVd1ZiLzRoSkdj?=
 =?utf-8?B?d3NEcFZxU0Jzd1Y5SUFWSFpzbHdla0hzV0hCcWtKNUpTN2dkbUhaeUhLWkdB?=
 =?utf-8?B?MGkrdFZ0M3ZPUVRobi9CWDQzZDAwNHRJS2crM055ZmdkT0ZMbUI0T1MwcmFL?=
 =?utf-8?B?VGlLZGxodWwxNGpyYXFxbFJzZGwwdldXejB5cXdSY2hlSU9YYUhkOFVSdmIx?=
 =?utf-8?B?RHhGQlBORm1VTnBlVkxMTkZTM280Q2prV2lKUWViUFF5TzdtRG9Db2w0N04x?=
 =?utf-8?B?K0YrUXB1K1psQWJKVHlRZy9ianVESUJwYWJyUDA4OVJjN0dRVHdqL1I2YkRH?=
 =?utf-8?B?TUtQYWJabE5XT3dJOW55TFIzclA2VkxjVVJVajMzM0t0QklZa3M4T1JmMUJI?=
 =?utf-8?B?M05HT3htMThsNFdrMEdiaTROTmhPV3hQcTdiQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(19092799006)(366016)(7416014)(376014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VkROYUNxaVVSdC9maWJFVVBuUnhVNmw5KzVRNndpOUN4ZDBqbCtOTi9QRTlK?=
 =?utf-8?B?SDVkQzVmak5MRmFtOTFmZjlVRjhVMG9wejZuVUtZVGxHMHhBQU0zVlpRamVj?=
 =?utf-8?B?dm1rRWZwMFdDSExONUR1L285V0NoUit3aXBoMkJkS0hheDBqR3pKUGF6L2Zn?=
 =?utf-8?B?NnQwU09zd1RtK1NCNXlJSVlsRU5aL1VJcGROV1pxQkZrbE1hNjg1YkFYeFpF?=
 =?utf-8?B?c2dnS2FtMzhvRjB6TUlwYkpGQ2hZMlowOFVVUDdSY01PSE5zSFV4Wk9QUEhs?=
 =?utf-8?B?VXlScXZkejBsY1RxSW9KbnhlaVFLT3lTQzVLeTZpRkdOZkVydEpuQWtVVWxF?=
 =?utf-8?B?N25pYUYyb3FwKzVSdTVIRkNLaGhIM25MVjlzNktPbjkvNmtNZ25MUHIyVUx3?=
 =?utf-8?B?Y1prREh1VEpkY0NBRGd3T2Y5T1ZKWXppY3NQZmI4ckh3bE1DQXVxTzllSU5z?=
 =?utf-8?B?d2dwcXNnZURwdzE2dUFoQ3hMZTMzT2xGditNbjdiYUhCWDhKbTFmOUpjM2Vq?=
 =?utf-8?B?Z2FSc3ZZZGljNURxNHM5Ukh1Q1pwTmZrbUoyS3czQk9USGU0OEZ2WEoyWGN2?=
 =?utf-8?B?ekdlWVpHZnNtV1ZTOVJRY3pCMUdmV21Ea2hucnUzNjFyMkhpQklmWE9YaFdh?=
 =?utf-8?B?ZWV2bkRyZ0xpTWJLVWxOVUdMczQ2UTRac0dqSjBJL2owaGIxVlExc2t1cXR3?=
 =?utf-8?B?cjhWOEdlVEZuUi9iMlpsWFprSS96bW55Z0tka0ErSi9ZcDBnVVJOS0ZTNytq?=
 =?utf-8?B?alBxRElNWXZWNEt4eDNCNFpsOWE0bDVLMjlucVg2L0piSGFCd0hpNUxucTVD?=
 =?utf-8?B?WW9xUDE1RHBIK0gvSko0ZDhRVGhka0VjS2x0NUFZVWZQT0l0UUtUVSs0eE1Y?=
 =?utf-8?B?cStMdjZUQ01wTkpzV2Q1clVwd2ZxRE9hdFFrdnlBeEoyT2JEWG5BOE82K1ls?=
 =?utf-8?B?M1QyZ3Fhd1REWW5rYnJLS2FtWkhOaWxyandhTzBZNEVFaWlTUlBYRmgraUNW?=
 =?utf-8?B?RzJBcWJabTR6aGlkMmowNU1sK3F3L2ZEWndGSXZMV1B6OUZQbmdacE5FZFM1?=
 =?utf-8?B?Um9manVlWmNDalhjaDFMckdZeUlDK0d5RWRSZjV4MmJPNnZvTC9yUitYc2pk?=
 =?utf-8?B?ZkYxYjdpWWdJckN2SDRCVXJFUE1MNUFXYVdyNHJJL0pvSEhQTmg1NXh5OVV4?=
 =?utf-8?B?eUl4d2dUcmlYQ05kS0lnY1FSZ0s5MkZxa3BtMEtzQ2hJSlJyM2hvbWZtUS91?=
 =?utf-8?B?SUJvV0VhSGkxVWJGZHZwcjg5ZzNMYy9NTnUxZDYyOUFteXI4dmVrTHdYVkNJ?=
 =?utf-8?B?eFZncXpoQnppditxOEc5UENZVzNIV1V5c1QrQ2RONlU2cjJCMkpGTGRKbzJ6?=
 =?utf-8?B?VS94d2NPSWduWlJzN3RodmdXSzhLWUwvRG5POWY1YUJHaGJWc1d4V3RvdGNq?=
 =?utf-8?B?SlVWRjRUN0dmVEJWb1RNRmw4NU5saGV0cXNRU09XTE1JR3FVVnBPMW9jMjZS?=
 =?utf-8?B?WU5UUEhIUi8vTlJrNDZvMHUrdXoxMmZDRU9JQ1JKbjRhOC9VTWhLRWtQZjhz?=
 =?utf-8?B?d0tnY3JNRDFkR3B5OFVvajNKcEo3NlpYWldPZmNTVXpCUkVEM2xxSlVRWm55?=
 =?utf-8?B?b0V3QUw4YTIzWEpsdUhBY3c5S2JSTVB0aXhxcUZaTlk4STZsVW1lWWo2Ym40?=
 =?utf-8?B?S05tbVc3V1VmWUpaZ0kzMHY0SEVxYWsvYnE1cVZaS0JDdXRVWUV3c21sS0Jj?=
 =?utf-8?B?SWZiTy9hQk9nMzFrV3dHejdrTlQ1OE9jRk8veWQ0M3lIQ21OL00rek53b1d3?=
 =?utf-8?B?Z1RsSFFXbHpDK2MxYmdocW16eDRDK2s2eTMyRW9CVWZWTldOeWZpRWg0TjBJ?=
 =?utf-8?B?UGdJRlVXKy92SzkwNzhrTmY4TFpsajlKWGx5enl2Wm5GWGk5Vm9PRnExajlM?=
 =?utf-8?B?OVRaZWdnaVByTXdpK3lGTXVpQ0pjMklRanN6dy9HVmJuSUhRZmFaaTNqUitJ?=
 =?utf-8?B?VnV1NW1NYTVxNFIxZzBQdWJCYnFMblh6eHovQ2VLRk5uYVBpc2lhYVZEMVhV?=
 =?utf-8?B?bmE3SHVMbnZqTXZ2OFM3S2ZDK0M4L2hJMGV1TVdKdHpaNDJ5bzhmUlg2RWJN?=
 =?utf-8?Q?OfLE3lMZcw5fLclFtKucHa9UK?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 833ee535-3b68-4756-aa69-08de1ce4f0b1
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 03:31:15.2709
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2noKaCTAtOrjgv1gSTOz1afMclLQJFFp6jstqRoFWFnlaoCp8IaeI3z/RAv2UaR2N/Vvaizv5PYR0x7K9oCClA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6813

Drop extra space between return and zero.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Shengjiu Wang <shengjiu.wang@nxp.com>
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

