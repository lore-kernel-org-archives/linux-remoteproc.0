Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D070E1FA859;
	Fri, 19 Jun 2026 07:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781855636; cv=none; b=OQZ4c8JesvpIhnMibuYvfkQNXsp3xTlbKGTGIX+NoIlNxHdRysMufOuKGmD7wBLF0o0uVkXVB5u8VckksRHH/HxxbGvMsc5jLBZgNHb32kXPkvZnmTp3qJUsDjN+e12qpbyP0mgKLTM/TY4gT3gxZTJCLCGXUgnPUVqSu56qyn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781855636; c=relaxed/simple;
	bh=UBXHAPP+hQrDuWZmNqGyV+p4pHZMtTOacny26jskYzg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ikBCHRE2MF8VmDahXB7C1EU1KwB8rSzremB5xf5d77n+SdHxFyufcgtT2nnPU/2Qi075yKwsQxydNQYx+4NcI54c7+amESLa1czf6fv9cNNRsJD3gwcz3i3KSKv/WZrHreHg3c23Dh59YUs1Ugck0vYOdPEH0TVvpB5FgZyXMGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=NYnOfL0Y; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="NYnOfL0Y"
Received: from PC-202605011814.localdomain (unknown [223.112.146.162])
	by smtp.qiye.163.com (Hmail) with ESMTP id 43016251a;
	Fri, 19 Jun 2026 15:48:39 +0800 (GMT+08:00)
From: Runyu Xiao <runyu.xiao@seu.edu.cn>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Tanmay Shah <tanmay.shah@amd.com>,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Runyu Xiao <runyu.xiao@seu.edu.cn>
Subject: [RFC PATCH] remoteproc: xlnx: initialize mailbox work before requesting channels
Date: Fri, 19 Jun 2026 15:48:35 +0800
Message-Id: <20260619074835.2069212-1-runyu.xiao@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9ededa762c03a1kunm2b1063b5c4610
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDTE0eVhpDSk4YGE9OHR9JSVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUhVSkpJVUpPTVVKTUlZV1kWGg8SFR0UWUFZT0tIVUpLSU
	hOQ0NVSktLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=NYnOfL0YbdhG4ex5ERLjwGzaqs8sY79fZ0/qf+p+FTWXORktGIc+V2J2ChH3OISi6ou1LHn4WFXIzA7TJbTqe/S7N216xq/KXxT3NQ7IYUNvSljtfSBrLr4LyUSeQo6AtKsEqtU/wpYqrwCDg9ktdg+QuW8X4lfdmpUaChb5H1o=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=iIzLlE7ECp6eW9LE+Henrqq8cvmWcrhpXy/HnPIcZCM=;
	h=date:mime-version:subject:message-id:from;

zynqmp_r5_setup_mbox() installs zynqmp_r5_mb_rx_cb() as the mailbox RX
callback before requesting the mailbox channels, but initializes
ipi->mbox_work only after both channels have been requested. Once the RX
channel is active, a notification delivered before the late INIT_WORK()
would make the callback queue an uninitialized work item.

Initialize the work item and its owning R5 core pointer before requesting
channels. Also drain the work before freeing the mailbox state, after the
channels have been released so no new callbacks can queue it.

This issue was found by our static analysis tool and then confirmed by
manual review of the mailbox setup sequence. The callback is published
before the channel requests complete, so the work item and the state used
by the work handler should be ready before the mailbox provider can invoke
it.

A QEMU PoC modeled a mailbox notification delivered after the RX callback
became reachable but before the delayed INIT_WORK(). DEBUG_OBJECTS reported
queueing an uninitialized work item from the zynqmp_r5_setup_mbox() path.

This is sent as an RFC because the practical trigger depends on the ZynqMP
IPI mailbox provider and firmware delivery timing. If the provider cannot
invoke the RX callback until after setup returns, this is a defensive
lifecycle cleanup rather than a reachable race on current systems.

Fixes: 5dfb28c257b7 ("remoteproc: xilinx: Add mailbox channels for rpmsg")
Signed-off-by: Runyu Xiao <runyu.xiao@seu.edu.cn>
---
 drivers/remoteproc/xlnx_r5_remoteproc.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
index 0b7b173d0d26..1477fc542afb 100644
--- a/drivers/remoteproc/xlnx_r5_remoteproc.c
+++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
@@ -260,8 +260,9 @@ static void zynqmp_r5_mb_rx_cb(struct mbox_client *cl, void *msg)
  * Function to setup mailboxes related properties
  * return : NULL if failed else pointer to mbox_info
  */
-static struct mbox_info *zynqmp_r5_setup_mbox(struct device *cdev)
+static struct mbox_info *zynqmp_r5_setup_mbox(struct zynqmp_r5_core *r5_core)
 {
+	struct device *cdev = r5_core->dev;
 	struct mbox_client *mbox_cl;
 	struct mbox_info *ipi;
 
@@ -269,6 +270,9 @@ static struct mbox_info *zynqmp_r5_setup_mbox(struct device *cdev)
 	if (!ipi)
 		return NULL;
 
+	ipi->r5_core = r5_core;
+	INIT_WORK(&ipi->mbox_work, handle_event_notified);
+
 	mbox_cl = &ipi->mbox_cl;
 	mbox_cl->rx_callback = zynqmp_r5_mb_rx_cb;
 	mbox_cl->tx_block = false;
@@ -295,8 +299,6 @@ static struct mbox_info *zynqmp_r5_setup_mbox(struct device *cdev)
 		return NULL;
 	}
 
-	INIT_WORK(&ipi->mbox_work, handle_event_notified);
-
 	return ipi;
 }
 
@@ -315,6 +317,8 @@ static void zynqmp_r5_free_mbox(struct mbox_info *ipi)
 		ipi->rx_chan = NULL;
 	}
 
+	cancel_work_sync(&ipi->mbox_work);
+
 	kfree(ipi);
 }
 
@@ -1388,10 +1392,9 @@ static int zynqmp_r5_cluster_init(struct zynqmp_r5_cluster *cluster)
 		 * If mailbox nodes are disabled using "status" property then
 		 * setting up mailbox channels will fail.
 		 */
-		ipi = zynqmp_r5_setup_mbox(&child_pdev->dev);
+		ipi = zynqmp_r5_setup_mbox(r5_cores[i]);
 		if (ipi) {
 			r5_cores[i]->ipi = ipi;
-			ipi->r5_core = r5_cores[i];
 		}
 
 		/*
-- 
2.34.1

