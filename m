Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013025.outbound.protection.outlook.com [40.107.159.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08ADD26E14C;
	Tue, 18 Feb 2025 15:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739894173; cv=fail; b=oNAk4wNX+gD3heC2aTHYPsCaf+dD9uBH0srVC2qnDeJMpL39ixHrwLTUm7665cizriy19hwdG885fopd1Wu8mLW8FRjHRk4SBxZ2OaKGPgVo/vQ5VmHRQhE2Rn/h7Pydz0j7RMJWuCgjkNe4VDvM5gnt/fLiiPKTrzMBJJUkA+M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739894173; c=relaxed/simple;
	bh=Qta5/N563H2NAhTBkiMA3CF9EQfrZhISDwWMAdlAdtI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hSguU+SucapNuPCjCLwHfmuD7pFEjyQlyMjjIPOxm6nqw3AKqTOHusMKgD+MjU6xq42NgBR4VXhKAhnHFASkFXzGA0tiBxtrWJ7kHkfXAVsDmjMADhdoMeWBHXe6yLalVhDP0ioYOoGecq1QNAsgOk9hoLEavk9K2za05LKmBnU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=iHUrPAZA; arc=fail smtp.client-ip=40.107.159.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="iHUrPAZA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S4TWKGL00LHWMXly3OYK9qOXjmM72cER1UDGMSvkjNilia3D3mSwAUPFwRlOKLPbWpF8L8raACceBDYQ9CMXoFvxhTHkIAeISePBWCnd/kpFqZDP5opWcpFIpO/pftrYaYy6kirdMsMgI3m+GDjCOLlirJL12AbgPcX/9ZtNCE8+MV/+gj5p9RYIxPz6y0qeVrfjH9XM09GofaYkGboyV2BI1erEDH/8xXnK1t6U+dgZSEw8mM0ifSUxvzwK3DgA7N9SQxRNxGmCS+wauhmNTmnAPgQ618dm1dKX245ndEt2svhV3XCpcwL0XnpTowR5RSGkNFckKM/d7SrkRPncFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vVp8mPZ+E4p9TC+jyhHuEjC168FdaKXvvoAhLqQw+qE=;
 b=n7uFpDCCQ7mAfQRI3Mp4tkm+0S1YaZ34tA/EG6ZxWmaCn59mF41b9+jfloDjamSUTRY8q9ovL5j9a2sxeHYRHZ0FNRPwhdVct/cbdRmjljHowkofeKtB7723lLVxWMJ3IdZLiseU50vQQuCIeZMmc/Frm5yHSIRIqJmfjJqyBFeNcMeY/HsASn3zVGRc1TUA98o4I9ISq4aF7Et7hq9TehdFG8818RL1KSl87km4HaoDAMk4MrdxgPX7H1UHRkw4NNT/ursvT4X6OQ1400D0l1o/bwSil7DmhS0JOD4op8kc6+1EcRo4TjMq22YRHM834gYQxTPOwhLyHHwUOrwR2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vVp8mPZ+E4p9TC+jyhHuEjC168FdaKXvvoAhLqQw+qE=;
 b=iHUrPAZA5rOwJ876s7av8kI4m3094/OgpqSE2HhC5/tRLBm4jhRTN86QY/fV9twg0Lo1htShY3zza1IZL7neiSWNNDu0K6DLmpGisB+qtSUzbTveg9ZH+bmUvQnarsoYi7SlxExCFPhT24v0sna+SPNHtdxn9/jZesFTXPKrWAB05vCIBy6mJZB1+AVlCAkm17woUHrUnsLayksR+1PII+r9doLGuc8yaO03CfLkOQO3UfsbKuF8gcluEi80UWpC0M/qSQA9BVHyoRtGDE/rxQq5FKms21uXA/2+fbOBjZcKcTzCm0r7GFjT9IecNw48WEN82pocnwXKAyd9WZJb8w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU0PR04MB9299.eurprd04.prod.outlook.com (2603:10a6:10:356::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.16; Tue, 18 Feb
 2025 15:56:07 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 15:56:07 +0000
Date: Tue, 18 Feb 2025 10:55:58 -0500
From: Frank Li <Frank.li@nxp.com>
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: p.zabel@pengutronix.de, shawnguo@kernel.org, mathieu.poirier@linaro.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, andersson@kernel.org,
	linux-remoteproc@vger.kernel.org, iuliana.prodan@nxp.com,
	laurentiu.mihalcea@nxp.com, shengjiu.wang@nxp.com, krzk@kernel.org
Subject: Re: [PATCH 2/5] reset: imx8mp-audiomix: Prepare the code for more
 reset bits
Message-ID: <Z7Stjh08+/RlUtek@lizhi-Precision-Tower-5810>
References: <20250218085712.66690-1-daniel.baluta@nxp.com>
 <20250218085712.66690-3-daniel.baluta@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218085712.66690-3-daniel.baluta@nxp.com>
X-ClientProxiedBy: BY5PR17CA0021.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::34) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU0PR04MB9299:EE_
X-MS-Office365-Filtering-Correlation-Id: f2da305d-3461-42d6-cbd6-08dd5034c167
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hniz4jwJ2xkR2b4Z6kP1ZUlopcKGrkkdCGKJ1MKWTyzK1ikWAete2UlDG60x?=
 =?us-ascii?Q?ON9+Xdn3NVKlOqPxLhLD50FeELeXVC5fZhUCQ21Xre+OE62UbHHPawSHYcX2?=
 =?us-ascii?Q?jNT3ywNY9CVO6SNsUNqp5vlbXvaakgAuvja9+NUlNV1z0d4v7shO1NaqhcUZ?=
 =?us-ascii?Q?FLDGq8qIW6RdxGLSjJ4z0wfEoAVET2L9fifC4myTgT/d5E9f1TlwYD5aGGxQ?=
 =?us-ascii?Q?EamzxyEH/bXdHgFLocCrAWIFNn/jgrK9Uh2uk+UvJNFsS83/D1wygYXMbMHt?=
 =?us-ascii?Q?be394TTvYW7AET6xplqsRfCBudPRyzeAFGdKuX1mJjVjOVqWLsHwwl8e2QYr?=
 =?us-ascii?Q?LXdDITUDcdtLEayOLsBzcs6KrPghpQzOkEe8GPfoX4E79AWVtJBB2MUvwJxS?=
 =?us-ascii?Q?PZ/4eIb4k/qIaBPh9Vm8lb3fUPZegAcSZKAnn9/5IGoi5tawLo6YThVfClXo?=
 =?us-ascii?Q?GDrSUAWYF0vKKKWnLqwh8871W+hUNtlrRbsh8Dywkr9XdvZu0pCmE6QvK7uM?=
 =?us-ascii?Q?Vh+hmEo2oV/IXHQa3hBBiH7qNCCSUeTgf8gDWuB5HC8VRVyWm4SkKcsRO3Be?=
 =?us-ascii?Q?kkyVaaowKxBbRxjB7RXFdpdV+AW85M7nS3TkJWuozjmzl8HHTBok8g1T26MD?=
 =?us-ascii?Q?uCFDoVpUl6z5ASlTrfAzabsr45lnlx/IVkbUNra2eTWH2DvnmjbsE3HJYw5b?=
 =?us-ascii?Q?/NVCsoBTVDI5CsrvgCVmo7lsRk7gDPNdmrFmpUWaXGXMG5oudLpXvxAcBRD0?=
 =?us-ascii?Q?qtyNKU4Np+ddpszRWyNHaPbEAWW2tuxwSbVPjtQOmv75MJniPcOiVLvcEtyE?=
 =?us-ascii?Q?DDBiL/IqHeAf/HcAKFLR41YOea5O57dQ90QLIsqFlb8Tip5Yhs+RPFEdAptJ?=
 =?us-ascii?Q?uJl+odop9xHpZuPAOCj2a6+LBoJ99WjHTg7xXrv2XPAGJgmYgls/E/YV63Wg?=
 =?us-ascii?Q?K301UgBPqWWYDkWlIWm58GmL/Ra3/gq5crdJgTek0L+UOi2MZ8H5zKsbNK5N?=
 =?us-ascii?Q?wag9Hx+uf32cLpvEHQn7IfG2l0dkn/DQuDeLTkg/OWTbnGc5hJCI/y3FqHFC?=
 =?us-ascii?Q?/Ur8GZTvckeAOViwzX2Nky6OH5ytHYf+9w4zI9EvwJyJPH+EmkuKlR2kjw4E?=
 =?us-ascii?Q?jzD3B9/0kdnrdFxmpinOtcV7wAOmORg0i6FZJijDNJn7awvs6fDFVii71Sq5?=
 =?us-ascii?Q?wl9FKHrRNT4lNlITz81zxSRBBWv2aVb8DCwSF/RVV3KJ4ktgfp7Q5c0YZ9sP?=
 =?us-ascii?Q?1itiRJgDuVYSySI+nkBmdH/GiNbAXA0IbvfWl72Wn9FPZA4Xas2GvpPM3Xxq?=
 =?us-ascii?Q?Nw+3w8tA6SKZlVHxW/31/5iXT2QyxeFM4tLSBLekePZIT45WJMK0jDGMXjqA?=
 =?us-ascii?Q?u4dUyOiCc9lhDe1GtR8mMt66f786FjoMNkBt7liobysJGnF2GDpLKkui4/5W?=
 =?us-ascii?Q?lF/AwPzGQQI19UWRPHG8f7xO2ptcFGon?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lp9ND+B7ZR4HWlLgPNzbHKP/8uUXR3F4w8ivYtK2FQ3vYxuI5Unql/BV7DhG?=
 =?us-ascii?Q?D36wWrR7ip9O7jDwzUDSpNhBuwS1AWp2EsKz3NjlQqE5I+DIGKTRYO2ubUXT?=
 =?us-ascii?Q?dsnx5OVFLuankUru/4Rns8dNpQ7uc6wP437sZ6LPD0dAbvsMA7FTHm2ZXRdI?=
 =?us-ascii?Q?H0ah6sagJ+iq/kKpIw5YPUl3+/FVExkc2CSaOScrTjCNRaws0UQP2+dI09hY?=
 =?us-ascii?Q?KyrQO33i0EqXxx/bS21BB1d/2fxnUpATDetq/z1TolgPndMX3QUP7oAaW5dH?=
 =?us-ascii?Q?bv8kJTGzJCvCeIPPFnUNrAu8elIbEVhqBwEzqbHZmkY9gzWeOFuQV6Y9+qwG?=
 =?us-ascii?Q?N9S8m/6x54804k+OlOCv05rrz6lIj5hhPKbYHa2DVwatUPV66Ilgp0/rAFQz?=
 =?us-ascii?Q?izGq6yPDvG5mvY8jM9QDPNz2yMCgWqAYYbY8IsmU2JZoaAVjFou9eIzHHsPo?=
 =?us-ascii?Q?H+aML6IccYo3iqxih2BXajTdGInSrm5xpZn8P4xsfQeqe6aB5OEtshq8G7i+?=
 =?us-ascii?Q?fGoGFPyaa6ATxr662AWqnmwPHm6RZE4Yad2FVmKteak8c+jBt3YC40elf9pG?=
 =?us-ascii?Q?xZ+ClOByvjnpy8OUBB5e/jCX/iWpkhAVMAfbBVWMjCQXi3UTAlm6BDijuKpM?=
 =?us-ascii?Q?FLen7tJPMaYPAekYDutG1h8i4PCBggUuR3JmLhxw0L+Z6vEUx6vBAQrJ0iFp?=
 =?us-ascii?Q?OcsDmwcVCSOyHZBi+HqfaYUWliT3ZtvgM5GYGLTVu1jQh20xUR+FMcVGHNgX?=
 =?us-ascii?Q?b3ZByN4i2oE0K3pbrfYPBC/ttn4v6Ta2EXntNSPYlXoBlL/YLvOioUH38rjI?=
 =?us-ascii?Q?zgmjK4yDuuGM32p2ABzSd7Iyn+LRrlNYMM8wAdUAIqjLMVGBbVMfYA9BmYYf?=
 =?us-ascii?Q?0WAnoifLZUSrFXiLMXpP1/7ZwWgMPX8Q4y6sFsKHSL/Uf3VZ9DnnbvJsCY5B?=
 =?us-ascii?Q?VPDMMygFXOgB5AfYVLlkFZYDS5lCX4RSrVAbW8STFw9Ayvp7NudlCLBDCCWK?=
 =?us-ascii?Q?/AOfUiVDBq6l1lGKcRyxqP4gPXpG5oXDQYmd2BEtSBeuZ9Moivpv26JFDE19?=
 =?us-ascii?Q?teWY09UOMiEYXngy2PTDiRwtoy6/Tjc0zvcG1nyVlH5csMQIK0Hg65ClGxVf?=
 =?us-ascii?Q?RfPVMYg8tl8PBk49LgMx2t/FOaUdf5cTSI0Nbnv9SpDf5rwgTUpFYztNDeC5?=
 =?us-ascii?Q?CJta4MRMAhVMZeayNxVi0+UY9R2O+SoEBlpme+C7GtVJMPi+hAmFgqv0lLx9?=
 =?us-ascii?Q?yhVRHJ3dKMKsK1/hjWpSMRhWe/wXicL/g6J/QlF4pASCuhoJQ8dp0i8TSSuK?=
 =?us-ascii?Q?fHk3opWmQ1gDNEF4uY5/U2Te3woW9AwvJe3+pkwWyYxgeO0vUB9mtSzDbaA2?=
 =?us-ascii?Q?uOMpxr3A4WgOTo6gdQxXcPSf+qs22+r895ydFqIWg5kHblNEisqJt4WOehEW?=
 =?us-ascii?Q?ZneIVdfc6jKikSfG7Q4F/6ADu84bCHNTuDRUrlBvRakl0bqlxjwRCG6pyIFz?=
 =?us-ascii?Q?TJSOtLQVHrtv+SpJswUaPaN1tl6BNTSu7oIs8zrqpQ80HaKK+1t7RU5uJLOC?=
 =?us-ascii?Q?MkNnr7aolpqW41YNu2E=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2da305d-3461-42d6-cbd6-08dd5034c167
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 15:56:07.1842
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1PNUNsnIf7Gb3vZBV4/aWbzXaWuzATcdk4xTBbK6sTrM0zawvXV8xU5um8sNAaGPitBcK0vi/jEzrb6d7YsENg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9299

On Tue, Feb 18, 2025 at 10:57:09AM +0200, Daniel Baluta wrote:
> Current code supports EARC PHY Software Reset and EARC 	Software
> Reset but it is not easily extensible to more reset bits.
>
> So, refactor the code in order to easily allow more reset bits
> in the future.

Nit: wrap at 75 chars

>
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>  drivers/reset/reset-imx8mp-audiomix.c | 53 ++++++++++++++++++++++-----
>  1 file changed, 43 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
> index 1fe21980a66c..6b1666c4e069 100644
> --- a/drivers/reset/reset-imx8mp-audiomix.c
> +++ b/drivers/reset/reset-imx8mp-audiomix.c
> @@ -12,7 +12,30 @@
>  #include <linux/reset-controller.h>
>
>  #define IMX8MP_AUDIOMIX_EARC_OFFSET		0x200
> -#define IMX8MP_AUDIOMIX_EARC_RESET_MASK		0x3
> +#define IMX8MP_AUDIOMIX_EARC_RESET_MASK		0x1
> +#define IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK	0x2
> +
> +#define IMX8MP_AUDIOMIX_EARC		0
> +#define IMX8MP_AUDIOMIX_EARC_PHY	1


Does dt binding need such macro?

If not, you can use enum.
If yes, create binding header file for it.

Frank
> +
> +#define IMX8MP_AUDIOMIX_RESET_NUM	2
> +
> +struct imx8mp_reset_map {
> +	unsigned int offset;
> +	unsigned int mask;
> +};
> +
> +static const struct imx8mp_reset_map reset_map[IMX8MP_AUDIOMIX_RESET_NUM] = {
> +	[IMX8MP_AUDIOMIX_EARC] = {
> +		.offset	= IMX8MP_AUDIOMIX_EARC_OFFSET,
> +		.mask	= IMX8MP_AUDIOMIX_EARC_RESET_MASK,
> +	},
> +	[IMX8MP_AUDIOMIX_EARC_PHY] = {
> +		.offset	= IMX8MP_AUDIOMIX_EARC_OFFSET,
> +		.mask	= IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK,
> +	},
> +
> +};
>
>  struct imx8mp_audiomix_reset {
>  	struct reset_controller_dev rcdev;
> @@ -30,13 +53,18 @@ static int imx8mp_audiomix_reset_assert(struct reset_controller_dev *rcdev,
>  {
>  	struct imx8mp_audiomix_reset *priv = to_imx8mp_audiomix_reset(rcdev);
>  	void __iomem *reg_addr = priv->base;
> -	unsigned int mask, reg;
> +	unsigned int mask, offset, reg;
>  	unsigned long flags;
>
> -	mask = BIT(id);
> +	if (id >=  IMX8MP_AUDIOMIX_RESET_NUM)
> +		return -EINVAL;
> +
> +	mask = reset_map[id].mask;
> +	offset = reset_map[id].offset;
> +
>  	spin_lock_irqsave(&priv->lock, flags);
> -	reg = readl(reg_addr + IMX8MP_AUDIOMIX_EARC_OFFSET);
> -	writel(reg & ~mask, reg_addr + IMX8MP_AUDIOMIX_EARC_OFFSET);
> +	reg = readl(reg_addr + offset);
> +	writel(reg & ~mask, reg_addr + offset);
>  	spin_unlock_irqrestore(&priv->lock, flags);
>
>  	return 0;
> @@ -47,13 +75,18 @@ static int imx8mp_audiomix_reset_deassert(struct reset_controller_dev *rcdev,
>  {
>  	struct imx8mp_audiomix_reset *priv = to_imx8mp_audiomix_reset(rcdev);
>  	void __iomem *reg_addr = priv->base;
> -	unsigned int mask, reg;
> +	unsigned int mask, offset, reg;
>  	unsigned long flags;
>
> -	mask = BIT(id);
> +	if (id >=  IMX8MP_AUDIOMIX_RESET_NUM)
> +		return -EINVAL;
> +
> +	mask = reset_map[id].mask;
> +	offset = reset_map[id].offset;
> +
>  	spin_lock_irqsave(&priv->lock, flags);
> -	reg = readl(reg_addr + IMX8MP_AUDIOMIX_EARC_OFFSET);
> -	writel(reg | mask, reg_addr + IMX8MP_AUDIOMIX_EARC_OFFSET);
> +	reg = readl(reg_addr + offset);
> +	writel(reg | mask, reg_addr + offset);
>  	spin_unlock_irqrestore(&priv->lock, flags);
>
>  	return 0;
> @@ -78,7 +111,7 @@ static int imx8mp_audiomix_reset_probe(struct auxiliary_device *adev,
>  	spin_lock_init(&priv->lock);
>
>  	priv->rcdev.owner     = THIS_MODULE;
> -	priv->rcdev.nr_resets = fls(IMX8MP_AUDIOMIX_EARC_RESET_MASK);
> +	priv->rcdev.nr_resets = IMX8MP_AUDIOMIX_RESET_NUM;
>  	priv->rcdev.ops       = &imx8mp_audiomix_reset_ops;
>  	priv->rcdev.of_node   = dev->parent->of_node;
>  	priv->rcdev.dev	      = dev;
> --
> 2.25.1
>
