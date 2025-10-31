Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010041.outbound.protection.outlook.com [52.101.69.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC11513DDAE;
	Fri, 31 Oct 2025 19:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761937843; cv=fail; b=AjbTjUMpiuMCrmyT/g25JNG4ZhC2zLi97UZjPbll5OzTHycUBNgIbrVxYj2rogzrqfyddbH1cb/G/8XOs8geo/G51HGgOlvUoQYegNGRrVhIK/kwCy43pCB6l44nNTcvgYTquNIvOk39YxV9RLvdeXiz7Oo13AVuIcYY777VZfg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761937843; c=relaxed/simple;
	bh=T9C0e07B2ILejFe/ReB7YmYUM0j8yHdKtLp/REJKN78=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=WwXORPO8Br8lBfPHjUA/q1bXLt4TQ9Ud35GBJFNb4Wbv+wRVennMVFKr/HI3FUYf8m3HzQSjb65LsfF/qWsWQ3+uoIuSlMtWsFyOA7vr3BoNd+9XlOtMUh59v5Q1CsGRcM0C8dEwzWp+FKlzsL1iqnXRuw8A+wUIrGxSdRGL58E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=F25q8ruE; arc=fail smtp.client-ip=52.101.69.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="F25q8ruE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TP8eAFXOZq7iD4EoSzRCiyIuyuDpFndtNAvG3qKGwHwHn1WnUwMm/Rt0HBCf9iWc886HAGC/AhP8NgIVDqHVb/lHxv0QLvRz5nuH5T01sYYRPv/9Kzln83PQdUFDfaVpVD8YmK87kwzFGh/Nzm3LzFJADi8ZuFEV7Zyp/PyQi1FkH6ySNifqd5TXEopCx6f0CcdxQzA+Pj/2k4Mc19pV6rS+1eC9AT9165DVY+D/0WnO9LN9STYsJ5N1J1i2EWPAHf3uEXF9kF754wGTMavZCq8f6/oSf1xlXVO5Smp+eYd8xm4hA9SzqRGYjp+ydxNzksL/WVxXocArnU5S8BpF6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bYvP6hwQg40htryqYhmqCn2PjCAxl6VmTU9xVRGQx1U=;
 b=kVKOwzv8MtRd5PDk0QiR66GG4eQ+l7zZMC2u6u9Jk6FXQKsm6pWUoQxCUkjcer8MjqZ0lFBTocfY13aQ44oqCkD0TziWuzhO5aPLDWrnpmzoVOWzvjI6dMX/GdbKP+IgR0w4EM3ClJraaab27KhZ/3jnex/oEABU6rdY32ndzby8NMxNLgcCyURfDcnxnrsx1nmLJJW/Q/HcrsXwrYGkatP/z1y2y6x9ZevH1iLbLZhYvJQwtGi0VLAiFSxEmdHuHRZD4mBBmH7rBjKcwCYh9EmOvGdSL2an1zHqDyOuYiQD7LEVtoZcFFrmAsgeT7PCSmr9BmtyinGg3E8S6g32yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bYvP6hwQg40htryqYhmqCn2PjCAxl6VmTU9xVRGQx1U=;
 b=F25q8ruEV65Pz1kTGaCX+uv64/OWpu3jq2fIUVUb9P29VomizjoiHPKb/OgyCWu1YSMDXFH8rGXg8k0F/3sMPjzYsCXPbCoAHsc4NoDwbkszl03bS1hRxko69pP2rS6MfOPDWc3W49GA8omufDin9ttQ86fy8LGniF5MNKogB4BuCfUWSqodaihHvYEW1y/ikCs4rHvDfDrfA2RXn9W8SW1lmQx6y43w8fSl24lMQ/vQPyZ9B2q34GHIp1kaBr1wLrGStC848/Y+6Dwesc1+mXFmxWymp97IUi5znaCCgOrXf090iqMaLvDK5yt1kN9uKrf9A5SrmoTvHzkopqmVEg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by AS4PR04MB9244.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Fri, 31 Oct
 2025 19:10:37 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 19:10:37 +0000
Date: Fri, 31 Oct 2025 15:09:17 -0400
From: Frank Li <Frank.li@nxp.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 08/11] remoteproc: imx_dsp_rproc: Simplify IMX_RPROC_MMIO
 switch case
Message-ID: <aQUJEwjl1xx20dtQ@lizhi-Precision-Tower-5810>
References: <20251031-imx-dsp-2025-10-31-v1-0-282f66f55804@nxp.com>
 <20251031-imx-dsp-2025-10-31-v1-8-282f66f55804@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251031-imx-dsp-2025-10-31-v1-8-282f66f55804@nxp.com>
