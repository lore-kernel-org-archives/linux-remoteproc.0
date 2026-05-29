Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010064.outbound.protection.outlook.com [52.101.193.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A30D3F39C8;
	Fri, 29 May 2026 16:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780073030; cv=fail; b=k9S4z1AqLgESYO6SHyLHTnBE+T+zsXvcKaXev+gM6h/PhQ1vL5pQQuNdDZyj/mkzPXw6XmU6ZoUSMOH6PRWvIf0dgxGa3zJwAElnuoGrYMGI1/dfktuPtB+nc3kU3DKRSOavNV9L1Me2Ohl22MFfNzguNsAh/gc7DezD6dKoiDI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780073030; c=relaxed/simple;
	bh=AzuWtuFcKkeGk2SjUXJHCHngk9bXPItDsq0XJrdSmuw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=llEb67s+xSRrl96bL0idOC7c5miDxmnO2VJpAmeQxUGLCsWJrUjY/K1kOcrNVNOWux6V1K6XLWx6TH28ouCL08oT4c/QNbjgEGuTlBs5K16fgxJ0aWezl8hWIaCIxiTiiVCnH5NgfZMiEa6KtVpsu/f9j/eDc8umUyyZfwj3Il8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=pxuihFcQ; arc=fail smtp.client-ip=52.101.193.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="pxuihFcQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d+4FDpG1bhiAOX+GLAdUsEfAQB8Il/JqVE9r33EDHOxJmBtOslXolBHecmU6J8TlORWqX6syDOjYsaVkiyNHdGUVk/Y3fNZSwIHHtmHNXb8NSOmSml1U8/latp64kbXmnb5IEoftJSVhvaVuadXs0scr8gErY2jANC+Hgz6hqQRXayx+TZslUjCgWhzRQEAur2G/KyVmVeV5VhEeh5Q3csofml9vnmnMux0HhW/A2wbY/sMxeATHZ4UlIknhu4ixuzjJkFkuofUtCdp693wd2YY9GvPjKAJr9d4uhf5BQF2Ml0/WTTTUYS3Eb3MFH5O+vyzMS+MbU3zdp8nxPkqI9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TmGRg1LsyE7BCDRjrlDMRiXTh+DGlKxNSF30ZneF4FE=;
 b=E3bMPaXfqq6d638qBM4evSkMFlSQwBb8GU/e6303t0spQ/JBYYn8n74vhDjw49GnPbT4bnQshhZWh6wSpA7ekKhIuh3gIocx/HifcO7cfJCp79Aq/BpNSaayn9X84u+v9CRXIospi9JdDHHlXecV20wujEDFWQdhz1OaAJV/FW+odfQJcOvEjttZf9m2R45FCTqJZCVeDOK4piKXTvYZ8v4leBjF7+nroK2WbBFfM3QC8wQTNJMF4jMPadPkLLPEiKrY4N1fxR2XdSuoLZJDINl/bmi5ri2shsq7cq6z/Fe+Y8c7vDvl6B5HbkGs5K1nImZLjsJXGj+yTStrzD/dEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TmGRg1LsyE7BCDRjrlDMRiXTh+DGlKxNSF30ZneF4FE=;
 b=pxuihFcQgSK8j5TQlIpN4/Nqf5RBBiJdPdMuy9vJ9o7ejVYGjql+0/AyE5N0b/wt422/lS6SfFK/aSxqfx5HjMjnByU9GD2B7tWTrgs84g7tkoXRL2E6rwuZHEekAu2x0S91rYqmJKh6AZq+avQKP0Ndv6gfBpHsNxo+do9E4bY=
Received: from BN9PR03CA0177.namprd03.prod.outlook.com (2603:10b6:408:f4::32)
 by LV8PR12MB9134.namprd12.prod.outlook.com (2603:10b6:408:180::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Fri, 29 May
 2026 16:43:43 +0000
Received: from BL6PEPF00020E62.namprd04.prod.outlook.com
 (2603:10b6:408:f4:cafe::e) by BN9PR03CA0177.outlook.office365.com
 (2603:10b6:408:f4::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.13 via Frontend Transport; Fri, 29
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
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 29 May
 2026 11:43:42 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 29 May
 2026 11:43:42 -0500
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 29 May 2026 11:43:42 -0500
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>,
	<arnaud.pouliquen@foss.st.com>
CC: <linux-kernel@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
	<divin.raj@arm.com>
Subject: [PATCH v3 2/4] rpmsg: virtio_rpmsg_bus: allow different size of tx and rx bufs
Date: Fri, 29 May 2026 09:43:26 -0700
Message-ID: <20260529164327.1827121-3-tanmay.shah@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E62:EE_|LV8PR12MB9134:EE_
X-MS-Office365-Filtering-Correlation-Id: b635a1c4-e88e-4dc8-a9a7-08debda17226
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	mG7fzzIVv4ZD/gETnC/BPXDD4oyOlyDiakTm0srU0147n4tknQM+vS15EreHQDRNzYdNJeXk7hBxj73jC1ZVi/c7jvfps+SmcfSkBCpZ2sZaXcZ2SZrl8D5eX9HHNP0pPPkzBP8fcjV+8tvzRgvvrwT2WqfJiyNFLdMmm/teThVGm49UlBu6kPrWI3FsRvj4ai1gHaL8RJKLPLAGENtRJa6+63MQj2kMgg5BX/KXmI8JOb6M5/ZkQf5DREkJzYv5axVn0rSZVu9s65fzvvbohTc71UEnK4FaIvGrQhixTa+I/+4vbpq5aHtZy88SQypGTIzNpVuKxcOpH6sP7CRrzr/oXdNNBFhtN8ZWsfQ2MRqx9xemV/2Yw3IdRsKvr//DUinglp6GbPauV14x3rMsXodb4VkeeeiQjVGNtcZ/+hGUcE5FnkgImzvIp91/+mRbrP5ZLnahEdl5G//FhQ4mZJ0SVTehdhZsH0hRK0sMJxEzDNBUCZxzUbFcHKx5QKR1XqR6/6Oh+a8a2Auva5ByaBF/Ko/z5AViY0Je6NzkGthdofiHmpSTbGlsPKLBDIetlhApI32GjhL7Le5owosMALk7EDbiUYPws7OvkVkUbFSC/w6bDRrwbuTbCE5t+REBVXUP8EG32m86C+fjybBybYFq6o+IXDEJajKWvHXzWdZoEqbnejOWrVQ7SCU1crwTKgmiUl+LP5jjRJjCLjOoGw3zVTyDRrmD8VIMJ6JSvjc=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	DMI2kPXmZ1+7MudfUJw3zgFjWUNsW9yO0l5lnozMMEMSAkFAbJJf3uMSC1oXsFSjeBiaDZIIs3P/Y03bkMKNhHsrWGsJHbspKA0KLtpZveHusuRBKCBJXIErTk5/5lJWzfEvOjCe6jYa5TkOsRWlotcURfqykWg5/Nv9coedBIrwTjsfsXBYQ2PqMHixCCS8e8Ke7YYAj2XiETpwOpESrnem7JPJnZ71bS/c5hwr3ua8588tPw8xnMFPnmPFqpbpA+i3XvI5Ghiu8l4/GWLM3HpesbTyJq/Pzvi9HyqB8t6AgQ/vmmPChcaKOh8u77Oo5VTFC1EG8aasDnXxNL/lBWa3+fDIWOXq9npC8KuHeqjIlRO2NYQn1G1WK3erLSqO4vFxo+9ju0Hp0JroWrYZgWJIj7g/RV3ht/qeLtu7o6/j2xAA7qOnBmJV9gJoyLA8
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 16:43:43.5271
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b635a1c4-e88e-4dc8-a9a7-08debda17226
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E62.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9134

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

