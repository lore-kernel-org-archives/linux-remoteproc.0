Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013053.outbound.protection.outlook.com [40.107.162.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD3D298CA6;
	Thu,  6 Nov 2025 16:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762445560; cv=fail; b=F3qxpO2wRm+BYfUw92nTUow8s3ieQfk9izE8DkKRD3nJ7nfIgT4D5CsuH9EK1q9AbhaRqeLXhbRVyy3QsCpIfWmjAct1LP/Tx2FwwjkLdv5mcEarJvKxOodMSc5ToWChlKHpbdWb0Y924Q1pU6sOrMh0A0O9DzCZbKkZXDYKi1I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762445560; c=relaxed/simple;
	bh=2wiRWwR43sMmNHHxxmnhBW1SreJn+7A0rOat8XXGfWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Ip+DdO0Pl/p4QS4ihnZxuBKQhdlet1qjVyAV5os3C6SbWfSjIZiyqRzdwwlwC/niyRWFAhzxY/qNFRejIAc/eCRWBJzlOGk32Ul52UZ6gl+FN7m48TwcnsBpdrt0oWe2MN4vPNs0Oabf6gnk80jGk8r07IzO7/GPTA8r4YvsReY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=iJ8Fw9M/; arc=fail smtp.client-ip=40.107.162.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="iJ8Fw9M/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KZjAPxwseVCMeqBFEwcFDia01iiBHVnBwn2i40fOxfCildtf0KQ9cZYBgOaxeXA1JFLBQynfLyH8Ewm0EDhAOUEXOtl1mxXD4kZT/B0PBJYrS7+GNtt7QR2w3Rv86HQP5/J+/Edpm1pvUoNu/9d+v9B56EpU4quyoiCwitLyCHeHbPnRsZz+4K4MP6XIu/5mUrMUp/xnmywd3cxA+YtE6mlM1Q2yx888eVX30x1Y2Dp4aCu8MOqgEaIo8w3wujaJK0b1cpWEm8Wkdnr/CByq15AfeUQ0ZCJFCa3Dcf1LQP/KZSXdoXtOmGr4emwV3esTrux2E5hf5imLpOaZONxX0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n7X/qGysdFzIOH1bRvfyuiDGVBZA8lUqQRJTnI3i0z0=;
 b=m8MSwNhxXSgFdGFCcdHvaAJNeOLdlOSPnoBeT0b6gw5BQ9m/jdfz1FkAV5M6Tby90En9q/FQnj155+NMrwju6s6b1dh84Ls54Yk3/jeBvG6m3N6jQUX51ygVnG83haDZ/n8xCh70eeb5odebFchl+swyV3mpfhomRD7NYt5jNkKCMjMVP/AwwtP2aDf3GfWXtouiIdxZ1h0M79fkwFZnLAJ4YoVFVaYS/zoi/MlzvIL/MEr+MwgrisHFNatJrfW1VhJNrBZiLDF3GVNJglN6TE7ty1/G5JO3NTkv67fn9gohbH5zdOqYqqZiROkswYzwy75viHjIyNcm1yuQML9KYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n7X/qGysdFzIOH1bRvfyuiDGVBZA8lUqQRJTnI3i0z0=;
 b=iJ8Fw9M/ATEgrDPr1AIUuA0jDiBF/0X/03hGWOtm5GeC3sPgaFR6LpDi8/54kD/penWPvrxl8VeerojnkXYPSISIsA09dE6jgaQGFI60kpGt1gU+9XnPm4JKtQPazfbSX5QP1lNUGb5QONLiEhcYsy3bUx5Yt+ZW+sAbZVVGYnkSFRnIdDn1d/IBfOobAL1y3T/7DsF5Lj3fZo6PTrMkEe3l0ZqQUF91z300WcCw7DRF2PdcNDWjnuWJQM/EOFYT8DgwTkEiZfUr2fLc+PHYKBAn3SW5rYvk93uHca0NSVcN6k0HlxR3PQpsPyxwexnp0gR9J7WHJdYJIKmoT9DimQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by AS8PR04MB8388.eurprd04.prod.outlook.com (2603:10a6:20b:3f8::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 6 Nov
 2025 16:12:33 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9298.006; Thu, 6 Nov 2025
 16:12:32 +0000
Date: Thu, 6 Nov 2025 11:12:24 -0500
From: Frank Li <Frank.li@nxp.com>
To: Peng Fan <peng.fan@nxp.com>
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
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 08/11] remoteproc: imx_dsp_rproc: Simplify IMX_RPROC_MMIO
 switch case
Message-ID: <aQzI6OXbRt9T7BIv@lizhi-Precision-Tower-5810>
References: <20251106-imx-dsp-2025-11-06-v1-0-46028bc3459a@nxp.com>
 <20251106-imx-dsp-2025-11-06-v1-8-46028bc3459a@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106-imx-dsp-2025-11-06-v1-8-46028bc3459a@nxp.com>
X-ClientProxiedBy: SJ0PR05CA0086.namprd05.prod.outlook.com
 (2603:10b6:a03:332::31) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|AS8PR04MB8388:EE_
X-MS-Office365-Filtering-Correlation-Id: 54bc9960-e1bd-40d8-e50c-08de1d4f4aaf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|19092799006|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?T36RhgwERfhsSkUMh+pgB7MG95SUW9pClKOFGmQr+Tn36EfmBvVzlAa+hqQk?=
 =?us-ascii?Q?3lOPVG1ZFTd6zdQnLnEJMUkSRgGx54kCzfr+l/ftOLmmS5BPxh+Q95o4yPil?=
 =?us-ascii?Q?Fkt0EiHkyKtgJXd4MyYQfsqNNOlaVIaA7CJK4lMJ1ALow24y1TvbsYvg+HAz?=
 =?us-ascii?Q?hgth2xwbb7xInz/8BJbi3Byo35Uy9zxT99WG1zcjnXrP7cZI6G7+/0FgGip6?=
 =?us-ascii?Q?SxH/1+3c8nxUoZD30c5AnSeUD/jcXUvBVZwfz35w51x2yK5ueJRvfcjm6JOA?=
 =?us-ascii?Q?B7BNtO8wj9uvvpovdmjHhzz9WIARKeYSzneX4VEPD7NjteYEcpKuDVVJq8dA?=
 =?us-ascii?Q?AVvL4ZZUINHQJ4qOOWNHjLS2D34+1qYTxRgbZ4f42wHT9NJ4e2WCaucx6Knk?=
 =?us-ascii?Q?XDRjZCopTZP3IinA2SVNeRzxeNvkN51hzLKzVgL0VWkThly4+We6Nc8f8BLy?=
 =?us-ascii?Q?4ovxB0ppJSM3uim7MyJvo0f9PXLSHQom/LBgajk8ve14659pVSDEuT1cNh3U?=
 =?us-ascii?Q?l3OlnoWCso5/VMD44fH5zESQ6riI3JrWzyEUb3oWpEQ6v8A+JIR+aBsBDCvw?=
 =?us-ascii?Q?HspbgnkFvVZUZaIvLyf0Ms7yD8hqbbd7S495uiHzVfW/wju/8SVvmf5vcERZ?=
 =?us-ascii?Q?252PDwJUJg7uwmLUYMJx1KVfeYRkwxdaYDdZeCX4dWuu8jeHY2QcsXkgpEm5?=
 =?us-ascii?Q?k1xH9r+ONyhG0N4+puZk+TlrdeB6pnOZCfQMrYMDjIx8rP2VfBMvHLxgDI8B?=
 =?us-ascii?Q?Ptp+Gst2WrWpPY9Qb/v2a+pPXfpo44XvUshYDrpYk7uaE1x9ZGy/ZONkLPXl?=
 =?us-ascii?Q?7qA2aAzaam6ANRX1StuP2QJA1J+9mebZrH4Wg1iH6IA+vHeYA6F+j6GZHit7?=
 =?us-ascii?Q?jEzG779iIX+UqrxRkAqEtbGUykcj2VXG5/na5ep4X9tHQeLmxe8oMTCJl4hG?=
 =?us-ascii?Q?v8uMS6Ih5u7p6YHpBBijSLfRfeof2mfJtU1xyL5qolhou1+E0IS58uuiaPBF?=
 =?us-ascii?Q?fc+bonixDngXF3/tOp3Cufq/g/jf3PMvSlwH0fdZADK+WBiEu8i2DcXRXGKT?=
 =?us-ascii?Q?NjORtGDpxpkW0WDHij3wSTJmHA2QMWlhZo6BrxRfs214KSoz72s9eOucIlxS?=
 =?us-ascii?Q?3lQ2z6ec5C26E1eHIK9jdC0HYp8ouElOyyUmTggYpDPtcUsY1lBO1MXRDemi?=
 =?us-ascii?Q?UBb2Zi7+/zE6jnSONjtzwcldhJRwagcNe4AlYwBtUybyLaqRkYlUPnNn3Pkm?=
 =?us-ascii?Q?iFWREd+UPdu64uOqgP8Od4vM1s/uTc1/VM+XaALjTNjxbi4Beb77+VG2neyH?=
 =?us-ascii?Q?BAqBgqAm4tmzMYAwyeaubg+hwexJ6zkdZzPxeUqpnC70qaFt2xueqc2PKYKN?=
 =?us-ascii?Q?ZvqSOCILRORagKHAwEvHuFlRuS7jz2sWNGf02ag7dlB3f/tw59TFU+qjos1u?=
 =?us-ascii?Q?O+MKxLWs+teN/iPveGBlFnobSw1pzcC3qszMUmS4PV/uWQA6T8HYxqYeiCLe?=
 =?us-ascii?Q?faYrLj8ZQCZ8zrFc1bnNRhKwhFiTMdo31tm+?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(19092799006)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jCbfN+ZtwRkbfXVQNR2FDoW3rTFV66PwHlVFRiuH2yIYJ+1bHeLuzZdioIwK?=
 =?us-ascii?Q?sdtha8VKGziUdu5kjGkWaqFZEQhQe5SfxNID6kOlunKBOcQS7RntiWkfawR6?=
 =?us-ascii?Q?Fk4J/k3czj6RQIwdl7r0x+kGSNnxjP0FwUK4xZqnt+xl8kwHhCjRDWg3U/cM?=
 =?us-ascii?Q?xSVvnMb6xCusWj2tXkWaUm1n3tQ57eayKwoswnx1IvZWMM9CM/DO2+dSybJV?=
 =?us-ascii?Q?IgETxjKfZGY5LnQsQCCO179CdjbbuY5c4hlcOE2OFY5j6q/nizVB3k5QFGyn?=
 =?us-ascii?Q?nmil4wLb3OpSic7c2rwPGUEvF64ONLBibaQCFf3Qv7OSanGAQg5CorHBYNPB?=
 =?us-ascii?Q?09/8J0pKajLWS/qc4Ct3vzkyOJ2oOQZFmyOSJB35fUmAYy4QVPwgV354aPD4?=
 =?us-ascii?Q?h/RYrkyDl1DEllLs0AiNJ/qVde4mtqYlwbyrnJX+6oa0tnwb9oajXmVCj3M6?=
 =?us-ascii?Q?ILpCq8UCLOh65JSBjp3zhrBfSCwsdqlB0AyriU8BfeVQIYrK8xOzST41XxNe?=
 =?us-ascii?Q?JLS0opFNDuOaluW55a5fMkemaNybBCWw5A54FVJ/Oeel2eNLrKHCpcvfyJUZ?=
 =?us-ascii?Q?DWKKq9KkGlqK6BiN45DwmQSz9tMKNUuLOmQaCREBGStx7ZbxoWmwYXrACSRJ?=
 =?us-ascii?Q?Kqr/aV/MeMtiXtdI+2LEhjtwPSm8lgtmBurHZde6m9oyc0pS8L+ItFuAtzZg?=
 =?us-ascii?Q?sgjc8/X6eyCXWNLS0a1zGDFE0acZhhTwosXj4gtCxb6o48IDqjWMehhefmqg?=
 =?us-ascii?Q?GZWmyBUHrUtodjXjiHEBgfC794jBknCjS5FrbzLS9fSAhxozf45Tr9BzzdNp?=
 =?us-ascii?Q?OR8FKfiHJxD/qxdIVhNt7VsPlMVqUxyPM4o9cR15Rb5+5wLSk1fciakhgn3C?=
 =?us-ascii?Q?FGxrdjIk94dBZ9r5gzY+qH6AS8B5y5i+F3BfQXpk4Wb/TPQFKIQQaxnhNI83?=
 =?us-ascii?Q?I/yE4VwmQKe3LkUCf1oX0903cbVEG36/a478Qepp7VAVtHkREwr313h7kwSg?=
 =?us-ascii?Q?4KWNGSHi8ghws1wNpVPwQYc8pSRMyZmIGvRwmk+d3WTkbHhUicRJCb8+iL1h?=
 =?us-ascii?Q?R+10X6OgUoaDbMqxj/Zl4eXAzjG/UaowyvqNEr/Cp6qkdA+gZiWOs5J9BM2B?=
 =?us-ascii?Q?/jALsQiWvYl9Jibs1jmHg6IDF+Rm6KlzvHK6BmMxu2KOerca+vCgBgs6Y6MI?=
 =?us-ascii?Q?h9gZErbbpC1m0op/7wiYRogeyyDpjqRLu2UjKFixhW37U9uAzSp6dfuNfoG3?=
 =?us-ascii?Q?ohIfcSZcmL75U//yc4coOQNiiMFDMU38fdQTYvTAr263k4IvGAy/RN5a5XDI?=
 =?us-ascii?Q?8RKsVjH6kLxvx/WEwUeya7PlX8uRN3Jw424ZgPNG+KT4D3gklUDjVZuukNVY?=
 =?us-ascii?Q?ul5WGAoYuoHeyrRc2aTtHnoHs00hH8sLWDW6ajV0g6cMZAwGzDry3qWLuMBG?=
 =?us-ascii?Q?iHZyBZLmWj7+M8rpFw3tm8O1zVglTMyJzHqxnwDXLI+8RYZFcNyYZeYxtUA8?=
 =?us-ascii?Q?bNixaYMrco2REa2rVrzLEsCRSwK1yFMi6eRohJGdekoc8Cl/Pznr/uLOCqPZ?=
 =?us-ascii?Q?98Pz6OQk/AuhXgXnyPw=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54bc9960-e1bd-40d8-e50c-08de1d4f4aaf
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 16:12:32.7605
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GNosjCbd3FV9oy6rNqmdo03tUB28F5udtlLdswO5Ba6hsAz9VjlqRjPxy1jDGxX/L86uG9fu3MotCv7bicCiCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8388

On Thu, Nov 06, 2025 at 11:30:34AM +0800, Peng Fan wrote:
> Introduce imx_dsp_rproc_mmio_{start, stop, detect_mode}() helper functions
> for i.MX variants using IMX_RPROC_MMIO to manage remote processors.
>
> Allows the removal of the IMX_RPROC_MMIO switch-case blocks from
> imx_dsp_rproc_[start,stop,detect_mode](), resulting in cleaner and more
> maintainable code.
>
> No functional changes.
>
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> Reviewed-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  drivers/remoteproc/imx_dsp_rproc.c | 61 +++++++++++++++++++++++++-------------
>  drivers/remoteproc/imx_rproc.h     |  2 --
>  2 files changed, 40 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index f28d25cab3f1d89e5cde37a04b528870a59abeed..71776816c3508a86bf7b8a09ac45827a83a7bb3a 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -338,6 +338,14 @@ static int imx_dsp_rproc_handle_rsc(struct rproc *rproc, u32 rsc_type,
>  	return RSC_HANDLED;
>  }
>
> +static int imx_dsp_rproc_mmio_start(struct rproc *rproc)
> +{
> +	struct imx_dsp_rproc *priv = rproc->priv;
> +	const struct imx_rproc_dcfg *dcfg = priv->dsp_dcfg->dcfg;
> +
> +	return regmap_update_bits(priv->regmap, dcfg->src_reg, dcfg->src_mask, dcfg->src_start);
> +}
> +
>  /*
>   * Start function for rproc_ops
>   *
> @@ -360,12 +368,6 @@ static int imx_dsp_rproc_start(struct rproc *rproc)
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
> @@ -388,6 +390,14 @@ static int imx_dsp_rproc_start(struct rproc *rproc)
>  	return ret;
>  }
>
> +static int imx_dsp_rproc_mmio_stop(struct rproc *rproc)
> +{
> +	struct imx_dsp_rproc *priv = rproc->priv;
> +	const struct imx_rproc_dcfg *dcfg = priv->dsp_dcfg->dcfg;
> +
> +	return regmap_update_bits(priv->regmap, dcfg->src_reg, dcfg->src_mask, dcfg->src_stop);
> +}
> +
>  /*
>   * Stop function for rproc_ops
>   * It clears the REMOTE_IS_READY flags
> @@ -411,10 +421,6 @@ static int imx_dsp_rproc_stop(struct rproc *rproc)
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
> @@ -1032,6 +1038,23 @@ static int imx_dsp_attach_pm_domains(struct imx_dsp_rproc *priv)
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
> @@ -1049,7 +1072,6 @@ static int imx_dsp_rproc_detect_mode(struct imx_dsp_rproc *priv)
>  	const struct imx_dsp_rproc_dcfg *dsp_dcfg = priv->dsp_dcfg;
>  	const struct imx_rproc_dcfg *dcfg = dsp_dcfg->dcfg;
>  	struct device *dev = priv->rproc->dev.parent;
> -	struct regmap *regmap;
>  	int ret = 0;
>
>  	if (dcfg->ops && dcfg->ops->detect_mode)
> @@ -1061,15 +1083,6 @@ static int imx_dsp_rproc_detect_mode(struct imx_dsp_rproc *priv)
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
> @@ -1301,6 +1314,12 @@ static const struct dev_pm_ops imx_dsp_rproc_pm_ops = {
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
> @@ -1321,7 +1340,7 @@ static const struct imx_rproc_dcfg dsp_rproc_cfg_imx8ulp = {
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
