Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2040.outbound.protection.outlook.com [40.107.20.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1CF238175;
	Tue, 11 Mar 2025 08:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741683437; cv=fail; b=p2051gPPqLYTa0wA+mXDxEUsErlsVmLgzph2O7JXrh7gAsL5QRUc1d3cgE0ohtIeEz6lT8Qo2C/5CgwnRL2uWLRgQsd1lXcp366sQ3bJEzo9lRSI7pGz00XMYZpVPWu443L82v0zomwOtpL1uK6pkBcSaWpbkgKH0RnDrkjLfuo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741683437; c=relaxed/simple;
	bh=lY3yLs/3y34/Y7/aMVrYgQr49b0QVWqFThHeSSYxeDM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TAdy3TB7nWv8NzLOd4s3iy6GKSj67FyAliJx2WFhvBnUuRHVU0uw/JzlqzrpB/4/78wDZFcP2FQVBpI1Tqh7qgeu7Uxuf3JwVoKEIQJD0Jtk78NF6ptDv5H/MQ7yyNdaPTexhc/HAM6DJNFg44ld9a9sJ22DgmuXZhDtQenKf8I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=esgQ6akl; arc=fail smtp.client-ip=40.107.20.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="esgQ6akl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AI582a9IY8k1JiS8CBDvdYt+rfRWmprba95MnSuYlgSNm//skau8AMXYxugqwtSrsqBmb+tMvWwevZj2TZQp3BRcpBHFofe90cMBkhJDp246SY6AMrjHlc7Q4HR224booBm7ALTZkegXOTQEq8dc0gBsdwXC7WOftEVNHOaQJqgEos7rFRj9hnhn+dLHWykAjruonY/1pmAsn7BXLYryA0gv8blEIWvUOVKmR6Cyj8cyoSQv9fgLohkjgcsuV39UUeS4dlqDStdoVFp/GklOIKbntJ6W/h76yXTK3CZuF1zFnOvUFBSdeJUSA4RaZUGOdpt1s8TPH7lLtFWwAq8Gwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pED2pmiJ8U12yaI3263QM8W7PTE15Z/WKgBiLUyw7XA=;
 b=V1HvLZVqJxxoV8NTABDoWIRpI6Bx3byMCxwxRzLulVwO3FPCE8gayv29DDCGbo/HFIYIaM6pdZXTnPSZILpw9YuTXxzrcPD1HxF3BL03j42zr4/3eOa1pdDUjMHdBsiZGxvxp4rjq+Bb7B8eXfArtoUSyjFEvIxEn+tloqT8YQYF0e+O4bfki6zsTGIF91OlmGvA4/MXOmJBta24oNsfVM4nqfu+TtnUK/jTp2UGZmTNhG4LMGPiLN61OmDIHs239M6nDKQS5ibEf//NMyBTZEoFJ3/DviOMNGVtaKUJOhvhXpGGcywXG9nGxUs0Tva/LIC+5tm7RZx04biL/fVtOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pED2pmiJ8U12yaI3263QM8W7PTE15Z/WKgBiLUyw7XA=;
 b=esgQ6aklpLkrJNZsi5va4cZrse8X2pMOVi71oH0YCR2cRvSpklKMz+WmK8G/RVZ8dyRkV1wVQL09IUyXCpfeRSfguB04PRYwu1Vy520+Zld4Lw9Xys1mLjKEQI6riuFJfTELimpXsv7bCMuo56Th26b/w7pHceiTbq+2bCx9v23NheX50h6ATrAUM2EYZatM/DIGa6SqA6zhPeEeHFGQ3loGo80nTlQW/m0m24wkbMYbrQo2gBayu6iCka/dPXN9Eh8Db41AeQrqt0Syf6PO/3Ng64ZScEreWOgh+R32+HIoRwQ1xr15lDIoH3klW12FPdIJQ1avkv5Q3ZqopVw5kw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by DBAPR04MB7431.eurprd04.prod.outlook.com (2603:10a6:10:1a1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 08:57:09 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6%5]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 08:57:09 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: p.zabel@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	shawnguo@kernel.org,
	mathieu.poirier@linaro.org,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Cc: conor+dt@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	andersson@kernel.org,
	Frank.Li@nxp.com,
	peng.fan@nxp.com,
	laurentiu.mihalcea@nxp.com,
	iuliana.prodan@nxp.com,
	shengjiu.wang@nxp.com,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH v5 8/8] imx_dsp_rproc: Use reset controller API to control the DSP
