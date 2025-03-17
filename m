Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF9F238169;
	Mon, 17 Mar 2025 12:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742213256; cv=none; b=OycsyYuKH44pEr8wIAxmB09KzFjJ+BxdO1vmkdTupfHxqyK6hCag/tAMzlKrrMWL64ccFcvKZaqk2HAwrL+PTp9/DgX9hEz8L0gqRuRlMnk0gBTNAqvJ53YVxjp1fEz0DbpaX72xVqoAhf8+nDeza53wBisKGomsjN91wtqPrTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742213256; c=relaxed/simple;
	bh=dwyeB45KixiI9Mswpt1UmS3KAWcchU777LsUqOmNcgk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HNiu3hgTgdXn1Hq+FLdPuR/wDpyAqNTNu1Ldg1LrRb0mDzeAScLFiYeaMbZxHLxZ1O9aSmoXou3TrLLgSouNNjeBZXvUWg65WnlpSHTH5Y0O4iTI/sjrIwYaGQ5WIgxYHB+tjRHOYH+VfaK96F0NqTUx4fjJoUPnY7lVnUkVcSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=R3ZgAoni; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="R3ZgAoni"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52HC7P6t2266875
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Mar 2025 07:07:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742213245;
	bh=FXylo7+1ZXRUB93KYMsehvOdYPVANZEXW1xj70ZzNPk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=R3ZgAonixS9gSHmss60piO+w4N9Tmm0aSSKXKXM78cp9KSJk1ppJ8UBoHa9Ouxzog
	 S1Q8qjMEpg6K9fJMGNSgu2GExORxLAxehhfltCBy7YSdxYlfME4QfjJSxsLxRp1v/v
	 deug0kPbeYmyUNAAYJd3UbpgpdgTNtFJw/NWKHyc=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52HC7P4p124251
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 17 Mar 2025 07:07:25 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 17
 Mar 2025 07:07:24 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 17 Mar 2025 07:07:23 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52HC6MKB060901;
	Mon, 17 Mar 2025 07:07:20 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v9 14/26] remoteproc: k3: Refactor rproc_request_mbox() implementations into common driver
Date: Mon, 17 Mar 2025 17:36:10 +0530
Message-ID: <20250317120622.1746415-15-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250317120622.1746415-1-b-padhi@ti.com>
References: <20250317120622.1746415-1-b-padhi@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

The k3_{r5/dsp}_rproc_request_mbox() function acquires the mailbox
channel and sends a message through the acquired channel. The TI K3 M4
remoteproc driver acquires the mailbox channel in probe and sends the
message later in .attach()/.start() callbacks. Refactor the
k3_{r5/dsp}_rproc_request_mbox() function into ti_k3_common.c as
k3_rproc_request_mbox() and align R5, DSP and M4 drivers to use this
common function during probe routine.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
 drivers/remoteproc/ti_k3_common.c         | 36 +++++++++++++++++++
 drivers/remoteproc/ti_k3_common.h         |  1 +
 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 36 +------------------
 drivers/remoteproc/ti_k3_m4_remoteproc.c  | 44 ++---------------------
 drivers/remoteproc/ti_k3_r5_remoteproc.c  | 37 +------------------
 5 files changed, 42 insertions(+), 112 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
index 3b1d041fec7b..5a39ce834a82 100644
--- a/drivers/remoteproc/ti_k3_common.c
+++ b/drivers/remoteproc/ti_k3_common.c
@@ -156,5 +156,41 @@ int k3_rproc_release(struct k3_rproc *kproc)
 }
 EXPORT_SYMBOL_GPL(k3_rproc_release);
 
