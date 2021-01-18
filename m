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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38ADBC43381
	for <linux-remoteproc@archiver.kernel.org>; Mon, 18 Jan 2021 12:32:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DC27C2231F
	for <linux-remoteproc@archiver.kernel.org>; Mon, 18 Jan 2021 12:32:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391554AbhARMcH (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 18 Jan 2021 07:32:07 -0500
Received: from mail-vi1eur05on2049.outbound.protection.outlook.com ([40.107.21.49]:57665
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2391442AbhARMbY (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 18 Jan 2021 07:31:24 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F86rSQxuIquM3Zw7895XyJHRO7Jbxx7Ze/SyOdwGC4dju2DSPY3bJUzWXdbhSGTqtK10wIJwcNpVoNrAeA41MdknFylTq9yhUcTxASLtxBbqUdMi5jKyPgoF/0k2GMhbG4J3pCCIifWiuJjTPIFOh8xi7dgcTgra5I8SQYAMseQzs7WrlxWaEyqhTbZE5YkEqFcJZqnCAkXf+eKpVN4XU4ve8Knk+yShlF6fVE4SDu7xU0q3VYnzJLjYBTbemLEUH0nTqHRzpue2OZkT+bKOv0k6cYP7h12K3ja1jFCF4QH9sEM+AdiOKq/XAZA2anF8Wgy1ImD5+l2oBHGb4K7uRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gDE+R7Ch/mAEdmQ1FO6tocOoj14gW072NHZg/cEzn5o=;
 b=D5AJGAcXV4MHr/a4NWjQgLlHkD4TfOw/gJDbdPzVpHFXprJ5fzOIxYtdWardtjm1BPYOtdD2uXEaFWR1KHYdmbDlMCQptKUOllC+MKwwHAhiZItisLnSKLs6f7I4lVK3ykkSElUFxHXpNNHLK7sUOq45iB4AUTe1jDnSuhbplD+SwcgRSRRD9dLjfkKCxzJc1JNEyoBIrEK2by6Ke3y3tTRr0F+HnSo8CDHdJhA+2UDndfuru3DoNh7hQMgcpP11ELqCerSZ57og5Sgqz65933BVf8MnjcPzSfOuD5246VIlx9DO8pS1hhHZXY9Va21+0kZz8hTXI1sjm3wf0Z9CRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gDE+R7Ch/mAEdmQ1FO6tocOoj14gW072NHZg/cEzn5o=;
 b=rAA4dOERxGMj7m7VXMYVhvk2won8FBK23249/hFUifqowBvFoCHuNFYgt0JPWEIPLXodjGiIZ9QxageNwNxoqtm/sSVee/9DnHZATRSPeMKtYNICbMGF6Wmgo44OlFBooU6WzaCdP2UMZeH795Wylj4DE01/oQ4TeKVYEEXjQX4=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB5243.eurprd04.prod.outlook.com (2603:10a6:10:17::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Mon, 18 Jan
 2021 12:30:33 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5%10]) with mapi id 15.20.3763.014; Mon, 18 Jan 2021
 12:30:33 +0000
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
Subject: [PATCH V7 01/10] dt-bindings: remoteproc: convert imx rproc bindings to json-schema
Date:   Mon, 18 Jan 2021 20:19:50 +0800
Message-Id: <1610972399-28286-2-git-send-email-peng.fan@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1610972399-28286-1-git-send-email-peng.fan@nxp.com>
References: <1610972399-28286-1-git-send-email-peng.fan@nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR03CA0113.apcprd03.prod.outlook.com
 (2603:1096:4:91::17) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR03CA0113.apcprd03.prod.outlook.com (2603:1096:4:91::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3784.6 via Frontend Transport; Mon, 18 Jan 2021 12:30:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: dd6ac1cf-9344-4b44-1f7c-08d8bbacd964
X-MS-TrafficTypeDiagnostic: DB7PR04MB5243:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB52437459B7D590F70941284188A40@DB7PR04MB5243.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q5R2/ueOfny1UhGx/4h8f63NV0LbtEU3zzoTXhX6YtZibhyaN9E6AVmzfPPE4Lgr6shZuh87LxakxIgK+A8LUd3IBcNDO7TSEcz/RHFUifGqWssMoVxUoXvfYmXSymbvPWjX9xp3QHjgUowRQ3uHc79IDFcccrB6SrNNpzZy65sY5yFKROlN8rNdcHTojoc+2lp3N6gQdpaptnEI0CsynlMadHBCTuZsgJJmbosk5E5oRC7+nnYD4RnBrAudMglUiaTXcZXjl67zaZmzIiga4EcODY4R/fZvOUX32DmboWrNJeTH/6fynJZwhcbQqJvmK5I0IL3PcNL7xM3ugIriCs8j9eAwlTufN5VU6dyzhTjDsZZ0qclyordkhX+Ko7sLcmPIo8xdXZ4YhLmv4TXyA2rPY/rQQG/IvCegH0oYWQvCHLEGVbtzMDeurYbjvTciPW/VU3ZoDjR1L8qTc1dpGnh4c4bslqEuZqB96Cfz29rNYaHqkRAueK3BSRz1bcYyrDFT22VZ7bWLZUXPEb2oOw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(346002)(396003)(39860400002)(376002)(478600001)(6506007)(316002)(6512007)(9686003)(36756003)(6486002)(66946007)(66476007)(2906002)(2616005)(956004)(26005)(83380400001)(7416002)(186003)(52116002)(16526019)(86362001)(5660300002)(8936002)(4326008)(8676002)(69590400011)(66556008)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?jg2yNM48xNQk6XrOukv0HfUtEVMqHSoR8D+dzkvI2jLAqEWa7mj2u/xHA2JK?=
 =?us-ascii?Q?QG1+4NAIahhxNGUiNYqp5H/XEaUO1BYtkXDtWLp5p+5rrJve1sOrnNjcM5yD?=
 =?us-ascii?Q?T0Rau4rwnsnh3wKOI2RMbPhOn7i8TvcoZ13LRsNNyBW0Ra9EusQa9K1/39Ln?=
 =?us-ascii?Q?YBhSzjh1xSLffEwvEVJcowW3T32KjZEANvfd1QehKJX9M5tGdAQhjgO9OZH7?=
 =?us-ascii?Q?6n/ne3Xy+TTqfvJVdOVBhwtESdnYS/UDrUmS6wbwcLJcbH9LZlee7cTNWV7e?=
 =?us-ascii?Q?rihanJttljxW/P5WsF3to2dXRIE8kL8PNa5YEey+nXN6oOy2yytwC5V2jm/T?=
 =?us-ascii?Q?4uUKD2/rjEJ5uLbimZz2vBtLXlD2e9+WlmhzfFUFYtZZGBnNlXHqnWDNRBMD?=
 =?us-ascii?Q?vXx+Lj9eSZad1XTd4wRJrYnT5nUPGKWwDJQsmdIYUN7yq1NZ6+QzJ9AaUUST?=
 =?us-ascii?Q?vsyQMJ7Rwvso5hziS0YhK5TDLNHR+GVDfarXPOebVHq423YJC/qUFmJ+VTIf?=
 =?us-ascii?Q?32pIdZUPHT5l48RZ66QUkYmYAeHpm2qV4KtoSt5jIaqlMu7ZQugnkqPQgwcn?=
 =?us-ascii?Q?hLKK+zISY0M/iODryLWSXTgmIokjXVojimyhxlOBh2p9DAK+3XmLzkKtzf4Y?=
 =?us-ascii?Q?DFpaqW0+q+kdKV7ISt2Sn2CmfRXBZyIbPqfQccQO+9Nbz+DeTNLIUMG405f3?=
 =?us-ascii?Q?bunJsrm8mGqXWSdEghK00iHRVbycf8Iz1Qx7GtCTg96lypQy+4eEG5txDn08?=
 =?us-ascii?Q?nZzBGXh/CdoV3foHaTzTpd3zDSKYma2hw6VOubIevrPAOm2QYxOdCZWKniHd?=
 =?us-ascii?Q?dXZyBkPihZgeotYtl11TKmYqoQVPxZ5rWormXUwuAbbTPRpBIAq9RZT+CEF+?=
 =?us-ascii?Q?jt3CA2NLuKH1Qk2HeLKq3q6kzDKh1brjaqOWxIyuJ42swoMWr1x6/5uuvpiQ?=
 =?us-ascii?Q?pU8vxjD7ayvNhkqEZqj5co2VCr4IJ9dVhhcljHR4DA9p/grFfw/+L0iaTvAW?=
 =?us-ascii?Q?qvER?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd6ac1cf-9344-4b44-1f7c-08d8bbacd964
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2021 12:30:33.2809
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JD5Hx674NgxoJR+DQN91VdUORBAQsd+3Rj/9fkBKzTUulw+0QESSFGiyJ5QQG3Eb3/+yD5KEVQi7p6gIq/PMjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5243
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

