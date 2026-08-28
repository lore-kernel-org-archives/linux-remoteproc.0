Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011008.outbound.protection.outlook.com [52.101.52.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1B747255B;
	Fri, 28 Aug 2026 14:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787929164; cv=fail; b=CaJhaeu9ibZSm0p4EWrfr5JvFVZVatM9FJjQRnwy8ccd9kwk1jnM6LqjgpwSnQV17HAC6hC7EFgtSNwN8COIxYTR1vYmBFlWB46oC7Wvkn34HWyRm2qyd553YV/O9pX3jSadP2hZLcbX4zgwMDhDj/hyJiVj8zuO6AB5DEOjeNM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787929164; c=relaxed/simple;
	bh=8WWd83+V2uGv236U7atTphBHEO+riCez6RiglcITh90=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rgSC+rwZbCpBUujBGhKqIjSSWhFvy2HSaPr4/6VI6oJ59H3V4g0c6zanfZ9ubuqSgqSVWE4yEgaeqZUtUjotTgCfSbzeS+uILeUOiDPF3vZJ6M3j2hPTTJyWIvLXtAX+j/m/zgaKTLeIJEGONor9XJ9FT3KNPKxfSSVZcL0rtM4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=nBxLeFaF; arc=fail smtp.client-ip=52.101.52.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="nBxLeFaF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z4H+QgntPAmaoQBVHu3gQ/IbLx5rJA34sZVSdX2UD9rYgVdx+2kVPJHmEaPGp8A3GIi5CPjFKKnhWb/ZYzTGhHV+mvptX8wXeE8dEVb6S1AbeeVBwE/c/6z5+ZGLaIHAJd58V0OR0/L+Zb3UfvW7oQ6RNmjxIwltMeR9Cryonj+uJK9BCmHIKX4mI4dFJo9wfy4T8vOBpUWy4x9cd0MGShk0AsH9UQQjbfxSHMbyW2e5ifsGIabXzuD03XitjdIS81Z+Y1GkXZKg2R4cKQl9ptkTNoIchFCpDJTx2pCnq2ukdajpBvgTbS8rrN9LHtFeweSNIbWeiOAUkjp1WL48vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lQETnP+cNRuJ8xPsqSCQVLcuWk4JLmqBILinE0lT9xI=;
 b=kke0htNRcF46t1gqqDWHopN3TMrOINdu8YxT2mBZr/u8T2lNlb4TRc15foXWQh6HaNCZXUfCkJ1QGjr3o78uxxbEjRi5B3TMWBppQrO2/gNqL9L6POgnNaQockLwMWuYr9MbZnL0syKIbqaH8xBkIweIsimdihTqwqlDduubymhvTvSLPvFsXYTgxbVvnEpMVjgCOG/Jp2romJU8UfCvMzdpTLvtHz2RSO2FTYQ6bBoAqB9mA0U7POByonT3eMb6l5FWTc8Dur34Y4kIJdWd1JEoi468Lypqy0qvpAO+1Z3qXv7z9YHZWhWlgFhBsREg0KRp8Gn7dyIE7Dtx/MW0yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lQETnP+cNRuJ8xPsqSCQVLcuWk4JLmqBILinE0lT9xI=;
 b=nBxLeFaFpT9qNJG1u553stkWOCf6M9vWqquSHXVXXbHiZgNvErpOsluezrT5dT9wwUFXYIlsu3TfHHM4Eki+5EXpM+FF15Rxa5CKTiS8mcGwDToRvBlR5oXsqeF6kzlwMKS+DwPhEWBWJzIPdUzya+s3hDxZNwPE/G40QYIWVaQ=
Received: from BN9P221CA0021.NAMP221.PROD.OUTLOOK.COM (2603:10b6:408:10a::15)
 by SA3PR12MB9132.namprd12.prod.outlook.com (2603:10b6:806:394::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Fri, 28 Aug
 2026 14:59:17 +0000
Received: from BL02EPF0001A104.namprd05.prod.outlook.com
 (2603:10b6:408:10a:cafe::72) by BN9P221CA0021.outlook.office365.com
 (2603:10b6:408:10a::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.12 via Frontend Transport; Fri,
 28 Aug 2026 14:59:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0001A104.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Fri, 28 Aug 2026 14:59:17 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 28 Aug
 2026 09:59:14 -0500
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Fri, 28 Aug 2026 09:59:13 -0500
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Tanmay Shah <tanmay.shah@amd.com>
Subject: [PATCH v8 3/5] rpmsg: virtio_rpmsg_bus: get buffer size from config space
Date: Fri, 28 Aug 2026 07:58:50 -0700
Message-ID: <20260828145853.2843486-4-tanmay.shah@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260828145853.2843486-1-tanmay.shah@amd.com>
References: <20260828145853.2843486-1-tanmay.shah@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A104:EE_|SA3PR12MB9132:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f962384-52c6-44ef-9ccb-08df0514ef03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|23010399003|36860700016|10067099003|6133799003|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	BceOOsPbMRHbq0ZNHzxJV7pz7nBu1MHEDWTOKOp8YqiD9OwiBdVqGNWKTAh4tYdvr/gFqz4ET9ljGxRVKUhunjHAZDOvKkXqW+cSvOvJbawspsHI4DeDL+AqQ+TS0QoQpfeuv+6TJgsYDF4X6/waKtEoMi0rYA4K3f8GARQDEbCnEXnRefRf4wEfa7AibPbSZqNqP3IVGN0tB8E+BQdh3bz4lWElcrCy4xP+GKBEi/3CKzRj5qv4nbSuGoBjyNWP6C9K4+6OJnsDmoPt40ZJTX33d1cs/PwnSE8J/KKyxGVBJRdKfTB+Ut7zeG9rAYwbBCKfDx7v7t4R7twJtpaClthOw+eNrojt6ljTAVGjQCZY1EnN0VU4JyAg5xugjGYf8K6NpKF2geUoW6nrkW4TzVRhpF51hocBJq+2NK+m7ELP8ttu5R1gSyNvhnRZvQl0qQwsgcUIY4gFUcBv4TlY7qo0KMIUxp3THNsReBJGUgXOXF6iKac6kwekZuCp6gdh6CBQn6xS4kQ5wizM14nIUEam3fxHKHVFl97XC0PZPo/VHtLKQfDZj09a5g9RTh0q0kP2mjEtMKW3AHYfcqoaX3J30J319NVJ2j5SxjlIj1smKE+ogXZ9R5sg8ztb0NWmnvSwCtdIpMfZtX8cPr/RBRWm2bmS3cXZ0n5I96/8rmGxarEQbHZCgKrjSZ89tT2gYZccbFKNYZWVm2DO9Hut3g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(23010399003)(36860700016)(10067099003)(6133799003)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	vAxvoFMRT9BcpkkNBK4w9qaYwiNPooKRXjTGBoQAZg/0XGDJOfcTMTUMmn96wUdGtsvr6Ori4BquEpgpbQYQUFDJ3FA9uJB7IKp72wTbeIFnjvt/X+xz3kUNnroh2RXKCv5OIM/sP5Ox5M8hZ7gukJ7gbspureSyjn4RTTO10vrqbQFBrXzMq8J4lEUI+AcP9WtfG2gpKjKOFjOZymJ3BNwWIcB95DjqZVEIkItuMeZBjeMVr5Yki6oBSJTxy95ehcWeAvdmpbZ/rCFaCpyM4eGBdWAsH4QU+EYKd2NBwSQ2aw0zqzUSI+lySLwTdAfzCJzg7QlOQW45HFx2J/+7jmVUdcAQxkma9Egi0aqFM7qSLyJbYk8cRd5uHvufOsSNlD832fnqSeOUFD2DN0IWtsqMM2D2EMHHtjB1St5S6LP2H8TBTNOyDJBuo7WYEZi8
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 14:59:17.7026
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f962384-52c6-44ef-9ccb-08df0514ef03
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A104.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9132

512 bytes isn't always suitable for all the cases, let firmware
maker decide the best value from the resource table. Enabled
by VIRTIO_RPMSG_F_BUFSZ feature bit.

Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
---

Changes in v8:
  - fix commit message of 3/5, "%s/enable/Enabled"
  - introduce new function to get buffer size for the vdev device
  - fix description of VIRTIO_RPMSG_F_BUFSZ define

changes in v6:
  - remove buffer alignment from config space

Changes in v5:

  - fix documentation about alignment of the buffer size
  - change version field from u16 to u8
  - remove buffer alignment check
  - Separate buffer alignment vs MTU of a single buffer
  - Use buffer alignment only to get next buffer address at alignment
    boundary

Changes in v4:

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

 drivers/rpmsg/virtio_rpmsg_bus.c   | 100 +++++++++++++++++++++++------
 include/linux/rpmsg/virtio_rpmsg.h |  41 ++++++++++++
 2 files changed, 122 insertions(+), 19 deletions(-)
 create mode 100644 include/linux/rpmsg/virtio_rpmsg.h

diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index c84b6cec9caf..40ec93fedde9 100644
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
@@ -128,7 +128,7 @@ struct virtio_rpmsg_channel {
  * processor.
  */
 #define MAX_RPMSG_NUM_BUFS	(256)
-#define MAX_RPMSG_BUF_SIZE	(512)
+#define DEFAULT_RPMSG_BUF_SIZE	(512)
 
 /*
  * Local addresses are dynamically allocated on-demand.
@@ -443,7 +443,7 @@ static void *get_a_tx_buf(struct virtproc_info *vrp)
 
 	/* either pick the next unused tx buffer */
 	if (vrp->last_tx_buf < vrp->num_tx_buf)
-		ret = vrp->tx_bufs + vrp->buf_size * vrp->last_tx_buf++;
+		ret = vrp->tx_bufs + vrp->tx_buf_size * vrp->last_tx_buf++;
 	/* or recycle a used one */
 	else
 		ret = virtqueue_get_buf(vrp->svq, &len);
@@ -513,7 +513,7 @@ static int rpmsg_send_offchannel_raw(struct rpmsg_device *rpdev,
 	 * messaging), or to improve the buffer allocator, to support
 	 * variable-length buffer sizes.
 	 */
-	if (len > vrp->buf_size - sizeof(struct rpmsg_hdr)) {
+	if (len > vrp->tx_buf_size - sizeof(struct rpmsg_hdr)) {
 		dev_err(dev, "message is too big (%d)\n", len);
 		return -EMSGSIZE;
 	}
@@ -646,7 +646,7 @@ static ssize_t virtio_rpmsg_get_mtu(struct rpmsg_endpoint *ept)
 	struct rpmsg_device *rpdev = ept->rpdev;
 	struct virtio_rpmsg_channel *vch = to_virtio_rpmsg_channel(rpdev);
 
-	return vch->vrp->buf_size - sizeof(struct rpmsg_hdr);
+	return vch->vrp->tx_buf_size - sizeof(struct rpmsg_hdr);
 }
 
 static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
@@ -672,7 +672,7 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
 	 * We currently use fixed-sized buffers, so trivially sanitize
 	 * the reported payload length.
 	 */
-	if (len > vrp->buf_size ||
+	if (len > vrp->rx_buf_size ||
 	    msg_len > (len - sizeof(struct rpmsg_hdr))) {
 		dev_warn(dev, "inbound msg too big: (%d, %d)\n", len, msg_len);
 		return -EINVAL;
@@ -705,7 +705,7 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
 		dev_warn_ratelimited(dev, "msg received with no recipient\n");
 
 	/* publish the real size of the buffer */
-	rpmsg_sg_init(&sg, msg, vrp->buf_size);
+	rpmsg_sg_init(&sg, msg, vrp->rx_buf_size);
 
 	/* add the buffer back to the remote processor's virtqueue */
 	err = virtqueue_add_inbuf(vrp->rvq, &sg, 1, msg, GFP_KERNEL);
@@ -809,6 +809,65 @@ static void rpmsg_virtio_del_ctrl_dev(struct rpmsg_device *rpdev_ctrl)
 	device_unregister(&rpdev_ctrl->dev);
 }
 
+static int rpmsg_virtio_get_buf_size(struct virtproc_info *vrp)
+{
+	struct virtio_device *vdev;
+	u8 version;
+	u16 size;
+
+	vdev = vrp->vdev;
+
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
+			return -EINVAL;
+		}
+
+		/* size of the config space must match */
+		virtio_cread(vdev, struct virtio_rpmsg_config,
+			     size, &size);
+		if (size != sizeof(struct virtio_rpmsg_config)) {
+			dev_err(&vdev->dev, "invalid size of vdev config %u\n",
+				size);
+			return -EINVAL;
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
+			return -EINVAL;
+		}
+
+		dev_dbg(&vdev->dev,
+			"vdev config: ver=%u, rx sz = 0x%x, tx sz = 0x%x\n",
+			version, vrp->rx_buf_size, vrp->tx_buf_size);
+	} else {
+		vrp->rx_buf_size = DEFAULT_RPMSG_BUF_SIZE;
+		vrp->tx_buf_size = DEFAULT_RPMSG_BUF_SIZE;
+	}
+
+	return 0;
+}
+
 static int rpmsg_probe(struct virtio_device *vdev)
 {
 	struct virtqueue_info vqs_info[] = {
@@ -854,9 +913,12 @@ static int rpmsg_probe(struct virtio_device *vdev)
 	else
 		vrp->num_tx_buf = MAX_RPMSG_NUM_BUFS;
 
-	vrp->buf_size = MAX_RPMSG_BUF_SIZE;
+	err = rpmsg_virtio_get_buf_size(vrp);
+	if (err)
+		goto vqs_del;
 
-	total_buf_space = (vrp->num_rx_buf + vrp->num_tx_buf) * vrp->buf_size;
+	total_buf_space = (vrp->num_rx_buf * vrp->rx_buf_size) +
+			  (vrp->num_tx_buf * vrp->tx_buf_size);
 
 	/* allocate coherent memory for the buffers */
 	bufs_va = dma_alloc_coherent(vdev->dev.parent,
@@ -873,15 +935,14 @@ static int rpmsg_probe(struct virtio_device *vdev)
 	/* first part of the buffers is dedicated for RX */
 	vrp->rx_bufs = bufs_va;
 
-	/* and second part is dedicated for TX */
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
@@ -964,8 +1025,8 @@ static int rpmsg_remove_device(struct device *dev, void *data)
 static void rpmsg_remove(struct virtio_device *vdev)
 {
 	struct virtproc_info *vrp = vdev->priv;
-	unsigned int num_bufs = vrp->num_rx_buf + vrp->num_tx_buf;
-	size_t total_buf_space = num_bufs * vrp->buf_size;
+	size_t total_buf_space = (vrp->num_rx_buf * vrp->rx_buf_size) +
+				 (vrp->num_tx_buf * vrp->tx_buf_size);
 	int ret;
 
 	virtio_reset_device(vdev);
@@ -991,6 +1052,7 @@ static struct virtio_device_id id_table[] = {
 
 static unsigned int features[] = {
 	VIRTIO_RPMSG_F_NS,
+	VIRTIO_RPMSG_F_BUFSZ,
 };
 
 static struct virtio_driver virtio_ipc_driver = {
diff --git a/include/linux/rpmsg/virtio_rpmsg.h b/include/linux/rpmsg/virtio_rpmsg.h
new file mode 100644
index 000000000000..0872cbca4593
--- /dev/null
+++ b/include/linux/rpmsg/virtio_rpmsg.h
@@ -0,0 +1,41 @@
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
+#define VIRTIO_RPMSG_F_BUFSZ	1 /* RP advertises RX/TX buffer sizes from config space */
+
+/* Version of struct virtio_rpmsg_config understood by this driver */
+#define RPMSG_VDEV_CONFIG_V1	1
+
+/**
+ * struct virtio_rpmsg_config - config space for rpmsg virtio device
+ *
+ * @version:	version of this structure, currently %RPMSG_VDEV_CONFIG_V1.
+ * @size:	size of this structure in bytes.
+ * @txbuf_size:	Tx buf size from remote's view. For Linux this is rx buf size.
+ * @rxbuf_size:	Rx buf size from remote's view. For Linux this is tx buf size.
+ *
+ * This is the configuration structure shared by the device and the driver,
+ * read when %VIRTIO_RPMSG_F_BUFSZ is negotiated. The fields are laid out so
+ * the structure is naturally 32-bit aligned.
+ */
+struct virtio_rpmsg_config {
+	u8 version;
+	__virtio16 size;
+	/* The tx/rx individual buffer size (if VIRTIO_RPMSG_F_BUFSZ) */
+	__virtio32 txbuf_size;
+	__virtio32 rxbuf_size;
+} __packed;
+
+#endif /* _LINUX_VIRTIO_RPMSG_H */
-- 
2.43.0

