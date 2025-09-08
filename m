Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011034.outbound.protection.outlook.com [40.107.130.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221DD30C605;
	Mon,  8 Sep 2025 14:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757343307; cv=fail; b=qI3X/KDn7JhjvTm1wZbsTYq5Bx+1WljU9jDp6wbEIsgMSx2DQgXimG8sAE+6cyJT0OuCw2MccA7eXRsQL+CxyCM9BhjsPDGy2PSWKMENDIQoCCblArgOcQpgvTgrFoRyvgWRbEGbv1lJpYc9+bpjsIWuDSoKyPYYWGwDdZCjQ84=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757343307; c=relaxed/simple;
	bh=FTrh+XUCacEdILbGv5pPH3PTZyRzdw1NLOKYXUVonOg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cuD2uTd7FHbB6dabS0BUZUaaCVETYsjmWPArg8eZTMe60WMQ665xoT3qCwu+dz1gq8jGbqW0x5UHaAIL1jU8QEfNRsdYYFp4eTsOyFcxsJWS75sZx61ca1gLWlAs0nBQRvtz6SpFLpTDb9AWBDYGKyEvv+QtvTbg67pXBoMvfcY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Y2EnEtT5; arc=fail smtp.client-ip=40.107.130.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Y2EnEtT5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fhvBV5vn/80XbUxRi7aK92NHoxTN3gEsBudYuZQ6UMPZcJXh/7BO49SbPMdgKppE1yq8jXRJsToKF1sPZE6qy50EHadgx10Uxk225jjP0yE8wVP4FUhO+agqCnn6p1v2tsTS3e0OJOOQ5d03YpjiwSxjVr8cQtRJpToxUFr0zhh32KsNxbiUZBJDmaODM7NGrrRumNamsV8eAv/e9qRcWS2UaE8/WkZ2d3wbzWM0+uLxPg+KDyxeeKHB7UFUKXaqc/S629KioM76Ylksb6yr3zMjxaJFz51BCO3g0ipFPXKtE+DbOECILf0HDjWwfW7l9hsKMIL+EOj12gtkozbeOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IkJpnEdF2AR5pZWNxC8vkTD4aF8YgTu/vkMdhoB98rQ=;
 b=ENl81DUgrUJfOe4z1+smlV9opD6XHZjN2rcCgb9eBBWWO8Ue2TXmN3eGbutKv2fcn2UPT3+aDzd39mYZRz/SzYDjwFjLCqBixQAw6K75vuYhW+VSWUU8MKzhrgNSh908PbcpU4ZXgThzzZ0IR2JWBS59ICSj+HIxWBmTRygxMrJbWby84jA5chBHqgDxZ7/5tsMhGLWW3JK41FaL+RVxfpVxQinfIqB472T/zCcB9Amx0iAKR1PJ44uWKTlztdSgGSFTyAmtIqKGapN8tzcgEkO4AMS9ZGSZe3jXKuPiByTD44Hp4l8rjsdA7Np3VctgKeV1bbF1rECfSse/mqtP4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IkJpnEdF2AR5pZWNxC8vkTD4aF8YgTu/vkMdhoB98rQ=;
 b=Y2EnEtT5iV+J5vkV3PH+BK12JYaJT5v1e9W8ty4xNI++9LVKc03Qo54JgA9kkZo8utIuojOaH8o/vpO+qIJMJPRlc851LhoRJCmprxJgxTZPc3yyzXQ8x9uS6rtlkXaVjs8oEuWwQUBbPV19G+H4G1sAvkcdwVJxCJpPlrjLV9Gho5iSFWj6OEvtWrNw2ZxMQcWnND3yrIYxHGqkZ6okrLC/7l+XfohfcCzPFJPNN7FaG2zHt1nHFbQ6kglIw7Gk2hFpjamxfrgbYVaGwJ2Yn2oGfzqBAKepGBQ2CSSUoum8qyd6hGwHGhK/3fZOINUR7sP40J+VjtYOSpeIybQzlg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by VE1PR04MB7390.eurprd04.prod.outlook.com (2603:10a6:800:1aa::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.13; Mon, 8 Sep
 2025 14:55:01 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%5]) with mapi id 15.20.9115.010; Mon, 8 Sep 2025
 14:55:00 +0000
Date: Mon, 8 Sep 2025 10:54:51 -0400
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
Subject: Re: [PATCH 1/6] remoteproc: imx_rproc: Introduce
 start/stop/detect_mode ops for imx_rproc_dcfg
Message-ID: <aL7uOybn0ssJnVhr@lizhi-Precision-Tower-5810>
References: <20250908-imx-rproc-cleanup-v1-0-e838cb14436c@nxp.com>
 <20250908-imx-rproc-cleanup-v1-1-e838cb14436c@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250908-imx-rproc-cleanup-v1-1-e838cb14436c@nxp.com>
