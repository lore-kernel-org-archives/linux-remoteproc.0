Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013042.outbound.protection.outlook.com [52.101.67.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56026267B69;
	Tue, 25 Feb 2025 10:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740478795; cv=fail; b=lDPNUMRz0GOOPuaHwbPJjkbjAw4c/jovZvzArI0H+mpapSY18/K2djwnEey/lGs/v4XiIGzy317AC3ItkB0uy+Pan7boUvJv/OOwmhaFQTm0RDtS82KhzBxnjlawqj5TH9s2gnHCRIv7VSlN/hAyoncOLnm+/FBYf83lJ6j/I4U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740478795; c=relaxed/simple;
	bh=yH/GkhOIoPrbjX9w6VOEsj9A8WVf/pGS9vOKUFZiFJc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LJhohmfdAFGRjGVrHKzEsSqU/5TprPVqrKs9U/P8yFuCztphsc8c8oFF7v8t64kqZ1O9Hb3p9NjaXtE9zl1pGFhpP6Tdcdq8OJBvPY0RPCzpDUp9mRll6Ta8iKpUmjm39Iv/n/8OKVVNw0bVnW+bew/YdkmgnTKVtB8BooRxkbQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=VSuXJTj7; arc=fail smtp.client-ip=52.101.67.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="VSuXJTj7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VinizK9bzpHvxFsOVX9QCC0hEqpfaD5357k5TJVLOHabz0ZQdjFsCI86VREsPl5GFw8WFZb27xvdnIMVNfnt/NdygQjpWPEzQ/jaHpfMynAy3mfunEXN/04XcxXgEYfecF9b8A6e2n9hvtNcrtpf8yfP1OU5N0hrKrbCPfQqjgyp1OCIFFGEtILSRtPsKEBuvhvDxR96xi6BE49LQq6sMNAUJVU/3eg7PQiRrtbjmYw+AMB1tHYCuzcOeP7WJfAc2foo2nYitXlf/uDqeCt59+4oDKv6iWO5ZRBsKXeK9dz4AuJgjROLyLblEpHbJEXofZvF7sif7YvUf1IRSlGtFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UVR96JO5NvYukhDxGfRwTDxI7xuskvSaWDRPk1ZRriA=;
 b=WbCKyeQ2htFpN4XBwGbiOgSJ9x71KcrXNPA/LdPE68q8AkCN0Mp0R/CcpJ+qgGdcyBVuy/CxeeUjnXMWHJ4zEXmGOmELyXOOTauA8M4XeJTMfUHmD+5peFxgjjw80Ykorvvq2z6l/cinsIOyBMwq6N362BQUL+141zBcys0RueEZM2/E4buo40cRJYPcjYoAmOQ/vcrsTRhNsMsKlFuOjFX44lIQ86zVCCAjZeFAIjyZsP0vOQ6zmiJ5cgyyt/GltE2BKXunEQSZvvQT3BVpz5qtubol/3AEnVWzkpu8vL90jZwtNHgpan3z1JLb9aYxghm58dD481YGKhCSKTo7QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UVR96JO5NvYukhDxGfRwTDxI7xuskvSaWDRPk1ZRriA=;
 b=VSuXJTj76kEPx/cjgJe0V1Fhvzj8eaAonqNqarAKmm1SxekznwMhIVvAiZj7DFj0rd2KNhYUz/KIk1uvoKm8z82dat62/GUORzgukJ8aSWK++NWpxMQKGEBeadhhRTFZ+nqzuVLgoECM5vciGSh1yY+3myXsqFukn+z0g3BunmCFhAO5sGCoD4iGn7zSVPtoyCsWV9GBBbTttBUGllJA5jxfvrY/nPBmehJL7vt0zcUSSQ9rtlieq8ANVOAiwgBLa8wDY6SoTAJ7lNNlIm6LdY/1J9NX1iWKx4QzQjdi19KKeL7RcOVvHsi4AP8VtrOBKg1IQasPg6+m89JbC8NvoA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by DB8PR04MB6971.eurprd04.prod.outlook.com (2603:10a6:10:113::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Tue, 25 Feb
 2025 10:19:50 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6%5]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 10:19:50 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: p.zabel@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	shawnguo@kernel.org,
	mathieu.poirier@linaro.org
Cc: conor+dt@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-remoteproc@vger.kernel.org,
	andersson@kernel.org,
	Frank.Li@nxp.com,
	peng.fan@nxp.com,
	laurentiu.mihalcea@nxp.com,
	iuliana.prodan@nxp.com,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH v3 8/8] imx_dsp_rproc: Use reset controller API to control the DSP
