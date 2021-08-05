Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C9C9C4338F
	for <linux-remoteproc@archiver.kernel.org>; Thu,  5 Aug 2021 09:13:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 32A0761078
	for <linux-remoteproc@archiver.kernel.org>; Thu,  5 Aug 2021 09:13:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237906AbhHEJN2 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 5 Aug 2021 05:13:28 -0400
Received: from mail-eopbgr70085.outbound.protection.outlook.com ([40.107.7.85]:25230
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231310AbhHEJN1 (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 5 Aug 2021 05:13:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i3lFb2MBu2Jxv5qxJsthwc8jC+VDq5tM8hFfcf/NQp4PIck1Ru0boSqFwVKORXEgabZZq4K3WRNm7e6/xt9bOJ5dW/xTgekfnnV9NDsxRu9qWQqxIOKjkyfM0rgXFLDPbp8kibZU+0sphqAXOXkbOl27dU+eqoH8rLM0P46X4lyAXWu9EBt3RcqNhjcR7DQHtv1GkhKMp1Dt2pgCl4dkmhuXrc43z+aF/YGBbKUtsEciPrDNC/ECdVdmQyNABLLCLm/F1O7lLqhp61ad4Tab9rNeLCqxmYKf0KAQCrTo3gn4UmigqCTNdEv1/Ak51Hzaf5A7G5a0yKdQ9vFo+V8N0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0bkc10URnZCDjtQnNRy8RJZ9U7dHUerzDZM2QhQEv5U=;
 b=NTjWQWo8wgmnezUozJ8tmirPgbYNg6BGfwvOkOBaGMFe6E9D8upO9hHxMYIa++9d/t36xqez8dhlDWoogyZwYfZHEfmHU1Pfc2evAYk2aYMDAvTTttDUZSmOSywawQqUxW4IH9rGRSyomoRI1TS48zG0S3+5qy6dCr8zFHNbgJM9WODtzZkQiXfe1L5wUg/R83XULRH61C5sLvHWWSj3AXRMgVOaxd6zD1Y9lZl6YAo7E0jVB+8YCLtfHMOaKf4xE4x1VZXXUwBsnelEYBHUdpCHUeNn0TU2WyETL+kTALyFOB75aYJ30hURlpgdzKNwCL7RBhoEIJZYHVVFM4ko1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0bkc10URnZCDjtQnNRy8RJZ9U7dHUerzDZM2QhQEv5U=;
 b=iXGCkSloxI+yVTfsyCnMAes8U3YwFkHKK/hbWoiwW6F/sCEcdcg403MMX25FBMhPY/9nj7TFNFPzNOa9HI8TVQ3p+hI/O8R2UybU3kt40TRxPdBNcKSVcXtaaYjwyNG5kwXvId1XsFVThGzAohKFuJFKoQ+6XI6QcX7LChSHl90=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com (2603:10a6:10:2c3::11)
 by DU2PR04MB8568.eurprd04.prod.outlook.com (2603:10a6:10:2d7::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Thu, 5 Aug
 2021 09:13:11 +0000
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::9daa:ab21:f749:36d2]) by DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::9daa:ab21:f749:36d2%9]) with mapi id 15.20.4394.017; Thu, 5 Aug 2021
 09:13:11 +0000
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     linux-remoteproc@vger.kernel.org, dongas86@gmail.com,
        peng.fan@nxp.com, linux-imx@nxp.com, robh+dt@kernel.org,
        shawnguo@kernel.org, kernel@pengutronix.de,
        Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH 2/2] arm64: dts: imx8mp: add remoteproc m7 support
