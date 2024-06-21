Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2833208A4;
	Fri, 21 Jun 2024 15:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718982073; cv=none; b=VFiQGg2HQQATTlezLekr8xEXSniF2Kmufp1Lc4UXaiETQEnYiGi4O92U9YUfmwwTFc/TN/ZV5tDoT1LM9iHBxoBZbCcyLaDuxdbnlcXysz7KOuX8mYXynT6MVLsACR484TLrfuJeHIkCvOXvgeKktxFeGU5fhpYjs6+fI2uPoS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718982073; c=relaxed/simple;
	bh=7yFrKK9NIswCTWdAfTIfsx/jNUNR1eHx4Rejf20w65c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OKP+O3VFmNKfItUN3v2D9U3y6RfKJ1phqCkq5Q9mPE4GZDjLddWuQAR70xE3oBW2mM9qNIk3ySU/8/Xc9wxlVKFN1htd+oii8UNScMB4QBHDRv7/lZbM0oKbgnekDdlc/cjFOPIf4a1XPKtxwHkpVUMwEUDjVByEslahteoFRLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=fNiaTLaQ; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="fNiaTLaQ"
Received: by mail.gandi.net (Postfix) with ESMTPSA id D35C1240008;
	Fri, 21 Jun 2024 15:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1718982068;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tuLEZHHASMyGiaostTM2FutUTf8a5tx361mkuNCLLj4=;
	b=fNiaTLaQ7vBx05LKbGRfUSLWjmS8KgAEq1aO1cU5WDDunmRf7qAnEK4yvEoRBPoJ71lo12
	5Oj8GHdHTNZqrF4hiNsgLobtFTeJ+JZbwlje9B1EQa7p6u6QjwjdB0qkZLUfEBw3GO+kWo
	90c7ozUla/VSJq+PFsK4mI9BebSxq5OQrYq04j4vSeDAM4grm75A2e+JIxUOoT5UTY4v3+
	/CeXYWpRJshhqioRMkwYuqSUR1yP4BMEHmr7HzIis2VNcHRr6HNUAv0nEvi9eyC8sGFW62
	SAC6YVt+dvEY9+TF7XGAHXSadjGfwCCvOhY8bNSkF1RWNiIIUoEoqpSiP72GLw==
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
Subject: [PATCH 2/4] remoteproc: k3-r5: Introduce PM suspend/resume handlers
Date: Fri, 21 Jun 2024 17:00:56 +0200
Message-ID: <20240621150058.319524-3-richard.genoud@bootlin.com>
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

This patch adds the support for system suspend/resume to the ti_k3_R5
remoteproc driver.

In order to save maximum power, the approach here is to shutdown
completely the cores that were started by the kernel (i.e. those in
RUNNING state).
Those which were started before the kernel (in attached mode) will be
detached.

The pm_notifier mechanism is used here because the remote procs firmwares
have to be reloaded at resume, and thus the driver must have access to
the file system were the firmware is stored.

On suspend, the running remote procs are stopped, the attached remote
procs are detached and processor control released.

On resume, the reverse operation is done.

Based on work from: Hari Nagalla <hnagalla@ti.com>

Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
---
 drivers/remoteproc/ti_k3_r5_remoteproc.c | 123 ++++++++++++++++++++++-
 1 file changed, 121 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
index 39a47540c590..1f18b08618c8 100644
--- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
@@ -20,6 +20,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/remoteproc.h>
+#include <linux/suspend.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
 
@@ -112,6 +113,7 @@ struct k3_r5_cluster {
 	struct list_head cores;
 	wait_queue_head_t core_transition;
 	const struct k3_r5_soc_data *soc_data;
+	struct notifier_block pm_notifier;
 };
 
 /**
@@ -577,7 +579,8 @@ static int k3_r5_rproc_start(struct rproc *rproc)
 		/* do not allow core 1 to start before core 0 */
 		core0 = list_first_entry(&cluster->cores, struct k3_r5_core,
 					 elem);
