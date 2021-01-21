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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D92BC433E6
	for <linux-remoteproc@archiver.kernel.org>; Thu, 21 Jan 2021 01:18:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0C71E2388A
	for <linux-remoteproc@archiver.kernel.org>; Thu, 21 Jan 2021 01:18:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392043AbhAUBRi (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 20 Jan 2021 20:17:38 -0500
Received: from mail-eopbgr150080.outbound.protection.outlook.com ([40.107.15.80]:35054
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388154AbhAUBQF (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 20 Jan 2021 20:16:05 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L/zHfKPT1w12CBmVxBCKSHhoPF66XCjOX5fYb3bSu0qtwsbKj7PiYOBivKlnfguxGm3yHTlDDbNudGqDqArp34il905oDcbTaOGepCfLwgRn+rMKXT1nK3ci7r+8YviS6WOOG+a4+WJne5S0vyYsIW1qFhRIB8dxfjZ0gkNdMLyclkwS9eF+qLgybW5UmgpZ2P5QH7Mh0OUHPkE5ly2mSgPN0B22PS1VNA5CsCzLJIOfKnbKT5KxxfJkKIs2BSIzHgU4by8DdohYycpBN6lx8UIe66pfspnRS+KkVG7k3B/M8Ae0xeyzNPNrtYkrEdLdRCHr/1AfaAekdC/7mRfpuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BNa3y1Ol5DGHpCFE597A58hnFNyL4kwr4nxF+dqIanc=;
 b=lQkYM/KwkhYTUe2kplQLxPW8gcaSQFbufGlioObmQs8X38rddV/r2N1xGg8D6DSivyVM03TKQM3D0cOgm3OP5tWxKtbsjghF6YGF/Pg7OPDFCp+4BjpSXDr6Z3MXVMqJkm/+8I7Bs2/dTuheX9iaGjnFaXhekslMR0DbZh2jivfP9bBV4VIfLtUbXAiCeK75gw/3sqH233/zyx/s5aAHlyQL1wm/ZU9wJn2Y9z9y/r/YmsbFAuAGnIRUBlpgewGxIKqD4SRiavcMciQUHFtHEGXIuDtFojDoZEvwp6j7aPeTRwHbezYLg00a6FOC8vq1D5dHBrMPeMluC0wSdUBe9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BNa3y1Ol5DGHpCFE597A58hnFNyL4kwr4nxF+dqIanc=;
 b=rzyAjOoptxriTMcWZ6IUyRA//3xxTaUNVtBJK6AdZi3V5souAriL8+LJiF4UFyJC0rU57UUPLMrwhiXh+Hcxw/toqAibZpJhrIURhB9rwbXktGtyWhKb1+oKwCyH/UqvZY/HLdbZmHLQSKPeuE7MpHU3/+Z96DS3bj7iSF4hIbM=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DBBPR04MB7930.eurprd04.prod.outlook.com (2603:10a6:10:1ea::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Thu, 21 Jan
 2021 01:14:22 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5%10]) with mapi id 15.20.3763.014; Thu, 21 Jan 2021
 01:14:21 +0000
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
Subject: [PATCH V9 02/10] dt-bindings: remoteproc: imx_rproc: add i.MX8MQ/M support
Date:   Thu, 21 Jan 2021 09:03:27 +0800
Message-Id: <1611191015-22584-3-git-send-email-peng.fan@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611191015-22584-1-git-send-email-peng.fan@nxp.com>
References: <1611191015-22584-1-git-send-email-peng.fan@nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SGAP274CA0018.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::30)
 To DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SGAP274CA0018.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3784.12 via Frontend Transport; Thu, 21 Jan 2021 01:14:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 79d41900-e997-4ea8-e589-08d8bda9e212
