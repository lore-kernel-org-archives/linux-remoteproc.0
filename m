Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9594A1F943F;
	Fri,  3 Jan 2025 10:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735899199; cv=none; b=XIFtdVblYyS21u4ooLdFIqWICmS/TBVfTcbF112b6E0vHDjHByYSPfoZ9BQ0qMuBZDfbP79/ml7y5ZbcDvO9VRTH3kh7VxRM4p3KLt4Je13mla0RNBKUsc+2bQCDv0EVVQ4hWr4PeZPngE/EPotqs1UqR8mkLmGmZ8KgHX/znF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735899199; c=relaxed/simple;
	bh=0NQkNgYmoCoPTHF3IqcIRO+FUsrsnggW6J/3BVgMcng=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pl0D/QarordNtsWrACAjVzcSKEuWe1jH38khzuC+VBvgecMvCgSy+dH2G1hapcJ9dYZEfK13m1qpwv7ZqsKvSiMqfsEDGiHezJUD3KyymnvBaZK7qXO5A7xtZCVPxZMTJ+81dprd3vytcL/r75VZixHt7VqZ+ENhdaU1QgxvBt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=A0hd0gtz; arc=none smtp.client-ip=198.47.19.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="A0hd0gtz"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 503AD5iW033596;
	Fri, 3 Jan 2025 04:13:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1735899185;
	bh=ZcbFZqP8Z4NUAMCntYlwy0RskYls8rWZ0AY3/2eX4Aw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=A0hd0gtzUTV5MNCa8NXZ5r8X15jVqkMDDhpnBNKUC25aEQep8ONbyJXrC+o+8f12O
	 evS3ollqq6uLquhc/H3TWoOBXP6tV6ZpVpD2uAj5kkl5v2BoRsXBXeRsN07Saf2Sm4
	 q3e7rCTVdwNzUoeirRxX+Ku/8a5Ov2nuzRDbj3G8=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 503AD5fp112707
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 3 Jan 2025 04:13:05 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 3
 Jan 2025 04:13:05 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 3 Jan 2025 04:13:05 -0600
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 503ACVSQ126047;
	Fri, 3 Jan 2025 04:13:02 -0600
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>,
        <p.zabel@pengutronix.de>, <jan.kiszka@siemens.com>,
        <christophe.jaillet@wanadoo.fr>, <jkangas@redhat.com>,
        <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v8 08/20] remoteproc: k3: Refactor rproc_request_mbox() implementations into common driver
Date: Fri, 3 Jan 2025 15:42:19 +0530
Message-ID: <20250103101231.1508151-9-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250103101231.1508151-1-b-padhi@ti.com>
References: <20250103101231.1508151-1-b-padhi@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

The k3_dsp_rproc_request_mbox() function acquires the mailbox channel
and sends a message through the acquired channel. The
ti_k3_m4_remoteproc.c driver acquires the mailbox channel in probe and
sends the message later in .attach()/.start() callbacks. Refactor the
k3_dsp_rproc_request_mbox() function into ti_k3_common.c as
k3_rproc_request_mbox() and align DSP and M4 drivers to use this common
function during probe routine.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
 drivers/remoteproc/ti_k3_common.c         | 36 +++++++++++++++++++
 drivers/remoteproc/ti_k3_common.h         |  1 +
 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 36 +------------------
 drivers/remoteproc/ti_k3_m4_remoteproc.c  | 42 ++---------------------
 4 files changed, 41 insertions(+), 74 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
index cec664819a1d..a78abecf2756 100644
--- a/drivers/remoteproc/ti_k3_common.c
+++ b/drivers/remoteproc/ti_k3_common.c
@@ -169,5 +169,41 @@ int k3_rproc_release(struct k3_rproc *kproc)
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
index 37516765e505..8e44c0455c39 100644
--- a/drivers/remoteproc/ti_k3_common.h
+++ b/drivers/remoteproc/ti_k3_common.h
@@ -92,4 +92,5 @@ void k3_rproc_mbox_callback(struct mbox_client *client, void *data);
 void k3_rproc_kick(struct rproc *rproc, int vqid);
 int k3_rproc_reset(struct k3_rproc *kproc);
 int k3_rproc_release(struct k3_rproc *kproc);
+int k3_rproc_request_mbox(struct rproc *rproc);
 #endif /* REMOTEPROC_TI_K3_COMMON_H */
diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
index 64affbe0ba29..c8bab63a4f4d 100644
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
@@ -460,7 +426,7 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
 	kproc->dev = dev;
 	kproc->data = data;
 
-	ret = k3_dsp_rproc_request_mbox(rproc);
+	ret = k3_rproc_request_mbox(rproc);
 	if (ret)
 		return ret;
 
diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
index c24085411e1c..6dd93c8d0553 100644
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
@@ -386,14 +361,9 @@ static int k3_m4_rproc_stop(struct rproc *rproc)
 static int k3_m4_rproc_attach(struct rproc *rproc)
 {
 	struct k3_rproc *kproc = rproc->priv;
-	int ret;
 
 	kproc->is_attach_ongoing = true;
 
-	ret = k3_m4_rproc_ping_mbox(kproc);
-	if (ret)
-		return ret;
-
 	return 0;
 }
 
@@ -506,15 +476,9 @@ static int k3_m4_rproc_probe(struct platform_device *pdev)
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
-- 
2.34.1

