Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9127CC433EF
	for <linux-remoteproc@archiver.kernel.org>; Mon, 22 Nov 2021 05:39:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231305AbhKVFmP (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 22 Nov 2021 00:42:15 -0500
Received: from mail-bn8nam12on2070.outbound.protection.outlook.com ([40.107.237.70]:10358
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231280AbhKVFmP (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 22 Nov 2021 00:42:15 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n+i8fOmhXJBG552qha4mmvKvD9BQUw8Lgqrm9sV5m9P4kNDPyC+Dq5fU45POB/GlqBDDVkQNswxep9y/IJ346DBujP1dwROvCFX/6WYh9Qn9fBWpxENdzeNM9eWlnObpUbLMsWLFp2FXrQmCqsxNF0fWCkBF38A+yz3tFTi1hHggDKFQ0rBTdkouyfdK4lUFtZgX4HItNATVWc6mJa4vydWvcoUqY+v7tvWwewbR4wWcRMPoTEtziO+cPbpk9Le0KHcmsC1GJTVKDCbAFZPkTciy1+TSBKD7WPQi3z89JNq5ty2zNRbYyk0DDIsfOPpZ8WJE5GfWlYLyLoHxSwmldA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AWE2GQcviQ7Nh9mH5xRjQseI7U6QIk7l5Et0SAKC6Xc=;
 b=TSxQ58ycQYgiRK988T0FSG+Dm238o++0rRtBgwsZopROushEEOl1FQj0ecDvcEki12cMbd4Lnk1BdZ5XnmrDD+Vvb9LAXY96puq8sENDlgcmm/CeDX0LYC4SY29+31KNK7CfCUVoMmW/CrH0qorFfyGok2MsKWgSoASA2OYBTZYhvOOaz/jhQKnBfomNVF11pXmf0k1yPBcpG73PAu2Ps0zRjF7y6Z4cBmB9GLysfdzqS95IRJSHeGeXHgSXCXrPyD+Yugbh3WiJf/euU5kOiGbac+ejrZZafQM5STa9hbyeXtzU6U/G8v4/obB+MjlDVHUfvZVkDM6kQeeNlrJGwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=linaro.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AWE2GQcviQ7Nh9mH5xRjQseI7U6QIk7l5Et0SAKC6Xc=;
 b=XKBolDhoTE8nHhmK50kMsjZUcmOZXTFd6X6f5lY9u5QIoU7amb/4MaUigKAE5YPCFOgKI/8GcxdjWwE6bjuhOefwYUi5UgOMF0CZKJlqN6c50bdd7EEItASC0Gi/KShWzkA5xZMQi+JFmqG7bWO5ILw+sbn5wVM60Gk//n8i2tE=
Received: from SN4PR0201CA0062.namprd02.prod.outlook.com
 (2603:10b6:803:20::24) by SJ0PR02MB8516.namprd02.prod.outlook.com
 (2603:10b6:a03:3fc::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Mon, 22 Nov
 2021 05:39:06 +0000
Received: from SN1NAM02FT0048.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:20:cafe::bc) by SN4PR0201CA0062.outlook.office365.com
 (2603:10b6:803:20::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Mon, 22 Nov 2021 05:39:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0048.mail.protection.outlook.com (10.97.4.223) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4713.19 via Frontend Transport; Mon, 22 Nov 2021 05:39:06 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Sun, 21 Nov 2021 21:39:03 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Sun, 21 Nov 2021 21:39:03 -0800
Envelope-to: bjorn.andersson@linaro.org,
 mathieu.poirier@linaro.org,
 robh+dt@kernel.org,
 laurent.pinchart@ideasonboard.com,
 bill.mills@linaro.org,
 linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Received: from [172.19.3.14] (port=59046 helo=xsjtanmays50.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <tanmay.shah@xilinx.com>)
        id 1mp22h-000BOC-9M; Sun, 21 Nov 2021 21:39:03 -0800
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
Subject: [PATCH 4/6] firmware: xilinx: Add shutdown/wakeup APIs
Date:   Sun, 21 Nov 2021 21:38:54 -0800
Message-ID: <20211122053856.1342859-5-tanmay.shah@xilinx.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211122053856.1342859-1-tanmay.shah@xilinx.com>
References: <20211122053856.1342859-1-tanmay.shah@xilinx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7eaab05c-8519-4760-488a-08d9ad7a6687
X-MS-TrafficTypeDiagnostic: SJ0PR02MB8516:
X-Microsoft-Antispam-PRVS: <SJ0PR02MB8516B0A4E1EB58E8E3F38F3FCA9F9@SJ0PR02MB8516.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 909YgF2/NrNu76Cz0DHvZKikixv6UAyL74yzKkB/Bh8Bz/+vSUy6bv5cPR30k7vpYGdjGtLbVGJHVRnoNU7iaRyHb/Ts0ObaM6zfkQC/64ddpsEeGIlB24pDjt2OUXEZXq1O6IWuQ5x32Sx2DrvWEXdLKayc1p+XQeKZjsCUSNkxWdAJpb8pceo+sFUrBbUuIBgpRBtwL9BcK5ZWlJJCBjQgjOADi8BLx+QVtfbXNk4jphDBSKpGyMseNrcEHzHxyA2T5C3EMF7w1ja78t0j8cPMmdRAyrp7woDyiOU6QSCBIepmh+Okt6F7Alf1RJp+tTrxCQLd+QI187HXlllwEe1j+7EM182BPnXCW9iEytIIsulwFSSPjXu82gYwEFDDVrgVzGSt+Ml+oszLpKHh3XCqc6S0yH9hJl4AI6pEjCsKs/ZxZxlW8av6JN4AEXyNri68fTgEPgzg+FOrwtHR+WSUPE050HotZ1WW5LhegOHkxrGzhyE3ZjN4guHV9VhrggQeVue/bqMSg8SqY2DSbBWmi97EoLYJLilQbGp8h4H/24hhqWdIwz3/EfR5s2rCTQ9lJpRclmIdWsdtd+IU/ha7TEaXm3pGVh3OHE8IcSoQGyEmwtKCHWzBZTR5TuR/dnu3SBYkknl5zBQ3DKtMAKCOfV3XnKiryCttuH62c/LC9cU7M5kp5DeBLUEGZzQwBDPP3p3aHYiLtFaV14/qo2d0lOa0/WCRCiVF9YFVvoA=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(46966006)(36840700001)(2906002)(83380400001)(36756003)(8936002)(44832011)(54906003)(336012)(426003)(316002)(26005)(1076003)(2616005)(508600001)(82310400003)(4326008)(6636002)(36906005)(70586007)(110136005)(8676002)(47076005)(356005)(7696005)(7636003)(70206006)(9786002)(36860700001)(186003)(5660300002)(6666004)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2021 05:39:06.6593
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7eaab05c-8519-4760-488a-08d9ad7a6687
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0048.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB8516
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

diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zyn=
qmp.c
index a3cadbaf3cba..e772404235c1 100644
--- a/drivers/firmware/xilinx/zynqmp.c
+++ b/drivers/firmware/xilinx/zynqmp.c
@@ -990,6 +990,41 @@ int zynqmp_pm_release_node(const u32 node)
 }
 EXPORT_SYMBOL_GPL(zynqmp_pm_release_node);

+/**
+ * zynqmp_pm_force_pwrdwn - PM call to request for another PU or subsystem=
 to
+ *             be powered down forcefully
+ * @node:  Node ID of the targeted PU or subsystem
+ * @ack:   Flag to specify whether acknowledge is requested
+ *
+ * Return: status, either success or error+reason
+ */
+int zynqmp_pm_force_pwrdwn(const u32 node,
+                          const enum zynqmp_pm_request_ack ack)
+{
+       return zynqmp_pm_invoke_fn(PM_FORCE_POWERDOWN, node, ack, 0, 0, NUL=
L);
+}
+EXPORT_SYMBOL_GPL(zynqmp_pm_force_pwrdwn);
+
+/**
+ * zynqmp_pm_request_wake - PM call to wake up selected master or subsyste=
m
+ * @node:  Node ID of the master or subsystem
+ * @set_addr:  Specifies whether the address argument is relevant
+ * @address:   Address from which to resume when woken up
+ * @ack:   Flag to specify whether acknowledge requested
+ *
+ * Return: status, either success or error+reason
+ */
+int zynqmp_pm_request_wake(const u32 node,
+                          const bool set_addr,
+                          const u64 address,
+                          const enum zynqmp_pm_request_ack ack)
+{
+       /* set_addr flag is encoded into 1st bit of address */
+       return zynqmp_pm_invoke_fn(PM_REQUEST_WAKEUP, node, address | set_a=
ddr,
+                                  address >> 32, ack, NULL);
+}
+EXPORT_SYMBOL_GPL(zynqmp_pm_request_wake);
+
 /**
  * zynqmp_pm_set_requirement() - PM call to set requirement for PM slaves
  * @node:              Node ID of the slave
diff --git a/include/linux/firmware/xlnx-zynqmp.h b/include/linux/firmware/=
xlnx-zynqmp.h
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
        PM_GET_API_VERSION =3D 1,
+       PM_FORCE_POWERDOWN =3D 8,
+       PM_REQUEST_WAKEUP =3D 10,
        PM_SYSTEM_SHUTDOWN =3D 12,
        PM_REQUEST_NODE =3D 13,
        PM_RELEASE_NODE =3D 14,
@@ -435,6 +438,12 @@ int zynqmp_pm_pinctrl_get_config(const u32 pin, const =
u32 param,
 int zynqmp_pm_pinctrl_set_config(const u32 pin, const u32 param,
                                 u32 value);
 int zynqmp_pm_load_pdi(const u32 src, const u64 address);
+int zynqmp_pm_force_pwrdwn(const u32 target,
+                          const enum zynqmp_pm_request_ack ack);
+int zynqmp_pm_request_wake(const u32 node,
+                          const bool set_addr,
+                          const u64 address,
+                          const enum zynqmp_pm_request_ack ack);
 #else
 static inline int zynqmp_pm_get_api_version(u32 *version)
 {
@@ -620,6 +629,12 @@ static inline int zynqmp_pm_pinctrl_request(const u32 =
pin)
        return -ENODEV;
 }

+static inline int zynqmp_pm_force_pwrdwn(const u32 target,
+                                        const enum zynqmp_pm_request_ack a=
ck)
+{
+       return -ENODEV;
+}
+
 static inline int zynqmp_pm_pinctrl_release(const u32 pin)
 {
        return -ENODEV;
@@ -651,6 +666,14 @@ static inline int zynqmp_pm_load_pdi(const u32 src, co=
nst u64 address)
 {
        return -ENODEV;
 }
+
+static inline int zynqmp_pm_request_wake(const u32 node,
+                                        const bool set_addr,
+                                        const u64 address,
+                                        const enum zynqmp_pm_request_ack a=
ck)
+{
+       return -ENODEV;
+}
 #endif

 #endif /* __FIRMWARE_ZYNQMP_H__ */
--
2.25.1

This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.
