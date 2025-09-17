Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013032.outbound.protection.outlook.com [40.107.159.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE21B2D8399;
	Wed, 17 Sep 2025 14:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758119704; cv=fail; b=jDe5vvgKuhmD7SfbrFy3djTms5aTGgHBDgFafpRx2wEm2gci+ggLlV0L/9h7ZUHQTKmmbWLl3bo05SNwWfvs6XbECpaTxcQhtPPOGbWTBPXxrLu+LRmJikYXwEcWBguxrjPB7LzwmDy0ExjLpb3traRTQc5ysHDYGL2pvM0caoE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758119704; c=relaxed/simple;
	bh=Oub2Z+PCYdCfn9utL3ZyZUtfhz/oCZVXqhMrMYmV3hI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=roI9iRfRQ8xylq9SD+2rQ8M9pxFaIDrxqqtv5WgWl7bq9xyx9beHOjobe7DRqoh8qko0hoMP8TzWGK85qA6Z7wNjyLFov3iAgYX+MEoqDqCDzHRTQAdONqNKnhLZfV/DCCfi33KCUyHfpFLX1y0IGYEP1yrTJGoOVZcYAfl3XZc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Ixn/dF79; arc=fail smtp.client-ip=40.107.159.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Ixn/dF79"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pr15ltkkpTiWJzquxNg2VWbHh66UTWO2RoTSrpCOVtba3JXc5yhW6p5G6fKCuR+2rFCNJ6Y7m9kras3Di4bB8TD6H3IRVNYpDBHhp6aJGabH+o6hpFpEEu6f304nBEc/Pl9aaJ4+Fa1Y2sBGDE0dzvA03VRhC+MuZHNTc2W9G4/oqM3bwy9oc9tXY/+SmrKpulq995eiYIP1sPjdxADkeUEjwXkTj02U9EkvhWTwocV44eUJVqhSaZkbickIrrmKE6rkGTk96TX12mGYQ8y3ai3wtJ8mTn7OX/53Auwl0qaKGib1csuVEaGkpOKBlSVqh5ONgzG54a7qYQESDOawJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mko5FWcpHlCJvKq8ImNFioWfq5kgrQ/UCzR9V2PmK14=;
 b=Xsykick12fk8Pk/ge2TcaaDJO5ZeGWF66qZ40LxCgqq6U2O9b9bTT1YqQSBXOjKjLPzzJhr1fjkx4jwGR+x+SLv5puErtZpNSA3wDY80DVoBzJDQVSrdGVp6gBx341Wd+p0ud6hu2PzcDaG50dD4Fg1BAy03Sgc36JgQk7tlm/YMhO6RaqUZoPcS5Iuls/MDzZ4qj5KETFRtekauljVDfDrz+U8VkIMdYOoJPLNR/zZ12av3MHbKLfBYB52W/w+Lgtq2pjciCKcFO5/wmKK+jnQkdV+YMiS8fXrtjqwt1Kx0gT9MrRTnox8Gne1uJLmDIGqpG8WUmbFkSrih8RS18Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mko5FWcpHlCJvKq8ImNFioWfq5kgrQ/UCzR9V2PmK14=;
 b=Ixn/dF79EYNW+OjQM9Suj+lSS14wG+rOPg79hXO7F0ZlYI81zZ5YlIMwYL50rkLzKQoi95PpCi0fypZbeeIguINZq8P0ENuhRX+iz+DUZpSRZwtJxm4CFENqD/6Ap/gzhmcOKGlH8ERxtSJOYzXP5Py5OzoJXuT8jODOXd7GVTp5jLhagphOOJ8hTlm8VtDm//k7Fsx/5eve0tuJpMezK8C5Tp+p48rBJmhkd3BF7olO9y9/sOjLWfeVnw31MXZi0g2mc/9str6QGwIPbMbR61apw9l7Z35QHXlXokNM4KpHqFwdGSqvtNVKNU2JdGqw6nKb8D6ur/7DJfPtZrGCsg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by DBBPR04MB7628.eurprd04.prod.outlook.com (2603:10a6:10:204::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Wed, 17 Sep
 2025 14:34:55 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9137.012; Wed, 17 Sep 2025
 14:34:55 +0000
Date: Wed, 17 Sep 2025 10:34:48 -0400
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
Subject: Re: [PATCH 2/6] remoteproc: imx_rproc: Use
 devm_add_action_or_reset() for workqueue cleanup
Message-ID: <aMrHCEwWUEiheyiL@lizhi-Precision-Tower-5810>
References: <20250917-imx_rproc_c2-v1-0-00ce23dc9c6e@nxp.com>
 <20250917-imx_rproc_c2-v1-2-00ce23dc9c6e@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917-imx_rproc_c2-v1-2-00ce23dc9c6e@nxp.com>
X-ClientProxiedBy: PH8P221CA0048.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:346::29) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|DBBPR04MB7628:EE_
X-MS-Office365-Filtering-Correlation-Id: ea58a885-308f-44a1-da17-08ddf5f75ed6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|19092799006|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sHLxiMkawGZvsl+QGaepf+95qS0In1OoQgvkG4LPF37D4gAJHhBWargFWKZU?=
 =?us-ascii?Q?EZW9B6VFa2vbsMWeS4FUPnsY7Jm0BDigPL1U/blaGt/TBGAnPLQ0o/fxpIIu?=
 =?us-ascii?Q?NkASkoMthyGhy70+vmrcWeazM/t+5zXAtU6ePZo8ILW2iPoZMWVjDKjR8WHS?=
 =?us-ascii?Q?CKB3qoA+isHcaLXwyZ/ivgzvR4KOi8Hiba9IyJkhX5Dn733pJDngSMlMCD2T?=
 =?us-ascii?Q?mERmrho3mjJSBuHYgJc49jT2ehxP7T+XExJKzV66HXfdqxFEgLTgU3Zv9q1S?=
 =?us-ascii?Q?lF2ffrWTKZIGw3nZcRran0exCCSKEovw2muwj4VLh2JKGr4kCdW1+29BXtMt?=
 =?us-ascii?Q?ZDXmGniFIxKEJgfA9ygzzc/PILG93bUn2ABihrEasXn9UsI2HGVfvtrWAqth?=
 =?us-ascii?Q?C/0QXwi97uIDH8O3oISSwlYDbQcBjxZdsDZxYktXW5FpPvA0U+pArxdAZhWf?=
 =?us-ascii?Q?XmxG7VFvl1NOJgkCQ2Sn53gxwF29yslCZ3D/9jq5YzvIYVu5VF/U0fouyVle?=
 =?us-ascii?Q?mTyPmES0TPMZX9xhCzm8Jr7qXK33sT9eBkDKyFE51zwfZnhOFSXVcwCcMeE2?=
 =?us-ascii?Q?8/oz+HolrPYhru9you30Zo7iS3KIjJvTawjBMQF4AUrb3y2fHGGQZHWCwmF1?=
 =?us-ascii?Q?GgR1oNX3xaj+6hqh/LGzyZOpVmzFA9VULdYSblDI6+QK30KX4AgzHzAD5vS6?=
 =?us-ascii?Q?cd8d7v6Mw1kt0osUSgO/HX1Av8m2HcB8eqpqLb1V5p8RlsoXKeH01flVKH+I?=
 =?us-ascii?Q?+1vDjzRBh5Kz99/ANToPto2H4YVRI4a2n/ygOPZrgHA2NTiBd3YIcif11+ME?=
 =?us-ascii?Q?cyBBDAjapLn0QXccA2dbUQl0oNL6TF95eAorcyRxRxKv1X6gGuM8l6GiJu2q?=
 =?us-ascii?Q?euvIwDUzimj4Bl90kZ9qMvJTYxkH5i6ymigT/L+k1fBawrDUg+JdlRjiNupi?=
 =?us-ascii?Q?IIB+uGr6NDRZbpm7ifVDaikfnk4Vls2a4jUXhbAswTrSaTon+UkKfHASoGdY?=
 =?us-ascii?Q?gH/R+9chFRgVrHhTnqRDFh5A+VrMoJU0m2WDdN/unsyx3dCDAQTycRH9a4fK?=
 =?us-ascii?Q?piAPpch2y8qK3WnGgyWGRFCueks0Kzjpcs6UoucqtgLdM7/Y/6qprHSgV61y?=
 =?us-ascii?Q?yJdX5PRcOc3DeEDyfQtvutR06arYZXBgOx9u/3ksSyRKMUAwpN0r4CYBlYI3?=
 =?us-ascii?Q?9FgzgpyV4AFJpD4zY0YoMQ9L4fn80WqW3zCYUUOVHFmsetkuvNcNGvjMS3dv?=
 =?us-ascii?Q?Oltnb3mTWwU7Dy5abVngGK2iaCQ7OnyMXgZ9HmS2u1XC9fif51sSf9vY5aD0?=
 =?us-ascii?Q?xlbkPoavTkYgaGt/njSG8wN6t5dy00MEkeD26Vc1pI6hTZn3flfTWWdmcU/W?=
 =?us-ascii?Q?gwNQGl0mrZPN+u1iKfDt/1EI+GKxg//HdIfhOpZ/yJ4Hta9ZYIxjilwOKPLN?=
 =?us-ascii?Q?DfZLgfANLgrashhZ6HU3amEgrtDPq3f0xVNjpD6fYJac6espd7ZQvg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(19092799006)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?h1Dmcl/PZAJ5lk83SUxxS6ODCVFgGlGNhSOfSmRaCv0oWOzUXwO1+GDuP2Di?=
 =?us-ascii?Q?FwJdt17lUhZroTaRnHBqK6aeeqU0GFGuKJMJWkrC4qAgaJ0GLJrAtMUW3sYW?=
 =?us-ascii?Q?jXpKzXOR4AVRIYU7CSEgQcTi8FeyY3Qlv3Ay3qB/8V1QpJCSSVNtU2+44lSb?=
 =?us-ascii?Q?eeTXO8n1BIjhqw1/vfNoyjjZvjgUJUCaWCyP3UKMaJTYv+2w7VghpmB8ALFf?=
 =?us-ascii?Q?1U+Ner6DCne9EL8+ch6UuEwhJqgCIAfwBqOHqHNaySdidwaarHLePPqVJNyZ?=
 =?us-ascii?Q?oUXQFSPeltdjDFwDRMymsNQP4R/K70dYgEb8SSRkveapfQ9nG2zGQWhd2dSJ?=
 =?us-ascii?Q?pXfYVEbaT+oKirncCe5gdgMK0p8d+fe9A+H5PT1mMY1y/biTaG7bKWX5UR3z?=
 =?us-ascii?Q?RWdGuFPgqeqQSvylvvowZ/5IzOu4czepiCDT6KVMOZLcp68F/WNTbM8Oolc/?=
 =?us-ascii?Q?53654s1D5B3KFJiz0qRLoYLk1Fd6WR6ki22/rPSabcu8pHD6VCUMJD3xmhhC?=
 =?us-ascii?Q?ExxoPxk7ln940vI3TybO3mB7gscyi6ckgMrTsCP720Dp1bTe0sN5t5/FjX/p?=
 =?us-ascii?Q?5WVX/tuWkxE1gIlhOxDHnjUj/GgeqEq7RHWmX7V5rp709w0B22ntHxlZl3PJ?=
 =?us-ascii?Q?WwKiAajw8prdA2efo6Vd9zhXEcy1lATcS+L6zwhyJeaZ0AoXFHO9jqfFJpE6?=
 =?us-ascii?Q?2Z+UtLuNbldMIxEjg1GCSnnJ0EGKrpSgDde8G9T3kU6thlShmAD0rkQKAj0g?=
 =?us-ascii?Q?4kehAFze5M2DohHWgR0ru01Dnx+Ke9aBAWJclvp2hZRaYxJwGe9Z2WD1IpY7?=
 =?us-ascii?Q?Qm7IBaYI9XutglYPgtMjKyFju0XT9gjRT+UtLXf27SUP+/us0orBUQKQRP9T?=
 =?us-ascii?Q?9Kxnj05lz/XYVKXr3aXh1MQvNAZmK/9skutBemB3LW4CrH/wFV80gkWR8SQR?=
 =?us-ascii?Q?B2dHM4du6OOzm7jtFtizkmm2CQlDW4klSsRg+CgKmVx9PycnbMb1Br6BwpBC?=
 =?us-ascii?Q?LYKE8a3xxyyoYRL1mC5xrjXw2vpeaXkGmgIaEL9jZahfr+bQY7fG8iTcX2TM?=
 =?us-ascii?Q?nUU19EElEsDZpRX5lLXQDJQGlfCCwobwhhoEsJ1xqxpLyfbuRUlebiEw1/iU?=
 =?us-ascii?Q?j+yhWOdgEir4RC06h6bn4XA+I2rfyEmwaaBkptWRBlsdYcYWnnEXW1EsLvY+?=
 =?us-ascii?Q?Ytvj6engRNH04hfT0CTMTuNC7XAKwjau1LTbuxM3TP9pivgo6/SFSaGjJQLS?=
 =?us-ascii?Q?kJFjRvJhqrK07BqtaY88W9QIZA6tC89VS5Rp5hPjqBc5HezvQldlI5WuZ6N1?=
 =?us-ascii?Q?Lt8CbE0NTZypnRBCLWkv+96VHG/ltJD3JHhNyp+ap9yzZJvKYs0Nei3JiESt?=
 =?us-ascii?Q?jiSgE3fq5wRICAlU4FMzuvg4guJrK6aa264oxVC4J45sCZLtsxKYmtRWsnTZ?=
 =?us-ascii?Q?6UjEow7fSwbMkuQqyJmrZjYjnlX/oy4aAYM3G65665S13u0a/SzsT4Qp7m5A?=
 =?us-ascii?Q?GCTwVf7d0+DwjnOe5sRoxaGluFnTL+INxzs2LMIcYj3tpu95Il4syCSiUBV5?=
 =?us-ascii?Q?VVYEKk1W9yrtP1Olq/8hN30QX3j6fp5ngqQsAi+c?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea58a885-308f-44a1-da17-08ddf5f75ed6
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 14:34:55.5720
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: an4c4KbNaxK/gwaWHZBdZdciS6DVJoRTE4+97X+AB/ViwhM+g9LGqYLZB6jD2CPs8xJ9NAGE9SasA1kt7mz6MA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7628

