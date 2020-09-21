Return-Path: <SRS0=DqHI=C6=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EB9DC43465
	for <linux-remoteproc@archiver.kernel.org>; Mon, 21 Sep 2020 16:14:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 37A6820739
	for <linux-remoteproc@archiver.kernel.org>; Mon, 21 Sep 2020 16:14:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="cTX/kuZ0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728074AbgIUQOT (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 21 Sep 2020 12:14:19 -0400
Received: from mail-dm6nam10on2072.outbound.protection.outlook.com ([40.107.93.72]:60306
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727671AbgIUQOT (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 21 Sep 2020 12:14:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UVu8+IVhlIw7SBRD9m7revxrhiaass9yoSxsgnZXSKNdRR1nwL5c5LxN3b0YPXj1yhP76TXZAmIRaUHzua7b3B0fLHIEmnJz1XSeAEVBkqP1WUfmm0U1eO14IX5cksEP9lQVehzMUklPSjHg2jl582tJHF5Migc+i0woXT9Qx09JfDYvHEG5lIG2bbVTZ2JZvYG4qCbp9PhR+s9UoorzysfMik0LNOaCz7AXExYGDBDepoNWkk8iNE0AzQqqexBanUgtBtss4CHImiXlpO6be9ud6NoyHNHxjua8ZBD0z5Jo4M8FVaZ1qAhUkkWryAK6JU16ByJpw357SDYEZuaReQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RXlvvgkgk5NVtQWRNRs7Ng0J70lamUAT04M4qSPl4yk=;
 b=Tu+ysQaAoLV5hve6+q5ddNNl9rM4ELXPubUEqpmeaXpK0HX5CGqF05bMyPRlW1Xsl8l7T+aJB5sTEjBK2z7R/oAPeuHwr29OgzZMP6JTSW8JMXrViUIw7xi/IskpONoH7+x6R1Zuc/T2reg8hR/5PnqmMNEfQu8qpgNXVo0jl6/YHpS6Hxz+v90v8eqasGyvC69xDrqXTTMnfL2smNssNATkvRU4a896f9F0aJLkMfUP1x9rJy3rrKrtviOcehPwsl9KYUl4jA3eqon+Rctsdh0Fal9Yd7WhMoARn/TURhtndc7s8lyoY7SqafqFmgAy+AODpGWcEqXJd5MtVszlNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=xilinx.com; dmarc=bestguesspass action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RXlvvgkgk5NVtQWRNRs7Ng0J70lamUAT04M4qSPl4yk=;
 b=cTX/kuZ0Mbp1ykVMqFHCyQij9te4wTDnnDivNj56ketnuFdo/wLUB4f78WEMKk50SSOFr1eIxenFtAYMNxwMhbA7Pwxwt40gSV1WU2idGt3LHadWAAMOVi0fXhbU3aKwFw/fP/vz3aEf4//FYxgqDSJSY59rNguV1zs9pzeJNSI=
Received: from CY4PR21CA0017.namprd21.prod.outlook.com (2603:10b6:903:dd::27)
 by SN6PR02MB4384.namprd02.prod.outlook.com (2603:10b6:805:a7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Mon, 21 Sep
 2020 16:14:16 +0000
Received: from CY1NAM02FT003.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:dd::4) by CY4PR21CA0017.outlook.office365.com
 (2603:10b6:903:dd::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.9 via Frontend
 Transport; Mon, 21 Sep 2020 16:14:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 CY1NAM02FT003.mail.protection.outlook.com (10.152.74.151) with Microsoft SMTP
 Server id 15.20.3391.15 via Frontend Transport; Mon, 21 Sep 2020 16:14:16
 +0000
Received: from [149.199.38.66] (port=36718 helo=smtp.xilinx.com)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1kKOS2-00058u-MJ; Mon, 21 Sep 2020 09:14:02 -0700
Received: from [127.0.0.1] (helo=localhost)
        by smtp.xilinx.com with smtp (Exim 4.63)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1kKOSF-0004ec-Uj; Mon, 21 Sep 2020 09:14:15 -0700
Received: from xsj-pvapsmtp01 (xsj-mail.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 08LGE69Z008430;
        Mon, 21 Sep 2020 09:14:06 -0700
Received: from [172.19.2.206] (helo=xsjblevinsk50.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1kKOS6-0004bU-GI; Mon, 21 Sep 2020 09:14:06 -0700
From:   Ben Levinsky <ben.levinsky@xilinx.com>
To:     sunnyliangjy@gmail.com, punit1.agrawal@toshiba.co.jp,
        stefanos@xilinx.com, michals@xilinx.com, michael.auchter@ni.com
Cc:     devicetree@vger.kernel.org, mathieu.poirier@linaro.org,
        emooring@xilinx.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v15 2/5] firmware: xilinx: Add shutdown/wakeup APIs
Date:   Mon, 21 Sep 2020 09:14:03 -0700
Message-Id: <20200921161406.11929-3-ben.levinsky@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200921161406.11929-1-ben.levinsky@xilinx.com>
References: <20200921161406.11929-1-ben.levinsky@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f3710cd5-f5fc-4bd1-120e-08d85e496328
X-MS-TrafficTypeDiagnostic: SN6PR02MB4384:
X-Microsoft-Antispam-PRVS: <SN6PR02MB4384AF17E1FAEFEC420CD3B2B53A0@SN6PR02MB4384.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m0Q6qBOaNkLaJbYa5F6GrBsCfHmhizM1FIWlrb9CHDYAeSfTX5zT1PhRxHAONErGBg2cYb7GFpLujbbKX59MuGwuymnv8SwQUtV+GsJkeBJib7DYqRlAN3WY5G1JHU9lzvr2lymhOgFy1/8EuncDReHSRGi9bJPEOT0iFcguoZFtUtfDApFjU1BZ+VM3H7KzuVayl9kPZVrCDO4eLgEGzhaOV4GSLPOS2F9pwMGtfkZubUO1NUjCVGfr5bF1L4rmcIHpUexLp3Uh42UnC2rDLFbuSyet/lICikpYPssicOZoTHma1E/4eOUw7mQjKRNmrSBNRC8rJF3/CQoKWrvJxbdBmCPNnWbqqSRk19BMYkWaCWs/z0ohP0syn6oIj7yAkBaMIexVXAkUvgUtl/tEOL40t/QWx0iuO02qjbPv+Lpld1/dLzyAQedC7nO6xC5U
X-Forefront-Antispam-Report: CIP:149.199.60.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapsmtpgw01;PTR:unknown-60-83.xilinx.com;CAT:NONE;SFS:(396003)(346002)(376002)(136003)(39860400002)(46966005)(4326008)(356005)(26005)(7696005)(186003)(36756003)(478600001)(81166007)(82740400003)(47076004)(83380400001)(82310400003)(9786002)(336012)(1076003)(426003)(70206006)(8676002)(8936002)(316002)(2906002)(2616005)(6666004)(5660300002)(44832011)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2020 16:14:16.2009
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3710cd5-f5fc-4bd1-120e-08d85e496328
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT003.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4384
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

