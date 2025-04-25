Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899E624468B;
	Fri, 25 Apr 2025 10:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745577813; cv=none; b=Oa5qzjnoG7bV7fhEqpZfqhpUoE4h+GfF2M0dsXFgk0dmdyPqc/TH2v2yn6t7zYyCTL7Qum9jIaGtuQ/tntxKVbTmsCVb8YK6AgaIGXonmLLulgKo7VFF9K4CmKRRoo3OcbG2EHxLMz4Me8yoq38HPPEcB1jU/1KxtO/d53X3qlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745577813; c=relaxed/simple;
	bh=f/VkGUSos5VqMoPTik4iObmPWXIr7ZmoORkwAU/7ggc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BfYaWkU5M7yyx7D2xKFgVpdjLRkG46t4pwAkTtmyd4WnvLXdAd2mfoNqASn7Alp6HEN0x1kYHVZ7xqSE3j+tpkQZ/exTcle0PlxQrcJ5D4NG8eFO18s7POGldHFAQxOqlal6vMh0uPsknLy7fb4SVXjjEaqqNBEiotK7o7wRXgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=o3gGLYE0; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="o3gGLYE0"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53PAhNjb2768016
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 05:43:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745577803;
	bh=QxSUKq1Y0bi0VmDQJHuO4D35CtacoI20a81oTlg4Uys=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=o3gGLYE0MhevFgIH/2eG0fb/SQa5qy7fsKk0VG9lf8X76rGY6Zc+fL7fVkCCHAzyP
	 I8y5XLnhzzpCX9NtCI7FDPjJd8UCEece+VZA+yUmWvm4DSk6BPBPZJma7fZodryVXs
	 OSIlJc1vTB2ffYfkbfRJluf3UP14lbpOXNF4XVOg=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53PAhNk8028478
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 25 Apr 2025 05:43:23 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 25
 Apr 2025 05:43:23 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 25 Apr 2025 05:43:22 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53PAfaZm038329;
	Fri, 25 Apr 2025 05:43:19 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v11 27/35] remoteproc: k3: Refactor .stop rproc ops into common driver
Date: Fri, 25 Apr 2025 16:11:27 +0530
Message-ID: <20250425104135.830255-28-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250425104135.830255-1-b-padhi@ti.com>
References: <20250425104135.830255-1-b-padhi@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

The .stop rproc ops implementations in TI K3 DSP and M4 remoteproc
drivers put the remote processor into reset. Refactor the
implementations into ti_k3_common.c driver as k3_rproc_stop() and
register this common function as .stop ops in DSP and M4 drivers.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
Tested-by: Judith Mendez <jm@ti.com>
---
v11: Changelog:
1. Carried T/B tag.

Link to v10:
https://lore.kernel.org/all/20250417182001.3903905-26-b-padhi@ti.com/

v10: Changelog:
1. Don't remove dsp func override. Already done by [v10 20/33] patch.

Link to v9:
https://lore.kernel.org/all/20250317120622.1746415-19-b-padhi@ti.com/

 drivers/remoteproc/ti_k3_common.c         | 14 ++++++++++++++
 drivers/remoteproc/ti_k3_common.h         |  1 +
 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 17 +----------------
 drivers/remoteproc/ti_k3_m4_remoteproc.c  | 15 +--------------
 4 files changed, 17 insertions(+), 30 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
index 5e0d1298d05b1..b38a01b075c7e 100644
--- a/drivers/remoteproc/ti_k3_common.c
+++ b/drivers/remoteproc/ti_k3_common.c
@@ -278,5 +278,19 @@ int k3_rproc_start(struct rproc *rproc)
 }
 EXPORT_SYMBOL_GPL(k3_rproc_start);
 
+/*
+ * Stop the remote processor.
+ *
+ * This function puts the remote processor into reset, and finishes processing
+ * of any pending messages. This callback is invoked only in remoteproc mode.
+ */
+int k3_rproc_stop(struct rproc *rproc)
+{
+	struct k3_rproc *kproc = rproc->priv;
+
+	return k3_rproc_reset(kproc);
+}
+EXPORT_SYMBOL_GPL(k3_rproc_stop);
+
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("TI K3 common Remoteproc code");
diff --git a/drivers/remoteproc/ti_k3_common.h b/drivers/remoteproc/ti_k3_common.h
index 51a92a3064793..0162757f024c9 100644
--- a/drivers/remoteproc/ti_k3_common.h
+++ b/drivers/remoteproc/ti_k3_common.h
@@ -96,4 +96,5 @@ int k3_rproc_request_mbox(struct rproc *rproc);
 int k3_rproc_prepare(struct rproc *rproc);
 int k3_rproc_unprepare(struct rproc *rproc);
 int k3_rproc_start(struct rproc *rproc);
+int k3_rproc_stop(struct rproc *rproc);
 #endif /* REMOTEPROC_TI_K3_COMMON_H */
diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
index 67d46c4a1ba61..f506a9360879a 100644
--- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
@@ -58,21 +58,6 @@ static int k3_dsp_rproc_start(struct rproc *rproc)
 	return 0;
 }
 
-/*
- * Stop the DSP remote processor.
- *
- * This function puts the DSP processor into reset, and finishes processing
- * of any pending messages. This callback is invoked only in remoteproc mode.
- */
-static int k3_dsp_rproc_stop(struct rproc *rproc)
-{
-	struct k3_rproc *kproc = rproc->priv;
-
-	k3_rproc_reset(kproc);
-
-	return 0;
-}
-
 /*
  * Attach to a running DSP remote processor (IPC-only mode)
  *
@@ -186,7 +171,7 @@ static void *k3_dsp_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool
 
 static const struct rproc_ops k3_dsp_rproc_ops = {
 	.start			= k3_dsp_rproc_start,
-	.stop			= k3_dsp_rproc_stop,
+	.stop			= k3_rproc_stop,
 	.attach			= k3_dsp_rproc_attach,
 	.detach			= k3_dsp_rproc_detach,
 	.kick			= k3_rproc_kick,
diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
index 69066cb917406..8830b1d84675d 100644
--- a/drivers/remoteproc/ti_k3_m4_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_m4_remoteproc.c
@@ -244,19 +244,6 @@ static void k3_m4_release_tsp(void *data)
 	ti_sci_proc_release(tsp);
 }
 
-/*
- * Stop the M4 remote processor.
- *
- * This function puts the M4 processor into reset, and finishes processing
- * of any pending messages. This callback is invoked only in remoteproc mode.
- */
-static int k3_m4_rproc_stop(struct rproc *rproc)
-{
-	struct k3_rproc *kproc = rproc->priv;
-
-	return k3_rproc_reset(kproc);
-}
-
 /*
  * Attach to a running M4 remote processor (IPC-only mode)
  *
@@ -285,7 +272,7 @@ static const struct rproc_ops k3_m4_rproc_ops = {
 	.prepare = k3_rproc_prepare,
 	.unprepare = k3_rproc_unprepare,
 	.start = k3_rproc_start,
-	.stop = k3_m4_rproc_stop,
+	.stop = k3_rproc_stop,
 	.attach = k3_m4_rproc_attach,
 	.detach = k3_m4_rproc_detach,
 	.kick = k3_rproc_kick,
-- 
2.34.1