X-ClientProxiedBy: PH2PEPF00003854.namprd17.prod.outlook.com
 (2603:10b6:518:1::74) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|VE1PR04MB7390:EE_
X-MS-Office365-Filtering-Correlation-Id: d800496b-8755-4aae-27b5-08ddeee7af63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|1800799024|366016|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ToPSgIFXATeoSmqrcj8QEefjrx+27j8jp5bmiZlbOrU57RY5hHwnEDCulqiX?=
 =?us-ascii?Q?aFEm7kJ17Lqi3Szl4nLuSz5fYrQQhL1UY+xBSR67rSnU2a0ss8oBrOL3VLq1?=
 =?us-ascii?Q?n8vZ+0DCOmsb2iPVGspYTc2JGZFaYiygpgAp572S4KqGHSf94TXtBGGAzq3c?=
 =?us-ascii?Q?SxSlp+nY/y+jspOiQKrtlC70TP34qVXW30FiAeaM3LG3hzmLgANO0N5EFsGV?=
 =?us-ascii?Q?KLKhQqthTVXAmCHwKBAtQkPEje/BE3lAhBG0U+H5mO001rxrfRJ8xIdt2uBy?=
 =?us-ascii?Q?WuOlqTllB73k+ChmWJmm5xgwns049ugN+yQFAmjmTYEaN1rkcG7IjcHgeQ2B?=
 =?us-ascii?Q?NvOxvXdugK1L6XhugvlvuJcGpRU1eYDaI46u7GdnDm0HsPkGvERvsoGW+TYy?=
 =?us-ascii?Q?a4gyc7af2GFTRIc6loR2yE85wrQJu7Wr4JN0xXDe/z4cnb/9JY9du+VqjFpL?=
 =?us-ascii?Q?1h2vFznM85GqTTeaDFLspltFwQst3uzLDi9pQtMdrxXZQKzoBJ9YKlwtdqHS?=
 =?us-ascii?Q?gkk/r7FuRQ0Nx/e3MRSCCVsY7n3XvDFIoTmDTgXfqZuzEODmKo7bleY6Sv0B?=
 =?us-ascii?Q?l4vH+FcHtmm07QTgulOFkhwebwj05b2fKX8S4Cd5XxnlwSzIC8d77zhc5WkG?=
 =?us-ascii?Q?h5U/Z6OAO3I2jtBzAUTfzoV9NmSzKQfoThV9Sb20eCoT7rgapezthRCR9w9w?=
 =?us-ascii?Q?ZvD8XXCyc2af9r7ccO0F97WGv2MMDSwlcbPqoqSTFHrdnm6qeYIyeELPVqhe?=
 =?us-ascii?Q?BJX8Cc6TE2BJYrArYKWLEJD3QqowfCzCXZV5Tf95gthZ1AgYEd+3Lcl8KBJa?=
 =?us-ascii?Q?sidVfJecUHPtiFmOGxuul+bA1j2m419+Pj8P5r09EGgd9ryDkk12J8I0Qqs+?=
 =?us-ascii?Q?KPOLd1xQF3VEnHhxwnZe7IHlrLy5fXJy0dHj+lEL1jBUcaFTEcVoAtwWd4qZ?=
 =?us-ascii?Q?PmCuiwTB2g3VpCbfm0bZwuXM9pzyd8u4y6Gz5/jDHe9steLfp58wcWAw47+M?=
 =?us-ascii?Q?Ku6Vm3mstIxDZaGucPCb21fKGrIF8825CSqC92ck0OlW/BTV1dlmAw1ilRbK?=
 =?us-ascii?Q?xgQyf+jINj2G6ne7XLY9Al6k+HZzGvVRhduxJMJikOm+8R7BEwCTu93FWdKz?=
 =?us-ascii?Q?5MI49ROGZ2Ea+1KMOnS2MMe6E/4QjmpG5kLEnRa1lOA/tUw4nDYnqcAZxnqa?=
 =?us-ascii?Q?PT9hPCQhdbKIr+gf/DXjLfBMxzaOJIiI9cG44iDxDLoolVREC4eJksWyXxZt?=
 =?us-ascii?Q?8pyXUURYy7HKNbctwxoQGR68PdnfcxNEMTGf+Hj3QKUVjA+P5DXLkK/DcjW7?=
 =?us-ascii?Q?1HqWXw26swGEl2T322jOx28UakNyuVl8CHcmmdUjFRVsKfFKajPkQWsrCXdg?=
 =?us-ascii?Q?stlk3qc+L4j/QAPHvYhFYOOpbiiawTElsDk7Sb01kCdft4yKBilvjsr7mzrc?=
 =?us-ascii?Q?Xq8xjebJsxHJ32S2GdarWUs5mW5Xfwi7B0CkjEto+Pxdxbuq5+26gA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(1800799024)(366016)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zRRzqpVBlbXC/VsDL0OQDNw/RzlWJF8PTEuxjY//xXsBrEjFPX2l1pk8Q8cD?=
 =?us-ascii?Q?g2sefMaOcNlqkaN1s5rtVY0in9AfCvAKDAy2NLfRdKw26G4pq/Z/7vFqisNK?=
 =?us-ascii?Q?HtlFQVXizGeg4HIvbDsOFBZjqDfMT92ijjgMiwEP6TtZ/GMw2/qZnQ4ms3pt?=
 =?us-ascii?Q?cY48VdZkkqh0atxnEdNLaqiKGz3GMlNMYNkNtLBXF9MT3F4r9gJ2SR0mX0L1?=
 =?us-ascii?Q?lwpsb7Vqxm9LhqEvs7+28Dz6NgkEEXONvNy0LVZUrdFfMfCw4yHOWhS3HnzX?=
 =?us-ascii?Q?xnOs6O+ugoibuS9jyWmCnYd0cadwflq5uterTxM73kocRDR9TSf+0gZTMYbD?=
 =?us-ascii?Q?2HuccB8XstyNr5KM8/FF+OqJ0qP38NCreltxKWF8lMGb2nkbwAoaFHbH5AFV?=
 =?us-ascii?Q?oVDGEqdHcchcHHY60T3+R+sDjFslrkgvE6WD7Lr+HVorRPH2TrLU22b/MaUz?=
 =?us-ascii?Q?kkqFopv2hfvQKrt2bbuNCZf3z5KwLp1Y9mlMp8HKEq8JzMBjsbCjHHqAjYlg?=
 =?us-ascii?Q?2AHp9pIttluKjvSroUpTgZfXxDUu54FRqqSld9U3Pz74PpI9hokdZ+DYxLgo?=
 =?us-ascii?Q?f0w3UlXKZeipIFTxe7Oj8G/DcA3+KGi5Oo7pBkPelXKtm8esWNjOtZTMqn7E?=
 =?us-ascii?Q?r0p+P4mfsVq4v1cKfuQGkUUXLfNJDEuX94zltnFdPcA1Ipo1yqweWUcS5wAT?=
 =?us-ascii?Q?R6vQFy3U4NU1Qehxta4Xk99Jr1fh65IGfCKIX8NJjk2GxXU9rCw9haYuBLtX?=
 =?us-ascii?Q?asazKZOCUtKOdOLONkolQ7gYH2FfPeECRSmPe9FI28f6HoNCr3qNbrIDR3XW?=
 =?us-ascii?Q?+F6kNiShrDO/iu6SGD1QoDN6IbuLi6IxWlfITtei/IX/XFcRY/WbXztzh/S8?=
 =?us-ascii?Q?81WioW0Azb5c08ezYik2TCyDFb7koS8oOt3nv78MvNjRwwlehY4vAliOcBtE?=
 =?us-ascii?Q?Fp1AM7OLEWwlnDAToxRgeuSDOq+Zuiomtr3m0aI0TNWi8EW2TjvNmy9ze2gv?=
 =?us-ascii?Q?9r/I18lGfLdlVAHdY7SWbEQdqHqYGpbP/CDylgfZDB7piU4tuUx4/5RCTwkD?=
 =?us-ascii?Q?dqudM3aDm5MiSNchlg0Jo4oEkmutLnyaSd9EDob3oG0hGB95JJDs4wihBxKe?=
 =?us-ascii?Q?uwcRmEx+ZmzP00+BOgvzM2QmGArHTlCLxO/hljR/gyaFhI4Sf8KkBoAFoHxE?=
 =?us-ascii?Q?HMZ5vZaVDn0NCHJrw+9YvFi5V76xx1eqfOzf8isJ0uSGLriTh44Rjk+5uElK?=
 =?us-ascii?Q?+YjmRJp2B8fLaLVHeR5MUS6nQRAt3zSIqylBNKX9Yv08AeJhbJFCgpa2F+fq?=
 =?us-ascii?Q?k1p9ISsWkyKp6mTxFYaOlWGHCMfngZvzZ02vFWJD79yl4SEymZvpfqRLKHAN?=
 =?us-ascii?Q?yca1Ich4lMEQSn1mNDvH9EUC8c1J6mm84EOIz88O3ram0TEPt6UhJ6/iDAhq?=
 =?us-ascii?Q?xs5oAsLt5zbalOoj/8k5I7HKmxdaq+vN39RgBdz1nsGZ52+fgTHQR5H84AYZ?=
 =?us-ascii?Q?TzCZgb7SOSp8LlIq1Oxsgbjmya4un9NtO+GcP60dMTuOfZpiu2A1SpwnqMnd?=
 =?us-ascii?Q?7iWaIfApx7UNtwMsqOM=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d800496b-8755-4aae-27b5-08ddeee7af63
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 14:55:00.6985
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rg8DMROPqlfYQgOwrB9Apu3Pg+EcT5dCvH3TuK8Z9VY/XUxTAGnM5AfkmWQJUhkqoIMXFGw35dYGBK+pdHT0yA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7390

