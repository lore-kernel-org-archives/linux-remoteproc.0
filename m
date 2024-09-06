Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5E2158866;
	Fri,  6 Sep 2024 09:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725615656; cv=none; b=fci2u2w+jy4Ly+yfHzzRDk1RRyjdmI1b+nDOo2i+4wo+ErP998eOS9J9PcEdMzgSXQKMgiNfNe0qhI6HZxgmGq8M8kBHMRG9YoCdpeurwJwM/gy3aeMv/bxjKnqjlQw5s2/I4DOFGGoqFhqHYzGM77kP/lziyUUB4K9ncw/V1TA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725615656; c=relaxed/simple;
	bh=Rf23nLMMnpDSsl8DbubwZcv09/McL7X7WelY1HGBtOA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QimGMnO/8N05NgnHqbw+eNAjZEkU1czC24cyYrIVN4040q6Sb9W6QmQ6X14WlacBc/RJmjBkuRiQmnPsTB7LZuUcwKC1/Lvd4L9wDu8yOi+5VTNCjhty9uRSr2BDJMpITbXXQXwnJc1G198Brm7SBirJjV7laAGp/6lO557Yjbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=k9WzHRpk; arc=none smtp.client-ip=198.47.19.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="k9WzHRpk"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4869eniO050197;
	Fri, 6 Sep 2024 04:40:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1725615649;
	bh=Wig9kl5MjN/r+LVf+hHFZQR13MPDpSoRn8VKvplPS3k=;
	h=From:To:CC:Subject:Date;
	b=k9WzHRpkX+fDpm+79GEp6R99UA0eWwQOvG1jVedl2bADVQ/r5xNlTAxk95uA+wsMH
	 pqFh2FnivRtuKbHWBsW26JGEfq4Hgq3ND2WiMJv9RauRFg31bZ35RTjj+vD2SbkHDb
	 RHPQIdBnaoy8jhgaknNE38kKPeAq9V/ewKIwj4aM=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4869enZt108678;
	Fri, 6 Sep 2024 04:40:49 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 6
 Sep 2024 04:40:48 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 6 Sep 2024 04:40:48 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4869ejAu083001;
	Fri, 6 Sep 2024 04:40:46 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <b-padhi@ti.com>, <afd@ti.com>, <hnagalla@ti.com>, <s-anna@ti.com>,
        <u-kumar1@ti.com>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH] remoteproc: k3-r5: Decouple firmware booting from probe routine
Date: Fri, 6 Sep 2024 15:10:45 +0530
Message-ID: <20240906094045.2428977-1-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

The current implementation of the waiting mechanism in probe() waits for
the 'released_from_reset' flag to be set which is done in
k3_r5_rproc_prepare() as part of rproc_fw_boot(). This causes unexpected
failures in cases where the firmware is unavailable at boot time,
resulting in probe failure and removal of the remoteproc handles in the
sysfs paths.

To address this, the waiting mechanism is refactored out of the probe
routine into the appropriate k3_r5_rproc_prepare/unprepare() and
k3_r5_rproc_start/stop() functions. This allows the probe routine to
complete without depending on firmware booting, while still maintaining
the required power-synchronization between cores.

Fixes: 61f6f68447ab ("remoteproc: k3-r5: Wait for core0 power-up before powering up core1")
Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
Posted this as a Fix as this was breaking usecases where we wanted to load a
firmware by writing to sysfs handles in userspace.

 drivers/remoteproc/ti_k3_r5_remoteproc.c | 170 ++++++++++++++++-------
 1 file changed, 118 insertions(+), 52 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
