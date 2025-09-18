Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012008.outbound.protection.outlook.com [52.101.66.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE8D23C507;
	Thu, 18 Sep 2025 16:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758213601; cv=fail; b=aIujDzfE+eDkKpFUZwfaKvZtDvdsTqmZR2JN3cEjTuA9n7wD9nD9bUqAQyUPMadc85HfKNAvEQc8gET2NuELwN/b0PqK7tKu9fVR7GB/ysKBcSlZw8bbkfzNiWlcDseNWzsf7elxhbCxLbsz70OKWrO6RZpDyPvPtoe1254p8EE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758213601; c=relaxed/simple;
	bh=RcFeQmCvdet4+GmNHq5gHSY/E+vsPJxg16X6SHsQ0CE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hALBQU0g5btUNIuaHSNLNR9UCkrzpqOsy2iGG0dIe/7iNslrqzyuq9hLIFazeBphkm/6ZL3H1+3zPheXkzTdWZQiCFaJ7seBp6/0Ano1YszvRUovjPCpg8CQC7K/yxBp2GEA6aHaGgkfcLHURTy6e6wXNHCRoblYxB7miwr7pI0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=P9aFA/C0; arc=fail smtp.client-ip=52.101.66.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="P9aFA/C0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gnWDkb992tdCO/ky3cZBhRzpIBRqU48gLDSBXx/IPSEAjSpghZISEkY5UYoIGE5UcVHy9+5k9TkHMye1OL1FWuwzl1Khx6+DYHDZho3yXG0jNMGHkMjO72FQis4pFUJOPw6jFTVCunuhuVQC7Nabi6jbhDHlINvTNq3ZeHw6LFAaEr2DCyRoUGBGAh7s/qDtPUaFZQdowzt8I+dCR6SJzJe90iGOBMRVlKaAAkk34pr0zqg+3vEHLuRSdeBVpw+mOi3qhbHh+lyAFW4TMDrZrHR8zHZExl7z/o9zGApyRU1c1gUSYNS9hAkUepTTXf63+FjexVi9kJzNIYhhQ77Ekw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WzKY6Tenzxy+uXQj47Ehb5OMuLPw1de9q/ck7NVtrWw=;
 b=N9JOvKeItxHz+ECGAD2xoknGbZQwaa6+5aBM/kdg09VaNKc5ufaRJIak0Yu9e52c9JX8UUceZF/g2sP9toqt20jtBUY4s7Gu6KsfVJdVQZw5+lqTgs+2lPT5DCL/zH5zwxGVbnl87ynp5bdIJVunGB7o/+XaycseZFrzk0FgrM3s7bu1d/Bse//BLZoaTRpZSqRgfqIGeUsUD/5IzRVB39/GhTMPVs26Dq44ac+CN0etyaT9YkHm9N4nu5tT1ec0Arai5XEyBTMVISxZI0UUpJ8JL63JikaBqByhgomCVFX3L3wpkqbCdYNcgMUZRo/nxlF3ofDwylb8dAPVcOlFLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WzKY6Tenzxy+uXQj47Ehb5OMuLPw1de9q/ck7NVtrWw=;
 b=P9aFA/C0Wphw4CmD0KVlKABfRwNLRaQMhPnoU0VeROpyRzUb3h9MZzQuOS6GTBXHzvJsVbxShiXQCSUIRlMrXo2kHY67yCYcH0v+Z8Q53Y3ilC1N1MzVPBeKE7t0A/4zslJjUT5S78OhWqk3HPVk/ViNiGwGyiAZKdcSY5IIrKftsz3pG8/eXFLV4b55JsNj7Aa6nwDHyuHJFUd4cgO27Vs4LVvJ5EmwZU9VQ8veiUcOE7e3KqMtRoV3hBK/iInTVEyhqAr9c2lGDKPT4eFhgeyLJA2AwbwPILuwDyBF+zdzNj+umFB0DWPMgtnoPuDv6FQ5HerGOn9/NVxp6qVNtQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by PAWPR04MB10031.eurprd04.prod.outlook.com (2603:10a6:102:38b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Thu, 18 Sep
 2025 16:39:55 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 16:39:55 +0000
Date: Thu, 18 Sep 2025 12:39:47 -0400
From: Frank Li <Frank.li@nxp.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] remoteproc: imx_rproc: Make detach operation
 platform-specific
Message-ID: <aMw10/31gBxSNYuJ@lizhi-Precision-Tower-5810>
References: <20250918-imx_rproc_c2-v1-0-deec8183185f@nxp.com>
 <20250918-imx_rproc_c2-v1-2-deec8183185f@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250918-imx_rproc_c2-v1-2-deec8183185f@nxp.com>
X-ClientProxiedBy: SJ0P220CA0018.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::28) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|PAWPR04MB10031:EE_
X-MS-Office365-Filtering-Correlation-Id: c37c4e4f-c6da-4a63-d029-08ddf6d1ff74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cSHKMLV5h1hJtEAz9iPVf8PSF6KBA8bS6zYHLtuR9mfNvUE0685KSu4oH3iK?=
 =?us-ascii?Q?betYauqxKWeJXdbtq9awCxgcZvF7fCD+2t/PSPABB9R/VNdCegsc1s8mjrKW?=
 =?us-ascii?Q?e3RBBZ5qLDrPzUo3Ztw1XleThMZ4R8klz+Ay2sgPy1DrxxC0Hp8ximkchlTn?=
 =?us-ascii?Q?oMIwqp/NDPJEyhPjSq5GdllMKwDpZjZXg4TxEa7709YAqFmL8WX3UX+QH43p?=
 =?us-ascii?Q?fv5NpBUWdoa0eN6VKvW4Ko8QsaV8WtEAi6eCL76myVcXqNCIwu+YpAHXNxJh?=
 =?us-ascii?Q?kBfDGhMKIedr5m77r406MDNKwHgXM/YQ7L5tM7ug9cLl3aJvqBkQN/nCb5ol?=
 =?us-ascii?Q?mdtwS7uxvXf8eLHW2VqwmWaXQfH1MqMq/GiGhIr8rJBOGUU/la3Tld9e2OO/?=
 =?us-ascii?Q?ot+vWMYyw2OPGo4/IEyhhgo0ae414sPzoG6wPP3cIx03rh3WvDh9rVDg47ZV?=
 =?us-ascii?Q?Zw3a27Co1wkcfnQXDJjZwRkKjSR2zLxndbHmEPcdVjTM+7jpvR0+NWXSCwhb?=
 =?us-ascii?Q?EmPDf4+dRMcY4lxxd7y2oC/G5su2cwx6OhZMIYOeKzLiDwopi5su9FIsbsYA?=
 =?us-ascii?Q?UgSA3nHpyd51Eud0VrjxZOyJvqIDycA9Otwg918Xf+MpXUoXQxTwxOqEMOzM?=
 =?us-ascii?Q?yLQFmAlprCk2u5IqGjjYaECFoB3P3SSzgzEhFXjGdHQkslJPrqLyyx1EDGLY?=
 =?us-ascii?Q?Z213P793kQ/c460yGbbLtKiN1+gPXpGLRakFJ8h3FLU9M7+f2hraC0sBXkFX?=
 =?us-ascii?Q?2nAO5BiSozCFHB1EzmFcK8Bd9X2Y4DG/oFhP/FjYrCbij9Si6gzjU4G7mRLx?=
 =?us-ascii?Q?hXLxybQ950upZLBhJSR3y3Gb3qo/UQKayLSTDKa7hK04tGyPIrKb4QCURNtd?=
 =?us-ascii?Q?lGiNv5bbYXbcCPTuRDBwczzNCVhqwdqYhjdBVsc0IKMDID7oQ3IibAZGPGdv?=
 =?us-ascii?Q?74S46e5UrH8UR3cT7XF5aqrWaQRpApMb+cGNYdOG4kNQuESl8V2Q7AwpyIhp?=
 =?us-ascii?Q?Tr42wMhUgnZdxel4VGfotV2z6HkOeGALXuX2ZBgJP6zsSjEnW6nFkhnWmLg0?=
 =?us-ascii?Q?EJetE8aZTbKm4vxMvrw7N+fC5X08qJEBq9E28VMWzsxV8s/Sl5I0jwWH+Z4O?=
 =?us-ascii?Q?DvgXbKeDSB4bE8Hlpa+ZEakqXQebWqIEK8bI5lIz+TbhWcwLQMj3cq77+kMZ?=
 =?us-ascii?Q?OYyWg0t6I3gxZu+8m0lWAxBTlbgMYEUdMtQnPuihEb8j+Zlc8oYAGQiLZ+uV?=
 =?us-ascii?Q?+ZFJq39ltFxdDn7hQ5JL9QSPUwyB4kfh82Y+232ZP8Z5LFCS92B2T5rZqnbC?=
 =?us-ascii?Q?q0WQ3gOMpWm5ViLXsef/GgL7RRDap2x3q9ZpxX5jFq54OmMb2EVTckc6D9vw?=
 =?us-ascii?Q?cY9v1WOkLIPmK4CtxKPlK8x+hj5X95zBkXnAa9BbTP5qD8t7+y0htn+HQdZL?=
 =?us-ascii?Q?Hu8b9teXmYSjbJ+Z8cpJTS5HI+FKTf6oi36gCs88UeqPSymft0cxUA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9621.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?s6LbzQgD6M6Gf5XqPOlltsRiKirboScnGODfXQebc5GW7pIpvbUvYBx7CBFg?=
 =?us-ascii?Q?2W9UgSHPNWCHOQFqlA5JHVESgiRBm1NjCwsCNu10SZz+vD1bKDGxkHkc3jsn?=
 =?us-ascii?Q?8WW47w+FdDSSLT1899FLfwx48Ysf+m1kPRW3Ctr5nQpJN7EkS61SQZKqaYDS?=
 =?us-ascii?Q?gBiLK6JRTPrPdGhIeuGIyVolNxeZK4AqY9JOTP9tYMaVuh4mXPybsuSl+77c?=
 =?us-ascii?Q?gc3iP0EQUIecJpaH7DQdjcWrKLp0oIdGzREYakz1MkiSDBOwGj4fHllk3Ig+?=
 =?us-ascii?Q?Fdlu/kzVo7AM115cUoFSY2tkBjLGhizlB3gxcrJR5YRyGx8CMrMR7x9ropYX?=
 =?us-ascii?Q?NZlJA433ViVPDGny/4uhxHJTCH6h9+eSEHfnUzyVV/k92+26XRqPjyGhHlDt?=
 =?us-ascii?Q?LL6bJ14K7oH0GtQBvq1RwZkvQGR/Yv9N/2hxAE6YKxGwjLwA2OiFCgXJS+kK?=
 =?us-ascii?Q?0I0VHQ62qZcRh7lDv9DnK0zp91ez5UZ/+pNLFWYQmyHaAxVx/+gEwW/o5tAp?=
 =?us-ascii?Q?jnTpCR183OH7lvl3Jn9LfcnrIbV9Lccc6knRKQOGQ8wchmZPhVW/HmFhDCKi?=
 =?us-ascii?Q?q62hvPafisGER6jRuK+HPZ1v+vZ3UXGz1qPUyQPifoCh96C0AXeXelm7a25I?=
 =?us-ascii?Q?f3Paa+vdi2jwsUto4Tv/n7fhV586m2ApgNj0ubsTzm3VtVNoZd4ijpXMVx2G?=
 =?us-ascii?Q?H5m9XxTaXIO6nMdAYFxOITwXVHCqYWq79W7tLeYAERApMw3h9yTjzqIrP8Z1?=
 =?us-ascii?Q?sIQcW061E/R2wmm35u3OWu/icG2nn+witNW2F+o49E2/Ly6GR2IYeLcueodK?=
 =?us-ascii?Q?azU7q82FjUenFtVWYbWpttxPMgX3pZSwCdZYUhwyW/xr3GbGBxphwcXJL11b?=
 =?us-ascii?Q?YKHxGaHSB9fc6jUpmVHn3cqNdTwtmjO5obhXo7mZ10KQZbvU1nm6Fmi40VxU?=
 =?us-ascii?Q?1WK8z6+FGTO0pIdawRAgsm9rSYVlouebolAROflHTMmd/9gjvFeH8plpun5R?=
 =?us-ascii?Q?+kA+/52wYvMMzeb0oM0bd3O9JXyZtleunZgXjtKmcx6ob80Q7sB6ZierGhm8?=
 =?us-ascii?Q?w8EQnqDqc4G5CV5/jKo2z43wxCVg1oiTp+uUvRqPZICPzaHTG2BlnSWXSmYn?=
 =?us-ascii?Q?cJFVrFOA9bTXEErFL7RXOUwckLr6MykkdfVZZCmAO4Pp0PfYbjriRFD3bdB6?=
 =?us-ascii?Q?6o35tysOqHrqL0SFGRlun6htlhOJLkBztP3tQ5KKVz3daOOsl3Cd1rB/B6gm?=
 =?us-ascii?Q?4MwPNaIvJLoG1zQiAUE+lbGq84OQKPtRN8/rGatxE6UE3G0h+ztLnhHwPDcz?=
 =?us-ascii?Q?1QtrnxZ7NpSDpdT8huVNukPj0xKhc7gbSzvUXVMdbXcQQl4nbqal9ktcJc8P?=
 =?us-ascii?Q?wh3PxAlQwKHE6i65yyWYFJUqcdQuxEuRnext80UbcsFMGTi6aiQX5LNXrRX+?=
 =?us-ascii?Q?OJQPcZQAfxl9IlmpWrIXg1DwjXBYkX4mNurkyKuhvGiZjv4A5/203QMZ34ME?=
 =?us-ascii?Q?kTI5b7up8LlLnWLjM+95VFqVIT6zl2WXS3svUxX6P/3SB+EVpTZd3TOPZ7DE?=
 =?us-ascii?Q?+MkkTaMsAtJs9V8AwPpcpElVd8WZQE+G8WbLFNtm?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c37c4e4f-c6da-4a63-d029-08ddf6d1ff74
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 16:39:55.2987
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Az/8DWYvUP7gNNDR+0jRjO6cKXErVw7kx3P+TsEKx0IbF8S+r+LnM+wR9SG3PL+71dLEhf+jC7jrQRnTxPOy8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB10031

