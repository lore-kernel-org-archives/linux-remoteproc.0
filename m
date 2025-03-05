Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2040.outbound.protection.outlook.com [40.107.20.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16BBE2066F3;
	Wed,  5 Mar 2025 10:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741168876; cv=fail; b=mABosF592Lu3p2oY92EdTjt8SZ3p8I4O1CHcfW0dZ2RrlaQW8UTXQIhA3MBvBXKyNG4knSnl3eGu/CdSiZyF9I0Nllcm9uhtH1UkTvqO50kmpOukMvAN4EIO04r0gd11OWM3/zYn4xKUWerGs1gevF0dzDLMGdEM1/e/8QWr7Cg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741168876; c=relaxed/simple;
	bh=259dYXLm+MObzu7jGv5+ZR/+ZkrwuIkrsl3svr443uM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FY3DSSCff6jN+2y2m14rQCC80EnkTGUFovipXSKm4vRa6emqDDTfiHxVT5dxw6Ddx6lbJWYy20q9RAnPjJBLdcVXPnxKJBTTq9S2md1w4ha0C4H9lspK1dhZQEw/xaf16Q9ynTUbtFCnXcEwPMLRRGSrAmz4bHgsMEnxY2OMvr8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Y7MOFkiJ; arc=fail smtp.client-ip=40.107.20.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Y7MOFkiJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uvDu5Atz2vDLNwLUyJEfN+3Ag0SSRVJ0sSK/Q1IKrQ4GUorPtpifiGFHTPDOa85hLFfrvefFwQm4RnJQtPMbl1AbrjS7aURsV0OXtHXsAsqJzfBHwKHZVPsqRJh3rpCl/ZHvGbFNZYsC8sEvuFt36hupRMS0mPS08GdYyGI5BkMtb+KBdmW8Xde/aScCWoHXWkRsOAwkekeo00JiYRpsS2yMF/sKwp9nopZ1jV5ZAeojPa/lGhQAywN7GFUWux+ELc7hoXU9ahJ02AEMjh7KAl+SQjStzx+upE+jQQC3uqOXn7BMB+PEPaFUaKLQjciVDOHAo/qv+raDKEZ+q60OSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z1UCzXUHSgWcfQB2vGcwiagSt5MUWom2vNc5p8g8uLU=;
 b=Xi/zXS47yBJA+tNO3JtBdkkPAJllWsQ90bEoYwfQJJDZp30r5/9egLiynH9zr/n8vgVDPJSAVbH0wCoibqiJHA2iZdsYS9J51XUlndB2lafYgVylfjnFYEjOiPjn/wV7DyrTpuv4m8ekvqPRozCtPDzltv8+lqJyluyiKBK7hLlV+ZVix4eicJnIvtepHdnZMU1Tnx2IPqurqn0Ldh+2/3wdQKaETOpNdRaXpp7RzxawTHHEMVTg8QNCmHDe2fPpIVMS0/Y4RGZ3f3mO7aJwFnWAlr1RfMex8b86UqSaGoGhR55MgL0fwEPbRUz9pCMSSWp/tFApA27X4wnbcOU7CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z1UCzXUHSgWcfQB2vGcwiagSt5MUWom2vNc5p8g8uLU=;
 b=Y7MOFkiJ3pPkU9gVfGX8ItWr8Sl+h5XW3RmT7gof7dI5JgCLypwdELbaHTsvM+oWXRUn9fKuHo6tosiw5CPTm4Y5VEd7AljHT4814yGzkEnOOYysN3EobD+By1DSQrAgvc1/+KduCYpr/RkkjKrIs2R6Pj6FY+wCy/0bm+RK6cchpWfq60remnQJ9xkCTKG2xSjNee0lj0+KVNL9ZnzszSrwePYyGfaXAzFQwFcAN3SEOtWNCWqCtLOdW+t8/2urXJefnP0Q9mxZYxH3Tl73uyTLNGdRR919oy5W73yG/Kt0BNhHrGq2OvfjKs7IAx3kd8nQtN7FHnCWFy6PBpQiow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by VI0PR04MB10541.eurprd04.prod.outlook.com (2603:10a6:800:26a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.27; Wed, 5 Mar
 2025 10:01:08 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6%5]) with mapi id 15.20.8511.015; Wed, 5 Mar 2025
 10:01:08 +0000
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
Subject: [PATCH v4 4/8] reset: imx8mp-audiomix: Add prefix for internal macro
Date: Wed,  5 Mar 2025 12:00:32 +0200
Message-ID: <20250305100037.373782-5-daniel.baluta@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 75634066-0015-440f-d5fb-08dd5bcca6a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sJboICR8OdS5c+dQkJ7e+3MD1u86R0IRkaHLzPw0fJuTCmowOIvuTSxkcJQn?=
 =?us-ascii?Q?Wn/rNDollrXcl2cC/w/BBYdHL13ye+N2wwoG0Hfkk0NKOp/s3YttCtikh53F?=
 =?us-ascii?Q?BliMkPu54GlVkyLUDxKe3YqLGKDYdhYiTUosFvhAtNLCffGTgcDG6FhIq9Im?=
 =?us-ascii?Q?vYO21ce+ftcPPfv/K+KshA48GzVZmuJlyGwswjEttBpjNuh6Q0/P65OgmBFl?=
 =?us-ascii?Q?ZlNXnNHkLUJThYh3iwYXEEDQFQlm5ezoE9r1Kg6eASEmcTlmy7KgEYeXx+aL?=
 =?us-ascii?Q?Mg/4cWyN0Hgbo6ygx6YROIlF6kPHKToaqG1UIOrCDCpgxyxCmZArk+4/e/h+?=
 =?us-ascii?Q?oX4KJ6exQ5/az18G9eELNLAexmdzyfbsDuR4cruTK8mTDNEnYaRXtwxig9pX?=
 =?us-ascii?Q?xPjo0R0jsDAAoKrC1A2AczWwNGY9Px9BDQOt1tYW0fvGJP7pEBZv2FYTLYZ1?=
 =?us-ascii?Q?b/G17ROFAeZHJ57b3QMFPq+quEQDhCryCfBIc7krgpuq2/qICHWWZjXsiFoL?=
 =?us-ascii?Q?4Agig0K87NNEGyYvHmHHdUBY9SU7VpYSWhJmaZPBNo0rj+Mhty2VIirNoCU2?=
 =?us-ascii?Q?rYNIlH+XNI298noaTE0IxLRUPI5zNld+4Oj97d3FTf/GZHCUb+CnUXjmwRoj?=
 =?us-ascii?Q?ll/UEcpf7viHctfcE0Rrnw1ROY3Kn5ZGMjpFpqiEEZe8X4fctCAhama1hIvh?=
 =?us-ascii?Q?YD4RZZpvt/Xn45/2eNs5ilQlNpxdlr9Y7A/MPe4HgpwWyFyb0UtZnHsQseR6?=
 =?us-ascii?Q?uuvLudsUjnWw2g29gVYkhjJEYKUGQRegyDmuz1yZZzp2o0L+plWz2AbPYjuQ?=
 =?us-ascii?Q?madIbSDmEOyfTH2APJnNDJ9ey76isJ0v8qCWr3QMdsgmHDNJ0X870aYMcObL?=
 =?us-ascii?Q?6MnzVjsAaKUTEOPcDtEsdUcu/ZBgrgXFrZSL1LB68QplDkDH/NKmQFybrrqO?=
 =?us-ascii?Q?z3ETnr1xPr3I4NvF8m8Hw+2foZDr1nwR51XVW9riVyuWgfXCW0/X0mPB/LM+?=
 =?us-ascii?Q?HxH5FD3St4H68jAc1ATNiN5WO9Wz9CcNu5rjr7RPzfVF2J5LQZIc3fV4Jx0a?=
 =?us-ascii?Q?oa5Fg7UNWh+DvJMwNd/SYQ0ygTM+ikHJpXQ1q18vOUepyD/KCrEzlps+5Vke?=
 =?us-ascii?Q?U7VFtjxjuDxd4n4gM6gJ0CcuekQtPTl56w5WWb125sV9dviNYN/rgpxwbBan?=
 =?us-ascii?Q?zOA1LlR7geNreJbOZm1zgTIrub6hahwajEwsOTaMePMrlnQtN6D4YfZ84Pp5?=
 =?us-ascii?Q?xQRkHamg4oSuvR589xmQGknvhVWVhAjLKq8UhX6tEqdeHCD+BK8T4p87P+Aa?=
 =?us-ascii?Q?jtrmpZv1r4VzCsXoNd1hNLruYsws5ZF94blmAmBTbpP0qDewA3t/bmYcAN9I?=
 =?us-ascii?Q?2Mo37DH7ybDylGreJTSJOqByGBFNB/qoPN0t4xsNDO8xf33FHCcwO4uw59dj?=
 =?us-ascii?Q?tQ1eTQQWuOcO57k+fKH20Ypm5SrOxwbl?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NCbgvfeRfKb3s4yYryWP/TMV4nh0JnOrKK3IrPnFe+y3f5KIUfzc0JcHQYnX?=
 =?us-ascii?Q?efPweNha2keBLHo5tMs6PH2L/QryrNWShOaodG10Lbp8LJTsR225+truIC6d?=
 =?us-ascii?Q?J7RhXQuyAF+U/mjRp9neVmT15LKg8t/8kv2gDtxF9fORKm01bFei62saIn34?=
 =?us-ascii?Q?1DP4/Wm1NCPYd8XHPwzYxU+RwrQt9DwbS/Bjgtf+P1h3F6wcTDKi66rfFvZi?=
 =?us-ascii?Q?85RtBCqg2BK4PLQ1rh1FQgy+CWk4SZA5F8HBjbGMBZ3VohK2LzM563opF34y?=
 =?us-ascii?Q?NQTZQxzM2H+BVmzPb4l8/yADKBngTkIeTqI0tXKBzz2Z+ASBy0oxBt/C+UZB?=
 =?us-ascii?Q?IqjKNf/BCtIP+WofbPNK6vWcfFhvGG9U/Npr1rVX8yF4EbAAk+x4Kh+yBHQg?=
 =?us-ascii?Q?uWKj+ineI0xhC/mfNg/hym0riVqPvPpn6U9PocXhlz9S7gubg4/48GcWrGe7?=
 =?us-ascii?Q?lAtNxr7xyjK/WUVjxXSVu25yPD/khCtzMDywf2giYK+HOVHGAgD0HuHZ4nPI?=
 =?us-ascii?Q?gmfRUcfZQaBkDRn8TOYAglszrjhiJyj5SDLpDYIgDmA+qxRi+gvtV3vcfPDe?=
 =?us-ascii?Q?9IJVci/EcxJ/yB1jeJSx20YJyQ03YExQMJd0kTpZMieLHxvBZQYMwytbyNL9?=
 =?us-ascii?Q?3sXbfn1Xnwo/sYKbPRY6jG3oUSFo3DbL1OTrk9YbrCF1Rj+dTNQbytWUSZBQ?=
 =?us-ascii?Q?EY/9K6MZ7sW9l2XkoaeR5NjfHOPfWVU4P58Vg8MJpaOhPSiBKLvUAbLY/xd2?=
 =?us-ascii?Q?14dZBLAy2uQCmU8c6y2RK4Z0sNTmwAm96xerfDR8snqPGrIxbm5jktgGUJaf?=
 =?us-ascii?Q?6b6P94ClHrxNIpLOvkIrL/g65IORlBzSAPLEBbcqCwWyW3EEJZFRU00fP2L6?=
 =?us-ascii?Q?pFSbRmi5MptdtmDzcQ/pOopMxd7fhon58BoCcodRzACQwjkDnHDEqrhqf6hX?=
 =?us-ascii?Q?Wam6D4Jhely+MU2o+fPPpKiQ779NL+xLB9kB3zqxyYjm+SXbyd+3m40ycgAu?=
 =?us-ascii?Q?8joVB1JidBN38A03UgJ3e3dpOKHMqoi856WSEsR8jJpbT0NN6VXt3Ea5X+zC?=
 =?us-ascii?Q?gP3qXiS+evhmqpXlM6R6UJKvQpnwmMybMyGcaGFJssQZ/ZNDAf/nDNOKiNWu?=
 =?us-ascii?Q?2koh58dKybJ0DakQ8/mCyd78ggqW3OpFa8P52fP8SHogrs5vjigIClx3HWMV?=
 =?us-ascii?Q?b68uvUg+EnNTgUVDGvyFiJekRrR27PNgRYV4Xy0INFw9+tJlt2da0db3EWKR?=
 =?us-ascii?Q?uXVzMAGmjfZFe+I9Ifr3C0/s18J6kjm108TvZ0KuVqxwL/9Qtu+aB4W048Yr?=
 =?us-ascii?Q?0EzZa0IdwuhALpD5HfM9LChaS6NLMeMqp1MA+Fc3SMKJ3GEC3dG67D1mwqQq?=
 =?us-ascii?Q?eeS4fR5LzyKUIP3GqnHit3DkoiTZ2IbjThjfnRtFmqJxnp2PeAsukurjoSmB?=
 =?us-ascii?Q?anbWFecDj0ptWgWum9wEPHfgjv6OeBRLPXXEIEo1HmgCxVoCx4pWyrq/2Cn/?=
 =?us-ascii?Q?oYzOMjNgvhxXMqN2+87RXD58PvQhEBXZEHqAgnMT0c+eSuvc45lbFCrNW8wc?=
 =?us-ascii?Q?Hxep7rNsUeCilKSam3/8sTmTD6ltPGMl1Hb9sZBC?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75634066-0015-440f-d5fb-08dd5bcca6a4
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 10:01:08.5732
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2wT3SAiSIHNkdJas6MFw29NIGG059W2TWjFUVDCtmC4IzPmqJxceCURq4lPk8Tn8/ow3gs+sWLPgZScdtacQgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10541

