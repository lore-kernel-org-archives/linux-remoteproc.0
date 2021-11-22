Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B95FC4332F
	for <linux-remoteproc@archiver.kernel.org>; Mon, 22 Nov 2021 05:39:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232108AbhKVFmS (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 22 Nov 2021 00:42:18 -0500
Received: from mail-dm6nam12on2053.outbound.protection.outlook.com ([40.107.243.53]:60001
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231345AbhKVFmQ (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 22 Nov 2021 00:42:16 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=POOne0ecwq+9rtUD34EUfY8kb0kAOugf2rWIXZKe+gzrHHEV6mIADj3SFvyDC2YQv4xBF014rRYHw1m8n9eAcFOQhLu37aWgjalc2tSyrmCaxsi/EHPabIbvDaE1q8a2jmyRSKYvvk1EhWlsZrBqPTMWKSwj1Tt7VzANieTKmqoZdkLXmArpUcFCw2eI6FwAnaQ2f8egWNZm/Rd7l3NmttLYAB6O1NG3ymlzdLXxTUv0J+/KgBQa0MCxN6qT8ve2bf/d+cKWu5TFPsed/EvW266nEvT9Pbuz3tCC+DvgZmIne68KUviWTE096ABad/KOOJpTZU7kTPgqcIJ/5T+ABA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kn8F0jpju3518UgNpMdQe/zQbXpLl0+j5fi7IsGsYC0=;
 b=O0HLQOlDLwYnWuIz+y2Ip1qQDNEkMuRV3pbUI8LThQV8qeAu6zyUq4Lk6u2qty5ZXFfXaur1Qri5ZHU4r3O2HAF1IGndZcc88Xx9fIjxLErYc+6LqGrkXEw+826grYIb0X4ZiBYw1LGzJaD+HhQkY3GKdIES3avJh82YpHNSiLGP23A41Mx8s4V0oYqfEMC/T0Uf22v8JSKIkLd/dtb1gF8mDVOTVm44UdNkJms0AI+YCm5PgE7k4LMdoulh/zIAr3F2EO5+8xZOC9kyKVkoXrhtTeTQgJzm6nX6J5A07tgMGUN6blXP52ONd83bdUAE6Iql+yWK7By6FItfucJv6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=linaro.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kn8F0jpju3518UgNpMdQe/zQbXpLl0+j5fi7IsGsYC0=;
 b=YuWRZJStD14SO+lwUwmlfLuXTvkNXwmCfm/keGioLJRq7SjbQlgTqDPUxwbQRmIll2oFfj0I3iMO+mK1uoD7po4mY8k4B5dEkXncfw7G+sziayg4GpJud9AB5MztpK5JfvWZ8n/cK3PaIIwWxUOFIZ/LtyV4fSB6INslyFFO9wI=
Received: from SN4PR0201CA0050.namprd02.prod.outlook.com
 (2603:10b6:803:20::12) by BY5PR02MB7075.namprd02.prod.outlook.com
 (2603:10b6:a03:231::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Mon, 22 Nov
 2021 05:39:06 +0000
Received: from SN1NAM02FT0048.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:20:cafe::a4) by SN4PR0201CA0050.outlook.office365.com
 (2603:10b6:803:20::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21 via Frontend
 Transport; Mon, 22 Nov 2021 05:39:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0048.mail.protection.outlook.com (10.97.4.223) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4713.19 via Frontend Transport; Mon, 22 Nov 2021 05:39:06 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Sun, 21 Nov 2021 21:39:03 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Sun, 21 Nov 2021 21:39:03 -0800
Envelope-to: bjorn.andersson@linaro.org,
 mathieu.poirier@linaro.org,
 robh+dt@kernel.org,
 laurent.pinchart@ideasonboard.com,
 bill.mills@linaro.org,
 linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Received: from [172.19.3.14] (port=59046 helo=xsjtanmays50.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <tanmay.shah@xilinx.com>)
        id 1mp22h-000BOC-8K; Sun, 21 Nov 2021 21:39:03 -0800
From:   Tanmay Shah <tanmay.shah@xilinx.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>
CC:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ben Levinsky <ben.levinsky@xilinx.com>,
        Bill Mills <bill.mills@linaro.org>,
        Sergei Korneichuk <sergei.korneichuk@xilinx.com>,
        Tanmay Shah <tanmay.shah@xilinx.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 3/6] firmware: xilinx: Add ZynqMP firmware ioctl enums for RPU configuration.
Date:   Sun, 21 Nov 2021 21:38:53 -0800
Message-ID: <20211122053856.1342859-4-tanmay.shah@xilinx.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211122053856.1342859-1-tanmay.shah@xilinx.com>
References: <20211122053856.1342859-1-tanmay.shah@xilinx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e35d38aa-39f2-40a4-aac4-08d9ad7a6637
X-MS-TrafficTypeDiagnostic: BY5PR02MB7075:
X-Microsoft-Antispam-PRVS: <BY5PR02MB7075C412BF83671755EE04AECA9F9@BY5PR02MB7075.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:525;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Rl7vuMPQJQbR1V1Fm2YcqIBGdL7SRXX0Goll+B7ywb8xTcIlawAgYU71DnSRlwxT+CcooyC5MNCTke9uRGIJWh6Z64eH7hyWkOQ/VyIHRCJh0A9ZtX3160XdRD3KZ3ckarxcVJNuUcV9H5GBLhzdjJ5Y+AFXl2A+sI3yeFAhOwF87okYVrSZN5ouxYyxAYPII0xMHV4+70eBOI6CNcPr68yyM28S8tr3jdsXjgymuFRA5WB3Qshmv2ye1XL4GhYI0+JwAYr6+BytUAw0cXOJu1Xmxq7p/PrAwsfKiTpvexjG9NR6TM+EvCMRU+9LszCcLfS+StPye0uqnuhpWFzPZXGiuty+Q5w7ntVcUReHV2+6mVmfmJYQfz1vvwiWLgrjSQso7fgASRvFX4xAn8F1bBPpANmdQghX+VbFF1dhTTwEiYbJJFd6MtUVSNtZTdkwgIGnWt7t8kG+ly5PXpbUZfFtyYboH4/VBQjMm2HpvfxsRodXbVPI4sG0sbKtLjWztWmZnXnxcKnow4u6NhoIULadTwkDw4mLdqOwoTvFYrrzk40xXOIg9MM9PUFQ58kNceKyhTl8NTzVWs2HN79rBiS0lDnvL653R7e+kmxXzdBGI57/YSCUsaiPNk8uNT5gdPFdf7EoN2pfv/YhWT7IU+8z9FXElOzbd+MNcsKGWIW27pmczQp/OwCfzHrX/7f3Et+Fed4O/B1UZlX5xuCuyfeGWMS4iVwwhFxq8+mP28o=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(46966006)(36840700001)(336012)(44832011)(83380400001)(36860700001)(2616005)(426003)(9786002)(186003)(356005)(70206006)(47076005)(7636003)(8676002)(8936002)(26005)(2906002)(508600001)(1076003)(36756003)(54906003)(70586007)(110136005)(5660300002)(7696005)(4326008)(6636002)(36906005)(316002)(82310400003)(6666004)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2021 05:39:06.1365
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e35d38aa-39f2-40a4-aac4-08d9ad7a6637
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0048.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB7075
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Ben Levinsky <ben.levinsky@xilinx.com>

Add ZynqMP firmware ioctl enums for RPU configuration and TCM Nodes for
later use via request_node and release_node

Signed-off-by: Ben Levinsky <ben.levinsky@xilinx.com>
Signed-off-by: Tanmay Shah <tanmay.shah@xilinx.com>
---
 include/linux/firmware/xlnx-zynqmp.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/include/linux/firmware/xlnx-zynqmp.h b/include/linux/firmware/=
xlnx-zynqmp.h
index 56b426fe020c..92bf3ae20524 100644
--- a/include/linux/firmware/xlnx-zynqmp.h
+++ b/include/linux/firmware/xlnx-zynqmp.h
@@ -111,6 +111,10 @@ enum pm_ret_status {
 };

 enum pm_ioctl_id {
+       IOCTL_GET_RPU_OPER_MODE =3D 0,
+       IOCTL_SET_RPU_OPER_MODE =3D 1,
+       IOCTL_RPU_BOOT_ADDR_CONFIG =3D 2,
+       IOCTL_TCM_COMB_CONFIG =3D 3,
        IOCTL_SD_DLL_RESET =3D 6,
        IOCTL_SET_SD_TAPDELAY =3D 7,
        IOCTL_SET_PLL_FRAC_MODE =3D 8,
@@ -142,6 +146,21 @@ enum pm_query_id {
        PM_QID_CLOCK_GET_MAX_DIVISOR =3D 13,
 };

+enum rpu_oper_mode {
+       PM_RPU_MODE_LOCKSTEP =3D 0,
+       PM_RPU_MODE_SPLIT =3D 1,
+};
+
+enum rpu_boot_mem {
+       PM_RPU_BOOTMEM_LOVEC =3D 0,
+       PM_RPU_BOOTMEM_HIVEC =3D 1,
+};
+
+enum rpu_tcm_comb {
+       PM_RPU_TCM_SPLIT =3D 0,
+       PM_RPU_TCM_COMB =3D 1,
+};
+
 enum zynqmp_pm_reset_action {
        PM_RESET_ACTION_RELEASE =3D 0,
        PM_RESET_ACTION_ASSERT =3D 1,
--
2.25.1

This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.
