Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010051.outbound.protection.outlook.com [52.101.69.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44BA30BB80;
	Mon,  8 Sep 2025 14:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757343349; cv=fail; b=MPdOFIWHxpbXbIfqdBHd61IaQlgd2N2rMohIWfe27Fyj1nt1SuZUZDZfiyJXLPmGfXTrtKDhpe0rXlce/9H24we9oR+JgWO0fpKGAQy4oJzjWiDAIJIeKlD59mmusyKL2ms9nFvrM6yKKvD+oohIfdbDgUsBHe0xTB7/Cse2N2M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757343349; c=relaxed/simple;
	bh=upLf/+yv6ATVw2+y5spw9fOE7tb0Na4yVdUjNF4IFBc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=s401p0Dsvim6lBFohhRpPgpPdy0+CAwUGL1LJGHgo/v58ax34EspzBZugBZpN7sJkUdxHDHSLun05RLaVk9GmP7dH7Q/6dW5vjJwSX5AC/tG4dvJmGykVKcxr3+OEeumbGUXHyUxZYErpjL/CkUaugRgW+Lj3vwx/JQzhYYUOi0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jKC0kzUs; arc=fail smtp.client-ip=52.101.69.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jKC0kzUs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vKHOk2SdN8ivvAcLtDZNnOeMHIa49lff2/4U3vrGoyJeiuA5g97eG8iW1jR9QJbnhPda0ouU9Uz4JQhLFpO9AokmtCNBMAGvhlW2TdE8FCnNIli0JRX5aW/ZzrH0iJRr1+ePQ7r0XIb5DeLtJ8EfSVKY4t2GiiE2v0vFfm9INYryL6u09dq3JRk8HZzHXOOvM+xMihjOM99tplLXF7tKdqNAGJvpIy1KfY5WQgqrvRaFk8FqJckuVj4CsTXGolDP2gZ7F6izsHvLXEfvePtjGftnTO+UaEtvkN7/NTYNpn9m5XQ84jHfwvh9ZLCxPZDjnomvklmyDuyKUzUIHRtk8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rFyZamJ18HYYa1xgUEHNjHBItusdBkXCEvUsGSW2t9I=;
 b=c0jhDcetaDq55AlKb0DBUR4iw+jFVGXf3xbq8hn/FZohPEKxmPzftSA1NTOZlyeHbz9MalRKMLi75MO4fFtCJcB9z6n2nI39Bop/2PUobg5OrzXDZ0MoL0MJUBu1uBEn/MXq39y0wUV2kKiVZ2/pNVIwwyoIdCAABcoMKXiQrwpTJq7rf2KPro7QA/zr/+vSajh4okIHz0URNwL2OX7N8yiTsSInoZ0CCedgcURjo7kx6/po9e0JGWaMwQkMCW4/RuSyHxWetZ8VJnKzzXVXpHki61lgtSoxtS+K5u2Ryse++gqnBnQ5HJu+4lRNLzncH0/Yjaj4toRQqWR1Wv84bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rFyZamJ18HYYa1xgUEHNjHBItusdBkXCEvUsGSW2t9I=;
 b=jKC0kzUsovD/wK4Ji3w08McF6XlSjRHj3YLMXtepan7lkLv/UEtwkh86Uf9FB3pb5hQtKtFM6mI8lXcWohp0Ubs194aDDkRzzRlt4Rx7iIrLy8EJdlWDh+4PjY2m/9pVh7vNM04rW/LRIZzFNq7U7X/SUlKJjB0SWS4khkWHSmX9On9vds6rFJrtxb1dUiFUrHex2j5zCtFwwwHEOZ7cgwbJsyMiPtiI7xsO7ND/aB63AzcJBNnyBoQhsEHF5QaBLyD+7y/BUYw+fH4sDChYcjw4lImqohXQ7ksy49FafBWoiJ+0kJs5yklgYj9r71Wp5+DP9WLJlcEJe0VgQtyEtQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by PAXPR04MB8911.eurprd04.prod.outlook.com (2603:10a6:102:20e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.14; Mon, 8 Sep
 2025 14:55:42 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%5]) with mapi id 15.20.9115.010; Mon, 8 Sep 2025
 14:55:42 +0000