X-ClientProxiedBy: PH8PR07CA0005.namprd07.prod.outlook.com
 (2603:10b6:510:2cd::29) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|AS4PR04MB9244:EE_
X-MS-Office365-Filtering-Correlation-Id: 31f46bc7-fb57-41e2-bb58-08de18b10aa8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eg/ncAanGdCL8V48VsXPDgByHfalbF0c/eH9kArcVBbjH/3/sH4gq/le9o8R?=
 =?us-ascii?Q?ITphmwbBB0dgSSPNbB5OSbZ5k0KUOstClu0lapgUV+hz5n2OM1scLc2EayGa?=
 =?us-ascii?Q?pWZFVw8gLmhUFr2Wz3RjHmDGrssxvH7GEyu+A5mYqZGM/jC3td1s6g/tWPf8?=
 =?us-ascii?Q?1lKF43v7+CoieRGW2Kj70Sbvq/qAZRT/EKHUg52Btf4fwo0PqHCdUQbXVBWo?=
 =?us-ascii?Q?MV4bCZx4lvWXnEV9UXRLiLucj6TVzYXnrfh39oIBFTiS52fMuaVf99DLE6dJ?=
 =?us-ascii?Q?ytVXAKsv//MIQ5sw+i2+Fg/4Pvv5cOoaeIuqFffMEGf6is9tQekb4o/oBYq7?=
 =?us-ascii?Q?7Tv/OUqYkjN9CBuGe5/hZkdmF4U9WJA4NWXr+ExrZZprrjIfA4xhozoaSYH0?=
 =?us-ascii?Q?BKMUkapC6eiLFQeP6Vfe9uj+72ofBNGy/BrzBfqL+0tJlQ9+gdp5sfHu5AcW?=
 =?us-ascii?Q?TMJJ/RSXdQ60+9CaFNLo4VfNnaK0xsLKyDdmT473AXcSnJnZUmq3DOErogOA?=
 =?us-ascii?Q?8Y/g6ZZeZvQvGpjMn1cyAnd6bHRGkDJdLoAubwi1bpkoFJJM56Id1R26g9/o?=
 =?us-ascii?Q?UkQgnyWUVOD63hMrX/cFAKRUF2gKAMqVa2O0MkfzSLmf5Wx9Q0tOJ1beQgk0?=
 =?us-ascii?Q?eL0lvJXlzw9M8+zGqQrIdJyR92hmM+Q9j7AOQkY7Tcvf2I/5E0JIF67Yhq0b?=
 =?us-ascii?Q?euq/06YUtkT0COAziYwM8f2jcNdrNTIN5jJZobOSqIpOMH2mpD3OpS/KP7Rh?=
 =?us-ascii?Q?0N1dxbLMo6AgoCixM6vBw3lJops/k5myuHM7sNikd7KVlohjleepri+ryZus?=
 =?us-ascii?Q?C2J4KMIlkZQ4ZU5Xj5bvuSpiLYJaKq/qGPg4DcY1djH9MtqUTz7LiNQyBpnV?=
 =?us-ascii?Q?Xjphi3MLr4hMoCdxvzZR5LMpkvV1iKVHN4t6ye/kjLMu6cM97Rm7ZR6tDG75?=
 =?us-ascii?Q?Q6N6iB4vV+miLUIINebyWmhrFPi/YIewWE6rlxvLUVOKoH2Zh36UHJPrSQox?=
 =?us-ascii?Q?9hn8jNCbEMniw12XEYwvCvHX7QtZLPXk/7fqgVMrNd1z2qwo74fcWXlaonHn?=
 =?us-ascii?Q?MYpCtwLEgJZNsoBFP7iXdoW/KGTnddNToMsSIXweAX9NDFmdcTVj/qQxaNJC?=
 =?us-ascii?Q?b60lreuyJZpkp//t2VVZV0FvVToXo4qvReSHilYF2Rby5WExf1cEReeg1t1U?=
 =?us-ascii?Q?FlpcKWYaLDRROpJZtWTFnQxIrzxk0/V5KlD9P3V97I8FLV7Ta2uj42SPL605?=
 =?us-ascii?Q?flxpicv+k8CFGqfymvKa3QI6mc8KDWNng/1+QS32b+zuX6t7yNpkDkArP9G5?=
 =?us-ascii?Q?siD8saF5elTP5Vb7+urJbZAtZNRlPiFmIXd5O3H5Tjv3k3lgObADX8KekQax?=
 =?us-ascii?Q?ZS0l/Ti/c3sw+5v1OPyUe/85lEB1mwa7NZHqfGnSOXIYkmqf8zoTYLb+4WpS?=
 =?us-ascii?Q?GO/TesqPn49HX3vjnj9/lCTk0I4+cnXOCkuSyNSOWu1ne25wF9uSdcE+dD3S?=
 =?us-ascii?Q?w7RHqQzI1u8dskoKeyV1ybkYHnfolHrVYmBG?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HaPMHrtT/1QH4x3hmAOy6QZflOCKd2LWXSxGJ6rmGcUswS6jKzMnfp7Qy1f2?=
 =?us-ascii?Q?XUNRkhSmF48zbhRKYNfuL/H1aDBGBbph/wsk8cDrmufOIEDqAWqa0cURIQpI?=
 =?us-ascii?Q?4DtkiXtvHXjB6YfT4R7vsk9IYWFAOEi/IESHylOtrR/lCihhHaIUjo8Ozx0P?=
 =?us-ascii?Q?9ObzEJul3jp+v3JPVQCu3Zar4TSVizll2uwCWY+4sAO98q1jsHjXEyDO5bae?=
 =?us-ascii?Q?maevwtoWFAy1JYidnGqnUBkTg2+QxAbnNfLsIvZgzx/RJSZmDcPuJE0nXSbz?=
 =?us-ascii?Q?ZFbLJPRWS0x6E+ka+1EwJ85JNxuFn/bUsjFiH3hT6ezQ0A5zj47iSEvZpGCt?=
 =?us-ascii?Q?XdbpgXD2x7hkhvHon9dzTeN7lvR27PuExBpXJdENSv6y7wcEEbAooOT/hkKB?=
 =?us-ascii?Q?9z2fiekFjCyFGEPK2f4UloHGpcHs5pG7oE3XfdQjVl/pUGYbAjiu3uJKAvcH?=
 =?us-ascii?Q?+xA4sOCTDEZfDeAlCi37t8JPFlftOMtpPhDWjckj0a3BMFSLQVltNJGu7q3Z?=
 =?us-ascii?Q?3eD5J3xscXcEcXDMJydmxtYTQyozZWia9eK+zSRiaDtgMFQ2tSppzyWOSYg5?=
 =?us-ascii?Q?T2XQBrLgIcBD3kXlXMrhK4P9tafttwr2jgxL2c/nwgBDjgAZyCYP22b6ljcO?=
 =?us-ascii?Q?Fb4a8+ykEsdBhP61aDvy7cJXhv04cOt7E3aSvMOvW4NhxIlqCW74UK9M/gxW?=
 =?us-ascii?Q?iSvcl5lVhizvlqKek+a3JjdxxZLqOD8ILWxr8tehE8ED10YH0FXoTf4r9eYI?=
 =?us-ascii?Q?2V2lQ4ZaTH6rMpxyBbEXXZuGji6gbN6b91+wr71O7V2SJHKqBIOV5y1ofQoD?=
 =?us-ascii?Q?e66z0QQCX79WEmBi8uvv2sAnf3DhlyzMlsSmMNNQYnrhI0aFl1UdSwMqLgCa?=
 =?us-ascii?Q?3PYs7p/kTs+vbGcx+5RF8A3TKB525T7zgzOHmFWWuCN+i/75jVTpyrEdz81A?=
 =?us-ascii?Q?8s/VfsvKc8WZqCWhpPG8BRmXzOC8wZSZ8f1p52tRFairAv9WlajA7CkgvT9H?=
 =?us-ascii?Q?S2nScnZxGmmCGk4e4kfc2DH8QW3it6Kj7WreFt+59QUVAe0+Z6Sa3rsD8Sap?=
 =?us-ascii?Q?MjmFeUeClalpMnE0M1eA2KpeCGWd7XMKoHiURsXJBMEMimoajHzTE9ih7b6Z?=
 =?us-ascii?Q?QcVjcKLML/0Tes3dQfWJtnGl73w/rZYkVxV7/gYhyTYAYdOVqOny5OpwGmMd?=
 =?us-ascii?Q?8IMoRAXJJrWdm2a7oxKBeysKkYLbnjAOVD+6M5cABWu79/Lf5uVM+0UqnT3L?=
 =?us-ascii?Q?cMVdBCRitIFlqjy8XGia+jDGlkeTcT0jiw3un490strriaJpkZH+jR7A2B1r?=
 =?us-ascii?Q?wL+D9AGgso5xiq7hU1+aelVi7eXc12lIT0eEd41v98arz+iDK83RxEk0Nq1W?=
 =?us-ascii?Q?RsKxW5xw/lMTFctuNdHKT1w8S4M3sJKmPDXPzROM33JqB+YpGJdUdcQvrlkC?=
 =?us-ascii?Q?du7c/A5H5YP+sWTl/Ks9WT0CS91OFdvAJdN296PbIGVTpWg415JUzspDteY2?=
 =?us-ascii?Q?v0rLpTmS7PGABZ2S8ot1JqJR94MiCTm1cfrrAulLpuMgyYELlBZP7yVSngi/?=
 =?us-ascii?Q?DgCppOemfJ8Yqr84try+RDVKl7d4sY1BE/8ux5d/?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31f46bc7-fb57-41e2-bb58-08de18b10aa8
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 19:10:37.7381
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ECgfYy2L2Ao4YrRTD9p64sCMwWZCZO8LZXWkfBVZOAu2poNvY51V2GhQP0kYCmGjayaMQ/p2gVs22QQNORKzlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9244

