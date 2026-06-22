Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010051.outbound.protection.outlook.com [52.101.69.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0A7395AD3
	for <linux-remoteproc@vger.kernel.org>; Mon, 22 Jun 2026 11:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782127247; cv=fail; b=dIapSrxsEv3BLbI8UN4HmGBgxHpzvrLATDywTghvl12YbruycYe236H1bzDtal6bdnbPYDiksTG+I8mGnJgw4hOP5d2RM2pLC9q/HBYttaiAvw7IvnglrfnBM2hfwW25kfJiMjPRyww3mNPlhpMesHA08/VF3FXRWM3zQ1e6Axs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782127247; c=relaxed/simple;
	bh=4XLiLRk+87Zs3hm2BQZ/ykVxFPxL6u8SoJgFjmrlFNM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DMUYh+NmXh5CP+zTVX5VGLxrN5LUz/Z+qB8joslj6WX5/AP0Ao8mrhM82vggSFkOiZ9cVypkBr9dsVC+D2kro0YsrruWKzJ+f5S5ownXuw74QHakPyrBr3Xoyh/2ifloSl+DGJA6/PeECr8cGs4KVmuVZNCNF+5hwNCy+hYdl5Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=kE1dwQKZ; arc=fail smtp.client-ip=52.101.69.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="kE1dwQKZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VV2wlfccEIAM23k+k4GlYWznyG40QMN6Zu8wVVlmp3vbvxMXkZVVAJNDOeZsxJ7D2PMmNYDcVoerWwhuWt0z6dbBCN7dYs1WGG3UsYC8MkNP8JvFIwhjtKHcCOrKepdDJQlL/A2vt3RG4kYz4b6E5gfrBIKFcaXZKFKIk/Oc4Wz7F1LIVxe1UztxpuLuJerDK1Rp+yMQxHm6Sxu7rrb1SCgFwKybW8UO3jY0U7MV1CvwcdtTdN0m07cqOwZHpEb2dNy4r8CARtrDySAVhQ+bx9ZWU1K0dpRQHwlPWoJ7RWTfNRlG/5H9UTcEZAZot0uO7ODZt3lLHfiuzd94Q+lZ0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sc/B6wiF0kc9SOOcKX9/mC30ZDmPvdOcQYxylCdpoDk=;
 b=LbnnclhAmNBwL/xfiE5Nhxsf0VrBqp3Dai9OY9WEI8NlkA5dfzaHNpXGa2aeeexvFrShSm/cIyCfQ2ILWnHyijMTwLGDYqwbd8Uc92xlPRna8VlK0tHDAUj7xa0bZIy2mXdjR/DKxlbvY+qCRWhTvRGExCAc6kDRnQS0PDP3Jc4yp20Q7h5t5i7c61B3rbsQXO6c1j2jM46cuWzY32P2x4SAuXeunSgf6UYzh4MlbIFq10+R1kS2Qf0vkfSNxIWVKn0W3qF4lgDLokLemWpRkEs1w4kC30K/z3B0OeZ8hZNPF7VzF1FZ92H+OHF2/CxUmJ7z6V7dan184MrOoD4Xlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sc/B6wiF0kc9SOOcKX9/mC30ZDmPvdOcQYxylCdpoDk=;
 b=kE1dwQKZpYE/uavqI2U9G9ulN1l8rSKRUI91JQ69/Re2WswLOf+ePOSwbZlTiRTzZA8rgm+fcgBCN2uDh3mqWX9Xmo6rdOxpUfUlsKyts47FSXteqQ8vyUljbIbBGgKC33WVXZAlrPYC6PCTwl1vxpv1epwClHbgGlcwPvjZ5+a7dQDvsNy3Mlp2Dzv9F5rauqFJ8aPGUGP285TpoaM6jpi653INcg7Yy6IUBTYxr8PBjZkFQRv9AVzygdGZAUrE0usMb8jdDtG5VE65OCqCHJa1YZF2vSVpq4LdD+7GUlB6FdYxeDmIakmV6vZjJtR7ahw4YZBu7ZeeJHWhuEjUjw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by PA4PR04MB9709.eurprd04.prod.outlook.com (2603:10a6:102:26b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.19; Mon, 22 Jun
 2026 11:20:41 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%3]) with mapi id 15.21.0139.009; Mon, 22 Jun 2026
 11:20:41 +0000
Date: Mon, 22 Jun 2026 19:24:00 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-rt-devel@lists.linux.dev,
	Bjorn Andersson <andersson@kernel.org>,
	Clark Williams <clrkwllms@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v3 01/10] mailbox: imx: Forward the timeout/ error in
 imx_mu_generic_tx()
