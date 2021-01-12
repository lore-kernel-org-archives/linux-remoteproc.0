Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A27C1C433E0
	for <linux-remoteproc@archiver.kernel.org>; Tue, 12 Jan 2021 09:50:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 53F67230FF
	for <linux-remoteproc@archiver.kernel.org>; Tue, 12 Jan 2021 09:50:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390034AbhALJu2 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 12 Jan 2021 04:50:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387627AbhALJu1 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 12 Jan 2021 04:50:27 -0500
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on0608.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0d::608])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38405C061786;
        Tue, 12 Jan 2021 01:49:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k11naD3oTFkD/L01ZF9xnuCLYYHmOzA7xbwIJzCUjElLggpRHynNRZdBB5N0+MJ6v5q7/xutG/9AOMO71TcTxbCDOx5/lMsrpXx+cLTenxLKkIGyVf7wk9MRhHC4QvSpU0BTzTOJhdSixh4qnqgln+Xvs6B4f/ldRFV8smxIgk+DK0X7qRfYEeQnCMYI/nGzN2lQGO3fRR7NoK4eflD3Cbt+Gnj9owtTAp4mWj2uCLwVbLTcrY7KGFeHqioEH7H4B6K/WmUFE3zcw6QauU34oNo8isaehEaS/CaBqc0UNJYkTm5heVsMu92o1lKXevREaZDZ+wIkZXDYXNMDPAik6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gDE+R7Ch/mAEdmQ1FO6tocOoj14gW072NHZg/cEzn5o=;
 b=d/AulnLDUhV2VmFGvFgmC6wJ6bHVSFMSIDPV1fZ2vjwg2FttdQ+lOXXhXuEeUcY92p/6sfZyJZRc1P8mURy+U1o9OPBQ+qRYKvheMnRQ/nMTqipKmke1Q6nw1XWknWg8iObgaSoYDiB1Eg1u5kSQ1t1ZjWnAOuS7wJO3W4lx4KggtVggRNCyS3dnp/TDhLWzGyQfe+ULbLHm/tcI+pN6g38LVt2I30xTUApqx2B7jndJHD9NnrHt00YleUccH/qEM3d8SHCFmEeSXhnao9H8EMtrhUqIrh+GAJHhjU7wC1dVFFtO/2TMT31wcDT1BM0bOueK8r7z7ZPBbALQc6Tmwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gDE+R7Ch/mAEdmQ1FO6tocOoj14gW072NHZg/cEzn5o=;
 b=FHCU9J4F9Cq5hDR1PzImKBt9yb69pKekKNlyBLs3TdQ7v3LUcUi3fJwY5+XWs/LfpSi8UffwvZv1MDikY+vqQMQahw4T0wpr9r6Aj4EODZaggCZbj7/juN2flF5HSLbUJvzPGtT9V9Nksx6mtIjpvxxYpJFAGo7ZT6shhqpjM+4=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DBBPR04MB6025.eurprd04.prod.outlook.com (2603:10a6:10:cf::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Tue, 12 Jan
 2021 09:49:24 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5%10]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 09:49:24 +0000
From:   peng.fan@nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        paul@crapouillou.net, matthias.bgg@gmail.com, agross@kernel.org,
        patrice.chotard@st.com, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V6 01/10] dt-bindings: remoteproc: convert imx rproc bindings to json-schema