+int k3_rproc_request_mbox(struct rproc *rproc)
+{
+	struct k3_rproc *kproc = rproc->priv;
+	struct mbox_client *client = &kproc->client;
+	struct device *dev = kproc->dev;
+	int ret;
+
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
+	/*
+	 * Ping the remote processor, this is only for sanity-sake for now;
+	 * there is no functional effect whatsoever.
+	 *
+	 * Note that the reply will _not_ arrive immediately: this message
+	 * will wait in the mailbox fifo until the remote processor is booted.
+	 */
+	ret = mbox_send_message(kproc->mbox, (void *)RP_MBOX_ECHO_REQUEST);
+	if (ret < 0) {
+		dev_err(dev, "mbox_send_message failed (%pe)\n", ERR_PTR(ret));
+		mbox_free_channel(kproc->mbox);
+		return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(k3_rproc_request_mbox);
+
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("TI K3 common Remoteproc code");
diff --git a/drivers/remoteproc/ti_k3_common.h b/drivers/remoteproc/ti_k3_common.h
index c1af39cd288c..721492fa0fb7 100644
--- a/drivers/remoteproc/ti_k3_common.h
+++ b/drivers/remoteproc/ti_k3_common.h
@@ -92,4 +92,5 @@ void k3_rproc_mbox_callback(struct mbox_client *client, void *data);
 void k3_rproc_kick(struct rproc *rproc, int vqid);
 int k3_rproc_reset(struct k3_rproc *kproc);
 int k3_rproc_release(struct k3_rproc *kproc);
+int k3_rproc_request_mbox(struct rproc *rproc);
 #endif /* REMOTEPROC_TI_K3_COMMON_H */
diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
index 577dcd65093a..d1d35f819c23 100644
--- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
@@ -24,40 +24,6 @@
 
 #define KEYSTONE_RPROC_LOCAL_ADDRESS_MASK	(SZ_16M - 1)
 
-static int k3_dsp_rproc_request_mbox(struct rproc *rproc)
-{
-	struct k3_rproc *kproc = rproc->priv;
-	struct mbox_client *client = &kproc->client;
-	struct device *dev = kproc->dev;
-	int ret;
-
-	client->dev = dev;
-	client->tx_done = NULL;
-	client->rx_callback = k3_rproc_mbox_callback;
-	client->tx_block = false;
-	client->knows_txdone = false;
-
-	kproc->mbox = mbox_request_channel(client, 0);
-	if (IS_ERR(kproc->mbox))
-		return dev_err_probe(dev, PTR_ERR(kproc->mbox),
-				     "mbox_request_channel failed\n");
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
-		dev_err(dev, "mbox_send_message failed (%pe)\n", ERR_PTR(ret));
-		mbox_free_channel(kproc->mbox);
-		return ret;
-	}
-
-	return 0;
-}
 /*
  * The C66x DSP cores have a local reset that affects only the CPU, and a
  * generic module reset that powers on the device and allows the DSP internal
@@ -443,7 +409,7 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
 	kproc->dev = dev;
 	kproc->data = data;
 
-	ret = k3_dsp_rproc_request_mbox(rproc);
+	ret = k3_rproc_request_mbox(rproc);
 	if (ret)
 		return ret;
 
diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
index a8a5211bf0c7..15e7943a12c1 100644
--- a/drivers/remoteproc/ti_k3_m4_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_m4_remoteproc.c
@@ -21,27 +21,6 @@
 #include "ti_sci_proc.h"
 #include "ti_k3_common.h"
 
-static int k3_m4_rproc_ping_mbox(struct k3_rproc *kproc)
-{
-	struct device *dev = kproc->dev;
-	int ret;
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
-		return ret;
-	}
-
-	return 0;
-}
-
 /*
  * The M4 cores have a local reset that affects only the CPU, and a
  * generic module reset that powers on the device and allows the internal
@@ -350,10 +329,6 @@ static int k3_m4_rproc_start(struct rproc *rproc)
 	struct device *dev = kproc->dev;
 	int ret;
 
-	ret = k3_m4_rproc_ping_mbox(kproc);
-	if (ret)
-		return ret;
-
 	ret = k3_rproc_release(kproc);
 	if (ret)
 		dev_err(dev, "local-reset deassert failed, ret = %d\n", ret);
@@ -383,13 +358,6 @@ static int k3_m4_rproc_stop(struct rproc *rproc)
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
 
@@ -496,15 +464,9 @@ static int k3_m4_rproc_probe(struct platform_device *pdev)
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
+	ret = k3_rproc_request_mbox(rproc);
+	if (ret)
+		return ret;
 
 	ret = devm_rproc_add(dev, rproc);
 	if (ret)
diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
index 36fffcf1e881..2bec94755e31 100644
--- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
@@ -284,41 +284,6 @@ static inline int k3_r5_core_run(struct k3_rproc *kproc)
 				       0, PROC_BOOT_CTRL_FLAG_R5_CORE_HALT);
 }
 
-static int k3_r5_rproc_request_mbox(struct rproc *rproc)
-{
-	struct k3_rproc *kproc = rproc->priv;
-	struct mbox_client *client = &kproc->client;
-	struct device *dev = kproc->dev;
-	int ret;
-
-	client->dev = dev;
-	client->tx_done = NULL;
-	client->rx_callback = k3_rproc_mbox_callback;
-	client->tx_block = false;
-	client->knows_txdone = false;
-
-	kproc->mbox = mbox_request_channel(client, 0);
-	if (IS_ERR(kproc->mbox))
-		return dev_err_probe(dev, PTR_ERR(kproc->mbox),
-				     "mbox_request_channel failed\n");
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
-		mbox_free_channel(kproc->mbox);
-		return ret;
-	}
-
-	return 0;
-}
-
 /*
  * The R5F cores have controls for both a reset and a halt/run. The code
  * execution from DDR requires the initial boot-strapping code to be run
@@ -1300,7 +1265,7 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
 		kproc = core->kproc;
 		rproc = kproc->rproc;
 
-		ret = k3_r5_rproc_request_mbox(rproc);
+		ret = k3_rproc_request_mbox(rproc);
 		if (ret)
 			return ret;
 
-- 
2.34.1

