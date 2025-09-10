Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012011.outbound.protection.outlook.com [52.101.66.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485CD327A2C;
	Wed, 10 Sep 2025 15:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757519629; cv=fail; b=q1QQG2wYQb22I1ZSqBnaLy5qMMf2BZg+AiZo7f61YSa8KS5CtStSPyq9fSfCoOoWa6TJKD3oKe5t/EXXXDyM2q7srtS4VLTL+pNCT13O6plj61Xu/9djBjP3PHAoK5zHJxuSDYvuCuUyXpPhHNmZPxSMB6VPw8hWkYlV+jw5qNw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757519629; c=relaxed/simple;
	bh=GiHVsl9TQD1UF6S2Z9QlEv0vo7GWrDyF8q16tjVBppg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KBMWlzEVlpvhAnxkOO+gc/DSVVGod6MMffjhDkMAbBXYGxiWZQWZ1NTvvZJQGJIR50Rciqe6CammISqrw0A9UbKinkGZ+wRZ9m0unKDnki8J8WFdHdToJkXOtNNb5Co2PxN8QILWXlCGDhWr2yBWfBHL2gVdWaBxWkG38PbMhAc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ZYtoknMh; arc=fail smtp.client-ip=52.101.66.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ZYtoknMh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OMh9Ie9Rhx9wGrauCrbYZdE2tSjtO4FmW0FQ543H4dngv6XBSIFhVlrTRwSV2Tq2h3ZgFq/Ma6Fb7f5Lz0NYpRHKpELSQQCgqFCaCJIWyxTrn5quM+RRVe4LNYKJsP9bDtc2ObE8jFwxKyUotE9JjtHj3NgT6BNVG32J0UKKVO2+MmbpnS88cF6DUQN4eEt9nH6GIN//Z3Q7b0nyZZYozBt4ZmXg4w43bC/QNOiTtLIVlSfRz7EvTlDOrpewaNGvanc+XlXVHa2GUUkjXLA5VNjy+kkU2C9N9bt4wUINlbFCl960Y7ab4K7agRLB6TIWojn63HLrvTzzZeX61NNOWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VsbSfxJLNH4ZcnNZpXIHWNsUkdGIFdm8R+njon8kEj4=;
 b=ugXJjwtRROqltwXAHD1pLXDEjhQ0ULs8nhBgBBgtl7Lojzxl7UXVyELDsuwvx6tFEPkLimBgKG/4Qtlo7H1jWYOBtsHxlVizHhvfd1UUtCoU4gd9pzUcBebMI+BBVCIMxIpIPfdlSGpy/hPd9VqFW1B9+NHfM2+w0kfFz/SzJDxrxnoOr0b9YiQ71Yh2M98NgPegWSSlU7//P/cwXsqm8b1uAZ/zoFnkdFBOyafxZd5Zf2OFoEuA9BFKPbuU0c6Q4JJ40OwZ8pFQR8Yoo2hIiGjS7EZQwv3KxnW+MI8EeKbN4k3O7ytjQu8t4Ici37HhT5SQ5D4yPMWfiL3uhOqjIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VsbSfxJLNH4ZcnNZpXIHWNsUkdGIFdm8R+njon8kEj4=;
 b=ZYtoknMh6Ns0CjB1+5qDW1RwRew0O5glk4B4wnoo/zzXVkvyC+mhKtBdS43NyHEnz3cYhemwd/3i7MlTsskgpJu8OMpmGIlDreMArL6zhd3QTXJAxVJRW3U5USOmclWuRk54altmxNtuhfOFi5T5MdcTHWV5GLQP/fI6bzeJCLfHU+1xE8JP41wGxMtgLmTtBAnwJe+KykadCt1uHyOfeYDbK0hzsAWhOuTPz8y9h0E1S5vsiYcrMRJMuAEvMD6Fhuqiz35FMHIgwxFUBQhtXI3hIXpNE81rQeT9FQYKYx07d+xJyMbJhW6cIYJlVdXRl7ySSRGUqJItXtWQIDbcPw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by AM9PR04MB8860.eurprd04.prod.outlook.com (2603:10a6:20b:40b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.15; Wed, 10 Sep
 2025 15:53:42 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%5]) with mapi id 15.20.9115.010; Wed, 10 Sep 2025
 15:53:42 +0000
