Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E712561AB;
	Fri, 25 Apr 2025 10:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745577800; cv=none; b=fFYprbeFKU9KMpoB6kCi6x+vLx0j1/gTtdgOomx4mGL91e8lO3KpqFV1Jn/RJUAfh33KtwsNwbufbS9vMfw7ah7OuAIRNhXy2dlf5H3FoQZ6I7Zv7SRJc2eAN6pMssm1lS3kXgSfqpS8JfhH8oPblR/NOKbyDbPwqQS1s9C7z+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745577800; c=relaxed/simple;
	bh=YnQgFNqSZU7/TDYNyU3dn6unweiGTmcch47G1olRBAs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ek6ZNaekvFewaZuegu8FOsrhvzeyedoVeEj33es2/epLhrwCM4FL2/Fkt5j0Ao4+QgFx4On/VqCpbyiXXX2huoKihrbSCrCCEto4rZPy5rCOAH3HnvcexrvCWFeSdfCOg7PwXZ4L4hKcY/9gfV/54CzK5jqy1/0C1u8V4Q7ly1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=tJz3wR+C; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="tJz3wR+C"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53PAhB512911132
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 05:43:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745577791;
	bh=kPoL7AomdIQ+Eg/Fl2qv2bfr18gztd0jFlumCqx9WAk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=tJz3wR+Cd0WMdtYETi+UIvBXBYK8G/hMADTfXNJun1I8d2sM8okiwJO6qFZqWyBEv
	 EH4eTQ8XlI5j7yRx1R2+LCJholAATOtVwZVLARtXOUZCLUoHsIMTk3M8jnr+58sX6h
	 je+VK/vQa/cv/YnLYzjPFn0maNFwLqjh2SGx1YYw=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53PAhBS0087680
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 25 Apr 2025 05:43:11 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 25
 Apr 2025 05:43:11 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 25 Apr 2025 05:43:11 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53PAfaZj038329;
	Fri, 25 Apr 2025 05:43:08 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v11 24/35] remoteproc: k3: Refactor .prepare rproc ops into common driver
Date: Fri, 25 Apr 2025 16:11:24 +0530
Message-ID: <20250425104135.830255-25-b-padhi@ti.com>
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

The .prepare rproc ops implementations in TI K3 DSP and M4 remoteproc
drivers deasserts the local and module reset of the processor to allow
firmware loading into internal memory.

Refactor the implementations into the ti_k3_common.c driver as
k3_rproc_prepare() and register this common function as .prepare ops in
the DSP and M4 drivers.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
Tested-by: Judith Mendez <jm@ti.com>
---
v11: Changelog:
1. Carried T/B tag.

Link to v10:
https://lore.kernel.org/all/20250417182001.3903905-23-b-padhi@ti.com/

v10: Changelog:
1. Split [v9 15/26] into [v10 21/33] and [v10 22/33] patches. 
2. Don't remove dsp func override. Already done by [v10 20/33] patch.

Link to v9:
https://lore.kernel.org/all/20250317120622.1746415-16-b-padhi@ti.com/

 drivers/remoteproc/ti_k3_common.c         | 46 ++++++++++++++++++++++
 drivers/remoteproc/ti_k3_common.h         |  1 +
 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 47 +----------------------
 drivers/remoteproc/ti_k3_m4_remoteproc.c  | 45 +---------------------
 4 files changed, 49 insertions(+), 90 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
index 8801fdd10e90c..96b8175a9374f 100644
--- a/drivers/remoteproc/ti_k3_common.c
+++ b/drivers/remoteproc/ti_k3_common.c
@@ -187,5 +187,51 @@ int k3_rproc_request_mbox(struct rproc *rproc)
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
index 721492fa0fb71..5992a29ff4929 100644
--- a/drivers/remoteproc/ti_k3_common.h
+++ b/drivers/remoteproc/ti_k3_common.h
@@ -93,4 +93,5 @@ void k3_rproc_kick(struct rproc *rproc, int vqid);
 int k3_rproc_reset(struct k3_rproc *kproc);
 int k3_rproc_release(struct k3_rproc *kproc);
 int k3_rproc_request_mbox(struct rproc *rproc);
+int k3_rproc_prepare(struct rproc *rproc);
 #endif /* REMOTEPROC_TI_K3_COMMON_H */
diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
index a43715309eed5..0f81e7c3e798e 100644
--- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
@@ -24,51 +24,6 @@
 
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
-	/* If the core is running already no need to deassert the module reset */
-	if (rproc->state == RPROC_DETACHED)
-		return 0;
-
-	/*
-	 * Ensure the local reset is asserted so the core doesn't
-	 * execute bogus code when the module reset is released.
-	 */
-	if (kproc->data->uses_lreset) {
-		ret = k3_rproc_reset(kproc);
-		if (ret)
-			return ret;
-
-		ret = reset_control_status(kproc->reset);
-		if (ret <= 0) {
-			dev_err(dev, "local reset still not asserted\n");
-			return ret;
-		}
-	}
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
@@ -428,7 +383,7 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
 	rproc->has_iommu = false;
 	rproc->recovery_disabled = true;
 	if (data->uses_lreset) {
-		rproc->ops->prepare = k3_dsp_rproc_prepare;
+		rproc->ops->prepare = k3_rproc_prepare;
 		rproc->ops->unprepare = k3_dsp_rproc_unprepare;
 	}
 	kproc = rproc->priv;
diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
index 4d5a33021a77a..70e90a29291c3 100644
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
@@ -368,7 +325,7 @@ static int k3_m4_rproc_detach(struct rproc *rproc)
 }
 
 static const struct rproc_ops k3_m4_rproc_ops = {
-	.prepare = k3_m4_rproc_prepare,
+	.prepare = k3_rproc_prepare,
 	.unprepare = k3_m4_rproc_unprepare,
 	.start = k3_m4_rproc_start,
 	.stop = k3_m4_rproc_stop,
-- 
2.34.1

