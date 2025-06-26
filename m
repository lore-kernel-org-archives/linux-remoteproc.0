Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012061.outbound.protection.outlook.com [52.101.66.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B5A2EE988;
	Thu, 26 Jun 2025 18:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750963820; cv=fail; b=UxWfhwn6p/v/bFjoXAXXKPXrM4aHxXs8kZgnNr8UeZgDfKAn1C8qelpEC+RHVHUaNEIQ12cmBCiyF+Z9rBpL8B+/nRB6jawHqXwpd5cg3J+DSocgwcyYtxSEG4V+gF+2omt5IjCb9C0kIaqwQxxX91iqVv2F/ROc6YAQxsFlCTE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750963820; c=relaxed/simple;
	bh=jg2ns/s4fY6c6am+l/PWiEe+UsyjWtp3UbQ2HQP6zlA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Rmpx+kVUYTNSYGZUFWRIpm8gVnw/b2JbMF6L7bt8tLm646emYi+m1+tngkM0DKL3wMUNX5xiXwBXHCXhOrf+UvvjBgLilDYLh24csgPJ1YXQYf6WNhrZeUBvztlUUFtToppPGoYlub6pReCW9s3yag3GC2ryBOYyp3OWy7t3IKs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Lqt9dlgC; arc=fail smtp.client-ip=52.101.66.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Lqt9dlgC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ThpJT3z/LVrRPtPBHgijodSvviR4qu2CqDHxO61Qycc9tD/sWhhH4bOEEKuHuw8AzyOdBv8ny1FCpTVN6tTeuBxoDZUjX6gQNGPdjZrbbgSlWYgfUx54n5cTIIvQD6B29LRGhzHqv8U7BINg9YEGIYVa7VbPEmM+E6tDTXqunbvcuFbsvOvAfwh+TFvXb5G35UDYDbxroJOOkfhaHRdPmW7dpuReywjqbXED9xCntX8Fhw+Bs3hD94skIga1rsw/crfYX92RxcT6WquYL98UFkOw53AXbLX0yIApEJWplEYlnPwWTeDYTVyXQyH8JZhrq2ENVW8mEIBm5Ch5XoKIqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5tIcEureHNlUn+cSkut+kFXCg2PK/m8n2Y7m69ocSJ4=;
 b=OR2+SGfn3vl2zV5+cXwvQQvihbWguoCGoHhhF1D5AvWnIXF+Y1+TDd8CQQjJ1Ewcs4WHpZdv+4f9ofqKVPLzV7SJwUHbeXClsVX+z5OXE9bSCRtDc5neZk8TLqHz2bq+JALAD+7kU6MYEEPTrc5Rrz/itvZGueXa4u7X2EXRhYma06RPrhkktkzg/H96n3s/szgzU5W3amR+NokcUdKq9Bep9yO0vPTWa5A9Conp5wS7uXIu2W1mRpXScL6LP3pVmtAmB7w8z/z1WtTGR+9sFt6P4tKF0twK0LxgH8NoBlok5on74LGednZJHuEuK2bhUkjKVzso96PFcs+2f9jN1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5tIcEureHNlUn+cSkut+kFXCg2PK/m8n2Y7m69ocSJ4=;
 b=Lqt9dlgCP8L1k1bR0ZNjgtYknq1pd2pULf28ePGLZZv3Ymfuw024AdpYY5oDXknkjkNTqkg4hnDvzdxNsyxSd3X3pESS33ehhRYyJQXGsnhcRtlQxVBDoGKdwXqxWZdueJcVrve2xRYlzOymDwYxX5nvKWm55MLnGovwU0H6I/+A+fcuD7H8i2d0nLSWbYBYhNQVRSnq019jA7uD7OVLWWjK3i/gQxrowYzC/izKVM40KgL9p+g+R7E0fxB9Y6U87Wa1hgqjUVEiHyU1FFpvBeSUyZTXxByOXI4KsYUZBAvoS4Tgeo0r2p7r3ejG9FGAGEnefc7EwSGTp/u1ELpswg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GV2PR04MB11445.eurprd04.prod.outlook.com (2603:10a6:150:2af::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Thu, 26 Jun
 2025 18:50:14 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8880.015; Thu, 26 Jun 2025
 18:50:14 +0000
Date: Thu, 26 Jun 2025 14:50:08 -0400
From: Frank Li <Frank.li@nxp.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v3 3/5] remoteproc: imx_rproc: Add support for i.MX95
Message-ID: <aF2WYDiVa3N8W/He@lizhi-Precision-Tower-5810>
References: <20250625-imx95-rproc-1-v3-0-699031f5926d@nxp.com>
 <20250625-imx95-rproc-1-v3-3-699031f5926d@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625-imx95-rproc-1-v3-3-699031f5926d@nxp.com>
X-ClientProxiedBy: AS4PR10CA0019.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d8::19) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GV2PR04MB11445:EE_
X-MS-Office365-Filtering-Correlation-Id: f4a8b242-71b7-4c76-735e-08ddb4e24938
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|7416014|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YZ4qBrY3PHNicb8rwgEJKQNoXIZvMhYUe/QNEkcC6CO2TVhBROFqoN/Ph9YM?=
 =?us-ascii?Q?cRbIobCvf0iky6Q+lUmLKur0VSo9r9Fw049kBgvm35jlNCfhpaO7prSZi6Eb?=
 =?us-ascii?Q?RK2szfYRyid7MQgtGd85ne4yC2X9pKfWGUpJvFPn6xXhJcIWnr6QW92soaWD?=
 =?us-ascii?Q?WirY5EHKdR0eYjVd/e3ABTqdkLt3ejnTZY0PTkJK4vkWr1i1Ls6vPYln48m+?=
 =?us-ascii?Q?pVlNj+mKyxypmhVnuiPa4NDGSkI2rPAm17LSgeXVpyitwpDn+JaFovS2NZYr?=
 =?us-ascii?Q?ewAGuvOzCQ3ohOUvM0dbiIUKrN1PTex0IzkmPU3QCnDGei7gSbyqQseVdMbw?=
 =?us-ascii?Q?W4Mrx8coNyI9qCJJFF6AsSHjRazGk6Ut0PcrzrXMso6lM9sWu9i4TQwLlf83?=
 =?us-ascii?Q?pkbDCWB27aQMwiY9r7oDy44SHjGLxBwmzRKJCkWPzpHcYbJPKoaeSjcjWlKA?=
 =?us-ascii?Q?t6UJP+lfnSx/eX9wPEueUuQQq7zRTOjo7TVNqkDvvZZt1HJYyx9Oe7rQUwod?=
 =?us-ascii?Q?XWGB2q1aPLYAGG70PlkMHHCAmy9EUbv/w46ASa+vO6TIG0sHCdSsHyZ0VYOH?=
 =?us-ascii?Q?v/ZFGkwvUoDhWNjfvTYW2o9Jsoa1fzmea0tdGq2ZUbGRfCmSm5KYOUJ6GjCc?=
 =?us-ascii?Q?ENk2lUIgWR1+vYZllQ2un64yoCx3fOKoJ5Fc82lmWfb1LJDltlbfWR9CtFb3?=
 =?us-ascii?Q?zBuNuE0BlinVNWDDKsyOmA5vS7tcft+inYKw2uW/4xrtcLraG5ci7emxz4eg?=
 =?us-ascii?Q?wta9BJ4k8uCmPXPzHbGvxl6Ulo+JW6bBv9YKbBrayhrbkk+xuHzqmqW2TP5h?=
 =?us-ascii?Q?QGdYZ+rOkyLC6TZygisxFsagh/KI5XVTQ4ZSN3Zs9LUHUbQFaHVfIH7E1iGG?=
 =?us-ascii?Q?E0uR7iZTCm0TxheXlxoeuqMA9mgab8Bcik67fsW3Rvw+nvrFBnrp0i1MylR2?=
 =?us-ascii?Q?xHTKYpHXfONdjryDr0Zh8D4R9IgZ5u+va1vj7BzD7fiwLEPFtWCvr4BaVCY1?=
 =?us-ascii?Q?y3JFpA3hQJ8jJZRIaEYc4zG6JkHMcbJ/lLiMWzhK1yJv/5HZQH9TYYLzK8wD?=
 =?us-ascii?Q?11Li5DJ+bKF+TQ8zZ93K5ix2PBYwGP5Ju0l4spU500lNQaI4MZ+DsNb3w7IL?=
 =?us-ascii?Q?kbNU0nsw4JTE+9X9U1kwunESssVw8ASQUTuTPA4ve4ZjDSyUwgAKWGoEDXaM?=
 =?us-ascii?Q?kkIhqaQvfEJrORJkh6/m4VTVcwmhRgJn2VckUlfgb3OJFfNxRlwVLB6C4bZI?=
 =?us-ascii?Q?vfcuNGeNetM3e8EvFxFtr1Ktubnta+8W9wq2bUrgmevq8tRzjNIJaGIjT1aV?=
 =?us-ascii?Q?M4XY/fGFphbHS/BdPwYF7OnBBiaFWdi3HAa9bBs3+rURWExoheUoOoK7hOl2?=
 =?us-ascii?Q?8kCNRy19WgOLskarFPNZK88fYcZtL/DbED1DixJLSrJFjmP/8Z6+sg0ni+Iu?=
 =?us-ascii?Q?yF1MdBsbqegflaHloeK0xJ7sQyWpfq3zWWDM7Ir6++ya+yOvzLQ+hQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(7416014)(366016)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bLDlpwrzR+saojKjlVQcT+kmUuILXDFv/NAAZgztYpbgAK3Vv/ERexFJe2Hy?=
 =?us-ascii?Q?xEKZefMYZYQiSzPqDa77DF5zWVEcK72dzycuMwKWfOs0FzLb+YlenPTGdtW2?=
 =?us-ascii?Q?NbWu8H+gLc52tfefhCdEET5MwzhtwJqK5PSSHesEERifENdDHzrephRo2kAq?=
 =?us-ascii?Q?j+qTWlzPfIiQNL6rYTmIgsCISkHU8Mbq+OmjR/z77r+crBtfoMoNTXJ+Xxza?=
 =?us-ascii?Q?sW953eXJPdlgdQfbAYPzOwVlZRKBssq/WvVHfvdn8dOciwKXYBoEuEcF4IVx?=
 =?us-ascii?Q?yovWbf6Pg5WoNvK7dpaPxwEae4tivQukQUWPiEt5/C/yGIFj4N5t5wiXsjyG?=
 =?us-ascii?Q?92Oue0NA9rOTEf1KOtgoiJphzoINYyBZ0+coc8NOkjnRm/eY3LK79WsL/83l?=
 =?us-ascii?Q?xY1r+T9ivEBLw7rGeHEE8fYzVyjweh/zfz0yW1w2xQX+PMxYXvY61HEdKzCi?=
 =?us-ascii?Q?cF57FmLFn/BvNPd21VZqbz5EGcX5D1qg71OKQ04zkVDI7Wz8yHtAC5Rv7CzJ?=
 =?us-ascii?Q?imyepen4wqNlDjn7l6HTxYLS4WWIITmxmLcImSX1W2CJPs8PK3isFsqEHZF+?=
 =?us-ascii?Q?GDghVTwsQ0RJL9tEYeTGfOynUzFzont9w9iJrAJPITcJZ7O8jJg/lPzhbrqt?=
 =?us-ascii?Q?9Qt+YZNNgDpUbow/ZGXunRCxP7aNfwXXVvN1NboL4IiR5VDeyUs37fJaTNrz?=
 =?us-ascii?Q?I5LzXDVuzAFZhZV9GuKWZm3pJ93w7pyNv+EBANul/FkXcHFxzdvrrqfUP+iw?=
 =?us-ascii?Q?I6bbnESlbxIP3hm57WIJchoUy6YONnQ9/aja66vRRZxuq7o7slyFzKCBhcbW?=
 =?us-ascii?Q?IXimM1DxwSr3reCQTFum87gxVkgjJlZHN59rGaLAuA9e+CzR7GjRIo5fQZD5?=
 =?us-ascii?Q?S902M84Z3DkQfOuaKtQgMwD41IBQ+YMU5iC22kisBBshjcK/inSwgNjohznd?=
 =?us-ascii?Q?XuvxWI9nX8UDlM9j0tMYiijN8umA6k+SyatL1mbjDEQxoPHRmz0e0Shg802y?=
 =?us-ascii?Q?RK+FhsOyxVS/RXGKt3xbl+fN9vloL5uol8pSi2E/y6wdFnFjjmvM3fmHx+Bf?=
 =?us-ascii?Q?DxgNrRy5/pwa5dmgrbsWj5NVjhgTTEd2tKlyWNMywqcv4tLgsqCG64mcDk/o?=
 =?us-ascii?Q?nroKaCJmqPfsjHg0LlJwWqJnQYgDhWhYF7dGruCvHZU8gx4YO1c8zrwa4mgd?=
 =?us-ascii?Q?PePCLXEeKPgettWVwmB99kFUYpdEIVRzbRTKVE6jTGmekyuBczQu8X165qRT?=
 =?us-ascii?Q?yDaoJX4EwkTIa792rvwWVFPW1Op22Cx75k2GKk2MyKDNbNh6cobGjuo8xMya?=
 =?us-ascii?Q?lY4ziTL0ytIT9nyD4F2xcbkoR4lHtncPhThAdkmfTaoXeXyLVk/xDAkTmOxZ?=
 =?us-ascii?Q?5SuCfM6oBuwl5sIyel2kHVGF9NJBetWklAp7vSsLHKaxLF2bI6T8LyCixa+4?=
 =?us-ascii?Q?nHfplgM8p8OVrc2DNJah1MghSNGxXwTJJPCmWdw8JPcvcHyvy8XhsvMtVEgt?=
 =?us-ascii?Q?ZkcIdJyWCr9Rlmec5MCWW/R3E9bh2neLbzg+R/PtkdCGOTQLrFl+jpk1zkYn?=
 =?us-ascii?Q?TFQyurq6iQIQvnzTbeQl8HikPREAV3y6oSEQVSyW?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4a8b242-71b7-4c76-735e-08ddb4e24938
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 18:50:14.2134
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ycJ5SixAj8nJFj11voGm07yZWxTcqlQ1lfQ3WeP6CFdpUmrnjNJC5PhLFxYmk+D+rSOB045TN2+6ZAsteE+3Rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11445

