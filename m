Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012005.outbound.protection.outlook.com [40.107.209.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19DE23B582F;
	Mon, 15 Jun 2026 20:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781554827; cv=fail; b=Ljol+yBR5l/BSmFpSYlaNvwhCRJuxwGMo7F+OsFPzQznk375WWA5GyIH/cC7/fjwso5H2hSJqYH5h088Qb78mWPLTXwQ95LochQw4nS/jFA0tMcVY2oM6hcDQo9zLLonZbZs7w8MVpIYZO+HJq0Zz/tsUYyqYV5ne+Cdlhguzfw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781554827; c=relaxed/simple;
	bh=AzuWtuFcKkeGk2SjUXJHCHngk9bXPItDsq0XJrdSmuw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rsLgVterOqQ5Q8C/q9/2Qf68T5FPtBKfdqC3H6Xgu398Q3DapVJwp7EeTTXMY9CAz7SQIDzQ4rJWYjlSaZNK9ms/lHLG9j/Az7ni/bxLrOhbQySQAOvV6BYV7OLRqyGePW0fn4w84UkYzY2Z9swZE7BHKtHj6G1wNlrCEhP2PTM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=naxF71yb; arc=fail smtp.client-ip=40.107.209.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="naxF71yb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hYgnqkyVFQtZW3yx0l6q4Yjpv/7ZRtCaxKjbr+FUUXg72uFcqwFzmHjAgoZof99+zf1I3mBqjVdtZZdHG/CyL7md1bn/REevfX8tMUSnZv2RIx0Th8UJDLE2bMvZBMPAf6gyM0OMpLyGDNDgXcUkhKYIu+4FkXg992iA1p4FHEyQ3D6LT7k+SRwjI4K3K20Mhac2QGqxy2PpmtB1ABrlUcpRiV5pOuTThUEUAm5R6vHH+sEJFkLrdxmZPHpnYDN3eIrSLJ4ty6Fs1AhApJGI7IsgX3CiW05LZXFZQq9Nn/jNeHv2vR64iP9UBGqQh07KVSgDuOlmaPwtjCk0j3yVpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TmGRg1LsyE7BCDRjrlDMRiXTh+DGlKxNSF30ZneF4FE=;
 b=brqCNmSpakZlSeqM7CO7viWYC61FnjuWqA8j6LBuyLJWq6k8+0Pwg5ue4gUKqol1guaNKCiEWBR9vt7pP9OfaDzozZdK6GsyotmHWqtb1lcV+Tcc0knMO1ODR/St9lJiVbThwekX8T/VRVup9wouyyzx3IHKBTle+8RrA9+aJWgQHWN9+/xUjs6pCKw5aQmdf2Z2T2DORT5RCi22/KNbat+6Px+jOhvnbHLnsIGGuHl9KdmPn7VSe+bY8WUmgmaJbIECVg9toZBvyX7RyQOSZxsalmjbulYN9v7EwkSI0wFDCdytIykpvI8S3zBjoFQKwHEaoG8TQmJzERVJSIDcHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TmGRg1LsyE7BCDRjrlDMRiXTh+DGlKxNSF30ZneF4FE=;
 b=naxF71ybmZWGh1Px8vrNmAvS0Xciy25uoEvvU7CMW5JRZB+YyenGGMjfD20nn/Y1IsxDXFUUGQ5JQGQ/fXdA+LqKIneeqfxjY81Iq7J6+Ul5W27LjLroYxVx/R1J87jIwWwMB0O2wxt3QxaOL8aYM8ZaPU5fM8Q9NefDfYuw3KM=
Received: from DS1PR04CA0017.namprd04.prod.outlook.com (2603:10b6:8:243::19)
 by BL4PR12MB9483.namprd12.prod.outlook.com (2603:10b6:208:590::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 20:20:19 +0000
Received: from DS2PEPF000061C6.namprd02.prod.outlook.com
 (2603:10b6:8:243:cafe::3) by DS1PR04CA0017.outlook.office365.com
 (2603:10b6:8:243::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.18 via Frontend Transport; Mon,
 15 Jun 2026 20:20:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS2PEPF000061C6.mail.protection.outlook.com (10.167.23.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Mon, 15 Jun 2026 20:20:19 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 15 Jun
 2026 15:20:18 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 15 Jun
 2026 15:20:18 -0500
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 15 Jun 2026 15:20:18 -0500
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>, <arnaud.pouliquen@foss.st.com>
CC: <linux-remoteproc@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Tanmay Shah <tanmay.shah@amd.com>
Subject: [PATCH v4 2/5] rpmsg: virtio_rpmsg_bus: allow different size of tx and rx bufs
Date: Mon, 15 Jun 2026 13:20:04 -0700
Message-ID: <20260615202007.3484668-3-tanmay.shah@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C6:EE_|BL4PR12MB9483:EE_
X-MS-Office365-Filtering-Correlation-Id: 52f6dd8b-f410-4534-14bc-08decb1b8571
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|1800799024|36860700016|376014|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	N551hTIu/HJQ3abrPuWqrY9ppRs9OgSBZxZow/I0MQdBpswSKAzRcfnmTYO5z5AdyhTh2ksHZUBsiVfywLupNrrPnFjbKJZkbkJQ8g1W5zmL9zyiIOt9pgxs8MXOKVjPpAl5DZ5PiHNO5IM2R00brZB8vkQqdBjA1y8bm2SGbZfmE08c4bOMAPwlFO5wzcrcGXW0iFWELjVqPQ0T7FCM1XFbxFSQAN09lwAwBQve69RqlpvYIuzhj0VfDGKq3ePXTZC7EuiYtQU2x4Dwv32LHdw3bXk9wSUvP8eQ+aDzstfbT7qDQ+ezFC7U6gaVb0ufWXVko4Ba+n+fXJA8tPFRRIasNNw+7AScSHJPoFcqZMaNGoTl31lPM0vcR5zAeWsAC9he6XEnaSp6HN1NqY+IMHjXoY8JehwuVFokC77f/oybBftygwJ/jYt+PMhVMV6Fd2OpJAXbyMG550us9ojfve1vDAAbxFJVzZvSB16gTZtSk14k7UuCpexrLcDAAkRLb98X0/PiO9QMGMQRJA5yS4Tejpa3ceVzr4/ZtM65aMtEoWKsVoF3MHgKVqpSuUBMFJG3r6byqVsnvSIpdYnq9DeRbQcKQjrktwuTaaMZ6cGcFQYUEJRmk8pgZgfomGykAZi3a1TZi649E25Kj4P12ImZLjoqzU8WJbCKFeowkUmO/4lD0e3H13A78eo8Z6txqCmayups3NHnfS9FSK3HDqffRETDvlq/Gj2XtjqnoQI=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(1800799024)(36860700016)(376014)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5tN6LJlyj8jDLaN4+z7NdjkxzL4OViPXV2uTHSfCnin9H6RSpPT98z1HyjADDSE8bxdDVpnD+pH+cnvLhQxWSbNWrBMjTMaGOaxt1hbxkm/koKEt+YYff1nR1UpQbGkIR2KYI1QxkaVC9NPz6hVREYLqYd+4fLr6bA8l/douxV5XBHmjkXzGVymnqrkeQRA/13oVINuGrK3fpFMn+wwSjBJk90Bxa4HZRKBik7a3cb0cUO2Gqak4yY+xVjzpdnEcDf0mzTkwnp3k0tJSuROpUjAc/be4of+xTuRMIQX+lOcF/K6ksdC0opiwaXE6udH6kEmhSB+tiO9gzhMzoRgOIAdtbhRhFaagujdBIFJeBxi3EXlemJ7YxdcaGWRFvj8BPqum4WHUrSyFEE6DKk8P3ZTzGNCAZ8KvbtzasFLkCIl9SvleY6xc3Sj+KHJElRz2
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 20:20:19.6080
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 52f6dd8b-f410-4534-14bc-08decb1b8571
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF000061C6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9483

Current design allocates memory for tx and rx buffers equally. The
throughput can be increased if the user is allowed to configure number
of tx and rx buffers as required. Hence, do not split number of tx & rx
buffers into half, but decide based on respective vring size.

Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
---
 drivers/rpmsg/virtio_rpmsg_bus.c | 50 ++++++++++++++++----------------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index 773547479d15..99df1ae07055 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -37,7 +37,8 @@
  * @svq:	tx virtqueue
  * @rx_bufs:	kernel address of rx buffers
  * @tx_bufs:	kernel address of tx buffers
- * @num_bufs:   total number of buffers for rx and tx
+ * @num_rx_buf: total number of rx buffers
+ * @num_tx_buf: total number of tx buffers
  * @buf_size:   size of one rx or tx buffer
  * @last_tx_buf: index of last tx buffer used
  * @bufs_dma:	dma base addr of the buffers
@@ -56,7 +57,8 @@ struct virtproc_info {
 	struct virtio_device *vdev;
 	struct virtqueue *rvq, *svq;
 	void *rx_bufs, *tx_bufs;
-	unsigned int num_bufs;
+	unsigned int num_rx_buf;
+	unsigned int num_tx_buf;
 	unsigned int buf_size;
 	int last_tx_buf;
 	dma_addr_t bufs_dma;
@@ -110,7 +112,7 @@ struct virtio_rpmsg_channel {
 /*
  * We're allocating buffers of 512 bytes each for communications. The
  * number of buffers will be computed from the number of buffers supported
- * by the vring, upto a maximum of 512 buffers (256 in each direction).
+ * by the vring, up to a maximum of 256 in each direction.
  *
  * Each buffer will have 16 bytes for the msg header and 496 bytes for
  * the payload.
@@ -125,7 +127,7 @@ struct virtio_rpmsg_channel {
  * can change this without changing anything in the firmware of the remote
  * processor.
  */
-#define MAX_RPMSG_NUM_BUFS	(512)
+#define MAX_RPMSG_NUM_BUFS	(256)
 #define MAX_RPMSG_BUF_SIZE	(512)
 
 /*
@@ -440,11 +442,8 @@ static void *get_a_tx_buf(struct virtproc_info *vrp)
 
 	mutex_lock(&vrp->tx_lock);
 
-	/*
-	 * either pick the next unused tx buffer
-	 * (half of our buffers are used for sending messages)
-	 */
-	if (vrp->last_tx_buf < vrp->num_bufs / 2)
+	/* either pick the next unused tx buffer */
+	if (vrp->last_tx_buf < vrp->num_tx_buf)
 		ret = vrp->tx_bufs + vrp->buf_size * vrp->last_tx_buf++;
 	/* or recycle a used one */
 	else
@@ -631,11 +630,10 @@ static __poll_t virtio_rpmsg_poll(struct rpmsg_endpoint *ept, struct file *filp,
 
 	/*
 	 * check for a free buffer, either:
-	 * - we haven't used all of the available transmit buffers (half of the
-	 *   allocated buffers are used for transmit, hence num_bufs / 2), or,
+	 * - we haven't used all of the available transmit buffers or,
 	 * - we ask the virtqueue if there's a buffer available
 	 */
-	if (vrp->last_tx_buf < vrp->num_bufs / 2 ||
+	if (vrp->last_tx_buf < vrp->num_tx_buf ||
 	    !virtqueue_enable_cb(vrp->svq))
 		mask |= EPOLLOUT;
 
@@ -846,19 +844,20 @@ static int rpmsg_probe(struct virtio_device *vdev)
 	vrp->rvq = vqs[0];
 	vrp->svq = vqs[1];
 
-	/* we expect symmetric tx/rx vrings */
-	WARN_ON(virtqueue_get_vring_size(vrp->rvq) !=
-		virtqueue_get_vring_size(vrp->svq));
-
 	/* we need less buffers if vrings are small */
-	if (virtqueue_get_vring_size(vrp->rvq) < MAX_RPMSG_NUM_BUFS / 2)
-		vrp->num_bufs = virtqueue_get_vring_size(vrp->rvq) * 2;
+	if (virtqueue_get_vring_size(vrp->rvq) < MAX_RPMSG_NUM_BUFS)
+		vrp->num_rx_buf = virtqueue_get_vring_size(vrp->rvq);
+	else
+		vrp->num_rx_buf = MAX_RPMSG_NUM_BUFS;
+
+	if (virtqueue_get_vring_size(vrp->svq) < MAX_RPMSG_NUM_BUFS)
+		vrp->num_tx_buf = virtqueue_get_vring_size(vrp->svq);
 	else
-		vrp->num_bufs = MAX_RPMSG_NUM_BUFS;
+		vrp->num_tx_buf = MAX_RPMSG_NUM_BUFS;
 
 	vrp->buf_size = MAX_RPMSG_BUF_SIZE;
 
-	total_buf_space = vrp->num_bufs * vrp->buf_size;
+	total_buf_space = (vrp->num_rx_buf + vrp->num_tx_buf) * vrp->buf_size;
 
 	/* allocate coherent memory for the buffers */
 	bufs_va = dma_alloc_coherent(vdev->dev.parent,
@@ -872,14 +871,14 @@ static int rpmsg_probe(struct virtio_device *vdev)
 	dev_dbg(&vdev->dev, "buffers: va %p, dma %pad\n",
 		bufs_va, &vrp->bufs_dma);
 
-	/* half of the buffers is dedicated for RX */
+	/* first part of the buffers is dedicated for RX */
 	vrp->rx_bufs = bufs_va;
 
-	/* and half is dedicated for TX */
-	vrp->tx_bufs = bufs_va + total_buf_space / 2;
+	/* and second part is dedicated for TX */
+	vrp->tx_bufs = bufs_va + vrp->num_rx_buf * vrp->buf_size;
 
 	/* set up the receive buffers */
-	for (i = 0; i < vrp->num_bufs / 2; i++) {
+	for (i = 0; i < vrp->num_rx_buf; i++) {
 		struct scatterlist sg;
 		void *cpu_addr = vrp->rx_bufs + i * vrp->buf_size;
 
@@ -966,7 +965,8 @@ static int rpmsg_remove_device(struct device *dev, void *data)
 static void rpmsg_remove(struct virtio_device *vdev)
 {
 	struct virtproc_info *vrp = vdev->priv;
-	size_t total_buf_space = vrp->num_bufs * vrp->buf_size;
+	unsigned int num_bufs = vrp->num_rx_buf + vrp->num_tx_buf;
+	size_t total_buf_space = num_bufs * vrp->buf_size;
 	int ret;
 
 	virtio_reset_device(vdev);
-- 
2.34.1

