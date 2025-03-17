Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC4323C380;
	Mon, 17 Mar 2025 12:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742213273; cv=none; b=XT8xjBtNhp8h96manPpKk6GjHtMLPVUaLmzlwuRABev8bTdyl5MTh8yKc1njKjpXKV8YDfcPgxcCzKOhtyvHBv0IezKBxXfc7BO6rT67GSVjyVT4BCaTel537ivYio9REAL3vIgdGlQUJAol3hNLjmEZJ/f5T9EYmUzBC/aK/sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742213273; c=relaxed/simple;
	bh=8iqJpMchQusj/fBz7nNUxocmhmDyYv2EJHkhn+0G2AM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TMV0g9mvH7f7AprsIJzcJk99h3vL9aX+bX6bxm5MpHQjMDhFnpvrsFg2s2x4H77IUBO0RbbH/2jMdWO2kQ56g87vzaTtcPVblScsKENxLJX4LcP9ZZRbDx+IaMAXfuXNI6Y7OyNPHvU7Y7P9EWJAaSUmTkVjqMQM6kP00AtEDTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=MRJcNSM1; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="MRJcNSM1"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52HC7hDA2331370
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Mar 2025 07:07:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742213263;
	bh=zua5Uy3WOy5LEXtu2zKe3lbTOB/TCSkC5p/TEW38TFU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=MRJcNSM1llJ+1sqEEbH6LFqIxv3H0ncF94YrUizp26TyLlnHoIQCYa8nce4VpchzN
	 C+9EGF8EHaoRgG4ZOFOtcG7WGE5yMRHYx4FGoqG9MqpmaSwYVkQamXnMXVv+DNKXaB
	 f12MlGnSH7H9ERGfQeO3cyTZgQAhUu4ygHpGcWCg=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52HC7hke000712
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 17 Mar 2025 07:07:43 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 17
 Mar 2025 07:07:42 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 17 Mar 2025 07:07:42 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52HC6MKG060901;
	Mon, 17 Mar 2025 07:07:39 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v9 19/26] remoteproc: k3: Refactor .attach rproc ops into common driver
Date: Mon, 17 Mar 2025 17:36:15 +0530
Message-ID: <20250317120622.1746415-20-b-padhi@ti.com>
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

The .attach rproc ops implementations in TI K3 R5, DSP and M4 drivers
are NOPs. Refactor the implementations into ti_k3_common.c driver
as k3_rproc_attach() and align R5, DSP and M4 drivers to register this
common function as .attach ops.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
 drivers/remoteproc/ti_k3_common.c         | 12 ++++++++++++
 drivers/remoteproc/ti_k3_common.h         |  1 +
 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 13 +------------
 drivers/remoteproc/ti_k3_m4_remoteproc.c  | 14 +-------------
 drivers/remoteproc/ti_k3_r5_remoteproc.c  | 13 +------------
 5 files changed, 16 insertions(+), 37 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
index 93d793e0899f..9e80d4da0d43 100644
--- a/drivers/remoteproc/ti_k3_common.c
+++ b/drivers/remoteproc/ti_k3_common.c
@@ -297,5 +297,17 @@ int k3_rproc_stop(struct rproc *rproc)
 }
 EXPORT_SYMBOL_GPL(k3_rproc_stop);
 
+/*
+ * Attach to a running remote processor (IPC-only mode)
+ *
+ * The rproc attach callback is a NOP. The remote processor is already booted,
+ * and all required resources have been acquired during probe routine, so there
+ * is no need to issue any TI-SCI commands to boot the remote cores in IPC-only
+ * mode. This callback is invoked only in IPC-only mode and exists because
+ * rproc_validate() checks for its existence.
+ */
+int k3_rproc_attach(struct rproc *rproc) { return 0; }
+EXPORT_SYMBOL_GPL(k3_rproc_attach);
+
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("TI K3 common Remoteproc code");
diff --git a/drivers/remoteproc/ti_k3_common.h b/drivers/remoteproc/ti_k3_common.h
index 0162757f024c..93f41ee41505 100644
--- a/drivers/remoteproc/ti_k3_common.h
+++ b/drivers/remoteproc/ti_k3_common.h
@@ -97,4 +97,5 @@ int k3_rproc_prepare(struct rproc *rproc);
 int k3_rproc_unprepare(struct rproc *rproc);
 int k3_rproc_start(struct rproc *rproc);
 int k3_rproc_stop(struct rproc *rproc);
