Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010068.outbound.protection.outlook.com [52.101.69.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E97E2F3C28;
	Mon,  8 Sep 2025 14:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757343451; cv=fail; b=mmt1mRtokLkTU6PnKZ25mkFANRzsNORen9F2gCdaY8HX4m1sL7Xer6JaNE8wfsnjgS1YarEhmvW8h2lveIdF1/9jX9v40pgKx6HllMBxueMRpBuqn9+ef1Fetj2MKg62OISzlaJlUZwDgC4IkOUMEiq6+nGMY6l9sgg3NvJPfcU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757343451; c=relaxed/simple;
	bh=piEC7qyzfRWlyyYmTcpOJfeeasggxL9WntyVKWuBlAs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JnuNgPOeD+vACmUjCuNiCNaqdCdRMduY70gw8tCWr4VApZP/7ucXkBpu0bgbmfKFEtYZ+NeTkG6qQA9PaITg4N4zKzsP8Ogp5knCBY9F12NNtDeebY6j0hYO5CR6o84T7JQNmyWRTltrEzoMD/4i4fAAWgqQ7pvkn4TMDcve3/k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=iPcSG/NZ; arc=fail smtp.client-ip=52.101.69.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="iPcSG/NZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V/VIrpo1fbXsDQEz1Omziqgk2UVLeeBFkvQRABPHMTqqzQhGs7EnzRVbZcg0YNvmpX7TwN+yhIJ3urZZKDBcayiwwrq5OQGKNLbhq0yYcA2RGZCxHVhfQDN24nzleukUazh/m+LQ5DGtbVYyREz7xIpxkCFjFY6vxGU6CQG08JBHN2sRZI1vBvAGNUFQYJU5RpfiYMfKwEAWN1TUK6SsRDLfAdxQx3MsyeUEX4iHu6CNJnPDxuU8fbvzTnhbLQGwp0FDX1mM/YTzCtjBR4OpdNAk8dfjAwKEUA5qWCrU8Drg3sgf68y40hN1ZQiMn5oj+z2mu7/S5Hz54W5YtRongA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XYmP0elv6JjWKESwT23NsyjgWDLFOj/hS19njdLIqjg=;
 b=uK4mCUnzuqRyGTn1gorv4PVG4EFmXXAOus3Gcoyct31rCChX0qCdEGk8VpB9S+PTQE8Y+1FQMydkpBrYX4/2OohXz5gsAWZ4pvq6HpdIR58C8Mo1SOK4BpQjXYJdcaNW8c7UNELBR7k999T2UvjWiTM3Qa4mLDJOR3lb1Ub9DhVzoVdhmjw7CpcqhDZMWHD/Uk95GoZMDJZj/pu7vO3oUF3bWrDkRwbTbK/XIssniHyrsjwAZn1K8cHUMUPcTtxRHBH+gLaMQnlk3AicktlJVAu592ImR/cYrJF5WJQw5IBiiKAFo9P+M+1vKj++DZmsKGCV30nTbaq58Ce5Tnr7MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XYmP0elv6JjWKESwT23NsyjgWDLFOj/hS19njdLIqjg=;
 b=iPcSG/NZyaozg1tVznl03g5VzW2c6KSR8RyQZKZgtSvo5JTVTOVimMqaojTmS9ym3qLK1XnJhAXcz+AMIY8nwZZOaX8aQtTy+bIfn5yGH92B6T0tRMNl7vxetjEbkEEumatPM0fnv/CiLaJ6CgF+Yg/1fS53kaChwjpX0khRlphjadla4DksWqG5ouWPBRKb3Pj8toDpVdx6ujQ9WaFNPQ/SwpB0JC7M/38WTwEKdlW/a/SZVJplS4gHsP8xTN/oDOLB4zE2PrVeRqlS0Z8lmm077ayiYp/MibGWU++iH2a49VSCjwMmxXYMqRgBYHXyfGsUsuiJnH8MxT6MiN1UPQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by PAXPR04MB8911.eurprd04.prod.outlook.com (2603:10a6:102:20e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.14; Mon, 8 Sep
 2025 14:57:26 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%5]) with mapi id 15.20.9115.010; Mon, 8 Sep 2025
 14:57:26 +0000
