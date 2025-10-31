Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010056.outbound.protection.outlook.com [52.101.69.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2AA3A1CD;
	Fri, 31 Oct 2025 19:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761938178; cv=fail; b=E/7kmA4cs5oT+gl7FL3qTjJxP9KjJCtY7gNvpN/aBXiuIIWT0UuzWK9XjWRZId2kRrq3nhTOlA+sYkQ0a9Bi5vysrGOSWNbm5w/9tFTVvfEcTpaoDdFLQxLcHPZXtj/q1hIhSDLs3IvGusPkKkQLLRqHNQhRhxB6h1tSrYbyNOU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761938178; c=relaxed/simple;
	bh=TiL3TBzYlfR4k3fQidDzll+YcL2fkS02oFwKLQoj61c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FvlWYOLg5FlfJctVMNqV5tPr3BoHqxiKAB1MkpjBbQD0AHDTU+KtuZhXq85+GT10ghXQcZgop0nISWQlwX05pLQ1NA1TxAGjZfwfjGKsvoXqdbow6QCRS7UloeuexrGI50TiTh1s22eeWrA0UYLHyElqr8CK0940UrPljW8gM8c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=VKhLupQQ; arc=fail smtp.client-ip=52.101.69.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="VKhLupQQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w2P+CnCuYxfj4M9dWW0EhBibIpEU58HGmSQ1WeC/v1n/7hwg+BSPHgO8p/rIMeVL06b7jV2D76Emjs4u8Dh3dmVU8X9jbBiojoShrE1JSee+wTcBG7uBes0H4QDK2JZBOVI03Uz8+hfbDoiuwP/DA0SQDI0poba2cou+a3xq4++TogTDryi7Y70eNNnGX9gHohCD2H/MvE03Lbj1OVYjD4++JrZrZ9YU2uqLucvyAWdm3NOPC81h79FDWcsy2NshiOgLqzJ3ApDMH80hlxdFJ4u67yF3nD69UVCRNceXCuNioOFb7R/1aLTFdQ+MA0EhZMXSnUul9LS6icdCT2So9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AGBI2RYvMe+fWKQzSlceE6zmwij/G1g2GpSwqLH3X7c=;
 b=atjZDDBUtZmHy/48d5cTkjXLbj7qAvzBkTUBWJPm5cF7xLBXzUtlHeLN970C8XrbaMufk8eUjrjDyYQ7miVFjVE2loed7/HIY/mz6psbHAGqQ0OiRiD+orD8jtJhGI0qFuUamKi08n9r9QZ0vELdz3cR40KsZtQ5xnf0yBg8jD914WLVRsE43f6055gpEzmL9U8dF5anb3JGmErROHzpC4cCWt2Irxa/qwNKUjw2WkWXNH1IjS+TzIcTzZDfOuDN4z6AhgR+ppLyUdPvbu8hMUoX4X1M8gkHw5S4zVRhlpbwPLRUvDtxeIlFXJMs6GRMZpZLSKwlFuvtsh6c1U3g1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AGBI2RYvMe+fWKQzSlceE6zmwij/G1g2GpSwqLH3X7c=;
 b=VKhLupQQ/bxtXeDMnO0pFKVRsbJYlyR1MnfgrPSv9cA0dWdzLPUxJ91XHlHJ+enEzgAl09+cNIb77p5zPCtklIlhKCsyjkuLXU414HR9Wqklv8TYTw26Csg2fO6BQ9VciVOJm/LoV09n27rH3k5N4IwiAhX7ARyMdXXM9p4M4bLrOfe2okMAWrBJcvSfgeOdWZShHSNHzO6eL6j05HdEaPpy63esrfrV3OytFbqymCOeTru9f0C5uaT46UPnKANRfEU6o/ts2CNTveYtnpy0xCnyFwWVbtOKKUivxI8FR+imUxv4mU31YdQhWmsXvgGBvVlHgYfJCnkfn73WxDYLXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by AS4PR04MB9244.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Fri, 31 Oct
 2025 19:16:13 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 19:16:13 +0000
Date: Fri, 31 Oct 2025 15:15:39 -0400
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
Subject: Re: [PATCH 11/11] remoteproc: imx_rproc: Remove enum imx_rproc_method
Message-ID: <aQUK2yfPpie4zj9m@lizhi-Precision-Tower-5810>
References: <20251031-imx-dsp-2025-10-31-v1-0-282f66f55804@nxp.com>
 <20251031-imx-dsp-2025-10-31-v1-11-282f66f55804@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251031-imx-dsp-2025-10-31-v1-11-282f66f55804@nxp.com>
X-ClientProxiedBy: PH7P220CA0137.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:327::22) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|AS4PR04MB9244:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f748828-d51a-4ab0-5444-08de18b1e848
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1v8mSAYnGrZHLHkUFx/Wb5fxNciMc+Hbg8yA6FTThQkG6Lubd9opF56YXfTw?=
 =?us-ascii?Q?Oo7xMAiKI/Sj3lhvBTpBlDC8F715zxFLbAaChP9cGWGc469S1WzZjpyxZT22?=
 =?us-ascii?Q?lZQl3U3l3nOZeFdVwnBmZdYdqVfrmMKtS94n2FnEtVPd/tON9Ulb33hr3tKq?=
 =?us-ascii?Q?hpcevFX0ktYALSKquShIP3K+vwbiC+0O5yYYOum9YNJcFNVt68ZD7dzq0mSf?=
 =?us-ascii?Q?FoewecifhaoBzDdTqHm75nGDNnBGxxDUFBejfxlRuSaG8BoQ88clWcvhNCgo?=
 =?us-ascii?Q?mo0vu3Ml3t+MmbOaxME7NN2Vi8sxr3d0Tj0w3SbptwIHSi4C4vF2WJ1XoidS?=
 =?us-ascii?Q?8ZCw0/vSgGtuTcyFvXzUZf6C7iCvp09s6wVXaouHqK6EzqLn9sVgpNQcVjh3?=
 =?us-ascii?Q?q5uXapdcczuNd6I4JMFlxJyh1CC2TSiuEi3FFZZ9s/3cuiUJK4ZuGKIYIPvP?=
 =?us-ascii?Q?X/JxPgZcIKmf7IdtTcSOialXlhTvwmymyrr6B2cBNfZ+YQsZc8Uj5knU467U?=
 =?us-ascii?Q?OQ4GHNwSi+bbPAQjN8DTtRgvs5nEWybetTvPWPbVJX22ndR+x1jY1MXKXW7h?=
 =?us-ascii?Q?r5FQZ/Ud1BDm2fmDPNSDXKlNgO98ncqTeY/j1uw5Z/LAJqmQp1/5Ki9LGgDG?=
 =?us-ascii?Q?eaJuNb7TETjEecIHazatJzU4vzYMQN5OgupRA3IThzEwsR97DMo67OXCeIkK?=
 =?us-ascii?Q?HNLMW2L4nwQ2NjKUbGya7Cxx708AKQ+D89IjiX6or/fNXgOgu8YSUFUE2DPy?=
 =?us-ascii?Q?atjpXSbw+GBsbygEq7O4qDN4bgVyjAjnsuPILLd0LJoLbW2f09GfWP3HB69N?=
 =?us-ascii?Q?QlNwl1wPHjwgE/AA62NoWvMaUSopK1ndKZxBY9niLy46HkTtDLQ9FGSSF0Bm?=
 =?us-ascii?Q?dL7n06IDxPdI/SYi9usSm/oRrXIIu8KCCwbYIqLMQJ5q1BfVgvDLRKtT+A5B?=
 =?us-ascii?Q?nIwYnVqbEEovv4g5wKWw+MXvA0bbpDQdVWKeCpWyjm6NDzzIiGffRpnk3fJ4?=
 =?us-ascii?Q?xzIptDvz2SoXeUcTqNauj4PTCzl5lVvELcZccfiJFhrVswNj3icJWPBLgihx?=
 =?us-ascii?Q?c35dAzULGOUkDV7Ho59CADvdnGLOkVh1SCVnQOcuWtDkilcCfG8wAT76mCT0?=
 =?us-ascii?Q?17CVai9DmRm7CCKXXEEDondvbrUS1OZK3NuZChXHPN7lAgVmcs2zih5Am/D4?=
 =?us-ascii?Q?96Y6CwjVbS7fZ2r3Yp2Zh175vXJLGcTpCqqunkj0GX7ARmIqtxvRTFBnQb6Q?=
 =?us-ascii?Q?JoS86ceOdQAusfgcazHkVJqwPQJtl+aBh7unwTpDXK4uTu5zX9A+ElEtFnIk?=
 =?us-ascii?Q?c70XsMwTE2eSi+OhiE/ung2OJl14xRxNypJN3WqloV8x7hH/UumKS3drfaR/?=
 =?us-ascii?Q?PXXFHr91tsY10Zj4Eyv3s56+ECr7Tdc1JgLbFHNCqfhPsxZrl84t84Lmhlgt?=
 =?us-ascii?Q?Lx8SOlA0l1qKzqO0hFA05nNvOEB5FtCVOMeMNEU6sMDFelHs9Z3/NsL5aRYz?=
 =?us-ascii?Q?d9MztxGQF2OWmy6/vY1lVps0Z7hJantryYFX?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IZHJbFCOcqa7m7X3Y41nfqb4Z8a9IY88G0Q1i48l8Ea0M/Yec3ACng5IalTK?=
 =?us-ascii?Q?DSm3UomMY0v3aZkqd4V+gSi0T5lk/9Kl+QzDl4UnBaghj4b+mrVi2P3Ah5gA?=
 =?us-ascii?Q?Bgcz9uGoeim8nwssKi9ke1eqZZ3CvbayLq24WfuciOz+u6CKjnFJdLQrgYcF?=
 =?us-ascii?Q?UgAOrIRHBHqNc2YXGRI2wLQha2RRrSFxsY9RfHGRQcehFC/wqEOUw8F6EANl?=
 =?us-ascii?Q?e5/kMA68hswmFi61wZygqmUq504HBtJ2+yEvz2bIgddW1o+CGq+jI0ctmXzB?=
 =?us-ascii?Q?un7CuhWiJMDO5AbsGjflQXZmn125t8Yl8dI/HPwwBFf/N9ElyAopZwSrNerv?=
 =?us-ascii?Q?7UmkNKh0CzM5DwwT8DWwUyQ2jO8/nTwXgDUboSKNHaAMqZh4Jv8LlcLMjBrq?=
 =?us-ascii?Q?jBHI90GKPbCmZyqESYy3oha/0ykMq0axJNX0fbkQcMkZIF5ll0qLotGi6UMF?=
 =?us-ascii?Q?99EB3o3M9/VM/8JDMbzvGln14DmCAibNdXkaKbzneUIkB9hCnfegonPciGik?=
 =?us-ascii?Q?7d8n0UmTusoo+l920l3HcHV65cPnujfQqCjcSqrb9WFreeGhy3JBHYaEdo5u?=
 =?us-ascii?Q?ndZZeyZkHmSc204+sbP6i76HfcvfrGdjxgALGnQzIXm2sJ320UA+tq0Curao?=
 =?us-ascii?Q?T7SlzysSfrPzFiqO2ABkHTsVFUF1G97bD//68ptbT5SEx0eP6RZ6yqiBRv2m?=
 =?us-ascii?Q?Px37lbeTN0OuPIGuWmZS3+rsJvSNdJF4+aUUL0xnb4uOwidyv2m7ZGDtyzV1?=
 =?us-ascii?Q?6h4KW+pme0+KHhwzfawqhM+d3Dtnn2LOdajq20/ngVxwc1HBIRQWqrMv2Gza?=
 =?us-ascii?Q?+/3TPRL6/KYWdPQPg5IOli2s9D9t3u4M9v7lgEl2Kcl9KnIX/CKn9Q84U0Ii?=
 =?us-ascii?Q?abpKLJa8xj37/FhxJNjaq/ffq8rPgNELkcyE8+E6PBksrUtByUe/zaFcCYyc?=
 =?us-ascii?Q?UNcafXppalipcVtC+D06V9qRpsvmH8eTiPejKw56pYRD1uaR2TvGlBpIZTF8?=
 =?us-ascii?Q?eJ25S5RW+bzkDtEXsbLeoxtC1hHTkNs80Jls2+KrylULmHoaR8krwgfXeQs7?=
 =?us-ascii?Q?nOp7fapJYTyTluilovR9f02cGv3tr+7jf6yCvBg5theRZodPv8odWsnvB4Gq?=
 =?us-ascii?Q?blePwUoiafQUwB8RFaZzq/Kjl+6b0eEpDoGzgLQYryN/L7Q+iLu7dipv0UyC?=
 =?us-ascii?Q?K/v7uB2ZnBQJ/xVzXDuOnD/oYZ75hFusSQDdU/AZpRwotSJCESek6XEhh1fR?=
 =?us-ascii?Q?IbG8CPCQfrJsjJdpD8qZ/9oYqJczrWFR1PgyyF5N6NKa965UpH0sM79mu/Sk?=
 =?us-ascii?Q?w1tQobTaCNGq2O5m/opFtnbxKrY1vmcNE/u95Gi4lNuJo6gKgo9q8G6Ub8Y5?=
 =?us-ascii?Q?g7+OLPFB1sM90TC/Oolb1JIBuBa/RiMPox5i3q+W+5M1DBSmzpASachQ03WH?=
 =?us-ascii?Q?LKv8KcJMUsERZ06AZkZkLfVPPQwJhHElQaE1nLUD0oS6knyCltxyq9W6sS13?=
 =?us-ascii?Q?ZQyu8tW1x8oLUThN1NWI9uPbf0MaIbdKpt6mLWUDbdruGz9vLT5ku7DYpzye?=
 =?us-ascii?Q?e9xZEYvOmTR3kl3cbPjtxgRQWeOoSnUGo0M42UPX?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f748828-d51a-4ab0-5444-08de18b1e848
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 19:16:13.6346
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yIq0cJciwCQLORI0NGtom1IYNC5cR4HPvUCm36HDUk8mDvwyMV0d65H5xVBzMJ5Jpo9nIN95tSFrT4Z4/me4cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9244

