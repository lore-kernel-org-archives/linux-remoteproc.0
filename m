Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8FF723F267;
	Mon, 17 Mar 2025 12:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742213244; cv=none; b=iNS/TM/b1G+R+kwXyDy3uQo1MoNs8cwLTeFiqB6zh25y9rl+oSnT9S8WrQqxSdTruIGTlUDUTt+AA0C5GZ6uz33z7d9eqTSRqlMmXS7rtzST5zuH+1T8iXIdho0XgKUvRK+TjZUWFtUPOgvz5akpUq37xZv4iRJyHLrcir8LFLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742213244; c=relaxed/simple;
	bh=6+8nkkIGP/zxXJ54YweBKDvwo9j/bt+Zf9uOcOgYx5o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hntfHMl5Rot/JHCax4DVkMWQYkWLjtQGle4mcj0VrucqpXEzyKD/QNx1yjtunAsOGXwWDc//fjEABufi13jO082NosD6ypnlugFAGZKIRE9FsnuNTW1jysy5Lyyl/GZZhWti1Vp29Oud52CIcYzlTeSPu8BqwoVVIqMx4FQFSJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=cBtQl4Vd; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="cBtQl4Vd"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52HC71762755497
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Mar 2025 07:07:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742213221;
	bh=1EE+ZrQgMh4heXy6zTMEUqhBiUfVWjX7abghlTFwA+k=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=cBtQl4VdptWGpgMHA60gHHWpoSBOcODnAXUuD+JTWNujAb9a76Mu2pFm6fKiFECkZ
	 WxU4PM6+G1Ku2L14PZe5gmSuBenH4UkrQ24DLTgIzYvxr+GE0dzuMv4oRHqWTOrHH9
	 th6bNmVV3vQRbkZBwGdONPGDxV05r+3ufLeSjPt4=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52HC71Gd108376
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 17 Mar 2025 07:07:01 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 17
 Mar 2025 07:07:01 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 17 Mar 2025 07:07:01 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52HC6MK5060901;
	Mon, 17 Mar 2025 07:06:58 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v9 08/26] remoteproc: k3-r5: Refactor sequential core power up/down operations
Date: Mon, 17 Mar 2025 17:36:04 +0530
Message-ID: <20250317120622.1746415-9-b-padhi@ti.com>
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

The existing implementation of the waiting mechanism in
"k3_r5_cluster_rproc_init()" waits for the "released_from_reset" flag to
be set as part of the firmware boot process in "k3_r5_rproc_start()".
The "k3_r5_cluster_rproc_init()" function is invoked in the probe
routine which causes unexpected failures in cases where the firmware is
unavailable at boot time, resulting in probe failure and removal of the
remoteproc handles in the sysfs paths.

To address this, the waiting mechanism is refactored out of the probe
routine into the appropriate "k3_r5_rproc_{prepare/unprepare}()"
functions. This allows the probe routine to complete without depending
on firmware booting, while still maintaining the required
power-synchronization between cores.

Further, this wait mechanism is dropped from
"k3_r5_rproc_{start/stop}()" functions as they deal with Core Run/Halt
operations, and as such, there is no constraint in Running or Halting
the cores of a cluster in order.

Fixes: 61f6f68447ab ("remoteproc: k3-r5: Wait for core0 power-up before powering up core1")
Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
 drivers/remoteproc/ti_k3_r5_remoteproc.c | 114 +++++++++++++----------
 1 file changed, 65 insertions(+), 49 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
index c0e4da82775d..30081eafbd36 100644
--- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
@@ -475,7 +475,7 @@ static int k3_r5_rproc_request_mbox(struct rproc *rproc)
 static int k3_r5_rproc_prepare(struct rproc *rproc)
 {
 	struct k3_r5_rproc *kproc = rproc->priv;
-	struct k3_r5_core *core = kproc->priv;
+	struct k3_r5_core *core = kproc->priv, *core0, *core1;
 	struct k3_r5_cluster *cluster = core->cluster;
 	struct device *dev = kproc->dev;
 	u32 ctrl = 0, cfg = 0, stat = 0;
@@ -483,6 +483,29 @@ static int k3_r5_rproc_prepare(struct rproc *rproc)
 	bool mem_init_dis;
 	int ret;
 
+	/*
+	 * R5 cores require to be powered on sequentially, core0 should be in
+	 * higher power state than core1 in a cluster. So, wait for core0 to
+	 * power up before proceeding to core1 and put timeout of 2sec. This
+	 * waiting mechanism is necessary because rproc_auto_boot_callback() for
+	 * core1 can be called before core0 due to thread execution order.
+	 *
+	 * By placing the wait mechanism here in .prepare() ops, this condition
+	 * is enforced for rproc boot requests from sysfs as well.
+	 */
+	core0 = list_first_entry(&cluster->cores, struct k3_r5_core, elem);
+	core1 = list_last_entry(&cluster->cores, struct k3_r5_core, elem);
+	if (cluster->mode == CLUSTER_MODE_SPLIT && core == core1 &&
+	    !core0->released_from_reset) {
+		ret = wait_event_interruptible_timeout(cluster->core_transition,
+						       core0->released_from_reset,
+						       msecs_to_jiffies(2000));
+		if (ret <= 0) {
+			dev_err(dev, "can not power up core1 before core0");
+			return -EPERM;
+		}
+	}
+
 	ret = ti_sci_proc_get_status(kproc->tsp, &boot_vec, &cfg, &ctrl, &stat);
 	if (ret < 0)
 		return ret;
@@ -498,6 +521,14 @@ static int k3_r5_rproc_prepare(struct rproc *rproc)
 		return ret;
 	}
 