This adds IMX8MP_AUDIOMIX_ prefix to internal macros in order to show
that specific macros are related to audiomix.

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 drivers/reset/reset-imx8mp-audiomix.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
index 6e3f3069f727..c2c3e8113182 100644
--- a/drivers/reset/reset-imx8mp-audiomix.c
+++ b/drivers/reset/reset-imx8mp-audiomix.c
@@ -11,8 +11,8 @@
 #include <linux/of_address.h>
 #include <linux/reset-controller.h>
 
-#define EARC			0x200
-#define EARC_RESET_MASK		0x3
+#define IMX8MP_AUDIOMIX_EARC_RESET_OFFSET	0x200
+#define IMX8MP_AUDIOMIX_EARC_RESET_MASK		0x3
 
 struct imx8mp_audiomix_reset {
 	struct reset_controller_dev rcdev;
@@ -35,8 +35,8 @@ static int imx8mp_audiomix_reset_assert(struct reset_controller_dev *rcdev,
 
 	mask = BIT(id);
 	spin_lock_irqsave(&priv->lock, flags);
-	reg = readl(reg_addr + EARC);
-	writel(reg & ~mask, reg_addr + EARC);
+	reg = readl(reg_addr + IMX8MP_AUDIOMIX_EARC_RESET_OFFSET);
+	writel(reg & ~mask, reg_addr + IMX8MP_AUDIOMIX_EARC_RESET_OFFSET);
 	spin_unlock_irqrestore(&priv->lock, flags);
 
 	return 0;
@@ -52,8 +52,8 @@ static int imx8mp_audiomix_reset_deassert(struct reset_controller_dev *rcdev,
 
 	mask = BIT(id);
 	spin_lock_irqsave(&priv->lock, flags);
-	reg = readl(reg_addr + EARC);
-	writel(reg | mask, reg_addr + EARC);
+	reg = readl(reg_addr + IMX8MP_AUDIOMIX_EARC_RESET_OFFSET);
+	writel(reg | mask, reg_addr + IMX8MP_AUDIOMIX_EARC_RESET_OFFSET);
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
2.43.0

