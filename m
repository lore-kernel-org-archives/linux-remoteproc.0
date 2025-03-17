Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF862397BE;
	Mon, 17 Mar 2025 12:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742213245; cv=none; b=dfAyH5MmF3+Josn49nV7Uru0gd78PHL4+z9iefOICsQQvKfbFWAWdkfYUpxXsKK8S8KrMxEOIkMEQfALs8AAo+x11xReWj0zFTHmGfeios8HS/pLc/SYzNOsWcw8bpe4hnyvDUxqQdHC77n1xgm/7rfGswTxeM9wYgqNu2UDWXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742213245; c=relaxed/simple;
	bh=+SbaA0yiBC7g0hVGBVSAHkXPOUgEm+rI17go6LQU5M0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WBtavOFWlaYvAs+rJ//sbTusV+OcRRl8qEV9JM6uWF92HhMtjn7nJbAk15mq7SPZBHGVG1X+4t4brFv/pnY6hT4q7nb7oTN9iS1QPBhxuHwOBRI6RrX/WKGGygUodfKvIUSijarcxE+k6I8dKPDa8H/kGZ+jewDqp7Ms/wuaCW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=c55JaDGA; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="c55JaDGA"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52HC7Dmp2755521
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 17 Mar 2025 07:07:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742213233;
	bh=q1DkX2pACE4CykC32zg9yYF4imOvW9d6IGICR1ICLQo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=c55JaDGAdAodJIpEu7+P6SdAf/rohR+VFq58jNjMIaGMOsqPdZDR4JPRqCrGcCBzg
	 RjJpBadxJeM0zqdKp/sNO1Ug0lapMYrs2Whd4K7BpMtjVbvP/F/axdMIAFxpcjlXQU
	 SoxIWhyRKJ2jXd4z0H8l70Uo9Jj5lz9a21TQwnFI=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52HC7Drg005180;
	Mon, 17 Mar 2025 07:07:13 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 17
 Mar 2025 07:07:12 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 17 Mar 2025 07:07:12 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52HC6MK8060901;
	Mon, 17 Mar 2025 07:07:09 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v9 11/26] remoteproc: k3: Refactor .kick rproc ops into common driver
Date: Mon, 17 Mar 2025 17:36:07 +0530
Message-ID: <20250317120622.1746415-12-b-padhi@ti.com>
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

The .kick rproc ops implementations in TI K3 R5, DSP and M4 remoteproc
drivers sends a mailbox message to the remote processor in the same
way. Refactor the implementations into a common function
'k3_rproc_kick()' in the ti_k3_common.c driver.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
 drivers/remoteproc/ti_k3_common.c         | 25 ++++++++++++++++++++++
 drivers/remoteproc/ti_k3_common.h         |  1 +
 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 22 +------------------
 drivers/remoteproc/ti_k3_m4_remoteproc.c  | 26 +----------------------
 drivers/remoteproc/ti_k3_r5_remoteproc.c  | 17 +--------------
 5 files changed, 29 insertions(+), 62 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
index 56caf7a51b59..f91ca9f0079f 100644
--- a/drivers/remoteproc/ti_k3_common.c
+++ b/drivers/remoteproc/ti_k3_common.c
@@ -79,5 +79,30 @@ void k3_rproc_mbox_callback(struct mbox_client *client, void *data)
 }
 EXPORT_SYMBOL_GPL(k3_rproc_mbox_callback);
 
+/*
+ * Kick the remote processor to notify about pending unprocessed messages.
+ * The vqid usage is not used and is inconsequential, as the kick is performed
+ * through a simulated GPIO (a bit in an IPC interrupt-triggering register),
+ * the remote processor is expected to process both its Tx and Rx virtqueues.
+ */
+void k3_rproc_kick(struct rproc *rproc, int vqid)
+{
+	struct k3_rproc *kproc = rproc->priv;
+	struct device *dev = kproc->dev;
+	u32 msg = (u32)vqid;
+	int ret;
+
+	/*
+	 * Send the index of the triggered virtqueue in the mailbox payload.
+	 * NOTE: msg is cast to uintptr_t to prevent compiler warnings when
+	 * void* is 64bit. It is safely cast back to u32 in the mailbox driver.
+	 */
+	ret = mbox_send_message(kproc->mbox, (void *)(uintptr_t)msg);
+	if (ret < 0)
+		dev_err(dev, "failed to send mailbox message, status = %d\n",
+			ret);
+}
+EXPORT_SYMBOL_GPL(k3_rproc_kick);
+
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("TI K3 common Remoteproc code");
diff --git a/drivers/remoteproc/ti_k3_common.h b/drivers/remoteproc/ti_k3_common.h
index 785bb4b17d02..6ae7ac4ec569 100644
--- a/drivers/remoteproc/ti_k3_common.h
+++ b/drivers/remoteproc/ti_k3_common.h
@@ -89,4 +89,5 @@ struct k3_rproc {
 };
 
 void k3_rproc_mbox_callback(struct mbox_client *client, void *data);