+int k3_rproc_attach(struct rproc *rproc);
 #endif /* REMOTEPROC_TI_K3_COMMON_H */
diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
index c5fe2b097a6f..d7ae4b202f92 100644
--- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
@@ -58,17 +58,6 @@ static int k3_dsp_rproc_start(struct rproc *rproc)
 	return 0;
 }
 
-/*
- * Attach to a running DSP remote processor (IPC-only mode)
- *
- * This rproc attach callback is a NOP. The remote processor is already booted,
- * and all required resources have been acquired during probe routine, so there
- * is no need to issue any TI-SCI commands to boot the DSP core. This callback
- * is invoked only in IPC-only mode and exists because rproc_validate() checks
- * for its existence.
- */
-static int k3_dsp_rproc_attach(struct rproc *rproc) { return 0; }
-
 /*
  * Detach from a running DSP remote processor (IPC-only mode)
  *
@@ -172,6 +161,7 @@ static void *k3_dsp_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool
 static const struct rproc_ops k3_dsp_rproc_ops = {
 	.start		= k3_dsp_rproc_start,
 	.stop		= k3_rproc_stop,
+	.attach		= k3_rproc_attach,
 	.kick		= k3_rproc_kick,
 	.da_to_va	= k3_dsp_rproc_da_to_va,
 };
@@ -397,7 +387,6 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
 		dev_info(dev, "configured DSP for IPC-only mode\n");
 		rproc->state = RPROC_DETACHED;
 		/* override rproc ops with only required IPC-only mode ops */
-		rproc->ops->attach = k3_dsp_rproc_attach;
 		rproc->ops->detach = k3_dsp_rproc_detach;
 		rproc->ops->get_loaded_rsc_table = k3_dsp_get_loaded_rsc_table;
 	} else {
diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
index 8830b1d84675..b52a1014c934 100644
--- a/drivers/remoteproc/ti_k3_m4_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_m4_remoteproc.c
@@ -244,18 +244,6 @@ static void k3_m4_release_tsp(void *data)
 	ti_sci_proc_release(tsp);
 }
 
-/*
- * Attach to a running M4 remote processor (IPC-only mode)
- *
- * The remote processor is already booted, so there is no need to issue any
- * TI-SCI commands to boot the M4 core. This callback is used only in IPC-only
- * mode.
- */
-static int k3_m4_rproc_attach(struct rproc *rproc)
-{
-	return 0;
-}
-
 /*
  * Detach from a running M4 remote processor (IPC-only mode)
  *
@@ -273,7 +261,7 @@ static const struct rproc_ops k3_m4_rproc_ops = {
 	.unprepare = k3_rproc_unprepare,
 	.start = k3_rproc_start,
 	.stop = k3_rproc_stop,
-	.attach = k3_m4_rproc_attach,
+	.attach = k3_rproc_attach,
 	.detach = k3_m4_rproc_detach,
 	.kick = k3_rproc_kick,
 	.da_to_va = k3_m4_rproc_da_to_va,
diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
index 2bec94755e31..fe1bc3a74b09 100644
--- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
@@ -559,17 +559,6 @@ static int k3_r5_rproc_stop(struct rproc *rproc)
 	return ret;
 }
 
-/*
- * Attach to a running R5F remote processor (IPC-only mode)
- *
- * The R5F attach callback is a NOP. The remote processor is already booted, and
- * all required resources have been acquired during probe routine, so there is
- * no need to issue any TI-SCI commands to boot the R5F cores in IPC-only mode.
- * This callback is invoked only in IPC-only mode and exists because
- * rproc_validate() checks for its existence.
- */
-static int k3_r5_rproc_attach(struct rproc *rproc) { return 0; }
-
 /*
  * Detach from a running R5F remote processor (IPC-only mode)
  *
@@ -1059,7 +1048,7 @@ static int k3_r5_rproc_configure_mode(struct k3_rproc *kproc)
 		kproc->rproc->ops->unprepare = NULL;
 		kproc->rproc->ops->start = NULL;
 		kproc->rproc->ops->stop = NULL;
-		kproc->rproc->ops->attach = k3_r5_rproc_attach;
+		kproc->rproc->ops->attach = k3_rproc_attach;
 		kproc->rproc->ops->detach = k3_r5_rproc_detach;
 		kproc->rproc->ops->get_loaded_rsc_table =
 						k3_r5_get_loaded_rsc_table;
-- 
2.34.1

