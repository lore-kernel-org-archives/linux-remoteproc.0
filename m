Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41649C433EF
	for <linux-remoteproc@archiver.kernel.org>; Tue, 23 Nov 2021 06:21:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229816AbhKWGYX (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 23 Nov 2021 01:24:23 -0500
Received: from mail-bn8nam11on2062.outbound.protection.outlook.com ([40.107.236.62]:65089
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233740AbhKWGYU (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 23 Nov 2021 01:24:20 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IVZvoGuf5/TzagUwZAVKx7UkoKMLt0izGBVJdIKDnLj1X26FgHRXf6OKf8+uui1WY2m8RD/4+EOAxBPqy7ER3x6PROajyMoQUBpzyCq0bDk0JlvmX9iD14Fh9qC6lqLFABny+mwstswXLK+VtyY2k49JzowPooxe+5Ny2wotoITbw7bLlyKP/N0m0hOxs/V5o+zmBVmbHjtfKSSXK1QcyAr7wfqOzZ/3U3PpzFjcAaT79OINMdrzICntnQ/B6LdUuJnWf3N4pgzxKqSB1SI3dCTq6jrQpmj6QV8MmfbUHp1f6by62zT/XkYf68+795GLp4PKdcJrxke9B00m8/C9Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rygpenm2xrjI7ZUrIbGAWqpi+DPbrOdNInErZybvbfE=;
 b=NR6kf1G/lg+XZifLAKumt0F0CQwSSONqW84bcBQGxAix91j/QICbrEdEjwHl9WZHkwDE3rctOEvYrtqYyekPwTSi75r+RSXeY+X3uzSX0A7a51CSIc/8k/OkbTvBAFCJJK0FwpSb2K1PzmxQkRFCgDpBPCAgrUtBcfGu72dG5bwBrVptj3OH2iV+M3lttlP/GiZQn5l4HB9KCb4EfsJlfm/O8uXv0ruTcILwNqi8RWEdZM54afv0XlnygXM/p7a4bKm9dK+DoN315dwVxdm45COzYiCoYtA08dURY4aS1vWRJ+lIeHXrg42y8Ogu57GBYNKN2vxKxqp7lu4T69+tyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=linaro.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rygpenm2xrjI7ZUrIbGAWqpi+DPbrOdNInErZybvbfE=;
 b=TK3xZpZtI+9TPHTd3Mg1bB0Bb3h7J5UVIMbI7+Jb7kETheSTPvQ4x3PRY8Bk240cqVugpKHWXfKLpO2VNcYAdKXtDXLIIVNX4fAUzDx2HI7YqMBH0RiND9H5QtlCQT+XbeqGnO30GwzH/d3KziXQ6aICFH+EP8saqWKBZ+v7a8s=
Received: from BN9PR03CA0525.namprd03.prod.outlook.com (2603:10b6:408:131::20)
 by SA2PR02MB7788.namprd02.prod.outlook.com (2603:10b6:806:135::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Tue, 23 Nov
 2021 06:21:11 +0000
Received: from BN1NAM02FT046.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:131:cafe::99) by BN9PR03CA0525.outlook.office365.com
 (2603:10b6:408:131::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.20 via Frontend
 Transport; Tue, 23 Nov 2021 06:21:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT046.mail.protection.outlook.com (10.13.3.181) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4713.19 via Frontend Transport; Tue, 23 Nov 2021 06:21:10 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
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
        id 1mpPAk-0001Zw-3R; Mon, 22 Nov 2021 22:20:54 -0800
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
Subject: [PATCH v2 5/6] firmware: xilinx: Add RPU configuration APIs
Date:   Mon, 22 Nov 2021 22:20:49 -0800
Message-ID: <20211123062050.1442712-6-tanmay.shah@xilinx.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211123062050.1442712-1-tanmay.shah@xilinx.com>
References: <20211123062050.1442712-1-tanmay.shah@xilinx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 45dcde2a-eddc-47f8-6e08-08d9ae497178
X-MS-TrafficTypeDiagnostic: SA2PR02MB7788:
X-Microsoft-Antispam-PRVS: <SA2PR02MB778805782E48FBF811004A9BCA609@SA2PR02MB7788.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:820;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 45EXa8oXaSB6BoAlY+fICU8X9JSrHlDqOpUvo9zj44XP1Q0Y0/0rIW4Z4VPbMYU8AXnX8Ewv1gYgUMmPdujS3yfwp+bape6P8slKgo/i9egfDvR7uy+sWn/0y7vsz53N+jlbxoVewRBQaVmriw2Hz3t5NM/Z8g67PJIP0tpZH9gDPqT+tvXDVKYha1DbWwKzOUwFU8WRumhfunmejKli7c6+ZQdNmNaQVczpSe87f6dvRPm4w3UyQCdN3Rbq1bTMyqV9HZVT37fWwsHYDMBW8chzjtzZ+L9zrmhs09edvcke05gKVSceaZOR6QzbWl2hCmS335/3j15FSD1CDb+/Rp7gnRx4edmBk7YZ/Q/IE7RLPFH7R3Va8i+RPkQTbdce8OgVKPfRqhmRSbP5jJpHc2A3PfWikCp5m3/z/5HAAuSBZ9OhE9cfG8eaui9dxpCiHFQ6EnqlR08aHp5aRUzpDe1sAqTSPQcaAUyTVVv7Nscuqz8WYKwBlCVfkYDQFibcAbR90SBgYkvL9Vfm+YFWq+d3zaf88HRvrk45AzHLE6vgzyUD0cE+f2FFyzYLKWCCd/1vbUF6W62T6KYQlblDzJ1upX+h5eyp1d7eFS+MQqM9soyaKH4qHO8GSOarCujS4XG6JdiBOeCrSRLJyaoV1WaDYz6jDF5/2XeIMi89XcqeSeTJg7Z8AXWm2acvW33dNEPZgDqm61pqrgm+0SJTDIPVjigJh7XMvXW67CW3YyM=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(46966006)(36840700001)(7696005)(2616005)(47076005)(1076003)(6636002)(5660300002)(426003)(82310400004)(356005)(7636003)(44832011)(36756003)(336012)(186003)(54906003)(4326008)(36906005)(508600001)(70206006)(316002)(8936002)(36860700001)(8676002)(110136005)(2906002)(9786002)(6666004)(70586007)(83380400001)(26005)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2021 06:21:10.7700
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 45dcde2a-eddc-47f8-6e08-08d9ae497178
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT046.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR02MB7788
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

diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
index e772404235c1..908d5b0d6947 100644
--- a/drivers/firmware/xilinx/zynqmp.c
+++ b/drivers/firmware/xilinx/zynqmp.c
@@ -990,6 +990,67 @@ int zynqmp_pm_release_node(const u32 node)
 }
 EXPORT_SYMBOL_GPL(zynqmp_pm_release_node);
 
+/**
+ * zynqmp_pm_get_rpu_mode() - Get RPU mode
+ * @node_id:	Node ID of the device
+ * @rpu_mode:	return by reference value
+ *		either split or lockstep
+ *
+ * Return:	return 0 on success or error+reason.
+ *		if success, then  rpu_mode will be set
+ *		to current rpu mode.
+ */
+int zynqmp_pm_get_rpu_mode(u32 node_id, enum rpu_oper_mode *rpu_mode)
+{
+	u32 ret_payload[PAYLOAD_ARG_CNT];
+	int ret;
+
+	ret = zynqmp_pm_invoke_fn(PM_IOCTL, node_id,
+				  IOCTL_GET_RPU_OPER_MODE, 0, 0, ret_payload);
+
+	/* only set rpu_mode if no error */
+	if (ret == XST_PM_SUCCESS)
+		*rpu_mode = ret_payload[0];
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(zynqmp_pm_get_rpu_mode);
+
+/**
+ * zynqmp_pm_set_rpu_mode() - Set RPU mode
+ * @node_id:	Node ID of the device
+ * @rpu_mode:	Argument 1 to requested IOCTL call. either split or lockstep
+ *
+ *		This function is used to set RPU mode to split or
+ *		lockstep
+ *
+ * Return:	Returns status, either success or error+reason
+ */
+int zynqmp_pm_set_rpu_mode(u32 node_id, enum rpu_oper_mode rpu_mode)
+{
+	return zynqmp_pm_invoke_fn(PM_IOCTL, node_id,
+				   IOCTL_SET_RPU_OPER_MODE, (u32)rpu_mode,
+				   0, NULL);
+}
+EXPORT_SYMBOL_GPL(zynqmp_pm_set_rpu_mode);
+
+/**
+ * zynqmp_pm_set_tcm_config - configure TCM
+ * @tcm_mode:	Argument 1 to requested IOCTL call
+ *              either PM_RPU_TCM_COMB or PM_RPU_TCM_SPLIT
+ *
+ * This function is used to set RPU mode to split or combined
+ *
+ * Return: status: 0 for success, else failure
+ */
+int zynqmp_pm_set_tcm_config(u32 node_id, enum rpu_tcm_comb tcm_mode)
+{
+	return zynqmp_pm_invoke_fn(PM_IOCTL, node_id,
+				   IOCTL_TCM_COMB_CONFIG, (u32)tcm_mode, 0,
+				   NULL);
+}
+EXPORT_SYMBOL_GPL(zynqmp_pm_set_tcm_config);
+
 /**
  * zynqmp_pm_force_pwrdwn - PM call to request for another PU or subsystem to
  *             be powered down forcefully
diff --git a/include/linux/firmware/xlnx-zynqmp.h b/include/linux/firmware/xlnx-zynqmp.h
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
@@ -674,6 +677,21 @@ static inline int zynqmp_pm_request_wake(const u32 node,
 {
 	return -ENODEV;
 }
+
+static inline int zynqmp_pm_get_rpu_mode(u32 node_id, enum rpu_oper_mode *rpu_mode)
+{
+	return -ENODEV;
+}
+
+static inline int zynqmp_pm_set_rpu_mode(u32 node_id, u32 arg1)
+{
+	return -ENODEV;
+}
+
+static inline int zynqmp_pm_set_tcm_config(u32 node_id, u32 arg1)
+{
+	return -ENODEV;
+}
 #endif
 
 #endif /* __FIRMWARE_ZYNQMP_H__ */
-- 
2.25.1

