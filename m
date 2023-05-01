Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3740AC77B61
	for <linux-remoteproc@archiver.kernel.org>; Mon,  1 May 2023 03:16:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233039AbjEADQs (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sun, 30 Apr 2023 23:16:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233885AbjEADQY (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sun, 30 Apr 2023 23:16:24 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6815965A0;
        Sun, 30 Apr 2023 20:07:08 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 42BE96173A;
        Mon,  1 May 2023 03:05:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C05CC4339E;
        Mon,  1 May 2023 03:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1682910355;
        bh=L7TaH2CVnBpQ3FgRQFzJASy56Np5ekKgT/J9X7fsE+A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=VrknC49X/Fri5KbYQ6+XLNmQRFRUeQxFI0SwoQ/U3PKlxmObPEAlNlyA8EmYf83jV
         CrOwcedalcZ6t0gY1R/Wqr1Vt3dnikokSrsTTs40/LgPy5/thIwUF8gV6men4EBtOJ
         Nmx0ZVj5ft6r85dbwIFAc19bLWRNFGtcPc4bivDqHBv7ytSs9+DlZ7h6ZTmvqDDFCC
         Luq8jqKtvhLTJ6LlAbhQc4iPjWEw4Gt0nfohBXle8AnuRKd4ixkDiRHNUQnvkt2cb4
         AJ8eK1YIbmlM4sw/53/EEu/ptbVfXtNrjoCt2oh0PnRK4gim5dRnK7uWbdaCFTNfkA
         lFy3zeg7crosA==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Sasha Levin <sashal@kernel.org>, andersson@kernel.org,
        mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
        linux-remoteproc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 5.10 07/12] remoteproc: stm32_rproc: Add mutex protection for workqueue
Date:   Sun, 30 Apr 2023 23:05:33 -0400
Message-Id: <20230501030540.3254928-7-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230501030540.3254928-1-sashal@kernel.org>
References: <20230501030540.3254928-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>

[ Upstream commit 35bdafda40cc343ad2ba2cce105eba03a70241cc ]

The workqueue may execute late even after remoteproc is stopped or
stopping, some resources (rpmsg device and endpoint) have been
released in rproc_stop_subdevices(), then rproc_vq_interrupt()
accessing these resources will cause kernel dump.

Call trace:
virtqueue_add_inbuf
virtqueue_add_inbuf
rpmsg_recv_single
rpmsg_recv_done
vring_interrupt
stm32_rproc_mb_vq_work
process_one_work
worker_thread
kthread

Suggested-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Link: https://lore.kernel.org/r/20230331160634.3113031-1-arnaud.pouliquen@foss.st.com
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/remoteproc/stm32_rproc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index d2414cc1d90d6..659b747e182d5 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -297,8 +297,16 @@ static void stm32_rproc_mb_vq_work(struct work_struct *work)
 	struct stm32_mbox *mb = container_of(work, struct stm32_mbox, vq_work);
 	struct rproc *rproc = dev_get_drvdata(mb->client.dev);
 
+	mutex_lock(&rproc->lock);
+
+	if (rproc->state != RPROC_RUNNING)
+		goto unlock_mutex;
+
 	if (rproc_vq_interrupt(rproc, mb->vq_id) == IRQ_NONE)
 		dev_dbg(&rproc->dev, "no message found in vq%d\n", mb->vq_id);
+
+unlock_mutex:
+	mutex_unlock(&rproc->lock);
 }
 
 static void stm32_rproc_mb_callback(struct mbox_client *cl, void *data)
-- 
2.39.2

