Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011010.outbound.protection.outlook.com [52.101.70.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C8C3254BF;
	Thu, 16 Oct 2025 11:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760615325; cv=fail; b=BVKG7KBm3vOYBbEwxfhKab/CyWZt6XKHsy2YdQDw/G6VSzyUIU63xUOp6RDslS4JzBuozyMN/PNStGOn3DGF0Kv5HU5wI1jls+P4/gq5NGvWgpdpVCNV+Sp51PGEq0SGgBHuqg25diX8wMvrNS4Hh0P1EmEUxPoI2sFqTiavR4A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760615325; c=relaxed/simple;
	bh=xU4c6z1WQ0UVuTeZOQqehEBhWRohmWM+O3myJsS9L70=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=BII1TmkD8FVd7kKtWzsZ+IeZZEFeXJqC42TLxHN4QnDM5FPLd9SEpYiw9IhMIlSBJ3yakvQHmOcEz+vFp1xyqiGjBKGkcpAryeT6ZLCzbLTUPXgaduu7Cnd5pOhhfUBM0zo82vMdngzbfjZQ+fVcDnLzUC8E76CFLDU12v4iRiw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=XVTSKoRd; arc=fail smtp.client-ip=52.101.70.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="XVTSKoRd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ieZ6ffBKnqrsHKCMi7H8QjLey5414tz95vngXoH0yD4ho3Wb7CHnR0a9ha/zy0tk2vFNua1dEdk/KZOJ5HrJC2XEnJ66HaY42/ZrhrCveJhfrpO/CU0F4YVQDEZK7/lQ4gNK/dASh+6YJRYl86cMjscWTUb+fQLcYYD0a4Phu8JgwzkjGCdIIhjJq5XoXRetqYpPp+GqDw9Eo7tLVwpXrhZDLWo6tXsvg3uqOMGRBpqucqQUeSgqjA6T9JXsfjEpVNGIlZTfO0bnF18wj/XC1cXLY3uCONBhBrEXwRJS+cZ90xMk0kt4kagBkoXLxXAp6y3xGB3AZNT2zRJBlvrtSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZMMocF9zPGrAEaYLGBq57csWH39tno/Yjggtgw12irE=;
 b=ARHurkMItCxFsWt0JwwWxm52fPDPfpcEethnQtqUzLyA/ohPSgsLl5K7HlVC64YU7DBd4tstHQ2E+dNeX3uWzx0M9Yd+CBb0STxAtAL0pSS5Dlq6no5ceEYMrI8M11fHsY9NlPp/l00rGzd1QQKgugLOSpAGMK/DPAVPxYnEI3tGA/a3SmuPrP47d2IIuAWf+avKQpAFrOAbwOf/XuTCAQjsQ1MvepDpDBhsDa1u4YQmBgYzTxcn2xPAcvIxxS09spyMWyxZGOdQQBz7UnwzbfVakZOSm3TMREcqwNzMaB4ZFqIZWoMJCEEQyjs7iW6ypdTJSI4/YfjtpRFbdf+MXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZMMocF9zPGrAEaYLGBq57csWH39tno/Yjggtgw12irE=;
 b=XVTSKoRd8PiDqC65mULxdPo3f5MZQlOdNDfSpA7M1mcP03tLmZhqkbmcbnsIMwtje5HPKy4lLxKry794euDu6WrlvxFJAVRcbyvoWSOEABCmCz4UrnBkLeXpR420Q8WZMLGX9QarEMxUtL1rBura2bf9mZo+7p5x5F3MyOpVQTjeJ1mdXkRpX/ydKtkYrbzwZ9uhJH8VgYbGG5orozY4BjxAXx5bsIVvLKb9HqlpbY8VPsC6cHD1/GOe9XVJ05X9aca/F8Ns5z2Z2CGFJ5+76kK79oVrUX+i1BhxGnQu5w9rKinQwbi2xvZnJ2l72lMv9bxpHQ8FSoZaDmq8UbslCQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI2PR04MB11049.eurprd04.prod.outlook.com (2603:10a6:800:26d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Thu, 16 Oct
 2025 11:48:38 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9228.012; Thu, 16 Oct 2025
 11:48:38 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Thu, 16 Oct 2025 19:48:01 +0800
Subject: [PATCH v3 4/4] remoteproc: core: Remove unused export of
 rproc_va_to_pa
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251016-rproc-cleanup-v3-v3-4-774083716e8a@nxp.com>
References: <20251016-rproc-cleanup-v3-v3-0-774083716e8a@nxp.com>
In-Reply-To: <20251016-rproc-cleanup-v3-v3-0-774083716e8a@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Andrew Davis <afd@ti.com>, 
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com, 
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760615296; l=1152;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=xU4c6z1WQ0UVuTeZOQqehEBhWRohmWM+O3myJsS9L70=;
 b=jqaphV8tlgoPzQ/sOVzGRSUkIW9eoKBD0EJ0PruPQnImuzz1hRWfjnojh5FBNR16eR6iBrA8V
 ES2CXcyutUBBtZ6DhZfZw9TaUQ8COY+WCHzEgt1Swmb5MgcTsIO7Y4y
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR04CA0195.apcprd04.prod.outlook.com
 (2603:1096:4:14::33) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI2PR04MB11049:EE_
X-MS-Office365-Filtering-Correlation-Id: 8dbe4e24-5f4a-449c-f3c2-08de0ca9f1e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bUF3WmpKT2pVUStTNDlUZDd5dG5sOGpDeE1EaEFtcHZUZUwwOFFVWmJVVytv?=
 =?utf-8?B?QWVVdU16MmRlZnVkb3BJV09yV1orQnp1dml2MzlVVEVrelU4dkJRODBqUVJF?=
 =?utf-8?B?YWtoSDFSWU5rV1RWTU1sRjNzQ090YXV1UG91WFg3S3gza1pjbzVHNTNUek01?=
 =?utf-8?B?dnFWMFF5VVZJcC9JbEYzd09GYWMwYWdQK2hYVUV6ZGZlWngyTkY5QUNJR1gx?=
 =?utf-8?B?VzNBeDI0ZlpreklKMUR0RnN3NUl5VWhseUxUSnI4VmU5azVOdHdBaDk3djQr?=
 =?utf-8?B?V3dnNDlOdlFaWkg0cWNQdGsxQWI2MTdsdU90RGs1ZVFIenR0QWRNak05Y1NY?=
 =?utf-8?B?S3BTeklnbEZtckpYT2xMVERycGl6cytvSHhNK1orREllbjRTQy9OVURpaTdM?=
 =?utf-8?B?d3JJTGdqZk9FVzFueFplL21pandNYmVid0gyNEtLMFY2dzlrZk83ZXNkbm5D?=
 =?utf-8?B?b3I1WTg1NDRnRm9ZQTc0N0phNjBrWUhjZVNHTmhybXN0MHRpQ3M3M0Y4VHBX?=
 =?utf-8?B?YVZsc01BTG5MOXNvYmgrMXo2MjNoMHdNbTZYQytDQncyTExuTHhTZ0FJS2Z2?=
 =?utf-8?B?anVaejQ4c0dKTTcvY3d1MVpBSWNvTk1ycWFPOVpYbHppZkM2OVNjeHVLY0NC?=
 =?utf-8?B?RVVScmNsNHdoRU4yTXN3eVBSWEZtZUhYQ21TdmFMdXlaNHZBVGMwVkNYa0Ev?=
 =?utf-8?B?SnVzc1VzWTNXbnhOM3pKK0J6bXZKQ3NmSDhjRXBHSlZYaSs3WExscDBkK3Fp?=
 =?utf-8?B?NGptLzRqN1VrSVROQlJQMWM5d3VtNDM3eUpmZG0vM01uSjI5NTE4VjhGSE9O?=
 =?utf-8?B?WDFQRFduS21BTjFiZStmM1F6K0h0SVkrTE5kLzJ4Tklka1k2bmJhQ3BRdGwr?=
 =?utf-8?B?eUwrSlBPUjFqQUtCdlcvclFabHhxVlMxYzNWUkF1TVlDMDlwMEVVekZXNDVv?=
 =?utf-8?B?TVBaTHp6NHVxZytBVFZvQzFIWHVNbWlBVWo2UWhHd1RiSnA2aDFXQm9CdjMw?=
 =?utf-8?B?eC9ibWkxeUxkMTh0WWxvV2lQaE1kUXJWZ3VJQzNOT1lZdTVZaWh1NnBjMFRJ?=
 =?utf-8?B?VjJJbkNudCtpMXZDTDcvNkg2YmZkeTJ0Tjh4bG5YU3dQa0JTM1FVY3RNUmpj?=
 =?utf-8?B?TWZ1UXBmendSdWxFSFlvcGNRTVMvSGRLN1RjN3h2MW1WdmQ5SC9saFVBVlZ3?=
 =?utf-8?B?TCtxT2txTGtJMG1WMmJMV2xqWllnRWh6dDNRWURXM0NpZjYyR3VuTHdLWjYw?=
 =?utf-8?B?bTZZc2E1bzJtZEs1cm9nWFh4Y09YY3pXbGRIQlYzWlp0UlF0V1QxejJqMGF4?=
 =?utf-8?B?RjhTMmtYeXIvQjNjWjFvNVV4b3VLNDJWMFFzNlRvNjNHWlZoN2dqMUtyREw1?=
 =?utf-8?B?K3FiQ2lGQ20rL0RMcGYvRXRCekw3bVZVMnRQMTZjR1NVNlcvM2ZUVHJRaldw?=
 =?utf-8?B?VjNkZHNUTEZwRkZXSXBSVmZ5Z0o0RjI1S0NmQ2d3WkQ0U1lYOWU4RWNwM2pp?=
 =?utf-8?B?dExZdGhJaC9XQTFabngrTktyem5qVG40cWg0ZWlOandVTWVWWndnT252cEVk?=
 =?utf-8?B?eUkxVkNaaUZhaS9oWFdoeWFhSEwrS1BlWVBuWTZvTmxKZUoyREVRazFNYU9j?=
 =?utf-8?B?bG9iYzRPWUxZejZVVnJNRFJUNEt5UlhUcG42LzJ5eFJRbzRUUGo2aXNONDNW?=
 =?utf-8?B?aitXcWxONnozbzB5UGlBM2kzRVFsV0V0SEozQnRPSUhLMmlQV2hLQU15V28y?=
 =?utf-8?B?T216dERDRE1tdG1HSjFmTXlFc0Nvd2paUk8zdXpPTHVzUU1ZZ2lEWm9weFg1?=
 =?utf-8?B?ZDlHTDhHNUpEaGJEWFpxc1VZUitDNnVBK1NFZVJMMjZhR2R6cllJTE9Rc1VZ?=
 =?utf-8?B?YVd0Q0NWMnRSTHZTbTA1ZnVmTlZONzdYTmxmRWw1Tit2amllUDdlK3BnM29M?=
 =?utf-8?B?blhES3RIS3l6b3lPYU1EdnYxMnVrZDBMa3JqTVh5VGdNaFJIMUFPMEZqUnpa?=
 =?utf-8?B?MDNmdS90Y1NtMEJRS1FqMmI3bmcrRGJDQW5LREVLYm10aFhzOWFaeWpPNU5H?=
 =?utf-8?Q?vBNLim?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Wlp1THRtS1krUjNFS2pKTmVURHpnYmp1K2dWVUwwbi9uekVpdXpnK01UKzdu?=
 =?utf-8?B?aFlKWGJsTngxSUV2MWpESW9OQWNpVjNMZ0wvL0ZsZTBDSXFqZkYrTTlZUUpU?=
 =?utf-8?B?QzM5THc1TkxKcUcwZy83YjhzeDhTWmw0cEhCVG5lUFZKRGFsbHdYeGJQVFF6?=
 =?utf-8?B?SzNIc2ZMMVJGSWdadXFBQVFDRzV5cXdCRVdWM1N4dzdGaytkV1dFTmFWUTRq?=
 =?utf-8?B?RGljQmR1NlBMZVpMNUFNYXZ3d2pBNTNKbmhmSlpvNGhkWC9QSTQybkNDREhn?=
 =?utf-8?B?Y1NLeVFwVUI2b2FYeXdYYyszSUlWM2JqcU5NaWdaM016UkVVUTdyaXo4RUxq?=
 =?utf-8?B?Y3J5RS9NUUxrTW5QcGkzUDkvTHY5bE1tYmNTOU1mVHFsTGIxUWwxWkFCOWdq?=
 =?utf-8?B?ZnYxU2xIRzZKelU5bCtwekdKZmlJemF6MXYrbG92SjhIS25rcTBaNHpBUEtO?=
 =?utf-8?B?TXJqYnVidmNPMm5IdG9RdkcyOEphaldtSUEzY2xLNkJGU05BVEd5SkxKeVhW?=
 =?utf-8?B?TDBBYkl0dVByUk5ReTJKbFdoVENyWWFCaGkvL1YxMzBKdVMzeTUxSHJDeUdJ?=
 =?utf-8?B?VnI3ZXpzdDlvZFFBVEtnbEwrZmV2Qnc0UDYyckx1NlRxOWZoWUM3cGJEUVR6?=
 =?utf-8?B?M2xHRTRqNTZTaERUalpma1pDNVh1YTc3WmFCV3Z0ZHpVZjB1MndWOENocWJ5?=
 =?utf-8?B?Y0dESExrZmloV0lWR2lKSWtWMVJWQU9Tek9WY0phYmlxWFZTSVZwZHZldXdX?=
 =?utf-8?B?TWtPdFVsTG5Leld1NlVBV1VoU05oVGl4Z1F4TSsydkhaVHR3T1J3d0piQ2JL?=
 =?utf-8?B?dXoyT3pNOUNrbk1OaTRFMVVuK1dzUXdXb0JRdzhzdTRUdG03ai9GTmIwR3Fk?=
 =?utf-8?B?ZFpsd3dvQmZIcVhheU5SRHdwYVJxbHpQbHJNZFlNU3ZBeERXdEs1YldtN0Zi?=
 =?utf-8?B?cHRLWjM3dXFVa2dwTDdXa3c4N0xucUFoTGtkV1lQNXFYYmNqdE1Rb3VFL21h?=
 =?utf-8?B?NVFYUktDaW9WR3pCcHBFQXRNeDBPQmowRWdiSldBUjIrcDFNY2pyU2p3anhY?=
 =?utf-8?B?T3doRHBaWDhGcG9hOURyeVNwQU42ODVyT0llNDhFdGNDakRGZWJPT0NQeGl4?=
 =?utf-8?B?VmVlSzhOaE9LRmVOeTI3WGZmdmVYUEdwMnNkYkVXcTU2dFpkTlB0QWlLVWl1?=
 =?utf-8?B?L0dZMU5XcnZPL3VhYjk1Y2dyOWY1VFFGWUVHZTJMUHEwZTVmWGJvcXdwQlAy?=
 =?utf-8?B?K3hjWEN1MlhacVdHMXVpS2t2NEI4Z1VkSjN3YnFXbmM2UkYyVmpKSisxVzRo?=
 =?utf-8?B?MkhlNld5MVFvelN6OHpUMUxUSTNaejdYOUJoRHNtZFhnVHRRTktkejZBY1Zz?=
 =?utf-8?B?T0I4VHpNblVLZzBMVVY4cTdqc1o3b0lWZE4zdUNQTjB2dXI5RFF0azNzR0pW?=
 =?utf-8?B?NWtIcVF5MWlpemQ0NHQrdHRIWmNsdVlKZU10TDJ5NWlDdzVkOWU5b1oxdmJ0?=
 =?utf-8?B?TDFHSExFTTJYc1ZqVld6VG9LVXE4RGU0ZVVrU25wUzR6UmNGSDN0TW85NE9o?=
 =?utf-8?B?S01JWTZUYjV6bDJpdXJhWDROWm9lSzU3c2JZV0V2bjdUMEdzdXlnMUFoL3B0?=
 =?utf-8?B?QUhZY245aFljeFlDMFZEQ1JZQkdVZGxycFhRcDRoU2RiVWdlcDdjZ3J3SEZi?=
 =?utf-8?B?QUlMb2FwUWdtSytCQU5EQXZ5TmZpSUxXWkRuaDdIckNrMzc4OWNVRnR3MEZn?=
 =?utf-8?B?STExbmliQXZYekJrckVGNjBtd0ZudGJUY25TVjRjcjRqNExlS2dxZGtQN2M0?=
 =?utf-8?B?dHdLKzlKTkpvdDVqVnN0ZDJHZ1VTdSt5eXBPTWZNWWZLNmVWL3ZTRnBwV1A3?=
 =?utf-8?B?cmx6OXd2RXJ2VXBEbHFabU9VMDRrSHZJTUVJc0N1K3pTZWRtbmJsMkl3NFly?=
 =?utf-8?B?TnVlSmhOWW0vcnVma2RoaThpTzBkUEViQVljOXhEeFZaZFFzdXd4M1B3M1Rj?=
 =?utf-8?B?YWgyaU1aY0hTMnNpUkZ5VGYyU0thYTBWYlBBcGRWRnQreUJza1BDdUtjM3Ev?=
 =?utf-8?B?aXVPR2xXd3UrNHJ2b1kxWnlaOGFyTTFnQWF2N1VNS3R2d1MyWEc2MEtML2ZY?=
 =?utf-8?Q?yTHgLPOSR212JgPlgqooHvY2h?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dbe4e24-5f4a-449c-f3c2-08de0ca9f1e3
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 11:48:38.1939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RSOF42Nb+8woGjE7yTQsmlk1s2IhLqV/uyc0gQ1t7J/ojYf1hMPScqqcyslPQJ/UC6Q3TY+aXCqCCO0y1+3rbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11049

commit 086d08725d34 ("remoteproc: create vdev subdevice with specific dma
memory pool") added an export for rproc_va_to_pa. However, since its
introduction, this symbol has not been used by any loadable modules. It
remains only referenced within remoteproc_virtio.c, which is always built
together with remoteproc_core.c.

As such, exporting rproc_va_to_pa is unnecessary, so remove the export.

No functional changes.

Acked-by: Andrew Davis <afd@ti.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/remoteproc_core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 8004a480348378abef78ad5641a8c8b5766c20a6..aada2780b343c32956a93b3558d4c28e04c5b5cc 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -155,7 +155,6 @@ phys_addr_t rproc_va_to_pa(void *cpu_addr)
 	WARN_ON(!virt_addr_valid(cpu_addr));
 	return virt_to_phys(cpu_addr);
 }
-EXPORT_SYMBOL(rproc_va_to_pa);
 
 /**
  * rproc_da_to_va() - lookup the kernel virtual address for a remoteproc address

-- 
2.37.1