Date: Wed, 10 Sep 2025 11:53:34 -0400
From: Frank Li <Frank.li@nxp.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Hiago De Franco <hiago.franco@toradex.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/6] remoteproc: imx_rproc: Clean up after ops
 introduction
Message-ID: <aMGe/gwmFqjoFszg@lizhi-Precision-Tower-5810>
References: <20250910-imx-rproc-cleanup-v2-0-10386685b8a9@nxp.com>
 <20250910-imx-rproc-cleanup-v2-6-10386685b8a9@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250910-imx-rproc-cleanup-v2-6-10386685b8a9@nxp.com>
X-ClientProxiedBy: SJ0PR13CA0089.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::34) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|AM9PR04MB8860:EE_
X-MS-Office365-Filtering-Correlation-Id: ecfb7436-aa03-4c52-f0ae-08ddf082373b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|7416014|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aHP4GlVVtFOxOIY6fcKnz+KQnmLgx/QT6L2gZXhZUaBUdO83JZYFVIjg1JV4?=
 =?us-ascii?Q?LEYTCiYN+mppj7S4q+Uc2tK9W4IpUFRWwyHz/ixNDS6SDieaoJ+A39LN5RNR?=
 =?us-ascii?Q?AxTlmcg/T1Zfib0Oy3RCkIp1BJ4QRDLXGH7BOQiBjZeCQm6RJcbDMJC/9tg4?=
 =?us-ascii?Q?T0oKmLTNC2PAxOQJrRgzq1mYg4kZbs2Y5A8kbNMfL/AjETZVwx9lX6mJMBX6?=
 =?us-ascii?Q?T9GPB3z0NOVmdZDz4lRYblU0s0Nhhlc8hwrPn60v0tk+fxxB+jVb5WSeRTou?=
 =?us-ascii?Q?fQ1e/pdS/GK5qt9pwEbddq9GdNkmlY9mDMIzCdGtzc6sXT6HdgLSRnbQcB8y?=
 =?us-ascii?Q?jRc+UzswmNriwqoC6KpUqMpuWPOXZ5MSAWrDfiLDfB40DUIAKnUsMJ+sMLDU?=
 =?us-ascii?Q?pv7LhEjHELftkmvziop1ApyV2haFiSifSejQsYnR7kAG1BpocturcpayWC3k?=
 =?us-ascii?Q?qVOrbxVq/4lYBMb1MnMVD4KJGU4AjqF2VfbS+feYaozWiolTNQYieQQO4voU?=
 =?us-ascii?Q?esiPjyp18nTx0rPtFL/cH0DVqL4naq3q4ryCcI8WaVmpkjYf/rATEHSVNd7I?=
 =?us-ascii?Q?DXmlDr8hvYkS6pPJdxw7bU6r9KB3HRl8ho1yASFxDb2Z5Fhm6ImFQ7LM1uo/?=
 =?us-ascii?Q?y6qEWCVEpWvk9AP6l8dhWzIi6E7USV0xS0vUHUhp59WbAH8MiDJpKqkH1vx/?=
 =?us-ascii?Q?cAfFziegBOLxUfLAckH2fIkUj6hbN/pbggjYv07NbD65awhgwB7kN9zCRQ54?=
 =?us-ascii?Q?oVy2V1cCCyuRnX5QAYv5qX9WrvD5sOCpUqdhFHHnFZaYnHKUHShhmfva8Yyx?=
 =?us-ascii?Q?ZNLeQvLBno+1W8/vxAI2aJ+Pw1BJXO6zN0CYB+4w4TsJm5hvUY3V0XiImiQU?=
 =?us-ascii?Q?gVQ15KdS/2E6HEi/qeRXIa8/StSU68J1CIuMqS5Ah85dws/IEmv4NDeE4Ho9?=
 =?us-ascii?Q?zENzQDJwwqGKb2VxR0a0recg3cZaF3zRDM1ex1NljHlKNuaW78EhqX5e1oRl?=
 =?us-ascii?Q?qoSGOEU5rrcr4vQhgMzjrYnOe4QxD53Akh0+WqYy59XSmyfOvugMEqCUDCU/?=
 =?us-ascii?Q?dJ6NzLEdEN2P7ffd7uT8t8EtmUWNVI7ePqDHJriY96SqJ6qvS77ix8qTBAmv?=
 =?us-ascii?Q?nWeSgo1DrpI+vx21zAOznemQVLfO0x02JkDbxfgcMS/TIBSn0wWzA4vCDfvR?=
 =?us-ascii?Q?V5nBOeYg5U7h5ATkF2372g/Amdoi+5ktkV5wtYKuEiDvsvyg1LWzZY+l1xZN?=
 =?us-ascii?Q?ojUfbgRLmuPLRb1kshNd8hT58TxuH4vME0/f7TLrBwhHQpvbo1+w0V2BjwxS?=
 =?us-ascii?Q?RdojDpWG2jAwhLLb6gI05arlsX+BzHEAewm0xxJbUFJqJMs/erFcNA2cmDSW?=
 =?us-ascii?Q?Wh/5ISXMDfXLzrkn129CR3sc1GCxSY+9AFiivvJxWCBKZ6bEYJrI/SVfEtZw?=
 =?us-ascii?Q?OnhrL1sNh2LtN2jcAsSAUw1u0+IOyoSqN/jI5glsAajC4d9TH60BPQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(7416014)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cy09l1ji9krdWzQw3CHia0fKCNI2qQGtga/tnn2g3+D79Ti/lvti2kdGyl2O?=
 =?us-ascii?Q?oJx4pV3OwwJ2Af+WOoa9fmMsX5b/oIp6jcwI2Suf0V1MwpO3F1U6IbsE59m8?=
 =?us-ascii?Q?xtcEPyYO51049AM/0YfpJa/oii/W/bI0RcOSrRqVvyFPbizdthEjN8U2rmpE?=
 =?us-ascii?Q?wQ82OwPJAgnrkskMHxUKDdi/A5EkU1G9jhHx5J7L05CAedbY/VlQq/muz/cC?=
 =?us-ascii?Q?WMFbvsl/fci0EYdh80D+6si3qGzQjDwBcWgm9u7UwAK6blT2NINgdecEsD7P?=
 =?us-ascii?Q?OweoeqfsVPbS9zMpb915kUY+CvsdIJOCzW+rzWcepdDcxs+Npnd4KjkoISka?=
 =?us-ascii?Q?BTAJ6iW3QHM2KPRTpu118mpKUiN1lwllzOfYrEjIzUQJl88E12Alhh8h1PjL?=
 =?us-ascii?Q?kGz1DsBmC0z+gjG1+VNJ/ik8P74vhXK9CX9GI84SB7PwqX3z45NoRKFrKtYH?=
 =?us-ascii?Q?s35C81DpBCCIwTsCqOYl5O9AexlaN6thNvXfC2F3ox0aKA/ZDOpwW4GtKFXO?=
 =?us-ascii?Q?0A/PFEhzJnoY27gnZWoFlFOReNwcJ3eLtJ+qNzlP5/ikFkj/pToza+Vk18X5?=
 =?us-ascii?Q?deoShP7KE+OCe6sAK1NeFVNj5HOZcAfMxQaUKz22Nryxl+C7nc0PKA0epCNW?=
 =?us-ascii?Q?cjmvyNOcCInTz3qq+lU2KiYWVYJw81zPN8Jgz3Wujt+Og6CB8c5AMnrdsquM?=
 =?us-ascii?Q?1kesSZMOU4l4ZCbbl0vgWyvkY6t+ksIhI5sDr+WnDpWjiQ+knHAqbfR+U5Om?=
 =?us-ascii?Q?x5Arh6Nxxxz6N3tgYdFApOkBVizhls8Vk7R5B6lyVXtEYD4Afakzv80i0Z1A?=
 =?us-ascii?Q?L+XxwZW08yDxEJDPMO2M2uZ3jFnXQIMjVNyw41+euFgn8v9LJAuWUAShbnbC?=
 =?us-ascii?Q?/Yu0rVCZFGb9Lz3CsAex7RnU6dDfSHfS4ycCRXTOEUOPPSetv+VG2gdYuUmq?=
 =?us-ascii?Q?UeHnUvnQdMWCbOTbgMFkA+Rk/7AZZqu0PggLd7i+UJeiXkOVBuMeyUsA4cPC?=
 =?us-ascii?Q?oLuaW68Q9YEfSR/G1+0wOaJkbz9NrseppA667tpiZyICiknXRbb8rLQFj1eu?=
 =?us-ascii?Q?kxV55rtOMXPR5mMVblG4lLe7L3Ei8HGoGtHwLm9g/lHahjETnI6a1srEJhR0?=
 =?us-ascii?Q?IqqPl4TW+UV6/6veXDFJS14jCXYuMfWRr+SAm9bPCblqw1ztbbeVSFyogfIk?=
 =?us-ascii?Q?f2mDFcqlCPg+gcN5notl5VM7trxxb5R8Sd3sU/zQKtAhMXRClshtZhkAykVz?=
 =?us-ascii?Q?D1UkvvITPCL4sNhUTI2N8O8D/+89rx9GHg3+TG6hE+ojbX5SsI0yt5hx3mkh?=
 =?us-ascii?Q?ah5PXwCABvMm28WcdCgdreAttl1b191d/1UIBEKIr/LGX8Vvo5OzUZHTGyJi?=
 =?us-ascii?Q?C1CO5eVh27prA3Okep0oIZBsUcOhDxcBLVvb8h4JcGySAz/JaQdX2QYcmIP8?=
 =?us-ascii?Q?824vo05vdWTnGjURg5ccg724WbrJPXdaspuyuLIv2mzuHl8ebiN0hC03d7dj?=
 =?us-ascii?Q?6FhZBBEN6xDp5lyUr9ReID+DuxFpc8slk0dMU5ChIh6R9FXPWzUhqNFBMeTy?=
 =?us-ascii?Q?cY3W8JM7+K1+DL5CzVVhtnwYIiRr84F0gKe/XNmT?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecfb7436-aa03-4c52-f0ae-08ddf082373b
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 15:53:42.1783
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kHMgrUhQTVJ9vIwkbQ/rVGzphtqhzDBxoAzeTQZBoaqj8olZosv86h9/Nv+FjiZAb+G2z1RNswu3BQz1GTwDFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8860

