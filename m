Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012017.outbound.protection.outlook.com [52.101.43.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B297C3F39FC;
	Fri, 29 May 2026 16:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780073032; cv=fail; b=tbLmcVlyhRh4ZMNrLdnK10Kw8tmdNXFBEMb5+uEhLm/qH7Am0OQEiq18IubSrwSaDFWuuBdgS51lb6RUiE68sFtq0wZOne8rOFsZaYCyyp0fthNPzCHijzi4eQrmQe0YuN9bu56xuN4HK4tnbcLcMDqzcUjR8TWU3rSCQlY8k+4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780073032; c=relaxed/simple;
	bh=bpHQ4+fs4OUgmy+fX5aJW+QqcFFlx9fl5ZGlhezBaQ8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZmJRiLjrzzbWXDnmxv6lZzACeIeVHl2amnh06Fue2lOY8ZuxzkwaOYpS80MF+x2jFxagjtLLaLGGP7CHTg9dedTRauQFDeXqGwcaMGpsLzizI8l3pKeRucXmj3o5hmNY//Um/zr04kngE6Sab2+TyDSesUxgM6pxn8ZjpKdzCUU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Afxsv2Mz; arc=fail smtp.client-ip=52.101.43.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Afxsv2Mz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RjrbkPFHiICoMysoz9GsBwtJcZr6u2OP2QzvVJ/050jvJSobc2IRu3YGWFIeUX3xqxsS8WFMV+4yiYkuwCwO/UjtnkK5VfXIoipGX4xCGFMM342nqr+YHbrLs/XfHE5SLW0dnsASToOOwPekbDMoxm8INfLj/JcduTciK1Z3uowd2epf8nLXOUDIULif41PLvo+0hQIVyq1iVNQRfyjH5/w4wUsMO45yTOg/n4bDyKxDwv7FOiwoYUKamOSLMdvsSj7MQ9mGD5reUEiQVmyCR+ZwOxDnAVcQr/2wcbejwerXvtdfsa/wciHf1cr4Cp000FagJLOz53gUY7f5tCxr8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oqnBq/mQtCs7BpGT6iz7C9DG7w18MQpjOM2mKMXuDXw=;
 b=sINFWr7lyz0pj6LDZ1vgXmldKeXiVcU9vbMycVK2F2pqscOvGXSs4GFQVfhtjr2DXii41if2jsTubmDUBh4jhO0yGhmGBLleBvPDti4C9cQ8eyj0wFP9vsy8ZHfirJ04ERoowsFxlFvX7dN+8y7Ce+o+hwc72r5vH06z51bAl6bO/0fcBtj5hhSCg+Y5mWcyCRYY23Fz4x4noTmoC0rqeLCJIm2yigKMVJEzUfY5aVELnRD9pnK5RYr7+ylZ2+zTl2UCKaef1gKfGsfec55FiH9wD/R4I5RqstTFDiEm0pM9TXz/pxrIBaW/pTVdRHWPMIErGCzuHz7QrrmJ1VQV3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oqnBq/mQtCs7BpGT6iz7C9DG7w18MQpjOM2mKMXuDXw=;
 b=Afxsv2MzMCWUQq5Zv8NLBmUPlmhA6fosWo5ZnswHHTBYOTKxLKbp6hfVjqJrEJwZ6xIxqK5MJdd+kjnDXJbYZrsL7KteGEpUb5SVA4jxQFfUtBc22AMuV/9DZFKlNuH6NpTWyWDMygT3nfd8/FNIsB5FcS1f7+Ve/F8xE9om9SU=
Received: from BN9PR03CA0165.namprd03.prod.outlook.com (2603:10b6:408:f4::20)
 by SA5PPFAB8DFE4E8.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8db) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Fri, 29 May
 2026 16:43:44 +0000
