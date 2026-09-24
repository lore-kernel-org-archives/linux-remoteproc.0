Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012005.outbound.protection.outlook.com [40.107.209.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C0342C4F7;
	Thu, 24 Sep 2026 20:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790282081; cv=fail; b=gsv71lDQC38XdgijJzygZgml4V59F4jsOBWaPtNxZE5Sl/vAS5k+agg/NDxWJzgyxeO1uUvLQOyPQ2pZUtdkFIjplqD4v81r7uCj0ryZwX9NCyB61SSw/67M+iaKYynN+XNijkT+LlY0EzUWgVkmYIG5FW53kzwlENrjlAzSn5o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790282081; c=relaxed/simple;
	bh=Rgk/xbvZLolHJDEfh/OfxcYD0TL4f125Cnw9LyiZ5MU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=V2FGdV2EZiHTN6Ab9HrPT0Azel/wz8u7y8bHd2PFeHSwHTs7SaDl/jsJjiGwnfTVzInkyfQHGIJbcfRaQ0J7A7G8j1i/axJtLetTrp9vLXMLCmRJxRomiJzm+WyxgqjFyGknaFkGM4xykNgmQpCMVQ9l1pbPAx/O6PzkbdiPuYc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=3Thkac5U; arc=fail smtp.client-ip=40.107.209.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="3Thkac5U"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JVy5IkH+vEoo9rBjC2ukKjn+cUh63S463HQREFOOk6o+Ql/FANr7my3OSNMQbDYnE7xNV4/1I3wVCbmWbF6NZYpo/J+Z9Wu+0hFot6s2IKtueHtBvtE5B47NXUqBxOEGDSV/fUuwWefP2y05wh0Z39/8HI/thPMv4W4MmyPO9bW+AE9NMA+Dbz56W6JssPm2093atj1CBCBaY+k3NZrDNYo4jPWEEj2c1rhMoKtyTek7Q3X1t9CaVjmxNOKx+k2d8GLv5CpY9EdoYGj0TIlgpLQlN45USScf7v63F8/3fFjEyJYpUCC3a7LjwhHILh14dnXt3QqLfsY3flGhYnyi8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lokh5C2Gpc1F/DsUewbixJ+4NIw3Xs1x+HHyTa8+J0g=;
 b=MU//LBUuIU3qpLB95AhOHBbM8sQOfY08TgR2ZxNV0k0gukNCNuYkWNPuLt3uNy/VXnA0A97y8rN+JkxElzeaYjUFz6l6Hb+jx1KcnT2VWEUlppndvuwF/3SkZGAZ85UbVS5m6kxJs/stHnunqEvcpEdFNZL46nRNsRjRr6nepfgHIxntdqR+dSzNGqPwllE7tu1XZXuu9g6qXpwxgo15KPHOf6c5hBZtX6REQXEK3u4JxM8wgXiifRJIxiX3HY8NbCIymHeZUwOJiAKXIgyVacaS/YarR08bEbnSYTXC2yPD+Xk/vmzqaqfH0Gaw+LuyGCvBmXWXMxZVaZDrjU/WtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lokh5C2Gpc1F/DsUewbixJ+4NIw3Xs1x+HHyTa8+J0g=;
 b=3Thkac5UPnsehWXJTGyEztgwFRM4z/RwPyEFY6su8XeXBQzQ/3Q3HYOKMgJaQ+lQyQwOZU7IE0qzDcJBEnJoY8SW2u7ASnU0Q3rZn2axkg9rmHpPCTs/q2tX/IE95kfmd2kOdC67KLB5QuvOQ3/cuS6o6Yx69fn58Gx7bqpzsz0=
Received: from PH7PR10CA0013.namprd10.prod.outlook.com (2603:10b6:510:23d::9)
 by BN7PPF34483F4BA.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6cb) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 20:34:28 +0000
