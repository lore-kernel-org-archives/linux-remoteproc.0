Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5598134CF
	for <linux-remoteproc@vger.kernel.org>; Thu, 27 Nov 2025 13:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764248839; cv=none; b=cntXaESGUcCfWz7yOh/rl8h67EYJqukeS7ws/OvYNGHp//vozZ1yr4K55uuOLNkIoaIVhoXKDrTqFw+bvFRNxvIMRaRMgPSaSMEMY+I2D8q9yRBEyKnFroKd2C5I1j/5VUNfXwFaHaNOtfCzSO5X04eiLJuJMYdl853+P856Sbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764248839; c=relaxed/simple;
	bh=MZ9v+YINmrPfvQROk/hAUaEl45MOoAprD8l2tOX6vmw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XNpocYnj9c/6EKQBKo0xrFNns/niC6pZuWqohf/uuDxY6j/XN55lEn/9VajLafkyJbrrPOI+th6FbxkhQNb+kwHsD3bePNDoe9k08Brl1DqGO9blWkn9MFPDgc2gIuwN0GxcAUb4kXCnrEMVicihAFF28oaAX6yOVg3b9dBmxrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=g1MTT91L; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="g1MTT91L"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4dHGt96PGFz9t1j;
	Thu, 27 Nov 2025 14:07:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1764248833;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3TzzDkCNNzPotJsfR4gMydlCd0DAED+iPWbHtDDO9qQ=;
	b=g1MTT91LafeI/9Pc81vZ7YtZqSYz9AYpaytPDy1mtgrd1VYuHxt10bX4kvf6EruSXin4Q1
	5UmO3YArO8BPXCPdyp/M4jbnlEzlYnQiIbA759T/eHY/zlJcwd8CvobJIz2DGVi7L/fYpc
	pJt3KOFudJK5WW6vCJEup/RIwANf7XDecTgyuhNwAB6JSmHsCwJiL28arcwDSA9W49pkO3
	HOWGHDc+OkM4F6/NJ3d3sD7oxXM4yL+rHzkDrAvJC5oOcHrBdNoi4fz4oQj0bhkSkqiH/+
	VgKBpZ0R+LsmYuHGgrh0GAtd8YIBr1g14M7esHGJVeMUJ3q/h1VQK4QxbhGzPw==
From: Stefan Roese <stefan.roese@mailbox.org>
To: linux-remoteproc@vger.kernel.org
Cc: Tanmay Shah <tanmay.shah@amd.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: [PATCH] remoteproc: xlnx: Use high-prio workqueue instead of system wq
Date: Thu, 27 Nov 2025 14:07:12 +0100
Message-ID: <20251127130712.1190765-1-stefan.roese@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 3i8pczc3maioeap6w6uayz9ru7hqxqqs
X-MBO-RS-ID: 3e19082f2e908c474eb

Testing on our ZynqMP platform has shown, that some R5 messages might
get dropped under high CPU load. This patch creates a new high-prio
workqueue which is now used instead of the default system workqueue.
With this change we don't experience these message drops any more.

Signed-off-by: Stefan Roese <stefan.roese@mailbox.org>
Cc: Tanmay Shah <tanmay.shah@amd.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/xlnx_r5_remoteproc.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
index feca6de68da28..459373901c973 100644
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
@@ -1194,12 +1204,21 @@ static int zynqmp_r5_remoteproc_probe(struct platform_device *pdev)
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
 		kfree(cluster);
+		destroy_workqueue(cluster->workqueue);
 		platform_set_drvdata(pdev, NULL);
 		dev_err_probe(dev, ret, "Invalid r5f subsystem device tree\n");
 		return ret;
-- 
2.52.0