Received: from BL6PEPF00020E62.namprd04.prod.outlook.com
 (2603:10b6:408:f4:cafe::1d) by BN9PR03CA0165.outlook.office365.com
 (2603:10b6:408:f4::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.12 via Frontend Transport; Fri, 29
 May 2026 16:43:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF00020E62.mail.protection.outlook.com (10.167.249.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Fri, 29 May 2026 16:43:43 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 29 May
 2026 11:43:43 -0500
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 29 May 2026 11:43:42 -0500
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>,
	<arnaud.pouliquen@foss.st.com>
CC: <linux-kernel@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
	<divin.raj@arm.com>
Subject: [PATCH v3 3/4] rpmsg: virtio_rpmsg_bus: get buffer size from config space
Date: Fri, 29 May 2026 09:43:27 -0700
Message-ID: <20260529164327.1827121-4-tanmay.shah@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260529164327.1827121-1-tanmay.shah@amd.com>
References: <20260529164327.1827121-1-tanmay.shah@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E62:EE_|SA5PPFAB8DFE4E8:EE_
X-MS-Office365-Filtering-Correlation-Id: 490fca2a-f2a1-475e-2409-08debda17264
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|11063799006|18002099003|56012099006|22082099003;
X-Microsoft-Antispam-Message-Info:
	7V9TbGX2qI8lwZrQjM7t/ossCtUKuM0/s55RJf5QGN0qOGea0g6xft9Gl3yGWJA3MsXU1XFVCowZgV9exhKQ7t9+FCrgarrzJ1FJe3ZgsFh5giseJPEeTTopSEHJWMopShKyFZI3YoZNZ9ubDpPdlpYzPvSmiWcflh1sr/FpUDObCWiWHbfIGR2n4riVQA4UWAX8+4g8RWZx7HXbtqHpAtd35zSZXtHfL+GKgs4D2wmIIGRLgcLLR0bBT4MO24LX67Xkv22N6IrrVWwzlTWFzBj14fGgMG1bRuBZFge/QcrSJ8Bq4tYshMyPModGldjqny360YpRdqC6NF/UerlNvblQ+3uiu3Rb1s71L0425utSyYmUDisLbWyzLMBQvrjq40rItuYPe5tWJWz9QvrKpWEZ/Gs1jCgDcDlChfzbbFMw84Q/Bs7x3pdT57uUB2323OCKN3n1daKO5mp1ZOlrm3KFIm7Yp9yAkfcS7UqAoKd9xwYz8X4gLBWJkQWDtgcOjCRKJH51fCZjAqUb8vgqfp3dPIpt++My/AK4/lS6PxeznSMSVPReKTcKU5m1RK4XMyr0qiofxfGMU27FJ+NVkQmvBMBYvJQwNTN14c1kJ3/irawJRz4NhlhHZs9WfcswlLdZDyBaq1HtCx2hxnsZmE5/C5PVHJqtgEixrvSza11WHKNXFpjgaFTVBMPiClGK9LLMWvcuZWfSz3uTzYVkQHEVeltSq+ry1G67TRANKzU=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(11063799006)(18002099003)(56012099006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	er24q6uhKTcuwhNU7JjAcCCq6Swb/e48sTgqwSJGupTynWU2AN5Rr7VVQCMIhNvmORFfv2l7w+1hp74ZYolQUW30T84fgCbVhMIsqwkGM+0xpGIxv+JGL0CrCeief/aCGe0lnybIj+unWFZejdv1eE7E+Vg4tQ3nZh253FgqEDJR9BFqic9zWuRVIwx2HPCCWk4GEXbPJJyzd05S0uYCJfI2CLHqvrr+H5ngx9D8wUBn0V8hqRuB4qvES0MHjpgsVAJS9nFeTSijJREASZ5kDg12PE5n8M/HY/yLBop1PDLIcxH5iSH6mlGbxzMfqPQIrr6ctWEg7XyLWavmRJvQraa9vwoCIAyKaZ9z0FxMKkZNq444/XlysWkng99pqEqcc4BUK3BNI32C/wV1RI8PTsrBOyZHyVKS0AGkTOaDEyWnzJQ+mzhap+T9OG5FBwOR
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 16:43:43.9303
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 490fca2a-f2a1-475e-2409-08debda17264
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E62.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFAB8DFE4E8

512 bytes isn't always suitable for all case, let firmware
maker decide the best value from resource table.
enable by VIRTIO_RPMSG_F_BUFSZ feature bit.

Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
---

Changes in v3:
  - change version field from u16 to u8
  - introduce size field in the rpmsg_virtio_config structure
  - check version field is set to any non-zero value.
  - check size field is not 0.
  - Remove field for private config, as not needed for now.
  - add documentation of rpmsg_virtio_config structure

 drivers/rpmsg/virtio_rpmsg_bus.c   | 90 ++++++++++++++++++++++++------
 include/linux/rpmsg/virtio_rpmsg.h | 34 +++++++++++
 2 files changed, 106 insertions(+), 18 deletions(-)
 create mode 100644 include/linux/rpmsg/virtio_rpmsg.h

diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index 99df1ae07055..f1ab8e792f3d 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -20,6 +20,7 @@
 #include <linux/rpmsg.h>
 #include <linux/rpmsg/byteorder.h>
 #include <linux/rpmsg/ns.h>
+#include <linux/rpmsg/virtio_rpmsg.h>
 #include <linux/scatterlist.h>
 #include <linux/slab.h>
 #include <linux/sched.h>
@@ -39,7 +40,8 @@
  * @tx_bufs:	kernel address of tx buffers
  * @num_rx_buf: total number of rx buffers
  * @num_tx_buf: total number of tx buffers
- * @buf_size:   size of one rx or tx buffer
+ * @rx_buf_size: size of one rx buffer
+ * @tx_buf_size: size of one tx buffer
  * @last_tx_buf: index of last tx buffer used
  * @bufs_dma:	dma base addr of the buffers
  * @tx_lock:	protects svq and tx_bufs, to allow concurrent senders.
@@ -59,7 +61,8 @@ struct virtproc_info {
 	void *rx_bufs, *tx_bufs;
 	unsigned int num_rx_buf;
 	unsigned int num_tx_buf;
-	unsigned int buf_size;
+	unsigned int rx_buf_size;
+	unsigned int tx_buf_size;
 	int last_tx_buf;
 	dma_addr_t bufs_dma;
 	struct mutex tx_lock;
@@ -68,9 +71,6 @@ struct virtproc_info {
 	wait_queue_head_t sendq;
 };
 
-/* The feature bitmap for virtio rpmsg */
-#define VIRTIO_RPMSG_F_NS	0 /* RP supports name service notifications */
-
 /**
  * struct rpmsg_hdr - common header for all rpmsg messages
  * @src: source address
@@ -128,7 +128,9 @@ struct virtio_rpmsg_channel {
  * processor.
  */
 #define MAX_RPMSG_NUM_BUFS	(256)
-#define MAX_RPMSG_BUF_SIZE	(512)
+#define DEFAULT_RPMSG_BUF_SIZE	(512)
+
+#define RPMSG_VDEV_CONFIG_VER 1
 
 /*
  * Local addresses are dynamically allocated on-demand.
@@ -444,7 +446,7 @@ static void *get_a_tx_buf(struct virtproc_info *vrp)
 
 	/* either pick the next unused tx buffer */
 	if (vrp->last_tx_buf < vrp->num_tx_buf)
-		ret = vrp->tx_bufs + vrp->buf_size * vrp->last_tx_buf++;
+		ret = vrp->tx_bufs + vrp->tx_buf_size * vrp->last_tx_buf++;
 	/* or recycle a used one */
 	else
 		ret = virtqueue_get_buf(vrp->svq, &len);
@@ -514,7 +516,7 @@ static int rpmsg_send_offchannel_raw(struct rpmsg_device *rpdev,
 	 * messaging), or to improve the buffer allocator, to support
 	 * variable-length buffer sizes.
 	 */
-	if (len > vrp->buf_size - sizeof(struct rpmsg_hdr)) {
+	if (len > vrp->tx_buf_size - sizeof(struct rpmsg_hdr)) {
 		dev_err(dev, "message is too big (%d)\n", len);
 		return -EMSGSIZE;
 	}
@@ -647,7 +649,7 @@ static ssize_t virtio_rpmsg_get_mtu(struct rpmsg_endpoint *ept)
 	struct rpmsg_device *rpdev = ept->rpdev;
 	struct virtio_rpmsg_channel *vch = to_virtio_rpmsg_channel(rpdev);
 
-	return vch->vrp->buf_size - sizeof(struct rpmsg_hdr);
+	return vch->vrp->tx_buf_size - sizeof(struct rpmsg_hdr);
 }
 
 static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
@@ -673,7 +675,7 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
 	 * We currently use fixed-sized buffers, so trivially sanitize
 	 * the reported payload length.
 	 */
-	if (len > vrp->buf_size ||
+	if (len > vrp->rx_buf_size ||
 	    msg_len > (len - sizeof(struct rpmsg_hdr))) {
 		dev_warn(dev, "inbound msg too big: (%d, %d)\n", len, msg_len);
 		return -EINVAL;
@@ -706,7 +708,7 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
 		dev_warn_ratelimited(dev, "msg received with no recipient\n");
 
 	/* publish the real size of the buffer */
-	rpmsg_sg_init(&sg, msg, vrp->buf_size);
+	rpmsg_sg_init(&sg, msg, vrp->rx_buf_size);
 
 	/* add the buffer back to the remote processor's virtqueue */
 	err = virtqueue_add_inbuf(vrp->rvq, &sg, 1, msg, GFP_KERNEL);
@@ -824,6 +826,8 @@ static int rpmsg_probe(struct virtio_device *vdev)
 	int err = 0, i;
 	size_t total_buf_space;
 	bool notify;
+	u8 version;
+	u16 size;
 
 	vrp = kzalloc_obj(*vrp);
 	if (!vrp)
@@ -855,9 +859,58 @@ static int rpmsg_probe(struct virtio_device *vdev)
 	else
 		vrp->num_tx_buf = MAX_RPMSG_NUM_BUFS;
 
-	vrp->buf_size = MAX_RPMSG_BUF_SIZE;
+	/*
+	 * If VIRTIO_RPMSG_F_BUFSZ feature is supported, then configure buf
+	 * size from virtio device config space from the resource table.
+	 * If the feature is not supported, then assign default buf size.
+	 */
+	if (virtio_has_feature(vdev, VIRTIO_RPMSG_F_BUFSZ)) {
+		virtio_cread(vdev, struct virtio_rpmsg_config,
+			     version, &version);
+		if (version == 0) {
+			dev_err(&vdev->dev, "invalid version of vdev config\n");
+			err = -EINVAL;
+			goto vqs_del;
+		}
+
+		/*
+		 * The size field is not used for the remoteproc virtio transport,
+		 * but kept for any future transport to use
+		 */
+		virtio_cread(vdev, struct virtio_rpmsg_config,
+			     size, &size);
+		if (size == 0) {
+			dev_err(&vdev->dev, "invalid size of vdev config\n");
+			err = -EINVAL;
+			goto vqs_del;
+		}
+
+		/* note: tx and rx are defined from remote view */
+		virtio_cread(vdev, struct virtio_rpmsg_config,
+			     txbuf_size, &vrp->rx_buf_size);
+		virtio_cread(vdev, struct virtio_rpmsg_config,
+			     rxbuf_size, &vrp->tx_buf_size);
+
+		/* The buffers must hold at least the rpmsg header */
+		if (vrp->rx_buf_size < sizeof(struct rpmsg_hdr) ||
+		    vrp->tx_buf_size < sizeof(struct rpmsg_hdr)) {
+			dev_err(&vdev->dev,
+				"bad vdev config: rx buf sz = %u, tx buf sz = %u\n",
+				vrp->rx_buf_size, vrp->tx_buf_size);
+			err = -EINVAL;
+			goto vqs_del;
+		}
+
+		dev_dbg(&vdev->dev,
+			"vdev config: version=%d, rx buf sz = 0x%x, tx buf sz = 0x%x\n",
+			version, vrp->rx_buf_size, vrp->tx_buf_size);
+	} else {
+		vrp->rx_buf_size = DEFAULT_RPMSG_BUF_SIZE;
+		vrp->tx_buf_size = DEFAULT_RPMSG_BUF_SIZE;
+	}
 
-	total_buf_space = (vrp->num_rx_buf + vrp->num_tx_buf) * vrp->buf_size;
+	total_buf_space = (vrp->num_rx_buf * vrp->rx_buf_size) +
+			  (vrp->num_tx_buf * vrp->tx_buf_size);
 
 	/* allocate coherent memory for the buffers */
 	bufs_va = dma_alloc_coherent(vdev->dev.parent,
@@ -875,14 +928,14 @@ static int rpmsg_probe(struct virtio_device *vdev)
 	vrp->rx_bufs = bufs_va;
 
 	/* and second part is dedicated for TX */
-	vrp->tx_bufs = bufs_va + vrp->num_rx_buf * vrp->buf_size;
+	vrp->tx_bufs = bufs_va + (vrp->num_rx_buf * vrp->rx_buf_size);
 
 	/* set up the receive buffers */
 	for (i = 0; i < vrp->num_rx_buf; i++) {
 		struct scatterlist sg;
-		void *cpu_addr = vrp->rx_bufs + i * vrp->buf_size;
+		void *cpu_addr = vrp->rx_bufs + i * vrp->rx_buf_size;
 
-		rpmsg_sg_init(&sg, cpu_addr, vrp->buf_size);
+		rpmsg_sg_init(&sg, cpu_addr, vrp->rx_buf_size);
 
 		err = virtqueue_add_inbuf(vrp->rvq, &sg, 1, cpu_addr,
 					  GFP_KERNEL);
@@ -965,8 +1018,8 @@ static int rpmsg_remove_device(struct device *dev, void *data)
 static void rpmsg_remove(struct virtio_device *vdev)
 {
 	struct virtproc_info *vrp = vdev->priv;
-	unsigned int num_bufs = vrp->num_rx_buf + vrp->num_tx_buf;
-	size_t total_buf_space = num_bufs * vrp->buf_size;
+	size_t total_buf_space = (vrp->num_rx_buf * vrp->rx_buf_size) +
+				 (vrp->num_tx_buf * vrp->tx_buf_size);
 	int ret;
 
 	virtio_reset_device(vdev);
@@ -992,6 +1045,7 @@ static struct virtio_device_id id_table[] = {
 
 static unsigned int features[] = {
 	VIRTIO_RPMSG_F_NS,
+	VIRTIO_RPMSG_F_BUFSZ,
 };
 
 static struct virtio_driver virtio_ipc_driver = {
diff --git a/include/linux/rpmsg/virtio_rpmsg.h b/include/linux/rpmsg/virtio_rpmsg.h
new file mode 100644
index 000000000000..77a530514d86
--- /dev/null
+++ b/include/linux/rpmsg/virtio_rpmsg.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) Pinecone Inc. 2019
+ * Copyright (C) Xiang Xiao <xiaoxiang@pinecone.net>
+ * Copyright (C) Advanced Micro Devices, Inc.
+ */
+
+#ifndef _LINUX_VIRTIO_RPMSG_H
+#define _LINUX_VIRTIO_RPMSG_H
+
+#include <linux/types.h>
+#include <linux/virtio_types.h>
+
+/* The feature bitmap for virtio rpmsg */
+#define VIRTIO_RPMSG_F_NS	0 /* RP supports name service notifications */
+#define VIRTIO_RPMSG_F_BUFSZ	1 /* RP get buffer size from config space */
+
+/**
+ * struct virtio_rpmsg_config - config space for rpmsg virtio device
+ *
+ * @version: version of this structure. current version is 1.
+ * @size:    size of this structure. unused for the remoteproc virtio backend.
+ * @txbuf_size: Tx buf size from remote's view. For Linux this is rx buf size.
+ * @rxbuf_size: Rx buf size from remote's view. For Linux this is tx buf size.
+ */
+struct virtio_rpmsg_config {
+	u8 version;
+	__virtio16 size;
+	/* The tx/rx individual buffer size(if VIRTIO_RPMSG_F_BUFSZ) */
+	__virtio32 txbuf_size;
+	__virtio32 rxbuf_size;
+} __packed;
+
+#endif /* _LINUX_VIRTIO_RPMSG_H */
-- 
2.34.1