index 747ee467da88..df8f124f4248 100644
--- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
@@ -131,6 +131,7 @@ struct k3_r5_cluster {
  * @btcm_enable: flag to control BTCM enablement
  * @loczrama: flag to dictate which TCM is at device address 0x0
  * @released_from_reset: flag to signal when core is out of reset
+ * @unhalted: flag to signal when core is unhalted
  */
 struct k3_r5_core {
 	struct list_head elem;
@@ -148,6 +149,7 @@ struct k3_r5_core {
 	u32 btcm_enable;
 	u32 loczrama;
 	bool released_from_reset;
+	bool unhalted;
 };
 
 /**
@@ -448,13 +450,33 @@ static int k3_r5_rproc_prepare(struct rproc *rproc)
 {
 	struct k3_r5_rproc *kproc = rproc->priv;
 	struct k3_r5_cluster *cluster = kproc->cluster;
-	struct k3_r5_core *core = kproc->core;
+	struct k3_r5_core *core0, *core1, *core = kproc->core;
 	struct device *dev = kproc->dev;
 	u32 ctrl = 0, cfg = 0, stat = 0;
 	u64 boot_vec = 0;
 	bool mem_init_dis;
 	int ret;
 
+	/*
+	 * R5 cores require to be powered on sequentially, core0 should be in
+	 * higher power state than core1 in a cluster. So, wait for core0 to
+	 * power up before proceeding to core1 and put timeout of 2sec. This
+	 * waiting mechanism is necessary because rproc_auto_boot_callback() for
+	 * core1 can be called before core0 due to thread execution order.
+	 */
+	core0 = list_first_entry(&cluster->cores, struct k3_r5_core, elem);
+	core1 = list_last_entry(&cluster->cores, struct k3_r5_core, elem);
+	if (cluster->mode == CLUSTER_MODE_SPLIT && core == core1 &&
+	    core0->released_from_reset == false) {
+		ret = wait_event_interruptible_timeout(cluster->core_transition,
+						       core0->released_from_reset,
+						       msecs_to_jiffies(2000));
+		if (ret <= 0) {
+			dev_err(dev, "can not power up core1 before core0");
+			return -EPERM;
+		}
+	}
+
 	ret = ti_sci_proc_get_status(core->tsp, &boot_vec, &cfg, &ctrl, &stat);
 	if (ret < 0)
 		return ret;
@@ -470,6 +492,12 @@ static int k3_r5_rproc_prepare(struct rproc *rproc)
 		return ret;
 	}
 
+	/* Notify all threads in the wait queue when core state has changed so
+	 * that threads waiting for this condition can be executed.
+	 */
+	core->released_from_reset = true;
+	wake_up_interruptible(&cluster->core_transition);
+
 	/*
 	 * Newer IP revisions like on J7200 SoCs support h/w auto-initialization
 	 * of TCMs, so there is no need to perform the s/w memzero. This bit is
@@ -515,14 +543,46 @@ static int k3_r5_rproc_unprepare(struct rproc *rproc)
 {
 	struct k3_r5_rproc *kproc = rproc->priv;
 	struct k3_r5_cluster *cluster = kproc->cluster;
-	struct k3_r5_core *core = kproc->core;
+	struct k3_r5_core *core0, *core1, *core = kproc->core;
 	struct device *dev = kproc->dev;
 	int ret;
 
 	/* Re-use LockStep-mode reset logic for Single-CPU mode */
-	ret = (cluster->mode == CLUSTER_MODE_LOCKSTEP ||
-	       cluster->mode == CLUSTER_MODE_SINGLECPU) ?
-		k3_r5_lockstep_reset(cluster) : k3_r5_split_reset(core);
+	if (cluster->mode == CLUSTER_MODE_LOCKSTEP ||
+	    cluster->mode == CLUSTER_MODE_SINGLECPU)
+		ret = k3_r5_lockstep_reset(cluster);
+	else {
+		/*
+		 * R5 cores require to be powered off sequentially, core0 should
+		 * be in higher power state than core1 in a cluster. So, wait
+		 * for core1 to powered off before proceeding to core0 and put
+		 * timeout of 2sec. This waiting mechanism is necessary to
+		 * prevent stopping core0 before core1 from sysfs.
+		 */
+		core0 = list_first_entry(&cluster->cores, struct k3_r5_core, elem);
+		core1 = list_last_entry(&cluster->cores, struct k3_r5_core, elem);
+
+		if (core == core0 && core1->released_from_reset == true) {
+			ret = wait_event_interruptible_timeout(cluster->core_transition,
+							       !core1->released_from_reset,
+							       msecs_to_jiffies(2000));
+
+			if (ret <= 0) {
+				dev_err(dev, "can not power off core0 before core1");
+				return -EPERM;
+			}
+		}
+
+		ret = k3_r5_split_reset(core);
+
+		/* Notify all threads in the wait queue when core state has
+		 * changed so that threads waiting for this condition can be
+		 * executed.
+		 */
+		core->released_from_reset = false;
+		wake_up_interruptible(&cluster->core_transition);
+	}
+
 	if (ret)
 		dev_err(dev, "unable to disable cores, ret = %d\n", ret);
 
@@ -551,16 +611,34 @@ static int k3_r5_rproc_start(struct rproc *rproc)
 	struct k3_r5_rproc *kproc = rproc->priv;
 	struct k3_r5_cluster *cluster = kproc->cluster;
 	struct device *dev = kproc->dev;
-	struct k3_r5_core *core0, *core;
+	struct k3_r5_core *core0, *core1, *core = kproc->core;
 	u32 boot_addr;
 	int ret;
 
+	/*
+	 * R5 cores require to be powered on sequentially, core0 should be in
+	 * higher power state than core1 in a cluster. So, wait for core0 to
+	 * power up before proceeding to core1 and put timeout of 2sec. This
+	 * waiting mechanism is necessary because rproc_auto_boot_callback() for
+	 * core1 can be called before core0 due to thread execution order.
+	 */
+	core0 = list_first_entry(&cluster->cores, struct k3_r5_core, elem);
+	core1 = list_last_entry(&cluster->cores, struct k3_r5_core, elem);
+	if (cluster->mode == CLUSTER_MODE_SPLIT && core == core1 && core0->unhalted == false) {
+		ret = wait_event_interruptible_timeout(cluster->core_transition,
+						       core0->unhalted,
+						       msecs_to_jiffies(2000));
+		if (ret <= 0) {
+			dev_err(dev, "can not power up core1 before core0");
+			return -EPERM;
+		}
+	}
+
 	boot_addr = rproc->bootaddr;
 	/* TODO: add boot_addr sanity checking */
 	dev_dbg(dev, "booting R5F core using boot addr = 0x%x\n", boot_addr);
 
 	/* boot vector need not be programmed for Core1 in LockStep mode */
-	core = kproc->core;
 	ret = ti_sci_proc_set_config(core->tsp, boot_addr, 0, 0);
 	if (ret)
 		return ret;
@@ -573,20 +651,15 @@ static int k3_r5_rproc_start(struct rproc *rproc)
 				goto unroll_core_run;
 		}
 	} else {
-		/* do not allow core 1 to start before core 0 */
-		core0 = list_first_entry(&cluster->cores, struct k3_r5_core,
-					 elem);
-		if (core != core0 && core0->rproc->state == RPROC_OFFLINE) {
-			dev_err(dev, "%s: can not start core 1 before core 0\n",
-				__func__);
-			return -EPERM;
-		}
-
 		ret = k3_r5_core_run(core);
 		if (ret)
 			return ret;
 
-		core->released_from_reset = true;
+		/* Notify all threads in the wait queue when core state has
+		 * changed so that threads waiting for this condition can be
+		 * executed.
+		 */
+		core->unhalted = true;
 		wake_up_interruptible(&cluster->core_transition);
 	}
 
