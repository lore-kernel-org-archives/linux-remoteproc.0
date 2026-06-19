Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012050.outbound.protection.outlook.com [40.107.209.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350B93B42C2;
	Fri, 19 Jun 2026 16:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781887151; cv=fail; b=IdY9csBHB2oZg+JwjBsVpWofyeM8kJkUbV1YNhfiYcWQNOpjXXeWGCk3qSlCyUCJytG9rlBqMT3Xl0MuU32uFCw6AF4zT3apiDixCP5ktYQftqtWJ5x1asnDVdqh8TIUv2wYCillisp0D+lCjVoCRrtpyasxqWkIZKpe8j/+28A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781887151; c=relaxed/simple;
	bh=WrBMsZ20yahfnMMhFkhRTEOVdCrRoszDSItQYiqZGNM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Rtrf+kEe0pqbeXGergLUskjNTTOcqOhbI+MGZ4jStfinxW6tnpKgsMSXiLxPTVxy7F/u8TTRjM0NL4na4/LM9rPmLkTWHbvykkaFzk2pDndWxpWOPbQLRUKE2fen/EmgQLPgZv3udeH61F+fibKnRCio67O4xyrITxyCEh4Hja0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=472nyCkC; arc=fail smtp.client-ip=40.107.209.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="472nyCkC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SUvDXNPbwYmw33ndM/+ZDJ8y8QvcWkP3ztnJ11YRcBqrE4u1vTs40zpsgAkBPgbaDGbnaij3/iUH9w9hdVk2o9jR6uUWUUVUdSQqxHuTW+HWz1V//TbCSIXBSMoyFu8+h2rtbDwM0CJvuQvZ2x3p809k5slTCnU3zID0diKp3ZTr04HqlJPp2ZLDjYlxZX0A8T9KHz7fzjS6iM1A7cJ+odL3i4hAUJwL5RivCZXVx8dTX4HkzH48pw/QV5V8gET408Mg7yQLAH1f3qqkLvMTiraQ4ikRJGD5fi1TzRfxvv7ByIiCOhxEd/ZhQj0QpitSJA6JuSVuvO752dAN298CRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xGIUhLK2kjntcnS3eF32TJCm4Stv4lpd5OZ2JV9VDik=;
 b=aP1ancZZlX7aG78vZYyzCnWHccgfFih8WSt2mw+XNPN6tYDzz/CtKOxj3qKaG5vO24p4eAdmeRHN6RydSZAm0jh1JlQrzhJxGM4cwK8UVT1hPBCE8K+dVLsD7o9hy5tUBAjskCVnyXAM+xI9KtK2KLeUsa+t+o+LVfJYI4oz4DEpCANxjemSjbrR4TKS/RMRbPyAJLCYiIuon0PQCy7rJSMbSLG4rmU/7L6rFVdhubBH6tOxpZKhm0hYBdIrRXgxaUpvJzQt2XZkKZHuBkG/CinNohegFuS/MjhGnaLrw5Q8cL0lmCTobDuPKBSpL/ffceUDghTNOxKcwBxMUEa8pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xGIUhLK2kjntcnS3eF32TJCm4Stv4lpd5OZ2JV9VDik=;
 b=472nyCkCcmCL6koazzM8IAnOECvMLYx18o2bsZ5dpLZJKOZJSc0rMctamSExDukSpAiu3k1QfNE1iaW59PcGPwgUlrY/MCP61+0+IqhiQG4hxVDkjCvFmUyI+5Lmt6+fxnVf7wLpiIlX0/UA/hP+ZLca4g4dzn3M2gT2Fl3Hwus=
Received: from CH5PR03CA0014.namprd03.prod.outlook.com (2603:10b6:610:1f1::16)
 by IA1PR12MB6188.namprd12.prod.outlook.com (2603:10b6:208:3e4::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 19 Jun
 2026 16:39:05 +0000
Received: from CH1PEPF0000AD76.namprd04.prod.outlook.com
 (2603:10b6:610:1f1:cafe::45) by CH5PR03CA0014.outlook.office365.com
 (2603:10b6:610:1f1::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.14 via Frontend Transport; Fri,
 19 Jun 2026 16:39:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH1PEPF0000AD76.mail.protection.outlook.com (10.167.244.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Fri, 19 Jun 2026 16:39:05 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 19 Jun
 2026 11:39:05 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 19 Jun
 2026 11:39:04 -0500
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 19 Jun 2026 11:39:04 -0500
From: Tanmay Shah <tanmay.shah@amd.com>
To: <michal.simek@amd.com>, <andersson@kernel.org>,
	<mathieu.poirier@linaro.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-remoteproc@vger.kernel.org>, Tanmay Shah <tanmay.shah@amd.com>
Subject: [PATCH] remoteproc: xlnx: refactor start & stop ops
Date: Fri, 19 Jun 2026 09:38:54 -0700
Message-ID: <20260619163854.410392-1-tanmay.shah@amd.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD76:EE_|IA1PR12MB6188:EE_
X-MS-Office365-Filtering-Correlation-Id: 674490fb-b428-4f6c-68ed-08dece2146f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|82310400026|1800799024|36860700016|11063799006|56012099006|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	s+yhdKGJ43YMTSOSMuNFGxSreP9EO8eKALZtF6zquP6hBP8veXYlAtiP/5LWyTm3VXgAHl7tQtnTjLtslVvPGlb9pbZ+Oasd6dazxeNp4oSuYlixjkqwbHPzmRX6jib3VAMUiGnM2WqZOpnJ99yGFSyNcG+iZqVb232pL9fqvjKOuXpVfnxNjt98AE0HhJa3I4TJ+SOOHBEGm2SnoaWuoxgPxX8xzdCRNYCl5jyqL7I1F4Y1RalmLJ7AuW6BkYsfpp8u0QrXVLyB3H3LOJL4d7MRMI8Sa14ppUuYd0lV/FyuCodAYzz/C2gWNtK3YaP2BWvyTuNisRvFmvTs18juKY9J4G2zfOTShbzuk40VCg9WHNNexGh8HG9puntmu4ms52hhMbnZ7vALB3FQjW7/cNgZzt81XBui1DnPXKJATbCkM1ja6i/0T9u7iwtn0c7FIPvjJ64q4P5t5rqd43SOdtiRn7WEujdunmlWt7l3nflNMOGMdDo7d8zI3OaNIblrwC27uM7PkWVE1n1BCS87EwsSLcVVZzdZU0S+tIarIg78ynyGhkSEbUZX/xGfZcWi38tqkvudgSuS4b1KmDjaBojDoB/H6gwHlqOph8uVeuBHJqJK310PMcxA4Qnbiatr67a1zWrnkDkDlkBQOejO4gUDpz9zWLCZWsp9/0FuyLfxGR8lj04lOLA3nvDCxARb56pAhGeFki8Zm67MeyFC4g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(82310400026)(1800799024)(36860700016)(11063799006)(56012099006)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	VsvEc/rFhlkm3yBIyymV2m+q5rfkVpjEov1zEgVqVUE+90KUK0FXEBK5ZnK6SXBs6vZF8fm3EMG6mZz3OylaSfMMNWMLN3mALwRUp2EDDH2NkDiKZVjlMnOWRQvj+1UIsL50Q2D3o3s9IdzhJKPCEYWQUdTJfHSX8QziOH4UYcfrvjGIU81y22HwMJAJI3E2f399qTx46WR8hV3q7CmoORC5uQ+F5LTuMFrLtclVKkyBIY6OvUmG10SeKDNnlvgbWq/3vq8nVfn8RapV67iJ1QydDJidwMwAcPxrX3pVWwUteINS1r/NraWS3wI1HmnK6z40qm5tUMlUab0tBV7GSZTyrXvr+Ijq1ArxI+95HaNnHGc+u3w/qPcGWLtawr+/h0ZiMoe5SjrhJXnqN+uKfCH+KSyHjGcUKXGxAYg0768QPQo7i0ZxnaDx7O1QquDF
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 16:39:05.2378
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 674490fb-b428-4f6c-68ed-08dece2146f1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD76.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6188

Current _start and _stop ops are implemented using various APIs from the
platform management firmware driver. Instead provide respective RPU
start and stop API in the firmware driver and move the logic to interact
with the PM firmware in the firmware driver. The remoteproc driver doesn't
need to know actual logic, but only the final result i.e. RPU start/stop
was success or not. This refactor keeps the remoteproc driver simple and
moves firmware interaction logic to the firmware driver.

Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
---
 drivers/firmware/xilinx/zynqmp.c        | 93 +++++++++++++++++++++++++
 drivers/remoteproc/xlnx_r5_remoteproc.c | 68 ++----------------
 include/linux/firmware/xlnx-zynqmp.h    | 12 ++++
 3 files changed, 110 insertions(+), 63 deletions(-)

diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
index af838b2dc327..f9a3a95b0638 100644
--- a/drivers/firmware/xilinx/zynqmp.c
+++ b/drivers/firmware/xilinx/zynqmp.c
@@ -1513,6 +1513,99 @@ int zynqmp_pm_request_wake(const u32 node,
 }
 EXPORT_SYMBOL_GPL(zynqmp_pm_request_wake);
 
+/**
+ * zynqmp_pm_start_rpu - Boot Real-time Processing Unit (Cortex-R) on SoC
+ *
+ * @node: power-domains id of the core
+ * @bootaddr: Boot address of elf
+ *
+ * Return: status, either success or error+reason
+ */
+int zynqmp_pm_start_rpu(const u32 node, const u64 bootaddr)
+{
+	enum rpu_boot_mem bootmem;
+	int ret;
+
+	/*
+	 * The exception vector pointers (EVP) refer to the base-address of
+	 * exception vectors (for reset, IRQ, FIQ, etc). The reset-vector
+	 * starts at the base-address and subsequent vectors are on 4-byte
+	 * boundaries.
+	 *
+	 * Exception vectors can start either from 0x0000_0000 (LOVEC) or
+	 * from 0xFFFF_0000 (HIVEC) which is mapped in the OCM (On-Chip Memory)
+	 *
+	 * Usually firmware will put Exception vectors at LOVEC.
+	 *
+	 * It is not recommend that you change the exception vector.
+	 * Changing the EVP to HIVEC will result in increased interrupt latency
+	 * and jitter. Also, if the OCM is secured and the Cortex-R5F processor
+	 * is non-secured, then the Cortex-R5F processor cannot access the
+	 * HIVEC exception vectors in the OCM.
+	 */
+	bootmem = (bootaddr >= 0xFFFC0000) ?
+		   PM_RPU_BOOTMEM_HIVEC : PM_RPU_BOOTMEM_LOVEC;
+
+	pr_debug("RPU boot addr 0x%llx from %s.", bootaddr,
+		 bootmem == PM_RPU_BOOTMEM_HIVEC ? "OCM" : "TCM");
+
+	/* Request node before starting RPU core if new version of API is supported */
+	if (zynqmp_pm_feature(PM_REQUEST_NODE) > PM_API_VERSION_1) {
+		ret = zynqmp_pm_request_node(node,
+					     ZYNQMP_PM_CAPABILITY_ACCESS, 0,
+					     ZYNQMP_PM_REQUEST_ACK_BLOCKING);
+		if (ret < 0) {
+			pr_err("failed to request 0x%x", node);
+			return ret;
+		}
+	}
+
+	ret = zynqmp_pm_request_wake(node, true,
+				     bootmem, ZYNQMP_PM_REQUEST_ACK_NO);
+	if (ret)
+		pr_err("failed to start RPU = 0x%x\n", node);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(zynqmp_pm_start_rpu);
+
+/**
+ * zynqmp_pm_stop_rpu - Stop Real-time Processing Unit (Cortex-R) on SoC
+ *
+ * @node: power-domains id of the core
+ *
+ * Return: status, either success or error+reason
+ */
+int zynqmp_pm_stop_rpu(const u32 node)
+{
+	int ret;
+
+	/* Use release node API to stop core if new version of API is supported */
+	if (zynqmp_pm_feature(PM_RELEASE_NODE) > PM_API_VERSION_1) {
+		ret = zynqmp_pm_release_node(node);
+		if (ret)
+			pr_err("failed to stop remoteproc RPU %d\n", ret);
+		return ret;
+	}
+
+	/*
+	 * Check expected version of EEMI call before calling it. This avoids
+	 * any error or warning prints from firmware as it is expected that fw
+	 * doesn't support it.
+	 */
+	if (zynqmp_pm_feature(PM_FORCE_POWERDOWN) != PM_API_VERSION_1) {
+		pr_debug("EEMI interface %d ver 1 not supported\n",
+			 PM_FORCE_POWERDOWN);
+		return -EOPNOTSUPP;
+	}
+
+	/* maintain force pwr down for backward compatibility */
+	ret = zynqmp_pm_force_pwrdwn(node, ZYNQMP_PM_REQUEST_ACK_BLOCKING);
+	if (ret)
+		pr_err("core force power down failed\n");
+	return ret;
+}
+EXPORT_SYMBOL_GPL(zynqmp_pm_stop_rpu);
+
 /**
  * zynqmp_pm_set_requirement() - PM call to set requirement for PM slaves
  * @node:		Node ID of the slave
diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
index 3349d1877751..dcd8a93f031c 100644
--- a/drivers/remoteproc/xlnx_r5_remoteproc.c
+++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
@@ -364,49 +364,12 @@ static void zynqmp_r5_rproc_kick(struct rproc *rproc, int vqid)
 static int zynqmp_r5_rproc_start(struct rproc *rproc)
 {
 	struct zynqmp_r5_core *r5_core = rproc->priv;
-	enum rpu_boot_mem bootmem;
 	int ret;
 
-	/*
-	 * The exception vector pointers (EVP) refer to the base-address of
-	 * exception vectors (for reset, IRQ, FIQ, etc). The reset-vector
-	 * starts at the base-address and subsequent vectors are on 4-byte
-	 * boundaries.
-	 *
-	 * Exception vectors can start either from 0x0000_0000 (LOVEC) or
-	 * from 0xFFFF_0000 (HIVEC) which is mapped in the OCM (On-Chip Memory)
-	 *
-	 * Usually firmware will put Exception vectors at LOVEC.
-	 *
-	 * It is not recommend that you change the exception vector.
-	 * Changing the EVP to HIVEC will result in increased interrupt latency
-	 * and jitter. Also, if the OCM is secured and the Cortex-R5F processor
-	 * is non-secured, then the Cortex-R5F processor cannot access the
-	 * HIVEC exception vectors in the OCM.
-	 */
-	bootmem = (rproc->bootaddr >= 0xFFFC0000) ?
-		   PM_RPU_BOOTMEM_HIVEC : PM_RPU_BOOTMEM_LOVEC;
-
-	dev_dbg(r5_core->dev, "RPU boot addr 0x%llx from %s.", rproc->bootaddr,
-		bootmem == PM_RPU_BOOTMEM_HIVEC ? "OCM" : "TCM");
-
-	/* Request node before starting RPU core if new version of API is supported */
-	if (zynqmp_pm_feature(PM_REQUEST_NODE) > 1) {
-		ret = zynqmp_pm_request_node(r5_core->pm_domain_id,
-					     ZYNQMP_PM_CAPABILITY_ACCESS, 0,
-					     ZYNQMP_PM_REQUEST_ACK_BLOCKING);
-		if (ret < 0) {
-			dev_err(r5_core->dev, "failed to request 0x%x",
-				r5_core->pm_domain_id);
-			return ret;
-		}
-	}
-
-	ret = zynqmp_pm_request_wake(r5_core->pm_domain_id, 1,
-				     bootmem, ZYNQMP_PM_REQUEST_ACK_NO);
+	ret = zynqmp_pm_start_rpu(r5_core->pm_domain_id, rproc->bootaddr);
 	if (ret)
-		dev_err(r5_core->dev,
-			"failed to start RPU = 0x%x\n", r5_core->pm_domain_id);
+		dev_err(&rproc->dev, "failed to start RPU\n");
+
 	return ret;
 }
 
@@ -423,30 +386,9 @@ static int zynqmp_r5_rproc_stop(struct rproc *rproc)
 	struct zynqmp_r5_core *r5_core = rproc->priv;
 	int ret;
 
-	/* Use release node API to stop core if new version of API is supported */
-	if (zynqmp_pm_feature(PM_RELEASE_NODE) > 1) {
-		ret = zynqmp_pm_release_node(r5_core->pm_domain_id);
-		if (ret)
-			dev_err(r5_core->dev, "failed to stop remoteproc RPU %d\n", ret);
-		return ret;
-	}
-
-	/*
-	 * Check expected version of EEMI call before calling it. This avoids
-	 * any error or warning prints from firmware as it is expected that fw
-	 * doesn't support it.
-	 */
-	if (zynqmp_pm_feature(PM_FORCE_POWERDOWN) != 1) {
-		dev_dbg(r5_core->dev, "EEMI interface %d ver 1 not supported\n",
-			PM_FORCE_POWERDOWN);
-		return -EOPNOTSUPP;
-	}
-
-	/* maintain force pwr down for backward compatibility */
-	ret = zynqmp_pm_force_pwrdwn(r5_core->pm_domain_id,
-				     ZYNQMP_PM_REQUEST_ACK_BLOCKING);
+	ret = zynqmp_pm_stop_rpu(r5_core->pm_domain_id);
 	if (ret)
-		dev_err(r5_core->dev, "core force power down failed\n");
+		dev_err(&rproc->dev, "failed to stop RPU\n");
 
 	return ret;
 }
diff --git a/include/linux/firmware/xlnx-zynqmp.h b/include/linux/firmware/xlnx-zynqmp.h
index 7e27b0f7bf7e..347df66ee176 100644
--- a/include/linux/firmware/xlnx-zynqmp.h
+++ b/include/linux/firmware/xlnx-zynqmp.h
@@ -644,6 +644,8 @@ int zynqmp_pm_get_node_status(const u32 node, u32 *const status,
 			      u32 *const requirements, u32 *const usage);
 int zynqmp_pm_get_rpu_node_status(const u32 node, u32 *const status,
 				  u32 *const requirements, u32 *const usage);
+int zynqmp_pm_start_rpu(const u32 node, const u64 bootaddr);
+int zynqmp_pm_stop_rpu(const u32 node);
 int zynqmp_pm_set_sd_config(u32 node, enum pm_sd_config_type config, u32 value);
 int zynqmp_pm_set_gem_config(u32 node, enum pm_gem_config_type config,
 			     u32 value);
@@ -960,6 +962,16 @@ static inline int zynqmp_pm_get_rpu_node_status(const u32 node, u32 *const statu
 	return -ENODEV;
 }
 
+static inline int zynqmp_pm_start_rpu(const u32 node, const u64 bootaddr)
+{
+	return -ENODEV;
+}
+
+static inline int zynqmp_pm_stop_rpu(const u32 node)
+{
+	return -ENODEV;
+}
+
 static inline int zynqmp_pm_set_sd_config(u32 node,
 					  enum pm_sd_config_type config,
 					  u32 value)

base-commit: 721396afea31eac476d88f5db10ba111ba4b8382
-- 
2.34.1

