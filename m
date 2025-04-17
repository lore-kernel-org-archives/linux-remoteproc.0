Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 985DE264A96;
	Thu, 17 Apr 2025 18:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744914112; cv=none; b=Ygn4ys8ik+4ST7F/vzjJCRflbg4dA5wWZ9uDadTJfcyUjnVFDtK/dROatF/QV5C5RulC+S9gXtwIUAGE0aWSb0FdE5hDImEDWwJkPmqP9yTWXZIIALYgnHbI5om2b7QbjjBaJnq7U8WVBRkOX88IJrcSD7lHlBauldCZ2YxVXEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744914112; c=relaxed/simple;
	bh=K8fDVS+NapG0LYuw75MNQgLFQoOsqK1L81yyxwXlIQo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ClzfeBhRnIiQiQ3xvcRTlkBVds1ZuNtqUJCfFu7jxn5yfIX1TeW7nQlHR27d05CTGnXrKgWI4pIWxH1EH9gt1Zuuw/LXaHgqJTMDqcIaeiCNIspPTLwdsyK9gCIsPvzD8AdrtuAXTFTJQCUAxZVmfjF7fB7ncHbGTDtYEaP3e60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=bSGR7CVQ; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="bSGR7CVQ"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53HILh2v776091
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Apr 2025 13:21:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744914103;
	bh=XO+bZGGt3K/n9uPPeaXr8wA9AGSBIAkwr/nYPcGCxTY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=bSGR7CVQ+UGkWPHYuAsgSvIodQOM9AXa6RwpmcXUVh3/dfnq1jTc84cTw2l+Tua25
	 ccMWXaXWEs+bZYcA1ZfW2X4Ol0isxLFlWq8MlhM05rvYBLBFhMpbxCwBqoMAg21wb8
	 vE3RleQbU8UdAjZvVRtYQTCV30lqyBNcN+vuioTg=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53HILhJZ068083
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 17 Apr 2025 13:21:43 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 17
 Apr 2025 13:21:43 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 17 Apr 2025 13:21:42 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53HIK1IA071102;
	Thu, 17 Apr 2025 13:21:39 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v10 26/33] remoteproc: k3: Refactor .attach rproc ops into common driver
Date: Thu, 17 Apr 2025 23:49:54 +0530
Message-ID: <20250417182001.3903905-27-b-padhi@ti.com>
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

The .attach rproc ops implementations in TI K3 R5, DSP and M4 drivers
are NOPs. Refactor the implementations into ti_k3_common.c driver
as k3_rproc_attach() and register this common function as .attach ops in
R5, DSP and M4 drivers.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
v10: Changelog:
1. Don't remove dsp func override. Already done by [v10 20/33] patch.

Link to v9:
https://lore.kernel.org/all/20250317120622.1746415-20-b-padhi@ti.com/

 drivers/remoteproc/ti_k3_common.c         | 12 ++++++++++++
 drivers/remoteproc/ti_k3_common.h         |  1 +
 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 13 +------------
 drivers/remoteproc/ti_k3_m4_remoteproc.c  | 14 +-------------
 drivers/remoteproc/ti_k3_r5_remoteproc.c  | 13 +------------
 5 files changed, 16 insertions(+), 37 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
index 2f607f63e512b..54c1604cd4396 100644
--- a/drivers/remoteproc/ti_k3_common.c
+++ b/drivers/remoteproc/ti_k3_common.c
@@ -298,5 +298,17 @@ int k3_rproc_stop(struct rproc *rproc)
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
index 0162757f024c9..93f41ee415058 100644
--- a/drivers/remoteproc/ti_k3_common.h
+++ b/drivers/remoteproc/ti_k3_common.h
@@ -97,4 +97,5 @@ int k3_rproc_prepare(struct rproc *rproc);
 int k3_rproc_unprepare(struct rproc *rproc);
 int k3_rproc_start(struct rproc *rproc);
 int k3_rproc_stop(struct rproc *rproc);
+int k3_rproc_attach(struct rproc *rproc);
 #endif /* REMOTEPROC_TI_K3_COMMON_H */
diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
index f506a9360879a..12858c7f1958d 100644
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
@@ -172,7 +161,7 @@ static void *k3_dsp_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool
 static const struct rproc_ops k3_dsp_rproc_ops = {
 	.start			= k3_dsp_rproc_start,
 	.stop			= k3_rproc_stop,
-	.attach			= k3_dsp_rproc_attach,
+	.attach			= k3_rproc_attach,
 	.detach			= k3_dsp_rproc_detach,
 	.kick			= k3_rproc_kick,
 	.da_to_va		= k3_dsp_rproc_da_to_va,
diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
index 66c4aee332534..add1f3e670f5d 100644
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
index 6177610d63980..13bccd7296f68 100644
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

