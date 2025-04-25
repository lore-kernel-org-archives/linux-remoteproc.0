Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A77A25394F;
	Fri, 25 Apr 2025 10:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745577789; cv=none; b=oJAnnbVPg6p97T05mEgpqs9rUKJMSkWsPhklO1HHTMSUTQii6N8Mnf756zWF+HyI3xaMZ1Jlu8Ntg9fx/hOzQIUaozMkGfuU8JnKSpBIKIKMHYwLpgn62ogWwU5x+hyJXxWjdsEGYj+FpOoNV1ogykxgbMzC3fN92Nhid1uBHiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745577789; c=relaxed/simple;
	bh=O+1/wPzoJN8A2J3exs+6Xyk+Cfr3mOyLh4EpW5BTMXw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SEpURw9s7Rk6bnMD7zrVBw6mY3m731KXcjj9ikfcnwDKFGguL1M/lOB+lleeI9CmOrNCDUJnaEfwgEo13jM/y53kdZMjBX63Ux6hfPVzyKZUHTpOSB2Ksl5zyRlZWOlhaRJ3Y32KqPl7qhOurjFbw0/Uz7QZYahlZigd4o7xFSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=TDzrXr4A; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="TDzrXr4A"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53PAh0Ej2911111
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 05:43:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745577780;
	bh=SMdAVrQNJCM3KiDfzIagNLzMyp8ST11nxUYyRr9e2Ys=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=TDzrXr4AlI+3jdptInP42+PsAo+cbkFW8y3LfPyD146xQD/8YXWTp2qXQpOTYNpKa
	 ZOEZENg/1JsSm7GFjV6Q79lai9ABo+zBgA+lIrut34wt58BjzW6XC9QnTQDZi2jPa6
	 V/yjLp3SR5lP7xWLH96Q7KU9KXatp/qqDhn8VaE4=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53PAh0wB028190
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 25 Apr 2025 05:43:00 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 25
 Apr 2025 05:43:00 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 25 Apr 2025 05:42:59 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53PAfaZg038329;
	Fri, 25 Apr 2025 05:42:56 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v11 21/35] remoteproc: k3: Refactor rproc_request_mbox() implementations into common driver
Date: Fri, 25 Apr 2025 16:11:21 +0530
Message-ID: <20250425104135.830255-22-b-padhi@ti.com>
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

The rproc_request_mbox() implementations in TI K3 R5, DSP and M4
remoteproc drivers acquire the mailbox channel and send the same message
through the acquired channel.

Refactor the above function into the ti_k3_common.c driver as
k3_rproc_request_mbox() and use it throughout R5, DSP and M4 drivers.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
Tested-by: Judith Mendez <jm@ti.com>
---
v11: Changelog:
1. Carried T/B tag.

Link to v10:
https://lore.kernel.org/all/20250417182001.3903905-20-b-padhi@ti.com/

v10: Changelog:
1. Split [v9 14/26] into [v10 18/33] and [v10 19/33] patches. 

Link to v9:
https://lore.kernel.org/all/20250317120622.1746415-15-b-padhi@ti.com/

 drivers/remoteproc/ti_k3_common.c         | 36 ++++++++++++++++++++++
 drivers/remoteproc/ti_k3_common.h         |  1 +
 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 36 +---------------------
 drivers/remoteproc/ti_k3_m4_remoteproc.c  | 37 +----------------------
 drivers/remoteproc/ti_k3_r5_remoteproc.c  | 37 +----------------------
 5 files changed, 40 insertions(+), 107 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
index e4a924cb1798e..8801fdd10e90c 100644
--- a/drivers/remoteproc/ti_k3_common.c
+++ b/drivers/remoteproc/ti_k3_common.c
@@ -151,5 +151,41 @@ int k3_rproc_release(struct k3_rproc *kproc)
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
index c1af39cd288c1..721492fa0fb71 100644
--- a/drivers/remoteproc/ti_k3_common.h
+++ b/drivers/remoteproc/ti_k3_common.h
@@ -92,4 +92,5 @@ void k3_rproc_mbox_callback(struct mbox_client *client, void *data);
 void k3_rproc_kick(struct rproc *rproc, int vqid);
 int k3_rproc_reset(struct k3_rproc *kproc);
 int k3_rproc_release(struct k3_rproc *kproc);
+int k3_rproc_request_mbox(struct rproc *rproc);
 #endif /* REMOTEPROC_TI_K3_COMMON_H */
diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
index 577dcd65093a9..d1d35f819c232 100644
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
index 0cc6c7b04e887..4d5a33021a77a 100644
--- a/drivers/remoteproc/ti_k3_m4_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_m4_remoteproc.c
@@ -21,41 +21,6 @@
 #include "ti_sci_proc.h"
 #include "ti_k3_common.h"
 
-static int k3_m4_rproc_request_mbox(struct rproc *rproc)
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
  * The M4 cores have a local reset that affects only the CPU, and a
  * generic module reset that powers on the device and allows the internal
@@ -493,7 +458,7 @@ static int k3_m4_rproc_probe(struct platform_device *pdev)
 		dev_info(dev, "configured M4F for remoteproc mode\n");
 	}
 
-	ret = k3_m4_rproc_request_mbox(rproc);
+	ret = k3_rproc_request_mbox(rproc);
 	if (ret)
 		return ret;
 
diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
index dedc9456983e0..6177610d63980 100644
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
@@ -1357,7 +1322,7 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
 		kproc = core->kproc;
 		rproc = kproc->rproc;
 
-		ret = k3_r5_rproc_request_mbox(rproc);
+		ret = k3_rproc_request_mbox(rproc);
 		if (ret)
 			return ret;
 
-- 
2.34.1