+	/*
+	 * Notify all threads in the wait queue when core0 state has changed so
+	 * that threads waiting for this condition can be executed.
+	 */
+	core->released_from_reset = true;
+	if (core == core0)
+		wake_up_interruptible(&cluster->core_transition);
+
 	/*
 	 * Newer IP revisions like on J7200 SoCs support h/w auto-initialization
 	 * of TCMs, so there is no need to perform the s/w memzero. This bit is
@@ -542,11 +573,31 @@ static int k3_r5_rproc_prepare(struct rproc *rproc)
 static int k3_r5_rproc_unprepare(struct rproc *rproc)
 {
 	struct k3_r5_rproc *kproc = rproc->priv;
-	struct k3_r5_core *core = kproc->priv;
+	struct k3_r5_core *core = kproc->priv, *core0, *core1;
 	struct k3_r5_cluster *cluster = core->cluster;
 	struct device *dev = kproc->dev;
 	int ret;
 
+	/*
+	 * Ensure power-down of cores is sequential in split mode. Core1 must
+	 * power down before Core0 to maintain the expected state. By placing
+	 * the wait mechanism here in .unprepare() ops, this condition is
+	 * enforced for rproc stop or shutdown requests from sysfs and device
+	 * removal as well.
+	 */
+	core0 = list_first_entry(&cluster->cores, struct k3_r5_core, elem);
+	core1 = list_last_entry(&cluster->cores, struct k3_r5_core, elem);
+	if (cluster->mode == CLUSTER_MODE_SPLIT && core == core0 &&
+	    core1->released_from_reset) {
+		ret = wait_event_interruptible_timeout(cluster->core_transition,
+						       !core1->released_from_reset,
+						       msecs_to_jiffies(2000));
+		if (ret <= 0) {
+			dev_err(dev, "can not power down core0 before core1");
+			return -EPERM;
+		}
+	}
+
 	/* Re-use LockStep-mode reset logic for Single-CPU mode */
 	ret = (cluster->mode == CLUSTER_MODE_LOCKSTEP ||
 	       cluster->mode == CLUSTER_MODE_SINGLECPU) ?
@@ -554,6 +605,14 @@ static int k3_r5_rproc_unprepare(struct rproc *rproc)
 	if (ret)
 		dev_err(dev, "unable to disable cores, ret = %d\n", ret);
 
+	/*
+	 * Notify all threads in the wait queue when core1 state has changed so
+	 * that threads waiting for this condition can be executed.
+	 */
+	core->released_from_reset = false;
+	if (core == core1)
+		wake_up_interruptible(&cluster->core_transition);
+
 	return ret;
 }
 
@@ -577,7 +636,7 @@ static int k3_r5_rproc_unprepare(struct rproc *rproc)
 static int k3_r5_rproc_start(struct rproc *rproc)
 {
 	struct k3_r5_rproc *kproc = rproc->priv;
-	struct k3_r5_core *core0, *core = kproc->priv;
+	struct k3_r5_core *core = kproc->priv;
 	struct k3_r5_cluster *cluster = core->cluster;
 	struct device *dev = kproc->dev;
 	u32 boot_addr;
@@ -600,21 +659,9 @@ static int k3_r5_rproc_start(struct rproc *rproc)
 				goto unroll_core_run;
 		}
 	} else {
-		/* do not allow core 1 to start before core 0 */
-		core0 = list_first_entry(&cluster->cores, struct k3_r5_core,
-					 elem);
-		if (core != core0 && core0->kproc->rproc->state == RPROC_OFFLINE) {
-			dev_err(dev, "%s: can not start core 1 before core 0\n",
-				__func__);
-			return -EPERM;
-		}
-
-		ret = k3_r5_core_run(core->kproc);
+		ret = k3_r5_core_run(kproc);
 		if (ret)
 			return ret;
-
-		core->released_from_reset = true;
-		wake_up_interruptible(&cluster->core_transition);
 	}
 
 	return 0;
@@ -654,9 +701,8 @@ static int k3_r5_rproc_start(struct rproc *rproc)
 static int k3_r5_rproc_stop(struct rproc *rproc)
 {
 	struct k3_r5_rproc *kproc = rproc->priv;
-	struct k3_r5_core *core1, *core = kproc->priv;
+	struct k3_r5_core *core = kproc->priv;
 	struct k3_r5_cluster *cluster = core->cluster;
-	struct device *dev = kproc->dev;
 	int ret;
 
 	/* halt all applicable cores */
@@ -669,17 +715,7 @@ static int k3_r5_rproc_stop(struct rproc *rproc)
 			}
 		}
 	} else {
-		/* do not allow core 0 to stop before core 1 */
-		core1 = list_last_entry(&cluster->cores, struct k3_r5_core,
-					elem);
-		if (core != core1 && core1->kproc->rproc->state != RPROC_OFFLINE) {
-			dev_err(dev, "%s: can not stop core 0 before core 1\n",
-				__func__);
-			ret = -EPERM;
-			goto out;
-		}
-
-		ret = k3_r5_core_halt(core->kproc);
+		ret = k3_r5_core_halt(kproc);
 		if (ret)
 			goto out;
 	}
@@ -1441,26 +1477,6 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
 		    cluster->mode == CLUSTER_MODE_SINGLECPU ||
 		    cluster->mode == CLUSTER_MODE_SINGLECORE)
 			break;
-
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
-			dev_err(cdev,
-				"Timed out waiting for %s core to power up!\n",
-				rproc->name);
-			goto out;
-		}
 	}
 
 	return 0;
-- 
2.34.1

