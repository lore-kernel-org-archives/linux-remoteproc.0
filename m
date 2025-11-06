Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013004.outbound.protection.outlook.com [40.107.159.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6C42DC335;
	Thu,  6 Nov 2025 06:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762409564; cv=fail; b=LelEiu7X+6sEEkFq+7UFnBWGhXPFpUmE78Hz6ks6HozmJ56SqUZUi5gv285qoK+JxpiR8YWHsXQum3OI3mkMfV0afEO/bMTSCXm9HGrlgyOFN3l2EJEq4y9fFA98UdmztZVC8B7PARQUJ6cy4MR/EMoBYm5YUPTtACX4gFqM4eA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762409564; c=relaxed/simple;
	bh=c0bhmvrmHLfG4J13hPK4vXOwlBu8GL6ReVgzDN4rKaE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=N9rin1kgHzRxkRWatuHj3DvvHakg/y54QVHcmsas5KwrSKRhzGskoDG0b810WfPkMD5X6XQsz2jUtWxppQMjUED/KaOR4AET/fKhLbNd20c9aA4Jt/oHQTjHVJOuCt5s1Q2z94oaUUs+9Z+UDR9J9AHwxArhJNiu6+F1zxIJQ9E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=lRmSuKk5; arc=fail smtp.client-ip=40.107.159.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="lRmSuKk5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V91UNipuE/S1vdPuuFstVyfVYs++mG5hAo+Kk6CFVIHO2xs/O+S0wfCF6SmL+i3v6tCeVe/6DtwEtIIt65q9ilGSTCrCzxh/GXrSDcoItPyEF4gGr9bgbwAxRWGbuTXvrgsRQfit6f/LtjCpw5k5CRpH3Dvqn00wKMwwsb4vYcoN+2CzTFS5zYoc8N4oYVo6A168cpHKzXt3cs7Z/p0ZXemvgDz8H2S7WMNc2PIiirGF+1R+suIW3RbC++0XBxPiw1OU4uz8tk/dxIT7EUGHEORDqJ7NSRFYwpgVXMxB7KiR0zKwrORoHSQnvIo96HCbhG3o6S+x3tvWN1zeBOt+PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wV/sFDZTwBNz2pfDfoh1TtHjaHyckDnlyycDziTq16Q=;
 b=Xf0kjGy6NkSk0W+OzzLP2HPqe11Vj6jaaGE57vugGQX9ywj3VN36yvAN7fZQ6FzYXocaE/quGXsu4NkD6+8tQ07ZOuYCLEXLvDPWOZSSjO9bnSlmy2Rb6mWMkOvxlFKFkKqIBu4L7T2MeLl5HraIfAYFHvWw7njtYzwMupZ0CYhPvqooraY55RVnZUTgIW9q9nj7EDy1MJcx5Y1pD+nDOcbBifhGSoOw6uWPWpGmcmIwikMXqOoD4IMuAV+P4TkM5i36qxBb4ABIGy3gPhclThW6yaPDRU6jZ4pap9ZL1nnKbyAWLfmacTqYvzmDTAUHG8wUTse/t7nluQ2b2A0vIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wV/sFDZTwBNz2pfDfoh1TtHjaHyckDnlyycDziTq16Q=;
 b=lRmSuKk5tkhgyJPBSek3NieUm7St0OEHzpZIWYCiOmcc14bx4a+G272BX++NvTnqUuNPrx7U9TAIGPx7muWz0qK4re6p+JmuoelEpuXqDbZPSGiIthYYsfkH8+GIfD1CeI4Y6fQ8tBsVDRK1q0Y1G9/i9pcxt/1y52/A1Outj+a1Lk8KnklIxcaUcV6wQC4+0l7Z7+0WMS1fAZv4vJEqKQLXRQl9YtpH9kqvoetFD+dpe1jc9LxQMksqGFKxCjhFXhqi6gf8pHqlmwXlMtYq91oTDkYLTEmEI4v0lIoDHwg6iBZtAgGYCzckrxIIqb/ailzvFaju0c8XDVYVVvN3Xg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA1PR04MB10141.eurprd04.prod.outlook.com (2603:10a6:102:467::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Thu, 6 Nov
 2025 06:12:37 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9298.010; Thu, 6 Nov 2025
 06:12:37 +0000
Date: Thu, 6 Nov 2025 14:13:14 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <frank.li@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/11] remoteproc: imx_dsp_rproc: Refactor to use new ops
 and remove switch-case logic
Message-ID: <aQw8emAk2tJMBjSN@shlinux89>
References: <20251106-imx-dsp-2025-11-06-v1-0-46028bc3459a@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251106-imx-dsp-2025-11-06-v1-0-46028bc3459a@nxp.com>
X-ClientProxiedBy: SG2PR01CA0188.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::10) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA1PR04MB10141:EE_
X-MS-Office365-Filtering-Correlation-Id: ce0eeed8-19e4-45a6-063e-08de1cfb7b4c
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|1800799024|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q25lbU1YVnBRaTdha0tSa2Z0SkZVeHJhNWk0a1d6RXJkSUtWaGJUNTBoOHJk?=
 =?utf-8?B?dEw4NytYWE5KNTJBVVh6bmh5ZTg5TjNsQzJsdnp0TDlKNmFyVHgvWUhoZWt4?=
 =?utf-8?B?U0RMNXhxNlhHTTJvRzNULzBiakRrYlhjVVR3UXBrZy9qWXNrN2ZNOXB4M1hu?=
 =?utf-8?B?aGR3VTA1Y2c2ejFwNUo1YXJJVThQMy92QnVjcW1nazdDNkJ6MDhwbUVOem1C?=
 =?utf-8?B?TkQzbGw1OU1ObWVxdG1yQkpCRjVxV3pxS29GRWpieHhwM0pNTm0yTWhpN1JB?=
 =?utf-8?B?QWhRZzh1SkEyb1k0N0cvZmpnbUZOZEx4dCtwQklGdGhsakxGVHVrQ1Y1UjZq?=
 =?utf-8?B?TVoyU1JUdisrZVZPVExKeWExeStWVEhrVTBURkJTenJZZkErQUNaUWcvbTF6?=
 =?utf-8?B?ZHQ4aWhHaFJBdGIzM09rTUV5TXE4TVNpUkF1Ulo5Rm5wSjE3Z3Qzc2NkYi9y?=
 =?utf-8?B?N3ZtSDhRZUU1dzhVTEJBM2xSZGNObksrdFhqc2NIMDQ5V2M2TU1kNXloOVJv?=
 =?utf-8?B?NnYwTWZGVVFidHoySEdmNnNucHg3N3p4Vi83NXhjUzdxbVpjTUpTOUllM0E0?=
 =?utf-8?B?Yjg1cmtMWGdvbGRpaCs1S0p4ZkF6Z2tOZEMwbk9kL1pQb0J3RjkwaHFTd3dD?=
 =?utf-8?B?WWdMWWt6VHN6Q0RXOGQ3bnZUTUVjYmN1N1hzck1KSldkSHFyc1BOYUpzTWwx?=
 =?utf-8?B?NUdhZjhBZ1dONWMvdHV1TzV1UTdHcG91Y2xockUwSUw4NXFnY2tDb0NtQTQx?=
 =?utf-8?B?eDRaOGozSEY1ekd6dmNDdU42ZEVGbG5GdkJjZXQ5UTZ4TE1XSUQzbktVYU95?=
 =?utf-8?B?dFN3WmozYUN4MndTOXlzMzZWRnp6MkZJTmdWeUFUMUUyL1hmblhWQnB2Z2Rt?=
 =?utf-8?B?NFlaTWsrd3pobHhDRVcyb0swamJkK2E0QnBqanpMRDN6NmlnS1hzK2dTRHJT?=
 =?utf-8?B?RnY2TnBOUmhYSmp3NE5WTnY2VzloSGpTNWNJeXYxNUpNSVZTV0dEcGE1TlhW?=
 =?utf-8?B?YTR3SzhzemRjME1CWWw2TkUrN3RXeWdIbWdoZWxxL1dJaTFQQXRUR0Jvb1Zz?=
 =?utf-8?B?ZjQraGJpZ2RpOUdlcFFYL25acGpxb3hLdXdqam05ajRUWVNOZEpUUHRjcVRu?=
 =?utf-8?B?UmpuSkZKa2pWQ1pVZi8yN0FGVU5FL2o0SHQ2V0hQc0YvQmF4NCtGOWF3Qldi?=
 =?utf-8?B?blN4T3FHdVVFZjVvczBXRzNaRjEwaUdEL3ZNWGY3RlRrRXV0YU5yMnpOQmFN?=
 =?utf-8?B?TTlUY3VvOVNTRzlDbFVjWkpXNTJOUFV5dDdPaTRXNnpPaTFYRkIvRTQwKzFU?=
 =?utf-8?B?Qyszb1FaVytueGVtMGRHL3VCQVBsTUMwMmFua0hzd1g2ejJQTWdJUUJQcW94?=
 =?utf-8?B?RmF6KzcyMjZsWDd1eXVnNW5kRnd4Z2twOUd3bEYzOEE3VEhSQ3JjV3lQYlcz?=
 =?utf-8?B?elBrYTJ2UXljVlBGUjlJa2xTVm5ML2xoNXVDc25wOHNKdzE4RWRzYUpNcmwy?=
 =?utf-8?B?MUNMV3psWXJiMTdQVE1RcE5SQXhPKzlXVEcxa2tlcUhnck5iZkN2V05lTmln?=
 =?utf-8?B?VFlJWjRsVWJQdXBoVmJPY29SRW9CSitTVjduVWljRURHMVBPUlg0bU54M3pr?=
 =?utf-8?B?a2h4VytPU1BmRElFT2Nzc2I3dVVJWnNyc0l5K0NjQW51WDVCVDBQU24rZkM5?=
 =?utf-8?B?WnJTaWVNNG00YzRLWXpFZ0Qzay9NaXVkVVN6NkZxZEZMalUxbzE2cTJtTUJi?=
 =?utf-8?B?VzBMbVJlYitpTmxyMHJYclNUcHVHMEVqQTIxWTZ1WmdwaHcwS0lkc21ia05r?=
 =?utf-8?B?dFZNc05JaDEyZFphUm9BYlk3Y2xrUGZMdzNOOU9Lc2RVR3k4ZWZNTjI1N0Yy?=
 =?utf-8?B?UWNGVGhuUldSQzBZUFhTZ09INjZNa1FWSE1WODF2QW9DQTlMeHY1UE1tSUlZ?=
 =?utf-8?B?dWE2Q3ppM1NIa0YxbFh5N0JORUpYbldROXFNZmNMUFpnWHZmaldldnZDRWZx?=
 =?utf-8?B?RHNwSWxIQmV3eE1yOThoTjVRMmZmSWJLM2NwQTl6SVdwNHdxdFNnUFZEMFRK?=
 =?utf-8?Q?HdYQGK?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aDBkT0xtRkhxelZJY3k0MmZHTVNOSzBhdkJkcG5vZm5rMFhXaEhmMnVOUFNH?=
 =?utf-8?B?c3Q3MjJZaFFmbUpabzVRZnZJejVPekdBdWtTTFJTV1NzV0pXVHd2ZC9mdVE3?=
 =?utf-8?B?clU2QWs0eldyUUlWdXhUMlAvNDQvWVl3OHNLenI5b3dHUVNhZ0R5Q2lhQjIz?=
 =?utf-8?B?bzJYbkt6RVhZMElaYU9ubldmOFExaExXb1hLamh6SGFyKzZTM3pzWmlXYitU?=
 =?utf-8?B?d0RnSXB6YUQ5akIzSFlEU1VUZjhCZjZXSllYZWJyTFhFdWxLOXlOdnFJUmpW?=
 =?utf-8?B?TkxCL0x3S1djMTZFTXN4Mm1lbkI0d3dxdEdPZVFMQjNEZHRreHpaejlEZG1W?=
 =?utf-8?B?VDFpcHJDbUdjOVhFd1BUYlNpMk5neDlYZUFvd0taOW1sTnptdkNYMWZHcXNN?=
 =?utf-8?B?RnZmUXBFeGMyL1VEMEIwZDJFZWxqUWdRbUFXUzM3elM1MnVDMzdyeWJ3Wllw?=
 =?utf-8?B?a0dBVndCMC9ldFdJZWREaUJlT3VmOWpVQ2V6cTNQVFIyWDRBRTBuMk1VYmR2?=
 =?utf-8?B?Ukc3RWJITDlPVG5QQzNXMitVWXFMMzF4amM1TDc5Ymxaa0kwazlFZFJHcVha?=
 =?utf-8?B?U0d2eU1ocmIwT0ZIYVlTTTZyOVQwMXFUYjV0TWJacDR5MFpOWjR6TEQ1akNH?=
 =?utf-8?B?bUZBUy9vOWhhRnl6UUQ0RmU2QnRxcm9VTjJOVG5WTUlzK2FmSldZejhlOHBP?=
 =?utf-8?B?RFZwekVpLy9kclJFK2pNeW9xSklmOHpZWlRMbUxLS1ZOZVgwUWUvSXB3WWVv?=
 =?utf-8?B?QVhCMXNkVUUrYVBpQlc1Rk1YczFzK1EyeWQ2VDh1VS9aQks1UFl0NTBtb1do?=
 =?utf-8?B?S2x5bThUcXJBM1hvQllaaUs5YWpqQU5DNXNmK0d6OUVqL0tldzcwVHVnZm0x?=
 =?utf-8?B?OXNsTDR6aFdjak5xUmJoT3Z1eGcreUhHcE8rUVl2S3Z3cEpuTGg1QzlzdjBu?=
 =?utf-8?B?c0xFcWhVNTl3blRVTElEbk5MVTR3TnNJdklkNGJVaFkwMldWZ0VJaDhlRjdM?=
 =?utf-8?B?ZW5nakoweTBFa0FGeEU3bFIrTDlIL2IwL2s4bElxd2loZFZZR290ckpzQThY?=
 =?utf-8?B?U04vN2k0ZFp4TkR5aEpyZXFpRjBHU042azdkUC9yOTVzWFlFRWpYYmFPL3pO?=
 =?utf-8?B?ekdUQkJaOEhYaXdpYlhnZHozZmtoV3MyaHB3SjA4Nm5BNC9McEozYWFsdmIr?=
 =?utf-8?B?L3dxeXh2dkVEM2FtNTBuMlNKTW5vNUl2OThhR2w2cWpGRGYzbXdyM09DdUxM?=
 =?utf-8?B?amE5NGdlQTVTOXI5ZFFFNHJOVUpLcng3WGlOOFoyRHRraHZ0a3duZ3gxZ2Jo?=
 =?utf-8?B?WEJrMkxLVXBuY0hyWUNhd0t3WWJCR3hCZ1o3WlVSSTdDT2FkdXdFSXRMMGwx?=
 =?utf-8?B?NGIrVFJRVFRWSmswWjdWeVBQR2FDa053b0xFRStIdlJaTzc2UllyOS95dEh5?=
 =?utf-8?B?Zk5CanFFajJmeHR5emZsL2o1dDRKMWdPWGVmaVNhQ29hbGN4c1ltZDhTQmdy?=
 =?utf-8?B?dURLYmk3eWFySG1ISUZXUnlBUjJDTTNSRjE5VWFXamtqOXQzSml5NEVRaFFh?=
 =?utf-8?B?TnZNbHMvWmxXbkx0aE1OTGtvMDhmYU52Y1BwTjkwMjM2RzBRRTdIUmVzZEk5?=
 =?utf-8?B?RlBYS1FsNVl1V1FjQnAwdGJxZHovTGdCc0lKM0Q3akFLS2xxd2JKNWxnbi8v?=
 =?utf-8?B?SWs0Ri8rT200QUpoR0swRlJQVys1a0J4NXVVdytEN2FNdDdqc3I5NWJpc3VV?=
 =?utf-8?B?QTFoWXhXL01paDhTOWo5NE9YN1p3N3FXZlVBNDdBL3NydUp1UTZ3bVk0T1dZ?=
 =?utf-8?B?WUxpYTAyclZlYXYwbkFRVnVSYnl2RTJYYmVSL0lZdFk0cVVxQXNCOEdrYlgy?=
 =?utf-8?B?eDFSUDNuRHNaOHBVSThtaThyRVptVTZseUJsa0hXZldDakZqTFp0emtVQ2hD?=
 =?utf-8?B?TEM1dUkxUHlFSnE0NGFCY2hDeUVwbm5MUE5FNElGVktmMWZLQllqTVIxVVJH?=
 =?utf-8?B?WDZTR0ViZUhvUG1XOUQ1aHJSMmZwL201dFA3bTNsTGo0ZFJtWEdnZVluTWsw?=
 =?utf-8?B?aDlvRlNXaEJOejEzU1NUZXN6bjdzZFp3clR2emRESHpQZmkybXR5UndrWDg2?=
 =?utf-8?Q?2opQkXklEKTKHVUvtJUEoqgdZ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce0eeed8-19e4-45a6-063e-08de1cfb7b4c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 06:12:37.7204
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 49UJu2pdbpUhx0RdrSgXNt9a/z4MC+XIcK3Ape0AJ55RqAHoeRBjWDYW2dzknhrHR9WGFJzAhivR91KlC3r9PQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10141