On Wed, Jun 25, 2025 at 10:23:29AM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> Add imx_rproc_cfg_imx95_m7 and address(TCM and DDR) mapping.

nit: generally, need empty line between two segments

> Add i.MX95 of_device_id entry.
>
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/remoteproc/imx_rproc.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index b1a117ca5e5795554b67eb7092db2a25fc7de13b..c226f78c84ad180c69804116d6cfcab19db6aaa5 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -73,6 +73,10 @@
>
>  #define IMX_SC_IRQ_GROUP_REBOOTED	5
>
> +/* Must align with System Manager Firmware */
> +#define IMX95_M7_CPUID			1
> +#define IMX95_M7_LMID			1
> +
>  /**
>   * struct imx_rproc_mem - slim internal memory structure
>   * @cpu_addr: MPU virtual address of the memory region
> @@ -126,6 +130,18 @@ struct imx_rproc {
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
> @@ -372,6 +388,14 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx93 = {
>  	.method		= IMX_RPROC_SMC,
>  };
>
> +static const struct imx_rproc_dcfg imx_rproc_cfg_imx95_m7 = {
> +	.att		= imx_rproc_att_imx95_m7,
> +	.att_size	= ARRAY_SIZE(imx_rproc_att_imx95_m7),
> +	.method		= IMX_RPROC_SM,
> +	.cpuid		= IMX95_M7_CPUID,
> +	.lmid		= IMX95_M7_LMID,
> +};
> +
>  static int imx_rproc_start(struct rproc *rproc)
>  {
>  	struct imx_rproc *priv = rproc->priv;
> @@ -1301,6 +1325,7 @@ static const struct of_device_id imx_rproc_of_match[] = {
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
