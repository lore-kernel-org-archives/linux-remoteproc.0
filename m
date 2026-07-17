Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7668A18FDDE;
	Fri, 17 Jul 2026 02:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784255485; cv=none; b=nSpWwUCDlqNQlBfIoTzDNCmsPon3pDdnn4sk/gn3EDOv7ptj0x0DKo8+v3J7zm/Wa3cZhsI/rOm1c8o+YT/x4cL9dtKQMOjXFmczBOFy0ekFsEsKYjkpaoMxuu/bF9jlwa2kwerI3fsSA5CUANLckyYcTBUMol60kX02Getf3L0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784255485; c=relaxed/simple;
	bh=8UNfSkQ/lo+3RzytxmFNw/DwEd/7+2gwxlKGFTRPp70=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Dv3J0OoupBHc7yJGBHrwD3MCQaixxpdjgAm/wFaK4TDmYb3nxZggBhzYppGrStv6E2gHvVayz7SOLHUeHAFd50cHyBGV5lBVdFxYgFjAPDjg4M6wAbf/GmMQegGu+jRwBko1e1GkK1ubmZCZMTeV4cfmFHMkdkVdo5ubLtLGdQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=Dz3sc9qC; arc=none smtp.client-ip=45.254.49.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="Dz3sc9qC"
Received: from PC-202605011814.localdomain (unknown [58.241.16.34])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4684dd695;
	Fri, 17 Jul 2026 10:31:15 +0800 (GMT+08:00)
From: Runyu Xiao <runyu.xiao@seu.edu.cn>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Tanmay Shah <tanmay.shah@amd.com>,
	Jianhao Xu <jianhao.xu@seu.edu.cn>,
	Runyu Xiao <runyu.xiao@seu.edu.cn>,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2] remoteproc: xlnx: initialize mailbox work before requesting channels
Date: Fri, 17 Jul 2026 10:31:08 +0800
Message-Id: <20260717023108.4191518-1-runyu.xiao@seu.edu.cn>
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
X-HM-Tid: 0a9f6de9f0a703a1kunm0b44854c1fc95
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZTx0eVkgaTBlNHkhCGE9KHVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlOQ1VJT0pVSk1VSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpPSE
	xVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=Dz3sc9qCqSis/kMzFti1aIPbBDTz2aNQfEjICYPz/tGtZoP2rnntiBmFZRLoIwfTRFMgut9jLZoBOygpTXsDo4XmkFIJUyb2JGqvj6bG6YRMlzmXxaLrnfOpbD42ouI+LtE/N0OTlX/7yqkEJlO/rdzLd/nu8SELN20rQUzpXNI=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=08fv89TCTjg4EZWjHu4je72N/2yjQhrc4zHzUhEf0yM=;
	h=date:mime-version:subject:message-id:from;

zynqmp_r5_setup_mbox() installs zynqmp_r5_mb_rx_cb() as the mailbox RX
callback before requesting the mailbox channels, but initializes
ipi->mbox_work only after both channels have been requested. Once the RX
channel is active, a notification delivered before the late INIT_WORK()
would make the callback queue an uninitialized work item.

Initialize the work item before requesting channels. Also drain the work
before freeing the mailbox state, after the channels have been released so
no new callbacks can queue it.

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
Changes in v2:
- Follow Tanmay's suggestion and keep zynqmp_r5_setup_mbox() taking the
  child device pointer. Do not move the r5_core assignment in this patch.
- Only move INIT_WORK() before channel requests and drain the work in
  zynqmp_r5_free_mbox().

 drivers/remoteproc/xlnx_r5_remoteproc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
index 3349d1877751..e36918b8d234 100644
--- a/drivers/remoteproc/xlnx_r5_remoteproc.c
+++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
@@ -279,6 +279,8 @@ static struct mbox_info *zynqmp_r5_setup_mbox(struct device *cdev)
 	if (!ipi)
 		return NULL;
 
+	INIT_WORK(&ipi->mbox_work, handle_event_notified);
+
 	mbox_cl = &ipi->mbox_cl;
 	mbox_cl->rx_callback = zynqmp_r5_mb_rx_cb;
 	mbox_cl->tx_block = false;
@@ -305,8 +307,6 @@ static struct mbox_info *zynqmp_r5_setup_mbox(struct device *cdev)
 		return NULL;
 	}
 
-	INIT_WORK(&ipi->mbox_work, handle_event_notified);
-
 	return ipi;
 }
 
@@ -325,6 +325,8 @@ static void zynqmp_r5_free_mbox(struct mbox_info *ipi)
 		ipi->rx_chan = NULL;
 	}
 
+	cancel_work_sync(&ipi->mbox_work);
+
 	kfree(ipi);
 }
 
-- 
2.34.1

