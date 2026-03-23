Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013055.outbound.protection.outlook.com [52.101.72.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F063B19D1;
	Mon, 23 Mar 2026 15:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774278846; cv=fail; b=IHcuiEd/vc1SJeR8arXf6JzBoMUjneAHT1T+DmTLxsiYc4FR5PaWHSxr1A4yq5GBQL348+SEmv4Ob2bQOxpn4S9XymwD7Q+xca0OEPusd6nbFWj0HLUbBtS73zAD+dY3i4gvNwqQoN0u20/DFVR6A/9PdxB9HK6aLXNzYXTSRA4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774278846; c=relaxed/simple;
	bh=aMz9+C6nYalhEkstuwtz1m+tGYcxBI3taqo73Zb8cKo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=TGjnLpEo2mGBKbzueRpOKkotRUFOIpjOW25G0xk6uK6Hi05HbgqBh6wNcI20sgI8znIIlM4Bmx7FYP/eF66vIroOlbjlCnIagKVPIaIpM4+jYdKza62NR2Ij6A4JSgDNzYbi6AvMNAD++W3G80vQy0jG8dtSR3usmPeFMtJW1xs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=m/YiaXUl; arc=fail smtp.client-ip=52.101.72.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="m/YiaXUl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TIjoxHn13LDFFLnVSpW4yUycBh+mdouzTLIlIKP0Qas5jUcAx9XyTJrfznWVU3q5+4/eCyajvC+5mZAuIeiHNdK64Ohr6SfYuJiLxgmHOZnNltHIS3GabaRkmUCpBPADOarzSr6vTWBCgKa21E6gckG7KtFswsxhMD+2POfrrLzk2keGgg06TOetTSQDtRk9O1EYkI8SKLvcXCgMAbv7+2RoNwqCimJfCZkf58s9Ez8vqAWQwz9MLwxhNcMMzdIGM+Ab1PLJe60W5b51zXmVZFDute+3PD1P+Ltj9yJup7IqvXRpQX8QHRuaAriKXN3JICqCU18gqwuZAKhH6UheVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D7imRZXk4L8P4big1YlDwcQmCuJgRj+wkO6oUHUZcCY=;
 b=asqH4lcOEWIIMcLICcuemkFFIhZpd71RuIPbzz31tAspdnQuEJyTVSmXUekfQtPXT7erDcMnZ7TDvSjQ9q4RV+Gk7z4vfl802k58TT8A4mMTdoNJbh5wNPn3lx05u2KgEQToRvj6dXBTREuQS/YmptQ++k7VddzM8YqVuWxHYLmnP/LFjbycwEC0yqZxoSJXq80FPC7M4UzLeTbmo0RxNaloxc6FPTQveMi44+g7wIGpISK/QolDCTA7f4zY+3vsbcwGp2lvP2xq6LAv7gLPJqeg7AKm6RV9rZDyQop2wGoP4VH1CnDCeUpZoYXKQ5O1yCkvnkRn7cYbMXU6/q+i3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D7imRZXk4L8P4big1YlDwcQmCuJgRj+wkO6oUHUZcCY=;
 b=m/YiaXUlnQ4Wg/7o2apt8UIPQO+vkFEeMzRz4kinJfIq7p0pM2bxwLTolc6H6cDULXwJxOHNFnG3zJKjKzqLUJ5x5x8dagODJs28u3Xsst8Lwcn8nZEGqyVO8TX5UtiAXqLBh09W5Yrlrt4+d3AcFCoP7/UvMA62xhmXc64Abdwrlxun136zizYHYQ4bGB2GxM7Lcrmj6uoRSgzStPEQMa94ts4EPfnqzVxApidkwt0RNOBdi+D8r9T02E+dd44TIDP6ThV6K1QnyLBmrEpa8BpdErpIzXpI4OOJuimegOf5lL0GtcSQ5ooWq27LZwhMWOlqo8YDlzONqTAMp2dZPQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
 by DU4PR04MB11860.eurprd04.prod.outlook.com (2603:10a6:10:628::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Mon, 23 Mar
 2026 15:13:38 +0000
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4]) by GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4%6]) with mapi id 15.20.9723.030; Mon, 23 Mar 2026
 15:13:53 +0000
Message-ID: <e17e0eca-b187-4e56-b51a-8a674327cd3d@oss.nxp.com>
Date: Mon, 23 Mar 2026 17:16:56 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] dt-bindings: remoteproc: imx-rproc: Support i.MX94
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
References: <20260312-imx943-rproc-v1-0-3e66596592a8@nxp.com>
 <20260312-imx943-rproc-v1-2-3e66596592a8@nxp.com>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20260312-imx943-rproc-v1-2-3e66596592a8@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0215.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e4::16) To GVXPR04MB12316.eurprd04.prod.outlook.com
 (2603:10a6:150:2c6::8)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12316:EE_|DU4PR04MB11860:EE_
