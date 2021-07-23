Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87DFBC4338F
	for <linux-remoteproc@archiver.kernel.org>; Fri, 23 Jul 2021 22:04:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6DF5C60EB2
	for <linux-remoteproc@archiver.kernel.org>; Fri, 23 Jul 2021 22:04:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232752AbhGWVXt (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 23 Jul 2021 17:23:49 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:46776 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232401AbhGWVXt (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 23 Jul 2021 17:23:49 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 16NM4JDH057161;
        Fri, 23 Jul 2021 17:04:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1627077859;
        bh=ZybSNZX/9JAUhBg+wT2kJcY3NWdaER9Mhvfy0Uumon8=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=NaTxqbXlxAJPPNJQkTJC2m8FSWalmnkrjk5eyfp30uJFohFH6bMQtO0UtQl6IJ7mt
         ua3jI7BDR/h79wmUevMMumVzfPVhpne0HmUSSl3P/CyqGJVkelPRJip/XrWqyUp1NK
         2WI/3IYoQosbSZ0UTKiDj3Ki9X0wZYU6EGUiWAsY=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 16NM4Jua067186
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 23 Jul 2021 17:04:19 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 23
 Jul 2021 17:02:50 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 23 Jul 2021 17:02:50 -0500
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com [10.247.120.73])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 16NM2o6t112954;
        Fri, 23 Jul 2021 17:02:50 -0500
Received: from localhost ([10.250.38.176])
        by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id 16NM2o4N126731;
        Fri, 23 Jul 2021 17:02:50 -0500
From:   Suman Anna <s-anna@ti.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     Lokesh Vutla <lokeshvutla@ti.com>,
        Praneeth Bajjuri <praneeth@ti.com>,
        Hari Nagalla <hnagalla@ti.com>,
        <linux-remoteproc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH v2 2/5] remoteproc: k3-r5: Refactor mbox request code in start
Date:   Fri, 23 Jul 2021 17:02:45 -0500
Message-ID: <20210723220248.6554-3-s-anna@ti.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210723220248.6554-1-s-anna@ti.com>
References: <20210723220248.6554-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Refactor out the mailbox request and associated ping logic code
from k3_r5_rproc_start() function into its own separate function
so that it can be re-used in the soon to be added .attach() ops
callback.

Signed-off-by: Suman Anna <s-anna@ti.com>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
v2: No code changes, picked up Reviewed-by tags
v1: https://patchwork.kernel.org/project/linux-remoteproc/patch/20210522000309.26134-4-s-anna@ti.com/

 drivers/remoteproc/ti_k3_r5_remoteproc.c | 66 ++++++++++++++----------
 1 file changed, 40 insertions(+), 26 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
index 71615210df3e..03f930758b2d 100644
--- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
@@ -376,6 +376,44 @@ static inline int k3_r5_core_run(struct k3_r5_core *core)
 				       0, PROC_BOOT_CTRL_FLAG_R5_CORE_HALT);
 }
 
+static int k3_r5_rproc_request_mbox(struct rproc *rproc)
+{
+	struct k3_r5_rproc *kproc = rproc->priv;
+	struct mbox_client *client = &kproc->client;
+	struct device *dev = kproc->dev;
+	int ret;
+
+	client->dev = dev;
+	client->tx_done = NULL;
+	client->rx_callback = k3_r5_rproc_mbox_callback;
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
+
 /*
  * The R5F cores have controls for both a reset and a halt/run. The code
  * execution from DDR requires the initial boot-strapping code to be run
@@ -495,38 +533,14 @@ static int k3_r5_rproc_start(struct rproc *rproc)
 {
 	struct k3_r5_rproc *kproc = rproc->priv;
 	struct k3_r5_cluster *cluster = kproc->cluster;
-	struct mbox_client *client = &kproc->client;
 	struct device *dev = kproc->dev;
 	struct k3_r5_core *core;
 	u32 boot_addr;
 	int ret;
 
-	client->dev = dev;
-	client->tx_done = NULL;
-	client->rx_callback = k3_r5_rproc_mbox_callback;
-	client->tx_block = false;
-	client->knows_txdone = false;
-
-	kproc->mbox = mbox_request_channel(client, 0);
-	if (IS_ERR(kproc->mbox)) {
-		ret = -EBUSY;
-		dev_err(dev, "mbox_request_channel failed: %ld\n",
-			PTR_ERR(kproc->mbox));
+	ret = k3_r5_rproc_request_mbox(rproc);
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
 	/* TODO: add boot_addr sanity checking */
-- 
2.32.0

