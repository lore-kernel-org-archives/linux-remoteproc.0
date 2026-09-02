Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011014.outbound.protection.outlook.com [40.93.194.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C700B4A99DF;
	Wed,  2 Sep 2026 21:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788385538; cv=fail; b=XZDTwrWhYR7zNb/UkDvHSXwMtUIIPguTcZHRqu1ackOcA70TxJrNhHf+Qv9AC7xnfOR3BWddcNnRGXGkn3zWwbPhlPKrc4gy0cpzKdBG2Aj1JRioKWrfxLgmyTkLs6vc5fOFmzW0zrtXO+kY7hiNbCoQupnbE1UlgvHCzuSd8q4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788385538; c=relaxed/simple;
	bh=zRxkEvwP/cB3myXUEZTow1eCD05dtKAn/fy8Z2am3I8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Ruhg0RFajpNhHD5uVTCdurcC16RzydDZnlHDtgpEx8nA8m7saWQCKgz3py1t8BAv7hGNWnrBQSiuRe/bG/LXKx2S+h2glGN78unXLjMdf2Zx/dPrG4AEgOVgYJEbFPdGTEKM5T+A9Be5y8OxMX/YUGb2/WZlIoTCuU+Stzx9QuM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=4xRENchp; arc=fail smtp.client-ip=40.93.194.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="4xRENchp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s7/gvKFmEeSqSaWDX6Fca35ZSGJ3lh7KC6NkTfTKf2/V1ucQLgmHXMnPk8cH8LANBqpptpDZuVAz1TO4QgVCCUKGDgZAtkdqg3u0x/gnUoEao8MYokaPuW24HuC5WdWrh6991tSze90XnVa7hlT0poLzTXmaCMyTupmXhUUxsnkNX2aHoIjj9owApoMJcr/HKVRx8wdAkB/ETRcRqV9um5J3vmp+IKAdMbNfrKzlEubgXuwNvvZtPfHDFCM2yTKgEAS4gpKYvBMo0UV8W2pECuqd2hsNQz+I8pymr3K4Z0BqvDmLSoa4SuuDypieuvVfkIS+q0hCrWWNcnEmIt79cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qScrpvIL/TDJMVlhWttE48prLJ6RxiyehqtYsEcTJ/E=;
 b=NQUYJd4UL7yE3+DLuR6rij6qeUGJZcgIBl1C28L/bmJGdAEJS3v58iTqCbl0BEI4tGXpwhYBSSR6KdlerWlxLH/pb2w8o9gCyWHezWywOxyR55QTlhy4fTgdWIO8BchJQigBYEEO7zfAJw9Bj0skARII52TOM0oGdmcGGqmlgjdptSBqJtJFpWIJ+Ip3JCTussYUOCUEaMoAbTRwwTSyuOGTnCfevipYbW8Tg+fSlefT/eOsur0mb8W7HPZq7c+exsISowcloxMrn9Ny4cF6nPLFHyaY3gFxE0qfunMHOx/12XhSGh85nokgY7hQaC0n4Rl0ngAhxVgE1iKM37I5Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qScrpvIL/TDJMVlhWttE48prLJ6RxiyehqtYsEcTJ/E=;
 b=4xRENchpsGdZNhkoFKvCNx0U+HRJbVRrUYl9sABdTvpI8VAh/DEL7OMvSQh7GirWL6aoKHzt99Dn0KNZL/e9AR54oX4Fbx1YyBy3tEQAPw900tC67/wxNyTvu9aBQ/hb6weZEVjAfNTMndQn8kxyC8JVHdHkXqOQM1gvDuhRF4Y=
Received: from CH0PR03CA0235.namprd03.prod.outlook.com (2603:10b6:610:e7::30)
 by CY8PR12MB8314.namprd12.prod.outlook.com (2603:10b6:930:7b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 21:45:05 +0000
Received: from CH1PEPF0000AD82.namprd04.prod.outlook.com
 (2603:10b6:610:e7:cafe::9) by CH0PR03CA0235.outlook.office365.com
 (2603:10b6:610:e7::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Wed, 2
 Sep 2026 21:45:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000AD82.mail.protection.outlook.com (10.167.244.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Wed, 2 Sep 2026 21:45:05 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 2 Sep
 2026 16:45:05 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 2 Sep
 2026 16:45:05 -0500
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Wed, 2 Sep 2026 16:45:04 -0500
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Tanmay
 Shah <tanmay.shah@amd.com>
Subject: [PATCH] remoteproc: remoteproc_virtio: add acknowledged vdev reset
Date: Wed, 2 Sep 2026 14:44:54 -0700
Message-ID: <20260902214453.634339-2-tanmay.shah@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD82:EE_|CY8PR12MB8314:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f5edc54-f04b-463b-ef4b-08df093b73a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|82310400026|36860700016|1800799024|11063799006|6133799003|10067099003|18002099003|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info:
	NSuBj0QDJojMHCAgpLj+5mtWyusTfIfaoACEIoyuxqe0deNL0ItlsqPJvvec0r8ypdRt+ucIqrlIfm+SOzWAgIvMuk4rHoA4Y89tpK48u1BbfsWdYRNJiXpxXI4Cfg7tG4ogr1bH8F8l40WZY8idJqpaJE4/brkD8t1sJuiBHQlhk9P3SA81E+9+dVHpVyeLB5G94GGzg3bVT5Y4QXVTxcNDigYuj5URnNxsaUqbYhCeKO+mKhyPtwO7clCkr54pghHaQR1zsDaLT1+pvKXHu5aznVYoyud4H6ZCKHM3EVf6eQxPts1pzaRQ7sKGj0T2cDe21iKrIRZ3v4r8vClgjgn5+naWf9k9/P2uXFRyDQemJI1FBz6gnN6SYDdf8UHdlAMEOtwMEO488qycdY7NMAt0eJOTPCgrDFX9TnefVSgpGBGfSpFF/icRbTgj6BTJbVI14Y9eZyoip+HWq9HYimYXIiF+cuOxckc8UwISb7fWsBh7iYXN0Q0OBzZUEl00ChyYMDGKe4tXZ/sUmGuj/HhAY8FTC0mQl7ZvzbBs7fUpcjLpT41Fx7l2C1Qat+KVdtxXtAfMakiM37E72QRi+gvdZlcJrfZMn9W+YMHRxL45XAsZLvhH2BF6kjYvhirvjHYYS4I5kId5tQqL2QXQ/FUpibWKMWdeJTuz8YPKlZiZY9mOO/DK9R0m3+R9sgtd2G5Fg8dFq777Ab4uPMJR+Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(82310400026)(36860700016)(1800799024)(11063799006)(6133799003)(10067099003)(18002099003)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	e0nN1yoiZK9HjS9YsO1F/crh/RFM1CzkMZRxK0MyyIdSTt6uCaibr54Szf4rTMkxwNa871DR1z11BVGRVvBcF313xJUMfjnj/HMqIAaE1hssOz4fQEn2s2oGdoh2DoDqQv5Cz7np6FjWZkpkhq7GtYOihHUHIJmG4ocoElCg0I3Q5Psot9varVGU1bSCVdqywR3I39PvaZRxI+a+mbCI3/6jY9j8WnPQozwsXZ6hnYWr08nqKTzirTU4VHuNdHuUuDYxIVFweR9w3O0jW0/2Ua2fAq/qK7pIiPBsgwXgbDxEUpF/uDPkafwo8clx09HlK7l1SZs1tm3DCXFvcB7YquSPSDS/BGCg+94QVd6D58cqmsXXRwWjJM9ysGV40hgcqOPncroaonACFReadYcEd+3fZYganY5zTje07DBm6OOis8eRg8WN/8QDT7KoQU6E
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 21:45:05.7291
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f5edc54-f04b-463b-ef4b-08df093b73a1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD82.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8314

The existing remoteproc virtio reset path clears the vdev status locally
without notifying the remote processor. As a result, the host cannot tell
whether the remote side has observed the reset request or completed its
cleanup.

Add a new resource type, RSC_VDEV_V2, for virtio vdevs that support an
acknowledged reset protocol. For these resources, encode a reset request
in the virtio status byte, kick the remote processor using the vdev notify
ID, and wait for the remote side to clear the status back to 0.

Keep the existing RSC_VDEV behavior for backwards compatibility by
clearing the status locally. Also reset remoteproc-created virtio
devices before unregistering them, and expose RSC_VDEV_V2 reset state
in debugfs.

Assisted-by: Codex:GPT-5
Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
---
 drivers/remoteproc/remoteproc_core.c     |  3 +-
 drivers/remoteproc/remoteproc_debugfs.c  | 29 +++++++++++++++-
 drivers/remoteproc/remoteproc_internal.h | 21 +++++++++++
 drivers/remoteproc/remoteproc_virtio.c   | 44 ++++++++++++++++++++++--
 include/linux/rsc_table.h                |  5 ++-
 5 files changed, 97 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 1ed406714849..31d79684977c 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -471,6 +471,7 @@ void rproc_remove_rvdev(struct rproc_vdev *rvdev)
 static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
 			     int offset, int avail)
 {
+	struct fw_rsc_hdr *hdr = ptr - sizeof(*hdr);
 	struct fw_rsc_vdev *rsc = ptr;
 	struct device *dev = &rproc->dev;
 	struct rproc_vdev *rvdev;
@@ -485,7 +486,6 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
 		return -EINVAL;
 	}
 
-	/* make sure reserved bytes are zeroes */
 	if (rsc->reserved[0] || rsc->reserved[1]) {
 		dev_err(dev, "vdev rsc has non zero reserved bytes\n");
 		return -EINVAL;
@@ -1009,6 +1009,7 @@ static rproc_handle_resource_t rproc_loading_handlers[RSC_LAST] = {
 	[RSC_DEVMEM] = rproc_handle_devmem,
 	[RSC_TRACE] = rproc_handle_trace,
 	[RSC_VDEV] = rproc_handle_vdev,
+	[RSC_VDEV_V2] = rproc_handle_vdev,
 };
 
 struct rproc_rsc_cb_data {
diff --git a/drivers/remoteproc/remoteproc_debugfs.c b/drivers/remoteproc/remoteproc_debugfs.c
index b86c1d09c70c..1fe99749f5b4 100644
--- a/drivers/remoteproc/remoteproc_debugfs.c
+++ b/drivers/remoteproc/remoteproc_debugfs.c
@@ -274,7 +274,7 @@ static const struct file_operations rproc_crash_ops = {
 /* Expose resource table content via debugfs */
 static int rproc_rsc_table_show(struct seq_file *seq, void *p)
 {
-	static const char * const types[] = {"carveout", "devmem", "trace", "vdev"};
+	static const char * const types[] = {"carveout", "devmem", "trace", "vdev", "vdev_v2"};
 	struct rproc *rproc = seq->private;
 	struct resource_table *table = rproc->table_ptr;
 	struct fw_rsc_carveout *c;
@@ -336,6 +336,33 @@ static int rproc_rsc_table_show(struct seq_file *seq, void *p)
 			seq_printf(seq, "  Reserved (should be zero) [%d][%d]\n\n",
 				   v->reserved[0], v->reserved[1]);
 
+			for (j = 0; j < v->num_of_vrings; j++) {
+				seq_printf(seq, "  Vring %d\n", j);
+				seq_printf(seq, "    Device Address 0x%x\n", v->vring[j].da);
+				seq_printf(seq, "    Alignment %d\n", v->vring[j].align);
+				seq_printf(seq, "    Number of buffers %d\n", v->vring[j].num);
+				seq_printf(seq, "    Notify ID %d\n", v->vring[j].notifyid);
+				seq_printf(seq, "    Physical Address 0x%x\n\n",
+					   v->vring[j].pa);
+			}
+			break;
+		case RSC_VDEV_V2:
+			v = rsc;
+			seq_printf(seq, "Entry %d is of type %s\n", i, types[hdr->type]);
+
+			seq_printf(seq, "  ID %d\n", v->id);
+			seq_printf(seq, "  Notify ID %d\n", v->notifyid);
+			seq_printf(seq, "  Device features 0x%x\n", v->dfeatures);
+			seq_printf(seq, "  Guest features 0x%x\n", v->gfeatures);
+			seq_printf(seq, "  Config length 0x%x\n", v->config_len);
+			seq_printf(seq, "  Status 0x%x\n", v->status);
+			seq_printf(seq, "  Number of vrings %d\n", v->num_of_vrings);
+			seq_printf(seq, "  Reset request pending %s\n",
+				   rproc_rsc_vdev_reset_requested(v->status) ?
+				   "yes" : "no");
+			seq_printf(seq, "  Reserved (should be zero) [%d][%d]\n\n",
+				   v->reserved[0], v->reserved[1]);
+
 			for (j = 0; j < v->num_of_vrings; j++) {
 				seq_printf(seq, "  Vring %d\n", j);
 				seq_printf(seq, "    Device Address 0x%x\n", v->vring[j].da);
diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
index 3a742ef6ef60..f07a96ff82a4 100644
--- a/drivers/remoteproc/remoteproc_internal.h
+++ b/drivers/remoteproc/remoteproc_internal.h
@@ -14,6 +14,7 @@
 
 #include <linux/irqreturn.h>
 #include <linux/firmware.h>
+#include <linux/virtio_config.h>
 #ifdef CONFIG_HAS_IOMEM
 #include <linux/io.h>
 #endif
@@ -42,6 +43,26 @@ struct rproc_vdev_data {
 	struct fw_rsc_vdev *rsc;
 };
 
+/*
+ * RSC_VDEV_V2 requests an acknowledged reset by writing an otherwise
+ * impossible virtio status pattern: DRIVER and FAILED set while
+ * ACKNOWLEDGE is clear. Other status bits are left unchanged.
+ */
+static inline u8 rproc_rsc_vdev_reset_status(u8 status)
+{
+	status |= VIRTIO_CONFIG_S_DRIVER | VIRTIO_CONFIG_S_FAILED;
+	status &= ~VIRTIO_CONFIG_S_ACKNOWLEDGE;
+
+	return status;
+}
+
+static inline bool rproc_rsc_vdev_reset_requested(u8 status)
+{
+	return !(status & VIRTIO_CONFIG_S_ACKNOWLEDGE) &&
+	       (status & VIRTIO_CONFIG_S_DRIVER) &&
+	       (status & VIRTIO_CONFIG_S_FAILED);
+}
+
 static inline bool rproc_has_feature(struct rproc *rproc, unsigned int feature)
 {
 	return test_bit(feature, rproc->features);
diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
index d5e9ff045a28..e682caa546b2 100644
--- a/drivers/remoteproc/remoteproc_virtio.c
+++ b/drivers/remoteproc/remoteproc_virtio.c
@@ -13,6 +13,7 @@
 #include <linux/dma-map-ops.h>
 #include <linux/dma-mapping.h>
 #include <linux/export.h>
+#include <linux/iopoll.h>
 #include <linux/of_reserved_mem.h>
 #include <linux/platform_device.h>
 #include <linux/remoteproc.h>
@@ -234,12 +235,48 @@ static void rproc_virtio_set_status(struct virtio_device *vdev, u8 status)
 static void rproc_virtio_reset(struct virtio_device *vdev)
 {
 	struct rproc_vdev *rvdev = vdev_to_rvdev(vdev);
+	struct rproc *rproc = rvdev->rproc;
 	struct fw_rsc_vdev *rsc;
+	struct fw_rsc_hdr *hdr;
+	int ret;
+	u8 val;
+
+	/*
+	 * During crash recovery, vdev can be stopped. But the driver can't reset
+	 * the device, as device is already crashed. In this case, reset becomes
+	 * no op.
+	 */
+	if (rproc->state == RPROC_CRASHED)
+		return;
 
 	rsc = (void *)rvdev->rproc->table_ptr + rvdev->rsc_offset;
+	hdr = (void *)rsc - sizeof(*hdr);
+
+	if (hdr->type == RSC_VDEV_V2) {
+		/*
+		 * RSC_VDEV_V2 encodes an acknowledged reset request in the
+		 * status byte. The remote is expected to complete the reset
+		 * and then clear status back to 0.
+		 */
+		rsc->status = rproc_rsc_vdev_reset_status(rsc->status);
+
+		/* after setting reset request, kick the device */
+		rproc->ops->kick(rproc, rsc->notifyid);
 
-	rsc->status = 0;
-	dev_dbg(&vdev->dev, "reset !\n");
+		/*
+		 * When device completes reset, it is expected to set status
+		 * to 0.
+		 */
+		ret = readb_poll_timeout(&rsc->status, val, val == 0,
+					 1000,      /* 1ms between reads */
+					 3000000);  /* 3s total timeout */
+		if (ret)
+			dev_warn(&vdev->dev, "vdev reset timed out\n");
+	} else {
+		/* back compatible for RSC_VDEV type of rsc vdev */
+		rsc->status = 0;
+	}
+	dev_info(&vdev->dev, "reset !\n");
 }
 
 /* provide the vdev features as retrieved from the firmware */
@@ -469,6 +506,9 @@ static int rproc_remove_virtio_dev(struct device *dev, void *data)
 {
 	struct virtio_device *vdev = dev_to_virtio(dev);
 
+	/* reset virtio device before unregister */
+	virtio_reset_device(vdev);
+
 	unregister_virtio_device(vdev);
 	return 0;
 }
diff --git a/include/linux/rsc_table.h b/include/linux/rsc_table.h
index 71b60125310e..2398a6d7033e 100644
--- a/include/linux/rsc_table.h
+++ b/include/linux/rsc_table.h
@@ -66,6 +66,8 @@ struct fw_rsc_hdr {
  *		    the remote processor will be writing logs.
  * @RSC_VDEV:       declare support for a virtio device, and serve as its
  *		    virtio header.
+ * @RSC_VDEV_V2:    declare support for a virtio device whose reset request is
+ *		    encoded in the virtio status byte.
  * @RSC_LAST:       just keep this one at the end of standard resources
  * @RSC_VENDOR_START:	start of the vendor specific resource types range
  * @RSC_VENDOR_END:	end of the vendor specific resource types range
@@ -83,7 +85,8 @@ enum fw_resource_type {
 	RSC_DEVMEM		= 1,
 	RSC_TRACE		= 2,
 	RSC_VDEV		= 3,
-	RSC_LAST		= 4,
+	RSC_VDEV_V2		= 4,
+	RSC_LAST		= 5,
 	RSC_VENDOR_START	= 128,
 	RSC_VENDOR_END		= 512,
 };

base-commit: d4d61a4b0a52e8f3cdb3e1578602850a3452ec3e
-- 
2.43.0

