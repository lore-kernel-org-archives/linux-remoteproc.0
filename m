Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012013.outbound.protection.outlook.com [52.101.66.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51708142629;
	Fri, 12 Jul 2024 08:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720772785; cv=fail; b=aZBr/2Z62HcxisslBoIsXLwhJPRSzsKF7/0ZlCoodVpNzmqqn3gPfkhuSry4e5JBEygzjTKYj4z2KuYEspygg4s/8oT3+Lg8QyWQKBOs+wgAhAjgfdiogW3DJFUxLz8Ri5q8pyNdBawtkEP5aPY6Ug9OBUO8dtO12KE2LGFlKoQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720772785; c=relaxed/simple;
	bh=ENPcFXDgezqztW3EndN1GQjVUrJJok02kUZFwEZ5YSM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=BnaFFGhslMkRiPUlnszinlJggL82AZOsNm1MTUsh1p37+v1DyH7SoAGsGt69CcNRJ4AFUW/IA4Qamx+vyv+Oz8OfkLq8xCbtqjp5ETXDffKoBDkP6UuNNES0VmshnoWZpOuWcvjAMcXgpYDwujTj42OL2i27ue4ZYUDzJ61uUos=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=FrFOvG3I; arc=fail smtp.client-ip=52.101.66.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="FrFOvG3I"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M/AajlnpKB/gMnUfffBkw/WBmjfMgX8kXCJSrgxIMcP5PYITde1fYTAjII0bW91HacQw9DB4KPbsO7TtRW/XlKplpJleFgYnzxo2qJKBbs2ONKdiu1EhPHEEhjUZOG4fq5sydJaCcAlwvvvuW6oSUrvOEsCd6AXPtcQqiX3U94ITTE43UCRJNh68GtmwhptS1eTdKof+viFxz2csZ4ECUGhT24lnmxolvnUp/YmVEq059ifqiSS+uAp3FcTVrggc8yQ2MqYaIvhnuKPs+pELL27qgtS32tPo6zzj2pnsbs5mHmkngMF312b6/lVt8/vDf6oLhL5KwuVOzfbItno8Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0vbBdALk7Dt7D/DXgkbkRMc+ZTf7bDhD5YGcNlMAt8g=;
 b=vDMDLKAGPWuUKoSi44wrbdXYmv4cYrKDYFzvZba/21zxj9osiv01rSNvixFVL1MjnuhgYdhnu+nJ4Dn1M7ec+ySDXEpm5Pkk2tYbUlX92qepdXzS+lb5tZTvdcN7JFiem8QA4LneT1d0L+37R6VxkIE2wfzSrHENZlBc0asSg9DcHRHzR2ZPGnUfmnN1vkZh9BEwwlIlpD3gqhvlr3x8ZRNoDDEfr/zVxjL50Sf4uxjsueWAWod+wxHC21Z+yQr1cqT27tpOEBc/zaAk54vy1MrIoga4oxYllRTe+Gj9C0JTK4nVMBIBB6RBE+TBTEFNK1O6Ylo2Y9gvNjS7QitI2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0vbBdALk7Dt7D/DXgkbkRMc+ZTf7bDhD5YGcNlMAt8g=;
 b=FrFOvG3IlLOLrFJ604DyeeYF2Eyav7ldjn4ngmqrYLDvsQvEVePcCnpDhZlc8/j/PZNI5uROqv/gu8t732aSuuMV3gMhLDbgJ4u6CjRSGV4XSvY7GbBJQ/FDyvPqRhbjFhWgUrhyxUVswwYflI8rXQYb8ESWPEOBT8aY6Xa/yic=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU2PR04MB8709.eurprd04.prod.outlook.com (2603:10a6:10:2dc::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.22; Fri, 12 Jul
 2024 08:26:20 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.7762.020; Fri, 12 Jul 2024
 08:26:20 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 12 Jul 2024 16:34:59 +0800
Subject: [PATCH 6/6] remoteproc: imx_rproc: handle system off for i.MX7ULP
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240712-imx_rproc-v1-6-7bcf6732d328@nxp.com>
References: <20240712-imx_rproc-v1-0-7bcf6732d328@nxp.com>
In-Reply-To: <20240712-imx_rproc-v1-0-7bcf6732d328@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Richard Zhu <hongxing.zhu@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Jacky Bai <ping.bai@nxp.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720773307; l=2938;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=C4WWZBa/4F0rqsRfT5vBgK7Yyzk7BZUYKwHPL5XAbGk=;
 b=cQIZuDUpZH6glPAucwaT2CORGE0InjVZao9iJDbVvi6iccKXWOHj+AZE2P0KsyaaXhN2jtrGy
 goF16jcCn85AYFQpcg90PX3JnMQePrM2Sk5g9ODJZPU+H2RgotQaAUY
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI2P153CA0013.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::12) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DU2PR04MB8709:EE_
X-MS-Office365-Filtering-Correlation-Id: c1bd6c9b-f0a5-4a74-f70d-08dca24c4ee4
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WjhJL3Y3QWFhZnZrcURJYks0VUgxaU9uVGZZTHRTZDI1c0tRTHAyUlF4TWxy?=
 =?utf-8?B?NmFzbVhXNDFPT2Z4Ulp6TTNIRzlMRkx0QjhQTFRaRThRaURJc0lvTUprTkhr?=
 =?utf-8?B?VzFidldGclpOc21QVS94Ty9rQlJBUWpuYks1ckpvUi9ZaS9YYkdBUnREVFNV?=
 =?utf-8?B?RTkrQ3p4aXhJMlFhRVJvejgwdk1xWWVjWjhNVWtXb1JBZGphbTRnWGw1Tnky?=
 =?utf-8?B?R1UyMnowOFNmcmZSYStTVFN5MXM0ZkMzdjZMZW9WNVQrTUlESC9sQU82WlR1?=
 =?utf-8?B?WXF1bjRqOXFXN0txNjEyVWFIZWh4cDkySkR2TC8rNEdSWUE2elJNdkdQaHRi?=
 =?utf-8?B?amhxS2J0TW9UR2dLUW0rNTJ3NC95MFVEb0hoNVRmK2p6YjlsRHk5ekRhdlZ4?=
 =?utf-8?B?Tkd2cTBOcmpaYkYrRlNFYXpoVmNHd1RvRWhpSHVEZDJpZEFxUDJrcmNNbzNa?=
 =?utf-8?B?Zk5aVm1jV083dXFpMHo3SzRPSUFvOW1McEJkL2djQXB4VnNhek1pVTNRcUFa?=
 =?utf-8?B?NUwwZno2c041VUNqaHZLSXVBOVM5dG4yaVNkTzhEN0N1Q3krV3Q3UmRHL0dn?=
 =?utf-8?B?TWwxa1dKRVgwTmpmbnlnMjFvQ0ZCeHV2NTcrci9KN2d1ejdqcWUwVHkvaE9v?=
 =?utf-8?B?REpJdXE1dU9Jd2syRDYrdmlScUQ2TzBYRGxyWTU0TzkvNVB4YlE0VzlYZTR0?=
 =?utf-8?B?Sjgvci81UjdpQ1RuVEVucmVaa0ZRRi9melZnTFc2YVVZbS9MbVNTS0N0S1Bx?=
 =?utf-8?B?RHd6cGNXeGFkRnY3WThvWW5wbVMzSXZNVGJEWFFwUkx4RFFMRGVlbnBCenlY?=
 =?utf-8?B?OEo2OW9mQzdCYjJHVEJWM21Db01Cb0V5dm1iQ3E3TXU5U1lvY1ZkL2RJbnJ0?=
 =?utf-8?B?ZG1NT3l3bHhodk00OHE4d0Q1VTEzYkxaV0Z6eXh6ZmpFS3lBRTBTdUsrbWQ1?=
 =?utf-8?B?MGg3aHlQN0Ntc0RLVC9SeXZnWVRrTlMrL3orTUp6cDFaVU5nYUh2UzFRZS9U?=
 =?utf-8?B?Wjk3R0xKSkY5MGZsWlpQL21KMUhqb3VBQlZZVEFIblNtSXJqZmk2OHc4OHJj?=
 =?utf-8?B?dzBLelRZOGxtL2lrY0FJdFBiVmRNWWFVWnhKN3lOQ2VsZkJLODI0US9FOUZO?=
 =?utf-8?B?TWU4NG9ITjlNZGtTQnloaFNuWW9ZbERQdUVUQUdhNHZIV2llc1BNZlF0QUpw?=
 =?utf-8?B?Yk9ta29iMGZsVEZSa3VTSHpmdWVBL0hDbExsMlVmcE0wSFg2Z3NVeHEyZ2F4?=
 =?utf-8?B?bUtCdDMxRE8rZ2VuNEFYK0Fya2NqN2Vyd2pBak9CWno4RDZXZTgyVVdKODRX?=
 =?utf-8?B?YXNZMDlIZVhwY2FpV2pHVDRMaWxzZTRnM1hjV09pdUlmeWNZYko4bnArbWxN?=
 =?utf-8?B?czk3Ymdaa3FOOFI4SldzUFRsTzhqRld4T3MvNGF1a0x6YUl0ekZsNmROdE1N?=
 =?utf-8?B?RmY2NUJleEFjOTBaM1BIbWJ1Y2xpS0w3dU9tTGRveUJwTWFVV3dCdlJJMi9J?=
 =?utf-8?B?SjQzZjhEc25BRDFuUmZvK3pCc3BMUkxBTWRBc2xzT3A4V2U1enlPeStPYVhW?=
 =?utf-8?B?UTB1bFl3TktqSDVoelI0YjEyanI4bXlsM1l6ZnZnczgxMFZsWXZabHRNU2Nk?=
 =?utf-8?B?aWc5ZE1xUGU4OElhcys4clJaQkxpdVd5TVlwWVQ4VmUvRmlUK2Z0enRuemFC?=
 =?utf-8?B?NkdoWXF0N1crWGZKeFlFZUY0V3NaVkU3VjluSUh4KzZ4TjJNM3dOS3prR2dR?=
 =?utf-8?B?KzBFeEZmR0ZUNHlGQnNBMlJHRnM4Vi8xdENDbERTL3d3d1BvR3l2UkFRaEs5?=
 =?utf-8?B?YytqUWRrTTUvQnQyOG0wanBwRHRWNVYyZWV4YTBubmxHaU9xQWF6OEdKVDVC?=
 =?utf-8?B?ell6UlRHMXdvK2hTOW5VRnBlL3RPNEoreUxzTEtJYjYwNkE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RWErY3d6NThKTHI1cmFLc1d3L2MvaW5GanREU3ZQd0wxSHlhdmYyVndNc1Bt?=
 =?utf-8?B?NUlQbUJDeEtQVktnTy95ZHMwdlhwSk5TV09iM0lEVmlyT1ZSN1NHYnFvcURl?=
 =?utf-8?B?Q3YwdCtzSVdxb0VTYzhGbnphTGlscnp0dG81SVdtcHZjRmNuNVVVeG1qRytv?=
 =?utf-8?B?WmlOS3Z4NGZUcGJycWdFdGY3Wi9ZQlh0WDArTEZKOFlzVXp6d0UwcWV5YXNM?=
 =?utf-8?B?c1lZN00rYkx0RnNnNUg1aDlFWDZwZlV6ZDRGSHJqNGRRTWVyVUdIaVE0S0lm?=
 =?utf-8?B?anZERUY5cEFkM24wRWJtSmwrMnpWeGYwc1M5djJBWFBTdWdlVGg1TU0zT2Fa?=
 =?utf-8?B?T1hBcThHMGE1alA2c3JMdXM2bStOc2REenBMaHdSZE9nREc1aGpPZkhwc05j?=
 =?utf-8?B?Y1RWSFhlSXo5NFZHUjRsb3JUcEZPZ1F0UW4yZlNQZjh1a28rRlFTTmpFUy9y?=
 =?utf-8?B?eFRNSUJvTWlXRnV0Wnk0WVlENnBGU0V0V3ZsTysxa3hiaHZzVU5hT2Nid0hK?=
 =?utf-8?B?clVMUW9QMWJXOUhzNWtOYUo3SFVCVlp2d0dCbkNyUElzV3FsQ1IvUnVLN09i?=
 =?utf-8?B?dTUvWWlVY2xBMFllVnN0aC91V29ORmVNOWsrK1VBSnVmQzBCbnFnYlNZUkx4?=
 =?utf-8?B?RDJyNkVkeGlFV3FRS01ZYkJ2OGlYU2R2UUphYkVFRld0UVpkbmhGUm5Bc1Ex?=
 =?utf-8?B?azdtTmVheEVlVk9JTmRSNFdmRzhzQVJPSXBKS2o3b2UyUmU1UUMrenM5cGpy?=
 =?utf-8?B?S2F6M21kb1d4N3F2VjJlalN4WEJ6TGpVYnFGYUxNS2QrQTkzT2Nobk9kQ2RB?=
 =?utf-8?B?aGZhdUppSE9VSEZ6Q1M5UkdmdllLbWZWbGtFWStxV1k3aGIxcG16M0JkWkov?=
 =?utf-8?B?WVVydzlHcStwZ2FrVEpCVk5qUStSanE0eEdleUhJWUxpWEptbXV1cjc3Y1Qw?=
 =?utf-8?B?aWhKbDlnWEs0b2lqakt3bE9jekpIU2NEdzdweGV5SVZGSnBUNzZ5eUphK0E0?=
 =?utf-8?B?RjhCV05zS2o1RHJMMHlWKzlTUUZPck40MDlIQnV5anlrYVYyOElyNUZlY1Rp?=
 =?utf-8?B?NWN4bFkxNGYrRjRtN3J3VG9CUXovVWkrRXA1RWVDR3RqMWxoaTF5Um5lbnVl?=
 =?utf-8?B?aGp6TStTb0NmK1dxVEpvKzZnWENncDVXWjNWUm9rNmltVWoxRmNMWUl0SWFl?=
 =?utf-8?B?eXErdWVrSlh5RkR5QmFTd3l6QlQ3WUpmaWZSUHhUUWV4L1pQMm9aSDgzaURi?=
 =?utf-8?B?NzdnZDB2VmN1OHR1WXIwSC95SnpqdnhxTXVjZGc0U3RtV3NOenJKUktUUHFJ?=
 =?utf-8?B?THNmNWxidnlUenUrTUR3azd2WVloTlRVNXZ0clRpd0ZiU25IQm93T2puY1BE?=
 =?utf-8?B?eUFwN3hQYjN1bDJIQ00vWTFNL1pyNTVKTE9OWDF3RjdCaFFYRjM4cThXUkVN?=
 =?utf-8?B?UE52eWgzUjY2dWVMd0F6Wndnbm83d3YweENWSFRSSkpYdTU1d1dOTHZSVGRN?=
 =?utf-8?B?ZDd2WjFmdFhzNGZKSHJSMTFyRGk3WUVrcmtwMkdPU3o2aWpnaDdSZmxiZTVJ?=
 =?utf-8?B?UnB1M3NNU0NZUkI0c1BsSzZNOUUxYVlITXp5dEEyWjYwMlR1VVlyb29zOEVJ?=
 =?utf-8?B?MFRTT0N3ODE4V2pJbFJ4ZVB3NmtpU20yZ01VQXhTMHpyOHNZbmViVFBuVGVr?=
 =?utf-8?B?dUlBOTZsQmdLQWM0WU9QQWFwUVhUdFFKQmxERHNNbDZpVkFObDVFemxLbkhx?=
 =?utf-8?B?djBKQ3lqTy9PRGdYZFhPeXlLR2xOaHgvem9DTUh2WkRDaDBiR3FFVDI0VFF6?=
 =?utf-8?B?YThSU09ZV0FjUzROZFhvOVFzQlFEQ29SSE80Sm1PeVoyQUJzdW5XRDQ5MmtU?=
 =?utf-8?B?UmpybjdIWDYyMml2cEVoVENJZVN6RC9kRVEzbWwxK0VVYlJ0c2lrMDgrOXdy?=
 =?utf-8?B?c1lrSUFuOGJVeFdYMWIwakF6eFJreVV2ckZLaGQ0cGxXNW1xM3FJbThLenJv?=
 =?utf-8?B?TFUxS2dhNDl3SHkzRHBNZUhUNFZhYnRPaGE1UG9ESEMreWZ1L2JvQmhFNTJO?=
 =?utf-8?B?ZEl4aVhLcndqV3pRSHFJT3p5Sk03SUcyS0t0YmhXRnlhVUFUVXRjRG54ZHk0?=
 =?utf-8?Q?4xOABqByTV/ObXuEgFjZl3MAv?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1bd6c9b-f0a5-4a74-f70d-08dca24c4ee4
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2024 08:26:20.5739
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zvFfVaqOR60f7a9+F5EXeJRwrwDB3dpeR3ht0pc+oP3CcrPLR3wsdWynkFqKoysatRosw3+a/YZKzyhJdgAL6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8709

From: Peng Fan <peng.fan@nxp.com>

The i.MX7ULP Cortex-A7 is under control of Cortex-M4. The i.MX7ULP Linux
poweroff and restart rely on rpmsg driver to send a message to Cortex-M4
firmware. Then Cortex-A7 could poweroff or restart by Cortex-M4 to
configure the i.MX7ULP power controller properly.

However the reboot and restart kernel common code use atomic notifier,
so with blocking tx mailbox will trigger kernel dump, because of
blocking mailbox will use wait_for_completion_timeout. In such case,
linux no need to wait for completion.

Current patch is to use non-blocking tx mailbox channel when system
is going to poweroff or restart.

Reviewed-by: Jacky Bai <ping.bai@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 01cf1dfb2e87..e1abf110abc9 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -18,6 +18,7 @@
 #include <linux/of_reserved_mem.h>
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
+#include <linux/reboot.h>
 #include <linux/regmap.h>
 #include <linux/remoteproc.h>
 #include <linux/workqueue.h>
@@ -114,6 +115,7 @@ struct imx_rproc {
 	u32				entry;		/* cpu start address */
 	u32				core_index;
 	struct dev_pm_domain_list	*pd_list;
+	struct sys_off_data		data;
 };
 
 static const struct imx_rproc_att imx_rproc_att_imx93[] = {
@@ -1050,6 +1052,22 @@ static int imx_rproc_clk_enable(struct imx_rproc *priv)
 	return 0;
 }
 
+static int imx_rproc_sys_off_handler(struct sys_off_data *data)
+{
+	struct rproc *rproc = data->cb_data;
+	int ret;
+
+	imx_rproc_free_mbox(rproc);
+
+	ret = imx_rproc_xtr_mbox_init(rproc, false);
+	if (ret) {
+		dev_err(&rproc->dev, "Failed to request non-blocking mbox\n");
+		return NOTIFY_BAD;
+	}
+
+	return NOTIFY_DONE;
+}
+
 static int imx_rproc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1104,6 +1122,24 @@ static int imx_rproc_probe(struct platform_device *pdev)
 	if (rproc->state != RPROC_DETACHED)
 		rproc->auto_boot = of_property_read_bool(np, "fsl,auto-boot");
 
+	if (of_device_is_compatible(dev->of_node, "fsl,imx7ulp-cm4")) {
+		ret = devm_register_sys_off_handler(dev, SYS_OFF_MODE_POWER_OFF_PREPARE,
+						    SYS_OFF_PRIO_DEFAULT,
+						    imx_rproc_sys_off_handler, rproc);
+		if (ret) {
+			dev_err(dev, "register power off handler failure\n");
+			goto err_put_clk;
+		}
+
+		ret = devm_register_sys_off_handler(dev, SYS_OFF_MODE_RESTART_PREPARE,
+						    SYS_OFF_PRIO_DEFAULT,
+						    imx_rproc_sys_off_handler, rproc);
+		if (ret) {
+			dev_err(dev, "register restart handler failure\n");
+			goto err_put_clk;
+		}
+	}
+
 	ret = rproc_add(rproc);
 	if (ret) {
 		dev_err(dev, "rproc_add failed\n");

-- 
2.37.1

