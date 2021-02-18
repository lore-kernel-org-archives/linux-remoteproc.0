Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99C88C433E9
	for <linux-remoteproc@archiver.kernel.org>; Thu, 18 Feb 2021 01:38:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 68DAE64E45
	for <linux-remoteproc@archiver.kernel.org>; Thu, 18 Feb 2021 01:38:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229850AbhBRBiV (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 17 Feb 2021 20:38:21 -0500
Received: from mail-eopbgr80057.outbound.protection.outlook.com ([40.107.8.57]:29216
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230125AbhBRBiQ (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 17 Feb 2021 20:38:16 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NAaq8knHt2COzA7f1yzPSME6er42aYVXf31qXudX4la1qFEqoZQMH8qzDcIpPooLoLZeM16HoFcdTVNEqzn8RcXoQInTgTOBz8zM/+/a74G1qioXH+Oq0YEQev8qswJK7AhqYG1AUAPE72Lk/9SdIaz+2qGOfvQ1yxOi3a9mH+9KqYB/sZWofVEsomI5pVtmNlhmbB8oCUQFaLnTWtkHrWQ4+JvO/Pr8NhF0UyppabspAHBVOvHXHNuAe0vdy5PRkRPwiv+/GcSyqneMyUOi+pHoAsT9DuOSKM8DdjM4RpPVcFxGfkg9bVvTGe3KURtW+7ASGb6PClMvThlHQMbenQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yt+axGlyrTIDQD77uBCs/V1sEzbEHvwbaLemP3XgUOo=;
 b=ddELUmN3mZtrDnqdwYj79Xd8DGmzBDY8gxCnh7Hq2r8n8zqnPCVu3HoQuoy9L0YU0wxopKdvEqU0O+yZZcpUvJkMC8SrOgq8+3EZ4t+05+b9fPjO7pTyL6absnB7zfRtjuHGasAveEuxj14iTZ903qr80ZG1oVMvCt7esyObVaS2P6RFpsIngvT7V40bljNrgvyq7jV8fsY+3FHp1eUlEGyby7EJJKz94jVfw5YtABy46qe3Tmu8QRw9VsIudNLsxYWVuWmGFFitlmoIN3zxOYPa8pCbhzkofessJmLLkmUyXqIKJK+V3gIVxCuPeKGpKpB+7Av49QulQwzmEr4u6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yt+axGlyrTIDQD77uBCs/V1sEzbEHvwbaLemP3XgUOo=;
 b=EgPqD9iWX3FpNysdllMoKT7ABzHpQYYpxAOlOy897Taa2dLO0xWzZPRtHiLS0RLd7dmzYjT7D9t/Q8xD8lbPZOCd8aFe5Wb/xyMoUjwaWjHSNWcEU3D7qUyhWHG5AVUyMhfWjC+hrBHhdw7+ZFdl7NxCp9c5Jzt9Pewm586hgAc=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DBAPR04MB7285.eurprd04.prod.outlook.com (2603:10a6:10:1ac::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.28; Thu, 18 Feb
 2021 01:37:01 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0%9]) with mapi id 15.20.3846.043; Thu, 18 Feb 2021
 01:37:01 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        paul@crapouillou.net, matthias.bgg@gmail.com, agross@kernel.org,
        patrice.chotard@st.com, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V12 01/10] dt-bindings: remoteproc: convert imx rproc bindings to json-schema
Date:   Thu, 18 Feb 2021 09:24:51 +0800
Message-Id: <1613611500-12414-2-git-send-email-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1613611500-12414-1-git-send-email-peng.fan@oss.nxp.com>
References: <1613611500-12414-1-git-send-email-peng.fan@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR0401CA0005.apcprd04.prod.outlook.com
 (2603:1096:3:1::15) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR0401CA0005.apcprd04.prod.outlook.com (2603:1096:3:1::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3868.27 via Frontend Transport; Thu, 18 Feb 2021 01:36:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b60465d5-0ede-4b08-4665-08d8d3adafe0
X-MS-TrafficTypeDiagnostic: DBAPR04MB7285:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DBAPR04MB7285922399351BBCBA447E70C9859@DBAPR04MB7285.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DHY8xBvpbDwwal6ggx2DkUWacG8/lV0EGzX/YMSJpbGrHEdC6DoxCvA89jzZ59Etr6923LcJYT4CJCHrMLDlaTZ3YRCShvDb5q1BD6fimOeCHdmxXGDuA22b9WUefMJRUFhbQRBNqQyQpv/k8zwSF1gxKPDbweDD3Ho2r56eRoOW7emj/Xcy17mO4E7smMIyEUdqI3tmFSSCoSh2WNtq1mFzaHGsByNltxgUoOTOrygmoHcQUbkoISJuXb+JDWyQ8aTuEW/EVluCbK/MS/W88ybNqPCC5cIB7FOKIiwNY8ko8KnFxfNjKIivcwJ/bI1JgifwE/ogiGWhd8REIdNfjErWhP4cKKx1DB7NAUT1+SKukdeel1KKOXM7tAObVIZ6MdWhXdy1uSReZ4eQpQhU2w51Rh4fzKZRRnGWZFIq9iiI52w3xwZGo5jBO4BJtL3lwiQ1gFp8CzzBI4+YMBjrmbfX8TUPtH3TVktTh+cwNDwyC+vuwSLe9HoFEm4s9D2idu8HZMvJbOqy7OtdN/SOz9YhbpHUREYGEzw8q5tV/JwgaNinVp4x4obILOe0B6Rv6TUtB3wN4HTplkn9I+GDHpwNLphc6AaDAseDEjxhJrRwqBTGzu4/aZ30my79utWAdvdVpcukcDLNAPLWt5W1NQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(366004)(396003)(39860400002)(346002)(6512007)(9686003)(16526019)(186003)(26005)(5660300002)(83380400001)(6506007)(69590400012)(66946007)(66556008)(2906002)(52116002)(7416002)(316002)(66476007)(8676002)(2616005)(956004)(6486002)(6666004)(86362001)(478600001)(4326008)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Gxn2BSwOgheO5pfagehdbiRIBjYUQ6Lt/JloJjG2U4ZDjjv4FakuXST4aVg4?=
 =?us-ascii?Q?c43az8ChoE06/3d+E7jkbZhPGwuQI1M7Ko/eilr21Qv/XtFd5NKzie1b6tIQ?=
 =?us-ascii?Q?7jpa20S4bFrTMK27RxiV9pqpfMPywjpRpzJzVqbOqj+57EwL6qA0nwN4No7m?=
 =?us-ascii?Q?58P4uWucWJxx0iayved96MHo6Y0ekdnlwkBJDj5n2h4IFPg6blCXLn8frkk8?=
 =?us-ascii?Q?ZJPXPCGp58LDKGT4PpaW5uZqr66v1+O8DWtonYacsGPULHOoAHExgj93LEmu?=
 =?us-ascii?Q?wEu7c0uyJFeRBBD1EsbopIxfsLhTzMqs1a+jVzszKy5bpGzMLpRlYGAXKYv4?=
 =?us-ascii?Q?JsRTmF3sTfBsiICDZmx04+/QPC6WXTh3NsUr5sSwH+bKbJb6oO8halBPlcuF?=
 =?us-ascii?Q?hOqrupJ5FmCR7wcA+7Ooak4vzsWA+mmrwGG9b8ZmL12mWnhAltnFP9llDrFy?=
 =?us-ascii?Q?j+FJ036l88lm/spAkjjDJ9/VBjn63I1tweX5NW5y7e3Y+zxqkDHaXUBZ3mFn?=
 =?us-ascii?Q?bLUlYsAzXFqh27DFz/e9lFJELX73X4qgklmNs6VjPHbqs2kFbFgwPXiJDYgO?=
 =?us-ascii?Q?m2OG1oHGD1Y5FKt+MlFQ+Z7rKbwiMGeD+yxpNUJNro4X7lfh9QQnuo0eWHAi?=
 =?us-ascii?Q?owAWDU8hmXBqOuxpzlxw9n5ATPmvPFr0C4B9/uXpXkiqQ9s2wvdKjdeRFkVD?=
 =?us-ascii?Q?V6iiI8OMvOdBo538vlYG5w3YnZGMFRdiAKsi3O5zWVhDDztkw0WO9VNdNT4p?=
 =?us-ascii?Q?AdJMUYcutJQjfK5uOnYO0ffKMeH4pFZOjYNBq3akyf0I5PIC81ezBHYCGfty?=
 =?us-ascii?Q?WkhXP1DXiGe7AshpkfPLZcEaE316L1tI8AyROcA/tPDXrlkBAnZCsdVE8134?=
 =?us-ascii?Q?gDPlY2KxGRqjF9R2NB8Z4U2Y1H15qL2+HQ/bCRTEDYPpx0tA4YmgaKMOnmbe?=
 =?us-ascii?Q?owoSyMf50M9ZBeoGGJgklOWxrbIZknT2qZJYHFvXLdNo0wUOhFhVEXvTLepK?=
 =?us-ascii?Q?iSZi1fVz/AvtfamMcxFD86cmrPsNC2Q29qAK1erv43VP5bt5XmOjRAUrxaEo?=
 =?us-ascii?Q?BiqLm/bLXkvWDuybsx1vL5jY8hPpWPQ8BOXtftPLe/vD98ZZb47r1AZhuO2R?=
 =?us-ascii?Q?GalcAyifg5YH0nYMrnvvxqDjO+9Ev3Xn+skbsIwiI8sKVW77qPQ4zVettIBQ?=
 =?us-ascii?Q?XnPvaNvHCIpMHQCAzEqvFwzwxnJim/Zk14ynPOxwNmObLaqODEqLqzEY2Tjj?=
 =?us-ascii?Q?KTiV4zyeUwPHxQDvNTgchqu1cBMg6QR9U7kJtdmhkxmXMq4bT3Kn/v+DIdc6?=
 =?us-ascii?Q?hFzKvkb+9UnsDi/NT89Z5x4A?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b60465d5-0ede-4b08-4665-08d8d3adafe0
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2021 01:37:00.9217
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NWL7ZZOF294wx7R27IdprNnkBmkfy6zBMbsXurGHX5vrc2rodxFFW+KqatcResd/543o5XgH9Kux+xn0JNzrlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7285
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

Convert the imx rproc binding to DT schema format using json-schema.

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

