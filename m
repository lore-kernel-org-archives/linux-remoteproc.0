Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6316C433E6
	for <linux-remoteproc@archiver.kernel.org>; Mon, 15 Feb 2021 12:48:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7D32864DC3
	for <linux-remoteproc@archiver.kernel.org>; Mon, 15 Feb 2021 12:48:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230203AbhBOMr6 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 15 Feb 2021 07:47:58 -0500
Received: from mail-eopbgr80050.outbound.protection.outlook.com ([40.107.8.50]:33952
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230223AbhBOMrX (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 15 Feb 2021 07:47:23 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gF+sbrB1PDGI8p5jfvVoJxop1SpIqxlFli7FYd/4+QoGjer76kxP16T/7x7RupDRrvRYbphFb+AxrzHDK3XBfXqgsIZq6a2FvBz0+DzVUiTfrL6WUu5tOfR9qXOYvW+zqzS2lrgkOxgaUik5lhSgBZo5GEryzNxYmQbNTg/sfE6s8JQr6ON4UM2OFyVmVJDJZjolNVmeuAifpQb28erhrsBuVmJm+gM3bPVxuO/X2vPR3EcyeTv1wkDxD5AztTOHQ920NlbY7yiWHUlWhoroqM1KoMLJmvPSSpgh0mmE/hCRGeX+oIflhiDzzwi0avC5ptLSk54C66EBE4fZm8YK6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dmoMHqZBPsl8SeyXNbGQhYN9YYgird0xDuOayiiXljs=;
 b=GPjzGJ/4udH+L/j+WjG3ZvZXWxMEps+w12bmTaONV4P2z/SF+jlbpdYTnPKiWkIuF36EVqHuiYJnz3iTpWjqia3iAMxDpWawiQvUYVbYtnmdGbgskqIssNWxtcILbZl2iyk8yCyglWVHNnMJZKoxmP3eh8vIV7RnrOL+0+qTZcK15aPnqs42WPlP5Ad15zsTXPVxO8qzxfXycx5mOo9j4dDLWwIaVgTHyOhr5YWKBHDzHsP8W+oPXPdF97yV2xciAN3VaCnxWVKr09DoXHtffyMp4cVomwr4mKQicCqYp2UA99n8woVqIwsuxc8nfI4KqKEHGveXwk2rrksMKv4arw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dmoMHqZBPsl8SeyXNbGQhYN9YYgird0xDuOayiiXljs=;
 b=FzWxOk7eaTRi0rn3G+PBtH0eALiQ4G47yUl3Z2iiEwTWAjrGGnegn1yt6EYebyWOFYnGM72fABVK2MKihVhVz2QYCxFkVrZJh1fH4GDa4+gjoDIQ5wFIV82u6t+eLHpxcXvQAAWM3h0IrEuwpadaqZ9RT+NUeLdNPS6eEjcDQCQ=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB8PR04MB6859.eurprd04.prod.outlook.com (2603:10a6:10:119::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Mon, 15 Feb
 2021 12:46:32 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0%9]) with mapi id 15.20.3846.027; Mon, 15 Feb 2021
 12:46:32 +0000
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
Date:   Mon, 15 Feb 2021 20:34:15 +0800
Message-Id: <1613392463-9676-3-git-send-email-peng.fan@oss.nxp.com>
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
Received: from localhost.localdomain (119.31.174.66) by SG2PR0302CA0019.apcprd03.prod.outlook.com (2603:1096:3:2::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3868.12 via Frontend Transport; Mon, 15 Feb 2021 12:46:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5e00b708-d42e-46f6-f5e0-08d8d1afb8ad
X-MS-TrafficTypeDiagnostic: DB8PR04MB6859:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB8PR04MB685940C343F9696489306E46C9889@DB8PR04MB6859.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XMDKrhPy5sm1IW/z7p6RWPHgH4JR+gL2t4p7PDNzLDuFmlOnxSrZwczc3nS4zf4N0+ilef/7bgqHAssBs24sJEfLlIygB/ny43yE0v7QA76V9sOjzdbP4VvUfLDrUllkVp0kJg9Xa14xBHnBzmnMyWZLFS4+ALm1GXIX0qG/vnREuuHXwduoHbDRrvtJxMwtUy7V/fpY3o6vQxZ8on8d8FPxxrMptNWsgGju3AcJ8RxNRDrB2bCN1+Q/kpGv5zXryAbUySosnJ+IH6ZvN/8bB7ew+0uEXZhhrCTWXLdy4GXd5mCgMOwlJqzhh1osb8Ez6JT1qxC86JTzC+sSV3JjSI84sv9GlMGSadSikMva6QsDCtHwmEnGUApK7HBsMFsrVvDDNugdcDscKXywQ0lQZ6CGylb8l2jLycNhqImaeoAuaYoXbxJW6fOFJxk7ZCRE3UiSAPmKhrzbaxfPaqpUxV17G7Jku5FXcW4kBL3aDyvUKdSjfCfFqXMJuO4ZLx7nF9Zr54u1M47iTOQI/WrYo+2yzEW0Dlqpbuwq1qIes+FRILdu9B/dlzR888CfhfPw8YQae81HTTohlVFD91JAJM+mBUFvJKnDimyEVS97owuLEKNchBuEUsF22tqqHPmr9oHthDnqWmeqVXZNJvDngTVx5zfscS94ZjM+NwlG+Jg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(136003)(376002)(366004)(346002)(8676002)(6506007)(26005)(956004)(2616005)(2906002)(8936002)(5660300002)(69590400012)(16526019)(66946007)(7416002)(83380400001)(66476007)(186003)(66556008)(6486002)(4326008)(316002)(52116002)(6512007)(9686003)(6666004)(86362001)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?UV4vTQVxgIuLit2WzZY8IeeIcDIOmk1Yv4d2XEWqsLqZoiJUSv8jJvWEmYPN?=
 =?us-ascii?Q?ggdLPp080X4OHkTrO1iLFfpokzUCpS+qL+prUZE+rCzI+CcPsFJHTb7AFtaT?=
 =?us-ascii?Q?B7Wj9rJFYOUvdKlvm5PehFqJfBt10IL0eMLPBkvJLxWvXP+zzYnoqoA/SJrd?=
 =?us-ascii?Q?hWcYsL+IMo1lRuXYBEdbAhhlUIpPMd6co8/fWUO1zTpEnjVDXYa3FuDB+yjW?=
 =?us-ascii?Q?GyGPLULUsFYNybVcsyzCFDml/Pg4cdicx28uz2jKzV+jX81+1Ua73ZnhglP6?=
 =?us-ascii?Q?ZLaRftmfCE3j3B/WgI1NyG4GxGwwDJRUNIyzk5TWYEiJJsuhInUZd5Js4YHb?=
 =?us-ascii?Q?/xcdSdzo30sOUHF2W3GFN8XmoFARsqzYRhVBPKCdAPiAg2QVjHNMfUfN/+1K?=
 =?us-ascii?Q?VfhlAe+9SxLKCKZ0N6mrCrANqeMLI16YhsbySFraIgnczbDbdxdeADH1tv8E?=
 =?us-ascii?Q?dhFa7eNap1ZFiZwu6lBFD01ZtfxYYZR9tlOZYoFCt6z8DEBhF4DtxKksxlfG?=
 =?us-ascii?Q?ZGZLuZMS8YBwzDTsnYskV/F+iZsJf1hm4+5k9eCRnxPo7QwohCZChKrC9Z9h?=
 =?us-ascii?Q?VDJFd+YCMcUnvZjQPVuwViMKCVPX4qZSs9R289wsJ2rgTJHE6JCrk2nOk8HJ?=
 =?us-ascii?Q?AaBWX4ICat6uzzbQJJTaQrlr3TIpb6hI62yxcnWOjaO+KDaO6Axs6InhG5qa?=
 =?us-ascii?Q?Feq99XHJnmV9Wz/rkVIKZSlGrzqoRldSj/dAz/mZOaCQcEvcimsPziBpQ1PN?=
 =?us-ascii?Q?RrEPZXdZ7DZcmwOOLKnEJm/r3JpDixUDWO3GpXc3EpTLmCbwb+0vcsomHtN5?=
 =?us-ascii?Q?Fc/rEDwrus50QjMuOKy2OJk3xWrTDspbtKujlnZXV1Kdo5nbmDL8Ndq1VkmC?=
 =?us-ascii?Q?g6nFzqNLxTgVjAtxswv60D25PtXhgI26T58hjdvjSSv9OiCWqEq6j3SZemnb?=
 =?us-ascii?Q?BIf56mw2uxvSD/XYl7VMpXnGNLO/vV25hAd0yIryiniFt3pmvrLGUI1NywIS?=
 =?us-ascii?Q?3fV5MixAOCK7CE+Yv79XV4Oa6N70PGDUbwWzJnjroHPOmpktwsoFEQc7guSc?=
 =?us-ascii?Q?s8OAZg+ySSqblguNIYTEjR37WGZdYBnEmLvJT3zYx7/Ue+BMIdJRuUM91DxA?=
 =?us-ascii?Q?5mcVpyfT+/4JI93g91OT3bm/+rhF9NK+pzMcYm97rHrhsUQVuE7dzfvm3hrx?=
 =?us-ascii?Q?EhIlnVc2bJDw0cFP94dGbroH1ZDiZ0uY5MFffsqHuMp5YLZTynxpQBXxjM9s?=
 =?us-ascii?Q?i/xGwCRrg6b/g62nd3FK6Q6SglcejOaZvNQeJdQR9nDUb8SpTuwdEbGfGg+r?=
 =?us-ascii?Q?lfQ4poje7lW0sp8/lxRsmTeY?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e00b708-d42e-46f6-f5e0-08d8d1afb8ad
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2021 12:46:32.3174
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TCCcCFrzfLkQc1J+FZG7YO9543Ll+FaUT3mGDKKeVeJj8uwj6HtJePHnOIFzPFhnWVVXC8kQdVY6p7rdM1WiWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6859
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
index 8427d0f6e471..f87e98d98413 100644
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
@@ -57,4 +73,37 @@ examples:
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

