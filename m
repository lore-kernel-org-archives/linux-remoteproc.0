Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF9FEC433DB
	for <linux-remoteproc@archiver.kernel.org>; Thu, 21 Jan 2021 01:17:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 96EF323888
	for <linux-remoteproc@archiver.kernel.org>; Thu, 21 Jan 2021 01:17:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391736AbhAUBQy (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 20 Jan 2021 20:16:54 -0500
Received: from mail-eopbgr150078.outbound.protection.outlook.com ([40.107.15.78]:9536
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388117AbhAUBPh (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 20 Jan 2021 20:15:37 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MV3EsXNJB6YeNvioY6RN/KNF4D9sqT5pj8pjuHkfIsYnO2pTEh6AL4zeyV5ncO7TKwvFOLPGQQ8l5OgtTtC2EPGdZp+p6BqHKAHmGzcEqBVz9dKutsiXinOnW1qQi/7SWg2vS/QCY9Hi2WP1XyuEm5UAeaz3bgz9HVhdrZbaKKLC/pqGZfeuq83RPUXO2v5FHrr5p3jMPuPDg6NfwYfOUn7ggmfpcBYnry1xyGTpa3INGlq7YsGg+lOOGIFzVA/hxH/NodlJFeS2+Uby5XYnZaL1gNvt9EGojA0EwOuJNyCGKJ6sJegrvM6xTy5zLGwpbdmOaRgEkFtRSMrmt9XAYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gDE+R7Ch/mAEdmQ1FO6tocOoj14gW072NHZg/cEzn5o=;
 b=GMFeeXQSzlVHspoiYngFDHFHmhqqlU+PQS+XZ2naZxgjjYxWg33NCi1QlUPWAplRso0MBpeyB5c6v88NaRNuQcD8Pqv7ABev/THfC9/VeEalPAgzuGMBAdkl+m8QYAH+U8LSdY2xfAYmj9VsK4YDZnk6DuUigR29niMrZmEf9vKsR+4hNLhcM2pqxpmTtxsPKNNMq7MjvMkcip+V/wgkZTwn1EOdSYxmCGT9VnElW9AaoWdNW4CLRwABp/bSLlW8l8tQhLMPiEqnFOmRInSVZNkYzfD9ZBiL+I8MgEhfduIk6NhvUcM34IGmkQkfRiy9gmmlNMZqtIDti0HGIXVYlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gDE+R7Ch/mAEdmQ1FO6tocOoj14gW072NHZg/cEzn5o=;
 b=AwrBsCPaqn8xFZu7pLoLUr7hlM10gDY/yg2xhDAjM8+cETjX2fDZtfhbs/M5C9VVlUQM398ezq4Vi8+wQgrNGLboFxKk72D0emXx03T7sYFd5B55Qcdp0nqUaAsYqlMk44sxcDz2tFz/8wMO/m65QnAJyHDcM2dFGWerQ14pp08=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DBBPR04MB7930.eurprd04.prod.outlook.com (2603:10a6:10:1ea::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Thu, 21 Jan
 2021 01:14:16 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5%10]) with mapi id 15.20.3763.014; Thu, 21 Jan 2021
 01:14:16 +0000
From:   peng.fan@nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        paul@crapouillou.net, matthias.bgg@gmail.com, agross@kernel.org,
        patrice.chotard@st.com, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V9 01/10] dt-bindings: remoteproc: convert imx rproc bindings to json-schema
Date:   Thu, 21 Jan 2021 09:03:26 +0800
Message-Id: <1611191015-22584-2-git-send-email-peng.fan@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611191015-22584-1-git-send-email-peng.fan@nxp.com>
References: <1611191015-22584-1-git-send-email-peng.fan@nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SGAP274CA0018.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::30)
 To DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SGAP274CA0018.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3784.12 via Frontend Transport; Thu, 21 Jan 2021 01:14:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4519ec66-9cfe-4952-b580-08d8bda9deb4
