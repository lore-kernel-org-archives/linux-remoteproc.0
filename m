Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010050.outbound.protection.outlook.com [52.101.69.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED88226B0AE;
	Wed, 15 Oct 2025 14:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760538563; cv=fail; b=MvGismh+p/6B2BkaQIUW7s4XjftXF09x/bZeLHYQ/WyQclY2/L9hg2l3S7T6N9iTclC3xfbCQEV//dOGFzkPjKsLozl8hE7jQOFCzXVaoekUONiHdB+rgxHaEHYMP4R1avyCkBzntuF4iyp67/2Y/xD53LXhXEKEAJS2KCyPxCI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760538563; c=relaxed/simple;
	bh=suodhhftYa9cj0/v3tpHh3qaDiiPCgZgOPO6osHOiEo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fyfp3QTkaogM+GGDP1DyM/1F5WT625HB3a7lQaPAEThnofeKLqzrEfSkxyTrXVeTnsjV5NbXzIFUy/1+eiADimSO0GTLxy2VBWx7ue7fXY+CQLlduszplqXlle9c2ww9ZVjsaJ8HBuICqEGcwzwju1i+yAQUUR6uUN2ouwPKS/A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ddYTooCl; arc=fail smtp.client-ip=52.101.69.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ddYTooCl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GBhQvp6iAS11csffU7rCg4FYOmzEJOff2sutJn9saUCgURorrGM2WCNPslU+tgo8X7rfLdHkTd2qX2R814RwXld1pA3C4aQeysbbD/FZNJIvPUtGd1JBXcNXTAfU8QbIkhcSR7c0ci/XBSTtwCD5BOerEBhIZlSsjBUXPPrIUCYpC5zpYjjuHcyL9tWo572nSx0/9/Z1dedFQMw3Qgw7mpHjRdZN/kEMHpDSIWooPHUGUmRh/VBqLOP4tYajzXtJ3e1nqY1SKaYO3OrorkqI3DOoLr/28NSi0BroVTa0ULpj3RorEI5M5GUwaEyJRnIEaZdTz7k7eiEHuqIX2rJJtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rBX85pcrmWSf7IliCyruC0L01OYBr/nl5JzKfnFYqSE=;
 b=k4mKqigEc5wHO+p6ICpaGABh59zQB4eHVGP9EIhqes+R34DBQvZMawW9GZPIIGo/ocWhhfJNfl9CqjuVuqiiVkQ1+uRFl61rg6YyWUtBxPhmvKkvT+cSGHgkvEoI2sWXXqlGu5B9sp1IxP7XrhIJo+4rE/lMPj9iO8Ga+JNR7sdhxmUlyUlv8aeZwtymu4RM7wVdj6HLzxzHw/UFY1rtmfCEBdR0X9tSZRcLqt1t9RLKHUWbla4DobBRjZmvZ6kovnNpZAu7AidegZ004+aOPvJN2fEArhMetWV7faSdW6fsDbFFaP/yjwgETq000mGNTjqvOPUY87IA80JuF8CCtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rBX85pcrmWSf7IliCyruC0L01OYBr/nl5JzKfnFYqSE=;
 b=ddYTooClrLoWdh+lX33QU9fOG1/lZjXS0wRNWxJ0MYNHd2pTuo9xq6vHN8DGWdDz+zz2M1OeAqRwgeWeu2/wCFzDp5JZl5oaLYM0y7J62BKB4lL2WJv8W8zW3d6TaNfse8+e3YBxttdqu7TVMhFJEaD5yXHIzKEkwGyhx7T+OcHeu4v0AEaPXX1DPZyvfwciUXe9tNZkxsUaBVaJmO3VlU3aNMgWfp1Cgj6mk3sxoZawx62SZZONIY0uRpWDEDMsPZNSS+ri61onkohNsfxFuQmq+pKTUI0bArDhU7EardTOxa/cZmIdSWOigg2x6KaO1yzwuTLWq6IoU4MeJURMSA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by OSKPR04MB11416.eurprd04.prod.outlook.com (2603:10a6:e10:9b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Wed, 15 Oct
 2025 14:29:16 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9228.010; Wed, 15 Oct 2025
 14:29:09 +0000
Date: Wed, 15 Oct 2025 10:28:59 -0400
From: Frank Li <Frank.li@nxp.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/5] remoteproc: imx_rproc: Enable PM runtime support
 unconditionally
Message-ID: <aO+vqzxE90vHWrjW@lizhi-Precision-Tower-5810>
References: <20251015-imx-rproc-c3_1-v3-0-b4baa247358d@nxp.com>
 <20251015-imx-rproc-c3_1-v3-3-b4baa247358d@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015-imx-rproc-c3_1-v3-3-b4baa247358d@nxp.com>
X-ClientProxiedBy: SJ0PR05CA0066.namprd05.prod.outlook.com
 (2603:10b6:a03:332::11) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|OSKPR04MB11416:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b42786f-7ef4-445f-d8d5-08de0bf733db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|1800799024|7416014|19092799006|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qzTLjVcBQj47/3ixYQayXQgyCljVpL67YleogE2bA2kpPiSimud0ytiuhLdl?=
 =?us-ascii?Q?vje/HTZ6BtKy+VLTFzAJkTedWvBurHsxzFbCXXWKKDitnL92XUvdxzs6tGgI?=
 =?us-ascii?Q?ZwbTYgzryHGarr4yHFvwvbHkwOWUfx2yuQHrdnYHTls4tb0vfO4f+pEwWXai?=
 =?us-ascii?Q?0Z85rSyFXP9RcapJ9+ujnVx0qy8fKxsK9AtjTnIVZgyYl4zR2IvVjJlJPAlG?=
 =?us-ascii?Q?oGgp3F5GWdOBXO3hRJCxdUkUO2DSESZ3wS1PxAEESaXln7Mx88MaCj9ZTOnm?=
 =?us-ascii?Q?IpdTKI7KRo2b5/TTSC5gd30wmaQ2KHRVJ/23GtyxdnRJAj7xvfseYkfbk592?=
 =?us-ascii?Q?APusZpiRmb5tGAK1GzjCfT6JDeyWei6oG3OzYn0SrsT1RQrD0J5R4HoTfWmW?=
 =?us-ascii?Q?Kwg+1yp3wqAQHks5Hk2RfPjZ1OJkMeicV8/BLn9yjIBhRtS/rZez6D7QOOhv?=
 =?us-ascii?Q?dwSeL5IyNwdmBD8+WPAao1obtyjvx6iR6PGk+e0e65Xt2wpUI8u8Q26/k4g+?=
 =?us-ascii?Q?9QAPrP0/IyociyImFWbEDJJ/VqwtCcIF+qlk4gUMOyYF8w3WClx2TsAkB9BS?=
 =?us-ascii?Q?DE/G8NV7WgpJRv2ADTfg1QjVpEXnu5886W3GQvCenCDCt15Gm8/xQZTVo8XM?=
 =?us-ascii?Q?8KhskRgkhT3Z4f9HFCHdg1uOei8mrwqgw7w0KQFe3NH86Nnt/LrJ6OIgM3+E?=
 =?us-ascii?Q?BzW07ejbV5emRbWk6eSpa1+2GhvTqQxwNHCGfcKMIGcfDYds4aBDs7iNWXIa?=
 =?us-ascii?Q?RNrYwEb5deydAvjW3QPw8stoEaRfiuQEFMajkI84ebio7+YZOAbmtJ3zAb0T?=
 =?us-ascii?Q?5K1J9UHtaIZE/0EJEOJKqjsnX2CPvBhyo6GjzCMDpFqk0wQo2OhLoEXYEu/q?=
 =?us-ascii?Q?3+4w65y+EfXrYRg0IfqTmEZy1Kxr6cmZgLXmCHpjHIJm12nSw1FAmA6o4+jh?=
 =?us-ascii?Q?NcrVZcMMh7saVesqAqJPhJWsxuIp28s1JQqb9/RpSrom66XP0znEfELnpOC/?=
 =?us-ascii?Q?4xK4DY7487q4qKdH7yzEhshcDGm+InPPLImc6u9438X6sBYqlrvBYrYUoq2p?=
 =?us-ascii?Q?8QnYmSnEAzifYqo1qS4VMU7Jo/ldJt6ye7uRpv4e40ilA49g+musqcGI88VD?=
 =?us-ascii?Q?zCDvt2d6TkAX46RYnxci15EE4WHOVIW2jiwArapiyEttnNXo8+FdA2zUrEMo?=
 =?us-ascii?Q?B23fYiW51C7CnmNtCN3YBTJ696Unrv6FzCgcB8nqf7VDAhewM49KVX9hNbtQ?=
 =?us-ascii?Q?eOAAy3OId8ws7PXOxLoXspSK7BghL41WYs84ky91sqUm9FZb7tTKhW2nu0wD?=
 =?us-ascii?Q?L/Rb6Qtn0CPUUp5ysB79yADH32khtBEsXew+dC6eJQXUy2R+QstKfKZvzK44?=
 =?us-ascii?Q?77pc/9ecFV1qxUhU0378rfLuHiX7U76SzMP+sl38uViJIH6PgVBQ7ohww+U6?=
 =?us-ascii?Q?Am4ODe8g01/WnTgBlmn8B+Nayt1FHAAqGJ1zWTHKrhONgnF5IfRJyeSIAMTi?=
 =?us-ascii?Q?zXl/AH08RzORD5Sg3KcGNaO4sCuYqRT9sPFD?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(7416014)(19092799006)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?03rLI2v6xQZx8JRWwHV59CqJde/o6c5DHyEizrorC/TRbMgnrwbsSgJMDFpF?=
 =?us-ascii?Q?fO1fiBaE8pgDiswyqLSF+rP01iYvEVZMwEsBRSsCZOwGO3YaN5IN0lrkgfW1?=
 =?us-ascii?Q?wq8YLnEkFXl2Xv92eO6QvlDuGHIndu7TvEpdVGnv1H2V5hLM1tGxnAJYsgFD?=
 =?us-ascii?Q?/AP/oHH/YvGaevMVxi6M8lU4/MBsS5IVnKwu8HJ4lFgOqwyzbZNARzNxDVT4?=
 =?us-ascii?Q?usFY5N+6qYdJFgEbudSZS0JOTuUIC7b7cYcdSTDIJTseVPiKo2dNuVWHIDSa?=
 =?us-ascii?Q?D6hZrOYEd29du5z3c7R8FF7aN6Zn6E9FnjAjWbIK4IQYIIF4W4NzkHaEoDSq?=
 =?us-ascii?Q?Rha7sDE17yvTkhVqkNZaGL9e9lN1o+eKQCYgGaWT8mwBcG9AUka+E8v3LBxQ?=
 =?us-ascii?Q?aq3fQoHa2AdDp4OxF8dS7RMw3gUZDxKm+UjMQgeFzkIO1nFP3kWYNgtd3SDX?=
 =?us-ascii?Q?aMyFo0Pyctm5s/eSDF/NtZpEw9xlghEbkGELpG1M6KYGyA0J/xgRmxq86f+k?=
 =?us-ascii?Q?ngMcZlDhVzi1k92znAeF9zdujngsL4b23OgDgJD78BnT9Tp2nsIc91Njlrkj?=
 =?us-ascii?Q?eU1mGqVylfqdSP2pLytV1vJKTLPmaSBe61xW4O9QfojQXgWK0ojPcsCB5YNA?=
 =?us-ascii?Q?xR9KDhAtimRfufKFNrJtfaL0hnqhjLlAcFHo4Fj9WjuUXQ2EirJTVD2fU7S5?=
 =?us-ascii?Q?FMJuYpYq6ZgnY31r1xlPCpUvAwljnMvgxT0vhYbD3jPyV5KpikwTliGTG0uZ?=
 =?us-ascii?Q?CKQp6h/64cs2Jfzm9boMPuJdzBz+hz1MB0Y63whyVGeuk8Wf530SFnhwWjqv?=
 =?us-ascii?Q?ukblo9EtUXBV2khJllt/SoVEMeaHdfK0lIhZgCM3CG0WAK1GGTD/AluGEeWO?=
 =?us-ascii?Q?bYmgxPHETvnEZadom+Y80u7abF2umSpoPx8kbBPC62T3B2pSuDv8x/VrJhLf?=
 =?us-ascii?Q?s0u/qx36k79bhuYxutPQ4+zGuPhZGd7nVa9/U5UPGNooCgSGdB9bSzf/P7Dn?=
 =?us-ascii?Q?AjA5Eb65rWX/+gbqJSKVlQ+Kk7136uSCToilzGbHu9kL/65hAGl6FSDExB07?=
 =?us-ascii?Q?4JE8tajhkLkLFDSKNLsnq30YSyJ43S2k8FIHmNbS3UdLsfxfi26eelPLZFNX?=
 =?us-ascii?Q?JnWC8kQyVuYsEpJDcBvYdha8fcM7EolPVeGKEjSjUoDUX5ivyXz+J6eDxdZt?=
 =?us-ascii?Q?XjpcUPWxP1ITQdJX7bSDIsvfPBvW+6Uz++w5DR0a5vGB66AGoj+/PppGbLZn?=
 =?us-ascii?Q?SzL92j5t3QfR4Xv1Y8xFRkCAeMcgUpinSX0Umopp8Kww8o4DUYnfTFGq7iZF?=
 =?us-ascii?Q?z9dREMYWfo+01Xc6KS1tf3Rh9ami6E7Ox355z+0/IVjMiku+AFw4wRSxnXen?=
 =?us-ascii?Q?/827nbeqzAXU8uSY81CkS8BjZhjPPAyFkRUOILl+KhVBdlrjj407FVqbp8eT?=
 =?us-ascii?Q?g5Ek4Se54arvepWgECTMKdBAtUC+dfm/sMgVy45qBAvX65qYbBbArhE1nF7l?=
 =?us-ascii?Q?ky2EpVQnNDSu6teEUYr2OsV2hw+hKPnWvD8PCwh16nWdU8KxqSU35TH0Uwsd?=
 =?us-ascii?Q?HXR/b2+mqFWpdyBZ+Lco+VOfnmnc2nC3R0QjMG1h?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b42786f-7ef4-445f-d8d5-08de0bf733db
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 14:29:08.9387
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Y6AZ4q2FAL7ML6I9GmKTwic4MgCYRqwa8lC5XHrcGSvhxT2QXBL+iiJsORnhoiIjiw5p6+mjNXfg/kYqb8Ezw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSKPR04MB11416

On Wed, Oct 15, 2025 at 09:52:57PM +0800, Peng Fan wrote:
> PM runtime support is safe and applicable across all i.MX platforms, not
> just those using the SCU API. Remove the conditional check and enable PM
> runtime unconditionally to simplify the code and ensure consistent power
> management behavior.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/remoteproc/imx_rproc.c | 22 ++++++++--------------
>  1 file changed, 8 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 820b0cd5adbb17ce5665e7ec2786bca23f1a67ea..25f5cb4d414eabed7a166eb2a8ae5e20b6b4f667 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -1119,12 +1119,10 @@ static int imx_rproc_probe(struct platform_device *pdev)
>  			return dev_err_probe(dev, ret, "register restart handler failure\n");
>  	}
>
> -	if (dcfg->method == IMX_RPROC_SCU_API) {
> -		pm_runtime_enable(dev);
> -		ret = pm_runtime_resume_and_get(dev);
> -		if (ret)
> -			return dev_err_probe(dev, ret, "pm_runtime get failed\n");
> -	}
> +	pm_runtime_enable(dev);
> +	ret = pm_runtime_resume_and_get(dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "pm_runtime get failed\n");
>
>  	ret = devm_rproc_add(dev, rproc);
>  	if (ret) {
> @@ -1135,10 +1133,8 @@ static int imx_rproc_probe(struct platform_device *pdev)
>  	return 0;
>
>  err_put_pm:
> -	if (dcfg->method == IMX_RPROC_SCU_API) {
> -		pm_runtime_disable(dev);
> -		pm_runtime_put_noidle(dev);
> -	}
> +	pm_runtime_disable(dev);
> +	pm_runtime_put_noidle(dev);
>
>  	return ret;
>  }
> @@ -1148,10 +1144,8 @@ static void imx_rproc_remove(struct platform_device *pdev)
>  	struct rproc *rproc = platform_get_drvdata(pdev);
>  	struct imx_rproc *priv = rproc->priv;
>
> -	if (priv->dcfg->method == IMX_RPROC_SCU_API) {
> -		pm_runtime_disable(priv->dev);
> -		pm_runtime_put_noidle(priv->dev);
> -	}
> +	pm_runtime_disable(priv->dev);
> +	pm_runtime_put_noidle(priv->dev);
>  }
>
>  static const struct imx_rproc_plat_ops imx_rproc_ops_arm_smc = {
>
> --
> 2.37.1
>
