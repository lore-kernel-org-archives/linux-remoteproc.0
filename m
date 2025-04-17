Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3BA9256C80;
	Thu, 17 Apr 2025 18:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744914116; cv=none; b=BjN2tYI4DDI/oiAH7wjkgKGneTRwYL0DU1f85OAqnz4zF61bkJhZPCU7IepYzwyPa8+3ExgnvARt/gKh2OkFpzLJrXRpMlCGEXxp4bj8klJG4nLjUqYqqo4pS5lPxk9CtCjXudLPp5K7gd4uvAJ4Y/fasF/0QFilfep6enq/Wtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744914116; c=relaxed/simple;
	bh=UlSHxJuMeatdsBlElLUquvf8za2WVK5RzdlHQn4Ma2M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UeVBA5ene5HxLz+OJQZQDW0kTBBqI+pJQrRxw/0MEdvtZan0ao81GpdErP4GlIkacRTnK71AHzlM2FEKX+JhyVpJ2+DTIN5EphZrkINyfIu1I7Chp4hUXrSG7fQ3tWb0Ecjpewch3d2niMUuWR1LORpTrMS5nzBgyhUXAXggDW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=UyMopQFu; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="UyMopQFu"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53HILlVw720183
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Apr 2025 13:21:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744914107;
	bh=D0aHYFML7XGFxwCZS9PnlzTE2h/0uz1bfKGMcWu3NhI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=UyMopQFupZRD6RbssxqDc3CX+7UIBBa54tbxtdW6ZoQ3gh1/+9Sanimz88ccupl4p
	 /mnNgTxd84wsqOjdF5z6kGUEhmuquiCAuMF6d3HQOsK6bO1iUnKLsuhbAP5Pd8BfW/
	 R1vTYXhlIWZ55jm5LsQScDdruwcgiMRbijmBgmpU=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53HILlH3023411
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 17 Apr 2025 13:21:47 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 17
 Apr 2025 13:21:46 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 17 Apr 2025 13:21:46 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53HIK1IB071102;
	Thu, 17 Apr 2025 13:21:43 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v10 27/33] remoteproc: k3: Refactor .detach rproc ops into common driver
Date: Thu, 17 Apr 2025 23:49:55 +0530
Message-ID: <20250417182001.3903905-28-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250417182001.3903905-1-b-padhi@ti.com>
References: <20250417182001.3903905-1-b-padhi@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

The .detach rproc ops implementations in TI K3 R5, DSP and M4
remoteproc drivers are NOPs. Refactor the implementations into
ti_k3_common.c driver as k3_rproc_detach() and register this common
function as .detach ops in R5, DSP and M4 drivers.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
v10: Changelog:
1. Don't remove dsp func override. Already done by [v10 20/33] patch.

Link to v9:
https://lore.kernel.org/all/20250317120622.1746415-21-b-padhi@ti.com/

 drivers/remoteproc/ti_k3_common.c         | 10 ++++++++++
 drivers/remoteproc/ti_k3_common.h         |  1 +
 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 11 +----------
 drivers/remoteproc/ti_k3_m4_remoteproc.c  | 14 +-------------
 drivers/remoteproc/ti_k3_r5_remoteproc.c  | 11 +----------
 5 files changed, 14 insertions(+), 33 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
index 54c1604cd4396..98f638fe3fe6b 100644
--- a/drivers/remoteproc/ti_k3_common.c
+++ b/drivers/remoteproc/ti_k3_common.c
@@ -310,5 +310,15 @@ EXPORT_SYMBOL_GPL(k3_rproc_stop);
 int k3_rproc_attach(struct rproc *rproc) { return 0; }
 EXPORT_SYMBOL_GPL(k3_rproc_attach);
 
+/*
+ * Detach from a running remote processor (IPC-only mode)
+ *
+ * The rproc detach callback is a NOP. The remote processor is not stopped and
+ * will be left in booted state in IPC-only mode. This callback is invoked only
+ * in IPC-only mode and exists for sanity sake
+ */
+int k3_rproc_detach(struct rproc *rproc) { return 0; }
+EXPORT_SYMBOL_GPL(k3_rproc_detach);
+
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("TI K3 common Remoteproc code");
diff --git a/drivers/remoteproc/ti_k3_common.h b/drivers/remoteproc/ti_k3_common.h
index 93f41ee415058..97345349b818a 100644
--- a/drivers/remoteproc/ti_k3_common.h
+++ b/drivers/remoteproc/ti_k3_common.h
@@ -98,4 +98,5 @@ int k3_rproc_unprepare(struct rproc *rproc);
 int k3_rproc_start(struct rproc *rproc);
 int k3_rproc_stop(struct rproc *rproc);
 int k3_rproc_attach(struct rproc *rproc);