On Mon, Sep 08, 2025 at 09:07:34PM +0800, Peng Fan wrote:
> Simplify the logic in imx_rproc_start(), imx_rproc_stop() and
> imx_rproc_detect_mode(), introduce start, stop and detect_mode ops for the
> imx_rproc_dcfg structure. Allows each platform to provide its own
> implementation of start/stop/detect_mode operations, and prepares to
> eliminate the need for multiple switch-case statements.
>

Nit:
s/Allows/Allow
s/prepares/prepare

> Improves code readability and maintainability by encapsulating

s/Improves/Improve

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> platform-specific behavior.
>
> No functional changes.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 15 +++++++++++++++
>  drivers/remoteproc/imx_rproc.h |  7 +++++++
>  2 files changed, 22 insertions(+)
>
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index a6eef0080ca9e46efe60dcb3878b9efdbdc0f08e..5cdc5045e57566e817170ed3c708dad6108d2e46 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -376,6 +376,11 @@ static int imx_rproc_start(struct rproc *rproc)
>  	if (ret)
>  		return ret;
>
> +	if (dcfg->ops && dcfg->ops->start) {
> +		ret = dcfg->ops->start(rproc);
> +		goto start_ret;
> +	}
> +
>  	switch (dcfg->method) {
>  	case IMX_RPROC_MMIO:
>  		if (priv->gpr) {
> @@ -398,6 +403,7 @@ static int imx_rproc_start(struct rproc *rproc)
>  		return -EOPNOTSUPP;
>  	}
>
> +start_ret:
>  	if (ret)
>  		dev_err(dev, "Failed to enable remote core!\n");
>
> @@ -412,6 +418,11 @@ static int imx_rproc_stop(struct rproc *rproc)
>  	struct arm_smccc_res res;
>  	int ret;
>
> +	if (dcfg->ops && dcfg->ops->stop) {
> +		ret = dcfg->ops->stop(rproc);
> +		goto stop_ret;
> +	}
> +
>  	switch (dcfg->method) {
>  	case IMX_RPROC_MMIO:
>  		if (priv->gpr) {
> @@ -440,6 +451,7 @@ static int imx_rproc_stop(struct rproc *rproc)
>  		return -EOPNOTSUPP;
>  	}
>
> +stop_ret:
>  	if (ret)
>  		dev_err(dev, "Failed to stop remote core\n");
>  	else
> @@ -933,6 +945,9 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
>  	u32 val;
>  	u8 pt;
>
> +	if (dcfg->ops && dcfg->ops->detect_mode)
> +		return dcfg->ops->detect_mode(priv->rproc);
> +
>  	switch (dcfg->method) {
>  	case IMX_RPROC_NONE:
>  		priv->rproc->state = RPROC_DETACHED;
> diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
> index cfd38d37e1467d1d9e6f89be146c0b53262b92a0..3a9adaaf048b396102feeb45488cd2ff125a807a 100644
> --- a/drivers/remoteproc/imx_rproc.h
> +++ b/drivers/remoteproc/imx_rproc.h
> @@ -31,6 +31,12 @@ enum imx_rproc_method {
>  /* dcfg flags */
>  #define IMX_RPROC_NEED_SYSTEM_OFF	BIT(0)
>
> +struct imx_rproc_plat_ops {
> +	int (*start)(struct rproc *rproc);
> +	int (*stop)(struct rproc *rproc);
> +	int (*detect_mode)(struct rproc *rproc);
> +};
> +
>  struct imx_rproc_dcfg {
>  	u32				src_reg;
>  	u32				src_mask;
> @@ -42,6 +48,7 @@ struct imx_rproc_dcfg {
>  	size_t				att_size;
>  	enum imx_rproc_method		method;
>  	u32				flags;
> +	const struct imx_rproc_plat_ops	*ops;
>  };
>
>  #endif /* _IMX_RPROC_H */
>
> --
> 2.37.1
>
