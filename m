Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011001.outbound.protection.outlook.com [52.101.57.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6AE3515D7;
	Fri, 14 Aug 2026 04:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786682577; cv=fail; b=nyGA8w/US1vZOVEyS9PHdN1I/TwoYZQvnqN+dnLFVIos22HJgZh6unQEiYA6W17iHPAlps61qqfao7s6IcgBlgRVN1Tnp/wEdOQxYWlm/Y50i/NgLAbZVbFvSKFpYlynRc7t+XErN3MqGN4dy4KNQmwAQTbQJr8hRlSfhc340Ik=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786682577; c=relaxed/simple;
	bh=oUo+GhCNoxaE1XIUP2LziCK+xqmyVXd8hZ4KTdOMnyg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pjCVHpy2VIIsJLR43n3c9vi8fFXrThzlHoCguwYZhNlihXbgtPBV1vaiFY0oVvxGWE2MVc+yA/rvJrSSuLLo+P82VqG8B2BWWmz501ny27tVjVQrVOeeYIr2ITDax+10Et9uNeVpB6ZRZhUxtJbvfovFENCaQyBQdV2GlGJng9I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=UqTRdsqZ; arc=fail smtp.client-ip=52.101.57.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="UqTRdsqZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NK2cjGhHPPziTK8vMo5Cpw1yBfO6Hy1rVihEBDybOppCpg93Qu9uleIErE1K93S55x7p3SNeVlHA0+lwomk88qlxZR6oFcMxqXWRPXDQNo5cXm4NFQmc3WEJ8z6cWNy58pmC9TNWrR3mlvvPZSmWaywLhHU39B4fk9ikK6S9Rmaa9dTPQGNDhdOWVpjOGJT1yhmWf+CRI4eIQZQQIdUUMyyr6d9jLKK7YfZQ4Aqd3Kg9gnq0WyrmbjyLoWPDqaQ6JOCKSYfu517XJbJwWEXcJcmfqaECcoDaCwEoTHacP+GPPyxE7SqW+FLHBXloYVays9ZhJuWPxgjdSQ+ehGOzxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MEC4V08Y/Q2Hdlh1wcxDLPlT6DitxUeNMrht5qQzXsw=;
 b=bLpUmmL0ZJBebC/YC4YMPAu83Fl8ufb0KCjq/XUAvs9xVnorEYcMEx1YM8d75H6UX6UC9rC6AHmCPFQ0PbEUxPYBt9IRFIk3HD5W/3ZpooeKp/W45gKd2ZSyVgB/mwN36AEo14EcjaoygNGXW9gfQOHpcsNx/O//oiRkJiPCN9VZ5iJQafS1lwH9kAGhMZ+AHxj1BAT+d1YfM/BzI+HYE0Sk1bjXfh3cKU2eqIjtbII/fAaIUgTImMIO1kAx9SSCZloayeD1lyIcnDiiJ+Wb7RQ+pr6DnsDnsINZksra4Da10tvnBtzS+h8B54I6fXcNtTwDI84skl1RixEHY1heDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MEC4V08Y/Q2Hdlh1wcxDLPlT6DitxUeNMrht5qQzXsw=;
 b=UqTRdsqZh0urJ7Cy+iB8Y3q6dY9t36+PtPajsvLtT2FTzRdDcssppYsu2bGkW/ljJxAoT2rJpXmZPwZK5i/Rs61q+uR1bvRuX0iZb3uLxW9LFccDe21pnGXsy3gnOlyGy17E/CzA/fOBPQXhHE5+3SUrypp7WWkWVbIWdIYYUF8=
Received: from MN2PR14CA0005.namprd14.prod.outlook.com (2603:10b6:208:23e::10)
 by DM6PR12MB4091.namprd12.prod.outlook.com (2603:10b6:5:222::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Fri, 14 Aug
 2026 04:42:50 +0000
Received: from BL02EPF0002992C.namprd02.prod.outlook.com
 (2603:10b6:208:23e:cafe::44) by MN2PR14CA0005.outlook.office365.com
 (2603:10b6:208:23e::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.15 via Frontend Transport; Fri,
 14 Aug 2026 04:42:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL02EPF0002992C.mail.protection.outlook.com (10.167.249.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Fri, 14 Aug 2026 04:42:50 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 13 Aug
 2026 23:42:49 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 13 Aug
 2026 23:42:49 -0500
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Thu, 13 Aug 2026 23:42:49 -0500
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Tanmay Shah <tanmay.shah@amd.com>
Subject: [PATCH v6 3/5] rpmsg: virtio_rpmsg_bus: get buffer size from config space
Date: Thu, 13 Aug 2026 21:42:36 -0700
Message-ID: <20260814044238.518296-4-tanmay.shah@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260814044238.518296-1-tanmay.shah@amd.com>
References: <20260814044238.518296-1-tanmay.shah@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0002992C:EE_|DM6PR12MB4091:EE_
X-MS-Office365-Filtering-Correlation-Id: f89cde30-4c70-403b-972a-08def9be7f04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|36860700016|82310400026|1800799024|6133799003|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	KXQ/+AsqKdzjM8zQR+E/7jouaURi8MJOQGGsM4j4D4hsavjZVLuXbehJatiHsLEonLyQDAbK1fT3Yb8VaDzHrAagQhxm8dOzUcbwP9XmhJDk4v5Rc8PSYW3zIuEhqJ2JRvt+dvzfBDm3Gfa4tHKKBh/EQ57RdpKbWA57VE4drOWq7dLvkQibsfvNn3Nyl8JMg8eyESIJ/6Mt/RgEV/3a47DINiEpTu7unydACR4ngtexAKD736wx/i4oqxGDlBGUDperP29UtJowgemQmZHYelYbqiB5dz7l2RoGAhR17T+NH9wfMd/XzmVmDLKItMG/g5Y36KG9c88VIcD1EY2Nn5h6fB0Nr9knEe0WCfQXLutZDqDzPAb+FY+4XnavI/jDr+04uGLtcZLaslIZQWAtJEA+1pFhR6immg/UBavdkuLaXodkTJ6myizXu/M8hvqEuGkIktPkeL1WmMwwab0kpVJ1pfrI6mV6HyfdJLCWwGW67yn4C8bm7msTNL0zHZM2y5I34aQAKl7FZF9MuW2GOAiNVm8rJMbwEDXqC2OkHk6KN2BO+SKUidzDcqd6xxK5wzVEqFzQAKzfxWNn07m7Y6+YYbeM7jIQbaqFadvgYCSvW32dwWp5FreBFqqpufs7F7nYS7gtMdQjEVSmIsOXpfKww2Y9ozGLkhMlI/WFd3i/SpQV75QeIOWjFHd9jo1d3gswtvbZ2hDoqtygBHtIxw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(36860700016)(82310400026)(1800799024)(6133799003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	H99NLyO65uhxKCodJgeVFE/T0sGwG0ZkdkNV8W9EzirGNYD8+ABlsA5sSHL/RwVe97IZbuh0Gpvo5U7uBPMxIliZJgMml6MRPBiuBHFoFl/RPOMKsHg2PZ3/EgOZs6cjlewcLQyzp833FHmOtI1j+AvQVBWTcpy2lxPNQzHmr7ZtdjfswQANtKNdHKtpDR/BoyvEMrjNI2r4NNo59abISRQc+wk4iEk5hnHqR5VELgBaYz1HeNcP5GDcyDra0b49JdQl06ORwlUTKb1zPdzPc+c4vr2V0XwwsokCIZbvtNodmoJ2C3+R+Fe+rrDeNd3dVZ/iiQe/w4D0wSSE0uWReZRFK1JShIsPODObUGBESxkJ6n7mKJwEIG9bTp/7lk/CcgGhglJR1Q1TKudZFgZJ8RGbagILxFrjLUUCEtWue0NXHioQbTfoTkLNl+M9yOZP
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 04:42:50.2864
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f89cde30-4c70-403b-972a-08def9be7f04
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4091

512 bytes isn't always suitable for all case, let firmware
maker decide the best value from resource table.
enable by VIRTIO_RPMSG_F_BUFSZ feature bit.

Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
---

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

 drivers/rpmsg/virtio_rpmsg_bus.c   | 90 +++++++++++++++++++++++-------
 include/linux/rpmsg/virtio_rpmsg.h | 41 ++++++++++++++
 2 files changed, 112 insertions(+), 19 deletions(-)
 create mode 100644 include/linux/rpmsg/virtio_rpmsg.h

diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index c84b6cec9caf..4235e09dc3b7 100644
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
@@ -823,6 +823,8 @@ static int rpmsg_probe(struct virtio_device *vdev)
 	int err = 0, i;
 	size_t total_buf_space;
 	bool notify;
+	u8 version;
+	u16 size;
 
 	vrp = kzalloc_obj(*vrp);
 	if (!vrp)
@@ -854,9 +856,59 @@ static int rpmsg_probe(struct virtio_device *vdev)
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
+			"vdev config: ver=%u, rx sz = 0x%x, tx sz = 0x%x\n",
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
@@ -873,15 +925,14 @@ static int rpmsg_probe(struct virtio_device *vdev)
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
@@ -964,8 +1015,8 @@ static int rpmsg_remove_device(struct device *dev, void *data)
 static void rpmsg_remove(struct virtio_device *vdev)
 {
 	struct virtproc_info *vrp = vdev->priv;
-	unsigned int num_bufs = vrp->num_rx_buf + vrp->num_tx_buf;
-	size_t total_buf_space = num_bufs * vrp->buf_size;
+	size_t total_buf_space = (vrp->num_rx_buf * vrp->rx_buf_size) +
+				 (vrp->num_tx_buf * vrp->tx_buf_size);
 	int ret;
 
 	virtio_reset_device(vdev);
@@ -991,6 +1042,7 @@ static struct virtio_device_id id_table[] = {
 
 static unsigned int features[] = {
 	VIRTIO_RPMSG_F_NS,
+	VIRTIO_RPMSG_F_BUFSZ,
 };
 
 static struct virtio_driver virtio_ipc_driver = {
diff --git a/include/linux/rpmsg/virtio_rpmsg.h b/include/linux/rpmsg/virtio_rpmsg.h
new file mode 100644
index 000000000000..e28144253a12
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
+#define VIRTIO_RPMSG_F_BUFSZ	1 /* RP get buffer size from config space */
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

