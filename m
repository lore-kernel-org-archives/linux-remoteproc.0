Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010008.outbound.protection.outlook.com [52.101.84.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B13743115BB;
	Tue, 23 Sep 2025 05:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758604640; cv=fail; b=HFNKxXoMYIh9dydFsieYNRwY8BmsM4sxf1jD+3++6rD+Qw7v276Y8+d4/9fN1d/wfqwC34vfBy/92bzQKy2GrZQ410BdqJvJxh/FnViVURgVGg6dOQzf00XVod5O3bt9yhvYsD7ZUcOBWeC4E0z50bD4rx51ZiiBAZb0qv2tC+g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758604640; c=relaxed/simple;
	bh=XDzeXf1ckrz8GfTX3CX3VDC6Y35iLF4Bd++eK2ze6Rs=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=EGSoDQFrxzRGt7QTt4iNCMpej9/bUl9GdTiOz5aKM7OnP18EXjhNlRTdEiwUm3yLpwxKEzonUNNsjlzpuQS6q9+9E7u0EGjNxkirK4KUODgPTePHGiuDkPQemJSq2p2r7fdtWvoC4LsjuSaUkRuBdkpZNQdsGk72rCLjg+PuzRw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=blLFBLIN; arc=fail smtp.client-ip=52.101.84.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="blLFBLIN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r4KKTlfwUlIfP7yqpNmjl8a0g+cimpESTieZ1rZxGa1mEuHk7/37v6jYlRVWqfu2A8uKurtXo/akxkBisTADwhaCzs5jL7ClN/HFz3gkmKXNurV8zg8hB2jf1SSTjpYmn8/74ndjLC1KDwwxH6Zmyds0eI/miy+ocLIqkefvbDbcBX9lUVfZe+hFVMW3GOQ9MJjyd/N12XAQlvh0WPp+fuVdiSzO9aY+Qz9NKB0yVFMu/jV7P4v3WkAJYcZs8oduus99EkMsF/wd21Ddv0po43VeNVidrMLZSt8JMpkExoeFJAPPDAANNBAWk5Ih6ZJGPZhHfrdmSf6CufsdIM1vcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i70RfDXxp7AIcL13e2v3jJ2cFh/9SeA3eqySQklve3E=;
 b=nDjxI0NBS6vbrtiRklTFJULWdha+YF/HDIhljhkCcd2k6jPR8/DETjFiI8olJZIjV1msteCa/iARz80F69Qw6xg9FdNsRka8FRMaGsou+7zjm9O7AWojyvm6faXf5N2KUfFmARfj9y/Ns4OgV4UTJBtMBlCEBDAa8m7pmwgxsvWwHUOrTGYrm6W2vRzN2Lpbj7eFi2chRczqzIPL9gEenq2XjhyTaBMrGFJKsab+n8zVvhrI8dj+bORZeL+Rc0BXu+QnjCKzpwPEoIqx8AZUAXeZ5a+qwHOJRG3CiRD61iLHTI/AjddwB2sM/s8uThtGap0IbU4+dEGGThfAhJaWTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i70RfDXxp7AIcL13e2v3jJ2cFh/9SeA3eqySQklve3E=;
 b=blLFBLINGzISd0iAdGwcoZ/4nuCVuJvKSEUFwyI3PXGBP+5sabkc21F3eRviezhEoSuOaMZqFywSSGkee6JegBM7leYyrO8jPZMacp4mpS0pQOpRAH3KwQX9tGWagCcl3zigCmz0k/K1KCvmiy1qLXStQHcm7OmfVdYrv2+CViWhvA64Mhf+Rv3UXsrAEQuC2zyaKo7GPFmIKg1XHQB3ZJVyMpe/XGX+GVad5KlA50lrUFgdHwwQFoQoxwfkBsOjqXKNF9vqJK1E6fdp2gMo5QrYTfYC8XbFUYBlsfkAlYhRCh0i+qftvWuPiZyQWX7e9sO5l/NO3xZdlAhHV/CTLQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS4PR04MB9340.eurprd04.prod.outlook.com (2603:10a6:20b:4e8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Tue, 23 Sep
 2025 05:17:16 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9160.008; Tue, 23 Sep 2025
 05:17:16 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Tue, 23 Sep 2025 13:16:36 +0800
Subject: [PATCH v2 4/6] remoteproc: imx_rproc: Use devm_clk_get_enabled()
 and simplify cleanup
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250923-imx_rproc_c2-v2-4-d31c437507e5@nxp.com>
References: <20250923-imx_rproc_c2-v2-0-d31c437507e5@nxp.com>
In-Reply-To: <20250923-imx_rproc_c2-v2-0-d31c437507e5@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Hiago De Franco <hiago.franco@toradex.com>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758604605; l=3725;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=XDzeXf1ckrz8GfTX3CX3VDC6Y35iLF4Bd++eK2ze6Rs=;
 b=4KC1HW09f28p+h5nUJuUj5EROStGrtu/oWLmufpG1nYfMkSEj/B7g2rVpWKUTIXawiRls2Qzw
 FfIh2MjaEK+CCo/zdJK+Rk8sDHquWVmStybuKThDf/U+T1WwEv13w8s
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: MA0PR01CA0070.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::15) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS4PR04MB9340:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ee320db-e0af-40a6-9717-08ddfa6075fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QjdvYlhmNlcvY3BpTzRBVzNXVEN2NkRMUk1hYmQyU1hpQnhHUzVWRitCM0E3?=
 =?utf-8?B?aWFHRURIV1hHazdIQzlMVG5Fako4aGFDb3pSRVdOQ2FJbUxwdkVJNXRzaXB4?=
 =?utf-8?B?V0ZpNmdsTEF1M1BCdnJiZDNKZXljcU9FcHRmRjZmUkVmb2xRaEZaRU5TTDd5?=
 =?utf-8?B?LzVhWmM2eENnMEZUMit3RStUVVhZVlZaUGM5bGw1ZExmdGh2b1BheGZlVHhp?=
 =?utf-8?B?ZjI1bUtzOUYzekNTbFQrZ0plUytrUEdnaWhNcWhBaVpXdXF4L3BrUTBHUFNS?=
 =?utf-8?B?TWlyUVlvUXY4c2NkdGpJWEtNQ3pTdkJ5MEZxeW9jdnZ6cXZZM1VCL2lkRU4y?=
 =?utf-8?B?a01pN2NrUmZDeFlPMHc4OE5LQSthem9lVjFoSWxwYXZiTlNIcTY2MjBnYUZI?=
 =?utf-8?B?YUtLcThod20rWnJWVHRELy93UkdoeFJRbUZOemhjSGU3SXRNOXdQeEMvUnVV?=
 =?utf-8?B?bmlSMGRLcGN5RkZvVThRdzdFb2lubUpyWkZYNkFnQlpST3NOTUVWcC9od0FE?=
 =?utf-8?B?aWptRzVNSit5M1VTQjNNOWdmUXIvNEVzSk45b01OZXhKSEh6NkhZMmhhQm1D?=
 =?utf-8?B?YXhrd0dYUkpCTUFnRGlJc3pTUjkxVHVQaEUwc2NjL3dNbUh1VGRDOXZFVDl0?=
 =?utf-8?B?ZU93NVV3NkZGamltYUtQMFgwRGVVdEhMbGprQjZoZWhCVUJOdi83NE9ud0dX?=
 =?utf-8?B?ZzF4ZVBGYVdPcE9RbEw4czcvVmFwM2NHRnRLV2FrTWVUZVZjcDFyNzd4SHc3?=
 =?utf-8?B?SmI5VTc1Q3NzRThqRmFINDZRMi84U1RON2g4V1k4am1Qb0FnbUExTmFLYVpx?=
 =?utf-8?B?c21xMEVSY09wUWd0eVZuZzc5eUx2cjdHQmJyQ3orMS80UmpVSFZ2YlgrenRo?=
 =?utf-8?B?dVpCdmVTcUkva2t6QkZLdE4zMXk1N0Jqeld5anlWdmFxWWt1aENrU0o5Sm1k?=
 =?utf-8?B?c3ZBZk0xbStmdkhsVkRzL3Z5TDVHNDE1STNrWFN6OHVna3k0cy8yMHA5MDZO?=
 =?utf-8?B?a0pIUi9EQ0pIZTBIR1Fkazl4U29UQ1dHODRGK0JYNUhYUXVnV2ZSY3Y5cGYz?=
 =?utf-8?B?YWIreVhsNnV6a0ZJRWRkSm40alhFZ21JTXpJaFVXbldDQVM2amVCeTlmdkt6?=
 =?utf-8?B?aGRVclFZMVJCRjlmbm5wVDBkb2t5Uk51clNWamJLU0VCOGs3K2VVeEpoMFpM?=
 =?utf-8?B?ZFdmMkdQNWdnbFNXY2g3MjdlbnQzbHRzVVVVTzBzU0FOVlVqTjdhc1Q1ZEpO?=
 =?utf-8?B?bWpOMUprdmwrVldFZ3V6U2xLWG5kclJUVHEzWEpISmk0V3czd3VGYUhaN2NI?=
 =?utf-8?B?dWlISnZGWkZYcEpwYy9wSTFDc2s2ZU1ObVJBMnk5SngxRWNRaUtYeXl0SlFF?=
 =?utf-8?B?dngxaG5TRUIvVGVBT3p5VEtucWlLUDVVbEZVTWlQTlZQdFNFUjk0dXVieC9v?=
 =?utf-8?B?TjdNZ3lya3FrellqOFcvMUVsQnpyaUwweGNzOWlQOUYzbk1YZmdLMTE5ZndF?=
 =?utf-8?B?T3RrMWZqaDlyNGpmWS84YTZIOWZRSWpPV1Q0NXdlSERYeXpaeEE4b3QwMTNN?=
 =?utf-8?B?TXUxdUJWaVRwcnVxOHZZNjk3SjJsMzdVdFlKS00rWm04alk4WTZWdytURlg5?=
 =?utf-8?B?UHlNSHRuSk1EMjkwN3UzWDNscmMzZG9veDg2RGM0NElSSXUzYk9OR2VXMVNE?=
 =?utf-8?B?bmRlUmNwL3RnNlRFNk9ZL1B0ZDNhSFZ3L1VZVzg4R3hGUVlTRkpuZlJZckEy?=
 =?utf-8?B?U1Zjb2hKK2wzbWx2TEdTZEQ0cE1rTlo1OWkvS0ZFMUZyWkI3bFJ6eklWVUFC?=
 =?utf-8?B?ekMxanZTQ05DeEpPaTRxUWVvWE5aNWZZazBsM1V0Vkl0R0Fib3hPaWxqSi9l?=
 =?utf-8?B?eThjMmRKQkVLUjVzYTVHWE1VcWREQk1ickM4bXZWaW80djRFN2M1SmtvQ3E2?=
 =?utf-8?B?dWtRVGswcHZnNDF0UmczTm9wTU9BVXdSLzY0Q2dPK005TTJxVWc1OElRT3V4?=
 =?utf-8?B?b1dqcERtSHZBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aFMyVlNuMFp4alJ2N2FCTEtVdXJSbzkyK3VNaHVsK1dpRy9nTlJuaFgrbDkr?=
 =?utf-8?B?YzFXTHVkRFAzSTdlWWpXWFNKYVFUTjNpMGRURWNGdVdJbUhuM0M0VmxLNkt3?=
 =?utf-8?B?NWpQUUFLcTlLaFdNZjh5THN0dmkveXYzMjc4R0xqdUFTNWsrYWM0Vlo4ZGgw?=
 =?utf-8?B?cFlQd3Nhak1CNmNORC9iMStBTUFEZVRXVUIwMlVMNlc1d3FuZDd5bVNOUFJm?=
 =?utf-8?B?TEJHeXBLMjJPV1E0bVRYYXFOSm1IV29uZHNRT0gzSFlvb3V0NHh2Rm05UFI1?=
 =?utf-8?B?OElBdVQ3cVBmdTI3Y1lRV2FsbXp4aVFKNm1uaTg4WkxSWW0xTjVEM3E3aXNV?=
 =?utf-8?B?ekVOMTBPV01nMWxtZ0E4Ukx0N21Da0h4VkVjWFFkTDY2UkNMVXBBc0NzbHdJ?=
 =?utf-8?B?K2ZTb1pvTHFYemtHZnErY2NkeWNaR254ck94K1BOdy9aN1ZwSjFTSm5WUktU?=
 =?utf-8?B?YW1tS1lmYklRVkRHTDloMzdESWg3cWpiS0VrWXlDb1hjbDg1WGFEdzVYbm9a?=
 =?utf-8?B?SmI2bElMQ0xGeWNIMnVBWndmTG80Z2cydS8wQWtKLzNnN0JoYzhRVU9wQWpq?=
 =?utf-8?B?a3lUSFI3cVdYcG5XTHhNckdvUSs2bE1sQWZWNmV0Q25uTlhFRGpRWUw2bTZj?=
 =?utf-8?B?NnRTUjYyaC9jaTRmK1dOdTN4M1JEZWUxaFA1RlE2VW04UFBPZ2lpbHo2OWNI?=
 =?utf-8?B?NHpLem5GZThUZ25wZHVoejlBbHNtaXVnRHNiZUVEQWJRenI1dlgvcnJmT0Iy?=
 =?utf-8?B?U0hSdEhINVFkQTBCWkpodHpvY3QwWTMvUEhDYUJaV0xEVllrM1phVWx6ZlRq?=
 =?utf-8?B?OHJYM3NyL2NUeFVNQmM4ZjhPSko4bklvTGNvaWxoT05ISi9FNnNhZVdqQndT?=
 =?utf-8?B?QVBYMDRLV0I0YVFHT1plalRxaGNBWEVLdjBGNTFreUFqVytPTU5pWWVKVlF4?=
 =?utf-8?B?MFJzMW14SEZrdU5TRmpCVldIMXNOY0JIYk9tUkJKd3dKcDBNWlN1UTlkWUEv?=
 =?utf-8?B?L2xoYzgvUXlWTDNyK3grM0Y5UVhkeGpsLzlPRVp4VXJudms1SEpDZFltYit4?=
 =?utf-8?B?U096N2laQXYrN2UvTU0vdUJwR1RPMm1udkh5bitTL2gvSm5sWXM2NGxyVVcy?=
 =?utf-8?B?WUk5RjJhMGZEdTFZVGNhSi83K3hodWgwbzhGSERFb3oxdmJnMG9vWUJTN3U3?=
 =?utf-8?B?d3pUdmpVYS90RUxsUXRWSHlFNm9NMTBnRjZYYWdUUmVocU5UTGNiZG93YWQ4?=
 =?utf-8?B?UDdGNzNuSTR1TGtzR0ZvdkRnRmE2ayt6RXV1MVhiMG9ZdHRtM3g5ZzZXbjZ5?=
 =?utf-8?B?c010U0JUS0tyOGxlVVNsUTg1YWxVNjBOMDYwejRwYy9NZFNzUnRSN2ExdDRT?=
 =?utf-8?B?SkV5TE1GakZybnZOb004Zmc4bUJZcExmQzBwYlVudDBHdXFpM29mYU9TNlRL?=
 =?utf-8?B?bWk1Q1Y5bGhQbE1zb3NlVXF6TnhUVVpHbW11K3lYVjZnb2VwZXo3V21VZjY4?=
 =?utf-8?B?K1JlNHZZcmJ0YS91bWlOanNLNGhKREpyOUFaeGlNRU1mTUwwY0JSSi9ULytx?=
 =?utf-8?B?dk4vMVN1YnVDbG52d1dUbHl1MXBwMFd6cEQ0ajB3akFxKytZMldDUzdIaGl0?=
 =?utf-8?B?NWMxQjdDQXN6Zll6U0w4REdVaHF5V1FZZmg5WnhpZkljT0hkaDh2NWpOZ1U3?=
 =?utf-8?B?bjFTN2pyYUZ6MGFWQ2ZWQi9vTVZMUThHbkFyM2hTY3RhQVZNckNIbC82c0k5?=
 =?utf-8?B?cGRKTncwd2FHcFQ1dlNwazVMVHhxVzZ4QndCTFBBQjV1NEpoNXZSZ1FSMXcw?=
 =?utf-8?B?akR3dlppVE9icHNWSXNJZ1NHWkRYK2ZGQUFxM3ViVHVibWlmZkZPWmFxanM0?=
 =?utf-8?B?MCs0cnlXbUpWZmtCYTJKWUdoZDRtMjhtMXRXb2F4UW95a3AxeFhoeHlFcmYy?=
 =?utf-8?B?SVZSZzA2V21aa1ZJWFQ1dFRReVpUdXIvcXZySDJjMjZTQWh5OE1JWFY1MkVm?=
 =?utf-8?B?ODVFNjBSUVpxR3Y5c1o2K0hWdUV1MFBUT21aWXB3dkNxNE9POTlXZ201dm5a?=
 =?utf-8?B?T2FLM09ha2hSMkduMGF0VjlCVlNiZnNSZDRIQjkwZ2xiL3VKSmZDVUJFUk5v?=
 =?utf-8?Q?tRIPhyE/cIfQguFRay0Wl2R/z?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ee320db-e0af-40a6-9717-08ddfa6075fa
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 05:17:16.0572
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u7sAeXFkuGeh35770Ko+TyiLQHY5HbHO/bkeSvi6BGOSku5P0NlUR0jKQYnTRtfmJaer8WCtRhYDX/+svWqfZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9340

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
 drivers/remoteproc/imx_rproc.c | 29 +++++++++--------------------
 1 file changed, 9 insertions(+), 20 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index e30b61ee39dacc88f9e938f8c6ffe61fef63dbda..42014b42bd8d3b46b1a898969f0419e2e6a71528 100644
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
@@ -1134,7 +1127,7 @@ static int imx_rproc_probe(struct platform_device *pdev)
 						    imx_rproc_sys_off_handler, rproc);
 		if (ret) {
 			dev_err(dev, "register power off handler failure\n");
-			goto err_put_clk;
+			goto err_put_scu;
 		}
 
 		ret = devm_register_sys_off_handler(dev, SYS_OFF_MODE_RESTART_PREPARE,
@@ -1142,7 +1135,7 @@ static int imx_rproc_probe(struct platform_device *pdev)
 						    imx_rproc_sys_off_handler, rproc);
 		if (ret) {
 			dev_err(dev, "register restart handler failure\n");
-			goto err_put_clk;
+			goto err_put_scu;
 		}
 	}
 
