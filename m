Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010047.outbound.protection.outlook.com [52.101.69.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398B32C1586;
	Fri, 31 Oct 2025 19:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761938021; cv=fail; b=UZLa2ltRL2tT3Ub264BbzETRqZU/z5Pl0xfQdx/dCG2BLxx4foXLoQJxPBNzX6ql+JJfT0mwDLNkOtUHEu+ykjwdaKL5ZUxuULyjUuj83ncJZxWHjKjOtQzKQnUYzdwb6Z9jllnPxRWzcnbLLRusTsD+6l+E4uP/S4oj+zA+pQM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761938021; c=relaxed/simple;
	bh=KDlS8LjKyCBbM3y2I9Pq58KtQR8mUVsFi7VmI/EdH78=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XSl07kZXB33IeDBPD1HYiIBzRri9j+0yoe3wX/RyBjrMtg1C503jRLTzBTLvg6nYgbv27ySy5PPyhEnQGbuuwzbZzn9N0VUMOWyVQRU119BCsFO21XEppiR4sPNVFP+KjsKpWGjphAJMxlUqle6NAf/gOb+RlXH7RQMNZ/xW1aI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=WnPRb5qy; arc=fail smtp.client-ip=52.101.69.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="WnPRb5qy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yZ5Fdftg2EUFtUsxIcfNw34MtHbb6J4uF9AzDwlK6pYmsf/rKuGntSdTcFNKCf9pkJNqq8+dqACzBMZKTSN33aanZwd/EnqNAJNUQHB5rTRI5G2IH8ppMpwkEdIOqAHR2qYLuSgErnuAnK44s0UdaKbtzV3l2BgZeUflJaqnUePTua895Ccl9iEuqkrDLq2d0mUey8R3SOC2Dq1mI0d4AiumeVPWsaZFKllBeLI6V1KdLe2ayNkxEe/UOVEbsI3OdEcmteWE7jJwSRibTJU8OlXp38UYFJrz/rqG1c8vhTkGj2jOgVYERRnosyB8oXpFUErMf1PtRKEn0sQp/79B9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ldr/c3/42mGxIjEoEQz4S5GMXwki9KnTSEZiuGnRPg=;
 b=bfh7TLNPxKaN8XwwHChMlh6RSelQPhaNI/kH+dRGHdXTNMHDhdiyyIhgaEPWvtc3zqUoGFWk7bpzjth87vuseZRm5S1Qk0r3S5ND9pdXVzOlNSaBhKsSw7tM0zyKJBbLc3PsS/nvUj47KjfXnSrHrmIEr1GIYgWZ78FiR4kwrtp30b5KsjDMZyn/wL3hzv47PAIiTuG69VfNkuptRx324W+56QIq1WacIih3w78DGQoDlAtLgE0KOQpnlGk9y/mXlatrFezKfr6ZvFP0nupcTJR/+g0PocQFGL8fuMiKX14MOerlwAmzV2X4KV7+l4Ysp3Uu06LtPUWcVEC8gZfVPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ldr/c3/42mGxIjEoEQz4S5GMXwki9KnTSEZiuGnRPg=;
 b=WnPRb5qyWPXRFKjq3/UazkcgEKRz52cevCYdrKdYAXNpcQhCpUtRea242MLO7/3UOsU9bic9X7EvPRvPeRHsS617qV46DtGIQNeTBCRbzUd5rU7rKPcTLo1XsB2UsyxcNXlK8jTzM1ZrHXibsFkO27v1GWs7zdtmxcUcjsNpbMDFNgJnmyl3EDwqE7IEcQvkEAv0oiaR9hraH7RE3N61Vp3n8+r3soYzJ4bMujXgxCIqeSEXFJjLEUi4Y7NMUNVAAOP+MMLDlMz0IW6lgKZHhxQfWZdLZLb9phymcDKyuGDt92yLt8jxkyXrzeibBjCLjY06UvWIZ37FopxU63gZ7g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by AS4PR04MB9244.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Fri, 31 Oct
 2025 19:13:36 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 19:13:36 +0000
Date: Fri, 31 Oct 2025 15:13:28 -0400
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
Subject: Re: [PATCH 10/11] remoteproc: imx_dsp_rproc: Simplify
 IMX_RPROC_RESET_CONTROLLER switch case
Message-ID: <aQUKWF3t4VteYgxz@lizhi-Precision-Tower-5810>
References: <20251031-imx-dsp-2025-10-31-v1-0-282f66f55804@nxp.com>
 <20251031-imx-dsp-2025-10-31-v1-10-282f66f55804@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251031-imx-dsp-2025-10-31-v1-10-282f66f55804@nxp.com>
X-ClientProxiedBy: PH8PR20CA0012.namprd20.prod.outlook.com
 (2603:10b6:510:23c::10) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|AS4PR04MB9244:EE_
X-MS-Office365-Filtering-Correlation-Id: 19009d0a-9ba8-4f91-374a-08de18b1973a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1DZ44q4tjc47ipQ2OumdeL8jdsiXr35kP3y4N16q/gL1nLg6dZCnUwVCtH7u?=
 =?us-ascii?Q?Oa12O7/Cz3rXdA2V2cKbgl86Oq1I49CmvGC7vaNXr71z376vv0DOq4Jx32RO?=
 =?us-ascii?Q?2rYj0FDeexy7LKjGhhU4dtDy4pt98vZ+gV/ByXhRHe2w13NmD6yTmW4uQj6T?=
 =?us-ascii?Q?CBxz4zP3c6UfVFcsjOef47ZUjO3pLW+ptlB+g5apygDYdHG/hqxslMTyx33p?=
 =?us-ascii?Q?i6296kgMhn12N16saKg/7qevt4h1+k5OLkvNh1qiwv29KtIbO/yyfm4CMkAu?=
 =?us-ascii?Q?trOOo9E3yhtfVXvjPixkOZoQXH6m8aBXNqNVSoA1jc+bVwc4B1YK0/EtAAnE?=
 =?us-ascii?Q?n/JgdF+tEse/5SGx8LI1EXWsan+3fLNvU+U1O6JDvK1nsIEHmTWC5cuCi5yn?=
 =?us-ascii?Q?taY3x6SSud+UletHKY/glJgPF1N5Wjk6O/O1G69udin3YLvzhzsCEZ4pp/fg?=
 =?us-ascii?Q?TDHwjXOfYNvLLicfg4gOSf//MzTcct36xVE6ThTQArNv9mzTQxGzAP37YPXF?=
 =?us-ascii?Q?2dwUL2qNzvrX9Nmpj1hUSOcocPqjdTFNqubOfgAu8VKeRCn8UXi/DGMHE3Lb?=
 =?us-ascii?Q?mtUgV5/QXrS5AWCvxtu9E7v7yxG9cAEBaxS6zxfxjZprJAB+FOE6Udg9DXt/?=
 =?us-ascii?Q?C+OTkpzS3AYhriWGgtaYT4rLicL/cS8vvl62Fms1ZKahyWdXhKLQCK//9Shq?=
 =?us-ascii?Q?H8DDOSxa6fcjLRMysNmQ8JCNP1GrnMVPasShVpmiU9jrQCHjCOaW1cVaQH6Z?=
 =?us-ascii?Q?HeIodhRnqJVsPu+6RpIi7mwBoD9cqYsEeT+G8AeFUgANP27d532b12zAr6QJ?=
 =?us-ascii?Q?p4n5EnXygU+M8sAq9YnBr8Rb9dkNztysH4Ir7IOJPL6D8bB/mociuSXGOc+c?=
 =?us-ascii?Q?Q14BJ1s9rAyYgJdvzxodDvDbin14CqcDuUvHD5PnKchqZzLwuCh4QmP01IdO?=
 =?us-ascii?Q?ffCkNqCYGuPKBRz5zly7k8/ewMlW95cMPxWPlO96CUuOStHf94SrGnximefO?=
 =?us-ascii?Q?iyjtpaQr/Yg3yAsrzlDE7G3gKcZu++7uDGUnV9tNvEdAAcmhtmH6pjUDTbz1?=
 =?us-ascii?Q?Zv44SsZUu4mg5204tYVSwzpbT5YJDW7x9WD/5azg1bbEyAJoZI9EXoTYutGL?=
 =?us-ascii?Q?D6WT+aey2D8ydOadzRNdX7IQdE/oagYa3wDXzW4xzTisiRnJbCuKnUcQ3gnb?=
 =?us-ascii?Q?JNa+ymjwmkqO2awrMbBVjHduELDl+499fypdWNt1XRrdjyRrKWrhY0BTMHtz?=
 =?us-ascii?Q?WXWHiNUW4x8xiV4Vy+7geZp1HlZBWWhj/zVa/gFkZH9ZD4EytT68H8iBLhll?=
 =?us-ascii?Q?c9YmTuBjtmxuf0FH3grMFQs85FaLOgJrsouzSsZt7zpEduE9Vqd85u/URsu7?=
 =?us-ascii?Q?h6vh2TWvcrY2m1/XmoXn20Xdm5Nql3l7aS3RGOIbgnBttpAVxAIbUZDHb91U?=
 =?us-ascii?Q?bYQ2Q3pcjRhGLPvrt83R3OJbCcMqpHeeyO2QS/Jz+GFzxDS7wBwoMKZ49ZJd?=
 =?us-ascii?Q?LIiJiUIVEtIqK00ltbdbd7CNCqtY6eaIw60m?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xFkVf6Jlcds8QoA3wyrqbHhn2oGicxAgwmgPl9sJMlp326AdhRpAhnywTfUJ?=
 =?us-ascii?Q?fT7zI5GsapL7pGY9YP7e17XfcLV9BMJR+fai+/rXfEPIm6xI6HMGMEBqP4BO?=
 =?us-ascii?Q?JKe5gUyMVIH2yRlB742HFlx81c/wfS57VpRm7kW12VF+W5bB9IIiS9bvbMst?=
 =?us-ascii?Q?RQPjhJXeevDoejVFbmcY8AWCgLPN1keBc2Zdx324glgtFVnKk76t9vdOvtqw?=
 =?us-ascii?Q?dyoTpE9yXD5yg4wj/762mW1/eVvPj9UOPtee0VMsFlfgXNVza3yJHofpdnHC?=
 =?us-ascii?Q?g1ck6e7JtDV8KDwkONn3X7wN8duceR/8KzFAgscGoVUWabP3yM6v23+Yt+5E?=
 =?us-ascii?Q?vsxo854NvYOXFsV9OfsolPhtJ51lxTLSLKofr6rQzb3Bf4i9uMbQ2I6ZandB?=
 =?us-ascii?Q?92va9emAMueRaYblCfsQAIi8RrEPurW+bN8+abRJTlytZkvSciKu7btxpo1L?=
 =?us-ascii?Q?CNluFLJQnTfntBSy9ohCIbvnkxyxSkMFkKvjvx2e1uvXMDvBEYqjpos46uTL?=
 =?us-ascii?Q?y3u8d8UprJ+yGn6+dcxR5egfFl6ts9i6YkXGjtrLZ/Lg7jpHsTFkPrCSoZP1?=
 =?us-ascii?Q?hjXLUq5HJWuW6In5XQW++G3nrxo0VvXipCydWu53Z774U4vlnreRMAoApHz6?=
 =?us-ascii?Q?vq47g0XseNh5JpvTgHEn6B9LdSiYRXI/gmNG8FnhJhUK3s8AzkatnToSlqez?=
 =?us-ascii?Q?1wSkpCjEkSmjqe+k7hkNy4Plpzhb4J9pNb1DILoazrFZ647iVCFfTptZhVQy?=
 =?us-ascii?Q?GmfGn61/TDcAfZj3t8GVlUsezMBevhAJpfCOkOgSVjPpleGdG9vcWoTP8kpY?=
 =?us-ascii?Q?y4ZSTXyCLAH2ib0j8tXzHEEON7SE/OI5yjWj2MCIvvAm3PLTmxdwLJBGvqfl?=
 =?us-ascii?Q?DvYG9HYGmDtvfldlTF5rqhLm5YuYBFkPsk3A938NghS6pffzrQTcAdDpY4CG?=
 =?us-ascii?Q?6RucO2YXNw0ZBeRGXIR0iyOFhNb3os4tHnMiQhMh0gGga1bubDvdfCGg5oho?=
 =?us-ascii?Q?XVC+/Jay8+CvQuWWp6BfzTIGCk7DcgnNzS7pQGgb8XWltwUwlJ0krZHrYKWH?=
 =?us-ascii?Q?2IV0ueQyuR3t8ldWeEI914XQFr5dhZXqZ6njxyav1ZUgYSHoRp6KRl/Kp3Kl?=
 =?us-ascii?Q?4vLogmt2uZ6nBWq1iMBB0YF4N5183+ZPMwkoWpeK2/HtLo89CucA/HAqNung?=
 =?us-ascii?Q?j2gZmusHDN8SYp8h26EsVmRoQge8yApD7khBdRvknS2x52aytybkuEekpaxh?=
 =?us-ascii?Q?TaJd2xiQDrc0lc4ESmQf6OCItrNv2gxYtGVit2pQ1Ff2RxagFcnXgVs8CEc1?=
 =?us-ascii?Q?jGTberF92XH9e8zNjhuJM3cp7EPt0+KWR1NesHfwXon0Qa0sv0LWizZRjUjB?=
 =?us-ascii?Q?cvH78V+Z2pAtcv11bl3pe298SZWD5yXcNslTQ4oH+mVnWmx5BuwfEIImYNMA?=
 =?us-ascii?Q?3n9XrcUO6zN1kKwaJfDNY+UfUKDvHe+Aheu6+auCprt1kt+ULlMP4wgT06Rz?=
 =?us-ascii?Q?0w3iByGjnICqESboL07ORB3vJ2QWq7ttjCJfDgju4CWdIuEX/LkWtLRbkL5M?=
 =?us-ascii?Q?kDDt5T2/ykEu7liBernZNp2nhVUSM9I9EXCD4abP?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19009d0a-9ba8-4f91-374a-08de18b1973a
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 19:13:36.2260
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MP/3IoJAjtjgsoeGTtl7sGWVlC4iwDr1OfM45V64DFiHq60tPGd7TBcKHXrnPE7/2dt4DpecSHfX/aZTK3ykCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9244

On Fri, Oct 31, 2025 at 05:08:39PM +0800, Peng Fan wrote:
> Introduce imx_dsp_rproc_reset_ctr_{start, stop, detect_mode}() helper
> functions for i.MX variants using IMX_RPROC_RESET_CONTROLLER to manage
> remote processors.
>
> Allows the removal of the IMX_RPROC_RESET_CONTROLLER switch-case blocks
> from imx_dsp_rproc_[start,stop,detect_mode](), resulting in cleaner and
> more maintainable code.
>
> No functional changes.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/remoteproc/imx_dsp_rproc.c | 69 +++++++++++++++++++++-----------------
>  drivers/remoteproc/imx_rproc.h     |  2 --
>  2 files changed, 38 insertions(+), 33 deletions(-)
>
> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index 56e94754d5c5feba112227c45b0f99a4fe868926..009e08df8fd42e1bf6ca00393e940071d33ec518 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -347,6 +347,13 @@ static int imx_dsp_rproc_mmio_start(struct rproc *rproc)
>  	return regmap_update_bits(priv->regmap, dcfg->src_reg, dcfg->src_mask, dcfg->src_start);
>  }
>
> +static int imx_dsp_rproc_reset_ctrl_start(struct rproc *rproc)
> +{
> +	struct imx_dsp_rproc *priv = rproc->priv;
> +
> +	return reset_control_deassert(priv->run_stall);
> +}
> +
>  static int imx_dsp_rproc_scu_api_start(struct rproc *rproc)
>  {
>  	struct imx_dsp_rproc *priv = rproc->priv;
> @@ -375,13 +382,7 @@ static int imx_dsp_rproc_start(struct rproc *rproc)
>  		goto start_ret;
>  	}
>
> -	switch (dcfg->method) {
> -	case IMX_RPROC_RESET_CONTROLLER:
> -		ret = reset_control_deassert(priv->run_stall);
> -		break;
> -	default:
> -		return -EOPNOTSUPP;
> -	}
> +	return -EOPNOTSUPP;
>
>  start_ret:
>  	if (ret)
> @@ -401,6 +402,13 @@ static int imx_dsp_rproc_mmio_stop(struct rproc *rproc)
>  	return regmap_update_bits(priv->regmap, dcfg->src_reg, dcfg->src_mask, dcfg->src_stop);
>  }
>
> +static int imx_dsp_rproc_reset_ctrl_stop(struct rproc *rproc)
> +{
> +	struct imx_dsp_rproc *priv = rproc->priv;
> +
> +	return reset_control_assert(priv->run_stall);
> +}
> +
>  static int imx_dsp_rproc_scu_api_stop(struct rproc *rproc)
>  {
>  	struct imx_dsp_rproc *priv = rproc->priv;
> @@ -430,13 +438,7 @@ static int imx_dsp_rproc_stop(struct rproc *rproc)
>  		goto stop_ret;
>  	}
>
> -	switch (dcfg->method) {
> -	case IMX_RPROC_RESET_CONTROLLER:
> -		ret = reset_control_assert(priv->run_stall);
> -		break;
> -	default:
> -		return -EOPNOTSUPP;
> -	}
> +	return -EOPNOTSUPP;
>
>  stop_ret:
>  	if (ret)
> @@ -1059,6 +1061,20 @@ static int imx_dsp_rproc_mmio_detect_mode(struct rproc *rproc)
>  	return 0;
>  }
>
> +static int imx_dsp_rproc_reset_ctrl_detect_mode(struct rproc *rproc)
> +{
> +	struct imx_dsp_rproc *priv = rproc->priv;
> +	struct device *dev = rproc->dev.parent;
> +
> +	priv->run_stall = devm_reset_control_get_exclusive(dev, "runstall");
> +	if (IS_ERR(priv->run_stall)) {
> +		dev_err(dev, "Failed to get DSP runstall reset control\n");
> +		return PTR_ERR(priv->run_stall);
> +	}
> +
> +	return 0;
> +}
> +
>  static int imx_dsp_rproc_scu_api_detect_mode(struct rproc *rproc)
>  {
>  	struct imx_dsp_rproc *priv = rproc->priv;
> @@ -1082,26 +1098,11 @@ static int imx_dsp_rproc_detect_mode(struct imx_dsp_rproc *priv)
>  {
>  	const struct imx_dsp_rproc_dcfg *dsp_dcfg = priv->dsp_dcfg;
>  	const struct imx_rproc_dcfg *dcfg = dsp_dcfg->dcfg;
> -	struct device *dev = priv->rproc->dev.parent;
> -	int ret = 0;
>
>  	if (dcfg->ops && dcfg->ops->detect_mode)
>  		return dcfg->ops->detect_mode(priv->rproc);
>
> -	switch (dsp_dcfg->dcfg->method) {
> -	case IMX_RPROC_RESET_CONTROLLER:
> -		priv->run_stall = devm_reset_control_get_exclusive(dev, "runstall");
> -		if (IS_ERR(priv->run_stall)) {
> -			dev_err(dev, "Failed to get DSP runstall reset control\n");
> -			return PTR_ERR(priv->run_stall);
> -		}
> -		break;
> -	default:
> -		ret = -EOPNOTSUPP;
> -		break;
> -	}
> -
> -	return ret;
> +	return -EOPNOTSUPP;
>  }
>
>  static const char *imx_dsp_clks_names[DSP_RPROC_CLK_MAX] = {
> @@ -1326,6 +1327,12 @@ static const struct imx_rproc_plat_ops imx_dsp_rproc_ops_mmio = {
>  	.detect_mode	= imx_dsp_rproc_mmio_detect_mode,
>  };
>
> +static const struct imx_rproc_plat_ops imx_dsp_rproc_ops_reset_ctrl = {
> +	.start		= imx_dsp_rproc_reset_ctrl_start,
> +	.stop		= imx_dsp_rproc_reset_ctrl_stop,
> +	.detect_mode	= imx_dsp_rproc_reset_ctrl_detect_mode,
> +};
> +
>  static const struct imx_rproc_plat_ops imx_dsp_rproc_ops_scu_api = {
>  	.start		= imx_dsp_rproc_scu_api_start,
>  	.stop		= imx_dsp_rproc_scu_api_stop,
> @@ -1336,7 +1343,7 @@ static const struct imx_rproc_plat_ops imx_dsp_rproc_ops_scu_api = {
>  static const struct imx_rproc_dcfg dsp_rproc_cfg_imx8mp = {
>  	.att		= imx_dsp_rproc_att_imx8mp,
>  	.att_size	= ARRAY_SIZE(imx_dsp_rproc_att_imx8mp),
> -	.method		= IMX_RPROC_RESET_CONTROLLER,
> +	.ops		= &imx_dsp_rproc_ops_reset_ctrl,
>  };
>
>  static const struct imx_dsp_rproc_dcfg imx_dsp_rproc_cfg_imx8mp = {
> diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
> index a6b4625e8be76c6eb6a5d8ef45eb5f3aec5fe375..6a7359f05178a937d02b027fe4166319068bd65c 100644
> --- a/drivers/remoteproc/imx_rproc.h
> +++ b/drivers/remoteproc/imx_rproc.h
> @@ -20,8 +20,6 @@ enum imx_rproc_method {
>  	IMX_RPROC_NONE,
>  	/* Through ARM SMCCC */
>  	IMX_RPROC_SMC,
> -	/* Through Reset Controller API */
> -	IMX_RPROC_RESET_CONTROLLER,
>  };
>
>  /* dcfg flags */
>
> --
> 2.37.1
>
