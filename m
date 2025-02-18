Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2066.outbound.protection.outlook.com [40.107.21.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A59122E40E;
	Tue, 18 Feb 2025 08:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739869082; cv=fail; b=NVaqp1lbIAexcosorTImlD95k44uHelRqtg8ME4AXcnfuei136USDzfROqkNXC2Jkj3k0zl8yq8nMLwmTqvpzi/4PcDRfI9sI/uPi/nt7H9Egh3E0hVWbLeZ1Qlrab3nX02UN6fjt8seIbJwKbK30JnN1npZ4SV5BCdjVLPu0hs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739869082; c=relaxed/simple;
	bh=3pQUmdQFac0Fh+WNY7acYRrP67tRCEqVJs7jhVNrmaI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DGKkC5xkFjpaX0sEN6UJnALhv9IJof8Hd8fjYVWCLhNSeHhkPbyz+zS3AgKR/cXIAA7qabFk6Tf/sa+jCvnnJAxkfzIYhONciM+bFIhkLnh4yeUfNp8RXAJsok1E8/y1ui5QTK91hq2y7Jtz1x4/OAd03vAxqKpI1Fce0OQ9AUo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=RWZNkcZl; arc=fail smtp.client-ip=40.107.21.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="RWZNkcZl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X07EvDnoAsJ94h+4MI7t4ivc8WRWyeQBVceTNUfJW9EhXx6gYiO/m/EMrMTKR+f0BqwUNIVXJskbVVC6bybvyiTB2kbqe7wrTEg3YvzKOxgm6iMxpIgTN2f6GxCf9TbNhWyV2TKqD72qDwCJFnFKZMDxuZm+rP54oxySVOa6NdGHCPNuFolQXgdSd34XwjYr27oCeM3o7vGmO4jpC92ofxCZOw7DzwYZMKwlRfb/Ef7PYqBbZ/IoXNEdy/NkoGCco5i/qjGOr4s0Mt4ISLF6/oFUMSPjCelQXSp+pOVFk61bImGts9FQtivFO18Qe6AQz8h/uWTJXCqtOh0PKiaiow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vLGCak/e/d7wgy18Oz5BexielpgJfmnmXgnHx0MQkjA=;
 b=EyE2s3Y+Pt8BK0E+vhuGgC/wd6x1gGcWuEWN70IhdwuUZWSFEbYnSh0uw7SFmwF8gJeX0InXfPbPoZACfJOwQI6+ddI1S+PpgAfZ6+kjF9/N/+m9TbA2nyORMBtGnGZ5OnOy2bBUXzy8mDQh/vLtwra7zHN8oiGNfEjg/DjNN7n2Q5cjPS7UgArqAsod2Rl1+nPTo0lW3UiCn9s32oDmuwuyD3oasqRhjB+tzMSQWKYagYIAK3RPVGlveU+Ke9S6ziqkJ9xseEDeY0vU+0VYwJz2yeS4z8/+7iHhy/mdnSTSYl7W7VFMA7Z6ObZcaaTH/wBLy59PLcl/IAPMdJvcjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vLGCak/e/d7wgy18Oz5BexielpgJfmnmXgnHx0MQkjA=;
 b=RWZNkcZltncP81X24sx8xADzNGDjYj0CIsnMw2aTHQq46mIEIN/tNcH1FKKenLvX3+cg+21R01lG1KP50h5JNxGy/ti15UHAlFki+SoIgpbI93PKZ7jg4NLjrpUVl6tn02gtb4Rii31uQmVlkvZyuRCRXsrJixVfiWOz8b56o8gajNtfti1bNU5DnhuAMLF05fX1Qlv1rIuizNfjN0zJf/RMxzEJ2VpCfAnchO8UCqGTu87vLgrBClNwyqS3KKfP5DGib4jdsNTwRVHj3IY77tBLP1zvFx71QYO9U2+veiALZGgoEDWKXyoNUKMORM0YSVpE2PBvSpWVZznM2HEBTg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by AS5PR04MB10057.eurprd04.prod.outlook.com (2603:10a6:20b:67d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.18; Tue, 18 Feb
 2025 08:57:56 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6%5]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 08:57:56 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: p.zabel@pengutronix.de,
	shawnguo@kernel.org,
	mathieu.poirier@linaro.org
Cc: s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	andersson@kernel.org,
	linux-remoteproc@vger.kernel.org,
	iuliana.prodan@nxp.com,
	laurentiu.mihalcea@nxp.com,
	shengjiu.wang@nxp.com,
	Frank.Li@nxp.com,
	krzk@kernel.org,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH 1/5] reset: imx8mp-audiomix: Add prefix for internal macro