+int k3_rproc_detach(struct rproc *rproc);
 #endif /* REMOTEPROC_TI_K3_COMMON_H */
diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
index 12858c7f1958d..a62a69d9f80ed 100644
--- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
@@ -58,15 +58,6 @@ static int k3_dsp_rproc_start(struct rproc *rproc)
 	return 0;
 }
 
-/*
- * Detach from a running DSP remote processor (IPC-only mode)
- *
- * This rproc detach callback is a NOP. The DSP core is not stopped and will be
- * left to continue to run its booted firmware. This callback is invoked only in
- * IPC-only mode and exists for sanity sake.
- */
-static int k3_dsp_rproc_detach(struct rproc *rproc) { return 0; }
-
 /*
  * This function implements the .get_loaded_rsc_table() callback and is used
  * to provide the resource table for a booted DSP in IPC-only mode. The K3 DSP
@@ -162,7 +153,7 @@ static const struct rproc_ops k3_dsp_rproc_ops = {
 	.start			= k3_dsp_rproc_start,
 	.stop			= k3_rproc_stop,
 	.attach			= k3_rproc_attach,
-	.detach			= k3_dsp_rproc_detach,
+	.detach			= k3_rproc_detach,
 	.kick			= k3_rproc_kick,
 	.da_to_va		= k3_dsp_rproc_da_to_va,
 	.get_loaded_rsc_table	= k3_dsp_get_loaded_rsc_table,
diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
index add1f3e670f5d..0884087cc9f9d 100644
--- a/drivers/remoteproc/ti_k3_m4_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_m4_remoteproc.c
@@ -244,25 +244,13 @@ static void k3_m4_release_tsp(void *data)
 	ti_sci_proc_release(tsp);
 }
 
-/*
- * Detach from a running M4 remote processor (IPC-only mode)
- *
- * This rproc detach callback performs the opposite operation to attach
- * callback, the M4 core is not stopped and will be left to continue to
- * run its booted firmware. This callback is invoked only in IPC-only mode.
- */
-static int k3_m4_rproc_detach(struct rproc *rproc)
-{
-	return 0;
-}
-
 static const struct rproc_ops k3_m4_rproc_ops = {
 	.prepare = k3_rproc_prepare,
 	.unprepare = k3_rproc_unprepare,
 	.start = k3_rproc_start,
 	.stop = k3_rproc_stop,
 	.attach = k3_rproc_attach,
-	.detach = k3_m4_rproc_detach,
+	.detach = k3_rproc_detach,
 	.kick = k3_rproc_kick,
 	.da_to_va = k3_m4_rproc_da_to_va,
 	.get_loaded_rsc_table = k3_m4_get_loaded_rsc_table,
diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
index 13bccd7296f68..49b576872103e 100644
--- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
@@ -559,15 +559,6 @@ static int k3_r5_rproc_stop(struct rproc *rproc)
 	return ret;
 }
 
-/*
- * Detach from a running R5F remote processor (IPC-only mode)
- *
- * The R5F detach callback is a NOP. The R5F cores are not stopped and will be
- * left in booted state in IPC-only mode. This callback is invoked only in
- * IPC-only mode and exists for sanity sake.
- */
-static int k3_r5_rproc_detach(struct rproc *rproc) { return 0; }
-
 /*
  * This function implements the .get_loaded_rsc_table() callback and is used
  * to provide the resource table for the booted R5F in IPC-only mode. The K3 R5F
@@ -1049,7 +1040,7 @@ static int k3_r5_rproc_configure_mode(struct k3_rproc *kproc)
 		kproc->rproc->ops->start = NULL;
 		kproc->rproc->ops->stop = NULL;
 		kproc->rproc->ops->attach = k3_rproc_attach;
-		kproc->rproc->ops->detach = k3_r5_rproc_detach;
+		kproc->rproc->ops->detach = k3_rproc_detach;
 		kproc->rproc->ops->get_loaded_rsc_table =
 						k3_r5_get_loaded_rsc_table;
 	} else if (!c_state) {
-- 
2.34.1

