Return-Path: <SRS0=ZH1X=C7=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00D43C4727D
	for <linux-remoteproc@archiver.kernel.org>; Tue, 22 Sep 2020 22:39:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AA38D235FD
	for <linux-remoteproc@archiver.kernel.org>; Tue, 22 Sep 2020 22:39:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="tX4sfymu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726746AbgIVWjn (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 22 Sep 2020 18:39:43 -0400
Received: from mail-bn8nam11on2087.outbound.protection.outlook.com ([40.107.236.87]:24160
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726448AbgIVWjl (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 22 Sep 2020 18:39:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hfwO7pG+pfadmqtda7r+xLwcmcHx+BTTDdYwzsO1ps1Qje3F11iyr9h0jBiQCqFtdf3SmjcmOeJ6R1huyVnybyuBvdcRSFbJM5iBOGjLqC06ESNWhpThbcJBiQY7ZeNfsphus68rtsLFzMQKSZbCqSIZveQDm1E+VklHe3/uH39ScHhXu5aKXNTDH7iWp4fxO9UOYfBTIrMdNVr/eWaOAciFyGxQv4fhEZgqp3duozhzZI+v8XwEyhvLI0Mah0FFBjCCzHpWh71S7XAaIDzscnHqhN4a/tQ6gFPTwJSvKDpXSA77rxibTYUYM8UjXHk3TSrUoc4/bvu0yqk1uZhlGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RXlvvgkgk5NVtQWRNRs7Ng0J70lamUAT04M4qSPl4yk=;
 b=dttyMCpAUVLfndXikZvvhAMh2HnKw+o7lp+QwIVhSzDrhJZxt8v/+1HrEhph0H1Y3Tq97YrCveQW9cmudlsNcZIRb5PqzotiP2ZwG5AKJWjaO5jIoGixz8aqHdKk9zn55kKuQ8Ef886ZThOWXilq2Qjl1LGSgLIuS+PQEimYHKIoyFPcOpTVPNoMfl8+e2NeDcQKdvxpBWEFdjgQqo4kOMybqzFjA6p7Y9SIwwTv9NHq/K1DMobgIRj/HdmQKiEc9d5dQTnu0K2tJKaGp2yFpPt7fnxsKzBQiP/9gIVEku38NrSh59QBl+diau3oFIXJQUjtVw750q8YnwjXGPlv4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=xilinx.com; dmarc=bestguesspass action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RXlvvgkgk5NVtQWRNRs7Ng0J70lamUAT04M4qSPl4yk=;
 b=tX4sfymu4IlqIahuYcZDkzBY7DR68Ns3KSgBGNvcife5PrbgvAqXvkXslTP8gfigfi9+/AvfPoDOrjuWWpOkNDfWNEJbHc4KYpuyG6iRztNm87jv0JUWUvlHT5VZMKkx051l6WumLHJaAhbx35qd376x6U3e8SUVGmWjJKV6sBI=
Received: from CY4PR16CA0001.namprd16.prod.outlook.com (2603:10b6:903:102::11)
 by SN6PR02MB5440.namprd02.prod.outlook.com (2603:10b6:805:e2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14; Tue, 22 Sep
 2020 22:39:38 +0000
Received: from CY1NAM02FT012.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:102:cafe::12) by CY4PR16CA0001.outlook.office365.com
 (2603:10b6:903:102::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14 via Frontend
 Transport; Tue, 22 Sep 2020 22:39:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 CY1NAM02FT012.mail.protection.outlook.com (10.152.75.158) with Microsoft SMTP
 Server id 15.20.3391.15 via Frontend Transport; Tue, 22 Sep 2020 22:39:37
 +0000
Received: from [149.199.38.66] (port=42773 helo=smtp.xilinx.com)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1kKqwU-0000pk-OB; Tue, 22 Sep 2020 15:39:22 -0700
Received: from [127.0.0.1] (helo=localhost)
        by smtp.xilinx.com with smtp (Exim 4.63)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1kKqwj-0002tQ-JW; Tue, 22 Sep 2020 15:39:37 -0700
Received: from xsj-pvapsmtp01 (mailman.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 08MMdUvM014076;
        Tue, 22 Sep 2020 15:39:30 -0700
Received: from [172.19.2.206] (helo=xsjblevinsk50.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1kKqwc-0002rc-9r; Tue, 22 Sep 2020 15:39:30 -0700
From:   Ben Levinsky <ben.levinsky@xilinx.com>
To:     stefanos@xilinx.com, michals@xilinx.com, michael.auchter@ni.com
Cc:     devicetree@vger.kernel.org, mathieu.poirier@linaro.org,
        emooring@xilinx.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v16 2/5] firmware: xilinx: Add shutdown/wakeup APIs
Date:   Tue, 22 Sep 2020 15:39:27 -0700
Message-Id: <20200922223930.4710-3-ben.levinsky@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200922223930.4710-1-ben.levinsky@xilinx.com>
References: <20200922223930.4710-1-ben.levinsky@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8922a5a7-aff9-4773-80e2-08d85f486326
X-MS-TrafficTypeDiagnostic: SN6PR02MB5440:
X-Microsoft-Antispam-PRVS: <SN6PR02MB54408ED86F8F912D2087F44DB53B0@SN6PR02MB5440.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Wca8hvUud7oXK3Xx0hO9OgGQBozyOrCZky74aygB56jTFPCgYsJfio2uC/o+b5cYkXszK3UaBX+o9msn4VOZoIa7RFU5K28Tm0lQtPzZkUbZI22wDCE+W9Y01P2Cgm76qDTZsUWBC8IF5a8OEeTPx4YWbCRoY8HuGdIaA/xI7FPpT96wUiEaJoi7qV6UxvZM83WdhkZyVGIW7XnrzrCpirGuuLGZNAp50DBxkCL66mHekqi6V6A48v5vDQXE1ZqlO5FQ4aStvymSO/FE4lrJhF46Mfqny4gDtWPkDhGjXsw9Dsb5P+Ad9AjCabfl5pFNLfsntVKgpDymsssGdsrN61dy2FbU3/bDXCdDvgYT0So5BlDz/UG8U5q8znXHNTFTcJGELDqWxeUYNNksC5Gi/G2etVzGo7huvU5syQ5tqLo5O1O3nB8HEzGXBArPxRIR
X-Forefront-Antispam-Report: CIP:149.199.60.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapsmtpgw01;PTR:unknown-60-83.xilinx.com;CAT:NONE;SFS:(39850400004)(396003)(136003)(376002)(346002)(46966005)(7696005)(2616005)(70206006)(44832011)(81166007)(9786002)(82310400003)(356005)(83380400001)(70586007)(47076004)(478600001)(82740400003)(36756003)(2906002)(4326008)(336012)(8676002)(316002)(6666004)(186003)(5660300002)(26005)(426003)(1076003)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2020 22:39:37.8467
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8922a5a7-aff9-4773-80e2-08d85f486326
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT012.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB5440
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

