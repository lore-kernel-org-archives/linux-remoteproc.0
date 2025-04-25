Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9732475CE;
	Fri, 25 Apr 2025 10:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745577756; cv=none; b=uG+y+PA0ii+cHiRTcS2BoW/IS5tl+eWfy6SYg0VCaINetwuJ8eYSfQomuYxugif3ZFa9UW4bbPb7ZlZQsCkMh09GkUAuBRjZAmUpCFP18sr+fofcib5WtCznmw6pmUn1vAqmmVoRI0Ss3Z0fqspgLDlmsGuqoy3puHGpM1vrmHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745577756; c=relaxed/simple;
	bh=yoqsGrn2faAVywGMYNxbqIV0946a+4618XnTcAsUwaw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bWWoT/Bzj0/q+h8O7x+xLV+6NUtfvHYYWXs8OUtdBRFxEmEkGeXczQ5CLNK1+NK8NTsD34f6LkOX4yfY1AJZvc7zWb2wTHC7dFB22r8Wh52P3FIBi9yG36P342E/7yzD/CxvKo/GQaBXg3m1i142AkApx7wQodEDDynY/CBPLDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Z1ySw9Zu; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Z1ySw9Zu"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53PAgPfN2123083
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 05:42:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745577746;
	bh=Vlx90qNC2WZFurqmFzdefi7Xvqdw5JUiFjZkCbg3tVY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Z1ySw9ZurddneTm0sZzIXM9DEM1/NNecSuInz4EI2T+0O3/za2LApLCZgcvcdTquI
	 AqMdFNj9G4vHOKGyOgvqjGgqEL805SxLWZtjiy722jUwD+x4Kp1vtMrkvSfRnuoJCQ
	 8+iwA7QDmF8iQei+QCzAzp0wIPsDpBSHEaqrfj+8=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53PAgPGw129404
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 25 Apr 2025 05:42:25 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 25
 Apr 2025 05:42:25 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 25 Apr 2025 05:42:25 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53PAfaZX038329;
	Fri, 25 Apr 2025 05:42:22 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v11 12/35] remoteproc: k3: Refactor mailbox rx_callback functions into common driver
Date: Fri, 25 Apr 2025 16:11:12 +0530
Message-ID: <20250425104135.830255-13-b-padhi@ti.com>
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

The mailbox .rx_callback implementations in TI K3 R5, DSP and M4
remoteproc drivers handle inbound mailbox messages in the same way.
Introduce a common driver 'ti_k3_common.c' and refactor the
implementations into a common function 'k3_rproc_mbox_callback'() in it.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
Tested-by: Judith Mendez <jm@ti.com>
---
v11: Changelog:
1. Carried T/B tag.

Link to v10:
https://lore.kernel.org/all/20250417182001.3903905-13-b-padhi@ti.com/

v10: Changelog:
None

Link to v9:
https://lore.kernel.org/all/20250317120622.1746415-11-b-padhi@ti.com/

 drivers/remoteproc/Makefile               |  4 +-
 drivers/remoteproc/ti_k3_common.c         | 84 +++++++++++++++++++++++
 drivers/remoteproc/ti_k3_common.h         |  1 +
 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 50 +-------------
 drivers/remoteproc/ti_k3_m4_remoteproc.c  | 49 +------------
 drivers/remoteproc/ti_k3_r5_remoteproc.c  | 50 +-------------
 6 files changed, 90 insertions(+), 148 deletions(-)
 create mode 100644 drivers/remoteproc/ti_k3_common.c

diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
index 5ff4e2fee4abd..e30908ca4bfcd 100644
--- a/drivers/remoteproc/Makefile
+++ b/drivers/remoteproc/Makefile
@@ -36,7 +36,7 @@ obj-$(CONFIG_RCAR_REMOTEPROC)		+= rcar_rproc.o
 obj-$(CONFIG_ST_REMOTEPROC)		+= st_remoteproc.o
 obj-$(CONFIG_ST_SLIM_REMOTEPROC)	+= st_slim_rproc.o
 obj-$(CONFIG_STM32_RPROC)		+= stm32_rproc.o