X-MS-Office365-Filtering-Correlation-Id: 415e0286-fd51-427d-7552-08de88eecb61
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|7416014|921020|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	NTAeVknDZJ1KKdusExgVtUh5uBT24sL2OJ11+sfMgRIs1PJ7MeOO5m1QQpC5eX954xK+OzXZ2Le8H4eyvO5/O5nhupwXf5JWqeZZ0qvFm2QyhqRkqQJAlxestBWPU/wUKw5Ex6y1MqEcPydyJRdxJ2HSmxtiLYU9jXvSPBnTg6fywoTF38N8rjlyx+8bKsgEHSo+CUKLeZDgyIVw4dfSN2u2fwLDjTlbBG8L9Dy3vO0ZXT1neWX6kEV/T7m4LnRDSbe//ByaRkHKuUucKQzHpthV7C6VjzBHqK/7mBcNF7UtyxmVBMmXJYDGIvAKcLCnEedFgw84xDECVhnMXk0Z9vF+4j97FYP9a3B8F+cz+JvvxswbunlK534hqbQJdc3QZuRzLXj3b+er23m7XVw8zMEQ+YRd5mmlPDAJiH/KVcFlpVfUXopCKWtFm4eAH/j1pOgCX9KEFBTk/nZv64K0bcmWxeo9UqRnero3Ay3FwQGP4w/8wlFsG/dbYdRYq8MV2sH2pskmqXShoKjnC1TwmIGsulM9vtwC7JFC/uDN94wPHhPR/rXo1u9p84BDzPLs0IYUdjP93sZKKVdLgKxoXmUaBxuYLjaImOZKwd5M+VulnFjuX2Qlgdbt4gCZDDYX+gp1qsaDw/TeCJQaGsHBoO5pWf8mMhbHbrlA+SNr2KWlI4xv4mI2r7vSqtmJwIw4e9/+2AacL6AxbHAZ/+jH5Qfl38Mkc2Q0Z4Lg9e7ylW9hw0u6xrD5M0yMF7anSUuqGQraiYspEoy103nbHqbmbg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(7416014)(921020)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M2FBQmw3b0JjbUdNV2UwVXRTR3huVmQ4M1A0alBWQUdaTHd0UWlTUlFKUHJ3?=
 =?utf-8?B?SDd4b2MrTGFTNzI1cTFhZTBIc2lzQVN4dUV1Z2N0bzBPUnN5QzZnaDlzTDZ0?=
 =?utf-8?B?VzIweFZxazV1SmdrOTlENDVXNUdKQURnRzlxMEVRV3NobVB6anZMQk5WUHV6?=
 =?utf-8?B?bk1ucnRBaDEzbGdwL0pTUnYyc1UzSUVVK0E4NjVwa1g2OHo0ZDl5dEZTSHhK?=
 =?utf-8?B?LytQd3RKS2RONXFGOHhmcVh6eHNSWUFQSXZsd2w3eGFjSW8zcURsQjZia0tO?=
 =?utf-8?B?TVlqZnF0cURTMitNNG5aQ3hvVnRnQmdlcGltTGxnUGVNUUNrUVppV1BudHl6?=
 =?utf-8?B?SEoraVpOVTdrdFFDVkJPSWt2OTJhbDRJUTdHZTIrVHRaTlV3eTRWT1RGbjl0?=
 =?utf-8?B?UVZ0Y0ZxYnluOVJkdFpyY25SVlhmZzkzSXAwK21UNWlwZkNvcEZORElqalVn?=
 =?utf-8?B?dzZhcTFtaHNOZjU2N0RPN09OOGpRZ1V3WVRFQUJGL0lDanczazZvZGFLdm5v?=
 =?utf-8?B?Y1hWNmxCWkF2Nm9sMzBVM1hqRHowZXBoR1dvcndLWWZMVmlENXNjOGNnbWY4?=
 =?utf-8?B?OGJ6RHpoU05PVWxHT2ZTeWxuSkVSS1BTSnJnaTR5SldOZ2JIWWI2ZXRFT0oz?=
 =?utf-8?B?WmY5YmVKWkZlVzZPSVBsNWs4Sy9pNktOK3dRS3JxQmxFSHVuQTZUMFdIdlZ0?=
 =?utf-8?B?d053cnV1QmRFczlxTXVxNlduUTJDNjBCWndlT01DRDNrM3lZdkFFSE5zbTBt?=
 =?utf-8?B?cDhITmppSnFndy9KNXpLM0JrNW5RaEFYVEh2cmJDaWMvRitSdDl1bDFsVlc1?=
 =?utf-8?B?RFdHUm02RldSaDBoV2QrTzNpWEFjRzQwRzBTM3k1Ky96RTdlUE5HbE1oYlRl?=
 =?utf-8?B?ZXBHYkpSejgvUVdteE9WQ0w5aVFBdU1UV0lJUzVPZE1SS00rU0cxaHpDOGU4?=
 =?utf-8?B?RmJGclZ3VVBpTHN0NDRGRXVZK0QvZk5tV0pRTm1xN3R4aE1zVXNiaGpsbTdv?=
 =?utf-8?B?Yi8wZGdqWjFaNk8rKzhLcmpKNzd1NWJtQy9ubDVuUDNrZTloVjJ0bTIxa3Nw?=
 =?utf-8?B?RG41UWlLQ3B3YnhJMzdvQWkwVitKNklrNEY3U21iMjZMZ0NsUGxSVmNQendv?=
 =?utf-8?B?OWJjb0VJMnRGV3B2a2JQQUdzUWQzTUtvM05GZisvSXNJQndGZytKdU91K3l5?=
 =?utf-8?B?YnYxMUpwa2NEZE1vY3VJZk1WWXhlS203RFZMaUJPbGlkZWUzTDB6TW44S3Mx?=
 =?utf-8?B?anR3TWRSRzZGb1lSb1NzemdGRGVuWE41ZEdwOVZObmVzYVUvL0xCaStGS0pB?=
 =?utf-8?B?c3FCbWJhb01VMjIxeFdnYlFSZVk1dDdFOGU1UHVCUFUyZ3liOWF4ZEpML1dv?=
 =?utf-8?B?MHZOdXp6eFJyNjIvZjBtOFY4dXh3Y1dJZnBZNXVUR1VNSS8reFRDN09ya0lG?=
 =?utf-8?B?Vzh0bmljWklqcmQ1aEdWOHhPN29DbHU4YWh3aWRaaUkyTEwzR0lqZ0hGLzRw?=
 =?utf-8?B?cWYxR3RNSjNOOTNPMkZ5RUc2b043OHhqbDI3MUlSUTQ4NERJM2pBbnczd0ty?=
 =?utf-8?B?QkdIN3dOdDVmaWdEV0Y4UzIvM0YzUFRRdUJrMEdPeGxjRlZ2cnY4L0Y2Y2Ix?=
 =?utf-8?B?aENTaCsyUFNmdmM4Q3Q4NzNLK0NIc3FrdWNnZnJNbVV2bzJpYlR6VlZKYmQ3?=
 =?utf-8?B?QVQ5cTVnelZSWk84b0xzMnViS2hSaVRvMG0zdTBqb2JNQnMvaG5tcTlMcG9u?=
 =?utf-8?B?em5FUTlETEpaZjlJdzhVYXYzRDdUTTJKSUhRbmtGWUdBMURYRW5qNGxRd2I1?=
 =?utf-8?B?WE5UM1NQa2FPRDB1QWVVdnlVQll6K3Q2RFV1RjRaQWZML0ZXbnhLdG52ajl2?=
 =?utf-8?B?S0liYkJpYTZnUGppTmwrdjVQRTE1ZGZ3MFhhSTdPa3RoREJNelNIcmp2K0Fa?=
 =?utf-8?B?Z3hZMFpqUS84TWtITzBqZ3U3Y01iSEw0VkYzRVBSU1M5KzIvaGF2MWVGOWpX?=
 =?utf-8?B?NWpFWWptMVV5MUZWUjVWUUczZXZvRWhWM05oRmVrQjVmSjI4V2NmZmlnM0Za?=
 =?utf-8?B?bkJaUWdRVmFVRExYbEc3aStaOHNhM0JkYmlDUGd0S0phYnkrdkZ4MTBMVlp4?=
 =?utf-8?B?Nkw2NFN3ZTVyR2tHSFROc0sxTjFtUUJLWVVqcE93aGU4dldpZ1MwNmpGUTlM?=
 =?utf-8?B?aWp2WXN5RVluWDN1TTRnTWhqRzdmWks1Y0JjZll6RU1HS0RqM2lwdXZXcTAv?=
 =?utf-8?B?TGMvWXgvd3ZQYUxIN3FTTVVZTjV4NHFhT2dpZlpaaldZbnQrKzRwRFlNUHFU?=
 =?utf-8?B?RHdwdkFtWldpZzB6WU9zZVQ2bVNxcXB1VzRERkpER2RnVWRBTERNQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 415e0286-fd51-427d-7552-08de88eecb61
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 15:13:53.0218
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mEESMAiFmdeQe7NqsYz+k+tgP4dLTszqZ548XaPaFrt2do+f51uxMMF39xyApdDW5mYJSwFirRPwkqu+k0xepA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11860

On 3/12/26 14:36, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> Add compatible string for:
>  Cortex-M7 core[0,1] in i.MX94
>  Cortex-M33 Sync core in i.MX94
>
> To i.MX94, Cortex-M7 core0 and core1 have different memory view from
> Cortex-A55 core, so different compatible string is used.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>


Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>