Date: Tue, 11 Mar 2025 10:58:11 +0200
Message-ID: <20250311085812.1296243-9-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250311085812.1296243-1-daniel.baluta@nxp.com>
References: <20250311085812.1296243-1-daniel.baluta@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM9P195CA0009.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::14) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|DBAPR04MB7431:EE_
X-MS-Office365-Filtering-Correlation-Id: 344db6aa-81fc-4115-a768-08dd607ab48d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1BEwh4VUsutGG8STP9G9+qqy206JkeQ18ErbwvGDBkNhfEkSkT0WPuFe58Lu?=
 =?us-ascii?Q?YHwPtztJk0l3V1KDqzmnayjyfrm9Lh1vexGBUebFI6OIPj6pqlQhRMKs7Ctb?=
 =?us-ascii?Q?Nbwu0BP3imtuj5CEY3Hu+d6DppCAEPKazwVOQUYggIO3p9+0yFz4aM40Jx3j?=
 =?us-ascii?Q?AGcG/uPPbBV8oJMX0yw3P1GgZetGCxx/qoXGbWurAY5Eh6bep9OdfQMmCSJQ?=
 =?us-ascii?Q?yy9QLY6sWlue0i1MnICucGvEU8YjA8kjMXAH2w/PUxNKkeaDuVNM0ZgMLbUA?=
 =?us-ascii?Q?xkkPHke29BgElwRVOUe9ZleRnEuRHlOWz6mfsfM+aDnoblFvgLZhSBvHZl8b?=
 =?us-ascii?Q?OjFi/REApSUoLK6HNGDK6jjUU/YLvxC04E+lIQPj1wGP3PWx/OmCX+1pt0K1?=
 =?us-ascii?Q?SoAQvvAUeyf3WhcZhrc7DOgs5sP/s83Wdqf8p6k0r2zVxnJrE0ixLmy+4WvU?=
 =?us-ascii?Q?CQvhvyZKOJQzfW1Wk5hkuYoeGeNzCRP9BL1Jr0W+sQ+BhKDW8adOZ/C/mO0q?=
 =?us-ascii?Q?iyet7r9iF0I/RZpNckAJ7Qhd7NsPIFybYc643dK0fZANz+njXgXvppG7bai0?=
 =?us-ascii?Q?gqNaQF1zM7D5HWz/XiSoQmcO0cHrtalx6IAd/FgRUpCgdrRfJLmNw1erEMLn?=
 =?us-ascii?Q?YocMLD+TT68XaI4M8+/djPLa7gfvE+fAlCLK33MDf9F99NZLATuOLgZsYbr5?=
 =?us-ascii?Q?n47nEbKkYGjGu+YtIKRpHj6KssJMg1wd0r5rMEiuDjoOqVBEkCG7nEKaF5L0?=
 =?us-ascii?Q?skUF4uZSEbI2+N9rDo1nlkWyWHdOS9s0A0UVNIFlN5HVFbe0ut5M+LW2K0wJ?=
 =?us-ascii?Q?gDZVwdJE4t4N7kU5fGrinhHJM5v58dtHFKZ1U9xPaAlyWtQAMu9CGxwhqAT0?=
 =?us-ascii?Q?BHUDkjZSNzpkMyBYWY2DlAi9nZacSORJxmUqZrxlTtwoSIx+rAJw1aGIrkxL?=
 =?us-ascii?Q?YrVvB7oDmoe/zm4FH6bGmS+Pmg8JOTnM4b5qPMyS6tnwHg4eON1z9ThiLJRc?=
 =?us-ascii?Q?cZhqRgGRhGaj40JUv2bVYxAJIa19tqAgmpbK/501eme1PyXoFH9KXG7UcvTz?=
 =?us-ascii?Q?5r4+dG77burWwrIB8Dub96epjSTp4sjaVTjeCEUUVBoRWkOMOOqAvpwndFkx?=
 =?us-ascii?Q?DuC05P6O9BzrpfUwH/BuE5HnwhVpymefqE/q0hdhqGQHcG5dco8UANpO2OdC?=
 =?us-ascii?Q?e1N1WwqQ+5dpOkMpqpCa64PwhkuyFvHZbExNzbUxJd1MTlwG+/N7XnFTg51Q?=
 =?us-ascii?Q?/tEPrcjhUJUXu14RBFBwXjVhfpH3Y9LGEGVBnayXbYID+CdxnDdzQKfhJX5T?=
 =?us-ascii?Q?RBinB88xmfiSMyqYeuw44UMnrG2k2mhZJ53CNUkk0JHINcS3NnJ3xKDF5Glb?=
 =?us-ascii?Q?TU4fN7OabRzr0NeIN12aUIL5snNRfBqN/APfEOgAWaWcvu+jsXKeUOcFvZDT?=
 =?us-ascii?Q?ZvfynkEyD7/MT9c+TZ0z6UpBYN+gfhf+?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NDB4E4dzkSjpjWb02N+Ku1qaawGzZJ+IMGgv0p3QoutVRnT3VoowWjjKolcA?=
 =?us-ascii?Q?hho7DF/3Ry/WDDXmgxlkty8CIwoAUmKYbc7DLCav7pOCcq9uS/2PYDN6tYFe?=
 =?us-ascii?Q?urcZymC6ycIRBcq3MHtCiZPwE0lAjvJnyaM9EOSgSKuyoSQ/jsWeVjpqMjU6?=
 =?us-ascii?Q?i2OG/DasxGX5NIGhZEgrqp61Xw87uTclUWkyoxRsCp6grlTeNGeW9693jE8Y?=
 =?us-ascii?Q?reX6JZ9IrseIMHSjiXCM645A2Zke4XyOQfv1tiMl72qDEW6hiFsfQP2C3Elp?=
 =?us-ascii?Q?vf0E2h/FdrVxjqbXU793C8dlbWxJMwDa4tSXR7EBmmUdnZIgWdMLE4tdMJjZ?=
 =?us-ascii?Q?8tgc4JElNUmEfo3ZZHsKzRznEzPQlSi9Ghi+el/u/8mfVpLsnzI0XNRzIU03?=
 =?us-ascii?Q?vpQO2uvW0LwIqs3X+j9Pdlyj5/qQVQOf308gqIOPNA+H82eTVNCnDjflro50?=
 =?us-ascii?Q?ubNem33fiLD9BLDl1bOGYCfnGTG7zrsvS0YyvxUg9SqS/gBDCpzlryWvP5GA?=
 =?us-ascii?Q?n1luRCro1+BnrdG31FZ2XCnJEFSLdmzO8IGLOu8pgi+qVmmSdYD+HsAoE/3/?=
 =?us-ascii?Q?UoukPyIP1OJ5aIeP+7anPxiCSgkPNiY3y40N2OmJl9UWt6HN1jgSvw3Net8Q?=
 =?us-ascii?Q?ohEJzEBHxMxQuu68eGL/V4taIRF1HuyDjy3L72FkTLcftaFxt0XoGfIlylFa?=
 =?us-ascii?Q?EwN3A8hnpS0mRa5Rp1wMAGQJ8Eo4a2KazZW0I4ooyLh7GzpWZJDWylc2L1fM?=
 =?us-ascii?Q?OCMWRz6UFKS6yEHBUPXAIJFA9D23LBpNnjoQ6G5Pv3jETdTjYzHRufvBCSwk?=
 =?us-ascii?Q?v1U6tl62VaXKqFAKs4WFGQzb2BawaFo6JpqCSEySv3RlbY+9RqklsB7YylQM?=
 =?us-ascii?Q?fyTTftTAJmprp5+HbWiUG7DTgEdagbWUxvL3eDRyup+BYHjAmRGixTMWJjuv?=
 =?us-ascii?Q?JxO3Dn7skyZU39abWZDpobMe7L2isFYSwNrso+9fKVISvXAHcOSJ2uUm5gx+?=
 =?us-ascii?Q?tvFeLpFe1eBO19tSVOp8hFxlnCP290o6r6q6QbMmi3elDRHTd9hwJGlJDFev?=
 =?us-ascii?Q?9dWkgL7+SOS/2k3PZa0asiRlDAZSGAN36kACiGr+o6w/xHFQRb8aACOeeu0j?=
 =?us-ascii?Q?NR9G3t9suBahQRAlmNg6flWkyuzIslTOvnN9l6+Jindbe9qx+nx3FBaLGjVl?=
 =?us-ascii?Q?EFFzQH0z19meVeeIHIopNiF38vbTMYvNl+8/iFYF4ZfC4H/8Zr2VCedNMStw?=
 =?us-ascii?Q?Ca4Bn1Ur0VB/4JFQRfcE0W/dpfqNK9ipG4ywImb/URXwEKdQS+FQRDehA37H?=
 =?us-ascii?Q?q1jSm7B5ehq9CrtMpHmnnPRdQkjVosdcBzlDgAzoJYqfxGjfz1d2R+r97qSB?=
 =?us-ascii?Q?I1Us7VFjPzqK24onuW5aHpzwj4I1JTn3Pvm1+DQfsqbVhAMuV7bwf9T4NyQc?=
 =?us-ascii?Q?L3L5rGUKbhHP7B137XUUG2yNYnajTKit7O8W2q8Gi8Wu+aq8jNtsjbuXkWRs?=
 =?us-ascii?Q?CQSjEfdAconc8CUfcsMRazu8Mq8E1fl9XMzzSwp4rrvevk2SSoiSKibykTri?=
 =?us-ascii?Q?75iornw+pAsFJEkzbcZiO8g/GgOKgP5xtt7NI4wU?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 344db6aa-81fc-4115-a768-08dd607ab48d
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 08:57:09.1870
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uauNgyQM99HxxuOF+Cn3y5iQYyFJoGKw3sngzjyoIFKO2IyvqFvGVUY5YF3MlGLOMcPjYIgPMVyRwLEsWJVQxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7431

DSP on i.MX8MP doesn't have a direct reset line so according to hardware
design team in order to handle assert/deassert/reset functionality we
need to use a combination of control bits from two modules. Audio block
control module for Run/Stall control of the DSP and DAP module in order
to do software reset.

In a first step, for i.MX8MP we are switching on using the reset
controller API to handle the DSP Run/Stall bits i.MX8MP. This comes with
the advantage of offering a better probe ordering and a more natural way
of abstracting the Audio block control bits.

[1] https://patchwork.kernel.org/project/imx/patch/20250212085222.107102-6-daniel.baluta@nxp.com/

Reviewed-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 drivers/remoteproc/imx_dsp_rproc.c | 25 +++++++++++++++++--------
 drivers/remoteproc/imx_rproc.h     |  2 ++
 2 files changed, 19 insertions(+), 8 deletions(-)

diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
index ea5024919c2f..bc60edcdd661 100644
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
+		priv->run_stall = devm_reset_control_get_exclusive(dev, "runstall");
+		if (IS_ERR(priv->run_stall)) {
+			dev_err(dev, "Failed to get DSP runstall reset control\n");
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

