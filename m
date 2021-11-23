Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF482C433EF
	for <linux-remoteproc@archiver.kernel.org>; Tue, 23 Nov 2021 06:21:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229722AbhKWGYI (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 23 Nov 2021 01:24:08 -0500
Received: from mail-mw2nam12on2049.outbound.protection.outlook.com ([40.107.244.49]:52929
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230234AbhKWGYF (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 23 Nov 2021 01:24:05 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kpqDiIbBPJad7GSmlcsTx1cO7lvoej6tkIWV6K5CSJF860jWBV20ysITjiT33HTybOyolXTULT2DTfmRLmhOey/dgKN6/XlLyGO+63409Y7VXE040b4FshUoBegAKm628RP3bvCmn3JhRWfK/EUV5kv/rq+1I99zriirQVMk3LLL/AApvNpOvk/YrQNhNhs9lfwFEKNvsYbfGDu7TvJcHBrZuNQc8JASenuquK6FFyLXyhvfO7QHZ2IQhglmLUS5h9pd/OxdAb5qOtoroZzenUrttf1Rg5VEFzCaSJQnyjq0KZiKFX2nsJxpTda1WD6OsYI5TYX26Bdnt3XiaysThQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=55/mDqgsqpC1dh5nICVSdxyPBCVtAxolPPZA7SRCvyc=;
 b=eOebhknk9JPi+qugldBOBTSiyPd4u8p5E0P4D24ZhvHrSXqm6meMy1H/T8DADoOxrJKAvmZdC4zjY17DQEyocBCxDzTp6iXTwwFer9XVVIrBwrNDOJdmTNhlwahCjKQWz1uMJjz7XJSialyWO3ReBSQhhO18I9WjEx+w1VwxYBiKpoDlp51NqypUoalgG6pYNquAamkBLcR5F+nDaj+EM8R35IFnRpPPLOu3ltoPb59fxByf6TQpj8/4MhvQCuYDaRtOehBJJCgbVDnkX4PKPKwcAyDNcxnM3hre6yCCW4tfq0vvvmTxMxnzi7wye0GA456dCmoNgle+DFs8R9h9Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=linaro.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=55/mDqgsqpC1dh5nICVSdxyPBCVtAxolPPZA7SRCvyc=;
 b=PzbotOLyOmCFnzKazeHDt7T1zh1kIGJIaLQepFv25JEFVp1tyxcuWPbzK4kj/zJD0SPqP+6GTZpBIKNT5Te4xnZWYn8duVvhzTKB2s71s6zaNZi32pu18ffRAFg2iKnpY9/We1TJPUC7JS8od3b2uFgNaBLzy944NAYCPRqwO0I=
Received: from SA9PR13CA0132.namprd13.prod.outlook.com (2603:10b6:806:27::17)
 by SJ0PR02MB7663.namprd02.prod.outlook.com (2603:10b6:a03:32f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Tue, 23 Nov
 2021 06:20:55 +0000
Received: from SN1NAM02FT0045.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:27:cafe::68) by SA9PR13CA0132.outlook.office365.com
 (2603:10b6:806:27::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.11 via Frontend
 Transport; Tue, 23 Nov 2021 06:20:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0045.mail.protection.outlook.com (10.97.5.234) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4713.19 via Frontend Transport; Tue, 23 Nov 2021 06:20:55 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
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
        id 1mpPAk-0001Zw-1k; Mon, 22 Nov 2021 22:20:54 -0800
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
Subject: [PATCH v2 4/6] firmware: xilinx: Add shutdown/wakeup APIs
Date:   Mon, 22 Nov 2021 22:20:48 -0800
Message-ID: <20211123062050.1442712-5-tanmay.shah@xilinx.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211123062050.1442712-1-tanmay.shah@xilinx.com>
References: <20211123062050.1442712-1-tanmay.shah@xilinx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4bf5fd42-74c9-4e50-7835-08d9ae496812
X-MS-TrafficTypeDiagnostic: SJ0PR02MB7663:
X-Microsoft-Antispam-PRVS: <SJ0PR02MB76637809F90B88B4D8CC84E6CA609@SJ0PR02MB7663.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dSne35FEigxrq7xprv7gGyISWjf08FiaT+H1HlkBBGxoJ1wsMxB79EqceQlk4bt/6SOGSCMPW7QVgjRRZpgwJSydkjLRjBPRmBlZ6MCJsJlSDp4y/p3J0YHDW+t6s5dzaOsL1VgTu3X+8yHu8nDOLAPTlIqAb2fj3N00GUgrQLj75pFyV93ZVJTXYuUGfoI+MbVK3MUCf3BrCmPWserRLJlfbKZQvvmV3GtS2G/7iyDO8bcaLrUU7oNHALkeaIi/++vN6Yr1pofqbgBZnZqMyjaR67OgxqYzNfvSBKRh7Vr9l6X/Y91w9K8sYBesHjHmo8ruCUKGAfDb5P0E1/heZT2myVyf1s6PtjNreOKMsrbzfnD59Ed+BTGw6DtxGVZelxQLaY2zn6EvB68kCuId8aeN/u7vI1c6tHv3ViTs534eStpQPgFvqTJprhw8joUvCUmJbq/P8YYpAqj7e6cmNY2JmqCCyjKKk7pesiuZI6HujN+PrMpEQrVZroBV2hsh6uL1feMYuUQKd9gY5+2EsxZuUkimJA/P7DFvTWKbXFdpqSFcTb0OF8v6QhnHOOwHp/tDmRIxzwyi6E2CGQ06fMh9vv2Kb3bzt6XtlOZzze/GD8q2jsb2Ulqv5YP90JwAUTdFLRBP29p5x+sB+5dsWQZ1i6n4kgcrmKISlS2ojnI5Q7yZV7QO2fsbYwQ6IEF7OMgO80eQA8bN9LOo/MH85t4XMJKyGC+C+wNDzb8hnUg=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(36840700001)(46966006)(54906003)(47076005)(36860700001)(186003)(36756003)(83380400001)(2906002)(4326008)(6666004)(2616005)(7636003)(9786002)(6636002)(110136005)(26005)(1076003)(8936002)(316002)(36906005)(356005)(336012)(5660300002)(426003)(70586007)(44832011)(508600001)(8676002)(70206006)(7696005)(82310400004)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2021 06:20:55.0712
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bf5fd42-74c9-4e50-7835-08d9ae496812
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0045.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7663
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Ben Levinsky <ben.levinsky@xilinx.com>

Add shutdown/wakeup a resource eemi operations to shutdown
or bringup a resource.

Note alignment of args matches convention of other fn's in this file.
The reason being that the long fn name results in aligned args that
otherwise go over 80 chars so shift right to avoid this

Signed-off-by: Ben Levinsky <ben.levinsky@xilinx.com>
Signed-off-by: Tanmay Shah <tanmay.shah@xilinx.com>
---
 drivers/firmware/xilinx/zynqmp.c     | 35 ++++++++++++++++++++++++++++
 include/linux/firmware/xlnx-zynqmp.h | 23 ++++++++++++++++++
 2 files changed, 58 insertions(+)

diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
index a3cadbaf3cba..e772404235c1 100644
--- a/drivers/firmware/xilinx/zynqmp.c
+++ b/drivers/firmware/xilinx/zynqmp.c
@@ -990,6 +990,41 @@ int zynqmp_pm_release_node(const u32 node)
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
index 92bf3ae20524..5da3d490e80e 100644
--- a/include/linux/firmware/xlnx-zynqmp.h
+++ b/include/linux/firmware/xlnx-zynqmp.h
@@ -12,6 +12,7 @@
 
 #ifndef __FIRMWARE_ZYNQMP_H__
 #define __FIRMWARE_ZYNQMP_H__
+#include <linux/types.h>
 
 #include <linux/err.h>
 
@@ -66,6 +67,8 @@
 
 enum pm_api_id {
 	PM_GET_API_VERSION = 1,
+	PM_FORCE_POWERDOWN = 8,
+	PM_REQUEST_WAKEUP = 10,
 	PM_SYSTEM_SHUTDOWN = 12,
 	PM_REQUEST_NODE = 13,
 	PM_RELEASE_NODE = 14,
@@ -435,6 +438,12 @@ int zynqmp_pm_pinctrl_get_config(const u32 pin, const u32 param,
 int zynqmp_pm_pinctrl_set_config(const u32 pin, const u32 param,
 				 u32 value);
 int zynqmp_pm_load_pdi(const u32 src, const u64 address);
+int zynqmp_pm_force_pwrdwn(const u32 target,
+			   const enum zynqmp_pm_request_ack ack);
+int zynqmp_pm_request_wake(const u32 node,
+			   const bool set_addr,
+			   const u64 address,
+			   const enum zynqmp_pm_request_ack ack);
 #else
 static inline int zynqmp_pm_get_api_version(u32 *version)
 {
@@ -620,6 +629,12 @@ static inline int zynqmp_pm_pinctrl_request(const u32 pin)
 	return -ENODEV;
 }
 
+static inline int zynqmp_pm_force_pwrdwn(const u32 target,
+					 const enum zynqmp_pm_request_ack ack)
+{
+	return -ENODEV;
+}
+
 static inline int zynqmp_pm_pinctrl_release(const u32 pin)
 {
 	return -ENODEV;
@@ -651,6 +666,14 @@ static inline int zynqmp_pm_load_pdi(const u32 src, const u64 address)
 {
 	return -ENODEV;
 }
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
2.25.1

