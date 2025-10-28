Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013021.outbound.protection.outlook.com [52.101.72.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878A933A00C;
	Tue, 28 Oct 2025 15:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761667102; cv=fail; b=qmqQCTA68rFqnuTynmxFEzjM4wpwqFZq0NI/PgbfF0Jbu6TtnOMQamQPB3HKEwDpXN0KrLRWuC9XxCUaMuRbh/Z5ccWTYjDeTbYUiNQ9R88vssMzS3ZhvCMzKDc422sXg6PSyWT98vwCZU4MjjOZayHVKOf8BPemt727CfNuKq0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761667102; c=relaxed/simple;
	bh=2wIGxO9MuWphcm21ZEb08tAwJX1uBx10yK+GaWI4TV8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hFvG4jpQ5R1xX5MFfFMaf9BwZgqeq4WHhZQ9DDrmaKNrBE0FWDaprI8oO/H0nFpR9BPrbt5PpnPbBSdsTJC33UGBI6fI49kn/qsblTW//QMqlYENYWrFoO0fPncsJyHoQAx/gjpibkiVEmZ7dHXmxbRmJAL/zogTAPgppObKcmA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=dSktatoN; arc=fail smtp.client-ip=52.101.72.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="dSktatoN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LDYJnL0mK1/nRTSQdxRov1mdeGdq0uw00YnGZpMLA1Mef+xssFtd/O1y5tOxdyzUBakeHu5B9g4pdYrS0qiEp7iGDlIvZ4qDlaasXSoWTA1+EnUZxS8jueq54fgKdsSsBBqBDHL13VgH4qDMJ5g/odciaPFExZ3cbVnj6UzZfCeZL9svxSNN71w7cq4wO6OL37dvXNdWUcBH7OtIghA6qkBZzOUsgBso5djNGAjzwNzNF+K80paoypqAG4Y0g7BvUWAYgR2iAvDm+V3DCIuPUTJFRzTT1fjGxEa5ZkKYq9VT0noJ5MBwp+117dVkCOVbG3EmmGzqEWVu8yf0go5S8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tIWWZEqOAv8IgGwBqNzsFXIPHBL5VG137Q+6RPCGKEo=;
 b=JH32Gu4r+0Cb3YH4L9qEhdLNqGJ3t/g2CB1rCClV8UB616ch6vChpg/ke00oFtibMKBraDAWvVITUzDLxwG05Ro8aNXW9nv5lYg0d46IYioZXKxIPzad7wpkDADr7XfMiOWD8fEE+K3tvRmklBzgj3HZWhrEVGxvoUAfuvSTczliniRZ0XZkhVOWofROjtgAySPuuFNDBm2LO1ZNupXUeEjPHXDXVEV0OTuYDTgM84qp1aD6JvfS8KKDbAyVNPy4lQKXH22h4iO8vZgk/NER6Z6GSkROhc8Zc7ecmLD0SPNKsKRQpRzM+4dhuTFCXmutoJgQt/up9mR0qQGsBHFkpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tIWWZEqOAv8IgGwBqNzsFXIPHBL5VG137Q+6RPCGKEo=;
 b=dSktatoNLtzCLd4lzQ5ttr+F7Yul1BNO/Pn0liF4353rFWPf80W2hdt5wuyQqqK6afUJ3X5YceZgtT3W82H/s+uAXEAq1OmjE8R+n86tcjK7pfa8CwfcPSoMyIqlBH+RyGeXocAO9eYzo9gaY+8t5A1eBFg5a85V6lGKZUS6ZDqyRminFmSxPHrMf/uNjiyrT19WlZkiJFLUCSAtAMn+wlOmL/bAT5vssOw0kfDhG2LtcKDRI0BGcdlUZpWZ6e4/rdkWEF0/g+BZ8pZP80g/197fdMYUcgEWwjbrm6ArtigDWcf6g5hDxV51MzioYUL4D1uQQkMFKDP9uMRLWT13Mw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by VI0PR04MB10568.eurprd04.prod.outlook.com (2603:10a6:800:26c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 15:58:16 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9275.011; Tue, 28 Oct 2025
 15:58:15 +0000
Date: Tue, 28 Oct 2025 11:58:07 -0400
From: Frank Li <Frank.li@nxp.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] remoteproc: imx_rproc: Add runtime ops copy to
 support dynamic behavior
Message-ID: <aQDoD6xh454nzILm@lizhi-Precision-Tower-5810>
References: <20251028-imx95-rproc-2025-10-28-v1-0-ce9e7db9edcb@nxp.com>
 <20251028-imx95-rproc-2025-10-28-v1-2-ce9e7db9edcb@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251028-imx95-rproc-2025-10-28-v1-2-ce9e7db9edcb@nxp.com>
X-ClientProxiedBy: PH7P220CA0093.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32d::16) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|VI0PR04MB10568:EE_
X-MS-Office365-Filtering-Correlation-Id: b2014838-0797-4aa6-9a93-08de163ace11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|19092799006|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oZX3bej0TE13B+dTgBjkLcYkHEZ2HYQdWv6wummNoN9yTsxmmFQgr+z8FW8+?=
 =?us-ascii?Q?WphC++iVVG6VZ5VZfGvB1KTFPb0mh3iEcKqE6xJEw8IFu6J54BK9UVu2WCj8?=
 =?us-ascii?Q?tnAm0qms15iueVonZol/ufKSuCZ3YGxONPsXJk6KPYg2TUdq0kXbe8i25Hc7?=
 =?us-ascii?Q?fP2eILOPRsKbQP8RCAGFiCqC4rmv7+wqCYRlTAs2txpsaPK9oNcqpVh+yxkY?=
 =?us-ascii?Q?3cEM3e8c5zUycxe4hiQeFuP2/M3h9niqaA8ZZWies9Xh1/RszW7SeeTaOFc1?=
 =?us-ascii?Q?/fP6YsojRWOL4STibVjnfQEz0niUSUOV4NXRj3QkP6eVc6twygeKjflj2dbH?=
 =?us-ascii?Q?QNVmx0lo7tdJvJ8DVC/GOOiLbsKvHG4vWKJTbjZ7cmORjRTOS60uvMqLG2B5?=
 =?us-ascii?Q?6rCQNG5+0qg0qCrIMEivAe3gopB1P4LKdlFIRON6ZFsHAIpnLq1DMgzpFX1O?=
 =?us-ascii?Q?L0S/6Nx6vJgjx6dwaA7302WJn0Nh91JklOfvWjb5vpMD6NXj0cr7hoYouABt?=
 =?us-ascii?Q?CSZb3SOsOjSWp31vjWh4G5pqMHe9qHby9tYIJdaW3rjdC9sSC3+b6XT1L3Qr?=
 =?us-ascii?Q?k0Qgy/CCeeVYcjYow/koQW1t32a+WfVJtzEZTzmgRT8o4Ww0Ui1mdAePlFBn?=
 =?us-ascii?Q?KjnJ2sYeTQUpnp9L/dkPSYPc9juvfIxc4riUab9TVMunnfquM2iF8FnLyt4Z?=
 =?us-ascii?Q?TajWmfWw/vZIPePhCXgwtCrpmpya9KvfQTAdqXLW+lVzr7CnrSYHFzvlCVN+?=
 =?us-ascii?Q?BfSevuS2KXhP3ykdwVYdYfHIKYHWSj4ahidsd4SVNYKeasETtjGuiKrrJLNJ?=
 =?us-ascii?Q?EKHWt5m7tnMhc0sOgpvkpzP5FRGEt3m8swUpkehvgYfXxQYSQQGfLKkDtl7O?=
 =?us-ascii?Q?mMHkLzCDUWTardbhhnDGItlmRUr7C2xuk1vL2Yo5PROFfVDdcOzhwivHLmI7?=
 =?us-ascii?Q?JmEknZ/k0EyexzmzhXpaaLae4eKdpzKjOzW1Vtq8QJ237P92tEAi1w5H7VjB?=
 =?us-ascii?Q?IDI9LPfB4bIOk5H2D1dpTvF3GVnjRt32HNpYMMiDHt0HwCo4BN0lSAigczcF?=
 =?us-ascii?Q?sK/zUDMkeUdUvjb9l4AyVz/QQ86P4M97tedRPCffYkU3emxb8b2X4pzazGfZ?=
 =?us-ascii?Q?dV5qnkWHA6RdGN7mkX3rWKUv7wz7yAslbI/8RssT5we3pTzG9h/pFg1oP5QN?=
 =?us-ascii?Q?O8Acy/zqRbHaINbzmDkODXdo4S7WAxEg/DaeeUmB9OdiqGWvkWQ5sOJJNwW9?=
 =?us-ascii?Q?v9H0Ax7O3EP7t/tk6BRKNlcCrwWRZPcweU8s927nUbJXEdf/FpX8a7hIP9nM?=
 =?us-ascii?Q?UVWe31oLxDf6DKHUDvL+1Ui6mnTLQYhOwsYNwA/xflPHnPYTG6ZDPcRKcUbr?=
 =?us-ascii?Q?UnsV1toAXROdI3mbVWgeoie3/4PcGRMBESzZEiRjk1CIM+MO+tKX7iPv8csg?=
 =?us-ascii?Q?hjlORZe3RHta+XuYAPUovB4ox27B/ipQ1eSxV9JJeGYj/VpwJexOurREl5hL?=
 =?us-ascii?Q?4M657SudLa1V+qaR1RGS4jIRG1EJP+8Rt4EV?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(19092799006)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IDnuHXLGjUPaPWlPILqonqdSw2tscXP8efiF37vCA4eawT5onCgl+PzZCf2A?=
 =?us-ascii?Q?face+zbdUH2PMA1JhBpRSgKD+NZe/vnjUO4mN5yX1XSAm3VZr2qjfOAlqEB/?=
 =?us-ascii?Q?91Nb+uZ9VQUgkV1omdFaivw9HyqT2tRiFx7teWul7wwIkchZ9+T8B99tJ7+5?=
 =?us-ascii?Q?NOfIzq1nEsmNWQ++yO14LG5amwZAYzNV1Atpa7eFuhyOwqlzjVBzacDTUsc5?=
 =?us-ascii?Q?yOrraB4d+dwl8er52WMXox0Ss175ntIk0jhSqYQkd7gJuFr+cf2b81c5rTWc?=
 =?us-ascii?Q?JH7QgrH34I0arvEgRfXEgWyAGHQWKfVWHILy0CvmOdZEL9gAuJnScb2Rj9Fb?=
 =?us-ascii?Q?0xBwZ+gi3mBtFiyI+JP8iXlYvdpmnKE5yPVHMDhsBVdPNd5n8HlSI9JOBIcZ?=
 =?us-ascii?Q?2OKyf0QZwMZ9xE3Wmo0KwCoIgKqcsOYoTM3hx09THab4LNoPD/Yo/ST2E4P5?=
 =?us-ascii?Q?NEn4CL5+7bf1G/NbEqmT9U/UZhrLzB7EZAwlh9JcxNuQLgEpLLsRHpJh/USi?=
 =?us-ascii?Q?mjTdzB+tgDh6ORlcBUlAX8E1a4WUEeW4/w97qP5DgpYSrbySjXZEviULCgvo?=
 =?us-ascii?Q?rffiaa4hQiBA+k2uyduov5LHhMQSSzquBTR4OEmm+Em916KFoj8rO/d9S8cd?=
 =?us-ascii?Q?Hlr7eQBEfd6fqizk7MNpMUEvB3q9Zxdu1V672w4GBjJjyywh91bwV5pqVpQv?=
 =?us-ascii?Q?Tcpx3dx8q4YyiwttkL33yDXPzciYeNBnKeOu0MsDrNoqeQud0QoX/5kX9BmS?=
 =?us-ascii?Q?HT0YIpM8AODQysTnbnG3/y9ftzPtW2fiFcQ05T4hw5xGNoMskjXKQiuGqRaW?=
 =?us-ascii?Q?n508E8xaBgKEz2PPCK9iYsK5bGnpKD/1ngKfbLX2v9VGL29upBW9TxtNFtiy?=
 =?us-ascii?Q?53Jt/g/2VA/TWGfIDHGcB8buL5LKU0ZzA26j46pyqlqlWuc/q+bMXu87SDWI?=
 =?us-ascii?Q?Ud3uXz0bCSCoJN1L3Qzoy/9Zwn0oFTLP+oPQNVBbb5MYzYftHAC9rSEyKuWz?=
 =?us-ascii?Q?MhSpG/nmMphMB2531hClsuBTYAN9iOfrFp2f8s6ds/KkbW4fsjQFI9PVtZ+l?=
 =?us-ascii?Q?y3ImRyjr7WjM+eeeV3XCEYiE+E+/IarPanlSAixmb2kZ66wLiokhVNbo7PUn?=
 =?us-ascii?Q?7sROotzOBxWv1TJ/OSf1UnvQ3ipeQAgrVqFKw2DDO2lgOrrqn20IgtGXUelf?=
 =?us-ascii?Q?IhtlNxYXaCDwuizDQbjrVGPB0r6WUjSXxxEDjEvVxRUNY8X73kju29RxHlkz?=
 =?us-ascii?Q?s5vg1433p2KTJQxppmkK0NqVUGvrP6TrEAyTCGr7jjxDxE/m8k31RtXihcXT?=
 =?us-ascii?Q?DEcx6GeSMDC49S+1TvwS6P2Tr3E+/BR18mZHANXeuNkvRsi9SwkAf5t1oYiG?=
 =?us-ascii?Q?+ZkTUum0zkaEC7zCuvCwWWeSqguJuI7USoJKm5mucUavdTrOLZFAoa0gI+Zl?=
 =?us-ascii?Q?1o3T2kwNbPd1zybDqAxuVluAvHpanSoVjUaVpZD+rL2I8v+skDDHLKU4wvHt?=
 =?us-ascii?Q?3cD1wUcBUYkhVmz1c/DSuozZ5ppNvKgjkmVKD/NNl3BmUfRI+b/em/LiY2b7?=
 =?us-ascii?Q?u9iqyIdcKURDuwKlJRG6EOoQQvTbQfBgiJ++RVC+?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2014838-0797-4aa6-9a93-08de163ace11
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 15:58:15.5257
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZRL8y6Lujk5GeO6LRzvn8LHAPoMHfplRzZg7wmF0lxmIMNI4J1JEfeTa17Hln2gD6LtMWQ7kmdLWDOLWiGkRHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10568

