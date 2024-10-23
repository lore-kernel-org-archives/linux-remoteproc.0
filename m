Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2071.outbound.protection.outlook.com [40.107.22.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911BE15EFA0;
	Wed, 23 Oct 2024 18:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729709328; cv=fail; b=VGMF8H9LKYQsGb7qyy0+jes5wCx7Flna42RwLqgrM3KZRbUvDiTeIN0tm2oHOXL/lPO2bpnMSrgOZXPFq4yrkem51cRXYWqO+pDmZgei946IhkhsabAHAnBEoUlIHAwZ1cSa1kfR2MlN7PbGX+Z3ekLWkmtZf1LWzLDZiRY02no=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729709328; c=relaxed/simple;
	bh=4r5ZS5kbff2Z9SLEYZZiMb3Ccup8NA8lIOgJd5xIPTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=u+JWEaU+BMbV4s+b0lG83nRvYKKHL+188FR+SM0C1teaVoHsV5bC1nasME9K6b8sQyNzKQXCx0Rch+GNSL+drTK0GwS7QDa3rZyJLR2r8UL39EjaJ+50IpMk7kkmuCb5nde0oVEepDqzUlBaQ7OV0NDUqYKzEzoJPp/IR4jopLE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bxT0K3i4; arc=fail smtp.client-ip=40.107.22.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bxT0K3i4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nLPcD/4US0xKog/gDKg6VJ9PuLrlt6XbyC0kczairFlrOgEFdX26tPYUqWhwqqBiMRTFtbfkqX6e6fEt4v7yQR7QYNRjxkgrCAhu0My62Czq3/PqWXhbev7d/omurrvf6zXYRhGPFJCATYopHgPoY3ZN5Xt+VDJ/XO8RVCmoEGCEX1upuNBwSpexxMFoRuOPvXiXLP9HMzDVEc7GuEVMvRi8nepd1tWtob3p9/ieMHQtMema6S2E01WqoXTay9i8bM6zESiGhvgd24xxekMoxL2WsGcrzOBrUFIklaqWmV2WUEvHDZT4bHJ1zevg84/kgw4cXtIetur2oQiYVaOdaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B40E4bt46nDK4RzRO3rXtadFfSkmoJZWh9JosepBs/c=;
 b=A7xMpBVGE97KB925On9hVNgG0N4GDeW25T77sS1Ej4rZ9LQfplICwf19+AyMOK85ooZ5DdYkGCj7y6nCl+ckWP4c1TOEdAaoTOrETqq8qgtuW/ScymjYcYk+L8CKCT91eGgjr5mW0Y7jX0ZL1D4EzvKDm9fAwnswdCaOiU9DtbaI0BQQkK5K1VQq6NmZdB3dkICdjDwj38DOhjtqEENdUPeQGhoe4rcqKUf7P2nJb5SAYtlyGx3hK0oFKHtlyKW8UsKgcP3ZumARx/cRYnq12s/z2eYzCR/leMyIhq1LL2OVQ5z2H4jrKENXXp67k/BpUuXcI9SblH77qb/2BPrYsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B40E4bt46nDK4RzRO3rXtadFfSkmoJZWh9JosepBs/c=;
 b=bxT0K3i4F8q+oD5PuGbG33MPWjDXGYzfhtZ8JxVbgKX+x1pNEa7SQtK/HEYpJA2Ns/HWXWF1Wx5fXUNSQSQgmybtW0YzsBQQcl+LIVOjcXdTOnuRQqGLoUDFUBDk3yrok2sBXfdLtnyaC2wiHcF7HyNmRjgBzwBBwQr4OmYceixG5FMgqJzMnfW/fKWo4x/BvUIen3ZvXNHhPMDME1ttSi+4apmgtGnPgg0wM/f/ZfsfIcjOLTRJny4juOIxokvP4MXNrg4XcPp75AiHA/vUN8lrlxHsEhZBHP4M1yGleYaG6za325TplzrC3gqikEfK26tW+baNdS0ePxbPvB2VWA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB8214.eurprd04.prod.outlook.com (2603:10a6:20b:3b0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.18; Wed, 23 Oct
 2024 18:48:43 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%4]) with mapi id 15.20.8069.024; Wed, 23 Oct 2024
 18:48:43 +0000
Date: Wed, 23 Oct 2024 14:48:33 -0400
From: Frank Li <Frank.li@nxp.com>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Conor Dooley <conor+dt@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org, sound-open-firmware@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: imx: add imx95 dts for sof
Message-ID: <ZxlFATZW1BpW2t10@lizhi-Precision-Tower-5810>
References: <20241023162114.3354-1-laurentiumihalcea111@gmail.com>
 <20241023162114.3354-5-laurentiumihalcea111@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023162114.3354-5-laurentiumihalcea111@gmail.com>
