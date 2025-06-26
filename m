Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012035.outbound.protection.outlook.com [52.101.71.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53C42EE980;
	Thu, 26 Jun 2025 18:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750963850; cv=fail; b=dL01OXvOVU/hf4QC0n1b0J30J6eeuw5t9wPlCi9yz4lWHsRw6fs+W7iRFX0e7uhDkvIqUedh1T/rfAAlef6HRKrwkpyHrg4581XSN8irp7cWFYGjxXYj8tpAPGCeItYZOCaUyV/qcyoGjDCKJ/a+YpgI4ALlm+vXjuX2u1OnTEI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750963850; c=relaxed/simple;
	bh=fTOlCxBVpeLL5TQomCp5esizLQtiTTDTWHxtj1hK7gY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qRTIzhTkJnnXr/Kd4BqK6weCB8C+U3Pxw+6/h3680nR6WTTKe4h1cR8GYsPabDwDZ2LB7OlUOwvgbk5kcGkxpLmz/TQroucKAmlPs4NICFPs0QGPSEtc1zZR9LZc4uQgBf+gKw03DCn3egFZWozNHFoP3YNumC3DXjotty4zHaU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=mx8k2tdt; arc=fail smtp.client-ip=52.101.71.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="mx8k2tdt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iVG8ovM9uKeNpx6ao9HS3vegz7J+pAzhYuPzN+xHMQnu3x99qaPDgWZhp3nb+Mv1Ef2oJPWndXZEi6WHjHJ/PS2CgFDqE48cRq1vZdea8+f9ZVKg8x4D5jAxloGnMqY9Dss2/ak69qDygad8BmERYufHlLeMHiLOIeM82MEfPcoNAvm83g3J8AsKWQOSoeqJSvNXTo6h/B9WPykSqu1iWfIR6+zm5zGi14jcvfCa6coN/c4dVkrjrFE1uablWEof5/OXHEOmTEBbbr62kDysUvzC2BPVseRRHXWf0oCW5lzRRWrQ4yIk4fFAQZn+QvQ5N/kbFv7ddojId0rlC3c6eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8cF7JytwxDunbR9qaqUNtoPUFNZQfwLmVvy6WW819k4=;
 b=FznE+pSKDx9mOMvOUtaeI/yn//Zf2bprJVuXeV6kvrxnA+wa3xI7tnsQDpyhgk3J+pqT5pMQJeo48j6rEldpshIq0X9KHrwYyf7GvVw1e2qQGvhuFh6tn2UkdTrPSZRnz+14JOwbQ3e6yg3b1OmyMvL8pMcmN1aV2SK0a6oqGChL2o0bZ6j6glNnylarQG2lDhg6boiORJ2hqkJNIECPfsdqR9lziOU+pCoehwrAL0iMxixXTzLo/mXE07Pyyt8VV+Ke4FGOh9E1+QHl5gcb74wOzu235R7lQHR++j4rOEDUaAq/5riofZ5ji/nzSXU8eiPCMKRmeVV5jt5lCmRu1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8cF7JytwxDunbR9qaqUNtoPUFNZQfwLmVvy6WW819k4=;
 b=mx8k2tdtFQISv3pMjWeCv94Nuxsm6Du9/jTtwRtAMt1+HGsv4PW8rj/Y0VCiZswIOvdNyDVvWyqcu9C7+qPb5/GDjFORd4KNMysEfUbVhnlaOXLPKjRVgg6y9+KI6xu28IVydvHWxMo5vT6gy6FNkSpdaxVCgDTG+mFxMOI/Q7PMSTiV+PeRqCbu2oC228YwAOnqqTDz6yOC+pV+5+q69paK0MO/GDywOF6r3WLfUpqv0SCURrlX6T/9NXlcAoVrgIZeQOF2/3BAei7oHaXj2KtcxLRW1SMAlqwEuAbl7rff3nrKUOob24Y2fMHrCGVD37BwPtwWuZ2MjPlDudowUA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GV2PR04MB11445.eurprd04.prod.outlook.com (2603:10a6:150:2af::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Thu, 26 Jun
 2025 18:50:46 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8880.015; Thu, 26 Jun 2025
 18:50:46 +0000
Date: Thu, 26 Jun 2025 14:50:40 -0400
From: Frank Li <Frank.li@nxp.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v3 4/5] arm64: dts: imx95: Add SCMI LMM/CPU nodes
Message-ID: <aF2WgPE8Tyecemia@lizhi-Precision-Tower-5810>
References: <20250625-imx95-rproc-1-v3-0-699031f5926d@nxp.com>
 <20250625-imx95-rproc-1-v3-4-699031f5926d@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625-imx95-rproc-1-v3-4-699031f5926d@nxp.com>
X-ClientProxiedBy: AS4P195CA0013.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e2::16) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GV2PR04MB11445:EE_
X-MS-Office365-Filtering-Correlation-Id: 313c3965-1058-47b3-58bf-08ddb4e25c37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|7416014|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cJroZhCIujj4m19oLYF2U20DDkzKnypUoAZWtbHTl3/QirjAgWkkGbnWvyYj?=
 =?us-ascii?Q?i1aQLafqMG6LVEaR/5LOOr+q2dewWc4MUVVJjg/4/Ow2xrpFqOGKB86pvhAE?=
 =?us-ascii?Q?aX4GsNSL9iv2+vbDi8QJx5oqUykAB1wk3pQ7+0cdaHg952M954LkRIMbXSWd?=
 =?us-ascii?Q?9EBFW4xzp4cbmC4vpQwKFoit/G685x8WcrQ7ffPdTFgNudjTy8+bhftwjsuy?=
 =?us-ascii?Q?GXpzvcQr/M5+1cCrFhR9tHK6zWj4bPN57L9yKtN2G/jVQ/qVEZvjYTqFirqV?=
 =?us-ascii?Q?YAAhKKlsYV1NfckAMKVa8tXYiUZVNPFssm0SU4gow8WXM4QpOD1qlBVx9XSy?=
 =?us-ascii?Q?382GiKQ/ZDyzNcnHPdqyTV757PEBCG4o3HNbhpmz7cxGjz9b5LSqmYb5qr4m?=
 =?us-ascii?Q?w2SVMyfcbE4tafRde0jzZmE4owVIdbzZj8QbfLtKZPVMP4q2UjAslFxpNy8z?=
 =?us-ascii?Q?oBtxx/0IpUzPV3SCsckqc2pDXBTKpvJL7CbUvfjJFwUSddAONRYKHuGdDDxY?=
 =?us-ascii?Q?ZF9HSyI/Dwef0Qp7n2QVDs+Yhpl9+tf2Zc6/S+ByvAiXGiwcV3TKOoCaQLr/?=
 =?us-ascii?Q?r7cABF9s2+FI0RYh+MzZtphp8Soy+XkYvBZ9Ms6xpNWKfuDLGBYSqWHliFfb?=
 =?us-ascii?Q?lQONDxKOhXaQcayc7aylCWYGTakrIGuGj3wgtOerh335MItD9RbPk7sBOrYI?=
 =?us-ascii?Q?iM1SW9dq5ZO+1OyTtQOUR73T/r3I0cvosrcpt1kVbiiWn3m0MonmrUsCw3oE?=
 =?us-ascii?Q?fNVZc3gFar7tzC7Ytx2VzhRMUfIeLz0xvDkQn3GNIiFa1IVV9zOzhARfpcKA?=
 =?us-ascii?Q?wGI/ramTHVMXwJ2Bp34/0ZsOrIegoxV9NsMu8ei4E/3xz74Dh076lDyKwTJM?=
 =?us-ascii?Q?YwR+hxpjGi0Wk/P0IQK5o0SbMtfwjWP7551gHvEEQxWNSJJd8QYiViSkHZVW?=
 =?us-ascii?Q?lb5TLzGrksM7/1aogHUTDo5QIjAvDJKwG50nQF+S6Ldyk6L7VnbbLm1xiwkq?=
 =?us-ascii?Q?Y6RHgGV6OhpbS7V53V1yrhMkfC9syhSoAEM9y2lyFzSrwGYkFDeAGLD3Olx5?=
 =?us-ascii?Q?3G102hKr3iQeGWM6QKB1eZs6t26rQhmI7JzHilP1zupEQHuZKUPgwPN+CRpj?=
 =?us-ascii?Q?XLI9GMK4LGCGFo1dy4rpjz9XG5mC+0euBz8Us6RvVoiW8UJKhyK/5PvIx7Cv?=
 =?us-ascii?Q?5SdXnsnZ1zf/E++lMwCbl+4mK6HM2jDJkT0OBepZ9FZbLvFggRJcP/Fr6FMX?=
 =?us-ascii?Q?dmKuGuYx3aFrvAPPgVLBGk65KVln6eG98zXtN3B5Rl0VzsJ/xjSShNLAHinh?=
 =?us-ascii?Q?W/4klHdeeSq5g2ud85S9UodXDtg/Gy7BfswSLwU8gFxtJK+huQrVCN17cmaL?=
 =?us-ascii?Q?E8UUwSpNdk9yh88CTvXJryjF+wNo/Ja+r0XB0Lm8Gx3sBkSjaryzK9/DQUkJ?=
 =?us-ascii?Q?9XKJ+ay/TJhGurzoFqc9qERTgib7ykxFM7kpp7ce+e5L2Rvm8vUEYA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(7416014)(366016)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?K3X3EgEkCu1XAmxm+PtqOVwBD0NBR10Kn4ttufWzAJ0+PtIk5JqhbDxk5+GQ?=
 =?us-ascii?Q?iIUJ2dByWWw6tFAQI8dr5nmcHKoHJ1nN7gsSd3Uuw+8zwvfMygzXJzYLZETF?=
 =?us-ascii?Q?ESPjDrcX6ApOonzBokyst3xzYtN7rkgSRBQpSj9KLfiP7cz2RtM4k1Z4Bffp?=
 =?us-ascii?Q?Ik96XB5zGRTrbxE51Ed0oS3+TRxX02gEEuUakVgachdSC8c5lLp1VsbMTqHH?=
 =?us-ascii?Q?TbAmUVJ4tmaC5eznCZIRGb98YI6ci3xbhHsUSO5hTdRR711HZjVK5IpjPaS/?=
 =?us-ascii?Q?sVkW4WTScEaORBoHBVagxjM2Aj4gh7uuJRSzrXh3DPmj9pXvx5HjjKVqqAs7?=
 =?us-ascii?Q?Ru/691AjEP4lpzJ9EIKc0m9zHmoV2Dxc9TFzfzA3WahqE5K9q5DBweqW0L4W?=
 =?us-ascii?Q?oqGotLYwpOZwSrYRTm+G95/Cli3JE2DBX+2sZA7rj4SquUXX3RZHI4a5Jx7x?=
 =?us-ascii?Q?FP29MTyVlJhsusV5U/JTS0Cv3eoz9kX9Z0Ermkwq3J6+raGjTGhGjEVecTWZ?=
 =?us-ascii?Q?b7kn1EHESl9Nd9YHx2hvkhKDwNxTACTH+II8Llgmv2XnGGC87xrsYZd0afO9?=
 =?us-ascii?Q?xuWD13fRlkGyDncU9SIMMySv58hlHdlxHwgJ+bi7fEfbkZEpFdQiq6bGlots?=
 =?us-ascii?Q?dDObwx1nE61beFNBluJ5kI6daCkeJGrYHEemdfCHWTXK32qPjRE4xIzglmLP?=
 =?us-ascii?Q?r8C2xafA32jNDiSd5itzS4CNd2gfhkgDwdXCVoE5InawpRIkp/W+QUlztt6w?=
 =?us-ascii?Q?Nz8seLLboYomwwibZRlZ0qSTYhtpnGxz0PYsyDbiACQwclAytDUZu9BEkBZd?=
 =?us-ascii?Q?4608PN12kILZIeWAzUc3SKDHygNm8gzlanmy9LFyhamf9+MhFU8QYXPtvUB5?=
 =?us-ascii?Q?EjXzcAJXpip5FYVuN5Q+RiG2NBS91+mFKQF3N8uqroDmiKpKn/rxU49RSgcT?=
 =?us-ascii?Q?D5ap9Hwb+kcJUKzMjKdxHEoQe8juKXXbHSiTakCO203AsdjNFnVkReI3zuoW?=
 =?us-ascii?Q?JGw47jI3J7/4xm2MZA+XTFR34ziYEsHiujipfFEigwPkfZ+3bsoolLu2zyFp?=
 =?us-ascii?Q?CoFAOzqr4JzTdQlhWedFbvvClz8KJ2b2v9I4ffdo4a2eU2mlaxzcpnC8tzvu?=
 =?us-ascii?Q?3Z1dGUuVjS89COUQ82ksancOiTIlFnmUg6QC7Zt7gVmXa+n8VSx+SArcDEgm?=
 =?us-ascii?Q?KouYiM8akmrfIm5rAyAkMChdGJovRAkys5nVfy2RK9lUBQTHNFERJ4BLNiO6?=
 =?us-ascii?Q?Gh6iYX94ZecJFyTjT8khH+Jlx96vk3Zk0LfuQKUrT1lhtLbbWF497K8sByS5?=
 =?us-ascii?Q?s+acJ9b48+pnsIsTIuYtpOYYoFXDu3AZYM4PzPejLXhsz1DSCcXNQIZa7d6+?=
 =?us-ascii?Q?jGBvy9f/0Lrlue1wYojEayDE2JNcgA/cIHRFyfLVLbfdmFh2oXA0MZByzJQ4?=
 =?us-ascii?Q?d75nYesqmvfhY1z9lVGq6xPHHhK8eu460n+roiFb+jK3O1bDjBsikcW12K2D?=
 =?us-ascii?Q?8R5bJZCnfenKOOsN4LK6u7r1CGEr/5I5M+zmajVe6G18P7UwZSe+//ChXHU0?=
 =?us-ascii?Q?PHm0XjTNUajbO7RlQITTBb418D67VoyVmSO97Bqh?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 313c3965-1058-47b3-58bf-08ddb4e25c37
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 18:50:46.0251
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MyFRmwT6ZZ8qWLFBChKyzMT3KpY7+g6dRprJSC/lLJ6lBysFcBK9NBtojvda/0gfiowl2FSV97GJGWkB4qnkOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11445

On Wed, Jun 25, 2025 at 10:23:30AM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> Add SCMI LMM/CPU nodes which is for remoteproc to handle remote cores.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx95.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
> index f142c743f786fb5dbd67f8e52c8061bd2815a492..45b5408cbccc1e17240839c3c0c81ac3399a44e3 100644
> --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> @@ -350,10 +350,18 @@ scmi_iomuxc: protocol@19 {
>  				reg = <0x19>;
>  			};
>
> +			scmi_lmm: protocol@80 {
> +				reg = <0x80>;
> +			};
> +
>  			scmi_bbm: protocol@81 {
>  				reg = <0x81>;
>  			};
>
> +			scmi_cpu: protocol@82 {
> +				reg = <0x82>;
> +			};
> +
>  			scmi_misc: protocol@84 {
>  				reg = <0x84>;
>  			};
>
> --
> 2.37.1
>