Date: Tue, 18 Feb 2025 10:57:08 +0200
Message-Id: <20250218085712.66690-2-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250218085712.66690-1-daniel.baluta@nxp.com>
References: <20250218085712.66690-1-daniel.baluta@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR07CA0286.eurprd07.prod.outlook.com
 (2603:10a6:800:130::14) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|AS5PR04MB10057:EE_
X-MS-Office365-Filtering-Correlation-Id: 013b4ba8-6034-4b8f-3562-08dd4ffa5645
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|7416014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WddgqdECqPHBN6CFl8SUA6XXqd2YY1etfL11sGq5QcmABGRXNNfkC+0Gz64w?=
 =?us-ascii?Q?1hdy0EZii+jhiZkd1irYJZCkbHu4kmjShZdjPpX6qaBE8Gu1qvY4ZXwYmBvK?=
 =?us-ascii?Q?W56yGj2HslXwJfe5ZNNCNjD81T65eDhP4Tg3kn5kTa0xm43qqAyxPK53LMMl?=
 =?us-ascii?Q?yMlpCGSgPnovDDuEqbrSsWS9G1qrMh+llGL49ZZ+fgzUeH665CLa9Zb9nSvc?=
 =?us-ascii?Q?NMOcWjPhmOEpgV+rePK1n56enl5wGgTuuxIQkzHgjic2mRReLB8K3U172J9A?=
 =?us-ascii?Q?4vVZlUUG1NOQDliq+FfhqLGsau/cQ57O1MWhZHKntYvnwnBNoVqJvwbScVEP?=
 =?us-ascii?Q?m0dMXKYsRPJ7XnwZ5vOMb+2pNH0O85mVC348acRp6RFXylZ/RRBn/KRwz0FX?=
 =?us-ascii?Q?yLxjVLerdCEOUBzPLEFNGmZc5ay5o5nwAdPdPIl4s+VTashPWJMTPrbzOah/?=
 =?us-ascii?Q?mxmbLxej5LkMjhhAfs7CesmCnOXcIcMocYHkTvO+WpnBM6wfI+9kac6Csbnd?=
 =?us-ascii?Q?JfHLo4+drbUfPyBIadYi5H9GFeiZMqYQ1HX9WzLmvVRk1n13BSMeWpD9z0aN?=
 =?us-ascii?Q?Sb3KVvb4SFK1US/qYPb/+KTvNN7pb+R6+pJY/V7LW84E8u1Nr9J8xiPoKh4F?=
 =?us-ascii?Q?mxksrNbUI1M/68pCswngzw4U7ltN769MqIMULlaWQujfERLUkHqPvwQzto93?=
 =?us-ascii?Q?QLNuwGt52JNPbl9zYLhyS61+ANu/8BuXve15+TbArZXxcVbTcDbspWVbXYBy?=
 =?us-ascii?Q?SXAbvJeQiu9z9MrUDrb+g9qjwnyq4JPg9uIo+OCtozS3FrqjSDkJcBeY4hpG?=
 =?us-ascii?Q?NwkBvPFx/0+pyLqvnSymIzetP4AwqVOvTrRzzE22QblSPbbPwAafKC1QlGfZ?=
 =?us-ascii?Q?GfqdYQvkLG9mPWLzDoiPil+CNfYyLzJkqBesd5ShE985LzBYvkEvwx4c7IQn?=
 =?us-ascii?Q?ItYcbfWkeQSCaXnfo9gzx7sExmQnybYqHtGeZhFH+GxGkzbqmTRU+09RT7wF?=
 =?us-ascii?Q?3U4EHsyUOc30k0X2v6Q89/4EzdzAtk59h1+aCwDTlTNLWRleTiST3uKx6V6f?=
 =?us-ascii?Q?ES9Lb9iAtLLAWrsmw1mo5O0/+On1ZCuPEU5ze2sD2HM2OCH6on6IIgpkB5mx?=
 =?us-ascii?Q?yvLhbOiWglekPjtYvbaB5izazMwAsNPvaShDixtaDy9UcZ2qHiHgWBq/mgTZ?=
 =?us-ascii?Q?KR4uI9WfMx6BPDADyU5lSRkNwEmsJs1Dy5bB5rR8Frmi0JWXU/uy5Th4tUuE?=
 =?us-ascii?Q?2OHKEaMJnRj0GmxtTXMmGuNcEspiRxrVKikrOwRRpreL5P/GF6tsqgp8RjjI?=
 =?us-ascii?Q?hND3C2R4MArgr0DO19hcXl0z19aivSVRGauPVRAGmbXaz3LqEA/a7eHpBii3?=
 =?us-ascii?Q?KCI7WoE4agZOlAyU1fSPjFOCj41V?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(7416014)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?L+Y5HPI/OVVecZdm7EDxkdW+ii20DKfx/b/DGJB2TosrowOFacuoAzFqcj2W?=
 =?us-ascii?Q?2Sb4NIhmOxZ8C9MuSiPzT+2IrJfPP2hOjWIUoK/sXN4tiy9COITB5e1Pi8kL?=
 =?us-ascii?Q?RGXX3NLgJ0iAli+wRuCBaHaWnvE6BxY2OoKQuc+W9uwkiNinpu9ui7fC/66Y?=
 =?us-ascii?Q?XTZGqUcB6/n6RIy8KFQjOWYKIfcC0idAoS6BUJrjPYmtbECX/2sj82SnOwuu?=
 =?us-ascii?Q?8O437tSJySo2LOe9gOCkn1LriCgMQ1SiPUgHzCs6/HpxVSEggilSDhxdTMx2?=
 =?us-ascii?Q?4WSHohVBddRzmR3NA7ETnA6Bdu/FLfHwq867gN2al5gVTwlKepSfgP6N+4DY?=
 =?us-ascii?Q?o8KsbkNqcZIwP9yO2gmYcqdJtgKlydlP8epAxBGe3rA94zRMC9pq+j0Ux7so?=
 =?us-ascii?Q?q5lAeIxfhHD3t4ZnHIvWSSHKqBeS1B25Y/CA+NmLO50+7Gjpj4pp+E+lQv+u?=
 =?us-ascii?Q?0rPsMChK0S6Xi3X1kq+4BDIirXiLfagdO0RUaIZR8mbm4TbRdoZZL/rGHEou?=
 =?us-ascii?Q?SBzzdqTQkHnOV2l33k3Eyqhye3Dw61hTR83N+hGOtG2zWAgyddlkL5Gy0Ktx?=
 =?us-ascii?Q?Gj9A6cCYl+nF9mCrF//iwuC88pyKrVmgXl0pcinYko9W39B22sCIBHWatvWS?=
 =?us-ascii?Q?zD95NOEV6y5hhCCyvk7Cj6OgcSeggPtgL20FuAzQnXK6Xs4AFtltx4fMROVk?=
 =?us-ascii?Q?2WVK8b5ua7Uip4Vn7MhMRxgrns2gmOdrVG9zsomTFVs49IenCTz2DLYKSy4t?=
 =?us-ascii?Q?3y926BQQYi0rY9Rj1+kspKyFeJMRE+d1PN3Um8vdCkA7AZPpL89YTrooOkGx?=
 =?us-ascii?Q?wfQgBmtER8vggr+Ma+NQ2pBHwciBa5B09rY9i0N3dNlj9c3SwmBwdK9f2sqm?=
 =?us-ascii?Q?d4B26RsElPp5jltKGV8hiqQhFjl+wywPeUlSuPxqxqZy9h/z9pQF6zlTMhUl?=
 =?us-ascii?Q?DGT0ITFknxXMjMDP/Oi6X2dtkFl7UOtjK4m+aWs+i1lha9EXpdt1d/ta9Ynk?=
 =?us-ascii?Q?LYqDG2t+bQKSSQMJZkZVXPdbH9gw0J2SWSa3+JcDL0ygv5wa6ckFH5ahnIy1?=
 =?us-ascii?Q?l8F7vXuxeTw+TkFX/DJ75Yu6TYpPPgVYBKIy57McRHMo/3VuxklxzcJg53ak?=
 =?us-ascii?Q?cjLTmuQkawtJX6GKWmdbFszYogBCx5TAFcIwI1clbdhoDUGJSIVYquqvcuO7?=
 =?us-ascii?Q?IDcL6Yxr28gRII/NKcPw2Ou1xPFW/MULnIi3gaBAvbypZylWROmqCg0ZS/++?=
 =?us-ascii?Q?dDMfroLxWeIzsP2EniUGoIpetc/gPTAnxQ1FgDbtCQxSQRD7EY9dg1u+4G+B?=
 =?us-ascii?Q?233orWWls7YfDOlbMUDxQTmK6zCremt82UDXqcBEkuCUnVwnpl2OcwF8nf/m?=
 =?us-ascii?Q?d5G/R0qQHO7XajTWyqCXfklnRm5L58wJvn043Kp9ril/aStqkL8YghcryZ++?=
 =?us-ascii?Q?qjQ1QOexNz3Zj3yf9mH76n3CVgAKKG8UiT5DdWqGJfBSveEElAzwEWeL136O?=
 =?us-ascii?Q?xLbI4+8qGuGn2fFNKpXmd290pmOpvuj2bLT0WxLmEZisviQBQMsng5T8zhmz?=
 =?us-ascii?Q?GE1Bz/FeR8p2fJbowfTdZO1mEvUe3zK0kkbw4xSG+eYVpd8FQ45/FSQ00xwv?=
 =?us-ascii?Q?N81/lsBg9Gt4SC86p5YUgzkMP/IRRL+h+Tvtk06PFeDuMnTkusZxxKYsNxVm?=
 =?us-ascii?Q?pA8hrg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 013b4ba8-6034-4b8f-3562-08dd4ffa5645
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 08:57:56.6158
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UWGAHBNuwZao1Js+2jSc3aVOKn93ksCoSi+fvCFtSF8sU5SshpG3BjY8RAQ5TRRnpQ1HvaHAErUlBjQXy2krog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB10057