On Fri, Oct 31, 2025 at 05:08:40PM +0800, Peng Fan wrote:
> There is no user of enum imx_rproc_method after moved to ops based
> method. Remove it.

Nit: Remove unused field imx_rproc_method after switched to ops based method.

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.h | 8 --------
>  1 file changed, 8 deletions(-)
>
> diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
> index 6a7359f05178a937d02b027fe4166319068bd65c..1b2d9f4d6d19dcdc215be97f7e2ab3488281916a 100644
> --- a/drivers/remoteproc/imx_rproc.h
> +++ b/drivers/remoteproc/imx_rproc.h
> @@ -15,13 +15,6 @@ struct imx_rproc_att {
>  	int flags;
>  };
>
> -/* Remote core start/stop method */
> -enum imx_rproc_method {
> -	IMX_RPROC_NONE,
> -	/* Through ARM SMCCC */
> -	IMX_RPROC_SMC,
> -};
> -
>  /* dcfg flags */
>  #define IMX_RPROC_NEED_SYSTEM_OFF	BIT(0)
>  #define IMX_RPROC_NEED_CLKS		BIT(1)
> @@ -42,7 +35,6 @@ struct imx_rproc_dcfg {
>  	u32				gpr_wait;
>  	const struct imx_rproc_att	*att;
>  	size_t				att_size;
> -	enum imx_rproc_method		method;
>  	u32				flags;
>  	const struct imx_rproc_plat_ops	*ops;
>  };
>
> --
> 2.37.1
>
