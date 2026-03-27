Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010047.outbound.protection.outlook.com [52.101.84.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC63733D6EF;
	Fri, 27 Mar 2026 09:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774604552; cv=fail; b=TtzRMOWWziJ6R+uBYykWIIOapfCIeovYsZE3S4N3WIacgT43Oyb5KNo5Joe7IMzFlGwdACod+dWP7R9ZxfqSixwL4a/THLFq4SthcSGVQ/ALibOL84nIwVVAFP0HZ7pH08RZ6juKO8BVpERPPHJgOv9N+b1YEgQSvTgp3Tm2JQ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774604552; c=relaxed/simple;
	bh=BoCvmvnw1L4SpwgVWCjMpEtxh+FYcFWShW60pzAGSl4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Gnl5bkKMmfDZFB4XFdafG4FTT88pxHUwve3lNU2EJccP7ACGqxT4gZoF/rLGVLPD7J03xeiOdk79xsGyR+a+47mKBQQ25Ms4yynYfzl5Cljfo5wBbP77ITblDALguRFKQKkd6Dmew4j7QKH6tTOqLRh8LWaeRzRYsvQN9V+1mWw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=oTxMqmvw; arc=fail smtp.client-ip=52.101.84.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="oTxMqmvw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UZ0fD2JmDz0k7qWahBzKdSpRwF7wyE1rcILQ6jNwEwsw27JZSsQWI6ij6rwrXeFngOdTTSz3uD8Yix/vMTS2hIYXOQQsMUUp/IlIaGa61SeIoL7tthSRqlNKup7jZ5BKTy1tIEwPYm37MmXeqm2wTzYZfqFVz9IyY6GHZws6eato9H2jDcKOGpkATh8NJPOYskod0xPC0NEnb34o+KTSkXzc1Pw3yo0kQbvvM/ZkqedXp/slFh9vjFoYzg+Pg8XAm880wGLpPHNHIPqcXvW5MUfBMU+kI8m3EKSNauHZ8nt6pCRz1dLyRO2Qy7J3TKddLZis3XOtRtVmWceI7kdxsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OhaQIkiKd2ge4UuQLwoE2/xk3XAj92+vrroT4UJHCjw=;
 b=dLil5H4UOT8r9How8C52R1KHyqOu3TBCM7qvWQWgM+zbV6T2k1QEhJWtIqwF98RF/EE6c0Cd3HSAV57RFn9RQm1ViFwO2Sdg3WNL0DW7/saftIakTDEvkQWljBIZX6uCGgnWhG1bGymcy13wviAOmsoTq0UkFtouSbGPhburd+5b8XYIfKf/EItNP9VM1LAemsUU8eJKU1iRPjbGlzIfWe+Iuyyv3LsHfkkP/uv/7FcIyphsjVm8u2Loke9RI3bx8cpnTpiT8goANsMdIkS/cVdG82YV3zSWhvFmdc0DzmiE2kJLd4Cx1QsVRahSfjhin1T40h7c5Yp1N8QDfwwowg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OhaQIkiKd2ge4UuQLwoE2/xk3XAj92+vrroT4UJHCjw=;
 b=oTxMqmvwqH4rfMKlaMkeT/VjGoHjw46CMAoivyPyNnB/jPYIi6uY4fS3j24qmPBSM3Tt+GBphLBD6j5J0eb8ALeEtKbasbvYnQjzq5/z0vfpsvHHnKnKf3y9CZzxc4qP1qmMA/1+XzHaCFJrQdTsIv/m5VsPWi3ZPbcJdl/xllt4YKHRxyMQZOHsB+bsmncQivEsINhgsacmJxt2eL2bslveYUWhfDUx5ND3urliTSXOF2SgTEMyDrBOS1H8m6UVC1XdpuleEoVOsNULD92lVHbcF47puNFOm8ZQUJgKdhdBCfqh1lXl0FnNIsmMsDc0QSw6uBIiZVPlnfNvEW0B6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
 by AM9PR04MB8682.eurprd04.prod.outlook.com (2603:10a6:20b:43d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.23; Fri, 27 Mar
 2026 09:42:27 +0000
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4]) by GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4%6]) with mapi id 15.20.9745.023; Fri, 27 Mar 2026
 09:42:26 +0000