Message-ID: <ajkbUNkn6MSw8txc@shlinux89>
References: <20260617-imx_mbox_rproc-v3-0-77948112defc@linutronix.de>
 <20260617-imx_mbox_rproc-v3-1-77948112defc@linutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260617-imx_mbox_rproc-v3-1-77948112defc@linutronix.de>
X-ClientProxiedBy: SI1PR02CA0014.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::9) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|PA4PR04MB9709:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b9c75ab-c532-49a2-4374-08ded0504b4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|19092799006|23010399003|4143699003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	/UYkdyHatYGRdfyBiQD3WnrhV1p36cmaDl7U0QwU6Vu4SRIU78cjfozom/ucZsa3/nzHvF+YWxft6eePsK4FcPSYCwRt+ROEpfMwpftzZdN4dL6UnebwgpyO8zfi1Hm+TTGkerT6XXeHLLRe7E/zEMSFg3bDdCfAqonO0zjb9KkBLpR28z9vzpbp4W6Ess8LroLe/tRKZgO7cKjd3iATxrtKHXt/16NDKeXUUEPNf6G3tAzsna3wMLc5Vd5dUKXkT7Jxfzl1R09QdmZDDvNGGKfIA+f3DRO21f+7VKGpFpsoct+vucO7tclDwSigza/IJx4AXlljl3z3D/OqQdqd0RasvsTAqf1+xkviNEdYv5mCiuWnHENCdKmco3X1YKiBRFxH74KY27ufIe/6l8/uTNrfe9hOU2uB6pU1U5bf8/TdtaK1q/7aViYOYGfw/ETKe1JqmNKnBDudqAssxWYkx/VvzIP/3YDL/m0ujNLY/lfOBahN83Ka737jHkts1Pi9JhKAutzoS5HvWuUm3/Zt7ws3uS0lKiaB2zCcoljw1oXLwBeZt3qB638nrWos2vIF4Gndww3RQtFJRL6SmD97vIDO68Li/r47vV6VjiH5k8gCV/CzxwpFwXF+VfedMXpcnPcAW9QJ6HhP2uXt3rQBu4AzAK+oBS8hVbFEtfuAjkQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(19092799006)(23010399003)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EOXCED7ejezImvXJQnNmb8gHJhiKd2cxDca3uouBezyP6ts9r0knS5KAKodL?=
 =?us-ascii?Q?WCOammnetLmcUSeHUtCBq6qWwcfULCI8pJwMufU1WbZTbKyTTKReJV5dTpse?=
 =?us-ascii?Q?mckcbFLggudZgism1fBe7cn5mw3vUxhUQjHwUfvTVdqZHyI4CeANP6QE8aoN?=
 =?us-ascii?Q?/iMHGahGVh32uMc19wNsnLCGAw34haLg55uVuqJ3HIBukJjdzetkj8ctIMsH?=
 =?us-ascii?Q?OZtKuSCi5Wlw79G+QaHzJyBQej/NJYheu6ChCg4NmLjRSS1U8B/Ig832+NNX?=
 =?us-ascii?Q?y3IhM0Eg6OSnlY70Mzj8UzBeIDUf1H3zPV0l0rKSo2Cg5ikWiqzhhlVDpy8P?=
 =?us-ascii?Q?Ar4shSlK629vRJ9sbvd5FQsGMTX0WnDiPPbxrNsTLZg+6IY1ng8AyfNlF9Ia?=
 =?us-ascii?Q?xEqtYeVW9vYg+E/+8eVz+hN6JNlCe2khbXaSGmyTRJB0Mt3DH9A9LuyQmLaY?=
 =?us-ascii?Q?JkZN5R2eYshwp9QGOSlo4fYmLG+XdxIXjyjXlVxiQMMY2pBhu11mpJGgLpoZ?=
 =?us-ascii?Q?6cLNcShQO6QU8Lp/bletpBhKgTUCcz7r3KM0wdqJha5vxg/XZ40cLd4FW5sV?=
 =?us-ascii?Q?eTo4USpFkX2hMyf1UH8a+pSArhTd858QohaejImuKd+IinhGEo7bg3F1SEWt?=
 =?us-ascii?Q?izlFXSF8gnKxnLrjtaeixQGe1F7+JLekFaORs6U1J6CPP9WmVDTd8JckJbPe?=
 =?us-ascii?Q?NGVcS8F6l+A3Xp4cJYgGf3McfiuD6foH3BVCGmEylxcL8vhw2eB2cPeAtcNj?=
 =?us-ascii?Q?QuxGBbiaXz24n8YNxTSYukoc5Nf7JQHAQB96D49Ugqy+dXZddNuUmJH15uI9?=
 =?us-ascii?Q?fZL32gHWdPbP2WK1DlVA+fPpa9g7V4/99gA2g5HFmS24ReGYdw7N4EyGscBe?=
 =?us-ascii?Q?TJzQsYnxR8/0rSiNi1qA/vn2mqSRC0gBLzSe+vWvF2UYcnqPagPCCL2TpcJK?=
 =?us-ascii?Q?8/ZuPbgjfyEcyM5mqnca/xaeGW6gcvKMmS6gNaAQnn6+p//dNAnvblsKBh4i?=
 =?us-ascii?Q?714Gpn9ZPWTdMa1zxCs1ozGWjcRCcTDJ57eLgkc8PIutYUqo+Vc5w0SZJWAz?=
 =?us-ascii?Q?rWZxrzpLv1hBSjAQm4J1pydYZbf+2UGmsJmhjufyLpJzdHb60ZJNOGnbuStg?=
 =?us-ascii?Q?3BIt0kd9CjhbqyjDSwtqadUmt56IX5GTKo7vsEiu2Wk8/LceS1ARvtyTb8MR?=
 =?us-ascii?Q?M6/CBT1gfQf9Mgr80hc/MUUSNaFI2APfs/mtcOOn3QhUxwSssVl7Vx0gJZ9T?=
 =?us-ascii?Q?8YFltED4SPYcgy8zhdgegy0/c46V8iP0ihWiIBq/L0G7kJxGaV3LWfkj6I7y?=
 =?us-ascii?Q?3YbRYG+wAJLObWAetgw9KPiJcUpqoqSSP3o9uwbTkD73QP75/0mDVfmNHwqL?=
 =?us-ascii?Q?Fagx+9n44Cm1RWSClkdwrWzUJzfHyMVpW8T/6jdlILUTHgIunjBZNtnGxMcN?=
 =?us-ascii?Q?5ew77MvQdug2kdcO6bOsFRJK4DRdVanExf2++SSsi4JFJCQj72bItbxESlvc?=
 =?us-ascii?Q?bmrsnfrCZEkLB8R5g9KRUJE9SylAq5YxjIzIv1dXAznAscQbp73M3ojjCNj3?=
 =?us-ascii?Q?wHds4MCLlzYrTbHYdZ39N0IO5d9iLbgAAZ85RJqANTxe2ZsTphBGeGVjk5Jf?=
 =?us-ascii?Q?8A2zrQGvbdu1rl+9LO86iVNnoHa19ie5/5OMKzFQHZ2BH8PW11NmIQGr5C7B?=
 =?us-ascii?Q?0E+38FRK7asXX2TRe1Kcz0VmqP5yCjapAUBdmrjmevvtl1xFDkSGqiVYffMk?=
 =?us-ascii?Q?7KBEi13bC0LsPKd2xlMfppeEsMXfrGAgmdwj0cAhDm1iXHjeA2lU?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b9c75ab-c532-49a2-4374-08ded0504b4e
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 11:20:41.4751
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gNiVLXLxLdPCXU4gweL8xSkgitkvWtUuJER/3mI8PTuqkpu+xvUOHeB/qUoaZ2BXdQwXs+exvN3uYPXCDDd1i75cZ8k5b63JcoQiZMqUgi5OITe9S8P4EUatoLMqwS+B
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9709