Date: Mon, 8 Sep 2025 10:57:16 -0400
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
Subject: Re: [PATCH 3/6] remoteproc: imx_rproc: Simplify IMX_RPROC_MMIO
 switch case
Message-ID: <aL7uzA5HHrsaKIi/@lizhi-Precision-Tower-5810>
References: <20250908-imx-rproc-cleanup-v1-0-e838cb14436c@nxp.com>
 <20250908-imx-rproc-cleanup-v1-3-e838cb14436c@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250908-imx-rproc-cleanup-v1-3-e838cb14436c@nxp.com>
X-ClientProxiedBy: BY3PR10CA0005.namprd10.prod.outlook.com
 (2603:10b6:a03:255::10) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|PAXPR04MB8911:EE_
X-MS-Office365-Filtering-Correlation-Id: f10bdf4e-25fb-42bf-5a05-08ddeee80601
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2SJtCMlObU0XV8yHiUyMKLibjoJsfeY4WjtTtcKGjEUrvVS5PRYkbU7/ONng?=
 =?us-ascii?Q?kWIHH0e3Ig0vy71rN7Y2CDIaPO9+yqT1oJwebGCNnkLJ41jxKwADiJuEe5we?=
 =?us-ascii?Q?mHeV06EiTjibcZc9ghXdz4NU9ewjggR4YXVddHYZb/HVk1Z6XENtsFhvgmuG?=
 =?us-ascii?Q?O3vskqHtPDY0+Ym0Re3jSq/uvYCw3GLdvyclwZVKvYJUphQYu8LD5vhJsTtL?=
 =?us-ascii?Q?Rsd0cxwb9L6OQUq6XXWFOlCakgNYyYQJO1K7t6QurfM7CkJEWBGJIQ5aYl74?=
 =?us-ascii?Q?OqAa+3WkDoKSevppn5t+lTGpy60KaHScFfHzWZj0Z0vzCP7sO6Ng6g9kVMsJ?=
 =?us-ascii?Q?dezSdLupRoHCEnmKpSosNrIZd/txcTbd2yzBcxnMvykvaYMX4svvJv2XzQ8H?=
 =?us-ascii?Q?V88bP3CYx2yaMeD39uSLt+SKQ5KOlJHfACUa423Wo0eJ22SBTVtPzEu5lcZU?=
 =?us-ascii?Q?VyF3+JYrfgr7xMZ98FEJoccoPhr0aXNFPFSvkVISXXw9hnSrMV7qKeYsreyQ?=
 =?us-ascii?Q?VEaykk36Iwn1NKXqHqS8LJTjE1fMpJhCpUP2eUJWymlNScsNZJCs42EgCxMu?=
 =?us-ascii?Q?dyX9mHQRb97YMGaAMI07mtXwXUk1+MNayddg11nc8XgrBPnWL2Lh+nrRig1B?=
 =?us-ascii?Q?uVqSPr9X+rlbChntlpqc6NYQZS/9RHXpbg6sR6tIBvEn6gJ83jfPpE7SXnv9?=
 =?us-ascii?Q?Syl1fAggJktU6hP6D/HmS4zJtlDBO9mMxTUyrjT5fxbqk306Brli3o9j73PJ?=
 =?us-ascii?Q?qjQY4xfCsk/+yf/evPiv9yahUxbA+4aHiSiGSbdDZrvr4OijzId84Sc9WF2i?=
 =?us-ascii?Q?Uf1zvf4dZzzdkUi8mlqYFm/lbnhmwES2SIz3JSncWdJ5L4jH9bv0JBD5Jxt9?=
 =?us-ascii?Q?qEhi+/lE7CwBCT79A03NnEx3BmFg67HQ5vV9f0zEoutciDyilnolwULX/BRR?=
 =?us-ascii?Q?t+QQs/yW1laz0Ejo/cl3YALB1e1Y+/1pRsieyRKz2GbxM/d9BFrPDA4tXz8g?=
 =?us-ascii?Q?b+XLZDguwGO8aaGa62vn1XoPqA6Mn6ks9LhDRmmaRNc1dUCf9Mx/7sBDEjwQ?=
 =?us-ascii?Q?ik4q5w2u0/zoCtSpS6JDJiz1tQINPhTYsoNu4/0h2H+iPLYYPXn+DKF1/6h2?=
 =?us-ascii?Q?UrMLngMcMWEXovBmxiHw8s6NOCZiJtw39MbrtChkytGEwwi5BmUc0XHZIaEA?=
 =?us-ascii?Q?yrxchBVx1bk7mFGEKYzGI7N2p4rayhBgI8TMBzBLj4WQDj1BM+iEoRwbQzFj?=
 =?us-ascii?Q?4VuNPNxU2VE6halwiKQq1sO5V4fuKcp3PZ9l5cqOx+PHEpq9HxeXQ/34b0lE?=
 =?us-ascii?Q?NtqS09ZOrpuq0N5EJQqiwSs7jmENxy78Po8hzmk8303jm5mjhtqDWHfr/Ed9?=
 =?us-ascii?Q?2QtoG5SSB0fYwYn+8ludPQTH0OfneOGYVMXdAYuIf1sdAmWq3msKE4ivztEp?=
 =?us-ascii?Q?Mn5Ykode5C1ECrT2VUPqiuYtVr2SX1Kge79YPjBc9d7s073LdvXYvg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xU5DijXNn6I8zOBeO7qpYDXhe70BHjbup6JELlyybwdrgDuh2kOvI6rIS1CY?=
 =?us-ascii?Q?SseTZ+HIesMdjWfVp+kAi4gtkg/EUtAR45jggtGDbMKUGf1eyUFVW9JzBN1P?=
 =?us-ascii?Q?H326nYyfIDIUKe3AKMAmAINrlYIvaNej/jpQxq9FJjsY2EPybyTCl/CnJsTF?=
 =?us-ascii?Q?AZfkswUQflrlOHQuRaxwWJz0QlcrivNZ11i9TfGd0vtPhcfsXr7LVutpfzSh?=
 =?us-ascii?Q?3Q14njmYNaZX0oxAj8b57S6Bk/Nx1J+DexIZpTXnG+6okn3i9LiuQeLoXIru?=
 =?us-ascii?Q?z1dlgMiNgwb1TjuL5Bh1sMVAfKKJoUdvFv+wCECnZ3Ztdjo3sgwaHEA/imTV?=
 =?us-ascii?Q?RQB8U3MUiFaGpSNJ6p7Vt1FAfcqv0uJEyi+UfU4Id9cVn1IvpyXQC1ZV0mJX?=
 =?us-ascii?Q?dN9X/mf8gomlLinWHIecS+q7Ny4PyCdNhOYs+sM2qg/69gHZcrP/rIbgrjkI?=
 =?us-ascii?Q?K9WlDy1dqzU3YreVPeS2t5TJAfBeS2LgDs3qpkJ83dvAPzQs7z61gLaXSGvf?=
 =?us-ascii?Q?Ys0mUQlOYAxoT1T8Y/sE8PupETKS/bpnZSdUGAaIS7yz3usW+WPLwTP7vK4o?=
 =?us-ascii?Q?AT/5yvcwmpbF3K3FFm/sQ9Vn6yTs7qv2MxiUXFoQUgfernmBwIvUNdIALm4M?=
 =?us-ascii?Q?7Xsz0qkCnzvy6UbZUJIGdU/L31AyQV7vnVRjdjDGm3NlvLR050pdDp81fuab?=
 =?us-ascii?Q?oMtIjc0IA50U9oqt4fRrDBukPHmYCxUFjl/bOaiWTQ1aktbMJX/M3XGRa83Y?=
 =?us-ascii?Q?TQBhDLjwzrl6JJUzGCuoxGUFHqoEv370cdXJKYfvNzIX8+4lOIJuFo5oiP9g?=
 =?us-ascii?Q?lP0wf7tS2/j6BGdZ+6zzmVG3iwaxVe6rhsEha+JVWYIP3ji2sF8/2CMU+yyN?=
 =?us-ascii?Q?CpTapXyRPWmxIdguVHLeGLSgM7p6eH1Iik3xdEa04rggiL5WsF6oiWi00dQe?=
 =?us-ascii?Q?qxLtvlFyxAntQVCUcegx4U03C3AkMjwhfGezGGPqjblsGvsDr9JbL+IczTGb?=
 =?us-ascii?Q?m7teQ/AFyjahFIPnVbG+vojIRAp3NQvwc0WZJebWiSivkL7MdYP1FUauTxSO?=
 =?us-ascii?Q?rEBmJPqhFOFmRZtAGMrUUWjwf268HrR0zBLXxY0Py53ipx1oi1Bi1+SsKwEn?=
 =?us-ascii?Q?7qC6YG7K3GSKca83URo/FQpLnGeZ+NNj2QeBW9NKRifxjMmEBgZA7u8n6NY2?=
 =?us-ascii?Q?bVg5GXzLIY0qaKvi5ZyirgtEqUxWtgu6CpK540ljytUkyXmFt5k7j/l9wIYO?=
 =?us-ascii?Q?EAAsyCPf0g819xI0NJvy2ZRKLpPc8fWR7N8QRDnRia0DgAasF6LyS/hOKKRM?=
 =?us-ascii?Q?9dn/3wODpsFW+Vfw9M5dISF62qEqrPokyk9kTz924VJhS7oWI1jrrBe4K95B?=
 =?us-ascii?Q?Nqp9MwGE6lDAEJNVTn0RywGj4oQI9s/+qLvDiyD3Prtyt/5O83j3LjArvIAZ?=
 =?us-ascii?Q?zh4AiqNo6iy/OX9RgvC+UHXyDCr1gFRgVPNNzL6czmYLYKD391za7XibHyNV?=
 =?us-ascii?Q?KHUfwHZOAZG1/KFkzKZXn77pj/dccWeVV1r9FtgXJBQXrByfhhNSQAibZx8R?=
 =?us-ascii?Q?KU+DVSnr663KVSAeP7e0hPl3sthcw55EM8aL5+Xx?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f10bdf4e-25fb-42bf-5a05-08ddeee80601
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 14:57:26.6465
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JVYY/E8/XeV0/FCsk0V9NwmI4fCSQriUYafw28mN1amlOKLX51eWJrwIeEBMZaeE1xg/sWTrdOfCOO54plwwIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8911

