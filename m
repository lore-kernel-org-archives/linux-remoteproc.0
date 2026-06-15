Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010054.outbound.protection.outlook.com [52.101.85.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F48B3B71B7;
	Mon, 15 Jun 2026 20:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781554833; cv=fail; b=ufbu3RkHq5YW/2pHWfvRxSZChnMAuTCEUOv1HmF9zoPSOzfexbVFdv51aBsH2HpTQENuYEC5/hEPwRFEODHOCFN914o+U2yl0VrJ9CG/WO+baaAbZKBgvcb/CUwuEDXZR0RAvZMQwsyxWDUNgujfymzRRMJ2EFd2/9NVpOdTXis=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781554833; c=relaxed/simple;
	bh=oHolYnf5NDH98Rri15FYthQrI8BpqufkYq6EmioOIL8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dzWXgxi/cAByXrPdV7XEufcW3+/7GjALkw9sgiMmT+ul9bMdGRRG/HPSwPDqp/lxVgJToDa6APwkO8vAT6AVdE2issic4jx030QxzMFRMUHksFbWUYqqNTQYqa95IdM74n2YLvMVQCX5u0lv1dZ5dSgm/ct4tHQqXclGwZNnbwk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ssxxGpqe; arc=fail smtp.client-ip=52.101.85.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ssxxGpqe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oi/6C2g7huLO9NVwsDG3/dXC1Bgd6Oe7t+3tT6Ex04Q18jn98yNZZxj4gkfMCcXbtpqTU5ZZ5m9WXCL+W1aDm8UhwKdfE0Uyf7gnxwIpI+YPW1uGyuNLny4IJoPvJWR8VMU7YS8Zb4102dyZLjrsKNnwPhUk4gbRukWeB4OWyb54cVmNqNJxYM403hhBjd+dooZidCw8SB6x28MCYKXcug3Tef2fdrojlt+pAv7NdLHDLe9r37JtBMnLA2iFtHkRKV8I5PdWh9y4n3SkIGguE3IgDeekLAtP7aI1SzhmsJzVMwkK2anhCjB+Y+LdwBJyVb0lkPmdPmgDtKpBmqK4yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V2+4Z9YRy1ASF8bymvt9kd6ijQ3OZhUG8ANpVDbvw8g=;
 b=UMkR6+qtDU95f54ywzH4Z0H0zy8jnjX3Kneo0NKCNkDn3zG8C8xXv7nDQXZmhgs85wE6I2GYtCDwzWd1VyEYbRGtJrNw/6w2jTC8UuP6Evd+pO6ot3V4ac/56T8RZfWosW2Ii3Bvzr9kwNYPo39bzWXXhDbTh/hkAcGxDbeyUy1QsR72MtogRibSzVOlC44fLaKOQJIMDnT6gmTSg8C+4LAMA0mQmmTE3UpbZ5nPp7zDyh72Juh6sjGL1Hs3LbqNNFa7P2zm8nlazlZBvm50CslP6mnc34y+Havb5w3tY41yGSzwkpNqdoFbGJ0csDgg/bfpTRl3/gkEasHCgqvNOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V2+4Z9YRy1ASF8bymvt9kd6ijQ3OZhUG8ANpVDbvw8g=;
 b=ssxxGpqeAqOqGKliFDuG5fNHbj4jeS4aJDghJk51LXiJP1XLlGFhWjz8OZUIT/dUY2Ew8hKxUQG5rSi3PVID2uDyKr8UEsbWXKmL//Q9EQjPiCw5sKtzOLHjZgE7yR3da9IL2sk9h1JfqeBlIO8r94echWFLtoiZk/E+tN2UV3M=
Received: from CH2PR02CA0020.namprd02.prod.outlook.com (2603:10b6:610:4e::30)
 by CH3PR12MB9313.namprd12.prod.outlook.com (2603:10b6:610:1ca::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 20:20:23 +0000
Received: from CH2PEPF000000A0.namprd02.prod.outlook.com
 (2603:10b6:610:4e:cafe::6a) by CH2PR02CA0020.outlook.office365.com
 (2603:10b6:610:4e::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.18 via Frontend Transport; Mon,
 15 Jun 2026 20:20:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF000000A0.mail.protection.outlook.com (10.167.244.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Mon, 15 Jun 2026 20:20:23 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 15 Jun
 2026 15:20:19 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 15 Jun
 2026 15:20:19 -0500
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 15 Jun 2026 15:20:18 -0500
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>, <arnaud.pouliquen@foss.st.com>
CC: <linux-remoteproc@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Tanmay Shah <tanmay.shah@amd.com>
Subject: [PATCH v4 3/5] rpmsg: virtio_rpmsg_bus: get buffer size from config space
Date: Mon, 15 Jun 2026 13:20:05 -0700
Message-ID: <20260615202007.3484668-4-tanmay.shah@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260615202007.3484668-1-tanmay.shah@amd.com>
References: <20260615202007.3484668-1-tanmay.shah@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF000000A0:EE_|CH3PR12MB9313:EE_
X-MS-Office365-Filtering-Correlation-Id: 125acbba-401e-420f-4832-08decb1b8786
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|23010399003|376014|36860700016|18002099003|22082099003|6133799003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	yVgRDWSdn1zh+SW3hfU0/M09woopyd+UGTONp2lGChjzPSHg1dUrNS5fjJmEZUjXm9DqO11K72he1rGMcQLMG+0fu4Jx7jVQrk7QzW1ClhTsJTKKWf5yH+LGQn9ykAkE7JiqkGBvxxSR/geeZoGznWQ+su+DcD15ZBeEMA/jOQZ9xo4aVcqj6JqCpBRidtIMbigzJz9GoNmPlMpufDJFiq2NjJznpGKZzJpp6BdZS0xZ/dRLazCqPsZMUFSVkvnuItpf0ah6RR98ov/K8arvOnSirXoFZTQTolSQ9h3AXGt2wnrX863heMlTVQrgSCMAddZzsgMLdgXFqpG/ag7ot0s0zAmIfRiZgqvaig303ctak8Z7wHV3ugYaR6O3rMmg0kUT67QTK8LyUBLtyA+9PGbLx+qz1H93dySFYQyJvuuk8YfHLRslw+6zG9qVO8EIA4HFOPMoZYz27vGAmDghji3iD0UxE18STSrnj+jmZfY4VLgfcpZRU1Ww7a+tYS/4YwwZtG3W2dlwS4F/dzGPRlzEvYBCgB4ijtXeW1+3LUtP8zJKLSl7i6uqeTMyXUCOIoAv3CdWW5xc68pPafmKDsZmDpU3eZQPAGlSjcQ6C57fAAG/Y7vluyvra/LzGEwyDFz9ztKq44bSXvQtYPoGKSknU15p6M0gDBp4ofvVeiHmCjf7Eu8NB8ftSfXJPPA87T9J+/2Bi9WbA/PSYK5G2znLbU7FV7/ahRiVF+9UYDw=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(23010399003)(376014)(36860700016)(18002099003)(22082099003)(6133799003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	kLNjV+fZHuAI5REqcGAfjahy24i1gbCZvJapOJTBk46viSi8nf8GgvIedGNY4su3K4vO8d/qAB44nQKeFbgXcc4+S0iJKFxB53/RJOBsH5TVcwSiHaHwZGN2Z/tru24U58xNLBhprjz38t5GdPu6j04UXrI4YRNLQOh/JWVDFmwyrg2uTu12+zdEdit+ux63Eg/+WsoQI1CSA3u0C9NEyZTfQ/rLI90DzcOCSYop0AT4Fn/o9dMRyKIRN4lCwueVH2uZyQF34zmOPOx88BVPKluakKQfMJd1QktDixUnSskP0szlfKgeW60ScA24q8WDv7l3Mo2AcCY3N658kfl/M44Zw9EXuoggWCb16fLHUt3wdUJKZHpjseU3F2Ha6q2W7C+hYppTRKdEziZw/jSl4wuRArITOwr1qh5KTeGvkn1lXeK6IUbBuNNxAXRhEyK2
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 20:20:23.1193
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 125acbba-401e-420f-4832-08decb1b8786
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF000000A0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9313

512 bytes isn't always suitable for all case, let firmware
maker decide the best value from resource table.
enable by VIRTIO_RPMSG_F_BUFSZ feature bit.

Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
---

Changes in v4: squash to virtio rpmsg config patch
  - Introduce new patch to modify rpmsg.rst documentation
  - check version is always 1.
  - check size field is same as size of struct virtio_rpmsg_config
  - introduce alignment field
  - check alignment field is power of 2
  - check tx and rx buf size is aligned with alignment passed in the
    structure

Changes in v3:
  - change version field from u16 to u8
  - introduce size field in the rpmsg_virtio_config structure
  - check version field is set to any non-zero value.
  - check size field is not 0.
  - Remove field for private config, as not needed for now.
  - add documentation of rpmsg_virtio_config structure

 drivers/rpmsg/virtio_rpmsg_bus.c   | 129 ++++++++++++++++++++++++-----
 include/linux/rpmsg/virtio_rpmsg.h |  50 +++++++++++
 2 files changed, 160 insertions(+), 19 deletions(-)
 create mode 100644 include/linux/rpmsg/virtio_rpmsg.h

diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index 99df1ae07055..a59925f870a4 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -15,11 +15,13 @@
 #include <linux/idr.h>
 #include <linux/jiffies.h>
 #include <linux/kernel.h>
+#include <linux/log2.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/rpmsg.h>
 #include <linux/rpmsg/byteorder.h>
 #include <linux/rpmsg/ns.h>
+#include <linux/rpmsg/virtio_rpmsg.h>
 #include <linux/scatterlist.h>
 #include <linux/slab.h>
 #include <linux/sched.h>
@@ -39,7 +41,8 @@
  * @tx_bufs:	kernel address of tx buffers
  * @num_rx_buf: total number of rx buffers
  * @num_tx_buf: total number of tx buffers
- * @buf_size:   size of one rx or tx buffer
+ * @rx_buf_size: size of one rx buffer
+ * @tx_buf_size: size of one tx buffer
  * @last_tx_buf: index of last tx buffer used
  * @bufs_dma:	dma base addr of the buffers
  * @tx_lock:	protects svq and tx_bufs, to allow concurrent senders.
@@ -59,7 +62,8 @@ struct virtproc_info {
 	void *rx_bufs, *tx_bufs;
 	unsigned int num_rx_buf;
 	unsigned int num_tx_buf;
-	unsigned int buf_size;
+	unsigned int rx_buf_size;
+	unsigned int tx_buf_size;
 	int last_tx_buf;
 	dma_addr_t bufs_dma;
 	struct mutex tx_lock;
@@ -68,9 +72,6 @@ struct virtproc_info {
 	wait_queue_head_t sendq;
 };
 
-/* The feature bitmap for virtio rpmsg */
-#define VIRTIO_RPMSG_F_NS	0 /* RP supports name service notifications */
-
 /**
  * struct rpmsg_hdr - common header for all rpmsg messages
  * @src: source address
@@ -128,7 +129,7 @@ struct virtio_rpmsg_channel {
  * processor.
  */
 #define MAX_RPMSG_NUM_BUFS	(256)
-#define MAX_RPMSG_BUF_SIZE	(512)
+#define DEFAULT_RPMSG_BUF_SIZE	(512)
 
 /*
  * Local addresses are dynamically allocated on-demand.
@@ -444,7 +445,7 @@ static void *get_a_tx_buf(struct virtproc_info *vrp)
 
 	/* either pick the next unused tx buffer */
 	if (vrp->last_tx_buf < vrp->num_tx_buf)
-		ret = vrp->tx_bufs + vrp->buf_size * vrp->last_tx_buf++;
+		ret = vrp->tx_bufs + vrp->tx_buf_size * vrp->last_tx_buf++;
 	/* or recycle a used one */
 	else
 		ret = virtqueue_get_buf(vrp->svq, &len);
@@ -514,7 +515,7 @@ static int rpmsg_send_offchannel_raw(struct rpmsg_device *rpdev,
 	 * messaging), or to improve the buffer allocator, to support
 	 * variable-length buffer sizes.
 	 */
-	if (len > vrp->buf_size - sizeof(struct rpmsg_hdr)) {
+	if (len > vrp->tx_buf_size - sizeof(struct rpmsg_hdr)) {
 		dev_err(dev, "message is too big (%d)\n", len);
 		return -EMSGSIZE;
 	}
@@ -647,7 +648,7 @@ static ssize_t virtio_rpmsg_get_mtu(struct rpmsg_endpoint *ept)
 	struct rpmsg_device *rpdev = ept->rpdev;
 	struct virtio_rpmsg_channel *vch = to_virtio_rpmsg_channel(rpdev);
 
-	return vch->vrp->buf_size - sizeof(struct rpmsg_hdr);
+	return vch->vrp->tx_buf_size - sizeof(struct rpmsg_hdr);
 }
 
 static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
@@ -673,7 +674,7 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
 	 * We currently use fixed-sized buffers, so trivially sanitize
 	 * the reported payload length.
 	 */
-	if (len > vrp->buf_size ||
+	if (len > vrp->rx_buf_size ||
 	    msg_len > (len - sizeof(struct rpmsg_hdr))) {
 		dev_warn(dev, "inbound msg too big: (%d, %d)\n", len, msg_len);
 		return -EINVAL;
@@ -706,7 +707,7 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
 		dev_warn_ratelimited(dev, "msg received with no recipient\n");
 
 	/* publish the real size of the buffer */
-	rpmsg_sg_init(&sg, msg, vrp->buf_size);
+	rpmsg_sg_init(&sg, msg, vrp->rx_buf_size);
 
 	/* add the buffer back to the remote processor's virtqueue */
 	err = virtqueue_add_inbuf(vrp->rvq, &sg, 1, msg, GFP_KERNEL);
@@ -820,10 +821,13 @@ static int rpmsg_probe(struct virtio_device *vdev)
 	struct virtproc_info *vrp;
 	struct virtio_rpmsg_channel *vch = NULL;
 	struct rpmsg_device *rpdev_ns, *rpdev_ctrl;
+	u16 rpmsg_buf_align = 0;
 	void *bufs_va;
 	int err = 0, i;
 	size_t total_buf_space;
 	bool notify;
+	u8 version;
+	u16 size;
 
 	vrp = kzalloc_obj(*vrp);
 	if (!vrp)
@@ -855,9 +859,90 @@ static int rpmsg_probe(struct virtio_device *vdev)
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
+
+		/* for now we support only v1 */
+		if (version != RPMSG_VDEV_CONFIG_V1) {
+			dev_err(&vdev->dev,
+				"unsupported vdev config version %u\n", version);
+			err = -EINVAL;
+			goto vqs_del;
+		}
+
+		/* size of the config space must match */
+		virtio_cread(vdev, struct virtio_rpmsg_config,
+			     size, &size);
+		if (size != sizeof(struct virtio_rpmsg_config)) {
+			dev_err(&vdev->dev, "invalid size of vdev config %u\n",
+				size);
+			err = -EINVAL;
+			goto vqs_del;
+		}
 
-	total_buf_space = (vrp->num_rx_buf + vrp->num_tx_buf) * vrp->buf_size;
+		/*
+		 * Optional alignment applied to each buffer size and to the TX
+		 * buffer base address (e.g. to align buffers on a cache line).
+		 * It must be a power of two; zero means no extra alignment.
+		 */
+		virtio_cread(vdev, struct virtio_rpmsg_config,
+			     rpmsg_buf_align, &rpmsg_buf_align);
+		if (rpmsg_buf_align && !is_power_of_2(rpmsg_buf_align)) {
+			dev_err(&vdev->dev,
+				"bad vdev config: rpmsg_buf_align %u is not a power of two\n",
+				rpmsg_buf_align);
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
+		/*
+		 * The buffer size must be aligned to the provided alignment for
+		 * so that the start address of tx bufs can be aligned.
+		 */
+		if (rpmsg_buf_align &&
+		    (!IS_ALIGNED(vrp->rx_buf_size, rpmsg_buf_align) ||
+		     !IS_ALIGNED(vrp->tx_buf_size, rpmsg_buf_align))) {
+			dev_err(&vdev->dev,
+				"bad vdev config: buf sizes (rx %u, tx %u) not aligned to %u\n",
+				vrp->rx_buf_size, vrp->tx_buf_size,
+				rpmsg_buf_align);
+			err = -EINVAL;
+			goto vqs_del;
+		}
+
+		dev_dbg(&vdev->dev,
+			"vdev config: ver=%u, align=0x%x, rx sz = 0x%x, tx sz = 0x%x\n",
+			version, rpmsg_buf_align, vrp->rx_buf_size,
+			vrp->tx_buf_size);
+	} else {
+		vrp->rx_buf_size = DEFAULT_RPMSG_BUF_SIZE;
+		vrp->tx_buf_size = DEFAULT_RPMSG_BUF_SIZE;
+	}
+
+	total_buf_space = (vrp->num_rx_buf * vrp->rx_buf_size) +
+			  (vrp->num_tx_buf * vrp->tx_buf_size);
 
 	/* allocate coherent memory for the buffers */
 	bufs_va = dma_alloc_coherent(vdev->dev.parent,
@@ -874,15 +959,20 @@ static int rpmsg_probe(struct virtio_device *vdev)
 	/* first part of the buffers is dedicated for RX */
 	vrp->rx_bufs = bufs_va;
 
-	/* and second part is dedicated for TX */
-	vrp->tx_bufs = bufs_va + vrp->num_rx_buf * vrp->buf_size;
+	/*
+	 * Here buf_va is aligned to a page. Also rx buf size is aligned with
+	 * cache line alignment provided by the firmware, so tx buf's start
+	 * address is guranteed to be aligned with the alignment provided by
+	 * the firmware.
+	 */
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
@@ -965,8 +1055,8 @@ static int rpmsg_remove_device(struct device *dev, void *data)
 static void rpmsg_remove(struct virtio_device *vdev)
 {
 	struct virtproc_info *vrp = vdev->priv;
-	unsigned int num_bufs = vrp->num_rx_buf + vrp->num_tx_buf;
-	size_t total_buf_space = num_bufs * vrp->buf_size;
+	size_t total_buf_space = (vrp->num_rx_buf * vrp->rx_buf_size) +
+				 (vrp->num_tx_buf * vrp->tx_buf_size);
 	int ret;
 
 	virtio_reset_device(vdev);
@@ -992,6 +1082,7 @@ static struct virtio_device_id id_table[] = {
 
 static unsigned int features[] = {
 	VIRTIO_RPMSG_F_NS,
+	VIRTIO_RPMSG_F_BUFSZ,
 };
 
 static struct virtio_driver virtio_ipc_driver = {
diff --git a/include/linux/rpmsg/virtio_rpmsg.h b/include/linux/rpmsg/virtio_rpmsg.h
new file mode 100644
index 000000000000..7e14da68fd17
--- /dev/null
+++ b/include/linux/rpmsg/virtio_rpmsg.h
@@ -0,0 +1,50 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) Pinecone Inc. 2019
+ * Copyright (C) Xiang Xiao <xiaoxiang@pinecone.net>
+ * Copyright (C) Advanced Micro Devices, Inc. 2026
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
+/* Version of struct virtio_rpmsg_config understood by this driver */
+#define RPMSG_VDEV_CONFIG_V1	1
+
+/**
+ * struct virtio_rpmsg_config - config space for rpmsg virtio device
+ *
+ * @version:	version of this structure, currently %RPMSG_VDEV_CONFIG_V1.
+ * @reserved:	reserved for padding, must be zero.
+ * @size:	size of this structure in bytes.
+ * @rpmsg_buf_align:	required alignment in bytes for each buffer. Must be a
+ *		power of two so that both the buffer sizes and the TX buffer
+ *		base address can be aligned (e.g. to a cache line).
+ * @reserved1:	reserved for padding, must be zero. Keeps the following 32-bit
+ *		fields naturally aligned.
+ * @txbuf_size:	Tx buf size from remote's view. For Linux this is rx buf size.
+ * @rxbuf_size:	Rx buf size from remote's view. For Linux this is tx buf size.
+ *
+ * This is the configuration structure shared by the device and the driver,
+ * read when %VIRTIO_RPMSG_F_BUFSZ is negotiated. The fields are laid out so
+ * the structure is naturally 32-bit aligned.
+ */
+struct virtio_rpmsg_config {
+	u8 version;
+	u8 reserved;
+	__virtio16 size;
+	__virtio16 rpmsg_buf_align;
+	__virtio16 reserved1;
+	/* The tx/rx individual buffer size (if VIRTIO_RPMSG_F_BUFSZ) */
+	__virtio32 txbuf_size;
+	__virtio32 rxbuf_size;
+} __packed;
+
+#endif /* _LINUX_VIRTIO_RPMSG_H */
-- 
2.34.1