Date:   Thu,  5 Aug 2021 17:12:18 +0800
Message-Id: <20210805091218.1626290-2-aisheng.dong@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210805091218.1626290-1-aisheng.dong@nxp.com>
References: <20210805091218.1626290-1-aisheng.dong@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0147.apcprd03.prod.outlook.com
 (2603:1096:4:c8::20) To DB9PR04MB8477.eurprd04.prod.outlook.com
 (2603:10a6:10:2c3::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR03CA0147.apcprd03.prod.outlook.com (2603:1096:4:c8::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.5 via Frontend Transport; Thu, 5 Aug 2021 09:13:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bdcca708-7f92-45b0-1d2c-08d957f13f93
X-MS-TrafficTypeDiagnostic: DU2PR04MB8568:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DU2PR04MB8568D78AE0F3B9F7DBAC145F80F29@DU2PR04MB8568.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:238;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Cx+QJb7469OSzgnlhh70zqzXQaQdtOUUfS5OrCM5uMkRDyG5RVILRnEm5cPXgTj4HU2ZhO6Pm9U8+WECWJHs7MYGf/0W8OUzPpf/PvHNXNVymWyF9/J6hX9GEhV47OM4AaiNCOejqKDqU9uGYgSx4VNk/wi4KatyRnbX5mHmasu5gfmDiIh3/GESKh+HebT7fyuSXeGxC6wcGMNLVGCcR3uiJw1wBPbr/t4aopahi3jrFDe9WTiVnyjlPFVDgbczUyRm7L7bxhohBIPL45+thui35YOcrowxEQOCBJZ5EW7RKVCAXlncxj+odkdxPsMMYg4vWBDBp6nFhIcuvPLeYt5nEU6+FGkBT+NBTgDZK058wePZi1XfOGkc1N2nOwomt6WHJZtCqqMfyyqRD7YQ+hCljgiWv+DdFxJSrgkzF+/ZK5CKXSb9K0lOJZDF7ENkG03SweRVr+8sKWCkxn/LhG6IpHtjF5HXaWcJjUxmqEp/RZ1CYPogmTpRtezPjDjxWAYNTXfXa+gMnglIS2Xi28t99mmw0J+Tv836h0WyvlgXDjORv8Ukq6UawmAdQ4D3/l1AWHD3YlFuBwvokStrioNewucSNvS34GnMtYeP68Xuq3r4unbT6uvPiRU4Z9SMfU/HkZNsvUW33e7VB4Yib8H/OQjj4r6Hedh4G8SDRINeQ5wptqMe+isBaj47Bhntr91JcoLQoUcIi2Gh7Rw0YQPtKPczSZtUKwVxtBtK418=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8477.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(39840400004)(346002)(136003)(396003)(38350700002)(38100700002)(1076003)(66946007)(5660300002)(66476007)(66556008)(52116002)(6512007)(956004)(2616005)(6486002)(6506007)(4326008)(316002)(186003)(26005)(83380400001)(2906002)(8936002)(8676002)(86362001)(6666004)(36756003)(478600001)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?746JPMdJbHmW1QYJB2wVE51x3TvSmP4q3djeK47YjjFDQUh7hM1ODTt2yz/y?=
 =?us-ascii?Q?DAy8Ka/4nidlDAY6nBByTL/Q88oYOeyRH6IA2hAL3Wc/aMYmX7PpxePreTb5?=
 =?us-ascii?Q?387QTcexJeLAAwORsBAx3nAouwiR7VBF9P6/Yz68jt2ZUl3h+R0xpLRUiuLT?=
 =?us-ascii?Q?zVt2dfPiK6opmSSM8Cy+FaLnaA79+0lD8fNJXwObRY6uZBTyVkrZkSWWVa45?=
 =?us-ascii?Q?LuugKLz5o8sqsgVgVbvz02VHQsNqOgTx0cKSghI6SKCb9S1c2RztWrfaDNrp?=
 =?us-ascii?Q?kBJaq3D2yoxUeZSD6gkPImWQKsN1W3k3kHBNH5xAcs0LME18DwX1b6FlvanW?=
 =?us-ascii?Q?uH/eb0JuHOjhHs1l0Awdv8+wVADTvnwd7z+teqcZwCXRyW0xQDAhIJcDPLGP?=
 =?us-ascii?Q?93QH1E8GRSXlkgkf2jw34DeIPy/a4TfW1uMkIn+e7m/+iop6BG0U08hbHJCO?=
 =?us-ascii?Q?wLaDpWOe7xNZROCNfF1eLhSR5+eE8i9HQ/Lvo8Pu5rZiwESna4YxZ8NYNi2C?=
 =?us-ascii?Q?hqk7fCmEVr3s1wXejUVRrlhXiByX7d0079L/l5GASweqzkxPV7vj4jAwefxv?=
 =?us-ascii?Q?obiKueHxQecZ+WUaOxx02CDCVK27i5u1dgjQ0YEeZhD+8D79qQ+3WBDJ6nB2?=
 =?us-ascii?Q?44d23uVE39MVB4Utzk/iLe2mBVDxOcb1Ae6OWIWexcSg9yN1vPyV5oS/y5sh?=
 =?us-ascii?Q?MfRf969/tWj6TVV3XuH75dtEJHTROo+7HMHhK0cZTRjvyOIzu6KzgWpW7nuD?=
 =?us-ascii?Q?cO0CKsyzAMshwbRSU35yCj5LTjnztLG+MEE53ql+oIY8KKgVAv3Yzkz3NI7L?=
 =?us-ascii?Q?PuujH9kWMDqz8Se5Qj2Nh1/uhmxLqSQM6wELnMj5zpHKdbmxYpaai9wn2yAI?=
 =?us-ascii?Q?8UNFn5HQljc+PbMTDarS2g1lmL0OWyB1vvZ2Y37GY4GwHfd+BDWbVEVKDA0j?=
 =?us-ascii?Q?2whn4ZswJBSGvDJAVgi/pjnxs1V7/lDUaZxQmfIhJdz0QEddyEAFjboXm5Bt?=
 =?us-ascii?Q?+yQM6FPzn6Hrikl8gOMCqXJFFHk9/apyUPtj+7pqDCPUMkARIBcpQHu8KwCU?=
 =?us-ascii?Q?G4heX0O1U176+tYrkmbEppMJdmJyGK9+PZE9pyVhvOYu+859PxWyYVC39Wr2?=
 =?us-ascii?Q?MWi7wPybpmf+QSWVEVqUNqqLdfsrDTifYx/N3c4Ot+WiVznvcz83st0zF0a4?=
 =?us-ascii?Q?BD9GI0k+CevZS8SJciaV/JYYm+wigOnnRZs/dJqlb5uBi6AJTGrObKySBErG?=
 =?us-ascii?Q?az/NW4d2OthxxELgPfXIGaMam4d5tpVd97tEQTNXZks+oWAz0Mnh416OD4jC?=
 =?us-ascii?Q?CSPGJjXszgdO3G0KZkXQsHHD?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdcca708-7f92-45b0-1d2c-08d957f13f93
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8477.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2021 09:13:11.6788
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bl+GTJ/av/T1CFkxjwnxfT+PC8TfV8Z4mt6i/BTrBivVCATCjYytOuR0kt11DY1r/Rotc+gJyjOyTqbx0ADVUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8568
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add cm7 remoteproc which supports rpmsg naming service.
It needs vdevbuffer and a pair of vrings and 16MB reserved memory.

Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |  1 +
 .../boot/dts/freescale/imx8mp-evk-rpmsg.dts   | 78 +++++++++++++++++++
 2 files changed, 79 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-rpmsg.dts

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 687ad9d68a85..e5f4d5779afe 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -47,6 +47,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mn-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mn-ddr4-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mn-var-som-symphony.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-rpmsg.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-phyboard-pollux-rdk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mq-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mq-evk-rpmsg.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk-rpmsg.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk-rpmsg.dts
new file mode 100644
index 000000000000..35c0a8d5501e
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk-rpmsg.dts
@@ -0,0 +1,78 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2020-2021 NXP
+ */
+
+#include "imx8mp-evk.dts"
+
+/ {
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		vdev0vring0: vdev0vring0@55000000 {
+			reg = <0 0x55000000 0 0x8000>;
+			no-map;
+		};
+
+		vdev0vring1: vdev0vring1@55008000 {
+			reg = <0 0x55008000 0 0x8000>;
+			no-map;
+		};
+
+		rsc_table: rsc-table@550ff000 {
+			reg = <0 0x550ff000 0 0x1000>;
+			no-map;
+		};
+
+		vdevbuffer: vdevbuffer@55400000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x55400000 0 0x100000>;
+			no-map;
+		};
+
+		remoteproc@80000000 {
+			reg = <0 0x80000000 0 0x1000000>;
+			no-map;
+		};
+	};
+
+	imx8mp-cm7 {
+		compatible = "fsl,imx8mp-cm7";
+		clocks = <&clk IMX8MP_CLK_M7_DIV>;
+		mbox-names = "tx", "rx", "rxdb";
+		mboxes = <&mu 0 1
+			  &mu 1 1
+			  &mu 3 1>;
+		memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
+				<&rsc_table>;
+	};
+};
+
+/*
+ * Below devices are allocated on remoteproc
+ */
+&ecspi2 {
+	status = "disabled";
+};
+
+&flexcan1 {
+	status = "disabled";
+};
+
+&flexspi {
+	status = "disabled";
+};
+
+&i2c3 {
+	status = "disabled";
+};
+
+&pwm4 {
+	status = "disabled";
+};
+
+&uart4 {
+	status = "disabled";
+};
-- 
2.25.1