X-MS-TrafficTypeDiagnostic: DBBPR04MB7930:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DBBPR04MB7930F5B5F3C2A313A12EE8A388A10@DBBPR04MB7930.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D0AgSx4pyUjnO2wjN3s/QaHwnVC5WK1qu1ucJID5HyYzof3rei1/77kQrV2mXbuAzij2GZnqIdtLhKrgJiyQ1iRglsYBRbrC9e6WYOpiYPRYsXIITSyBj1qlhuhCnCEzO3/FbJ8W4d9vy5JITDkqQufurxuAfdd+xR85F2/hwZ6h/qCHVqPSBSHUFipbw42T9s5On7GYw7rmLow/2uWCU6HpuLKeZnt9HvriucslCZOIcnvenXw6fAPDm0n6VJjH6rLiool5BUaRE6ywScYMq2pv83FCM1GxoNuz0Zu+5a8PmpHqBNxwQ2U/uatgkJDPj3eBgV3VFuQNhwjby/CkGLd8gVsHNKTUzYjvT1jKN+hV30ImV0KLOob1Cw1g+wLuAIEJtoxoqAChlLfjqvINnGomccUqXz9VmziyjneQx13NNOiw1+6re6AfVXgR6ZWWtm2QzS+fRUHUW830u81JmdmGR09bySLDVjqymmYMcUs0OLngK5epr//IoH78UOk/DO2mH8d+dDmOao6U321hoQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(346002)(366004)(396003)(376002)(2906002)(7416002)(6512007)(956004)(8936002)(52116002)(26005)(478600001)(9686003)(316002)(2616005)(5660300002)(6506007)(86362001)(4326008)(16526019)(6486002)(186003)(8676002)(6666004)(69590400011)(36756003)(83380400001)(66946007)(66556008)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?FyU/9c51Fxpl0IOkLLzqc9asY0i+/4vpa8iqVY3SBFGd9oki3V02K1dfyS0f?=
 =?us-ascii?Q?KISqc6M1VqENimMI9H2ojFdejBr2oFBxHJ7TUTA7RpcNpuGGV9CyMcLM522E?=
 =?us-ascii?Q?c7H/zrhQipV+kKTLqYpWhddEeKJeNuEhQfkT0FK/ZGQR2/YNqL82mrSZeSoQ?=
 =?us-ascii?Q?SEzU4m/NJEvOP9ufksTw9S/MSIi80ESulFOplIZ4TzYETMEOsZtnO+3ojIwP?=
 =?us-ascii?Q?lN7jMYrnctXj8zLt/mgKkwUI6YPElVH4KmVlpVqkDmqu7C0lAafLqfRK2Mil?=
 =?us-ascii?Q?u1xzDDBb1ydBsnMLAoU41jZxdufGB2atMJgcuky9rZx+P91egyxrq31SuZJ4?=
 =?us-ascii?Q?RVkv6wgN6rQsmnwr5kN6u5rYlHXcy2NWZY3wF7xRAiph4too5qxvZ65Eu8t7?=
 =?us-ascii?Q?+2W2Hm713maXChit3gWsgQiFoS20GOcHmx2vRwUr4Az5vJqKgBmNBrfAZqnI?=
 =?us-ascii?Q?/ZegyU0ELqMxIfWNh1oBqD6l7U7HfKlKYQrj4+d5t0ze+DBvYQ2+MiYqJ5Eq?=
 =?us-ascii?Q?/jC7P+6BLsNayqsyxU/HVWkbLP/sUpPg7y+Wmlg8hcJyHuekLjOsTDWTp4zz?=
 =?us-ascii?Q?B1OrizGrZMPj4eNMwYdEQZfY0LT2tj789Hc65BmIkW0VIMXo1s0KEC2ZWmNy?=
 =?us-ascii?Q?6VcJZdzhrpJ4FjmIlu4dnpKfyGVCTG1MMUYoSoQux/xu3T9O5usFF1+ZX1g6?=
 =?us-ascii?Q?Az7D1ujonSORlZ4SaTTrihB1iQ+3YlqtqUyJYhyAFXWh9kLQaqDSlnbNgm2O?=
 =?us-ascii?Q?8QME+hc4HKy7vJhRgF5CtDxj/KA56+Fs+JFSK4A+ak/kR+rw4x2n+2U954tq?=
 =?us-ascii?Q?8j4X70x6siu7v+TCy+XAB224VovgX9Xctn1h976I1xm3HUNhKWhUdRJblzXz?=
 =?us-ascii?Q?1gOyg38oRzNb6lc6O0e6k1JVXjVELBMCXVN8ohJKiB82lwSRpsBnC5a1zRyv?=
 =?us-ascii?Q?ONdPvm76Hosf5HGNL7X0WXnIv0glNqARefZLB+03bfcSf/o7XillD9Ey1phJ?=
 =?us-ascii?Q?nFLi?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4519ec66-9cfe-4952-b580-08d8bda9deb4
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2021 01:14:15.9341
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0HQUQXn1TEm17oRJ8G8KhwWg1CvyJI3C663W9/Vv0dCdNOzTV3FUjXEAJA20enEhgG8q6Nuqh2eXTbgKEXMQow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7930
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

