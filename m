Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013012.outbound.protection.outlook.com [40.107.159.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30AA1D514B;
	Mon,  8 Sep 2025 15:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757343738; cv=fail; b=Rw+jbJzsowkvZIjgv4dC3nbzPbfuhbRvOcMcjc2/jUByVHif24dQf2v9haZghWi6pcJt8yfvTleM/QClPdsN3x0iyC6it9+U/eWfg97d7MUKwqRbhjN8V7apUqX1lXvbkxaS2NwW4CsJOJ1iTPKodQHzcdL+vLiUs9kxpnSrOds=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757343738; c=relaxed/simple;
	bh=2UkO1nkHZwt/HiKoAqFFqxqKfBd3ypS4cWwfPxnJBmo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ggTOdNl9alQGzylKDCcVLJEdXV4UfiFTeR5O1HJrVrep3B1zpfDJzdcVfBk0wUOOP8R++omtvcOHJasZ8po6pzgAANjvkA9Ey56pl+rWQ7u3zrpNEX0Cn0LImJp+xt4hWpZ3R2UaHODq6ARS5ZSOzyrSNzrUotdJ7cBGBi4ktTU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=leYrR6Fy; arc=fail smtp.client-ip=40.107.159.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="leYrR6Fy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FrDWAFvQmBE9m6KRfmxz+JugaRiIj4SaamBA/+BxcffLOVlP6UDUNTcnT94NQcoTOYPWod/okH9FTNRnDPzTSSVp446He7WVPU9UP7mshSIYfuT77rTfynl/vCyw+42hieR194BDa+kO1Eh1Xoywnh1yEaGp0jBndNS/oOQ8TH+3t2RnwwYDu0Z153ddNajM8nF4xACHIxmeqYf9qWhfswMAJMJmtrds5Oj35SnSBeheEBhhJxKnRuOeMd7QLPW+UDPeTiEX9Ho4OCNM/w3yzaYtRb83cId8uZ0J2yfoMWruiwRomXWFMHJfSAFD7B6F6EFnT3klBYqyRD6+BTzsJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y17y7ii41w8ICo35W4+y6Al+QUO4WiuCNlV14qzC+Hw=;
 b=Mr1usmpP1VS9YYJX/IgooOvlwWmqpfs+vorZTas3jOCfDWYHxjx2lKOfqjCudAF8pX0JAfVPLzsf6F+Q52yYnWsXlAifwrWCD4OQOSKSgbdSaqhhxIe4X8d9yp9CS9aftVwqFFF6r11yoOUbkQ80fy9Zca2SUvDWp7nExpTlOSY4RKi/CIQvasC7/tAvYKx6mBfTlm1IpGeJrbWnp3Snl+iOVc4EKurHWxhyv9TvCNOLPVTGsRvOL/AsPqQ6k8CrIzqtKHC3tZa52A1kWoeKdTx4fGaEI3LhFYaU/XC3crnjdBAkz6W42dTSZ3PW3Gnktf6d9XE1J9x9FpYKsrrWMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y17y7ii41w8ICo35W4+y6Al+QUO4WiuCNlV14qzC+Hw=;
 b=leYrR6FyHct1c4wcl6/RsckXZMmhyK++FsSLEVssjrUmSS9YCM1xERzdcunuHICenH/4oJt2CVtoSv7HBh73q65FMgrdtx8dDkiFE4cQQE1EQYG7DQTZ6chEQrSSyZEEL4SSshajqXsVAN5jZE3Lw/pAOkRvgYhvlGlnr3QHAgbmoi9hXohdNeHjTlCbOYiVq8UHcO+s9ZzaDNj6Ang0m3cabhhnLkoSPrnk5gvS18Lzy14cyJhWqPrIrz9A/mi13uQ/K35eMdtQo6C8D5CUm77qegLXX6gWxdpsoQGzJ4JKqtObu1HEe6wXO2bLvWT1AYDKSBHy8fKLZAEXO80F1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by PAXPR04MB8141.eurprd04.prod.outlook.com (2603:10a6:102:1bf::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.14; Mon, 8 Sep
 2025 15:02:12 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%5]) with mapi id 15.20.9115.010; Mon, 8 Sep 2025
 15:02:12 +0000
Date: Mon, 8 Sep 2025 11:02:04 -0400
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
Subject: Re: [PATCH 5/6] remoteproc: imx_rproc: Simplify IMX_RPROC_SMC switch
 case
