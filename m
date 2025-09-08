Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012010.outbound.protection.outlook.com [52.101.66.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A2030AD0D;
	Mon,  8 Sep 2025 13:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757336922; cv=fail; b=kh1pi81bl+5632Xk4FuAc+KFbMO6BqC1SDlo2WiqUGPakHm1b6b4oId5Yp0M3wcA21uxfiB6dD/InUmfAhCy/wOOXkODSV/BB6Qvkp9/fCSedy+rC2ctdtZQ3aC8MkUX59cWfIMGMEAm5gxrGB7ypSb3L46aAQ5GaaFynM1wRQI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757336922; c=relaxed/simple;
	bh=btfNF7QVJ4Cl79M8roeKhtdEY8e1sUflBqersgubMms=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=LPxmBauo0gWkcc2SRLkAfzjk7fv2LDBoaFm6ZuMzr82WQNUOKs3tYLZS56UQeoZMfNYorXjxk82MfG+2uZK23Amv9zg2wAkxZyluv0V1a23BN5arzYQRIppCeebLL7BAS8xtFlqDNCxBWJGfBp0BkZvS0ZYbS3V7/kQu/XNvAHU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=cN9riF7B; arc=fail smtp.client-ip=52.101.66.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="cN9riF7B"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WR4J4csj9SToNrW67639TyeZn+F4DXjYA0ddJt47X2O5MU26Y2XqNkXUTR63HXDsFzpRvwusUGQv/3Hs21adDJNgT4XXU/sdBVuoXBydx0FwBNS0uFwr4xb6vU7CSROweRLZObNJwZa27W0Dl9Mq7yaooBY5190rVP4iBnvqnVLV8N8sbSL32eJKAhKsH0Vl+3GTVuFQW3usIIrVySPYpAyFg7DkDptQ56+nsB9Nj3FZT+EjRJ6X0UJIqKW25kZcnt69E9xa7DypUSJ+vDjYM0omwBZJQTSpIv89hWHGU+BMaQkMq/6CasW0vNayqXrxi6UDDx+vimZZfzqEN8ygog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3gR3IagXeP+aIDwpNFe56W0MzvLLJJUHVuLYsWNbz8g=;
 b=vJWd1lAmM01wWnfiXABaSbVthGLug/IB6GrADnM3Mp3P0zX30YnyhWUeIvqSoTDn2cgWdjY+IYTc1hfDgX/wm68lLxsn2/oaT4liarOAe2cMMEx+feIRcwAqD6WjGmS6Nh10BXcZbN0uP/KKPPCRQwNFea1LH/tBc4w8vNU4LK+3cNhFqdHJRkTXQcm60azdbg1LS3Zip1MFcVKoJZcQ8PI9mW/ADcILrxxsVN0ltkTIELuY0X/K8TTsTIS+M7/nhrBzbPqIRnsZlKS2ld4xu5DcpNtbRaE5KYU7MaGNcyaNKT4B6lislj8NJ2L+jdwAx+2zmOeKSdnnpNubpg7tNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3gR3IagXeP+aIDwpNFe56W0MzvLLJJUHVuLYsWNbz8g=;
 b=cN9riF7BYVe7Nv9yYaPZk9w/AmBazLfyc31uVJQSUfcOjc22SiSB7HDX2A7hXXxmY3LDI+18YckfGndVOPK34Fd492KtKK+OmEEbDiCfdS24OUe7vPLW7tCEaln7WiqLjWBGZbtjNWjvktdinZB2+UXfaw+p1ufS6IPFmeT7BZZvGx46RiI+o7ZfrLaNFOUrstLJqzTjvoKE9qqqdwV2Ab7wxF2GT7ZlXu4tUZPHl7N9C0UdDVCZ7GRKNdSfE1T7Lszyp7qJvnv3I9TDokltApMAsvPCL/D7v9+Oh+RDIr3w1EHdQrHoPbV7bAUFxWROzC+aPC62vI0SLALUToLbKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI2PR04MB10977.eurprd04.prod.outlook.com (2603:10a6:800:271::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.13; Mon, 8 Sep
 2025 13:08:36 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9115.010; Mon, 8 Sep 2025
 13:08:36 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Mon, 08 Sep 2025 21:07:39 +0800
Subject: [PATCH 6/6] remoteproc: imx_rproc: Clean up after ops introduction
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-imx-rproc-cleanup-v1-6-e838cb14436c@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757336884; l=1886;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=btfNF7QVJ4Cl79M8roeKhtdEY8e1sUflBqersgubMms=;
 b=0wpL3ZPUEPPbkYFGD5667pXFs2nM0q6M9AR/8IVvHO44uubdFXcb2b0tOJUQIQYwfm6X5yEtn
 9lpZI9GF3dkDuFmgw9g6VwZv0s97dmUErSXgqlNe9hSx/Gegonns+l1
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
X-MS-Office365-Filtering-Correlation-Id: d2f06977-0c86-473e-ac86-08ddeed8d258
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ckZhei9oOXVmV0tiY0JlZi94cDhobE5wdHlOUGxmaWovWXdJQkZTcDc2V0xq?=
 =?utf-8?B?MjM0RHp6cDJaSDArQ3pkY1F2ZVdNa0ppMnMwZzd3UFh1R091M2szMW1IbVBr?=
 =?utf-8?B?R25IdmNZZ3IvbzhZNXdJUllKTHZ1b1RxcTJRRnNkT2RsbW9UYmNLaFBpaE9V?=
 =?utf-8?B?cE56WjRPb1NJRUl3bkpvSWZhMVhjV3phVUI4ZkRIMHpqQXpSQnY0aWM5Q3lP?=
 =?utf-8?B?eTBUM3o0Z1VlSUo1Z0Z3bVB1cHl2d2Z6Q1AwRyticW5mK1R1RWV2bmkvMExi?=
 =?utf-8?B?YXlIcG5makthRTZISDdnNS9hVXpwV0hocUZYWWd0NW1sOXR0cCs1blFOVDFx?=
 =?utf-8?B?bzl5Q3o2L2NYNkNKRmRSSGc1OVpCRFpvQ3I5bmVMY0F0RjFWMGVVSXRjczVN?=
 =?utf-8?B?a1YwMW1wVGl4OTZGOVcvZmo2dzYzUStneVV1OUJWS1NXY3FEUTJKUEY3bjVK?=
 =?utf-8?B?MkpzaXk1TjRHNjZ4RUppZytkUFhBdytYaUJTRlEvdUQvVDBncFNSNThpQnA5?=
 =?utf-8?B?azFUU2dlYjF5azdubzhhN3JGdi9hQnVhV2hXWndqZTM0Yk16VnorODlGT0w1?=
 =?utf-8?B?SC9mazJvVmcxTUZsRnJldzlYSUNJdGxYdVhMVWhJWlVncE5qNW83V3BTL0kw?=
 =?utf-8?B?WUZJVzhZU01DeERzTzdKR0ozUi9FdUVTbWNzWU5mckE0ZVlGUmpTdk00Y2Zj?=
 =?utf-8?B?ZjRMZlY4dURsb3lLTU0ybkVGWk5Za2xCejhHMXdxZlVhTHY4aEJJcitDZmVk?=
 =?utf-8?B?bVU3YmFrMnB6ellzdXRnQ1JxdVdDWm1uZis1dm1saHh2Vis4SVhqWVdpRkVs?=
 =?utf-8?B?ZUZnKzFEU25hT3pVNXc1dWlZT2t5VHNwT1VGOUNNeUNVTndOYWhzTm5BcjBw?=
 =?utf-8?B?bWY0UTh5N1BlMGsxQ0hYc1JMRkZ2c1FvenNXdUFLK1R3amVwTEJzUG1vNjhn?=
 =?utf-8?B?Nmk0RXFDSXA0eGYwb3QreWpEVGFHRFNpQ3JYa2RCREYyT0hmdTF3TU5HYzI5?=
 =?utf-8?B?TDJRTG9OS2Q4RVIrZHMzekgyd0w1V3JubWRCVG83c3d5dGVZVS9sb05PdmVs?=
 =?utf-8?B?TURqVFpZbUx5VWlsZkYwcHhuQ21UWnAwSjFnRjdMdURDTHJPMlV1ZTEyaVpG?=
 =?utf-8?B?RW5DRWdJZWFiQjBOcHBxSjhjOG5xQ1RESXM1RFJYc1FsUUxYZFRNb3NuQUU0?=
 =?utf-8?B?MVNuYVFnVzBRM3Q3dWlvdDZ1SGEwVy9JZDE0UURObUMxQStOMk5vU3RFS2xQ?=
 =?utf-8?B?WUNadVc2L1d2R0pnbURlS3dleW8wTjJ4WUpjb3p4VUZUekNYVjRsRFNIVGth?=
 =?utf-8?B?QzNTYStDQ3E3RFFBMzZjYjNPakJtbzZEVmM5bll4cFJWVUF0UVk1ZUU2bThx?=
 =?utf-8?B?QlpzRkJGUnY0QVQ0dmxNUmRseWFFNHltMWZrSHIzVUZmam0rajh2RUdaZFF6?=
 =?utf-8?B?L3BpQzkxR05SYnVGZy9CVzZ5TjNJVDhybkFBMlRBNmJRY09DblFUODUyQ3Ur?=
 =?utf-8?B?ODZ2TFkwVS8wVzZ4K1J4azArSUZ2N2lDQ3VWbVZUaVFqelU3VkhsZUpFOGxC?=
 =?utf-8?B?MjgwVDhZWHNaZ21DeDQ5TVpRUy9SOTRsS2JaWG5paS9rSU5QL2Z0SFpnN3Q2?=
 =?utf-8?B?KzNKa2ltSFVSWURBL2U0eXhXNUVDdm9YRkxycDBKTExudWdBVGhzRGc3dWlL?=
 =?utf-8?B?YTc2N0J5TU9MYVdSTkY5YjRXaENreUpTQ01UQU9mTkJ4akRKdklNd3VyVys2?=
 =?utf-8?B?RG1tT0FSQTJKeUtGSGFHbHR0N1ZmL2JVYjJyd1VFbGdPdlBndFg5ejBreWlz?=
 =?utf-8?B?RGNjTmxNL0tzMnV4c2pNS2dpb0wyY25yT2wyRks5Y1NScFUwV3RPNTg1dmgz?=
 =?utf-8?B?MUdwdVI1TG1rU2FnYzJob040TXNYdERoMXB3NiswU2s2b3kvdGVXdkNiclJp?=
 =?utf-8?B?dTZyNTd0VFhqaWlMTHZ3K2VHMjhLRW0yWC9xWGxXWkhLNlNWWlA2WXZFOFZS?=
 =?utf-8?B?RUZ5SnAvVy9BPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SmNBNU92SVRrbnN4NkZzazYrdlZFRDViNnNLK1FKanFsSkZXcFhOQXpCck9U?=
 =?utf-8?B?dUVHN2lXSEhJMkNxa21ySWtQblVDdGQ4UmZsSW0vc2tSemxmZzU5Mk5STHZD?=
 =?utf-8?B?YW5wajYzb0c4bmhoZEU0N09zNVFIbHdDdnNHRS9VMTZTMm5QVmR6MXB5NGpX?=
 =?utf-8?B?RlFEMjY4VDBkREYrT1ZmRlZqcVpFMXRjOGVxMHFNK09oQXZHeTFqNXRFSHpD?=
 =?utf-8?B?TCt6NjQvQTVnWnhFNm81aUZweGFGRWxVNkZZUXpSejVhM1hwaFZmMHRCNlc1?=
 =?utf-8?B?WEVCQzViMkVTSks3MDczSjhXOWEvaXlvMnd1SHo0WVNlWjZFM3Vnak1GdS9I?=
 =?utf-8?B?aTFVQW9CSW5xZWUrZGlqSHo2TEx3RU16NG5Hd0ZuTXVmQk4yc0tjWmoybWlF?=
 =?utf-8?B?ZU8yTHBzempvM0hOV1BBZmRCU3k4eVNiaTcraWNBUHphUnd4emhWZ0lUa29h?=
 =?utf-8?B?a1VzNXJMNGczRTVVZm5LVGo1YU01OWdpUXVoL3pvMVQyOEdEMW5nZVR5NWg2?=
 =?utf-8?B?RjNZVmpKQVp0QUhIOThsVEZFRXlicW1kRjJBcVpqY01KUnd5REkyYU1SVEcv?=
 =?utf-8?B?WUFMOFo5a250dmc4cUx6eXlzZHhpaTdrcHpRL3ZwejhjaW1nZDhlNWxTZXcx?=
 =?utf-8?B?V2UvdDFJWjhnYVpKY21iaDNaTkJxQ3hTRnNhV3ZPTFVUZ0syVjliYUd1Sk5w?=
 =?utf-8?B?L2hIK2ZSOStPZmx2MDVqdDhLVnBUTC9vOWdlMFY3MDBKN2w4U0RmZk1NVzZk?=
 =?utf-8?B?UDl0d09KdVY0VG9Va1lHUzl0OTFrWEZwOUUycGdtdUVFeW8yb1RUMVNWVlNC?=
 =?utf-8?B?S1RzdmdhaVBMZUJTM0pwbERBcnNtSmJwZUdJdTQzTmlpaVZDZ21SWGZBY2ly?=
 =?utf-8?B?d1Exck5ubUhHd0N5cWRYN2hTTm11ZHlHMGhmUHRnbXluTVdmN3Y5ZHd2Y3Br?=
 =?utf-8?B?SEI5Y05UMjRNMmZxVnE5M1R4MitKNzAyMFVDVmZRVnFtVTVzclBOQ0k4ZGlB?=
 =?utf-8?B?VnRuNVZOL3hVOEFPcmRxRFVneXF2YlNLT3gwWXBRVnV0NFI4c0l1T3hKdUVJ?=
 =?utf-8?B?KzU0NEJRenpuWUdsa1FHUytDcm5Tcm1jakZ1TVZ0SUZ0R1N1NkFkTzhnRU93?=
 =?utf-8?B?MW1Mc1FHY0hEOEhYeVJlakVHekRqZ3dMbzNaekFnY25wZjQ3Z1lIeklqRlU4?=
 =?utf-8?B?WldnbEFJRFZuOVI4OGlqYi9UTVg4T2pHcERjNENqcDRGbEJudzlnalZPVFVs?=
 =?utf-8?B?WDY2bVpsTFZ5bkNBMGh0YXpDM3I0c21OS2ZZSEM2OTJOMXRsazNMVnZnclJm?=
 =?utf-8?B?RmJCTURzejZQMkNiMXRhNkRVZTVDNU9sN3NaSm1aRXBYVkI2U2E2bFMrVndk?=
 =?utf-8?B?bmF3YzNNSzMyM3duaXhaeTdSd3NHWGRpdzQ4MUNoZVBGdHhqMk5FTnB5TFlx?=
 =?utf-8?B?amVrTzcxWkE0RWw0QS9yNExieis5Vmp0ODg4eTBsajl5TlROVHc4NVJwV1lx?=
 =?utf-8?B?ZVRkVmRUWTdSRWFhbUVUem9xaHRmNWZjN3ZoT2s4MWEwZUV2K0VoTXI2UzR1?=
 =?utf-8?B?azdZVEZqa2hQR1FyQ0ZIUkpJYjdHdk5EWVUyUlFFU3Y5NGV4bWFSNnl1VWkv?=
 =?utf-8?B?NnNzUEw3ZzNFaHJMcE5oaDRVenRYemxkUGtRYTVQTGdtdzRwdkpkZDJNeW1p?=
 =?utf-8?B?RzlxZVFhZTFEMXM2NVk2UEd6N21qekUwRlF1cS9iSDFybWRCbEhtVXUwWFNW?=
 =?utf-8?B?Y092UmJzQW9Bcit1ampuR1htZ21OZlhxZXBLYU8veXkzQTV3THh2c25ZTjlx?=
 =?utf-8?B?WnFWbk5IYkJrd3lHclVOZXhTRW9RYmRVUzNjMHUraFRZc2grMlc2bjJ3OHFz?=
 =?utf-8?B?SHNia3pFS1g4bVVkZDh1VUh6MDdnZXhyWFc5ejBmK0dSU2N5bXc2QXMxN1ls?=
 =?utf-8?B?elJrN3VRTC9qSGcvSVR1RjRDT1d0NmZUdnpZSDJEbVdWUFBxYWxGUWdoVlgy?=
 =?utf-8?B?MDJvSmNocDhyZURVMXBiSk1JRThpUmVrWjVsOGg1OExrR3ZpV0UyTi82RzBm?=
 =?utf-8?B?Q2FMSHV0RHdzUksrL0RXMFNUeXdXekZueVE5cmVac2lyS0I1YWRSVDllZ3Zx?=
 =?utf-8?Q?rKF0nQIruNy48lIrrkH9RzK3H?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2f06977-0c86-473e-ac86-08ddeed8d258
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 13:08:36.7461
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fDrS/HR/5+Srkb5CDcysdkIl/ceW1VQ8V4Rj3IENns3p+5QBg+WDK34uKUEu5SRaeFnJQ0kB4C/JXVwTgwGJXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10977

With the switch-case in imx_rproc_{start,stop}{} removed, simplify
the code logic by removing 'goto'. The last switch-case in
imx_rproc_detect_mode() are no longer needed and can be removed.

This cleanup improves code readability and aligns with the new ops-based
design.

No functional changes.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 25 +++++++------------------
 1 file changed, 7 insertions(+), 18 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 5fa729f4286f6ac939357c32fef41d7d97e5f860..ed8395b097d07d02e5323550ff497819f9b95ad6 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -323,14 +323,11 @@ static int imx_rproc_start(struct rproc *rproc)
 	if (ret)
 		return ret;
 
-	if (dcfg->ops && dcfg->ops->start) {
+	if (dcfg->ops && dcfg->ops->start)
 		ret = dcfg->ops->start(rproc);
-		goto start_ret;
-	}
-
-	return -EOPNOTSUPP;
+	else
+		return -EOPNOTSUPP;
 
-start_ret:
 	if (ret)
 		dev_err(dev, "Failed to enable remote core!\n");
 
@@ -380,14 +377,11 @@ static int imx_rproc_stop(struct rproc *rproc)
 	struct device *dev = priv->dev;
 	int ret;
 
-	if (dcfg->ops && dcfg->ops->stop) {
+	if (dcfg->ops && dcfg->ops->stop)
 		ret = dcfg->ops->stop(rproc);
-		goto stop_ret;
-	}
-
-	return -EOPNOTSUPP;
+	else
+		return -EOPNOTSUPP;
 
-stop_ret:
 	if (ret)
 		dev_err(dev, "Failed to stop remote core\n");
 	else
@@ -1000,13 +994,8 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
 	if (dcfg->ops && dcfg->ops->detect_mode)
 		return dcfg->ops->detect_mode(priv->rproc);
 
-	switch (dcfg->method) {
-	case IMX_RPROC_NONE:
+	if (dcfg->method == IMX_RPROC_NONE)
 		priv->rproc->state = RPROC_DETACHED;
-		return 0;
-	default:
-		break;
-	}
 
 	return 0;
 }

-- 
2.37.1

