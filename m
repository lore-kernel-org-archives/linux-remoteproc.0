Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84F2202C3A;
	Tue, 13 May 2025 05:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747115240; cv=none; b=tU3T2FAhWy1qVWuFUaCak296UR6PcaumFehDTv7/rsO/vHBXWwkgI/fczdD0rQr0k+84eW9XHI8w3vvjEKMO6oE5pmD7qEErgqgsFoctwgUCTQgsN+h5FewD0YIGpxEH2e2JL60FiX42fKtWtWM7WcbEhPEAEUbtPmeg7YfOz2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747115240; c=relaxed/simple;
	bh=9+lXfyLRU3iV4vTjiyry+soiiSQmbGbmpQ1g854U5fM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fwp2cqxUXXxMb+0Fh63C2pLVFxBtd6GEsWrNH1SWP27AqIntfODuMUFMtGIY7cT9G2QooZs7/hLJpsgCoj5rrv2HHfIjdLxSnUbVep+DWhXAJfowVQjEoTDwxph1FxIXcuWM7ZzG92RdPMU/B5dDr5rOAp8M5IhEdtJwwS9jUBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=kVzo4xeu; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="kVzo4xeu"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 54D5lBi82226543
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 May 2025 00:47:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747115231;
	bh=9/VJLPptnEoOwbYmd3zCUSLHZeXc2RxnXIJnaJEDJms=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=kVzo4xeuN72SwOk8I7TcpkMzCRKaG3HnZPXyAa1j/kKTZX6qR6ui6PWx/j2Q2FAL7
	 QWg2pd+O19qYbZK8uR+BE2llwm7B8WrvveWcJBtcIyMot+aBHcZA1vUlnAXvjdND4A
	 aHjEE+1PsOXIItCPsfZ2achcEbKLGhYyIic42/P4=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 54D5lB9v032719
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 13 May 2025 00:47:11 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 13
 May 2025 00:47:11 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 13 May 2025 00:47:11 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54D5jAqb131001;
	Tue, 13 May 2025 00:47:07 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v12 28/36] remoteproc: k3: Refactor .stop rproc ops into common driver
Date: Tue, 13 May 2025 11:15:02 +0530
Message-ID: <20250513054510.3439842-29-b-padhi@ti.com>
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

The .stop rproc ops implementations in TI K3 DSP and M4 remoteproc
drivers put the remote processor into reset. Refactor the
implementations into ti_k3_common.c driver as k3_rproc_stop() and
register this common function as .stop ops in DSP and M4 drivers.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
Tested-by: Judith Mendez <jm@ti.com>
Reviewed-by: Andrew Davis <afd@ti.com>
---
v12: Changelog:
1. Carried R/B tag.

Link to v11:
https://lore.kernel.org/all/20250425104135.830255-28-b-padhi@ti.com/

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
index 32569c00cfc0c..50df7164b0caf 100644
--- a/drivers/remoteproc/ti_k3_common.c
+++ b/drivers/remoteproc/ti_k3_common.c
@@ -282,5 +282,19 @@ int k3_rproc_start(struct rproc *rproc)
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
index 5237223f05028..98e57a298e73a 100644
--- a/drivers/remoteproc/ti_k3_common.h
+++ b/drivers/remoteproc/ti_k3_common.h
@@ -101,4 +101,5 @@ int k3_rproc_request_mbox(struct rproc *rproc);
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
index af206e2f50cf5..de8809cc95fe8 100644
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