Date: Mon, 8 Sep 2025 10:55:36 -0400
From: Frank Li <Frank.li@nxp.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Hiago De Franco <hiago.franco@toradex.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] remoteproc: imx_rproc: Move imx_rproc_dcfg closer to
 imx_rproc_of_match
Message-ID: <aL7uaGSF1+yiy+qe@lizhi-Precision-Tower-5810>
References: <20250908-imx-rproc-cleanup-v1-0-e838cb14436c@nxp.com>
 <20250908-imx-rproc-cleanup-v1-2-e838cb14436c@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250908-imx-rproc-cleanup-v1-2-e838cb14436c@nxp.com>
X-ClientProxiedBy: AS4P190CA0042.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d1::19) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|PAXPR04MB8911:EE_
X-MS-Office365-Filtering-Correlation-Id: 2511329f-b4a0-4622-515a-08ddeee7c895
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ERkihM6R/PcOIzUeiwtGEv/otyJtTq4y5RhDp/ggLDIvv70BR/HzpJ6oSzya?=
 =?us-ascii?Q?pBPz0moGMyxuLy5l3B1Ia9zisBTWO0y1PPbeMsFmeL9JeoiyCLBPYViqok27?=
 =?us-ascii?Q?XFs0GeIzPDGCLDeRYLuLKwgxR2QhjHq9pCmhDaVTHtrBWE10xcH6AOO4L2Jx?=
 =?us-ascii?Q?ueDFgQqTsEs2MYIZbuWEeqLFQdxuK90VmMI9Wj0CpV/Ty1lrmoeDi0y0SNwx?=
 =?us-ascii?Q?AGcPnDJhqlp+xIlKV2V9Sl2erbIBEN2e+qQv9rTs5jeDE24fsVz+wCRMwyqN?=
 =?us-ascii?Q?D/RCebXlTr7Emevff54lg/ynx9lDNvNcYaylJtlngCmE/H2ie+r340Izf6BQ?=
 =?us-ascii?Q?f1ipby1RxFc1DGt1nUt+Ygh09yL0VOzaI9y3FOKJuNJIc5XCRZbaWhDzv5Qo?=
 =?us-ascii?Q?pL3G+3yI/IrSmgqHwO2FaBAWIhxTEmx5DMv8rAHoFBNaPy3M2Pg2Qp10rjSB?=
 =?us-ascii?Q?1yJZux9Dyumd1qVBdLDjSZ+uEVwWew3l51zImYKGTW7Ib4ZNg0T8jJcgeDaf?=
 =?us-ascii?Q?x/Ab2UcpV/AwzR+86+DK/RoJOB2kW16nPCBIq4lQ53lsTiZa6EqrMlRRmcBf?=
 =?us-ascii?Q?52xHtRui0KoHj57Stw4hAsG4L0fw+OA0Sg3A68QHqPjcgCnZgI7HC7MQEBpI?=
 =?us-ascii?Q?AqIidyjuvGae6IDYHfwE4tf37HhlYOE3XhHQDfOq1hMZqKuZUdHHYmK3IoHl?=
 =?us-ascii?Q?/mbNTmk70iagyqSaZH1r1/Q3gKSSwERrMlSRKpHDYTNQZUGnQ130xtyiyVyN?=
 =?us-ascii?Q?3v55Ks8EgWEBaT6HqHo7qb9oXX4fhGcWqmZ3HpgshcYgkPCUL2F19uE/aoLG?=
 =?us-ascii?Q?uxHV/IGx/V1wSTmzbhqX8Jbpfd5Wn+Dr8tB/3gNOGdqjcuWtIYQMsOiDcLkM?=
 =?us-ascii?Q?fxfxgSawq3Obt7aA9ch2Ji0Ls2N1Beo8hhXuuibKRjAO2l23rervGa8QpJcS?=
 =?us-ascii?Q?gU6vj/Hm0B20PZ2Kk35t7hQtQ1UG+6DaCM2PUSHj4v/UcVlJFf8k3Mr9ZTiL?=
 =?us-ascii?Q?qrBKGgNoMIynlSHuVFwTrrIK3FUoTzFnXvrKjufa0HQYtDZ489seJOshmKM9?=
 =?us-ascii?Q?K/RaNjL86zLGmQIlQbjL67kJOj8OWfdKkWbWiDhrXkKkcyCUQ6SBsbyPwOgo?=
 =?us-ascii?Q?XBX11ovycDErctpqgJziK/P4cTYKfLgL5hk0Rk3Gjmt4VxJfzCVLgxO2NuzJ?=
 =?us-ascii?Q?PTj4u1QxQ7gRYrRteFgayldAvO6p9zCCDSBJ7y+JLsAp5//qXG4s8mg6c4Sb?=
 =?us-ascii?Q?n5WumfX0X4E1YaQoIgeN+V9CjQ5dYI9aqMDgpwG0iIslgsr4MxsUd+vD1Ym6?=
 =?us-ascii?Q?0OBPQnlXM09Wlf/cTdLYlZYmVcrRmhMwIlLj0YJAR5Fb8cVfssgU/nKcJ1ge?=
 =?us-ascii?Q?BE0x5ggYi/dV31QkMeOcmmXwwAKOJoRcJ6N0mSSz1caGSKdKZS4pIHcZvivz?=
 =?us-ascii?Q?w0ifNorEgyiovjJVnIUXsSxnjzWj3l4rV/UfBTsv36P42/afHo9D9A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7TcX43A5TAxAfVVjr++1jGZnxhjqVk2UmRShHca0lgFvNdSogIea+4xKj2KJ?=
 =?us-ascii?Q?eyD/vYaJBQ7tGUoVc54bIlIaO73k/cQ5ACcOnFfe/rARUgkSN7uNTsY9ZBnY?=
 =?us-ascii?Q?k+pQDh//18HOSJDRsIQe3JgLPitop0BWgJeE/OMLfyaglnWEjjZua2bMSprU?=
 =?us-ascii?Q?eycDOaMKGWjJSxulrmTwD9QVdQCOsz15jCSW4NZ7xK+tg5D8y1bRFCIH+ete?=
 =?us-ascii?Q?FFfBU4Awj16niY+74Gz4gTr8fzidtCAenAioQmEyK45qxvQQHNgwwOBJj9D/?=
 =?us-ascii?Q?erX3Td3wWqxQdAkX9BgRZn1d4tnJzAz6RxdZp8xvO7nsR0KM1scsD4+pfJeU?=
 =?us-ascii?Q?sN04LKnrnR6d7kEbg1diJChkxPcsfyfsb0aXPJK58kX3njhINrjGDCYcBvgz?=
 =?us-ascii?Q?EMQWbYOVYVIwMCYqmjRVVA5O18XQqimoafRTlzdjYKbhKuQgDftPjpGcywaq?=
 =?us-ascii?Q?0ZJS1ea1s5uQmTD3w3TnT8daOfcla5/5Pye5Ik6JdxtPeIsrvZ0QCZstxGRp?=
 =?us-ascii?Q?0xSE1VNgmkc8CvqErTYnqEFUgz4QT4BVtL9seGzz85mjK6CUB2B/E+SvFWWP?=
 =?us-ascii?Q?xcMLDxIhw5NEQ3Vp2lBAItTI4TZ+NcF3/mA4xsRtISrDFXmVXCvSGAHhliDJ?=
 =?us-ascii?Q?pKuwk16iO9NFWbKsnYYpIA/3Sv3ZPjADl0CMR+83gkHn5moQjNx3nWuRs4KD?=
 =?us-ascii?Q?+K95twP1ZXY9pjPEV7tQJj0OjRg5jYx8916XG3EKaldh1mv+gclLl0fKxojY?=
 =?us-ascii?Q?Wfdo5pxE1UHmMnCd2ycc1L9g98c0o2FOEC5pnswfa4BSMT4yuVRYKd0GYsZ+?=
 =?us-ascii?Q?Hlu+oBVyR6mxPjyDOi03bGQJOYZKdPqPxKuRdoRKzqcveJ5BhybW2zYGhHER?=
 =?us-ascii?Q?nrMP+XgCnKTR3jr/UTLrKHj5d0ADmC+AOelFn1XsgOcWbO8c9kUMgL3vtYES?=
 =?us-ascii?Q?lqnKXEnUw6gCSSO5ekn6qE4yaWFIj9NTj15Yacs214+YwiAF3iMIEXc9rw6k?=
 =?us-ascii?Q?ODwRhWyJiE0YuMGv2cfPdtB9jjF4OQkpu6rEvpJhOsJm485Ia3bGRAc5FJDs?=
 =?us-ascii?Q?oRgEQa4LplCEMkPUynQlaFWLDuwzlx7tItdpL9IEDWauL5VYDdZOT+8fd4l5?=
 =?us-ascii?Q?Z1BIx7i/1AEepnHXCNeEd/OExNflDycSdIKgY1s8kF5gk0g2BY+1OpiZSXQU?=
 =?us-ascii?Q?AKcWhvNu5aueRG5Iybis/djNpUcNDPoILDkaErVI3pq8wMnnGmwkdA9eR/Io?=
 =?us-ascii?Q?96xwUh3AHSXG/a8Iwh8Q4wnZKtwySXrJ92oE/yJWF3rPBxfnBC3b/RV7RmjP?=
 =?us-ascii?Q?qC8VvoA0k/1jQMzHc0mCICA1a3Q3gCgNf2w7bsep8tiSSBd1y9lFWDCyZpyf?=
 =?us-ascii?Q?Rsn6eANv3LHsHLqCwbBUBu795GuQKAjEIVWJGMHJ+Sy/YSxotra05jxpej0k?=
 =?us-ascii?Q?8F0bD7Mo9IaS/+jdbZ88pscZ2UDrErCoIonsfwVH6qHzHj1LuUHyZCnkdFKp?=
 =?us-ascii?Q?oiimLsmnx2tPGun+/cZwHuZsQ8A+Wq4m//EOPFV7JlNKp9S1/0wssXkYX03X?=
 =?us-ascii?Q?WR+oAJYqZJFambb72Zd2jJ8hyjZ8fmT2drXcuHCF?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2511329f-b4a0-4622-515a-08ddeee7c895
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 14:55:42.8063
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /w/ibZgKOIP1nzcBC1pD1vTaSRVswpiEop2MyUp7U3S6qt9U10Hf4vbf+S/LU/jdIlu+av4ERxU4fy4w1WfOOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8911

