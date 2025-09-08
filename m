Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010002.outbound.protection.outlook.com [52.101.84.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC4130CD80;
	Mon,  8 Sep 2025 14:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757343572; cv=fail; b=FaEFNPLS4xDye4HgFm853LutljkARxTUChynrVCRdWNObd42AEmRt/UtpQ8ReUD/vSGws+tQfO0E1yojOBwBEnj1ZJng7cy6ds4yCmPecFCC20LAxUnQuqj33tQETHrKQGo2CUu9ApKS/Jb0dSGnzgJFPPFW6109fZBPJalMOiE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757343572; c=relaxed/simple;
	bh=8KLmt6zIYTqGQUVQw+MliASMXeF9cUJrnH7X3jQjgq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=aLjhnMuzAQ4jfDCQ4bn8C2ya88EfKR7WeNaSHhi7Dnint8iLZclAMD69/hcsXHo7tvs9nMwJjLm0d3pKi+NT5NNXzXlvphyM/hqrMQZ/u+AYXWsCYEwimoetXrCH59tvVfqri3dWFm+mQTlt2Dpae1271t9qp/sxNCPoLJ+H3eA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=M/YgQrJ4; arc=fail smtp.client-ip=52.101.84.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="M/YgQrJ4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FhP4uKGjlxXeCmNPZu5lXEOKARFah6ylNS9DWXTpD8gI8/KusokhPjojw5VHa5aYCGVjgeXy0+gKcQk/DafbaG8sDUbAECyOZ1Jull6VrGThx8og9DdZ6qLoCmsdqxp14BQS4DNv8gU+6tzqv8/Jt2xT2bBsP/ZpmxAriEWrKby720V1Kp6RUF3KyaqwvKrrKvEzgV/uUvdXgzase+1LIdw68HDYF1uQi34J4qNmVg6CSPXO/9MszQP8U26Tjc8CiSiB9GXiJNyYZ2/zkRtPIHDS2P35YCuYZBJALIXX9IsMoKJjDF5VESISCvH5Uhn1q6zSjWNw4u1RCW9KR8wbBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GP5sdrcHd0U17e98GAyy4IL3wpjZTuEAJguN215taho=;
 b=eyz58TS0oXsAAfAS47zzI2bd4l9ABLIiiySmfHvemreuLqrPv851TLt7yO7JrAYse6U8Yr2c/cO8I9yp4FiPr1/kJGHoEQm9ZEzP1Z7OL50SSZOsAxyC/oog0Bqm3ECoSXgW2Bv/kQnqyCxCbcmYDqu+BCgvWnwCtmCP1hQJZiWLSwq9loW8LBXMdrIewEL5HztnPBqUEXsRk8hcCbrndxgtdjdpADfjhzbtm5Ug6IGcdg1YmBDdXXlJkG3hRlv75IfLONle8lgucRhMggg9vkXZUK4fnsgYytdUIfV78agBLHbnoz8R2Cgz35mX1oy3jptPED2h3yhVNkpgk3902Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GP5sdrcHd0U17e98GAyy4IL3wpjZTuEAJguN215taho=;
 b=M/YgQrJ4KUm92k3qpd/YdTS6Vupn82IeDcuTeWYCmgUFs3ucemBVUhTeqVlVKom0nO7AgXOIW4FF9QMH3kkLDNj31anYo49gtDJXLMYtoKS7kX6XQvy2gikCo4tRbvVdw5lI0awGG0UEGlKAScIZjWwpe1Dj82PJv+c34POKogNN3Zi6P0FAQ2Cdqxsto/IfMKxKwA1vEzem4ldvppjQEnDMtpTgBtfcZ54UmRmIBrBPU/4nfhZpl4NSyxZQUKs0rijPo8z+pfeeOTpST4DwRVdALzyBpzznjh8moSy0gWA9BS9R1lbFqFrvidhgjTvFeqwz5EMkFn6h5RtR82LHtA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by PAXPR04MB8141.eurprd04.prod.outlook.com (2603:10a6:102:1bf::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.14; Mon, 8 Sep
 2025 14:59:26 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%5]) with mapi id 15.20.9115.010; Mon, 8 Sep 2025
 14:59:26 +0000