Message-ID: <aL7v7P5kRDt3vTuc@lizhi-Precision-Tower-5810>
References: <20250908-imx-rproc-cleanup-v1-0-e838cb14436c@nxp.com>
 <20250908-imx-rproc-cleanup-v1-5-e838cb14436c@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250908-imx-rproc-cleanup-v1-5-e838cb14436c@nxp.com>
X-ClientProxiedBy: SJ0PR13CA0076.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::21) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|PAXPR04MB8141:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c0e57f3-48e7-48da-8753-08ddeee8b0b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BdQweF8ezOzs6Kv3vDXuU/OZLNNteZr25ZbTQJYQA6q4Z58ODsd+E8mcXZ0L?=
 =?us-ascii?Q?gKNvPrlEXwPeWuoAzDsuMrhxK5qicfSXYCcfx5UjLAgtDz52B3vbtkZBwdAV?=
 =?us-ascii?Q?JC+tZfNBV3pQ3CdbaVpOSrEzNMc4TFgcBoeD2DldXXVC9BF5Z/hJ8fc7r5us?=
 =?us-ascii?Q?wLZ0AIJD093GV3ZPsPFnk7cQv02ZvEWPggnoGmSuhorZ/ZwN9oBc3bzfr39K?=
 =?us-ascii?Q?Mp8/gQwPKZYvS1+g6zrvfaWAId3DG3t5r07AlZBOh53Gm5nniGLghlEpUcD6?=
 =?us-ascii?Q?bXphFFYTlU4/2KVrpGM/7ackahbfCn0ME/MR3vCjXLUZWwq86hCrq8NhsGNU?=
 =?us-ascii?Q?ztRCAmQCyY7Punenx2dxoJsn40aA6d0LkR7pHVEgBE+fxSZBEp1mVGL+gpdf?=
 =?us-ascii?Q?WIYXeC2iWEYxfsZpO12b4ctJ1CRi3nMqR/Vx/WgWn0nJzKeis3z4ufcf6D8z?=
 =?us-ascii?Q?3K6izNeDhct55ndQQ0gKfq0TB7wcaYAaJlZe9b1hqmMzdGKPgn+Iz1srf3wC?=
 =?us-ascii?Q?b8HieDf9VR5Mr63G581rvbNrgISonS8Q+U0rrIc0DDj2l24ljSOAdW+0yn8l?=
 =?us-ascii?Q?cgkZLRUtasQmYxvq/KAuKIUiQga0gKp3lEGW2Mnx9rtivoN8AbTKAtmGJB5/?=
 =?us-ascii?Q?V5qIR+4rPFiE+uAKvfKWOzBtQCs3YksAvDOXoYHoBLhHyVaNEpdEy9qoeo01?=
 =?us-ascii?Q?fL4o6B2Q6uAI/63OdFEV0rmzq7TmU8PY6ZmEYi7V9ImVMo2CPDQF1UNBGyFm?=
 =?us-ascii?Q?toIvjlQJBtfAQ+qbABNW543zGwEvRwBIH0nkTU/DUYzuZwVLgTxQ6ajOqrLB?=
 =?us-ascii?Q?0EWpCMcdJ/2rlCzrlK3GJqt7KGvDQu9IzgEyk40ay/EiMjbj9bsBZ2VFVA6r?=
 =?us-ascii?Q?n/WvPnzB9UQA2eqlKAZ4MRb3tI4TiZNyTFQgrFEA3DiSD5uDM4IfjmjTTRRo?=
 =?us-ascii?Q?inSC7ItZ64nT1AVy7BTEMyY39/xsBA6r4mlSZdcs34O7sKBGdUV4DlI2tf4I?=
 =?us-ascii?Q?sn7xZ2iff7lhsLEnRf9DoAYVWx58FkjFE/rp+SvOeLy3eTlEDGjW8HEocOYa?=
 =?us-ascii?Q?bQcVIy5jnA6mZ6atSBAC9Sn5SZaSRlzH8SXL8nlHgmbpycu+zNBw40d2I6r5?=
 =?us-ascii?Q?oXFRec35ns/+mipL0h/bbakvfgCeFK4wSnGYsmGoSLZIZLgWCnDcHgmdYAeX?=
 =?us-ascii?Q?1l8dhUNzo8N1AZreiF7OivTYISg1AZrE6rglfZRtAVKoOTiPFRG0XVOp/aIV?=
 =?us-ascii?Q?NV+ZCudKUAjR/eGFX0bnkcvDE/4vnI5Sjq/dZ5zLPZB+nA8gMu3/nXy4lscQ?=
 =?us-ascii?Q?6HsxwB6mBOXxqbfHXz2AdOlyCqvArQhBxITt41ttW1KPcW0B6HtjlJ00OBUf?=
 =?us-ascii?Q?Mfvh1yEuEzmlfwFXH2mg4cBcQSOjqS1m/5a6klcR+1xGCyKWnHmPxQCJ3F3V?=
 =?us-ascii?Q?GXRs8l6NrjI5fDhfwcKu+o5HHnMaO6wrAzmCOoEhBq6sTNdU1MhdCw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ktDcIRLfTKm3axI3EYLK22Pz9je7BbHD4zsUsfpAYdhB1HNAkrBNJSY6aH40?=
 =?us-ascii?Q?UMyzipl/xz1/t8BdkE9D5acwqWQsaV9Ch/165P+QD3cq9VQI0y7yVMphvsn0?=
 =?us-ascii?Q?OpLmoGRmjQ3vo29Z2QglbZaIxsW2XXrFN8m2v+qkqiP5sIiQ4GoTJLa0GBBb?=
 =?us-ascii?Q?ZVUpfouz/6eI8e/o2o0cdZvo31l5b7VdC4Z29eGrPa957nKeOf7TDosXg9vt?=
 =?us-ascii?Q?RTijCxUKhNAmtdj9vc2oxyONRa9U9CErEzwxyglevqHFpJeqkvo2lZ9ed1fF?=
 =?us-ascii?Q?6XZ6dzy3o9aZkmITMdGNdjju53ey7PMq+gxBeRC40+G/3aH7kmRkyEdJL/vN?=
 =?us-ascii?Q?XLgfKbCYzc32IvA+hm18BzF3hqNJz+WmjJn2wZqO4XyoOmFcILtUq133299k?=
 =?us-ascii?Q?LdXj6Td1Yqy+iB3FLHRiVQimb9WO362QDdoKs2q9mpOT9tM29EeSdxiqqrnA?=
 =?us-ascii?Q?cRaOy+XzdJGm3fYyXv85dV/F7czKSBghPMCu15hdIv65plmIOqyWGj7KKSz0?=
 =?us-ascii?Q?xmJHQVutFl8dxOX/AWBmky46VI3mS5rREwYsTx47Q93Q7VuatQu6HeTnqg8r?=
 =?us-ascii?Q?cc6anno8w4YVe6apvgTe3vBIj2iPp0dlgPw4Ufy64Wko6uqmFVYYvD421LFp?=
 =?us-ascii?Q?ihdWfVWxEOnKVa9OMvQhPSFyfL/GrZ7jLvCfOqWFgl5qTHmTXbdjTabPEpOU?=
 =?us-ascii?Q?WaPocu7gO++RyGoJxMyycNi85/QjO2Ku2Sj/eiLsuOsf+teFku5VIyPq5PV0?=
 =?us-ascii?Q?+kT15j9DP3D91CBGTOwacsB+sIistKUyaunSmy5yYvuOepDAHPPotd32NXmx?=
 =?us-ascii?Q?2aViEjtPkhF3Zus6eF5eQNOsOAehUqaBmvSTQik+2BEU41lyHcJksXvv0I1Z?=
 =?us-ascii?Q?aAEkpLoqR+H+4C4yp5uI0dEVaVzv+T9U2Ps6VGXU3mgWRE2vadYUAc1P5nvN?=
 =?us-ascii?Q?Q1HKkivBFLJLzNKuwW0awi8jGuxJj3r1RKvBU1utzFb6kkNtVqawDjL/8VCa?=
 =?us-ascii?Q?WqCYi8QS7OR7v07Ve7K/3e8V/jQWPSnhga0npol/8pD1ZFn02NafgxqqS9rJ?=
 =?us-ascii?Q?pvcs1V0O8EIk2xOLPSttfb8Ug3QzvVGJ/ZT7L4nmqUYG0C0CxP1ozFiikdYS?=
 =?us-ascii?Q?i5YHHTSXHbTUxHh1cRDRObHsePUSKIczuQUJx34Eh35x/7GOYsgP8eaO2eGG?=
 =?us-ascii?Q?wzdy+Ebc704q2FT3W61exOBArp3QvTqHSLpHbGwgtmidtQK9MD/zOYlifL0a?=
 =?us-ascii?Q?WGwzpgX0+8sAi2w6nEJk8QASkEACrIgQlMLbxR+iT5Z12q6XyDWvFvWYDQIR?=
 =?us-ascii?Q?BxUpj3o6Vr3tsZuQvAGcVrJhKnxJcPobumZCx1o5XkJ8ouCbvS0iZSBZe4ol?=
 =?us-ascii?Q?KRxUZbReuWndrgWSVNFklxgMKev6Z5prit+IS/UPk6olpnDKVHy540qXrl88?=
 =?us-ascii?Q?IFpD19KQ+WKn+5bQpnKEm1ZGdPsq0J302Fmjn/Eb/xG5QrE2/ymBpsQkjXyW?=
 =?us-ascii?Q?xynqis0JqGfZfCZnWYv1QT8e+PdHnS7KLOaNQ/qT1M0l299rxkhXXXPbUDDD?=
 =?us-ascii?Q?76hVO3tZz2Kqgh4QKFqtk2aPOv6Mrw01RnK6C8hY?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c0e57f3-48e7-48da-8753-08ddeee8b0b4
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 15:02:12.2473
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EsSifRUYEGYATQDP6hk/Aiqbomf9OdFayTJFvGYvcLHV6tzUmERCeLHZzxrymXKw7XTmRt6VReitAhlRZ7/zgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8141

