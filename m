Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B00E1EE7B0;
	Fri,  3 Jan 2025 10:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735899205; cv=none; b=SMQaCBM/XnxWYwFSDC7q8ygF4VLfLNltrgNqo7K3BusPiUjrsEZSlY5TZ9VTuRnBL4q+9ES5WgFm33hi8E7Q7rHRj6Tn9OFAcyLLrAf27eCGFpVdhmr3TjrWu5YhnHjobWoPRF/wM52LjGZgOVU70L/qMwXAXLL8dwr52PSX+DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735899205; c=relaxed/simple;
	bh=9NlnU2wV+eu8xzM0zsHqoTSMIuuJCLbvm9OF4x3ZJfY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ai8SaLxPhNaxDWglTk5gGrbTUI5kA6oXrv6l2g4Wb9CH/ncYQk0Pd1o4/K57sTuN4E0bU00gHOr09EYvSkqz4ADorT2i9cPROrT2SZUciISI5uVRIhXeOpBCEgcHflj7Xl5M5g6V9l6dWJHnQmHfT5iItdHJofSaL4VEzS/fqFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=DGw2Lau3; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="DGw2Lau3"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 503ADDV92382606
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 3 Jan 2025 04:13:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1735899193;
	bh=GPPkcqF4fd7djkR7onT0McQCLzdM8Tvzvyt7KIxkv3U=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=DGw2Lau3F1ii50a0BA2VD261BZpD2tMzfBbMxoAcnRlBG7bRWgft2w/nrA2Abxshr
	 6/7Dq0vFtvS8llg/IpMfhxcs7WAe5yzDvAgbFsXmaGDhwjarc/WXGEz5uaUtnqdmKL
	 //aSE2wC1eFl9/mZKVbUnPPu3qFEnObmJ9+imfDQ=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 503ADDBl042057;
	Fri, 3 Jan 2025 04:13:13 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 3
 Jan 2025 04:13:13 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 3 Jan 2025 04:13:12 -0600
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 503ACVSS126047;
	Fri, 3 Jan 2025 04:13:09 -0600
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>,
        <p.zabel@pengutronix.de>, <jan.kiszka@siemens.com>,
        <christophe.jaillet@wanadoo.fr>, <jkangas@redhat.com>,
        <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v8 10/20] remoteproc: k3: Refactor .unprepare rproc ops into common driver
Date: Fri, 3 Jan 2025 15:42:21 +0530
Message-ID: <20250103101231.1508151-11-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250103101231.1508151-1-b-padhi@ti.com>
References: <20250103101231.1508151-1-b-padhi@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

The .unprepare rproc ops implementations in ti_k3_dsp_remoteproc.c and
ti_k3_m4_remoteproc.c drivers assert the global reset on the remote
processor. Refactor the implementations into ti_k3_common.c driver as
k3_rproc_unprepare() and align DSP and M4 drivers to register this
common function as .unprepare ops.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
 drivers/remoteproc/ti_k3_common.c         | 30 ++++++++++++++++++++++
 drivers/remoteproc/ti_k3_common.h         |  1 +
 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 26 +------------------
 drivers/remoteproc/ti_k3_m4_remoteproc.c  | 31 +----------------------
 4 files changed, 33 insertions(+), 55 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
index 699528e4a369..7fd8c8394d95 100644
--- a/drivers/remoteproc/ti_k3_common.c
+++ b/drivers/remoteproc/ti_k3_common.c
@@ -251,5 +251,35 @@ int k3_rproc_prepare(struct rproc *rproc)
 }
 EXPORT_SYMBOL_GPL(k3_rproc_prepare);
 
