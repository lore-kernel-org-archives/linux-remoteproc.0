Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012052.outbound.protection.outlook.com [40.93.195.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD8F380FCA;
	Fri, 10 Jul 2026 19:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783711727; cv=fail; b=OdQhaHjqnJ4twm5+dAM2G4AtUCai+FCNM3Uw/qR89gupT6J9k7bm5/9stif9y7blUe83GXXdvWAOVQkZz0H5wuYfq3qE7kCOWVFQzWy923tS6SIGhxEvmNU4aoxeWrCInPp2DIjrRrMs4g/lEUKnIiDunPSLjGKUSLs+5dvZ6XM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783711727; c=relaxed/simple;
	bh=CYQkMLkkrfsdNpg1ubpRobyp6s2z63w5pyvWeP28dR8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uEdLiKbA4ep5LNQBYvw12IZZcuGnmMrSsF9fTYxCLbHXYjNjk4oSqs97IpQTkmnec6RwacyQFECMvNXZqX2Ce0YthhBt5Trhla+ZjBXE8xlsygl25fapgtFhJokYoEMLOdB5vaPxPW8Qx9A6cvLG4ymnxjyF6/Y/5WCfMlC9NLQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=fvOmdokn; arc=fail smtp.client-ip=40.93.195.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="fvOmdokn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QnZILlSsG3def94avSI2mGnkoSuA7rbqSuyMQWnVEMFSAUrhP2ckNPdKbii1xY7AnD3si/UaWUiZv9rdsAdR4ugCH+mPvjjHPPcqrNQY0Qx9y4MWnShTHBg0L6pceuf7PhloMZXH4lWT3ShHEiOXHTKqlX6yisKEPT4DrzP2ViGTTkl4lLtgHFVTfmHny1XVj+TOTS2s2Uw3GJgxT1cOOH+rgKGq/whwAnqrovuNahmzr2HixP6ZGJTrOUMcPMjoB1aV3h8vbh34DoLSzbSbs84mDqM8HjEb0pGC0GOZO/Pa3CDoebOimnzWx/vYVozykZ1PFFDT/B6yDVs2fjPy+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/J1zx2hwne3/fExXhDmGfBDtcT23WUWHOUSAIx5Na1Y=;
 b=cLi7LfrozkTiRAyaKm4OKtBe4no4yA8HYwvlmDgA/zgfH2c5ZrxMXipiNe/j2jVycuoJoJDT726zrHqA1iq4otuSv1TSfG2q+FSZ3jbocOvroX+yFqzAi5SP8mn3cBJk0zkeKuIDeo5RDq5Iuc44TtzmG5S/qMUhZ9y/SvzsEtyHlGFxOMb8xGahVKoFE2zYtngnXZWkqY/6Vi/DawG5TE1rILt6mk7FamCaMAwEhjFgqgnz/1Y2XSETxZCv/gb3vTBpJbZWWUBkzdydehAnwI4QFDj0QWudJMx8oc7pwVFdO20PSD0ZfVjWSh+NEx71H91SrQALsa/yaC0NPGhn7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/J1zx2hwne3/fExXhDmGfBDtcT23WUWHOUSAIx5Na1Y=;
 b=fvOmdokni4ef5erD807Z9p6zum1OD+LEEJZPDo6CAwmiWoQKK7chLLBoVETmYV1EDyzXyeNLF5o2hrjs/qjOnr2B9WWZWW4hm/Y6rJk/mF7mREjNGwcWmzf1AwF/HiMCp0O0KrS6SFdtE5sJLnW1B/M+MyygzK7DFoI2AmXkQ0Y=
Received: from DS7PR03CA0298.namprd03.prod.outlook.com (2603:10b6:5:3ad::33)
 by LV8PR12MB9644.namprd12.prod.outlook.com (2603:10b6:408:296::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Fri, 10 Jul
 2026 19:28:35 +0000
Received: from DS2PEPF000061C7.namprd02.prod.outlook.com
 (2603:10b6:5:3ad:cafe::7e) by DS7PR03CA0298.outlook.office365.com
 (2603:10b6:5:3ad::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.14 via Frontend Transport; Fri,
 10 Jul 2026 19:28:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS2PEPF000061C7.mail.protection.outlook.com (10.167.23.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 10 Jul 2026 19:28:35 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 10 Jul
 2026 14:28:34 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 10 Jul
 2026 14:28:33 -0500
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 10 Jul 2026 14:28:33 -0500
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Tanmay Shah <tanmay.shah@amd.com>
Subject: [PATCH v5 1/5] rpmsg: virtio_rpmsg_bus: rename rbufs and sbufs
Date: Fri, 10 Jul 2026 12:28:27 -0700
Message-ID: <20260710192831.3440427-2-tanmay.shah@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260710192831.3440427-1-tanmay.shah@amd.com>
References: <20260710192831.3440427-1-tanmay.shah@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C7:EE_|LV8PR12MB9644:EE_
X-MS-Office365-Filtering-Correlation-Id: cc15da84-6ccc-4992-b380-08dedeb96f5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|82310400026|36860700016|1800799024|18002099003|22082099003|11063799006|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info:
	8vYDZKwFn5ApI909Z3fijG6jG95C3bYn5B6PITrG3QlQEBdYyLAbw0MC1mwhG5V4SaoUj8uAm64IrDvl8sSn0j71afCyC+M7jwTTrBvvhiitJkZhRBp7/dip1xKMPFj78CZLcfcrkhf+E7MbG6vGR3TvF5Rlj8LaYJx8Em/Ow9hg0jmrO6PrR6xLS+UixvuH4gma/7kVSjfM78LwzdUUw3oVrK2QXo5X12r9dKhgbD/N4iNOxGT4s4I1gsOlLtjLnhi+n1XhsoEwEds8KPM/nqows6egbxTUGAUlLvJbFY1PQZsJvRAgK3P70bVQYFMK9GHYx2RInoI8XGEVknhZysQ22GWB+Hc5L3XqcRZAtXDAJYYD9z3kJMUlAJ8mghIBB69U0WES4YLS1N0mru6sNRovApP84ZJQoq97CHLuBVJooNGVy17gLGcDsuaAKN8gGgv1vLY1qarhTPn9NAJd4X/jGrgntr2/ZKzJjSV4JxQD5nadXCWS6loQ3TVbfAu8h4cc6My0wp/Nppk+h+T11vKdR+GAKXWMAyilcpixfyoEgRCuPA2Lp9LulbsISe50ARdaYA6a03olGCr7WBx+QLBMgM27gW8ywXMDHpoBQb2pQiUSmFvdNN4Dphtmcdncu6jJpqh22FjO3YLmHM6tYXj2++XnqbQQ9s6X5IS+VliKEc+N6b6Fh8+qo2HYopntq+nInxUg2H8caAvrAL2ORA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(82310400026)(36860700016)(1800799024)(18002099003)(22082099003)(11063799006)(6133799003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	z5cWXxMd6VfbwoeAAa03I8aGwkxDjU1rRe1QTXSqqcZsGIHJBUz5Z2fLrTSEEGsy5TcLbwyebUvP3pJvZwhZAkkOUzshP3JOie7xMZ0iVtn9vyiboMgFsOMhGG1xUCPZ816qGQBjOxvi/GO042+ChQZ14j0cPBAxqEioPpSdZcpT0pOM4t+04in7vYhLZVr6zF7WjshJO4lnghMOxb9vDFH7Khsk7m6G8UgSMn/iLo54FeGkVxCt3VqgXSaATuLWF3+Yi07c4b9zFZtRGc8wypuO+WVn2tzygmg3nouSKKNa+7ChalFBRTvKTUywrFzwrW8BZwUDpiUuWxkv88G2zZPpOWUg6FxLAyIaYuSXeolVvj0iPFANE9TgW4hG2L1CUlh3rxbGAPNEs7Kt9rnTmEtK7FxTt3MfVRvfMEHCq50OWrZCOhZu6otVMZ0wXw9r
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 19:28:35.1119
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc15da84-6ccc-4992-b380-08dedeb96f5d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF000061C7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9644

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
2.34.1