This adds IMX8MP_AUDIOMIX_ prefix to internal macros
in order to show that specific macros are related to
audiomix.

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 drivers/reset/reset-imx8mp-audiomix.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
index 6e3f3069f727..1fe21980a66c 100644
--- a/drivers/reset/reset-imx8mp-audiomix.c
+++ b/drivers/reset/reset-imx8mp-audiomix.c
@@ -11,8 +11,8 @@
 #include <linux/of_address.h>
 #include <linux/reset-controller.h>
 
-#define EARC			0x200
-#define EARC_RESET_MASK		0x3
+#define IMX8MP_AUDIOMIX_EARC_OFFSET		0x200
+#define IMX8MP_AUDIOMIX_EARC_RESET_MASK		0x3
 
 struct imx8mp_audiomix_reset {
 	struct reset_controller_dev rcdev;
@@ -35,8 +35,8 @@ static int imx8mp_audiomix_reset_assert(struct reset_controller_dev *rcdev,
 
 	mask = BIT(id);
 	spin_lock_irqsave(&priv->lock, flags);
-	reg = readl(reg_addr + EARC);
-	writel(reg & ~mask, reg_addr + EARC);
+	reg = readl(reg_addr + IMX8MP_AUDIOMIX_EARC_OFFSET);
+	writel(reg & ~mask, reg_addr + IMX8MP_AUDIOMIX_EARC_OFFSET);
 	spin_unlock_irqrestore(&priv->lock, flags);
 
 	return 0;
@@ -52,8 +52,8 @@ static int imx8mp_audiomix_reset_deassert(struct reset_controller_dev *rcdev,
 
 	mask = BIT(id);
 	spin_lock_irqsave(&priv->lock, flags);
-	reg = readl(reg_addr + EARC);
-	writel(reg | mask, reg_addr + EARC);
+	reg = readl(reg_addr + IMX8MP_AUDIOMIX_EARC_OFFSET);
+	writel(reg | mask, reg_addr + IMX8MP_AUDIOMIX_EARC_OFFSET);
 	spin_unlock_irqrestore(&priv->lock, flags);
 
 	return 0;
@@ -78,7 +78,7 @@ static int imx8mp_audiomix_reset_probe(struct auxiliary_device *adev,
 	spin_lock_init(&priv->lock);
 
 	priv->rcdev.owner     = THIS_MODULE;
-	priv->rcdev.nr_resets = fls(EARC_RESET_MASK);
+	priv->rcdev.nr_resets = fls(IMX8MP_AUDIOMIX_EARC_RESET_MASK);
 	priv->rcdev.ops       = &imx8mp_audiomix_reset_ops;
 	priv->rcdev.of_node   = dev->parent->of_node;
 	priv->rcdev.dev	      = dev;
-- 
2.25.1