Date: Tue, 25 Feb 2025 12:20:05 +0200
Message-ID: <20250225102005.408773-9-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250225102005.408773-1-daniel.baluta@nxp.com>
References: <20250225102005.408773-1-daniel.baluta@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA1P291CA0015.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::13) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|DB8PR04MB6971:EE_
X-MS-Office365-Filtering-Correlation-Id: f854309a-2722-4520-4890-08dd5585efba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?L3GEWIqVIgvpeV9kmfjn2vcdXg+vNyEAmncZXIKzljAKFpYjBxpJpo21o67K?=
 =?us-ascii?Q?Fjv/nqIOzme/1waUpOwGknUMKY9iIcCFEVje6Q4nfz3XE9sFZbj3sw4Jv9Ih?=
 =?us-ascii?Q?AO0iOg6jlgwUDRx5Npv1FmhDwfs75wvCz2EZ3o6yQfUvpt8dwezPfpAcHoPx?=
 =?us-ascii?Q?w3GqWXukgD7fFd7dKuYJ3M14OxtwqP94RoDtCsOETRsb/Z41L8gumJNePj1z?=
 =?us-ascii?Q?9GLFeHeEkdvXBcx20NWuo2ag27rY71mboDJRXkq+TVsV/S1Z+ZGTivUJnIdA?=
 =?us-ascii?Q?GdI5/sbeQzPzGDFP6rqQuSD7uQA/gIE0UjXB4lABN0CHpkUP8WBYxikbWiRB?=
 =?us-ascii?Q?srzEEoH4cfDFsFXl/XihiZ6sBqc40OXNk8gOQHjRwgIQ7rcss8MSm3myY6YW?=
 =?us-ascii?Q?ZQuosa90/LoDf87MMYNR7aQEOfJ0WVM2uU097YENcK1FZJjtsdWpbN/xV7UM?=
 =?us-ascii?Q?6E2vzL+6DJ+rJtwxV89GyphBKdWdBhpTWSn44Z0zo/XKqH1eyF9+RDI29NMZ?=
 =?us-ascii?Q?zG4dDHwj5l9MH77uJXJgQumO+j8pCeYHeGFxahIiNfplFZJXUEld1npLYZ9r?=
 =?us-ascii?Q?HvsF1YFSHtAjqvNkTQfKTNhzsnCTR2oiIw8FHRj7vysNQXodlG6NFkb3zYH8?=
 =?us-ascii?Q?C0u96PY9sOe9spk00/PI4cbRHvQhPvPCPNmFWToOpGf+yQ1FPaBvvLlXDXre?=
 =?us-ascii?Q?i0/mdRol1sjlUDc0YE+ZUA5Kt86Kd6dRhFdgQExdFbhY5dqmhIsyZkVlwUXd?=
 =?us-ascii?Q?36WstPa4lAKO7TdL8PtIRaozYLWFYanhA7cDKjpNqm2/CJUTc5r2A+X0Zyiq?=
 =?us-ascii?Q?SntFhhey/qxGprLhXhF/wDgRWi2f2JsryA8zffKryz5Ld3q48Myzu/1HgCew?=
 =?us-ascii?Q?TXRAJzA81PZE/WI9vErciv4P0hi391ZnwtCDRz1YYp6lt1O3JyPMo0/+iANK?=
 =?us-ascii?Q?PhGGk3/PyTzD44xhOVyGXeNlICz946aFsY/jPdXlT8U+kBuBUuDKgRK9nIv/?=
 =?us-ascii?Q?CkUk4XOv/p0B9i4XHh9E4PM2LRWtdr772MBl6631SjuVhz0haZpuUqvAyE5T?=
 =?us-ascii?Q?dZpLRX+jnWYnV9836ue2DNoWfBXTa1Ej8+Y1lA32UWbJ4XIrxmdczV63/Tmi?=
 =?us-ascii?Q?yyFI2MZXZKMY6j7oYnbDlJmZiTuNL8YO9NLU9NPPu6hHhzAOHkNXJki0eqUz?=
 =?us-ascii?Q?YpX7HkI5g4LiTlvejuFJwiQH+FqFlzbStdSXjQel5YUVr9diAh9NMA8mGwgI?=
 =?us-ascii?Q?BjrLj77P2ugT0vUTCu4EEtzYIMQ8QYokVoOCgvaw3zlgisgiiukzSh2nvejK?=
 =?us-ascii?Q?OHTbjA8IQ42ZeAu26QhXWvrucxWnQoX6ADYWskNcOr+A1ZbBYYzrkHhW2nzd?=
 =?us-ascii?Q?n42MCp759znsw2SQJXwCHHuJyprfoEcMFfbEGVenL2I9I1YhqtcYVE77PU5I?=
 =?us-ascii?Q?JbWus2Vv/QI6kNuerxGc/iHe+9D+lXos?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GCHgKU60Ie7coSlyn2gwh4/i0JjjJYz6Vf8GL1jnZ6vYKOimJyVJb/w0Dvgs?=
 =?us-ascii?Q?Y3yZbyrvKG6HfJek1Rb9CkXlN8a4e2RJJBxm47XYBCM44smWE5aoVAL7w2eF?=
 =?us-ascii?Q?FFM68h3r7aXSoJ4P9tnSgEdIpYy7k8RGVDnQZvx97cib61wFmFPxuz6k5maL?=
 =?us-ascii?Q?1bv6oH9XrGinaqJo+pgFTdfHOCzUcdwIwf4Sj9C9P8nxCw++wfIHZFLU3lrg?=
 =?us-ascii?Q?angsvlc19rMrT7ZvaMOJ6pVyw6YPZIu3iuZ6obGfZmerx/wgUGj2thrlq4kX?=
 =?us-ascii?Q?SQJushzVV2sHhWHiGylhd7YFogMWQkNuYq6+3EnWtniIMsAci0jo6HREamp+?=
 =?us-ascii?Q?j5nmube+DjL/AcsBNihsC7B9MHWXHcFpd4bFOsCV+dA/6/DHfB45X8boIYam?=
 =?us-ascii?Q?A0cH7s17WG8my3HOJKpwCZ+shwbs3ZW8NKoLWFW26LN9aGuiR+EAHSkT6LWS?=
 =?us-ascii?Q?e45u1tLbM7AIIE+jMcoIYUhgIXVAJc9qruunbugmwirH2ddIA3zYn4hEuvH/?=
 =?us-ascii?Q?VJeODFRxufbiCWq4nYjqBPoGceFRe9XUxLNaQuSPkG0dH4Pmm2Hg+Oqo8236?=
 =?us-ascii?Q?D22DKNNsxfmXyPZqaZTl2eMg3MkPe07qWuwquSxZe/GfljerDldIeYsKnbPI?=
 =?us-ascii?Q?Yif8+MNnmNvZEvEiyathnJ8Bct2ycMD5FW/KeVNdcqryyxR6AB8dbX+ndop2?=
 =?us-ascii?Q?U5AYpMrd5Y5EBrRpmDnVxSHqaiYANCnT5NCNBA5Jy5kPWaNlJyHyaZQr9oVk?=
 =?us-ascii?Q?gDqUYu4ONge0hDPwTxSlhjEfIik1u1FtUUMFGoSrR2aO9z27hMduEDJtKKla?=
 =?us-ascii?Q?eDvHs9DLfSsVt0ntBPXTW0gMYZ9BdX7+4DezREUI2auT/XWq+HnPajF6Md3x?=
 =?us-ascii?Q?YgFD8dNSJbSd4SZJi4v8iOgJJHKerww4uX8ZvYhAPbTtMntjryG+jxuidbog?=
 =?us-ascii?Q?UhABwWM5HjNvzs7ej3XErP3MKK++H1S80Zh6s+6Z26WzDJgmcB3eAu/5+WXz?=
 =?us-ascii?Q?72qyBy6P6CAcWCw0UrXvPjMHx4RCT0fH5bCdu+r6k8CzDSsBYWIptxlQ8TOK?=
 =?us-ascii?Q?Rarkr+OpQz8b7MlZJCeeA5MhcDOEthgXE+sXFUGImuXLV835mpbFHWJmzz39?=
 =?us-ascii?Q?QRUeMK2Pxn0UiSTozRc4ggvxd1jwfQ42bSkCsBfbLd5dKqowN/skp+KJXzw4?=
 =?us-ascii?Q?LOWhVBl9Cl+y23LJ12ylpM4rG0pssUnAjuUXwU33enZ+W0Bx+exvbkYNfCU1?=
 =?us-ascii?Q?4NWfXEDFQ0tfU1eMlpAwLg8t+Hq7ZHS2JBAVAXiYB5WhOBZea9PHgnQLthOU?=
 =?us-ascii?Q?sXZPj6Ap52xdMbYD1y5Lh4N/9Ru6XY/JSLIB9nAyf09JIJamFt9YuZvTuK3S?=
 =?us-ascii?Q?sAb3fUct2wMtnY0U8/n3Pbbz++ImCZnNerq7xRXRD3xOWIP7ZZ6JPvhgw7k3?=
 =?us-ascii?Q?9oWfh/TYxQ1WGU1bmYjSsbw0zPdKGLy05KUwWisfjlz4JIv/szr9jf+NLyDv?=
 =?us-ascii?Q?MhPpEMRovaNY031nAJMxq+gMi31sUd8IfLLvZ0wROdC1R+k4vF/ufjWi9LT+?=
 =?us-ascii?Q?Qf3ZSRvDQ53dtBaWlRSnbfxzGRGBmvH9GkKlj4vs?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f854309a-2722-4520-4890-08dd5585efba
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 10:19:50.6282
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dn1/h8BKeDgHPnZmt7hDjPVclv5oyQqDLzhNNLDnAsg2hKIiOq/phpv1vwEZlOmUiVwdznXKNDKx2uR8mxDS5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6971

