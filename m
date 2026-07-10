Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013036.outbound.protection.outlook.com [40.93.196.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C631D37FF63;
	Fri, 10 Jul 2026 19:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783711725; cv=fail; b=CImlYPnKdM+xoQccpjhvjRKmxtbuppaNHiEI3I/F0cUXgg8UHQLvwj1txp1IU98xqhPELWeNPk7WDz9E5A7Cs0EOFyBSSJaASbTQZMty4BTv0eFC9k72mJhd3QqpryeYb97MuGDm8KZudMI/zOipLai6dLlEMI8uXDX/+kuQohQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783711725; c=relaxed/simple;
	bh=MHMjzYGW2rxwqAKhBVTHYFzH8YKIdDbY7QgZWS+Fm70=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JZfRtaA7Rz+DhH9pwiR8txmUYAJ7KMuRfWphvZ2jglq0g7Vk1XwzCLlTWqNSqdSETlkBCWzQYCX4PsFfLciD/rhJ0AHsWTf83BUrVx6zddujQGXsEMEJjDCD0UfL90rIZHMfz93fXuV+8UvGRkjW1JtsZf2alGujdPrWwyDORA4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=jHKdittp; arc=fail smtp.client-ip=40.93.196.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="jHKdittp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nlVQYS8HugwtxxfsVEbXCIhbtCYI0cHrr4jn8hGtD8L3oLO7iJWjUBXWLQRXh3PjZn3p1R7aL3wsBG5/cXqZvwYXW07OlzNxYAqX0Y+GU9NvsXEljNWvI7O2CkFRZprucl0SRkNKH2lGS6b5tZDsA6EAJlS1ehtyE59XA6jBsQUyCR7pixMjilb9Cy/I3yYvqxw/s66Hmf3InsEUXKl2BEMbfM76nMOmMbyYTyTI3xW86Q3ho+aS1pUxJkD5Z+JWqBXc25FrQorzZ+MrjY/nYNf3FbUmpnzZFNQNUDboILrlojYSpNL6rZPht4t3uC7NrrMdBrTdPDKrYnWoZfA9Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CvUvI+gkpSMQPhmUtjdO8lrUqEozs22M4RUCxezww54=;
 b=M+5jFGSPOevBsEbfMrkr3Wf2jU2ktJzMf5ONLRY/eE9bhLfh4kzsFKbglUBmlbh2n7EKdhTqc0dX/vbqgIs5Nwc8ylbWRTCxalAvlmk+MyCvXxo5bL/OgqHENRSu+ZBlYtHVI1UrZfFL5gI6y537fMFMhi/QwLXAAVtSEp5PNq86cc7/FupXu6RYaX1C8Y/VxOTXmHjDkEHemx3QtaTrT8q8IAs8dtk/YkeiqqUv2zuzkUNUjJU5HxIcrgLhgANQEpsGgFpBTQlfcVSYrrsaB+S0S0S28UYKj2DlywXyQ1Yz7E1F74yuG8Kf4VBFwx/NkM2qINwWls1WWv6v3oW+PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CvUvI+gkpSMQPhmUtjdO8lrUqEozs22M4RUCxezww54=;
 b=jHKdittpWENoA7EAIw1z5W/DvJvVYE2bJiQdHvfw7vpVI8vgUjRwUPQOnNBF4v1NFREBbakEzF8s9OVdXDw7H0Qc8ZIfObt2L3VIOIa+MylyNZjKiWvmdClUDlAhlE35usU0OmsvkHQKNpcEB0F5KGP8gTXsGroQM3m8DL6Jt60=
Received: from DS7PR03CA0277.namprd03.prod.outlook.com (2603:10b6:5:3ad::12)
 by LV3PR12MB9168.namprd12.prod.outlook.com (2603:10b6:408:19a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Fri, 10 Jul
 2026 19:28:36 +0000
Received: from DS2PEPF000061C7.namprd02.prod.outlook.com
 (2603:10b6:5:3ad:cafe::1) by DS7PR03CA0277.outlook.office365.com
 (2603:10b6:5:3ad::12) with Microsoft SMTP Server (version=TLS1_3,
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
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 10 Jul
 2026 14:28:34 -0500
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 10 Jul 2026 14:28:34 -0500
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Tanmay Shah <tanmay.shah@amd.com>
Subject: [PATCH v5 2/5] rpmsg: virtio_rpmsg_bus: allow different size of tx and rx bufs
Date: Fri, 10 Jul 2026 12:28:28 -0700
Message-ID: <20260710192831.3440427-3-tanmay.shah@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C7:EE_|LV3PR12MB9168:EE_
X-MS-Office365-Filtering-Correlation-Id: cef9904c-dc15-475b-a7d3-08dedeb96fd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|36860700016|1800799024|82310400026|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	X1//n4QLHBrGLYwhRSyuyjYHHje5Cs7NNECv5VitCEsDDRnOoAZlh8hqqgF+AnGauXmlP4jW2VBmuLeLeVF/NeC3bgb1amkPyCT4TljZOchAErbleMiOBgkpZN1aXvanJ8YK0Qhub0P7Ls5aVNbNoYwBGDQo4jRY39d45cFJe847kO1rELHpUYKJucNCC1xpb6775J9+not2+6evpsRjiGCd7NmC/yaNmEIIlygPbBhyBXWOWzTjiLR+UAhV2M1uRUGwlWPOYt6ClyI5xX6E3bvs7ej4eV5grvc9/dP6IEkuPZMwSIP0dQHOOS3+8IMh2D9czcqyaelDn/h9aRtzS2+q7fTh4D4rcoXHt1hEP2bXSmWvJFQ6gRT2d9sbUmCY/1PcZ0fwlihHhMFdukKa994rdmMg1XZmh+Lip9z2s1rATGR7B43GvHnHREMehOAt12t0UN2h5k/4vesdCF9UuYJUnoV3S1URruUj0or70FWvSo1ja8efnyHr3zTkRwyqb3SdmTMXjkEvzSTRmf/BpP7moL71Yqc+gGTbfoEwoxeifnv68ZIfWDDE+t7qqjVkGmyLMeaHseP6FnjnzMvtgn+WBYPYbVwTMhO1yQSEiBUAJF5g4gtb2czprNbbHBrWRyqfd9UFNGojIRVCbIYhQ/6Vej+WmITRO1753Ff3aM5E9NdYrw02cbFFdwwHIgqS+DekrYkZIktnXNiYnrk9LA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(36860700016)(1800799024)(82310400026)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	cI0zymP4Vrr4oaAW0fvs5FfehCevpdBXly1DkaCrejvLnE77iMTln1KH7j5vQeFuMSRFyF6RfmWKJ38Gj869biubilHvOl8aPq3adKAEcoMq5QnVfTsmisy6S+xgTvZbnq4WIkvKwh+sg/qq2ZVVNzaH92Dxr8h/c++Tj/vvYN2JVLdp+yzeTWvMZjW02p/nrR6CXyCn0ErgrWosN30UWCfmAKKucz8QTRSkJ39L+247Eb5ycYJZVBgwkbiCcSh9GjGVbXNJG4Y8Zo9uQvhxsvZDD4klpzedk0OSenygIlJ3vCVy8mKqO8vm1fXNjb4tz4z6OzPQUbGpBqTQa1qX9hBE7Q6DZUitIC7LjnVc8S1ysfREdgMUpg8UW85O4YbAqajZnifFOOQ6OklkfzkorNQTv++HwWxoGkKyz9e9PGJ/SBDzfvO6Iy1YE/bb7o1k
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 19:28:35.9409
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cef9904c-dc15-475b-a7d3-08dedeb96fd6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF000061C7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9168

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
2.34.1

