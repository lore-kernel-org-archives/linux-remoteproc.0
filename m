Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAF64C433F5
	for <linux-remoteproc@archiver.kernel.org>; Mon, 22 Nov 2021 05:39:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232258AbhKVFmV (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 22 Nov 2021 00:42:21 -0500
Received: from mail-bn8nam11on2040.outbound.protection.outlook.com ([40.107.236.40]:31461
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231625AbhKVFmR (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 22 Nov 2021 00:42:17 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SCkpggu0/7y8x7ry5cJjOZ5GBaNWnRNGqWZoHzHqiVxa3RiMXDCfg1YLZ8LS5xuRzAeQxIwbNSNruxY7d9fiGh1UADDMEsRaBQzwWnJdtI2vXnz+B+W1jIrcPOOZAtgCwdqyr2E5MIPYVpHoK4BQWFlC8TqgOGLSdmYPvMIhqrVbsxkWpG0jF33VtirxlSQ2mv1fG9/k9ShqG0dUDwCB+8emeDEoFfF/4C1EWOHFoEWt4bfjQSSy4JigXFtOhzHaH00AKPBglJAfYNQpL3KCGf2JYNsbiJdtUWPZ6pHD3uijbHtjmiewxNW5rTsq3ULKkxUrHmcxKuOtpmZUlqO4mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VYeWvmhjQRmP8q5C6DdOiVq8/4IvHsk6/9hV0sfyNK0=;
 b=iO21PpFKHyttoi9UXhG5oVe/9QeJ1gGNwKQZPIFfg6GAtUGwj0vjbhpIup7Rf74jHrWuAr6xI5eP1efmCPyj6WKTFSwZs/fjwG/yqwhiFCmBHXtVz+R08RWcDm8SGzOFPV6V6KVFd/zUbTDSwPHbf338lqbs0terP82zhd7up6u7rTajVuz37iJTd9gHbPNRKzAcsp7UhEm7kNaKq+SslCrBhf4q9/rxAYfaMdairGwZPiUaPUK5yb7QAAIjw/+9pHVtMgdGJcY4wekBPwJVMpozzyHKi5wpgOpz5Vv2sFt4PIAiSrRsJSasrZQhEv2YSXxxJaFFHgbPfYC75fUKEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=linaro.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VYeWvmhjQRmP8q5C6DdOiVq8/4IvHsk6/9hV0sfyNK0=;
 b=ewYrP+WFW/CPudCqiT/2oTtNN3oKcwuZSKUDwlIaqe5lUKkGTELAsYJTViOkWdimKQgDKvEr8otAsEH8+xxrmn6iT9Xh4u0bP58M2Lu8gIcawFz7qXqX8FIhiTLCTVhkEEJpR9L/0Tlhcxq5zzM4b7TSHOTsJqoW59Yh8X0hRRg=
Received: from SN4PR0201CA0049.namprd02.prod.outlook.com
 (2603:10b6:803:20::11) by SN6PR02MB4765.namprd02.prod.outlook.com
 (2603:10b6:805:9b::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Mon, 22 Nov
 2021 05:39:09 +0000
Received: from SN1NAM02FT0048.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:20:cafe::f3) by SN4PR0201CA0049.outlook.office365.com
 (2603:10b6:803:20::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Mon, 22 Nov 2021 05:39:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0048.mail.protection.outlook.com (10.97.4.223) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4713.19 via Frontend Transport; Mon, 22 Nov 2021 05:39:08 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
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
        id 1mp22h-000BOC-AI; Sun, 21 Nov 2021 21:39:03 -0800
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
Subject: [PATCH 5/6] firmware: xilinx: Add RPU configuration APIs
Date:   Sun, 21 Nov 2021 21:38:55 -0800
Message-ID: <20211122053856.1342859-6-tanmay.shah@xilinx.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211122053856.1342859-1-tanmay.shah@xilinx.com>
References: <20211122053856.1342859-1-tanmay.shah@xilinx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8a2b8be0-0177-479d-a01b-08d9ad7a67e5
X-MS-TrafficTypeDiagnostic: SN6PR02MB4765:
X-Microsoft-Antispam-PRVS: <SN6PR02MB4765067B42EB1322782F309BCA9F9@SN6PR02MB4765.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:820;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cIqma1JHzeIFIIgw0srz9IRa1EBZMfkI4gxJqzFkwz3CqjO8lJA+Z3KlEXyzXWwrdXe6NCfb0MoMtKMerNYskhIjHDSA3yQOT4ZSZjNpshHWOqEQq2M+WTBtlQSkCQpEziioqNRbPki6fZhy5d3hffjv+aH2xhGkg1naZYb67Lnmw8GaEAOlGS0f76BQReTjFGkmZqlw/+ILbbZvhbo7g9HlUTH0m8ZeXi5hxqcAtpokmXGuwuno19ojQc2K2vGxdGavThnY5SNHE1yo/MH/0x5xHamQZUMk/807jIkSnrtQhfQxbzWvC6oR/R1DAEsEE1VJ54c8PIJn8jweswsjsB7sN78qTOoWNglNbIcFJ/luQD00BXJ27rDTayBQuOUB+U+pACWhI15F+bGG3MxJ3gG/+yZBAAvrj0zNqoswqBar6A5KBt38aJqD9qWsE+sEIpw7lxc4JK3wC7iV9LevE78mv+mdpk5ne2jQL3NO4L1Cut/4BbiJgMSz2YQKBHT5jjLlSAz2cFdrOsz2BaKUBBpRu89Pjqs6OZAfpSyWrlIIMcTvnfItAscF3cuvTeP/RZcP1khVuiwivybRAJaoUpF3ZWBpjm1+nXTGduhEkkxZpPxDBXtedkrFdQOp74drVlVuREwkl/ETLEWXHgTIEkbFYu4B7zLg8C04YDIja8dsxvLinyh3wr8+kN15PJg05gn4+ecsAGqRld3CnnPtrMtG8wROATx9u4zGqDzyHxM=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(36840700001)(46966006)(7696005)(6636002)(5660300002)(6666004)(426003)(110136005)(356005)(26005)(4326008)(336012)(1076003)(36860700001)(82310400003)(186003)(9786002)(8936002)(70586007)(83380400001)(36756003)(8676002)(508600001)(2906002)(36906005)(7636003)(47076005)(54906003)(316002)(70206006)(2616005)(44832011)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2021 05:39:08.9553
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a2b8be0-0177-479d-a01b-08d9ad7a67e5
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0048.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4765
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Ben Levinsky <ben.levinsky@xilinx.com>

This patch adds APIs to access to configure RPU and its
processor-specific memory.

That is query the run-time mode of RPU as either split or lockstep as well
as API to set this mode. In addition add APIs to access configuration of
the RPUs' tightly coupled memory (TCM).

Signed-off-by: Ben Levinsky <ben.levinsky@xilinx.com>
Signed-off-by: Tanmay Shah <tanmay.shah@xilinx.com>
---
 drivers/firmware/xilinx/zynqmp.c     | 61 ++++++++++++++++++++++++++++
 include/linux/firmware/xlnx-zynqmp.h | 18 ++++++++
 2 files changed, 79 insertions(+)

diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zyn=
qmp.c
index e772404235c1..908d5b0d6947 100644
--- a/drivers/firmware/xilinx/zynqmp.c
+++ b/drivers/firmware/xilinx/zynqmp.c
@@ -990,6 +990,67 @@ int zynqmp_pm_release_node(const u32 node)
 }
 EXPORT_SYMBOL_GPL(zynqmp_pm_release_node);

+/**
+ * zynqmp_pm_get_rpu_mode() - Get RPU mode
+ * @node_id:   Node ID of the device
+ * @rpu_mode:  return by reference value
+ *             either split or lockstep
+ *
+ * Return:     return 0 on success or error+reason.
+ *             if success, then  rpu_mode will be set
+ *             to current rpu mode.
+ */
+int zynqmp_pm_get_rpu_mode(u32 node_id, enum rpu_oper_mode *rpu_mode)
+{
+       u32 ret_payload[PAYLOAD_ARG_CNT];
+       int ret;
+
+       ret =3D zynqmp_pm_invoke_fn(PM_IOCTL, node_id,
+                                 IOCTL_GET_RPU_OPER_MODE, 0, 0, ret_payloa=
d);
+
+       /* only set rpu_mode if no error */
+       if (ret =3D=3D XST_PM_SUCCESS)
+               *rpu_mode =3D ret_payload[0];
+
+       return ret;
+}
+EXPORT_SYMBOL_GPL(zynqmp_pm_get_rpu_mode);
+
+/**
+ * zynqmp_pm_set_rpu_mode() - Set RPU mode
+ * @node_id:   Node ID of the device
+ * @rpu_mode:  Argument 1 to requested IOCTL call. either split or lockste=
p
+ *
+ *             This function is used to set RPU mode to split or
+ *             lockstep
+ *
+ * Return:     Returns status, either success or error+reason
+ */
+int zynqmp_pm_set_rpu_mode(u32 node_id, enum rpu_oper_mode rpu_mode)
+{
+       return zynqmp_pm_invoke_fn(PM_IOCTL, node_id,
+                                  IOCTL_SET_RPU_OPER_MODE, (u32)rpu_mode,
+                                  0, NULL);
+}
+EXPORT_SYMBOL_GPL(zynqmp_pm_set_rpu_mode);
+
+/**
+ * zynqmp_pm_set_tcm_config - configure TCM
+ * @tcm_mode:  Argument 1 to requested IOCTL call
+ *              either PM_RPU_TCM_COMB or PM_RPU_TCM_SPLIT
+ *
+ * This function is used to set RPU mode to split or combined
+ *
+ * Return: status: 0 for success, else failure
+ */
+int zynqmp_pm_set_tcm_config(u32 node_id, enum rpu_tcm_comb tcm_mode)
+{
+       return zynqmp_pm_invoke_fn(PM_IOCTL, node_id,
+                                  IOCTL_TCM_COMB_CONFIG, (u32)tcm_mode, 0,
+                                  NULL);
+}
+EXPORT_SYMBOL_GPL(zynqmp_pm_set_tcm_config);
+
 /**
  * zynqmp_pm_force_pwrdwn - PM call to request for another PU or subsystem=
 to
  *             be powered down forcefully
diff --git a/include/linux/firmware/xlnx-zynqmp.h b/include/linux/firmware/=
xlnx-zynqmp.h
index 5da3d490e80e..eea9bb5990ea 100644
--- a/include/linux/firmware/xlnx-zynqmp.h
+++ b/include/linux/firmware/xlnx-zynqmp.h
@@ -444,6 +444,9 @@ int zynqmp_pm_request_wake(const u32 node,
                           const bool set_addr,
                           const u64 address,
                           const enum zynqmp_pm_request_ack ack);
+int zynqmp_pm_get_rpu_mode(u32 node_id, enum rpu_oper_mode *rpu_mode);
+int zynqmp_pm_set_rpu_mode(u32 node_id, u32 arg1);
+int zynqmp_pm_set_tcm_config(u32 node_id, u32 arg1);
 #else
 static inline int zynqmp_pm_get_api_version(u32 *version)
 {
@@ -674,6 +677,21 @@ static inline int zynqmp_pm_request_wake(const u32 nod=
e,
 {
        return -ENODEV;
 }
+
+static inline int zynqmp_pm_get_rpu_mode(u32 node_id, enum rpu_oper_mode *=
rpu_mode)
+{
+       return -ENODEV;
+}
+
+static inline int zynqmp_pm_set_rpu_mode(u32 node_id, u32 arg1)
+{
+       return -ENODEV;
+}
+
+static inline int zynqmp_pm_set_tcm_config(u32 node_id, u32 arg1)
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
