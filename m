Return-Path: <SRS0=xJOp=EI=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CE26C00A89
	for <linux-remoteproc@archiver.kernel.org>; Mon,  2 Nov 2020 19:39:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D8BE822268
	for <linux-remoteproc@archiver.kernel.org>; Mon,  2 Nov 2020 19:39:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="iGmL2gqd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726913AbgKBTjJ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 2 Nov 2020 14:39:09 -0500
Received: from mail-eopbgr690067.outbound.protection.outlook.com ([40.107.69.67]:42713
        "EHLO NAM04-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726814AbgKBTjI (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 2 Nov 2020 14:39:08 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EYhtwy8Mvt7mHg45kbrxlahT4QpzJjnaII/pdm7gbXsnbDWPbFr1j7iZZ3nQ1poqZjnjm0dREVnslxJRsT1JP6blOFYkxe6ps1Q19fldVjpOnZd3GK0OH54N5xWDzF9J95TlcYkPNVGqa3hoy8Chy0KhJLrMy0iJCdU+RDQw8NQzSPcwomN+KWKPhsH8KqvZX4qXeu8yQoUjwejzj2Lv6wLvC7cIvFYMAAQW7boSiSprUcNOEW7roM9a+o0iHtjqaAY8AeAtzkZWOhDyAIFqh8Lrw0YWqztzLZy+t1314H3thDWyWTEpvexm6yVkmRWDxG9EhAozwhVdq4zt0DnT0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Vpc2qALYKsniXcacH+wUXo0p8OO7wRYBSl9foF8LDU=;
 b=XtFopjL1r9PLaYE7/XrKwb9Rse0YcEnUgGxYx8hZoekBXMYXg75p258Vk0VkAXOBVLAv0ZxWgbOzptTqUX8wo2sHTqhaPbJFeMR9iiM2cKbj3UsD0iP70W2nnA5+qhK0b1SGxB25Er4/Lo3W4BuyNPIHDYlnsjACEA2g2LsiLO8SVqjpD/AI1WvcwC8Su1AyW01yNUDgTgGGY3e/G2i3fs4MUOVf5gq9tt8Liw+f+gv2ObbmM8muaNXNW3DR82fJ1KQK7K8wIaxRVloeyfFbM9V909FwgJzBfSVOfGYhiRaZappxE9vWkXOlDVrmvPDu0vMB07nwgUhPBgIhk843gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=ni.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Vpc2qALYKsniXcacH+wUXo0p8OO7wRYBSl9foF8LDU=;
 b=iGmL2gqd6t2pI+b/+9YZMtSwOA8wKz1mrFWkgEPAXUp7fIJECVQnQQseKG/QnnTJtj2oUh6i69cGiCz64fTsyffZfmImrxnILvVXalpwIgYYEjLe3+DvlwUhArM1Y/vB950WwDU+gw4UKL7Lgbo9Ug/mAWBHI/hDS48LU5K/cxU=
Received: from CY4PR20CA0003.namprd20.prod.outlook.com (2603:10b6:903:98::13)
 by MN2PR02MB6352.namprd02.prod.outlook.com (2603:10b6:208:1b8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19; Mon, 2 Nov
 2020 19:39:04 +0000
Received: from CY1NAM02FT048.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:98:cafe::2e) by CY4PR20CA0003.outlook.office365.com
 (2603:10b6:903:98::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Mon, 2 Nov 2020 19:39:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; ni.com; dkim=none (message not signed)
 header.d=none;ni.com; dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT048.mail.protection.outlook.com (10.152.74.227) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3520.15 via Frontend Transport; Mon, 2 Nov 2020 19:39:04 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Mon, 2 Nov 2020 11:38:59 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Mon, 2 Nov 2020 11:38:59 -0800
Envelope-to: stefanos@xilinx.com,
 michael.auchter@ni.com,
 mathieu.poirier@linaro.org,
 devicetree@vger.kernel.org,
 linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Received: from [172.19.2.206] (port=58004 helo=xsjblevinsk50.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1kZffP-0005Vs-NF; Mon, 02 Nov 2020 11:38:59 -0800
From:   Ben Levinsky <ben.levinsky@xilinx.com>
To:     <michael.auchter@ni.com>, <stefanos@xilinx.com>,
        <mathieu.poirier@linaro.org>
CC:     <devicetree@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v21 1/5] firmware: xilinx: Add ZynqMP firmware ioctl enums for RPU configuration.
Date:   Mon, 2 Nov 2020 11:38:55 -0800
Message-ID: <20201102193859.31090-2-ben.levinsky@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201102193859.31090-1-ben.levinsky@xilinx.com>
References: <20201102193859.31090-1-ben.levinsky@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 89b431fe-1744-45e8-1658-08d87f66f4f1
X-MS-TrafficTypeDiagnostic: MN2PR02MB6352:
X-Microsoft-Antispam-PRVS: <MN2PR02MB6352D7EC8731D2D1584B855EB5100@MN2PR02MB6352.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:525;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TJsjZPZFEN+JIGRRxv4qCAzDjTsbSUmrNGSmwrWO3jh8sQudm2S+Zskpwou7o+3Z4R0JtBPJ5Q5RkLz6qVeHoKGvCgzN0EL33V5hQVMaSM0f5Aech6Edi88Zp6yYLZC7hcTuN3Id90ROs0EU/mo9YNGboyAxkb/K1NI1OXkzkrK7MJ0X4e5tXimksBR4Ircm3CX49GYkdmBmLbWDZf0oJCY6lmjbIM1URo2sVHVsvE0OE4ZVnMzrlbjmCpsqYCKHiPdRuPb2hKgpsDcITJAdBQnE5goKOOX8JOhiu2WdIGoP2L1d1dfrorHJXWpLYTwDydO2hXY1o7YRF3pzvCVRtiqRuy+sO1B+htYsiPWl7gamt3GHo9IOy9fhmRgcbr60cn2OfxOQKoeO9kG0Iu2kHSpMrGzxI7nGUCmKcyClWz0=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(39860400002)(396003)(136003)(346002)(376002)(46966005)(26005)(186003)(6666004)(4326008)(7696005)(1076003)(5660300002)(9786002)(54906003)(110136005)(8936002)(8676002)(316002)(36906005)(82310400003)(336012)(82740400003)(356005)(2616005)(44832011)(83380400001)(426003)(47076004)(70586007)(36756003)(2906002)(70206006)(478600001)(7636003)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2020 19:39:04.5117
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89b431fe-1744-45e8-1658-08d87f66f4f1
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT048.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6352
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add ZynqMP firmware ioctl enums for RPU configuration.

Signed-off-by: Ben Levinsky <ben.levinsky@xilinx.com>
---
 include/linux/firmware/xlnx-zynqmp.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/include/linux/firmware/xlnx-zynqmp.h b/include/linux/firmware/xlnx-zynqmp.h
index 5968df82b991..bb347dfe4ba4 100644
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
-- 
2.17.1

