Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010005.outbound.protection.outlook.com [52.101.193.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B1747DD4A;
	Fri, 14 Aug 2026 14:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786718749; cv=fail; b=jv4A0R9L3HGxDDx1CNHXftXvc+FvXndoOpm/EMbiDFvlpyItH/MTIBjw/A48dMTwS0D7EWHEqWS/WaPEFqjzrRBh961GOlXeJV6GS4tc1VfXw6WxtWtFoqVCVQPsq5yTQU+ffj3+Iv34+UEOL+7o1FogP5UWW5jpMXkXg68GPKU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786718749; c=relaxed/simple;
	bh=5AwMKzju6PhWHQxfDiLU63hz1jLmQ3aQoKka46mJQ0E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oliA8b5gax9qmd2fRyHVLc92BawmX6XxibWl0U5XQ8om/5npkBcdub1m0sjItf9roTRi1PPJ0dxG0EhFJgFzeNlvUN9ySrPIasLe/9WSETLKCydrTcEce8gMGknKpQgiVaUnBRQN3hOcV6hvzBTvE1cmbOm4Epa0ebj1dElQ2nE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=UWDn4ofK; arc=fail smtp.client-ip=52.101.193.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="UWDn4ofK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mDbZ8eC0gYQsXpTBW3/9hHwcwpB/jDHJuI7xZy5VsZPXI66ru4Gawml5pdgys0ggytb8Vdumn3PCnggGXtSLtXViz770ptSKtpsfnkV//GfyLwR5moL6w8QKbjKFJtlH1y6Tw+V+aXLuD8LzOOaX0sHoTfrJ/scyE+RSqZCcihGzuRX1AyAHfDEBArmVlFfFs29Q/oVDwMc+1cIoB3Z/vpXv6nG5OCPbio1aBR8Z21WySE0YvqRmsf2JZiThW8CdN2PRJjoqCFvMktnINfmgNVHhbkcjeQxJDbZ7ltHvcj6qhwbwjVZ5hdq4BtU+S3ZYCuyhFJMNGhwkmUYtj4RgBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mOkpZ/hEZvjsFz/RgHuk3M2JT0CUWeaDXGg9RHQZJKk=;
 b=hwaNRcQfuTKHYGsxm1OtRXzWGzbLRatCxL41nMIkMrhxJkEqIofrxML1oxfB3HXoNN3T5WJ3R+2CsQJuEKuTgDF1N+cNMpKFmC/DtJUAqh8knyys/YY9QOFOPKKmz9dnqDAL1CMFG0PdJRmxtzeH2XRs5Vlhc7cbYfEPUWvU8x2SE6nb5BCJ9sXehou3LfAZbe/HJTlhWvAtQ6MWZoMegVKJpfjia7YwzoR1IzppSdNTmjHOu9P/rU0q6hH3a/Nt7RDTK8uCIR5hqRFuXjW1YyQEGpEpmRMS1chc2L1D/3UA3fhyCQ2YYWwF2zCzZh3uoqmZ/07FiIHfnhBqD3zsPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mOkpZ/hEZvjsFz/RgHuk3M2JT0CUWeaDXGg9RHQZJKk=;
 b=UWDn4ofKS+uYU6Wk08yKgtDh9dTpq936Ed/2wVrQ5TEZ/k+PGwNsqg81Ju3nfXd9K2gTYnxKB5O9jzYcB1iNH3R75XSGQukyS89dIQKNHL2VIlYAGfUpv0FxExeG67T7utGbd05ECCTtKOlAlvLPHHp7okfUIbArJIOiwzi3trk=
Received: from BN9P221CA0005.NAMP221.PROD.OUTLOOK.COM (2603:10b6:408:10a::28)
 by PH0PR12MB7929.namprd12.prod.outlook.com (2603:10b6:510:284::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.16; Fri, 14 Aug
 2026 14:45:41 +0000
Received: from BL6PEPF00022571.namprd02.prod.outlook.com
 (2603:10b6:408:10a:cafe::a3) by BN9P221CA0005.outlook.office365.com
 (2603:10b6:408:10a::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.15 via Frontend Transport; Fri,
 14 Aug 2026 14:45:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF00022571.mail.protection.outlook.com (10.167.249.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Fri, 14 Aug 2026 14:45:41 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 14 Aug
 2026 09:45:41 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 14 Aug
 2026 09:45:40 -0500
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Fri, 14 Aug 2026 09:45:40 -0500
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Tanmay Shah <tanmay.shah@amd.com>
Subject: [PATCH v7 2/5] rpmsg: virtio_rpmsg_bus: allow different size of tx and rx bufs
Date: Fri, 14 Aug 2026 07:45:21 -0700
Message-ID: <20260814144523.744382-4-tanmay.shah@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260814144523.744382-2-tanmay.shah@amd.com>
References: <20260814144523.744382-2-tanmay.shah@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00022571:EE_|PH0PR12MB7929:EE_
X-MS-Office365-Filtering-Correlation-Id: 02d826ae-b904-4c6b-ead5-08defa12b6a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|23010399003|376014|36860700016|22082099003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	VLiNkxnMc//3qdLTnWMGxDWFSP1R2f/XFLFK2XOCjSf0LwSk66ZAEmR1FPIa/IFYSdcpSIbd+9FLJ6+TcR0yM3A1145FpEjSqSJkVKGjjzwE6z+K8rdLOOTNlmm88mvTpdqdAfjSmQVd+yMp5qtax3QqJ68569v4Xc+uXGgi1XtmeENMlgejoOHtNmn+riz3N+0r0f3WdqEDRYJGrQQIAdqngC6w5SXs+XD+TvXKJC3WwVGYH2l3QfNy1HkZiVdAv8P3DDF59p3KgbWHCNsLVqvvsWnrI0d1E5Tp0FLsRNqmzYEQYfyu49Z1PTmtxSDtk6NDOcqRqHwW2SH2yh4cPjNFisXauFgSC6MoxnB7YPYuHZ0Vriz+TJdsAnwLUsGT3BHYUr7NVGJXx1mFvguWS4ppN41h08QiWmhxXwGWdPcv3q5fDPBEt1ysuP3sTRgovBZ5XniqbaqjR6o8QWm0HELXrG3Vj8V7N1RVvVgkotHMX3E8A2qCATmBompE0wyYASD+CTNTYMdMf8t/7onIPLLtj+EqHohHM/ltPQlHvPJm8IDZEK0BURHDgk3O+RN2KdMYBXZ5e3CLkJCpIo4hM1rTZlPhAokqkrY7WXJRIl/1S5sJXksgYM4gpBq6RkHpWtKAb3mGu7sEkb/tVJZwyBRZZGhX1ohg5VVFOrhjF09tqYRsJ3ONhc2+fyorm2+rLrXVHMOskN6lCsZNW2No3Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(23010399003)(376014)(36860700016)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	90r2b+SVhXlmjocTin0OPdpJXN5ucmpbuDU4THqYt0aoEWwafJbFKkafq/VO0y61s4auaXMCup6qdRy82B7tadb1ycfgoC5JtBStDj2L2kfB6tMOuyi9pJelbuRBmhi0nIQksZ7eO1O33kmsSxF5QKWwtd+r28k1BJM5iZ3mToUF3E5pAEBBH2SvPpF40/tlwuz6uSN8ZFtu0g+zP0WJ0XQdRTfLg+dB3JbCmAZb0rfRfP6G9XJxehJKeEcDKWL34JfPf9UPu9Ynr5hor0aN8EB7+hJdKn2psKv2bg7yqc6plT1qxcB8yg4xwZes/9iUdAx6CsNjhTQOyziRSAUbUNaEsbvsOg7a8PpEBuLFlkH7ZqYRw0Y7lpcuyliMLHmBr8q1fSZucqyQLm0r389Fq5JI1B2J0VKx+NOZoMrPhFjzydlw1WN1xYnRpaROyoSZ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 14:45:41.3074
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 02d826ae-b904-4c6b-ead5-08defa12b6a0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022571.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7929

Current design allocates memory for tx and rx buffers equally. The
throughput can be increased if the user is allowed to configure number
of tx and rx buffers as required. Hence, do not split number of tx & rx
buffers into half, but decide based on respective vring size.

Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
---
 drivers/rpmsg/virtio_rpmsg_bus.c | 50 ++++++++++++++++----------------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index 55cd65b14f80..c84b6cec9caf 100644
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
@@ -439,11 +441,8 @@ static void *get_a_tx_buf(struct virtproc_info *vrp)
 
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
@@ -630,11 +629,10 @@ static __poll_t virtio_rpmsg_poll(struct rpmsg_endpoint *ept, struct file *filp,
 
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
 
@@ -845,19 +843,20 @@ static int rpmsg_probe(struct virtio_device *vdev)
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
@@ -871,14 +870,14 @@ static int rpmsg_probe(struct virtio_device *vdev)
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
 
@@ -965,7 +964,8 @@ static int rpmsg_remove_device(struct device *dev, void *data)
 static void rpmsg_remove(struct virtio_device *vdev)
 {
 	struct virtproc_info *vrp = vdev->priv;
-	size_t total_buf_space = vrp->num_bufs * vrp->buf_size;
+	unsigned int num_bufs = vrp->num_rx_buf + vrp->num_tx_buf;
+	size_t total_buf_space = num_bufs * vrp->buf_size;
 	int ret;
 
 	virtio_reset_device(vdev);
-- 
2.43.0

