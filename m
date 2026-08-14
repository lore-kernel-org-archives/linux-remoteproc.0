Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011058.outbound.protection.outlook.com [52.101.62.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA3135838E;
	Fri, 14 Aug 2026 04:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786682580; cv=fail; b=iadK/RAwz0wO6h5HDeOXZnLSWQScbu4CLRL03szjzOyQm3VxRCpPr4pBZO+plW1sPr3rmBEQTgqLA+h3GCoXp+JDS/mgpj/hMFwjUimfDNs7O3udi3jnA/4OqAAKfBv26Rgu2Egyec0iZTjlIfDMis9OX+AF2e2ttEp5UlizLUE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786682580; c=relaxed/simple;
	bh=5AwMKzju6PhWHQxfDiLU63hz1jLmQ3aQoKka46mJQ0E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tstA93Qw4l4D9TRAtxl7X7wYxkO8lD0juKNkmRhX41+eiAnoPOls2ax1s9LGoH5soX+sWKjZTPWwmQiNvH5eAYltdMYP5wqnM3pnd0IlPasXWHCj8puH6hvt+7Y6AY9Cr9hKLx9GxZ9RwmFqqI4O/c1W2xB2+5TRqgvBJ/e/Zy0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=2awv0C3m; arc=fail smtp.client-ip=52.101.62.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="2awv0C3m"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wt1ejeqcUM0PCPYP5LdY9pRasiQb0uqHXdLjkA0C5wl50udcTL2H686r6REbRk3n/lIARf0deA0lvRRvR0WIab6dUEgqsWwoWBDvKTwzBgNAY+e2dLLgZ/gNcQtFWyqaDQh3A2niSL2Nok7GRrAUgDeQTRfJDbBzhYdSA4pZfr8e35wFN/AWdQm/ciIXx0OjB2vXUw8iNGpgo9huJHY9dawQjc1ynOVglnZ9GKdMeDvxRhwMjQnLQQmOpB3Z6WqNjJqm91879NuObhkHES11xqLxIwxNQUrTbCfi7D4/NsBS0IKKWn9O7Bco4/WmDdREw1pMDHFyyQuQFGYjH5v9og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mOkpZ/hEZvjsFz/RgHuk3M2JT0CUWeaDXGg9RHQZJKk=;
 b=Q51Y1UcltSyPAw+60DHZB9+pePLjzCQAwH7JA3xKGiOOOaaFYKw0iFEV/h2QOJZqtE4maugm3Ri+9B0uVQ5RGX8j2bYuEmaPmcLdj9gvuSy1wbisbff6YwO7C7Qt7W3sUkTdoIx09+ikrHSThpsdClcWs28un7MhPTrFPLOj8y+O02BOvGdZkDbdV5le873OqxYBddZNRa/GwzFGUGODdKkGvRdNtBTUGcATKDJuycYEeLMNl+VCE1s2ZhJith9EnTgLyuw7y/fsVL5N1OoQTU1GQ68jJdMabfaLHOd3me4M5JG3opiAuPnabdccXDovdD4uSps+mFtZ2iX7RpLhsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mOkpZ/hEZvjsFz/RgHuk3M2JT0CUWeaDXGg9RHQZJKk=;
 b=2awv0C3mty7lGsrve3HKNHyHuv2/7ZWpDGIj7Op3gYUh5Ri2hBhWVAZN488dONnosaW7LBpGfSEohaG3bNPZFs/xCWXJNOjrrCAqle76MYEGfNEBgcK2spyraHJYIELOrSQ6KgqfKTu86WCGxbxcfiAIde5GzbrDevfHYn1x8BU=
Received: from MW4PR04CA0386.namprd04.prod.outlook.com (2603:10b6:303:81::31)
 by MN2PR12MB4095.namprd12.prod.outlook.com (2603:10b6:208:1d1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Fri, 14 Aug
 2026 04:42:52 +0000
Received: from MWH0EPF000C6185.namprd02.prod.outlook.com
 (2603:10b6:303:81:cafe::27) by MW4PR04CA0386.outlook.office365.com
 (2603:10b6:303:81::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.15 via Frontend Transport; Fri,
 14 Aug 2026 04:42:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000C6185.mail.protection.outlook.com (10.167.249.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Fri, 14 Aug 2026 04:42:51 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 13 Aug
 2026 23:42:49 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 13 Aug
 2026 23:42:49 -0500
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Thu, 13 Aug 2026 23:42:48 -0500
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Tanmay Shah <tanmay.shah@amd.com>
Subject: [PATCH v6 2/5] rpmsg: virtio_rpmsg_bus: allow different size of tx and rx bufs
Date: Thu, 13 Aug 2026 21:42:35 -0700
Message-ID: <20260814044238.518296-3-tanmay.shah@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6185:EE_|MN2PR12MB4095:EE_
X-MS-Office365-Filtering-Correlation-Id: eacd18bd-2bcb-4246-017f-08def9be7fee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|23010399003|11063799006|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	oDYJbrsd21cmtHedJ08cP5hKHyWnK6S5U7HPWCXllYd8spJKs5TiE0Eo7DHq2OKNFTXHaHCgWDhf2WUV+Dq59Q1OIHWkPBeBQYmVIVwUSmN0VSDX3JxBB0AZacXPTRUgKfXokl98IyGv1p2JLAYDV/xMPoPrjQkiQ77/m8BEOwmTZjKXtH4e7c/6vhWj/6aIykZzmmiA7X5TyEfl0y5lJZdGT6ZPKXiWDX90IabCnmiiKrGhyoRrUHNjQayNh6jDvut2aPxj2AyvPKP88vwfR3r67y9BYAv/QvmOnAqhq8bs56G5N2lqyL6NtRQzqy+Xv/iZrhCAfSs2tg16cnFvhW3i9VgmbvfXR9qGVtOCYL9Vt+4xWGzmONVuL29CIm/S9K0tau/Qccj4ygoq8pulOSyq3gChduJe13DWZCBn/Ysjtq6cnic708Xtob/wdGgJBTiKFRveXGSPKsLscFNkuKps+Eyvf8/QERMHVK+h7Fu/xTkbDIiENkFEX2eHIFoeVfBtyERCDGeQ9vLImRbKEv+eIMBtEemrlGYnIFsU/FlG7BpVN8VVPH6GaWUrkpjnFtGl1YAzhpRETSK4s5lmsqqMzTY0LyKrLLDXdQHoNLYvU/0nOOUQtRGyRkAB2AFDS+Tcj2erPPaNtisPK4EuKYnstlycv4JKL/e7XdGrduXMwGsTeStJ6L74lpEWN8s8o5VFH07bKcC4Gm4OwvnaRQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(23010399003)(11063799006)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	EB++f92nRNajoUvCvtfXkb3V0i2itu4NmdevnBRkT5BjrLhYNesPF9MSAXyYdoo7WW4JYfzOml5aNQ4tL3kRWsPzn2tpTKlAgGy42l9oSevRkKqBX0TsPXeqFvK0BWnu+JHyu/NOLDk2rp4/CQVv0Vb+PlMU9fxQ8TZiMHPreDerMfJ9LuykToyT3jcKFmhy8CZLp7Nrl834rZxMe70KUWJWp7ZA4drvXgQOUUUwy6RQ9znpy87skgvVsTZ0vg5ldVSj2U9vKeu9E4bFquuHkLwNGMF+77BhQwr8NojGQxFya22BeZzkIrltbK7SuHqQhIcXzQO5Ag/WiYtq0dBZOmHZRpc6totOMtiDFEl6yoEqdFfiyAlqATaaZyYDVjXN9zcukOfMwtEer6jr0F4O5DB1L2g0olR8CG9R7JsVQ/cWPigooWCPbi1rzulGBlOv
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 04:42:51.7166
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eacd18bd-2bcb-4246-017f-08def9be7fee
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6185.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4095

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

