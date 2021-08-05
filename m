Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0B20C4338F
	for <linux-remoteproc@archiver.kernel.org>; Thu,  5 Aug 2021 09:13:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B5D6061029
	for <linux-remoteproc@archiver.kernel.org>; Thu,  5 Aug 2021 09:13:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236825AbhHEJNY (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 5 Aug 2021 05:13:24 -0400
Received: from mail-eopbgr50062.outbound.protection.outlook.com ([40.107.5.62]:33507
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231310AbhHEJNY (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 5 Aug 2021 05:13:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=llsCINr1DXZJ1DbajqJv8OVM/laAh4lwHeA5OgFOaseS1IQJi+1R5IhgrklsfWr6TKRNjNMabtHPwnMaqFxe4TdvSvtvGnG3TGQIB8lRsIcPsUUkiGy1Tq+/ee6TiFJw74qk3vosq90IXcSgR+jHQpoNcn1X5oSC40QVWlBGE+EsoUEIaNakZGvTUuv4m4Vjz0gTgh7Bv0X2zY7UFczavDxWCtyzvbWnHt8K1upz9mL6m2l8Js7tyuvg4ufq/SrW1WMt7pWYcvxeSlk8L5s44iXUhPQx1gsEQvq7LT7Mfp2Mr/hO8kfn0Yx0KsT/oqjONOvs3vPLQklhXjmiQfuZVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0xu3h96O0+hh5j2fUxZWVQvLOGbJ7+SyPiVmwns1wJQ=;
 b=h4hYm6VsNngTAHWLrmWIbTr6HC/Rmji6blfsPT3Ou6ZSXQo0tx4V7EeadHpO7o5JzvemWmC7NwiUcemBz658A285h4FfVJyRfzq1+bsxiKQocqfq61+xBV7Ss77hrUW9ye0jk+R+KPDhtHi6Y/j28l0KSE+CvvFdLHZPLzH4495U56L1PPK4wreKnXMC+zCDnQiPgyN4hH2JCvENqjztf2pC9aKz1zkpM7q97ReOhhOMtkVlO3GVG/2HX3SbIJy7uESwFMTE4r3hZOFu3QdTl7FzyPq2OvOT/cOOuGX2YC31yvAfwj04VKs7t7lcWmnId5g32KqCxCj7hslLs1Kasw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0xu3h96O0+hh5j2fUxZWVQvLOGbJ7+SyPiVmwns1wJQ=;
 b=p/evZmNw7Yw4tsH1ybNTYGueSNMuolrDTdBMX2s07DSz6U5uuLiMxUOYDcE+CCU05ydNBytjNoe2tE3rd3R1R9cfFcsitZyHTupPqfvpuD9BFJCVUn9rzaD41EeFSAfvuHiCe9fI9PXpq8QXgQRDMmgEEj4ACda6qGjcjo0+z88=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com (2603:10a6:10:2c3::11)
 by DU2PR04MB8984.eurprd04.prod.outlook.com (2603:10a6:10:2e3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Thu, 5 Aug
 2021 09:13:08 +0000
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::9daa:ab21:f749:36d2]) by DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::9daa:ab21:f749:36d2%9]) with mapi id 15.20.4394.017; Thu, 5 Aug 2021
 09:13:08 +0000
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     linux-remoteproc@vger.kernel.org, dongas86@gmail.com,
        peng.fan@nxp.com, linux-imx@nxp.com, robh+dt@kernel.org,
        shawnguo@kernel.org, kernel@pengutronix.de,
        Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH 1/2] arm64: dts: imx8mq: add remoteproc m4 support