Message-ID: <95345671-bf1f-4df3-ad72-ec38d6ac7f2f@oss.nxp.com>
Date: Fri, 27 Mar 2026 11:45:33 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] remoteproc: imx_rproc: Pass bootaddr to SM CPU/LMM
 reset vector
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
References: <20260327-imx943-rproc-v2-0-a547a3588730@nxp.com>
 <20260327-imx943-rproc-v2-2-a547a3588730@nxp.com>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20260327-imx943-rproc-v2-2-a547a3588730@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0399.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cf::8) To GVXPR04MB12316.eurprd04.prod.outlook.com
 (2603:10a6:150:2c6::8)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12316:EE_|AM9PR04MB8682:EE_
X-MS-Office365-Filtering-Correlation-Id: 23522b89-9d03-4e36-ff5a-08de8be527e3
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|19092799006|366016|921020|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	5ozKVh1k3pi4PU5ThwQRI8VmI7Xe5alLl3k3j44X8ZROpphT82KAi7b81d9js1yBno3QwLaaBJ23UwPTtk3gz/bRwH931lGmOKaShzUNjK98RJujy2NTB+K/VKAbBLE3q41alkVQCFg6TEi7Tv7/G2CE7gO1AXspI7KDwHhkxp9N0LFVAqnWsg+HJygDZty0FhhVb2jvynbC8yFwLVv0x+re3y/obl5+VcTM9cjrK7qIX5hgHk/pCH7jL+cnz/b6+pnGPP7yDT5ImnbCNhZyD+4tHwayE10V6/nrefhllZ0nW/tuo/lU2Wa4P9wrPf2lWfJbcViv5fPrKiU0zjSRPBKttNmys6m49EE45l5om2iAQBNJb/e2iIRB88DeqODDVD0Hm38jN1TRmNGyAPPMto5dLPncb61k+FvxHgwpW8E19JmQXkboWy8hSFd7P6kYZ4s4H0tp/S8pU0+d1Y4XoFFBBQ/mtmIIZNElTQtOclqlXg+LMsM8zc8dRwaJCgQX5Z9Aseqa336f4HKr2MI7bp1N7L86B4wq/BeGLNs84Osh21QZliHsi1V/3NB/tIgTYfnRTruQa/It3Rm1gFj7n8PyE/YyJbS9aJKXwIIN/qzDrrCibH681oC2V/jF+kwlzcYLze2o0Xjz8bKVLzvYe2FuzISbYxrOvRb2SUmSoaN+/qE5OdwF4gtz+CvvFJVeCRT67nDQTHDyxsA0dF8gvIgWFmobFM4UXVersmE01cAURNw19Rd0dztosCF1N4u+1lK5bGYNGZGGx190sWWmBg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(19092799006)(366016)(921020)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aTVQcStFd2tRY09ySXliNjFlWmZ6Y1dCbjB1ZTB0enZFVTVDbnRuZnY2NWVz?=
 =?utf-8?B?OExFcGplT0lvNk03N1prMGVjN0RNdFRUYmhuR1QwRFh1ZTFIV3VIVkp4eVVQ?=
 =?utf-8?B?eWpBRmk3b3Zvb3E1UmZKZDJpVjV5NU5EMzhPMVUyQzRvaWlyaXJPTFVWUUJG?=
 =?utf-8?B?djdKL2Y4M1BwQjhzd2ZHUmZtV0JMTStzd05Kb0k3dmpoVjY2bldaaGpNY3l1?=
 =?utf-8?B?am1tbUtCbEk1MUF4TVFaOWdZaVpreWs0UDcyWHc5QUpmbys2eW4xWHVEWS9m?=
 =?utf-8?B?YmhuWWlEN2NZRXh3MWN6YXVGODVqNGdmM29SYTQrYWwybk5iaE1vWVZqZEVj?=
 =?utf-8?B?eUs1Q0NVSzJSRGwxcmtFcitUQWViODZaM3lIZmxGd1NoRlc3VjFyekJCb25I?=
 =?utf-8?B?Q3JsbWlSL0pHeUk1dFhCVFBVb1ZKMFQ5eTNtcDUwMjNzdDZqSFAzTWFHakpL?=
 =?utf-8?B?TnFUZjJ1MmIwa2JrcjZ6cFJXK0hIWE50SWU3MTdTRVV4WktGcG1UODVXQnlU?=
 =?utf-8?B?Ti9BYmFPMnBjU1g3ai9ockNLVUZlTDkyZUxMK2ZBUUlsNkpNaUhwNVAvYXBn?=
 =?utf-8?B?WmdNR2pXYSt3K2dqd1RQckdETGxocGdaTGsvZmlBdDhxMjZ6UTNLVlhKTnJh?=
 =?utf-8?B?ZmVXVlFsSXRrcDVMdXdZL2tJVkJIRlQ3MFA5MVN5TTZ2R1VxbXNyZ1JKbWJH?=
 =?utf-8?B?QUUybUZ4QWxBeUxRUFRJMjg3Yk9sTVF3S2dDT3d5RUQ1eW5JV3R1U3R5cjVo?=
 =?utf-8?B?OU84bWovdWpyQ2RHQk8zdjRpQTJ4ZEZRT3hxLzAxR1dyTDB1eGxsYlBDbGtF?=
 =?utf-8?B?YTZJaDlEcVBUS2RwRFV4WjZFMDZtYTZqRHg1V25FaVdTSU9zNW1wVjYwKzV5?=
 =?utf-8?B?ZGorSk9Nc2d1cHdad0VDeTh6VUs1YmExMnA1aHA3ZmlYVmQrcGNYRWRGWUtl?=
 =?utf-8?B?REd2diszeHB3STlWZ0tSWmJEd1dDUmtua0hXdFIyaW04bENad0NpN1ZKQUYr?=
 =?utf-8?B?UTduRkNtZGxVUytPQ2VNNCtRandYUVBiUzdaRDIwbDR4NmYxUXlhdXdxenlX?=
 =?utf-8?B?aHVBbDBjdnVSVzRmMUhTM1dHZ1I1ZXNhWTIrR09vVnVzVFgvNU9pQUVEV1Qv?=
 =?utf-8?B?cTVvMGJodkVtMGluUFFUb0MxeCtJK2IxOUJtdGNIems0T2pxTXY4UHVQeGVr?=
 =?utf-8?B?K1VnNEliZ3NWK3BWTVE0SXpxdDJvczdiVUpyUUxmV0crUnpWVzBKTWRibDBm?=
 =?utf-8?B?RVo2ejZSNjFXNDNKU0ZCVVliemYyUkZFdG1JVFU0OVA2Kzc3MDdpdk5DclFM?=
 =?utf-8?B?S1cwamdyazhvTUZCNHJOeTV5L0hJcmNBK2Y0cWROd253eGhEekVES2VUQ0t6?=
 =?utf-8?B?cCtybkUyVlVkcmNaS1dvVzFuUHBTKzNJdzNpVVh1alJhYU92T2tMSWgyS0Zl?=
 =?utf-8?B?ZmtaVVJvSEVITHB5S3ZxbkpBRklORHZid0diMXRPNmtPSGRCUFg2V0k1UkxK?=
 =?utf-8?B?dzdnLzRJNDNRTndPazU4MGJoVWNoVHpSWU1FWEx2K2s5bXhoU0k3c0tEVWRn?=
 =?utf-8?B?N1Bleldzc3QyOTNiNkVWdllTMUhyWjYyc0c0ODJYdFNxMEJtMVdpSHBVb2dR?=
 =?utf-8?B?aDAxVEhXNm95TTUya1VuSnVQSFR1VEFlSW9rWWNvTGNYQ21JNzRKaGVWK2pP?=
 =?utf-8?B?TWtkRFV0cWthc0ZtQTVrSEdZRVh6OTd6K2k3YmFpenU0UHdEMWF5bERNVDNs?=
 =?utf-8?B?NVc3T2ZoQzJEcTQ3bTY5d1VpZERCa1hIRVUrV1Z1ckhGRTI2TjI5ZGFKOFow?=
 =?utf-8?B?MDFhTGJXQmt3M3pidHV2Y0ZOV1lZK0xSMFhrYUFFb1A5blhzK29lUU5BTzZN?=
 =?utf-8?B?MjVNc1Awek1lbUpsWG9WK1A2dDM1aENGZ0ZnVDFvMnhJQW1TSTRDQUpXbElD?=
 =?utf-8?B?S3dramEwcStKRE9ycXlKcWZlUEpGTGJPRnFmNUhuL3JuOW5YU3YwanFraWl1?=
 =?utf-8?B?TkRIVGpuaTZNdThvMUVlcEx3WURSb05YY0ozbWczand6WG9hT0dIVjdpTlha?=
 =?utf-8?B?N1o3N3VpQWVzcXZuMTZsUmJJZFNTTHZlWXJma2dEYld1RkZQYllRdnVUMWt4?=
 =?utf-8?B?OGprZnhkNnp3SW9TR3lPSlhBVkhmTXRNOVJXR1orT3prU3FOKysyQnZxeTdO?=
 =?utf-8?B?K0VXNUduV0ZLdDliT0pOWGlneVJxaWFHNHJUVXVPT2tVZnlXbTZ0M3pEQWFz?=
 =?utf-8?B?VGxMQjNQVUVXZ0F1aHAzbnJJOGdzTkY5dzdkNXNjVGh3bUtsaXdaY0l5Q3BK?=
 =?utf-8?B?RnllMys1MjBkdnFlMmhqZzg1Zm1aQk9BdkVjb1RkNHQzVTIyS1FMdz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23522b89-9d03-4e36-ff5a-08de8be527e3
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 09:42:26.8548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AX/hes1VaF7P1oxxpZIEo9nwCRHYvijwFWAcFvP6xHdU1dilignzc+c2MEYNdkeeSkHezSnMcyWumHWNWVPTtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8682

