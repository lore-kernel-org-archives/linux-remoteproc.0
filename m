Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011022.outbound.protection.outlook.com [52.101.70.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988D924C66F;
	Wed, 17 Sep 2025 14:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758119826; cv=fail; b=bC+F86mJRTZAX/WFCrP8Nym1toib/uzLW/VwjK5Tyv2mFLshdKL+E7SZEv4V4ky+OFwuYTE7/Xva5q8zi9mDJUpZSOpeRwezVp43PJ2hslvBMV/MiKX2DV7KWuhCVBtmeUZKifx4ApK7NDPR1LeqT5PoNb36tw3+zR8aChW5LyM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758119826; c=relaxed/simple;
	bh=M0bEVVEEYciHqkt1UtOka7XGrEyB0umRq3AXG8j46aw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=sTaR/X1fa9sKFUanxHFwGQdsB/xUKzZiuy/2i5jzuW0qLR5TivydXumD+hp/6TwYiynFhJqX6hDvbGICnzLUljvhPCrbeL/yGFU9gHmktwo9hfC3sB+p9GCWvA0n5cZSnKI/S3ESBHO4hIU6FLxEDkIxGKjeq9W516N/PBEP/ko=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=RUmxSFei; arc=fail smtp.client-ip=52.101.70.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="RUmxSFei"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LNaIolcrX17myXCjkPnD+3PZgADS7Ye/RytpTFcnFix+/bzyatNTHCwshAtghD0fiu1TOMMSCQtgX4X9OOmZynz9KFxjUAo4fwx/Vm1k5WKRt+UgGE554KzAzGc38KpvfiHueKueULbbCSmmnMaWjNK1S1epSHZh6uV3GhQY1VUb6mEodU5xBEfcNyb0TT2VcqGO4viLmO7EK2rJslUBhypeKjcYe6NWCNZq4Hwp0YKH8Qz4cL8nCIiN1hhKiJOHJJnNJh9XqIzemzo9uAPHSz8pHSlo4AXVHw2YUQCJnQDYzgqhVEFf67W2cOWMHB4g5khQc6UPpnYscbrJRQqoRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YOtSUXbcN0evykf4L6JJJM+4Z7+nXaYo5bJArgbgWlU=;
 b=NOfmImgzgFEEpgeOBAA0wST4lmUCxiTSr/cQfsmp93x5e9wd3Y5Cba8GF50WuvSLRbt3uPDipGvl8ZpXMFUUAvUzGPsPLAj3WqluEXdT2wsOsLNNb168Kj6icxxL7rnBc9YxdITRnm1b+zoeJg7tPp/yfSexWQVahfAq6nZl5UnnNWgRcHE3JKAL5zNYSCQ/i2XLCqyRkxhaFlhsSNxXUkcxBV5t8YzS9G0giN4mroG/kIQH1fdoW7CCa6zFdwsVWsYxA2lrKs7RIp+NGEc9b1BwLyd5CuoXPNFihQRff1jtRSYzwAmwzoxyE6rW59cGOHtpq4/q9lP+CZfXOwd+Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YOtSUXbcN0evykf4L6JJJM+4Z7+nXaYo5bJArgbgWlU=;
 b=RUmxSFeiQXcibe6A4D4rkHUyC+U7HJJxCf9l7TaTEJvsUsG2FEwskiekiD0UMyiFqcLv5LLTsxoY7sOW1iOoRIGoj6cV1W5w+QOdbqPLQ3QK2y/PkxCcDARQ3i8X/2hnREvtmy0gfBNcbUwc2cAv/GxPgPaDgr7sXZmyFovAoy2zSz77kIo6ZDk1OxptT3p0/RsoIJitnRqmn3UA1JEqOlJSwPhnLPIO4/lPcaLC2r9SS3rV+IZYY41ltgYRbLOqCPTcToxNx6PLjjzWGoA54YAutmyvGkP1jd6cKqbz+YlSS3CeCYdr5mjr7CVyz3OgMnWReVldQmGEASQ0DWX/gw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by DBBPR04MB7628.eurprd04.prod.outlook.com (2603:10a6:10:204::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Wed, 17 Sep
 2025 14:36:59 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9137.012; Wed, 17 Sep 2025
 14:36:59 +0000
Date: Wed, 17 Sep 2025 10:36:51 -0400
From: Frank Li <Frank.li@nxp.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Hiago De Franco <hiago.franco@toradex.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/6] remoteproc: imx_rproc: Use devm_clk_get_enabled()
 and simplify cleanup
Message-ID: <aMrHgxZH8zSbj+Ps@lizhi-Precision-Tower-5810>
References: <20250917-imx_rproc_c2-v1-0-00ce23dc9c6e@nxp.com>
 <20250917-imx_rproc_c2-v1-4-00ce23dc9c6e@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917-imx_rproc_c2-v1-4-00ce23dc9c6e@nxp.com>
X-ClientProxiedBy: SJ0PR05CA0058.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::33) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|DBBPR04MB7628:EE_
X-MS-Office365-Filtering-Correlation-Id: 009b6d2b-e7ad-41d5-274e-08ddf5f7a892
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|19092799006|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rnhn7TTn1yDFWVUeZeSt8MDMKet+ADwOOdUDBGDd9pdKvEQ19lK0gE6k1Ak6?=
 =?us-ascii?Q?1YVB7qnbGd4FxlrU9RfVDeE+642foIUtIVO4xAGCeGDit2HEIO15akTvq2jZ?=
 =?us-ascii?Q?SXBKjM6RKW9U/JlVyIaJG5Lk8+say880guyUb2AdhhDQxbEARFJFcHcvmWHt?=
 =?us-ascii?Q?tVt3W7mL1PdWZF2+GqrRiEWQeTRzrTZN69FJvyvmxrcIWvG6QOjuzXg5ULRS?=
 =?us-ascii?Q?D7IUmuPpj7JGRQ1U8oo+PtT+Xzt48cp5Ut/pkM3diDhSiS0uhRDZbiq2AN2S?=
 =?us-ascii?Q?ijncN/HUj20R+Ck8xes+dZo3pebrb5HrsmByRJtDE6LHdRjxZ+A/XjGq3+jK?=
 =?us-ascii?Q?1JFmAzJUyXMEy9MYMQE5UnSM8cuNqjq1AWKD+5wV+j8C6SdGPbMbsrMCfqsY?=
 =?us-ascii?Q?GMNx1yHqwIXgBilPxOYVayyPYvmPujgOAoYN/hVeAoQt9JMU1RoTwb5uJi0q?=
 =?us-ascii?Q?MljZXVKJoPG75iaazSlNc4OJmqJPaDhsvCoMxiP8y8MI0+fElBqEPYuVqmjn?=
 =?us-ascii?Q?+vg5ufieUDfGS+TIqLjORcfVdHmT//BdgXGfCW9UrI4Ec8Lb3epSJEXRXgB/?=
 =?us-ascii?Q?ZTZUhczcuIunmA0P/mrjV3wE3e248Xn8nGgq9Z85X6Gd5mqdg9mLIM53JUK0?=
 =?us-ascii?Q?sOOQvdQE+4qGWXMC/VUlL7E+OJacP2GvT5sZnxLK9dMEP2MfsD+AaEzTnZx9?=
 =?us-ascii?Q?rE/jbhA/0xWDZ0DJhaD45sEuJ6MvdhoLx8FzyascnF8riLyrMh2BwBjyOSrw?=
 =?us-ascii?Q?wIHiUX2R94vq4Z01lpJqlyUAYrI5fQUkhSXQ4e5KJaLGNRwfy2vB4/ECDS6B?=
 =?us-ascii?Q?GOCLar68lgDFG1tq9LEHmEte8hQCqZJOlRX5FCcjvry5CmvXjREGMb3YGjDu?=
 =?us-ascii?Q?B4e+aJ3yVBeykOWrW2M6YLyA7YzWEmlJTzVQq/grgikpmG6luHLA2UQ1cK3U?=
 =?us-ascii?Q?X2vb+A25rciY7r1sUWBfOQeQOzQ3LcVjtkgCfeEsV4FELaTnbJ+3QofsY9+o?=
 =?us-ascii?Q?hw803fc3+hrLhC+lQvhUmc6jQ7DLgJ/YAL21XNey6FdKDhuJTUO/+zEFcEeu?=
 =?us-ascii?Q?nYA7zIZzh1jW3wazMOehdZ1kjUyrehab23YWdwVMW1jkmEd+MTixUzfF99Gc?=
 =?us-ascii?Q?JvLTdkLSoW2g3gSoQYyUVBelJgzK1TRaREfsB4EsiuGbp9JDx59bX4X2nypD?=
 =?us-ascii?Q?LMgzRMHxZFPfGuUhsLGLBXJf9Ty7rDIRTtkSi05BGZL7JMKL50KGLk9Kzcvw?=
 =?us-ascii?Q?GCY5xBWrtQUjtbyfqch/nl7ta3l1F0X2S+EPkoK6XBQ4F+t77XBOxsEvT9Ud?=
 =?us-ascii?Q?KWvOSjud92fyCt2FvmfAdJ2xYx2QVIHaw6F/EtIX7zm9hQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(19092799006)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?V7CjM3Xcd1gDJZRgkYLnLoe++XFW96y3a7VNW79QwENqv349U0ZznBlw5Cc7?=
 =?us-ascii?Q?xaI2ywvl80awcczkLrvuWplDH7m1/04tl5wVIveDfXdwIJtHs3oyk05JWyXp?=
 =?us-ascii?Q?v1udJsghDDILP/F+QAI/acWmB6kesn1CIEqwPzpNo9dUYv5dbf1iqh+PMfwk?=
 =?us-ascii?Q?sb6FVi2odZBlLmgouPkE8SZhiK5FBUO/qWDe9fGO1jpgJLV7T78NHlCyCFAV?=
 =?us-ascii?Q?6MLuRfa/+lHHueLdhpdG1NhiuTqOv3wUD+QJNH0WDcHKv9gMK3FSjrljgrhG?=
 =?us-ascii?Q?2XO1XpOvkAfTYLWSYQHKNCdAHVY0vAWYromodnvJz6iQOgLMaucDzflJ8R3H?=
 =?us-ascii?Q?UpDRTskgG2Rx41QyyrDnogMo84MYg7yB+Z48XzThUoNvJCXj48Qg/Nj8HDaM?=
 =?us-ascii?Q?iSMEA6IRDmkHdRVnixsYVjVFsonMHS4BWbnIvAZyG1sJlrWhw8LkLYVzcnSE?=
 =?us-ascii?Q?HgD0pUOwzTLbp3mxmdzbtjEB8ArcDsk/019917d83wUAEiARbodlSR0uLni4?=
 =?us-ascii?Q?UeQKK0J5X1hS+4vXMWAGV8ff11Y5d44VqrgTglAvjnKRS5IJT01KHD9LqDtZ?=
 =?us-ascii?Q?OjarBxGilk/3YROgfrItLX1lP12q2DCkA6gdVYAvstPn2YcrX7Mh7SFYz1xY?=
 =?us-ascii?Q?lr5+/ii/bsRD8i5r/FwUU6GVAOr++3hS05mLkBZKOZCW09f44jEgm8FSJSDD?=
 =?us-ascii?Q?PnlSD7inrVkntB0Gc3mxTzi8ypH4+0oLz59EJShWCWX0elAOCCQ2dLme04Gl?=
 =?us-ascii?Q?PMrKayYJ/p9iz+ZK+tYvyzlv3KqIEuR0ZNUVLH2aiCP07O/9vYDTIKPz4sZn?=
 =?us-ascii?Q?X6eI51/yyPt3gDNldWa3zZci52m+nQYQnSfXeGvdH8SW+6D1c/IG+kvQPLbm?=
 =?us-ascii?Q?6nphpnc6CIOvQeLNqnBSNbFoLeC9uaQAzFVPMiNlBrA6dZTmN3aVrt5JUuJ5?=
 =?us-ascii?Q?UkXoTo4vPb0TEdIko41qt0MxuGzhka56reFdzOZHvSg5pDtuQjFhXdxOjw8P?=
 =?us-ascii?Q?TLTRTEAH0q/SFK/BaFUfk47MCVlqUUkocsYB4x9fhZTGiva20uJk6PM00ZJc?=
 =?us-ascii?Q?iT8NPFCwgCO3w1jFcX7X0MRq5vlHKEDN/qzEy2bQi9QluWBQx8e5f4W1ul09?=
 =?us-ascii?Q?TEdufIyhSpWYRLMm8XbQoFnNNU4h943lNiPLDbknlbI4jxzd9t11dlaqGAZn?=
 =?us-ascii?Q?kgxFj8TUpcMgz1r+SkoL+oeTl9IAmF4cJF0xvw43PEUUMpY14zJfMjWGiVp3?=
 =?us-ascii?Q?dLs18OrwvkBELP0T+OBJwjYUmziMBlguaAUIrdE3RQpYUI8y3/Tnrnxjs9YR?=
 =?us-ascii?Q?r5xp8SOLsGKHLjHegmFSUQhbavrd9e/C4ycilvaSChvrUHoY+pwghGEDzab5?=
 =?us-ascii?Q?MivpF159rVzlEmiFsJqEjpP7AWrGejBl+WNmsyAzScSO/Ken9wkyTrRgiveU?=
 =?us-ascii?Q?+/m5dZ+VZN3DmDNUmyTSb+2kY2ga2KcvIPqUAivAtVEtVAsHF3PHGVEUcIxW?=
 =?us-ascii?Q?YPIwo/gpEmc9PxJ9c8FVHhJ+jpFawaE/bKGDceJSD1z8vVUDjHZjVbKBqYrO?=
 =?us-ascii?Q?noikTh35JDZasGyxMPwBw44mVz3bRaDSbI8vVIhD?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 009b6d2b-e7ad-41d5-274e-08ddf5f7a892
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 14:36:59.2190
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6j8NWdTjmZ/WjAPxO1V7XnXFe5q2OQ95uGSmR1T8TH4n3Iyvaiw+frPIXgyzKs5z7QO+5gnKSo0AVL0VuHErKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7628

