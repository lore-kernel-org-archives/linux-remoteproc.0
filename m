Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6C86C432C3
	for <linux-remoteproc@archiver.kernel.org>; Mon, 11 Jan 2021 02:04:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CAC98227C3
	for <linux-remoteproc@archiver.kernel.org>; Mon, 11 Jan 2021 02:04:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727177AbhAKCEU (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sun, 10 Jan 2021 21:04:20 -0500
Received: from mail-bn8nam08on2054.outbound.protection.outlook.com ([40.107.100.54]:6834
        "EHLO NAM04-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726915AbhAKCEU (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sun, 10 Jan 2021 21:04:20 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jj64Iz0MhM8cYZBQB3I9N/RZQF36nfrSRXFub9CVn2wypRQcRiaFC7vHFRP8GEUxZS8N7jKUE6cPnVQRmwejQ1V/9dba2N52ZpKmQxP+8cZdB3FBSAnKgiHEOwFmt7Yn9gLCO8DtCDEs8wTJJDx6guLX7AW+QDmSvnmF0fVFla9VPN1GEonXfdEeNQB9OlbO3i4u3anulFXvPsbV8gDq4MCB2l/CgM2YzjnrcWooIH9zP1IVzAZSkrU+AYq9py6lI081w63Ar3bT8sl2dgpHD4is7oMKbxEL2tVAd3xQJT69WwFMhxJEcfMi2IRLtQQ6tZR7fU1s8LmJXukR2RcdhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WWFgP7l8pqKGUtESE8T75P6omeKWVYOe+QztGNiDRdw=;
 b=mCJFSjFHtV9bVYqlWdxMt7Gz8zF/pBWu5x//q3swy0KGkASpp3GY0N6immhmTnLAxQ9twnUAaIMC9lAuJJGfqvw+9LN6WSo3WBjOfTEh2plaTcgb0VOHYn5VMYu6bR08AQ9FDTrfkMQzN3c7Rl5JpBtM220TUnotUWGNFDT8cKZw/BSDBzhxJ1J2wGKx6s2m9GqUoe5XwMyUo2uPQooLkgE9a1naHiN08zwcbrx/XKOm6tiw6ncKtsoFX2P308ByvJ8Jvt157S8/2marGsRnIPm6jjnthcBQvpA7GBuioBcCafdA65GVyZVmUNaxFPhXJSPCnMbaprp9/nKJ6g2lUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=linaro.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WWFgP7l8pqKGUtESE8T75P6omeKWVYOe+QztGNiDRdw=;
 b=tYkLjaFxlGRE8pq1zvLXCwJU73FfyavcRDF3wMJEGwx5So/6ufo8S28w2z5okWf6xjbhtZ+ReJ/g8SaQ9paB+8jtP3WE1KGMTrivBHBdH7WbKxOOr2+zHO4oWg0hXOPjNP1VVPaTtodKVO3aZgukAk1rzWy82yCL7hNfeOOxGtU=
Received: from SN4PR0501CA0145.namprd05.prod.outlook.com
 (2603:10b6:803:2c::23) by SJ0PR02MB7647.namprd02.prod.outlook.com
 (2603:10b6:a03:320::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Mon, 11 Jan
 2021 02:02:53 +0000
Received: from SN1NAM02FT015.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:2c:cafe::69) by SN4PR0501CA0145.outlook.office365.com
 (2603:10b6:803:2c::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.4 via Frontend
 Transport; Mon, 11 Jan 2021 02:02:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT015.mail.protection.outlook.com (10.152.72.109) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3742.6 via Frontend Transport; Mon, 11 Jan 2021 02:02:53 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Sun, 10 Jan 2021 18:02:50 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Sun, 10 Jan 2021 18:02:50 -0800
Envelope-to: michal.simek@xilinx.com,
 mathieu.poirier@linaro.org,
 devicetree@vger.kernel.org,
 linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Received: from [172.19.2.206] (port=48226 helo=xsjblevinsk50.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1kymXi-00008K-JT; Sun, 10 Jan 2021 18:02:50 -0800
From:   Ben Levinsky <ben.levinsky@xilinx.com>
To:     <mathieu.poirier@linaro.org>
CC:     <devicetree@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <michal.simek@xilinx.com>
Subject: [PATCH v25 3/5] firmware: xilinx: Add RPU configuration APIs
Date:   Sun, 10 Jan 2021 18:02:48 -0800
Message-ID: <20210111020250.6846-4-ben.levinsky@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210111020250.6846-1-ben.levinsky@xilinx.com>
References: <20210111020250.6846-1-ben.levinsky@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a9576a64-e13b-435a-2510-08d8b5d501ce
X-MS-TrafficTypeDiagnostic: SJ0PR02MB7647:
X-Microsoft-Antispam-PRVS: <SJ0PR02MB764721841E9EABC5C2F7F569B5AB0@SJ0PR02MB7647.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:820;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1F41GGPOi53qnppv2EAaVSNl0o4WUzj0p1VvEtuM6h/reKi5pylhuK1LRPLAF/Qospycxe7Xw3un8V/v06gOSeyHn4wkhlkJLDvi6PpQvjmrujIMsp/5e13t+KmwgZEqhuiysdfav6d5uAJZppKgyebvqAN6Xw5ncpFXEeY1uYcmFBDQwtIjQGuezRa8sAG4cQEA7r8Ej8EMG8tcnpr/7ftmcaPrxXKiBLAp1IokGDmHblTPfo9+qiII/5dOHR+1r3QXZKQ4FIZ+TXszRQcvfzMjbKCgPbEGj6vy8QSH3hbbQU7GbHm8UP2mv9yavL0ou+Hgs0Pzj/ghY2KeuSWVJhdc2p4u9m/knL/geObTDFG4cUMadb23YiC5W0M+DradgJIIbtMbzfaL7VlWIwa9khDwpyDOh1n8gpoBRJRuHJ936O9UT79U1Gdgu8MrJmfPs9yEMLmXOc6ceS11SaAaKlVKHgKkdtI1htIdM6mKKt0TvZv3Ogx0iMnfykaUnYtW07Yrm8vNq96dOGK7gbyOHA==
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(136003)(39850400004)(346002)(396003)(376002)(46966006)(356005)(478600001)(8676002)(2616005)(70586007)(70206006)(5660300002)(44832011)(6916009)(7696005)(7636003)(336012)(83380400001)(426003)(9786002)(2906002)(8936002)(1076003)(82740400003)(82310400003)(107886003)(54906003)(36906005)(4326008)(47076005)(26005)(186003)(316002)(36756003)(34020700004)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2021 02:02:53.5064
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a9576a64-e13b-435a-2510-08d8b5d501ce
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT015.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7647
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

This patch adds APIs to access to configure RPU and its
processor-specific memory.

That is query the run-time mode of RPU as either split or lockstep as well
as API to set this mode. In addition add APIs to access configuration of
the RPUs' tightly coupled memory (TCM).

Signed-off-by: Ben Levinsky <ben.levinsky@xilinx.com>
---
 drivers/firmware/xilinx/zynqmp.c     | 61 ++++++++++++++++++++++++++++
 include/linux/firmware/xlnx-zynqmp.h | 18 ++++++++
 2 files changed, 79 insertions(+)

diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
index a966ee956573..b390a00338d0 100644
--- a/drivers/firmware/xilinx/zynqmp.c
+++ b/drivers/firmware/xilinx/zynqmp.c
@@ -846,6 +846,67 @@ int zynqmp_pm_release_node(const u32 node)
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
index baa3d84fdcce..0ffd62d6740c 100644
--- a/include/linux/firmware/xlnx-zynqmp.h
+++ b/include/linux/firmware/xlnx-zynqmp.h
@@ -389,6 +389,9 @@ int zynqmp_pm_request_wake(const u32 node,
 			   const bool set_addr,
 			   const u64 address,
 			   const enum zynqmp_pm_request_ack ack);
+int zynqmp_pm_get_rpu_mode(u32 node_id, enum rpu_oper_mode *rpu_mode);
+int zynqmp_pm_set_rpu_mode(u32 node_id, u32 arg1);
+int zynqmp_pm_set_tcm_config(u32 node_id, u32 arg1);
 #else
 static inline struct zynqmp_eemi_ops *zynqmp_pm_get_eemi_ops(void)
 {
@@ -553,6 +556,21 @@ static inline int zynqmp_pm_request_wake(const u32 node,
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
2.17.1

