Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E006DC433DB
	for <linux-remoteproc@archiver.kernel.org>; Tue, 19 Jan 2021 07:54:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 963FB2311C
	for <linux-remoteproc@archiver.kernel.org>; Tue, 19 Jan 2021 07:54:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731329AbhASHrV (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 19 Jan 2021 02:47:21 -0500
Received: from mail-eopbgr40080.outbound.protection.outlook.com ([40.107.4.80]:64958
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731302AbhASHq7 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 19 Jan 2021 02:46:59 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=klVJTKU3gSsAprdKZwbeEpY9DrQ/H+bp/w3P3tXY2LwKTWuLmbM6LvdnrXFRuNzNmuFeY6zjHvVsW52nHtsS/IRrDj1pIvJrsmdss9pBGrHe1SgFS88DoIIaowfdo93vzDk0fmoT3JFqwR/JbhSahSw6lyMmlm+hDkJ01DGL5yhieuQJqVg+TtCHZCMbKFosjE9rsQ6W6ACWDEQJ03eFtoFI6RqkQAPNQw8r0YgpSu8so1UsQeqoQZKQYYvKt588+OyPbnQh/oSPKmdQwUl0Z6QvNfz7AyJSbpI/ajDx95dijVXla4FjR8NrfXsJQdT5B9FRTYaSEV8D99e0JZVDrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gDE+R7Ch/mAEdmQ1FO6tocOoj14gW072NHZg/cEzn5o=;
 b=iuhEZBtBmvuTKfqKrI2lbfigh/ebd1Rmv8rbI6WtnTTrxQ7amV6Q3HuoLhkhIbs0u01earCoAnRyj8qqtw8Jx3TG62BZWNBSP0+erOkDNIFKKcABJCy9ulbjYkv25mLWytQSHtteVKaoXrJU8MLgaSS79lKp5YeDwa0kdR+xnfhJaE+8MDOUhkz84HQH2TlNP/DSGGdvY+YhaAR3SYD7HlZMYMe9o6qy2yMf6BghyYZcfar1MtbyG0q5/cuBX4JgLKPlII+9fMTwO0FxcKPOR9eZtQgmIVqJ5hgbXWc0JgnIm7pAAovmwFvie3JAe1WIXLTvfqzYs6A8UM5I35GEnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gDE+R7Ch/mAEdmQ1FO6tocOoj14gW072NHZg/cEzn5o=;
 b=CFblgJ8fcm/vsb+KwANXjaUeqMRqHKBT/dYrdxFvdqFvgzS5EOF0ibUqRNKjVi+Vw1n0MGqwKt2F7rr9vEHeZFmb8UIXzWBDA4EqMRwf9K4EL7Gbxz1gaLAYpvt40g0ue6Vg8hKZ+YyYSjRaJCki+iyrYM1Yy0cVL5G7JNJ+m74=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB4492.eurprd04.prod.outlook.com (2603:10a6:5:39::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Tue, 19 Jan
 2021 07:45:39 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5%10]) with mapi id 15.20.3763.014; Tue, 19 Jan 2021
 07:45:39 +0000
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
Subject: [PATCH V8 01/10] dt-bindings: remoteproc: convert imx rproc bindings to json-schema
Date:   Tue, 19 Jan 2021 15:35:02 +0800
Message-Id: <1611041711-15902-2-git-send-email-peng.fan@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611041711-15902-1-git-send-email-peng.fan@nxp.com>
References: <1611041711-15902-1-git-send-email-peng.fan@nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR04CA0161.apcprd04.prod.outlook.com (2603:1096:4::23)
 To DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR04CA0161.apcprd04.prod.outlook.com (2603:1096:4::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3763.9 via Frontend Transport; Tue, 19 Jan 2021 07:45:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d633ed2b-836a-4b6a-4a2d-08d8bc4e371b
X-MS-TrafficTypeDiagnostic: DB7PR04MB4492:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB4492855668732D50B48CFDD788A30@DB7PR04MB4492.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t20KWysijcCD79d+Ix1fzdnFB7hFShA3GeUCjh2MMnNo1rf/mnIs0851/eXJP3e0ehmbh1X4ica6Zz3GcVjR8PUr0WLGpZdgLs2ZyIeh7z44yx34y4A5o7oh8um+pCoEJKx77xc9wvo0ar2CdaCTebDHXh3BQokjiIjpIE/8SsAp/i2x9scxiKpbBmZYo/9fkkfUEJan5bxP+et7cesdiGkjFqrUxXBUfOMbwWswvTq9PQqdR+IEKmHRq9zpVN0LbJ6/763C5NiLp3pBl/x+RSWEjmZsiu78gnhvPbrQPI6Y0O30RZdF4V77y6qyBqqrMsG8T5dEYGW3qrrTyvjOoiMBxttN24jBMNA1N6Ys+3tZ2B5/QM/XOgdurtcBITrWZmCvT1RU7+/dlLjajwrgjfLJmcLJpF0h5Wz4b46hiaO+w6bc0E9gZ0osTE4K5ASApHXtDaZpe+fWP1IXYRTUlznY8xVpsTpQCmoTulV1uegSUyoVYGfU+aYK4JDRZTaSPlRBYowmauc/M3XR/D1ZiQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(5660300002)(2906002)(66476007)(26005)(69590400011)(4326008)(6666004)(66946007)(186003)(83380400001)(6486002)(6512007)(2616005)(86362001)(36756003)(52116002)(8676002)(6506007)(498600001)(7416002)(9686003)(16526019)(8936002)(66556008)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?UwZEbzhVi1xzsSAyR1dZa3th97IJfwvyCJz5S2YVrAec5X0GgYBce0iwyxr2?=
 =?us-ascii?Q?hHQO5GKlZXLS7iAqZUwe3Mx1oNicsdQgE/N6mQRh0qckzRzy41dAvMWD36tH?=
 =?us-ascii?Q?0DAuAEfi5Yiy4D2wYKD8tkF9VI0QoNxASdGOEbN3B8P8d8kqU4J+OPIt0rs+?=
 =?us-ascii?Q?MqUEywlQDKTbEdb12cBY+mZMcMQKu+lDa03sIVO/NUz/v0FtGrKF0wGR8Hk5?=
 =?us-ascii?Q?khe2iXoNVPtmskERRghQAOnzB/n+IM2qv4APqmesaGee4uqq6Utb/rNkHQya?=
 =?us-ascii?Q?VNhYCOqn0tHQX7R5xJLZkTdn5OQcf/qKrO3yLq/NpsBsWr3xy/97WHMa5t+r?=
 =?us-ascii?Q?PdX+/lQSxk3a3KC3yndVKsRfDFNBJyMsZkqehTbQUYo+ezwOcxFPqdGjlQvR?=
 =?us-ascii?Q?J+T+JYpXsJa93iM2LtQgCTsLQg3zImWrZd4Sw6ntt9CoLWIU6E66NhpRWUbU?=
 =?us-ascii?Q?l+HMs+Tl56FjrKUmdUWqPPgonYvBhCad60hgzLBlWwv2QdVaJSKOGONpNqPO?=
 =?us-ascii?Q?nl02hfe+eIWje+KXWjXYfKv4XW25SNW6SVIsBUwmKRScH7Z+ZmXynrf8ip8C?=
 =?us-ascii?Q?w6scddUzX+/qeBH2YMvXY100eQO4hbLL7F8bWhIGqL4AeSX9cNngORzWmyDq?=
 =?us-ascii?Q?ubZidxLWI3tLzYKsCQJRBtwJnsQkzHJMv0yiaCPmZjt+xNx/XgmvG7i1+1E0?=
 =?us-ascii?Q?CVWqIhXOBQK3lmLM4pVCNz92wUPpg+Pmxekp7RPBi5O70gKVdFZHdmWt+rqm?=
 =?us-ascii?Q?kKtkCkZAYKnqdTUj1w9tNOVdLYVhD29uQXEn2aEwuwFihJBEkRVnWjTIVr4J?=
 =?us-ascii?Q?RDKuFKQr05csDZZig3AS84/LzydKq5joI4rznVb9tfhOlSCwo6iwp0TagcOU?=
 =?us-ascii?Q?rdkLfZJhV/g2oROEuglYlxVBa69/QKylq4rDZFmicaGwGQlwAvA4y9CpMGFP?=
 =?us-ascii?Q?eIaodw01PzOzRz1hrdPQVnEPld51LbpePIAzsTASQGY1ia4v0Z7uuI/AKIeJ?=
 =?us-ascii?Q?RqYk?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d633ed2b-836a-4b6a-4a2d-08d8bc4e371b
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2021 07:45:39.3430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HLz0QnF8qL2+YVHkGGmr3HdFVoyy2t3YmhijOkhNI0DTDblHzUNOSm12SGHcw9sPQnl7//+6GfKAn6zDyxrorg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4492
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

