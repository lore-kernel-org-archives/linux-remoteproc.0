Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011003.outbound.protection.outlook.com [40.107.130.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE9F2D5922;
	Mon, 11 May 2026 06:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778482673; cv=fail; b=RtkE9Daci4v78j5E/UrzpPOdS7K3dUYO/sbFLsR5KYQx8jAL2gtYKUsbnAusR6Cnx/yw0XbAPgWd4vgC38ayxSpDF5OITMJJ6es59dq702zy0VC9cBZmcHNTI7qCtHtXVVWc9gcH7f3fTe+kou8YC6fcU/J75otBZdcRGGJaI+Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778482673; c=relaxed/simple;
	bh=lwsk96Crtta6NG1+Z28CsbiNTU89z4zD5UuN3meuxXA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=u1KZVSOHUkuLdCaklHHaAltXVuKYa37OKCZBQkpHf8tfmjvhrynkmj72/K5LUBmWwO8A6g4dgcCv+jNNgiwCU/n4U0DTSTREtFceGCIBYNUKh8haCzOvpXNEuuleHVlxlla/6ikDX8ccRdqk/GxfVtX1day1HbgEJB8tMRYwOP4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Z8Dmx/o5; arc=fail smtp.client-ip=40.107.130.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Z8Dmx/o5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a6Lzy5J3bY64CMHZBSw9jpmUGStqu2kjp5pnihphVWgnevRF9oHyjg0oZ6RBEXZRCu3O2MdNp4KA8+nmx7ulFEFislgSzQKlOCD7b+NEbbnS/jBFYpZxGeTAYP+tsrAwOt6t43XOi5zOY9ZXPxNg6tQQ/rJyquhIJYkMDsOhk2Kh4AywUiITbfjE+rRb4U7A7cR9lWn2IPrt6/bw9OdjHN8Ex8hZInzytHtHHpbkMVWmOcsWcRF5FLaPk/7ZPJgNAoMf16y4N2ASt5NOrYSV2dFQVEQkevuCWf8Rj3c9cES6nJY/HbJiWfNYeIgEFkj/hk0Lz9QXo7K3z7KmynuyVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w+knT8tQ8bP1GV3lpEZTxlMkMNNnEeEy4G3ws58vXRk=;
 b=KTMWAq69L/tLoRAefLhydJZXlnPOzoo1JtQpv5sJMZJsTCpm4t79mpc70f2zW0B6Zquch+zGdhqL/s+A2cDHCanIrd6nLi7JRibw7//h7M0OaGQFN++fxZj/wLE7TTPDH9CiKCwFCISWxGScKTwOgcnIL0dC8Phg+uh9ximvjord8Hf9LZQ4hlKj6z0dRDwBRNpW5WAIzfHyqk1fNpDlqfK+ROmMLKqQRI/E/+OPWXIe1swAPuPADWcpUHnBE2nD2UDzgBBw/1JwX2FPNEY84qy5wJJrIeq+9W8rZvRZ/XAmFcPmTeQFE0gGIStWHANAbDqCEcc2XFtNOzyy4u6q4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w+knT8tQ8bP1GV3lpEZTxlMkMNNnEeEy4G3ws58vXRk=;
 b=Z8Dmx/o5WyDnQ2GI917hu5ZM6FXwH9sk/4sbzWneEBW1nmrCKVGmxDQK9ucC2xX0Uo/1lNDbRCpAfIS945UJ1KD0IpIIBv7dyCYZ/Q1jvOG5+zUf4rpfB5wUEYKcF3xjS4mk5MPBpVXs6/mAU40i1yK9vJYKXSurq6u333L8V+vZDA+Kj3j+iyHxnkfJX5xxDFEaw6w9WFKgxQ/g+Nn1ib+4q2mQEOZLe20pOYZB/hunmLG03+iWL84g1wg7J9aNf0e6Q/fgTcmKC3Evu1vUoIi8vjiintAAFX7l1+EwB+MSjPsak+yh0RZbKOJNksqcOM74+qCa8YWPolFdA23iLg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com (2603:10a6:501:7f::23)
 by VI0PR04MB10232.eurprd04.prod.outlook.com (2603:10a6:800:241::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Mon, 11 May
 2026 06:57:46 +0000
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889]) by MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889%6]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 06:57:45 +0000
Date: Mon, 11 May 2026 15:00:25 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Jiafei Pan <Jiafei.Pan@nxp.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, peng.fan@nxp.com,
	Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Zhiqiang.Hou@nxp.com, mingkai.hu@nxp.com,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 0/4] remoteproc: add Cortex-A Core remoteproc support
 on i.MX platforms
