Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2040.outbound.protection.outlook.com [40.107.20.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81F2207A03;
	Wed,  5 Mar 2025 10:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741168885; cv=fail; b=Vq8Gd6gNfFHAzt9dgWwIDe0i7QKM8ESUl7afJHRh+w1g+vpG9hg+glpbC4cCLTbtpdblij/A+0jFR1mdnf/9PTPxoVkVqWPRNq1nxOmTc1A9Q74RPolJwaHECq2a2b/4s0ouKE9SByLvpwXEasTY0twhHNSfjoZmDu6RJxDmhkA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741168885; c=relaxed/simple;
	bh=WcbGSF7kL35sAFpaN4tmka6+hfVyeUeUYh1LaGlM9fE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dT4wWS1bBWqKge/cpAJLSktbpYjW7ISeFYdm1DvtnwJZHf8qPVS2uzTqIPWjWeja43xpOEylpK+NUigQsqSF3+R/4iIueuczCE4IDP2/8+AL5bX4wYBvlKbCsaLLNNceSQAu9+qljtKIftKFq17iGks1J3UUCsoiVFZ7lr0C3sY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=aSii665l; arc=fail smtp.client-ip=40.107.20.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="aSii665l"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=um4WdmpLMXf1HpmCrt+Bv/PmF4GVS0uq3MXGInlnvKD4PeHkF2aBZqanEjzTnDm7DlLRWjKzk2lAu/qmOlyR7OW/MWFwfjnrz37d5O+J2s7dBsIe9BpTpDaoQxQMQAJFWdEaritK8BpFyegLJY3OdalwaUhzzErldrHT/OxpCMeSHDRrfIrCrWEGtx6eybdqD20l8fr32XMErSwFenu4KUCKdMWHZY9JaQ9hDa71/gpb2JkkAdzhUmuSbVkvhA3E08VQcSug9kSYj1YvGyHH9oXgZXL3phH0/5paeFSmLca9T8S8Rd4Hfv1JD9KiVzmoZCe/6aawm1UkGkzB0g7iiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zi3Ta5oQXcePbjnJLMNF/ShJJD47jZo9ro9ibNheTqs=;
 b=LCfVtGbp2C5or0sTjY8A4ivB4sDLvsEZ8JR8y5I5vGxNGz5MOV7AzG7yeN5LNPD23Tbe1GxzTEn2xLGjPWO6fJYfYwxk3s+9l+TlIBbsQQ3N+lK7OB/iRzgj1D4gghjCBspCfqFMZW2rTw2ug4cAZlwKeL2g2xsCwMtrtN036aro5qTGvURva6Lay9A5iWZSOfY3OZqtgqTUqQ3GR7RmBvphxYvClcckFMx/Crbn8ZWMFuwctSsKV8RhEwz7LbH/TO7vWUlMLarQYcOIsgZCPcS0clGkCtcRH0/0d6UrjSX8WfRr6TFBGGChvFh4vrbbzVCwSjhnQOK1t+ugIkqI0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zi3Ta5oQXcePbjnJLMNF/ShJJD47jZo9ro9ibNheTqs=;
 b=aSii665l0Imvt21asQC/Hl2OD1S8q6U+z5ThufwHTr8BJoh8/FzSHOpDteCDVGsBggBaECX1cZ/++zUzVbD8GX0X73rpDcBSqeje+o2AXChGTl/j6VYhlk0Jy94/JlEFsGNo/9y+J5SxakCGLUswdVH8MpYzPmCq3iAU+NvOXzQR1AxBWiEl/BzBoh9pEqS0wtrZ+a4kJQzsivXv86qhrHiKis77kkQYvxlPLylRZ0vAonuPBoFFuHo4LdwAhsOmqDZUk3lU/nt9eh24aBytulrLIxkirJkgTryVOrmxN6xek5WDMOz1ssWe95zIlffvo+Y0AoiErmZ9vap+K22RWw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by VI0PR04MB10541.eurprd04.prod.outlook.com (2603:10a6:800:26a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.27; Wed, 5 Mar
 2025 10:01:19 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6%5]) with mapi id 15.20.8511.015; Wed, 5 Mar 2025
 10:01:19 +0000
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
Subject: [PATCH v4 8/8] imx_dsp_rproc: Use reset controller API to control the DSP
Date: Wed,  5 Mar 2025 12:00:36 +0200
Message-ID: <20250305100037.373782-9-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250305100037.373782-1-daniel.baluta@nxp.com>
References: <20250305100037.373782-1-daniel.baluta@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA2P291CA0031.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::12) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|VI0PR04MB10541:EE_
X-MS-Office365-Filtering-Correlation-Id: 234ce139-b55e-4b63-4685-08dd5bccacca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IjQQ/p1HX1jFVwGB5grt+8YtvcDuVBfbrktqqq3wu//3sdnPKlVXJsMRJsdI?=
 =?us-ascii?Q?rzLLofyMLbHJKgbU9hx6Oyg2tDHVYxwRlm5rqWjeRAbMgaKaq0pREQ6UR7b1?=
 =?us-ascii?Q?dxhUQoh3KuM8fIyCyGC04u1TEpZ5Z54jDtfyIuVbUopKurtYVc86y11R4vSH?=
 =?us-ascii?Q?YmlrQqECGIF8/zk5slGGuru29cryjo7xgsWL44vFiGy5CBVFK4ZQNR8dnTBK?=
 =?us-ascii?Q?4U8aO86xNK3jgnVU7xuoy4IiohWtVw9Bw78WANN9+ntYAX8TytqV+j23GRlL?=
 =?us-ascii?Q?44qBkBPQ/0Dg+fAVPzVk8k5IN3Ng7u+VI2ffnbLovhb0YRtmb98g3ZuEiqek?=
 =?us-ascii?Q?Nc1isxBRRCf6ptLU+XuFpZUeMgTdsHJxZvaYeIpfwdycIDchSwTqTah3KD12?=
 =?us-ascii?Q?YZpr4tKEDLC3JbQHj6EqCPvgrzbLsVwlKgy04Sbps57nrIZ0+s94nlhsD8TD?=
 =?us-ascii?Q?pNslDW0HqECkz5AUE4tZIL88j9efz9752qIninAxw/NZfAcPWYBRQx4S2+/v?=
 =?us-ascii?Q?u3IQWBZqfZJqobpOL5f9lA5I6sfqXC3dRRMnzdrlzvE/w7SGofo3GHDbu5U1?=
 =?us-ascii?Q?ML/YnaspOqHBbpThE1eaXHSVRT9InjoyX0ZYOi7F6LeFAWrV31ENX2pDboKj?=
 =?us-ascii?Q?H5fV2m1NLxiQJyalvuYWwG4QLB3HA3vQhuExPhypnQMqac6ArtLaSkM2NFKc?=
 =?us-ascii?Q?fNNooz0kQnc8Fbpc1mAoLGSpxgr8dFTtYtOhuUHonwIY7ZGTM4+azQrAGdGY?=
 =?us-ascii?Q?8spSYN4BUplHEvhM1yGll4AMTrSklCabBPu/CyOZ0eArtJJOxHRktlrtGBLE?=
 =?us-ascii?Q?uq9WCv6mKrn+vOXkxeVmZfLXmSXYIRwY6m5P5MyupUfMuhsQkRoce3HXTjqr?=
 =?us-ascii?Q?oIqpt/VyWY9dsaab8FCSuhHaRwk7QJvry6+N/8q9nXsMsADR8QG5htpPlclZ?=
 =?us-ascii?Q?d4T7Blmf9ElJUvXml1CE8AcBT5O9wbhLevrnadIERda8/60HD80T+qI0mXiF?=
 =?us-ascii?Q?999u8cfq7sDMJKbz5pSO4HkAU42+l5Nka+nhJMvjgz3WC9T51NacIGBh1SUx?=
 =?us-ascii?Q?QWA/xkmaRFcebRUW2Vp1G2tAedghliNELoxRincDmGJibOE2aPLpUXUrjU6P?=
 =?us-ascii?Q?jyqw0XXhM4zS3tNBiuDRdA3GazRpefjo2iDpjrSenTAsLKpbYuuPuEiiaj5U?=
 =?us-ascii?Q?lVXVsvi9GOkWTs0BZLgdSd8Md0tCEGoITgG1DaenuYqDi9nSTYwst5eiLcvJ?=
 =?us-ascii?Q?29Il/M8i7DHlR4nNkXDll+rMtWj7W1P6qkKDz3j2V7KFICaROVMalrivJc9h?=
 =?us-ascii?Q?NikNC5THs2hqFWTTZx1R/5+O/esXwjz7ewai8nbo1PGl3loBK9jGDAyFxo2W?=
 =?us-ascii?Q?tlGID9NAn4/hYOqv3EdGRg08gzjUNBxsUKOGhtvG02KvFdv8FtDuRwYNrUvI?=
 =?us-ascii?Q?hHpDGS3dgb+vSh+guEKDvtaik5lEoifE?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sDhR+A/S72IlOK95ApddkEunwir1PTM7nAYbWpn5o3QyCPkgc5oDk9VfHhmw?=
 =?us-ascii?Q?7Hw4HYmorMNz2kxNYew+z9xlwwDR752MgMSMDQD3vemDJnX5IVCjD5ohtPWw?=
 =?us-ascii?Q?XVCoc3OsMBXHHeOrxwHbcJqdQVli3VEWgAn7PhgI21sNotXjCpwq+/surzAj?=
 =?us-ascii?Q?jXwM5I6wVLpCAAk1A16etw3Soy9mcVzl1lro61zKyDHUo89xqlreVf+65Tas?=
 =?us-ascii?Q?KqdYJyrVANCDf01FpNEFmeC1jCcXLhl2TZv9HTbBmRaRf5s3Jo90eIrduA79?=
 =?us-ascii?Q?cmayLGAz0UNlL4yBHhelTJuu8iKLnFLhApMGFklZUL2rXgao56+q7ys8ZIEp?=
 =?us-ascii?Q?xW5kWL4nQEr9Eexd0J2T1aZT1EikRWkKhYlmoLtxVgKZhemcr6mKnWoqjmbB?=
 =?us-ascii?Q?8Ercl4TeYvwcxd2PMQtuk6EQr7g7A7057uUzN+mF9qi88EGA5wH7GVKyAmLd?=
 =?us-ascii?Q?iAe2Od38egN2OQM0tfQoffaJHt/4Sa0dgZ88P4JgnHmXm0iayX5RzncVkpkR?=
 =?us-ascii?Q?c0TOlH9X8EFG/wWgI32GTDauqpaMnoeZ7i0tIdlWBLpZ06xZSPOdtfcNwNu0?=
 =?us-ascii?Q?dl89FB/5BhFcZsPfmfmzgwqb6tXrtNBBrbE0op+xtw8utyNbTSllyuxmbsEY?=
 =?us-ascii?Q?x2WQmwUyZk1QKmOqrrWoz7K9C+olPe0cvpEXfdMIsoPXThwCj+VWxEjU0RSR?=
 =?us-ascii?Q?H8UQivtu6QMvTmEQuSBJ6LmXagfsBulamI2R4Gw5uiP5lNL/vIQ3/GqV+TPV?=
 =?us-ascii?Q?JAp+j8qSmKF4BvBxSq/E0dXegYz/nj8fZByMG9Ts5YhbT8mvsVB5E52P3g+l?=
 =?us-ascii?Q?GS69ULf7iAdleCc6bxRe0gG/14g2sIdZtmmScY91EdmgpYV6bdGnVfVKY7sx?=
 =?us-ascii?Q?L4WOuM7EV0kOm+jGfdtWzDEPSxtHFCSrvbE4ahHEfmaPUK/0c48bQACAWM9f?=
 =?us-ascii?Q?D2pK7m5LAQbYtFMAHXbgaBmTo7YwR5Wo2lYmQnSVQcyIUVo1jjPBrCQI5GOU?=
 =?us-ascii?Q?AKrTFpUJLmsELP4wZDXYnZD6o0pYd/qXvtBx8p6KTg3IFpUAvwlD35C8580K?=
 =?us-ascii?Q?deWhm6zp+uMCB4bRjCsN5TH0mzHcTN9EcrwGBbosrImcViGPsKsMjGNqT9p5?=
 =?us-ascii?Q?2Xtvml3ekLoKBauDYhcauh01Dgt6Szgxs/b66PwGLHrHcT78HkjS1IQtm5CW?=
 =?us-ascii?Q?0RA9Oi4LO7AfoiE49rpy3WK57m4zOV6da+NKnsM0Gw/FS++Iq/vT0n0/O6U0?=
 =?us-ascii?Q?gRskiZ+1X5AqFWozog8ZHtFDq28sBYGoHGZi2sNcD/72SR3VZYLcNvL0ewlH?=
 =?us-ascii?Q?KLtOKVud3QShcZEdcm27JvIr5JX/1Of4IYL/vumPML0TDpDDV12ESu8VH+Al?=
 =?us-ascii?Q?Oo9AAnMnV2gX/0UTfN0+8OH8pDkxmyvwPNCiXcdDjVefSSxjYG7bLCBBOWRk?=
 =?us-ascii?Q?4ath4kMfPK+l9LfhHNk9lqAi3i/hHQT6hjUSDDSVnhHP99Zluf33teNdYn6u?=
 =?us-ascii?Q?AM7QsBP2Q86MQqNHBar0Kg12fxWR2IBrc8wVaKARwIdxnBmLcjot7EW8zUt7?=
 =?us-ascii?Q?0adUG3P/c8KMjxrjK6jH06wfhG6u25pi1ngGu9RL?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 234ce139-b55e-4b63-4685-08dd5bccacca
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 10:01:18.9501
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5HlO+7s5tdr4aUZkKZibTM5jWlOIEgaCpbDnV7FPv4VWmuvd+JYhuGSJHnuFqJS+uTv9LpzNlXGSUYFlqBkZbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10541

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

