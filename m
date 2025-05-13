Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41A51E9915;
	Tue, 13 May 2025 05:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747115216; cv=none; b=UOu86B6cMtTuW9MsBF0eY5EhlaOwN32e5z/9ZaKPtTCsVp8OJWCmSQvAVAgIDoUfyoOIsvy7BLfTGFs85fHo8AK6NUM0BOCHT8NZROXKnucVGqLrz5Shp59T0Ybu8X4h3iB6KMnYFYfgfqrv49K4w7vgpWaxJIv8xfC2L+gRqG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747115216; c=relaxed/simple;
	bh=Px8UWBxiTkiuiKQEudgK+dPfbspkwIbpQ/TJ9xdd+CM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KqAKs9J8e+Aul5BH66NuiSjcKs6B93x1xR04g2e/hSIm2c0RtzR70BtovwafP9Xg4+ydn6wKyNuWX5yY2jrrTSNhLxOoO52XOotP8cGQdlJR96emiNL2Gb62xJyhnkeAnXrnIgWGKtwUdujvTRkdcS2AS76C/zSL1WIsLuzIR54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=lOmb7HKa; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="lOmb7HKa"
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54D5kl7a2764352;
	Tue, 13 May 2025 00:46:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747115207;
	bh=H6bMeGxaPSkwtnr9c78x9XjtyoRCiezMUnGOu46Y/zg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=lOmb7HKah8WBDxerSQZlGPYearTSwe9s8h+xdBrEjuD9zeeHivizlFAJ7RwU2538W
	 Yxr4W5aszgqRRNY+UcGL3BMoDNkTw8ZlBHSr9Ruuu9ccqOFUWeklPp1UUrch89Ahxg
	 MvMZtF9Eio8DzA/F/LgFHL+uI0oBibQnYIQxzE18=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54D5kkwD1533957
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 13 May 2025 00:46:47 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 13
 May 2025 00:46:46 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 13 May 2025 00:46:46 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54D5jAqV131001;
	Tue, 13 May 2025 00:46:42 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v12 22/36] remoteproc: k3: Refactor rproc_request_mbox() implementations into common driver
Date: Tue, 13 May 2025 11:14:56 +0530
Message-ID: <20250513054510.3439842-23-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250513054510.3439842-1-b-padhi@ti.com>
References: <20250513054510.3439842-1-b-padhi@ti.com>
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
Reviewed-by: Andrew Davis <afd@ti.com>
---
v12: Changelog:
1. Carried R/B tag.

Link to v11:
https://lore.kernel.org/all/20250425104135.830255-22-b-padhi@ti.com/

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
index ab1507290ee01..908bc2209c2bb 100644
--- a/drivers/remoteproc/ti_k3_common.c
+++ b/drivers/remoteproc/ti_k3_common.c
@@ -155,5 +155,41 @@ int k3_rproc_release(struct k3_rproc *kproc)
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
index c64c3fcb531ee..01606513791f2 100644
--- a/drivers/remoteproc/ti_k3_common.h
+++ b/drivers/remoteproc/ti_k3_common.h
@@ -97,4 +97,5 @@ void k3_rproc_mbox_callback(struct mbox_client *client, void *data);
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
index 182ac71e22da3..c114369493bff 100644
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
index 337e3711cb143..4082cc61a41af 100644
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

