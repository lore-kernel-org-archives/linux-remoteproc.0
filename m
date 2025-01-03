Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347A41F9AB6;
	Fri,  3 Jan 2025 10:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735899184; cv=none; b=IYnKdKCn/YhcYIkqVOFjs7NwzeyQbW0ZMmix9G4H0xH2RrdDaBhO7UD2n5cPIcmlPbOuGishCizaOcA+O+sgi1iX6596vNgWaVd2ytAY3Bx13rl4Ke5hYgMMoK+Iv7XAYw/nF/lqDHaHreu1Uj029Xkwa8EGlnGyOx9Jr8WDZqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735899184; c=relaxed/simple;
	bh=YbMs7JlqVUHC8NgrQl9CQBdLtGYXH6D2DqArDUwl7Mk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bXd8DrlI7dQnxxylE+gjuDOdNJ4dlprgL5z7PvtNBWlLV2U2AbtDMiQnFuT6Fw/i0RNGUjSryg05qOiMaI/E2uAAEb2SWflQ8X99qHtGs06gT2BQjZwVwOOWD2I2UoBr0F1ieGhw9BEmSCPEAcrNeXprzrzFW7hQ1FoTQawckpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=D2EtF9+G; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="D2EtF9+G"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 503ACpgC2019398
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 3 Jan 2025 04:12:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1735899171;
	bh=DgyVEw7oOl3tnOK8cHQEwe00QwCEYwZiiFEcw9txbtE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=D2EtF9+G3bkr/uC0PGMHWDj+SB3iKnZpklY4nG6l+OmDvFN+R2ttyI/ckUT2rarA7
	 A1ittsx8YT2CV6kkfXohPbi4OnhkXQTZA5ulQpu32BVo6G7A3Zj4LoocgVFPWNPOeV
	 qksE6/x8uWGKrSSAf/GcXA7B/+nkQ83N/RraLu+8=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 503ACpNR041856;
	Fri, 3 Jan 2025 04:12:51 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 3
 Jan 2025 04:12:50 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 3 Jan 2025 04:12:50 -0600
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 503ACVSM126047;
	Fri, 3 Jan 2025 04:12:47 -0600
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>,
        <p.zabel@pengutronix.de>, <jan.kiszka@siemens.com>,
        <christophe.jaillet@wanadoo.fr>, <jkangas@redhat.com>,
        <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v8 04/20] remoteproc: k3: Refactor .kick rproc ops into common driver
Date: Fri, 3 Jan 2025 15:42:15 +0530
Message-ID: <20250103101231.1508151-5-b-padhi@ti.com>
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

The .kick rproc ops implementations in ti_k3_dsp_remoteproc.c and
ti_k3_m4_remoteproc.c drivers sends a mailbox message to the remote
processor in the same way. Refactor the implementations into a common
function 'k3_rproc_kick()' in the ti_k3_common.c driver.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
 drivers/remoteproc/ti_k3_common.c         | 31 +++++++++++++++++++++
 drivers/remoteproc/ti_k3_common.h         |  1 +
 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 31 ++-------------------
 drivers/remoteproc/ti_k3_m4_remoteproc.c  | 34 ++---------------------
 4 files changed, 36 insertions(+), 61 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
index a87a06744f71..bd6353283078 100644
--- a/drivers/remoteproc/ti_k3_common.c
+++ b/drivers/remoteproc/ti_k3_common.c
@@ -86,5 +86,36 @@ void k3_rproc_mbox_callback(struct mbox_client *client, void *data)
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
+	 * Do not forward messages to a detached core, except when the core
+	 * is in the process of being attached in IPC-only mode.
+	 */
+	if (!kproc->is_attach_ongoing && kproc->rproc->state == RPROC_DETACHED)
+		return;
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
index 251ecc2df1dd..57792d68b7ef 100644
--- a/drivers/remoteproc/ti_k3_common.h
+++ b/drivers/remoteproc/ti_k3_common.h
@@ -89,4 +89,5 @@ struct k3_rproc {
 };
 
 void k3_rproc_mbox_callback(struct mbox_client *client, void *data);
+void k3_rproc_kick(struct rproc *rproc, int vqid);
 #endif /* REMOTEPROC_TI_K3_COMMON_H */
diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
index 70fbceccbac2..b2551b5171a9 100644
--- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
@@ -24,33 +24,6 @@
 
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
-	/*
-	 * Do not forward messages to a detached core, except when the core is
-	 * in the process of being attached in IPC-only mode.
-	 */
-	if (!kproc->is_attach_ongoing && kproc->rproc->state == RPROC_DETACHED)
-		return;
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
@@ -239,7 +212,7 @@ static int k3_dsp_rproc_stop(struct rproc *rproc)
  * Attach to a running DSP remote processor (IPC-only mode)
  *
  * This rproc attach callback only needs to set the "is_attach_ongoing" flag to
- * notify k3_dsp_rproc_{kick/mbox_callback} functions that the core is in the
+ * notify k3_rproc_{kick/mbox_callback} functions that the core is in the
  * process of getting attached in IPC-only mode. The remote processor is already
  * booted, and all required resources have been acquired during probe routine,
  * so there is no need to issue any TI-SCI commands to boot the DSP core. This
@@ -366,7 +339,7 @@ static void *k3_dsp_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool
 static const struct rproc_ops k3_dsp_rproc_ops = {
 	.start		= k3_dsp_rproc_start,
 	.stop		= k3_dsp_rproc_stop,
-	.kick		= k3_dsp_rproc_kick,
+	.kick		= k3_rproc_kick,
 	.da_to_va	= k3_dsp_rproc_da_to_va,
 };
 
diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
index f1fe7d462d2a..953c3999019f 100644
--- a/drivers/remoteproc/ti_k3_m4_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_m4_remoteproc.c
@@ -24,36 +24,6 @@
 #define K3_M4_IRAM_DEV_ADDR 0x00000
 #define K3_M4_DRAM_DEV_ADDR 0x30000
 
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
-	 * Do not forward messages to a detached core, except when the core
-	 * is in the process of being attached in IPC-only mode.
-	 */
-	if (!kproc->is_attach_ongoing && kproc->rproc->state == RPROC_DETACHED)
-		return;
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
@@ -424,7 +394,7 @@ static int k3_m4_rproc_stop(struct rproc *rproc)
  * Attach to a running M4 remote processor (IPC-only mode)
  *
  * This rproc attach callback only needs to set the "is_attach_ongoing" flag to
- * notify k3_m4_rproc_{kick/mbox_callback} functions that the core is in the
+ * notify k3_rproc_{kick/mbox_callback} functions that the core is in the
  * process of getting attached in IPC-only mode. The remote processor is already
  * booted, so there is no need to issue any TI-SCI commands to boot the M4 core.
  * This callback is used only in IPC-only mode.
@@ -468,7 +438,7 @@ static const struct rproc_ops k3_m4_rproc_ops = {
 	.stop = k3_m4_rproc_stop,
 	.attach = k3_m4_rproc_attach,
 	.detach = k3_m4_rproc_detach,
-	.kick = k3_m4_rproc_kick,
+	.kick = k3_rproc_kick,
 	.da_to_va = k3_m4_rproc_da_to_va,
 	.get_loaded_rsc_table = k3_m4_get_loaded_rsc_table,
 };
-- 
2.34.1

