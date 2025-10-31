Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013000.outbound.protection.outlook.com [40.107.159.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A8D199931;
	Fri, 31 Oct 2025 18:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761936415; cv=fail; b=eCpjkI8pGiZKf3MPIBkSdsZktSeUma9bLqGVSSmS+7ktQFKydtPQRekWQ6YS/uK08eTdVUP+MTdtOFPkF0f+QQtwmr0R2Ka6P2SRZO6xqlXGaruOWbQutJ2RXSw1YVE3e4jWbCEXEguh4nd0PyloxaaS+jTGyMQ0CQzi7FJWNb8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761936415; c=relaxed/simple;
	bh=AB+pI+Ue8WWicGNR/GEeHhzi16LaBVPt+tKaTbHEccQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UsjA3oIBHaFnKu1nAbv2I1AHo//gckORBK0yFppKn1OjjuGwRgR8OVeYd1PUoH4YpExu51ESzBJsdg6dTvnE8j17YMhPW2/F66PyYt589y+8TZgNfqYD0v+orJE8RBqyNZXHx6OcpZQQp+kL2TY4Jm1rEoey+hqTdyNoIZMg330=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bllIIOn+; arc=fail smtp.client-ip=40.107.159.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bllIIOn+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EWTGEYWmvvU7cOuqv++mM57nwRlN6vcejhkHpX1X4ByWcmuxBSKN20ffuJSpvZNB2uldGsOJ57cpYt84eM+utGCm6qqKdr5YSb/yAUUUH1KJtsGui2Iw9fCUwmL8CN+3a8KtQrmhm9/C0FlZ/svHvoDBATa7mIasHQIyHeEtCk8zbKMGC6gudvw8b0CT8Ca9DdvqUiIIIGQCALrsN1w9TtcR+BOUjajyXhUaSyV8KbVgN+D5Ny6Un4HS1bW//yQMjlzBZeF5kLgWYLXaLwPhEYfVE+Jj8nYcUJ+KX0DKsjCpr6xgyriL3GxCYbJVOq+/7hqcPugf0QT3gACKfl71Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d591bNYCX7b2nhy3UJJWAhGiqZnyKtejZIKrekNF1jk=;
 b=F4Xtj4aOZbe6h8WgJ3NGVrRNjZijkboMlAsSorj7O6YTFKNoF7YvgSZAs+o8jwlqPd1VeOlxsCO4FbDTpcRi1S1gPAOxp9qS46SiUTsLOjAy48U3d+3MTIgf19p2PAE9w37/W2KPL5e9HoQFdA0Ni7/9IYK8qJFQG/6W++ETNd4sp/VPf0YCLPiF0XJPMXfayKaS4pQ5zmNMgxIV7QUcBnabEkujMieF/JnpubYnaIkh1DuFZ/PevUqaLaIC91ZAzd4KTlvQ9Cns7ZT5TEOYACagvPCdI6jq46Y3UI3jLgEyONlrBZAwYQEsBcXmvTPYIbXWw/aeWzTcrK0cOkvGeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d591bNYCX7b2nhy3UJJWAhGiqZnyKtejZIKrekNF1jk=;
 b=bllIIOn+2d6RdPY5Wjx/o1dFIxHpObQOTDeRz2n/NYeie8rr2bm6Uox7mFgg7hnOKqquwTpJhtimeDWgmIUWMzh9T4CuzseXz46D1xhojiEDt+hA7uXwiw/qSBE1e5IRUihnKinPhE4Se/8+DLbxR7/Nu/6A0YZ46njKT7KpHy9KK/Zc941OBeMKz0+Fp7Bc8waPV4BhffyzhpzQv6rUrJpPAOcMMqsS20z69LAOPuBoIiBP9W+CoSp0aO43YYLxRpNDKNALmDyo/KYSlJYaqHOvQ1VasHas1i63uNT1HvvODq81djbEa+pb2chCxdDHU/1ft/RTwmXjPz8S7PD9lw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by GV1PR04MB9216.eurprd04.prod.outlook.com (2603:10a6:150:2b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Fri, 31 Oct
 2025 18:46:47 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 18:46:47 +0000
Date: Fri, 31 Oct 2025 14:46:38 -0400
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
Subject: Re: [PATCH 01/11] remoteproc: imx_dsp_rproc: simplify power domain
 attach and error handling
Message-ID: <aQUEDjSIw2ZN0MII@lizhi-Precision-Tower-5810>
References: <20251031-imx-dsp-2025-10-31-v1-0-282f66f55804@nxp.com>
 <20251031-imx-dsp-2025-10-31-v1-1-282f66f55804@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251031-imx-dsp-2025-10-31-v1-1-282f66f55804@nxp.com>
X-ClientProxiedBy: SJ0PR03CA0137.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::22) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|GV1PR04MB9216:EE_
X-MS-Office365-Filtering-Correlation-Id: fa26a04e-d5ef-4ebc-55f2-08de18add831
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|52116014|376014|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4GU+TQvpMs9w8ghHvhhti/t2Dg7jLYkz3ZBU6xGUxrrzpeQS85bGeg5Oemfg?=
 =?us-ascii?Q?VSEgOZeSd92JpPeIL1RO1IbCcfWuGF10o+nS7RXwLH5GCbUV8L7d0iK2oQcW?=
 =?us-ascii?Q?CEKdVr6Otm57hnb/TS6xvGWDz9iWM3iwo2VIXB0cImiVVh4VnNsa1gUI+Pt7?=
 =?us-ascii?Q?JvK9d6CP8XreRpV2VKf3g6sO1xoo6xix3GohraHnQUgKkC6O6hV72PL3H+ee?=
 =?us-ascii?Q?75q+tg9ITuOiOCbt1fJpLzOkdK2o/ZBn/KnA5LBe0kE9yST7v1bEl8fu7Y7v?=
 =?us-ascii?Q?UY+WN+2Hj7XC5yWBf6JohDXmCmIhwk6YbK5rKaU8DTT5r6+8AYF6QNcclMeR?=
 =?us-ascii?Q?ArUzGuQjJpOSjKKLBN4Nd3ugg2zmYelrNdNyEDXKMCoBvUjEGoAHXUt1xeDB?=
 =?us-ascii?Q?3/SKyVpnKU/xyomKaTlsphWrrk+wAmVLxGBy/ThBn8GjfG4tD6fNai6FJWkO?=
 =?us-ascii?Q?+Jg/78fo+8cf6ZJPILRUspXS/zDiZIxlKdiZVG88/gpyNR95tnlbWq0/yUD5?=
 =?us-ascii?Q?EFdGRdfuWIf0W9Es2AlTe3ZvYCT9eP3NOtvGZl+UswXbb5ofWQGtBAqdPSkn?=
 =?us-ascii?Q?hTUCwMFh9TUDdfx+6ECCJswu2i8GMfoiRy0fgCqmBQbXfShhe9jv2txLdqho?=
 =?us-ascii?Q?vW/njvVvLCJ+BVncpYHxjYmw3YvwD+o2rB38nnjVoMJy3ol2ytVeNmLrECYG?=
 =?us-ascii?Q?YFxpvIJcsCBST0g/AiIDo/1osMmgaz4L0ypMoBkTtdIxY1JbAg8xUAztqcjx?=
 =?us-ascii?Q?B+FdOICYXdIeAXqNYiIQ5sYKElcpYr25qvN23XxZMKdCBlgfIrvDJvdtVPDw?=
 =?us-ascii?Q?eJFHQTKNgl+gKrIiin6hrqEEQMdw2fsISqM8ws5bFXfIiwDbXAwvx49r1fYe?=
 =?us-ascii?Q?KakEe5irjRsiWvV6yDHE/OJ2GTL0GkjQaB8ct/ydiiOKTAy9v1rdsq8AJSZe?=
 =?us-ascii?Q?HyhhSZX3hyfBoca4Y74oX5+ZYfvcC2bTaGkOWxhznI41PrfBhqxHXezfdNH4?=
 =?us-ascii?Q?SVXNvH283f2mM825sVwVrM44/SoiNfaAjtJPEptK53p1M4CBNgYLrt21Ie3a?=
 =?us-ascii?Q?FlandsLVJRoqK5P3+SZOOGErPB/sKfIpJUT4e6pz9MiWyPpo/W4vCQausrKy?=
 =?us-ascii?Q?PKIVLVv1nouxxfWQcbw0zYIYSbEKk8ePRHCkKM8zvmlshjIq4TSB4cuadVWb?=
 =?us-ascii?Q?ZlVmI64s4F2dUDfwyJW8Pt0m3gPiRWZmHv3KtkudwgrqNbZwAEbr2iWNc+pU?=
 =?us-ascii?Q?Ch6sxRLCfrdgWyP0aw2md+aDbOyAAuD+Bjp42ygWguD+00dELbl9E6g1iCoc?=
 =?us-ascii?Q?OWVJoaBOnfMIWIRo1A+BBHSokj7aDFEldwz1W09l1tDxqxQrM4/HWSLRI5RK?=
 =?us-ascii?Q?PtKhJV8phC8m0GYUeogoM/7s51nkkvUZ6TRUNptmrcENk2Nkomdxq86EEpo+?=
 =?us-ascii?Q?wZQ/BSGr1etw/oaSepyvTPifF9jpdh3Kd9zE5eXVgLRLv85yYNC38sZItpCn?=
 =?us-ascii?Q?GTI3lbDSR26P4+gBac56cMMfAETmJQ5BmNgd?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(376014)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Kg+9irsm4v1s6AHvMch3FgQMkgjems9nLTuXO7K5p5Us/nCXLem2D+osSg6g?=
 =?us-ascii?Q?x/5yJPiPFAxeBjugAPVgH8MmhBWTMwXivCmA4VQHakB0gzZDWpU+9PrXM6/1?=
 =?us-ascii?Q?G14dXOgtMkRofopXFxxldHT5VF3mBz3y00l0bu4swE8nzJR13waj/Qnw0aSt?=
 =?us-ascii?Q?9AHO813sypUzEpl0XdIS1OVs74NGMc+q//h1h7XoPHQ0uACli/uSu6oWkjCT?=
 =?us-ascii?Q?5NDNrZN2wzDBVH8vHSGOMHGK+voJCa8JVDjQIVCKTwWOD7yKjr7cBwUOddv9?=
 =?us-ascii?Q?pwKN6ZhfnYZg3kFH93AmzPtNvJ0kexHUgFsd4U2/GZLighqKdE18FlKGFj2K?=
 =?us-ascii?Q?3o+HemfD3wsRcnG7BnawpINLuRj8NqNxPhDXI6dVzLzFqt09NaOUPrOjLWey?=
 =?us-ascii?Q?CArBSDj7tQPyLLkIjZxmhWKDZHh9NRVtRgFIrqVCnyn+91CGEcLq13iR+Pye?=
 =?us-ascii?Q?DaJlA+KphHfrMWtof13zE7UinoWFhMUIfG/EnCpHbWXigzIv3Z0apxH09VIr?=
 =?us-ascii?Q?t8cembI/ZHkA9VS4XOcTvPaeBDKh+dHtqXjmLelYXnV8Vjf9AThgNZS274q5?=
 =?us-ascii?Q?TXy3YBVI8XsbPkO+f2H/Ru0e7DMT5iFiHuNpYQ2ru8ODI62Yi3bNEcnURjq6?=
 =?us-ascii?Q?XHu0n+yPXhVf6L5Rcb+xsyknDgxN1Xj7HC3gDbN63X3E5mjnEYDBUaNN4fw7?=
 =?us-ascii?Q?ryes6i0dcDQ+Qr6DQT60G2iWAEoOFHMN+uTX7+HYrzRMaJJQ58VHE5haPm7a?=
 =?us-ascii?Q?g7BmNWlZVaAW8llp0jf5mrwJQ7US2oxHLEEbTvAv3fg/IJCIkyY7/Dzybliv?=
 =?us-ascii?Q?NnDlZsa1GgRnyj5oUMm+WoS4xJLMwOkkFGhYZDnayUJ1aqoVQMBiR1RCGrww?=
 =?us-ascii?Q?yu4Wp/Bfbsg1WwYen6XkuYBdSaodkInDDGgYpvzHnL6a1UfhYxv4COoCt5Nl?=
 =?us-ascii?Q?VWR+sp0U0CaT2G0YbUf4xbNwbDw26syITW7nZ4LkLK+/4wv/yRuVWL+Z7wpy?=
 =?us-ascii?Q?/gqv40xjGVTVIww5yjqFbbDM3kgvLwRnjcg+WaIBTZQzxTDT64sUFZ1SlU3H?=
 =?us-ascii?Q?gGi+2I+yt5N8IykGX5sUAnUGNvOk8En7PyJ4khQRXNAm05jDSdEFbgS2ogsD?=
 =?us-ascii?Q?5iLt3qckM2ZbLjrmDPMnH1MbFmrhjdkOAwTvK7c+3BFqqWKYqLpeYJyd4vSX?=
 =?us-ascii?Q?UusnPI84zx5M4hGuNwanFLEXHvL0WTuk/MYbXWrQW9gfnoFqc+WI26o+oNc2?=
 =?us-ascii?Q?yOu1xvROEax5fY5zVmJm2iA0Oilr4dCr8o7zAgyXQ+CjLEsBWF4Hitaf2iQy?=
 =?us-ascii?Q?njhULmWPffWRVCMIlrFqTkDi3TecVGE04SvMRAxNKrj2frtAe7zprAeryvkC?=
 =?us-ascii?Q?H8d7ih5W/TDgGX7O0dA3iTPPWcRgIOO4+nwfKGR0SYcddrbT/MY2DIbGwOHA?=
 =?us-ascii?Q?+5lIcBxbHK+E6LajAwSNRPz2wu7hR9sve9DyOUpUV3IwhqbY0DKVtgORMU+g?=
 =?us-ascii?Q?hjGIvAXlNpi8hy+zgvXpJ1E50GVl34DakAhDFYO16tIbNA6/mfaZcJAubUyy?=
 =?us-ascii?Q?fTWWktiQlPTy9WA3nwNdj8/E6sKtRWy/RkvzBQfc?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa26a04e-d5ef-4ebc-55f2-08de18add831
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 18:46:47.2437
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ha/IXdqGW6dnqiHYeqSrdKnN0xktJ4QZYVVx96YNrwpJsL0/P1bCAT8BEkDMnpgRdWAGFs3XdN1a2iUXh4o3fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9216

On Fri, Oct 31, 2025 at 05:08:30PM +0800, Peng Fan wrote:
> Refactor imx_dsp_attach_pm_domains() to use devm_pm_domain_attach_list()
> directly, removing manual detach logic and simplifying resource management.
>
> Also replace verbose error handling in imx_dsp_rproc_probe() with
> dev_err_probe() for cleaner and more consistent error reporting.
>
> No functional changes.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/remoteproc/imx_dsp_rproc.c | 29 ++++++++---------------------
>  1 file changed, 8 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index 6e78a01755c7bdc28cd93f00fe6f74affc3d96b0..c466363debbebe8f91b908b3bffaa32e9bf8b9a6 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -1062,14 +1062,12 @@ static const struct rproc_ops imx_dsp_rproc_ops = {
>  static int imx_dsp_attach_pm_domains(struct imx_dsp_rproc *priv)
>  {
>  	struct device *dev = priv->rproc->dev.parent;
> -	int ret;
>
>  	/* A single PM domain is already attached. */
>  	if (dev->pm_domain)
>  		return 0;
>
> -	ret = dev_pm_domain_attach_list(dev, NULL, &priv->pd_list);
> -	return ret < 0 ? ret : 0;
> +	return devm_pm_domain_attach_list(dev, NULL, &priv->pd_list);
>  }
>
>  /**
> @@ -1186,35 +1184,25 @@ static int imx_dsp_rproc_probe(struct platform_device *pdev)
>
>  	/* There are multiple power domains required by DSP on some platform */
>  	ret = imx_dsp_attach_pm_domains(priv);
> -	if (ret) {
> -		dev_err(dev, "failed on imx_dsp_attach_pm_domains\n");
> -		return ret;
> -	}
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "failed on imx_dsp_attach_pm_domains\n");
> +
>  	/* Get clocks */
>  	ret = imx_dsp_rproc_clk_get(priv);
> -	if (ret) {
> -		dev_err(dev, "failed on imx_dsp_rproc_clk_get\n");
> -		goto err_detach_domains;
> -	}
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed on imx_dsp_rproc_clk_get\n");
>
>  	init_completion(&priv->pm_comp);
>  	rproc->auto_boot = false;
>  	ret = rproc_add(rproc);
> -	if (ret) {
> -		dev_err(dev, "rproc_add failed\n");
> -		goto err_detach_domains;
> -	}
> +	if (ret)
> +		return dev_err_probe(dev, ret, "rproc_add failed\n");
>
>  	rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_XTENSA);
>
>  	pm_runtime_enable(dev);
>
>  	return 0;
> -
> -err_detach_domains:
> -	dev_pm_domain_detach_list(priv->pd_list);
> -
> -	return ret;
>  }
>
>  static void imx_dsp_rproc_remove(struct platform_device *pdev)
> @@ -1224,7 +1212,6 @@ static void imx_dsp_rproc_remove(struct platform_device *pdev)
>
>  	pm_runtime_disable(&pdev->dev);
>  	rproc_del(rproc);
> -	dev_pm_domain_detach_list(priv->pd_list);
>  }
>
>  /* pm runtime functions */
>
> --
> 2.37.1
>