+/*
+ * This function implements the .unprepare() ops and performs the complimentary
+ * operations to that of the .prepare() ops. The function is used to assert the
+ * global reset on applicable K3 DSP and M4 cores. This completes the second
+ * portion of powering down the remote core. The cores themselves are only
+ * halted in the .stop() callback through the local reset, and the .unprepare()
+ * ops is invoked by the remoteproc core after the remoteproc is stopped to
+ * balance the global reset.
+ */
+int k3_rproc_unprepare(struct rproc *rproc)
+{
+	struct k3_rproc *kproc = rproc->priv;
+	struct device *dev = kproc->dev;
+	int ret;
+
+	/* If the core is going to be detached do not assert the module reset */
+	if (rproc->state == RPROC_ATTACHED)
+		return 0;
+
+	ret = kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
+						    kproc->ti_sci_id);
+	if (ret) {
+		dev_err(dev, "module-reset assert failed\n");
+		return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(k3_rproc_unprepare);
+
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("TI K3 common Remoteproc code");
diff --git a/drivers/remoteproc/ti_k3_common.h b/drivers/remoteproc/ti_k3_common.h
index 22dd6e13f47a..b6b977e16af6 100644
--- a/drivers/remoteproc/ti_k3_common.h
+++ b/drivers/remoteproc/ti_k3_common.h
@@ -94,4 +94,5 @@ int k3_rproc_reset(struct k3_rproc *kproc);
 int k3_rproc_release(struct k3_rproc *kproc);
 int k3_rproc_request_mbox(struct rproc *rproc);
 int k3_rproc_prepare(struct rproc *rproc);
+int k3_rproc_unprepare(struct rproc *rproc);
 #endif /* REMOTEPROC_TI_K3_COMMON_H */
diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
index 078bfb9aa233..7e7aca192d0a 100644
--- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
@@ -24,29 +24,6 @@
 
 #define KEYSTONE_RPROC_LOCAL_ADDRESS_MASK	(SZ_16M - 1)
 
-/*
- * This function implements the .unprepare() ops and performs the complimentary
- * operations to that of the .prepare() ops. The function is used to assert the
- * global reset on applicable C66x cores. This completes the second portion of
- * powering down the C66x DSP cores. The cores themselves are only halted in the
- * .stop() callback through the local reset, and the .unprepare() ops is invoked
- * by the remoteproc core after the remoteproc is stopped to balance the global
- * reset. This callback is invoked only in remoteproc mode.
- */
-static int k3_dsp_rproc_unprepare(struct rproc *rproc)
-{
-	struct k3_rproc *kproc = rproc->priv;
-	struct device *dev = kproc->dev;
-	int ret;
-
-	ret = kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
-						    kproc->ti_sci_id);
-	if (ret)
-		dev_err(dev, "module-reset assert failed (%pe)\n", ERR_PTR(ret));
-
-	return ret;
-}
-
 /*
  * Power up the DSP remote processor.
  *
@@ -394,7 +371,7 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
 	rproc->recovery_disabled = true;
 	if (data->uses_lreset) {
 		rproc->ops->prepare = k3_rproc_prepare;
-		rproc->ops->unprepare = k3_dsp_rproc_unprepare;
+		rproc->ops->unprepare = k3_rproc_unprepare;
 	}
 	kproc = rproc->priv;
 	kproc->rproc = rproc;
@@ -451,7 +428,6 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
 		dev_info(dev, "configured DSP for IPC-only mode\n");
 		rproc->state = RPROC_DETACHED;
 		/* override rproc ops with only required IPC-only mode ops */
-		rproc->ops->unprepare = NULL;
 		rproc->ops->start = NULL;
 		rproc->ops->stop = NULL;
 		rproc->ops->attach = k3_dsp_rproc_attach;
diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
index 218d4bf941a1..25f013fa7511 100644
--- a/drivers/remoteproc/ti_k3_m4_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_m4_remoteproc.c
@@ -21,35 +21,6 @@
 #include "ti_sci_proc.h"
 #include "ti_k3_common.h"
 
-/*
- * This function implements the .unprepare() ops and performs the complimentary
- * operations to that of the .prepare() ops. The function is used to assert the
- * global reset on applicable cores. This completes the second portion of
- * powering down the remote core. The cores themselves are only halted in the
- * .stop() callback through the local reset, and the .unprepare() ops is invoked
- * by the remoteproc core after the remoteproc is stopped to balance the global
- * reset.
- */
-static int k3_m4_rproc_unprepare(struct rproc *rproc)
-{
-	struct k3_rproc *kproc = rproc->priv;
-	struct device *dev = kproc->dev;
-	int ret;
-
-	/* If the core is going to be detached do not assert the module reset */
-	if (rproc->state == RPROC_ATTACHED)
-		return 0;
-
-	ret = kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
-						    kproc->ti_sci_id);
-	if (ret) {
-		dev_err(dev, "module-reset assert failed\n");
-		return ret;
-	}
-
-	return 0;
-}
-
 /*
  * This function implements the .get_loaded_rsc_table() callback and is used
  * to provide the resource table for a booted remote processor in IPC-only
@@ -344,7 +315,7 @@ static int k3_m4_rproc_detach(struct rproc *rproc)
 
 static const struct rproc_ops k3_m4_rproc_ops = {
 	.prepare = k3_rproc_prepare,
-	.unprepare = k3_m4_rproc_unprepare,
+	.unprepare = k3_rproc_unprepare,
 	.start = k3_m4_rproc_start,
 	.stop = k3_m4_rproc_stop,
 	.attach = k3_m4_rproc_attach,
-- 
2.34.1

