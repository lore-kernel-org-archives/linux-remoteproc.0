Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E9C6C8301C
	for <linux-remoteproc@archiver.kernel.org>; Mon, 30 Nov 2020 15:58:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 415552076C
	for <linux-remoteproc@archiver.kernel.org>; Mon, 30 Nov 2020 15:58:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="ntBAhO1I"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728521AbgK3P6N (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 30 Nov 2020 10:58:13 -0500
Received: from mail-bn7nam10on2073.outbound.protection.outlook.com ([40.107.92.73]:10688
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728457AbgK3P6M (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 30 Nov 2020 10:58:12 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MXcaEty8PTCTAzoSJ8NztQDqJcWF6KDQmfZfghy2pHNImZKG818BcShNmhYr53VqU9wqsXWdNbA/KQIpke6w1FN/2st16QJLAcHpb6JgfBxVn2tH637Hp6GuWpLD2aReNdTTR/GQoPkSZw1SLneo9tqf88t5x6tpAdLRUP/0KwTVnos9w3WkxxTSAy04Uy7wkhMEVD3OkgtxUdpPv7JIkIIOPWCUJQV7N/KWxZ3hXG4niVOYGvTwtdDc4mWeW6ynBlyu8Geyrxg3J3AH8NQQ/4w7Swk5INED7OHlj1z6EV2co8Ut93M+HeVTzbvXkObzkAx5JR8WIS22mPGcwrwfDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bNHg6kZpmdHVEpaD1m9q2PUUB2Bn0L0H+Uu1ZctiVtk=;
 b=oHjDzVVEq2LX/tlbm4wJ/jbjETNal/7ekmJCRmnILgnDZ6sxJWA+FKg8xWEqvf709+Z+0JRdQh+khW7BUhRr0QicbxC9fDfGgfMlZvjSxmifoq8WU7MoGWBQjsS7uCFJT4OwIO00HHIMX8dFbiA9jDiD1fv3rnT7CrMFGCex2nhLxCq2ql1M6iB6wnxbhTigeh6mCGdFIpw3yUoxM58aP6/PdjIpduUnwKOgbUAFu5A2DPy1MSQRymEKEMM2+BQGcRXpi7MuZ81v7FTGtRfgYTaDAL0ESOmZ3is238cmWKSqJhiLMFr8d8/8l1YScKsfGmwjGQHOAbCKo3zEhdDSQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=linaro.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bNHg6kZpmdHVEpaD1m9q2PUUB2Bn0L0H+Uu1ZctiVtk=;
 b=ntBAhO1Irj6Jy7GgC50bUW7/gG9K8jmHo8VvSBkoVRnmu99Tizll/Uw7zqSzgSIY4zQID6Nx6EL0C4gGaXWNOaW9fMYM8hJzjEAamUNStC8bE9ymyf2FoFRYSFjAD9eEuPoHfw9XaLH1emUOtWzPKtDtH/UVEu+6Kli3VeIyk9o=
Received: from BL0PR03CA0014.namprd03.prod.outlook.com (2603:10b6:208:2d::27)
 by MW2PR02MB3737.namprd02.prod.outlook.com (2603:10b6:907:3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Mon, 30 Nov
 2020 15:57:18 +0000
Received: from BL2NAM02FT004.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:2d:cafe::e7) by BL0PR03CA0014.outlook.office365.com
 (2603:10b6:208:2d::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend
 Transport; Mon, 30 Nov 2020 15:57:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BL2NAM02FT004.mail.protection.outlook.com (10.152.76.168) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3611.27 via Frontend Transport; Mon, 30 Nov 2020 15:57:17 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Mon, 30 Nov 2020 07:57:17 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Mon, 30 Nov 2020 07:57:17 -0800
Envelope-to: mathieu.poirier@linaro.org,
 devicetree@vger.kernel.org,
 linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Received: from [172.19.2.206] (port=47338 helo=xsjblevinsk50.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1kjlYD-000342-7t; Mon, 30 Nov 2020 07:57:17 -0800
From:   Ben Levinsky <ben.levinsky@xilinx.com>
To:     <mathieu.poirier@linaro.org>
CC:     <devicetree@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v24 1/5] firmware: xilinx: Add ZynqMP firmware ioctl enums for RPU configuration.
Date:   Mon, 30 Nov 2020 07:57:13 -0800
Message-ID: <20201130155717.26008-2-ben.levinsky@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201130155717.26008-1-ben.levinsky@xilinx.com>
References: <20201130155717.26008-1-ben.levinsky@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 36e0c388-7d38-4491-9853-08d895489d01
X-MS-TrafficTypeDiagnostic: MW2PR02MB3737:
X-Microsoft-Antispam-PRVS: <MW2PR02MB3737BD83C372605FA1F0C9E6B5F50@MW2PR02MB3737.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:254;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KXzCIy3YE8ZYQk7NQwbeTlBell1TeePnwUNyt57QciOcXF57K/oYhuF9WSnoZrMESGz/WqE4Xe4YcI8tWJa+R3QOq5jZSWF3dRYmTmjHdqrG5qQDd4NKzQ+aQXXCn7I9wxQdskAIo0FIY+HJETN4trNxBlSM6etpInru91SGNyj6qP+ZDnux8y7hHfvke6zFOwl019S4JYJG60OmvcJPCgEyof2zHMYXizeLBrvLtGBHHWeJCeCKgtC5h2/ohHlUvFBscs6yRp5gtoZLIE7l7yt1Ncs7HxPOtzKmjHNWMfjR/8QvTaRHwHnnFfLZYC8bbTj8GDw+PiPUwqKHIMEhiSwDpZCHJKdQKyne5hhrPHTGpIPGD5GvmrveEM7WJYwVlMVzwc7MQy4FiBLjmvc7FrXMDUNypYjOVzlxbj2xRYs=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(39860400002)(396003)(346002)(376002)(136003)(46966005)(2616005)(316002)(36906005)(9786002)(70206006)(54906003)(478600001)(44832011)(336012)(4326008)(70586007)(5660300002)(7636003)(356005)(186003)(8936002)(7696005)(47076004)(36756003)(82310400003)(26005)(2906002)(8676002)(6666004)(82740400003)(426003)(1076003)(83380400001)(6916009)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2020 15:57:17.5777
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 36e0c388-7d38-4491-9853-08d895489d01
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT004.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR02MB3737
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add ZynqMP firmware ioctl enums for RPU configuration and TCM Nodes for
later use via request_node and release_node

Signed-off-by: Ben Levinsky <ben.levinsky@xilinx.com>
---
 include/linux/firmware/xlnx-zynqmp.h | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/include/linux/firmware/xlnx-zynqmp.h b/include/linux/firmware/xlnx-zynqmp.h
index 5968df82b991..0dd2d188f8aa 100644
--- a/include/linux/firmware/xlnx-zynqmp.h
+++ b/include/linux/firmware/xlnx-zynqmp.h
@@ -104,6 +104,10 @@ enum pm_ret_status {
 };
 
 enum pm_ioctl_id {
+	IOCTL_GET_RPU_OPER_MODE = 0,
+	IOCTL_SET_RPU_OPER_MODE = 1,
+	IOCTL_RPU_BOOT_ADDR_CONFIG = 2,
+	IOCTL_TCM_COMB_CONFIG = 3,
 	IOCTL_SD_DLL_RESET = 6,
 	IOCTL_SET_SD_TAPDELAY,
 	IOCTL_SET_PLL_FRAC_MODE,
@@ -129,6 +133,21 @@ enum pm_query_id {
 	PM_QID_CLOCK_GET_MAX_DIVISOR,
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
 	PM_RESET_ACTION_RELEASE,
 	PM_RESET_ACTION_ASSERT,
@@ -273,6 +292,10 @@ enum zynqmp_pm_request_ack {
 };
 
 enum pm_node_id {
+	NODE_TCM_0_A = 0xf,
+	NODE_TCM_0_B = 0x10,
+	NODE_TCM_1_A = 0x11,
+	NODE_TCM_1_B = 0x12,
 	NODE_SD_0 = 39,
 	NODE_SD_1,
 };
-- 
2.17.1