Date:   Tue, 12 Jan 2021 17:39:10 +0800
Message-Id: <1610444359-1857-2-git-send-email-peng.fan@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1610444359-1857-1-git-send-email-peng.fan@nxp.com>
References: <1610444359-1857-1-git-send-email-peng.fan@nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR06CA0212.apcprd06.prod.outlook.com
 (2603:1096:4:68::20) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR06CA0212.apcprd06.prod.outlook.com (2603:1096:4:68::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3742.6 via Frontend Transport; Tue, 12 Jan 2021 09:49:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f7a1a15d-fe85-4f51-3136-08d8b6df583e
X-MS-TrafficTypeDiagnostic: DBBPR04MB6025:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DBBPR04MB602569A2FD0C844A967524FE88AA0@DBBPR04MB6025.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ASn8b5Di+FE0rUhVf5Q2HfigRXJUdm2aNaWkKOi2iSrcl9ih4Ly/vCv+7LQgvsUmtLAGBdPsMXNO941BVG6wgDbhXPwAgJN1dm+fIc8CIYRBu9twE+S7fW9VN1j3JKHiT6Ydvbq/kZokFNDJGsMIw+TU1iA7Q2j6PhduOJy5e2+xGuJ2qkdyhVKZLMHq4yaYbwVIbCl399wLymD4d+IKrKH5/3b6lHICQbuuY0UkJXPEG3IKc6yQvBVxvBTm91ldhBQky1Gu/l0RvN5h54ITsV3gdSh6y/qrHLoEh2ZRNqbK8jSuEYYaRSk82dheMex6nsJ4xQmrGSFntT5mr7J5pRhGGYrwT8YYUslU1LNu1+w/0niIhUdK+NudwgyQ14cjw0OfyiW5vcKenCEGw6+FO1nLM5JRuryRnrFqwjhoQA1Fjge49kic1dmCJ9UMAFdDBXk3LFT0V0FzTcFNWEv7oIZmnfQiNdzQcXSu0h2ma4Rnc4DwPBljJAyRDdgMZ4lbkUPhS0UbBB5Px/yZr76pVw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4326008)(498600001)(6512007)(7416002)(6666004)(9686003)(69590400011)(66476007)(86362001)(6486002)(8676002)(83380400001)(8936002)(2906002)(66556008)(956004)(2616005)(66946007)(52116002)(5660300002)(6506007)(26005)(186003)(36756003)(16526019);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?n/piyPIC1/TGDKw3LJKoBmmTgbfggC/ABbR7Iyucyq/+bSlmefskVmH/6Jrt?=
 =?us-ascii?Q?AQOd88q83aF1KoPJR7KkCqTsN94YdRtz8Lt8jnN/i7LWwthLp+YnPhpAbu23?=
 =?us-ascii?Q?2s93XyWRWr77XptRj1agpE175u4vP6X36d+C+284aNGJ3M4MRg9OfH6UDvkc?=
 =?us-ascii?Q?MwudIyHY6mlSTf7mO5Yl3xCc5+/zTQNrRJgZsxAhwqbKHeVemuSXzHUiQUYZ?=
 =?us-ascii?Q?2yI1Zbov0qQFGJlU6uJGCYqR4/AlJB9vQJBs08R3favFVtMFeaEN49HvZMoT?=
 =?us-ascii?Q?p7ejvWjPDZJfn8YFDOZGZd3plGYhyREEmFJlVQFvpDjd3JKn0e0Pjy8mrmFJ?=
 =?us-ascii?Q?fZuC/Q+FJs2DJ9sseDyyi4iWfOhbhGNN+oeI/bQkrl4yQJ1qw2vngfwWA0AL?=
 =?us-ascii?Q?FA5klOGz2dNwbIkvVBL4+PJZ1gP7auGD+IeEN1nRM6YMDpyFHHsHzmbnNvPE?=
 =?us-ascii?Q?Crby2eUgs0oA71k8LNyIf/bsOnaUfFRMhbo/u5jK1E9LXSZFnMM5o6tPIvym?=
 =?us-ascii?Q?l3Up1rHpkOicYm7e9+KAp/OooKBcqcAyAH9Dpkn1p+ll3AGCpJCku8YbSR4a?=
 =?us-ascii?Q?/8N62HJikU1oPqP+Eue2O+UdZimxPFcJuBNiw1+OaPAfq4xRS6laBJ2d+3BR?=
 =?us-ascii?Q?CA0288SgV0DKYGc5KTJQBD20EilRzynLjtf6aAl+rl53+IZ7FODI0J6bWgla?=
 =?us-ascii?Q?5ZSKz4K65ADnji9fez+FZkeX9Q9dqePrp1/tLCvaCsEG97lm0HIgxc8E3zsu?=
 =?us-ascii?Q?0NURWi/WK8lchlQqO/r1A4fVrlqZvn4rdlw3Z1YzdjGqY7ocK/ZAjX2ahH5E?=
 =?us-ascii?Q?oC357Zz5lJjEEftlj1amC4qimfvuXNE/oIJXPDL/y5oDquqYTlLktuH5q//I?=
 =?us-ascii?Q?jXOdTdFursfWpGmVqtj1lqTK8EUUjFEA/wcN+9mjuloFz7gqmLD331/PjpvR?=
 =?us-ascii?Q?zoYAh8qYfsApnqQpviXHuHJe2B9hBtAlNqxZYNTmtQjHz7wT1s+O9OcKr3+q?=
 =?us-ascii?Q?By00?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2021 09:49:24.6498
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: f7a1a15d-fe85-4f51-3136-08d8b6df583e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s4D4t8l8TiG820EEfz7+JKYeJ4pssL8+BrekAL2nz0ffaJo3cZlo5nc7LD8vi0eFzjoBEBAMgTRzTg1GGLpNhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB6025
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

