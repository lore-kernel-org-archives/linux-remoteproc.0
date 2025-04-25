Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458B2256C81;
	Fri, 25 Apr 2025 10:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745577805; cv=none; b=AuBu9VOEIq3IAma/ZtvyTluvGGNY+4uHXtUbAQMvuyILo96XBkxbudqF2+8/Gbb/M98rpkdCd9oth0KLnSzzOfEN+QIAhV9nCo4DrnvkutYuOL2CaxXfMWAKGYrnnR70XClRgzRS2fE6EJxhoINCgTbsbOKm+MiIEvkQ1U8M1UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745577805; c=relaxed/simple;
	bh=3K0SqIRdEdCDMzVxgOGM9l+5N9Fb7mJdgI5Xmfsfr6I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GHUyE0udggvNDIiIzSgRNGpSt22/4S6KH+pkLxRbYm2mC6PFbvOnV2X0n1de9oyBumFm9p6kToNK9V9ZiFpANYUSZgdlw/V25ywIK7o+zAP61AZNZVNoDzh2AsBlehWkUSxkDhp1M2d5wmbGTnpq9THdRpNEjAZryguU2KvZcgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=socIOOkI; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="socIOOkI"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53PAhFBx2152266
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 05:43:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745577795;
	bh=c05sTlxFQgkiVAGhT/WO4PaHbJ6fSxmu2jFNmhb8CYk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=socIOOkImCWUDwMULUW2XUGFCMlCW0HB49H5dqcieYf3lnQSeD6XNcQi3BFUV2WUh
	 nTMMrgbXSKLxCTwVbLiAKhcNYAonAzQMOswHXKIApbaXyb4uGrbEK6N1nsunpbgr1x
	 j4YgSIvglKV7CgPNBriCbqvMKclIISbhCo+ERTWU=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53PAhFxm089162
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 25 Apr 2025 05:43:15 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 25
 Apr 2025 05:43:15 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 25 Apr 2025 05:43:14 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53PAfaZk038329;
	Fri, 25 Apr 2025 05:43:11 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v11 25/35] remoteproc: k3: Refactor .unprepare rproc ops into common driver
Date: Fri, 25 Apr 2025 16:11:25 +0530
Message-ID: <20250425104135.830255-26-b-padhi@ti.com>
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

The .unprepare rproc ops implementations in TI K3 DSP and M4 remoteproc
drivers assert the module reset on the remote processor. Refactor the
implementations into ti_k3_common.c driver as k3_rproc_unprepare() and
register this common function as .unprepare ops in DSP and M4 drivers.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
Tested-by: Judith Mendez <jm@ti.com>
---
v11: Changelog:
1. Carried T/B tag.

Link to v10:
https://lore.kernel.org/all/20250417182001.3903905-24-b-padhi@ti.com/

v10: Changelog:
1. Don't remove dsp func override. Already done by [v10 20/33] patch.

Link to v9:
https://lore.kernel.org/all/20250317120622.1746415-17-b-padhi@ti.com/

 drivers/remoteproc/ti_k3_common.c         | 30 ++++++++++++++++++++++
 drivers/remoteproc/ti_k3_common.h         |  1 +
 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 29 +--------------------
 drivers/remoteproc/ti_k3_m4_remoteproc.c  | 31 +----------------------
 4 files changed, 33 insertions(+), 58 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
index 96b8175a9374f..b5f66be2e5cc8 100644
--- a/drivers/remoteproc/ti_k3_common.c
+++ b/drivers/remoteproc/ti_k3_common.c
@@ -233,5 +233,35 @@ int k3_rproc_prepare(struct rproc *rproc)
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
index 5992a29ff4929..c1b07187c124c 100644
--- a/drivers/remoteproc/ti_k3_common.h
+++ b/drivers/remoteproc/ti_k3_common.h
@@ -94,4 +94,5 @@ int k3_rproc_reset(struct k3_rproc *kproc);
 int k3_rproc_release(struct k3_rproc *kproc);
 int k3_rproc_request_mbox(struct rproc *rproc);
 int k3_rproc_prepare(struct rproc *rproc);
+int k3_rproc_unprepare(struct rproc *rproc);
 #endif /* REMOTEPROC_TI_K3_COMMON_H */
diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
index 0f81e7c3e798e..5099d21ce066f 100644
--- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
@@ -24,33 +24,6 @@
 
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
-	/* If the core is running already no need to deassert the module reset */
-	if (rproc->state == RPROC_DETACHED)
-		return 0;
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
@@ -384,7 +357,7 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
 	rproc->recovery_disabled = true;
 	if (data->uses_lreset) {
 		rproc->ops->prepare = k3_rproc_prepare;
-		rproc->ops->unprepare = k3_dsp_rproc_unprepare;
+		rproc->ops->unprepare = k3_rproc_unprepare;
 	}
 	kproc = rproc->priv;
 	kproc->rproc = rproc;
diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
index 70e90a29291c3..7167d311e0876 100644
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
@@ -326,7 +297,7 @@ static int k3_m4_rproc_detach(struct rproc *rproc)
 
 static const struct rproc_ops k3_m4_rproc_ops = {
 	.prepare = k3_rproc_prepare,
-	.unprepare = k3_m4_rproc_unprepare,
+	.unprepare = k3_rproc_unprepare,
 	.start = k3_m4_rproc_start,
 	.stop = k3_m4_rproc_stop,
 	.attach = k3_m4_rproc_attach,
-- 
2.34.1

