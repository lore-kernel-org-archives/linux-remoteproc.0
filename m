Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE3F6C433FE
	for <linux-remoteproc@archiver.kernel.org>; Fri,  4 Dec 2020 07:14:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7160422581
	for <linux-remoteproc@archiver.kernel.org>; Fri,  4 Dec 2020 07:14:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728568AbgLDHN7 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 4 Dec 2020 02:13:59 -0500
Received: from mail-eopbgr60075.outbound.protection.outlook.com ([40.107.6.75]:2951
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725550AbgLDHN7 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 4 Dec 2020 02:13:59 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nB13aqE6GqesOgiB6a4VXnUGmWvzdjKObeZ4ZZiS0yoUZEcREA6baMAw7Nx2+Zt4ENWhg9Hz8lFGvIAN8gE3NOT57YvRPHDuTmwzI18UHrpb6gA+pDmtS+TCS1jbXoaymSEyQNJLFyDEi9tonbq3fFYB4wNELaESNHVe31/3YSSojzPCdiekSFRzy6xaX9eNPsSVShu25tPnezbuulbES89gzIzji4Vi/bcqqLLaS/YVFtnY0E4aa+udDT0j3JPyBreOqYmLbvAkRvnOwmwiEOvpAQz56/R46NXpeOI/jUhEYcswHgHM5VceGQaFot7MGgtg9/USnw4Bk4DmrGBmrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dIrXfbf48ik12T5YEmhpeZUyRG6RoaYP6vbqxR0GavM=;
 b=EpXE2QgIZL9jMPON6HkLisHSwMrGUTO4VHwXuaInGi/sXBLUhlT3750QTy7Ij0f0W7mFjNcs7TRThbl1A4J2AD4GJMYJ619geo1dAECEjM5uw6Ua0kGf8w4Lp3ins6wSFZd5wLB2D98DpyV/MHDOHLl4Hh0Kxpl6tevVUPSgWxOWm5BwrDFAdROQa+pwlxYO4vPLiiiju85oS8TLC41SFuGVFJREnFohxTEYkTBxKgMhOwr3qi/SpS78yen0VQ2p5prp9PDYtCZOXVk1mdA+uC1fKeSnxFRettrWgcux3HlJwzCNU7FaG+Rxq+D/K5e/95feK4Xamd7x2n4WE/LLEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dIrXfbf48ik12T5YEmhpeZUyRG6RoaYP6vbqxR0GavM=;
 b=mSEjtu2ejUpOc9vIBbDzMHopPTafo/gEgReYKJ1CUnzCWZOQUpv0uIBlMOFxAAmUySaR2ecGenyPqJhvuC8It9WJyjIqiXYeK9tQFXLi3zPTPLJ/4gXu0LEOBbbYy4WxI5b6HrCRadwZTmtveCurUGBsP0zp6t9OV6tPNA8or9E=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB4633.eurprd04.prod.outlook.com (2603:10a6:5:36::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.31; Fri, 4 Dec
 2020 07:12:55 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5%10]) with mapi id 15.20.3632.018; Fri, 4 Dec 2020
 07:12:55 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>, Richard Zhu <hongxing.zhu@nxp.com>
