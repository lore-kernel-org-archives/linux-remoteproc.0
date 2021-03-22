Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44DE7C433E3
	for <linux-remoteproc@archiver.kernel.org>; Mon, 22 Mar 2021 08:27:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D4B6B61967
	for <linux-remoteproc@archiver.kernel.org>; Mon, 22 Mar 2021 08:27:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230002AbhCVI1J (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 22 Mar 2021 04:27:09 -0400
Received: from mail-eopbgr10069.outbound.protection.outlook.com ([40.107.1.69]:8324
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229746AbhCVI0h (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 22 Mar 2021 04:26:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EmC+OkBSBDk9WYlQsIUCnempHQL+RD09T06X0/hu3WmrraIUaGDFXjytF2bL8mWmfBJwIc9xpcAzC0XvGPLMxTj9jOi5UBgWstcUgj9wPa27dh1zidttAx4gH/PavHsJ/W7+rJdnUYdCWzLuEMKFgAkSO1t6CnkeOpshhsdRO04NyKhaz4TylibAXiCla50/7nu5MLIRmKeYIxI0j3oqYw7f4WmUMSNm+W79OmwxWg286YwpStUF3qWyBOeeX7P7yUgstf4+OYFg55FKiuBPOLIUro+sr+WBUz+wfeyw3PlnlWwCh5Es0gjYNXUhVYL+pf51dJCFkzOacRHxCQxv2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DRMTXzMTDDos7jV77mCuTKaseGa+iEA4YO74WsUGZts=;
 b=PLg4sCDuT+jjHlKxNhCeZRutlDbDKgZlkDQbc+jHyD6PlbVNrV2xkQWLkGCS0t5U+dmJxLpRHHuMinmdAnjpHhE9SSHAqbX3X1rcyOPREwNPlDCAX1iSYeZ+ezsHLt57XWimvlmiH7EV8hd5DpqqBCrN4u+QZoYQouLOQ2HIu1HsHrQl/DynLQcz8ZOGD/leSXhfnw4CEuinFSdqQK2mu+t7kycz0TI4TgApmyCwygtLdj3pAJmQCpCMQJ80JMUG15wgxNhnx3Dsj/X480L/UebIdU8gdYf+2n+QVGsyVgIeDDSy/XrPXqtPxr4heZzmIU4rIMDWuDoTcakjNPNb8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DRMTXzMTDDos7jV77mCuTKaseGa+iEA4YO74WsUGZts=;
 b=fLA63W7gdRPnZ6uP9O6frc0xb6N+PNG/AoLtYa9xgUAb0sbQDqypdRdX8ejFtJNqaZzuME42/DPX5FRjjAdl0n9SkRCO7xU63RWVWHxFkpopPMeKDxp0PvG+s9IhaprPSsb/imqbeR28amuEHW6mA+k+IDZP310o1dby2ogl4Ec=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB9PR04MB8316.eurprd04.prod.outlook.com (2603:10a6:10:246::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 08:26:33 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0%9]) with mapi id 15.20.3955.025; Mon, 22 Mar 2021
 08:26:33 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 1/8] dt-bindings: remoteproc: imx_rproc: add imx,auto-boot property
Date:   Mon, 22 Mar 2021 16:12:36 +0800
Message-Id: <1616400763-16632-2-git-send-email-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1616400763-16632-1-git-send-email-peng.fan@oss.nxp.com>
References: <1616400763-16632-1-git-send-email-peng.fan@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HKAPR03CA0007.apcprd03.prod.outlook.com
 (2603:1096:203:c8::12) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by HKAPR03CA0007.apcprd03.prod.outlook.com (2603:1096:203:c8::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3977.9 via Frontend Transport; Mon, 22 Mar 2021 08:26:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ff24edd6-b7ae-41ba-b81f-08d8ed0c3375
X-MS-TrafficTypeDiagnostic: DB9PR04MB8316:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB9PR04MB831655725B49D7F12107DDB6C9659@DB9PR04MB8316.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Nwa/qXGJkoq69L5xvCILvz46aiZU7bfoRUkczySu17GY+x0slbQsrKDeOzuQxnHMxzgAAjKFOL1qRC4EgroZer8y3AMzo67qZqZue3bln/pOUM93vP3DiDQBhyNfhCBNAzYSXZTIFLgpcBLilLodUYFMybiG/kp2vhQ5wL6UNAXQh7e47PD51B+TbHlPKMlh4XlhumiBLBUrohudd30wCL3JipSt4dkjV4NNFflZRQ2B6gzoIT0COhbETOq26LQhA7qJrZr/Zt4sNc1zN4GCrxpvxQT9ukR52SRPPFVYf50ZXy84D+WjVeKNA3lOVkGATGmop6UEBgnAaPrh04PAUfSlBAAcQalsCtm14HA0AS4AMA2cpbL4ufpxwmWvRHvUyetUvhqx4aPta+GqPls95DZIwl0oB/bujN/IZMDKAd799Se4ORFloXRI2izHgZAix/Rnx0J7WJRzOl9mWNqOouqFgJ7vxBIVuO9sC9fCSvTgJrjzgAaC04iMPS1eyut07LKnHF62PNP7xZ9RbmFhypmrWyhs++UT30mHIG5/eyzxVW74v7EGgfiMIp6lIdQwcd0CvQtCEmAJMEbd7zPYrISHI1JOQzyAC2pnF7+4nJpHTK36yizJ0xOpej+LSw46+4hMsRQIP7yQFgbgItRZ0dzZPF/u6V08Ep2gbkDdP7FWR3bLZPiLe2VWNz/IzVkO
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(346002)(376002)(366004)(136003)(8936002)(6512007)(6666004)(66946007)(66476007)(5660300002)(83380400001)(9686003)(38100700001)(86362001)(8676002)(52116002)(7416002)(6506007)(26005)(4326008)(478600001)(2906002)(956004)(2616005)(4744005)(186003)(66556008)(16526019)(6486002)(316002)(69590400012);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?1RzH30QMa4146q29xcezRSIpw17VsSlzBixtHDWPKxgrSoItT3WcD87dABIC?=
 =?us-ascii?Q?YAsL/DKl5xY0cZznemDA49LkoczUoBnCPcMTxOCZShX39raXiCY5b0zFEWMd?=
 =?us-ascii?Q?TpqJgnqcyyvE+7cN4PjOa4A0s1nPLIWjYljOoohImbCKiWzMxmPqw6J5r6Ey?=
 =?us-ascii?Q?3nW4mntxbNJjR2fcosfa6ofMpgSV3cXxeYH1KEdEtZqaDYMZhqMtGQtFhS15?=
 =?us-ascii?Q?xjaJO/GF887fQ5pZQSJFMzf8qlVZHsnendqSz408idPmQ1uf4jmFKxcRQYJ+?=
 =?us-ascii?Q?/5WuottM35AQwbNEH9RFz1oau+IBlbMQKeqtkKUt2fGgty/2cZXSycptPwNt?=
 =?us-ascii?Q?SRw9nC1LwSVzNu/cALg5VrjrN0uGBngh8WB3i9jmryTcE0e1l1JLj3qnIaYE?=
 =?us-ascii?Q?U/DbYuRODGeKEdQTynGmRfFWNpGsNDysZd1TeNx050iyWEs04+yWigaIo1hJ?=
 =?us-ascii?Q?7dTmIBR34z9H5zoMQsTebeolOBjICrxca4q3TRFVdy57YRLByFoQ3CnpqaUk?=
 =?us-ascii?Q?Iz5HwxZBaxQSCIUHyi8h07qiAf0l9m/eKfKNSwLNzG5I4iuZEv0yyrST0Mqu?=
 =?us-ascii?Q?YRp9Jgb5qtjdoP1IvWRYTugdtxVCJr0Gg8bkwIPO+y/lS6Eg0Iuyuz7aYV24?=
 =?us-ascii?Q?szLf4UGyLwZWBISe2gZlVe4cTBqXPB1TD3KUoCIRSq3xBqUthT4iNMwBwMxo?=
 =?us-ascii?Q?jFeY3HX4L+JD2qVF6Cex8nVQAqBGBrrQ2lceDYaGzlkoaLGsn2anHSJlkQ8q?=
 =?us-ascii?Q?M3rsvKLaS3nQK3jFQFS0X1Q04xNzycLD9L4yUaLZVQ4BPAaa/WYUAX41T4PT?=
 =?us-ascii?Q?zLv9rL3AiBcFRRemqSte7YbWwJF9ywheCsKoyMB3FK1R1nuMo6yJmDXFWYlQ?=
 =?us-ascii?Q?Q4OYZ3YZ9E02+CjLdBGMc/bt3nmLNnzUIzKx2M5k4Qc5NDNTykMvqQ7FC2zY?=
 =?us-ascii?Q?APvH65TcHEAkPJt8p/ex0OvDllLmSuTwTm4XU/y1NLV0Bm9rNKfGQ7sBzM8C?=
 =?us-ascii?Q?IEhANhcI2Am0rpoY5BIIadCm69bEsgCrwyWXfeZUmAZSTgLLrtRdpPFOwP3E?=
 =?us-ascii?Q?MZxir6hdWxSMiY7RjJGLkAO7Yat+GDVRZI7XCBi6ua/Gye6UA+0qbdSdGr4X?=
 =?us-ascii?Q?90SmGkezxyTyqJjxMBFA0p8b0SqAuOwTCuhLZqRTtIRbMOBYk9q2hq+RU5aE?=
 =?us-ascii?Q?LgL96CNDodvNLzB+Yqb6vAeuHgTpHr9qbY4S4xgaz6sAQ/EC03JgD2LrovNc?=
 =?us-ascii?Q?9nT7gsDj5faHzyELwFpB6cl8vaBOtHXGzR/T2CvDrLFmVALmIwikOPb+LPpF?=
 =?us-ascii?Q?lhGLEw6Yxm3yMYiBADCtvG0t?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff24edd6-b7ae-41ba-b81f-08d8ed0c3375
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 08:26:33.5636
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sm7xlYz4OEYws9kSzEUJFf6oXAP4ZczR7Tui7aGx4HVZeFc2DPVzxGM6yZDu8uME7v8QMMywY+MZqGXLWsGz7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8316
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

Add an optional property "imx,auto-boot" to indicate remote processor
auto boot.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 .../devicetree/bindings/remoteproc/fsl,imx-rproc.yaml       | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
index 208a628f8d6c..70aec1a2e86d 100644
--- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
@@ -49,6 +49,12 @@ properties:
     minItems: 1
     maxItems: 32
 
+  imx,auto-boot:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Indicate whether need to loads the default firmware and starts the remote
+      processor automatically.
+
 required:
   - compatible
   - clocks
-- 
2.30.0