On Mon, Sep 08, 2025 at 09:07:36PM +0800, Peng Fan wrote:
> Introduce imx_rproc_mmio_{start, stop, detect_mode}() helper functions for
> all i.MX variants using IMX_RPROC_MMIO to manage remote processors.
>
> This allows the removal of the IMX_RPROC_MMIO switch-case blocks from
> imx_rproc_start(), imx_rproc_stop(), and imx_rproc_detect_mode(), resulting
> in cleaner and more maintainable code.
>
> No functional changes.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 148 ++++++++++++++++++++++++-----------------
>  1 file changed, 86 insertions(+), 62 deletions(-)
>
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index af7b69d750deed734668cb413b29378e5ca7c64e..c37dd67595960f08fd85c0b516d0d03855cec9fc 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -285,6 +285,17 @@ static const struct imx_rproc_att imx_rproc_att_imx6sx[] = {
>  	{ 0x80000000, 0x80000000, 0x60000000, 0 },
>  };
>
> +static int imx_rproc_mmio_start(struct rproc *rproc)
> +{
> +	struct imx_rproc *priv = rproc->priv;
> +	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
> +
> +	if (priv->gpr)
> +		return regmap_clear_bits(priv->gpr, dcfg->gpr_reg, dcfg->gpr_wait);
> +
> +	return regmap_update_bits(priv->regmap, dcfg->src_reg, dcfg->src_mask, dcfg->src_start);
> +}
> +
>  static int imx_rproc_start(struct rproc *rproc)
>  {
>  	struct imx_rproc *priv = rproc->priv;
> @@ -303,16 +314,6 @@ static int imx_rproc_start(struct rproc *rproc)
>  	}
>
>  	switch (dcfg->method) {
> -	case IMX_RPROC_MMIO:
> -		if (priv->gpr) {
> -			ret = regmap_clear_bits(priv->gpr, dcfg->gpr_reg,
> -						dcfg->gpr_wait);
> -		} else {
> -			ret = regmap_update_bits(priv->regmap, dcfg->src_reg,
> -						 dcfg->src_mask,
> -						 dcfg->src_start);
> -		}
> -		break;
>  	case IMX_RPROC_SMC:
>  		arm_smccc_smc(IMX_SIP_RPROC, IMX_SIP_RPROC_START, 0, 0, 0, 0, 0, 0, &res);
>  		ret = res.a0;
> @@ -331,6 +332,23 @@ static int imx_rproc_start(struct rproc *rproc)
>  	return ret;
>  }
>
> +static int imx_rproc_mmio_stop(struct rproc *rproc)
> +{
> +	struct imx_rproc *priv = rproc->priv;
> +	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
> +	int ret;
> +
> +	if (priv->gpr) {
> +		ret = regmap_set_bits(priv->gpr, dcfg->gpr_reg, dcfg->gpr_wait);
> +		if (ret) {
> +			dev_err(priv->dev, "Failed to quiescence M4 platform!\n");
> +			return ret;
> +		}
> +	}
> +
> +	return regmap_update_bits(priv->regmap, dcfg->src_reg, dcfg->src_mask, dcfg->src_stop);
> +}
> +
>  static int imx_rproc_stop(struct rproc *rproc)
>  {
>  	struct imx_rproc *priv = rproc->priv;
> @@ -345,20 +363,6 @@ static int imx_rproc_stop(struct rproc *rproc)
>  	}
>
>  	switch (dcfg->method) {
> -	case IMX_RPROC_MMIO:
> -		if (priv->gpr) {
> -			ret = regmap_set_bits(priv->gpr, dcfg->gpr_reg,
> -					      dcfg->gpr_wait);
> -			if (ret) {
> -				dev_err(priv->dev,
> -					"Failed to quiescence M4 platform!\n");
> -				return ret;
> -			}
> -		}
> -
> -		ret = regmap_update_bits(priv->regmap, dcfg->src_reg, dcfg->src_mask,
> -					 dcfg->src_stop);
> -		break;
>  	case IMX_RPROC_SMC:
>  		arm_smccc_smc(IMX_SIP_RPROC, IMX_SIP_RPROC_STOP, 0, 0, 0, 0, 0, 0, &res);
>  		ret = res.a0;
> @@ -855,15 +859,60 @@ static int imx_rproc_attach_pd(struct imx_rproc *priv)
>  	return 0;
>  }
>
> -static int imx_rproc_detect_mode(struct imx_rproc *priv)
> +static int imx_rproc_mmio_detect_mode(struct rproc *rproc)
>  {
> -	struct regmap_config config = { .name = "imx-rproc" };
> +	const struct regmap_config config = { .name = "imx-rproc" };
> +	struct imx_rproc *priv = rproc->priv;
>  	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
>  	struct device *dev = priv->dev;
>  	struct regmap *regmap;
> +	u32 val;
> +	int ret;
> +
> +	priv->gpr = syscon_regmap_lookup_by_phandle(dev->of_node, "fsl,iomuxc-gpr");
> +	if (IS_ERR(priv->gpr))
> +		priv->gpr = NULL;
> +
> +	regmap = syscon_regmap_lookup_by_phandle(dev->of_node, "syscon");
> +	if (IS_ERR(regmap)) {
> +		dev_err(dev, "failed to find syscon\n");
> +		return PTR_ERR(regmap);
> +	}
> +
> +	priv->regmap = regmap;
> +	regmap_attach_dev(dev, regmap, &config);
> +
> +	if (priv->gpr) {
> +		ret = regmap_read(priv->gpr, dcfg->gpr_reg, &val);
> +		if (val & dcfg->gpr_wait) {
> +			/*
> +			 * After cold boot, the CM indicates its in wait
> +			 * state, but not fully powered off. Power it off
> +			 * fully so firmware can be loaded into it.
> +			 */
> +			imx_rproc_stop(priv->rproc);
> +			return 0;
> +		}
> +	}
> +
> +	ret = regmap_read(regmap, dcfg->src_reg, &val);
> +	if (ret) {
> +		dev_err(dev, "Failed to read src\n");
> +		return ret;
> +	}
> +
> +	if ((val & dcfg->src_mask) != dcfg->src_stop)
> +		priv->rproc->state = RPROC_DETACHED;
> +
> +	return 0;
> +}
> +
> +static int imx_rproc_detect_mode(struct imx_rproc *priv)
> +{
> +	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
> +	struct device *dev = priv->dev;
>  	struct arm_smccc_res res;
>  	int ret;
> -	u32 val;
>  	u8 pt;
>
>  	if (dcfg->ops && dcfg->ops->detect_mode)
> @@ -937,41 +986,6 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
>  		break;
>  	}
>
> -	priv->gpr = syscon_regmap_lookup_by_phandle(dev->of_node, "fsl,iomuxc-gpr");
> -	if (IS_ERR(priv->gpr))
> -		priv->gpr = NULL;
> -
> -	regmap = syscon_regmap_lookup_by_phandle(dev->of_node, "syscon");
> -	if (IS_ERR(regmap)) {
> -		dev_err(dev, "failed to find syscon\n");
> -		return PTR_ERR(regmap);
> -	}
> -
> -	priv->regmap = regmap;
> -	regmap_attach_dev(dev, regmap, &config);
> -
> -	if (priv->gpr) {
> -		ret = regmap_read(priv->gpr, dcfg->gpr_reg, &val);
> -		if (val & dcfg->gpr_wait) {
> -			/*
> -			 * After cold boot, the CM indicates its in wait
> -			 * state, but not fully powered off. Power it off
> -			 * fully so firmware can be loaded into it.
> -			 */
> -			imx_rproc_stop(priv->rproc);
> -			return 0;
> -		}
> -	}
> -
> -	ret = regmap_read(regmap, dcfg->src_reg, &val);
> -	if (ret) {
> -		dev_err(dev, "Failed to read src\n");
> -		return ret;
> -	}
> -
> -	if ((val & dcfg->src_mask) != dcfg->src_stop)
> -		priv->rproc->state = RPROC_DETACHED;
> -
>  	return 0;
>  }
>
> @@ -1143,6 +1157,12 @@ static void imx_rproc_remove(struct platform_device *pdev)
>  	destroy_workqueue(priv->workqueue);
>  }
>
> +static const struct imx_rproc_plat_ops imx_rproc_ops_mmio = {
> +	.start		= imx_rproc_mmio_start,
> +	.stop		= imx_rproc_mmio_stop,
> +	.detect_mode	= imx_rproc_mmio_detect_mode,
> +};
> +
>  static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mn_mmio = {
>  	.src_reg	= IMX7D_SRC_SCR,
>  	.src_mask	= IMX7D_M4_RST_MASK,
> @@ -1153,6 +1173,7 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mn_mmio = {
>  	.att		= imx_rproc_att_imx8mn,
>  	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8mn),
>  	.method		= IMX_RPROC_MMIO,
> +	.ops		= &imx_rproc_ops_mmio,
>  };
>
>  static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mn = {
> @@ -1169,6 +1190,7 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mq = {
>  	.att		= imx_rproc_att_imx8mq,
>  	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8mq),
>  	.method		= IMX_RPROC_MMIO,
> +	.ops		= &imx_rproc_ops_mmio,
>  };
>
>  static const struct imx_rproc_dcfg imx_rproc_cfg_imx8qm = {
> @@ -1204,6 +1226,7 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx7d = {
>  	.att		= imx_rproc_att_imx7d,
>  	.att_size	= ARRAY_SIZE(imx_rproc_att_imx7d),
>  	.method		= IMX_RPROC_MMIO,
> +	.ops		= &imx_rproc_ops_mmio,
>  };
>
>  static const struct imx_rproc_dcfg imx_rproc_cfg_imx6sx = {
> @@ -1214,6 +1237,7 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx6sx = {
>  	.att		= imx_rproc_att_imx6sx,
>  	.att_size	= ARRAY_SIZE(imx_rproc_att_imx6sx),
>  	.method		= IMX_RPROC_MMIO,
> +	.ops		= &imx_rproc_ops_mmio,
>  };
>
>  static const struct imx_rproc_dcfg imx_rproc_cfg_imx93 = {
>
> --
> 2.37.1
>