Received: from SJ1PEPF000023D7.namprd21.prod.outlook.com
 (2603:10b6:510:23d:cafe::ac) by PH7PR10CA0013.outlook.office365.com
 (2603:10b6:510:23d::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.18 via Frontend Transport; Thu,
 24 Sep 2026 20:34:28 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000023D7.mail.protection.outlook.com (10.167.244.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.5 via Frontend Transport; Thu, 24 Sep 2026 20:34:28 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 24 Sep
 2026 15:34:26 -0500
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Thu, 24 Sep 2026 15:34:26 -0500
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	"Tanmay Shah" <tanmay.shah@amd.com>
Subject: [PATCH] remoteproc: xlnx: reset virtio status during attach
Date: Thu, 24 Sep 2026 13:34:09 -0700
Message-ID: <20260924203409.2484068-1-tanmay.shah@amd.com>
X-Mailer: git-send-email 2.43.0
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D7:EE_|BN7PPF34483F4BA:EE_
X-MS-Office365-Filtering-Correlation-Id: 53646586-53ac-40ff-fc00-08df1a7b3b16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|82310400026|1800799024|36860700016|11063799006|6133799003|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	w/PLHz3J64OCE9vxrVhkxxvrHaC/2TQdVabp8ngL4V8EFwfGRmYMWK5Cs5l+nR73lVkyXRZJRov7DwoSB22CqCq+xeP3GCEkqoOGymqra/ZIDsDxEnNtOzOqabCTwcRg9klzPoyG/6JbhH9NnWaUGi+bNwO8x3Mfi4+433cUrBgUmN9/XJbvNhapwkVzMAhYq+fgQOUuF5MpKWx3KGEvGRb1AkyZiJ3Y3hnMiCfsayJSB6VKWLyjroeDyoUl9A9mrdHJyK2wPJkGDo1jXJ1hl7g7RYMjXjaTj8O9z/BW3mgzspXbEMRbhMuvMn6Ua5raysBptLxN7pzXbhJKCZgFYiDNJ1TUFlDspH0eluK9jHXR++kuwkdWkgK7mlgt0gsDAc1Za30oK2+oMzToYBhi7obpj/LaGS9AAFDvgcwRamGHqvDlXzEc6nD9Ffk4pR6TK+nJw3Ap7p2G/HcKDtevsv1Xa4qclz4HE7QkCkYDOEzgyPiXnyFXHdWswU/qweUNBqKl9sIyL+nFx/+nKA0qy10qQEdkfY3MsBRkdQuUQ84jvMPlDzSTS+R7rVwxIcNmyQCpGwKdxgAaudobI2Z8ipWl5HNRIoffSjGvC8pBDN0/wAQw/F1rZuEa/d4cNnFZzKkq9VyTg6uAJJ+XnEKLKC7JvIAXAow/yw8iKJIwexhn8a3y5+nhotZxE1ePsYKhYGJfzGXkVGVH6OTHRXUKuQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(82310400026)(1800799024)(36860700016)(11063799006)(6133799003)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Z8T2hkcswf9foCh5gotgBOzGMXWambYfos07OVhY5lAy9Ls/unyFPzGwb1VNErZEAZmAT8U5uFWj2fBbaYAxWmtNhcKJcvdYfqZ/O7aky8ylkxy2o/JgggNDLn58E98/3vSD6iXjEagmxS5cBbP8G6iuMxb3XFfDrppLKocCJUJASq1E3z+B9qqq6u3adhvMnOmWS1fYapZKK7BerOD3B7R5d04ROu2yByaJ+mL1/Ax7smb2XgToAPHjRYAZdd9iSO28PYRwAVN7k5bQsnvQ0RF0SQKRiHH8UnZJE8zEZX+0wG0l2luuGBz9vg328YGcL3mX5rLl68KPB0U4/3OHlhkknaisvYixaj8VtBPy7UTZ17AWPuS2KCYDJkeT0+75jOscgp8ONFNOu/eGn1piyXwFWmeu7L1FLFhPjgqKpeqsdFP7JZm5PLebt3zDdA+m
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 20:34:28.3294
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53646586-53ac-40ff-fc00-08df1a7b3b16
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D7.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF34483F4BA

On AMD-Xilinx platforms cortex-A and cortex-R can be configured as
separate subsystems. In this case, both cores can boot independent of
each other. This is platform management firmware configuration to manage
cores. In such a configuration, if Linux went through an uncontrolled
reboot during active rpmsg communication, then during next boot it can
find rpmsg virtio status not in the reset state. In such case it is
important to reset the virtio status during attach callback and wait
for the remote to handle virtio device reset. After reset, the remote
is expected to generate the notification to the host or the host will
eventually timeout and continue the normal boot flow.

Assisted-by: LLM
Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
---
 drivers/remoteproc/xlnx_r5_remoteproc.c | 74 +++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
index 630621288430..6e7e2a5ea83c 100644
--- a/drivers/remoteproc/xlnx_r5_remoteproc.c
+++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
@@ -6,6 +6,7 @@
 
 #include <linux/dma-mapping.h>
 #include <linux/firmware/xlnx-zynqmp.h>
+#include <linux/jiffies.h>
 #include <linux/kernel.h>
 #include <linux/mailbox_client.h>
 #include <linux/mailbox/zynqmp-ipi-message.h>
@@ -15,6 +16,7 @@
 #include <linux/of_reserved_mem.h>
 #include <linux/platform_device.h>
 #include <linux/remoteproc.h>
+#include <linux/wait.h>
 
 #include "remoteproc_internal.h"
 
@@ -33,6 +35,8 @@
 #define RSC_TBL_XLNX_MAGIC	((uint32_t)'x' << 24 | (uint32_t)'a' << 16 | \
 				 (uint32_t)'m' << 8 | (uint32_t)'p')
 
+#define RPROC_ATTACH_TIMEOUT_US (1000 * 1000)
+
 /*
  * settings for RPU cluster mode which
  * reflects possible values of xlnx,cluster-mode dt-property
@@ -167,6 +171,9 @@ struct xlnx_rproc_crash_report {
  * @rsc_tbl_size: resource table size retrieved from remote
  * @pm_domain_id: RPU CPU power domain id
  * @ipi: pointer to mailbox information
+ * @attach_wq: wait queue for attach-time vdev reset acknowledgment
+ * @waiting_for_attach_ack: whether attach is waiting for remote interrupt
+ * @attach_ack: remote interrupt observed while attach wait is active
  */
 struct zynqmp_r5_core {
 	struct xlnx_rproc_crash_report *crash_report;
@@ -181,6 +188,9 @@ struct zynqmp_r5_core {
 	u32 rsc_tbl_size;
 	u32 pm_domain_id;
 	struct mbox_info *ipi;
+	wait_queue_head_t attach_wq;
+	bool waiting_for_attach_ack;
+	bool attach_ack;
 };
 
 /**
@@ -270,10 +280,17 @@ static void handle_event_notified(struct work_struct *work)
 static void zynqmp_r5_mb_rx_cb(struct mbox_client *cl, void *msg)
 {
 	struct zynqmp_ipi_message *ipi_msg, *buf_msg;
+	struct zynqmp_r5_core *r5_core;
 	struct mbox_info *ipi;
 	size_t len;
 
 	ipi = container_of(cl, struct mbox_info, mbox_cl);
+	r5_core = ipi->r5_core;
+
+	if (r5_core && READ_ONCE(r5_core->waiting_for_attach_ack)) {
+		WRITE_ONCE(r5_core->attach_ack, true);
+		wake_up(&r5_core->attach_wq);
+	}
 
 	/* copy data from ipi buffer to r5_core if IPI is buffered. */
 	ipi_msg = (struct zynqmp_ipi_message *)msg;
@@ -820,6 +837,62 @@ static int zynqmp_r5_get_rsc_table_va(struct zynqmp_r5_core *r5_core)
 
 static int zynqmp_r5_attach(struct rproc *rproc)
 {
+	struct zynqmp_r5_core *r5_core = rproc->priv;
+	struct device *dev = &rproc->dev;
+	bool wait_for_remote = false;
+	struct fw_rsc_vdev *rsc;
+	struct fw_rsc_hdr *hdr;
+	int i, offset, avail;
+	long time_left;
+
+	if (!rproc->table_ptr)
+		goto attach_success;
+
+	for (i = 0; i < rproc->table_ptr->num; i++) {
+		offset = rproc->table_ptr->offset[i];
+		hdr = (void *)rproc->table_ptr + offset;
+		avail = rproc->table_sz - offset - sizeof(*hdr);
+		rsc = (void *)hdr + sizeof(*hdr);
+
+		/* make sure table isn't truncated */
+		if (avail < 0) {
+			dev_err(dev, "rsc table is truncated\n");
+			return -EINVAL;
+		}
+
+		if (hdr->type != RSC_VDEV)
+			continue;
+
+		/*
+		 * reset vdev status, in case previous run didn't leave it in
+		 * a clean state.
+		 */
+		if (rsc->status) {
+			rsc->status = 0;
+			wait_for_remote = true;
+			break;
+		}
+	}
+
+	if (wait_for_remote) {
+		WRITE_ONCE(r5_core->attach_ack, false);
+		WRITE_ONCE(r5_core->waiting_for_attach_ack, true);
+	}
+
+	/* kick remote to notify about attach */
+	rproc->ops->kick(rproc, 0);
+
+	if (wait_for_remote) {
+		time_left = wait_event_timeout(r5_core->attach_wq,
+					       READ_ONCE(r5_core->attach_ack),
+					       usecs_to_jiffies(RPROC_ATTACH_TIMEOUT_US));
+		WRITE_ONCE(r5_core->waiting_for_attach_ack, false);
+
+		if (!time_left)
+			dev_warn(dev, "timeout waiting for remote vdev reset ack\n");
+	}
+
+attach_success:
 	dev_dbg(&rproc->dev, "rproc %d attached\n", rproc->index);
 
 	return 0;
@@ -920,6 +993,7 @@ static struct zynqmp_r5_core *zynqmp_r5_alloc_rproc_core(struct device *cdev)
 	r5_core = r5_rproc->priv;
 	r5_core->dev = cdev;
 	r5_core->np = dev_of_node(cdev);
+	init_waitqueue_head(&r5_core->attach_wq);
 	if (!r5_core->np) {
 		dev_err(cdev, "can't get device node for r5 core\n");
 		ret = -EINVAL;

base-commit: 5f639b3018c0026a5341949724b4b921cf3a3d5d
-- 
2.43.0