On Wed, Sep 17, 2025 at 09:19:14PM +0800, Peng Fan wrote:
> Replace manual destroy_workqueue() calls in error and remove paths with a
> devm_add_action_or_reset() helper. Ensure the workqueue is properly
> cleaned up with the device lifecycle, and simplify error handling in probe
> by removing now-unnecessary labels and cleanup steps.
>
> No functional changes.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/remoteproc/imx_rproc.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 12305f36552fb5265b0953a099ea0d561880e3ff..cc776f5d75f1f614943c05250877f17537837068 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -1046,6 +1046,13 @@ static int imx_rproc_sys_off_handler(struct sys_off_data *data)
>  	return NOTIFY_DONE;
>  }
>
> +static void imx_rproc_destroy_workqueue(void *data)
> +{
> +	struct workqueue_struct *workqueue = data;
> +
> +	destroy_workqueue(workqueue);
> +}
> +
>  static void imx_rproc_pm_runtime_put(void *data)
>  {
>  	struct device *dev = data;
> @@ -1084,11 +1091,15 @@ static int imx_rproc_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  	}
>
> +	ret = devm_add_action_or_reset(dev, imx_rproc_destroy_workqueue, priv->workqueue);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to add devm destroy workqueue action\n");
> +
>  	INIT_WORK(&priv->rproc_work, imx_rproc_vq_work);
>
>  	ret = imx_rproc_xtr_mbox_init(rproc, true);
>  	if (ret)
> -		goto err_put_wkq;
> +		return ret;
>
>  	ret = imx_rproc_addr_init(priv, pdev);
>  	if (ret) {
> @@ -1165,8 +1176,6 @@ static int imx_rproc_probe(struct platform_device *pdev)
>  	imx_rproc_put_scu(rproc);
>  err_put_mbox:
>  	imx_rproc_free_mbox(rproc);
> -err_put_wkq:
> -	destroy_workqueue(priv->workqueue);
>
>  	return ret;
>  }
> @@ -1180,7 +1189,6 @@ static void imx_rproc_remove(struct platform_device *pdev)
>  	rproc_del(rproc);
>  	imx_rproc_put_scu(rproc);
>  	imx_rproc_free_mbox(rproc);
> -	destroy_workqueue(priv->workqueue);
>  }
>
>  static const struct imx_rproc_plat_ops imx_rproc_ops_arm_smc = {
>
> --
> 2.37.1
>