On Wed, Jun 17, 2026 at 08:55:26AM +0200, Sebastian Andrzej Siewior wrote:
>imx_mu_generic_tx() for the IMX_MU_TYPE_TXDB_V2 type polls on a register
>which may timeout and is recognized as an error. This error is siltently
>dropped and not dropped to the caller.
>
>Forward the error to the caller.
>
>Fixes: b5ef17917f3a7 ("mailbox: imx: fix TXDB_V2 channel race condition")
>Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
>---
> drivers/mailbox/imx-mailbox.c | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.c
>index 246a9a9e39520..0028073be4a71 100644
>--- a/drivers/mailbox/imx-mailbox.c
>+++ b/drivers/mailbox/imx-mailbox.c
>@@ -227,6 +227,7 @@ static int imx_mu_generic_tx(struct imx_mu_priv *priv,
> 	u32 val;
> 	int ret, count;
> 
>+	ret = 0;
> 	switch (cp->type) {
> 	case IMX_MU_TYPE_TX:
> 		imx_mu_write(priv, *arg, priv->dcfg->xTR + cp->idx * 4);
>@@ -259,7 +260,7 @@ static int imx_mu_generic_tx(struct imx_mu_priv *priv,
> 		return -EINVAL;
> 	}
> 
>-	return 0;
>+	return ret;

We may need to use atomic API for TXDB_V2. For the patchset itself, it
looks good to me.

Reviewed-by: Peng Fan <peng.fan@nxp.com>

> }
> 
> static int imx_mu_generic_rx(struct imx_mu_priv *priv,
>
>-- 
>2.53.0
>
