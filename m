Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F165DC433E0
	for <linux-remoteproc@archiver.kernel.org>; Tue, 23 Feb 2021 15:46:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C71EE64DE8
	for <linux-remoteproc@archiver.kernel.org>; Tue, 23 Feb 2021 15:46:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233340AbhBWPp6 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 23 Feb 2021 10:45:58 -0500
Received: from mail-dm6nam10on2072.outbound.protection.outlook.com ([40.107.93.72]:54542
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233313AbhBWPpt (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 23 Feb 2021 10:45:49 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D9AAw1uaGBAIHVudafQcgKQTV2O2rU3aZSxFKEIebxmZ71b5oYYAJMDZAb80W8OXk9o75oErxKTqrKQi6wdn/vbtxnI9OQRaLQQLQeppGS4T/WuN9MVxOgf6Whpyv45Ttd+xjE5mLxYwP0wPWJqp3XoSOg4xiSW43hd1bpoGP2endLQHWhBKWatH4QuA7UAXT4SL98T0t2YzYvR9uXAuVT2Cuy1g6Z3OMwQ2UFPV8tLu8m48i8Uwjk2S+CBJCPPy9dx6lK89LMbxJv1Xs4MmozgN4pFBACmjGNezIUixADutbY9JE7O+WHdVIicUX+zPPElVkUY+kom8lt7qmRwdaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jYIeQpzyVpt1bQOQiAd2rj0avg9N9KkuqLNxbzqangA=;
 b=bkhP9dbuKsYTPVbQ5bsfQjaSrJfjPrvGibfMSqjGxQHKYCzglEhaAw1yP2YsiXz+G4B/TasuiYps6lyyWfdTO+EXUNtEigYEVnDf+9CPQEghfM20NYVrD52tqjOeH3LORlnKEJZDCUCXIdMjPrtRp0ZnT4+lrb0ilkecUOOjp/5h441/MMEViFeNkO0qmKaSGExduX5jtv7vopx1Ciy+/r1wttdFwY5r4nyNanLCeQw47f5Guko9AMXeL5eViBUnVRvXqAyzZcFQYQuhgd000i+o/38vdeTCLAQeqtuLCw3pWZ3fXQNS6A4hrz42lrX5V4f1WZOuC3nGin3X8PSuwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=linaro.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jYIeQpzyVpt1bQOQiAd2rj0avg9N9KkuqLNxbzqangA=;
 b=fdmNhWzXBBSMPfHNkSuRDFoWWdwvpgrWNgD6txppAKd/Sa2xrNB2zOdpKy37nxRhGy61l4g3Obs6DyT7LsCs8tLJhccYBtdFiaxjDiHPe4CCJB78inBcIb3VaxS9AWUxhQNFVMDoANPc6Xr0/JH96fmO98G2GuLxdegrjFeS158=
Received: from BL1PR13CA0066.namprd13.prod.outlook.com (2603:10b6:208:2b8::11)
 by BYAPR02MB4455.namprd02.prod.outlook.com (2603:10b6:a03:10::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27; Tue, 23 Feb
 2021 15:44:53 +0000
Received: from BL2NAM02FT057.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:2b8:cafe::a3) by BL1PR13CA0066.outlook.office365.com
 (2603:10b6:208:2b8::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.9 via Frontend
 Transport; Tue, 23 Feb 2021 15:44:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BL2NAM02FT057.mail.protection.outlook.com (10.152.77.36) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3868.27 via Frontend Transport; Tue, 23 Feb 2021 15:44:52 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Tue, 23 Feb 2021 07:44:47 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Tue, 23 Feb 2021 07:44:47 -0800
Envelope-to: michal.simek@xilinx.com,
 mathieu.poirier@linaro.org,
 devicetree@vger.kernel.org,
 linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Received: from [172.19.2.206] (port=40282 helo=xsjblevinsk50.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1lEZrj-0006uk-8d; Tue, 23 Feb 2021 07:44:47 -0800
From:   Ben Levinsky <ben.levinsky@xilinx.com>
To:     <mathieu.poirier@linaro.org>
CC:     <devicetree@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <michal.simek@xilinx.com>
Subject: [PATCH v26 1/5] firmware: xilinx: Add ZynqMP firmware ioctl enums for RPU configuration.
Date:   Tue, 23 Feb 2021 07:44:43 -0800
Message-ID: <20210223154447.13247-2-ben.levinsky@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210223154447.13247-1-ben.levinsky@xilinx.com>
References: <20210223154447.13247-1-ben.levinsky@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a1f1468e-cb52-4061-56e8-08d8d811f646
X-MS-TrafficTypeDiagnostic: BYAPR02MB4455:
X-Microsoft-Antispam-PRVS: <BYAPR02MB4455586B590D0A9051407F84B5809@BYAPR02MB4455.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:254;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0blNoj4i821hHPjJizIhvV+Y8CxT1Q3TyTd2nDkqpCPc9OL4z3RWZbwMu9/rt85UBfjUGrNCubkIcV5KfPRk0MlsVmTQCFtcenXBQ0vLPksE1pejZmi5VGkqjXQUc4vUZ4txsN5WYNt/rERjJzGg3dh9QfuFYtp8vZYiyHdkrcn7G/joO2RHgJ5wLDjnb//uFHCyuuxmA1aqxqdhaWTAL2yV/u/UuGqGCwL81Ef+XqFW9Mkk39WBKCPEQCZ1YYFu4Fn9bWnGpNMgKlYPUJk6EZqHdN+BqxgV+ujkyvv+mN7yPa60LjardjUujTOG8+td4WgLkrJg7BZSQBR/DpfOTj+CpJAtVMIX6+QtKrhtJlyeVvEjLRiDnsLJu03+dFTWb38DToMXIhjlyyvgVPXxuBj//LOHT9qmtY6hyX/XIYom1CBSS7q1qh+RhEvRJ9vJ6jvglodrGhedhw2PXsFJZnuU0c4QiZNhLmZ6rFzg+ddefOc20yuJr4dNDkGamvzSpXuxrUJfE3PMTd3kwGuxhOotBrMvedJCGCLpkg7vRu+O8AlS7Fs1kJktMOSzpSAU6EF00MixKxrI1yaLd3gQTQDTFTK8a5vOhqVqjv0IjmYpM7QBZcSswPxKNlvO4YUXjxEHgTum/7uuaNtdLAX+pMpKopzrJP3qMfhTh9se2B6GPLua9AOBsV9W7Fq9wEuj
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(346002)(136003)(376002)(39860400002)(396003)(36840700001)(46966006)(8936002)(82740400003)(8676002)(82310400003)(36860700001)(26005)(4326008)(6666004)(5660300002)(2906002)(1076003)(54906003)(316002)(36756003)(70206006)(36906005)(186003)(356005)(6916009)(2616005)(83380400001)(47076005)(7636003)(426003)(107886003)(7696005)(70586007)(478600001)(9786002)(44832011)(336012)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2021 15:44:52.9364
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1f1468e-cb52-4061-56e8-08d8d811f646
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT057.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4455
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
index 5968df82b991..e4044cae0713 100644
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
+	NODE_TCM_0_A = 15,
+	NODE_TCM_0_B,
+	NODE_TCM_1_A,
+	NODE_TCM_1_B,
 	NODE_SD_0 = 39,
 	NODE_SD_1,
 };
-- 
2.17.1