On Mon, Sep 08, 2025 at 09:07:35PM +0800, Peng Fan wrote:
> Move the imx_rproc_dcfg structure definitions closer to imx_rproc_of_match
> to prepare for adding start/stop/detect_mode ops for each i.MX variant.
>
> This relocation avoids the need to declare function prototypes such as
> 'static int imx_rproc_xtr_mbox_init(struct rproc *rproc, bool tx_block)'
> at the beginning of the file, improving code organization and readability.
>
> No functional changes.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  drivers/remoteproc/imx_rproc.c | 158 ++++++++++++++++++++---------------------
>  1 file changed, 79 insertions(+), 79 deletions(-)
>
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 5cdc5045e57566e817170ed3c708dad6108d2e46..af7b69d750deed734668cb413b29378e5ca7c64e 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -285,85 +285,6 @@ static const struct imx_rproc_att imx_rproc_att_imx6sx[] = {
>  	{ 0x80000000, 0x80000000, 0x60000000, 0 },
>  };
>
> -static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mn_mmio = {
> -	.src_reg	= IMX7D_SRC_SCR,
> -	.src_mask	= IMX7D_M4_RST_MASK,
> -	.src_start	= IMX7D_M4_START,
> -	.src_stop	= IMX8M_M7_STOP,
> -	.gpr_reg	= IMX8M_GPR22,
> -	.gpr_wait	= IMX8M_GPR22_CM7_CPUWAIT,
> -	.att		= imx_rproc_att_imx8mn,
> -	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8mn),
> -	.method		= IMX_RPROC_MMIO,
> -};
> -
> -static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mn = {
> -	.att		= imx_rproc_att_imx8mn,
> -	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8mn),
> -	.method		= IMX_RPROC_SMC,
> -};
> -
> -static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mq = {
> -	.src_reg	= IMX7D_SRC_SCR,
> -	.src_mask	= IMX7D_M4_RST_MASK,
> -	.src_start	= IMX7D_M4_START,
> -	.src_stop	= IMX7D_M4_STOP,
> -	.att		= imx_rproc_att_imx8mq,
> -	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8mq),
> -	.method		= IMX_RPROC_MMIO,
> -};
> -
> -static const struct imx_rproc_dcfg imx_rproc_cfg_imx8qm = {
> -	.att            = imx_rproc_att_imx8qm,
> -	.att_size       = ARRAY_SIZE(imx_rproc_att_imx8qm),
> -	.method         = IMX_RPROC_SCU_API,
> -};
> -
> -static const struct imx_rproc_dcfg imx_rproc_cfg_imx8qxp = {
> -	.att		= imx_rproc_att_imx8qxp,
> -	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8qxp),
> -	.method		= IMX_RPROC_SCU_API,
> -};
> -
> -static const struct imx_rproc_dcfg imx_rproc_cfg_imx8ulp = {
> -	.att		= imx_rproc_att_imx8ulp,
> -	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8ulp),
> -	.method		= IMX_RPROC_NONE,
> -};
> -
> -static const struct imx_rproc_dcfg imx_rproc_cfg_imx7ulp = {
> -	.att		= imx_rproc_att_imx7ulp,
> -	.att_size	= ARRAY_SIZE(imx_rproc_att_imx7ulp),
> -	.method		= IMX_RPROC_NONE,
> -	.flags		= IMX_RPROC_NEED_SYSTEM_OFF,
> -};
> -
> -static const struct imx_rproc_dcfg imx_rproc_cfg_imx7d = {
> -	.src_reg	= IMX7D_SRC_SCR,
> -	.src_mask	= IMX7D_M4_RST_MASK,
> -	.src_start	= IMX7D_M4_START,
> -	.src_stop	= IMX7D_M4_STOP,
> -	.att		= imx_rproc_att_imx7d,
> -	.att_size	= ARRAY_SIZE(imx_rproc_att_imx7d),
> -	.method		= IMX_RPROC_MMIO,
> -};
> -
> -static const struct imx_rproc_dcfg imx_rproc_cfg_imx6sx = {
> -	.src_reg	= IMX6SX_SRC_SCR,
> -	.src_mask	= IMX6SX_M4_RST_MASK,
> -	.src_start	= IMX6SX_M4_START,
> -	.src_stop	= IMX6SX_M4_STOP,
> -	.att		= imx_rproc_att_imx6sx,
> -	.att_size	= ARRAY_SIZE(imx_rproc_att_imx6sx),
> -	.method		= IMX_RPROC_MMIO,
> -};
> -
> -static const struct imx_rproc_dcfg imx_rproc_cfg_imx93 = {
> -	.att		= imx_rproc_att_imx93,
> -	.att_size	= ARRAY_SIZE(imx_rproc_att_imx93),
> -	.method		= IMX_RPROC_SMC,
> -};
> -
>  static int imx_rproc_start(struct rproc *rproc)
>  {
>  	struct imx_rproc *priv = rproc->priv;
> @@ -1222,6 +1143,85 @@ static void imx_rproc_remove(struct platform_device *pdev)
>  	destroy_workqueue(priv->workqueue);
>  }
>
> +static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mn_mmio = {
> +	.src_reg	= IMX7D_SRC_SCR,
> +	.src_mask	= IMX7D_M4_RST_MASK,
> +	.src_start	= IMX7D_M4_START,
> +	.src_stop	= IMX8M_M7_STOP,
> +	.gpr_reg	= IMX8M_GPR22,
> +	.gpr_wait	= IMX8M_GPR22_CM7_CPUWAIT,
> +	.att		= imx_rproc_att_imx8mn,
> +	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8mn),
> +	.method		= IMX_RPROC_MMIO,
> +};
> +
> +static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mn = {
> +	.att		= imx_rproc_att_imx8mn,
> +	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8mn),
> +	.method		= IMX_RPROC_SMC,
> +};
> +
> +static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mq = {
> +	.src_reg	= IMX7D_SRC_SCR,
> +	.src_mask	= IMX7D_M4_RST_MASK,
> +	.src_start	= IMX7D_M4_START,
> +	.src_stop	= IMX7D_M4_STOP,
> +	.att		= imx_rproc_att_imx8mq,
> +	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8mq),
> +	.method		= IMX_RPROC_MMIO,
> +};
> +
> +static const struct imx_rproc_dcfg imx_rproc_cfg_imx8qm = {
> +	.att            = imx_rproc_att_imx8qm,
> +	.att_size       = ARRAY_SIZE(imx_rproc_att_imx8qm),
> +	.method         = IMX_RPROC_SCU_API,
> +};
> +
> +static const struct imx_rproc_dcfg imx_rproc_cfg_imx8qxp = {
> +	.att		= imx_rproc_att_imx8qxp,
> +	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8qxp),
> +	.method		= IMX_RPROC_SCU_API,
> +};
> +
> +static const struct imx_rproc_dcfg imx_rproc_cfg_imx8ulp = {
> +	.att		= imx_rproc_att_imx8ulp,
> +	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8ulp),
> +	.method		= IMX_RPROC_NONE,
> +};
> +
> +static const struct imx_rproc_dcfg imx_rproc_cfg_imx7ulp = {
> +	.att		= imx_rproc_att_imx7ulp,
> +	.att_size	= ARRAY_SIZE(imx_rproc_att_imx7ulp),
> +	.method		= IMX_RPROC_NONE,
> +	.flags		= IMX_RPROC_NEED_SYSTEM_OFF,
> +};
> +
> +static const struct imx_rproc_dcfg imx_rproc_cfg_imx7d = {
> +	.src_reg	= IMX7D_SRC_SCR,
> +	.src_mask	= IMX7D_M4_RST_MASK,
> +	.src_start	= IMX7D_M4_START,
> +	.src_stop	= IMX7D_M4_STOP,
> +	.att		= imx_rproc_att_imx7d,
> +	.att_size	= ARRAY_SIZE(imx_rproc_att_imx7d),
> +	.method		= IMX_RPROC_MMIO,
> +};
> +
> +static const struct imx_rproc_dcfg imx_rproc_cfg_imx6sx = {
> +	.src_reg	= IMX6SX_SRC_SCR,
> +	.src_mask	= IMX6SX_M4_RST_MASK,
> +	.src_start	= IMX6SX_M4_START,
> +	.src_stop	= IMX6SX_M4_STOP,
> +	.att		= imx_rproc_att_imx6sx,
> +	.att_size	= ARRAY_SIZE(imx_rproc_att_imx6sx),
> +	.method		= IMX_RPROC_MMIO,
> +};
> +
> +static const struct imx_rproc_dcfg imx_rproc_cfg_imx93 = {
> +	.att		= imx_rproc_att_imx93,
> +	.att_size	= ARRAY_SIZE(imx_rproc_att_imx93),
> +	.method		= IMX_RPROC_SMC,
> +};
> +
>  static const struct of_device_id imx_rproc_of_match[] = {
>  	{ .compatible = "fsl,imx7ulp-cm4", .data = &imx_rproc_cfg_imx7ulp },
>  	{ .compatible = "fsl,imx7d-cm4", .data = &imx_rproc_cfg_imx7d },
>
> --
> 2.37.1
>