DSP on i.MX8MP doesn't have a direct reset line so according to hardware
design team in order to handle assert/deassert/reset functionality we
need to use a combination of control bits from two modules. Audio block
control module for Run/Stall control of the DSP and DAP module in order
to do software reset.

Initial design accessed RunStall bits from audio block control using the
syscon interface but this got NACKed by community because of abusing the
syscon interface [1].

So instead we use the reset controller API.

[1] https://patchwork.kernel.org/project/imx/patch/20250212085222.107102-6-daniel.baluta@nxp.com/

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/remoteproc/imx_dsp_rproc.c | 25 +++++++++++++++++--------
 drivers/remoteproc/imx_rproc.h     |  2 ++
 2 files changed, 19 insertions(+), 8 deletions(-)

diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
index ea5024919c2f..e8552d39abe1 100644
--- a/drivers/remoteproc/imx_dsp_rproc.c
+++ b/drivers/remoteproc/imx_dsp_rproc.c
@@ -19,6 +19,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/remoteproc.h>
+#include <linux/reset.h>
 #include <linux/slab.h>
 
 #include "imx_rproc.h"
@@ -111,6 +112,7 @@ enum imx_dsp_rp_mbox_messages {
  */
 struct imx_dsp_rproc {
 	struct regmap				*regmap;
+	struct reset_control			*run_stall;
 	struct rproc				*rproc;
 	const struct imx_dsp_rproc_dcfg		*dsp_dcfg;
 	struct clk_bulk_data			clks[DSP_RPROC_CLK_MAX];
@@ -192,9 +194,7 @@ static int imx8mp_dsp_reset(struct imx_dsp_rproc *priv)
 	/* Keep reset asserted for 10 cycles */
 	usleep_range(1, 2);
 
-	regmap_update_bits(priv->regmap, IMX8M_AudioDSP_REG2,
-			   IMX8M_AudioDSP_REG2_RUNSTALL,
-			   IMX8M_AudioDSP_REG2_RUNSTALL);
+	reset_control_assert(priv->run_stall);
 
 	/* Take the DSP out of reset and keep stalled for FW loading */
 	pwrctl = readl(dap + IMX8M_DAP_PWRCTL);
@@ -231,13 +231,9 @@ static int imx8ulp_dsp_reset(struct imx_dsp_rproc *priv)
 
 /* Specific configuration for i.MX8MP */
 static const struct imx_rproc_dcfg dsp_rproc_cfg_imx8mp = {
-	.src_reg	= IMX8M_AudioDSP_REG2,
-	.src_mask	= IMX8M_AudioDSP_REG2_RUNSTALL,
-	.src_start	= 0,
-	.src_stop	= IMX8M_AudioDSP_REG2_RUNSTALL,
 	.att		= imx_dsp_rproc_att_imx8mp,
 	.att_size	= ARRAY_SIZE(imx_dsp_rproc_att_imx8mp),
-	.method		= IMX_RPROC_MMIO,
+	.method		= IMX_RPROC_RESET_CONTROLLER,
 };
 
 static const struct imx_dsp_rproc_dcfg imx_dsp_rproc_cfg_imx8mp = {
@@ -329,6 +325,9 @@ static int imx_dsp_rproc_start(struct rproc *rproc)
 					  true,
 					  rproc->bootaddr);
 		break;
+	case IMX_RPROC_RESET_CONTROLLER:
+		ret = reset_control_deassert(priv->run_stall);
+		break;
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -369,6 +368,9 @@ static int imx_dsp_rproc_stop(struct rproc *rproc)
 					  false,
 					  rproc->bootaddr);
 		break;
+	case IMX_RPROC_RESET_CONTROLLER:
+		ret = reset_control_assert(priv->run_stall);
+		break;
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -995,6 +997,13 @@ static int imx_dsp_rproc_detect_mode(struct imx_dsp_rproc *priv)
 
 		priv->regmap = regmap;
 		break;
+	case IMX_RPROC_RESET_CONTROLLER:
+		priv->run_stall = devm_reset_control_get_exclusive(dev, NULL);
+		if (IS_ERR(priv->run_stall)) {
+			dev_err(dev, "Failed to get DSP reset control\n");
+			return PTR_ERR(priv->run_stall);
+		}
+		break;
 	default:
 		ret = -EOPNOTSUPP;
 		break;
diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
index 17a7d051c531..cfd38d37e146 100644
--- a/drivers/remoteproc/imx_rproc.h
+++ b/drivers/remoteproc/imx_rproc.h
@@ -24,6 +24,8 @@ enum imx_rproc_method {
 	IMX_RPROC_SMC,
 	/* Through System Control Unit API */
 	IMX_RPROC_SCU_API,
+	/* Through Reset Controller API */
+	IMX_RPROC_RESET_CONTROLLER,
 };
 
 /* dcfg flags */
-- 
2.43.0

