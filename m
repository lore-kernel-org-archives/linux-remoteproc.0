Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32B30C433DB
	for <linux-remoteproc@archiver.kernel.org>; Mon, 15 Feb 2021 12:48:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E4A8964DDA
	for <linux-remoteproc@archiver.kernel.org>; Mon, 15 Feb 2021 12:48:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230408AbhBOMsN (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 15 Feb 2021 07:48:13 -0500
Received: from mail-db8eur05on2085.outbound.protection.outlook.com ([40.107.20.85]:29376
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230434AbhBOMrv (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 15 Feb 2021 07:47:51 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pn0Y85StUY2cEcJ/p2Dn7HqPY4DvnoFhk9c+CFFSe6Hi+pDIVKj5CXylf7K/EO/8/gJwZY1trAtUIU8EMFeom4EgwZ6uFfGKaWnhM9RycLuzpsrQCmy+X8SjfwQmuwkYvChVQtczvrMiFCdGe+WpKfzr3KJcwebOUa4zpnQSAksjNGdp3d49iphfJb6RTjr7f4v9ZmvRISqoG7rrJ7n9VVvoS+ZhLZDb+5PZD51ckVy1Fe/elRDyJ+RMSSx/01BRuMkaVLj0M8UeNoPPjt+H2xZztOTaDt937cq9gTDuadegzeY1ljBt4hEgtd3b3M4LLblhL49bzcWQCzpFEZ8rwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+pZPVCe4IDZJzwE7wf2Sm3GKMMFW+4GxDTbzpdypFKY=;
 b=abirYql/mVQ8squVL1LgRLZzTGWe2p2gRJMnc0j6tUnL797zwJrLIG2bFtbMVtkj9Ksh6Bs3GNs58zpkmXumtl1993yR0VCOaTjpD8yGgvhvFJFZRvTcaHHy6V8errkB/SJXtOaGDnwlOt4NmxSx6hawfHWAouLV30SONsIryejvB+zXOYFtdwsfIgPRO67CHwaXTodKfLpS6gd4whZ0vmjJrl6ToxF4fPPf/7K/Pod57V5McM6jkoHdRpzgR0nAiH85X4sT9Orsm4h3ePq9APJSwZdhcx+ZjkDgsomeU0gNhMjr8CLDiC3TR3Pxtb5Wcr1LhnYcSx6NpzIQD1HBGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+pZPVCe4IDZJzwE7wf2Sm3GKMMFW+4GxDTbzpdypFKY=;
 b=g8hfRMGaU1W2upMF4lMNtgp8c26RaDRiaKAmaNZOfOu0vvxnAWnJxg8WvHpA21U6HZKzk0ZnvQIW49u2Pwa6HK/mnHDLpryl8GoZK5irwzi/+QIIvpqMW2SfF0cXCtzCWcCN94k17UV+KEJdzmvvomWOBL+YWEYwvjuKrT1Ih1w=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB5081.eurprd04.prod.outlook.com (2603:10a6:10:23::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.36; Mon, 15 Feb
 2021 12:46:26 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0%9]) with mapi id 15.20.3846.027; Mon, 15 Feb 2021
 12:46:26 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        paul@crapouillou.net, matthias.bgg@gmail.com, agross@kernel.org,
        patrice.chotard@st.com, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V10 01/10] dt-bindings: remoteproc: convert imx rproc bindings to json-schema
Date:   Mon, 15 Feb 2021 20:34:14 +0800
Message-Id: <1613392463-9676-2-git-send-email-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1613392463-9676-1-git-send-email-peng.fan@oss.nxp.com>
References: <1613392463-9676-1-git-send-email-peng.fan@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR0302CA0019.apcprd03.prod.outlook.com
 (2603:1096:3:2::29) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR0302CA0019.apcprd03.prod.outlook.com (2603:1096:3:2::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3868.12 via Frontend Transport; Mon, 15 Feb 2021 12:46:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 653d73d0-1105-4c43-212e-08d8d1afb54a
X-MS-TrafficTypeDiagnostic: DB7PR04MB5081:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB50817BCA740C3172D64234EDC9889@DB7PR04MB5081.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nAryb12D1gmMuZDN6kGj8VivNFqntu5akB8jz9+LVmMgIFr7gE5w338uhhOfi964Xad11AC5AAajMqTTMqQbUPjZQm9B6/WtO7pbhRZBOoPj+4yAwcLC6ZITLz16DHlxL2/KrKHJluFbUswj0DNRxC1M4tlhBK1Sy0k9fEdQxojSM+71odmCuNmkEm6ApLG9T4x7admHbjsozEH8nZRV+Hi83AwxTOSGccf3C2opaargOoVJil/mwo2z7YThUS+GIqeBKuMKASmJme1Tljxljon6Ib2ZPs3eyMjS0QiH8OYdvV4Mt/HMp9cLVB5q6+nV4ek7SNB2rTe+g3jJ61J5dbhuPbbIe8V3hjg6LLK//YA+gudvs4+W+++FPJK+SvXsNip7ibhA9QoFeFq2n5lGZUopFjiY+VwffZrjWzrq2jbxpnLME1gqhNWGrVZBuSYHAwWc6K18NlnF0e9aQ5XeT/fMm+C4DRzF7kge32Llg9iZRkddrTo+DLkOiqCaUdt8HcbF2U6e/WixlVzteTVUJIzi5mmXzVpPI3fx3MLByo9TcY057zJXXBtap69N1nFMWD92DZrBiJMUOeGdWUbNpzZ8h8mislsow1d6217CCqg4VYdApGue0DBxR5AEKzVz9Rd4SQDzzry/QLK9vzTIJw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(136003)(346002)(39860400002)(396003)(4326008)(86362001)(16526019)(186003)(66556008)(6486002)(69590400012)(66946007)(2906002)(66476007)(7416002)(6666004)(956004)(2616005)(26005)(83380400001)(8936002)(8676002)(9686003)(6512007)(52116002)(5660300002)(316002)(6506007)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?i3wDG7yzqcCmopNk8Dz3v46uNy/nPqX/M82LOp7Pv2q4LiX9VbNcxVmWgwpd?=
 =?us-ascii?Q?guUWgZLLoYEILCjbCcyE/N1smQGrLrarg+O93GEv8klFICncHYXeuwkLJ55u?=
 =?us-ascii?Q?rSvUA/wdoMnRRwXY1U37iK74P0u0aRiPFdvFJ2ibkpZ93bDrUwNVB/rohg+u?=
 =?us-ascii?Q?nXlVw1znJ04GsX5CNA01LxxAWWRl3bAGpeoiZ1zBvfOzBqC2vz1RDb1ikjgi?=
 =?us-ascii?Q?J1+osuky3kSRutymXhzCx8XxmxBsyOfCfIgL+Bhf3hSd96WSqqVmuL9xOg5p?=
 =?us-ascii?Q?58w5AuSt1f2tT50nF8EpmLLNnp0HlpPB6zG3wUvQt5TLxDtc3HQIdm++i1ci?=
 =?us-ascii?Q?piDm1BkwTvFwPGX4ByUe/EYXIt1kBmiJhTS796+1AtceBnELsLU85qukDIQi?=
 =?us-ascii?Q?2mL+/WnwRXFtSWqh9eRcB+Nkjl9FgPQcFGyLK9oJ53koawnQ/P41SD5CMCk1?=
 =?us-ascii?Q?k2+m1KwzpFFErWQZrzipB0fpHUtH4b4OLlWS0pIpCiLLWIJac+WPbHN6BBYf?=
 =?us-ascii?Q?6NO6NBJCNcJvgr6pGepr8KN6pBCJ270tuXKocbKzJ5arJqZJN8Tjnfzv/gpe?=
 =?us-ascii?Q?YuUT85x1LoH+1z11GExBR4ITYGOxU8HRqioT/zgU6AOqwBLiLpw05jrj1e+m?=
 =?us-ascii?Q?Mes6A72NAiM7SLCqUDtpyMWcuVT5z6VjgPgbztZ1F8PBdTnkDSQHd8zffLFy?=
 =?us-ascii?Q?lKnDIEYv46RPuSS170BBLJgm7Lf2cwF/HdGVdN63T4+VZgBFoqXxkUdt68MM?=
 =?us-ascii?Q?re/oGjGsvofE1Qep3yIZXpBBiRmF3Yas/b/450JMCM1MZG03SsSVYftYe1lZ?=
 =?us-ascii?Q?8vC40wBq8MnNIt3hW+vFI5h2MaoF57hLSsVQq1i61gRJaG2WdC1qlW8UEE+H?=
 =?us-ascii?Q?ps8ZMDorMkg26hbXlAFDkWZ+k3dURdubomVMuMQU7wcph+jC4LpG38kEj1dS?=
 =?us-ascii?Q?TS/6i+4hnD6g2NREVfHwK5wnfldmfiLxoQ/roSdTQ9ryp/SOkQjQufdmgV2S?=
 =?us-ascii?Q?Jm1ksB8bFdXhobkz8sT3/cWeVVJ3k1CmbpvE3PiMIciGnyvaZv7r761S1xKw?=
 =?us-ascii?Q?NoqG8Pj3fvhyGXQE63+wMUlJc/44c3wmZ650IqIXafVo7p46jXvi7+I+hsmS?=
 =?us-ascii?Q?RWTXuwvRWhVevECMRQY0iZf1q0g6yA+F+5JRAZ4VMFhU64pClPjyodDwUAzq?=
 =?us-ascii?Q?o6kyZ8EF8/x0GyNjW1nNEXEIDqLW03uxJFXrDMr0UeynC86ggchhyu+Bs68V?=
 =?us-ascii?Q?AuMm4+4pr2s6CmMxHUXE1l59erLa9O7SM/Ex7ai/EmQpje6NE6VyVDSufLhq?=
 =?us-ascii?Q?vwy5k0jxcywVs6Boe0qB5fKw?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 653d73d0-1105-4c43-212e-08d8d1afb54a
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2021 12:46:26.6500
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zj5QIutFIWh0fyAKF86k0/QwiH0ugkrHatT+tmA7zrDcoEzie4kNxNTxihQE39XwegnMjvdEtg9eF6z8/wgExQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5081
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

Convert the imx rproc binding to DT schema format using json-schema.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 .../bindings/remoteproc/fsl,imx-rproc.yaml    | 60 +++++++++++++++++++
 .../bindings/remoteproc/imx-rproc.txt         | 33 ----------
 2 files changed, 60 insertions(+), 33 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
 delete mode 100644 Documentation/devicetree/bindings/remoteproc/imx-rproc.txt

diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
new file mode 100644
index 000000000000..8427d0f6e471
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
@@ -0,0 +1,60 @@
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