X-ClientProxiedBy: BYAPR11CA0044.namprd11.prod.outlook.com
 (2603:10b6:a03:80::21) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB8214:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e8b509f-01f0-411e-d30a-08dcf3935140
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vjqRMfPW1ZUMra4Ezfr2jIB4SOBy/Gr9WUrYZrr0vNX3mCB8H/FWERbvntW3?=
 =?us-ascii?Q?wm8uJGD/6zbAOqYxd01jyju9ndkWwxBdCZHe69cynYy8guY83rcAzMSfIwrC?=
 =?us-ascii?Q?sgJXLS2nzpEgUMK18odmF5dYw/DIjd6Si5MIJyieU8ms8cGtt7oPw8o6mm0w?=
 =?us-ascii?Q?9zW39TCajy2RIGGJxtOo1+/qkc8sZSbyqglKxceHpyDBTR8ofEyf8G3GRO3I?=
 =?us-ascii?Q?8TA4k/oYBZgj9i2q0e0tTCroBt7xtIMJZ2Cc/aUwqKcFOq1ladHsLrqkJOEX?=
 =?us-ascii?Q?k8C64mKJvhKPjHz/xiZYnhLLW0oVk7+4P0LoLmnaQt+XZtBWTuZ0dn/3IB4q?=
 =?us-ascii?Q?36TCqQX0gKOhtKXBRp9OTS2of4GlYEZFbkRC4itA2zzvOnB6B+VhwFZekLiA?=
 =?us-ascii?Q?NCxBoMcJZ2eyyHcHAPScC8bUHKSAWzVf7EpfFAmoOYqthzOZ+S5rgf4s4+uO?=
 =?us-ascii?Q?UHrduIz/aBB3ryLSwTRuYPYtZBfllLZxTh6UCk0V3xYQ7EA9o58pEpYNQ0RV?=
 =?us-ascii?Q?PLR3+NM8/L1jwbx9oklhmGDCKaEZlEx4CWhCBFqBMRUyOkoiDhlqc9G8QNHT?=
 =?us-ascii?Q?zUMKuMCJfJBJoVI3Xk3j6tu4Kp1aqTFZjpKMOOdbjAzmURwOeDKeEQL3+Uxy?=
 =?us-ascii?Q?qSXgHw35qafjLHwAtUHjZaCpCcY946AnakdHNWkvCuLJJt24drPfUlRZc5Hf?=
 =?us-ascii?Q?pHTVk/1HcOLmuGzfhMvuh4vbwL9v3aB234TjisP1bBYG4cAsRBl+p07eNXkL?=
 =?us-ascii?Q?BVDFHSlPXLUXYynY8s8dGLXk9llidclTGy3BiAbUcZoeTfkViQQyTHoKXhgK?=
 =?us-ascii?Q?fXnOY44d+tYxm9NHYC1fQDkRuYivdJy1/AsAcWk40RmxxwiexU9Rakv0kfor?=
 =?us-ascii?Q?r5mM9EaENq9r9gXXcM1sNAwnQrSxCovnVaURUdxuRQiG8rNxWQEKgXGCrA6J?=
 =?us-ascii?Q?iZ3SGjdBjHoy64tU0giXEF5oEPsBpPJtiEMgpIIEBzkvnoJymELn7tkcYjFc?=
 =?us-ascii?Q?nQqtmUeafAjsjwv1fRWs++wgH3bmbz91VOQp3PvhEK3HitAgfVkZu3FRcSbT?=
 =?us-ascii?Q?6RIhrzlomz+7B7eWhI8T/HD8R8Inj23c3GuabYpq2aUvCXxfn1Bi5P2xRMoG?=
 =?us-ascii?Q?VaiD5m5JCgRmtFWACmMeSDO69PqgVwcqgMFCojqZ1m38TZRPSDogxFKEWeNz?=
 =?us-ascii?Q?Zu/3omrQF37HtbjJupXAhMhnJQLnQM82YGXf92lQjqcF9dM1FN6OdXDPLCod?=
 =?us-ascii?Q?RZ5ITvMNlMdU/Eq2vZP2PhVnJrDKnPFUQb+lSQ4kO+43lcqPm3YAh81/3gac?=
 =?us-ascii?Q?gYysjqUWXLkOtWuGHFh6rqXKz95NE5hweFqVwvRrYFnVaeBqFvWTnPYxdCTI?=
 =?us-ascii?Q?BG3jF9lWyzgOrEPX6Hj7pbu1oSj3?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cFw9Gf8wjRWR1nskaAtphQhLs/KssU+sEQKAip4+yy5ostK3rqm7KK1xsbLC?=
 =?us-ascii?Q?sBYW48m62vWtQxYft9C5Qeoh63c5sReDekMT0ZX7JuDahEb+jCalJkdTDdtT?=
 =?us-ascii?Q?zgMniC5D0bU4zCkHe9XmE4Xaql4uu4sutGVHkI7Ji4yt6YQYyQ0rriuevaAA?=
 =?us-ascii?Q?YMijcjbHt7ZefTOJm3iqHYkdRLxUuL3zEs81Ykz8aEbrd3jOXdIHvJCKDtrH?=
 =?us-ascii?Q?+w9em2DXeS2vKnTgaUuycsz15eioo+tFNYOsr1w+l+P+66iELV7k9H1lSO2K?=
 =?us-ascii?Q?hUMfbFm8Sdnd4tRQIJ7YPreXAqcd6cWjTpel+VNuQOvOrLELMLToFAnTroja?=
 =?us-ascii?Q?PEujJi+75rvLTXgSfzOQ42jggaiFPOJcDsOPli6TyEvTFbs7WCsZQ+SfcPBb?=
 =?us-ascii?Q?wRIKb++96XV8iAWGEKGLm/oQ/z193tIEhRLQZngTq9ly+mE5EKFqbYKfZtBl?=
 =?us-ascii?Q?pSkJPNnB6bwjzpmkCPDJF0O6gg/MT57+gL48wRFbB+FFQR4tLIdkY/5ZgbkC?=
 =?us-ascii?Q?+sKuqsY3fqWR4hML4++YExbW/dZKEIsIAJLvQoaD+CpWwExmXR1CV41DAZFI?=
 =?us-ascii?Q?/OB/7QM4CCVrE2wlh1xfFcEmoGfxMSHqeAV3kimCte4/XgThA/TZ+uUcFlum?=
 =?us-ascii?Q?TAWd8ncoPmtrAASR25jL/yde/XA1UZHowPePy8kDox7Jdq+vmcfNeGmilI00?=
 =?us-ascii?Q?og2A76yN5boHMyCIpLfJjKsjNLEBrJpBo8aTSTdVmjAWC+Wv9zrRWZDaiNVs?=
 =?us-ascii?Q?8iNUrGWjunRmlmlm3gEpQLjCyo9X6XzMZ0exo3lNOSWrsJL0wlj3yrqPiRNt?=
 =?us-ascii?Q?p1CkRTmMmYRJPbaebPVxTg5Tp54FbuZiNeN0nzzRZ9M99cORrYkhhdTkrkkj?=
 =?us-ascii?Q?JX/TwFClxK/DUvaMRZvZ4/OjinGt7XXpzWKJ4SRQSEKPcbRVamm69pcRJqHU?=
 =?us-ascii?Q?2Bba1D0sCDP8Nhw727R1E30QTEfSsYoeycdvYGRl7JgHDkWt66XFTd3sMzZg?=
 =?us-ascii?Q?4uzE6w9+r5flHG5r6CeYwJfSy004iWsc+otFYDrN1NiX8ozxJiKXrtD89Fbg?=
 =?us-ascii?Q?W6/md9kIiVCrZpwCgNoCee109mB80+9ms3ET3MMIn/t3IpHhNrDcj+JSoHR5?=
 =?us-ascii?Q?PxEfo6Rdp/lcadEIbH9BQ+9xVOTDg/xsejqE/lax7VsLVy2TjtF6Klj8i3Jl?=
 =?us-ascii?Q?88zksLlhLnDU7eKdzo8+pwUMmEus/ptMa5IXQT3NycFykG7eYwaFUjDGcD2K?=
 =?us-ascii?Q?PONbsBVoavrWViDKkuiyV4I9HjjWDRvwL7zK/GLToiuTDop8BmccwpE4HL6m?=
 =?us-ascii?Q?sMsEUbatjpqh55id+D1YZCjBtwxTQBA+CuZo29wBRuMvn6Oo4xshOo2oNYAd?=
 =?us-ascii?Q?UVU27XmOvXcgn1hQ50JRn8kNDAuEuIncrv50LwGM0PFree5YcPIRNE6B7zdj?=
 =?us-ascii?Q?rUqBGEzfm3w1I4nsdc94UELe2ob9+FrmUfxkEx3G7BwaFLH2KhYc5UuSw3aR?=
 =?us-ascii?Q?S5g4XkB3yf6VyyA39atF90vd5ojFiQakAP0UrsjfBf+n2hePnq25nw8BBNdM?=
 =?us-ascii?Q?EjNPO+O4GkDdbpUY+egspkEwtuGGEDVidRFindlk?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e8b509f-01f0-411e-d30a-08dcf3935140
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 18:48:43.1376
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: McgZ982M/+YdjSjRrE+M6CN8RXR16YUKVYEoQ62NpjL6sOuzyrdWdeFPhrNndDSQGiiq/Hn/NHOkNI784sMahw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8214

