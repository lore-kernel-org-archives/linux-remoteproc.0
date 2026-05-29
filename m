Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010016.outbound.protection.outlook.com [52.101.56.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9833F210B;
	Fri, 29 May 2026 16:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780073029; cv=fail; b=NrOjCp0memQ/07jiD4/J1ZF4fUBpTceAgFNYMQaLR3wTZGjOFUbI1siQyAPH0HLk38Y1na3aqyJNr84K6EosLpsQS3vR9whEUNP1ChJ7AwjH0VnRjpUk59caGRcs+4vX9aexWASIDeyWK07ocn/+Dh6rsTRQ7ds7VRg360vctpM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780073029; c=relaxed/simple;
	bh=VjDnRfiI2UYHvAXt8BWnFUE5/gkyINHqdGsxy+8aANw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JzKu9Y+6LRVP554oToQ6QBc/7GOnbAWSMxi/jFR85gUpp4fq1jtknSRcI/1nCL1U/JZ55URQsKwo9HXaASl9A+0x0HqPTDiD/7fdoU0COZum/Etto5NX2p1ikvlIcOtCq+/lnp+Is2/hAa5PmPHvIWOVOzo2n3mMq78z6H26XZ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Q4nAKUEQ; arc=fail smtp.client-ip=52.101.56.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Q4nAKUEQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GNdKvSJW0I8o1utd08dF88M8W8pZxBdPj/EkFysdDCbqav2fLTAEuDdN/rvIfB57AGIwisPVVgmT0GtCz/Yh7T3dLJITdgCRh66wSpRVfCzHAQHqhSXFEkuZAeR66u4Ky8oui8drdOVxQdR0oAu4kAa77k0tqWW8+eDkvvnmOc4oQXACFrW46Cpzzd0Z7PnlcFMCZW50pMuTmKS9LYwWfCXz40Pvj7K9AAuvsf64sPJT1n3474mWUBV2iW70ncQBfQzhmBo1wFnspPo3R/THUrbjKaEcZD+7ghyvqNBHTZ5gD/q5SE22E+E+//HLdV+xASswxo1Mv63vrUFnvwT6gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/7qzu014ra39MD5fSByTQzBE9+aQ8RuCcIcrlABdHT4=;
 b=gJLKAT0ACYpGECGAYyWUqAaodp3XUsPS5mGpdLojQ+FEb8ilrm/z8yODOtULnL2GibxVseIbDfksj96puFN1PfAKUgME6f4w5dvZkIVg5oQZ6IH1zMUBiCMZ2zJSRvyTCqnQVmfyTK2aNKdj9yu482Xon+boJk/fteLGX29laA4jTUKygNcNZAoChMSrVQ0tUoh4PHe7tqudpYJv+uvd9CMWew49AjheU1t0jhOa8fMOGyRXfUEZpCFkz5kBOmZEPUEeRpI51nooKFKlr8YsVgGgKRcobNmnL4gDen+K76hl3eCh8lBdwcbdM+vnQ4tkLeQImrbEahGCPXfEiA7quQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/7qzu014ra39MD5fSByTQzBE9+aQ8RuCcIcrlABdHT4=;
 b=Q4nAKUEQP35lxE58WNto5qR/uabnp3yUjw2Xh9XqSb+l0vkQiUZH+KYq/FXnAQ0y9Bl70nniAk9W2uywYbgNPgzBdF7ZBIV3zlqUTN36FHuIvJ3XWUIuP2oviEactuRiT/3DHG7lLcWvsXQDnJvNpinrTNCwch1D3K6Df6ezh+4=
Received: from BN9PR03CA0176.namprd03.prod.outlook.com (2603:10b6:408:f4::31)
 by MW5PR12MB5681.namprd12.prod.outlook.com (2603:10b6:303:19e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Fri, 29 May
 2026 16:43:43 +0000
Received: from BL6PEPF00020E62.namprd04.prod.outlook.com
 (2603:10b6:408:f4:cafe::2d) by BN9PR03CA0176.outlook.office365.com
 (2603:10b6:408:f4::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.13 via Frontend Transport; Fri, 29
 May 2026 16:43:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF00020E62.mail.protection.outlook.com (10.167.249.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Fri, 29 May 2026 16:43:42 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 29 May
 2026 11:43:42 -0500
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 29 May 2026 11:43:41 -0500
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>,
	<arnaud.pouliquen@foss.st.com>
CC: <linux-kernel@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
	<divin.raj@arm.com>
Subject: [PATCH v3 1/4] rpmsg: virtio_rpmsg_bus: rename rbufs and sbufs
Date: Fri, 29 May 2026 09:43:25 -0700
Message-ID: <20260529164327.1827121-2-tanmay.shah@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E62:EE_|MW5PR12MB5681:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f9990b5-ef4c-4a2e-6da6-08debda17181
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|22082099003|18002099003|6133799003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	U5/QIX9gU2T4bR4AJurKfZarHMuvPl9dhql5YyM3TfnX6eMKMitzsVs6NhiW10DFiRw7Nb9w18VgIDBj/ReO/P/wwfalDfH1IMEIL45dU4B1j/ciy4qpojEferfixPKYCF/rKizltJY6kDDlSt8H/AlZCZJq55BKUQ3r9370SFX/wkfgqlWB+F6o7zREDmPDVsFMJKQ5ynUnZTw9LZ69GmMUonNEgAWOXv2BxT+ujvCTQG1dKqicB29YSnR33v5RTbAtF3p4QeXKsbE3j9pEOgqcr47aY0MdFRYA/h2ByW9X3eOR11TORb7/2BNuScXvTD1Q0d2hiSIkprzbwWSxoV7t66WSG3vj5U9x/ty6hTxcv/2SX0wm7+8oGF5b7l6+b8tBbkPI7PexiMcyOX3TNdCpY2Xr4eWrd7SW+mg/MMO4WQgAzZJO5vx1egV4X35LFZR87CAhHPEbi0Kem/wPzwR9beVhHmeCWxRxoauxAKxHnNJOlD0L+dacoCPuDQGd4mcg06O/BeyQEdmVq2CG0ZkHNLWYVO8H1dUX9TXzPNxy30Tpjczf1L4DhhPYFiyqIPxOyRNSV7kx6qLGjva/dr06VPTq7yfhvoTf/kOHiDSLgzhoE7T2I4/TsUEiHW/+0/9ynSsT9EItrBRkZzB6OPVzTGDz59EsPhryZd6I5vXLlpcxnnx+XkIKkURlUgjnPZYixpKvV1reeR7LzCS9UZ+u1EVtZryaj5UVu8dSZYA=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(22082099003)(18002099003)(6133799003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	o7xMvYRw+A+7Gwiclm8k/McddEfHjPlkx3umHBLfW1GX2g/xezv0stE0bY2+YRsEM2Xra6PdgJNPJpF94vPwuM5pEVmkcpv2BwNzaVTy7p2hI3TlNduwl6/xQ1kUFj3ugyFLyT1Sv6OGy9WV/60dLe4aooVKWMAQ78g9+V/MOHeIj4e0XfYkIXc7Esptobyhuul8tDbgV1ZkmCjga68/m2rKc+nWWioVW3nLaVtA5r+6ApzbNrVghoYTNQZgvSI/TVFHQO05srTnySt7G3sIvDi1kXlgG+QeDVyQLuwseGw/F/ubcUfRk9JF6F44cjf2vj7uqTpCU6WvIu9DrutoLznvEqckAWvjdIkQajsbL3+O1BcQro39iePL497s0H5qNOn68oiwp4m1ni27OHrdoudNUDnVGK+HkSNHJfx6ppkKF7TwU8jMxmJWZhMUlfrI
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 16:43:42.4443
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f9990b5-ef4c-4a2e-6da6-08debda17181
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E62.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5681

rename variables with clear names.
%s/rbufs/rx_bufs/
%s/sbufs/tx_bufs/
%s/last_sbuf/last_tx_buf/

Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
---
 drivers/rpmsg/virtio_rpmsg_bus.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index 5ae15111fb4f..773547479d15 100644
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
@@ -444,8 +444,8 @@ static void *get_a_tx_buf(struct virtproc_info *vrp)
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
@@ -635,7 +635,7 @@ static __poll_t virtio_rpmsg_poll(struct rpmsg_endpoint *ept, struct file *filp,
 	 *   allocated buffers are used for transmit, hence num_bufs / 2), or,
 	 * - we ask the virtqueue if there's a buffer available
 	 */
-	if (vrp->last_sbuf < vrp->num_bufs / 2 ||
+	if (vrp->last_tx_buf < vrp->num_bufs / 2 ||
 	    !virtqueue_enable_cb(vrp->svq))
 		mask |= EPOLLOUT;
 
@@ -873,15 +873,15 @@ static int rpmsg_probe(struct virtio_device *vdev)
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
 
@@ -980,7 +980,7 @@ static void rpmsg_remove(struct virtio_device *vdev)
 	vdev->config->del_vqs(vrp->vdev);
 
 	dma_free_coherent(vdev->dev.parent, total_buf_space,
-			  vrp->rbufs, vrp->bufs_dma);
+			  vrp->rx_bufs, vrp->bufs_dma);
 
 	kfree(vrp);
 }
-- 
2.34.1

