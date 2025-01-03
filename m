Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0790D1F8EF9;
	Fri,  3 Jan 2025 10:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735899203; cv=none; b=Pn/mcJckXqyVcEy9k2FwWRlr3Qy3ZrUIMWuaQS0JXtObcUkbNxhyXo8uob3X8RUl5UwFU1p8gjbk5gpF7ZgvmO03lGvaHPY2JrmcfzvRonz8gsaUmOW0kOUrIU1znn7q3swHDBFJF4ncVqZrEoE6OO8p2Tn5YGMVvkK8H18wGC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735899203; c=relaxed/simple;
	bh=Lltou93Tx6+7HaAaR5g+83Va7G64bRdecPX8m2vRsr0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QNYYA1kcgudsJAIkUJhjb+/liRjp/FNVcbDYBpjnSy/AVviW3ISdeTxzDouQmJOktOGLNBnJgAWz6FY7RFnz+QoqxuICWZZzLeuS+pZHmuIsIF3VjMCLT5JBKwaW96M+lgyx4V3fDwML3+DgcQnpUGt8ZjDvSQZ1FIPgZsMweZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=YreilqoC; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="YreilqoC"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 503AD9QG2076419
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 3 Jan 2025 04:13:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1735899189;
	bh=JM5GiY79Te21OH84xe04G9U6i4kFv5LmBItYTCoTcdw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=YreilqoCEYbw1IOK1NokDMF+VrxlLjXr+HnjZDj4z9mj90Z0F1ZVtOKIprs4gSHCl
	 LkEfXPNCUQKcRQAkpU9B9LQyncxqVHwO272EHHYjN1PajlLzVqK9pL6MVvAGyMwkOB
	 HK3wLVN4hNHze+m5hxzuCqxpXu6Hygd0nT/hV3Uo=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 503AD9Iq042032;
	Fri, 3 Jan 2025 04:13:09 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 3
 Jan 2025 04:13:09 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 3 Jan 2025 04:13:09 -0600
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 503ACVSR126047;
	Fri, 3 Jan 2025 04:13:05 -0600
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>,
        <p.zabel@pengutronix.de>, <jan.kiszka@siemens.com>,
        <christophe.jaillet@wanadoo.fr>, <jkangas@redhat.com>,
        <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v8 09/20] remoteproc: k3: Refactor .prepare rproc ops into common driver
Date: Fri, 3 Jan 2025 15:42:20 +0530
Message-ID: <20250103101231.1508151-10-b-padhi@ti.com>
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

The ti_k3_dsp_remoteproc.c driver asserts the local reset in probe and
releases the global reset in .prepare callback. Whereas, the
ti_k3_m4_remoteproc.c driver does both operations in .prepare callback,
which is more suitable as it ensures lreset is asserted for subsequent
core start operations from sysfs. Refactor the k3_m4_rproc_prepare()
function into the ti_k3_common.c driver as k3_rproc_prepare() and align
DSP and M4 drivers to register this common function as .prepare ops.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
 drivers/remoteproc/ti_k3_common.c         | 46 +++++++++++++++++++++++
 drivers/remoteproc/ti_k3_common.h         |  1 +
 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 42 +--------------------
 drivers/remoteproc/ti_k3_m4_remoteproc.c  | 45 +---------------------
 4 files changed, 49 insertions(+), 85 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
index a78abecf2756..699528e4a369 100644
--- a/drivers/remoteproc/ti_k3_common.c
+++ b/drivers/remoteproc/ti_k3_common.c
@@ -205,5 +205,51 @@ int k3_rproc_request_mbox(struct rproc *rproc)
 }
 EXPORT_SYMBOL_GPL(k3_rproc_request_mbox);
 
