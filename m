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
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7240C433E6
	for <linux-remoteproc@archiver.kernel.org>; Mon, 18 Jan 2021 12:32:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 682E722573
	for <linux-remoteproc@archiver.kernel.org>; Mon, 18 Jan 2021 12:32:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403955AbhARMb6 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 18 Jan 2021 07:31:58 -0500
Received: from mail-vi1eur05on2076.outbound.protection.outlook.com ([40.107.21.76]:14624
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2391551AbhARMby (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 18 Jan 2021 07:31:54 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fS3OksHj3/phYPqK7RpV/EJsqad5x3J+04t3+u1NtoHT4uTSv6vjcD8+uBIvsZ/f0PsWlsjfcIjQVCI5pnrdmZ8it/4aMfBWN7kMOvc3Vtg/UqJH/m9Q5qa0YZxfTO2AS9PqhlsWLNjBi8wLL8fCI04chVrcnyrlpYCeu6kVrhnA+uMaGUmIZECKE3FwVBYbqZ7i5sN4xCiuBKQG9Acb8HVRVhAap0viQ0ZIoKecmNKyldC4Ik9ErSzMvogmrL7+7Fa0wNS17PsL5ZcLKvY5MddTCbIs6kCVeaKGQGZKjRUVbhqx6wOXOXTPj/ed8aY9/9lViUluBD6ASAbVHfsftg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C2lJ32NApXPQJSBQSQTUo8FalMPB5GyWcrxu9zgUz0U=;
 b=AweH9/i1o+gCSOPNXSlEGuavvLhsT1VJUoY8qrzxoWJTfHeU9llLWWlQ8brtRAj3xAeXNvOwo27zizWMEcQvUQyO4IvA3uSL2Q0QWX8FBY8EFEInHTYF0k/DE1qQm4e0eQARWBAFyGlm6yzR5JmmAOUY8cW/3TBeRlEQyzEkaZtrARBMm/1xOk6OFmt8PGxQ8Zt7xoHoajkMjx2kDU+QYB36TBfqKC0Br9VmvLX8p/sOL8N+eeYgGVWlutymB0epJoPJtJr0VE10iX+NxxQO7050m4RJI0pZaS2aHrqaKVfSfJf83jl/acnHhHcMdVq85h27/RK/9BUWaDt0MHa98g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C2lJ32NApXPQJSBQSQTUo8FalMPB5GyWcrxu9zgUz0U=;
 b=q70FuXpGfabClcWeVpGS8CkVYHtacNDMXVlzVo6yPiJ5gxG4wX/Vg4puH746WZQxZ69wd+F2BX5ph/28r5/JHlPIrZ8eFc3BCEsoDi2aFcxuoK9PdvBGxfY6hNh8fBQdpCTiOwneh5GYKS4pfWNOy0ndlzwKHJf61vQX3LMQrm0=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB5243.eurprd04.prod.outlook.com (2603:10a6:10:17::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Mon, 18 Jan
 2021 12:30:39 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5%10]) with mapi id 15.20.3763.014; Mon, 18 Jan 2021
 12:30:38 +0000
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
Subject: [PATCH V7 02/10] dt-bindings: remoteproc: imx_rproc: add i.MX8MQ/M support
Date:   Mon, 18 Jan 2021 20:19:51 +0800
Message-Id: <1610972399-28286-3-git-send-email-peng.fan@nxp.com>
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
Received: from localhost.localdomain (119.31.174.66) by SG2PR03CA0113.apcprd03.prod.outlook.com (2603:1096:4:91::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3784.6 via Frontend Transport; Mon, 18 Jan 2021 12:30:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 20aa71a8-065e-46da-d4ce-08d8bbacdccc
X-MS-TrafficTypeDiagnostic: DB7PR04MB5243:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB5243AA774B35869421968C9588A40@DB7PR04MB5243.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ruet0TPdZvdh7X4o08i7q20xpsQmGUNx4QayNY/2skMDWAsOEKOOODbikucqJLd+/hYXuneBiqksy05VWyaoedwoYwQC/1+OnX9hWGfvrGJI+w0QUL5O+vV8XGjF/Zam9uWLoRRK8EOilMZfQOQyEinyhHPoLd930k3juh5RxxAuwbYvlVD1V564dsrX9ENG9VARniJMOuiJpB9XZ0QX9mOBcjDAR52CvDwFjcyQCr5FukPeDWsiXkZkcLN0nLuet/S8so92cADvCsELa1eTGC9n4UV86BTPqWCOnKP+hFeeDJQRSzPdtyOU2xi6bCut7pPUP39aL5GgCf1jg8mhS2R7okAT6Q93aPVg8ezOS2cyvzbobN8LtQEqr4/RmcRMdA8VglcT6Lw1zPVp+HhWhWHtzaoEtXsMrH6IHGkFI2wBVVYLBi6TX5M/yRn9F8LjrkxOo5msxC+E4MxpP42ggQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(346002)(396003)(39860400002)(376002)(478600001)(6506007)(316002)(6512007)(9686003)(36756003)(6486002)(66946007)(66476007)(2906002)(2616005)(956004)(26005)(83380400001)(7416002)(186003)(52116002)(16526019)(86362001)(5660300002)(8936002)(4326008)(8676002)(69590400011)(66556008)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?dkE71XcXOcKtcXpinGpJUqOSRvkuF6kWFaJyr+iww3xKpupLYqtkneOfTsjp?=
 =?us-ascii?Q?/yOzxS34Dxmv5108/Fp9rUheWY6LR1jNjUhuhQgRRu86Nb/yCUJSwn4PC3aJ?=
 =?us-ascii?Q?kDHiD5Vq3QipnCBIUG0Fg2EJyepmFEuBS3QCa56Je2eocGez947jx+uESTw5?=
 =?us-ascii?Q?gxS8UK2rgN59eHAYCV2NoSypB7R7Fsvz5WyfW/O0HtzSCv/JmjzUxUiceC0R?=
 =?us-ascii?Q?ehQIjCpy3BRtaUOl1ZSzrznOgQ5eE3mPK0aXPoZKJ9D9m3/DZNVW6fLZMmPo?=
 =?us-ascii?Q?NAbV3tZ9nh6akv7Osw88uD8uBmO33JVA7KmXLNFuo6+kGQOr/n9sR5gX5XMq?=
 =?us-ascii?Q?TLXo96P2VBo7Fs+8i1mTRKiCS4Xj+qIbAj82i2q0OU8mnQTICLB8kmjkT68Z?=
 =?us-ascii?Q?lyWNYPRyHMtkQKu1fqBSlmI2MWVxuU2vwxIHc7tDtZNQjAh6c7Tm+7tGBBD9?=
 =?us-ascii?Q?ED88hC0wK3d+OKsiAvDMsdUDeDywm8tq5ja7+O/n5aS6IU3DBN9IKRj7a+sP?=
 =?us-ascii?Q?N0qOlYUZ/vXYcK7bs7PH1VTdKpCWdo+bPyK5ZZQq+zM3MEOowkL5GYYBgi6F?=
 =?us-ascii?Q?B8ANirz5dfVcqkkkFBqXHqL4kQI1Ra0oVH6jr16lo1vhizQclBxVKwj33gaw?=
 =?us-ascii?Q?H6vFxUfNar4y5iPtWQXjSlcQijmSjKEXS6QB9X6fR91banVrR/5x1ZveB04l?=
 =?us-ascii?Q?BfoO4umunGpYdIPBVfVHMhzpZ03APiw4J2eDxuEtXgYKqYPX9edvVxc/fHFG?=
 =?us-ascii?Q?FjTcp1t+OJS8sACvddhOTjE5zXsky1I8asFg+uPWmXWcA2PjYxW7qi3OcLqo?=
 =?us-ascii?Q?iMFPL9W8HViSWIaMeo9YaR6q+wSZm6D/bUfQfAqwQAdAO1gyh9/HlKn+3beU?=
 =?us-ascii?Q?7oxQJwSsP8X9ZqUa3en6XFKLBIjR8NatGjw+nUsV+jsvu6pz88bPPirLZFl6?=
 =?us-ascii?Q?K9DgTR4x3Tx4HWRqaXM6+yDyBhg4/Q1US9KLvkIoyK61Jik1VQf/DkbJEpGi?=
 =?us-ascii?Q?cpxr?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20aa71a8-065e-46da-d4ce-08d8bbacdccc
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2021 12:30:38.8324
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1jqO1qt3/vY0EqzrwQOM7MiAP4oyySuhgUQ0rngsueEqpytE7XzTEeLld29g9ilrWuaB4D+mEP0P8TSy95+itg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5243
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

