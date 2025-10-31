Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010028.outbound.protection.outlook.com [52.101.69.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F5C2F83B3;
	Fri, 31 Oct 2025 19:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761937949; cv=fail; b=YyX5I2bEX3UQziDg22jEhhtaa4AufQ44at4QREWwNg/BB1D0+jN5U91XShvpxq/xVaPpkcVMIFS8FQX3ydmAW9hxIBlVI4YO0WDf/GT969Wyh+N4DnfEnnOZtbFrflkEATjaY780KLE/pCb4zSLANuVhtjYKMCT73GUmuun4pdE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761937949; c=relaxed/simple;
	bh=RJa3XEN7ehIf7XUTX233wzH91mjoTprzwyH5d7T4YXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=I7joXNldkFCMvuFxfqQPdXQXuWdLFnGpvqKOZSBxp3JS/6SJZdA9vEGNyrM16TlTx1LFInDLYsClOUaBgVzxhD0H0maJtgX9C8X9FU8RhKV+QxtCEQ6jqqifdDKW2vVmvZ7yrbZRGl+NYgOIr4bWK4sA5xvSKZgc2Qjkf4pD660=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=LallnN+f; arc=fail smtp.client-ip=52.101.69.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="LallnN+f"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zPuTdqLnbpr48nly9O81frhuH1jSwGhpo9sQQXtbnk9VYcAvDLh+kHGbTb/Ba4cmZC6Tuta2Y6Q3AT3pc7ULEq3gVXpJTqsnRTbatVgizQm64tcJRAwz8KB+uucYD7SLSVmN4NY2OeREgO9xefPYshUi7P1DhBO8TasI6IJePLTZ5JbJmLeA/ExqfysqUdwRgAs7uD7eZrfLYqkTWxewVW+9lXB1O13HNX9e71ZjfosLgt84w/O7+8Hl9SL5rpQYHHcdHo7nEHwNGWFNIyD6aTsXR00toaAQv8lJKn1dSBBJqoolE+KXy2/roy0w7zN7HFoV2fLVJEImGw2gjTq4rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PeR9mrX20efrO9KHLQ3OaSPVOkCQfG09Kblnypb7XEs=;
 b=ExJ17USaYhtHJZnnKOuC3IXdaywsck3lmWbSlmFUY7Zdr2bHvohnmgt5uxQHg64V72mmQjgYTz08HtU5kE5bvuXT+Qf5aSXJEd5WHtTb5DQObbzGQBO2+uxfceMU/Sh4HsStOokWk8GP21nlMaSNNyXmF7kSACocvp99hJn6Gx4rWnXgxUtDQUKpcbOlmpoJ+v3VemC/e6uur1vr3bL8rNPBwJuuDK0iyiPLGqwzlFzjezV37C5vCWJ7hGHO0TN+X/5ub8qRdCWboAo5GgJ+LyZcE22+yz3gA5vD7AlOuwI4hamPp4LNZNkeNbBxKSGzYtCrOU/AmQU6DIG5EzZJpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PeR9mrX20efrO9KHLQ3OaSPVOkCQfG09Kblnypb7XEs=;
 b=LallnN+f2dDR/c18iDcqZXpjQNiaEBj1tGjLYEsb7CYSvA0NqX/IOJPcPeIZ3zdMEhXGpnTGpWTgnuE2Gli4z0LkreFpiW0hJEE/CFiU6l9A6Vr5Ael1zigzB5aHn/n+id385UjuRREpDeHaEBoz9dOFmAk87d2egEat2Pm4F4kBSTdz5m4+KZzI844rvOuBsuIt/L85TfKzewu1zTUKZVsK6PO19JQdsAu3lCKGHK3A876jx3IwGlPESHWSPevshhoqHJg+PIyVukWSVyLA3bReZ/xHicH8ER3oyR2sopuXgbNdH5OECXub+sQL98uUxafbK4GuK2fLgTSw1j3Wbg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by AS4PR04MB9244.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Fri, 31 Oct
 2025 19:12:25 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 19:12:25 +0000
Date: Fri, 31 Oct 2025 15:12:11 -0400
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
Subject: Re: [PATCH 09/11] remoteproc: imx_dsp_rproc: Simplify
 IMX_RPROC_SCU_API switch case
Message-ID: <aQUKCwK9tfTsejyN@lizhi-Precision-Tower-5810>
References: <20251031-imx-dsp-2025-10-31-v1-0-282f66f55804@nxp.com>
 <20251031-imx-dsp-2025-10-31-v1-9-282f66f55804@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251031-imx-dsp-2025-10-31-v1-9-282f66f55804@nxp.com>
X-ClientProxiedBy: BYAPR07CA0107.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::48) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|AS4PR04MB9244:EE_
X-MS-Office365-Filtering-Correlation-Id: 03cac561-a42c-4601-78a7-08de18b16ce6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3/z/ZXF1MC6ub3OB5k2pf+C81bVvmd6unT1TTEnv9o8b/OhSawg21fwG+cNc?=
 =?us-ascii?Q?jgTuTS5UhdeX1aOgsl/xBSoxqquT4xg0L4KqHNguloo8pNz5m2eShEosuYXz?=
 =?us-ascii?Q?ONbve4HFeBHnrPo/9nRmkzgnbuHIFxX/FdlC7dYU/Tu8cKV2nFaRZsfF7tkI?=
 =?us-ascii?Q?slZbSJPXtLFkOI2/N2Nz5N9dT47kYaCFxfwsyKLTnMmYIygFJG5X1acr8LAl?=
 =?us-ascii?Q?BWMgfFQXpcMdwZJxOsFVmqSxQFoVwCm9Ry3H6cz9k0hkNwJwIp8zoabSlMzi?=
 =?us-ascii?Q?v3WmkGN/Fr3dQGwL0va/ICc1hSU8mGl5PQRsi3AuHklF93nHnkToq0nhKheo?=
 =?us-ascii?Q?RJra4QcXAoLTkdw5sjJ4eK/R8MuxocEtwIze8dNHKOVjmCqCWXZIaoBzE9Hz?=
 =?us-ascii?Q?ovFDDOu6/ZIc53X2o+nje8HLUMS+zLUbmYf/fxPhcQGPSYRBzXb3jJACNcNx?=
 =?us-ascii?Q?p1XqNbJ0qE0KSLy/4oQZ0kA/sR+0ysxF5L/Arodd54NgSNhD85UpNpcJXOj9?=
 =?us-ascii?Q?WHNpOoxSVD6dSCwxuQ89KCEbbID4Adb5uGbvehlN+FO9oZhXEu/czBwLPn6G?=
 =?us-ascii?Q?hRoOuqZdFVj7nWLGPU37/3I15lSw/iJ9MtRbPs7mLLkgKMyoJAU6Sr7hmEXy?=
 =?us-ascii?Q?uMoZIgWBKa5wnZ52F486knIvpX2gvMuqYoqtwvl8wyrxaA9fHupj7nXv1o4v?=
 =?us-ascii?Q?JkwNzxSSTQ+MMmJ0zWYhbTZ04K39JvzHGqmtgVz8y8eETcuzfvqoCB1fs0XN?=
 =?us-ascii?Q?mLiA61XY12+eL2LgIzvq40Ak179w722lISE66PLhfftn4qVTSY2PEmlcr87n?=
 =?us-ascii?Q?x4IQp4U233VrKiXsfCT+Rmg2I5S8hAwD5yHrM+7rhBHrQgE5iLvcVgadUDfb?=
 =?us-ascii?Q?S1DXaLJD6ho88BAawrMNDaKjUxD07lNQ0tOweLG4A8IqXWzlgoegZOhiwcXP?=
 =?us-ascii?Q?Lz6pZA2FgPPs9QhpiUFIjy6VveeUZusfP0qNCQlm1XjSL9nRZokRIgan6O+w?=
 =?us-ascii?Q?lqKvJ8J0MhPH9TCNv3Y87CthQDCBAwwI8aP5nWWgGU5jEhMm+xRToHC/5wQb?=
 =?us-ascii?Q?BhCm2RKRz5qvZAdgw0zEIGCgOySCX2gqGtqFgW0Za0oycFfL8Hl4W0jHXb5w?=
 =?us-ascii?Q?+loJqdwVVRXVpXJfrzd5t+ScXj9Y7l8BqQR3wKim1lnemulbwrCHUxuT7dtq?=
 =?us-ascii?Q?7qa21PVTYxZNmAqhbw1WP+XrGr51DHtYyghEXNph/wd3rZo1iXoJKmVucuid?=
 =?us-ascii?Q?bwVQ7UzQnBbuHaqdJ/brpCPlV4SMTg5Wse9qDvwSfnw+dSdOazQOn4PhSJmu?=
 =?us-ascii?Q?J5ZsEx/HRGYHCjlsuaRiccuBrTu+OohmI8mT08WRP39pH1tfESQ5OduOOUuw?=
 =?us-ascii?Q?2Qs0S5VYdj5Jzbz3VFiVlHGOV1h5u3x1ksgAZWiRRiR8PHGeVE3oTLZkAEf2?=
 =?us-ascii?Q?uWo7mz/FelxgJcQx7zAegqc4V35bm5MZx41Dd/PFrhaG0Sb7W6NIdkKVTxvc?=
 =?us-ascii?Q?QQCkjnnMSAir3i2jpUzZOwQOuTqsj6i/fLpK?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RVXnmtxBh+F2AWHo4rI6zTz1YCtTYl49szRSkE8vuyE5jIMmRhrzExnuyQqX?=
 =?us-ascii?Q?ESc6/1KAG7+MQlG6lx1UjsXolmUJfU0aS8OtQIfzd8u1I7u2pixo4FlQHwwv?=
 =?us-ascii?Q?Q2OrHyp6zuuHY8VfxlzXf+HapPcrFAKUYJGbhhKLOdld5hJr5oDWRcH+ZGa/?=
 =?us-ascii?Q?LeGCscWAhRytXjK0tuWabRTSpHevzi8j+ADtq9Pcsel8dESsSmbhFOsD87sk?=
 =?us-ascii?Q?KiW5ASytRVI/0P02Xym/ZJcNU6BsnDoahQ3ZEd32911XGWJXwdJWjw0F6OkO?=
 =?us-ascii?Q?cXiJ2Y1HC+S7+fTOWNzfxIYl/l7qvz1SrPvBiLYTRefDXHCNGbtUKVYDZcrQ?=
 =?us-ascii?Q?CeVN8FwNMS2aUpWWpSUzAwIc7kJy/8rnbGa1MNRMqcep4QL5pYbNiCAIikJM?=
 =?us-ascii?Q?VrgAMp9EA/ML/MF73QTeyLXZENvj+8dot/cKiri0ZYRS1TvmtJ2cpN3pcD3A?=
 =?us-ascii?Q?SW6gf1QbSy0uZ/1aH/qAilsjCn9pEOeWHrf/JlVAfWAersDL/heEwnBn8Gq1?=
 =?us-ascii?Q?8uhh/PPPBoKAwPCOcCZvC2ThND5/rdPsQRMMKAcNdPLhvNNhGAb1zC3EGMRs?=
 =?us-ascii?Q?vHUHYpr5+vRMiscto/w+SvMVIw3Q/mqZRScr9lyBdu/3eiiiN9OyRjz11ObP?=
 =?us-ascii?Q?A9+GwCegoRPrj4zD5xrkyAQWU4vlVwelskccPO+/edM6xxZrkaEKpn3LOMF0?=
 =?us-ascii?Q?V0cCgQ1v9HL36JKDm8j/17d9F5OHm/5UKsfz9OOIS/JvdNbtcJ4wPhp6EFUv?=
 =?us-ascii?Q?/KS0o6evW6JPizU+1jd5AvI95xa3QLvSWoZ9nW483+OIowHj4qRVOin7RMIp?=
 =?us-ascii?Q?hFYlBRybfobiN3hG0P2EX/ID8ty06n1wywdcwxifFx6qsDzN/7K4F38t6cN4?=
 =?us-ascii?Q?2gjrTIO2+TUPi8Xeg5ho0jiY3mZVGzDyKBqeB4HkDwQweTdnWNWx6y801IZQ?=
 =?us-ascii?Q?0FhdPl/TTe78mZzLF0LaZKw6iZhUPgWvFq00pQngkjepd7PcaMorg8Qki26l?=
 =?us-ascii?Q?oKlPlpY4nDAUwuquQi1MKshoI4w/zY2uBg3FRDVCFfb30ZL2DVfBWzLaZmTZ?=
 =?us-ascii?Q?YR+6OnI5LlOmAzpr99oiT2/Wp2jypdsaiIASkV89VBDmV5X2NOCxjDeeLN3j?=
 =?us-ascii?Q?PIVligO7hH4DYBpgqE6EArhbaBDn+OUCmClx2ZWHdrupzGG3YVFM0tHSblNI?=
 =?us-ascii?Q?beVV4jBqlBM08BQMPo+C4esFSbOjDx80Rl8bmGz+0CUmB+Kg5MSeP+SpCRLd?=
 =?us-ascii?Q?djEr/YeJtTViq58FQTyPqr46EVBL4OD9E1H+qogAJd2qAep9X9Mgc3TvZ+lE?=
 =?us-ascii?Q?Rn+rIE76GHxk2HhjR3aAFB5nlfOPlnzwePpJlmRwI9QWIbILVNcBPNdNNva8?=
 =?us-ascii?Q?VA7zpy/YlivCCMIOSNUA1vl4pgfWe/jqpeNGgZ56rWLWNb5oWNz4wxGiJYJl?=
 =?us-ascii?Q?XOYtP89UHvR2wqLuopV6jP12BGqDxmUHUrBI59Y5z1f0zWP28rkLnuUszxWm?=
 =?us-ascii?Q?j9dXyLWqdvEVHA52Xc6U5bjLl7JVSI1Js1xUgHHRacQFkIR36RplCvUxwd6i?=
 =?us-ascii?Q?AIn8sanjB6Ty4QOz1oZOUy0WN/UNZ6CyLt+7eid/?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03cac561-a42c-4601-78a7-08de18b16ce6
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 19:12:25.0169
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QpnzRYRMvx4AhwPmRL+Gt/Xi/0wcmHpqknwMHN8Yxbggqzwifr9xGXUIt+egFE0gQQLhUPLjaJxgiMmzNZKNhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9244

