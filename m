Return-Path: <SRS0=Or6o=C2=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 554D6C43465
	for <linux-remoteproc@archiver.kernel.org>; Thu, 17 Sep 2020 20:03:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1ACF920725
	for <linux-remoteproc@archiver.kernel.org>; Thu, 17 Sep 2020 20:03:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="PJdMkgqK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726405AbgIQUDO (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 17 Sep 2020 16:03:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726468AbgIQUDA (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 17 Sep 2020 16:03:00 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2060b.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e8a::60b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69D40C0611BC;
        Thu, 17 Sep 2020 12:53:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f7PTXWVz4+hQEwewBdlBSHph1L3IuCIwdSYNeMdd92cAgdqb0IB59Bv6ckXmSSJRnce2X/65PljnShmBVBZ8mOj/SecvOpVZAdDA9GmlmZryNOx+t9akjjUN1q3AN3LUut7X4gpNB/8N3BY9BgEgq8GgY21DC/UjTaILm9L6LmHHwUVQF1RaKWRrUkVGNw0cpAmbyJ2MTmfX1DhzdggosluAXy5YzFXnGrmhLCTmy2bFZfKDvt6/BZbHq/yFbSfKhjkjJv3ajqeE7OHxyHqYbDvcOT1x2LR7wax0/80rmSI4G1TXdUprSqCsj9OcViNnq1lSRJWVBUa+CC7euzzkuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RXlvvgkgk5NVtQWRNRs7Ng0J70lamUAT04M4qSPl4yk=;
 b=Yg9UAhH996HNpb7nF4fkJ/0VDhQ73taTusK4h6hzyCFSAXBrlCs+Sm41k2obrF5KP60o2eR0hfJpJg7gZqeEObf4eStxWaT2WOmpzVvEm0VX/VUh9JGkD51FMyoup1ksKBniPcb2KWuXp2GeuNdVuIMdIe6k3m1ffQqkzsDuyDmHio0yq9VV6NisN6ADq6243QPKGMPG5suOL9I7KbKZb7WlEwiZX2+/fDpxG42V7bHUEHg2b7F8t9V7PjN6KSQ0dt5GiD8ErTgSkKqevIDmUiuOdSfPUnoupP4mslMD6zr+5td0rBkE2w1nSIKrY6dHldnV/2c02AU1hI4Q8x9VIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=xilinx.com; dmarc=bestguesspass action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RXlvvgkgk5NVtQWRNRs7Ng0J70lamUAT04M4qSPl4yk=;
 b=PJdMkgqK6YZiOueDfcbj1C+gsGccKHuGKEryWIQ+ASFqYtDhFJObKO4k84oM0wv4nQGZO6j54CS5XSaCPW9FwfJ4iIq8zG7siHPQB7pu9zWSY3vx86bf51EnMZeZ+CkhGXRtIk1C11dd/XB2uytBwXyL3gD3wSZXkw53I+Dhqz0=
