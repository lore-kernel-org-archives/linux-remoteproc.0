Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A09E25762;
	Fri, 21 Jun 2024 15:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718982073; cv=none; b=U4JsmQoS0G3e04WGNfNnEEvGzAXH4j1EU0IZ8CiVIZ71qgJRJXy5bDXFv/vEeqhjnyW258d9sSrEHMkv5XTnO/eNfeKQSEq1FQdJ7S33miH4W0lHpyTlF/wqvRgYKVnvvFa0+jegyhqN/ccB8koOfDvNpaesfXboDMjww0ZVSAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718982073; c=relaxed/simple;
	bh=b+spiLBETXWAHz7iQ9Q/ImLDBrx7PrrMEhAnvpM2Bq8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=naJpVDYQdYz5O9mOjFqR35spyHbTT2iFM+zyfh5oL46PCWlk5Ufusu8IYDt+IwBFx+w03kTOK0GWtBhb7SbzH8s4ACk8ff1Q04U6GVvyjhg7h+JiJ7PdMWF3lSNrohJdQJvkG6buHeVemC7RqwbAtFO7fSfq7KYRCxy68xlLWdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=E5KeRAAV; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="E5KeRAAV"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4491A240004;
	Fri, 21 Jun 2024 15:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1718982069;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=swFigz1dJFA6nW/teg50EkKWKn06yrLOy63UV2RCdiQ=;
	b=E5KeRAAVAvMZi7XTsmPjBCbYPFKE5Z4nadt8yBMhwgDQ8/jwMOmX5vha0VOhTYvZLl46u4
	HrNmjhOIGRD4+K+KN3aPPPg55+kWz6recZon4G/5t5AA7K0aaWv10QzXPahCpbAXXQ7/Mz
	H9O5yEqbwIFhOSHaGfiPkZ/Umt0tDQh/XnriGLYU/d2UuOmU3jfHWMw76q4yxMR8o6HC4l
	MHCivm6SF2AxcHrxnqyov3h18C1Ra3Qceno/HducbT3EPmIfuuVXp49g5Xf006RteWDjsS
	hDUChpeu25TOEIge+qdzawX3/pvhJa0UYssSVBnPuYBi9fOW7BoDlxzfqmX8Lw==
From: Richard Genoud <richard.genoud@bootlin.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	Suman Anna <s-anna@ti.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Udit Kumar <u-kumar1@ti.com>,
	Thomas Richard <thomas.richard@bootlin.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Hari Nagalla <hnagalla@ti.com>,
	=?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Richard Genoud <richard.genoud@bootlin.com>
Subject: [PATCH 4/4] remoteproc: k3-r5: support for graceful stop of remote cores
Date: Fri, 21 Jun 2024 17:00:58 +0200
Message-ID: <20240621150058.319524-5-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240621150058.319524-1-richard.genoud@bootlin.com>
References: <20240621150058.319524-1-richard.genoud@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: richard.genoud@bootlin.com

Introduce software IPC handshake between the K3-R5 remote proc driver
and the R5 MCU to gracefully stop/reset the remote core.

Upon a stop request, K3-R5 remote proc driver sends a RP_MBOX_SHUTDOWN
mailbox message to the remote R5 core.
The remote core is expected to:
- relinquish all the resources acquired through Device Manager (DM)
- disable its interrupts
- send back a mailbox acknowledgment RP_MBOX_SHUDOWN_ACK
- enter WFI state.

Meanwhile, the K3-R5 remote proc driver does:
- wait for the RP_MBOX_SHUTDOWN_ACK from the remote core
- wait for the remote proc to enter WFI state
- reset the remote core through device manager

Based on work from: Hari Nagalla <hnagalla@ti.com>

Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
---
 drivers/remoteproc/omap_remoteproc.h     |  9 +++++-
 drivers/remoteproc/ti_k3_r5_remoteproc.c | 40 ++++++++++++++++++++++++
 2 files changed, 48 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/omap_remoteproc.h b/drivers/remoteproc/omap_remoteproc.h
index 828e13256c02..c008f11fa2a4 100644
--- a/drivers/remoteproc/omap_remoteproc.h
+++ b/drivers/remoteproc/omap_remoteproc.h
@@ -42,6 +42,11 @@
  * @RP_MBOX_SUSPEND_CANCEL: a cancel suspend response from a remote processor
  * on a suspend request
  *
