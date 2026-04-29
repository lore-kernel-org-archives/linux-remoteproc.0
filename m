Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011042.outbound.protection.outlook.com [40.93.194.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2DC63FE651;
	Wed, 29 Apr 2026 16:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777479205; cv=fail; b=Tb7lNR5bGAgXZMb4kBG5uhIyjOjmFMkVWtXqdcmLscSwRPu+XXVjYafEf0WeNdGUjNjOHU2iy1Tlct9ZmZ8OtS26btowSsTT4bNh3/p+DD04VpcI5NUPbHKJUh/Lfx781g7OJAOPblO4xceJsBBXr8Bd2u/DMSAUZfiEOuBJago=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777479205; c=relaxed/simple;
	bh=5aXGfmeNdC3D+UEi24EnGtm8MNtlDWmW3e9uM+T7Ol8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=poDJGY+evcdPzMSZ/LP2bv9iq0fjjlEJcso8ZcXuQaFsGfPC/ROiDH6NBPiwj9nxpJ1YdKmKfgS0Y7FBa6dqgDANQzLHKrt2WiT488acVLIO9+f7F4VsEAWc6xZlbOKtC5+/CADlWyLkuiDApGVPARt+OjkGz7N6bUqSxCcd6L8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=aGb1P7KA; arc=fail smtp.client-ip=40.93.194.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="aGb1P7KA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dAVTphA08J6iPi2LDnGpIVlg9g5WRr5GQUkwvnzwmXagi9YYJXzadF6uWcTdmwxpP25UrODDpKNnl34vzgaSraEwrKW+SFqheaSEY2CKPa722l3PhMDqo1AX6oe6c8GMiu9CirL1kCX3HUz+hi0VvsmsP3AUXmdWg1eSZSUKhsa5Oy04IQME0+J+ue2slLXbGka+264NX6CurMdOPi2V/uhdPOPq76/SAJHblvoUV7Uf7Fx6pbtJoeKfTlo7QpGoWHAYtoFbXc2gODrV3ybUZ9LK3idOmpNu5dPLeSk4fLAyfK28JfsPoOvDiZefcnQAHpNx7ymWerZHvmvIPAM5Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J27c6cR27Nk3BaCxRAtAgqitKo9Kx/2hRcqCz1oMGQ4=;
 b=mrH0zwR3/Q2Gcoe6ooKAsjTcnkHZU32X+DlWLd5smeC312jlEUHz3JTmmd76HCtsu+EiUgvS+u0bRaaxXbxp3lLRKzVt5yul0VyD3SbANI7NDtgJcz1D7A64IbRZUid/oXeQQdovaxW6DhTCrHCrvzIWCHtZJXyCgruogkVtmQcW9BdlVWZN8Bvrve/y/Y8zSxigdaLSujuhBrUePffSufDpzBFaCqeY6OJWqHc7hhatJXiSnkCDXUa2D4w5n5zDpRpFfwtLBolX8Df7/hrYt4e+7Gf3KdQ6RXJYFfCyZhXTf/73nRnuHkdOn5ZxX1WXyMnaWi8AcwwF4623pjhn2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J27c6cR27Nk3BaCxRAtAgqitKo9Kx/2hRcqCz1oMGQ4=;
 b=aGb1P7KAMaTVjs7IIiOgQj6QtI+qZabb7zHPkJz7+Uv5oMFAnfLWukinY4kb2Sl7eQgE6ud6qbNz2BbNrrSGEm969YbwFgrQcm6BVptUCBQaOBZ4vIS5L2dOIhLQEFbG50tYiStLT6cJQZQDs9xUeLahP/9BHfI+h1Aws4qTsg0=
Received: from BN9PR03CA0395.namprd03.prod.outlook.com (2603:10b6:408:111::10)
 by DM4PR12MB6493.namprd12.prod.outlook.com (2603:10b6:8:b6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Wed, 29 Apr
 2026 16:13:09 +0000
Received: from BL6PEPF00022573.namprd02.prod.outlook.com
 (2603:10b6:408:111:cafe::96) by BN9PR03CA0395.outlook.office365.com
 (2603:10b6:408:111::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.30 via Frontend Transport; Wed,
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
 15.20.9846.18 via Frontend Transport; Wed, 29 Apr 2026 16:13:08 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Apr
 2026 11:13:06 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Apr
 2026 11:13:05 -0500
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 29 Apr 2026 11:13:05 -0500
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>,
	<arnaud.pouliquen@foss.st.com>
CC: <linux-kernel@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>, Tanmay
 Shah <tanmay.shah@amd.com>
Subject: [PATCH v2 1/3] rpmsg: virtio_rpmsg_bus: allow different size of tx and rx bufs
Date: Wed, 29 Apr 2026 09:10:51 -0700
Message-ID: <20260429161052.528015-2-tanmay.shah@amd.com>
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
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022573:EE_|DM4PR12MB6493:EE_
X-MS-Office365-Filtering-Correlation-Id: 28a84902-90c1-4d47-33fe-08dea60a3448
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	yTeIWbOtlbvg5+LlrGMB6x0inXYre9AQfNPiuPmQLjCa6oEV3peuskpMdXijk/POnm9nl1OWY4deVt74g/6sUlcaYVVB1qZmtdw6lot2c++M2jktSp0qHcT+Y/uASqNIXlkvo6ID0QIfGUxCQTWEqLXeRQxRQzuwwNQxnAkHbRdb2P+ZFT54w8MBCxhkliy2FpwdcPkSHDAseS3f77KkHsenF2Il3O3yjO5gDjOiEOgwC8b14RH5kknJfG8M6Qh4t+la0tMWzeM0dTZw0pxO18+9XSyvySXneaQ5Bi5lHJGidOggml2wy7KZ5yOdIuuci/p3lUckNMu8+Q8RAIikzA8VX2kQGpUsGuWfIf9MGs6TADAPFdI++ENXFpc/LOZyAcCUAJZME770S3zwKWF7vumlZXE7Y3n73nMZ8dIDf4t6jQlqeXUmNHBPIbM3Od14FQWyg/cCoJvuoSByjYgpcl27TeXvNlq5sG4hoOnqdU/Xuaw8iTemrY8SUWEQr2KPIaDd0N03S9WeaSmtS74qqkGm7Q1DT/Ior6QBG20RjlIHVLmN+Q6AAOBZpMpYJUW0yRNpMXTDuJehcaVO6PhNH18wbKPeNm6fwSvqr0K7tZp2MUnzrKEPyHHkJseNv5E17MA1Ju/IxmSG2mExzMNi8A2WQ6RxvYjfQ9NrUoZcCq6xehuSqz7DX7VU9to6GNu3i3RlYiaEMd2cuY/GVCJPKAyIwEd4/OOQWLIdySrG4/402bHR9140qggIIMeH09uch5KmUB8g9fzy2L2II+RMuw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0LDoi3wUxjQJFP56LtZKaXln/B6ZfrkfLguekgx9I5cFMe6NtRGYPYjF0R/XBJWuKulI9FUsNo3/3trEJcYDeF+1HMJiB8xbyCPy1FHAEpCw5Cp4E4hLUO9aywd6McJksnya7s6JJJMaEdVLwiRI3jLdqGKBHIMyfpm0MEXDCuxXDop9wSvAfUCc1bIRjXm4jymnhwUSDqeLU8j2tOL/wzTHUym4CKANcNL9lcnXh54+/GY8KM1xsH5i5P3Y2J00+X55Oxa7PBQhvUNhuIAbynGdOCt1xlx46/DCk9jNxvwBXO4L7RFkHPrjPCxSJo/Qk6Rr+NTUZaMRfgh36MaJfjgxAr/KApf1Z9x/sux69YlpuWiJ+4gGxUBVv3zFGuYhl3GP2UQaV30t2tffzck15DXJMGaKDvE0sI0yPxQ64t3LhXMh3G2k31o/cCzWEL5z
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 16:13:08.9854
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28a84902-90c1-4d47-33fe-08dea60a3448
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022573.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6493

Current design allocates memory for tx and rx buffers equally. The
throughput can be increased if the user is allowed to configure number
of tx and rx buffers as required. Hence, do not split number of tx & rx
buffers into half, but decide based on respective vring size.

Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
---

Test performed:
  - Test this patch with existing firmware as it is, rpmsg working.

Changes in v2:
  - Change author
  - fix commit message with better explanation
  - %s/sbuf/tx_buf
  - %s/rbuf/rx_buf
  - %s/num_rbuf/num_rx_buf/
  - %s/num_sbuf/num_tx_buf/

 drivers/rpmsg/virtio_rpmsg_bus.c | 68 ++++++++++++++++----------------
 1 file changed, 34 insertions(+), 34 deletions(-)

diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index 5ae15111fb4f..e59d8cf9b975 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -35,13 +35,14 @@
  * @vdev:	the virtio device
  * @rvq:	rx virtqueue
  * @svq:	tx virtqueue
- * @rbufs:	kernel address of rx buffers
- * @sbufs:	kernel address of tx buffers
- * @num_bufs:	total number of buffers for rx and tx
- * @buf_size:   size of one rx or tx buffer
+ * @rx_bufs:	kernel address of rx buffers
+ * @tx_bufs:	kernel address of tx buffers
+ * @num_rx_buf:	total number of buffers for rx
+ * @num_tx_buf:	total number of buffers for tx
+ * @buf_size:	size of one rx or tx buffer
  * @last_sbuf:	index of last tx buffer used
  * @bufs_dma:	dma base addr of the buffers
- * @tx_lock:	protects svq and sbufs, to allow concurrent senders.
+ * @tx_lock:	protects svq and tx_bufs, to allow concurrent senders.
  *		sending a message might require waking up a dozing remote
  *		processor, which involves sleeping, hence the mutex.
  * @endpoints:	idr of local endpoints, allows fast retrieval
@@ -55,8 +56,9 @@
 struct virtproc_info {
 	struct virtio_device *vdev;
 	struct virtqueue *rvq, *svq;
-	void *rbufs, *sbufs;
-	unsigned int num_bufs;
+	void *rx_bufs, *tx_bufs;
+	unsigned int num_rx_buf;
+	unsigned int num_tx_buf;
 	unsigned int buf_size;
 	int last_sbuf;
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
@@ -440,12 +442,9 @@ static void *get_a_tx_buf(struct virtproc_info *vrp)
 
 	mutex_lock(&vrp->tx_lock);
 
-	/*
-	 * either pick the next unused tx buffer
-	 * (half of our buffers are used for sending messages)
-	 */
-	if (vrp->last_sbuf < vrp->num_bufs / 2)
-		ret = vrp->sbufs + vrp->buf_size * vrp->last_sbuf++;
+	/* either pick the next unused tx buffer */
+	if (vrp->last_sbuf < vrp->num_tx_buf)
+		ret = vrp->tx_bufs + vrp->buf_size * vrp->last_sbuf++;
 	/* or recycle a used one */
 	else
 		ret = virtqueue_get_buf(vrp->svq, &len);
@@ -631,11 +630,10 @@ static __poll_t virtio_rpmsg_poll(struct rpmsg_endpoint *ept, struct file *filp,
 
 	/*
 	 * check for a free buffer, either:
-	 * - we haven't used all of the available transmit buffers (half of the
-	 *   allocated buffers are used for transmit, hence num_bufs / 2), or,
+	 * - we haven't used all of the available transmit buffers or,
 	 * - we ask the virtqueue if there's a buffer available
 	 */
-	if (vrp->last_sbuf < vrp->num_bufs / 2 ||
+	if (vrp->last_sbuf < vrp->num_tx_buf ||
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
@@ -872,16 +871,16 @@ static int rpmsg_probe(struct virtio_device *vdev)
 	dev_dbg(&vdev->dev, "buffers: va %p, dma %pad\n",
 		bufs_va, &vrp->bufs_dma);
 
-	/* half of the buffers is dedicated for RX */
-	vrp->rbufs = bufs_va;
+	/* first part of the buffers is dedicated for RX */
+	vrp->rx_bufs = bufs_va;
 
-	/* and half is dedicated for TX */
-	vrp->sbufs = bufs_va + total_buf_space / 2;
+	/* and second part is dedicated for TX */
+	vrp->tx_bufs = bufs_va + vrp->num_rx_buf * vrp->buf_size;
 
 	/* set up the receive buffers */
-	for (i = 0; i < vrp->num_bufs / 2; i++) {
+	for (i = 0; i < vrp->num_rx_buf; i++) {
 		struct scatterlist sg;
-		void *cpu_addr = vrp->rbufs + i * vrp->buf_size;
+		void *cpu_addr = vrp->rx_bufs + i * vrp->buf_size;
 
 		rpmsg_sg_init(&sg, cpu_addr, vrp->buf_size);
 
@@ -966,7 +965,8 @@ static int rpmsg_remove_device(struct device *dev, void *data)
 static void rpmsg_remove(struct virtio_device *vdev)
 {
 	struct virtproc_info *vrp = vdev->priv;
-	size_t total_buf_space = vrp->num_bufs * vrp->buf_size;
+	unsigned int num_bufs = vrp->num_rx_buf + vrp->num_tx_buf;
+	size_t total_buf_space = num_bufs * vrp->buf_size;
 	int ret;
 
 	virtio_reset_device(vdev);
@@ -980,7 +980,7 @@ static void rpmsg_remove(struct virtio_device *vdev)
 	vdev->config->del_vqs(vrp->vdev);
 
 	dma_free_coherent(vdev->dev.parent, total_buf_space,
-			  vrp->rbufs, vrp->bufs_dma);
+			  vrp->rx_bufs, vrp->bufs_dma);
 
 	kfree(vrp);
 }
-- 
2.34.1

