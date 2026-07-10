Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013000.outbound.protection.outlook.com [40.93.196.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986FC3859F7;
	Fri, 10 Jul 2026 19:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783711732; cv=fail; b=gK5IAALTqo3CB0EzLUwe2Flst2PR7hr6MmmmVDT06isDanoxPrVOWuuPRHPSt9cN+lSSvvt5CRrFz5BZ1Q+P1PFOB9qbWyhIIfqZXBEkPpjxlehfXILey1LEb8NWPwLjG7aC1UcRJfMaoBV0xlPhIhB8rqndWtO/OXeGFxJrMFg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783711732; c=relaxed/simple;
	bh=UVGbY9vWrMB66SAggNMtZrPJTStjF4f4mmfcNIYgBko=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nuk242ae1vP/BCYcdnbZOC5WFnsSjQOGVzNxcnTm9q7ia+6+o6VYT7lTxBp/P3UkBrGuPVzrIEy8al4igeL1uwjKnLI4ow7MmcJzN9hihcIM585D4hhsvJPrervxVIcgicZysu9s537VLM+OCEcZtcfM9onqA1sdh+50/gDgokc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=tvHK4Z1u; arc=fail smtp.client-ip=40.93.196.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="tvHK4Z1u"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HFCd8Etu4d4vqbzYHpt7KDFNlKwLrBu7x2XLSu8r5SFBRw6M/TQxmyvHvGbkOFHUxk+ddyBDReTFYLhFJZuF6zWdKut5IHrWFlL+bDs/1rlBKnVpX6ZUNdDZnj89O2HMXJGo6KyqfrVwfCr7MNpSFn9fl1FbGFyroV2nRmAlbooAxnRZ7cBANrhJ4mNMbge3zSjbGerzL0np2w3NjdI7LdtUvU41q0AAdz4LbP7mDxxyPxoDPh2a4tinoZBfzzTDX8cOirfM9kAQ+RkWwtAf8BDhfEXKmmXDfui4bPuaKxWsmCII0QcsBkWjB9hCXns/QnwRNbng/PjGmJNK6owRyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M45HqpEk7qmAWzaMTrzEezXJVyYHP8SjsrtFonZrqRg=;
 b=agPl65oJ59Z3h0zENmhb6lVBFHMqQxCfgM9QFY799SQhEU8ihqMQAxGRrCvOssUNVQAMTRMzMQCi6/iXmxtseztmyOxdJTdA9LlFiMHHaVD93s02HjrdSyZEMCPuqBT2sVB0LVvcXqnr0etCJwjyVQ4pKYh08Hgzr+MR5RImty9pophl0+yUJ73Pmz+L8upAY/dGZsitK5g1m+1mokFef+kG86l1DiY7yjzh3UGYgcbB2qM1pDIr2iTrf8vc3tWfp0ROsMNLK+ivTCJgbEdPU3O+0aK2YKJYJDFh7TrRFiU1/2ykiIwtwUot1ISYgl9rhKY3X3m0yEcvFKJRKaVAfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M45HqpEk7qmAWzaMTrzEezXJVyYHP8SjsrtFonZrqRg=;
 b=tvHK4Z1uY8+IlYqeDFelZH250M6peJP9eeAN7EVdEOjy9fDjpu5xmSWmuQqaZKra/3/bKTmvAjekad4UIImgqpIaYzlUQkMBQ2sAokzw9ALfIsWExD1RPAhGB2BnvY6x4afoIShYFy/tvwK+grBN0vP1RrkNL/ekd+iqC/qEqVg=
Received: from MN2PR14CA0027.namprd14.prod.outlook.com (2603:10b6:208:23e::32)
 by SJ2PR12MB9005.namprd12.prod.outlook.com (2603:10b6:a03:53d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.16; Fri, 10 Jul
 2026 19:28:36 +0000
Received: from BN3PEPF0000B075.namprd04.prod.outlook.com
 (2603:10b6:208:23e:cafe::28) by MN2PR14CA0027.outlook.office365.com
 (2603:10b6:208:23e::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.11 via Frontend Transport; Fri,
 10 Jul 2026 19:28:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B075.mail.protection.outlook.com (10.167.243.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 10 Jul 2026 19:28:35 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 10 Jul
 2026 14:28:35 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 10 Jul
 2026 14:28:35 -0500
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 10 Jul 2026 14:28:34 -0500
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Tanmay Shah <tanmay.shah@amd.com>
Subject: [PATCH v5 3/5] rpmsg: virtio_rpmsg_bus: get buffer size from config space
Date: Fri, 10 Jul 2026 12:28:29 -0700
Message-ID: <20260710192831.3440427-4-tanmay.shah@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B075:EE_|SJ2PR12MB9005:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ed37cc2-b38f-4cc6-84ec-08dedeb96fb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|82310400026|36860700016|18002099003|22082099003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	DOjN7YB8qTbAwcaps1WjSSXvA/g3ZwTM0kb/JQu5hClUSvHYtP+6FEu6p90vkTnQtIlaKzsQ7qHoI8XoAfUF05g9HLR0523nbJSggMJxSUoIfcs8wmZUitjQxyei7bszbnKzEx7B8bAe/Rxnk3beqJ84PYiDIAvaXP5VnhSGr1mGeJKWTaMYjLVqD00wZYuIc/Ovf7aHcF7L3/HtAS6SSBJOGBYYPwo8lUnjvDRBLNBb+BfVb0+Cb97pZP7ZR+U3vKwPq7as2syhCKljuslT+jRJCiHlvCodpvNh9rFkC4Cy2xnqoMN8tDKA8hMqJTkBEm2q84yznmWw5yCaq5GMo/y6pmb/5IX5EXFXN3BPCK7We+HvXRba4EM8XNemh7xBtENecxuM9qtcbSZw9D/6lUDwiXJbGCZQDtT4QjVaEt0piGTxBJKZsI6xgt0O0dC2DTGZ05RwK7siPzuKIhuDwDtLx9cY/fA4gSsicqeQL/gN2qzTLzB1R2N1oquGYYeW5ImrPNyEv8Jw33UBh/gmB6TO7TFFfT9Zqzko9ux/I3pS656XHNhCRSBPy8V0pxiH6+MNHOOsyd9DBpazAKzbBZ19IhFRYIx70t6jhL1X4qTqUSHtmm1sVQCFizxjvaMTR8G0hftQDwZpOeQKxXesfSiSz4gzfxKHz/TDnxERgI3ZA7m3Q4Qovn6gKA2THdg76svNI0qTut4Lif1O+qA80w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(82310400026)(36860700016)(18002099003)(22082099003)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	vkp7EjibdvzSKX1GoipMrxPQpv9KIy/KOnmstSiuSaP4lamBp8KnJv4aGiNcMe0rNMxsXXExsJfN7GzmMgmKieNYdX95AyVcVrU57VGwD1Gzedd4Agsnzz2DgK3vx1DJvUTZo3VI/NDvtA7TkDZ2m6TG3+8i6npmfh2pthLudWulVjdcaKTWdmKPN5fp4ndi0LZF9n1rrnTGk+8Hf4pjmtkcSn1cDbFBfebmjei6aBtfpqYp2jrzkMgBJ0f3N36QOtFGnrjAo3qRApNR2jYDj6Rg+XJSVFQ1VJVNcEd1L2ykOuh80vCLUkh3H85+G5x0aCmuuWqMjoXZhwPi3gp5pFipEeDzzwLtwV0BdW5C2eMZhCKnk7UWzbT74ziqDOvcOAO302CHbNMGhJ13x8krSS4wrafQJbozn5jTV0Q1pZPxa/9ABG+Nba/GqxIGxqlG
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 19:28:35.7308
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ed37cc2-b38f-4cc6-84ec-08dedeb96fb6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B075.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9005

512 bytes isn't always suitable for all case, let firmware
maker decide the best value from resource table.
enable by VIRTIO_RPMSG_F_BUFSZ feature bit.

Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
---
Changes in v5:

  - fix documentation about alignment of the buffer size
  - change version field from u16 to u8
  - remove buffer alignment check
  - Separate buffer alignment vs MTU of a single buffer
  - Use buffer alignment only to get next buffer address at alignment
    boundary

Changes in v4:

  - Introduce new patch to modify rpmsg.rst documentation
  - check version is always 1.
  - check size field is same as size of struct virtio_rpmsg_config
  - introduce alignment field
  - check alignment field is power of 2
  - check tx and rx buf size is aligned with alignment passed in the
    structure

Changes in v3:

  - change version field from u16 to u8
  - introduce size field in the rpmsg_virtio_config structure
  - check version field is set to any non-zero value.
  - check size field is not 0.
  - Remove field for private config, as not needed for now.
  - add documentation of rpmsg_virtio_config structure

 drivers/rpmsg/virtio_rpmsg_bus.c   | 130 ++++++++++++++++++++++++-----
 include/linux/rpmsg/virtio_rpmsg.h |  48 +++++++++++
 2 files changed, 159 insertions(+), 19 deletions(-)
 create mode 100644 include/linux/rpmsg/virtio_rpmsg.h

diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index c84b6cec9caf..5e5473f4adeb 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -15,11 +15,13 @@
 #include <linux/idr.h>
 #include <linux/jiffies.h>
 #include <linux/kernel.h>
+#include <linux/log2.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/rpmsg.h>
 #include <linux/rpmsg/byteorder.h>
 #include <linux/rpmsg/ns.h>
+#include <linux/rpmsg/virtio_rpmsg.h>
 #include <linux/scatterlist.h>
 #include <linux/slab.h>
 #include <linux/sched.h>
@@ -39,7 +41,10 @@
  * @tx_bufs:	kernel address of tx buffers
  * @num_rx_buf: total number of rx buffers
  * @num_tx_buf: total number of tx buffers
- * @buf_size:   size of one rx or tx buffer
+ * @rx_buf_size: size of one rx buffer
+ * @tx_buf_size: size of one tx buffer
+ * @rx_buf_size_aligned: aligned size of one rx buffer
+ * @tx_buf_size_aligned: aligned size of one tx buffer
  * @last_tx_buf: index of last tx buffer used
  * @bufs_dma:	dma base addr of the buffers
  * @tx_lock:	protects svq and tx_bufs, to allow concurrent senders.
@@ -59,7 +64,10 @@ struct virtproc_info {
 	void *rx_bufs, *tx_bufs;
 	unsigned int num_rx_buf;
 	unsigned int num_tx_buf;
-	unsigned int buf_size;
+	unsigned int rx_buf_size;
+	unsigned int tx_buf_size;
+	unsigned int rx_buf_size_aligned;
+	unsigned int tx_buf_size_aligned;
 	int last_tx_buf;
 	dma_addr_t bufs_dma;
 	struct mutex tx_lock;
@@ -68,9 +76,6 @@ struct virtproc_info {
 	wait_queue_head_t sendq;
 };
 
-/* The feature bitmap for virtio rpmsg */
-#define VIRTIO_RPMSG_F_NS	0 /* RP supports name service notifications */
-
 /**
  * struct rpmsg_hdr - common header for all rpmsg messages
  * @src: source address
@@ -128,7 +133,7 @@ struct virtio_rpmsg_channel {
  * processor.
  */
 #define MAX_RPMSG_NUM_BUFS	(256)
-#define MAX_RPMSG_BUF_SIZE	(512)
+#define DEFAULT_RPMSG_BUF_SIZE	(512)
 
 /*
  * Local addresses are dynamically allocated on-demand.
@@ -443,7 +448,7 @@ static void *get_a_tx_buf(struct virtproc_info *vrp)
 
 	/* either pick the next unused tx buffer */
 	if (vrp->last_tx_buf < vrp->num_tx_buf)
-		ret = vrp->tx_bufs + vrp->buf_size * vrp->last_tx_buf++;
+		ret = vrp->tx_bufs + vrp->tx_buf_size_aligned * vrp->last_tx_buf++;
 	/* or recycle a used one */
 	else
 		ret = virtqueue_get_buf(vrp->svq, &len);
@@ -513,7 +518,7 @@ static int rpmsg_send_offchannel_raw(struct rpmsg_device *rpdev,
 	 * messaging), or to improve the buffer allocator, to support
 	 * variable-length buffer sizes.
 	 */
-	if (len > vrp->buf_size - sizeof(struct rpmsg_hdr)) {
+	if (len > vrp->tx_buf_size - sizeof(struct rpmsg_hdr)) {
 		dev_err(dev, "message is too big (%d)\n", len);
 		return -EMSGSIZE;
 	}
@@ -646,7 +651,7 @@ static ssize_t virtio_rpmsg_get_mtu(struct rpmsg_endpoint *ept)
 	struct rpmsg_device *rpdev = ept->rpdev;
 	struct virtio_rpmsg_channel *vch = to_virtio_rpmsg_channel(rpdev);
 
-	return vch->vrp->buf_size - sizeof(struct rpmsg_hdr);
+	return vch->vrp->tx_buf_size - sizeof(struct rpmsg_hdr);
 }
 
 static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
@@ -672,7 +677,7 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
 	 * We currently use fixed-sized buffers, so trivially sanitize
 	 * the reported payload length.
 	 */
-	if (len > vrp->buf_size ||
+	if (len > vrp->rx_buf_size ||
 	    msg_len > (len - sizeof(struct rpmsg_hdr))) {
 		dev_warn(dev, "inbound msg too big: (%d, %d)\n", len, msg_len);
 		return -EINVAL;
@@ -705,7 +710,7 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
 		dev_warn_ratelimited(dev, "msg received with no recipient\n");
 
 	/* publish the real size of the buffer */
-	rpmsg_sg_init(&sg, msg, vrp->buf_size);
+	rpmsg_sg_init(&sg, msg, vrp->rx_buf_size);
 
 	/* add the buffer back to the remote processor's virtqueue */
 	err = virtqueue_add_inbuf(vrp->rvq, &sg, 1, msg, GFP_KERNEL);
@@ -819,10 +824,13 @@ static int rpmsg_probe(struct virtio_device *vdev)
 	struct virtproc_info *vrp;
 	struct virtio_rpmsg_channel *vch = NULL;
 	struct rpmsg_device *rpdev_ns, *rpdev_ctrl;
+	u16 rpmsg_buf_align = 0;
 	void *bufs_va;
 	int err = 0, i;
 	size_t total_buf_space;
 	bool notify;
+	u8 version;
+	u16 size;
 
 	vrp = kzalloc_obj(*vrp);
 	if (!vrp)
@@ -854,9 +862,87 @@ static int rpmsg_probe(struct virtio_device *vdev)
 	else
 		vrp->num_tx_buf = MAX_RPMSG_NUM_BUFS;
 
-	vrp->buf_size = MAX_RPMSG_BUF_SIZE;
+	/*
+	 * If VIRTIO_RPMSG_F_BUFSZ feature is supported, then configure buf
+	 * size from virtio device config space from the resource table.
+	 * If the feature is not supported, then assign default buf size.
+	 */
+	if (virtio_has_feature(vdev, VIRTIO_RPMSG_F_BUFSZ)) {
+		virtio_cread(vdev, struct virtio_rpmsg_config,
+			     version, &version);
+
+		/* for now we support only v1 */
+		if (version != RPMSG_VDEV_CONFIG_V1) {
+			dev_err(&vdev->dev,
+				"unsupported vdev config version %u\n", version);
+			err = -EINVAL;
+			goto vqs_del;
+		}
+
+		/* size of the config space must match */
+		virtio_cread(vdev, struct virtio_rpmsg_config,
+			     size, &size);
+		if (size != sizeof(struct virtio_rpmsg_config)) {
+			dev_err(&vdev->dev, "invalid size of vdev config %u\n",
+				size);
+			err = -EINVAL;
+			goto vqs_del;
+		}
 
-	total_buf_space = (vrp->num_rx_buf + vrp->num_tx_buf) * vrp->buf_size;
+		/*
+		 * Optional alignment applied to each buffer size and to the TX
+		 * buffer base address (e.g. to align buffers on a cache line).
+		 * It must be a power of two; zero means no extra alignment.
+		 */
+		virtio_cread(vdev, struct virtio_rpmsg_config,
+			     rpmsg_buf_align, &rpmsg_buf_align);
+		if (rpmsg_buf_align && !is_power_of_2(rpmsg_buf_align)) {
+			dev_err(&vdev->dev,
+				"bad vdev config: rpmsg_buf_align %u is not a power of 2\n",
+				rpmsg_buf_align);
+			err = -EINVAL;
+			goto vqs_del;
+		}
+
+		/* note: tx and rx are defined from remote view */
+		virtio_cread(vdev, struct virtio_rpmsg_config,
+			     txbuf_size, &vrp->rx_buf_size);
+		virtio_cread(vdev, struct virtio_rpmsg_config,
+			     rxbuf_size, &vrp->tx_buf_size);
+
+		/* The buffers must hold at least the rpmsg header */
+		if (vrp->rx_buf_size < sizeof(struct rpmsg_hdr) ||
+		    vrp->tx_buf_size < sizeof(struct rpmsg_hdr)) {
+			dev_err(&vdev->dev,
+				"bad vdev config: rx buf sz = %u, tx buf sz = %u\n",
+				vrp->rx_buf_size, vrp->tx_buf_size);
+			err = -EINVAL;
+			goto vqs_del;
+		}
+
+		if (rpmsg_buf_align) {
+			vrp->rx_buf_size_aligned = ALIGN(vrp->rx_buf_size,
+							 rpmsg_buf_align);
+			vrp->tx_buf_size_aligned = ALIGN(vrp->tx_buf_size,
+							 rpmsg_buf_align);
+		} else {
+			vrp->rx_buf_size_aligned = vrp->rx_buf_size;
+			vrp->tx_buf_size_aligned = vrp->tx_buf_size;
+		}
+
+		dev_dbg(&vdev->dev,
+			"vdev config: ver=%u, align=0x%x, rx sz = 0x%x, tx sz = 0x%x\n",
+			version, rpmsg_buf_align, vrp->rx_buf_size,
+			vrp->tx_buf_size);
+	} else {
+		vrp->rx_buf_size = DEFAULT_RPMSG_BUF_SIZE;
+		vrp->tx_buf_size = DEFAULT_RPMSG_BUF_SIZE;
+		vrp->rx_buf_size_aligned = vrp->rx_buf_size;
+		vrp->tx_buf_size_aligned = vrp->tx_buf_size;
+	}
+
+	total_buf_space = (vrp->num_rx_buf * vrp->rx_buf_size_aligned) +
+			  (vrp->num_tx_buf * vrp->tx_buf_size_aligned);
 
 	/* allocate coherent memory for the buffers */
 	bufs_va = dma_alloc_coherent(vdev->dev.parent,
@@ -873,15 +959,20 @@ static int rpmsg_probe(struct virtio_device *vdev)
 	/* first part of the buffers is dedicated for RX */
 	vrp->rx_bufs = bufs_va;
 
-	/* and second part is dedicated for TX */
-	vrp->tx_bufs = bufs_va + vrp->num_rx_buf * vrp->buf_size;
+	/*
+	 * Here buf_va is aligned to a page. Also rx buf size is aligned with
+	 * cache line alignment provided by the firmware, so tx buf's start
+	 * address is guranteed to be aligned with the alignment provided by
+	 * the firmware.
+	 */
+	vrp->tx_bufs = bufs_va + (vrp->num_rx_buf * vrp->rx_buf_size_aligned);
 
 	/* set up the receive buffers */
 	for (i = 0; i < vrp->num_rx_buf; i++) {
 		struct scatterlist sg;
-		void *cpu_addr = vrp->rx_bufs + i * vrp->buf_size;
+		void *cpu_addr = vrp->rx_bufs + i * vrp->rx_buf_size_aligned;
 
-		rpmsg_sg_init(&sg, cpu_addr, vrp->buf_size);
+		rpmsg_sg_init(&sg, cpu_addr, vrp->rx_buf_size);
 
 		err = virtqueue_add_inbuf(vrp->rvq, &sg, 1, cpu_addr,
 					  GFP_KERNEL);
@@ -964,8 +1055,8 @@ static int rpmsg_remove_device(struct device *dev, void *data)
 static void rpmsg_remove(struct virtio_device *vdev)
 {
 	struct virtproc_info *vrp = vdev->priv;
-	unsigned int num_bufs = vrp->num_rx_buf + vrp->num_tx_buf;
-	size_t total_buf_space = num_bufs * vrp->buf_size;
+	size_t total_buf_space = (vrp->num_rx_buf * vrp->rx_buf_size_aligned) +
+				 (vrp->num_tx_buf * vrp->tx_buf_size_aligned);
 	int ret;
 
 	virtio_reset_device(vdev);
@@ -991,6 +1082,7 @@ static struct virtio_device_id id_table[] = {
 
 static unsigned int features[] = {
 	VIRTIO_RPMSG_F_NS,
+	VIRTIO_RPMSG_F_BUFSZ,
 };
 
 static struct virtio_driver virtio_ipc_driver = {
diff --git a/include/linux/rpmsg/virtio_rpmsg.h b/include/linux/rpmsg/virtio_rpmsg.h
new file mode 100644
index 000000000000..735a947d5582
--- /dev/null
+++ b/include/linux/rpmsg/virtio_rpmsg.h
@@ -0,0 +1,48 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) Pinecone Inc. 2019
+ * Copyright (C) Xiang Xiao <xiaoxiang@pinecone.net>
+ * Copyright (C) Advanced Micro Devices, Inc. 2026
+ */
+
+#ifndef _LINUX_VIRTIO_RPMSG_H
+#define _LINUX_VIRTIO_RPMSG_H
+
+#include <linux/types.h>
+#include <linux/virtio_types.h>
+
+/* The feature bitmap for virtio rpmsg */
+#define VIRTIO_RPMSG_F_NS	0 /* RP supports name service notifications */
+#define VIRTIO_RPMSG_F_BUFSZ	1 /* RP get buffer size from config space */
+
+/* Version of struct virtio_rpmsg_config understood by this driver */
+#define RPMSG_VDEV_CONFIG_V1	1
+
+/**
+ * struct virtio_rpmsg_config - config space for rpmsg virtio device
+ *
+ * @version:	version of this structure, currently %RPMSG_VDEV_CONFIG_V1.
+ * @size:	size of this structure in bytes.
+ * @rpmsg_buf_align: alignment in bytes for each buffer. Must be a power of
+ *		     two. If 0 then no alignment will be done. This alignment
+ *		     will not decide actual size of the buffer but will be
+ *		     used to decided the start address of the buffer. The
+ *		     actual size of the buffer can be different than the
+ *		     aligned size of the buffer.
+ * @txbuf_size:	Tx buf size from remote's view. For Linux this is rx buf size.
+ * @rxbuf_size:	Rx buf size from remote's view. For Linux this is tx buf size.
+ *
+ * This is the configuration structure shared by the device and the driver,
+ * read when %VIRTIO_RPMSG_F_BUFSZ is negotiated. The fields are laid out so
+ * the structure is naturally 32-bit aligned.
+ */
+struct virtio_rpmsg_config {
+	u8 version;
+	__virtio16 size;
+	__virtio16 rpmsg_buf_align;
+	/* The tx/rx individual buffer size (if VIRTIO_RPMSG_F_BUFSZ) */
+	__virtio32 txbuf_size;
+	__virtio32 rxbuf_size;
+} __packed;
+
+#endif /* _LINUX_VIRTIO_RPMSG_H */
-- 
2.34.1