+ * @RP_MBOX_SHUTDOWN: shutdown request for the remote processor
+ *
+ * @RP_MBOX_SHUTDOWN_ACK: successful response from remote processor for a
+ * shutdown request. The remote processor should be in WFI state short after.
+ *
  * Introduce new message definitions if any here.
  *
  * @RP_MBOX_END_MSG: Indicates end of known/defined messages from remote core
@@ -59,7 +64,9 @@ enum omap_rp_mbox_messages {
 	RP_MBOX_SUSPEND_SYSTEM	= 0xFFFFFF11,
 	RP_MBOX_SUSPEND_ACK	= 0xFFFFFF12,
 	RP_MBOX_SUSPEND_CANCEL	= 0xFFFFFF13,
-	RP_MBOX_END_MSG		= 0xFFFFFF14,
+	RP_MBOX_SHUTDOWN	= 0xFFFFFF14,
+	RP_MBOX_SHUTDOWN_ACK	= 0xFFFFFF15,
+	RP_MBOX_END_MSG		= 0xFFFFFF16,
 };
 
 #endif /* _OMAP_RPMSG_H */
diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
index a2ead87952c7..918a15e1dd9a 100644
--- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
@@ -21,6 +21,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/remoteproc.h>
 #include <linux/suspend.h>
+#include <linux/iopoll.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
 
@@ -172,8 +173,23 @@ struct k3_r5_rproc {
 	struct k3_r5_core *core;
 	struct k3_r5_mem *rmem;
 	int num_rmems;
+	struct completion shutdown_complete;
 };
 
+/*
+ * This will return true if the remote core is in Wait For Interrupt state.
+ */
+static bool k3_r5_is_core_in_wfi(struct k3_r5_core *core)
+{
+	int ret;
+	u64 boot_vec;
+	u32 cfg, ctrl, stat;
+
+	ret = ti_sci_proc_get_status(core->tsp, &boot_vec, &cfg, &ctrl, &stat);
+
+	return !ret ? !!(stat & PROC_BOOT_STATUS_FLAG_R5_WFI) : false;
+}
+
 /**
  * k3_r5_rproc_mbox_callback() - inbound mailbox message handler
  * @client: mailbox client pointer used for requesting the mailbox channel
@@ -209,6 +225,10 @@ static void k3_r5_rproc_mbox_callback(struct mbox_client *client, void *data)
 	case RP_MBOX_ECHO_REPLY:
 		dev_info(dev, "received echo reply from %s\n", name);
 		break;
+	case RP_MBOX_SHUTDOWN_ACK:
+		dev_dbg(dev, "received shutdown_ack from %s\n", name);
+		complete(&kproc->shutdown_complete);
+		break;
 	default:
 		/* silently handle all other valid messages */
 		if (msg >= RP_MBOX_READY && msg < RP_MBOX_END_MSG)
@@ -634,6 +654,7 @@ static int k3_r5_rproc_stop(struct rproc *rproc)
 	struct k3_r5_cluster *cluster = kproc->cluster;
 	struct device *dev = kproc->dev;
 	struct k3_r5_core *core1, *core = kproc->core;
+	bool wfi;
 	int ret;
 
 
@@ -650,6 +671,24 @@ static int k3_r5_rproc_stop(struct rproc *rproc)
 		}
 	}
 
+	/* Send SHUTDOWN message to remote proc */
+	reinit_completion(&kproc->shutdown_complete);
+	ret = mbox_send_message(kproc->mbox, (void *)RP_MBOX_SHUTDOWN);
+	if (ret < 0) {
+		dev_err(dev, "Sending SHUTDOWN message failed: %d. Halting core anyway.\n", ret);
+	} else {
+		ret = wait_for_completion_timeout(&kproc->shutdown_complete,
+						  msecs_to_jiffies(1000));
+		if (ret == 0) {
+			dev_err(dev, "Timeout waiting SHUTDOWN_ACK message. Halting core anyway.\n");
+		} else {
+			ret = readx_poll_timeout(k3_r5_is_core_in_wfi, core,
+						 wfi, wfi, 200, 2000);
+			if (ret)
+				dev_err(dev, "Timeout waiting for remote proc to be in WFI state. Halting core anyway.\n");
+		}
+	}
+
 	/* halt all applicable cores */
 	if (cluster->mode == CLUSTER_MODE_LOCKSTEP) {
 		list_for_each_entry(core, &cluster->cores, elem) {
@@ -1410,6 +1449,7 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
 			goto err_config;
 		}
 
+		init_completion(&kproc->shutdown_complete);
 init_rmem:
 		k3_r5_adjust_tcm_sizes(kproc);
 