-		if (core != core0 && core0->rproc->state == RPROC_OFFLINE) {
+		if (core != core0 && (core0->rproc->state == RPROC_OFFLINE ||
+				      core0->rproc->state == RPROC_SUSPENDED)) {
 			dev_err(dev, "%s: can not start core 1 before core 0\n",
 				__func__);
 			ret = -EPERM;
@@ -646,7 +649,8 @@ static int k3_r5_rproc_stop(struct rproc *rproc)
 		/* do not allow core 0 to stop before core 1 */
 		core1 = list_last_entry(&cluster->cores, struct k3_r5_core,
 					elem);
-		if (core != core1 && core1->rproc->state != RPROC_OFFLINE) {
+		if (core != core1 && core1->rproc->state != RPROC_OFFLINE &&
+		    core1->rproc->state != RPROC_SUSPENDED) {
 			dev_err(dev, "%s: can not stop core 0 before core 1\n",
 				__func__);
 			ret = -EPERM;
@@ -1238,6 +1242,117 @@ static int k3_r5_rproc_configure_mode(struct k3_r5_rproc *kproc)
 	return ret;
 }
 
+static int k3_r5_rproc_suspend(struct k3_r5_rproc *kproc)
+{
+	unsigned int rproc_state = kproc->rproc->state;
+	int ret;
+
+	if (rproc_state != RPROC_RUNNING && rproc_state != RPROC_ATTACHED)
+		return 0;
+
+	if (rproc_state == RPROC_RUNNING)
+		ret = rproc_shutdown(kproc->rproc);
+	else
+		ret = rproc_detach(kproc->rproc);
+
+	if (ret) {
+		dev_err(kproc->dev, "Failed to %s rproc (%d)\n",
+			(rproc_state == RPROC_RUNNING) ? "shutdown" : "detach",
+			ret);
+		return ret;
+	}
+
+	kproc->rproc->state = RPROC_SUSPENDED;
+
+	return ret;
+}
+
+static int k3_r5_rproc_resume(struct k3_r5_rproc *kproc)
+{
+	int ret;
+
+	if (kproc->rproc->state != RPROC_SUSPENDED)
+		return 0;
+
+	ret = k3_r5_rproc_configure_mode(kproc);
+	if (ret < 0)
+		return -EBUSY;
+
+	/*
+	 * ret > 0 for IPC-only mode
+	 * ret == 0 for remote proc mode
+	 */
+	if (ret == 0) {
+		/*
+		 * remote proc looses its configuration when powered off.
+		 * So, we have to configure it again on resume.
+		 */
+		ret = k3_r5_rproc_configure(kproc);
+		if (ret < 0) {
+			dev_err(kproc->dev, "k3_r5_rproc_configure failed (%d)\n", ret);
+			return -EBUSY;
+		}
+	}
+
+	return rproc_boot(kproc->rproc);
+}
+
+static int k3_r5_cluster_pm_notifier_call(struct notifier_block *bl,
+					  unsigned long state, void *unused)
+{
+	struct k3_r5_cluster *cluster = container_of(bl, struct k3_r5_cluster,
+						     pm_notifier);
+	struct k3_r5_core *core;
+	int ret;
+
+	switch (state) {
+	case PM_HIBERNATION_PREPARE:
+	case PM_RESTORE_PREPARE:
+	case PM_SUSPEND_PREPARE:
+		/* core1 should be suspended before core0 */
+		list_for_each_entry_reverse(core, &cluster->cores, elem) {
+			/*
+			 * In LOCKSTEP mode, rproc is allocated only for
+			 * core0
+			 */
+			if (core->rproc) {
+				ret = k3_r5_rproc_suspend(core->rproc->priv);
+				if (ret)
+					dev_warn(core->dev,
+						 "k3_r5_rproc_suspend failed (%d)\n", ret);
+			}
+
+			ret = ti_sci_proc_release(core->tsp);
+			if (ret)
+				dev_warn(core->dev, "ti_sci_proc_release failed (%d)\n", ret);
+		}
+		break;
+	case PM_POST_HIBERNATION:
+	case PM_POST_RESTORE:
+	case PM_POST_SUSPEND:
+		/* core0 should be started before core1 */
+		list_for_each_entry(core, &cluster->cores, elem) {
+			ret = ti_sci_proc_request(core->tsp);
+			if (ret)
+				dev_warn(core->dev, "ti_sci_proc_request failed (%d)\n", ret);
+
+			/*
+			 * In LOCKSTEP mode, rproc is allocated only for
+			 * core0
+			 */
+			if (core->rproc) {
+				ret = k3_r5_rproc_resume(core->rproc->priv);
+				if (ret)
+					dev_warn(core->dev,
+						 "k3_r5_rproc_resume failed (%d)\n", ret);
+			}
+		}
+		break;
+	}
+
+	return 0;
+}
+
 static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
 {
 	struct k3_r5_cluster *cluster = platform_get_drvdata(pdev);
@@ -1336,6 +1451,9 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
 		}
 	}
 
+	cluster->pm_notifier.notifier_call = k3_r5_cluster_pm_notifier_call;
+	register_pm_notifier(&cluster->pm_notifier);
+
 	return 0;
 
 err_split:
@@ -1402,6 +1520,7 @@ static void k3_r5_cluster_rproc_exit(void *data)
 		rproc_free(rproc);
 		core->rproc = NULL;
 	}
+	unregister_pm_notifier(&cluster->pm_notifier);
 }
 
 static int k3_r5_core_of_get_internal_memories(struct platform_device *pdev,