Date: Mon, 8 Sep 2025 10:59:19 -0400
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
Subject: Re: [PATCH 4/6] remoteproc: imx_rproc: Simplify IMX_RPROC_SCU_API
 switch case
Message-ID: <aL7vR190pYBlnujg@lizhi-Precision-Tower-5810>
References: <20250908-imx-rproc-cleanup-v1-0-e838cb14436c@nxp.com>
 <20250908-imx-rproc-cleanup-v1-4-e838cb14436c@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250908-imx-rproc-cleanup-v1-4-e838cb14436c@nxp.com>
X-ClientProxiedBy: PH8PR02CA0005.namprd02.prod.outlook.com
 (2603:10b6:510:2d0::13) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|PAXPR04MB8141:EE_
X-MS-Office365-Filtering-Correlation-Id: 790a2cc4-20a6-4197-c802-08ddeee84df8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0me9xYwGAtR27u1HYu53+JuxcZLsRyqcYsO+EfOSY9O9C9VymwZ06HFAttNf?=
 =?us-ascii?Q?wtY3fa3VI9FbchIBI/+nE6IkACIBv5tY/MTNJNj8c5x1n3clWRdzgselB6pm?=
 =?us-ascii?Q?O75ICUraA8iWVuv29ZmbIDqJjIiIoBQhnnONRGO8JDk67GQnaLN8zTzLs8Zb?=
 =?us-ascii?Q?isg/17ohHoUfqGOYM6JHnIX4sZQxhTgUtfKNslYlAzDZDs2XtMsevHlv9Uxs?=
 =?us-ascii?Q?g4AixEmhaCdbHhuehSSi4x+Eb2r4hegT4o9iIo5LbRKW9dJOL2OtIfnCPvcu?=
 =?us-ascii?Q?vRpnq4V35i97TLQkygPzops89YvBd5XM5Z49MxAFwiBNKIpoxcyXoS8GFYs6?=
 =?us-ascii?Q?Pa/JZv1CQ71h07YtyKN8+SrIO0KUhcB94HpscmLu8z+4RbGSE6KMDtqREzpM?=
 =?us-ascii?Q?FB3Sf3VyBbp47C4aY74Wxar98XgGCn4FVIFzv+3JzXGyDbhgDispmv0vr9/B?=
 =?us-ascii?Q?LNWQjuZdYt0o7isLDIZwU5SzSrAaKh6N+9xhdNdP8MRvryOYRoYGtobwMbX3?=
 =?us-ascii?Q?FqAYv/yV4i0PeeCf8QrojeGXcMesQkCov8mNS1DCfdGpPXVlVuwgOahyn0rz?=
 =?us-ascii?Q?/G4zTn8uQOV/Je0yZOFd6rWPK5+B0texql8KsQPq1+/mnTV/REIv1jEQhv+a?=
 =?us-ascii?Q?auil/yvAXcnPdY//qfiJaITuO2W4++FmguemKrlwlO/6I304oeXVTYoazLOu?=
 =?us-ascii?Q?kRm2fc4p8M/BUrMsKiAqrdTsuPkUkLEVsB6Lg4TFaVySpbdz0YDp6/L8UVW9?=
 =?us-ascii?Q?hUqzU2xj6LPnOKepKZS7TqvJ7jM5d4xQAvkIJcSGlcIbp4fgG5Wdk30AWkY3?=
 =?us-ascii?Q?ETure9ouhvO+O/WbaUwWqkI4GKz2YkufwTGtxCOZdv0kpgHPMr7J/ip76EOB?=
 =?us-ascii?Q?ymWoIX8V9io+p9iTuZLpRAKUlqs5vGT3f5MPC6f2egfyEEF3KxLlgRpxDjg/?=
 =?us-ascii?Q?YWIH4Pt5c/8avk4Bozcb88Xe70x0s8oudVEJ59u6TAcBWagNrYM1ocUjB6B2?=
 =?us-ascii?Q?cFSYgALHOFAK9oOoWR+LpDXiF0IUVqdT1WesckLtrmUHmJyZNDlOajDNHruk?=
 =?us-ascii?Q?9KMTddRWu5EHHr1jrQf9kJcW37UItZeOqx+pisIidIhIz0utImXEPK6KsmnZ?=
 =?us-ascii?Q?bI6bgfyQ3pYVd8BDg7afwjYoFrS44lXsU8J+N/2cHd5PZN8DEzGnNJZ5aorx?=
 =?us-ascii?Q?sKt9BH9c+1R0GzHcFehjMNGa/JdeHkgYgYX7Yiw/rSIvPJUzu9T3B9wxPZBp?=
 =?us-ascii?Q?yFQzQOAkZmIOI/6yUOiNMumbc0k+WuxnXYMmtNpeVYQWC234FU4xwXw/5hdV?=
 =?us-ascii?Q?naUlg38JXLPDmiD5+shlFZxgnkoCQ9b8uttkEw+/js4r77RD1G1SKhDKc1eI?=
 =?us-ascii?Q?5dAc6b0tRZrm3NAhA2b18rD74Jt7F+ZDcPJaxjHoHNpcIHpjCP4u9eLgMU9K?=
 =?us-ascii?Q?kYUCEwrmLMeogdncFeXG7M6DZg7724XNIiQWAZid2/kKazpf7OiGYA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/FPjKK+1BI3k0be3SMu//yqURvxcbqCV7YIvIuD56veMBmQKS5mch9A2k9ek?=
 =?us-ascii?Q?R/N4GHjnlX/Y4/eu0GHpwPfrnxh7dM25lwTYwQCUsYWYhUbEcjjcvCvVlAQ4?=
 =?us-ascii?Q?YW2CgTkbAfX59ZFSpej3IhPpM0sV4Q6s2d9wSRSWTYcaVyckcrhWlRkKi/1C?=
 =?us-ascii?Q?ot+rDOxnDEKVHW3oeUQjBv/QmT2WkCSbM71gkTzd/N9xkqDv7qqrl6JZxOgq?=
 =?us-ascii?Q?U8DOc394WXW2CfN+YOJXnF/zfSyh9+Q0UsxvyiXxByWJFyWo+2ahN1GD5sMI?=
 =?us-ascii?Q?klxZ47+3H8Q40XTIp45QsA5UHN+TDllDduZv+j0cq9JR3me14UYRsktR5TJA?=
 =?us-ascii?Q?KLHCAx5Vk0XE/IahoHegKkKzePH2N4BDVap2AZL07Usd6d0QfNGIWIZxcDMe?=
 =?us-ascii?Q?yOTrHhUXPM+1HrzGasdvbfUXxmVT/rkmVBkeMqAd3HR3SxHY8FXwCnUlfXXE?=
 =?us-ascii?Q?9wxHSpvg6bOo8/hcuvsb4XTyRrC49SHy8lzxvy5XQwaAmHdWnD/mdmEx8sLb?=
 =?us-ascii?Q?atzu5eNNG1IZg2YuHV3Y6XAuM6aUpTqGH0KbG7A03P+ioPB7b/3N59qI0JmH?=
 =?us-ascii?Q?NDElhS4vyzZwlb7ih3TPZU9UaTWKsCn+L/JCxJcZYVk3Cipv4QzQl12tlcGq?=
 =?us-ascii?Q?eNl9IlhhZSouZYNWDVG8O94r7TfO+hjb68emK+/KEL8HSTZPe4e/bRIiZHgA?=
 =?us-ascii?Q?O8AkOtH12etjvOC+4sQ9mR1uLjdKhVT/GD8ixMP/tZ0QAGLimR4zJMZ9lNLb?=
 =?us-ascii?Q?drZYnsP3mJR1Lht9ToxK8zxEzXxkePgu1qcRdgu/M2chH8za9stKZi9UrS9d?=
 =?us-ascii?Q?9AgkhJLgHqUoxu4gk9C5wr+4054aFZ1cf3gQ+ZsSCfY1BFymwtJbQvycjYtw?=
 =?us-ascii?Q?Br5+Yj8yRXk7Zw1FzxII3/E4yuv7XWErrpSBSjqPSYKaB7hm0O1TCcvvk3pN?=
 =?us-ascii?Q?/olBh50hqbTp5LGWABNq0jkh6ymBo9RVwmCw5qS+PgLrZl03YuCYrzYd7JW2?=
 =?us-ascii?Q?H2FjVHC+hsrw4fOashziGqe+QY99Mu8aLIC/BOJoQJizRyJYHmBx/RIl9193?=
 =?us-ascii?Q?MyrP6b8DTeA6l8hm83Ikvqy9Z+c0JGbL3R2vEDXZN/CqkwmGz7nJOD0OBCQ9?=
 =?us-ascii?Q?yVsPMALyKHSack5EJnbEISC6AMmWIgqHBfUjarLYkv2ru4+Ip7kQMj8H/5Rs?=
 =?us-ascii?Q?6/LGlFWeaHaqe+qHUczRopeCwgqXfalQRw6ddM2jFWOSYqyux/DkSmoU3w22?=
 =?us-ascii?Q?e3ptRsDPj1MLm//vtQ7gM2lmhOb2hPpUv5sijBfOxWPPZGyRWPu1YfghjtNN?=
 =?us-ascii?Q?HcdITJFJMsuS9n1iJ9kUCNzZwqseF9z316qzZm+BSao+XEEQcRS26rQLclCT?=
 =?us-ascii?Q?xhzW2qf4HOJlPv9DJCZQuLuHpqZ9txfs/BSI1d58RYVqwv1VmYoCEx+0IY3C?=
 =?us-ascii?Q?/wBkzxirQyICOW1/gE2FtIMhOUP4WFoLxIC/Qx2gVVN3WY7ECscCsBY4KcoL?=
 =?us-ascii?Q?4xOA+ug0iaI+VVtbq5GreA96QGZrwk82NIMPc6jY5j6omr+u6P5tWZsOPM3D?=
 =?us-ascii?Q?0+nrQKQG2OGEC23SwSw=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 790a2cc4-20a6-4197-c802-08ddeee84df8
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 14:59:26.6003
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +QkDFz/xiL6dzoG2VdVtRnPSY4fQtvCc7zHgplVSBXgACvoIlp9qNnx5zfDGXklVh+SQ7oEkh/mkZdCufiNTag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8141

