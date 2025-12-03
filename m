Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6194DF6C
	for <linux-remoteproc@vger.kernel.org>; Wed,  3 Dec 2025 13:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764769870; cv=none; b=OXNfWJ9AtKMPZd0iOLnzfpUduV0unIXEIcN6Iatrphoxr4xaAmmOJpilPYL7VHfvVBggM84OCTMsZStpopodWFubMR6HwcNPDMcL0h2GXMhkMDtflxEky71PxUNfpjlSb1aXBUXi2WjXUmV1hh7KQT8B333H8k8f4uuF73Gv/i0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764769870; c=relaxed/simple;
	bh=7qUwt8QKikR++JHPhKrH66cxiuEAMN3B2dt4YSmvIFU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b/RugUv4vukcXwU0f4pcafxLx217B5/9I8C9afVe9fml9sTom6KCsuXW4Mvfc4/AgoQmuvARscTp8BxinJRHd8mq1nmOAHWh0ArbIw2wgVFUQDzoMGLd6C2Yb4koPGDRkVz+Q8PjNOBO9ZKs/ZPL+zQ2lW1UVUW6IbxeBoHc//Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=joo+YTdk; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="joo+YTdk"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4dLzYt6Rv4z9sp0;
	Wed,  3 Dec 2025 14:50:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1764769859;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+W4WuwTnU3DFKlM4XapMFqvKyWXaNc3HA0PNwd8+t7w=;
	b=joo+YTdkGShqYXBnznNkeVTqC6Y9E+0ed1v0mFEEtaEvfgMoEO/Fzmt50W4SB6SKLy3kb4
	78ad1FRlohTusBhweheO5JhPel2g5dam/1VH1Jja6hmx1iiC8KDJqB1hCUqDBGISkglFK6
	+xnc8khRAGCAxR93K0X2qwG0CNNOpHlWMrqf0WJBGDoHGlAl+KhQwm/0pXyCh02oKnMfSr
	D5/f6s1dbXjLIfGUIrDHLDDUagF2f4ppZr69K6qwKB4SHzP9++ldG3dsKI8j9K2zPHCttm
	Zhl35rjt37frM3BiDaC7nEpA6RtdsSMJaP+1FUCN1XvT3wAfMxEkLUs3/QuA1g==
From: Stefan Roese <stefan.roese@mailbox.org>
To: linux-remoteproc@vger.kernel.org
Cc: Tanmay Shah <tanmay.shah@amd.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
Subject: [PATCH v2] remoteproc: xlnx: Use high-prio workqueue instead of system wq
Date: Wed,  3 Dec 2025 14:50:57 +0100
Message-ID: <20251203135057.140349-1-stefan.roese@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: e8342f88b3f9970acdf
X-MBO-RS-META: q77hxfwbeb7ktzmgqswsy5z6gew1d3xc

Testing on our ZynqMP platform has shown, that some R5 messages might
get dropped under high CPU load. This patch creates a new high-prio
workqueue which is now used instead of the default system workqueue.
With this change we don't experience these message drops any more.

Signed-off-by: Stefan Roese <stefan.roese@mailbox.org>
Cc: Tanmay Shah <tanmay.shah@amd.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
---
v2:
- Also call destroy_workqueue() in zynqmp_r5_cluster_exit() (suggested by Zhongqiu Han)
- Correct call seq to avoid UAF (suggested by Zhongqiu Han)

 drivers/remoteproc/xlnx_r5_remoteproc.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
index feca6de68da28..42c8884bc760f 100644
--- a/drivers/remoteproc/xlnx_r5_remoteproc.c
+++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
@@ -16,6 +16,7 @@
 #include <linux/of_reserved_mem.h>
 #include <linux/platform_device.h>
 #include <linux/remoteproc.h>
+#include <linux/workqueue.h>
 
 #include "remoteproc_internal.h"
 
@@ -116,6 +117,7 @@ struct zynqmp_r5_cluster {
 	enum  zynqmp_r5_cluster_mode mode;
 	int core_count;
 	struct zynqmp_r5_core **r5_cores;
+	struct workqueue_struct *workqueue;
 };
 
 /**
@@ -174,10 +176,18 @@ static void handle_event_notified(struct work_struct *work)
 static void zynqmp_r5_mb_rx_cb(struct mbox_client *cl, void *msg)
 {
 	struct zynqmp_ipi_message *ipi_msg, *buf_msg;
+	struct zynqmp_r5_cluster *cluster;
 	struct mbox_info *ipi;
+	struct device *dev;
 	size_t len;
 
 	ipi = container_of(cl, struct mbox_info, mbox_cl);
+	dev = ipi->r5_core->dev;
+	cluster = dev_get_drvdata(dev->parent);
+	if (!cluster) {
+		dev_err(dev->parent, "Invalid driver data\n");
+		return;
+	}
 
 	/* copy data from ipi buffer to r5_core */
 	ipi_msg = (struct zynqmp_ipi_message *)msg;
@@ -195,7 +205,7 @@ static void zynqmp_r5_mb_rx_cb(struct mbox_client *cl, void *msg)
 	if (mbox_send_message(ipi->rx_chan, NULL) < 0)
 		dev_err(cl->dev, "ack failed to mbox rx_chan\n");
 
-	schedule_work(&ipi->mbox_work);
+	queue_work(cluster->workqueue, &ipi->mbox_work);
 }
 
 /**
@@ -1162,6 +1172,7 @@ static void zynqmp_r5_cluster_exit(void *data)
 	}
 
 	kfree(cluster->r5_cores);
+	destroy_workqueue(cluster->workqueue);
 	kfree(cluster);
 	platform_set_drvdata(pdev, NULL);
 }
@@ -1194,11 +1205,20 @@ static int zynqmp_r5_remoteproc_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	cluster->workqueue = alloc_workqueue(dev_name(dev),
+					     WQ_UNBOUND | WQ_HIGHPRI, 0);
+	if (!cluster->workqueue) {
+		dev_err_probe(dev, -ENOMEM, "cannot create workqueue\n");
+		kfree(cluster);
+		return -ENOMEM;
+	}
+
 	/* wire in so each core can be cleaned up at driver remove */
 	platform_set_drvdata(pdev, cluster);
 
 	ret = zynqmp_r5_cluster_init(cluster);
 	if (ret) {
+		destroy_workqueue(cluster->workqueue);
 		kfree(cluster);
 		platform_set_drvdata(pdev, NULL);
 		dev_err_probe(dev, ret, "Invalid r5f subsystem device tree\n");
-- 
2.52.0

