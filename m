Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011008.outbound.protection.outlook.com [52.101.65.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E1C19E968;
	Fri, 31 Oct 2025 19:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761937494; cv=fail; b=AmPMg6QzSaHP+YXoUbw3xTygGVXeb4b6SnyKYPo3vCYazXWo8RJCudvbLBPnfnO1HxBv2OWPIzUQPx9Usb7Jf+15shgIsX4ZnQG9D/ObWnckdU6PYHmGoyrwX44BLxxgdE5zt1g3eDKDv853XVaTij1CUOgPiXBtLOYfpijXOdU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761937494; c=relaxed/simple;
	bh=SUz2CLkTm02xJvOs/6n2GTTXgFtUsIV3Z3dDgZXCayo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=BLvLSM/HmqfBpzW4GO1IIOwRAlVKgtv9JNtyNRcvpR/VT0yp2lQPr/FLSL7E1/MUUOGvmhCa20iCD40rwaJPQMNSiYSodFpipR4AuYZ976ktnfPQx/CcPHoE0we/VqzR9UPSoTS9MHWgeFn+JwDrOaRvdm/e//p7Ox+PXqSdL2Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=k9lK04kc; arc=fail smtp.client-ip=52.101.65.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="k9lK04kc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NYhTi7qsIad1AwRfCcHPtiPF7MZPOwhAlADgPZI6WW42Ao6ow8iKRJxENNwiRudOJ/0GO5RuWn3DU/zzslDMvpoMzIKO4RsRPCzf2ssHiCiv3dDeVs89aHCT/PbwjdLuzSWmAI9PRBvNG08vVpiQbw3t/POakiZJe5ecD1kVXPFVQdEYMrFR7Hw+iF4iY5UZtu8a2ChRh91All8SCJvRTwLE6P/Dco/szv4mmpFdTC5jbT8G3DewEXaYwokfH57T8cL9IqF49kWE/09KydBmLG9OAZdtL3WD6YaJu/EA+UV/jdJeoZQakyBic2cPoxPRAbmGvb9nRMMBDAO3DxKkvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SjAz2mF9Aq+jhoBblZrqEsgEqmbNqnjPubXiUxaV1QU=;
 b=jQLjtN2V7FChtAjzcuFwle7misnQjCt78sdKNXcEqmY0giCzAzwAz+5GpjdowrWG9NRPa3Snv3sHAwln0AmGxTmfFRJbX6J3aIvK/5bDoSDSmiu2gyez+SvzzxnRNukcb6esctkUHYaA87HFd+/PusDp+jDeUu3IeVgtCg2KQ5Inb7kfiF1ng7muDcI9k2hehNLZyn7tNgTlhnMwNYU00tbrkmgi5Cs80F9Z1KezgWQ5/Js0HUoOtCZIBOrwcP+/MUHq3AOP/rpX6wxOK1zrobzl1bCQuLFaGRk+CvNktkyV6RofZWU3GfqFp9YGbPGwPFixlS4POgCIcqFIgey1oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SjAz2mF9Aq+jhoBblZrqEsgEqmbNqnjPubXiUxaV1QU=;
 b=k9lK04kcifpUZuO/Xu2KYVB6HtkPcAnC4GLHJ7Onk/xQ3/dQXcWYLch83MlVfE9FOIgK/z/oXo9sFrkioAyYHNBUyXRoM+uP9SzE/wGPMGyrZiWekW+j57BK3hZRz05pkgrpVN6FN+w4LXSbSkYu0NmtZZ5Ru1XpmvbzYJi1J1lwkgTZ/ZwwRBoeqEXLsR7Ugd9+3eCXbH0iUY23N0iCNQQdYZwIHNFnnvChV3rDrfQ0H0BxrdhnjyCdyV8D5q1QQacQcw2IKcguHVSMM+TRB+WI9Its+u5b97644uD23dittvQXOZrRXMwhNgajahG1Yo3Y1/ny0EkaqV9Wdm7ucw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by AS5PR04MB9875.eurprd04.prod.outlook.com (2603:10a6:20b:652::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Fri, 31 Oct
 2025 19:04:49 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 19:04:49 +0000
Date: Fri, 31 Oct 2025 15:04:39 -0400
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
Subject: Re: [PATCH 06/11] remoteproc: imx_dsp_rproc: Use
 start/stop/detect_mode ops from imx_rproc_dcfg
Message-ID: <aQUIR9YhTPxY0SpX@lizhi-Precision-Tower-5810>
References: <20251031-imx-dsp-2025-10-31-v1-0-282f66f55804@nxp.com>
 <20251031-imx-dsp-2025-10-31-v1-6-282f66f55804@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251031-imx-dsp-2025-10-31-v1-6-282f66f55804@nxp.com>
X-ClientProxiedBy: SJ0PR03CA0050.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::25) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|AS5PR04MB9875:EE_
X-MS-Office365-Filtering-Correlation-Id: 7abfeb61-47f8-42e9-7215-08de18b05d0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Uuy3zyCjPUEPHUKJTkWuLBKnBksp4lkhQ1B7NVNV3A5g8udWBN5e/W6+SV8f?=
 =?us-ascii?Q?/Y1x2HB3HphY0vSe+FHC7poKHMN2PVd5m7pKd6vyS9D/RdYoCDUs6/U7Nd6q?=
 =?us-ascii?Q?uNen4gkgUcmNg+vHQQXwfKbzHUku+nM1y2NZrz9R8fys9J9kbB/hC1VQp5Pq?=
 =?us-ascii?Q?Hu3By8xLmswYHUVxvGTJrDb9GgTOE90Xo6P9l6G9zt/OP8QxMkqNk9YB1NjZ?=
 =?us-ascii?Q?mXSaZIvQOXwp2rT8GLHNMtt//Y7v7vMf3l01D8Ur9e5BglKC7kEBgCR1E5I1?=
 =?us-ascii?Q?ruFivaaP7aeiCanIWmQ1uwkYOa0cPRw+NlCgCEPqu3sXc6aekJQRCgSRSkB2?=
 =?us-ascii?Q?M40fYHfHiCaC+vTrtjGEOQ/0qFK8IRr0lm+iuQQQ5kslvOJorB4sVUB4iHBj?=
 =?us-ascii?Q?PFaBP2lP1ilNJIah0ZhZFMpxh3EhMwcTTsI7kiyKcoN3E0gLjfx/O5xdU4eI?=
 =?us-ascii?Q?T93nocWg1MyBTMeY+ry2vpB56py4zVIOY3QTHbLJ2moJApCWShieglqcacrE?=
 =?us-ascii?Q?e38TjD4ZrNlTcHem1lJjjf9xUQWvIvXOPcwjF//uXTJmFfjLiI7lRCxTjlC/?=
 =?us-ascii?Q?3L6fqyx+girK6L4r9iqB5BqeIrWnxGQDkoJPeAg2AC799n3fdj5bLI0MdlZK?=
 =?us-ascii?Q?V+77Du29RclPMeCmce1/SptEb3nS/psoLwICl3UOEyQJXsclseM0F73EzV+/?=
 =?us-ascii?Q?kk/bUimEu7VALJPbj3IpxTx+zGbgE058uTyUBk/yj98KgLBFxmOaWSVddYqG?=
 =?us-ascii?Q?+BESg6Qoc/0MN5l5U/927DksHqJtm0ZrYzyxApbMsPkfWdF+2852sMRniq03?=
 =?us-ascii?Q?eWsUmbrWV+fFnuEbvARQuWbja1KkEAl0hdhlaWkzA89IA7WclMNMwnxqJh6X?=
 =?us-ascii?Q?ERaAyotmqPXtLvkdFfuQJM1EvLx/93PmnkkKnqDlP3H+x6Pj32wLnBgSK/pI?=
 =?us-ascii?Q?rXlFGciCYW5pk7R1IED13tTQk90/zOWIOP1p7kbmLH5r20DNsqssmkojMHRI?=
 =?us-ascii?Q?5jfDpkWSaOv0NohHEhRCwnHftCfe+s2reJq8U6v+TkrX7vpKbkeizQv56uN9?=
 =?us-ascii?Q?5aeto2+HRY8p+VxJYdfTIHcZQGI0nrtP6M2Z5qjQdbbk/Kp+xs6xrwZHSa/D?=
 =?us-ascii?Q?jUCopIUUG5HjIxRDAO1sJWfxBc3Ubi4abvLOtr9MBuu3/ka5gPSnkdyWR0K0?=
 =?us-ascii?Q?AL5N+hs9x+dKbgjFTQ9tQFem9zVCajNyB4qKcFuCl2zrN/NjvqMpBVMhxWU6?=
 =?us-ascii?Q?r2nsvKZxHtcZSbjk31AdQZy+JENL1ZlkOtT5Bi1m53G8zhgJX9PVuOTZXwGW?=
 =?us-ascii?Q?ea7GeTuGTi0klEc1GRnfh1og9kuggVwECMQQKpUGzg/oeN+fzU7Ca4JEzqJ3?=
 =?us-ascii?Q?vhkw3KKdY63xCAr0UoMUzvZqNjEbh8AoCHrmNomB9Rt13FkEGiZKHRY6599a?=
 =?us-ascii?Q?Jar7Sf3Vky651UOYPFp1vQB6AOZjDrDz+A9XF5m/ou7xL0cIooCa5O0HVNbr?=
 =?us-ascii?Q?ZQtFI1n2sPsO1N1syUbnVoGUy+re83mdUheA?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?r3qMp3tmaLhY3Rz6LeKDVj3g8N/x2nBf/pjts+memp5kjDMp0URjBsIFyZNn?=
 =?us-ascii?Q?Czqfd9a14NQnYuuCMnxoKblXbKtlfocPXC+I2sSi0YY5z3UD/+/rgXbpca+N?=
 =?us-ascii?Q?vC4hLxqg2ODYrgW/lB1XtOa/QCB0pXJ4dCvWjBLv1ljl+Q1tzoIu5I3cnr2E?=
 =?us-ascii?Q?duS6HOeu0x6PzMd8plrxA5TYh80NAS8LdC4zUDtOcwbSaJ9yLS3nMp/LCuyI?=
 =?us-ascii?Q?9ZENQ4OFxGIzW0+QYc4ScZzrn/p7zyugZQONTtUBOOpgoEECSdzSs0WXAYOQ?=
 =?us-ascii?Q?GEi8eER2HRlgA32/2D9+UQBxABWT/o1pd+0Z53oZS4g0+mpVoop5oNVq7cZL?=
 =?us-ascii?Q?zkPpb3TVLR911FyL1Zaz9fR7nGBFVmUPsTd4EM13VIh9DC78DHEQIVUOpNvT?=
 =?us-ascii?Q?pxK3HUILSBFnUvjnnenv7wPj5X7OVQ2qpqaDgCWB9VdbXQrKm2mKj2nSvWXb?=
 =?us-ascii?Q?Ndhee34rXENKiLiLIaY+xuQDDAanj9CYl1PfVpzU+vNXjNY/nWiU2Ov7LNYh?=
 =?us-ascii?Q?rrdVGSDroZ5mxaG0W96/CHrbAGKb0QuPe1EZFOKisgjKHOBgLrqGrJ/EUimh?=
 =?us-ascii?Q?k9AMME3PHR0xalBi/htCA8ooTAODNpWcvcwlIh+Mm6CyuoqLkFhK/qRMspYC?=
 =?us-ascii?Q?6DuymhQzr8/NfIEwBsM/GM5lXORovo/wEmzeMXr76cKWu8ueoLGAs3dFz9mi?=
 =?us-ascii?Q?j3fsJ8q6yJCinMTta+JIkEZhWUJhXYIlMVcLQIy3Rl7SwquFFiZRmNTq0HFW?=
 =?us-ascii?Q?Bz3dbkguXLJaj2SEBb8mqhwVR8K2McEMvx6fpnN+HiHUE4aW5LQFeU6w3lIW?=
 =?us-ascii?Q?nlnmYFAD+CXygmBqWHDQOf3RrGIrmdmB803k9TScqagznpFcx1+HRS2rIAhu?=
 =?us-ascii?Q?3fZ7qHfQjo83ZpIiWy16dBpgnxd0jpFwSxSK/6aVKH2bsjI5UzymGZNqC/UN?=
 =?us-ascii?Q?4HcRyLCOEilNr/pGaO/4Un46bRnXDngO7R2VNTGdQwbdKOStlfU2nzZ4VRyh?=
 =?us-ascii?Q?t++HTRImRL8ctE2qrr14nvPLYwXEmiLvLFgEfUID0JU5KNkVi5DnvmN/5Ygu?=
 =?us-ascii?Q?QrrpN/G7+0e9TFJrSajPQcFM6mL0imHxe1q5ZhtwPyOGb+kC7SXSh7skaNl8?=
 =?us-ascii?Q?n3xSPjiMC8QNCmTTu7GXTHkEsgpYLIbKcUYuVqmHdaMz1zLHGgR5SuLKZU+s?=
 =?us-ascii?Q?OaxRsXaaFjhsDC92Gjn4twcpFAATCck9psTgO9oqsfV2iEyDVqHZeNZ4lC7R?=
 =?us-ascii?Q?0EGU5S5i+mZah4Vdg4noAgTX1Oq3HsCveZGrZuprNzthvtgcJnRdxMP+Syd1?=
 =?us-ascii?Q?mhIcMBMUED0O2Toce3HsbIk6A1IY/GYj56ktVck8Ocn6qfD5cMQT695ek5f4?=
 =?us-ascii?Q?D6pSjiHs1N7H120+Cm4E4FSuXJldaluVTBUPTEXTGmemFf3f3eFNjFsWpjBk?=
 =?us-ascii?Q?dQMVCS42WNG6znvZVzL7MP7kcZP9nnHbYF8TBWN6XaME5wxwXXWTkGTUuzky?=
 =?us-ascii?Q?Jh8ZPlv6rPUEBHynvE+/GRS+KxP3Y2y6jTLP1VMp+vOiRZD/cnO4mtDvQ/Fb?=
 =?us-ascii?Q?wSRn9nvE3bptaWzFclmIOyu2BGRN8MvulctkIALj?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7abfeb61-47f8-42e9-7215-08de18b05d0f
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 19:04:49.0955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u/ha7ugNZtGrIVPFXXHzTPtOGlUMSJ8kEtuw5JZswwS8hro4mxTzYuWCYF/QeY3b7zSZTdV/LjhdRyJIXG1IFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9875

On Fri, Oct 31, 2025 at 05:08:35PM +0800, Peng Fan wrote:
> Allow each platform to provide its own implementation of start/stop/
> detect_mode operations, and prepare to eliminate the need for multiple
> switch-case statements.
>
> Improve code readability and maintainability by encapsulating
> platform-specific behavior.
>
> No functional changes.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_dsp_rproc.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index 1726aaa1eafb9ac1a913e3e2caea73801b86dc09..833b1bd4019614157f0bedf09bd348caab802eef 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -404,6 +404,11 @@ static int imx_dsp_rproc_start(struct rproc *rproc)
>  	struct device *dev = rproc->dev.parent;
>  	int ret;
>
> +	if (dcfg->ops && dcfg->ops->start) {
> +		ret = dcfg->ops->start(rproc);
> +		goto start_ret;

not sure if error message is important, maybe

		return dcfg->ops->start(rproc);

Frank
> +	}
> +
>  	switch (dcfg->method) {
>  	case IMX_RPROC_MMIO:
>  		ret = regmap_update_bits(priv->regmap,
> @@ -424,6 +429,7 @@ static int imx_dsp_rproc_start(struct rproc *rproc)
>  		return -EOPNOTSUPP;
>  	}
>
> +start_ret:
>  	if (ret)
>  		dev_err(dev, "Failed to enable remote core!\n");
>  	else if (priv->flags & WAIT_FW_READY)
> @@ -449,6 +455,11 @@ static int imx_dsp_rproc_stop(struct rproc *rproc)
>  		return 0;
>  	}
>
> +	if (dcfg->ops && dcfg->ops->stop) {
> +		ret = dcfg->ops->stop(rproc);
> +		goto stop_ret;
> +	}
> +
>  	switch (dcfg->method) {
>  	case IMX_RPROC_MMIO:
>  		ret = regmap_update_bits(priv->regmap, dcfg->src_reg, dcfg->src_mask,
> @@ -467,6 +478,7 @@ static int imx_dsp_rproc_stop(struct rproc *rproc)
>  		return -EOPNOTSUPP;
>  	}
>
> +stop_ret:
>  	if (ret)
>  		dev_err(dev, "Failed to stop remote core\n");
>  	else
> @@ -1085,10 +1097,14 @@ static int imx_dsp_attach_pm_domains(struct imx_dsp_rproc *priv)
>  static int imx_dsp_rproc_detect_mode(struct imx_dsp_rproc *priv)
>  {
>  	const struct imx_dsp_rproc_dcfg *dsp_dcfg = priv->dsp_dcfg;
> +	const struct imx_rproc_dcfg *dcfg = dsp_dcfg->dcfg;
>  	struct device *dev = priv->rproc->dev.parent;
>  	struct regmap *regmap;
>  	int ret = 0;
>
> +	if (dcfg->ops && dcfg->ops->detect_mode)
> +		return dcfg->ops->detect_mode(priv->rproc);
> +
>  	switch (dsp_dcfg->dcfg->method) {
>  	case IMX_RPROC_SCU_API:
>  		ret = imx_scu_get_handle(&priv->ipc_handle);
>
> --
> 2.37.1
>
