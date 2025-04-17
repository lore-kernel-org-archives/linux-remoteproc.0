Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2E8257450;
	Thu, 17 Apr 2025 18:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744914083; cv=none; b=PVPSJT9RyOmiOVyDeNIgoQwUzDt9dGRAcRlsFXlFYjEuibRcPPOQ+utY1QFG60IDdRWwp1lw2JXMfe5aaJ7XeLdDxacej0512YgQnGWHrfmOukAPZVA9K5n8u5YSKU6P+6rxl78mCGk9PfRTxV+z3qFhVrW7yCEccSIGFDjxRes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744914083; c=relaxed/simple;
	bh=IWqN75pxkqxm/e74yZMcOQKrxE4ObDLxAVo0YgCDtoo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p9W7C480oDAsg1vSJKiM0ornqdxiwnp9oeDaRAmSu3tyw+i9SVhj/9NJcu/Fa+Dv+4qK8vaAS9FjiBXwgcS2OEZM9xGf4r6CZKcGtE6Tp4gvMnHBsfeUxjA66OU47wLYmXZ3zeUHWuGYT4EPw5po4BR7261o4KQ22NZK+Oh6g4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=vdBmAYyb; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="vdBmAYyb"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53HILDR5776051
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Apr 2025 13:21:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744914073;
	bh=Vu9oT/cRBaoNf7Yqv1Td4f245TxrhdX+oLijXhc/eI4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=vdBmAYyboBnQem1ZImRC9ltseY7W0ch5+CSKPBO4sQvU112BQ8ILXcmOr7v+xLYWn
	 uovdhJ5lPAph+GXyCeymgZuzqjmB7oCmLpmjaEuNHhPB6EGkbdUhIMDFAi6riY3B9t
	 M/rVfTW6Swk/ndNe8Uks5UWqIM5MHd8dPRW02SIM=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53HILDl3028353
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 17 Apr 2025 13:21:13 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 17
 Apr 2025 13:21:13 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 17 Apr 2025 13:21:13 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53HIK1I2071102;
	Thu, 17 Apr 2025 13:21:09 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v10 18/33] remoteproc: k3-m4: Ping the mbox while acquiring the channel
Date: Thu, 17 Apr 2025 23:49:46 +0530
Message-ID: <20250417182001.3903905-19-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250417182001.3903905-1-b-padhi@ti.com>
References: <20250417182001.3903905-1-b-padhi@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

The TI K3 M4 remoteproc driver acquires the mailbox channel in probe but
sends a message through the acquired channel later in .attach()/.start()
callbacks.

Put both the things together in the form of 'k3_m4_rproc_request_mbox()'
function and invoke that in the probe routine. This is done to align the
rproc_request_mbox() implementation with R5 and DSP drivers which can be
factored out at a later stage.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
v10: Changelog:
1. Split [v9 14/26] into [v10 18/33] and [v10 19/33] patches. 

Link to v9:
https://lore.kernel.org/all/20250317120622.1746415-15-b-padhi@ti.com/

 drivers/remoteproc/ti_k3_m4_remoteproc.c | 39 +++++++++++-------------
 1 file changed, 18 insertions(+), 21 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
index a8a5211bf0c7f..a59fa835d8de6 100644
--- a/drivers/remoteproc/ti_k3_m4_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_m4_remoteproc.c
@@ -21,11 +21,24 @@
 #include "ti_sci_proc.h"
 #include "ti_k3_common.h"
 
-static int k3_m4_rproc_ping_mbox(struct k3_rproc *kproc)
+static int k3_m4_rproc_request_mbox(struct rproc *rproc)
 {
+	struct k3_rproc *kproc = rproc->priv;
+	struct mbox_client *client = &kproc->client;
 	struct device *dev = kproc->dev;
 	int ret;
 
+	client->dev = dev;
+	client->tx_done = NULL;
+	client->rx_callback = k3_rproc_mbox_callback;
+	client->tx_block = false;
+	client->knows_txdone = false;
+
+	kproc->mbox = mbox_request_channel(client, 0);
+	if (IS_ERR(kproc->mbox))
+		return dev_err_probe(dev, PTR_ERR(kproc->mbox),
+				     "mbox_request_channel failed\n");
+
 	/*
 	 * Ping the remote processor, this is only for sanity-sake for now;
 	 * there is no functional effect whatsoever.
@@ -36,6 +49,7 @@ static int k3_m4_rproc_ping_mbox(struct k3_rproc *kproc)
 	ret = mbox_send_message(kproc->mbox, (void *)RP_MBOX_ECHO_REQUEST);
 	if (ret < 0) {
 		dev_err(dev, "mbox_send_message failed: %d\n", ret);
+		mbox_free_channel(kproc->mbox);
 		return ret;
 	}
 
@@ -350,10 +364,6 @@ static int k3_m4_rproc_start(struct rproc *rproc)
 	struct device *dev = kproc->dev;
 	int ret;
 
-	ret = k3_m4_rproc_ping_mbox(kproc);
-	if (ret)
-		return ret;
-
 	ret = k3_rproc_release(kproc);
 	if (ret)
 		dev_err(dev, "local-reset deassert failed, ret = %d\n", ret);
@@ -383,13 +393,6 @@ static int k3_m4_rproc_stop(struct rproc *rproc)
  */
 static int k3_m4_rproc_attach(struct rproc *rproc)
 {
-	struct k3_rproc *kproc = rproc->priv;
-	int ret;
-
-	ret = k3_m4_rproc_ping_mbox(kproc);
-	if (ret)
-		return ret;
-
 	return 0;
 }
 
@@ -496,15 +499,9 @@ static int k3_m4_rproc_probe(struct platform_device *pdev)
 		dev_info(dev, "configured M4F for remoteproc mode\n");
 	}
 
-	kproc->client.dev = dev;
-	kproc->client.tx_done = NULL;
-	kproc->client.rx_callback = k3_rproc_mbox_callback;
-	kproc->client.tx_block = false;
-	kproc->client.knows_txdone = false;
-	kproc->mbox = mbox_request_channel(&kproc->client, 0);
-	if (IS_ERR(kproc->mbox))
-		return dev_err_probe(dev, PTR_ERR(kproc->mbox),
-				     "mbox_request_channel failed\n");
+	ret = k3_m4_rproc_request_mbox(rproc);
+	if (ret)
+		return ret;
 
 	ret = devm_rproc_add(dev, rproc);
 	if (ret)
-- 
2.34.1

