Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21CE0C433E0
	for <linux-remoteproc@archiver.kernel.org>; Tue, 19 Jan 2021 07:49:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D252F2312D
	for <linux-remoteproc@archiver.kernel.org>; Tue, 19 Jan 2021 07:49:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731384AbhASHs5 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 19 Jan 2021 02:48:57 -0500
Received: from mail-eopbgr40046.outbound.protection.outlook.com ([40.107.4.46]:22240
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731361AbhASHra (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 19 Jan 2021 02:47:30 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=af+gTEmYrABdWPizFEbyfqLsMO0/yWD76NcCHBiZR7uW1dFseaYDm/j3QELRO2sMsyRaeWiJVTjw6rtKYFzNIXlmxyg8dqIIjjCLOKGczGVeZZpYKkdLNWNER7HnSDwTXdiiEtNHzVB/Qxo7Vu/zK+cLjDBLwFvUesuh/VyxGQveQV1fc2747YwafyQp9icKYARVSkInDrC0FrnNKBLNE9YZlGq1lAjEukXXanwJjfav1b+GP2F/7BPAXcuNOYfcTmkBrT+iv0fZynBbjqrkzhpa3dmR3jQ0MG68FUwZA0+uUTJIfF/DVQXGVlMvWZijt5OBqkUeYQFLR5iL9DPXGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C2lJ32NApXPQJSBQSQTUo8FalMPB5GyWcrxu9zgUz0U=;
 b=HIO2jPtk0Bb/TRqphUOb9dRZU2L4a7oER4par3s2k2LFxOVVQrWEKRUWT4I3GfcDELBKNk6nkUsSdCF78pVLA3XRtysQOMB1T6xDP08XqE/lPhJ1oXRKHmE4141WoXJH4bZoie1VYvXgHFzK8dbTwFXxx72AoosCHO7tNCehvT0Xv2POpOaPKQ3ZBoCHCBqA+y31oAbxJff40HecQLlJGO8eUmDxUcy84xVi8TDaM7HMM2V+fxkUuJ8JA8g2aiL3lOMUuCwVyVcB1qylF+MOBSfZ5VnQq24VUZge207zxTasrWIIgBEMgnrXN27xW+jPQsOfUW+POCwm5VXCnyhK/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C2lJ32NApXPQJSBQSQTUo8FalMPB5GyWcrxu9zgUz0U=;
 b=jghiAg8zFaPKDV0jyENhxVS7cm9WFzpvB/uiYN5VvfqdpYUz4b6AFJjzIXH+gwIJOw79b/IRy+ayGCmyV5ElMdV7zGQ6LO4SLEj2ld74ZXdhNBar7GP5X1FL+8v+X2f4/4eND2l/hEyO7BPggt9TZsKzjoAI8uBbrdJ9JDdq8gs=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB4492.eurprd04.prod.outlook.com (2603:10a6:5:39::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Tue, 19 Jan
 2021 07:45:45 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5%10]) with mapi id 15.20.3763.014; Tue, 19 Jan 2021
 07:45:45 +0000
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
Subject: [PATCH V8 02/10] dt-bindings: remoteproc: imx_rproc: add i.MX8MQ/M support
Date:   Tue, 19 Jan 2021 15:35:03 +0800
Message-Id: <1611041711-15902-3-git-send-email-peng.fan@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611041711-15902-1-git-send-email-peng.fan@nxp.com>
References: <1611041711-15902-1-git-send-email-peng.fan@nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR04CA0161.apcprd04.prod.outlook.com (2603:1096:4::23)
 To DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR04CA0161.apcprd04.prod.outlook.com (2603:1096:4::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3763.9 via Frontend Transport; Tue, 19 Jan 2021 07:45:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 413ac416-e40d-4620-7ab9-08d8bc4e3ada
X-MS-TrafficTypeDiagnostic: DB7PR04MB4492:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB449252D88455D3AA6ED2D17D88A30@DB7PR04MB4492.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b7NI8TcAAz14730ocVVaqDdmk9Ub1scEmCHADQj1Ddm2YVvZcp+kQyrlX4lKevDgG+8mmNONYdu6UEagynMZYJmaMin4V8uGI/eeHUVBKUDEwQHPJi6dk/z7cBN9DcbS8QH/VHgjIUbFdyh9pqGMmeG68SifO/Xjt+NMXhMcB3IWrlt5kfAdJ19VJ3XZTFDwYEBMR4DGK5R7R+XAgd9aEHwmzDGAo6SEfOkPNxpezxbVCS+6Bs6n5jXnV2Wl5U3d3y/PUCzbsQq/CaWusMH3B2hL/6z5mf+5NmP+yx/Cm1Wo33JBt8hfEKt0X0bhyt1VScrw7OVLmMSIN2uqHzJciqS8iHht/SoHACrD7xaDw/bOBumi3CY5EwIVNtZNTM23jOf8leAKkAP0B9h4X6Gd/7sPlqDm+wSb1j9ywdZpz8IMAki1V7zIDDe3Q6208+hYYIKmp0eDJSp8Cq0HYK3c9w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(5660300002)(2906002)(66476007)(26005)(69590400011)(4326008)(6666004)(66946007)(186003)(83380400001)(6486002)(6512007)(2616005)(86362001)(36756003)(52116002)(8676002)(6506007)(498600001)(7416002)(9686003)(16526019)(8936002)(66556008)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?HA3XfdKLaaLEUu4ycHB1BhHsQG6qJRsT4JgnV6C7u62n8lhSbkg0b7UGqaY5?=
 =?us-ascii?Q?pZZ7rVNYC8DJNM0nthf4OU7HHawdvjbGLJrn9+AlIWCzLH1oM4E8eYtiXkPj?=
 =?us-ascii?Q?mf9q8bT9Wk3EXoDaOp8Mci6rtRD9taYX9nuykaMewV9AY1VPTDRPLBF9dbTm?=
 =?us-ascii?Q?mKfhblyJFD7Ev+leUudKsEA2pjZfzMApgSu69YHVvkQp5PuHJ6pziAj+PkNU?=
 =?us-ascii?Q?RvD/Y+5VH42sUV9jaW33hVes9HOrP2YD05ATKdBPzW3MtmRhn/sprZ+9lbB7?=
 =?us-ascii?Q?tfTd3VdUPfgCJBk35+xX0zLPmP0E1Fvnalz6EJUUIbP8xvni5PRRA8e92VUb?=
 =?us-ascii?Q?7Di5uvYT62JVzCkppSJu/bDVWU4Ggq4hIEmGEKtT2JsiFM04fp2w0RPi0R0j?=
 =?us-ascii?Q?VtBUgPeLcj2AlKqpUstACG7+EeNSu4tDxodjFLf8KnvdkDAvBvjSakqve5gT?=
 =?us-ascii?Q?caofoAeD2ysp5AmoX9/zb6t/eVDOK0m+oXGyL9VlWiwWAq+eipApeSW1iFHM?=
 =?us-ascii?Q?aZ0syKq19TyZeE9PYhJictML3Lcjr+RU6odhUhD29UCWwymaPI1Y1+gXZoPa?=
 =?us-ascii?Q?F2fYm1n9RMaEalUi7GFDt4aytrC/0hLuMQUmbTY7/o1jedBpWTOZ4CwKu21M?=
 =?us-ascii?Q?UzDGEFY2eaMQQMqc9UfgBHHC5za3IaSbDlZFczMJRwXI9+C/xX7/inr0j6li?=
 =?us-ascii?Q?T9HbV20gTaOEP/MgoBGyiafsysbE5OmCcvg1sRpgtEF9HOjw/beCeFS4TIPu?=
 =?us-ascii?Q?L5egO5sHjSiT7y0p8vA46PZl7XqSVvES6jDUQbN3OSKRqh3A0YoGveDxGQ0o?=
 =?us-ascii?Q?Cb7SUnjCIcwf+/5ycMLmQXzCyGzZxZ87jChABJ3cx+AaVfsr7Bf95Bd7QD5d?=
 =?us-ascii?Q?4oAl+vHa13xN9ojo6VcZNCnA/rYp5Zht8atXUYUTPkEfq3ifO1bjSu1UCClm?=
 =?us-ascii?Q?l3ColzGTXts90WsZbx3uODH6PMHpq4SGl7kdVK6bVwWnaEqMubhLuXHVkNfq?=
 =?us-ascii?Q?2o6G?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 413ac416-e40d-4620-7ab9-08d8bc4e3ada
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2021 07:45:45.6001
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SPn8fjM2xnoJHFYyDIyKLrS4/OtTQpx3G//o7VQOH6+aBx6o5uFPsIj1ekAb+Zu50K6EnrWZCQ8mgRl8Hy5o9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4492
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

Add i.MX8MQ/M support, also include mailbox for rpmsg/virtio usage.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 .../bindings/remoteproc/fsl,imx-rproc.yaml    | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
index bce6ccfe1538..b0d600baa161 100644
--- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
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