On Wed, Oct 23, 2024 at 12:21:14PM -0400, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
> Add imx95 DTS for SOF usage.
>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/Makefile        |  1 +
>  .../dts/freescale/imx95-19x19-evk-sof.dts     | 86 +++++++++++++++++++
>  2 files changed, 87 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts
>
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index 2a69b7ec6d6d..94660e3e8b2b 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -267,6 +267,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxca.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxla.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-var-som-symphony.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-sof.dtb
>
>  imx8mm-kontron-dl-dtbs			:= imx8mm-kontron-bl.dtb imx8mm-kontron-dl.dtbo
>
> diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts
> new file mode 100644
> index 000000000000..b10dc1af5ce2
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts
> @@ -0,0 +1,86 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2024 NXP
> + */
> +
> +/dts-v1/;
> +
> +#include "imx95-19x19-evk.dts"
> +
> +/ {
> +	reserved-memory {
> +		adma_res: memory@86100000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x0 0x86100000 0x0 0x100000>;
> +			no-map;
> +		};
> +	};
> +
> +	sound-wm8962 {
> +		status = "disabled";
> +	};
> +
> +	sof-sound-wm8962 {
> +		compatible = "audio-graph-card2";
> +
> +		links = <&cpu>;
> +		label = "wm8962-audio";
> +
> +		hp-det-gpios = <&gpio2 11 GPIO_ACTIVE_HIGH>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_hp>;
> +
> +		widgets =
> +			"Headphone", "Headphones",
> +			"Microphone", "Headset Mic";
> +		routing =
> +			"Headphones", "HPOUTL",
> +			"Headphones", "HPOUTR",
> +			"Headset Mic", "MICBIAS",
> +			"IN3R", "Headset Mic",
> +			"IN1R", "Headset Mic";
> +	};
> +
> +	sof_cpu: cm7-cpu@80000000 {
> +		compatible = "fsl,imx95-cm7-sof";

needn't space, and remove other extra space.

Can you try https://github.com/lznuaa/dt-format
to order these nodes and properties.

Frank

> +
> +		reg = <0x0 0x80000000 0x0 0x400000>,
> +		      <0x0 0x86000000 0x0 0x3000>;
> +		reg-names = "dram", "mailbox";
> +
> +		memory-region = <&adma_res>;
> +
> +		mboxes = <&mu7 2 0>, <&mu7 2 1>, <&mu7 3 0>, <&mu7 3 1>;
> +		mbox-names = "txdb0", "txdb1", "rxdb0", "rxdb1";
> +
> +		cpu: port {
> +			cpu_ep: endpoint { remote-endpoint = <&codec_ep>; };
> +		};
> +	};
> +};
> +
> +&wm8962 {
> +	assigned-clocks = <&scmi_clk IMX95_CLK_AUDIOPLL1_VCO>,
> +			  <&scmi_clk IMX95_CLK_AUDIOPLL2_VCO>,
> +			  <&scmi_clk IMX95_CLK_AUDIOPLL1>,
> +			  <&scmi_clk IMX95_CLK_AUDIOPLL2>,
> +			  <&scmi_clk IMX95_CLK_SAI3>;
> +	assigned-clock-parents = <0>, <0>, <0>, <0>, <&scmi_clk IMX95_CLK_AUDIOPLL1>;
> +	assigned-clock-rates = <3932160000>, <3612672000>,
> +			       <393216000>, <361267200>,
> +			       <12288000>;
> +	status = "okay";
> +
> +	port {
> +		codec_ep: endpoint { remote-endpoint = <&cpu_ep>; };
> +	};
> +};
> +
> +&edma2 {
> +	dma-channel-mask = <0x3fffffff>, <0xffffffff>;
> +};
> +
> +&sai3 {
> +	status = "disabled";
> +};
> --
> 2.34.1
>
