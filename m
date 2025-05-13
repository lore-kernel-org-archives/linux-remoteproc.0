Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77F31E5B9B;
	Tue, 13 May 2025 05:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747115180; cv=none; b=XD8YEPYAqNbsvHWY6cvro6rcr6muzzzTHFrDMGpj6MfaV8E220YVVtLpMqWLxk4oYUQv84HrR5AUpchALV4hpvfLuaNIz5fjOGPRzYrXRirjxW6Bskh1GvDmEzdY6tvkg5vp8PyofONazpIEdOQpOLmFyJJoLIKsExUDfhdHBL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747115180; c=relaxed/simple;
	bh=3gb52cl6ezaF8sQ3OHQS8bCpncG7HXFACqdsRhEeyhk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WtsFVjdk2zcf9ZU4RJxjC6oGQhuRa3MyW/Ui4/JfQaSk4nQy8fI+I+BDSQobxJ53XaR8hw8A8cS1sI1brVdFfIMYvRZ6uKb4Alc972iabSGEcHUXht3wKuVKo+1DIyEW4IqeO4u4mFiDZujOc0LIVVO8YmOx/iucaEDJ4vllkjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=vIJgOKUs; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="vIJgOKUs"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 54D5k9Fh2210819
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 May 2025 00:46:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747115169;
	bh=p0lKhNICOLatbwT0nbJI5ZJ5bE8S7+RbuK1e/jHi/iY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=vIJgOKUsiZ2qTB5BVwQVkgnRAa7gu3y0DETx48hbd4I4RE226iK0tm0gnCNmSACsf
	 TTRLwzlFyWUWhXxsMHvd30u1rjzqAtHftgMn8dpAPEv4SZ3wy387rvEAlKQ6xnw4wO
	 epWHXGOfEKDcLOHxY8Y91pGFbNTdE8MJFjSk7CTU=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 54D5k9BB088688
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 13 May 2025 00:46:09 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 13
 May 2025 00:46:08 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 13 May 2025 00:46:09 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54D5jAqM131001;
	Tue, 13 May 2025 00:46:05 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v12 13/36] remoteproc: k3: Refactor mailbox rx_callback functions into common driver
Date: Tue, 13 May 2025 11:14:47 +0530
Message-ID: <20250513054510.3439842-14-b-padhi@ti.com>
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

The mailbox .rx_callback implementations in TI K3 R5, DSP and M4
remoteproc drivers handle inbound mailbox messages in the same way.
Introduce a common driver 'ti_k3_common.c' and refactor the
implementations into a common function 'k3_rproc_mbox_callback'() in it.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
Tested-by: Judith Mendez <jm@ti.com>
Reviewed-by: Andrew Davis <afd@ti.com>
---
v12: Changelog:
1. Compile ti_k3_common driver with ti_k3_r5_remoteproc driver. [Mathieu]
2. Update comment to call out that the driver is refactored out of R5, DSP and
M4 drivers.
3. Carried R/B tag.

Link to v11:
https://lore.kernel.org/all/20250425104135.830255-13-b-padhi@ti.com/

v11: Changelog:
1. Carried T/B tag.

Link to v10:
https://lore.kernel.org/all/20250417182001.3903905-13-b-padhi@ti.com/

v10: Changelog:
None

Link to v9:
https://lore.kernel.org/all/20250317120622.1746415-11-b-padhi@ti.com/

 drivers/remoteproc/Makefile               |  6 +-
 drivers/remoteproc/ti_k3_common.c         | 88 +++++++++++++++++++++++
 drivers/remoteproc/ti_k3_common.h         |  1 +
 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 50 +------------
 drivers/remoteproc/ti_k3_m4_remoteproc.c  | 49 +------------
 drivers/remoteproc/ti_k3_r5_remoteproc.c  | 50 +------------
 6 files changed, 95 insertions(+), 149 deletions(-)
 create mode 100644 drivers/remoteproc/ti_k3_common.c

diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
index 5ff4e2fee4abd..1c7598b8475d6 100644
--- a/drivers/remoteproc/Makefile
+++ b/drivers/remoteproc/Makefile
@@ -36,7 +36,7 @@ obj-$(CONFIG_RCAR_REMOTEPROC)		+= rcar_rproc.o
 obj-$(CONFIG_ST_REMOTEPROC)		+= st_remoteproc.o
 obj-$(CONFIG_ST_SLIM_REMOTEPROC)	+= st_slim_rproc.o
 obj-$(CONFIG_STM32_RPROC)		+= stm32_rproc.o
-obj-$(CONFIG_TI_K3_DSP_REMOTEPROC)	+= ti_k3_dsp_remoteproc.o
-obj-$(CONFIG_TI_K3_M4_REMOTEPROC)	+= ti_k3_m4_remoteproc.o
-obj-$(CONFIG_TI_K3_R5_REMOTEPROC)	+= ti_k3_r5_remoteproc.o
+obj-$(CONFIG_TI_K3_DSP_REMOTEPROC)	+= ti_k3_dsp_remoteproc.o ti_k3_common.o
+obj-$(CONFIG_TI_K3_M4_REMOTEPROC)	+= ti_k3_m4_remoteproc.o ti_k3_common.o
+obj-$(CONFIG_TI_K3_R5_REMOTEPROC)	+= ti_k3_r5_remoteproc.o ti_k3_common.o
 obj-$(CONFIG_XLNX_R5_REMOTEPROC)	+= xlnx_r5_remoteproc.o
diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
new file mode 100644
index 0000000000000..6ec8c3af19918
--- /dev/null
+++ b/drivers/remoteproc/ti_k3_common.c
@@ -0,0 +1,88 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * TI K3 Remote Processor(s) driver common code
+ *
+ * Refactored out of ti_k3_r5_remoteproc.c, ti_k3_dsp_remoteproc.c and
+ * ti_k3_m4_remoteproc.c.
+ *
+ * ti_k3_r5_remoteproc.c:
+ * Copyright (C) 2017-2022 Texas Instruments Incorporated - https://www.ti.com/
+ *	Suman Anna <s-anna@ti.com>
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
index 3e09e090cb337..75c069f21756c 100644
--- a/drivers/remoteproc/ti_k3_common.h
+++ b/drivers/remoteproc/ti_k3_common.h
@@ -93,4 +93,5 @@ struct k3_rproc {
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
index 053d50cf5e72b..30126f8d9ac70 100644
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
index ec9101972ff9e..5caedc9dad181 100644
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

