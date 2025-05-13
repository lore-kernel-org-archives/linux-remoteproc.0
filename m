Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988047DA7F;
	Tue, 13 May 2025 05:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747115138; cv=none; b=aewm4eUD7UqdlcRy8qgoyYhE8e31+gmnxPUZ1hmsw/MqQMYKAACvYXzUxdPPI+siAuy1SOTaoGfcqLbrfkH0db6i905dh9Aej4eyRMxjsQ06kkvGp1sVMMEWxBLKjGo0rULHSgteRJf0eTBSpYvwRP41DH2KgdpW2wn3bSyEyAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747115138; c=relaxed/simple;
	bh=0J09EsxHKrk964zQrojEq2bXM5GKL329ixByMUyBP/Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qL7ZE0FIB/hC5LwzTRB9NE+7ut0e2iPjBCk5+jvJ+ifCurTsfOjgDFwe291yRq6blLF4dJ02dN6M257s2E+qSJTNn0NEv3JmLJV2C8E8TMd9ptbZAtI7CsvwaT5vpfJwdFSncxMSx5HTihWVRg23LFioxM7vqYm/0uHANB6OBbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=uo4p5X2f; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="uo4p5X2f"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 54D5jSJA2764224
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 May 2025 00:45:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747115128;
	bh=ZhvFCfBAy7aVEJqwbeVRNOdju6nJ1u+171Ob+t10kBw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=uo4p5X2fdlgb1IOuVqiM6dLpSJqGO/+N4Xgs4CdxWSuoQ9N4XTv+n1NrjBbfKcOhI
	 fznb1el55wj9C9pvFh9RCDgLu8YoNRe6BvJxE4+Agvz1gCpmpraGE4g5XWXJEp/Ows
	 W4rDJz4yXs6w76zdDlC8tqYlNcc/5nBMEajI6Pwg=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 54D5jSL3088455
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 13 May 2025 00:45:28 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 13
 May 2025 00:45:28 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 13 May 2025 00:45:27 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54D5jAqC131001;
	Tue, 13 May 2025 00:45:24 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v12 03/36] remoteproc: k3-r5: Refactor sequential core power up/down operations
Date: Tue, 13 May 2025 11:14:37 +0530
Message-ID: <20250513054510.3439842-4-b-padhi@ti.com>
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
Tested-by: Judith Mendez <jm@ti.com>
Reviewed-by: Andrew Davis <afd@ti.com>
---
v12: Changelog:
1. Carried R/B tag.

Link to v11:
https://lore.kernel.org/all/20250425104135.830255-4-b-padhi@ti.com/

v11: Changelog:
1. Carried T/B tag.

Link to v10:
https://lore.kernel.org/all/20250417182001.3903905-4-b-padhi@ti.com/

v10: Changelog:
1. Re-ordered this patch from [v9 08/26] to [v10 03/33].

Link to v9:
https://lore.kernel.org/all/20250317120622.1746415-9-b-padhi@ti.com/

 drivers/remoteproc/ti_k3_r5_remoteproc.c | 110 +++++++++++++----------
 1 file changed, 63 insertions(+), 47 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
index 3fc0b97dec600..ba082ca13e750 100644
--- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
@@ -440,13 +440,36 @@ static int k3_r5_rproc_prepare(struct rproc *rproc)
 {
 	struct k3_r5_rproc *kproc = rproc->priv;
 	struct k3_r5_cluster *cluster = kproc->cluster;
-	struct k3_r5_core *core = kproc->core;
+	struct k3_r5_core *core = kproc->core, *core0, *core1;
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
 	ret = ti_sci_proc_get_status(core->tsp, &boot_vec, &cfg, &ctrl, &stat);
 	if (ret < 0)
 		return ret;
@@ -462,6 +485,14 @@ static int k3_r5_rproc_prepare(struct rproc *rproc)
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
@@ -507,10 +538,30 @@ static int k3_r5_rproc_unprepare(struct rproc *rproc)
 {
 	struct k3_r5_rproc *kproc = rproc->priv;
 	struct k3_r5_cluster *cluster = kproc->cluster;
-	struct k3_r5_core *core = kproc->core;
+	struct k3_r5_core *core = kproc->core, *core0, *core1;
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
@@ -518,6 +569,14 @@ static int k3_r5_rproc_unprepare(struct rproc *rproc)
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
 
@@ -543,7 +602,7 @@ static int k3_r5_rproc_start(struct rproc *rproc)
 	struct k3_r5_rproc *kproc = rproc->priv;
 	struct k3_r5_cluster *cluster = kproc->cluster;
 	struct device *dev = kproc->dev;
-	struct k3_r5_core *core0, *core;
+	struct k3_r5_core *core;
 	u32 boot_addr;
 	int ret;
 
@@ -565,21 +624,9 @@ static int k3_r5_rproc_start(struct rproc *rproc)
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
-
-		core->released_from_reset = true;
-		wake_up_interruptible(&cluster->core_transition);
 	}
 
 	return 0;
@@ -620,8 +667,7 @@ static int k3_r5_rproc_stop(struct rproc *rproc)
 {
 	struct k3_r5_rproc *kproc = rproc->priv;
 	struct k3_r5_cluster *cluster = kproc->cluster;
-	struct device *dev = kproc->dev;
-	struct k3_r5_core *core1, *core = kproc->core;
+	struct k3_r5_core *core = kproc->core;
 	int ret;
 
 	/* halt all applicable cores */
@@ -634,16 +680,6 @@ static int k3_r5_rproc_stop(struct rproc *rproc)
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
-		}
-
 		ret = k3_r5_core_halt(core);
 		if (ret)
 			goto out;
@@ -1271,26 +1307,6 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
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
-			dev_err(dev,
-				"Timed out waiting for %s core to power up!\n",
-				rproc->name);
-			goto out;
-		}
 	}
 
 	return 0;
-- 
2.34.1

