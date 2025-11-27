Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013017.outbound.protection.outlook.com [52.101.83.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12DAD31985F;
	Thu, 27 Nov 2025 07:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764229702; cv=fail; b=oOOjGvvCVvwsbaawRACeUqYFu4hTm7Hu+eQXt854mAoAQFoZkG7Uq51i0ijJxpGnpYtcLa2+l5AXpKTIRPxh6Nm8x16VCkqpd0q6Jk6bBxhuXiNOrxbEUXMCJSAdRhRjnoxy/j8oEVAY++EO8NwRUaNmkdiuh1IdQ8oKWi2njB4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764229702; c=relaxed/simple;
	bh=bs6EqFYlqhk3dSup6y+fq2ImjmbAE4lbs3D62vAjHLs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ZzuVVxLI/td3RCvPKpDra0YSopn3XhhbpM+ndacZQpVRxTrIkyqqMcoQq2/T5rjUhxcbuEbtPlj+FyquBXs5l92ct2TGdgZQdD6EaSuKQBBaQQuJPsrMLC/EG0p98XPeUxdqxv5/w8RNuGReGp1PfvOzPP533S8mXkYStUvW2DU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=RjFD6Tzw; arc=fail smtp.client-ip=52.101.83.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="RjFD6Tzw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DQIKepmVmmplm01HJWtHHwUeP2NWelWSTDdHUIY1gM5SY6QrAwoLp2JKnC6Fb1y/M+weeeLfcYNQeIcXR7qIau5Ygr+fiZxSV7i1E8gd0z44xRlUzMMwh/xl+Sjz26pn36lQakeuReur54Nk4gU0sV67w8X4FpQT8tyUxl8rDKeROvvGFNH3aVfqJH3ncrVbrX50ra+17g5fJVg//nJvZbJMRp3YNCjcAm6IxRPd+wOJLQk+YNw+lXCymbC/Wj+MMebtC5nXkdQKkqIA6A+oHf8Wv8NEjLfJ9nG5ZUhuelhBKNndc1hVhp0aOdCmWh+eGfTMRGe1W0d5mS3E6RugWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZlHFtaxd6skkyb9Wc9S09oZ6WgAdYuksjBkywB2kBLA=;
 b=JJ8vVWx0ImwibSfvld/A/7bGrqkB6CKq1jyHajoH70kRx10PuOPyqv3ho60zgL1D4Uv6PGD/Fju6FUtjEeHd+HG7S/9j+5ezJCSDY3FZfZeEDuViimBdpBynmhOa7w1/lzUITpwoQ+JQ3FkHe7fcNOeqyd+8oP7f+xE2N7Udind9jEFEspl0IPYxEXVm3sYo/qgdq/3J+pnloCENGva00rNrWvw+IawmDBBVe2Z/DTVDhMBI0sie9iaOpcCRWv6vJhSV8vY9TrQV8YDZv/qrKGF34XuHmxSxiKWEa//T9hVgH6bJfLcFxh3J8g34FBlRLKBoJSUi0wh0E2W3hmx+FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZlHFtaxd6skkyb9Wc9S09oZ6WgAdYuksjBkywB2kBLA=;
 b=RjFD6TzwGXANdZVPm89blFL5vLVu23vEcD54YMk0cB6WtRxDFuAzkAUoJMuTYnuY2X+emF05Sj4cZkw06OY/mdRNB5/CjJQIKlC0BbHFiWuNNYES9O1VORcvP/HcmiWOPOyEGC90zv4siBNF4RhfAMoB0UmTKv9VSzUt2hXfr8nlRpQMFOKvKNz2dzgefoUvVHErGl66JxO1uyJPmTFO1tKZlxv9fX/kQjfwnb3VX6V4/wAWIbJVWhqmpSq4ZArLYGy44ygKNkLMDJ6R4Ag/bKrc6xum9HJ/Lmwxv2ynE+tyGsLLaVhQLXoH6PFGM6Bm7dGyyXXwZaSIVdVuQzpr7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8903.eurprd04.prod.outlook.com (2603:10a6:10:2e2::9)
 by DU2PR04MB8725.eurprd04.prod.outlook.com (2603:10a6:10:2dc::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.13; Thu, 27 Nov
 2025 07:48:15 +0000
Received: from DU2PR04MB8903.eurprd04.prod.outlook.com
 ([fe80::e980:b84e:13f6:1384]) by DU2PR04MB8903.eurprd04.prod.outlook.com
 ([fe80::e980:b84e:13f6:1384%7]) with mapi id 15.20.9366.012; Thu, 27 Nov 2025
 07:48:15 +0000
Message-ID: <52392a6b-2f9e-45e9-ac18-0b4cb48d0597@nxp.com>
Date: Thu, 27 Nov 2025 09:48:13 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH next] remoteproc: imx_dsp_rproc: Fix NULL vs IS_ERR() bug
 in imx_dsp_rproc_add_carveout()
To: Dan Carpenter <dan.carpenter@linaro.org>, Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <aSf6OerBbPcxBUVt@stanley.mountain>
Content-Language: en-US
From: Iuliana Prodan <iuliana.prodan@nxp.com>
In-Reply-To: <aSf6OerBbPcxBUVt@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P189CA0017.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5db::7) To DU2PR04MB8903.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::9)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8903:EE_|DU2PR04MB8725:EE_
X-MS-Office365-Filtering-Correlation-Id: d82c8ef3-ff35-4b84-cbf4-08de2d8952d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|19092799006|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aVR3T3pBd1lrd3JFbzg4N3pVR1FzZnRnbE50bHVsTXNJRUprV2c3SGVuMTlj?=
 =?utf-8?B?Y09mbm1UcUdnRTdac0NHWk4wcE5Wa3hnVGFURXgvQXdwQ2tGQ0VsdnpCZmhU?=
 =?utf-8?B?VHo5NHdJYmNVQUdVNU5nQU1UTWpjeDRMcnNpOVgzenF0SmVDSUdXckpiWmhh?=
 =?utf-8?B?dC9ralVGZFNzVzNKOWQ1VzFCTVI2Wnpla0IwaUhTNGhZbkE2bXpKYWE2L2RE?=
 =?utf-8?B?L0xZV3BZVzdiQ0xTRXBUdjNZbFJxNVp1cFErWlhweUIzNlVoOGlWdUNQZG9E?=
 =?utf-8?B?aENZZUt6eVZVMkMvOXNaaEgrd1E3MmZBN1JocmdleTVhMG0wcTRuUjZ5cGkx?=
 =?utf-8?B?bm8zdTBlWVdTeFRBNzlJeGRMVGRLKzZIelNIVGRGMzA0WXZmQ1lrTURXeGJR?=
 =?utf-8?B?bDZLUVUrQm91R04vRG90SUdUeXpXUEpPL2c0a0NFRDVrMGN3TzNaWmNETEsy?=
 =?utf-8?B?Z010bFk5UTFYWWt6Mm8rcWNTRXRiMnFhYVdqWkxveUxSM1RPM2FIY1Zldndw?=
 =?utf-8?B?YnA5NktqQXltQldWeTB0VzN1L2hYTFRuTkVnRHZQNGcrOHlOR28wWnRwdE5y?=
 =?utf-8?B?L3VFZ2EreGFMcGN3QTZMejl0OHFmQ3g4cEhxdGo0bkdVK2J3em1wS2lTU2Z4?=
 =?utf-8?B?ZllyTVloSjdCOUVGMTNyNG5SN1FSME5kWGYxUkZOSlUxeWgwU0srOEw3bTZP?=
 =?utf-8?B?QTVZdmVrcHVubzNFQWdYamRFUGF1Ujdma1dORmFiNXF3dHlFREZ5aTE5K2xH?=
 =?utf-8?B?UzQ1bGw3bVBmRmxSMktaWWdyNSs3Skg0a3JVTW0zdHYzVStjUDBhRzBwNko4?=
 =?utf-8?B?Y1d4amRtNnc2eUdKSWhNMTNvS0ZXZS9pazdIK3YvREF2cUltOGMzNUpQSVJI?=
 =?utf-8?B?SWpNaHhuYWliZk5zSmNzaDNYdHY2NEpNczRVMnZVOXRjVCtaYmljODVxem5F?=
 =?utf-8?B?Tzg3R2dXT2QrTjc3blpFczQrOVF3TUlZV1E5MXJCNW93UmQ5RjN0ZlhCUytC?=
 =?utf-8?B?cmNqUmpHdCtWNFlKSWI3STdIYThNa0MvV2ErZGdBMm5IMk5HbHRoM0dXWS9m?=
 =?utf-8?B?T3pIaDVITHorZnVJY2pzMEhxU3NyVWk4dXl0a0E2VzgwK21wT0xJdUhVUEhK?=
 =?utf-8?B?anpKaVB1SEhKWGp2bEFmQnlSMFd2d1Vwd3dSS3hYYnB5YTc3VVIyUHB3TjlW?=
 =?utf-8?B?dHFqdldxTDZUN1FCTy9KaU1tZVZrK3J1UTh6VlRwemZmdExNT1VNRGtqMWUv?=
 =?utf-8?B?Nms0OUsyRU1lSU56Slg1L05HQ3JUaVZMbEhCc3Vkbnp1blR3b3lNUTRDbHdq?=
 =?utf-8?B?NVpLZk9DOWpra3hwenh5bFlEY002alJNb2xFbVltOFVGb0R5T25HUHg1Q0Jn?=
 =?utf-8?B?amJxU1RkNzZENWhNQ3ltWFJCbG8vRWZiOFRyNEhuQ1lYSkFZWCtNbHhMaXBK?=
 =?utf-8?B?VmR4Wkhhb2lCazZyMUp4cVdvWnZBa2Q5SU9SUDBHYTBuZTlUcWNaWCt6ZG5k?=
 =?utf-8?B?VzN0V1g3cmRURDl6cDRBVzV4TTBobVh0b0ViM2VDR1JzdytHcXhYWUg2cE4x?=
 =?utf-8?B?RUI4ZW10d0NncEs0azltRitGY3RPUUdBdkFBSldyUXB3SHZQWVVRUERGMThq?=
 =?utf-8?B?cWhSSkliTld1MGJXdmNET0owWjllTmNUVlJ6NHJTRzZzazBLSTBvdXBrYjFY?=
 =?utf-8?B?YlJyMldPSjN0Mm52cG4rRVFUTVNKVE5kd3FrMjJkODIwYXJpR1VXU2ZBa1p6?=
 =?utf-8?B?R1BJUFV2eVJRNTNTK20wSEljQmdNNXdxWW00N3QrTjA4UzMwbDROZmFsQjBC?=
 =?utf-8?B?ZW91cUwzR0tteWtlaGpuL3BKV3BtYUtxOWp0Q212T1pNa1kzZ1d6eFBZaHE0?=
 =?utf-8?B?Wlg2NThMRVlvclM2YmtJK0F1NHl1dGZpOXVHZGRtNFE4NHBGU2E0RCszaFAz?=
 =?utf-8?Q?J1gCl8SITw0llpzpfTeDIyL7nMECh10g?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8903.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z0Z0TGFMZjBWaG5mSmR4ZXVxMkIvQm0vd1lkNjUwOTJ6clp4NGt6TlFkZVFl?=
 =?utf-8?B?QTNxNTFvZ2pQa2owTVB2aWxPRE9tMUJFUWprYjc0NXgzR0o3R1lTcVVPSkhN?=
 =?utf-8?B?azlBK1dkRVU1c1lvTEVNb1FZT2U2T2FBK0hscVBjQWFNVmVycXUvU20vMloz?=
 =?utf-8?B?N05Xc2RIaVlWWUg4MHVmTkMvMmkydUg5WUdybW5uS1JvYVJ4c3B6ZUFlSUJl?=
 =?utf-8?B?NVZOTE1vYzFleFpVRk5IQTAxRExqRUJEa1VXeVV1UXYvWFMxR29Yam5yT1Qw?=
 =?utf-8?B?YUNsUnJuNG85UzZpdUF6YjZ1SjErb1FHUUdPUm1LYXlaVitmNjdETTlTM2JW?=
 =?utf-8?B?ck9abkErWjE1d1hWellTSm5tTURIdVBnYS85NmV0eWJMSkhHc2htRDZwOHdN?=
 =?utf-8?B?NVNDa1lpMmUvT29tRzJNeDVXTVpEOUZ0dW94TTFxRmk1cmJIejJLdTJ6QXVB?=
 =?utf-8?B?KzBEeTEvMVgzYlZyQkNsTWtXS1ZZdStlUmtNakl0Rnd4TUUwU2ZrNHNpNDRM?=
 =?utf-8?B?bVVFcm9SZFhhbmE1RFpQaHdJc1lmNFlTWUMzODE1SDk4SFd0SVR0T1F6ci9W?=
 =?utf-8?B?RnVGWFZkNG52QzhoMS9DampvVG11RGNoMWxxbWs4Y2NMcXZkWEhMWVJXZHZH?=
 =?utf-8?B?Z3FhZjVRaFAvS3RxSDNzdzFKaVRDQ01LMi9MUCtIbEt3R3lBaHFzR0c0NGJN?=
 =?utf-8?B?R1Q2OXFoUkVxUlZJYjQ2UTdKNmw5dmdiQWZWbFRKbmxCMTM0OUFoeHFubytF?=
 =?utf-8?B?OVpnN3pUcWpNQVlVTkM1MkRQMTZHYktERlpaVFg2UHhXdkxSdkdXUEpRdVJS?=
 =?utf-8?B?eFFxQnhDZ0crNkhOTXJGS2hHc1I2Vlk4OXdwMTh1S2txOTg1RmsrTTBYMFd4?=
 =?utf-8?B?RDZtejFtU0pJR3lyM0tEZnltcWpYNG5ZaXN4dWVMVUJlY3BibHQ3UkhwY3N2?=
 =?utf-8?B?VytHcHlwNWl6Mkt4ejlKSHpNL0d2cUpNOW00bEhMUnlZbkIvcTFweGpCNWxp?=
 =?utf-8?B?bjdPZGpsaEhnNVRyR0NaSnNoUWJTWVNzbWlCZk41SS9xRndYYTV1QjNRV1Y4?=
 =?utf-8?B?WU5LWXI2cDJJamR4UlJ4TENhdkc4MG54aGRsY3Y2dU5idHpMYmVwVFNhejM4?=
 =?utf-8?B?UGpQeUErSm1yZEUrNjM1RzhHZWw3WFluZ0JKVHFkQTE3aklleVhZOXlIcnRY?=
 =?utf-8?B?ZFVDWkdkazIwMnFLRUllLzhBSlZqL3dJNjRQNDdDMUo0UFJEeFRMc1BwdlBT?=
 =?utf-8?B?Yjl3N0xwMWd4UytDWlBEblp3WHVRaVVrVGxpdk9JcGxWcmxFL0x2S0NXSTE4?=
 =?utf-8?B?QVRtR3Y3Zkg2bkVERFRzUUxqZ2FQT3JITG9CUk9iNUY1L3QzcFY2UlJnT0tt?=
 =?utf-8?B?RzFnNlJaZXdlaHVyU29MTE9ob01LcnFkVG5XWUxZWThmYVh5L1Raekh5N1c2?=
 =?utf-8?B?RTJUS242L3Y3Q2swdHBRbGZlRy9uUjArWG5RbmxnS1lpWm5tTnpxS3dpcnZI?=
 =?utf-8?B?ejJsQ0RnSVd6LzZLSWx0SmNqQVZGbnlzWHNiUTg2blBlRTNJNVl2aUdVVVNK?=
 =?utf-8?B?K1VJU1dpSlBMZW5hb3JFY3VEcWY5bEE0d2NKSG1kdGJjTER3S2JtOEVua01J?=
 =?utf-8?B?L0hCbUdnSXpiYThxaGx3c1dDSWl1RlVjZ1lzcUM3a1lCeVM1Z3Ywb3FlL3cv?=
 =?utf-8?B?OFBSOGhsSzRQNlEvVlNjM1FWSUt5YmdxWU1ON1V5U09CSnBkUnIrZEcyQVZD?=
 =?utf-8?B?M0NBTTZHZTh5eURmVnlwS0h4QytYaUFucGVNWGw1eDVkSVpWcXZOV0ZLVE5y?=
 =?utf-8?B?NE81STB1eEZZbmpEc2Z2MjlUaWU3NDNFOWdWcVZ0aWpoUHlONGlnY2IyL2lx?=
 =?utf-8?B?TjVtc2lISDZiK3N5aHJPUkxEa0VTWStML2tGT1h6ZjdOSHdZSjB0UGwzOTRK?=
 =?utf-8?B?bE54RHBuMnhnMDNBRjdpcHFqaTlocElzbCtaTHVuVmdOUTlkTzBwTnAyVGhj?=
 =?utf-8?B?RlFoL2xOT3djVUVjQ1NST25ZQVhQdDE5d2d4VGVmUUFueTNBdlNGVHZNQXJR?=
 =?utf-8?B?MnlKY1ZhSWQzQzNmcnJQNFNhOEVOWTZuR0hWZEV5blVCWGhNTEZ2eE9qM2o0?=
 =?utf-8?B?N3dwblNxVjM4NDlSOXpzSHRpMVVFcmdBK2ZEa3dxNUQzb1dJQzc5QTE0QitK?=
 =?utf-8?B?Ync9PQ==?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d82c8ef3-ff35-4b84-cbf4-08de2d8952d2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8903.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 07:48:15.7760
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hqbOE01hIgKL/sP4Xaijwh13lt9OP6dB5GYAQgyQY+IfOkPrdmkzEgOlGo5yhMl19jnCRvr1+/0ScFaWNRug6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8725

On 11/27/2025 9:14 AM, Dan Carpenter wrote:
> The devm_ioremap_resource_wc() function never returns NULL, it returns
> error pointers.  Update the error checking to match.
> 
> Fixes: 67a7bc7f0358 ("remoteproc: Use of_reserved_mem_region_* functions for "memory-region"")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>

Thanks,
Iulia
> ---
>   drivers/remoteproc/imx_dsp_rproc.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index be83b5f20f15..5130a35214c9 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -710,9 +710,9 @@ static int imx_dsp_rproc_add_carveout(struct imx_dsp_rproc *priv)
>   			return -EINVAL;
>   
>   		cpu_addr = devm_ioremap_resource_wc(dev, &res);
> -		if (!cpu_addr) {
> +		if (IS_ERR(cpu_addr)) {
>   			dev_err(dev, "failed to map memory %pR\n", &res);
> -			return -ENOMEM;
> +			return PTR_ERR(cpu_addr);
>   		}
>   
>   		/* Register memory region */