Received: from SN1PR12CA0059.namprd12.prod.outlook.com (2603:10b6:802:20::30)
 by SN6PR02MB5629.namprd02.prod.outlook.com (2603:10b6:805:f0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.15; Thu, 17 Sep
 2020 19:43:45 +0000
Received: from SN1NAM02FT057.eop-nam02.prod.protection.outlook.com
 (2603:10b6:802:20:cafe::47) by SN1PR12CA0059.outlook.office365.com
 (2603:10b6:802:20::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15 via Frontend
 Transport; Thu, 17 Sep 2020 19:43:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT057.mail.protection.outlook.com (10.152.73.105) with Microsoft SMTP
 Server id 15.20.3391.15 via Frontend Transport; Thu, 17 Sep 2020 19:43:45
 +0000
Received: from [149.199.38.66] (port=43970 helo=smtp.xilinx.com)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1kIzoe-0005Z3-CO; Thu, 17 Sep 2020 12:43:36 -0700
Received: from [127.0.0.1] (helo=localhost)
        by smtp.xilinx.com with smtp (Exim 4.63)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1kIzom-0005P5-PY; Thu, 17 Sep 2020 12:43:44 -0700
Received: from xsj-pvapsmtp01 (smtp-fallback.xilinx.com [149.199.38.66] (may be forged))
        by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 08HJhgYr028241;
        Thu, 17 Sep 2020 12:43:42 -0700
Received: from [172.19.2.206] (helo=xsjblevinsk50.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1kIzok-0005OV-2A; Thu, 17 Sep 2020 12:43:42 -0700
From:   Ben Levinsky <ben.levinsky@xilinx.com>
To:     punit1.agrawal@toshiba.co.jp, stefanos@xilinx.com,
        michals@xilinx.com, michael.auchter@ni.com
Cc:     devicetree@vger.kernel.org, mathieu.poirier@linaro.org,
        emooring@xilinx.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, jliang@xilinx.com,
        robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v14 2/5] firmware: xilinx: Add shutdown/wakeup APIs
Date:   Thu, 17 Sep 2020 12:43:38 -0700
Message-Id: <20200917194341.16272-3-ben.levinsky@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200917194341.16272-1-ben.levinsky@xilinx.com>
References: <20200917194341.16272-1-ben.levinsky@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ad6d9d0b-b297-46c3-af4a-08d85b41fd23
X-MS-TrafficTypeDiagnostic: SN6PR02MB5629:
X-Microsoft-Antispam-PRVS: <SN6PR02MB562902BCA25C7CFD18A8815BB53E0@SN6PR02MB5629.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2gE3hX2W+/2iFYqvTjXkwAlVPxlVh2lxVJTwuVkBaO8uwFBZJXTl85daI+RydGhU80u2ZGT3hBxoaeqB6Y0dyh/wr6q4Wym/VmuBssxYZIheQozMui4VusXolZwMayPLAkEFpa12TCJ887MiXGZIORlxw5dEbrGm9mNcpsr/VMeO0wujwHlaLH/pVLhzuXwtiID9MYTG6yAKSivIrgXH2o0js+fAsggZiup37vo27jhIx1QyTzyNDZeBqZbY7y1nPsvVFJe3nryBvgsapej9cWL5o8AwO8/gKPcrXrJaNBtl2TkagMyjAwgAWihvXvwflSs1yUK1s5HrjcNNjPrTLtsVoWWc+LtUSY5EilOGitbfL7SxVLNWrISImRJpCZth2OOYXu0H5csJsArZzkGv1204RQZd6J8diHgrTKEoEM1PIxBAWzgMRvo0GGrKwSto/MVb/LsaQLNXzdsxDIBuDw==
X-Forefront-Antispam-Report: CIP:149.199.60.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapsmtpgw01;PTR:unknown-60-83.xilinx.com;CAT:NONE;SFS:(376002)(396003)(346002)(39860400002)(136003)(46966005)(36756003)(8676002)(70206006)(70586007)(8936002)(6666004)(9786002)(186003)(7696005)(26005)(2616005)(44832011)(4326008)(336012)(316002)(426003)(81166007)(478600001)(356005)(5660300002)(2906002)(83380400001)(82740400003)(47076004)(1076003)(82310400003)(42866002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2020 19:43:45.0791
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad6d9d0b-b297-46c3-af4a-08d85b41fd23
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT057.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB5629
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
v3:
- add xilinx-related platform mgmt fn's instead of wrapping around
  function pointer in xilinx eemi ops struct
- fix formatting
v4:
- add default values for enumv3:
- add xilinx-related platform mgmt fn's instead of wrapping around
  function pointer in xilinx eemi ops struct
- fix formatting
v4:
- add default values for enum
v9:
- zynqmp_pm_force_powerdown update arg 'target' to 'node'
- zynqmp_pm_request_wakeup fix code style
v10:
- add types.h to includes for compilation
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