After using b4 shazam to collect patches, "b4 prep --force-revision 2" was
missed to bump the version. Please let me know if I need to resend
with V2 tag.

Thanks,
Peng

On Thu, Nov 06, 2025 at 11:30:26AM +0800, Peng Fan wrote:
>This patchset aligns imx_dsp_rproc with the cleanup and modernization
>previously applied to imx_rproc.c. The goal is to simplify the driver by
>transitioning to the new ops-based method, eliminating the legacy
>switch-case logic for a cleaner and more maintainable design.
>
>Patches 1–5: General cleanup, including code simplification and adoption
>             of the devres API.
>Patches 6–10: Transition to the new ops-based approach, removing the
>              switch-case structure.
>Patch 11: Remove the obsolete enum imx_rproc_method.
>
>Signed-off-by: Peng Fan <peng.fan@nxp.com>
>---
>Changes in v2:
>- Collected R-b
>- Patch 3: Update commit per Frank/Daniel
>- patch 8: Use priv->dsp_dcfg->dcfg to avoid adding "const struct imx_rproc_dsp_dcfg *dsp_dcfg"
>- Link to v1: https://lore.kernel.org/linux-remoteproc/CAEnQRZAOTFw=sBppHTYQAdfDBuNqkqk6gVO4FyP0EBsva3Oi+Q@mail.gmail.com/T/#m27c93af9fb1e7fdeb0766bdbffbaae39d79eefab
>
>---
>Peng Fan (11):
>      remoteproc: imx_dsp_rproc: simplify power domain attach and error handling
>      remoteproc: imx_dsp_rproc: Use devm_rproc_add() helper
>      remoteproc: imx_dsp_rproc: Use devm_pm_runtime_enable() helper
>      remoteproc: imx_dsp_rproc: Use dev_err_probe() for firmware and mode errors
>      remoteproc: imx_dsp_rproc: Drop extra space
>      remoteproc: imx_dsp_rproc: Use start/stop/detect_mode ops from imx_rproc_dcfg
>      remoteproc: imx_dsp_rproc: Move imx_dsp_rproc_dcfg closer to imx_dsp_rproc_of_match
>      remoteproc: imx_dsp_rproc: Simplify IMX_RPROC_MMIO switch case
>      remoteproc: imx_dsp_rproc: Simplify IMX_RPROC_SCU_API switch case
>      remoteproc: imx_dsp_rproc: Simplify IMX_RPROC_RESET_CONTROLLER switch case
>      remoteproc: imx_rproc: Remove enum imx_rproc_method
>
> drivers/remoteproc/imx_dsp_rproc.c | 342 ++++++++++++++++++++-----------------
> drivers/remoteproc/imx_rproc.h     |  14 --
> 2 files changed, 182 insertions(+), 174 deletions(-)
>---
>base-commit: 84d39fb9d529f27d2f3d295430d1be0abdae7a6d
>change-id: 20251106-imx-dsp-2025-11-06-bfe458cfc24c
>
>Best regards,
>-- 
>Peng Fan <peng.fan@nxp.com>
>
