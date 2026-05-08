Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011020.outbound.protection.outlook.com [40.107.130.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8F733DEC0;
	Fri,  8 May 2026 06:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778221515; cv=fail; b=KYVRUXotB1Vyo3qL554i7TGraa7xQNZfxAoi3g5qwxp3nFZNwZ8sX/2KFB/C6U4FBk1Y4WcqL5RRj8HGZkxCms4BNVspW4GgFioVG3vLovbM3ZS3+S0YXmXHFo2YcZGxzOXlKRHgn+pIzzy8V897URfD6+QbYl2ZWFSTxFIPOSA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778221515; c=relaxed/simple;
	bh=XOAchbBgtATA5ao3IgMCEL1vHJ1QXZ3gohBPB1kmD74=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=o0I+FXGtN2ZZsXWrz9hTtd6v1oDcsLxwS6RUmnATwLszHBG94yZpMcVWAWlf0zmQQdsCZOFHVTgVmjcSYxKCdJ2EKcHuqToMVkgfX7/Vx4anmJMkw497FwSZ60D6OvBLIovuVV7jLVkY2HNlvVuPgqXSJT3v+Rnq/wewF8dFkY4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=qXymPTXw; arc=fail smtp.client-ip=40.107.130.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="qXymPTXw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lq0YZGobmowwhVCkMu9Ny2iFzTINvm/EB2p2Qa9Is7YqYANbFz172bXSq4Hbx8YcHaWBEb0MZBWRLli6c6NXTf66t2OBlSRQLpHTL8Yd7fLM98J+we2Te+LnuV3LcVjM5HKBP80+3mwTkLg6F3igwg6Yb7sjfuXYeEPihWkMIg6aJgxsMuFxXf/ar3QFONLTZlWB46NyJ9FA2mXAO0USiA9cTxbcrpdnEXP6vhHuLAVw7evuXDDg+sPMxZFj+aBAB/kCRiKUeKAtv7DysAEgVAPkqPlZK2Dx0iJcYOokvXPwgRPNJkOCOt3CCBM3xJbxYAprqtbR8PWsRyEWKtv8Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7w5pxDVNJ5LQmCH6ChoEaqxjCjYArkKdgm03vmGvjCU=;
 b=spV+S5rRlG91X4VlB4ydkiBtQRUsuYs0PHg48ScYOhHyXeWVpkjAhnDZcXyPNzw3WEP2SiihcLqp/2oaYlqnik0NSEJS2/XgTVjsTfflGE2KaBrwtR9UuHI8Wu3WQ6xOAsQOOwtmJyoGslQ+uQQbsC8G64lnzUV919V85gZbTqdj1Zj3FFNM3AdVetEOrRsnZ1d7vIj5GZCqSS1+W+VQ2+hbTLS1TTGkKpgL9w8K+zDLvFTEOsZURm11VMAV++BTYGles0555Ksuju3//J2N/7YqeuvSHC9OKHHDxJp0HTYzPCzaPH4pfPppbYOj0cspC/z7N+sTSzWxIA5p6ozn1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7w5pxDVNJ5LQmCH6ChoEaqxjCjYArkKdgm03vmGvjCU=;
 b=qXymPTXwqdO7wfeCL5019b12hS5Ax91X85lsZD8ocZSP6azoaC/8uxNQld1oHUqZ6de8eDSFRvDmmiuN5SG3T6z7Pqi8/4F8WbaonzLY7shlDNDMovo4pZybiQR19n2g+kA2JgG9wFNI+rC8ZEbtaDtn+6MoS3T9jsT3FkMuayXyA2yAFSkXjIBfap/uJ1LHT/k2MG20lApDGzb3H+VpRgY8/GWATwyIxBrLe+ydrF906UK/af182YsbqAjWpmnN97FuV2r6di49OihfjCkeMcQX3WWQR5FrocoqQUEaiG+e4UibhV1HY8fTuLwFbx8webU08kN4pBAJmkcKOLMZBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
 by DU2PR04MB9129.eurprd04.prod.outlook.com (2603:10a6:10:2f4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.19; Fri, 8 May
 2026 06:25:03 +0000
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4]) by GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4%6]) with mapi id 15.20.9891.019; Fri, 8 May 2026
 06:25:03 +0000
Message-ID: <ac390c82-91d9-4d8c-9514-b7cac0a4dd8a@oss.nxp.com>
Date: Fri, 8 May 2026 09:28:18 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] remoteproc: imx_rproc: Use device node name as
 processor name
To: Jiafei Pan <Jiafei.Pan@nxp.com>, daniel.baluta@nxp.com
Cc: Frank.Li@nxp.com, andersson@kernel.org, festevam@gmail.com,
 imx@lists.linux.dev, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, mathieu.poirier@linaro.org,
 peng.fan@nxp.com, s.hauer@pengutronix.de
References: <830f0c65-faca-4843-a6c9-693db7562037@oss.nxp.com>
 <20260508032016.27716-1-Jiafei.Pan@nxp.com>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20260508032016.27716-1-Jiafei.Pan@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM9P195CA0020.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::25) To GVXPR04MB12316.eurprd04.prod.outlook.com
 (2603:10a6:150:2c6::8)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12316:EE_|DU2PR04MB9129:EE_