On Mon, Sep 08, 2025 at 09:07:38PM +0800, Peng Fan wrote:
> Introduce imx_rproc_arm_smc_{start, stop, detect_mode}() helper functions
> for all i.MX variants using IMX_RPROC_SMC to manage remote processors.
>
> This allows the removal of the IMX_RPROC_SMC switch-case blocks from
> imx_rproc_start(), imx_rproc_stop(), and imx_rproc_detect_mode(), resulting
> in cleaner and more maintainable code.
>
> Since this is the last switch in imx_rproc_{start,stop}{}, remove
> the switch-case.
>
> No functional changes.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  drivers/remoteproc/imx_rproc.c | 69 ++++++++++++++++++++++++++----------------
>  1 file changed, 43 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index ea34080970c6a5a9b035ef0d389014b8268660a9..5fa729f4286f6ac939357c32fef41d7d97e5f860 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -285,6 +285,15 @@ static const struct imx_rproc_att imx_rproc_att_imx6sx[] = {
>  	{ 0x80000000, 0x80000000, 0x60000000, 0 },
>  };
>
> +static int imx_rproc_arm_smc_start(struct rproc *rproc)
> +{
> +	struct arm_smccc_res res;
> +
> +	arm_smccc_smc(IMX_SIP_RPROC, IMX_SIP_RPROC_START, 0, 0, 0, 0, 0, 0, &res);
> +
> +	return res.a0;
> +}
> +
>  static int imx_rproc_mmio_start(struct rproc *rproc)
>  {
>  	struct imx_rproc *priv = rproc->priv;
> @@ -308,7 +317,6 @@ static int imx_rproc_start(struct rproc *rproc)
>  	struct imx_rproc *priv = rproc->priv;
>  	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
>  	struct device *dev = priv->dev;
> -	struct arm_smccc_res res;
>  	int ret;
>
>  	ret = imx_rproc_xtr_mbox_init(rproc, true);
> @@ -320,14 +328,7 @@ static int imx_rproc_start(struct rproc *rproc)
>  		goto start_ret;
>  	}
>
> -	switch (dcfg->method) {
> -	case IMX_RPROC_SMC:
> -		arm_smccc_smc(IMX_SIP_RPROC, IMX_SIP_RPROC_START, 0, 0, 0, 0, 0, 0, &res);
> -		ret = res.a0;
> -		break;
> -	default:
> -		return -EOPNOTSUPP;
> -	}
> +	return -EOPNOTSUPP;
>
>  start_ret:
>  	if (ret)
> @@ -336,6 +337,18 @@ static int imx_rproc_start(struct rproc *rproc)
>  	return ret;
>  }
>
> +static int imx_rproc_arm_smc_stop(struct rproc *rproc)
> +{
> +	struct imx_rproc *priv = rproc->priv;
> +	struct arm_smccc_res res;
> +
> +	arm_smccc_smc(IMX_SIP_RPROC, IMX_SIP_RPROC_STOP, 0, 0, 0, 0, 0, 0, &res);
> +	if (res.a1)
> +		dev_info(priv->dev, "Not in wfi, force stopped\n");
> +
> +	return res.a0;
> +}
> +
>  static int imx_rproc_mmio_stop(struct rproc *rproc)
>  {
>  	struct imx_rproc *priv = rproc->priv;
> @@ -365,7 +378,6 @@ static int imx_rproc_stop(struct rproc *rproc)
>  	struct imx_rproc *priv = rproc->priv;
>  	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
>  	struct device *dev = priv->dev;
> -	struct arm_smccc_res res;
>  	int ret;
>
>  	if (dcfg->ops && dcfg->ops->stop) {
> @@ -373,16 +385,7 @@ static int imx_rproc_stop(struct rproc *rproc)
>  		goto stop_ret;
>  	}
>
> -	switch (dcfg->method) {
> -	case IMX_RPROC_SMC:
> -		arm_smccc_smc(IMX_SIP_RPROC, IMX_SIP_RPROC_STOP, 0, 0, 0, 0, 0, 0, &res);
> -		ret = res.a0;
> -		if (res.a1)
> -			dev_info(dev, "Not in wfi, force stopped\n");
> -		break;
> -	default:
> -		return -EOPNOTSUPP;
> -	}
> +	return -EOPNOTSUPP;
>
>  stop_ret:
>  	if (ret)
> @@ -867,6 +870,18 @@ static int imx_rproc_attach_pd(struct imx_rproc *priv)
>  	return 0;
>  }
>
> +static int imx_rproc_arm_smc_detect_mode(struct rproc *rproc)
> +{
> +	struct imx_rproc *priv = rproc->priv;
> +	struct arm_smccc_res res;
> +
> +	arm_smccc_smc(IMX_SIP_RPROC, IMX_SIP_RPROC_STARTED, 0, 0, 0, 0, 0, 0, &res);
> +	if (res.a0)
> +		priv->rproc->state = RPROC_DETACHED;
> +
> +	return 0;
> +}
> +
>  static int imx_rproc_mmio_detect_mode(struct rproc *rproc)
>  {
>  	const struct regmap_config config = { .name = "imx-rproc" };
> @@ -981,7 +996,6 @@ static int imx_rproc_scu_api_detect_mode(struct rproc *rproc)
>  static int imx_rproc_detect_mode(struct imx_rproc *priv)
>  {
>  	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
> -	struct arm_smccc_res res;
>
>  	if (dcfg->ops && dcfg->ops->detect_mode)
>  		return dcfg->ops->detect_mode(priv->rproc);
> @@ -990,11 +1004,6 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
>  	case IMX_RPROC_NONE:
>  		priv->rproc->state = RPROC_DETACHED;
>  		return 0;
> -	case IMX_RPROC_SMC:
> -		arm_smccc_smc(IMX_SIP_RPROC, IMX_SIP_RPROC_STARTED, 0, 0, 0, 0, 0, 0, &res);
> -		if (res.a0)
> -			priv->rproc->state = RPROC_DETACHED;
> -		return 0;
>  	default:
>  		break;
>  	}
> @@ -1170,6 +1179,12 @@ static void imx_rproc_remove(struct platform_device *pdev)
>  	destroy_workqueue(priv->workqueue);
>  }
>
> +static const struct imx_rproc_plat_ops imx_rproc_ops_arm_smc = {
> +	.start		= imx_rproc_arm_smc_start,
> +	.stop		= imx_rproc_arm_smc_stop,
> +	.detect_mode	= imx_rproc_arm_smc_detect_mode,
> +};
> +
>  static const struct imx_rproc_plat_ops imx_rproc_ops_mmio = {
>  	.start		= imx_rproc_mmio_start,
>  	.stop		= imx_rproc_mmio_stop,
> @@ -1199,6 +1214,7 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mn = {
>  	.att		= imx_rproc_att_imx8mn,
>  	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8mn),
>  	.method		= IMX_RPROC_SMC,
> +	.ops		= &imx_rproc_ops_arm_smc,
>  };
>
>  static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mq = {
> @@ -1265,6 +1281,7 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx93 = {
>  	.att		= imx_rproc_att_imx93,
>  	.att_size	= ARRAY_SIZE(imx_rproc_att_imx93),
>  	.method		= IMX_RPROC_SMC,
> +	.ops		= &imx_rproc_ops_arm_smc,
>  };
>
>  static const struct of_device_id imx_rproc_of_match[] = {
>
> --
> 2.37.1
>