On Wed, Sep 10, 2025 at 03:11:50PM +0800, Peng Fan wrote:
> With the switch-case in imx_rproc_{start,stop}{} removed, simplify
> the code logic by removing 'goto'. The last switch-case in
> imx_rproc_detect_mode() are no longer needed and can be removed.
>
> This cleanup improves code readability and aligns with the new ops-based
> design.
>
> No functional changes.
>
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 34 ++++++++++++----------------------
>  1 file changed, 12 insertions(+), 22 deletions(-)
>
...

> @@ -997,18 +989,16 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
>  {
>  	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
>
> -	if (dcfg->ops && dcfg->ops->detect_mode)
> -		return dcfg->ops->detect_mode(priv->rproc);
> -
> -	switch (dcfg->method) {

Can you remove 'method' in data struct also?

Frank
> -	case IMX_RPROC_NONE:
> +	/*
> +	 * To i.MX{7,8} ULP, Linux is under control of RTOS, no need
> +	 * dcfg->ops or dcfg->ops->detect_mode, it is state RPROC_DETACHED.
> +	 */
> +	if (!dcfg->ops || !dcfg->ops->detect_mode) {
>  		priv->rproc->state = RPROC_DETACHED;
>  		return 0;
> -	default:
> -		break;
>  	}
>
> -	return 0;
> +	return dcfg->ops->detect_mode(priv->rproc);
>  }
>
>  static int imx_rproc_clk_enable(struct imx_rproc *priv)
>
> --
> 2.37.1
>
