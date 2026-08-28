Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012050.outbound.protection.outlook.com [40.93.195.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693E32B9B7;
	Fri, 28 Aug 2026 14:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787929161; cv=fail; b=mxhVEa8vRR5U1Nzics8RBZbAzrM55pR9HaDK0IVfCQvwMlHYYJEOtLwzFDTAyumA4nXsbmjI1Mo+cz0rk/droJsrkXH9VRw18QYGMCRPiRQz/xLXGBKWQAGF6Qqqls7rBApJBNV4mwY4FK6YOgyStlHD+3hOJwvcGwe7nHsp3L8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787929161; c=relaxed/simple;
	bh=LyW4sej8DQil3ygriqUJNiWSHDNhUKLsKrXijndzfR8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hCY1CZzeCO08HVbUmof636gl3hzeZr6HZA/o8wTLH9jHABPeXkNQOYMzX4XFyS9zblFC/mGosaaAndoHbAt8PNSxC8FihbvtMSGtSu8u7qEKtAez6/qHD6ZsxPpJC3tqi2le5L8Wuj1XJZELRcoUYCavch6c/9o10GbRM0Q5wuM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=5Abz3QfN; arc=fail smtp.client-ip=40.93.195.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="5Abz3QfN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NYriUYG6igXO+YObpj9oe/KQcRi5NVO8grfVw6rYI3vm56wQPnqVxNzUwSXBfciYOhB0l5yUPHxvQVsVnW2xbIbxEvjwEdoRSRt+HjMBDTWlXkLv03jiOGZLshIAB9oLQllJ4Wpor3wcI8LSdl+PEBQ+rqF/JiZPBKa08TDeXtE0SGOfi3UH/pp7DNLyJ8hzZtABJh+X23XThZQPC05UpfKgWUZ+tg/aNSofer4ABw2ZlkoustOjmmFDLYef+/E8axtn5B8/iEafokexYKiOgrBH3Z9H74ok78GP07IkuzuriBwj4pAwbQXn+3kICJtId52sF3e1fVA744R659ebxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BU/sinYNZ0E1P0CNVsEKgqCvoYfyFFTBSuoTJJJCbBU=;
 b=qCb8H68GgitjXsFbCoagQ2l3tZ6zZUbyZWIK6X5Wyc5r4jwp7Ex/kB4t8LH/J+KZbxu4a7FM2adTWUnbYMqJfCJf8/sR5MGQpMIOR6Nxt2PyOrXZe1ssZFzvfAh+30kV81b5451jrVFtcB+ky1kLsEjHBxEYqb6aXQi9u3zgvJxeIVyqmGG7+a5oiDctHpHV0OPJ0EF79cIMXBikl/OjBJffSGf6g3V5OlpIjkihJtvzwPNzHTYC9NKKezAd3v6M32EajhFZHdlmvmiTYshDzROLffJlpryf+hRHR88DULVjFDvQZDjvI2RbzDE3xVaIK84wOvHc3Ei3dep5CFYJ/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BU/sinYNZ0E1P0CNVsEKgqCvoYfyFFTBSuoTJJJCbBU=;
 b=5Abz3QfNN6P37qITFuFbB+S4nauq1lmLVh9IkGkuT7YAsu4jbddXwCjHKo3V+ARkVbvoCejHoUJrq2+7JY4gQF+c7mfPtMvQyNU2PDo2UrOxDgY/FtmlRc2D7Kug4oUSO7MDROlPeqYtENHc3SfIn4sBRoWc80u8t3QuUdTlvlI=
Received: from BN9P221CA0016.NAMP221.PROD.OUTLOOK.COM (2603:10b6:408:10a::18)
 by PH7PR12MB6953.namprd12.prod.outlook.com (2603:10b6:510:1ac::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.7; Fri, 28 Aug
 2026 14:59:15 +0000
Received: from BL02EPF0001A104.namprd05.prod.outlook.com
 (2603:10b6:408:10a:cafe::92) by BN9P221CA0016.outlook.office365.com
 (2603:10b6:408:10a::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.11 via Frontend Transport; Fri,
 28 Aug 2026 14:59:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0001A104.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Fri, 28 Aug 2026 14:59:15 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 28 Aug
 2026 09:59:12 -0500
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Fri, 28 Aug 2026 09:59:12 -0500
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Tanmay Shah <tanmay.shah@amd.com>
Subject: [PATCH v8 1/5] rpmsg: virtio_rpmsg_bus: rename rbufs and sbufs
Date: Fri, 28 Aug 2026 07:58:48 -0700
Message-ID: <20260828145853.2843486-2-tanmay.shah@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A104:EE_|PH7PR12MB6953:EE_
X-MS-Office365-Filtering-Correlation-Id: 8419eeda-c2de-4939-af6a-08df0514eddf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|23010399003|36860700016|22082099003|18002099003|11063799006|56012099006|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info:
	7E7sbMsv1CMHwMRDbHkgPrhCX4lgYrt4PXBYjjG02A2DE1EZiIpGRKXrzGH2FxVh0pV7AshtU4HBXl5F/tV9bHEe+tpreEzX2y1J0E7ylL1n0l/ORwBmGdHfZhe8XbB+4kNY3DMG8Y4Kt/dNMdwKQPJjkVE9MlUgnJTSDu5fvZTR+FY/6UEaghW8Khn9wxKB5omsONgKFii9qw2aukC8Sf76JMCMG3ssmh3LxDXehPfaZCX9xhEJtbPRLbQCdNLjMANl3J+/WKEW9KAvQ+Kdlg13f/OHDczJy4HOuk7A+I7YcymSN5jvvI+sM9hN4oAINd5Mi6QF9TNH03FFFEMUqnOMa/JhjXS4R5gCeB3r3MFvmmffDO2dAmYs/Yn/donUN+jAXz+i5IaASNuuwwW6h9R0MJSR9AcsdLDbXqpeM6E3BHcrLXGg2zJPnqKWZhEk9+feF7puChjrPEito1Tm2yOP5Hd0fWcd208bV20/RNM/DOaRWekBU4KCUjWG0LthI3IjZfsRRq09nGpsqj+AnaIRu+f3D25vDDEQ2ujMjHGneoKs77t7ojPeYO6YxrXL0z59LjAta6o6Lzkdh/Me5cEhvaNJFzNQf+Bpt2imHWmNcESJ2wRRUfyoMh29eWFRq9QROobrE80IuV3CDQx6pil40qnkVPAQoh6ExyD87RC6wUt5fSlp6AxPVH7/+NbJg6OA75v3kG8AGvfq+AdtKQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(23010399003)(36860700016)(22082099003)(18002099003)(11063799006)(56012099006)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zz6G3Eabiv0cH1hmjoStf0QTTiUEr2gSp/hBo1DhZWoWmEKkU9lhwFUamO1olnpo4atS4YXnwlUb1mSutRAmbpKJojH4YMkV/5h93UR7jWPUsn05Nns86CKx3j6fy15g+Ax2Fn91H2C6WugY3dpQBgaRLbzsUQIg3FhZx5sGqqL9jBPnS97DQpUu6VBUnM+IwHn/43eCIz3fwt1E6UIJGgD1LIzY+Aliabqz2Cl0T3IzZAmTeZoBaQPzSfneKV+A4eIYIT7AD5B6clGqkrzV2E79Xo/PYycketPdtCZhiVjOm/LY3p6doX2toM7kjkPcL9o/4VFH6QlTZ26p+QtKwwJvDkgIvGYQCm/l46MDU9Pc+maP1aamTHvEQlRQdQKpNCo1YAH381ESvxe4e4c0K6PiULynXenMbdtI/soUoqA5W0DBq2kZuoXrjqMoESB8
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 14:59:15.7819
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8419eeda-c2de-4939-af6a-08df0514eddf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A104.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6953

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