On Thu, Sep 18, 2025 at 07:51:17PM +0800, Peng Fan wrote:
> Refactor the detach logic to support platform-specific implementations via
> the dcfg->ops->detach callback. Allow finer control over detach behavior
> depending on the remote processor management method, and make it easier
> to add detach support for new SoCs.
>
> The previous hardcoded SCU API detach logic is now moved into a dedicated
> imx_rproc_scu_api_detach() function, and registered via the plat ops
> structure. The generic imx_rproc_detach() now delegates to the
> platform-specific handler if available.
>
> Also, the dcfg->method check with IMX_RPROC_SCU_API is removed.
>
> No functional changes.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  drivers/remoteproc/imx_rproc.c | 18 +++++++++++++-----
>  drivers/remoteproc/imx_rproc.h |  1 +
>  2 files changed, 14 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 71617b20f9d0ae698e7f655aae22e8895434f32c..74c958d44611b66e024180d69d71daac5a2f9e76 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -575,13 +575,9 @@ static int imx_rproc_attach(struct rproc *rproc)
>  	return imx_rproc_xtr_mbox_init(rproc, true);
>  }
>
> -static int imx_rproc_detach(struct rproc *rproc)
> +static int imx_rproc_scu_api_detach(struct rproc *rproc)
>  {
>  	struct imx_rproc *priv = rproc->priv;
> -	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
> -
> -	if (dcfg->method != IMX_RPROC_SCU_API)
> -		return -EOPNOTSUPP;
>
>  	if (imx_sc_rm_is_resource_owned(priv->ipc_handle, priv->rsrc_id))
>  		return -EOPNOTSUPP;
> @@ -591,6 +587,17 @@ static int imx_rproc_detach(struct rproc *rproc)
>  	return 0;
>  }
>
> +static int imx_rproc_detach(struct rproc *rproc)
> +{
> +	struct imx_rproc *priv = rproc->priv;
> +	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
> +
> +	if (!dcfg->ops || !dcfg->ops->detach)
> +		return -EOPNOTSUPP;
> +
> +	return dcfg->ops->detach(rproc);
> +}
> +
>  static struct resource_table *imx_rproc_get_loaded_rsc_table(struct rproc *rproc, size_t *table_sz)
>  {
>  	struct imx_rproc *priv = rproc->priv;
> @@ -1152,6 +1159,7 @@ static const struct imx_rproc_plat_ops imx_rproc_ops_mmio = {
>  static const struct imx_rproc_plat_ops imx_rproc_ops_scu_api = {
>  	.start		= imx_rproc_scu_api_start,
>  	.stop		= imx_rproc_scu_api_stop,
> +	.detach		= imx_rproc_scu_api_detach,
>  	.detect_mode	= imx_rproc_scu_api_detect_mode,
>  };
>
> diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
> index a9cba623560c85ea37e47401c392c06dada500aa..aeed08bdfb5619c7afd7201589f417cfd6745818 100644
> --- a/drivers/remoteproc/imx_rproc.h
> +++ b/drivers/remoteproc/imx_rproc.h
> @@ -35,6 +35,7 @@ enum imx_rproc_method {
>  struct imx_rproc_plat_ops {
>  	int (*start)(struct rproc *rproc);
>  	int (*stop)(struct rproc *rproc);
> +	int (*detach)(struct rproc *rproc);
>  	int (*detect_mode)(struct rproc *rproc);
>  };
>
>
> --
> 2.37.1
>
