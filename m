Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010061.outbound.protection.outlook.com [52.101.84.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC8526FD9A;
	Fri, 31 Oct 2025 18:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761936604; cv=fail; b=Y4sUxa7UdUvkblWHGBtzE1cNvGHbBQldL4lvYpEj+7fFpJagMFjvbqvOI2+OkC314G2/x5cX8CO14N6G514pFRR2F/VqTPGkRQ4mPLuLj2YlMI5Uf2yCA6AfAEqF3dqzF+WWViQDm494ysVNBhZsvaqx/SKHfL6fOU85pbKpHDo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761936604; c=relaxed/simple;
	bh=QoQtIMjhQX79DbQ6eWQqgCvIO5bb4RSEg9GBZnioQX0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=TWVTT3+CyoL9Eiixdy+IVjC6Arg4NzeyhRiqUwOCQS7Mja/32yMCBxVekmVYigAmwwy9LmFPTzI8i2rDRegi/jaX3Uus5CdJRb4/9moAr14NUMB9M59nPsnti3C+cu/qTzz84/e3GgNahBrHaQWFGxTWIYbyLRuXaEp9q7pwxL0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=BuCM1v4A; arc=fail smtp.client-ip=52.101.84.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="BuCM1v4A"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sJTCYZpJaqJsy3zqtglbGoiEI11aqroKYaLMeP+/g+IAN466ysyetme9gaeGpWJp3fEgDuC7mxw07WSnJM6xUL9dq1RHKHkLIyN/IIzZAvNSWByfEXFN2L7Nr9DDj9dlGXdUGEoXNfKYS1tbCh6Vytew5YEnK21eNY/IR/D8trM2jQXjQVpkO8qT+Ui1B4CAoODaKzIKmJW4Uex/1HPLhJIjJ9AM62+tXdx+bFm6qndNlTsU4xd/yCSx55D5J7Rzgc+BEYVTsbN7iVS1TSbtksiH379JEbl5JO8O+NOEUViU/fYp9q2dVzw1JRSRp91OeB1usPItRRoFBs54XvkYHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HyC/pcrY66Q88l3xezqFc+FgRCeUG7mWLLU8gv3o2yI=;
 b=DCPMUIg/b1T12njSBdYMRzMJ7QW3TwpuZpd79+G+sFTfr3TrW/2i3I0FnhW+ccyxhXLzp7txc51xZfXOMv1Z3fIMiBtdX4efV34m7lE1bHSTYqWj27+NGnTfdyKnCBHv3lmBaFkWPHHw8qKvL1dOimifO+DXwGHOF/I4Ykveu7/ElOW2o1c7yu8TSY9bMcQtn/U/H1xrPSpZVR+cry1VEqR7yHEqqPlYKn8QqWWQzTruuzblZhYGX4a9I03nuRXmwxJtWqhWzQUUJsXzZXuo7R8hviATc0yTxrezrSj8w0WJxdJShR2sS0fPap3yciRvm0CREjYWdOvRSMCJpKqkeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HyC/pcrY66Q88l3xezqFc+FgRCeUG7mWLLU8gv3o2yI=;
 b=BuCM1v4AHB2o5/aBVvEW2+kyhj/nj3Ge1JM4Rd7JNwIsFVpfIvICrvmqn7+ok/xM9rLcesHjXKg056eYKdqMf51Srj8Apg2Wdb90IPP6lzEQ4LIYC18nUSPn5mMzgYjjRY64XHacn99qu9SWFywTiQzEuEPpaJyixM7uAWLzVXGMvBoiHooQpZWzGmoABBCRBxZ+YDZRI5SLZ+FawSyYqKbmGcjh77iCZqrLj/WJb21ibBopBU4yFXalg0lkzIGUvbTkWyY+i1BMV9ds/JyT+b4PQOQUXwUvY/j3V07zEcRkbOsxGpeqckKzm9RRLp3hUN7ioZrfJvESln2/c5Gokw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by GV1PR04MB9216.eurprd04.prod.outlook.com (2603:10a6:150:2b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Fri, 31 Oct
 2025 18:49:59 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 18:49:59 +0000
Date: Fri, 31 Oct 2025 14:49:51 -0400
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
Subject: Re: [PATCH 03/11] remoteproc: imx_dsp_rproc: Use
 devm_pm_runtime_enable() helper
Message-ID: <aQUEzx6sobI4Yes5@lizhi-Precision-Tower-5810>
References: <20251031-imx-dsp-2025-10-31-v1-0-282f66f55804@nxp.com>
 <20251031-imx-dsp-2025-10-31-v1-3-282f66f55804@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251031-imx-dsp-2025-10-31-v1-3-282f66f55804@nxp.com>
X-ClientProxiedBy: PH8P221CA0031.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:346::7) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|GV1PR04MB9216:EE_
X-MS-Office365-Filtering-Correlation-Id: 611d373d-aee9-41f3-c586-08de18ae4a70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|52116014|376014|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UQkYZjUH59yNdj1zipkH7Vkg5e9K4WRmUVbZmhkv71dpAR4CtqdhtqgwWWhc?=
 =?us-ascii?Q?R+HasP5kn5CMLlp99oLFkQ7L9OcktTW/mvVeqqsGwb4wsROoHeixyDwzZzk5?=
 =?us-ascii?Q?6RiiBBGTLQnf3sOOHdFiBtR+SW5SvHCX4b5x7OAvyimrZ6QxNhFBpc5lB8km?=
 =?us-ascii?Q?5LfnKZXMYvqgnClh+UDrQvYQ+AH8Sl7q94QtKK6VPyVDLgf+Qro31B1JvLou?=
 =?us-ascii?Q?qcrwRbytGpNXhhDrf+dIRl1GLzDB+7L2HGTsZ7UuQiy1YYsjYtaOKupWJkVW?=
 =?us-ascii?Q?d21hYTtA6LNzJDWPLWufJVe5VLXPj32gPNJVmG7NY7GaMrvx1G1/5hkWtXRv?=
 =?us-ascii?Q?QF4tChEntcec5sdXKElERVZiNvV82PhRDT0/0+MDCSUXRwRAYSZu7PjwRxR6?=
 =?us-ascii?Q?BOBCMR3IgoRhNaTJnXtTQy6f6qOei15myjyxC9hQ7cMNF6H4SbggQzmcKUKi?=
 =?us-ascii?Q?J/VoOtwh5CDaURwBk3c2LVKVOiGXrTRxW5bV7jJmpk7VZzg46dhQi/UqfIgP?=
 =?us-ascii?Q?2JwpJ907ot7qaxqGXVIyegMr4m7r7HGvNiuwp0z6lmTP8aHZdCV00BmhNExL?=
 =?us-ascii?Q?Bywnv9eWGu2hJnq+SesxT3JJ0E0vqW7zN92DJcHJ86gy/3hfGf5yxftW/5zb?=
 =?us-ascii?Q?+mwCvS2p0VmfKXyXn1UXa6nlfDNvYvC0rw1XbW4B/k2uK/PfO7JxyF7VUz0q?=
 =?us-ascii?Q?BMYUVUtKreL66xB5VCaT+EqlC++bq4HbmTfA7FRh8KUHjWLnWCQnRbg/b3Um?=
 =?us-ascii?Q?7i1VysSvsRiI6ml4UMbTuwGoA04j+puMBF6khh1gZKQndw+uEzYGKgjvcnO9?=
 =?us-ascii?Q?GUfljRIv1J4tk/B0g0BamUPdrD+yM/v8qVDpWsPbZT93jtYAB12qoaL+PugE?=
 =?us-ascii?Q?ubDQmK3I5ftYMDqBfZcE1/0Eq3XWVqgT7DN/wokVoyC5Io7kxjO+FkQfBrtR?=
 =?us-ascii?Q?SF/laMJ/6O/5kduqGyc5dxXFe2H1jTkaSHst9FvLaEGDsfdCwF/JniPVPhab?=
 =?us-ascii?Q?F+ceXwnrpVJwbuEzSFimmttcyjmgelPPJl3hJS+fhc0rWElu4YSALncLmaCH?=
 =?us-ascii?Q?Mau+CC0t1Rw9y0K6FMcxai5cdFAaI0SS+cWZorX6xoJunb35OJIvGxPl1MtT?=
 =?us-ascii?Q?OFpRqoi+Nw9UyqxTvW9Us3Jcze5Ait6oal6m+TYsrP94rTc1/DVZ87YBl8oW?=
 =?us-ascii?Q?8FEyDu50/GZl2rQAgH4Vg1nEpDqL8qBm004DQyweuiZtwu4CvG+r92LPnHE5?=
 =?us-ascii?Q?pUHpBgdzGM4sOyQj3s9FdG0XMdZnSxWQhORLKNTK/BWgELmZbvkKYdMc/vuC?=
 =?us-ascii?Q?hc7oWmJxwYmeSRWGYOLTWeaiUHlb025Tl4qQxe1JwcOMLCLof8YcUKleod/W?=
 =?us-ascii?Q?bZsrazofkCAa1Zn5y0TC3GtD17uH+nUaq8XZvRKuDP0MQuKtjJTpF7z/55ed?=
 =?us-ascii?Q?PG81OlccnUP+b2zSqVeWJvPI9YZ/5exnLVDlS6K6Uwp794hta15BlIG+o7q6?=
 =?us-ascii?Q?q4irsIT9UgNrb3//jLPMQdJhkmJo6e+OLiBh?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(376014)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ewGYW8qpGZ/kj9loBKVsrNHP3kv5kccP3euFs/Xzas2kNehHCPkGoEeWCG8c?=
 =?us-ascii?Q?EemXfhciafc2/rj4EZtTffP19HMva9U6vmJA+Ku1gdP/jIVIVUTmm7j68UVl?=
 =?us-ascii?Q?cIq815My8pUr//qh6tbzxISsEgBMhDNx2ifF/ZgsPyCu0twfFrovkNPB5kLS?=
 =?us-ascii?Q?AQftd/FO/KRy5N04Mzht84CxkW5UhZbC0uL4yxjsfDzaGtQHoz9F+8TKHUUd?=
 =?us-ascii?Q?NiQnYEzQs6i0qpRHHPs7VDK40z3badAKOEOdpGvcOgehH8WosvzdmgBgZ+ow?=
 =?us-ascii?Q?aQU+crs9Mxh5K2OOaOK2m+Hk4QapAzIzimAD/RDxsZ9iT2hst0gjV8SFbxh9?=
 =?us-ascii?Q?33m2RP3q5vI1rSEli18k8p3o5PtuGoW+l0G6szk1G+1NvIQJMryy/cLXFi4S?=
 =?us-ascii?Q?WRUdqu8XFYxTvo2rqQxYkw0jbDWLDJ6163VTolGnNoEBeOZyhVrzBUEMiIHi?=
 =?us-ascii?Q?g2GKaPN0VInNiD4GLL5spJPtWe20I/BDAcwM072IdYIP7V4vCP8caXNIfslQ?=
 =?us-ascii?Q?wneQ0tn+iCFYR9La7JqtUeEYRiU3CHIvhfMq7Ll95jwmIxJRrnVzCcghudKU?=
 =?us-ascii?Q?ySUL5iXBAccsePL0yngwTLuVUorooDqYDylOPBL7CSqqTsU19mFucb0W6MCU?=
 =?us-ascii?Q?Z2Za5a2+RateHR5BK6fahKFaDowPRoVcne0oZTc1SuKYhTHEGur8uhS8EgWN?=
 =?us-ascii?Q?NcteCwv33cvz0BPfFt1O41aY8/Co1T2rJEIk7l0KzlXyrTnySuqCaR3fm81P?=
 =?us-ascii?Q?J2oN+gnEjRILqs9E1+pX9oTBw8afymh+E8Ysz/h38jFvSfpJyOlOr5MgJ2US?=
 =?us-ascii?Q?r7OZffpdo6PUf+jktX07A8EAx9yD6kKnJ1nuh8egOAmSud4BRRtHDp6lnKBS?=
 =?us-ascii?Q?Fpl9QaHRz4DWq5b7KkHoJa0LfZIOcD7MmG6mjtb3FWPELzbTmr8ynUJfg9ME?=
 =?us-ascii?Q?mTAEwauHuX/Z8Z7tYMd7CYt09bDx/Fj8IEOBUYL3FplkypxYORMHMj1HsC1B?=
 =?us-ascii?Q?YjMkfkVOElxLa9ZtbOaxrRNdjoM0QwfVMjGWiNuwwY/HD8TeJXVBz6O3Bq6c?=
 =?us-ascii?Q?B8etIV+XBc6FWmKptNeJaR32rsYHJA1QiIzTo5ViAu7c1cjr7GXMUdJCRGmG?=
 =?us-ascii?Q?ooFS0pqM/CGGPz29kJeD5DzXxhhtdAB1WMLqvVFuVlsgCPloFuQlW3R1izWk?=
 =?us-ascii?Q?FTTkLhgnH79UqoRr3nBknvMjxAe0Wl82LQR+pftCFHT7swaDWQJRs4ANa3mr?=
 =?us-ascii?Q?Ws6fLSPJheAhTU+shcV6ofb8Dh7gxaXAvqNTh20EBF0GTtXK7ieCz3LwMj/v?=
 =?us-ascii?Q?cmVpTq/gPTnDsQtuplxNaDrZ3jufsR8Mxoa3xxZV7M8lhccQucejm5xpSAaO?=
 =?us-ascii?Q?tMMflDs/cvTMMsc+yikBUXLcrlmOxjBTQzuiY9S7xvxq2kgv0gS3u5T93oyb?=
 =?us-ascii?Q?BE2bOtJKxFAVWxcvOAjXTQ4JiY/oacPSIgUtBf1d6GXY722ttB5AZucz5hTl?=
 =?us-ascii?Q?EcWIck94jklKpt+Y4uZO0Ke2zUrNHl9E5CPDOm565GsTbPiNwYbt4WZOa4Jh?=
 =?us-ascii?Q?g8YWtd93cWecwRiilgwURXF8m3RrYlXs/lEBK7rJ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 611d373d-aee9-41f3-c586-08de18ae4a70
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 18:49:58.9008
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7PiiqUhI0BjVxpyrkWo3HkmIt9pm1cs29Z1SV/jASZ5pIyJ0XizEBN1QiRSfBAIUentoLJBGQofdRJwjyhLJPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9216

On Fri, Oct 31, 2025 at 05:08:32PM +0800, Peng Fan wrote:
> Replace manual pm_runtime_enable() with devm_pm_runtime_enable() to
> leverage device-managed cleanup and simplify resource handling.
>
> pm_runtime_disable_action() not only calls pm_runtime_disable(), but
> also calls pm_runtime_dont_use_autosuspend(). The current driver
> only calls pm_runtime_disable(). But this should be fine here to use
> devm_pm_runtime_enable().

looks like this paragaph is reduntant.

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
> As a result, the .remove callback is no longer needed, reducing boilerplate
> code.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_dsp_rproc.c | 13 +------------
>  1 file changed, 1 insertion(+), 12 deletions(-)
>
> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index df6a4126538d22ff6e02145edb5ac13c2d72c949..f5d0aec52c56664d6074272e276edb0c4175c9ea 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -1200,17 +1200,7 @@ static int imx_dsp_rproc_probe(struct platform_device *pdev)
>
>  	rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_XTENSA);
>
> -	pm_runtime_enable(dev);
> -
> -	return 0;
> -}
> -
> -static void imx_dsp_rproc_remove(struct platform_device *pdev)
> -{
> -	struct rproc *rproc = platform_get_drvdata(pdev);
> -	struct imx_dsp_rproc *priv = rproc->priv;
> -
> -	pm_runtime_disable(&pdev->dev);
> +	return devm_pm_runtime_enable(dev);
>  }
>
>  /* pm runtime functions */
> @@ -1361,7 +1351,6 @@ MODULE_DEVICE_TABLE(of, imx_dsp_rproc_of_match);
>
>  static struct platform_driver imx_dsp_rproc_driver = {
>  	.probe = imx_dsp_rproc_probe,
> -	.remove = imx_dsp_rproc_remove,
>  	.driver = {
>  		.name = "imx-dsp-rproc",
>  		.of_match_table = imx_dsp_rproc_of_match,
>
> --
> 2.37.1
>