-obj-$(CONFIG_TI_K3_DSP_REMOTEPROC)	+= ti_k3_dsp_remoteproc.o
-obj-$(CONFIG_TI_K3_M4_REMOTEPROC)	+= ti_k3_m4_remoteproc.o
+obj-$(CONFIG_TI_K3_DSP_REMOTEPROC)	+= ti_k3_dsp_remoteproc.o ti_k3_common.o
+obj-$(CONFIG_TI_K3_M4_REMOTEPROC)	+= ti_k3_m4_remoteproc.o ti_k3_common.o
 obj-$(CONFIG_TI_K3_R5_REMOTEPROC)	+= ti_k3_r5_remoteproc.o
 obj-$(CONFIG_XLNX_R5_REMOTEPROC)	+= xlnx_r5_remoteproc.o
diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
new file mode 100644
index 0000000000000..7b45e3b416186
--- /dev/null
+++ b/drivers/remoteproc/ti_k3_common.c
@@ -0,0 +1,84 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * TI K3 Remote Processor(s) driver common code
+ *
+ * Refactored out of ti_k3_r5_remoteproc.c, ti_k3_dsp_remoteproc.c and
+ * ti_k3_m4_remoteproc.c.
+ *
+ * ti_k3_dsp_remoteproc.c:
+ * Copyright (C) 2018-2022 Texas Instruments Incorporated - https://www.ti.com/
+ *	Suman Anna <s-anna@ti.com>
+ *
+ * ti_k3_m4_remoteproc.c:
+ * Copyright (C) 2021-2024 Texas Instruments Incorporated - https://www.ti.com/
+ *	Hari Nagalla <hnagalla@ti.com>
+ */
+
+#include <linux/io.h>
+#include <linux/mailbox_client.h>
+#include <linux/module.h>
+#include <linux/of_address.h>
+#include <linux/of_device.h>
+#include <linux/of_reserved_mem.h>
+#include <linux/omap-mailbox.h>
+#include <linux/platform_device.h>
+#include <linux/remoteproc.h>
+#include <linux/reset.h>
+#include <linux/slab.h>
+
+#include "omap_remoteproc.h"
+#include "remoteproc_internal.h"
+#include "ti_sci_proc.h"
+#include "ti_k3_common.h"
+
+/**
+ * k3_rproc_mbox_callback() - inbound mailbox message handler
+ * @client: mailbox client pointer used for requesting the mailbox channel
+ * @data: mailbox payload
+ *
+ * This handler is invoked by the K3 mailbox driver whenever a mailbox
+ * message is received. Usually, the mailbox payload simply contains
+ * the index of the virtqueue that is kicked by the remote processor,
+ * and we let remoteproc core handle it.
+ *
+ * In addition to virtqueue indices, we also have some out-of-band values
+ * that indicate different events. Those values are deliberately very
+ * large so they don't coincide with virtqueue indices.
+ */
+void k3_rproc_mbox_callback(struct mbox_client *client, void *data)
+{
+	struct k3_rproc *kproc = container_of(client, struct k3_rproc, client);
+	struct device *dev = kproc->rproc->dev.parent;
+	struct rproc *rproc = kproc->rproc;
+	u32 msg = (u32)(uintptr_t)(data);
+
+	dev_dbg(dev, "mbox msg: 0x%x\n", msg);
+
+	switch (msg) {
+	case RP_MBOX_CRASH:
+		/*
+		 * remoteproc detected an exception, but error recovery is not
+		 * supported. So, just log this for now
+		 */
+		dev_err(dev, "K3 rproc %s crashed\n", rproc->name);
+		break;
+	case RP_MBOX_ECHO_REPLY:
+		dev_info(dev, "received echo reply from %s\n", rproc->name);
+		break;
+	default:
+		/* silently handle all other valid messages */
+		if (msg >= RP_MBOX_READY && msg < RP_MBOX_END_MSG)
+			return;
+		if (msg > rproc->max_notifyid) {
+			dev_dbg(dev, "dropping unknown message 0x%x", msg);
+			return;
+		}
+		/* msg contains the index of the triggered vring */
+		if (rproc_vq_interrupt(rproc, msg) == IRQ_NONE)
+			dev_dbg(dev, "no message was found in vqid %d\n", msg);
+	}
+}
+EXPORT_SYMBOL_GPL(k3_rproc_mbox_callback);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("TI K3 common Remoteproc code");
diff --git a/drivers/remoteproc/ti_k3_common.h b/drivers/remoteproc/ti_k3_common.h
index 43aedab9f0aa3..785bb4b17d02f 100644
--- a/drivers/remoteproc/ti_k3_common.h
+++ b/drivers/remoteproc/ti_k3_common.h
@@ -88,4 +88,5 @@ struct k3_rproc {
 	void *priv;
 };
 
