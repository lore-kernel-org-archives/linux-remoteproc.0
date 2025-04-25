Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F53252914;
	Fri, 25 Apr 2025 10:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745577785; cv=none; b=m3b0PTh8g++hBHHJAcdcSTKtPvz+m2AU2AnoIfM1hLSCcyYed+U2ukVdULr1pskSwElULr3b4saLGNkmynxZqc7u8E5X0sKKskILtun02WVLB5MSCWvvrwuo6ZXLNj6Y1YXHXWEWD/rcMvWlXjlgxTu+qnJNnvPoEpVt7CWRPFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745577785; c=relaxed/simple;
	bh=/O4yIOYU1z/arUz2Dgpwl1p9Cbhlu8W6T3Ng5DRNhI4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MwR8bliBvtMcVgZssDQ+pUWVb8SJ3VWPmx3Upmex26P/yi5TthqmHjxyWKsQgmuIu999YRU+OnPLjlIP/1bTZSaVy+d/3T9Hlh0n5euTJMyRYz+ZymVnCeDRGVG2IYGxqlA17iaZjZgJ+Bj2EiTUX589MSF/vHQ1Zi8ur9JFVl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=eUO9WymB; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="eUO9WymB"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53PAguC62911107
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 05:42:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745577776;
	bh=O9vYn97KZ8rEqdbWMXhEm7lOBPFnsOG5Y5efnHn6OqE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=eUO9WymBG+VDoA39+NSkasFscfT91IA9+EzKDaQVjd2F5S2FTD/WN3lcJHbzsjV9z
	 nlq7pOutUM7194GGUenITYSy/10Yak6lTgXXyKAt30ok4oy1B1h4qZ/DNAwsUqw0KU
	 Qh/52PFmWTURge/LPhJ/tEqJ+Tqfl92ZbqJGzC2Y=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53PAguDv028173
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 25 Apr 2025 05:42:56 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 25
 Apr 2025 05:42:56 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 25 Apr 2025 05:42:56 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53PAfaZf038329;
	Fri, 25 Apr 2025 05:42:52 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v11 20/35] remoteproc: k3-m4: Ping the mbox while acquiring the channel
Date: Fri, 25 Apr 2025 16:11:20 +0530
Message-ID: <20250425104135.830255-21-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250425104135.830255-1-b-padhi@ti.com>
References: <20250425104135.830255-1-b-padhi@ti.com>
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
Tested-by: Judith Mendez <jm@ti.com>
---
v11: Changelog:
1. Carried T/B tag.

Link to v10:
https://lore.kernel.org/all/20250417182001.3903905-19-b-padhi@ti.com/

v10: Changelog:
1. Split [v9 14/26] into [v10 18/33] and [v10 19/33] patches. 

Link to v9:
https://lore.kernel.org/all/20250317120622.1746415-15-b-padhi@ti.com/

 drivers/remoteproc/ti_k3_m4_remoteproc.c | 44 ++++++++++--------------
 1 file changed, 19 insertions(+), 25 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
index aba3672facce0..0cc6c7b04e887 100644
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
 
@@ -347,15 +361,8 @@ static void k3_m4_release_tsp(void *data)
 static int k3_m4_rproc_start(struct rproc *rproc)
 {
 	struct k3_rproc *kproc = rproc->priv;
-	int ret;
-
-	ret = k3_m4_rproc_ping_mbox(kproc);
-	if (ret)
-		return ret;
-
-	ret = k3_rproc_release(kproc);
 
-	return ret;
+	return k3_rproc_release(kproc);
 }
 
 /*
@@ -380,13 +387,6 @@ static int k3_m4_rproc_stop(struct rproc *rproc)
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
 
@@ -493,15 +493,9 @@ static int k3_m4_rproc_probe(struct platform_device *pdev)
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

