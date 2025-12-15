Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010070.outbound.protection.outlook.com [52.101.69.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F24F308F1D;
	Mon, 15 Dec 2025 16:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765815161; cv=fail; b=aD4k60lOLf18W6ttI1TxsE43ezhFH6+hOqRzV2R0OxlQTJdjc5AAoXFm5A/dSAP4rqVVAG0UfsfL9hwFDBiv0so6tSmE2CWNy1KYCyO9kZ5JGjFXvqQmo5+CSfPUKQpC5bbLiUjvyJoUCpr0QIoaQKCLUlQ4GQExgOVP6ttwyRA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765815161; c=relaxed/simple;
	bh=PXIpqMu9v5UkYuwzb+5dS8Y6omtnn6lAaAzVvOLcXA8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NE9Cze6e/UMzvWnJzbsUIBr345pyj9gVo4u2wBpPgp2+elHF1BpCxB7OBr7x+WzVgdGgFFUEA3Zo7GCdB6nJvAv7v/Zu9XVKkNfiM/e5m1WEQMxsx1PmDnYmlCDHzjYoHYnvzgeJlnL94W0u4wCMGIeld2pmj9zj18pK/LtxC8Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Sivi1/fx; arc=fail smtp.client-ip=52.101.69.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Sivi1/fx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P5h1KUqyUzHI0fNB3dLukbjGXhCsQJfw/xfYEnMIgBg+jFkOT6fQerwHUzN8POpUUZaVVVt4teVzDkU3Tu1l+RcJvswJxyjbL0ldunvqlDhxxKzDKbkCjXuiDjYgBl54tprVT1LzGxlodA44gKYPjN/MyhdhoDFzYEXq+4KeXj9da2Z2+HgZ4J/0dp8wmjazhA/pAX3JltkQ1PqkP4KxoLS2z6mAeZXukJjJs522drZtMdU+WNLMdUiMXPMej9sVqZ18L6KrGMEU72wu5CRBQVuv1fvmlyLf1XhD2alDZmc7Qz/mFZVEoFS0c2UsrfRZomIjs19kZkeWCVA0N9dp5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sOCg7u2BeHf7gPpGgez82CqXXR+fcYEqNgOUgEOHOWk=;
 b=fxN4VgylGoGsPXg5NDJXludpZvJkojT4akrzi9ZllOyBMuh2vtoMF06BrRXs5zn3bit/kbOZk7xyeMIs1KCi24wLOxAb/v3Ktc0F2dB63QXFygt6YyBruQNKOxXjr7I1Nil9GZclvEpVnPPM2tAcihJ4nYOXdYqwM1jttq3dL0RN7O4rlDb1gMS4F3AlJkw+rBCvWG1SsuTYwiMMMto9OprtJyVEav0mIaTyN4hlhnUNXlMkZILzQWp9M1bC9sY8VeYZsVfVzOrFEEIF7Z8d29iZXsyAQP4qJXakrGQd6+PjC41LB29x1oCQUh/LP016ggSSlD9XfMlfS/S3Edm7PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sOCg7u2BeHf7gPpGgez82CqXXR+fcYEqNgOUgEOHOWk=;
 b=Sivi1/fx3IBeD8UGNr9iZ5DI9euMrxFkbRSm36PsjTT6YCIC40656+AQ8S3RZ3L2FYV0AkUfxBHoQpcfUgUFA2S2VQKQM6jNHbv/za/V42O0/mvGqL3RHpHURTNSf5nvQFhan3Ywc3+/Spto7eNpE+xQ7yRn11eJUG58BOF7jIUEg9grYmC3FD3QCttoNCfr295l5sQ41NatkoADF97fDNJuSbY4bd676Uf4aIzrZybvGmRwsSN1cMlGYraYsFFnbkgZBB1VS+3RZOsndLbF8/O4vE6i2XZVKrzezB4FpYeu+PU7I/K3pGIOoGmuJs37f/wlAzQUOuvG9dC19oZsTQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by GVXPR04MB10804.eurprd04.prod.outlook.com (2603:10a6:150:214::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 16:12:34 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 16:12:34 +0000
Date: Mon, 15 Dec 2025 11:12:25 -0500
From: Frank Li <Frank.li@nxp.com>
To: Jacky Bai <ping.bai@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	peng.fan@nxp.com
Subject: Re: [PATCH] remoteproc: imx_rproc: Ues sync handling in rx_callback
 for i.MX7ULP suspend
Message-ID: <aUAzaXp1t+fTVfyT@lizhi-Precision-Tower-5810>
References: <20251215-imx7ulp_rproc-v1-1-4e96cebc4bc6@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215-imx7ulp_rproc-v1-1-4e96cebc4bc6@nxp.com>
X-ClientProxiedBy: BYAPR02CA0017.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::30) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|GVXPR04MB10804:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b427a8c-e66b-4e9d-bb6c-08de3bf4c1cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RiLwlqukA4p+KB+3TXTC1DBcBybnD6JMgJ2u5IGrVGvmUeXJ64LmbSyQfkuH?=
 =?us-ascii?Q?H2R6A2sb2/Ak7/1KdYMJHJdVD4DTJ4cOuP5v/J+sXi0WLv3AP/NEzuw5z9eW?=
 =?us-ascii?Q?tQ/6Sty6BLy/mZ0R28Y4zyxFSK3IxIE9+OuSSEz8cT04LcJ3U0tF3A8h7HqG?=
 =?us-ascii?Q?kg4b1T5cRGz3sic6lMtGJK0IyWB4q3vJuLqhCYV9tPL7ji94JxQUdAUHCgXI?=
 =?us-ascii?Q?ECtLO7XrXh8nsMcBvEUQxXG9Sr6+PDZcOY7fv/sS9Be4Z5+b67qVpzHE+7j2?=
 =?us-ascii?Q?VqdxZ1fxSGnyzdcofyhe3XOH0w1YwyRO3sXRdJ69doZXMImaenzTHJyKTTGW?=
 =?us-ascii?Q?HrijSfwrtkjEIE7Cwxo/3Vm17aTRmR3esVYGgu0JDO4j/s82IvOeXnOQS0VR?=
 =?us-ascii?Q?H0tv/KC+BvYFvXrO5tWG+BrFUOflIBDMBtQnaVo7fyub7Xa7LZkNfbMyFylo?=
 =?us-ascii?Q?yIB3RBeQRw19IgMqrBjUTLIT5u05+x8NbcLwYr/9UIngfH5szvSgj2SOJFRa?=
 =?us-ascii?Q?PmlLcH9LBbzXtohYScNAYjcWZYnMFwYra7aiQBJ1q0DNFkTEHIF6mAfYZvMP?=
 =?us-ascii?Q?zH2hW0pCDHJwyTWKDkNuUVy9qCZ0xf2UbP99F1OW7AONHUHpjNsKtmcUqWfO?=
 =?us-ascii?Q?T69tI8hm5wOA7TVf+QQfYSPBITPa0p6dVKTY7yG9ge7jJn5ecLhZYCL2OXwU?=
 =?us-ascii?Q?980AqUBpSuhoHavgXzO0+gKLWLnp0WBzu0ZyOIIJqSAIrxzOhQjod2NZ+Ug2?=
 =?us-ascii?Q?4+9aFJMlQbBuX5BbxanEJ1DFz8xODKy0RoJkYtQA9vce5o4Nj3Ma08/aizyL?=
 =?us-ascii?Q?HpbaB+lH5Zds36A1S3BVTnWcDgEqwI0WRLIfO05oywpxDxorygRlXDfNsVIp?=
 =?us-ascii?Q?pQSrMSHyrNT41FwkRi9IMHpCQnRo8yv2IR9rWOxZ6pPbc+ng9yvvWy1klGiu?=
 =?us-ascii?Q?Vu4lo2Ka/fouwO7RMt93zK19V9lN4IP1/Js54Q1ojLrWIvJRdz/x8kMp5EC3?=
 =?us-ascii?Q?0Ch1/CFPN5QB29dIei7GAPj+BnD3JltAa7ClEgQNjst96EI1wV6LQfcGAQWT?=
 =?us-ascii?Q?CbByVcH0IZaLP3dNoZPRitjoj4vRkeW3JVAJv3XogZsc6dNq4Yv+1cYkCMx6?=
 =?us-ascii?Q?c73gI1D4w4e7QH6fx3toxHfsmBuR3arQR6rZAtKUMepQlKgHLntMLarfax93?=
 =?us-ascii?Q?U1H61S/T1rlWxuaLyoxCIjqJ0YP/0RysGyhyacFGMCUs75+xoeiSDO93QQv9?=
 =?us-ascii?Q?i/HQh3W75i1+ToGDS2TZD/v8mYCdTGD86VSBBBQRkdva/hj6vzD3IP4Tibj9?=
 =?us-ascii?Q?0mb1XitAg/lHpvbjqaD0uNY6q3lr05oXGr36FzLz88r1OtjQIMvU9IajynWL?=
 =?us-ascii?Q?mIVuliAeMRtOXehJXagPdXmKYptxHkHOBxRxGnbR7m/sgucGE+v58rV8KA2h?=
 =?us-ascii?Q?anxSkTcuZRU/utkNlnGrdK6t9y35A+fHiePQ7HVwvg7i2xAdxl4ksjFufexl?=
 =?us-ascii?Q?HAmkIwaHHMxM7NnH98SLYxILFd8aiGGUFc40?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yHcsJziyxf4W2phygzAlVUG6ehYGWam9ORx6QV2VROHnZSZ3RRN2yLG8cPlU?=
 =?us-ascii?Q?aYljUTLhWcXikGvcTkMkaa6JW2uHYnFbZekCZi1B4IFmiL1Fj8x7M7DmgbQX?=
 =?us-ascii?Q?QhFVFkPDfqrUqw6J0DbWkt3xBA6J2d1Gv1uwunRMVkcdvaW7ssyvSw9sEulb?=
 =?us-ascii?Q?5AwTBZJ+S8SE0ntaGoArGY1Jb6giZFlE0pahBjgGdE/ir+rxEpA3zevFsacE?=
 =?us-ascii?Q?P63QjQfR77NQl/QN4YYP117ELNc7eBa1IVfnIsTUCfRwNnWnXCobiYL681PY?=
 =?us-ascii?Q?un4T52C3rEEHcX8tPG/NevIdlp1uXfuT4uFtzyGgFn5bm64j9x/SM6NFaIFB?=
 =?us-ascii?Q?/yoc1d94YHWZgJZ6vCTL0K0Ya0vu94xZwhRjPVkrxS/QRB+jKME1rvJilDqN?=
 =?us-ascii?Q?ZZghDgNYkn0d8aL+dQiNAH9TlIAaqq8ISIpCmbXwQQlyWLEEf6k2MRR4FbAX?=
 =?us-ascii?Q?L2E9tQD4OralSfoLSd33NutB6Z7fQl/V/sF8cUsp3oLSWtF6lJe/VRxzaCGf?=
 =?us-ascii?Q?+TZWGG+z5/rKKoXXBNXfAb+jMNQK59I/Jn6pX/HeUYgeOcvwZL4JMdxg2dYG?=
 =?us-ascii?Q?cFAqU1CGJgiH43UVDNy6I92qJ65nEa/BldvabhbJ2ver4PsXQHitNXg9bYeN?=
 =?us-ascii?Q?/357t1y5A8BWJDUITs0gyffyL3CHqP5Sn5ZOtMpDSlM8lgGPNyJrLvjburhS?=
 =?us-ascii?Q?U2QhsX/FJOaWHFQQ4y9X+29i+zq0RD/Pk+G/u4+zRdnB09IgEgPDXEK+mld1?=
 =?us-ascii?Q?U3PTPmEIZElF/7bP6n9vRNmW2PIk3/q48uMHYGA0eqlT9acxwPqjCxIN/l7u?=
 =?us-ascii?Q?h2aSfd5G4b/O74pHoItxntnES1TLVF1vI9YLnfzqAEw9TGXaDwKoKHJ8WdsS?=
 =?us-ascii?Q?lBw5cNwHcpo5flf+PJJJMNKonOFn3e0KBjaBahDjQQXcPOI1r5sUEAZBB+NU?=
 =?us-ascii?Q?P5O53h3d9A8MlaeBXiMAvVCvepnGYGiHpfBr+Nynv0a0cCmM/uT0NuCxiCDB?=
 =?us-ascii?Q?JSgwzEQB+3rYoO8B1ySHNfaoLmi9fXw9Vt2KghE2jnWRpAX4z4yLSpr+OJ2V?=
 =?us-ascii?Q?Q0wWDksjWewhYRG9AnZINQiMo270D/DxUAn6TRVhR56ZN2ZGl2EQXWy3zTiR?=
 =?us-ascii?Q?SS31J+6YBghvK8hADzREjdFepIzU+GrgA4+SMp4x5lgai9m3oti3xsViSLBr?=
 =?us-ascii?Q?6kgyGF8CXuKWWm6SOJtjAcavRiCGEOKCeid1/VVMN2lmYDTOuZBZpXazl0d0?=
 =?us-ascii?Q?weG8WHUIfZ9CDl1a3Rf4GwAlkXxvqs/lkGSx92ZCarbksZyYC+QoC18K7aAW?=
 =?us-ascii?Q?k4UbfBy7ny+c0GTiEhCkUR6r5DhlPTiCDsAmRFIg2adMLI1Nde6sjPIq5NGZ?=
 =?us-ascii?Q?V0NSyOqIJBkSIbNlqJGZtJjf5EzVy5vtyZPBzRwsqAZq6aDQVLAMV/153s/9?=
 =?us-ascii?Q?YH9dbYbMn/FBkvEN4zvZE5qVMsrJNCwvrLjj9yfWDWhAq0ViClWXn5eFnqit?=
 =?us-ascii?Q?CZmArPZzLb1n5KWXOJbDhome0Kfy9f82tkW6pICfy5mBDwR9TdtlvLyhhmUy?=
 =?us-ascii?Q?2H/ZGOlLo1F7K2iHbmWEQfgfgi2LHvXtmWudVDwf?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b427a8c-e66b-4e9d-bb6c-08de3bf4c1cb
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 16:12:34.4263
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IHpgzs7kE5AIC+FbUiWWAuLYcTo9GMOJcViXW4KkCAoj0OmqaWuN2PJZ3e1IACYD5LfzYInx4gc5ZvhCSVPLEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10804

On Mon, Dec 15, 2025 at 03:26:05PM +0800, Jacky Bai wrote:
> On i.MX7ULP platform, certain drivers that depend on rpmsg may need
> to send an rpmsg request and receive an acknowledgment from the
> remote core during the late_suspend stage. In the current imx_rproc
> implementation, rx_callback defers message handling to a workqueue.
> However, this deferred work may not execute before the system enters
> the noirq_suspend stage. When that happens, pending mailbox IRQs
> will cause the suspend sequence to abort.
>
> To address this, handle incoming messages synchronously within
> rx_callback when running on i.MX7ULP. This ensures the message is
> processed immediately, allows the mailbox IRQ to be cleared in time,
> and prevents suspend failures.
>
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 49 ++++++++++++++++++++++++++++++++++++++++--
>  drivers/remoteproc/imx_rproc.h |  1 +
>  2 files changed, 48 insertions(+), 2 deletions(-)
>
...
>
> -	queue_work(priv->workqueue, &priv->rproc_work);
> +	if (priv->use_sync_rx)
> +		idr_for_each(&rproc->notifyids, imx_rproc_notified_idr_cb, rproc);
> +	else
> +		queue_work(priv->workqueue, &priv->rproc_work);
>  }
>
>  static int imx_rproc_xtr_mbox_init(struct rproc *rproc, bool tx_block)
> @@ -1009,6 +1015,38 @@ static int imx_rproc_sys_off_handler(struct sys_off_data *data)
>  	return NOTIFY_DONE;
>  }
>
> +static int imx_rproc_pm_notify(struct notifier_block *nb,
> +	unsigned long action, void *data)
> +{
> +	int ret;
> +	struct imx_rproc *priv = container_of(nb, struct imx_rproc, pm_nb);

	struct imx_rproc *priv = container_of(nb, struct imx_rproc, pm_nb);
	int ret;

> +
> +	imx_rproc_free_mbox(priv->rproc);
> +
> +	switch (action) {
> +	case PM_SUSPEND_PREPARE:
> +		ret = imx_rproc_xtr_mbox_init(priv->rproc, false);

Any risk condition if on going message during free() and _init()?

> +		if (ret) {
> +			dev_err(&priv->rproc->dev, "Failed to request non-blocking mbox\n");
> +			return NOTIFY_BAD;
> +		}
> +		priv->use_sync_rx = true;
> +		break;
> +	case PM_POST_SUSPEND:
> +		ret = imx_rproc_xtr_mbox_init(priv->rproc, true);
> +		if (ret) {
> +			dev_err(&priv->rproc->dev, "Failed to request blocking mbox\n");
> +			return NOTIFY_BAD;
> +		}
> +		priv->use_sync_rx = false;
> +		break;
> +	default:
> +		break;

imx_rproc_free_mbox() here? if other notify comming,  mbox is free() as
expected?

Frank
> +	}
> +
> +	return NOTIFY_OK;
> +}
> +
>  static void imx_rproc_destroy_workqueue(void *data)
>  {
>  	struct workqueue_struct *workqueue = data;
> @@ -1103,6 +1141,13 @@ static int imx_rproc_probe(struct platform_device *pdev)
>  			return dev_err_probe(dev, ret, "register restart handler failure\n");
>  	}
>
> +	if (dcfg->flags & IMX_RPROC_NEED_PM_SYNC) {
> +		priv->pm_nb.notifier_call = imx_rproc_pm_notify;
> +		ret = register_pm_notifier(&priv->pm_nb);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "register pm notifier failure\n");
> +	}
> +
>  	pm_runtime_enable(dev);
>  	ret = pm_runtime_resume_and_get(dev);
>  	if (ret)
> @@ -1202,7 +1247,7 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx8ulp = {
>  static const struct imx_rproc_dcfg imx_rproc_cfg_imx7ulp = {
>  	.att		= imx_rproc_att_imx7ulp,
>  	.att_size	= ARRAY_SIZE(imx_rproc_att_imx7ulp),
> -	.flags		= IMX_RPROC_NEED_SYSTEM_OFF,
> +	.flags		= IMX_RPROC_NEED_SYSTEM_OFF | IMX_RPROC_NEED_PM_SYNC,
>  };
>
>  static const struct imx_rproc_dcfg imx_rproc_cfg_imx7d = {
> diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
> index 1b2d9f4d6d19dcdc215be97f7e2ab3488281916a..0e3e460cef4ed9340fb4977183e03143c84764af 100644
> --- a/drivers/remoteproc/imx_rproc.h
> +++ b/drivers/remoteproc/imx_rproc.h
> @@ -18,6 +18,7 @@ struct imx_rproc_att {
>  /* dcfg flags */
>  #define IMX_RPROC_NEED_SYSTEM_OFF	BIT(0)
>  #define IMX_RPROC_NEED_CLKS		BIT(1)
> +#define IMX_RPROC_NEED_PM_SYNC		BIT(2)
>
>  struct imx_rproc_plat_ops {
>  	int (*start)(struct rproc *rproc);
>
> ---
> base-commit: 5ce74bc1b7cb2732b22f9c93082545bc655d6547
> change-id: 20251211-imx7ulp_rproc-57999329239b
>
> Best regards,
> --
> Jacky Bai <ping.bai@nxp.com>
>
