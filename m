Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2564DC433E0
	for <linux-remoteproc@archiver.kernel.org>; Mon, 11 Jan 2021 02:04:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DA2C7227C3
	for <linux-remoteproc@archiver.kernel.org>; Mon, 11 Jan 2021 02:04:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726987AbhAKCDp (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sun, 10 Jan 2021 21:03:45 -0500
Received: from mail-bn8nam12on2086.outbound.protection.outlook.com ([40.107.237.86]:22592
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725797AbhAKCDp (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sun, 10 Jan 2021 21:03:45 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X40jvEPcjVCs20M0URr1J8ekYo8pHHSUu3PTVYDacxqruO3mN0uKAwNx5PBArl71PV0vRGCXrwcALLlzoNkasnxSJhYKFOys/pol8AdH4VS5PPL3NUno5NFguduA8MUYW5ryINNv8c4YdRFB5McoPx/qEei0qUZLro/8z7G5oVz6RMqUj0nGxPMYDBkFVJ2Dsy+apqg8RB5uOqJsho6gD+4bu/89BGFrW9f5d9WvH268kLManm2UFlXCPzVdZTDlYUvbfBKbLulniQuONLocCRFcQuVFV2mnQ3axFQrDCxlg46NWrmJ8RcLwTKiUfa/5qHlpySWWl/pPFw8lnwOxEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h2B+9Uqfd81dc+7pajMmaLe0MtmL3pEw+LU0iWAYq+w=;
 b=PvP1N67FR45hqOfmA3fOvNXt9dEAZDgHnhgK/dGs15VUWv4OygWARN8SW5vAclbj94BnWMYvgrdPmiRZ3EiEug9civ0lZ/uzy1oZLroX17hDIp8FmHf+b9f5Hf4YsQ1vyZQw+/5dqoOvlBW0hA5jFJ49vjYEkdmPpZkZEbjrl4wLzs30ox+E+v4QTLNi/QCSUawGFBcVg1ddahqCKLhbwxfrFW1vwO1k8g1OvRL11ULeD/BRBc48wTEp2Z5W+XuFTG6ueFbVtJiwDWfhMV4lGpqgGM44aLgkpInhSlpx8FkGjtk5msFdazWhmmeGh5ZyZ8RFmzAFOALv8iBohs/3bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=linaro.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h2B+9Uqfd81dc+7pajMmaLe0MtmL3pEw+LU0iWAYq+w=;
 b=iAH/c1mZabDiRtbOcw+NDmTBDqWh705PdkvAvuzyE7mJC9Chpw5qb4RjoSYwsBSMktdiZ3CCD+2xiQxNZnA1L2urg7XMmQG5FO4lyYA9CoqvvPLJqO9qlMv64kWmcftN7LJloU7DQk4Ca0MGkG1ai0po3N9LlnYgA3p3zALRtJU=
Received: from DM6PR08CA0043.namprd08.prod.outlook.com (2603:10b6:5:1e0::17)
 by SN6PR02MB5117.namprd02.prod.outlook.com (2603:10b6:805:6e::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.8; Mon, 11 Jan
 2021 02:02:51 +0000
Received: from CY1NAM02FT063.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:1e0:cafe::eb) by DM6PR08CA0043.outlook.office365.com
 (2603:10b6:5:1e0::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend
 Transport; Mon, 11 Jan 2021 02:02:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT063.mail.protection.outlook.com (10.152.75.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3742.6 via Frontend Transport; Mon, 11 Jan 2021 02:02:50 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Sun, 10 Jan 2021 18:02:50 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Sun, 10 Jan 2021 18:02:50 -0800
Envelope-to: michal.simek@xilinx.com,
 mathieu.poirier@linaro.org,
 devicetree@vger.kernel.org,
 linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Received: from [172.19.2.206] (port=48226 helo=xsjblevinsk50.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1kymXi-00008K-I3; Sun, 10 Jan 2021 18:02:50 -0800
From:   Ben Levinsky <ben.levinsky@xilinx.com>
To:     <mathieu.poirier@linaro.org>
CC:     <devicetree@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <michal.simek@xilinx.com>
Subject: [PATCH v25 1/5] firmware: xilinx: Add ZynqMP firmware ioctl enums for RPU configuration.
Date:   Sun, 10 Jan 2021 18:02:46 -0800
Message-ID: <20210111020250.6846-2-ben.levinsky@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210111020250.6846-1-ben.levinsky@xilinx.com>
References: <20210111020250.6846-1-ben.levinsky@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 07636979-66f3-47f5-3316-08d8b5d50040
X-MS-TrafficTypeDiagnostic: SN6PR02MB5117:
X-Microsoft-Antispam-PRVS: <SN6PR02MB51174F2887D310BDE166E082B5AB0@SN6PR02MB5117.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:311;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A3kaQKn7VtS10l1Tj9lsyNVwiqJsviujniRCgFYIzrknu29q/br4QVXgHvZ2Ole+dfPEaCQFrymRT7bPo1xSR6PkCv3vcUNg1qxQOQLgv2J0g8BjVguI00r43482d1sb4WZaQpgylA/B3lUvcqQnNHOvQN4FDGUFIWnOsUXjn+DMvWuGw1vl/xgbVELWM4NUutSmMAY7Rfh0Pr//APOdr9+EqykqaBJyY9500KRV1mqY6knK3/bj88KKypUSr8/7BsTrGKRONq+CXPKzrsqgwQOpBlA27/H9AiDTgQApuMWJ+1B3La1EJQXX9x5cGzhN4TK5AWzS1K/eKh2wsobdFd38XjMixLZo9GsUrK4+93lyc0vcq7JqwycYKokSW+M4gldRzSylpckhqwgRHFyH9Vnj2mVSf3v6AB8NhO87u4AewUu6eoNmkBcOXDsjGAdiWw0V2rimB9rg4bhHcOsVI7l56wYv4qgiyh3ElJG18CL/ZmreC9WJtLmMa0KqBvYvPnwQlM1H23vpy102ujq9mQ==
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(396003)(39850400004)(46966006)(2906002)(1076003)(34020700004)(4326008)(6666004)(186003)(26005)(36756003)(336012)(426003)(44832011)(2616005)(82310400003)(5660300002)(70206006)(107886003)(70586007)(7696005)(36906005)(316002)(54906003)(6916009)(9786002)(8936002)(82740400003)(83380400001)(47076005)(356005)(7636003)(8676002)(478600001)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2021 02:02:50.9174
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 07636979-66f3-47f5-3316-08d8b5d50040
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT063.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB5117
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add ZynqMP firmware ioctl enums for RPU configuration and TCM Nodes for
later use via request_node and release_node

Signed-off-by: Ben Levinsky <ben.levinsky@xilinx.com>
---
v25:
- update include/linux/firmware/xlnx-zynqmp.h style to match for enum
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

