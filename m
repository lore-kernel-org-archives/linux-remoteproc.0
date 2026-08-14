Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010070.outbound.protection.outlook.com [52.101.193.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5868346A11;
	Fri, 14 Aug 2026 04:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786682575; cv=fail; b=LSV5F1aj4SSevLTeFcTbJNqGmF7yJ07Y97iZY898WQInhThNVni9HXC6lX+VI1cso3r/8uDhAaBSzTUOerdU9TaJbboPUO2KEDV1tnVAeXYevJyCs2iT2OY1OYvf+oVqWq2whKWp7fHAymDzgSZCkQNTnlOd1WD9CVA4JZZ6g0k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786682575; c=relaxed/simple;
	bh=LyW4sej8DQil3ygriqUJNiWSHDNhUKLsKrXijndzfR8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z7I1/lLE5OTX2gdkmcMsFZN4G8u1a67Olj9q2vmgm3wwd78ehWrhVV34D++Gy2ca+xlkkmG04MlmFso25dA/akCEYd6sMBORsEsnjXNNe7RW8/15WQK+LjaijUIBcvNkjP7t38kTVA5rODBdZx4V9RdPtAAjM8GCZ58TAlvRDU0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=UVE7G1T7; arc=fail smtp.client-ip=52.101.193.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="UVE7G1T7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gaK4IcdNC6I4RjyBgIhapDNpoGr7n9fMZRg7UoPE9oklBaQHU5imWBoQ7KV0C4dkQiiA8ymlQXC5fyPZviU0QVGV9M29kyIk9vInkJQP/3i54POyVocHqx+/8p1p/WGsEIHm6qU0pfsVgK5DqaK2y6KB05m97HGc3oBlLaMw1uspNOKYeUezlrAF120CtkJg8q7Ksju0iz4zTnTuO2E3dd1PPTntPZQelcfR55RtlRjjpjeZxNUhEdOJEKNua7cU6CBxkD6zER68UtvHij6OWKjTuktP9PJbzRNovNtxAZ9BL8CqET5qr3rr0OuFR1N8sYHJ2InJNpgb0yoI///OxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BU/sinYNZ0E1P0CNVsEKgqCvoYfyFFTBSuoTJJJCbBU=;
 b=ehPdSQe+GxgMnm8ux4BGrELf3mXw6vspyX3K81Q4ioWj43HBdNMfK+SFjcqXMuQhcpt+6lORsWWjWOzSzusNa9//564tjk695RatsBC7PsCOBgdEoTm3e6jBCMTe1ARG0t1L6StxSmfOhdiM1YnUo4Wmw1bLyElxkmOJtHJyK1g9HOhRaHf9BO0CAAy1iOU3EuhlWlcwJsI2OUrbHvxxMZ/A/8lmZV5jkZsObtVJR2uDoYKa9sp8vqhjUqudOObWfFjsvvf+bSuNV5IZaUB5iyMVfx/qx1eA3l4Oh9SHsXOH0vfXd9E8qNI5IU6e52uZUa3BO0zfl0U7ricKyfawEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BU/sinYNZ0E1P0CNVsEKgqCvoYfyFFTBSuoTJJJCbBU=;
 b=UVE7G1T7wSsqnDgl6bNi7cXqo0+MakrUqofmkoVnAmtAcJIuT9qhV+n2SfNbPtTUz9pOY3olS6DxzMdeTsh8M0lww+HKvlIjl17rj/9274+x91gd1lziPKQKpMFCXByB+bu+LuHGajK5b14jLMxA7bV+qw5xnskQMTvUzJgutU0=
Received: from BN0PR04CA0038.namprd04.prod.outlook.com (2603:10b6:408:e8::13)
 by SJ2PR12MB8718.namprd12.prod.outlook.com (2603:10b6:a03:540::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Fri, 14 Aug
 2026 04:42:49 +0000
Received: from BL02EPF00029928.namprd02.prod.outlook.com
 (2603:10b6:408:e8:cafe::24) by BN0PR04CA0038.outlook.office365.com
 (2603:10b6:408:e8::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.15 via Frontend Transport; Fri,
 14 Aug 2026 04:42:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL02EPF00029928.mail.protection.outlook.com (10.167.249.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Fri, 14 Aug 2026 04:42:48 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 13 Aug
 2026 23:42:48 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 13 Aug
 2026 23:42:48 -0500
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Thu, 13 Aug 2026 23:42:47 -0500
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Tanmay Shah <tanmay.shah@amd.com>
Subject: [PATCH v6 1/5] rpmsg: virtio_rpmsg_bus: rename rbufs and sbufs
Date: Thu, 13 Aug 2026 21:42:34 -0700
Message-ID: <20260814044238.518296-2-tanmay.shah@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF00029928:EE_|SJ2PR12MB8718:EE_
X-MS-Office365-Filtering-Correlation-Id: b09e6da8-ac3e-4886-13e5-08def9be7e26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|376014|1800799024|82310400026|6133799003|11063799006|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	KUFJU9QVy2mjtnhj2y0vn8lwqDvXPP9QgSSm2B3gBUENZinVqhNOq2tvmk/ZQJio1688svtxxuUt8AqxBCIE6n6mTLHgYDUga+bd8cGPRBJuvfgH/4ZjlUN9822cCFwZBXxy7yKhhnaPj6E5x/4mgaQ5Rwqk76dMcc2cBVf+FNO8BQtTUS0Jj6KorLCh4+0yw7pYgQwhMSqvDn2U1KpD8tKK3uhhfvuynh6pJMhF5CeAozI06xcw4rf+dv0Jll2V8pCh3MwKZzEeDDjYa11ZfADF2z6G+w6Ezcdo4FI/NmMT4feI6AFtWLDF+WFLIgmdHsuPRgPZQjajcQVRqqiXkMt6CCwtI3ZQbfF2Xm5YB1cpSO/RoPbc3+YdAWT+txWXzjKdcJwMkHxJUboHBmWlPLfLoM9x5F9oHkmu5pzCTmnJxsWMlPi/tIuCu58UeR1E11YatJPgNckOxSjgz9gcsOEjQScjd6MFPNeKBKQJvsb59NjZT2BODfXyktJBI0mJEZYIciRVk8jaFy+E5O0aaet8tsJjrO/Zn2ftyHYaCW0dpn54NhdHO32IynqABsXaJ4NJowz/jbahpyQYAvB1w0M3ggpdwYtHEDNTFd8Orc0V+Ubwib+x6SLtqUAQtM4IWEsTdOqc5A6XCxlC3lIz+sUNyalQ3uO703o8BdgA/3p7GWrDKLuTnP2swZvc7G/Zx3icm6taw1tJElGckZ7UBg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(1800799024)(82310400026)(6133799003)(11063799006)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	vuxDRuhs0EoKGLT8H6Tn6laSPXai8HJnW5CAUvHIC1jyEpsRVlACk7UQ9HWEjQfu+m+l9HObwBvInyY3fOXKEO2R1z27yyn/0cyHIYzJt7hEL/RAgV7nP50lNvP/hV3sq88ImL2gk/ItqmqIuT4Z15KZd3w0hc42taKL4lqrvZtxnVcRaKgLPFCdmQN9K8cHFxNE61+R3KzMDc78Bw/y5CnTA4ArTqxvqEBUvE9uKJaL02UWXcvJ8AEu9/yk/jHNWpvJBUL8MS0/Amr7MzGSWbK9hBsa1SNgI/BZdQsDS9qTFk6xTiB2Lhd0yO0EIpvPCOiXUU3rwbzksABh1TnNXp0r1X3IvOSg7z6SwgQpnCVWnrA6eVaME/nm5Q2J41UgPdTCzRGCc41IzF9WVSHnpaJHHT0rJ9M+yhlUaE/u1ER80V4q3+VtFqmFsx1vCTqi
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 04:42:48.8284
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b09e6da8-ac3e-4886-13e5-08def9be7e26
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00029928.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8718

rename variables with clear names.
%s/rbufs/rx_bufs/
%s/sbufs/tx_bufs/
%s/last_sbuf/last_tx_buf/

Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
---
 drivers/rpmsg/virtio_rpmsg_bus.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index 1b8bb05924af..55cd65b14f80 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -35,13 +35,13 @@
  * @vdev:	the virtio device
  * @rvq:	rx virtqueue
  * @svq:	tx virtqueue
- * @rbufs:	kernel address of rx buffers
- * @sbufs:	kernel address of tx buffers
- * @num_bufs:	total number of buffers for rx and tx
+ * @rx_bufs:	kernel address of rx buffers
+ * @tx_bufs:	kernel address of tx buffers
+ * @num_bufs:   total number of buffers for rx and tx
  * @buf_size:   size of one rx or tx buffer
- * @last_sbuf:	index of last tx buffer used
+ * @last_tx_buf: index of last tx buffer used
  * @bufs_dma:	dma base addr of the buffers
- * @tx_lock:	protects svq and sbufs, to allow concurrent senders.
+ * @tx_lock:	protects svq and tx_bufs, to allow concurrent senders.
  *		sending a message might require waking up a dozing remote
  *		processor, which involves sleeping, hence the mutex.
  * @endpoints:	idr of local endpoints, allows fast retrieval
@@ -55,10 +55,10 @@
 struct virtproc_info {
 	struct virtio_device *vdev;
 	struct virtqueue *rvq, *svq;
-	void *rbufs, *sbufs;
+	void *rx_bufs, *tx_bufs;
 	unsigned int num_bufs;
 	unsigned int buf_size;
-	int last_sbuf;
+	int last_tx_buf;
 	dma_addr_t bufs_dma;
 	struct mutex tx_lock;
 	struct idr endpoints;
@@ -443,8 +443,8 @@ static void *get_a_tx_buf(struct virtproc_info *vrp)
 	 * either pick the next unused tx buffer
 	 * (half of our buffers are used for sending messages)
 	 */
-	if (vrp->last_sbuf < vrp->num_bufs / 2)
-		ret = vrp->sbufs + vrp->buf_size * vrp->last_sbuf++;
+	if (vrp->last_tx_buf < vrp->num_bufs / 2)
+		ret = vrp->tx_bufs + vrp->buf_size * vrp->last_tx_buf++;
 	/* or recycle a used one */
 	else
 		ret = virtqueue_get_buf(vrp->svq, &len);
@@ -634,7 +634,7 @@ static __poll_t virtio_rpmsg_poll(struct rpmsg_endpoint *ept, struct file *filp,
 	 *   allocated buffers are used for transmit, hence num_bufs / 2), or,
 	 * - we ask the virtqueue if there's a buffer available
 	 */
-	if (vrp->last_sbuf < vrp->num_bufs / 2 ||
+	if (vrp->last_tx_buf < vrp->num_bufs / 2 ||
 	    !virtqueue_enable_cb(vrp->svq))
 		mask |= EPOLLOUT;
 
@@ -872,15 +872,15 @@ static int rpmsg_probe(struct virtio_device *vdev)
 		bufs_va, &vrp->bufs_dma);
 
 	/* half of the buffers is dedicated for RX */
-	vrp->rbufs = bufs_va;
+	vrp->rx_bufs = bufs_va;
 
 	/* and half is dedicated for TX */
-	vrp->sbufs = bufs_va + total_buf_space / 2;
+	vrp->tx_bufs = bufs_va + total_buf_space / 2;
 
 	/* set up the receive buffers */
 	for (i = 0; i < vrp->num_bufs / 2; i++) {
 		struct scatterlist sg;
-		void *cpu_addr = vrp->rbufs + i * vrp->buf_size;
+		void *cpu_addr = vrp->rx_bufs + i * vrp->buf_size;
 
 		rpmsg_sg_init(&sg, cpu_addr, vrp->buf_size);
 
@@ -979,7 +979,7 @@ static void rpmsg_remove(struct virtio_device *vdev)
 	vdev->config->del_vqs(vrp->vdev);
 
 	dma_free_coherent(vdev->dev.parent, total_buf_space,
-			  vrp->rbufs, vrp->bufs_dma);
+			  vrp->rx_bufs, vrp->bufs_dma);
 
 	kfree(vrp);
 }
-- 
2.43.0

