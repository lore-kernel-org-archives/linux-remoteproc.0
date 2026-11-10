Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794318839;
	b=W9OQyd6CpP0DxB770uwg8BLAXSVCWbZaA9gxe0CUUDYx5wLk8aT9H3qYrcyQrnzmTQUw
	 kuH/qVog48ITxSHZihERgbwRbTR85gAVnXnIaaQbYKIRHPExA65D05qcGGPCLwN5JXHGr
	 UgtKL9s9JB0BVSmJ496BtMv/QzI8IDpY+dh9AT2Cz8JaoTi9h6BOlgbPFecRx8ZpTjFDo
	 mtRADKP+xEY54QLUhz0KS2GHWuxcqFNAnZnUs6OtJorqHz6/0wYdgSgWbcnANgEuvqOpE
	 Z+J6ZUJUW0lBTYtz5mBvH81ZRnD3AevUAjJQXEbzCpVHP1iiypJsq3oF2IqmfETb+3g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794318839;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=RUHCUODfuq1c64hGLlX0P/gNGeDJu9itr1RCJOXHwKM=;
	b=sm+pTJBO++w9oSyPha2aNLM5KI7z2VdOyvQAsmPJ/HlIQ2Tlio76oSWhMvULQZq1PGQ8
	 YxwLqONqeos4j5uxtQWF9kt8t36998E0s3t5HIVW8IuCXqvrjA2xOY8MmK8VT7EecT4dr
	 GCCOMDS4qlziUZIBuQhE+OMiaJsqLKyLBAd5bejdXy9CRhNL+D7XpSX/SsS/50Xs9VZqt
	 pkyqfTw7oTlh90XRZ1ayv66yUHWurwBBGdoa0l7O2og8+pnxItMP8EWWcldFmjp2gSAqS
	 4Zapv/3aaQAfJHNrU6JHc3gKWDnVhQtJYStXRDSBMCM/D2ROqN/E7Z9XF9LaGgTUbLg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=GpIuFKKt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.25
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013025.outbound.protection.outlook.com [52.101.83.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20BB0606A31C
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Nov 2026 13:53:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20BB0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=GpIuFKKt
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n/PSsFBqmmihppHbK5f6NpSAB/CkC5YxK15CxRdYYsD9tLcKaGIljrUwZjFenN8R5XvzaGzSeKREHI+UkvXcHVQlSg8rF73hhQs8a6dzWLEVDZ51Yd4HIMWn8u67I2b0rPlqgPqCW6svAb0a33QL2hzYJAUvHmDzBE0SQ4Hj/Z4V5rZ/5XH+D1ex1gEfWh5ndLLuyElAuHZ1g43jahK5BClwn6Gz7DGZJCxN/YNzuVdYafS/bIdXCIiTmEnoWn9uCBUjap68IjZoSo4aJnUu9USWKJTZEm+31OhcOWZrZyKjcDuRSylKgE9NqTNxRNh2MZzon/g70/zzVe9V5KVpgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RUHCUODfuq1c64hGLlX0P/gNGeDJu9itr1RCJOXHwKM=;
 b=pauUi/dvIq9JrO+T3tzfNfpi097CxirAUAR4wk2xOG4I66hDwC4ZT3Z8RhzC7bn4VaMz8dk59pD+gp6rGgv8mK2/zSJt5PegjY66WhclSe64kEarYuJhZY3pCBm6GDgzzC7N98fU92A9ZzRpOHgG/c/uDYJDCm1cR8Uxy7eb6oLv9x69puEwQiafd2QC38jkLJS5gMhtlmNvWQ7Yururgbf1qcT2QhW++ieR6gs8CaEtbySY3bcyu2omPMzQZ6uF++LwBt34fErvacwWRbWz8end3w14qGDV/yb/ZWtedJ6xuOH5kOjoczd4Z23wWh65+5cTtEMX4y3VgkL2QlaE5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RUHCUODfuq1c64hGLlX0P/gNGeDJu9itr1RCJOXHwKM=;
 b=GpIuFKKt9KVM2H14OSlWsKW5pIIac+5aA16W8ycSrcIKeenI+mfmuo+qUkZhfbouClQQITRzhveP4XkLrSUUKd4Mr2dABPt+Zgb8s4sWemH/e1gEAhlESyQhEFrq2j5tz3vUu4rUMQqdpKROPJZNbJbCX2ZQKfLTbqSLh3H/E1PkmbHYW0M3pJc3VEQk4pUSXebV/uvtKxX9HRwwBrUl1cLW1lALzYlzerw6ccsxp/pNuitbfKQB+paTnyk08qEs3W/n8iCcFho6UmifKi/0f3h6v2bWZUMnIsGhAEavNaCQFCO5Fozj5fFzvMqbFua/RLurXilherf7jOL+tj9Unw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DBBPR04MB7883.eurprd04.prod.outlook.com (2603:10a6:10:1e9::23)
 by AMBPR04MB12232.eurprd04.prod.outlook.com (2603:10a6:20b:75b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Tue, 10 Nov
 2026 13:53:55 +0000
Received: from DBBPR04MB7883.eurprd04.prod.outlook.com
 ([fe80::3a91:cf25:36c9:c3bb]) by DBBPR04MB7883.eurprd04.prod.outlook.com
 ([fe80::3a91:cf25:36c9:c3bb%7]) with mapi id 15.21.0592.012; Tue, 10 Nov 2026
 13:53:55 +0000
Date: Tue, 10 Nov 2026 21:58:49 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: khj <hj351016@gmail.com>
Cc: sashiko-reviews@lists.linux.dev, imx@lists.linux.dev,
	Frank.Li@kernel.org, linux-remoteproc@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH] remoteproc: imx_dsp_rproc: drain the vq work before
 freeing the mailbox
Message-ID: <avMjGRmXKL1xcNx+@shlinux89>
References: <20261110105436.2487822-1-hj351016@gmail.com>
 <sashiko-outbox-206921@kernel.org>
 <CAGr5VtP-Sb3k9dT5zuJ0D=AQYVfsBN4igVE2ocArZ3=s050rNg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGr5VtP-Sb3k9dT5zuJ0D=AQYVfsBN4igVE2ocArZ3=s050rNg@mail.gmail.com>
X-ClientProxiedBy: SI1PR02CA0020.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::9) To DBBPR04MB7883.eurprd04.prod.outlook.com
 (2603:10a6:10:1e9::23)
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7883:EE_|AMBPR04MB12232:EE_
X-MS-Office365-Filtering-Correlation-Id: 001945f9-0147-40d2-cb2d-08df3f320f96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|19092799006|261026121527099003|11063799006|4143699003|261021121427099003|261021123027099003|56012099006|261009223027099003|261022105027099003|261026140227099003|261022075727099003|261028144727099003|261102123227099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	FCnqfNGt/KUYPkEEozlP19EwnUwGfNJzIkxbB6a/dh6Zru87SnANDaKAPX0iE0AFIZQWzjvK85cbha39JJe8g0zkrD9CjJ0OSmbdqYHO28v5L0OiY1mYyI/of5ova+0+h92ROTXIhTouSaI8qvZgJ941jixJjaojvi1Qsux+FeEyoqFLy1yjb00YWIWf9Sruij/vgKxf1cYEFWb8JgqeZV+NNOkJI9uKgWLp1yC+6NEuu2xNzzh6GkvJrNN4h6OVBrg68XTGR4AKZKf5oJnCpb7FHsaob8xjHrVuBofEV/hLjrEc4FSoMr4dE9SwC80/IL2FlGHOSs5d94/xBdk/YtOzKQTmiOJwFarnnqE31wW5DYZGnIVll4dOE1ukdvzd8T4Y3nrxzidDHNLiaSGa8mT7Fhto2qk/Ld1JtFMrBdJHSpgAV3YvkAYfFhHAg9LLiY/atIXvX3BmzTDt/+Yo6gK+Dvb2mFFwnf6z0FzClCoNwZweeuZYc75J/ANr1OoqpaX74gqYpmiud40x0Ynp7CFb/AUzFWckugNVgrQHqP8HwC23cG3synkGsuACp/27ri4bqTcqdu3Ky28unLLmaUEzJaI/Hnm/+tQ5WMVTVZc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7883.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(19092799006)(261026121527099003)(11063799006)(4143699003)(261021121427099003)(261021123027099003)(56012099006)(261009223027099003)(261022105027099003)(261026140227099003)(261022075727099003)(261028144727099003)(261102123227099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QWFRL0VPVXBSUEdqRGFXcWdFSnZ0aUFTQll3YmQwMlBoVmNwQXp2NnlNYXNL?=
 =?utf-8?B?bjhkOVBtenc3SzdkcFpHZGVEbjBUbjY1YnhTTGNvSFVicFY1OUQrUFZiSWtD?=
 =?utf-8?B?Q0Vka21WUGZEWXNOQis1eVNFTGZkd05YZ09idVhjV2lwc0RiaE4xT3ExcXV2?=
 =?utf-8?B?T0JUejBLUGpCSUh5Vi9IT0ZFOHRDTitQQUlYTWVwTWMzaDdIQ0ErOUw4YWpv?=
 =?utf-8?B?NUsxVTJvQWtuS3pNWjFSRlI2ODJmVEpHMVlJV29BZGN5MThRVlBXMHhqL3Y2?=
 =?utf-8?B?MU9jMkljMlFwRTBnbGNkNXNTOWQ2bTRmcnRleWtNa0gvWU9vS3pldmsvcmZH?=
 =?utf-8?B?M2NlMWJIWlFLMkxtR3N6ekFXVEpqZGQ2SXJrOE1EUFZMNkFmdHdaMWNiOUtq?=
 =?utf-8?B?c3dZK3JBYnpXaHNhZGxaWUE3OFdXQzlBaC9yOHQ3dm9pbzUva0dndWRlTXBW?=
 =?utf-8?B?Y3dqN21QT1d5c1FiSVFPVkxBSlZ5S0U3UTdXUGFseFVZRlNTYld1eGRIVGFk?=
 =?utf-8?B?MDhURUxWVXJmTWN0MDhoNkhJanBCcDAraExwTGV6SE9IWHJFSEZEdlFQQ3pQ?=
 =?utf-8?B?bGdWbHJJVGZNWEgzNFdUaHluZzZ0MVZjM1FjbDhXWGdZMEVHSitvNnBQQ3J1?=
 =?utf-8?B?VGFVb2xBbUV5YWI3TGlxbkk0bmlqMjN0d2J4WlloaUZFcjIyemtYaEZOY2Vo?=
 =?utf-8?B?QzZOdTNsRkpkUlFHeEp5NmtGWmRJZDZaSnRUa0FBaXJKTlhnQy9SSFd3YWRl?=
 =?utf-8?B?ak1qSTlVUjdWaWx6cEpmM1VjY2h0NVBRVnRFMzM3bWRXR3Q0ZG9yaGM1a25X?=
 =?utf-8?B?NTBQWUk4Zi9OSGJab2h1UmpnRTJ1RGxJZ1pzUUhnMjkyVC9XTEV3NExUVUdq?=
 =?utf-8?B?L2lMTUZWSHNLY2F6ZkpFR1p1bFNIeUV2dnYzZmVNY0w2NUxPbmtDY0F2S1p1?=
 =?utf-8?B?Uk1WbG9YMmdxOFp4MHFJOFZUdWIrZS8xNzRIRW9JbERVSUNJWGFIcElPRUVF?=
 =?utf-8?B?bUIwSDJqdTE1YjNDNm9pZnFvblNjKy83VE5WbGhRcEFraGVrZnBYWDdUOUh6?=
 =?utf-8?B?ekw4cjRLOE9KNzRrRGhtQlpISHhBRnhUVnE1OTI2THY3NU9zSGZBSzBtK0ZU?=
 =?utf-8?B?em53OWtlV0E1SnRWd0I0dWZQT2NaNysyVGI1U1lvZGJqeDdlckJncmhkd2Ur?=
 =?utf-8?B?Y0NXUmpIRmxZb1ArOXkvbHhTS0pFV1M4eHBYV2hFREw1eXc0SHBKWm9XTmk1?=
 =?utf-8?B?TmlycWpPUTNvUVFieVYvZVBiT2ZUemZHMFlWbFVtQ0Y4N3lVM2Qwek4xTVU4?=
 =?utf-8?B?QkRUWExqVzFDRnZ2M1EyYWFrcmRUOHlIZis5NitTeGp0bXZKSkthWFNuNVlq?=
 =?utf-8?B?a1dsSVJ4VkovUDZaNE5kOXdrY3pORU9WMGNRVTluVXhIakNsSW4rUUZhR0tX?=
 =?utf-8?B?QlJLb3U2NW5lRm9ldm15QXA4ZDNXYStNRFRNK1k4YW9lbDNCOC9EYnEyOUpi?=
 =?utf-8?B?ZlNNS0dVbTF1MnlrTzdGZ2h4am5ObW9SWHNVRHRYeWptbml5UEs5RVBTeWNV?=
 =?utf-8?B?U2E0TGI1MndOWmdPeTRVQTRLZnU2YWpEQ2RvSE1oQU5jY3JJa3N2TWllOWlo?=
 =?utf-8?B?bDBXOFJQVTIweWVmL0hJR2w2OTRNK1BQZjdYVzZEN2swelZVZy9tTkpOeU5C?=
 =?utf-8?B?RTM4RDRrNERRYjRBQm9tYmYzOTRLVHpqVGx3b0ZrY3NmNUtZYnh4WVplelp4?=
 =?utf-8?B?VHBBQnBHZXpIRjlST0RUTHhHKzNQK0d6S0xMaHFabmZybE03b0Q2UFVYU1Jy?=
 =?utf-8?B?VWdWalNvZlJ2Z3p1dG5iSVpqUFMrUC8wK1B1UmQxQ3ZkVVc4US82RWpuai9F?=
 =?utf-8?B?VmtlWU1zcVRqNlBsa1l6Yzh4bzZpbVdHUEVhSGI2NTFlWVZublRmYXVJc0NC?=
 =?utf-8?B?V2xaRWpvalh0a3BnWlpSNGNsTi9XTzk2UUxqK3pHMGg3ckhqd2VsMkVQYmx5?=
 =?utf-8?B?SDI2RlhiN0JHektNbUdIenBTZTkwdDlwVEdGOTdpRXdlYzNXYytSTjJYVjJ2?=
 =?utf-8?B?aHBNcGhwUVh0Nk5Bcm9yYTYwSURSbnpHc1g2clV5RDdsNFlMTEt2UmFDaDEy?=
 =?utf-8?B?Nlg4THg3NHdtWDE2dWJGRkxRNFlsd2xReWpFbVNsYnB5ekx0UHBCRHRWblFj?=
 =?utf-8?B?WUdaTGJneUpocklPZW1GNjluZ28zTm1mdlFwYVdtMWU4eEZPYndmNHNDMWxP?=
 =?utf-8?B?a0dLM2wweVZMWTkvSjloeExqdnU2ajVCenF3czNiQlhkdzRlOGRxVkFrU1lr?=
 =?utf-8?B?aWxBRDVIK0VjZW8xUHRvTTZEa0JwZU1QdVdZbWp4ZnBabVFMNTRFTHBvSEd0?=
 =?utf-8?Q?JT9A+1g+84or625jJfuLdE9yJxKwL5VzXaj3P?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 001945f9-0147-40d2-cb2d-08df3f320f96
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7883.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 13:53:55.3883
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o5xS0+JB2GP46PVSmY40oTwFDJeGxYm6r/jcC4EZO0lvTnxf86gSW03FffWQsUuVWBiSDAyhEBRWhPvuUhanpHd60n+1oZfmhy3Y1jLioUC33/GlOpvcTrhbg6qhfxod
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB12232

Add back remoteproc list.

Peng

On Tue, Nov 10, 2026 at 08:40:44PM +0900, khj wrote:
>Thanks -- both are correct, and my patch is wrong.
>
>[High] The AB-BA deadlock is real. imx_dsp_rproc_free_mbox() runs from the
>pm_runtime suspend path (__rproc_shutdown() -> rproc_unprepare_device() ->
>imx_dsp_rproc_unprepare() -> pm_runtime_put_sync() ->
>imx_dsp_runtime_suspend()),
>and __rproc_shutdown() holds rproc->lock across that. imx_dsp_rproc_vq_work()
>also takes rproc->lock, so cancel_work_sync() there waits for the work while the
>work waits for the lock -- a deadlock. The cancel must not run under
>rproc->lock,
>so it cannot live in free_mbox().
>
>[Critical] You're right that the unbind path can skip free_mbox() entirely:
>devm_rproc_add() is registered before devm_pm_runtime_enable(), so on unbind
>devres disables runtime PM before devm_rproc_remove() runs rproc_del() /
>__rproc_shutdown(). pm_runtime_put_sync() then returns -EACCES without calling
>imx_dsp_runtime_suspend(), so free_mbox() never runs -- the mailbox channels and
>rproc_work stay live while the rproc / imx_dsp_rproc are freed (UAF + the clk
>leak you note). So my one-liner does not even fix the unbind UAF it targeted.
>
>So this needs a teardown rework rather than a cancel in free_mbox(): e.g.
>reorder devm_pm_runtime_enable() before devm_rproc_add() so the suspend path
>(and mailbox free) actually runs on unbind, and drain rproc_work from a context
>that does not hold rproc->lock. Since that touches the driver's probe/teardown
>ordering, I'd rather not guess at the shape -- Mathieu, Frank, how would you
>prefer this handled? I'm happy to send a v2 once the preferred
>direction is clear.
>
>Thanks,
>Hyunjung
>
>2026년 11월 10일 (화) 오후 8:08, <sashiko-bot@kernel.org>님이 작성:
>>
>> Thank you for your contribution! Sashiko AI review found 1 potential
>> issue to consider:
>> - [High] remoteproc: imx_dsp_rproc: AB-BA deadlock in
>>   imx_dsp_rproc_free_mbox()
>> It also noticed 1 related pre-existing issue this patch does not
>> introduce:
>> - [Critical] remoteproc: imx_dsp_rproc: use-after-free and resource
>>   leaks on unbind [1]
>> --
>>
>> commit 17e3fec9a8c6e436afd532f653405b5a78e316af
>> Author: Hyunjung Ko <hj351016@gmail.com>
>>
>> remoteproc: imx_dsp_rproc: drain the vq work before freeing the mailbox
>>
>> This commit calls cancel_work_sync(&priv->rproc_work) in
>> imx_dsp_rproc_free_mbox() after freeing the mailbox channels to drain any
>> pending virtqueue work item.
>>
>> > diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
>> > index 96d619daf3f5b..89c72d916b1e4 100644
>> > --- a/drivers/remoteproc/imx_dsp_rproc.c
>> > +++ b/drivers/remoteproc/imx_dsp_rproc.c
>> > @@ -642,6 +642,13 @@ static void imx_dsp_rproc_free_mbox(struct imx_dsp_rproc *priv)
>> >       mbox_free_channel(priv->tx_ch);
>> >       mbox_free_channel(priv->rx_ch);
>> >       mbox_free_channel(priv->rxdb_ch);
>> > +
>> > +     /*
>> > +      * The mailbox rx callback schedules rproc_work; the channels are now
>> > +      * freed, so no new work can be queued. Drain any pending work before
>> > +      * the rproc (which the work dereferences) can be freed.
>> > +      */
>> > +     cancel_work_sync(&priv->rproc_work);
>> >  }
>>
>> [Severity: High]
>> Can calling cancel_work_sync(&priv->rproc_work) in imx_dsp_rproc_free_mbox()
>> cause an ABBA deadlock with rproc->lock?
>>
>> CPU0                              CPU1
>> ----                              ----
>> mutex_lock(&rproc->lock)
>>                                   imx_dsp_rproc_vq_work()
>> cancel_work_sync(&priv->rproc_work)
>>                                     mutex_lock(&rproc->lock)
>>
>>  *** DEADLOCK ***
>>
>> CPU0: __rproc_shutdown() -> rproc_unprepare_device() ->
>>       imx_dsp_rproc_unprepare() -> pm_runtime_put_sync() ->
>>       imx_dsp_runtime_suspend() -> imx_dsp_rproc_free_mbox()
>> CPU1: process_one_work() -> imx_dsp_rproc_vq_work()
>>
>> Because priv->rx_ch remains active until mbox_free_channel(priv->rx_ch) runs
>> inside imx_dsp_rproc_free_mbox(), an inbound mailbox interrupt before or
>> during shutdown can queue priv->rproc_work while __rproc_shutdown() holds
>> rproc->lock.  imx_dsp_rproc_vq_work() then blocks on rproc->lock while
>> imx_dsp_rproc_free_mbox() waits in cancel_work_sync(&priv->rproc_work).
>>
>> [Severity: Critical]
>> This problem wasn't introduced by this patch, but can unbinding an active
>> DSP remoteproc device skip imx_dsp_rproc_free_mbox() entirely [1] and
>> leave both the mailbox channels and priv->rproc_work active when the rproc is
>> freed?
>>
>> drivers/remoteproc/imx_dsp_rproc.c:imx_dsp_rproc_probe() {
>>         ...
>>         ret = devm_rproc_add(dev, rproc);
>>         if (ret)
>>                 return dev_err_probe(dev, ret, "rproc_add failed\n");
>>
>>         rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_XTENSA);
>>
>>         return devm_pm_runtime_enable(dev);
>> }
>>
>> Because devm_rproc_add() is registered before devm_pm_runtime_enable(),
>> devres teardown disables runtime PM before devm_rproc_remove() calls
>> rproc_del() and __rproc_shutdown().  When imx_dsp_rproc_unprepare() then
>> calls pm_runtime_put_sync(), rpm_suspend() fails with -EACCES without
>> calling imx_dsp_runtime_suspend() or imx_dsp_rproc_free_mbox(), leaving
>> priv->clks enabled and the mailbox channels and priv->rproc_work able to
>> dereference the freed rproc and imx_dsp_rproc structures.
>>
>> [1] https://sashiko.dev/#/bug/linux-a6e902ee-9958-4d44-96cc-d854c6256124
>>
>> --
>> Sashiko AI review · https://sashiko.dev/#/patchset/20261110105436.2487822-1-hj351016@gmail.com?part=1
>
>