X-MS-Office365-Filtering-Correlation-Id: cb79aab2-89ab-4d62-f419-08deacca89d8
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|376014|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	hOldRSOxBEpW/3ctGmVYQ1lAgD8+a9Vz/XtJdKq6wuC5pQCP6h2wH2uD8yG59CNSI/HLrVuK97szP4JrgD+OH0lTgvwNzgJfd7V7g5siGpSkdlzZwOXF+pcFRYUrTO6fYUFaFRJQ04AI0534vOUDGr1+Xc+RFWh2cf+3qDqmSp3U1gD3PEkD0UxyG+UnO4mIvwitqUnL1jwW/7TyvtjTlZnTFoMUiUD8BOWloL1zqi7u4ZPMh3zrm6k9KY1PNgx/YtQG+nLCEotJ2x/XQAe9c81zNFmIhdZ2nytMqAgXvafjKQ27FsAsDESPQKStSVC3eXnM/6oXNZHX1jkCOkvgpdU3Qg96mQ4rbI4eI3qAWnMDhxt4BF6dle28F75KRyEEEsEmUg9c7XcXd+AQungTCb1PurflpB22ob83e071GxW9yz3V2SBC6B79kCjvzi08m2JLu7KyBKpkFKEt4mF5E8Gf/HkyKHLCHNniHYCuO44q7pep9yosi0dniAF19gupRRx69fKRR85n7A4zIWvSfx1DJEV7qbzHG6rIEIl61n9J5UIlgRzQUStaMhZkEdeG96RQjzPjVehOUe0GwtXvIZWE6XF7S4uCikARrgXG8oVcwF3WCEDu2ao912oPCXw8RXrtBbOkoxWosUZIUxozZWDqF41Jl0+v2ocJsuk7T832TZbKOPKrpL6lu/BhFsuo
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dDBhZ21tL3RNa2Y3SUxQMTNCNktiWHJ4ampKVSttNlZnZ3RrbXI0YThlNnMr?=
 =?utf-8?B?Qmtsd3hmWWxBU05EeWZLV0prbGlrN3l6Ni9ES1d1UklBREhCbmRFZFZrZUYy?=
 =?utf-8?B?aDRBRys4azdQUlYvcko2M2k3cE1lZ3F0UFpvd2VRL2NQU0ptUEdqWlJ0c1hI?=
 =?utf-8?B?ODZIeHNycjFhMS9Rc1g0ZXRiVUY5cEw1T0FUTmNueVpyODhuOHRtSnN1RmIy?=
 =?utf-8?B?RDVFYk1Ja0IzbDk2Y2ljRnJZRVlnWlRHb2Z1cWk5YUlwb0tKcGVOWjNCRFAx?=
 =?utf-8?B?TkY5dlppZnhmRUk4MEhMY2dlR0lPbEhvV2Y4Tm5LMGRielZrOVNibnRHV3pZ?=
 =?utf-8?B?UTRVamxtakE5Sndzc3dCRlhYYk5rL0hnbG92MWFFWkIrVkp2Y0lXYnA1aEVv?=
 =?utf-8?B?amhjTGEvcmwramR6cGlUMjFMTUk3cDN0b21jN1p3bWkrclhPWGh4bWoza2Nj?=
 =?utf-8?B?Y3V4QkZZaXIzM3M2cDVhYm5lR0U4NnpPR2w5SmxwQmlTSjBQdmp5dWVzS0VN?=
 =?utf-8?B?SXkxOWYxWng0M1BwTnB1S1VCL3pFQmprOXBYZXQyUjFyMXFxeW50SW5yTTNj?=
 =?utf-8?B?d1NJRVh0V00zS2VEZCtmbk93OExHTTY0amJZZnprL3pLR3dySGYwakxjTEw1?=
 =?utf-8?B?czBMSGJsUFN4bWRDakJncGkzWURSZHNnMGsxV283VTRrZE1tWkhWaEJkNGVZ?=
 =?utf-8?B?M1p5SjdweUpWSHQrYTE0NDFPNExld1RpZzkwTjh6N3hpNFUxOTRnVUJ1aXl1?=
 =?utf-8?B?QkdOcGttc1hNWUtIeDl6VzJ1N1dubStDMUFud3VTTHhPSHVnd21ZR0xja3RR?=
 =?utf-8?B?dG1tdytQSGhsb0pOVHdhbGpQUUgxajg5eDU3Y0FVWjhpcHQ4SkhkN2twbWZ3?=
 =?utf-8?B?RmN2elFnYVlwcmM2cVo2c29WY1dBSUl6U3V6amtDZDJMWHZ1OTBBOXcxMWhX?=
 =?utf-8?B?Umx0MTJSUEJ4K2tIbXU5RjJGeVo1Wk5sdVZweDlndU4rNDdpQm5qSlo5Nks4?=
 =?utf-8?B?cTdnK2FSRXZNQkFwYVI2bklRNzFhUk8zc0dRbUNXYWJMcFg2SThxeXZiS0Ro?=
 =?utf-8?B?aFpzMkhiVUNVTkdnaWlHcC9rL3FnRkZ1UVY4QU43MDBEM0xMRTNHTzNxZXUw?=
 =?utf-8?B?VWZvSm82QWpDWmlYSS9LK0lVdHFIUk05Mm9EQ1FIaHZyWEhxcnhhMG1LZzlm?=
 =?utf-8?B?OTZQZ1JvdjYvaHZCU1lBWGlSY1lnQ3NyNzQwM3RPcTlwY05PcHB2bFdiNTJu?=
 =?utf-8?B?ZGNBb1Z0SzB2UUZBRk9RamlFQnZqYkk0QjJxSVE0aGJmNDYyZ05nNW5tR2dW?=
 =?utf-8?B?TlBQMzNGTEhiTmE4bjFrUlIrMGwzdXVER1h1UkVMSXk5eEdEREpTR3pGTzBp?=
 =?utf-8?B?aFMzZ2pzWllJZEUvQ1ZKK08yMmdvQ29CcXlnSUtXZG14ZHpZTlI0STB1eVk4?=
 =?utf-8?B?dDUxZm12cjdZanpxUW5ZNEVxcDJDbHZ6MllNMHVhUVBuOXdrSVFBL2RkNmlU?=
 =?utf-8?B?UWFDRWJEdEtZc0hneEVUMlV1NUFDenlhb2NiNlNtZTNaL3hwUmlXY0lYZWxj?=
 =?utf-8?B?djMvajY5dEM5b0hTaTRHUVJQREEwT0E1bkFMdWYySWdHaVBYeldROFBCSXRk?=
 =?utf-8?B?QkI2bUJCWmxMcVRvbUpwK21RZ3RpbG96Ky9hWmNRUG9uVFBDcVVCTExLYXY0?=
 =?utf-8?B?ejJFRkNLTk5MNmx0UDBjaHlpQ1FLcE1KdDNIbTNUcFdDYkh6YUozTnJicklx?=
 =?utf-8?B?V2xnbXJFOTZOZXNtVEV3YkxyNE90bWpzcllwMXlzNlVQWE5SQlZVdkZBbXkr?=
 =?utf-8?B?aGtTaGVXNkF6RGk2cmZMRHBrRTdibmtVNGo2YnRDRE0vbnhESUpFZjNzUnYr?=
 =?utf-8?B?MXZwTUhGUEhWc0NNUmlvWjFBTGlwY1NDVXBuTWR5aFVaUFJzQUxrc2JkMEty?=
 =?utf-8?B?TWR0V0NZY1BvY2hHVXgyUysxS3U2S3kyYVFDNmdlR283WmkvbjVlYUU1MkJo?=
 =?utf-8?B?cUxxZnBzOUhBRFRPSWdTcXNpZUZpMlBDOERWM091THBxaXNFZENtV2VvbGtY?=
 =?utf-8?B?RkRFeXkvUFkydVp1a00zMmlPa3F4SFovR0VRMkE4a0ROQi92VDA3S1psVVl1?=
 =?utf-8?B?TmlwWTc0SG85R1pRRlRLajI1V29LZzhlTkVFSWpmVDFEVnNyM1ZDc3E5UFBq?=
 =?utf-8?B?ZG04ZmkrS3h3R0RlSTdVanUyOTRmaEE1eVVSVGsyRk1LQ3puaC9zSEhuQy94?=
 =?utf-8?B?eGJ0cE9TOGo5SnBkYThoeEVRejVLc3M3c1cvdXN5VEM4YUhRb0lhZHFPMXgz?=
 =?utf-8?B?aFRMMkhJYmhUYytWV0dVNFdMZWVtZmF3cWM2WFVQZHV1c29OaWhIZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb79aab2-89ab-4d62-f419-08deacca89d8
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 06:25:03.1450
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IkjsV8wccUNisISCMSqHcUkYEz6+Ij6v4yG+YeXHJjRD/Jud0M8gRI7rs1cC1MDX8Lp5vKUri2K83YmHcJ6BeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9129

On 5/8/26 06:20, Jiafei Pan wrote:
> As currently there are maybe multiple remote processors, so change from
> using fixed name to using device node name as remote processor name in
> order to make them can be distinguished by through of name in sys
> filesystem.
> 
> Signed-off-by: Jiafei Pan <Jiafei.Pan@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

> ---
> Fixes sine v1:
> * Update patch subject to aligin prefix name with existing patches
> 
>  drivers/remoteproc/imx_rproc.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index e8d239bef5c9..38713f6f1c50 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -1356,8 +1356,7 @@ static int imx_rproc_probe(struct platform_device *pdev)
>  	unsigned long cpus_bits;
>  	int ret;
>  
> -	/* set some other name then imx */
> -	rproc = devm_rproc_alloc(dev, "imx-rproc", &imx_rproc_ops,
> +	rproc = devm_rproc_alloc(dev, np->name, &imx_rproc_ops,
>  				 NULL, sizeof(*priv));
>  	if (!rproc)
>  		return -ENOMEM;