Message-ID: <agF+iYRfUIoBu35M@shlinux89>
References: <20260511023928.39640-1-Jiafei.Pan@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511023928.39640-1-Jiafei.Pan@nxp.com>
X-ClientProxiedBy: MA5P287CA0188.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b6::15) To MRWPR04MB12330.eurprd04.prod.outlook.com
 (2603:10a6:501:7f::23)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWPR04MB12330:EE_|VI0PR04MB10232:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f553ecc-6235-4d01-1d7a-08deaf2a9ab3
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|52116014|19092799006|1800799024|22082099003|56012099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	2O20byyUBvqa+D9aCzQOuI6r1Bh62H4w1YuI9aWES/tYeAMtB4UO9HRdjsRVp5tvizAg0wYyPOVay7jeQGWf4ZNRLMtjtvh1R3S7Zom6IvEqt//99u7da5c3drNNHviTs/5uGh2YDnrLF8Kvs+EA9qtG2bCKUo+x25sqpukvNTWZWnvcS9c5I8OMCKf3fUXtMHmDo5cDgEpEx8uR1Upy7lccu2FLs7vb+vCQRFr9GAtI0454q8prXcKnQinhq3ZlODMIWuIMyjfkWxR5IHHqZZn1iYOwkbrZpCDpR1piGLimAL5JgBadz2XPsIpew30SZqFXL7gMmdGNVKC4cbMbFc5CGd41oN64fzX1csHMhZ40VtzOFIErpZ+lZpbEBZbHmodF2zHDw/iu8IAazZkYrrJndCr6rfOJss0IV77X6jTsfxfoWQbCZaZvSBg49xOACbQxpJIVC7z+/ECa6Qyec+6KqTmkNArKf/XcE5JMqI5S6REbwjuebAllo+8Sj/zCoUVX6R+EgdqVv4gubAA9OdZSiZ/CcOWO/PDhXSM9N1eXFsPTTytMpMXR8nouvOyrz30TJQt9uOMThniOzurly23Kti/5x1RncykNU2sGt71DT0w23B8yzn5X48I+p0bxBvSaYzLA3ZCoEVVk8CQJ3gK6JAzTi2GMm0+qnEuZ4OzXDnj6kkUPpQTLeOevFQW0iHlWjcOS9F7R621BHWC1MFnM9MqOH55CoX+HZqQ+PDb94aO7t2hn2ozOhlmpEVGe
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWPR04MB12330.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(19092799006)(1800799024)(22082099003)(56012099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?e3aR1aDB1hwW4yXjIs6v8554yfDOnc9yVPeVBVW/u9UjHYN0a+7hNyKquf+l?=
 =?us-ascii?Q?qnZ1jNAfpV89BmKIjMmUY5eMrOJSgyTsMXj69Dp6ZNMhcemjNKifXwVyvIt1?=
 =?us-ascii?Q?+LEH+oA3QEWP4KkfMD8jhA5Q2INfcIlW5rvPw+qk2dK1/Im5+vehUh24SLOI?=
 =?us-ascii?Q?wwnwabLy4IqjKzBJ/nHWzIgU7jmMBYO7RzjVv7O4EwcpogWFU4gIJ85rKFWW?=
 =?us-ascii?Q?Yr7IY7ufoJlKVBRc3xz1udOcCj2l5RGywQksDdV5t7KIQh7GcXe9jZKWpbM7?=
 =?us-ascii?Q?cXOQBEW3nWb/kld+lIoGCSIH0ayyo8o4Xh4JlR4fOhcykFsXu8tjhrkwoBBA?=
 =?us-ascii?Q?DgzkArkUCP8ZEEGwOrdXdVu17rx9Ux3+jhUcFiJsH/QrbFn/dcLrpTC7gkml?=
 =?us-ascii?Q?hFIW7kXCOgrUOfZkw6664y7LkbUYRFSrwSNVNKIqGDuw/GvMvMRq1XTCeXBl?=
 =?us-ascii?Q?IvSu4tnFzUPb5lbReJFmiLXCxPd/07PfzW3ssRIiZsfrWdZq8FkcDT9buTsE?=
 =?us-ascii?Q?RDXg9u5J3ejnk5ENyGe2CbDFSPyzrCjwjeJ4zW7Z0wNUwhLMzbuPnOD4Gfqo?=
 =?us-ascii?Q?hWzKZmBYrTo5wnKbIPWxboxVwzXM1xXg7po5AyfA9f1GujcSMAlNjPDgIdNh?=
 =?us-ascii?Q?SEa5E2YTxs3FHQIhpigca/fZxMuaXVnMwcYo9xt0wAXsyMAU83j3Thl4M/ay?=
 =?us-ascii?Q?9+qdA71fQfTPsYteD8mh/WJy4BHdVhcYJmuws5MJye+uSj1BvOL3lZINBbQd?=
 =?us-ascii?Q?DsWUaRtk+dQc0a3FPpm3VLQST5mrbdRjd5+eSmFXNJuQkcPx7cmGq2LrmJph?=
 =?us-ascii?Q?TfOFT8DNnN1cn8tL9Gtnq/qVCLWyQKS90sPH+3R7cjHfzpceQ+tTLfdawhJM?=
 =?us-ascii?Q?uk9sdnIQtawmKBCqNmo6r6PFuqAc0nmiBf/4c6ec+Ow3LboKqwugAwCO8V9+?=
 =?us-ascii?Q?0rHTG3vHgteLIpk2yGuAPv/33MMlxZW2Xr5zvyZTwnuCnQt34XxoBnPMT8lb?=
 =?us-ascii?Q?SvCwrv42ZYGj6okxOeimK47K3E9+XiY1ZHhULPby6pUApsbJSwKt4EWhlgIE?=
 =?us-ascii?Q?SaYqWNhVBDW7q3CvZ9nLZ5+bfg8+q4PXdYoojb18neaeJAgyxt1g61HJpLgG?=
 =?us-ascii?Q?a5BPXhTO1CiYw8xDIlda0/V7exDku6B/DVpXz93fw20tuSu0VGH+OBI2gZCC?=
 =?us-ascii?Q?WoBpTNrteZ1WLYVt4aCkr987jhYkV3AyMswotiMhUBcVMLqJKOZGRfjB4Xt+?=
 =?us-ascii?Q?bOG/Gr1mfOIAjqs71rTkmyi1XLVsHqSDHuPs8NeS2kz6edvjNdNuEINnMdz7?=
 =?us-ascii?Q?4jo4lpR9xTctuo48XMMWL28OorxlkhdWM51Stffcd6U0fkR2bkPix5nh9i+r?=
 =?us-ascii?Q?wYcXTrpMLg7/8/Bop69s9A115l8KPu9dNAAu/6QiBrYaTiWr+Lfk5LMgyXLD?=
 =?us-ascii?Q?kFEBGmmw6ryj3N2AoVJ2YbDoedmCTmA2HrpvLNyuCC+dkjoQJVlN8g/RarnG?=
 =?us-ascii?Q?waR34GvWI+fKTJp1fBRJOLDIeqJc1VmSU68MN/kmfix25S2UPrIJNLKKybC/?=
 =?us-ascii?Q?6EXCflNwpX2ZufOZoOHE453gMwdQ3HJCiJ4gI5TKvGHvl0VlWOWrdUTMTKRg?=
 =?us-ascii?Q?SLgZhZhH6jdb6nRoArZgsiItlRuGAaT8aRdMP+ZUnpE3hdmsvKR1STNeQIPh?=
 =?us-ascii?Q?m9iUAbmXeeWhUTa5/BZCYTAlsKVDaXjZIrqUf+0G5sGAmH7DOVLG0/2e79kS?=
 =?us-ascii?Q?LWVW8UUckA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f553ecc-6235-4d01-1d7a-08deaf2a9ab3
X-MS-Exchange-CrossTenant-AuthSource: MRWPR04MB12330.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 06:57:45.4846
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3SbiQV5FQ1T57Z98krH9P9JAbzZz3+/8l0NiIKG+rXr655GcX5Yi3Zy/FqrwgNRAej9XN4BGg6FCQgJCzFYRbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10232

Hi Jiafei,

On Mon, May 11, 2026 at 10:39:24AM +0800, Jiafei Pan wrote:
>This patch series is to add remoteproc support on Cortex-A Core of i.MX platforms:
>1. Adding dts binding for Cortex-A Core remoteproc
>2. Enable Cortex-A Core remoteproc support in remoteproc driver
>3. Adding dts example on imx93 platforms.

Normally, we only keep one patch or patch series from the same author that
modifies the same file in the review queue at a time.

You already have a patch for imx_rproc.c currently under review(got R-b, but
need Mathieu to handle), so this patch series might be delayed to be reviewed.

As I have replied in internal, to make multiple OS run on Cortex-A SMP without
hypervsior, some GIC changes are required, without those GIC changes,
this patchset is not testable using upstream tree.

Thanks,
Peng

>
>Signed-off-by: Jiafei Pan <Jiafei.Pan@nxp.com>
>
>---
>Changes in v3:
>- Fixed dt_binding_check warnings
>- Updated prefix of patch subject
>
>Changes in v2:
>- Update arch/arm64/boot/dts/freescale/Makefile to add new dts
>
>---
>Hou Zhiqiang (1):
>  remoteproc: imx_rproc: add autoboot support for A-core
>
>Jiafei Pan (3):
>  dt-bindings: remoteproc: add imx-rproc-psci
>  remoteproc: imx_rproc: add support for Cortex-A Core
>  arm64: dts: imx93: Cortex-A Core remoteproc device node
>
> .../remoteproc/fsl,imx-rproc-psci.yaml        |  51 ++++++
> arch/arm64/boot/dts/freescale/Makefile        |   2 +
> .../imx93-11x11-evk-multicore-rtos.dts        |  39 +++++
> .../imx93-14x14-evk-multicore-rtos.dts        |  39 +++++
> .../boot/dts/freescale/imx93-rproc-ca55.dtsi  |  14 ++
> drivers/remoteproc/imx_rproc.c                | 150 ++++++++++++++++++
> drivers/remoteproc/imx_rproc.h                |   2 +
> 7 files changed, 297 insertions(+)
> create mode 100644 Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc-psci.yaml
> create mode 100644 arch/arm64/boot/dts/freescale/imx93-11x11-evk-multicore-rtos.dts
> create mode 100644 arch/arm64/boot/dts/freescale/imx93-14x14-evk-multicore-rtos.dts
> create mode 100644 arch/arm64/boot/dts/freescale/imx93-rproc-ca55.dtsi
>
>-- 
>2.43.0
>
