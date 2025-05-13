Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED14D1EE00C;
	Tue, 13 May 2025 05:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747115247; cv=none; b=G6/hc9PJ0spT22ZMv87PFCCdI7WMqWB4mdp8J2Jy2cqZFFPO0y7ll45QewG6u10AYzXXV9lUJAgbr23xqxz0YKUNQGIa1l8x8vxNKuUjlIe320wZ3BS7SiQ6lPd4Q6qoSYeD6YxPhPOjzZHDUYY8gc5piI7+/ivexygDoC7suJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747115247; c=relaxed/simple;
	bh=0sX7hkk+45vXuLRsZuBgacGY8u3BEg93KCbAY0/nBDs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LW+rIPhC/NOkhBVdsSxeS6bv1VJyV+JVtsRnCICoUDxNR4MrFcVavgzpfbWpECrkjXtw4Wazsho7W0NUd25EQqyz04QNgP4gQn4+qkGzqGckjxTNdxs5tw7Y0uqST1KeWtQLGuB5RknlhNgsrdtpkgOnThCVEBSnCV1lXiFAe4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=nn6B50qI; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="nn6B50qI"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 54D5lFPO2210914
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 May 2025 00:47:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747115236;
	bh=0yHdHRDw7EPMsqkBKDcoOGCY5hfHrve2aNyW9vJkT2k=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=nn6B50qIiCTCkvp6riecMdV/EHty1PgqrAxOWxpgKeyf06epf+f6LAH/kguT18VPH
	 Te2Gd6u8Coo6teAseHeFG931RKEkuhBnNxQoO9J0/n03PMcv6A/WhnyrV9ftRtnFXT
	 tsp4QfRPdszrOLNoiGNuWoiBYJoKaCiDbqtL+j8E=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 54D5lFIA028367
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 13 May 2025 00:47:15 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 13
 May 2025 00:47:15 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 13 May 2025 00:47:15 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54D5jAqc131001;
	Tue, 13 May 2025 00:47:11 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v12 29/36] remoteproc: k3: Refactor .attach rproc ops into common driver
Date: Tue, 13 May 2025 11:15:03 +0530
Message-ID: <20250513054510.3439842-30-b-padhi@ti.com>
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

The .attach rproc ops implementations in TI K3 R5, DSP and M4 drivers
are NOPs. Refactor the implementations into ti_k3_common.c driver
as k3_rproc_attach() and register this common function as .attach ops in
R5, DSP and M4 drivers.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
Tested-by: Judith Mendez <jm@ti.com>
Reviewed-by: Andrew Davis <afd@ti.com>
---
v12: Changelog:
1. Carried R/B tag.

Link to v11:
https://lore.kernel.org/all/20250425104135.830255-29-b-padhi@ti.com/

v11: Changelog:
1. Carried T/B tag.

Link to v10:
https://lore.kernel.org/all/20250417182001.3903905-27-b-padhi@ti.com/

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
index 50df7164b0caf..ffd6639e6d63c 100644
--- a/drivers/remoteproc/ti_k3_common.c
+++ b/drivers/remoteproc/ti_k3_common.c
@@ -296,5 +296,17 @@ int k3_rproc_stop(struct rproc *rproc)
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
index 98e57a298e73a..c369715b2d768 100644
--- a/drivers/remoteproc/ti_k3_common.h
+++ b/drivers/remoteproc/ti_k3_common.h
@@ -102,4 +102,5 @@ int k3_rproc_prepare(struct rproc *rproc);
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
index de8809cc95fe8..7f3c8d3d1398b 100644
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
index 4082cc61a41af..7c0434093ca50 100644
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

