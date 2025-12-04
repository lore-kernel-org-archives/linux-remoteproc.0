Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC33A2E8B75
	for <linux-remoteproc@vger.kernel.org>; Thu,  4 Dec 2025 10:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764844827; cv=none; b=A7MYpHLDmC42DJpboHRY1CelC02H/OqxKFIMy7HVuz8UJsUMZaBfRNfEasbfFN/pbs69e6lUkYOqgE7qmZSKHk5k1ePtqERPMJw+zbpon9RPtgaDZ2tUO3DoVi5KDDhKz3PXKGa/JnVGQedCuvKkDkceZm1nv5uw7Up5IwunBdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764844827; c=relaxed/simple;
	bh=+Nf412K4+iaaj7PH7E+roStoQuuIY5C7EVd+ovIQQ6E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bYFcmUAoWxNyI2eKkRb7XjslhmMjrgqecYxUWAWXFpocyQL+NFsp9y4o5Gl/O7JCVNq30f9Ewlh4WkwT6v0J4l6FMX10LFQTnnfWz7MZzcGRB6TD94qbfSQxUozS13iNCq4Qed8Q9LhfANiUBGo2kMoDJ/Y0QT/SbY3sFvvLcHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Pg3mVwDm; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Pg3mVwDm"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4dMWHM6ZGJz9tm6;
	Thu,  4 Dec 2025 11:40:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1764844815;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ntPRU/ry3xX+pHbNV7L/I36RyZ5CzvnZwMIISIcz4KU=;
	b=Pg3mVwDmcSrPxiSRGihbIzX1RllsnGW6sl7gHYrRneeGWlq0QqIIOsuiEVcKND4944o2In
	TPsO3G7ebjWv1ksuZSyOiJbfRABehTY58IUh/P5kau9r9ouPF1Yxq0gDlN2+P6VF3NUYfq
	rMTy77Okrs4WfhZmQX93wR2RCH3wgSHdHgTDnKzpbi6nra3jB2kQOK9rloDf/FImUjNtcP
	UMAhpsackeTxB/j7KfOxj0cpxSWHD+qMj2KiHbVamOJVZ+L6DI7/VAMl5tIY2Q88I+qUPg
	OYhlW8eKwY378HyqFzArIEr2l/4QPCbBwlMcbvSgCGD2dX7TPmvxFt0AqvUNoQ==
From: Stefan Roese <stefan.roese@mailbox.org>
To: linux-remoteproc@vger.kernel.org
Cc: Tanmay Shah <tanmay.shah@amd.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: [v3 PATCH] remoteproc: xlnx: Use high-prio workqueue instead of system wq
Date: Thu,  4 Dec 2025 11:40:09 +0100
Message-ID: <20251204104009.129483-1-stefan.roese@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 3b15293854c64eb9a06
X-MBO-RS-META: 31rko3ifam6mc5wx8nokm449wh1z1u4t

Testing on our ZynqMP platform has shown, that some R5 messages might
get dropped under high CPU load. This patch creates a new high-prio
workqueue which is now used instead of the default system workqueue.
With this change we don't experience these message drops any more.

Signed-off-by: Stefan Roese <stefan.roese@mailbox.org>
Cc: Tanmay Shah <tanmay.shah@amd.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
---
v3:
- Call cancel_work_sync() before freeing ipi (suggested by Zhongqiu Han)

v2:
- Also call destroy_workqueue() in zynqmp_r5_cluster_exit() (suggested by Zhongqiu Han)
- Correct call seq to avoid UAF (suggested by Zhongqiu Han)

 drivers/remoteproc/xlnx_r5_remoteproc.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
index feca6de68da28..308328b0b489f 100644
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
@@ -1154,6 +1164,7 @@ static void zynqmp_r5_cluster_exit(void *data)
 
 	for (i = 0; i < cluster->core_count; i++) {
 		r5_core = cluster->r5_cores[i];
+		cancel_work_sync(&r5_core->ipi->mbox_work);
 		zynqmp_r5_free_mbox(r5_core->ipi);
 		of_reserved_mem_device_release(r5_core->dev);
 		put_device(r5_core->dev);
@@ -1162,6 +1173,7 @@ static void zynqmp_r5_cluster_exit(void *data)
 	}
 
 	kfree(cluster->r5_cores);
+	destroy_workqueue(cluster->workqueue);
 	kfree(cluster);
 	platform_set_drvdata(pdev, NULL);
 }
@@ -1194,11 +1206,20 @@ static int zynqmp_r5_remoteproc_probe(struct platform_device *pdev)
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