+void k3_rproc_mbox_callback(struct mbox_client *client, void *data);
 #endif /* REMOTEPROC_TI_K3_COMMON_H */
diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
index e92fab831670c..7bd1d5a790cb2 100644
--- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
@@ -24,54 +24,6 @@
 
 #define KEYSTONE_RPROC_LOCAL_ADDRESS_MASK	(SZ_16M - 1)
 
-/**
- * k3_dsp_rproc_mbox_callback() - inbound mailbox message handler
- * @client: mailbox client pointer used for requesting the mailbox channel
- * @data: mailbox payload
- *
- * This handler is invoked by the OMAP mailbox driver whenever a mailbox
- * message is received. Usually, the mailbox payload simply contains
- * the index of the virtqueue that is kicked by the remote processor,
- * and we let remoteproc core handle it.
- *
- * In addition to virtqueue indices, we also have some out-of-band values
- * that indicate different events. Those values are deliberately very
- * large so they don't coincide with virtqueue indices.
- */
-static void k3_dsp_rproc_mbox_callback(struct mbox_client *client, void *data)
-{
-	struct k3_rproc *kproc = container_of(client, struct k3_rproc, client);
-	struct device *dev = kproc->rproc->dev.parent;
-	const char *name = kproc->rproc->name;
-	u32 msg = omap_mbox_message(data);
-
-	dev_dbg(dev, "mbox msg: 0x%x\n", msg);
-
-	switch (msg) {
-	case RP_MBOX_CRASH:
-		/*
-		 * remoteproc detected an exception, but error recovery is not
-		 * supported. So, just log this for now
-		 */
-		dev_err(dev, "K3 DSP rproc %s crashed\n", name);
-		break;
-	case RP_MBOX_ECHO_REPLY:
-		dev_info(dev, "received echo reply from %s\n", name);
-		break;
-	default:
-		/* silently handle all other valid messages */
-		if (msg >= RP_MBOX_READY && msg < RP_MBOX_END_MSG)
-			return;
-		if (msg > kproc->rproc->max_notifyid) {
-			dev_dbg(dev, "dropping unknown message 0x%x", msg);
-			return;
-		}
-		/* msg contains the index of the triggered vring */
-		if (rproc_vq_interrupt(kproc->rproc, msg) == IRQ_NONE)
-			dev_dbg(dev, "no message was found in vqid %d\n", msg);
-	}
-}
-
 /*
  * Kick the remote processor to notify about pending unprocessed messages.
  * The vqid usage is not used and is inconsequential, as the kick is performed
@@ -155,7 +107,7 @@ static int k3_dsp_rproc_request_mbox(struct rproc *rproc)
 
 	client->dev = dev;
 	client->tx_done = NULL;
-	client->rx_callback = k3_dsp_rproc_mbox_callback;
+	client->rx_callback = k3_rproc_mbox_callback;
 	client->tx_block = false;
 	client->knows_txdone = false;
 
diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
index 04095407a483d..a1bcc4b265dfe 100644
--- a/drivers/remoteproc/ti_k3_m4_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_m4_remoteproc.c
@@ -21,53 +21,6 @@
 #include "ti_sci_proc.h"
 #include "ti_k3_common.h"
 
-/**
- * k3_m4_rproc_mbox_callback() - inbound mailbox message handler
- * @client: mailbox client pointer used for requesting the mailbox channel
- * @data: mailbox payload
- *
- * This handler is invoked by the K3 mailbox driver whenever a mailbox
- * message is received. Usually, the mailbox payload simply contains
- * the index of the virtqueue that is kicked by the remote processor,
- * and we let remoteproc core handle it.
- *
- * In addition to virtqueue indices, we also have some out-of-band values
- * that indicate different events. Those values are deliberately very
- * large so they don't coincide with virtqueue indices.
- */
-static void k3_m4_rproc_mbox_callback(struct mbox_client *client, void *data)
-{
-	struct device *dev = client->dev;
-	struct rproc *rproc = dev_get_drvdata(dev);
-	u32 msg = (u32)(uintptr_t)(data);
-
-	dev_dbg(dev, "mbox msg: 0x%x\n", msg);
-
-	switch (msg) {
-	case RP_MBOX_CRASH:
-		/*
-		 * remoteproc detected an exception, but error recovery is not
-		 * supported. So, just log this for now
-		 */
-		dev_err(dev, "K3 rproc %s crashed\n", rproc->name);
-		break;
-	case RP_MBOX_ECHO_REPLY:
-		dev_info(dev, "received echo reply from %s\n", rproc->name);
-		break;
-	default:
-		/* silently handle all other valid messages */
-		if (msg >= RP_MBOX_READY && msg < RP_MBOX_END_MSG)
-			return;
-		if (msg > rproc->max_notifyid) {
-			dev_dbg(dev, "dropping unknown message 0x%x", msg);
-			return;
-		}
-		/* msg contains the index of the triggered vring */
-		if (rproc_vq_interrupt(rproc, msg) == IRQ_NONE)
-			dev_dbg(dev, "no message was found in vqid %d\n", msg);
-	}
-}
-
 /*
  * Kick the remote processor to notify about pending unprocessed messages.
  * The vqid usage is not used and is inconsequential, as the kick is performed
@@ -581,7 +534,7 @@ static int k3_m4_rproc_probe(struct platform_device *pdev)
 
 	kproc->client.dev = dev;
 	kproc->client.tx_done = NULL;
-	kproc->client.rx_callback = k3_m4_rproc_mbox_callback;
+	kproc->client.rx_callback = k3_rproc_mbox_callback;
 	kproc->client.tx_block = false;
 	kproc->client.knows_txdone = false;
 	kproc->mbox = mbox_request_channel(&kproc->client, 0);
diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
index a6799ce121327..a1dfbe383c13c 100644
--- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
@@ -129,54 +129,6 @@ struct k3_r5_core {
 	bool released_from_reset;
 };
 
-/**
- * k3_r5_rproc_mbox_callback() - inbound mailbox message handler
- * @client: mailbox client pointer used for requesting the mailbox channel
- * @data: mailbox payload
- *
- * This handler is invoked by the OMAP mailbox driver whenever a mailbox
- * message is received. Usually, the mailbox payload simply contains
- * the index of the virtqueue that is kicked by the remote processor,
- * and we let remoteproc core handle it.
- *
- * In addition to virtqueue indices, we also have some out-of-band values
- * that indicate different events. Those values are deliberately very
- * large so they don't coincide with virtqueue indices.
- */
-static void k3_r5_rproc_mbox_callback(struct mbox_client *client, void *data)
-{
-	struct k3_rproc *kproc = container_of(client, struct k3_rproc, client);
-	struct device *dev = kproc->rproc->dev.parent;
-	const char *name = kproc->rproc->name;
-	u32 msg = omap_mbox_message(data);
-
-	dev_dbg(dev, "mbox msg: 0x%x\n", msg);
-
-	switch (msg) {
-	case RP_MBOX_CRASH:
-		/*
-		 * remoteproc detected an exception, but error recovery is not
-		 * supported. So, just log this for now
-		 */
-		dev_err(dev, "K3 R5F rproc %s crashed\n", name);
-		break;
-	case RP_MBOX_ECHO_REPLY:
-		dev_info(dev, "received echo reply from %s\n", name);
-		break;
-	default:
-		/* silently handle all other valid messages */
-		if (msg >= RP_MBOX_READY && msg < RP_MBOX_END_MSG)
-			return;
-		if (msg > kproc->rproc->max_notifyid) {
-			dev_dbg(dev, "dropping unknown message 0x%x", msg);
-			return;
-		}
-		/* msg contains the index of the triggered vring */
-		if (rproc_vq_interrupt(kproc->rproc, msg) == IRQ_NONE)
-			dev_dbg(dev, "no message was found in vqid %d\n", msg);
-	}
-}
-
 /* kick a virtqueue */
 static void k3_r5_rproc_kick(struct rproc *rproc, int vqid)
 {
@@ -356,7 +308,7 @@ static int k3_r5_rproc_request_mbox(struct rproc *rproc)
 
 	client->dev = dev;
 	client->tx_done = NULL;
-	client->rx_callback = k3_r5_rproc_mbox_callback;
+	client->rx_callback = k3_rproc_mbox_callback;
 	client->tx_block = false;
 	client->knows_txdone = false;
 
-- 
2.34.1

