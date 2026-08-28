Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010001.outbound.protection.outlook.com [52.101.46.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906A947255A;
	Fri, 28 Aug 2026 14:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787929164; cv=fail; b=BGbAygq+jLbBnKz4Kedt56csIFQdEka5a1FLZwCHVOqqOpJQ6UEoD+jLq6epvS9FQ7hKJiUQYCvj3MCPaAQTuAOp0MQwuFwvpzvoB4JuCxgh4dB9TwklhSZgYanTpBO4Ru35gfpo1V2daRrGwlGCg3h/XLoPyiVgoQPHZLEGg0U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787929164; c=relaxed/simple;
	bh=5AwMKzju6PhWHQxfDiLU63hz1jLmQ3aQoKka46mJQ0E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Rsm25n3878KFHkBH86x4fxBic5pCC0/QZSwFCNqfJEif6/2UyrWWLg94I30YyleOcjjlBlin73QntmVL/mfhsiTe8Az4eBOkq/0byjQlowiBz/M8pXYFhcUvOZmwlJ1JZ1zdm0AyFMHxPF0mi/s8IucfVl85TxOzEdZd3+6ja0w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=aEuLzDat; arc=fail smtp.client-ip=52.101.46.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="aEuLzDat"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YHaKAfgF8Em/6FrK1CtAlt0bHWmBe8lVLEEApAmp1oc3etWEIf5hs56LvZ2488Gyr1Y3Uius1JcM+qleNn9RPkG7KC6Ki19+q6XqRaeHUtbX30GatQ9NLFYVEOwZJyQqMJo1SLduR0BUtIwRyuRy1Tu0bCsPD1Ljo+hvujwLZa2IyM2BUQbGwMDw3fIOh3WNS/3g0haxvKfHXSnxrDJouM1MGJzSeIhDlQHzsFvnwsGZbpoYyJA1Lhw9vUjpRs7knAjJ2Kjav8zeSeldhEPxtpPSRZf9oR41/FVkxXFBpwXQXyyRErtZpUwC29ZE0zCsItNdarRu2rf0quzoFxPWIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mOkpZ/hEZvjsFz/RgHuk3M2JT0CUWeaDXGg9RHQZJKk=;
 b=CizYi29fYSbLsUxIvoBr95cy8uWce+dSTaJdv1Zekb1Lm77D1saU7KLJ/aylzPd6YKtLzIiYkj0eUATg2f0DiQ7+VG1345V0+NYwViaYRdOjy1ORmVkQvuYURc/TtQYmrJD7tbwREPQ8ofZlSo5Elp7IqxVSbrK537kggDXWNGmgQVMs4KJV2VvAIDjClKGEDJMiyu4clc+bsCWDqVKLtZaQwnT6rkB85amPFaZ1ycmZNNFoPHf96zSC/7n0Jj9coqZZSEDBohYL78yKvq0yQ6FU8WmSJJmVmpnI1maChDg0U8ARUslMWBG8BQXwDYpULYmceoKzOe0eI7GhcLiQyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mOkpZ/hEZvjsFz/RgHuk3M2JT0CUWeaDXGg9RHQZJKk=;
 b=aEuLzDatkxEPF5rvK2A92QzJTGYV0f5pHFLRXTHtChOkHUiS7O5hLeCWKCJib0B3rPwSF/QNQHZVHwGIrnrbPMTb4+/jqv8r23LmeI6UqygB3MF1kXef9XvOOYHedGse8FTPjVwgXhddZS4FS24KnGHG4z7hRx+4yYb49XCvXcw=
Received: from BN9P221CA0016.NAMP221.PROD.OUTLOOK.COM (2603:10b6:408:10a::18)
 by CY8PR12MB7563.namprd12.prod.outlook.com (2603:10b6:930:96::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Fri, 28 Aug
 2026 14:59:16 +0000
Received: from BL02EPF0001A104.namprd05.prod.outlook.com
 (2603:10b6:408:10a:cafe::aa) by BN9P221CA0016.outlook.office365.com
 (2603:10b6:408:10a::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.11 via Frontend Transport; Fri,
 28 Aug 2026 14:59:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0001A104.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Fri, 28 Aug 2026 14:59:16 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 28 Aug
 2026 09:59:13 -0500
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Fri, 28 Aug 2026 09:59:12 -0500
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Tanmay Shah <tanmay.shah@amd.com>
Subject: [PATCH v8 2/5] rpmsg: virtio_rpmsg_bus: allow different size of tx and rx bufs
Date: Fri, 28 Aug 2026 07:58:49 -0700
Message-ID: <20260828145853.2843486-3-tanmay.shah@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A104:EE_|CY8PR12MB7563:EE_
X-MS-Office365-Filtering-Correlation-Id: 87494f79-71a7-4a9e-27a4-08df0514ee24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|23010399003|82310400026|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	hg0uv9g8nmV30v2+lHlLLIhJ0U3G4AvbZRi5iivNQr/XyFWdgNdHl7qt89C4buN4psEixwAXSSayJyU8kjB3xj7fPTfbdwgyPfd19vB9PexJwyqJ7oj+XkZZuzcr9DBEf97+jrL0+fZ/nymmhIB+Ys3NdcYeP3orvcOF1rVnzS6j0rSgRslasMrryCUfyB/IJkgVhxxRYgeixPsc6doc+3kudzM6pMFmAYbgbfh1ulk+OjH76im5xfN7SSC2EbVq5WaFqufUek3zzen2PYUIL2j4ZHsl4SB+noNqCTgzanrKPOxXsPAYifRizxUeLLRPxjdkpmUPE2sgOxy2Q9/S7IaXDWGs9aoGOCBGYg+8e+eD9B2yCaKXGfnGqA1RlpZWGpcu6VOhhJ2hGgliVAjoX2GxfDhhoDsGdT3keJ3gzdM/PmU/vaV9Oc6ZQxmY860GWacJfvr8GZtfh1M65VNB5abFzVLjpdq4tFjXLavFt8zwV/FtogQRvS5Jb4qJC7b5TAofbhBAFWzzhIUJKz/g2/j8w+3zq6ilQYhOHDYMZfgLU3gCx3uZUfQ9a13eBeBzoGfxxs8KcpRMHRPedHSVfCpBjeWsTZ28tht6yycINeek1ag5y7vsZvWomi9Uu/Xy0d2TwsuV3gR35eIZ5sqX4lMpmE+8kruXLA+7D+uiQHYczqG8TLsUaLTgT14Fci+ZdZM5Ljv0Zy2xVLwyyvmHHw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(23010399003)(82310400026)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Fvn+nRIKYjbAMjB5EPXwXah3L9CwHh/RKPIlt7SvGYSD22y/SI6FtyOCfQRl0BdJoFnU1M1JQojs0tmG9ubxYlo50F16irIs+65I4Uu4MkzgJ0mgg2lVkuMjFzHU2yIN4iQbGIWiQrxvqrtaFaA0sHClGtUk2rSKvMogfe9So433eNqwcfpPMMI/9bRxBF6TpcgcLbh3EiD59WBnLe8bO3DbUD6KZHqCVY2S4Kjf8QZNpTyKJqlWl5v457ui9u4r/7gKQw5Br2gw1kuCX+zxPmYn72H2qJ/V6n+29AYWCiZua6ok9nPpflmORqPm5k9OldHO4DxxlyZnvTmPXOW22vIRCK6UVDuvZJAv46wOih7T18cwDcqn4HTBobDz+i6Hu/uN77tt76VXt/9+RdEpI7NKUGkcMZS1468cDY/rUCpzlFj54V2EEjZD5Mc9Is4G
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 14:59:16.2254
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 87494f79-71a7-4a9e-27a4-08df0514ee24
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A104.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7563

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