On Tue, Oct 28, 2025 at 04:18:02PM +0800, Peng Fan wrote:
> Structure imx_rproc_dcfg contains a const pointer to imx_rproc_plat_ops,
> which defines the start/stop/detect_mode operations for a remote processor.
> To preserve the const correctness of the static configuration while
> allowing runtime modification of ops behavior, this patch introduces a new

Needn't "this patch", just "introduce a new ..."

> imx_rproc_plat_ops member in struct imx_rproc named `ops`.
>
> During initialization, the contents of dcfg->ops are copied into priv->ops.
> This enables the driver to safely override or customize specific ops at

Nit: Enable the driver ..

> runtime without affecting the original const configuration.
>
> This change improves flexibility for platforms that require dynamic

Nit: Improve ...

Generally, needn't words like "This change[patch]" in commit message.
simple use impesative mode, like

Do foo for ...
Make foo to ...

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> operation switching (e.g. i.MX95 Logical Machine ops and CPU ops).
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 27 +++++++++++++--------------
>  1 file changed, 13 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 02e155e967942d745de4ccd96f9008e4211f9b36..4ffd2415295be5e60c8eb8ea5126b3562bf703fe 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -116,6 +116,7 @@ struct imx_rproc {
>  	u32				entry;		/* cpu start address */
>  	u32				core_index;
>  	struct dev_pm_domain_list	*pd_list;
> +	struct imx_rproc_plat_ops	ops;
>  };
>
>  static const struct imx_rproc_att imx_rproc_att_imx93[] = {
> @@ -315,7 +316,6 @@ static int imx_rproc_scu_api_start(struct rproc *rproc)
>  static int imx_rproc_start(struct rproc *rproc)
>  {
>  	struct imx_rproc *priv = rproc->priv;
> -	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
>  	struct device *dev = priv->dev;
>  	int ret;
>
> @@ -323,10 +323,10 @@ static int imx_rproc_start(struct rproc *rproc)
>  	if (ret)
>  		return ret;
>
> -	if (!dcfg->ops || !dcfg->ops->start)
> +	if (!priv->ops.start)
>  		return -EOPNOTSUPP;
>
> -	ret = dcfg->ops->start(rproc);
> +	ret = priv->ops.start(rproc);
>  	if (ret)
>  		dev_err(dev, "Failed to enable remote core!\n");
>
> @@ -372,14 +372,13 @@ static int imx_rproc_scu_api_stop(struct rproc *rproc)
>  static int imx_rproc_stop(struct rproc *rproc)
>  {
>  	struct imx_rproc *priv = rproc->priv;
> -	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
>  	struct device *dev = priv->dev;
>  	int ret;
>
> -	if (!dcfg->ops || !dcfg->ops->stop)
> +	if (!priv->ops.stop)
>  		return -EOPNOTSUPP;
>
> -	ret = dcfg->ops->stop(rproc);
> +	ret = priv->ops.stop(rproc);
>  	if (ret)
>  		dev_err(dev, "Failed to stop remote core\n");
>  	else
> @@ -590,12 +589,11 @@ static int imx_rproc_scu_api_detach(struct rproc *rproc)
>  static int imx_rproc_detach(struct rproc *rproc)
>  {
>  	struct imx_rproc *priv = rproc->priv;
> -	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
>
> -	if (!dcfg->ops || !dcfg->ops->detach)
> +	if (!priv->ops.detach)
>  		return -EOPNOTSUPP;
>
> -	return dcfg->ops->detach(rproc);
> +	return priv->ops.detach(rproc);
>  }
>
>  static struct resource_table *imx_rproc_get_loaded_rsc_table(struct rproc *rproc, size_t *table_sz)
> @@ -995,18 +993,16 @@ static int imx_rproc_scu_api_detect_mode(struct rproc *rproc)
>
>  static int imx_rproc_detect_mode(struct imx_rproc *priv)
>  {
> -	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
> -
>  	/*
>  	 * To i.MX{7,8} ULP, Linux is under control of RTOS, no need
> -	 * dcfg->ops or dcfg->ops->detect_mode, it is state RPROC_DETACHED.
> +	 * priv->ops.detect_mode, it is state RPROC_DETACHED.
>  	 */
> -	if (!dcfg->ops || !dcfg->ops->detect_mode) {
> +	if (!priv->ops.detect_mode) {
>  		priv->rproc->state = RPROC_DETACHED;
>  		return 0;
>  	}
>
> -	return dcfg->ops->detect_mode(priv->rproc);
> +	return priv->ops.detect_mode(priv->rproc);
>  }
>
>  static int imx_rproc_sys_off_handler(struct sys_off_data *data)
> @@ -1056,6 +1052,9 @@ static int imx_rproc_probe(struct platform_device *pdev)
>  	priv->dcfg = dcfg;
>  	priv->dev = dev;
>
> +	if (dcfg->ops)
> +		memcpy(&priv->ops, dcfg->ops, sizeof(struct imx_rproc_plat_ops));
> +
>  	dev_set_drvdata(dev, rproc);
>  	priv->workqueue = create_workqueue(dev_name(dev));
>  	if (!priv->workqueue) {
>
> --
> 2.37.1
>
