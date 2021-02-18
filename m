Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEC96C433DB
	for <linux-remoteproc@archiver.kernel.org>; Thu, 18 Feb 2021 01:38:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A312B61606
	for <linux-remoteproc@archiver.kernel.org>; Thu, 18 Feb 2021 01:38:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230073AbhBRBiN (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 17 Feb 2021 20:38:13 -0500
Received: from mail-eopbgr80089.outbound.protection.outlook.com ([40.107.8.89]:51809
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229850AbhBRBiM (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 17 Feb 2021 20:38:12 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DYKQAv5vDJXHJ+H5XFZoCfB93zX14PmoBL8JwjRY2FbZS/80lPCFESGSBqI7KvIPk/IsExRbeDRvf9qHw0UT66dG2dhreZdQXkMBTvSydZjvR+JwLJmak95ed8AmHI59MCFBjpQltkJcODR5iEPBW1tS0CNlGK5a++5YmsREDp3rVqfzBEn4Y+UBJ4n3Tw+U3mPyykfmh1xGl8xPkcEs6T2DKU5Bd7PjJbQ2JYQ1Sqqv1PUXq/0WCCfUcuyOfyIHf4Ktgcp84VoehuMcj4IksLjqLCVHQ/w7R7+15BEWqjAurJ5AU+QjQKiFCnW1dmdWV9mbjlZWhKxLTmNjyhYc9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XHaHf0+s3IpKXu0/DnioLgWNvoaHXdKV/0UGF4JtDNU=;
 b=YoeQoZakb9EPD4XqNw8MZ0HBYh5IJBqKUk9lbbV9SPeG7NvNiJkBE2VW9qLVIehyOrjVq3+MQCzyLDNxS7/pf2b+dLrp+7GUe0TbSLtsuJwyDJL2bL5av1erQ44GKxRSx62SaFhFqKFraEaKYQZn8FWGoobCEB8FMJw2tn06m5PgZKsAl1YJqP8f9HJBrt9T6ZhvxksJMfP3eO5ri0WAtYUuf+RAaJlUCmDU1hnGh1MGyKYYoapPNbX8G0AuVesV360wuDsRDm6C4KlgckJFZM37EIcT9/2XDDqx/ZQqLyEAw9iURaM0OXQZLSSe+pLunKyxD5+n3ekZqgjDf6WvPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XHaHf0+s3IpKXu0/DnioLgWNvoaHXdKV/0UGF4JtDNU=;
 b=BRVQvymVkOqng/G0WFVN9W4htw2G8r+3hIxHnvkAttXhLfSxgTL8bDQifpUuT1p21RkAm7p51RKayoX2tZKdJGinnXN3Q6KYgpKsfUcBil80K91QDmhgl467fPg9w93GJDcV6CZkBJpML/uFHZQVkBfr1WTuU4V6uybobO3ZtIE=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DBAPR04MB7285.eurprd04.prod.outlook.com (2603:10a6:10:1ac::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.28; Thu, 18 Feb
 2021 01:37:06 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0%9]) with mapi id 15.20.3846.043; Thu, 18 Feb 2021
 01:37:06 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        paul@crapouillou.net, matthias.bgg@gmail.com, agross@kernel.org,
        patrice.chotard@st.com, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V12 02/10] dt-bindings: remoteproc: imx_rproc: add i.MX8MQ/M support
Date:   Thu, 18 Feb 2021 09:24:52 +0800
Message-Id: <1613611500-12414-3-git-send-email-peng.fan@oss.nxp.com>
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
Received: from localhost.localdomain (119.31.174.66) by SG2PR0401CA0005.apcprd04.prod.outlook.com (2603:1096:3:1::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3868.27 via Frontend Transport; Thu, 18 Feb 2021 01:37:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 360dd85f-916d-4505-7f57-08d8d3adb33a
X-MS-TrafficTypeDiagnostic: DBAPR04MB7285:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DBAPR04MB7285386E32E67229EDF2D802C9859@DBAPR04MB7285.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t2BHvqdtUQmKdiTwlAaad1LE+HlZWTY3RIFsenpUcKyDLpDmEqLAdUuf2OWosR5neFqAV0OvCVD7bGZJYVmo2INT3/wARvnr4/+4vndKwFueWc21F96gOE9irolV+TPQHDfW++U6yt4qSI7DaSOZg9sXpjC6MjTe7ki0AVl2tM6hFYQzqk3KbQWAA2814eT7+DXYa13dZClwKvVJFhzlLVcJfGN9e2SpwLSFv5ULFuIVn+CGvE+aKbeC6J6nl6egzt8Y5Tm/c+xrUREg54J/mxYYuFWwjnVwCmk86bNYedvjMPZ21x579+HqNKW/rMbW2mbBwR6CGRFjnxJAEZSvPD1hnaXbIiyWIW70hZXgf9G+cWMGSTbAUDE4w65T1URNYXUnxoTOZycK0G+PfAQ2r/5jorMNvk36wWwiXJg50YES0qr9S+obgm0BWkn/F/1wMXhAiqGviZtkeQG2TYUUz7iYR3N4KxBsbJ7GVXsoAkLGdNpoRqKdHFCdBNBfVb+3QXE1gaJECL8kApFAoVOkI2bRHbpW7HV/LjVXYimi3lOfXXiCasB0XFsSaq5UAoDKsF/WS816+rH/glNMERphajylbp+qgbYXTKtUBLcrIdN1K+mjfvkg0x6l/GwPb0aZncvAoHMV9dq+Lk5V6bF9aOqu6lAKG/3NQ+lfzDsY6XM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(366004)(396003)(39860400002)(346002)(6512007)(9686003)(16526019)(186003)(26005)(5660300002)(83380400001)(6506007)(69590400012)(66946007)(66556008)(2906002)(52116002)(7416002)(316002)(66476007)(8676002)(2616005)(956004)(6486002)(6666004)(86362001)(478600001)(4326008)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?hPZgB7iBiqTGfypGf2tgfJROtbkuAadvsvHw1dAjzTWPhI04pJKnQFt6oIXA?=
 =?us-ascii?Q?GbMa0b46ink1Aw6f2bbxA7YA3PsUT8BqO0xCEDgoHeORxMZE6TT+1xf9jN+j?=
 =?us-ascii?Q?AmcijHs62XTgaSH/JgIeb4h3Szu16TFjuMkZXogHh41upICHjPoE26zoGZCv?=
 =?us-ascii?Q?gH++rdhgJ5jwjKp04TC6AAxoUTcZjIxxmPgJUhEZdj1eD+L52P8U7pzoxLvH?=
 =?us-ascii?Q?LcIKXCEUuITa681s5VAf//rQijw46bGw/p0UdXSGOhmA8k9O3mxX68nsj3Q1?=
 =?us-ascii?Q?o1t35Fxlc4hT1y1Wa0DtYhIJdQOlxaoCY3vUhIt9pVPIOW+58HkhrU/yvwXw?=
 =?us-ascii?Q?nQk8Y3epIPGDEO7vRqJD+OSrujTR0RDLt+p5bfJw1sWkNbahepiKCE0B0k2w?=
 =?us-ascii?Q?5rN6oUAkbGW1OC8kaQATD/JGwpoNWUsEZeBbEEz/g1wiQO8Q3MzqsunDM1nD?=
 =?us-ascii?Q?CfSX+aLWVQzZpKk9zjHk/NNR7kufam6XRJCOOTT9vS0Mvr+VUdrICkDFOiDk?=
 =?us-ascii?Q?ueoPc3c9AtAGcP2Y0xrEjBV0N6qmXsaKJDmEnWvGJ89kOjS0WAgTrknFeB4o?=
 =?us-ascii?Q?cDW4IaOfw4x2997/8igZLB6vjvNXNm2oxJvatiSfnwnA19FtzdqzwTCQIXmR?=
 =?us-ascii?Q?0+S247p24tYh/WgYV+2YJ1nvLUz1n3Skr3VeC9BausZcF/4jdVRa0QPA65jn?=
 =?us-ascii?Q?YbwEDyy6XardBhZj5X9+X4G1KMC+wXma4lfZMX6MgreVOnV2wcxGnuIfex+r?=
 =?us-ascii?Q?0MqgEPZD9ctfKg+ay26w9MIJ/tU7vPgkOtgD9oApl4t2kKpQgb8SwialQfJh?=
 =?us-ascii?Q?HxkG+1DR57JZnVjc+RWr/ZLi/tLkqxUQ2Xfkx8JfitYzzKoYHb3cbMZ0qArJ?=
 =?us-ascii?Q?uMbBw/xvcoyt6BY6/riyx4qMuo/0USBHrH4XECgHjdqdRJDeV6IV5Sum/+6P?=
 =?us-ascii?Q?FuBy3ocS8sdioZNX0VxcA1Y8xeW0Fe6YCC9F063lgl/J2IyIvEWLiG3Inmc6?=
 =?us-ascii?Q?xuTmhRkEvwe/ryE8MmDPiPtWT0QcNEogC7pFoEBBh18FzblX9crtEIQXoJLA?=
 =?us-ascii?Q?NrXTeYToCGJNJIt7Ar0XxDgEwugyDuYirfDYw6DLz89chu7QPbfcSdW04WXv?=
 =?us-ascii?Q?dpnZxnXoa+kBr1Iyubr40O14phsLaw1stJcc48vN8IAB3BidqH5/FOJHRbTq?=
 =?us-ascii?Q?a862r6/dHpcDMtfbq6JhVlvOPD4Eb0ezQJ0/g2GX/chEzOagwnq0KnmJTz5d?=
 =?us-ascii?Q?HeQ9+rTvTM4uLRWWKLEfZtW4czT0rT2tRfMU7SzGFwXl7e1BSWznQuArxXj/?=
 =?us-ascii?Q?kzXX24S7XUwHJvPPS0pVzA2o?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 360dd85f-916d-4505-7f57-08d8d3adb33a
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2021 01:37:06.4802
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kNXBivtgT6TCEUnErGc8CFmuj8jjKH6mU7Ux/EdJJiG4WmxeQc1waFzCxHGNV23w8ANxtSXTeALZ+SSW2c4VKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7285
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
index 54d2456530a6..52c8e523506d 100644
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
@@ -58,4 +74,37 @@ examples:
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