On Mon, Sep 08, 2025 at 09:07:37PM +0800, Peng Fan wrote:
> Introduce imx_rproc_scu_api_{start, stop, detect_mode}() helper functions
> for all i.MX variants using IMX_RPROC_SCU_API to manage remote processors.
>
> This allows the removal of the IMX_RPROC_SCU_API switch-case blocks from
> imx_rproc_start(), imx_rproc_stop(), and imx_rproc_detect_mode(), resulting
> in cleaner and more maintainable code.
>
> No functional changes.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/remoteproc/imx_rproc.c | 149 +++++++++++++++++++++++------------------
>  1 file changed, 85 insertions(+), 64 deletions(-)
>
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index c37dd67595960f08fd85c0b516d0d03855cec9fc..ea34080970c6a5a9b035ef0d389014b8268660a9 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -296,6 +296,13 @@ static int imx_rproc_mmio_start(struct rproc *rproc)
>  	return regmap_update_bits(priv->regmap, dcfg->src_reg, dcfg->src_mask, dcfg->src_start);
>  }
>
> +static int imx_rproc_scu_api_start(struct rproc *rproc)
> +{
> +	struct imx_rproc *priv = rproc->priv;
> +
> +	return imx_sc_pm_cpu_start(priv->ipc_handle, priv->rsrc_id, true, priv->entry);
> +}
> +
>  static int imx_rproc_start(struct rproc *rproc)
>  {
>  	struct imx_rproc *priv = rproc->priv;
> @@ -318,9 +325,6 @@ static int imx_rproc_start(struct rproc *rproc)
>  		arm_smccc_smc(IMX_SIP_RPROC, IMX_SIP_RPROC_START, 0, 0, 0, 0, 0, 0, &res);
>  		ret = res.a0;
>  		break;
> -	case IMX_RPROC_SCU_API:
> -		ret = imx_sc_pm_cpu_start(priv->ipc_handle, priv->rsrc_id, true, priv->entry);
> -		break;
>  	default:
>  		return -EOPNOTSUPP;
>  	}
> @@ -349,6 +353,13 @@ static int imx_rproc_mmio_stop(struct rproc *rproc)
>  	return regmap_update_bits(priv->regmap, dcfg->src_reg, dcfg->src_mask, dcfg->src_stop);
>  }
>
> +static int imx_rproc_scu_api_stop(struct rproc *rproc)
> +{
> +	struct imx_rproc *priv = rproc->priv;
> +
> +	return imx_sc_pm_cpu_start(priv->ipc_handle, priv->rsrc_id, false, priv->entry);
> +}
> +
>  static int imx_rproc_stop(struct rproc *rproc)
>  {
>  	struct imx_rproc *priv = rproc->priv;
> @@ -369,9 +380,6 @@ static int imx_rproc_stop(struct rproc *rproc)
>  		if (res.a1)
>  			dev_info(dev, "Not in wfi, force stopped\n");
>  		break;
> -	case IMX_RPROC_SCU_API:
> -		ret = imx_sc_pm_cpu_start(priv->ipc_handle, priv->rsrc_id, false, priv->entry);
> -		break;
>  	default:
>  		return -EOPNOTSUPP;
>  	}
> @@ -907,14 +915,74 @@ static int imx_rproc_mmio_detect_mode(struct rproc *rproc)
>  	return 0;
>  }
>
> -static int imx_rproc_detect_mode(struct imx_rproc *priv)
> +static int imx_rproc_scu_api_detect_mode(struct rproc *rproc)
>  {
> -	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
> +	struct imx_rproc *priv = rproc->priv;
>  	struct device *dev = priv->dev;
> -	struct arm_smccc_res res;
>  	int ret;
>  	u8 pt;
>
> +	ret = imx_scu_get_handle(&priv->ipc_handle);
> +	if (ret)
> +		return ret;
> +	ret = of_property_read_u32(dev->of_node, "fsl,resource-id", &priv->rsrc_id);
> +	if (ret) {
> +		dev_err(dev, "No fsl,resource-id property\n");
> +		return ret;
> +	}
> +
> +	if (priv->rsrc_id == IMX_SC_R_M4_1_PID0)
> +		priv->core_index = 1;
> +	else
> +		priv->core_index = 0;
> +
> +	/*
> +	 * If Mcore resource is not owned by Acore partition, It is kicked by ROM,
> +	 * and Linux could only do IPC with Mcore and nothing else.
> +	 */
> +	if (imx_sc_rm_is_resource_owned(priv->ipc_handle, priv->rsrc_id)) {
> +		if (of_property_read_u32(dev->of_node, "fsl,entry-address", &priv->entry))
> +			return -EINVAL;
> +
> +		return imx_rproc_attach_pd(priv);
> +	}
> +
> +	priv->rproc->state = RPROC_DETACHED;
> +	priv->rproc->recovery_disabled = false;
> +	rproc_set_feature(priv->rproc, RPROC_FEAT_ATTACH_ON_RECOVERY);
> +
> +	/* Get partition id and enable irq in SCFW */
> +	ret = imx_sc_rm_get_resource_owner(priv->ipc_handle, priv->rsrc_id, &pt);
> +	if (ret) {
> +		dev_err(dev, "not able to get resource owner\n");
> +		return ret;
> +	}
> +
> +	priv->rproc_pt = pt;
> +	priv->rproc_nb.notifier_call = imx_rproc_partition_notify;
> +
> +	ret = imx_scu_irq_register_notifier(&priv->rproc_nb);
> +	if (ret) {
> +		dev_err(dev, "register scu notifier failed, %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = imx_scu_irq_group_enable(IMX_SC_IRQ_GROUP_REBOOTED, BIT(priv->rproc_pt),
> +				       true);
> +	if (ret) {
> +		imx_scu_irq_unregister_notifier(&priv->rproc_nb);
> +		dev_err(dev, "Enable irq failed, %d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int imx_rproc_detect_mode(struct imx_rproc *priv)
> +{
> +	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
> +	struct arm_smccc_res res;
> +
>  	if (dcfg->ops && dcfg->ops->detect_mode)
>  		return dcfg->ops->detect_mode(priv->rproc);
>
> @@ -927,61 +995,6 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
>  		if (res.a0)
>  			priv->rproc->state = RPROC_DETACHED;
>  		return 0;
> -	case IMX_RPROC_SCU_API:
> -		ret = imx_scu_get_handle(&priv->ipc_handle);
> -		if (ret)
> -			return ret;
> -		ret = of_property_read_u32(dev->of_node, "fsl,resource-id", &priv->rsrc_id);
> -		if (ret) {
> -			dev_err(dev, "No fsl,resource-id property\n");
> -			return ret;
> -		}
> -
> -		if (priv->rsrc_id == IMX_SC_R_M4_1_PID0)
> -			priv->core_index = 1;
> -		else
> -			priv->core_index = 0;
> -
> -		/*
> -		 * If Mcore resource is not owned by Acore partition, It is kicked by ROM,
> -		 * and Linux could only do IPC with Mcore and nothing else.
> -		 */
> -		if (imx_sc_rm_is_resource_owned(priv->ipc_handle, priv->rsrc_id)) {
> -			if (of_property_read_u32(dev->of_node, "fsl,entry-address", &priv->entry))
> -				return -EINVAL;
> -
> -			return imx_rproc_attach_pd(priv);
> -		}
> -
> -		priv->rproc->state = RPROC_DETACHED;
> -		priv->rproc->recovery_disabled = false;
> -		rproc_set_feature(priv->rproc, RPROC_FEAT_ATTACH_ON_RECOVERY);
> -
> -		/* Get partition id and enable irq in SCFW */
> -		ret = imx_sc_rm_get_resource_owner(priv->ipc_handle, priv->rsrc_id, &pt);
> -		if (ret) {
> -			dev_err(dev, "not able to get resource owner\n");
> -			return ret;
> -		}
> -
> -		priv->rproc_pt = pt;
> -		priv->rproc_nb.notifier_call = imx_rproc_partition_notify;
> -
> -		ret = imx_scu_irq_register_notifier(&priv->rproc_nb);
> -		if (ret) {
> -			dev_err(dev, "register scu notifier failed, %d\n", ret);
> -			return ret;
> -		}
> -
> -		ret = imx_scu_irq_group_enable(IMX_SC_IRQ_GROUP_REBOOTED, BIT(priv->rproc_pt),
> -					       true);
> -		if (ret) {
> -			imx_scu_irq_unregister_notifier(&priv->rproc_nb);
> -			dev_err(dev, "Enable irq failed, %d\n", ret);
> -			return ret;
> -		}
> -
> -		return 0;
>  	default:
>  		break;
>  	}
> @@ -1163,6 +1176,12 @@ static const struct imx_rproc_plat_ops imx_rproc_ops_mmio = {
>  	.detect_mode	= imx_rproc_mmio_detect_mode,
>  };
>
> +static const struct imx_rproc_plat_ops imx_rproc_ops_scu_api = {
> +	.start		= imx_rproc_scu_api_start,
> +	.stop		= imx_rproc_scu_api_stop,
> +	.detect_mode	= imx_rproc_scu_api_detect_mode,
> +};
> +
>  static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mn_mmio = {
>  	.src_reg	= IMX7D_SRC_SCR,
>  	.src_mask	= IMX7D_M4_RST_MASK,
> @@ -1197,12 +1216,14 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx8qm = {
>  	.att            = imx_rproc_att_imx8qm,
>  	.att_size       = ARRAY_SIZE(imx_rproc_att_imx8qm),
>  	.method         = IMX_RPROC_SCU_API,
> +	.ops		= &imx_rproc_ops_scu_api,
>  };
>
>  static const struct imx_rproc_dcfg imx_rproc_cfg_imx8qxp = {
>  	.att		= imx_rproc_att_imx8qxp,
>  	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8qxp),
>  	.method		= IMX_RPROC_SCU_API,
> +	.ops		= &imx_rproc_ops_scu_api,
>  };
>
>  static const struct imx_rproc_dcfg imx_rproc_cfg_imx8ulp = {
>
> --
> 2.37.1
>
