Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37751C4707F
	for <linux-remoteproc@archiver.kernel.org>; Sat, 22 May 2021 00:03:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 14A3361400
	for <linux-remoteproc@archiver.kernel.org>; Sat, 22 May 2021 00:03:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230286AbhEVAFE (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 21 May 2021 20:05:04 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:58118 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230218AbhEVAE7 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 21 May 2021 20:04:59 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14M03WiY027087;
        Fri, 21 May 2021 19:03:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1621641812;
        bh=Cpe71/1OjMn9ENalzp/cvTOoQ//AV7b3M2sCv73YsCM=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=YPzrZldrpkHG33Rz5iK2I2Y9oN6Q0JAAtzuKheJ2yeoHa+K7f9Q1HAREJfc7LtAIP
         eYsyjsUrO8UL1pl7vmcYAQsFCy3/UI39kalEm42OlfjYcwJbiZ0rJxr+MVg/U9CkxC
         jcuBt2Hqc9zv/AX5dZxqvLD+xY1fLufjdZ02MQ7U=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14M03WD1048663
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 21 May 2021 19:03:32 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 21
 May 2021 19:03:31 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 21 May 2021 19:03:31 -0500
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com [10.247.120.73])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14M03VZ9065047;
        Fri, 21 May 2021 19:03:31 -0500
Received: from localhost ([10.250.35.153])
        by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id 14M03V2v091556;
        Fri, 21 May 2021 19:03:31 -0500
From:   Suman Anna <s-anna@ti.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     Lokesh Vutla <lokeshvutla@ti.com>, Tero Kristo <kristo@kernel.org>,
        <linux-remoteproc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH 5/6] remoteproc: k3-dsp: Refactor mbox request code in start
Date:   Fri, 21 May 2021 19:03:08 -0500
Message-ID: <20210522000309.26134-6-s-anna@ti.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210522000309.26134-1-s-anna@ti.com>
References: <20210522000309.26134-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Refactor out the mailbox request and associated ping logic code
from k3_dsp_rproc_start() function into its own separate function
so that it can be re-used in the soon to be added .attach() ops
callback.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 65 ++++++++++++++---------
 1 file changed, 39 insertions(+), 26 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
index fd4eb67a6681..faf60a274e8d 100644
--- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
@@ -216,6 +216,43 @@ static int k3_dsp_rproc_release(struct k3_dsp_rproc *kproc)
 	return ret;
 }
 
+static int k3_dsp_rproc_request_mbox(struct rproc *rproc)
+{
+	struct k3_dsp_rproc *kproc = rproc->priv;
+	struct mbox_client *client = &kproc->client;
+	struct device *dev = kproc->dev;
+	int ret;
+
+	client->dev = dev;
+	client->tx_done = NULL;
+	client->rx_callback = k3_dsp_rproc_mbox_callback;
+	client->tx_block = false;
+	client->knows_txdone = false;
+
+	kproc->mbox = mbox_request_channel(client, 0);
+	if (IS_ERR(kproc->mbox)) {
+		ret = -EBUSY;
+		dev_err(dev, "mbox_request_channel failed: %ld\n",
+			PTR_ERR(kproc->mbox));
+		return ret;
+	}
+
+	/*
+	 * Ping the remote processor, this is only for sanity-sake for now;
+	 * there is no functional effect whatsoever.
+	 *
+	 * Note that the reply will _not_ arrive immediately: this message
+	 * will wait in the mailbox fifo until the remote processor is booted.
+	 */
+	ret = mbox_send_message(kproc->mbox, (void *)RP_MBOX_ECHO_REQUEST);
+	if (ret < 0) {
+		dev_err(dev, "mbox_send_message failed: %d\n", ret);
+		mbox_free_channel(kproc->mbox);
+		return ret;
+	}
+
+	return 0;
+}
 /*
  * The C66x DSP cores have a local reset that affects only the CPU, and a
  * generic module reset that powers on the device and allows the DSP internal
@@ -273,37 +310,13 @@ static int k3_dsp_rproc_unprepare(struct rproc *rproc)
 static int k3_dsp_rproc_start(struct rproc *rproc)
 {
 	struct k3_dsp_rproc *kproc = rproc->priv;
-	struct mbox_client *client = &kproc->client;
 	struct device *dev = kproc->dev;
 	u32 boot_addr;
 	int ret;
 
-	client->dev = dev;
-	client->tx_done = NULL;
-	client->rx_callback = k3_dsp_rproc_mbox_callback;
-	client->tx_block = false;
-	client->knows_txdone = false;
-
-	kproc->mbox = mbox_request_channel(client, 0);
-	if (IS_ERR(kproc->mbox)) {
-		ret = -EBUSY;
-		dev_err(dev, "mbox_request_channel failed: %ld\n",
-			PTR_ERR(kproc->mbox));
+	ret = k3_dsp_rproc_request_mbox(rproc);
+	if (ret)
 		return ret;
-	}
-
-	/*
-	 * Ping the remote processor, this is only for sanity-sake for now;
-	 * there is no functional effect whatsoever.
-	 *
-	 * Note that the reply will _not_ arrive immediately: this message
-	 * will wait in the mailbox fifo until the remote processor is booted.
-	 */
-	ret = mbox_send_message(kproc->mbox, (void *)RP_MBOX_ECHO_REQUEST);
-	if (ret < 0) {
-		dev_err(dev, "mbox_send_message failed: %d\n", ret);
-		goto put_mbox;
-	}
 
 	boot_addr = rproc->bootaddr;
 	if (boot_addr & (kproc->data->boot_align_addr - 1)) {
-- 
2.30.1

