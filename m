Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6D84C4332F
	for <linux-remoteproc@archiver.kernel.org>; Tue, 23 Nov 2021 06:21:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233775AbhKWGYJ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 23 Nov 2021 01:24:09 -0500
Received: from mail-dm6nam12on2081.outbound.protection.outlook.com ([40.107.243.81]:42276
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233650AbhKWGYG (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 23 Nov 2021 01:24:06 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fUzEMjfgzNYTHQtZLPE/nwMHPifrSVcXQzd/vYZwFws+vxGxuB8S2zG29Wrtk5aJ8rCN6aGEL5FWg56lmWYu5YtC6Fu7ysqc+EIUPfZjU35bb68OpuVIfpUg+bWmRwGIQAOowxl2WGZNY+rQ3kXiSUmVUQIIOdEtGQiMweQqzOGLLDxFKZOx9pP9qcy3d0kFLGOG4WPWsJ9TL46JQRLVcBVenndXZTyKIqKYjDWs9wR98JmOOEJxAei1ck7XFEK94cvGOYXpDigjD3yQCdN8+evpnh+BWJt1VvQO0DbNzJzBIqzQpS7yEwMcdfvl2gNCVM1RKvHXfRQKNG5VD3otmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WwtMsotdU1adb1UNXyWOgIh5UNRAKrlqBFtglLEOu4E=;
 b=VFuFOl5u2ogZ5H0W9CVFMD+NkBKR5cjzg9cvHEM6baPGY0/wyCQ5DyjikmUMw9XPuETeMHaTzkuXlaCKkiNMvnRdCjZMHr7XD3XcMbzLFmFlzqZRV4UnctilQQ1EKK1nUZAL4ABxZJIWkOCv8zIyx9AQzjwZECx6mQ+fSoGVJk1GLEPV6uQvVAiNvQErlB6Xh1gsSlQ76iAJrm2YwgsxIZuq5bodh0zWs3pXF+YJ23kA/EIRwgDVvgfXvE5BxV2onygg+S40rGVX7w4e3fbhbtZTi08uIukDK7ffaRQ/3ZhyH1wycVaecueVlPCnbCj4f2Shn3QDlhtW5smgy1zIxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=linaro.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WwtMsotdU1adb1UNXyWOgIh5UNRAKrlqBFtglLEOu4E=;
 b=a7mt8jdWPuRYedKSn/4661o8UY/X0SSWSeLqccpGIGgQklqhA8Pxmz0m3xDDcB/jadWHtnPRF7/53hxtg28ba0u9RATNo0B2l+OoHfh2x2hqG+6NxPTPgQdEN0EZPgZN6oYlfBA/vDAkr7LayC5QWjjVnV42EIP5zYcpuaZz4L4=
Received: from BN6PR11CA0005.namprd11.prod.outlook.com (2603:10b6:405:2::15)
 by SN4PR0201MB3552.namprd02.prod.outlook.com (2603:10b6:803:45::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Tue, 23 Nov
 2021 06:20:55 +0000
Received: from BN1NAM02FT020.eop-nam02.prod.protection.outlook.com
 (2603:10b6:405:2:cafe::1) by BN6PR11CA0005.outlook.office365.com
 (2603:10b6:405:2::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.25 via Frontend
 Transport; Tue, 23 Nov 2021 06:20:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT020.mail.protection.outlook.com (10.13.2.135) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4713.19 via Frontend Transport; Tue, 23 Nov 2021 06:20:55 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 22 Nov 2021 22:20:54 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 22 Nov 2021 22:20:54 -0800
Envelope-to: bjorn.andersson@linaro.org,
 mathieu.poirier@linaro.org,
 robh+dt@kernel.org,
 laurent.pinchart@ideasonboard.com,
 bill.mills@linaro.org,
 linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Received: from [172.19.3.14] (port=33042 helo=xsjtanmays50.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <tanmay.shah@xilinx.com>)
        id 1mpPAk-0001Zw-0l; Mon, 22 Nov 2021 22:20:54 -0800
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
Subject: [PATCH v2 3/6] firmware: xilinx: Add ZynqMP firmware ioctl enums for RPU configuration.
Date:   Mon, 22 Nov 2021 22:20:47 -0800
Message-ID: <20211123062050.1442712-4-tanmay.shah@xilinx.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211123062050.1442712-1-tanmay.shah@xilinx.com>
References: <20211123062050.1442712-1-tanmay.shah@xilinx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dbeb69bc-90f3-4585-60d0-08d9ae496833
X-MS-TrafficTypeDiagnostic: SN4PR0201MB3552:
X-Microsoft-Antispam-PRVS: <SN4PR0201MB355243334EA718864F3199EDCA609@SN4PR0201MB3552.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:525;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Sy8FOokccGVn4wZN1PdZbQBoFuZ1LsJswKySQD7sS5ya8v9HVeG8Qh1F95faCby0BDrVFz1+rXR7txgYoEGbwnTer1jWLZu2363T9v5Pz+RjwNyWqhBCJTYiJVVosQhSlrx3NNpDhygWXfmCCzUQ1/SnUGez4HZlnwOq/ieuoTJLuQS6Q8gG9vBOqiLoRd+bqOfOQsfBr1811WtcC3e8cN6c6K9ZMDMO5eErTMR9c24Zxayl22mCgOBRpq3bLj0eRi1dOpmpRfVU5MYPHk0YG+Y0D80KWPUfzyG3Ru2n2CyqqtDmb7ihgZcVI0raLvdH4wLqDUXvbbK2vFzi9iCl+kjnCWyW/XZfojeqeCZOZexPUpxp3q4SDgoarOMNQKhWwvYhEgGuqk/eLqFMqy+wrK2lk58AdmtmgkYToIerKBLeJT/iDljcWH/9MMRhsUG2ohNBFmdoSL/gQuvURvRZ8kcUiEsl5VUAvx817YdC8AfV1gD7DRHS/KfZIFa6dkA2n0P/41r45PXrtvsfxnPAT9cE8Ax7BkbkMMYm5wqWyXb56zEVQIaasNRnQKSpHLAtXnOu62SBwYBlnUs/50aKlyaAIlXw+yHEXPeQRGTX/HfK5+aQlJvoRBG6kKbHEIDJJalotjDgZ+cQcAnYej1ulnI85eFLqfES1nGiVsSHvhP3c2YoWiioSx9/hsY/aBwiHQjGAff71PrkJ8ZnzMWLSbAY/fFcoKwAWjlcUJlInFc=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(36840700001)(46966006)(1076003)(83380400001)(36906005)(7696005)(5660300002)(6636002)(7636003)(316002)(36756003)(110136005)(426003)(8936002)(6666004)(82310400004)(44832011)(2906002)(54906003)(4326008)(356005)(9786002)(186003)(70206006)(8676002)(336012)(26005)(36860700001)(2616005)(47076005)(70586007)(508600001)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2021 06:20:55.2189
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dbeb69bc-90f3-4585-60d0-08d9ae496833
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT020.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR0201MB3552
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

diff --git a/include/linux/firmware/xlnx-zynqmp.h b/include/linux/firmware/xlnx-zynqmp.h
index 56b426fe020c..92bf3ae20524 100644
--- a/include/linux/firmware/xlnx-zynqmp.h
+++ b/include/linux/firmware/xlnx-zynqmp.h
@@ -111,6 +111,10 @@ enum pm_ret_status {
 };
 
 enum pm_ioctl_id {
+	IOCTL_GET_RPU_OPER_MODE = 0,
+	IOCTL_SET_RPU_OPER_MODE = 1,
+	IOCTL_RPU_BOOT_ADDR_CONFIG = 2,
+	IOCTL_TCM_COMB_CONFIG = 3,
 	IOCTL_SD_DLL_RESET = 6,
 	IOCTL_SET_SD_TAPDELAY = 7,
 	IOCTL_SET_PLL_FRAC_MODE = 8,
@@ -142,6 +146,21 @@ enum pm_query_id {
 	PM_QID_CLOCK_GET_MAX_DIVISOR = 13,
 };
 
+enum rpu_oper_mode {
+	PM_RPU_MODE_LOCKSTEP = 0,
+	PM_RPU_MODE_SPLIT = 1,
+};
+
+enum rpu_boot_mem {
+	PM_RPU_BOOTMEM_LOVEC = 0,
+	PM_RPU_BOOTMEM_HIVEC = 1,
+};
+
+enum rpu_tcm_comb {
+	PM_RPU_TCM_SPLIT = 0,
+	PM_RPU_TCM_COMB = 1,
+};
+
 enum zynqmp_pm_reset_action {
 	PM_RESET_ACTION_RELEASE = 0,
 	PM_RESET_ACTION_ASSERT = 1,
-- 
2.25.1