Convert the imx rproc binding to DT schema format using json-schema.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 .../bindings/remoteproc/fsl,imx-rproc.yaml    | 59 +++++++++++++++++++
 .../bindings/remoteproc/imx-rproc.txt         | 33 -----------
 2 files changed, 59 insertions(+), 33 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
 delete mode 100644 Documentation/devicetree/bindings/remoteproc/imx-rproc.txt

diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
new file mode 100644
index 000000000000..bce6ccfe1538
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/remoteproc/fsl,imx-rproc.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: NXP iMX6SX/iMX7D Co-Processor Bindings
+
+description:
+  This binding provides support for ARM Cortex M4 Co-processor found on some NXP iMX SoCs.
+
+maintainers:
+  - Peng Fan <peng.fan@nxp.com>
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx7d-cm4
+      - fsl,imx6sx-cm4
+
+  clocks:
+    description:
+      Clock for co-processor (See ../clock/clock-bindings.txt)
+
+  syscon:
+    description:
+      Phandle to syscon block which provide access to System Reset Controller
+
+  memory-region:
+    description:
+      list of phandels to the reserved memory regions.
+      (see ../reserved-memory/reserved-memory.txt)
+
+required:
+  - compatible
+  - clocks
+  - syscon
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx7d-clock.h>
+    m4_reserved_sysmem1: cm4@80000000 {
+      reg = <0x80000000 0x80000>;
+    };
+
+    m4_reserved_sysmem2: cm4@81000000 {
+      reg = <0x81000000 0x80000>;
+    };
+
+    imx7d-cm4 {
+      compatible	= "fsl,imx7d-cm4";
+      memory-region	= <&m4_reserved_sysmem1>, <&m4_reserved_sysmem2>;
+      syscon		= <&src>;
+      clocks		= <&clks IMX7D_ARM_M4_ROOT_CLK>;
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/remoteproc/imx-rproc.txt b/Documentation/devicetree/bindings/remoteproc/imx-rproc.txt
deleted file mode 100644
index fbcefd965dc4..000000000000
--- a/Documentation/devicetree/bindings/remoteproc/imx-rproc.txt
+++ /dev/null
@@ -1,33 +0,0 @@
-NXP iMX6SX/iMX7D Co-Processor Bindings
-----------------------------------------
-
-This binding provides support for ARM Cortex M4 Co-processor found on some
-NXP iMX SoCs.
-
-Required properties:
-- compatible		Should be one of:
-				"fsl,imx7d-cm4"
-				"fsl,imx6sx-cm4"
-- clocks		Clock for co-processor (See: ../clock/clock-bindings.txt)
-- syscon		Phandle to syscon block which provide access to
-			System Reset Controller
-
-Optional properties:
-- memory-region		list of phandels to the reserved memory regions.
-			(See: ../reserved-memory/reserved-memory.txt)
-
-Example:
-	m4_reserved_sysmem1: cm4@80000000 {
-		reg = <0x80000000 0x80000>;
-	};
-
-	m4_reserved_sysmem2: cm4@81000000 {
-		reg = <0x81000000 0x80000>;
-	};
-
-	imx7d-cm4 {
-		compatible	= "fsl,imx7d-cm4";
-		memory-region	= <&m4_reserved_sysmem1>, <&m4_reserved_sysmem2>;
-		syscon		= <&src>;
-		clocks		= <&clks IMX7D_ARM_M4_ROOT_CLK>;
-	};
-- 
2.28.0