Date:   Thu,  5 Aug 2021 17:12:17 +0800
Message-Id: <20210805091218.1626290-1-aisheng.dong@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0147.apcprd03.prod.outlook.com
 (2603:1096:4:c8::20) To DB9PR04MB8477.eurprd04.prod.outlook.com
 (2603:10a6:10:2c3::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR03CA0147.apcprd03.prod.outlook.com (2603:1096:4:c8::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.5 via Frontend Transport; Thu, 5 Aug 2021 09:13:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a1aaebb2-250a-4558-8ec5-08d957f13d84
X-MS-TrafficTypeDiagnostic: DU2PR04MB8984:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DU2PR04MB898408DDC8DF5BAC845D8E9A80F29@DU2PR04MB8984.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:238;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V0W1qQk1RUUqEaOMDpGL8MX2CbDm71tGgj6IHpFd9N83UCTcTTrFjRLxUhcje804atlRydxdcYZM4fhXciwkuNfLBg2mzXuxpQKQbk6DMDQP8Cnt3fuHww+v00y97vbyv1e0IllTbTtAteb+jNu7+l7qblmTrokguSGZOQh/vNDRP/P64v6SkQpW7gux2rQnGGMZei6a7yOUX+MrOsTXItlYf3qRxdHlMfjS+APlN9VaKi0+iG7hhP8EBPcQdi2ggtnnpb5+/qwFlSKm8nAN679aSp9HhCjYGNwVnr4aTxBXY3WHnsD3v3rwUo8lzK2eInVm4UY8WEsb1yN6xB2pttJiwBlDGL0kkq0jABHyS+1DVCbidqo52a6eRG4RmiqDHy8yGcvn8lQBpBqBGz0DzSpItTqQ4+ddgWMx/HeNTIXN+v4Fxn89iolkgQDaleCAGBVmrWoqA02VcxGZUgr/SJVVAVQM8DizHzSJ/jYaZHZDeDVpCU1mYwnvsQAXuaLc9CZY4bAhKA1OznKF4+2fTXTn4lwsab4EOS7DwMv8LRqIrYsKVrvggvy6Dxu1vecLmcJZ7fTVsX8KpWHh8IOEn9IDAHDW+yGjXvRZog5w4LWjSLbIZNA0I9aKbxg16KwyTFYKBORExV6Ags/dGaf2CQlK+sM5FwY4ebcxaUtTpk8vvXz1VicvL13PkXs112VXzHddVu0qcdFhRK2WDxbEXDuPlv2sI4BJxC2vS7YJuV4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8477.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(316002)(8936002)(2906002)(8676002)(6666004)(26005)(508600001)(2616005)(38100700002)(52116002)(6486002)(6512007)(36756003)(38350700002)(956004)(1076003)(66476007)(66556008)(66946007)(6506007)(4326008)(86362001)(186003)(5660300002)(83380400001)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BTrQZttaWH0MMrCzAghYDF8SFZgloW7+AkkPU0GbpGrILhE4PfT378rLtTsc?=
 =?us-ascii?Q?sXNWlhbTPg1M4MFCpMhOvjMXGdkElG4UbvjOgbJEbQyFPLj9pyvDBc9b+0DQ?=
 =?us-ascii?Q?mhdqomy/vE9RWDBPnvTI/wX9Xw27ipsBaCkwWqLRxpmLqKEamHM/FTSphsIQ?=
 =?us-ascii?Q?/M/bsOcoV9/VuRLbYrguyvhAjXUj2/S4brKBgvD9qT6iPpQtFOopHtpzdTiA?=
 =?us-ascii?Q?M/8405fb8gIaiEf8fWlLXxTzSXRp7gUbRxacdVaFAYAZJpe5NaDNEorZWbIe?=
 =?us-ascii?Q?yaTlT2SGEvZLpbuQMZPuldkGRrJSU9jD6hnVnRGYlEd72JOOS780UGUGCBj+?=
 =?us-ascii?Q?6rQXoRod6pv79XJHlTlmw2o2bIVgfFAIsHea0TLJNegBt1Xxlsz5qTVwQ2oY?=
 =?us-ascii?Q?taYrxzoQjQUdOT4lVhxoNDfD3QEJ4yoShbhw3Od63VaoDlSuus/rf4aG7saR?=
 =?us-ascii?Q?PkCCok2PPxeIl0StHVDjkND0PpF+OoACHsN+UhjvzEPF6ArjtS2JPPscgt5O?=
 =?us-ascii?Q?LscQQ0YmBlGmL0lg5Nj6Rel55L4+16daKIJEX77kg4VDorgf/8+AJuJ4B16l?=
 =?us-ascii?Q?ulC4iYReGykUyb/L99qwPOnyLK2jGmKIdH259JaRqenlHltPtQwT9RStJ9lp?=
 =?us-ascii?Q?NrKy1TSCH2uaY5BO2J+p1ENB2NJmINfaHkePv1RxVKzc+H2ypkY/mqD+jndE?=
 =?us-ascii?Q?y3/J+vHoDWDIgFoLqmakRykT4tup2YRzCSQ+ErYyw3cZtOxvZoPqa2ex2H41?=
 =?us-ascii?Q?Z+kcuDz9McLalL1uXA67UapvZbTA+bR/fB533m2ouwE4fK4bNkcSb70kD1a6?=
 =?us-ascii?Q?36BRgXu4DRGspHNFa5PpwHxyg6Cz/IDifiV5UhY06Giut4lmZVJfdAsSDMCf?=
 =?us-ascii?Q?Am9tVaGk7xs5FjUUdkQZ1prx00MtNVUqvluaAGVFWuJQNw6m6DC2tH2UCyxj?=
 =?us-ascii?Q?IJn/I+Ke33/NKZMwK+cJ5eodAS/Y0dzEoKoXDZJotTMhOUlMS7S+JdTLOIRd?=
 =?us-ascii?Q?xqSq0TSHy1OhcCG9+re7kM8dlxyWLYd5OQWv/40NNPR1PHLz4/Y4gCSRM3QN?=
 =?us-ascii?Q?xlMt933lTLDD0QzPXzSzVvcfOjmFYDUnde5+BzZsHqtPrt1S49kaSUGjSB/i?=
 =?us-ascii?Q?9I7eLpxaDFSyIThbUMiHJtORQtveI+H9du7dSjOAtnqWFZcTqSx+c8BtZsl6?=
 =?us-ascii?Q?911n/iFcK4Da5lNl4m89r/umP06Ta3n4lG41+o7TrzcpTQ93GXshlJJXc1uC?=
 =?us-ascii?Q?cX1S/czgw+PpuJ4C/fiJ5GMfB3/Gt1jU89j1fC0YNEEJEnQ1QbYL4cE3NOeK?=
 =?us-ascii?Q?UTNd1k3lxLJ41EvKiP1om5kr?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1aaebb2-250a-4558-8ec5-08d957f13d84
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8477.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2021 09:13:08.3036
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ifOmKNerl4XeHhBfDDCsUWORBIZ304rq5zWgxwfjF0GwS5k/LQJSik3bndPPlzcwaT2vyKfRz8UqoXX1EcNOiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8984
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add cm4 remoteproc which supports rpmsg naming service.
It needs vdevbuffer and a pair of vrings and 16MB reserved memory.

Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |  1 +
 .../boot/dts/freescale/imx8mq-evk-rpmsg.dts   | 72 +++++++++++++++++++
 2 files changed, 73 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mq-evk-rpmsg.dts

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 4b4785d86324..687ad9d68a85 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -49,6 +49,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mn-var-som-symphony.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-phyboard-pollux-rdk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mq-evk.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mq-evk-rpmsg.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mq-hummingboard-pulse.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mq-kontron-pitx-imx8m.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mq-librem5-devkit.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mq-evk-rpmsg.dts b/arch/arm64/boot/dts/freescale/imx8mq-evk-rpmsg.dts
new file mode 100644
index 000000000000..4a8911087e5f
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mq-evk-rpmsg.dts
@@ -0,0 +1,72 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2019-2021 NXP
+ */
+
+#include "imx8mq-evk.dts"
+
+/ {
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		vdev0vring0: vdev0vring0@b8000000 {
+			reg = <0 0xb8000000 0 0x8000>;
+			no-map;
+		};
+
+		vdev0vring1: vdev0vring1@b8008000 {
+			reg = <0 0xb8008000 0 0x8000>;
+			no-map;
+		};
+
+		rsc_table: rsc-table@b80ff000 {
+			reg = <0 0xb80ff000 0 0x1000>;
+			no-map;
+		};
+
+		vdevbuffer: vdevbuffer@b8400000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0xb8400000 0 0x100000>;
+			no-map;
+		};
+
+		remoteproc@80000000 {
+			reg = <0 0x80000000 0 0x1000000>;
+			no-map;
+		};
+	};
+
+	imx8mq-cm4 {
+		compatible = "fsl,imx8mq-cm4";
+		clocks = <&clk IMX8MQ_CLK_M4_DIV>;
+		mbox-names = "tx", "rx", "rxdb";
+		mboxes = <&mu 0 1
+			  &mu 1 1
+			  &mu 3 1>;
+		memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
+				<&rsc_table>;
+		syscon = <&src>;
+	};
+};
+
+/*
+ * Below devices are allocated on remoteproc
+ */
+
+&i2c2 {
+	status = "disabled";
+};
+
+&pwm4 {
+	status = "disabled";
+};
+
+&tmu {
+	status = "disabled";
+};
+
+&uart2 {
+	status = "disabled";
+};
-- 
2.25.1

