Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013004.outbound.protection.outlook.com [40.107.159.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1FAA1DF759;
	Fri, 31 Oct 2025 19:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761938968; cv=fail; b=SOT7QyrnAsCIgL8SQR1XyeHpdmrRJC5WzzEsL7cgxHzYvpT1IiJm3/+dPWdUS2TRv8qA6+/WsOgm/qXQYKPfJ3T7sBl4LPjtesXzbRHYQeYUDCFnVNizcv97cGritFGtaKtCaRRGFibqD6J7QK6NHr2MczWD4AqoFQqC+lVIPF8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761938968; c=relaxed/simple;
	bh=CmTibmwrhWzONB/W5s55oMnoviFeeaeNMFMHiYUVZEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=BbYap4ethKp8Ahuz0JMsUTDKO1NcMpYmF7yNfMSLfobND3majNyFjIgG3sZj/WYRWgWvXq6wszgpjWHlx+EVYNRSCLj8nf86QuEy9m+CbdVKksD8YhSg5CHtC+5GUhYaYqyOuwkDcn2+tfRivxtfeVXpRLX35qXJd32LzdcZ6zI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=imVr6wGG; arc=fail smtp.client-ip=40.107.159.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="imVr6wGG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=szOKiZLB99niHWrYkiZS/Qu2EY/9F5ocnhffVIjpYFe6DNG2sQckH98ZFJmM695PdGfnazGtTdRE+7Csd3z9syFhmhgdlg/00aAZbbbNYMLQ98ysnDgQbNypmJkY23vHJshWlMzYqgBGR9bXovYtP87GmOMRzjVeRIZTzEOaH9YP3eMgow9cNdduGSQVfnoo0UCoWXSovULTlBCb7CHdtrKLFEyccIIeeOqgGvT2SAl709PKKV+mnlVHGuZ4tT2HhBniaK029CdKFcMzQwLhEviO6Hl4kVDGR6IKaq2xH32z70oStu94DcpJnIURKPQgyGiONA4aa0NLxbsZSa/0gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rQAjXY6qws61kHxdIifRuxAtysQPO5G8XmCjGnDUYRU=;
 b=Y6N++adAUsnSD1Nop3wMJAFpymufRUh/gsyKtMZJ+NDFHHASzv6S89YDU6IhLyh1g+SCrOWa02szQEqE6+lmrvJWv3MOogpfyosPwi/B8m788TdNaO4YclvFRVH1zzpkNYpp0AVXfzB2/5RMhVwx+ulkN9S+HtLBYSGXlLzm6Bd3xq8G9pNyK5pg2eWbJKkGeM5/ip42//q2FZVmfOwKfSb0i82BwP0KPS5QyR3r22WzIbj96/gOr7BkrNy4WrSjVHqYsk8T9izYTjgcZGa0KQlQyyHzvqdG9Wk2HtgI7JkXk5MDGVTWFluVqSwfhmSgSSJd71OOtLXl/2nvaGt/+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rQAjXY6qws61kHxdIifRuxAtysQPO5G8XmCjGnDUYRU=;
 b=imVr6wGGWFG7ahc8nLwalxcSALSI6y8lXKLNEf9BSzMa5RQmSezI5KXT05nLFk6oFUPXhqHX8kufjRWTExMnvAujKUTcqbH9uekcpP6GdHGkTOFLGczsGhab3pFITERcC4X4wJDHxLoSNiRNtDuSMbKnuOwpkX6G3Vr5O+5MzSQRRFclVni+W4Z24WpuoGzPKQUq7kVtz5NrzpUkBwVXrlsqICFWR1JytyE5LJYKHexmV8RUT8F083ak7d/myVCiaBPs/3IAqS0uDueda5SMxAksr7q6VA2u5iM0uKr/II3UhCPmAj8e/EuEw1zZoQgb1Fn8FJgVjxSzPrqU6CyExw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by DBBPR04MB7596.eurprd04.prod.outlook.com (2603:10a6:10:201::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Fri, 31 Oct
 2025 19:29:24 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 19:29:24 +0000
Date: Fri, 31 Oct 2025 15:28:48 -0400
From: Frank Li <Frank.li@nxp.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/5] remoteproc: imx_rproc: Add support for i.MX95
Message-ID: <aQUN8KX4PNgXf/pb@lizhi-Precision-Tower-5810>
References: <20251031-imx95-rproc-2025-10-31-v2-0-758b2e547a55@nxp.com>
 <20251031-imx95-rproc-2025-10-31-v2-5-758b2e547a55@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251031-imx95-rproc-2025-10-31-v2-5-758b2e547a55@nxp.com>
X-ClientProxiedBy: SJ0PR05CA0141.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::26) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|DBBPR04MB7596:EE_
X-MS-Office365-Filtering-Correlation-Id: ba9a56ab-e945-4024-7ad6-08de18b3bfcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cKq83SNq5ykdCrCF4uXozdAssaqxkwQtZalDqwSrHn5PDnY3Iy+1Tn0yF9a9?=
 =?us-ascii?Q?m5geAgyfVi0lgjFXUriOLFeRAF7xh80WB7yOi98PL6EGaAO3dolPN1sxkfBt?=
 =?us-ascii?Q?YEQWq1GSXzvY9vvdyNmSGaBJ3MZhLo4ITbP2WsDM47HMXsHEYKctGO7JsvSO?=
 =?us-ascii?Q?FoqqRpT7qGk8q6E7nOGPDbGMgZDQLk/aUXE6Y0rs0pvKfym/cLn8MxWUsJT2?=
 =?us-ascii?Q?P5htZ9VwpvegPP2Wa5V2isbTazFAZZUgtCtiy4WIob1cWYLQL8VqgulvVsVR?=
 =?us-ascii?Q?UeDwXALinLNrIpUHPlOiDwDe3Zcxa4Lng67rSLsryaowvS3b+Ww7iyVOcdQT?=
 =?us-ascii?Q?mY6u96yHTv6yH0+dxcFtsCp8KUlqYf//RKWDRS2o0uJhh1/OZQmt1ONXd9pb?=
 =?us-ascii?Q?3GiS8vPhwuYCn0+YwMwXb9k5+Ij56nPDoOhCJu8JGMaueBJfSv0uc17qUYIa?=
 =?us-ascii?Q?RoCmcdIUIPVkrgurS9MW8Y7SWR+mgoWdScXnXw57DiLdQ4QjYEeqehhhZ+/u?=
 =?us-ascii?Q?QeN/4cbjgCT6tBtrEgc4YL/QfwKidi4NRyYZuZspYl7VWwaXME3RYC2AnUwy?=
 =?us-ascii?Q?DKaK6sLK4/N+6LMzda22smNvT4TJE+9VFHAwt0or89+Flj/JINJop7xALsO0?=
 =?us-ascii?Q?+dAdtoW3dwrtG2wGr8kfX0PfOEmi3j9P5LzlMGbBonsHOSILcuc0JQbLhIC4?=
 =?us-ascii?Q?+6/VDaS4vyQx9fZU8uqIxh5Trod7ua29Xu2Uw3ZpeHfaOyFp2t2rC1H6OpG2?=
 =?us-ascii?Q?I/nq6tfNEwbASAQ1UMozQL5rIb2mbBGKl8cPTaWc/xSz8nfmpScKor1QUlC+?=
 =?us-ascii?Q?rlatBm3sPWiyYMJl5rqtdoVtwfJM2EHr1by8vWDewPIR4HJnXAefc955iuw3?=
 =?us-ascii?Q?NLaFmkgBl04nc2XpAAOtDnIlLwtDsqBd2G/R6IWpKdn+3JQ/ytnOeKkIY5SQ?=
 =?us-ascii?Q?dGduvrycoD2shlikr+/YeOxSpPtzB7T+uHG4JlwS2BhxrrNyz/tsceoLuETw?=
 =?us-ascii?Q?SCqFgw0k1n2Tw8NiaEaORxSDgcbtUzIosFJYuuJS18wwv579tNxldnHmeMZZ?=
 =?us-ascii?Q?ZRlenOLra+Brk0LcEFBth8OGrM3lIxf3CW3sqF6aWBcCKvkqtDrgFAre5s27?=
 =?us-ascii?Q?8XDhe/yPKHFdhtqImyFZ2tEWXMcrBZvpUiE71QpYBJCHnzzJx1CfweK1Zdvx?=
 =?us-ascii?Q?Ja7r5H4HMVtzbo/TT7Jj2GQRvSiyp+9mbv3Q8dDcbtcWax4atcJ5fA04EOIM?=
 =?us-ascii?Q?V/261OkjNRScsHIhjrSnncf7k7T6x0C7RDUCK1FmtI/JrZtNsB3+eBWAJrdp?=
 =?us-ascii?Q?Z3PYSEgahfmJ2AIFX8kHTmquJL20l1CNxUVEqgIiuY4XelMwW+/EbKn3caJC?=
 =?us-ascii?Q?+Rof4gOZJ1UuALpzYFabfNUhAhCC4zUjrce9mNtJMCrAx0stUnySu3MciI3e?=
 =?us-ascii?Q?DSHT9MlXmat/FAPKLIw5qMKPfEuvLFbgGop1TCiLyoj4QPUwcVqRjz02etpK?=
 =?us-ascii?Q?LIgD9wUmYQKymUZCWKIWp+rqgpfgmxQ2A4As?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ib2FD6KYiJHkFq/xAns8bzeUhGrdhU8OPogdNOBaeZ2jD6cNMdmNIaZIwZ0N?=
 =?us-ascii?Q?HLK9ZC+WgadxwWCkvnb4SZlnDs8g+W5TwXXmNkVlw68IJ547pbyzgW8oW1jr?=
 =?us-ascii?Q?degLp0FxfhcQ44IAUe9OjO4oF8LNagB/BNINkSaAw3FY9opIVpyo/+gpsFTn?=
 =?us-ascii?Q?6hR8U0dNERdgPUXIRL+bZGSLVh3hYBGNFSOJic+v9zJPclAYaYsb0FL8k3u2?=
 =?us-ascii?Q?QwR452Wyym9T/83LV1WB1rjrfkw/BMN+Do5YJicKkdbGQZcSfshZl2aHS2NY?=
 =?us-ascii?Q?eQVhcZ+Jlas6dyuYS/An/xg8debakDytC3Gi+iyPTszZZDrrNrtOHE84sMHf?=
 =?us-ascii?Q?3IvGJmTEvDgd8ikwMXxPk7NRWIFBWh6plwryH/X72UU4+btdl1AcG5VTgXM/?=
 =?us-ascii?Q?NLS/xQJorkQvueeEbGr2AvdtvBW2U3X98t4vr8PuU8wpNULBgNqfOQHwsJZz?=
 =?us-ascii?Q?2q57Ujfz9lg+gAOkZYjaKbCfSf4NSHWTLz312+CpwQDpTH57L1f8QluDM0vc?=
 =?us-ascii?Q?4OXfOvvFbHdll5PQPL6L6qDKNVMCwNTdg4PY3jONpLLo7a44RRb4ThrztA5d?=
 =?us-ascii?Q?Gs5YC8yjP/cAHRuBbGBqOEEWnSEn+xVR/WmZwQcu8DfyjDwHx3uiK+qABXb3?=
 =?us-ascii?Q?1EsKuhGF10Y+FMUHN0n/B/82CvgDuXonG9Hnsac2tGpDId5gFjTbkZkHxMb7?=
 =?us-ascii?Q?i/W42LMKxmQAre/RPNRzYQ7YyuiIWP/NXAwEdZjZ3ypuowJ3m11HJA57Te+0?=
 =?us-ascii?Q?6Bv1Jt/YXm1t7ACf0c6bMdrxAB3Q78KeDm+yDJjXAnrKvIbJy3hZO8ATXou7?=
 =?us-ascii?Q?dAfF6cs6B8oXuCYZcD8ZcelONdrGgTZtGf47pMDPFGwhRcBgMPdeqJvQmp8G?=
 =?us-ascii?Q?SxgFWfp7mKBkeonOoyg4w0WWriF4GDuOKTBm23Hh7ihpDICVelZ4Dxgvy8W+?=
 =?us-ascii?Q?o/cejDEUQq6rCTy4qV2Cj/0URMutnsZIZtD2ZZJf79J/poSTbIl6qBtp+06o?=
 =?us-ascii?Q?q8D0VGYGaZ9lXTlDCvsRlFYPyYVdXlGmN3ciy34/S1tSDO3TNYcg00iNe+NC?=
 =?us-ascii?Q?nkq15svGzCad+l8xR37HYurpESowz/Hpq0qBpvjIxpUFHSSGozs+Bq5r83iH?=
 =?us-ascii?Q?54QrRDh/jAneE0MD2mLwI78rKgNf3aAUCvD2tbDYZmLbXQgkgmTGBke2AU7y?=
 =?us-ascii?Q?rIaiIdyNPsN6FOVzEvjLSCJQIuAGv1AAXnssSaRbs0lEptJPYgjN9utfL9n3?=
 =?us-ascii?Q?dOFFV4VAjrTKi0szm4VD97NJqRz/u6q0JPPyMDAoezozPPxHg2Fy9wTC9cT9?=
 =?us-ascii?Q?k5zn99YD61T7wUfV+a8EFqWmZJHQj48upgtM96Yo9BRJ5Tf3yj3zXEitmjaW?=
 =?us-ascii?Q?JpOrlddPUC7Lqhip2/uzm4NHyYDlCxz/9n2kKNiAYxypuwdlrcJvtygtzBvv?=
 =?us-ascii?Q?aK8DkqKNXBDKVt4h2+6ZG+44lYP3uxVX4AfWCciUnk7BLMcvalNwCy+iuf6c?=
 =?us-ascii?Q?SCxiLSDMeb/SHXXacoiWBwxonnvEdm13pB3aMpa6NI7qdkyhKJ/fNisGq3Vs?=
 =?us-ascii?Q?WAmRxU7uKMnopmdwJ63iErCq/oTEQMcaOKA+1hXG?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba9a56ab-e945-4024-7ad6-08de18b3bfcb
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 19:29:23.9876
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w52wU8+yPTXpocRWQIuwKkKbKRh2uYx0BCfTbKFy+thBvQR8dwEuhM9JW0r3KU3yNigTJHzKs3bu7HV6jYvqkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7596

