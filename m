Return-Path: <SRS0=xJOp=EI=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94ECBC00A89
	for <linux-remoteproc@archiver.kernel.org>; Mon,  2 Nov 2020 19:39:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1AF2E22268
	for <linux-remoteproc@archiver.kernel.org>; Mon,  2 Nov 2020 19:39:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="tTQe6S8Y"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726491AbgKBTjD (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 2 Nov 2020 14:39:03 -0500
Received: from mail-mw2nam10on2084.outbound.protection.outlook.com ([40.107.94.84]:4670
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725791AbgKBTjD (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 2 Nov 2020 14:39:03 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U1X7zjDfbZIYwlzp0mkxlVRxAp6kbFzdFA8gu9ytgz9bA2zD8p82gEZKbwggBcMqNMVQRn+xI9FTTduL6DFg04PkvbZYNQ3VVskR2KSwo0VeJ7Xfqg3qio5vbNL0FzRRNuxEjD5VVMnHmEI/5KDkHxZ5vkOEcnyJSJnHuUZVmu1MaeBxdWKjKiXnr++1j5zLVCqTJTW68qO8a4Tn68Rg6PNxNIAG/TtF/j/BAtPkRKSUG8i8+Cs2/0mygvyTBHgA5lxf7TN2Wv6pYfLdqXN2rp1x7wrhqrSycVHXNthAah3Nhn5knVbKtg4Nfs0sZLrsiv0TqCs5ME1ZQqNX+bz8DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yvj/lkr1NeFpW96h7I8rBBF1Fco7AUaEqsAkifx19DA=;
 b=ZSsSAsaPTzU5HcE98S3U2b9DnojdxYHHTo6MZ2XFRvFGj2XRB4aREYC97NThuthQ0nJ95LHoRJR/9eP0PDVS3MM+6jDVAMqV+KU0Kw38+udFl88r7edkHcdSAUz742krtZIR89UFKIhi9aEUcCJHl7QGj4hxZml7UKz5X4CSb9vpSjQfOyotqjt+yftahzu0xKtI14H+aL1I+vsjavpSJUHC8b1GVZjD7UdKDAZ0Zn/Tp/YOM1tlKqIVnItLSh1eGhIDL6pENUEE4NoMjRHOJkiCR0deBtvGqViXL/oRJW5pbNebfNcFleYa1pEYjLr9rNgoOzcJxykYF2xuGEzzCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=ni.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yvj/lkr1NeFpW96h7I8rBBF1Fco7AUaEqsAkifx19DA=;
 b=tTQe6S8YzWUposHwTRS1VI48tZG/CHM1BGC6CjacFm5NTAHWrODN5CPx29Fnrlabucmvyx87omRvHPpDYcpjdHPDDDIDUydESM3Qczl0Fl4nM+mMHN0/pSPPW4BBXL3/Zi/M9VcJyF8xe6jvrIC76TpQa8Gw0U1NWDNA51TpmOw=
Received: from CY4PR06CA0059.namprd06.prod.outlook.com (2603:10b6:903:13d::21)
 by BY5PR02MB6486.namprd02.prod.outlook.com (2603:10b6:a03:1d6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Mon, 2 Nov
 2020 19:39:01 +0000
Received: from CY1NAM02FT054.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:13d:cafe::9c) by CY4PR06CA0059.outlook.office365.com
 (2603:10b6:903:13d::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19 via Frontend
 Transport; Mon, 2 Nov 2020 19:39:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; ni.com; dkim=none (message not signed)
 header.d=none;ni.com; dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT054.mail.protection.outlook.com (10.152.74.100) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3520.15 via Frontend Transport; Mon, 2 Nov 2020 19:39:00 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
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
        id 1kZffP-0005Vs-Nl; Mon, 02 Nov 2020 11:38:59 -0800
From:   Ben Levinsky <ben.levinsky@xilinx.com>
To:     <michael.auchter@ni.com>, <stefanos@xilinx.com>,
        <mathieu.poirier@linaro.org>
CC:     <devicetree@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v21 2/5] firmware: xilinx: Add shutdown/wakeup APIs
Date:   Mon, 2 Nov 2020 11:38:56 -0800
Message-ID: <20201102193859.31090-3-ben.levinsky@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201102193859.31090-1-ben.levinsky@xilinx.com>
References: <20201102193859.31090-1-ben.levinsky@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 57a85f9f-070a-4028-e5c9-08d87f66f2a1
X-MS-TrafficTypeDiagnostic: BY5PR02MB6486:
X-Microsoft-Antispam-PRVS: <BY5PR02MB6486963CF5BC9DC9C7CE29B9B5100@BY5PR02MB6486.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iUXDy4GJe2fBI2T49wBU8WaYLyFXTdKkBZfdV/xKvqLI7XCJnsMkWpwuq2ovQRqVddhPu0CxxFsdUk4MHhPqsSMcfyU9pkuWqk7FOhzgtMpRUZOaCTHhkU6xdTDQG5C0hbqc+xR4m6Sp/SfD8IF840hmU6IbJ3N3foxV2UwlzpgEV5dWx0/dQF9Rfudu0RuqwJQgJJRrZXQl2SZxpFs2UJ6yFnTd54l0pEqxj08sDFqyQcbroZimez53YeOmM2ocaaNdzwxO7qVWvRq8qy1sT/iX7/xPvSTkjKqv7+FdyRARP/0hIHch7qTCZHvXs+2WKVrQu/NkThycNlGq4b++vepI+z2HeoC25fkltG5l/9RrIOXi5TqrKo7kVGSRn5UfdjOgio5ezuMfNKjwViEI4p/R7QvNyKShbRgVqVplBt4=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(136003)(376002)(39860400002)(396003)(346002)(46966005)(1076003)(82310400003)(8676002)(44832011)(336012)(36906005)(4326008)(186003)(316002)(7696005)(6666004)(8936002)(26005)(54906003)(110136005)(70586007)(2906002)(2616005)(5660300002)(478600001)(36756003)(70206006)(83380400001)(7636003)(47076004)(82740400003)(9786002)(356005)(426003)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2020 19:39:00.6383
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57a85f9f-070a-4028-e5c9-08d87f66f2a1
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT054.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6486
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add shutdown/wakeup a resource eemi operations to shutdown
or bringup a resource.

Note alignment of args matches convention of other fn's in this file.
The reason being that the long fn name results in aligned args that
otherwise go over 80 chars so shift right to avoid this

Signed-off-by: Ben Levinsky <ben.levinsky@xilinx.com>
---
 drivers/firmware/xilinx/zynqmp.c     | 35 ++++++++++++++++++++++++++++
 include/linux/firmware/xlnx-zynqmp.h | 23 ++++++++++++++++++
 2 files changed, 58 insertions(+)

diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
index 8d1ff2454e2e..a966ee956573 100644
--- a/drivers/firmware/xilinx/zynqmp.c
+++ b/drivers/firmware/xilinx/zynqmp.c
@@ -846,6 +846,41 @@ int zynqmp_pm_release_node(const u32 node)
 }
 EXPORT_SYMBOL_GPL(zynqmp_pm_release_node);
 
+/**
+ * zynqmp_pm_force_pwrdwn - PM call to request for another PU or subsystem to
+ *             be powered down forcefully
+ * @node:  Node ID of the targeted PU or subsystem
+ * @ack:   Flag to specify whether acknowledge is requested
+ *
+ * Return: status, either success or error+reason
+ */
+int zynqmp_pm_force_pwrdwn(const u32 node,
+			   const enum zynqmp_pm_request_ack ack)
+{
+	return zynqmp_pm_invoke_fn(PM_FORCE_POWERDOWN, node, ack, 0, 0, NULL);
+}
+EXPORT_SYMBOL_GPL(zynqmp_pm_force_pwrdwn);
+
+/**
+ * zynqmp_pm_request_wake - PM call to wake up selected master or subsystem
+ * @node:  Node ID of the master or subsystem
+ * @set_addr:  Specifies whether the address argument is relevant
+ * @address:   Address from which to resume when woken up
+ * @ack:   Flag to specify whether acknowledge requested
+ *
+ * Return: status, either success or error+reason
+ */
+int zynqmp_pm_request_wake(const u32 node,
+			   const bool set_addr,
+			   const u64 address,
+			   const enum zynqmp_pm_request_ack ack)
+{
+	/* set_addr flag is encoded into 1st bit of address */
+	return zynqmp_pm_invoke_fn(PM_REQUEST_WAKEUP, node, address | set_addr,
+				   address >> 32, ack, NULL);
+}
+EXPORT_SYMBOL_GPL(zynqmp_pm_request_wake);
+
 /**
  * zynqmp_pm_set_requirement() - PM call to set requirement for PM slaves
  * @node:		Node ID of the slave
diff --git a/include/linux/firmware/xlnx-zynqmp.h b/include/linux/firmware/xlnx-zynqmp.h
index bb347dfe4ba4..6241c5ac51b3 100644
--- a/include/linux/firmware/xlnx-zynqmp.h
+++ b/include/linux/firmware/xlnx-zynqmp.h
@@ -12,6 +12,7 @@
 
 #ifndef __FIRMWARE_ZYNQMP_H__
 #define __FIRMWARE_ZYNQMP_H__
+#include <linux/types.h>
 
 #define ZYNQMP_PM_VERSION_MAJOR	1
 #define ZYNQMP_PM_VERSION_MINOR	0
@@ -64,6 +65,8 @@
 
 enum pm_api_id {
 	PM_GET_API_VERSION = 1,
+	PM_FORCE_POWERDOWN = 8,
+	PM_REQUEST_WAKEUP = 10,
 	PM_SYSTEM_SHUTDOWN = 12,
 	PM_REQUEST_NODE = 13,
 	PM_RELEASE_NODE,
@@ -376,6 +379,12 @@ int zynqmp_pm_write_pggs(u32 index, u32 value);
 int zynqmp_pm_read_pggs(u32 index, u32 *value);
 int zynqmp_pm_system_shutdown(const u32 type, const u32 subtype);
 int zynqmp_pm_set_boot_health_status(u32 value);
+int zynqmp_pm_force_pwrdwn(const u32 target,
+			   const enum zynqmp_pm_request_ack ack);
+int zynqmp_pm_request_wake(const u32 node,
+			   const bool set_addr,
+			   const u64 address,
+			   const enum zynqmp_pm_request_ack ack);
 #else
 static inline struct zynqmp_eemi_ops *zynqmp_pm_get_eemi_ops(void)
 {
@@ -526,6 +535,20 @@ static inline int zynqmp_pm_set_boot_health_status(u32 value)
 {
 	return -ENODEV;
 }
+
+static inline int zynqmp_pm_force_pwrdwn(const u32 target,
+					 const enum zynqmp_pm_request_ack ack)
+{
+	return -ENODEV;
+}
+
+static inline int zynqmp_pm_request_wake(const u32 node,
+					 const bool set_addr,
+					 const u64 address,
+					 const enum zynqmp_pm_request_ack ack)
+{
+	return -ENODEV;
+}
 #endif
 
 #endif /* __FIRMWARE_ZYNQMP_H__ */
-- 
2.17.1

