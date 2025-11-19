Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011016.outbound.protection.outlook.com [52.101.70.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020602F0661;
	Wed, 19 Nov 2025 15:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763567721; cv=fail; b=sdlM3fhw8qGgv1p0+4/a04LxGvc0JA1VDbQMu+ZBo1GRtueoCijlA463hK6q1DAHgfRK+bbaEiF9R98VJySJTT+BdT0oNAn2cK1E6eRcZf7S8XvONYq1zek0Qj7kRUskti5ZcEhocsqOJ8CcAzap/SktgXKE/5uPyjmU2u/BvLQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763567721; c=relaxed/simple;
	bh=MGGCWrRxIf48BcDBxV/H8N6FUr3bhqzbo62rWlM1p6M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hdae0n/7YtaxhLm50vccIVjTg2ak3VmohS3F7ptCUywGNW/MIzShMKmQ3xUOj26ngKWP+Yhy1V1utzaZmwcgi9+Ws+9uc3ycGChMa+FRIKVTzAsdUd1+3Tfi06IPzDXpYomNW3zkU7jjGOte8Ew9du8ZHAqrmhctW8niu0ENTlM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ElBTd9E6; arc=fail smtp.client-ip=52.101.70.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ElBTd9E6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YkAXjLDx8ZGmjZznRHzPGo2er8xB7G6gFmlyZ+ZU82utBmlAaeTyS9Q95+xAZQBHeQ76Uns06ITmmW3uAqJrCvAEPfxPFjr5lrW3j1M48lKRzhU3DwHsi5GFijioU9ORPiVHS6yaPfa2NeCL5V0DyU1y+OFUm0wykCI9CqgCm6/pb/FHf39uRkaqb0VIKhNhE/s8jIlhAfboA+KcFVj1BhUWAU2qz9aQ8H5dJ2Uzp/S7vcv8qXHttAHTcDyXwJ0zIjJ2uM8gyB3j3CqAe+m2Yynr3MYBL+T96+3ysf4ctO5MU9K/uM81UZ+76XDe0hTHM7n/NJg9UfY6SptDklQ3bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hjU+JADUEDMUTtgUU+DAcsrYc27yCMg9z0+PcJ6tRck=;
 b=I+IRt9jyvwFEsQmDGF6IDQDWiGHgOFP4+Jmbq27c84GZSpG6k+JNK9TAIgrLzi6KsvIx2tYqU7Zx3ezi+9uNabUUEs4AY0FlaeJm8TEqdAZe1QPgH7GnLVT5Uxp/FhWKi6J60ZGYUTbKQfGzMbTMihpL6yYenr3sdzoK8CXCI5prwnwiA5KFg9UQqI61U63IjtwtNQnUMwZWuf/O5YDILiOJm+ywAtqYcYUaKmMzeEmQ+SbTs505Q31INOO3/IYNEn65VKgJQRyekfymB1frnxNtKf0GrccIhGA4HKGfYJ8ylUhneXTl6OvC+3phFkLLFy5nRsbwVcmQrmyB1Y7o1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hjU+JADUEDMUTtgUU+DAcsrYc27yCMg9z0+PcJ6tRck=;
 b=ElBTd9E6VJleEqGZk/zixWGlMiCppq595xGzrIODgppJjRjoE2b+j0S/ueRKMwwhM4rMHTyUnQXlFwFhLBPrHJN4M2zdnKl5XraYj+e3Qr7tZ9Ey5fFvyUo3tVwrWpx0uFzx0C76EmLHYFIQklTtLZ+Szl78k2+x3YLPBimejaHzTqYqpdqtT2T/+s55TYaW1+H9CqNhL0dJD2D3pYlBlUQUzRkP/K9i8DFRAWIny3wjIyISC4Uk/PCDxV+zdu4xAYawsr+Yx0lUYa1WwDuVv784Fg5uexVvf+Grcd60pvzg/wFi5cNg4cIF4qgpPMxsSbscNlIQ3FUw8KI1ObxqLQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by AS8PR04MB8756.eurprd04.prod.outlook.com (2603:10a6:20b:42f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 15:55:16 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9320.021; Wed, 19 Nov 2025
 15:55:15 +0000
Date: Wed, 19 Nov 2025 10:55:04 -0500
From: Frank Li <Frank.li@nxp.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v4 12/12] remoteproc: imx_dsp_rproc: simplify start/stop
 error handling
Message-ID: <aR3oWGzLv2tR+6jG@lizhi-Precision-Tower-5810>
References: <20251119-imx-dsp-2025-11-19-v4-0-adafd342d07b@nxp.com>
 <20251119-imx-dsp-2025-11-19-v4-12-adafd342d07b@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119-imx-dsp-2025-11-19-v4-12-adafd342d07b@nxp.com>
X-ClientProxiedBy: PH8PR07CA0013.namprd07.prod.outlook.com
 (2603:10b6:510:2cd::14) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|AS8PR04MB8756:EE_
X-MS-Office365-Filtering-Correlation-Id: 53f1fdac-074e-4d16-a39f-08de278407dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|19092799006|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?02bEY9dzX1avyV6/7L0KBWGnrU9Kru9z8IPT9Ef9bT9A5/Ri43MUGwG/jnXC?=
 =?us-ascii?Q?1dtf57qeRXnOpjDgHxM6xs4nptGlLy4B9xyCFrftwXEUgQZliD403etx1FiY?=
 =?us-ascii?Q?0g4qWB2FNoQOhK4F9PbDMJP2jQHCX9XpU340ND5dmkLQIx6lKystxg81Dgz1?=
 =?us-ascii?Q?nxkSI5Spbka++JXG2DXEoMBkYlpNKgPdHWqjqApiA+ygVRX+yp8qaCHjFHII?=
 =?us-ascii?Q?LNz+Fi5z6UWkAjbdco3wvPXEHD1t++pmpKjcH172tQQJgMrMXWA9ceJJNGFp?=
 =?us-ascii?Q?ztJfWRIxK3d4yFGVGQZF6k7fSvF2qISrR7WNmV+D3KBuUPfHcpbAHe5qeZE2?=
 =?us-ascii?Q?in+5seCrB7PiwGqs6TlvEeIV2n2ooT1nBdYO64eKfgZKqJo2Crs+6GDCXeta?=
 =?us-ascii?Q?QYIfn3WJrVlZ+MgDENtkpQkUvdyvHXfnKfqoHgLpE4Z/TtDECYDwvrgKtzvU?=
 =?us-ascii?Q?BtKtdh+e22Bh7ObrklZDi7mTKBCnWfoDmJ9J6lx7iIThg0OxqO0qiAYpep8L?=
 =?us-ascii?Q?KL8qKPg/dyC2lXojekHzDjVYF7xwQMl/m89HOo+IBff2owqFpKjKITUU7mHL?=
 =?us-ascii?Q?iWJwEl7oMWBiANLJUtXnD3mQZmy5h4eNaSUz/jGkG87L+0hxVyzsD4OVgzwk?=
 =?us-ascii?Q?2+Ny32o95mPrCI7a7FbYS6s4Pb992dhm7mpfW6w01TBuM5EmCJlGLctSUpeX?=
 =?us-ascii?Q?CJy8AqoHmOB9SeOw2crdaO/IZlgGFNQgbcqs9HTtdOMU6Kg6EBjvp+ZAzlu4?=
 =?us-ascii?Q?xouE5i94G2qrO3Jh4eKhWcR/9hbDkpHzqmZDmz9mEcGCM7wr8BlrZPWyC8fC?=
 =?us-ascii?Q?Lmy6KQr4XOhpnXoDTy+UpRqM5R/K2v0Cx/trKqTT9HGeB9PBAo7lP1jLcy6p?=
 =?us-ascii?Q?+dblzqXF5nkuvxGjTTDvO2QuN14wGVoZmdv2kNRVKXl0R2waAggoWhCxscXy?=
 =?us-ascii?Q?YRpg1XUXIw2p9ndtiPl2uk/JM6G8rUa2rBMMwVIFrpxdAP5e9XQU4VSUllR/?=
 =?us-ascii?Q?Jj3hNcxd85jd35thBMaKtVXxrsN5gMkzcLXCrMJ/pJ8MORSVhldus57E2UwH?=
 =?us-ascii?Q?da5PjWu3OsDdSaW6vaHldGXIF1bgZwL6iJeYMH3qo0Ue+RdXUxqpFM3/+12n?=
 =?us-ascii?Q?YdZ+uAamrXxhYg9CoEo17oLfC17xZPf5ypJwDdENf1e8lqcBxHE18kNnfk0y?=
 =?us-ascii?Q?carUh6ymjwf1Ac6b+tyBCbJxSeeo+1swOOS1AaE2qiBTpPe23D5Def1m8iyE?=
 =?us-ascii?Q?LqY1XWn2Vsr1j6LaKRnqg371qYXixynIvsqneDd4RGiyEA0IvXOjzoLYIGuK?=
 =?us-ascii?Q?TQeB+I2pUQnNOmsWyHA+zHer1f+Mp1IoKhUiUflrcbypLB3dE5VAPW4scTfS?=
 =?us-ascii?Q?YTz+Rv0HCHM5tutOkFGKFOQHd2gKPPknA0yw3qozUceilWqZJsEoAo43L7Hh?=
 =?us-ascii?Q?0H7RlnAAQ1P4jCOSJ5gsi2nXUSHzyvKR3cEjMg+p4j7I7o/a1fDgWxTVe2vx?=
 =?us-ascii?Q?wSaJ2k2iMNVifOiL5I+vhwIf+BsnAfTOCKgM?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(19092799006)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SzYo5YEPQpuAMlghmKxBlIaPZzaJgQggxUoV0zJCSTjwPopNuRnXTra/Ged/?=
 =?us-ascii?Q?DMeCy5wHFuiD/ofggWuUB7Coa/LYCtMNGGUyzGV6QvIpoP7EYUfyO+UBZqfp?=
 =?us-ascii?Q?JnD0VZ975Wg1P3J2Y8rI8vFtwr147ZSuJzoHnvhXj+yWDUGnw6i+VAFBZw3I?=
 =?us-ascii?Q?SUeGVcjb+mRY0kXtEFAqgrSPWYdwVLqzysuo+iW6zifGJDv/Nkixp5x47wqu?=
 =?us-ascii?Q?YZW1lzdcxldgpPaCFRoX5TPMiK8SOpbIpV8FJfQXsxAct1PzOw8/20C9PBDd?=
 =?us-ascii?Q?Ya8mDKrxxOQj+9A0ZgVGzp7XJxSPXvdfaM5CsOmQez1X02qgDjumiB58Baj9?=
 =?us-ascii?Q?F1ThAcN4MMDSEEPgNzPQPgh2r2LE6dH5zWN2RDFSafPNK8ZiKa71ok24/xwn?=
 =?us-ascii?Q?9+Bix8aMoN6VRZ9sszYswE1KA+Dthn2395w5gxvknqJdhwWichT6J98eulOw?=
 =?us-ascii?Q?ZC4kuL4q1o40KI01CdDT6o1r8Pp6yLb73IiRHLGQ+08sK+kCJcOpTM77jUPU?=
 =?us-ascii?Q?aUTP1vJn/lsAicqGUgJYsu5kleFirIyfPIMAUuTx9saWrJwnajL/ygmaRJd9?=
 =?us-ascii?Q?V6+VdgSAeHMR5GccdNaPYOFRiqUFMDa4duVmJR+BJLvKGOJYGKFAZzeSzmdL?=
 =?us-ascii?Q?C2xf9afp0Y1wBQFCwuW6SvmiAG3z57u4QNDjEjtE9WkgXAJQ3RCz2eC+qbPr?=
 =?us-ascii?Q?MR9rnb6g0JUqTv0jYrxwL/Un1u49YfHDVnYerTJ74kXzo94sJLDhiRuSjhSy?=
 =?us-ascii?Q?XzR8KjFIhNDIW/FZ8xMPx6ahILi34GaAmYV8OhbpmnP/RbfglCKV+bYxAWAA?=
 =?us-ascii?Q?KuvRynNyNsabmH2Do6npmHafCTSA32pOnb3+uPHi6TXZIexcnprZIvuFHVt1?=
 =?us-ascii?Q?8gHLM2p/WgIyTh7RF8ASSWPylRi4kXtEBH6ITGFG8kvjU0H1PDjUv6LWoHiI?=
 =?us-ascii?Q?ItposehC5crGY1GD4OXzMQciCmmOmhZt0YhBC2Q537dRZhZfkhYnNiz6VeRm?=
 =?us-ascii?Q?rUdh61+QXiEXpmzmvfkhzb3QagrEavtSIbObh+jLhckrIH75XpC2P6VMCohe?=
 =?us-ascii?Q?ZXKKePON850nMA6u7SFhKTdRcX5HlkTYKAUE/Rykf2BOo+6EOjrSmSevTaqa?=
 =?us-ascii?Q?AWxByDZ5FgHpj1ZO/jLYPdck+zEoxsQ6+lQmWFF5htIHcmYlG1I33cR3qx4N?=
 =?us-ascii?Q?BCB9m60CACrVZXIw2C9htgN8dqPDGsED3mcyMId69hLV3d1I1g82esqLhMb/?=
 =?us-ascii?Q?RYPMcXLg7O/VW3JxwxCpXKZOlYVFl1yDiey39YGBNjFSf26dKKc61rCkHe2T?=
 =?us-ascii?Q?RmhA3bLHTFZRq9vSPUOONxP/e+9aFTKlw448IF/TmHO0cNrhcF/YxjmT9blw?=
 =?us-ascii?Q?WFHnhwr4VjJK1GnK8UCrcyV1nt4m0Knk/BO9wT3BriB4xMSS9ezAm4301p4M?=
 =?us-ascii?Q?SRHxRhALi6rvokCSXme00kwifnfZOkx6qdDa+ErG1PE0Cp0tSYKLYf0V/OV4?=
 =?us-ascii?Q?Ii6yOudBERZY8i7jWIlnyLEh4XdGue8JP/uSRMa0+GqRUeKw5C3o2Wg00EaP?=
 =?us-ascii?Q?kjnkLP3KArQa1WgjpylsLpTbU9UaDakncpnvPA3L?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53f1fdac-074e-4d16-a39f-08de278407dd
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 15:55:15.7329
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6fl0OShoW3g238hjtRz8sxPyYUamEvDoHVgog/kVgD8HvJhMrMKGoN6ZDBG5PGVb7/iDUStSxfBGY3SZrCpiCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8756

On Wed, Nov 19, 2025 at 12:21:57PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> Replace goto-based error handling with early return pattern in
> imx_dsp_rproc_{start,stop}() functions, and simplify if-else logic.
>
> No functional changes, only code structure improvements for better
> maintainability.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  drivers/remoteproc/imx_dsp_rproc.c | 39 ++++++++++++++++++--------------------
>  1 file changed, 18 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index 6237e8db2eff759c2b7fcce5fb4a44e4ebaec8cf..1a1438823e7fc0a65ba15142abdd97e59692801c 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -376,20 +376,19 @@ static int imx_dsp_rproc_start(struct rproc *rproc)
>  	struct device *dev = rproc->dev.parent;
>  	int ret;
>
> -	if (dcfg->ops && dcfg->ops->start) {
> -		ret = dcfg->ops->start(rproc);
> -		goto start_ret;
> -	}
> -
> -	return -EOPNOTSUPP;
> +	if (!dcfg->ops || !dcfg->ops->start)
> +		return -EOPNOTSUPP;
>
> -start_ret:
> -	if (ret)
> +	ret = dcfg->ops->start(rproc);
> +	if (ret) {
>  		dev_err(dev, "Failed to enable remote core!\n");
> -	else if (priv->flags & WAIT_FW_READY)
> +		return ret;
> +	}
> +
> +	if (priv->flags & WAIT_FW_READY)
>  		return imx_dsp_rproc_ready(rproc);
>
> -	return ret;
> +	return 0;
>  }
>
>  static int imx_dsp_rproc_mmio_stop(struct rproc *rproc)
> @@ -431,20 +430,18 @@ static int imx_dsp_rproc_stop(struct rproc *rproc)
>  		return 0;
>  	}
>
> -	if (dcfg->ops && dcfg->ops->stop) {
> -		ret = dcfg->ops->stop(rproc);
> -		goto stop_ret;
> -	}
> -
> -	return -EOPNOTSUPP;
> +	if (!dcfg->ops || !dcfg->ops->stop)
> +		return -EOPNOTSUPP;
>
> -stop_ret:
> -	if (ret)
> +	ret = dcfg->ops->stop(rproc);
> +	if (ret) {
>  		dev_err(dev, "Failed to stop remote core\n");
> -	else
> -		priv->flags &= ~REMOTE_IS_READY;
> +		return ret;
> +	}
>
> -	return ret;
> +	priv->flags &= ~REMOTE_IS_READY;
> +
> +	return 0;
>  }
>
>  /**
>
> --
> 2.37.1
>
