Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A522BEC45;
	Tue, 18 Aug 2026 10:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787047938; cv=none; b=Ipvfz7fjULpNi6cyRquOh2a7Fgio/n9iiV4f9q0dL1Wma1G2Ln9/+Z2hJOdS17s+wAzHHFSm5Fyf4TMOAgGO73U10lWhXmh86vXyvv/gg7pjFS+SGCVP3Bq+JJPJoiqVPYCBacY/MRIbTB+bDfJBsNExDa9k2kI1BpvFfs0UUv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787047938; c=relaxed/simple;
	bh=M8WnBADrs36FeNrBmeaF4amARZJ7jbPoQycXSMBjQXk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eAvAYea5t1A6jHdpsFIKt8BL8sl1k/T1nwl67A6T2TmWBm8XJ5y/UovZD5stNU8+81FBatf0ExqDtxFmVXlXDOp9VcxoYn4fGJ8F6XjKAx+hkmHeTfiCWHC4ZAdVC3evd2zh34AbkPqno4uwGTb2RhH0Lz8heF/LhCk3tv7JPLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=M8hIkm9G; arc=none smtp.client-ip=45.254.49.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="M8hIkm9G"
Received: from PC-202605011814.localdomain (unknown [222.191.246.242])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4a66b0a0a;
	Tue, 18 Aug 2026 18:12:08 +0800 (GMT+08:00)
From: Runyu Xiao <runyu.xiao@seu.edu.cn>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Tanmay Shah <tanmay.shah@amd.com>,
	Jianhao Xu <jianhao.xu@seu.edu.cn>,
	Runyu Xiao <runyu.xiao@seu.edu.cn>,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v3] remoteproc: xlnx: initialize mailbox work before requesting channels
Date: Tue, 18 Aug 2026 18:12:01 +0800
Message-Id: <20260818101201.1603947-1-runyu.xiao@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260619074835.2069212-1-runyu.xiao@seu.edu.cn>
References: <20260619074835.2069212-1-runyu.xiao@seu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa0145b642203a1kunm8b1f824210b154
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZTx0dVklISUxJSRkaSEsYTFYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUlVSkJKVUlPTVVJT0lZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pPSExVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=M8hIkm9G5iWD6HCy9ZUGrhhXgx3uqF9J/9smD2lM7CMGIGPNGbYGTi/v86O541QWVOLcduadl1NrWnfkvl3ei2+8LKLcd9n/t5jBaBpybN4nzZwla553JcLc1L4qj0KQ0MibbS5BSWyFbc7iOxsriLib/mRGW9G9xwyO//GiMrY=; c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1;
	bh=Al4GIDgElN7vobz7SNAE7nvT1kt+CjojK1tOK6HONrk=;
	h=date:mime-version:subject:message-id:from;

zynqmp_r5_setup_mbox() installs zynqmp_r5_mb_rx_cb() as the mailbox RX
callback before requesting the mailbox channels, but initializes
ipi->mbox_work only after both channels have been requested. Once the RX
channel is active, a notification delivered before the late INIT_WORK()
would make the callback queue an uninitialized work item.

Initialize the work item before requesting channels. Also drain the work
before freeing the mailbox state, after the channels have been released so
no new callbacks can queue it. Use the same drain before freeing ipi from
the channel request error paths, since the callback is already published
there as well.

This issue was found by our static analysis tool and then confirmed by
manual review of the mailbox setup sequence. The callback is published
before the channel requests complete, so the work item should be ready
before the mailbox provider can invoke it.

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
Changes in v3:
- Follow Mathieu's feedback and call cancel_work_sync() before freeing ipi
  from the tx/rx channel request error paths.

Changes in v2:
- Follow Tanmay's suggestion and keep zynqmp_r5_setup_mbox() taking the
  child device pointer. Do not move the r5_core assignment in this patch.
- Only move INIT_WORK() before channel requests and drain the work in
  zynqmp_r5_free_mbox().

 drivers/remoteproc/xlnx_r5_remoteproc.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
index c685bb5fa62c..d47fbf143acd 100644
--- a/drivers/remoteproc/xlnx_r5_remoteproc.c
+++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
@@ -318,6 +318,8 @@ static struct mbox_info *zynqmp_r5_setup_mbox(struct device *cdev)
 	if (!ipi)
 		return NULL;
 
+	INIT_WORK(&ipi->mbox_work, handle_event_notified);
+
 	mbox_cl = &ipi->mbox_cl;
 	mbox_cl->rx_callback = zynqmp_r5_mb_rx_cb;
 	mbox_cl->tx_block = false;
@@ -329,6 +331,7 @@ static struct mbox_info *zynqmp_r5_setup_mbox(struct device *cdev)
 	ipi->tx_chan = mbox_request_channel_byname(mbox_cl, "tx");
 	if (IS_ERR(ipi->tx_chan)) {
 		ipi->tx_chan = NULL;
+		cancel_work_sync(&ipi->mbox_work);
 		kfree(ipi);
 		dev_warn(cdev, "mbox tx channel request failed\n");
 		return NULL;
@@ -339,13 +342,12 @@ static struct mbox_info *zynqmp_r5_setup_mbox(struct device *cdev)
 		mbox_free_channel(ipi->tx_chan);
 		ipi->rx_chan = NULL;
 		ipi->tx_chan = NULL;
+		cancel_work_sync(&ipi->mbox_work);
 		kfree(ipi);
 		dev_warn(cdev, "mbox rx channel request failed\n");
 		return NULL;
 	}
 
-	INIT_WORK(&ipi->mbox_work, handle_event_notified);
-
 	return ipi;
 }
 
@@ -364,6 +366,8 @@ static void zynqmp_r5_free_mbox(struct mbox_info *ipi)
 		ipi->rx_chan = NULL;
 	}
 
+	cancel_work_sync(&ipi->mbox_work);
+
 	kfree(ipi);
 }
 
-- 
2.34.1

