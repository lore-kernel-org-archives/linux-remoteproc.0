Return-Path: <SRS0=jP1a=IE=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3FAEC433E6
	for <linux-remoteproc@archiver.kernel.org>; Sat,  6 Mar 2021 11:38:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A794864FEE
	for <linux-remoteproc@archiver.kernel.org>; Sat,  6 Mar 2021 11:38:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230413AbhCFLiL (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sat, 6 Mar 2021 06:38:11 -0500
Received: from mail-eopbgr80043.outbound.protection.outlook.com ([40.107.8.43]:23521
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230227AbhCFLhs (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 6 Mar 2021 06:37:48 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UsStnGwphUccFJ3fya2lUKhlK6XutLm3YdtaXF0yn0B5P0a8Zmi8qm8LROyQJbE/m+MfbXpFVkqLR8VRsesa5XpxyCoqJhN/ApBJGG3EUnjVGLtOoxh3FmPghMjmlETyoV8SPRXBHn0nQ4ipmeZgudltiZcj9cIzkKOPNrX5wwSvBNDDCGmQPFgxpdlAuXbrs8IodguJ4riNoZYZypZX6FoCDJCF83xaZQ0LG3RFqioa8rHCb3L6QCXkuRhmiYeWmk+GB1xzfE9ZpAzZmEINlo6LZ3n2zeFPVP3zlHm8i2WI04F+g4GgpddfGZaQfsDVh+fqFHbtaO7uEDJNN2pEaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9A+XP/uWsN0e/CRatf8DaJuBGXINbHwchccy90gEerE=;
 b=dHAZNyzbYM1fA0SJ1a1WSCgg8TeQLTCAXmaN89jc2TWrl1EyqzIa4YeINIwE44FLTBb3qC42rOlBNdcTxO7PyLCzjtOKRxJ355DADaTYVXPDfbz4O2sAaG8AJBj9puepUU6EU2JxDWwWbYJHrHIl4CHv2d5tcWqwdUr1g+c1+n0RqYkPz4xCYE2D3sZFpyuaLrVpwfCYXpjxQSL2+cGOEPBmS4+Xrzsyp4AQu59i3iFOflMhRP+MmVy74MAIo86KqNoe8IUzyExQuJyu6gMDPNS2HY+y5qD1LcVk7SxcAE4jcJU4I0sEn0cJ+N8NgPkiJM0BVotZtwHcWNEgyLWLtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9A+XP/uWsN0e/CRatf8DaJuBGXINbHwchccy90gEerE=;
 b=N8DiV844EGhtNutiZJi+R1YmsNU+Z4K29g0WRpjo+hCXRwcLAFiUjf+r/Zr/YxVe8Iz1t4OK44kI/p4IzV2DYvpUhHuBfXyyE3nYCRz6RZBLQWaLZy4V6QDH6IMS/xysreKcE5dYBb8y02TzVYJi0g4pfOG4hk4Bygrb2YfRDXM=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB6PR04MB3016.eurprd04.prod.outlook.com (2603:10a6:6:a::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17; Sat, 6 Mar 2021 11:37:45 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0%9]) with mapi id 15.20.3846.054; Sat, 6 Mar 2021
 11:37:44 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        paul@crapouillou.net, matthias.bgg@gmail.com, agross@kernel.org,
        patrice.chotard@st.com, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V13 01/10] dt-bindings: remoteproc: convert imx rproc bindings to json-schema
Date:   Sat,  6 Mar 2021 19:24:16 +0800
Message-Id: <1615029865-23312-2-git-send-email-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1615029865-23312-1-git-send-email-peng.fan@oss.nxp.com>
References: <1615029865-23312-1-git-send-email-peng.fan@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2PR04CA0047.apcprd04.prod.outlook.com
 (2603:1096:202:14::15) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by HK2PR04CA0047.apcprd04.prod.outlook.com (2603:1096:202:14::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3912.17 via Frontend Transport; Sat, 6 Mar 2021 11:37:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a04b62fa-d58b-4dc2-9af6-08d8e094426d
X-MS-TrafficTypeDiagnostic: DB6PR04MB3016:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB6PR04MB3016A5B9657E826F4BE6F594C9959@DB6PR04MB3016.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WM1ISYpzRGXhm9NgbGQjuZyzFH70EWSwglWCVdYpPrNiEA8qBBDrAH8YmxW+CKmU3DXvfS+Q8Pic1HMKflPwVosusLQ0jkjwO1apGPlNirI1/EUZiOQhgS9uLJ/ooW+n7wz2vrNcUdepaZUkSnVHJUn2zPxHqpyMqikMWV4Dc6nMkYvU6LPl3GPbzmwAKt+oPgHUJPGn6i4bikts2r5XrHrWfONd21LTdesG8fEpkObB+CGYVX3tsdxlwipcgbm+etikB2cU+bOLeVXP2Ac1PTQpbTLn9/alXUbla40HG9w2mPLkVhvzD4vkOHI5k5sgNyxfyBa3iG4uMgjfT/Z8hwCPV6E4RBZKPP71xpej0ngiYiHx78RnwtEfU/yarGrQYqi1jbPCi1FQUHpRV+HqqVaMk4a6MsE6CDadyzze6VbTzUuShCYAbU+T+jZ0ACqDhmBlQSH/vrF9GDC777Vk0cv/ritVbxIIiGi8aL5rTiUIlGayjYlTpairddtatB7xwEj03eiiX031uGnQaFg+4O+kHZWqsYLvMepTYnrjdqPvmhfJSHs3fgJW0gGeSGtvEqnfzylxcZY0Q9G07mYXLRFnxLy9MuRHDX13r6VkaPaOet3TpsHsbp0zjK/Cwq1und9LsIV7agyCT4bzkARepg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(366004)(396003)(39860400002)(346002)(83380400001)(8936002)(69590400012)(8676002)(86362001)(6666004)(52116002)(956004)(478600001)(5660300002)(6506007)(66946007)(26005)(2616005)(4326008)(316002)(66476007)(6486002)(6512007)(2906002)(7416002)(16526019)(186003)(66556008)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?W7ZXXEn5it7mGW2UC/gPJTDICm/DfSMStum/J0UhQ1P0z6PJ/TElW8UXe2tO?=
 =?us-ascii?Q?rhxEMy2y7QUYxKYJE8+y3C9pK9eStOwDeU0oGPjDD1pVKMUZM5MqW+4cRBpO?=
 =?us-ascii?Q?JJPm6Ttg0GV6VuJh6Uh5QTdfNnMWQS/miIx9vHATEEwR2MGjzz5fyRhyPN+5?=
 =?us-ascii?Q?mkGtpj6m8IG9vsFBMQ04juQbXNkRBtumjyL20AI22b/dwLoLjWhh31QDtDzd?=
 =?us-ascii?Q?71OHn4QBlIb4qEjBeHlR4+FFyuUxl/iLbCYwmfbWPjGQGq1cPYj33cHLce3H?=
 =?us-ascii?Q?jLhtvB9QQRR8GqTxNRAthIiurUQrNdyeQsOpCQBkj42bY5k2JJ5YlfAjGXd5?=
 =?us-ascii?Q?PFPCEt0l9kx6655gdXFVxXgAoFFVrZtsMMdZUG/iN13kjWhsTRBeJ7bUaMkd?=
 =?us-ascii?Q?lJQKiUIeyKkwKtG7VhdeuCRAP99L4mWFoodTrWfL621Yl0NlawQ+r3Pirq2m?=
 =?us-ascii?Q?2cd6Zdk/oaEBOCRhi0Rk2tJPSvQvee2fNwCNA0Ra/JlvU3vxVTUI7A0IBL7U?=
 =?us-ascii?Q?xOUxGs0Q+hAhot35XgzGx9w3CLE2LxjFS5Uur2o31jh0rGs0xYxbW4snnTEB?=
 =?us-ascii?Q?6R2vH+cej5VH3Vc8P6+7Yo0yrDTy1RwFpxyDOEAmAHuO8YRkG0ZOSk+QsoBD?=
 =?us-ascii?Q?Q5t6dyFYpEOyVRPTfbWJVbjgn7CzLOLaIChaScAz7L5h020ZheDjIp0IVZ5N?=
 =?us-ascii?Q?J6bYqIm0sO+ea17j6zvDZxz+GOKyx6ba7ORK9iUO+QtsnEaz3uzXh0p0LQOW?=
 =?us-ascii?Q?BG4Yy5baPHnvnDbgSOvsnqUd+29QDG2gstGNZTmez+OMz6Pj/Ke3ZGh0bHWr?=
 =?us-ascii?Q?YJYdv9UPjQ4S6/zyWfLl/hBVbqQoc/S/WGT1ETu6Z15RDLQssT+QN6gzCKi4?=
 =?us-ascii?Q?7uOA/MBnLGJnrkuKfgm361yumBoLBEZaKvDa3MOkxdj3D8cF276ey35VfMw6?=
 =?us-ascii?Q?+ejJDABnkETcT40X1P+G5AqeiMk/tREKxVbAj7G4yjPW0LtOPiNacCf0PHvF?=
 =?us-ascii?Q?aUadGHRJsGwlnN/EfmycjHz3pDlt4B/QdBHSD+b4p93qioaUZVqA0GvvqcAf?=
 =?us-ascii?Q?B6y/UYpm/bCocVYOMzqGs7RuK4rHRu1EZX7vlM83ZxUO8jL79h8sWnbwMg5f?=
 =?us-ascii?Q?BRT8L6uoF+ISO1ynxmOv80tPCPDN3nFuhAo4GGAPdNGkFCwMc5iOfb44Bx0h?=
 =?us-ascii?Q?aYdiXtbARfWJvY5RoRXX2/x+BVQ2mcf0Z87gsihzzz+m9QW7DVr0hHdz0m8h?=
 =?us-ascii?Q?g0W92ngi4TUo6zUg6oCeacdH+CXL6EBREbwQpAoly/VapTW6/6ElTzD2FvdU?=
 =?us-ascii?Q?Oa/zLMgXEYtizDEokk73xeYg?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a04b62fa-d58b-4dc2-9af6-08d8e094426d
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2021 11:37:44.8975
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sZpznS4GMsMQ7mbAyz21VDCOaqyb4hAmGbpIldy8DkyJ4kDNUbZxkydttSF0UgxYUEmtK7AHbLKR1Xku2406jA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR04MB3016
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

Convert the imx rproc binding to DT schema format using json-schema.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 .../bindings/remoteproc/fsl,imx-rproc.yaml    | 61 +++++++++++++++++++
 .../bindings/remoteproc/imx-rproc.txt         | 33 ----------
 2 files changed, 61 insertions(+), 33 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
 delete mode 100644 Documentation/devicetree/bindings/remoteproc/imx-rproc.txt

diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
new file mode 100644
index 000000000000..54d2456530a6
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
@@ -0,0 +1,61 @@
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
+    maxItems: 1
+
+  syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to syscon block which provide access to System Reset Controller
+
+  memory-region:
+    description:
+      If present, a phandle for a reserved memory area that used for vdev buffer,
+      resource table, vring region and others used by remote processor.
+    minItems: 1
+    maxItems: 32
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
2.30.0

