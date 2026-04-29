Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010052.outbound.protection.outlook.com [52.101.61.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9BFA3FFAD0;
	Wed, 29 Apr 2026 16:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777479201; cv=fail; b=WqB+IfaOxuxYYhPprAzwIZYkrz2qVDoM023RJrOoKOKS9dVR1X7uG9c913yCrffgvwr4K3zU8A6pPrsj2NJWPYE4NU230j6AsQjbSfdVOzhs5EimItlZAVrd2mHfizekxv4FRwE+x25QK8bMt385WbbTdHpCBUoHT0G64kCLNrE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777479201; c=relaxed/simple;
	bh=tT2yPcsFEjfuCKqKvDNA2mgsfqRKM7gRghj/YD+Rvw4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CarnX+lIbJOLEqZ7UmrVFkHtGc94doncZbCbmVnujLV/aJqAAUih/Vrk0oPtCk8iqKqKSWMghROZ2NIksfQbzpNEklONtQNtlVRqOttL6r804zqlR3ArJ5aOyD30hS0IXd9SOQZf2GL7VXYKbYELSdmFVVZxuTLDlPt5c7G8CWM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=xmHoSc50; arc=fail smtp.client-ip=52.101.61.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="xmHoSc50"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jz7jECdNumwnyIm1n679corFZRvWX0e5VssnFsNZaVE1apwgK3hfIDZDxuh4w6h8VTZt2yfUmf8TS+6sWAsfEfcc6JhPPSxfLeFJRhBe1pPMneO5gfm+IElxcDs/u99dw0iphINX7QKXoGg5FGRxyUw1DJFfwI/bvWrynulUvnrdmncfTBaLakrDl6Qd4gjEtqLboa7OAeIM4bk2ruFkSfYBc5ASQJgLptTs1Mjmkm3v3Q7FH6e4Hw2F8jvA0Y5O6h8DCTrg0koZ8HkINWFhl/drDWal95pV/fwkQhIoyC4z9UGzVEYKMCvDSoYoaGcO/Bzlib8eT9C7nslu2WHkXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P091qRfRWesd26nX07jQrQNFMcos+JaGU5A6pju4KXs=;
 b=uOCVKElcZz41NyaiEeLJmG08IGuT/6TOSTtQF5SRDDgOSTq2jBrjqrPSmDIsHAhgQW8mDJ80ff2Z/NBnTw5AhJZleCuoD/Zt/qWfFdeMtIPcYVW42h8m41GvXzluHC7ywnUHib38H+/VRFosZu1jg+OzRggpXC/DVgFBAKfNOfbGKY+JHsH849GGwKiZekkBWHR5xAOYvmE6rovBGKtwwl6kfBLoefZi71DAP0qJtmAYzE0+NVejPJEt/QfCTDrd8vGunTQ89SB/QjDu+qr/I2gyONLgAHCie4UKqXbL0Usqz61LvQ8zQqLD5JN2gxgiiGnyHpqRFm9Mb7pXWQy/pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P091qRfRWesd26nX07jQrQNFMcos+JaGU5A6pju4KXs=;
 b=xmHoSc50fUYqj91PWtIzFRkWRo8eCqF4gEJ/L0+G9gJIonANYH//BJK2HiWRdhqM3xneh3yecQZTTwvTN8qE8N3JiwNJCyFPCb46YMdlkEBEJfMWwVDPAnxExPAs1HYSn8bjoGxWmC0grcS0xfzgh5MCTe6iaf4jbfWc0wXEBYE=
Received: from BN9PR03CA0400.namprd03.prod.outlook.com (2603:10b6:408:111::15)
 by SA0PR12MB4365.namprd12.prod.outlook.com (2603:10b6:806:96::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.16; Wed, 29 Apr
 2026 16:13:09 +0000
Received: from BL6PEPF00022573.namprd02.prod.outlook.com
 (2603:10b6:408:111:cafe::77) by BN9PR03CA0400.outlook.office365.com
 (2603:10b6:408:111::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Wed,
 29 Apr 2026 16:13:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF00022573.mail.protection.outlook.com (10.167.249.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Wed, 29 Apr 2026 16:13:09 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 29 Apr
 2026 11:13:06 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 29 Apr
 2026 11:13:06 -0500
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 29 Apr 2026 11:13:05 -0500
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>,
	<arnaud.pouliquen@foss.st.com>
CC: <linux-kernel@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>, Tanmay
 Shah <tanmay.shah@amd.com>
Subject: [PATCH v2 2/3] rpmsg: virtio_rpmsg_bus: get buffer size from config space
Date: Wed, 29 Apr 2026 09:10:52 -0700
Message-ID: <20260429161052.528015-3-tanmay.shah@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260429161052.528015-1-tanmay.shah@amd.com>
References: <20260429161052.528015-1-tanmay.shah@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: tanmay.shah@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022573:EE_|SA0PR12MB4365:EE_
X-MS-Office365-Filtering-Correlation-Id: d56bfd6b-3b2e-4ed7-f1a4-08dea60a3496
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	G2vTZMgwkbAozXAEZsKjxBQc1iFRYXB+MLEhfIy41qkn/EaP53CylQZ1f0jnpAY3BHiKSaiubf6cknlmumOg3LxOOzreQtU2KyocE/awG6g7MRmrJVs2MZ2R4XHo+8eGcs+uNKwWe1z4HmqjQNgnzsa4x4/zHMpgPPIHIu5M34j1fzdfDF0s0qYyG1AHI+LHXomGn9lv8WRpVYYT8m6mcV2zUCmigryk9/UWZUv30wA8Tb22ELHY4qVDNMwxVc4sdkZTR5nWdMs4rD4XdCTD8vghn7R30CYowEPzCV3kXSCGDzC1plGe4ioBy1f4CMKMyZ8CPqSkAeRlmcdj8RNtLRcsxS5V1tafG555oEKLThtv+j804RJ1Fobhfdx0+KiFg8YlvbbI8ymlc0Zoaf79UOCs0SkqoS/hbhqHwPlQ4KB1iIF8XCPOA47m9dn0kjy0AX9/vspNujxAaBtwbO3fRFSoPYVMvZtl/D2rEWSboucg+6XO9ZJFdyW25DWhASRWOvK0AiUae6XZP/YIHEs7PdGg5qerigxNiSuCx4h8VLqXItGC3kCGU/L1fXMSqo5+A63tdos56LJhQ0TKUpAGCUrQLWWWVNWSq7MHkENEJJI48U0CPFBTBWlla1VV2C0oeqWHqt9zFVnPOxRApsFCTLWmvEZDV++R175UhAdKkHhKeDlAgslakwQ2q8M3+HVaG85c+7ovMpjii5oXsUubWrEZGhqO0DW5KVih6oHS9LjaberQVIV9aYKcMmhNoAozMCdGQGAltui5flruxnKvww==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	tBgJW71OHFeM9y9zy4OvPa+cDTCx1hvbMPfy2W6OLiBBaXZiyDvL1mEGkZyV2jXEoGe/VjPhNizTECh784QPWQgSwhRxyQPiOiXmO00DSqa7n54tAzsEQKrVy+W2TvRXB3tURyvhiixwQ1eIst4Wvo8pXB5lKBK73bd9youex/ZRDGKLQE9s4VPm5xII1yYFN3CyNT2djH3oUZyYeObh6NENUmHXRPQBMwdTsKZ4wcQjlFBSE63O+3+vfWJcXmIJ5Jb4hgvjFHQgv7MeTfAwoK5OIlWaC1R2YSgOcbCLu2wuaQTtAMwfyXtjtPyGxZdsC6D+eKpjQY5gRzjJUN/QHagkM6hSk+/FTxS7WpU3O98LfANNuRk+FPnE3byd+YHXG0mVDu8VM/IdRZ3fxBtqXVMkOSCkqBtdpQzfxjJ5bnzzitp2uZD1/4bFi4sUWgDq
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 16:13:09.5010
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d56bfd6b-3b2e-4ed7-f1a4-08dea60a3496
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022573.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4365

512 bytes isn't always suitable for all case, let firmware
maker decide the best value from resource table.
enable by VIRTIO_RPMSG_F_BUFSZ feature bit.

Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
---

Test done:
  - Verify this patch works with the existing firmware
  - Verify this patch works with the firmware that configures
    differt tx & rx buf size

Changes in v2:
  - %s/sbuf_size/tx_buf_size/
  - %s/rbuf_size/rx_buf_size/
  - fix typo
  - do not use ALIGN on buf size, rely on allocator
  - make err msg more explicit, %s/vdev config:/bad vdev config/
  - fix license and add AMD copyrights in the header virtio_rpmsg.h
  - Assign bit 1 to VIRTIO_RPMSG_F_BUFSZ feature
  - use __virtio32 over __u32
  - add version field to virtio rpmsg config structure
  - move linux/virtio_rpmsg.h to linux/rpmsg/virtio_rpmsg.h

 drivers/rpmsg/virtio_rpmsg_bus.c   | 70 ++++++++++++++++++++++--------
 include/linux/rpmsg/virtio_rpmsg.h | 27 ++++++++++++
 2 files changed, 79 insertions(+), 18 deletions(-)
 create mode 100644 include/linux/rpmsg/virtio_rpmsg.h

diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index e59d8cf9b975..8116d94413cc 100644
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
  * @num_rx_buf:	total number of buffers for rx
  * @num_tx_buf:	total number of buffers for tx
- * @buf_size:	size of one rx or tx buffer
+ * @rx_buf_size: size of one rx buffer
+ * @tx_buf_size: size of one tx buffer
  * @last_sbuf:	index of last tx buffer used
  * @bufs_dma:	dma base addr of the buffers
  * @tx_lock:	protects svq and tx_bufs, to allow concurrent senders.
@@ -59,7 +61,8 @@ struct virtproc_info {
 	void *rx_bufs, *tx_bufs;
 	unsigned int num_rx_buf;
 	unsigned int num_tx_buf;
-	unsigned int buf_size;
+	unsigned int rx_buf_size;
+	unsigned int tx_buf_size;
 	int last_sbuf;
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
@@ -128,7 +128,7 @@ struct virtio_rpmsg_channel {
  * processor.
  */
 #define MAX_RPMSG_NUM_BUFS	(256)
-#define MAX_RPMSG_BUF_SIZE	(512)
+#define DEFAULT_RPMSG_BUF_SIZE	(512)
 
 /*
  * Local addresses are dynamically allocated on-demand.
@@ -444,7 +444,7 @@ static void *get_a_tx_buf(struct virtproc_info *vrp)
 
 	/* either pick the next unused tx buffer */
 	if (vrp->last_sbuf < vrp->num_tx_buf)
-		ret = vrp->tx_bufs + vrp->buf_size * vrp->last_sbuf++;
+		ret = vrp->tx_bufs + vrp->tx_buf_size * vrp->last_sbuf++;
 	/* or recycle a used one */
 	else
 		ret = virtqueue_get_buf(vrp->svq, &len);
@@ -514,7 +514,7 @@ static int rpmsg_send_offchannel_raw(struct rpmsg_device *rpdev,
 	 * messaging), or to improve the buffer allocator, to support
 	 * variable-length buffer sizes.
 	 */
-	if (len > vrp->buf_size - sizeof(struct rpmsg_hdr)) {
+	if (len > vrp->tx_buf_size - sizeof(struct rpmsg_hdr)) {
 		dev_err(dev, "message is too big (%d)\n", len);
 		return -EMSGSIZE;
 	}
@@ -647,7 +647,7 @@ static ssize_t virtio_rpmsg_get_mtu(struct rpmsg_endpoint *ept)
 	struct rpmsg_device *rpdev = ept->rpdev;
 	struct virtio_rpmsg_channel *vch = to_virtio_rpmsg_channel(rpdev);
 
-	return vch->vrp->buf_size - sizeof(struct rpmsg_hdr);
+	return vch->vrp->tx_buf_size - sizeof(struct rpmsg_hdr);
 }
 
 static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
@@ -673,7 +673,7 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
 	 * We currently use fixed-sized buffers, so trivially sanitize
 	 * the reported payload length.
 	 */
-	if (len > vrp->buf_size ||
+	if (len > vrp->rx_buf_size ||
 	    msg_len > (len - sizeof(struct rpmsg_hdr))) {
 		dev_warn(dev, "inbound msg too big: (%d, %d)\n", len, msg_len);
 		return -EINVAL;
@@ -706,7 +706,7 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
 		dev_warn_ratelimited(dev, "msg received with no recipient\n");
 
 	/* publish the real size of the buffer */
-	rpmsg_sg_init(&sg, msg, vrp->buf_size);
+	rpmsg_sg_init(&sg, msg, vrp->rx_buf_size);
 
 	/* add the buffer back to the remote processor's virtqueue */
 	err = virtqueue_add_inbuf(vrp->rvq, &sg, 1, msg, GFP_KERNEL);
@@ -824,6 +824,7 @@ static int rpmsg_probe(struct virtio_device *vdev)
 	int err = 0, i;
 	size_t total_buf_space;
 	bool notify;
+	u16 version;
 
 	vrp = kzalloc_obj(*vrp);
 	if (!vrp)
@@ -855,9 +856,41 @@ static int rpmsg_probe(struct virtio_device *vdev)
 	else
 		vrp->num_tx_buf = MAX_RPMSG_NUM_BUFS;
 
-	vrp->buf_size = MAX_RPMSG_BUF_SIZE;
+	/*
+	 * If VIRTIO_RPMSG_F_BUFSZ feature is supported, then configure buf
+	 * size from virtio device config space from the resource table.
+	 * If the feature is not supported, then assign default buf size.
+	 */
+	if (virtio_has_feature(vdev, VIRTIO_RPMSG_F_BUFSZ)) {
+		/* note: virtio_rpmsg_config is defined from remote view */
+		version = 0;
+		virtio_cread(vdev, struct virtio_rpmsg_config,
+			     version, &version);
+		virtio_cread(vdev, struct virtio_rpmsg_config,
+			     txbuf_size, &vrp->rx_buf_size);
+		virtio_cread(vdev, struct virtio_rpmsg_config,
+			     rxbuf_size, &vrp->tx_buf_size);
+
+		/* The buffers must hold at least the rpmsg header */
+		if (vrp->rx_buf_size < sizeof(struct rpmsg_hdr) ||
+		    vrp->tx_buf_size < sizeof(struct rpmsg_hdr)) {
+			dev_err(&vdev->dev,
+				"bad vdev config: rx buf sz = %d, tx buf sz = %d\n",
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
@@ -875,14 +908,14 @@ static int rpmsg_probe(struct virtio_device *vdev)
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
@@ -965,8 +998,8 @@ static int rpmsg_remove_device(struct device *dev, void *data)
 static void rpmsg_remove(struct virtio_device *vdev)
 {
 	struct virtproc_info *vrp = vdev->priv;
-	unsigned int num_bufs = vrp->num_rx_buf + vrp->num_tx_buf;
-	size_t total_buf_space = num_bufs * vrp->buf_size;
+	size_t total_buf_space = (vrp->num_rx_buf * vrp->rx_buf_size) +
+				 (vrp->num_tx_buf * vrp->tx_buf_size);
 	int ret;
 
 	virtio_reset_device(vdev);
@@ -992,6 +1025,7 @@ static struct virtio_device_id id_table[] = {
 
 static unsigned int features[] = {
 	VIRTIO_RPMSG_F_NS,
+	VIRTIO_RPMSG_F_BUFSZ,
 };
 
 static struct virtio_driver virtio_ipc_driver = {
diff --git a/include/linux/rpmsg/virtio_rpmsg.h b/include/linux/rpmsg/virtio_rpmsg.h
new file mode 100644
index 000000000000..285918be68b9
--- /dev/null
+++ b/include/linux/rpmsg/virtio_rpmsg.h
@@ -0,0 +1,27 @@
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
+struct virtio_rpmsg_config {
+	__virtio16 version;
+	/* The tx/rx individual buffer size(if VIRTIO_RPMSG_F_BUFSZ) */
+	__virtio32 txbuf_size;
+	__virtio32 rxbuf_size;
+	__virtio32 reserved[14]; /* Reserve for the future use */
+	/* Put the customize config here */
+} __packed;
+
+#endif /* _LINUX_VIRTIO_RPMSG_H */
-- 
2.34.1

