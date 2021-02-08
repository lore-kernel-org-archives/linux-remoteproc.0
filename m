Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13E14C433E9
	for <linux-remoteproc@archiver.kernel.org>; Mon,  8 Feb 2021 09:12:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BFF3864E5A
	for <linux-remoteproc@archiver.kernel.org>; Mon,  8 Feb 2021 09:12:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231421AbhBHJLd (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 8 Feb 2021 04:11:33 -0500
Received: from mail-am6eur05on2040.outbound.protection.outlook.com ([40.107.22.40]:52193
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230427AbhBHJJm (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 8 Feb 2021 04:09:42 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LyZY/qaTyrQYe4pBLqgm3Gko3CuvOcC6bLMWzwcBaPCvPFh+d1fBvv5+VzReFbUkKEmV12XJtcTnkPhJhrnDn80ZJiscakTxn+se7+4Ca12ZPrhqe3oNAN9qD5oEh9b0cuh7I+bnMfcy9i1SbEl/XQqI5E3nHMi7A+GlnxycAA/KfHvVdmEESJ4ToOfciKR7/qazYbI+PCOyGBpNT99inCsg5JIPqbPwEnNUHJTuVq46vZfZpDYNCmUxEil7crH+d9N//sUMRekcjmf9ekqNjpCpYrCbWueHe8cM4Lfuh1s074gppT3wXTbtS2WoEF89Gsmo8VDZSyWz7tdX02b3DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WK2KUyUvCzMDfschWTGWSopTnL1yz7l37jkBoLMpbYs=;
 b=Pogwb3OfcTk9ke3ic1O7NElVaQkikTP+ZSQkvAsquW3c7ZfvXynihmHsde28a73Ali47KoMU5pEhrR29lwjeJ1KlpHGFTT9hs846wuRrjZcg0I0ui6ZfgqvLlUfpcbXmRqireurkkjuwEWxcfqvKH2p9UxbWPVIMZYj79zw82R9doZn9SPGDd629e24mQTp6h5x9QD/XDyRFFtkKsKSayi0E9xt2m0wjXkg6VtSkXJ4DqcOL9nBIX+izHVwev2B7Bxb8yE1hxvOzh1eeuzc9gUZ+VZTfxsPE/aqGzshuiA1Q018nQJzfdXtNc3EjlyVK+EgpKIUFx0JfMml+xH1Y+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WK2KUyUvCzMDfschWTGWSopTnL1yz7l37jkBoLMpbYs=;
 b=a5a9fG2QsZi0bhYTrCUuNTZc7oHTGOsp5Ir8/UdjJLFpNoMuN6SWdV1Nb+rWQwtzK/ZTQ2MI20UzPlyWreuULm7O8vmp6zwGtXp1pPMY+XJhmcZisreVnap9aUsiMQVtNlh4NMCnfwQHVFI3amuyAUwe6nANg0fOZupnBFSvIRU=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB6PR0402MB2933.eurprd04.prod.outlook.com (2603:10a6:4:9c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20; Mon, 8 Feb
 2021 09:07:49 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0%9]) with mapi id 15.20.3825.030; Mon, 8 Feb 2021
 09:07:49 +0000
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
Subject: [PATCH V10 02/10] dt-bindings: remoteproc: imx_rproc: add i.MX8MQ/M support
Date:   Mon,  8 Feb 2021 16:56:03 +0800
Message-Id: <1612774571-6134-3-git-send-email-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1612774571-6134-1-git-send-email-peng.fan@oss.nxp.com>
References: <1612774571-6134-1-git-send-email-peng.fan@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR01CA0102.apcprd01.prod.exchangelabs.com
 (2603:1096:3:15::28) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR01CA0102.apcprd01.prod.exchangelabs.com (2603:1096:3:15::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3825.19 via Frontend Transport; Mon, 8 Feb 2021 09:07:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 29e6b211-77ff-4d03-eaae-08d8cc1101d6
X-MS-TrafficTypeDiagnostic: DB6PR0402MB2933:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB6PR0402MB29332314995128C9AA62615CC98F9@DB6PR0402MB2933.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lYYfy4xRwar3tJWSrLYKMKCjZpHrawYp/EdrPcJWAotTUfi1guIfmTBPAhKKw8OcUbqiKY9DBC/QwR7lfWmQf4QPQe87WVAfBH7DZHO5ATASpx4JFXplkDKrB4zPexwVy7Gy3obmjUXLlGEO/gNjLvOX8C+vVEI8EfVpHblCQ+NP73CZBk2GHUscPWm0bwRipJ7xxaqMOKAPVYYlZqkSDDJUzWSNk4SFpeosADpBI9jfPT/rI6n666sAEEswI2FnyoWU8tsab4+Fo+eG3tVHdHZT0T71l+x38SgY+jZCOf8PIEW8f8FZEui8MCDi8M4d4ZVQo3FgPpyeVC3R9FpjVzEQdHm92CEcmZrVsQwKuSR41kAyTvp/rO84tR6Q6jfP+sVzSgDpEJyBuNc3rhzrdMl1Y9geMXe3cMm8FQWMFyLbbtK5JnJWncsMn+dtD5usYXUqby5LTSOCREUfEoAG5dFkRm0USXzZsU5A2rFTB78XeDh76670BFB29yEjQfpVLRwxBxTn07YgguizGkPu2opxPwrJUXNEU+4rUOUFIA17yOsYYXer4XhYjXfW3QMzcQMdjozj4Dbbww/fTJO/Fio5Xs6SoIq682i7xOId25itL5mYyFOJHYZ1p5Z8AAaYv7bkRKFfK9+HnsZeS9x+yqVD5EoxTH4kzWjgsJkAre8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(376002)(346002)(39860400002)(136003)(7416002)(52116002)(6666004)(316002)(83380400001)(4326008)(8936002)(186003)(69590400011)(86362001)(66946007)(6486002)(8676002)(6512007)(478600001)(6506007)(26005)(956004)(2616005)(5660300002)(16526019)(66476007)(66556008)(2906002)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?+y2vgPiTSVd7MQZg17yNgw3vPsKAJmmjEzpvPMae514n89I9Fp9PRJhqNhgk?=
 =?us-ascii?Q?XJfkmEUsKtyPXw8GDRzle3UjcYSOtzQPiddzDTZg2P7SezEGmAbNPHYrCmtf?=
 =?us-ascii?Q?8m1y7k3Uv0DDz+DnHe14djVBroXFYmZ1p76lIb7nOtxczArRWV7HETxTkQFG?=
 =?us-ascii?Q?qAQjIF5fdUD3wX8JRUYxevCxWnIbGP8R3u6I5Rm929hgPDvFYu4X4Kfi9/xB?=
 =?us-ascii?Q?nFelNRA7Fyw5R99C4Z+oTen1AoA/bQHAYMkc1+hiYY5bu3inHxEgnSPksUAQ?=
 =?us-ascii?Q?wqK+y+u2upOWATnPiaQvYc1s0NfTTbP1+2ibLwsZg333QFbqmlJ9x/bS1VJP?=
 =?us-ascii?Q?kNeupoMgokogXNgnN8de1drEBw8E32QaOL8SAswzjw83jE9tl/FyqQ8M6ICf?=
 =?us-ascii?Q?lJhQ8nZ+VzTSnoRBxfyjX4smRNAyTAj47fSq1BpHLzdEhZrIWEEgiT4BMbWC?=
 =?us-ascii?Q?qG84Ugw5RCScHU5K4350y3Jfa+Mk0ERhTd1Oo1TDZ6M/YcKl4yv8I29wxvmC?=
 =?us-ascii?Q?Ul7jmPcg9kRJtZefeyqFPMoDyP0Qv+G4Md04w9YkNH2564S5k4S2h3Tkdavb?=
 =?us-ascii?Q?E1kpHW39nCJYjtlGUgH9kX8yBmJaVQKtQXTftF/WRzjMIqjE2kuhKi3zzBIs?=
 =?us-ascii?Q?Jyl6jkINkeESjZcDNCM4eAKgx66m08/99NhG9A9g3NG9aIHFV5Wp/ye7Fm8R?=
 =?us-ascii?Q?2NR6+gpOM2krO1KF4g4Q9cHNVgLFrkayuFGvmP36denU0O4J/JSVdW72UF3u?=
 =?us-ascii?Q?CoLyVle5deIMiCZKp388F8uaO9HuEUlESyrndoXe9IBNSaUkmXYrrhqMvBLz?=
 =?us-ascii?Q?cUCJshOHsTqFDah8E/uI5PK6mTDiw3x0XnOUAzt3yY+I+jnmN4wEx2o9Eep8?=
 =?us-ascii?Q?qz3I8GLug/1RWGog0d/DKREb56PMzeDxQrLC+13z0pSKxQkJOdai5rh8A3Aj?=
 =?us-ascii?Q?XM/TT89sKa1BIUDt08L1uTeZV09U4V4LylWza0uYG4QARe+XdieExkeBEB8/?=
 =?us-ascii?Q?IOKi7FBJbkv4t86tfBxvqVcykp3uvannQlp3vsTOrxQxl4k6w5IEmymcEaxL?=
 =?us-ascii?Q?RPrCMSkb1Ffy4b1n63YFZ2moG++zPbLiSS2k7fB6VEN2uFQeSZDs4dzVL62c?=
 =?us-ascii?Q?mrF4Azo5pjXUncztp7GXHzfdbDbmEN5XCmZbx5FmlAOQdD/eFyekYbzuw1E2?=
 =?us-ascii?Q?pgYGVoTABvNK6kI8qvIH9QmA9IL0XXe2J+9ezZBgaXO3bJTCudwRTeTq0bF9?=
 =?us-ascii?Q?M1TI6qhD4edOk+LDNT90K+1/CSEdwsVv1TikjRdytO755iN9btjtlrEyEf4j?=
 =?us-ascii?Q?M7qL3Wu0JlpZfokZAiORftvC?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29e6b211-77ff-4d03-eaae-08d8cc1101d6
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2021 09:07:49.2676
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PFW0M+DpZwM9+ZVkBfhCwJoTpsEHb8EKLKLuz4NNeRloxBVYHsNzJbWhMD2Jsmp9ARCAunSK+JPAWgkL6fAJDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0402MB2933
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

Add i.MX8MQ/M support, also include mailbox for rpmsg/virtio usage.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 .../bindings/remoteproc/fsl,imx-rproc.yaml    | 51 ++++++++++++++++++-
 1 file changed, 50 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
index 5e906fa6a39d..d692077c65cf 100644
--- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
@@ -4,7 +4,7 @@
 $id: "http://devicetree.org/schemas/remoteproc/fsl,imx-rproc.yaml#"
 $schema: "http://devicetree.org/meta-schemas/core.yaml#"
 
-title: NXP iMX6SX/iMX7D Co-Processor Bindings
+title: NXP i.MX Co-Processor Bindings
 
 description:
   This binding provides support for ARM Cortex M4 Co-processor found on some NXP iMX SoCs.
@@ -15,6 +15,8 @@ maintainers:
 properties:
   compatible:
     enum:
+      - fsl,imx8mq-cm4
+      - fsl,imx8mm-cm4
       - fsl,imx7d-cm4
       - fsl,imx6sx-cm4
 
@@ -26,6 +28,20 @@ properties:
     description:
       Phandle to syscon block which provide access to System Reset Controller
 
+  mbox-names:
+    items:
+      - const: tx
+      - const: rx
+      - const: rxdb
+
+  mboxes:
+    description:
+      This property is required only if the rpmsg/virtio functionality is used.
+      List of <&phandle type channel> - 1 channel for TX, 1 channel for RX, 1 channel for RXDB.
+      (see mailbox/fsl,mu.yaml)
+    minItems: 1
+    maxItems: 3
+
   memory-region:
     description:
       If present, a phandle for a reserved memory area that used for vdev buffer,
@@ -56,4 +72,37 @@ examples:
       clocks		= <&clks IMX7D_ARM_M4_ROOT_CLK>;
     };
 
+  - |
+    #include <dt-bindings/clock/imx8mm-clock.h>
+    rsc_table: rsc_table@550ff000 {
+      no-map;
+      reg = <0x550ff000 0x1000>;
+    };
+
+    vdev0vring0: vdev0vring0@55000000 {
+      no-map;
+      reg = <0x55000000 0x8000>;
+    };
+
+    vdev0vring1: vdev0vring1@55008000 {
+      reg = <0x55008000 0x8000>;
+      no-map;
+    };
+
+    vdev0buffer: vdev0buffer@55400000 {
+      compatible = "shared-dma-pool";
+      reg = <0x55400000 0x100000>;
+      no-map;
+    };
+
+    imx8mm-cm4 {
+      compatible = "fsl,imx8mm-cm4";
+      clocks = <&clk IMX8MM_CLK_M4_DIV>;
+      mbox-names = "tx", "rx", "rxdb";
+      mboxes = <&mu 0 1
+                &mu 1 1
+                &mu 3 1>;
+      memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>, <&rsc_table>;
+      syscon = <&src>;
+    };
 ...
-- 
2.30.0

