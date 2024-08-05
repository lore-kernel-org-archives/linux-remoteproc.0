Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2080.outbound.protection.outlook.com [40.107.241.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A6F149C60;
	Mon,  5 Aug 2024 20:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722890321; cv=fail; b=jhhcBYLHeegb0jS7/DNrMOnt3s6/w6mGe9tvYRtboImQX/isXIIIGdjNRVh7TpVKg4uekuCyi26znPXEGFZAmSgkvDdUO2nc1ni33zMKuI8Jn2Fa4E0zaKm8UNM7dkwa/SarAIpI5Wer8ovRxNhdklxdCE8cAKnVoTLWmUSaodY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722890321; c=relaxed/simple;
	bh=8vIG1wKGHqPkF5o0P6R3BBC4ehD+HchxXcDDfyQ3bTI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=aTbtwD+NbN74RG2SYCma7hVTh/0Zl+T2VKP2/ySlo8tHgkV8fV9iWpFtwilEMZISB0PMDlOpAyT3j5SvLbfnVff/JLAdUKV9aTkK4BLT4NPa1II0FukZ9/CTUXgF4LIIKpv0Ct9W2np+OBbHhlIJqi6BCpTn7qLFaRNGiB86Z5k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=A0s4EvID; arc=fail smtp.client-ip=40.107.241.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="A0s4EvID"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RLBZ+VMD15zM0QwVEcWEQInEb5ssv/UUYl6fvqWIkMXvH9PNiWuKjJ8KfXOas033b0SCcGjKTHuIcJhUS8z0DS1B5eg5chugUnnutnSJcSJiBQkAhfyfrIJE+ZJkejX31qBjTjRsVIzWAGejMsnRCo6oFOwwQ7EDxot0W01IrCqTHeihmr0BTViS18crfI+Y25Z0ZfibVBAPD6dZgApieJhqI+URteYRIaBVYaLr9t6q2Ti+/pb//XK2uBMDx0wjuKe6KBkvQlTniMXJabNaCsUrD+vxRe8nzM6/rsNws2Bsj5OpKNY+6F5P/E23O6VapfcO92g/iKyl5MB6Pj+Zdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0xqLcRHFbvGZFSwrPwTRP837v8ojEphyb5SvWjwtSjY=;
 b=DLsPZuPgroJqEub72zZARGfjoyPlZeSPkytOHzZ8LP1JraqowWHSK9k0nbn5eqIAlOYjYIKdxjL54bqtxObTDlMMWAV6887vc8wrR6MIrbXTf2OvQYn211XfAdl5T5bFGnj0HD7Y5gXRvnYBZoiU9bYcQ/6BcF8mp3iwWk42N6uiu8kMznn//alc6qpMTtVLtOi/9b1M1N8A6PXcr0yrXBkluucWe/rt2n1Ym7EVGm+Sno3UFDjPtSW2Z1cChsI1hDTFogZXatyLbUH2YoIYKpqlKIb0BFi76ujShLp8qJBsOPP3snrBgkRqKPcZqxo3galBL/3qCMdx3zUKZsnZpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0xqLcRHFbvGZFSwrPwTRP837v8ojEphyb5SvWjwtSjY=;
 b=A0s4EvIDlGBserIulpJQ+OMkAFACprAf1nBFBCEmcBtDR4wKGozuXcF0nEPItvPeu8ltAVcsYRZBumP+8hsKWum227hRfCcY7o+vb9PNH1s9QowAy3RnbQ9kzJEmcHaOFoXOQLOJCGRip/AhZ6EgFoZrnFvwzrB4UtJs18TFI/EFQH+cYyJ4Qzxk8c7swLq0YlWOnTB8uHcsWO2M9RAlkBllz4H1yb8hAvzQDbGY/jsvi4qf9uFvbaqYeV/SJ2xnHp5IQhOHkz/tJU0ZgZFlWN93NUzhFcQ3bOerwHXQtJH96pP+e6XolEYNq1+jD6hyfo4fML7l/60KzVcnQcdXlQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB9077.eurprd04.prod.outlook.com (2603:10a6:20b:444::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Mon, 5 Aug
 2024 20:38:34 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 20:38:34 +0000
Date: Mon, 5 Aug 2024 16:38:26 -0400
From: Frank Li <Frank.li@nxp.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>, Jacky Bai <ping.bai@nxp.com>
Subject: Re: [PATCH 6/6] remoteproc: imx_rproc: handle system off for i.MX7ULP
Message-ID: <ZrE4Qnk2UOCGpFv1@lizhi-Precision-Tower-5810>
References: <20240712-imx_rproc-v1-0-7bcf6732d328@nxp.com>
 <20240712-imx_rproc-v1-6-7bcf6732d328@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240712-imx_rproc-v1-6-7bcf6732d328@nxp.com>
X-ClientProxiedBy: BYAPR06CA0054.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::31) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB9077:EE_
X-MS-Office365-Filtering-Correlation-Id: ab5f02c9-bf44-4c3f-6d3e-08dcb58e9373
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RKUm+iyEPLJEA8tIgInFYazzRHqQUDcILfNO0PJ2mNqA0/ZDRa3puz1WOUTl?=
 =?us-ascii?Q?3K26qLwGJ10dxA7g76bHojkcE9MsQ5mLMTtyeG/yNE0ROXFS6CaRTnXdmL/m?=
 =?us-ascii?Q?Vg3CR0s+0WHBPY33CufwUynO1xdyAovTmOjSDzNcA7jnmSB4Ct69Vp4aemov?=
 =?us-ascii?Q?n4Vr1Vpq/daqHtOxV/zeKcqvHxNo2vHykChnLT74J5Gd+AvyuS/zTKEQXhNk?=
 =?us-ascii?Q?QchuBYffICoDq34NeIo9kbNGbZEpAPeCHP3ZuE4DtmLUtmcMPSmE6JugTHi1?=
 =?us-ascii?Q?ppKqf97jRjtVcPeu0uflzUk3nUNEE62Y/YfezKStbI+EuKem1XTzLf7GqZ5k?=
 =?us-ascii?Q?hnNcvSjBm+jtQX2mo1OT2oIzKlf2NvgMeVk9WcWHvtj/7HkIJhk9Mz+4al0b?=
 =?us-ascii?Q?PJPD+0f9bY6GYN4/cq6/bbuFc/sEgU+utLJKJ52VGwc0yWCm6UzT9fK1n6uF?=
 =?us-ascii?Q?0zdz2DvWGf4P0TdgWvAJ1o98Yd4eNBaVnMDzP6ptEx7N8GftFKkb908EVUCP?=
 =?us-ascii?Q?xw9chSteCQsuKhIP7kSGZ4wOm5Msfky+qs6hLd+Ygl1QBHHxpLnypPmtGFis?=
 =?us-ascii?Q?dQSt5mDwElkF6UxMy/ot3MSYVKLOx6LDdLtgUnY4nVtWmx2LcRv+603gJOoK?=
 =?us-ascii?Q?vf4acdnNpRSmmh4mNQfgVej/V6yJQ70RdxJ6XDw4t9kRwC6Il8KU+CoEqwiI?=
 =?us-ascii?Q?K3DmI2LUZNBNflWwur7hpFfBN/rW+INbwK3nNLxFMXxndMRPSh2g6mUqqRLb?=
 =?us-ascii?Q?si7dOBiD1/MLesOhUCgygS2FFsOmWyeEFVs4T0j8dYRHAgo4fITgct6HPq3U?=
 =?us-ascii?Q?IV/xbt4KaM+OeESmuw9MTpb3C729RDTuvJYvkl5v9aPR4nsOI3Hp7pae1gka?=
 =?us-ascii?Q?S05siDUxSP13iIWxIap/MfLKl/J8QTTcliRdvRgGqOA7T22MBWrDIFbrjtXS?=
 =?us-ascii?Q?3bhpLsqhCqpJed+5PkwoVTICTkUuqjj0ZdhUMO9ylAHfLpGag3kFka9c4qAR?=
 =?us-ascii?Q?6Q+kJ5zzKKhG9lPk4FkVbBLCpvtd3i8sdL6dKWFbIbZWVxbuYfvCje0hs9+/?=
 =?us-ascii?Q?1J/Fif1sX51ygRxpUpLFcrkYJv5f42d7rJgd7VxCGz8uFWSBjRz0a4vslnEE?=
 =?us-ascii?Q?p/nzut7GFG5HFYxMQr4vN01HXFXj6isd9K6PhnR43KdXL/mW0b2j+03xzGyG?=
 =?us-ascii?Q?dNAqCOyl3Zfca08SJF6S0bMAQiStIQ1c0Xj3wvGC67VsIt4PXZV+GZTgMHZs?=
 =?us-ascii?Q?ahx/Iy/sSc9a/g3ouy3i1SBz3llGz4149oaWsKTBvtNDFTAhjv9T9mx+s0Rl?=
 =?us-ascii?Q?bChO10gxezkxMl2nO8b9rnF67LDyQGqKuTXnBod67BI9aJb5mZi9ghYbtD3Y?=
 =?us-ascii?Q?RbZ7P3h+3sbbtquM8G0YZhxXXHeZJG2NFIBVsJ6rw4ShPnsuiA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NuvSBO4LmHAnJTm9S0U4/eAFnMCZm8SZVFI+OqsCwl0UN84jFf2Z0jdHN4XM?=
 =?us-ascii?Q?/ZmumBZvfPTWbuGqiP7sal8ecWBhfUWRPq9INlqAHqQ2oi8Pl7mwAdIcIXDe?=
 =?us-ascii?Q?jUoALVFLsrx62iIdHM/2bzuIkXlg4LMn5cGILbcUzK2autEjXhpXItKZ5dP+?=
 =?us-ascii?Q?JJjDeRvBlNuQlaf7aZOBFUUA1+t/Aou1KjHUmdlRPQSMReQeUcIKq3kW3EOM?=
 =?us-ascii?Q?5g6ZJh68yVjZOOhJQH5UOSSPi9cuGlq4lS7TwEkhCs8ScIbLNiSYJEGKdJB9?=
 =?us-ascii?Q?qazhlD30bEYxfYrAlrJGoppHqwsSyVpUCuBU7+vPOYCV+ic8xztZtifkFUiJ?=
 =?us-ascii?Q?zuaYCbE9VkM/RxHsk9Kmq/0TXluFq8m4lEbzrZv2Kd1Z/25le3lQnVT1pEny?=
 =?us-ascii?Q?nQxBjjpjsxhHBQFzm20q1NBKyyKQU4VpUzTnDePzyFmPOOvDtKdimQ3cHW4D?=
 =?us-ascii?Q?cGyJVFC1Ba5yQxo+1Jc5Znunc+SqWW2nMc5oY9yF3PT0tf6Xntw4vYNXFGc9?=
 =?us-ascii?Q?Jvq0M1sSmwJHWjibLygo0SW04AzMI0n8E8+fsMNbRclWvtBh0W8jncDXAnBK?=
 =?us-ascii?Q?8Cu+MAwvAlo5w3S2OnNwb03zBxvG14jop+uYvC/ePLgIG0ikTcN7jU9SDGr7?=
 =?us-ascii?Q?sIH3RuNrgXB1LEKklKdxdoF4edo8o1UM8fXIWuk28YBBn3Iv4pgc2eCXXoCW?=
 =?us-ascii?Q?pj3/5bA7ivQiSUMZNB63zhUN80TKp+hckyqqEnH62KRm30kzGMbY6eMWwWpz?=
 =?us-ascii?Q?Ny7iVYxKMqIz5UHRBUGdYQkUzRuZpWlP9LgR84VGb/SoQQ9wCjE9j1BZQ3wZ?=
 =?us-ascii?Q?Xl87Np0ahqHzUJeL9hl3ibz7WhH0wHyy1hzrhtjeGx8vWJzNr1GynYRdxjh+?=
 =?us-ascii?Q?OyYLtKP9JPiuZrrJpjEHZsbZAXv5L6uxDQNJ4frhvgEqWleGDEZ+rsguZpz9?=
 =?us-ascii?Q?XmeRyFoXOuHnz6jD9MJxe8LbgSjzwjuQc2aOcvOrVGgUB9EeFgpy0AJ9lh/n?=
 =?us-ascii?Q?nF3kaslHBax4epLv1uxb3WdiGUdrCT65M9xRs8TqNAon8PnBi5bZ5prGMtJp?=
 =?us-ascii?Q?Of2ZG44DwEV6YQlktJXaTpEqc5rmEV30jiYJhgXGsepgILQZc15NcuZ34T+M?=
 =?us-ascii?Q?STrxATTnLs/4caKHDszRNrvli0Qhy2eLuBj9euHDSbOXLF4XURz9DSvcwQV1?=
 =?us-ascii?Q?ju/Rigxfx32G6xZdSE2b+Muk515sUse1aZU5RCM59W8eDo7rtMo0LlZRxlOO?=
 =?us-ascii?Q?oJPDhoWE5Xg2AEjpEVIJdz/9zy3epvuhZbZ7qGhHktBVUcjunv7glaPwF2m0?=
 =?us-ascii?Q?97c7wrtrY3zP3lyJjG0PzZ+wN2NMInlDDB/TwlGWNOMKx4l/oVLSiN9eld26?=
 =?us-ascii?Q?nGSKCkG3sic06KbLyWfVzHYNfM0oKwGfWPnjCfiPGbl6Cd9vLPdDXbIkM2Qd?=
 =?us-ascii?Q?JYvfFY7FC4ob8njbr7JiT0HEto0+3iTXmB9fql2epGVgKEi82zAz9HMTrBey?=
 =?us-ascii?Q?AfomnXyEEegr8N4QkRyGI4T9tdDZStPHh5pmZHi0xwuKxGcWPn7EtZq34xjD?=
 =?us-ascii?Q?+AYAc1dcBGrPT0ZGB1I=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab5f02c9-bf44-4c3f-6d3e-08dcb58e9373
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 20:38:34.5614
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0SRDkzDz1q2qR8YZ/9r8RkZfXPoNNAkdUs9Mjr19YbRiGmVPL8s9Mq0KiLxqn0ATwAHMrv4ICQbDi6G+rD+WPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9077

On Fri, Jul 12, 2024 at 04:34:59PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> The i.MX7ULP Cortex-A7 is under control of Cortex-M4. The i.MX7ULP Linux
> poweroff and restart rely on rpmsg driver to send a message to Cortex-M4
> firmware. Then Cortex-A7 could poweroff or restart by Cortex-M4 to
> configure the i.MX7ULP power controller properly.
>
> However the reboot and restart kernel common code use atomic notifier,
> so with blocking tx mailbox will trigger kernel dump, because of
> blocking mailbox will use wait_for_completion_timeout. In such case,
> linux no need to wait for completion.
>
> Current patch is to use non-blocking tx mailbox channel when system
> is going to poweroff or restart.
>
> Reviewed-by: Jacky Bai <ping.bai@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 36 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 01cf1dfb2e87..e1abf110abc9 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -18,6 +18,7 @@
>  #include <linux/of_reserved_mem.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_domain.h>
> +#include <linux/reboot.h>
>  #include <linux/regmap.h>
>  #include <linux/remoteproc.h>
>  #include <linux/workqueue.h>
> @@ -114,6 +115,7 @@ struct imx_rproc {
>  	u32				entry;		/* cpu start address */
>  	u32				core_index;
>  	struct dev_pm_domain_list	*pd_list;
> +	struct sys_off_data		data;
>  };
>
>  static const struct imx_rproc_att imx_rproc_att_imx93[] = {
> @@ -1050,6 +1052,22 @@ static int imx_rproc_clk_enable(struct imx_rproc *priv)
>  	return 0;
>  }
>
> +static int imx_rproc_sys_off_handler(struct sys_off_data *data)
> +{
> +	struct rproc *rproc = data->cb_data;
> +	int ret;
> +
> +	imx_rproc_free_mbox(rproc);
> +
> +	ret = imx_rproc_xtr_mbox_init(rproc, false);
> +	if (ret) {
> +		dev_err(&rproc->dev, "Failed to request non-blocking mbox\n");
> +		return NOTIFY_BAD;
> +	}
> +
> +	return NOTIFY_DONE;
> +}
> +
>  static int imx_rproc_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -1104,6 +1122,24 @@ static int imx_rproc_probe(struct platform_device *pdev)
>  	if (rproc->state != RPROC_DETACHED)
>  		rproc->auto_boot = of_property_read_bool(np, "fsl,auto-boot");
>
> +	if (of_device_is_compatible(dev->of_node, "fsl,imx7ulp-cm4")) {

I don't suggest check compatible string. It'd better add a field  in
imx_rproc_dcfg, such as need_sys_off

	if (dcfg->need_sys_off) {
		...
	}

If there are new compatible string added, just need set need_sys_off to
true in driver data.

Frank

> +		ret = devm_register_sys_off_handler(dev, SYS_OFF_MODE_POWER_OFF_PREPARE,
> +						    SYS_OFF_PRIO_DEFAULT,
> +						    imx_rproc_sys_off_handler, rproc);
> +		if (ret) {
> +			dev_err(dev, "register power off handler failure\n");
> +			goto err_put_clk;
> +		}
> +
> +		ret = devm_register_sys_off_handler(dev, SYS_OFF_MODE_RESTART_PREPARE,
> +						    SYS_OFF_PRIO_DEFAULT,
> +						    imx_rproc_sys_off_handler, rproc);
> +		if (ret) {
> +			dev_err(dev, "register restart handler failure\n");
> +			goto err_put_clk;
> +		}
> +	}
> +
>  	ret = rproc_add(rproc);
>  	if (ret) {
>  		dev_err(dev, "rproc_add failed\n");
>
> --
> 2.37.1
>