On 3/27/26 04:42, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> Cortex-M[7,33] processors use a fixed reset vector table format:
>
>   0x00  Initial SP value
>   0x04  Reset vector
>   0x08  NMI
>   0x0C  ...
>   ...
>   IRQ[n]
>
> In ELF images, the corresponding layout is:
>
> reset_vectors:  --> hardware reset address
>         .word __stack_end__
>         .word Reset_Handler
>         .word NMI_Handler
>         .word HardFault_Handler
>         ...
>         .word UART_IRQHandler
>         .word SPI_IRQHandler
>         ...
>
> Reset_Handler:  --> ELF entry point address
>         ...
>
> The hardware fetches the first two words from reset_vectors and populates
> SP with __stack_end__ and PC with Reset_Handler. Execution proceeds from
> Reset_Handler.
>
> However, the ELF entry point does not always match the hardware reset
> address. For example, on i.MX94 CM33S:
>
>   ELF entry point:     0x0ffc211d
>   hardware reset base: 0x0ffc0000 (default reset value, sw programmable)
>
> To derive the correct hardware reset address, the unused lower bits must
> be masked off. The boot code should apply a SoC-specific mask before
> programming the reset address registers, e.g.:
>
>   reset_address = entry & reset_vector_mask
>
> Current driver always programs the reset vector as 0. But i.MX94 CM33S's
> default reset base is 0x0ffc0000, so the correct reset vector must be
> passed to the SM API; otherwise the M33 Sync core cannot boot successfully.
>
> rproc_elf_get_boot_addr() returns the ELF entry point, which is not the
> hardware reset vector address. To derive the proper reset vector, this
> patch introduces imx_rproc_get_boot_addr(), which masks the ELF entry
> point using the SoC‑specific 'reset_vector_mask'. The resulting reset
> vector address is then passed to the SM CPU/LMM reset vector API calls.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>


Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>