X-MS-TrafficTypeDiagnostic: DBBPR04MB7930:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DBBPR04MB79308CE6371FB6BC0A578A0788A10@DBBPR04MB7930.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NwZhlgnS4IRlmUgENF64W0DyGJ9apLw0xrJNE7WhlWQvh0MYBfdbAxZcoqOUWahMcvpdqkpudj58vJQFRXmVTFwNx0ACmCLj6FMqQnT880DUv1pr459XsDAmxOgUyw9soSCcNIDOMxmtBw26b5NyM1TRN7ZjjuVG+fk872j7lgHhiEVrhO8c8aob3I4yau7HVP9qXJoNFlUov/mSqDJ9AQF67tgZg2++9MjwEyiwHVdPQWc3RXZe+FvvsApZ9Mvz7aTH0MdyWG4wb7PIBvYFozSpplf5rT+ZuBYBG6PIjqKfgBi9FxYgOaGUPumhrM6ZOhR0w6aX5kdOsDDjjRckohki6tqzMqJpa9sdUOIlchlk89xKiOtGhjI+mfJohZDIrXez0gj7Zd62p6/spggR5v8gDzRdKjOe0o58zSUDzCZ2xmnbQuZdu1Q4TD0gSEIanZoF4oOUkvKLq/ervEItz5QzhbivGUGK2/LYZzty4FdFmJfxvME2kY3TFSovKLgL/9NV3GpNlrn8ZCNCnepmuA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(346002)(366004)(396003)(376002)(2906002)(7416002)(6512007)(956004)(8936002)(52116002)(26005)(478600001)(9686003)(316002)(2616005)(5660300002)(6506007)(86362001)(4326008)(16526019)(6486002)(186003)(8676002)(6666004)(69590400011)(36756003)(83380400001)(66946007)(66556008)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?TgO+ELnzJHVQ0NZzcKX2YdboXFf17aoJA4POu4XvU6+45yf+kFZ7gWUC+72C?=
 =?us-ascii?Q?fXj9BVpOnbnHcsJLcADVgga8Ezmon+vKA9TP0TdrMEBIGlN4ZPgY7K4iyJoN?=
 =?us-ascii?Q?UC4jM+1hECaq5wb6vpWCdEbjIICWtEPZy7e2i3SVrjChD844LaWzF2vr2kmZ?=
 =?us-ascii?Q?mJGc7uHevYpHdS7xdevuTajazXndwGr/oZ1OJxfDMwpHf+eX9w25+v0qTYO5?=
 =?us-ascii?Q?vfk2Dd+R5YWWPnneZ7i9G4rcpfbe2hBTt8YlmiewgJ6cYJ9tnmA5QNabrvQn?=
 =?us-ascii?Q?MQiBXlicWNkc7ScHyH7I7HNzNWlhGSbtrY9Svl+p2Bp+AZ/vbthWXXJQcnR+?=
 =?us-ascii?Q?BtEurjPJ0M981TjrU/OjNMDY7HZHgN8rYxiV3Z2bilEl3U+brw4tUcVviTLV?=
 =?us-ascii?Q?yAfVQZ3vF2UTKaImBIJ8SrRTlszJ5yyEJ9OaoiroMSllWwDO/CSGCy2IC/24?=
 =?us-ascii?Q?1JYObIcAiu+2V3nzpWJDwBH40sCgwRXH0Uk+Ni+w4ihFLlBKRzvVxcimmYpq?=
 =?us-ascii?Q?h6c4wZjYEuFBlZkTr6GwnQFLoj/0KbvLOZjNO9PjeEQu45flCnJs/nOnBOKx?=
 =?us-ascii?Q?Xcov02wsmL2jDd8BHewCG1Lp87t/yaZ2uM6UGPnZui3ACZWFFpyfwQfK191b?=
 =?us-ascii?Q?f+0fT69W/FTuakMaNb2gMtjzYWwUqOBBxzeVpzC6JLs5m0OVP3MDcdL3bg0t?=
 =?us-ascii?Q?thpszekfnWsi3bjb36P9PePbzj9YokultZ7lzjbKKMMxbelTweFtFPYwS4UT?=
 =?us-ascii?Q?QbAIAtZIHabU127xi+MzYTJbVyhfZGB1UfMejpGqZe26RBiHazc4SyAx52pz?=
 =?us-ascii?Q?xddPsXQMxL8ksuGqICFL7NZa0i0P5JFe8X32Rcr0nQGmeGf/cKboqo2BugGg?=
 =?us-ascii?Q?gn26ymQdkbUVjjJyOA2Daa4EiW7KTnvOnV4JbewZJR7hKq1xNo1knXmCOZ05?=
 =?us-ascii?Q?VghSnym5rpFdGX63m5K0BIvisWi0b07mlKe0x5DTAr3wWbrpuJe6GBenuvAA?=
 =?us-ascii?Q?9U3F?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79d41900-e997-4ea8-e589-08d8bda9e212
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2021 01:14:21.6915
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tQDk2MRDMYn2BB0W4Lcxt6kBBK5YfSvZo01vyaho+iGqp/VTx8/fL+euQ/MWrE/pDUkXBqF9K16VuIwauWmXGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7930
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
index bce6ccfe1538..7ae0fca24403 100644
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
       list of phandels to the reserved memory regions.
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
2.28.0

