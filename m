Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E17EAC64E7A
	for <linux-remoteproc@archiver.kernel.org>; Sat, 14 Nov 2020 16:49:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9B0DB22284
	for <linux-remoteproc@archiver.kernel.org>; Sat, 14 Nov 2020 16:49:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="NIik1Fyh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726631AbgKNQt1 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sat, 14 Nov 2020 11:49:27 -0500
Received: from mail-bn8nam12on2081.outbound.protection.outlook.com ([40.107.237.81]:15104
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726481AbgKNQt0 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 14 Nov 2020 11:49:26 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EirlKhWLkD5DxxQD2g9PS8uhJjgUv6oEimM7jFMOrj4W6zSgeYZ3/Gfk5/pWzp4/UeB5QUjhzq3iR3X6OwQKSzOrJKJ3I+cwJBF0MUbXngHWxBHa250ZvJ0k4Kkp8h2Gg2jE2HLg4oWMZ8KqwBhOsNMdnj6YaoYR3NoUYTP9BtWMgfi7SfuUoN5igq4eqYALTQDapg7Pmap6PDy6FMn53mOdEOAiqLke8FftLkp50IGXpVH9VCLC6d2ZPCgF171/NPqBZG+U5UIzDx10+9dkS0o8OQzREImJ4t3hfm+yCOUOdP+Aj547QEoET9HjTgHN1QhwdDizvp6nV1eA+bxJIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6HLNS3qf3SWei6VY8e+HGsr0tHdp/9U4y/Xv3Xx31mY=;
 b=ZdnDx+lboizU4/9TwsoO06Bi19StojGqkF543cynF2mLFb3EnaUEzCP9LeAlpdAETqfw4qYAj8b7iIi/SAGgkWP4EvjyvVKp4kCOgnrlcj+FOB7cGGnDxZ+IybL/Ok6v8nc5JG9xQF0HtF7zpmFyzNtFORkfqwfl/GAxB1+hUKJd87uraNqxO/iDnpWzhVflpvWNTNKNhLhy2A1UagVt70Mpvp3Ipj0hOUUPiJZIdSfEmL3rx3L03z/ANYKHKWxDAJY3Fr5LiCGa9hWe1wZ07ZktMH9wvDsBwB9HxJbJlM6lDwJUuFE6qlPXNwk/lblMJu+cAhAcNSu3mGOSrUlWwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=linaro.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6HLNS3qf3SWei6VY8e+HGsr0tHdp/9U4y/Xv3Xx31mY=;
 b=NIik1FyhAe9Ns7/aqrOaQVy8mclGTK2n+S2KNP9vaD4ZbO4zRx3PMXKDBV1onNejqkZk87TM4P0KmVspM42/FRF93aNX8XSNX2MJcW7uMxrfHyZ/MLmPNSFhLkqvINpnqOivG+csTJHjTUE6BDWLOyqrw3uA/xYiylojzwnw4Yg=
Received: from SA9PR10CA0018.namprd10.prod.outlook.com (2603:10b6:806:a7::23)
 by BL0PR02MB4497.namprd02.prod.outlook.com (2603:10b6:208:4a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.29; Sat, 14 Nov
 2020 16:49:23 +0000
Received: from SN1NAM02FT009.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:a7:cafe::9c) by SA9PR10CA0018.outlook.office365.com
 (2603:10b6:806:a7::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25 via Frontend
 Transport; Sat, 14 Nov 2020 16:49:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT009.mail.protection.outlook.com (10.152.73.32) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3564.22 via Frontend Transport; Sat, 14 Nov 2020 16:49:22 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Sat, 14 Nov 2020 08:49:21 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Sat, 14 Nov 2020 08:49:21 -0800
Envelope-to: mathieu.poirier@linaro.org,
 devicetree@vger.kernel.org,
 linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Received: from [172.19.2.206] (port=38914 helo=xsjblevinsk50.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1kdyjp-0007Ai-Aw; Sat, 14 Nov 2020 08:49:21 -0800
From:   Ben Levinsky <ben.levinsky@xilinx.com>
To:     <mathieu.poirier@linaro.org>
CC:     <devicetree@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v23 1/5] firmware: xilinx: Add ZynqMP firmware ioctl enums for RPU configuration.
Date:   Sat, 14 Nov 2020 08:49:17 -0800
Message-ID: <20201114164921.14573-2-ben.levinsky@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201114164921.14573-1-ben.levinsky@xilinx.com>
References: <20201114164921.14573-1-ben.levinsky@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 42f23e86-6b58-46a0-d813-08d888bd3d1b
X-MS-TrafficTypeDiagnostic: BL0PR02MB4497:
X-Microsoft-Antispam-PRVS: <BL0PR02MB4497D73B4B4EBF73BB225698B5E50@BL0PR02MB4497.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:359;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S16ZuemxAOCZDcmf0nT+BiycI89HkuFY2yKlagBhcMILcW9QpWwCPUyorm8qb+PqK2LrEL+J0Zhltz3yIiZU5X5vTOW7PnIiZQhxenWa2Y/ThWest9bUzptg5VO2U+Gd3N6z+xQwU0igd266vGGyvyRMf1A7NZm2YJH6CsYHj2db3G7m/WI2FfHA2GS2mhqN7SrOX66n0IpxPyluFRkNN7VCqAbkNbHAvEyWPajyK8xvLp/cy0tyebbMkHnoRtPmhFaOjHtzLMzMKq//fByQ9EHfRFwASqiBjpmcUyqqdPR6mxOJmaqiu5k5pdGCwEAAH8Cr3qRDwRJ1fuR8kKvBBh7ek0YPhdvbsUgyLvcMrmmG3Mvpp6U/MAJuT/ODgiMANQDu2dKVQ/DLCyoVnt3u6NMSSyFXLCK1EbKrqBokyqo=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(346002)(136003)(376002)(396003)(39850400004)(46966005)(44832011)(36906005)(9786002)(70206006)(7696005)(1076003)(7636003)(316002)(6916009)(47076004)(2906002)(2616005)(4326008)(36756003)(356005)(8936002)(83380400001)(336012)(82740400003)(26005)(8676002)(82310400003)(6666004)(478600001)(5660300002)(426003)(54906003)(186003)(70586007)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2020 16:49:22.7547
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42f23e86-6b58-46a0-d813-08d888bd3d1b
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT009.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB4497
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add ZynqMP firmware ioctl enums for RPU configuration and TCM Nodes for
later use via request_node and release_node

Signed-off-by: Ben Levinsky <ben.levinsky@xilinx.com>
---
v23: add TCM Node IDs to be used in R5 Remoteproc driver
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