+void k3_rproc_kick(struct rproc *rproc, int vqid);
 #endif /* REMOTEPROC_TI_K3_COMMON_H */
diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
index 7bd1d5a790cb..476f4e69d2c1 100644
--- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
@@ -24,26 +24,6 @@
 
 #define KEYSTONE_RPROC_LOCAL_ADDRESS_MASK	(SZ_16M - 1)
 
-/*
- * Kick the remote processor to notify about pending unprocessed messages.
- * The vqid usage is not used and is inconsequential, as the kick is performed
- * through a simulated GPIO (a bit in an IPC interrupt-triggering register),
- * the remote processor is expected to process both its Tx and Rx virtqueues.
- */
-static void k3_dsp_rproc_kick(struct rproc *rproc, int vqid)
-{
-	struct k3_rproc *kproc = rproc->priv;
-	struct device *dev = rproc->dev.parent;
-	mbox_msg_t msg = (mbox_msg_t)vqid;
-	int ret;
-
-	/* send the index of the triggered virtqueue in the mailbox payload */
-	ret = mbox_send_message(kproc->mbox, (void *)msg);
-	if (ret < 0)
-		dev_err(dev, "failed to send mailbox message (%pe)\n",
-			ERR_PTR(ret));
-}
-
 /* Put the DSP processor into reset */
 static int k3_dsp_rproc_reset(struct k3_rproc *kproc)
 {
@@ -342,7 +322,7 @@ static void *k3_dsp_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool
 static const struct rproc_ops k3_dsp_rproc_ops = {
 	.start		= k3_dsp_rproc_start,
 	.stop		= k3_dsp_rproc_stop,
-	.kick		= k3_dsp_rproc_kick,
+	.kick		= k3_rproc_kick,
 	.da_to_va	= k3_dsp_rproc_da_to_va,
 };
 
diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
index a1bcc4b265df..8a6917259ce6 100644
--- a/drivers/remoteproc/ti_k3_m4_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_m4_remoteproc.c
@@ -21,30 +21,6 @@
 #include "ti_sci_proc.h"
 #include "ti_k3_common.h"
 
-/*
- * Kick the remote processor to notify about pending unprocessed messages.
- * The vqid usage is not used and is inconsequential, as the kick is performed
- * through a simulated GPIO (a bit in an IPC interrupt-triggering register),
- * the remote processor is expected to process both its Tx and Rx virtqueues.
- */
-static void k3_m4_rproc_kick(struct rproc *rproc, int vqid)
-{
-	struct k3_rproc *kproc = rproc->priv;
-	struct device *dev = kproc->dev;
-	u32 msg = (u32)vqid;
-	int ret;
-
-	/*
-	 * Send the index of the triggered virtqueue in the mailbox payload.
-	 * NOTE: msg is cast to uintptr_t to prevent compiler warnings when
-	 * void* is 64bit. It is safely cast back to u32 in the mailbox driver.
-	 */
-	ret = mbox_send_message(kproc->mbox, (void *)(uintptr_t)msg);
-	if (ret < 0)
-		dev_err(dev, "failed to send mailbox message, status = %d\n",
-			ret);
-}
-
 static int k3_m4_rproc_ping_mbox(struct k3_rproc *kproc)
 {
 	struct device *dev = kproc->dev;
@@ -448,7 +424,7 @@ static const struct rproc_ops k3_m4_rproc_ops = {
 	.stop = k3_m4_rproc_stop,
 	.attach = k3_m4_rproc_attach,
 	.detach = k3_m4_rproc_detach,
-	.kick = k3_m4_rproc_kick,
+	.kick = k3_rproc_kick,
 	.da_to_va = k3_m4_rproc_da_to_va,
 	.get_loaded_rsc_table = k3_m4_get_loaded_rsc_table,
 };
diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
index c817a4ac54a7..36fffcf1e881 100644
--- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
@@ -129,21 +129,6 @@ struct k3_r5_core {
 	bool released_from_reset;
 };
 
-/* kick a virtqueue */
-static void k3_r5_rproc_kick(struct rproc *rproc, int vqid)
-{
-	struct k3_rproc *kproc = rproc->priv;
-	struct device *dev = rproc->dev.parent;
-	mbox_msg_t msg = (mbox_msg_t)vqid;
-	int ret;
-
-	/* send the index of the triggered virtqueue in the mailbox payload */
-	ret = mbox_send_message(kproc->mbox, (void *)msg);
-	if (ret < 0)
-		dev_err(dev, "failed to send mailbox message, status = %d\n",
-			ret);
-}
-
 static int k3_r5_split_reset(struct k3_rproc *kproc)
 {
 	int ret;
@@ -735,7 +720,7 @@ static const struct rproc_ops k3_r5_rproc_ops = {
 	.unprepare	= k3_r5_rproc_unprepare,
 	.start		= k3_r5_rproc_start,
 	.stop		= k3_r5_rproc_stop,
-	.kick		= k3_r5_rproc_kick,
+	.kick		= k3_rproc_kick,
 	.da_to_va	= k3_r5_rproc_da_to_va,
 };
 
-- 
2.34.1

