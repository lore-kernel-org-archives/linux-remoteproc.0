Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011008.outbound.protection.outlook.com [52.101.62.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5EA3AD53F;
	Mon, 15 Jun 2026 20:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781554825; cv=fail; b=aLJ7EM4L2TsMdwMRXUOn9sJTXb8f0lDlRjFBrM0MGaH44Y5lLUSgUyp8DNZ8oNJTna7wyTr0DV0dkhFManKrNqNTTTj1Edmr/nUs9gPoxAfOEhKco6riIzFmwdl5HXp1c/6ofpDTjT+Ei0iLTt7ZN7h5w+4iYEiiA7noO89n954=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781554825; c=relaxed/simple;
	bh=VjDnRfiI2UYHvAXt8BWnFUE5/gkyINHqdGsxy+8aANw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HStldSC19hnQEc91hF56lyenTRXwEE5bNI9Q6HlIiiy18+tJPJeEPq5loZ1h15YSwyiIxvxm20JqxwkoFaY0+73Hw7QCmV+FXDsSMdy3tGKbyG/rU1cvDTw8a7syQHxWjTpAAiHfbshICVkozTXDleXhdxbkCrcP3mVJTPMt0lY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=XLf5jQiS; arc=fail smtp.client-ip=52.101.62.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="XLf5jQiS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ik4W+6Jb1I9OjAGcR5ilQwA3eM/tPAYWpq7t7IlnQZAi035fszEJyKV+MnWGpTtuDQ4LZl8X33BlHu/k8V3TIddSSwVQqZMqSFw4z8F/Ph3ao0oAANIjFxvms53VIJlExDj+5ksEPFOm17GsOF9/ZpONniI9dmxKLJxN3vBKsEetrja8BgJMvONlWXYNArvn1wW4W1yCvkjq2QesExlUf7ptk0jTGdx1LdyQV4Lbz+NbG+IAc4rAjhNFGDxYjpH1zc6kkcWUq1Hjfpt3QxiDwVWCsnMU87YRkqmVXO/2H5xJBwC4hPY25Yb5g7WSVCQ+V3MpaX9ssVPDMeAod41zyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/7qzu014ra39MD5fSByTQzBE9+aQ8RuCcIcrlABdHT4=;
 b=yIgg6FLvC/oDi2Zn+aAb130EwalDdtIdnU5VOs9o+GcCvHhGju3nc/k6DT6rEwgF0d1fVid/ta0UCT2dcNnDZMiZUDqZKSlb4xLJH9rW/67SwirzegLQ26i2dqAyK/90hB5mzPQZbwNPK8DvWvCsKMFavQ9sLikhmGZR+JVpoDwi/RENxqyWejxGcNI2PioiEMoWPvq8GmCbaEsquWHKwJ9nRoFmiEHMibZeWmePKBfzOERspAq/Hz8r/FOh97j5bcNnSwGE9HcjWbiT25TUHSntzZui8WpxcIrLENXMPLJKJSr0eES54d9OV7gzHTlLXfp/u/tbv6WQ2gwdlBoCDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/7qzu014ra39MD5fSByTQzBE9+aQ8RuCcIcrlABdHT4=;
 b=XLf5jQiSqpuoNmS4eoE++jk6+YHO9iS//RYyuuEzyy9+fU9d8xKyHnHjlOpo5ROlasZojZ5bnYp8EqkpoIxbkvzIsOohDdx1bJfx1Vnrmu66qaqoZHFmCFgyAOhNRypgg4ADDwMaGAKb1OMf1RuKg/dHe4elOArLQIJPAoMTUZA=
Received: from DS1PR04CA0023.namprd04.prod.outlook.com (2603:10b6:8:243::17)
 by MN0PR12MB6125.namprd12.prod.outlook.com (2603:10b6:208:3c7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 20:20:19 +0000
Received: from DS2PEPF000061C6.namprd02.prod.outlook.com
 (2603:10b6:8:243:cafe::af) by DS1PR04CA0023.outlook.office365.com
 (2603:10b6:8:243::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.18 via Frontend Transport; Mon,
 15 Jun 2026 20:20:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS2PEPF000061C6.mail.protection.outlook.com (10.167.23.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Mon, 15 Jun 2026 20:20:18 +0000
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
 Transport; Mon, 15 Jun 2026 15:20:17 -0500
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>, <arnaud.pouliquen@foss.st.com>
CC: <linux-remoteproc@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Tanmay Shah <tanmay.shah@amd.com>
Subject: [PATCH v4 1/5] rpmsg: virtio_rpmsg_bus: rename rbufs and sbufs
Date: Mon, 15 Jun 2026 13:20:03 -0700
Message-ID: <20260615202007.3484668-2-tanmay.shah@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C6:EE_|MN0PR12MB6125:EE_
X-MS-Office365-Filtering-Correlation-Id: 8643f35d-ace2-43a1-d719-08decb1b84e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|82310400026|36860700016|1800799024|6133799003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	SgQcyehud/Tll/UkAZbyUVOVYRBk8evHb7gzRdocRQjNvrx9XOsnrf5IVPsF7iZdp57MNx5YcquNHLIleyVXGz5T1nWziIuZMpkmbtqLvNwFKr40sfZmM68x8b54rwLxfgIWxTiIbvkMyh5h0/38IlVtxueaDBzaIGTStSX7cHq6ma7ArUo+boAj4HXjak6RfPMuCOE0klECrM3/PLTxMjOjueVxC6+O/3mC6+y2UYD5cgV+bhemqihWdnRnVGw//vOlH2+oByC+7AAwhwu6OmyGlptthY3Rk0k6LVKN4SmLkg4kto6nzKLSb1Divae0Bn6onHmWmmiPukXK/GbSBJLIj0qEBz8K5QGEdTk1au872r2kwr3wt5x+c4aujAquWrlZ8DyJXWRZOGQ+8jUyFcts1muAQn7J5rtsaxjB9tlVwvXtpwXLQQFC+hmrusyk3tN3nXfHep7SXLF+ZOOaj+pDV6AU+nGuMabl7lnUyoPw/E/BPiLEgwIQlVgqHcpA8rHzqO/g2So0gEo+NlTFSc95L05YeJ74IFQaKmNW5IaWFMajVAkbAK4lcCWjJ/Zts6rYngHiDec5rQgXLbJitWzt7mZrTnZDIW+3JVXbh9R2+v4UEXzhZFhvQzxyt7XV+myYt87+BDjsVKR2u5TuIW7bCCDZVaKHIx23HpstdLJMw5oMJS6wjwhKrPEZpNzNSL3SlmDmpddjog5H4u5/cA8b7SjPSbQXxvxof8z2aCA=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(82310400026)(36860700016)(1800799024)(6133799003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	uplIBS4FMVYKL0R4rH8vixS/VxmIukhI8IQIuP5VVTUAtx3KfcRXe3+NEdVafNkuvJ+zImrfwnAycOgRS9CNJ2D39nSWlbBbQSisP5L4tjFG/crg6mP23fNEToBpTSOkCr+Ql+Oo4Wf0yY60BChYeHZyYXkMenECAWw/Xn0OOtLcb3GxNr1TRU38t0EHijFUrx/aJ39YHDq20oO/YBc6bXuPWEEVA1MfsF2mphYKGbZWq+14nkbxW2f1qQ4gAilkqODthb5zI6pjOuc14GVRq4XZ2TZBUlkJUOSPNe+JU7IhkmBVn2ZAo/diP41qlasiDT9b9pnsqhqgMtA07yHq1Z2IVtlHo29PJdA9c9FBmT1uekc4d/m/DKDjn95MkHcREwo1JkXZAp/alMwvvdQfmANv3wJ7+qG9Di1hTt03o1fi2Azr8BQG4MR9CR/AO1jQ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 20:20:18.6648
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8643f35d-ace2-43a1-d719-08decb1b84e5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF000061C6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6125

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