On Fri, Oct 31, 2025 at 10:24:56AM +0800, Peng Fan wrote:
> Add imx_rproc_cfg_imx95_m7 and address(TCM and DDR) mapping.
> Add i.MX95 of_device_id entry.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/remoteproc/imx_rproc.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 1fb17701964ca4ee4b73d343b5ec1be8e2ee5fda..63f6362c0b8a3eebc92f2d631fe694ca7bd4c03b 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -127,6 +127,18 @@ struct imx_rproc {
>  	u32				flags;
>  };
>
> +static const struct imx_rproc_att imx_rproc_att_imx95_m7[] = {
> +	/* dev addr , sys addr  , size	    , flags */
> +	/* TCM CODE NON-SECURE */
> +	{ 0x00000000, 0x203C0000, 0x00040000, ATT_OWN | ATT_IOMEM },
> +
> +	/* TCM SYS NON-SECURE*/
> +	{ 0x20000000, 0x20400000, 0x00040000, ATT_OWN | ATT_IOMEM },
> +
> +	/* DDR */
> +	{ 0x80000000, 0x80000000, 0x50000000, 0 },
> +};
> +
>  static const struct imx_rproc_att imx_rproc_att_imx93[] = {
>  	/* dev addr , sys addr  , size	    , flags */
>  	/* TCM CODE NON-SECURE */
> @@ -1444,6 +1456,15 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx93 = {
>  	.flags		= IMX_RPROC_NEED_CLKS,
>  };
>
> +static const struct imx_rproc_dcfg imx_rproc_cfg_imx95_m7 = {
> +	.att		= imx_rproc_att_imx95_m7,
> +	.att_size	= ARRAY_SIZE(imx_rproc_att_imx95_m7),
> +	.ops		= &imx_rproc_ops_sm,
> +	/* Must align with System Manager Firmware */
> +	.cpuid		= 1,
> +	.lmid		= 1,
> +};
> +
>  static const struct of_device_id imx_rproc_of_match[] = {
>  	{ .compatible = "fsl,imx7ulp-cm4", .data = &imx_rproc_cfg_imx7ulp },
>  	{ .compatible = "fsl,imx7d-cm4", .data = &imx_rproc_cfg_imx7d },
> @@ -1458,6 +1479,7 @@ static const struct of_device_id imx_rproc_of_match[] = {
>  	{ .compatible = "fsl,imx8qm-cm4", .data = &imx_rproc_cfg_imx8qm },
>  	{ .compatible = "fsl,imx8ulp-cm33", .data = &imx_rproc_cfg_imx8ulp },
>  	{ .compatible = "fsl,imx93-cm33", .data = &imx_rproc_cfg_imx93 },
> +	{ .compatible = "fsl,imx95-cm7", .data = &imx_rproc_cfg_imx95_m7 },
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, imx_rproc_of_match);
>
> --
> 2.37.1
>