On Fri, Oct 31, 2025 at 05:08:38PM +0800, Peng Fan wrote:
> Introduce imx_dsp_rproc_scu_api_{start, stop, detect_mode}() helper
> functions for i.MX variants using IMX_RPROC_SCU_API to manage remote
> processors.
>
> Allows the removal of the IMX_RPROC_SCU_API switch-case blocks from
> imx_dsp_rproc_[start,stop,detect_mode](), resulting in cleaner and more
> maintainable code.
>
> No functional changes.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/remoteproc/imx_dsp_rproc.c | 48 +++++++++++++++++++++++---------------
>  drivers/remoteproc/imx_rproc.h     |  2 --
>  2 files changed, 29 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index 456a46f163d3d823a25d16d11fb79fa9fceb2ddb..56e94754d5c5feba112227c45b0f99a4fe868926 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -347,6 +347,13 @@ static int imx_dsp_rproc_mmio_start(struct rproc *rproc)
>  	return regmap_update_bits(priv->regmap, dcfg->src_reg, dcfg->src_mask, dcfg->src_start);
>  }
>
> +static int imx_dsp_rproc_scu_api_start(struct rproc *rproc)
> +{
> +	struct imx_dsp_rproc *priv = rproc->priv;
> +
> +	return imx_sc_pm_cpu_start(priv->ipc_handle, IMX_SC_R_DSP, true, rproc->bootaddr);
> +}
> +
>  /*
>   * Start function for rproc_ops
>   *
> @@ -369,12 +376,6 @@ static int imx_dsp_rproc_start(struct rproc *rproc)
>  	}
>
>  	switch (dcfg->method) {
> -	case IMX_RPROC_SCU_API:
> -		ret = imx_sc_pm_cpu_start(priv->ipc_handle,
> -					  IMX_SC_R_DSP,
> -					  true,
> -					  rproc->bootaddr);
> -		break;
>  	case IMX_RPROC_RESET_CONTROLLER:
>  		ret = reset_control_deassert(priv->run_stall);
>  		break;
> @@ -400,6 +401,13 @@ static int imx_dsp_rproc_mmio_stop(struct rproc *rproc)
>  	return regmap_update_bits(priv->regmap, dcfg->src_reg, dcfg->src_mask, dcfg->src_stop);
>  }
>
> +static int imx_dsp_rproc_scu_api_stop(struct rproc *rproc)
> +{
> +	struct imx_dsp_rproc *priv = rproc->priv;
> +
> +	return imx_sc_pm_cpu_start(priv->ipc_handle, IMX_SC_R_DSP, false, rproc->bootaddr);
> +}
> +
>  /*
>   * Stop function for rproc_ops
>   * It clears the REMOTE_IS_READY flags
> @@ -423,12 +431,6 @@ static int imx_dsp_rproc_stop(struct rproc *rproc)
>  	}
>
>  	switch (dcfg->method) {
> -	case IMX_RPROC_SCU_API:
> -		ret = imx_sc_pm_cpu_start(priv->ipc_handle,
> -					  IMX_SC_R_DSP,
> -					  false,
> -					  rproc->bootaddr);
> -		break;
>  	case IMX_RPROC_RESET_CONTROLLER:
>  		ret = reset_control_assert(priv->run_stall);
>  		break;
> @@ -1057,6 +1059,13 @@ static int imx_dsp_rproc_mmio_detect_mode(struct rproc *rproc)
>  	return 0;
>  }
>
> +static int imx_dsp_rproc_scu_api_detect_mode(struct rproc *rproc)
> +{
> +	struct imx_dsp_rproc *priv = rproc->priv;
> +
> +	return imx_scu_get_handle(&priv->ipc_handle);
> +}
> +
>  /**
>   * imx_dsp_rproc_detect_mode() - detect DSP control mode
>   * @priv: private data pointer
> @@ -1080,11 +1089,6 @@ static int imx_dsp_rproc_detect_mode(struct imx_dsp_rproc *priv)
>  		return dcfg->ops->detect_mode(priv->rproc);
>
>  	switch (dsp_dcfg->dcfg->method) {
> -	case IMX_RPROC_SCU_API:
> -		ret = imx_scu_get_handle(&priv->ipc_handle);
> -		if (ret)
> -			return ret;
> -		break;
>  	case IMX_RPROC_RESET_CONTROLLER:
>  		priv->run_stall = devm_reset_control_get_exclusive(dev, "runstall");
>  		if (IS_ERR(priv->run_stall)) {
> @@ -1322,6 +1326,12 @@ static const struct imx_rproc_plat_ops imx_dsp_rproc_ops_mmio = {
>  	.detect_mode	= imx_dsp_rproc_mmio_detect_mode,
>  };
>
> +static const struct imx_rproc_plat_ops imx_dsp_rproc_ops_scu_api = {
> +	.start		= imx_dsp_rproc_scu_api_start,
> +	.stop		= imx_dsp_rproc_scu_api_stop,
> +	.detect_mode	= imx_dsp_rproc_scu_api_detect_mode,
> +};
> +
>  /* Specific configuration for i.MX8MP */
>  static const struct imx_rproc_dcfg dsp_rproc_cfg_imx8mp = {
>  	.att		= imx_dsp_rproc_att_imx8mp,
> @@ -1354,7 +1364,7 @@ static const struct imx_dsp_rproc_dcfg imx_dsp_rproc_cfg_imx8ulp = {
>  static const struct imx_rproc_dcfg dsp_rproc_cfg_imx8qxp = {
>  	.att		= imx_dsp_rproc_att_imx8qxp,
>  	.att_size	= ARRAY_SIZE(imx_dsp_rproc_att_imx8qxp),
> -	.method		= IMX_RPROC_SCU_API,
> +	.ops		= &imx_dsp_rproc_ops_scu_api,
>  };
>
>  static const struct imx_dsp_rproc_dcfg imx_dsp_rproc_cfg_imx8qxp = {
> @@ -1365,7 +1375,7 @@ static const struct imx_dsp_rproc_dcfg imx_dsp_rproc_cfg_imx8qxp = {
>  static const struct imx_rproc_dcfg dsp_rproc_cfg_imx8qm = {
>  	.att		= imx_dsp_rproc_att_imx8qm,
>  	.att_size	= ARRAY_SIZE(imx_dsp_rproc_att_imx8qm),
> -	.method		= IMX_RPROC_SCU_API,
> +	.ops		= &imx_dsp_rproc_ops_scu_api,
>  };
>
>  static const struct imx_dsp_rproc_dcfg imx_dsp_rproc_cfg_imx8qm = {
> diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
> index 912827c39c0dedeed76c13740efd42a8e7cf9c45..a6b4625e8be76c6eb6a5d8ef45eb5f3aec5fe375 100644
> --- a/drivers/remoteproc/imx_rproc.h
> +++ b/drivers/remoteproc/imx_rproc.h
> @@ -20,8 +20,6 @@ enum imx_rproc_method {
>  	IMX_RPROC_NONE,
>  	/* Through ARM SMCCC */
>  	IMX_RPROC_SMC,
> -	/* Through System Control Unit API */
> -	IMX_RPROC_SCU_API,
>  	/* Through Reset Controller API */
>  	IMX_RPROC_RESET_CONTROLLER,
>  };
>
> --
> 2.37.1
>
