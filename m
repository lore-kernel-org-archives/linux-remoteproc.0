Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010007.outbound.protection.outlook.com [52.101.46.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A11063BED66;
	Fri, 14 Aug 2026 14:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786718746; cv=fail; b=QiAaUTvn6hqxsBLQD1UpZsV3mTS9P6UL4c9xjSwuF7B6Qb7S131GYgXTQQmakbXImjA16/R8SB6ChnWIeKZz1bk16DhYpiEmYndyrEIAY53fy4MTcYAai5XiF57otrF37s0Dk8a48DsmJpEPh1iDgq/G0PIwn0+RHep+mjKtiPA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786718746; c=relaxed/simple;
	bh=LyW4sej8DQil3ygriqUJNiWSHDNhUKLsKrXijndzfR8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Hbs3ppexJ4jARF3c3zowLxu24DA05LETC31+p5e9umz4tuzdkM0x240agLek6FjJ1AGKqNFCRQLh42++IgfcFvYYXgVYcIDWqtIIR4RPDP6TX55jymhQf3+zEAJX42QFy4vGf7eDNukrpqLgJULw+9vNeHgenITa7OIqJ42jOQg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=C0OzImPH; arc=fail smtp.client-ip=52.101.46.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="C0OzImPH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vkHElY8aaF9SpBYCIHygc5EP3wZGpAmTtaUgqOxt6W10nrq+2sA5lwpA4CsPatafHvcyzPD+DRYSTSz1opkKmSO2tMI6iq3QP54m/GeZbxm1Poo6hnMjP1mnrkzleZLHO3hg3nhOT0oyxCJI3Wl9T9+RmI0Ak9hQhNSL9FrZVTMtTZF1Y6AWNJ3ArDx1Q8s/RZGuSF633UpZ8xLG6E7pTxHluNTC52xeTqTILg7Jivq8b8Mv0wt0Gqoz3v0ZsUPH44J58ZmKaaohYssrL6Xxv87ULdxypXKkHdlRymwctfma1kZ5k6U3XKcCWqaLJT/s0IUyY4Un8hmABJbt6OlUNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BU/sinYNZ0E1P0CNVsEKgqCvoYfyFFTBSuoTJJJCbBU=;
 b=HsjB/8s6fYBAfkkffmL5XqJFmhGjc2bR5mLuAOVzbQWbURYwXlftCJEtLaUEWG2TXOs+eoNtO3vRcz7f9Kex5E1C+ff8Nrk1Y9fBM5TAkH8OA9ESLOkehgq0130ZQTrU++xkAXDb5sQZY4P+r5Qzc50Owo4uagiZlBLwplByZ2cGA3/goLx6BfAvus7Qr+Gzwn5My9CAq6lRGVl8IkrIVYdT0y+00HrXoLGHK+dxGZ8r/NuZPbdJDlooh2kXgSq8IzIJ1pkhcTLSO7GKTgkboSUVZQU7tJJvexF3vLgiFQUI13/Eu1Eq8EEtsAuaJkcOJcvosVBrgPoF0Dv2fMByNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BU/sinYNZ0E1P0CNVsEKgqCvoYfyFFTBSuoTJJJCbBU=;
 b=C0OzImPH5wNyM2nCeZa0hvGds7f3vt6skUk17Ovbp20T3bioktfpXSKzMTIbxKzdw2bYGST5GU9S1oUHesYr6Ce/Yp3AIpwdtxF6XbB0qA9jdaxj1VTPPN1v0Bl8QqONlcjSZRVqbUQEBxnrlGFbgJpMiThZV0ts5clS3Uayu6M=
Received: from BN9P221CA0002.NAMP221.PROD.OUTLOOK.COM (2603:10b6:408:10a::9)
 by CH3PR12MB7548.namprd12.prod.outlook.com (2603:10b6:610:144::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.16; Fri, 14 Aug
 2026 14:45:40 +0000
Received: from BL6PEPF00022571.namprd02.prod.outlook.com
 (2603:10b6:408:10a::4) by BN9P221CA0002.outlook.office365.com
 (2603:10b6:408:10a::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.15 via Frontend Transport; Fri,
 14 Aug 2026 14:45:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF00022571.mail.protection.outlook.com (10.167.249.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Fri, 14 Aug 2026 14:45:40 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 14 Aug
 2026 09:45:40 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 14 Aug
 2026 09:45:40 -0500
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Fri, 14 Aug 2026 09:45:39 -0500
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Tanmay Shah <tanmay.shah@amd.com>
Subject: [PATCH v7 1/5] rpmsg: virtio_rpmsg_bus: rename rbufs and sbufs
Date: Fri, 14 Aug 2026 07:45:20 -0700
Message-ID: <20260814144523.744382-3-tanmay.shah@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00022571:EE_|CH3PR12MB7548:EE_
X-MS-Office365-Filtering-Correlation-Id: b98c7c1a-64c0-4f34-afaf-08defa12b631
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|82310400026|36860700016|376014|18002099003|22082099003|6133799003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	wloB+ZWGo2k/s+27sReUoHAYE2fVl1qmJfv3TQDNDVrtsLRvNI54ssDHX8OXp4IhEpqi7DqdfzNpQ175qmilpVN/BWTI2wqQ1iwZLNLh1M56xH40TVgczPY58ts12ZhPLXjSIKcqqan/RZKhidFDeO+m7fHjKmKZifmSh77HYZC5mi0T6EW9hdVyJDnba8PHUk2jYAXtdEjsuVKOTlTvSPJzdYI8GJ/Kw/BJbzc4W+hszEanAgChRa2z0iA+tIoyBqxKP7aVDWmIDIUDw91YaOoyW2dg0xmO43fhLfBRB+du5jbiVynmPi2ddxKqg0L/A/wMjKB2KLExNq8S5MvD7nXAyX1XC4pfJl1TyjjXMr6H1chUlmhwBUXuFot4VEB6iZNpIZVaD0g0bIphKSWiJoe7mULPrP0Q2HPjpj94Ctk8P42t+pleHfqd8vOjX0D6hIjFM/e/Xfro6ukp6HIOU0t9fSfX+SglawJ5KU2Ty7FTqguUjkOjHFjtquUCQFQE+f7ZohGEu/ZNzvQaSihmT77zl2diRJsWTLtgHD3fSxXo/2vCy65p7bQtnThcsoBClfRpEbHONHumpjWYje2TfnV3stlpH6t8RuRb/vURgcMMOnyotvOkPF/Tg7tiVSK6Ei0iBO02ghS4XKRFCJB55cHlpJ/nKOf2vBs6FqyK6Fx8KKx5I8VGjkQdEmPiJWi8pJWxdY+LeeQ8BvDvSftGPg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(82310400026)(36860700016)(376014)(18002099003)(22082099003)(6133799003)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	AmV86302UhZye0AMZMhuC8Cy0Cpsd3Cdl31LkCitgm7DvHGha+4h8fJMBvCkHUt+AWmcoTVpf6RXggot+t9E5I1KTxsQ3Rj9wuvcHsjTTIhqIw7FxkigEWjoKOaKwr9JaVLT7xWWa3t8o69STn7k4JHmXwmVj82rmI3Shgu+Gq+Jm2bZ+miDP4+kqdnONEbm7bC6UT1mw9Z4E8uTLxORJVIugyJdxfBwIYp1HAuh/QG46p1SLwbbSELUq4XpM0X8HYnojKlSLnzgZ4GRcg7+XKXSdO81XeHN0auNTt6ktdoxyuLrbZTovmFaHvtUuDxPhtwsi2V5XkxUNAOM5KlojMC+0gs//wO5JcQrIJcL2XzEx//arpypEYwi5mPP0ng9B4NFJQM6hc9pakrI3LHy7vDXwfzqTuuVW3jXX7MKMH9ZcDX9CwrwS+9atsuaey2i
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 14:45:40.5809
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b98c7c1a-64c0-4f34-afaf-08defa12b631
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022571.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7548

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