+/*
+ * The K3 DSP and M4 cores have a local reset that affects only the CPU, and a
+ * generic module reset that powers on the device and allows the internal
+ * memories to be accessed while the local reset is asserted. This function is
+ * used to release the global reset on remote cores to allow loading into the
+ * internal RAMs. The .prepare() ops is invoked by remoteproc core before any
+ * firmware loading, and is followed by the .start() ops after loading to
+ * actually let the remote cores to run.
+ */
+int k3_rproc_prepare(struct rproc *rproc)
+{
+	struct k3_rproc *kproc = rproc->priv;
+	struct device *dev = kproc->dev;
+	int ret;
+
+	/* If the core is running already no need to deassert the module reset */
+	if (rproc->state == RPROC_DETACHED)
+		return 0;
+
+	/*
+	 * Ensure the local reset is asserted so the core doesn't
+	 * execute bogus code when the module reset is released.
+	 */
+	if (kproc->data->uses_lreset) {
+		ret = k3_rproc_reset(kproc);
+		if (ret)
+			return ret;
+
+		ret = reset_control_status(kproc->reset);
+		if (ret <= 0) {
+			dev_err(dev, "local reset still not asserted\n");
+			return ret;
+		}
+	}
+
+	ret = kproc->ti_sci->ops.dev_ops.get_device(kproc->ti_sci,
+						    kproc->ti_sci_id);
+	if (ret) {
+		dev_err(dev, "could not deassert module-reset for internal RAM loading\n");
+		return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(k3_rproc_prepare);
+
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("TI K3 common Remoteproc code");
diff --git a/drivers/remoteproc/ti_k3_common.h b/drivers/remoteproc/ti_k3_common.h
index 8e44c0455c39..22dd6e13f47a 100644
--- a/drivers/remoteproc/ti_k3_common.h
+++ b/drivers/remoteproc/ti_k3_common.h
@@ -93,4 +93,5 @@ void k3_rproc_kick(struct rproc *rproc, int vqid);
 int k3_rproc_reset(struct k3_rproc *kproc);
 int k3_rproc_release(struct k3_rproc *kproc);
 int k3_rproc_request_mbox(struct rproc *rproc);
+int k3_rproc_prepare(struct rproc *rproc);
 #endif /* REMOTEPROC_TI_K3_COMMON_H */
diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
index c8bab63a4f4d..078bfb9aa233 100644
--- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
@@ -24,31 +24,6 @@
 
 #define KEYSTONE_RPROC_LOCAL_ADDRESS_MASK	(SZ_16M - 1)
 
-/*
- * The C66x DSP cores have a local reset that affects only the CPU, and a
- * generic module reset that powers on the device and allows the DSP internal
- * memories to be accessed while the local reset is asserted. This function is
- * used to release the global reset on C66x DSPs to allow loading into the DSP
- * internal RAMs. The .prepare() ops is invoked by remoteproc core before any
- * firmware loading, and is followed by the .start() ops after loading to
- * actually let the C66x DSP cores run. This callback is invoked only in
- * remoteproc mode.
- */
-static int k3_dsp_rproc_prepare(struct rproc *rproc)
-{
-	struct k3_rproc *kproc = rproc->priv;
-	struct device *dev = kproc->dev;
-	int ret;
-
-	ret = kproc->ti_sci->ops.dev_ops.get_device(kproc->ti_sci,
-						    kproc->ti_sci_id);
-	if (ret)
-		dev_err(dev, "module-reset deassert failed, cannot enable internal RAM loading (%pe)\n",
-			ERR_PTR(ret));
-
-	return ret;
-}
-
 /*
  * This function implements the .unprepare() ops and performs the complimentary
  * operations to that of the .prepare() ops. The function is used to assert the
@@ -418,7 +393,7 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
 	rproc->has_iommu = false;
 	rproc->recovery_disabled = true;
 	if (data->uses_lreset) {
-		rproc->ops->prepare = k3_dsp_rproc_prepare;
+		rproc->ops->prepare = k3_rproc_prepare;
 		rproc->ops->unprepare = k3_dsp_rproc_unprepare;
 	}
 	kproc = rproc->priv;
@@ -476,7 +451,6 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
 		dev_info(dev, "configured DSP for IPC-only mode\n");
 		rproc->state = RPROC_DETACHED;
 		/* override rproc ops with only required IPC-only mode ops */
-		rproc->ops->prepare = NULL;
 		rproc->ops->unprepare = NULL;
 		rproc->ops->start = NULL;
 		rproc->ops->stop = NULL;
@@ -485,20 +459,6 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
 		rproc->ops->get_loaded_rsc_table = k3_dsp_get_loaded_rsc_table;
 	} else {
 		dev_info(dev, "configured DSP for remoteproc mode\n");
-		/*
-		 * ensure the DSP local reset is asserted to ensure the DSP
-		 * doesn't execute bogus code in .prepare() when the module
-		 * reset is released.
-		 */
-		if (data->uses_lreset) {
-			ret = reset_control_status(kproc->reset);
-			if (ret < 0) {
-				return dev_err_probe(dev, ret, "failed to get reset status\n");
-			} else if (ret == 0) {
-				dev_warn(dev, "local reset is deasserted for device\n");
-				k3_rproc_reset(kproc);
-			}
-		}
 	}
 
 	ret = devm_rproc_add(dev, rproc);
diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
index 6dd93c8d0553..218d4bf941a1 100644
--- a/drivers/remoteproc/ti_k3_m4_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_m4_remoteproc.c
@@ -21,49 +21,6 @@
 #include "ti_sci_proc.h"
 #include "ti_k3_common.h"
 
-/*
- * The M4 cores have a local reset that affects only the CPU, and a
- * generic module reset that powers on the device and allows the internal
- * memories to be accessed while the local reset is asserted. This function is
- * used to release the global reset on remote cores to allow loading into the
- * internal RAMs. The .prepare() ops is invoked by remoteproc core before any
- * firmware loading, and is followed by the .start() ops after loading to
- * actually let the remote cores to run.
- */
-static int k3_m4_rproc_prepare(struct rproc *rproc)
-{
-	struct k3_rproc *kproc = rproc->priv;
-	struct device *dev = kproc->dev;
-	int ret;
-
-	/* If the core is running already no need to deassert the module reset */
-	if (rproc->state == RPROC_DETACHED)
-		return 0;
-
-	/*
-	 * Ensure the local reset is asserted so the core doesn't
-	 * execute bogus code when the module reset is released.
-	 */
-	ret = k3_rproc_reset(kproc);
-	if (ret)
-		return ret;
-
-	ret = reset_control_status(kproc->reset);
-	if (ret <= 0) {
-		dev_err(dev, "local reset still not asserted\n");
-		return ret;
-	}
-
-	ret = kproc->ti_sci->ops.dev_ops.get_device(kproc->ti_sci,
-						    kproc->ti_sci_id);
-	if (ret) {
-		dev_err(dev, "could not deassert module-reset for internal RAM loading\n");
-		return ret;
-	}
-
-	return 0;
-}
-
 /*
  * This function implements the .unprepare() ops and performs the complimentary
  * operations to that of the .prepare() ops. The function is used to assert the
@@ -386,7 +343,7 @@ static int k3_m4_rproc_detach(struct rproc *rproc)
 }
 
 static const struct rproc_ops k3_m4_rproc_ops = {
-	.prepare = k3_m4_rproc_prepare,
+	.prepare = k3_rproc_prepare,
 	.unprepare = k3_m4_rproc_unprepare,
 	.start = k3_m4_rproc_start,
 	.stop = k3_m4_rproc_stop,
-- 
2.34.1