@@ -629,7 +702,7 @@ static int k3_r5_rproc_stop(struct rproc *rproc)
 	struct k3_r5_rproc *kproc = rproc->priv;
 	struct k3_r5_cluster *cluster = kproc->cluster;
 	struct device *dev = kproc->dev;
-	struct k3_r5_core *core1, *core = kproc->core;
+	struct k3_r5_core *core0, *core1, *core = kproc->core;
 	int ret;
 
 	/* halt all applicable cores */
@@ -642,19 +715,38 @@ static int k3_r5_rproc_stop(struct rproc *rproc)
 			}
 		}
 	} else {
-		/* do not allow core 0 to stop before core 1 */
-		core1 = list_last_entry(&cluster->cores, struct k3_r5_core,
-					elem);
-		if (core != core1 && core1->rproc->state != RPROC_OFFLINE) {
-			dev_err(dev, "%s: can not stop core 0 before core 1\n",
-				__func__);
-			ret = -EPERM;
-			goto out;
+		/*
+		 * R5 cores require to be powered off sequentially, core0 should
+		 * be in higher power state than core1 in a cluster. So, wait
+		 * for core1 to powered off before proceeding to core0 and put
+		 * timeout of 2sec. This waiting mechanism is necessary to
+		 * prevent stopping core0 before core1 from sysfs.
+		 */
+		core0 = list_first_entry(&cluster->cores, struct k3_r5_core, elem);
+		core1 = list_last_entry(&cluster->cores, struct k3_r5_core, elem);
+
+		if (core == core0 && core1->unhalted == true) {
+			ret = wait_event_interruptible_timeout(cluster->core_transition,
+							       !core1->unhalted,
+							       msecs_to_jiffies(2000));
+
+			if (ret <= 0) {
+				dev_err(dev, "can not power off core0 before core1");
+				ret = -EPERM;
+				goto out;
+			}
 		}
 
 		ret = k3_r5_core_halt(core);
 		if (ret)
 			goto out;
+
+		/* Notify all threads in the wait queue when core state has
+		 * changed so that threads waiting for this condition can be
+		 * executed.
+		 */
+		core->unhalted = false;
+		wake_up_interruptible(&cluster->core_transition);
 	}
 
 	return 0;
@@ -1145,12 +1237,6 @@ static int k3_r5_rproc_configure_mode(struct k3_r5_rproc *kproc)
 		return reset_ctrl_status;
 	}
 
-	/*
-	 * Skip the waiting mechanism for sequential power-on of cores if the
-	 * core has already been booted by another entity.
-	 */
-	core->released_from_reset = c_state;
-
 	ret = ti_sci_proc_get_status(core->tsp, &boot_vec, &cfg, &ctrl,
 				     &stat);
 	if (ret < 0) {
@@ -1296,25 +1382,6 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
 		    cluster->mode == CLUSTER_MODE_SINGLECORE)
 			break;
 
-		/*
-		 * R5 cores require to be powered on sequentially, core0
-		 * should be in higher power state than core1 in a cluster
-		 * So, wait for current core to power up before proceeding
-		 * to next core and put timeout of 2sec for each core.
-		 *
-		 * This waiting mechanism is necessary because
-		 * rproc_auto_boot_callback() for core1 can be called before
-		 * core0 due to thread execution order.
-		 */
-		ret = wait_event_interruptible_timeout(cluster->core_transition,
-						       core->released_from_reset,
-						       msecs_to_jiffies(2000));
-		if (ret <= 0) {
-			dev_err(dev,
-				"Timed out waiting for %s core to power up!\n",
-				rproc->name);
-			goto err_powerup;
-		}
 	}
 
 	return 0;
@@ -1329,7 +1396,6 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
 		}
 	}
 
-err_powerup:
 	rproc_del(rproc);
 err_add:
 	k3_r5_reserved_mem_exit(kproc);
-- 
2.34.1