@@ -1150,32 +1143,30 @@ static int imx_rproc_probe(struct platform_device *pdev)
 		ret = devm_pm_runtime_enable(dev);
 		if (ret) {
 			dev_err(dev, "Failed to enable runtime PM, %d\n", ret);
-			goto err_put_clk;
+			goto err_put_scu;
 		}
 
 		ret = pm_runtime_resume_and_get(dev);
 		if (ret) {
 			dev_err(dev, "pm_runtime get failed: %d\n", ret);
-			goto err_put_clk;
+			goto err_put_scu;
 		}
 
 		ret = devm_add_action_or_reset(dev, imx_rproc_pm_runtime_put, dev);
 		if (ret) {
 			dev_err(dev, "Failed to add devm disable pm action: %d\n", ret);
-			goto err_put_clk;
+			goto err_put_scu;
 		}
 	}
 
 	ret = rproc_add(rproc);
 	if (ret) {
 		dev_err(dev, "rproc_add failed\n");
-		goto err_put_clk;
+		goto err_put_scu;
 	}
 
 	return 0;
 
-err_put_clk:
-	clk_disable_unprepare(priv->clk);
 err_put_scu:
 	imx_rproc_put_scu(rproc);
 
@@ -1185,9 +1176,7 @@ static int imx_rproc_probe(struct platform_device *pdev)
 static void imx_rproc_remove(struct platform_device *pdev)
 {
 	struct rproc *rproc = platform_get_drvdata(pdev);
-	struct imx_rproc *priv = rproc->priv;
 
-	clk_disable_unprepare(priv->clk);
 	rproc_del(rproc);
 	imx_rproc_put_scu(rproc);
 }

-- 
2.37.1