On Fri, Oct 31, 2025 at 05:08:37PM +0800, Peng Fan wrote:
> Introduce imx_dsp_rproc_mmio_{start, stop, detect_mode}() helper functions
> for i.MX variants using IMX_RPROC_MMIO to manage remote processors.
>
> Allows the removal of the IMX_RPROC_MMIO switch-case blocks from
> imx_dsp_rproc_[start,stop,detect_mode](), resulting in cleaner and more
> maintainable code.
>
> No functional changes.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_dsp_rproc.c | 63 +++++++++++++++++++++++++-------------
>  drivers/remoteproc/imx_rproc.h     |  2 --
>  2 files changed, 42 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index f28d25cab3f1d89e5cde37a04b528870a59abeed..456a46f163d3d823a25d16d11fb79fa9fceb2ddb 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -338,6 +338,15 @@ static int imx_dsp_rproc_handle_rsc(struct rproc *rproc, u32 rsc_type,
>  	return RSC_HANDLED;
>  }
>
> +static int imx_dsp_rproc_mmio_start(struct rproc *rproc)
> +{
> +	struct imx_dsp_rproc *priv = rproc->priv;
> +	const struct imx_dsp_rproc_dcfg *dsp_dcfg = priv->dsp_dcfg;
> +	const struct imx_rproc_dcfg *dcfg = dsp_dcfg->dcfg;
> +
> +	return regmap_update_bits(priv->regmap, dcfg->src_reg, dcfg->src_mask, dcfg->src_start);
> +}
> +
>  /*
>   * Start function for rproc_ops
>   *
> @@ -360,12 +369,6 @@ static int imx_dsp_rproc_start(struct rproc *rproc)
>  	}
>
>  	switch (dcfg->method) {
> -	case IMX_RPROC_MMIO:
> -		ret = regmap_update_bits(priv->regmap,
> -					 dcfg->src_reg,
> -					 dcfg->src_mask,
> -					 dcfg->src_start);
> -		break;
>  	case IMX_RPROC_SCU_API:
>  		ret = imx_sc_pm_cpu_start(priv->ipc_handle,
>  					  IMX_SC_R_DSP,
> @@ -388,6 +391,15 @@ static int imx_dsp_rproc_start(struct rproc *rproc)
>  	return ret;
>  }
>
> +static int imx_dsp_rproc_mmio_stop(struct rproc *rproc)
> +{
> +	struct imx_dsp_rproc *priv = rproc->priv;
> +	const struct imx_dsp_rproc_dcfg *dsp_dcfg = priv->dsp_dcfg;
> +	const struct imx_rproc_dcfg *dcfg = dsp_dcfg->dcfg;

can you add helper macro convert rproc to dcfg to avoid duplicate above
3 line codes.

Frank
> +
> +	return regmap_update_bits(priv->regmap, dcfg->src_reg, dcfg->src_mask, dcfg->src_stop);
> +}
> +
>  /*
>   * Stop function for rproc_ops
>   * It clears the REMOTE_IS_READY flags
> @@ -411,10 +423,6 @@ static int imx_dsp_rproc_stop(struct rproc *rproc)
>  	}
>
>  	switch (dcfg->method) {
> -	case IMX_RPROC_MMIO:
> -		ret = regmap_update_bits(priv->regmap, dcfg->src_reg, dcfg->src_mask,
> -					 dcfg->src_stop);
> -		break;
>  	case IMX_RPROC_SCU_API:
>  		ret = imx_sc_pm_cpu_start(priv->ipc_handle,
>  					  IMX_SC_R_DSP,
> @@ -1032,6 +1040,23 @@ static int imx_dsp_attach_pm_domains(struct imx_dsp_rproc *priv)
>  	return devm_pm_domain_attach_list(dev, NULL, &priv->pd_list);
>  }
>
> +static int imx_dsp_rproc_mmio_detect_mode(struct rproc *rproc)
> +{
> +	struct imx_dsp_rproc *priv = rproc->priv;
> +	struct device *dev = rproc->dev.parent;
> +	struct regmap *regmap;
> +
> +	regmap = syscon_regmap_lookup_by_phandle(dev->of_node, "fsl,dsp-ctrl");
> +	if (IS_ERR(regmap)) {
> +		dev_err(dev, "failed to find syscon\n");
> +		return PTR_ERR(regmap);
> +	}
> +
> +	priv->regmap = regmap;
> +
> +	return 0;
> +}
> +
>  /**
>   * imx_dsp_rproc_detect_mode() - detect DSP control mode
>   * @priv: private data pointer
> @@ -1049,7 +1074,6 @@ static int imx_dsp_rproc_detect_mode(struct imx_dsp_rproc *priv)
>  	const struct imx_dsp_rproc_dcfg *dsp_dcfg = priv->dsp_dcfg;
>  	const struct imx_rproc_dcfg *dcfg = dsp_dcfg->dcfg;
>  	struct device *dev = priv->rproc->dev.parent;
> -	struct regmap *regmap;
>  	int ret = 0;
>
>  	if (dcfg->ops && dcfg->ops->detect_mode)
> @@ -1061,15 +1085,6 @@ static int imx_dsp_rproc_detect_mode(struct imx_dsp_rproc *priv)
>  		if (ret)
>  			return ret;
>  		break;
> -	case IMX_RPROC_MMIO:
> -		regmap = syscon_regmap_lookup_by_phandle(dev->of_node, "fsl,dsp-ctrl");
> -		if (IS_ERR(regmap)) {
> -			dev_err(dev, "failed to find syscon\n");
> -			return PTR_ERR(regmap);
> -		}
> -
> -		priv->regmap = regmap;
> -		break;
>  	case IMX_RPROC_RESET_CONTROLLER:
>  		priv->run_stall = devm_reset_control_get_exclusive(dev, "runstall");
>  		if (IS_ERR(priv->run_stall)) {
> @@ -1301,6 +1316,12 @@ static const struct dev_pm_ops imx_dsp_rproc_pm_ops = {
>  	RUNTIME_PM_OPS(imx_dsp_runtime_suspend, imx_dsp_runtime_resume, NULL)
>  };
>
> +static const struct imx_rproc_plat_ops imx_dsp_rproc_ops_mmio = {
> +	.start		= imx_dsp_rproc_mmio_start,
> +	.stop		= imx_dsp_rproc_mmio_stop,
> +	.detect_mode	= imx_dsp_rproc_mmio_detect_mode,
> +};
> +
>  /* Specific configuration for i.MX8MP */
>  static const struct imx_rproc_dcfg dsp_rproc_cfg_imx8mp = {
>  	.att		= imx_dsp_rproc_att_imx8mp,
> @@ -1321,7 +1342,7 @@ static const struct imx_rproc_dcfg dsp_rproc_cfg_imx8ulp = {
>  	.src_stop	= IMX8ULP_SYSCTRL0_DSP_STALL,
>  	.att		= imx_dsp_rproc_att_imx8ulp,
>  	.att_size	= ARRAY_SIZE(imx_dsp_rproc_att_imx8ulp),
> -	.method		= IMX_RPROC_MMIO,
> +	.ops		= &imx_dsp_rproc_ops_mmio,
>  };
>
>  static const struct imx_dsp_rproc_dcfg imx_dsp_rproc_cfg_imx8ulp = {
> diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
> index aeed08bdfb5619c7afd7201589f417cfd6745818..912827c39c0dedeed76c13740efd42a8e7cf9c45 100644
> --- a/drivers/remoteproc/imx_rproc.h
> +++ b/drivers/remoteproc/imx_rproc.h
> @@ -18,8 +18,6 @@ struct imx_rproc_att {
>  /* Remote core start/stop method */
>  enum imx_rproc_method {
>  	IMX_RPROC_NONE,
> -	/* Through syscon regmap */
> -	IMX_RPROC_MMIO,
>  	/* Through ARM SMCCC */
>  	IMX_RPROC_SMC,
>  	/* Through System Control Unit API */
>
> --
> 2.37.1
>