On Wed, Sep 17, 2025 at 09:19:16PM +0800, Peng Fan wrote:
> Replace separate calls to devm_clk_get() and clk_prepare_enable() with
> devm_clk_get_enabled(), which combines clock acquisition and enabling
> into a single managed step. Simplify the probe logic and remove the need
> for manual clock disable in error and remove paths.
>
> Also, update error handling to eliminate redundant cleanup steps and use
> return-based error propagation where appropriate. Improve code clarity and
> reduce the chance of resource leaks or incorrect ordering in cleanup paths.
>
> No functional changes.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/remoteproc/imx_rproc.c | 28 +++++++++-------------------
>  1 file changed, 9 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index e30b61ee39dacc88f9e938f8c6ffe61fef63dbda..c6cfb308ddb376f370fd4492f8a84f734602bac8 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -1006,26 +1006,19 @@ static int imx_rproc_clk_enable(struct imx_rproc *priv)
>  {
>  	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
>  	struct device *dev = priv->dev;
> -	int ret;
>
>  	/* Remote core is not under control of Linux or it is managed by SCU API */
>  	if (dcfg->method == IMX_RPROC_NONE || dcfg->method == IMX_RPROC_SCU_API)
>  		return 0;
>
> -	priv->clk = devm_clk_get(dev, NULL);
> -	if (IS_ERR(priv->clk)) {
> -		dev_err(dev, "Failed to get clock\n");
> -		return PTR_ERR(priv->clk);
> -	}
> -
>  	/*
>  	 * clk for M4 block including memory. Should be
>  	 * enabled before .start for FW transfer.
>  	 */
> -	ret = clk_prepare_enable(priv->clk);
> -	if (ret) {
> +	priv->clk = devm_clk_get_enabled(dev, NULL);
> +	if (IS_ERR(priv->clk)) {
>  		dev_err(dev, "Failed to enable clock\n");
> -		return ret;
> +		return PTR_ERR(priv->clk);
>  	}
>
>  	return 0;
> @@ -1134,7 +1127,7 @@ static int imx_rproc_probe(struct platform_device *pdev)
>  						    imx_rproc_sys_off_handler, rproc);
>  		if (ret) {
>  			dev_err(dev, "register power off handler failure\n");
> -			goto err_put_clk;
> +			goto err_put_scu;
>  		}
>
>  		ret = devm_register_sys_off_handler(dev, SYS_OFF_MODE_RESTART_PREPARE,
> @@ -1142,7 +1135,7 @@ static int imx_rproc_probe(struct platform_device *pdev)
>  						    imx_rproc_sys_off_handler, rproc);
>  		if (ret) {
>  			dev_err(dev, "register restart handler failure\n");
> -			goto err_put_clk;
> +			goto err_put_scu;
>  		}
>  	}
>
> @@ -1150,32 +1143,30 @@ static int imx_rproc_probe(struct platform_device *pdev)
>  		ret = devm_pm_runtime_enable(dev);
>  		if (ret) {
>  			dev_err(dev, "Failed to enable runtime PM, %d\n", ret);
> -			goto err_put_clk;
> +			goto err_put_scu;
>  		}
>
>  		ret = pm_runtime_resume_and_get(dev);
>  		if (ret) {
>  			dev_err(dev, "pm_runtime get failed: %d\n", ret);
> -			goto err_put_clk;
> +			goto err_put_scu;
>  		}
>
>  		ret = devm_add_action_or_reset(dev, imx_rproc_pm_runtime_put, dev);
>  		if (ret) {
>  			dev_err(dev, "Failed to add devm disable pm action: %d\n", ret);
> -			goto err_put_clk;
> +			goto err_put_scu;
>  		}
>  	}
>
>  	ret = rproc_add(rproc);
>  	if (ret) {
>  		dev_err(dev, "rproc_add failed\n");
> -		goto err_put_clk;
> +		goto err_put_scu;
>  	}
>
>  	return 0;
>
> -err_put_clk:
> -	clk_disable_unprepare(priv->clk);
>  err_put_scu:
>  	imx_rproc_put_scu(rproc);
>
> @@ -1187,7 +1178,6 @@ static void imx_rproc_remove(struct platform_device *pdev)
>  	struct rproc *rproc = platform_get_drvdata(pdev);
>  	struct imx_rproc *priv = rproc->priv;
>
> -	clk_disable_unprepare(priv->clk);
>  	rproc_del(rproc);
>  	imx_rproc_put_scu(rproc);
>  }
>
> --
> 2.37.1
>
