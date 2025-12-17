Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010024.outbound.protection.outlook.com [52.101.69.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD53E2D3ED2;
	Thu, 18 Dec 2025 02:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766025014; cv=fail; b=JbddPX7w4nBnk9BwdkIrqMeZbDp7piKa1m3IrNoBB+yp+p6NRTaLDNjT4ctxldqLztWzNiZXFArcVkBTd5tIiqZhQVrmbcVsX/gk4CbycAhL9WHXT4XBqoTfrEsSUhLHb7vaW96Qxc1FXVJO/EsS3ZrpzmVFwNWT53OiVoUXjts=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766025014; c=relaxed/simple;
	bh=+ddc2O5F8UdSW5e9KzzkprlOgX4ZYlr0FWtOHPJWlUM=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=FgPg2OrJWNjwykMH/6oRMj9Nn/RM+S/DH5B4sNhzHrj88si9zZmQYYVm8NKocGU1Pw5/b1afAwOhlprc5hIwAoqu2wFilQYnwyKASF00HH0ybr1rFAd8hiB5J8rtbMcty1/q/9EvW5/BY9fKJ6NLUXunpXvsEG2KaTuyiIxGoiA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=WdaDAGkn; arc=fail smtp.client-ip=52.101.69.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="WdaDAGkn"
Received: from PA4PR04MB7821.eurprd04.prod.outlook.com (2603:10a6:102:c5::5)
 by PAXPR04MB8845.eurprd04.prod.outlook.com (2603:10a6:102:20c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.7; Thu, 18 Dec
 2025 00:57:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=shSVGccANbm60QVAk4JowMrCZ2mAXytisVJKHVyiAlhq6077kx30U5LyzIcYGxh8H82qhAMCT5YMDrwC4+jgbX2qW/TZXC4BAD9v534m2Vf/JKZBXAv5qmO6fFLmwOJIMpRnhUJM4O5OGAWYsoqUTmlI9tEnC13N+K4EvCb6635/fQXnZcyCmEpaQujKGdTHC2jvl7eFkM0fEGrFdKSzMWrGBzfzpgWNjAnDlfGRjUQntolZXPecFb/5vIv+QA9CeZYPFmLNZP9Z7CDjCX+VL6dmhDJR49ZnFF/qlpaORZEffOg697YzmdzXSSikhpvo/K3JauI+6h0WkzkebI8+OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yQ6rufNVMBJ2mKHCiX+8OC9Th/HVedTr8Dr0Cm+BPW8=;
 b=v+qT+IOWFq5K8vQYAjzjZ0CzEE7pOUZTg3YfPfeFZiNOi3QPE1guUlx3BBaom/0dhMtKf5Oc82kaqetOaqdP7oGaMgWEaXHewFhVcczunKuZk6dHIYfns+fryFR5jahC9cJXM/zIBzeLXBWKJPT2ba+oCkzxhdSKpaKOgsRC6J5KSey82GLIjPNnu7Ye6a87tbzLjn4dl7QowPqWVB78VjWGdjVbE/lHmS/9ullTumPTuja5d+E9cmWS2oKlh4Ybg1nrYh+/7oLHf/wPpVOjE3+2AX871vfDoCOOIDoCUtEzZAIx7aBS0trLGs2J6T6t2NjR9vqWBDy8bV/FT6acEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yQ6rufNVMBJ2mKHCiX+8OC9Th/HVedTr8Dr0Cm+BPW8=;
 b=WdaDAGknF5V7deKqCDW/8fRGHr/oJgZGb5CKrpbAD/wi8iJUFhTMwcqKw0xuZGeRuULvblvnIi5u9vRYiXN0vbKWwLZN9LwQHG+gWRdBqKY6N3UqwqqVMo7JcfDVyZsV7oXZFmTnOTMvuE3tzBErknk7X5KLG8/wNyypCOVqFnhO9QRTXvq/qSG+T8Usk/DaxaUg1xmmulxlpMFFuf75Lh+KYQhpJYdATXCn7KF5+LaUm5FFvuMEsFiGQeVbGbjXV3s/GP/DUdH1GP27R8GWBpPcnrozS4AiUmUHBlazXjZFUzI0Qi9vRBqvP1wpyFWBf/iVra4atEDCjV2vOoeNXw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8907.eurprd04.prod.outlook.com (2603:10a6:20b:40a::22)
 by PA4PR04MB7821.eurprd04.prod.outlook.com (2603:10a6:102:c5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.7; Wed, 17 Dec
 2025 23:06:29 +0000
Received: from AM9PR04MB8907.eurprd04.prod.outlook.com
 ([fe80::a361:2618:7785:3bc9]) by AM9PR04MB8907.eurprd04.prod.outlook.com
 ([fe80::a361:2618:7785:3bc9%4]) with mapi id 15.20.9434.001; Wed, 17 Dec 2025
 23:06:29 +0000
Message-ID: <ad45e803-1235-4320-a87b-a60b18df2cf0@nxp.com>
Date: Thu, 18 Dec 2025 01:06:27 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: imx_dsp_rproc: only reset carveout memory at
 RPROC_OFFLINE state
To: Shengjiu Wang <shengjiu.wang@nxp.com>, andersson@kernel.org,
 mathieu.poirier@linaro.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, daniel.baluta@nxp.com,
 linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251216074216.447193-1-shengjiu.wang@nxp.com>
Content-Language: en-US
From: Iuliana Prodan <iuliana.prodan@nxp.com>
In-Reply-To: <20251216074216.447193-1-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR10CA0004.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::14) To AM9PR04MB8907.eurprd04.prod.outlook.com
 (2603:10a6:20b:40a::22)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic:
	AM9PR04MB8907:EE_|PA4PR04MB7821:EE_|PAXPR04MB8845:EE_
X-MS-Office365-Filtering-Correlation-Id: b39bf024-37ee-4e7b-567a-08de3dc0e931
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|19092799006|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?SGF6cWU1RFc0UXIyVUxyVHBTbDFJdGpWc1pHL05nc1pGMGxsc28rRVJ6VVhW?=
 =?utf-8?B?MGpQMHFSMlcwRnFkeWtNMXRKOWpNMkhGREljTXV3bFVEQkM0Q2djaDNLcFRo?=
 =?utf-8?B?ZDZ5b3JrUC9TOVpyRHQ0alJlbnl6V29JcWNSR21naWtmNytTdTYvQlRzUW1k?=
 =?utf-8?B?a0pQbm03enFFajhJUS9wYVZKYWdCQTVxa3I4OTYrVTVXZGErcENIOVF2K2NL?=
 =?utf-8?B?YmFoNUtmTDlCRlEvMldFaVo3N1NSeTBGc2lPdThzME5zT1ovaHhxbkZkMnJG?=
 =?utf-8?B?d0NIMjRHWFZrMFhQT04yK1FXVC95NUMwU0lkSU8rNXFaemxzS3VpM1VWeTJK?=
 =?utf-8?B?RDdTOEtjdmdzQytRZWhWQ0o0ZW94TzRodFFEWjBlSFRNaXljdURvVlA3TXpi?=
 =?utf-8?B?dVVUNkI4QUJreXVwalplemxqZlZGWGhCNG1jSHk3bTFSVzgrTnhTYVI3MTFq?=
 =?utf-8?B?Q0VwMDFDcjAvKy8vblJ4YzUyeThncDQ2eXFxUUcvNzUyRDYxbjJzOVpGa0Vs?=
 =?utf-8?B?dFFtdEZsMXd4Z3lDM1BMZGtOVjVyVHhTbE90Yml5U1QyRmF3UWI1U0p0ZlBO?=
 =?utf-8?B?L0pBV2RlTVRwcHlCWXNuUUJJcWlmeWJiZDNEbzBVa2FNUFVvdjR4WW95Nzcx?=
 =?utf-8?B?U3FRd3NsWEF5QWdXLzl3QjVjVVd5cGVqUGh5cEFua2pqVmxyMWtWdnVXQmhX?=
 =?utf-8?B?b3MzTGF6ZXhESzV3Y28vcVJTZXJuWGZTVmxBaXIwRzl2TUNWY205WUw1WEps?=
 =?utf-8?B?M2txaUZWaFpVYTFFeHdYc01Ka3o4VWl0SDROU1dxdzkzWjFPbC8vQk1oSmJ2?=
 =?utf-8?B?RHRsMTBqRHQ0VG9FU211NUJFRnNXT3dHY09XNWhVam9HTGIraTNqQTQyU2tR?=
 =?utf-8?B?S2Q1T25OZWExaWlmWVBaQWFnc2grbXhyWTJ3UGZHQXFWQVlZaldzNlNrNzlo?=
 =?utf-8?B?S2RHZzNUZ2JXNzg1MnlBbkNTbkR3RjcxWGZ6V3hITFlHdUFYSUFKUm5SZjRE?=
 =?utf-8?B?a0dDVUh3Vno4NHk0WnoxZFZDaXR6MkNiNEc1YVRWM1RrL2RWRjUrNmlQbnZF?=
 =?utf-8?B?NW5DWlcvdVg1QUVxWXhrYzFuYzhvWXFtUDhqWDI0N1pIcWNnRC84dENYd0J6?=
 =?utf-8?B?N3IrZDYwdVcyRWIwVURHN1hhVS9nM0VSZjNuUW9iWGY2NHNHeGZSTzVjaXky?=
 =?utf-8?B?WFA2ZHdvUU96TlJCLytuRmk5TE56a1FpQkxVUjBMRTcvdWFVWmFXTEdqN2tS?=
 =?utf-8?B?eWFmQnBoVFFiSkFITXEra3lSVXg0R0FKeVA0Z1NYOGVpSDViYTZNaFBDcUNU?=
 =?utf-8?B?Y3czN0xXZ245U3J0N0hsZ2NBUy84VmpnZG9Ec3NuRTFWVmt1djBkQUU1Yzk0?=
 =?utf-8?B?M0x0ZGVNRDJpOW44bFhjR2s1SmFkOXBQTENwSjRFZ1hLdGhPY0MwS3c1SjdB?=
 =?utf-8?B?dU5JM1lXQXVpS1ROWFJFM2ZpNGdrSDdvelREVWRYY0NnWXZXTUwrNGZoMTdm?=
 =?utf-8?B?R2VrM1hXeHZsUFRZeS8wUXk1b0wvOHlsVW1SWW92elJpdWdjMi9ZZWZrM0Jt?=
 =?utf-8?B?WUdpNERWcXpiUkJqbWJWTWpoM2NrR2dlbGExc2FvYlFRQzNnL0FoUldTa2lQ?=
 =?utf-8?B?aDV6VGpROUpSeG1SL21QSW1qUlV6WXNNcU1heUNMV0U2RDBOSXNMNGpXVFpN?=
 =?utf-8?B?M0h5RjRYOWxOTjg5RkRybllUZWIyY2VSeXUwTUFmOGNpY1NvNWJRam5GeW82?=
 =?utf-8?B?S3diSnBaVXZKVlR3NHJlY1R4b1Brd3pCMDlNWGFaRW56a2hhZWRUbStSb2FS?=
 =?utf-8?B?TEZRbHBJelhoZ1FkcSt2RUN2WTNtRGNkY2FhTFV0WW9iOStNRVBSRzRwaXJB?=
 =?utf-8?B?cUdncmVRMmo0dWJUS2tNaUdXT0QyeEtPUFlodWZQRFRnNERHQ1hYb0Q1U2t1?=
 =?utf-8?B?MGlUTEEvbmkyT3d4UTB5UFQrejkycnY1c242OEQ1cVJYQzVIQXdVTGNtZGV4?=
 =?utf-8?B?RXljeEx3bGx1eW5oZ1FrYnlmajRCK1NyV2tpbE5WeGZWYU84bnJMN1BCSHIr?=
 =?utf-8?Q?5J2IKI?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8907.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(19092799006)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?aTZVaHc2alI5NUw5ay92QVhMSXo2aFk5VnJyVlVqa3BlRHhISFZHbERWVWY3?=
 =?utf-8?B?TUZYeWRybnpNbGRHOUJENmtVV3BjMWZLcjFxUzdpUjYzejhyaWRJaEZwWU9L?=
 =?utf-8?B?VWRlT3d5bFVPWFdRbFZhcGdGdXlVN2I4THF4d0puYWlodXVPQmFVUGtIWS9B?=
 =?utf-8?B?ak0vRjdpejNFS1JNUWpmcm5tczhzVVZWdGh2TDRHZ1VqQSs2a0lNaTMxSEtI?=
 =?utf-8?B?TXVxdFo2dXFleEIvTGprclpaNjVXL0dOcHNub0hqMHRYbmFNS0duc1ZCZU8z?=
 =?utf-8?B?cDFuQ1lTd2lhVm5WeFRsTkxqWXlHdmtSbE44QXhPNXJMN0ZGVlhBWUdXdXdy?=
 =?utf-8?B?WGxGRkZCRjJMVXV5RUxLekNwcVV3TXpyaFBGMXlmVXNFMnVnNkdiRTJIcW9I?=
 =?utf-8?B?dmo1RG5nSUJYUU1wamNJQjBCMll1UFBGY2ZHM1RUeDEwS2VlZzdqV2R0WEhP?=
 =?utf-8?B?Z2t0bHZyZmVJbWZrbVFFWElRcU1NbWlBNzMySUN6UkpoNXRaMXRUMFAvalhY?=
 =?utf-8?B?YW55S2l2eUVXWUQ1amFnUmMwajFPR0ZwQjBaNGdMdkZ0WmFBMVJVendyUmRi?=
 =?utf-8?B?RTc5amxVZ2I3RnN4OGx6V3d2Vmkra2JNT3kzb2FVY2d0cGl5a00xVjBXRzAz?=
 =?utf-8?B?Qno2aGpWcnphektCcVAvMTRYdkdPekZTQzF3MHN0NHR4V29iRzVzWnlqQ1hm?=
 =?utf-8?B?cENWbG5oZC85dFBJNzV6NnFVQlR2cGVxcGxTcnFHOEQwNzhxclRGOXhPdWxZ?=
 =?utf-8?B?VkxWMm8wVzNCaUwwYjNCVEpoVkpYbzJETkxPSHp6ZTNQZ21aN0hzQzFobUpk?=
 =?utf-8?B?OGZUVEM5WWh0Z280T3I4K2F1UEdjY3VEUXowTy9iVXFLR3NHTFg5NHJxTzlu?=
 =?utf-8?B?MDFDM2RJMjRGSmdEZHdNUzM2RnI0cWJTQlg5SmtNTDJ0dWpDaGE0MW14WjZq?=
 =?utf-8?B?RXpCQ3Rwa2xNQ21kdjlFLzQ3SUxGNFhaY3hlbmxxSFYwbEtyZ0dQZlBsQTla?=
 =?utf-8?B?SmxHdnc1dXVjR0duRXltUFk2Q0FiY3JYaUdoa2F3eGtzbEdvbXBBcENrMTFl?=
 =?utf-8?B?Znhna2VvbmNuUGVaT2hyTUIwV3hmUE9oenRGMklGa1M1cllUOG4yNllLSWts?=
 =?utf-8?B?TUNQKzdGRFBIV1NsQlQ0ZUNTbE9WREJ4N2o0NENxa2JWRHAxUXcwc0x3ZU1x?=
 =?utf-8?B?bDNDRFBnSDRuczRhdzd1amRaTCtXQTQ2dEZtSzJ4Q3NEaHdmQVJDUjlxbTJh?=
 =?utf-8?B?RmYrQkdENndZMG5yaUcyR2NjdDFjZWZtQ0NVKzY1MFlyZFBZUHpMZFBZNXYz?=
 =?utf-8?B?aVZySmZpa3pCRGJ0eEVtZ3podjVVS2VQY3oyZkYwMDg5eGhLTVpHNGZiTkZy?=
 =?utf-8?B?Q2REM1pOZ2phYVVCOEZpYStPbWpCeVkvbnVYTDFzY093VWwyTXdjYlJNV0Vv?=
 =?utf-8?B?NlB2UzFvaG9ZVm54RitTTEQ5YVpqZW9ScU5QQzdiVHBZTnF5LzI1cGRPYkwr?=
 =?utf-8?B?RTFaeTk1QjdpYlhpbVFpTFozcUJaLzdRT2lqbjVoNCtQZUZJSjBoUWpJeE5R?=
 =?utf-8?B?MzY1SEJ0bGpleXAybURzTWwreFdOOVVPQ1FuOGp6OXVHTW1wZ2lsaFJCUEow?=
 =?utf-8?B?N0t2RTRjM0o2Tk1laE5JR0JlaER1cW9DcGp2cEF4alRScFBjVTZkT25Icnlo?=
 =?utf-8?B?b3JZQVFVQmtjbjViMFB1czZBckljOWx4WjFMekRzWEdzbTZEQ2tZelBxdWtQ?=
 =?utf-8?B?SmdMYUN2R0JBNHdCMFhkenlOQWcxWmtobVpGUFF0c0lwTi9CeUNrQzdyZS9i?=
 =?utf-8?B?S0pzZXhudnJJcjlzYk5CWkVWSzY4bWozeE9KaFFYWWJMcmxFamx1eXhRZ00w?=
 =?utf-8?B?MFRtTjFxK29BbHF6M0t3S05ZWXplempBZjVhSVlSd3hmb3l1bkZ4b0dpTHI2?=
 =?utf-8?B?YzF6NWVtVXRjM1pTcDVKT2sxbXVibXBJdUh3RkNYNGZ6R1ZPbGFQa1NpZStr?=
 =?utf-8?B?eGNPajB2MnJRYWJva2V0bVdreURTVGtiWitRYVo3VmRzVEJpMXhlQVBuNGtJ?=
 =?utf-8?B?bGpYZkM3Y3dMdGRmTkNZTHdNaVhFRWJmMFJva3V4T1lOUjY2SUZIeVVxUUI5?=
 =?utf-8?B?MXBjOEh3a0JNQjArK0tyR3pqc05HQzEvWU1zNG4yNnovR2QzTmFsMUpSQmt0?=
 =?utf-8?B?MFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b39bf024-37ee-4e7b-567a-08de3dc0e931
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8907.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 23:06:29.0860
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y7RvvIN8oJnGz6Zs52pIkQT4uIEMfzaSDaQiMRr3NyzGcuF8sLDLqaZfv7+iT61wdjQFOU1p/Ihh4O2jT4m/2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7821
X-OriginatorOrg: nxp.com

On 12/16/2025 9:42 AM, Shengjiu Wang wrote:
> Don't need to reset memory at suspend and resume stage, because some
> memory is used to save the software state for resume, if it is cleared,
> the resume operation can fail.
> 
> Fixes: c4c432dfb00f ("remoteproc: imx_dsp_rproc: Add support of recovery and coredump process")
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>

Thanks,
Iulia

> ---
>   drivers/remoteproc/imx_dsp_rproc.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index d03017d6b214..ac8aa71aa56c 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -984,9 +984,11 @@ static int imx_dsp_rproc_load(struct rproc *rproc, const struct firmware *fw)
>   	 * Clear buffers after pm rumtime for internal ocram is not
>   	 * accessible if power and clock are not enabled.
>   	 */
> -	list_for_each_entry(carveout, &rproc->carveouts, node) {
> -		if (carveout->va)
> -			memset(carveout->va, 0, carveout->len);
> +	if (rproc->state == RPROC_OFFLINE) {
> +		list_for_each_entry(carveout, &rproc->carveouts, node) {
> +			if (carveout->va)
> +				memset(carveout->va, 0, carveout->len);
> +		}
>   	}
>   
>   	ret = imx_dsp_rproc_elf_load_segments(rproc, fw);