Subject: [PATCH V3 2/7] remoteproc: imx_rproc: add elf memory hooks
Date:   Fri,  4 Dec 2020 15:40:31 +0800
Message-Id: <20201204074036.23870-3-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201204074036.23870-1-peng.fan@oss.nxp.com>
References: <20201204074036.23870-1-peng.fan@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [119.31.174.71]
X-ClientProxiedBy: MAXPR0101CA0069.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:e::31) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-1xn6.ap.freescale.net (119.31.174.71) by MAXPR0101CA0069.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:e::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend Transport; Fri, 4 Dec 2020 07:12:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e4be73e4-01d3-467d-90d0-08d89824059e
X-MS-TrafficTypeDiagnostic: DB7PR04MB4633:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB4633C2ECF4D23A15B686A1AEC9F10@DB7PR04MB4633.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ijgu6WXqx/VReIfVLr5ow/FeGCfG9WkFfZz+38VBK7yee1vLxgotK/f2kTJ02XzUzJKUzADYJwkOFoQH0eSqOSiPhrGikXPVgCKce4QxDMcd3oScX5ZNH/OKbHeWtqllOSjlxnnS/Atowi93DeViBqVdF15c7CKZbF9dTTKPLnIImw0kOiDx3qdr94lXCiOOmOI3DIWzT69z6erYYi2BMJpCv176dCUGcMy0TQtls0pd/N3VchnfFYaVR1iMxcbhxHkb++9CMDgVVRPefpGS8e/EzZ5N3jZ+CkToW5bVkyU2m0abq5LP1PWnoFAnzFNccaoaxJgi5k6gUVc1+209hg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(366004)(396003)(346002)(136003)(2616005)(86362001)(52116002)(6512007)(7416002)(1076003)(66946007)(66556008)(66476007)(478600001)(316002)(186003)(16526019)(8676002)(956004)(54906003)(6666004)(6506007)(2906002)(26005)(6486002)(8936002)(4326008)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?fKwjOBEQEfYKyf00zoNKMnO92D7O+OfCRqB/0ZuaPkOwJBXhYzeMnmJDvHly?=
 =?us-ascii?Q?McXwBeUhanS39nx/8MPfIp9+ioBIT+7p3kIU2I/S3UpuFj8REVBa4DTpNZCW?=
 =?us-ascii?Q?ApTub5EUKU7Wb155k000m/ngB/mFjvmKZ8u0yIs/KLusIH55T4E0AoPQZcSu?=
 =?us-ascii?Q?B1ESBLSFa+ntDuNJo6I/DPU0K072MlFV/MdcBKC1+3m0HrRHWPxDsMN5YQfO?=
 =?us-ascii?Q?/YFOe85uLX0KcmujtLsOaft/q68M5dlNmg+k1fQW8vTGGZ3daHJcPapY7U2J?=
 =?us-ascii?Q?6hckvRMt2yI9obGV9JvziI68JiF0NUTx1onylowGD4j7YrLGvRsMihTfQpHE?=
 =?us-ascii?Q?HaC/t24FEdravpSCo1qDpoaSp3Ipj/a75D+yyqE9TYzFsdnoRYhYSYkLrp5e?=
 =?us-ascii?Q?7SjA8dUhastX3taZjEGozapvghCLzvVeaZzUgZYq68HGRgBLiv4kcsE3DsVr?=
 =?us-ascii?Q?kJp6A+C+M8z7+oxNK1XCptessWcxzlN8FbQ6Y82QUiqT5B7C80nudzJ7ghsu?=
 =?us-ascii?Q?LTSbwkjELBC8rv8sTGc1tlV/6a8jgNaj28EyA5GVZTu6bAHNkTOPBzhylTAK?=
 =?us-ascii?Q?4cGRFBbZ7imUw0qQYy0FeIIa37UPIsR9GCPSMYJHcBlp23XbsB+O/7WST6nk?=
 =?us-ascii?Q?ntaEX6z4X2IKNPUR6IsJeX3/hsFumCYwU0Xh0SFYQDIRLTr7zbT2KK5TsViM?=
 =?us-ascii?Q?RjBRPpOyExRcaC29NG0yerexTOz8/NkwTBWgQ8zbi56wXVn3t09efQgxZ0QZ?=
 =?us-ascii?Q?ahmv5xCKThpcmUs7LIkV5pQ5ZQIECCh5kBU7JQdy93SvoSYkrhSzPAYsW3ov?=
 =?us-ascii?Q?WGaPb90H/uzctBugeztXYT6ze409XdLWjmjFcRknhCcwtVk0/iTK68ZEbCPO?=
 =?us-ascii?Q?vDmxX2qdZJ0M+azXnTuVY+VxgSyD1bTZdFH2pSKTCCDu5clOFZ0LYVkWvD3H?=
 =?us-ascii?Q?p8mEHjx0aAPBBuZYQNn9ed+PXfeqBRMmi8+0WxFmpUdc0XnZvoEADJ2mFWX5?=
 =?us-ascii?Q?5wgT?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4be73e4-01d3-467d-90d0-08d89824059e
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2020 07:12:55.6356
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ULTq7zogRYgjZBhf4V37NeMporycGSBMSdXN2TMLIkryGQH0O+RZrS6s3e0kkW78HSYTfuw0qPcld+onvTGtsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4633
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

Add elf memory hooks according to elf_mem_hook setting in the platform
configuration dcfg.

Acked-by: Richard Zhu <hongxing.zhu@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 8957ed271d20..d1abb253b499 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -6,6 +6,7 @@
 #include <linux/clk.h>
 #include <linux/err.h>
 #include <linux/interrupt.h>
+#include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
@@ -76,6 +77,7 @@ struct imx_rproc_dcfg {
 	u32				src_stop;
 	const struct imx_rproc_att	*att;
 	size_t				att_size;
+	bool				elf_mem_hook;
 };
 
 struct imx_rproc {
@@ -310,6 +312,16 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
 	return 0;
 }
 
+static void imx_rproc_memcpy(struct rproc *rproc, void *dest, const void *src, size_t count)
+{
+	memcpy_toio((void * __iomem)dest, src, count);
+}
+
+static void imx_rproc_memset(struct rproc *rproc, void *s, int c, size_t count)
+{
+	memset_io((void * __iomem)s, c, count);
+}
+
 static int imx_rproc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -340,6 +352,11 @@ static int imx_rproc_probe(struct platform_device *pdev)
 		goto err_put_rproc;
 	}
 
+	if (dcfg->elf_mem_hook) {
+		rproc->ops->elf_memcpy = imx_rproc_memcpy;
+		rproc->ops->elf_memset = imx_rproc_memset;
+	}
+
 	priv = rproc->priv;
 	priv->rproc = rproc;
 	priv->regmap = regmap;
-- 
2.28.0

