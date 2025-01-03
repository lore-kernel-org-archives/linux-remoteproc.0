Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479BB1FA24D;
	Fri,  3 Jan 2025 10:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735899210; cv=none; b=bG9rqyetMICxa8eLiH3LVF5J9LR/Rq7OujNbmj/uIeumH9UcyXTGpsY0sj5nOdTT6f9RaV1vla/Vanpy7HgR1JAN/X+PQQKq20z4CqGNaZWdmJupTWCHH2JJ1USB9zWbTiQkAPeuPQJXBJ+9Jd8iqh/RJnfsTPH3eX2CuloDoP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735899210; c=relaxed/simple;
	bh=jQtXpwcwW7agOm98SEHPAz+qH6vwanUc/xASpzTjjUA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hnWLrkEzweiyLoWBXhLhAsxYlndq0CPKlnsIdXCRr3Dy0aFV/5Brf2hXogEDIMNrXRH7v0ctvqLYNIQLltBsc1rv0L4XswEIq5BmiTi4YwRocH9hBkDJhoXo1ZG6QMagbl9tjsqTEJFiL92Pa44qUVjULdrF9ohUAoPtWQVhS34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ctXVuqA9; arc=none smtp.client-ip=198.47.19.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ctXVuqA9"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 503ADHQq033617;
	Fri, 3 Jan 2025 04:13:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1735899197;
	bh=eJypcE39LhLmZrmnDZSY8wRBVWXkWGdgWsm/rwuIKKs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ctXVuqA93Fn8/Fc8nnsgCz7Ng1HkTdABGEoDPvMebjhQMOeoZi9B+AMvB4eMicGLZ
	 Y44lc9tQdOmONMHV5OZ4acpDVF2xAzpDdIwI6TJTD9BJNMBP6g1L/jIPQJjtylqzyx
	 U8ozuz8OBIFEmQa+bgFsUCaMs/WxJw0wH3Bs/O5g=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 503ADHcp112777
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 3 Jan 2025 04:13:17 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 3
 Jan 2025 04:13:16 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 3 Jan 2025 04:13:16 -0600
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 503ACVST126047;
	Fri, 3 Jan 2025 04:13:13 -0600
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>,
        <p.zabel@pengutronix.de>, <jan.kiszka@siemens.com>,
        <christophe.jaillet@wanadoo.fr>, <jkangas@redhat.com>,
        <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v8 11/20] remoteproc: k3: Refactor .start rproc ops into common driver
Date: Fri, 3 Jan 2025 15:42:22 +0530
Message-ID: <20250103101231.1508151-12-b-padhi@ti.com>
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

The k3_dsp_rproc_start() function sets the boot address and releases the
reset on the remote processor. Whereas, the k3_m4_rproc_start() function
only needs to release the reset. Refactor the k3_m4_rproc_start() into
ti_k3_common.c as k3_rproc_start() and align the DSP and M4 drivers to
invoke this common function when releasing the reset on the remote
processor.

Further, do not override the .start ops with NULL when operating in
IPC-only mode in ti_k3_dsp_remoteproc.c, as .start is never invoked in
rproc_attach routine.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
 drivers/remoteproc/ti_k3_common.c         | 15 +++++++++++++++
 drivers/remoteproc/ti_k3_common.h         |  1 +
 drivers/remoteproc/ti_k3_dsp_remoteproc.c |  4 ++--
 drivers/remoteproc/ti_k3_m4_remoteproc.c  | 22 +---------------------
 4 files changed, 19 insertions(+), 23 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
index 7fd8c8394d95..b1d828dbb334 100644
--- a/drivers/remoteproc/ti_k3_common.c
+++ b/drivers/remoteproc/ti_k3_common.c
@@ -281,5 +281,20 @@ int k3_rproc_unprepare(struct rproc *rproc)
 }
 EXPORT_SYMBOL_GPL(k3_rproc_unprepare);
 
+/*
+ * Power up the remote processor.
+ *
+ * This function will be invoked only after the firmware for this rproc
+ * was loaded, parsed successfully, and all of its resource requirements
+ * were met. This callback is invoked only in remoteproc mode.
+ */
+int k3_rproc_start(struct rproc *rproc)
+{
+	struct k3_rproc *kproc = rproc->priv;
+
+	return k3_rproc_release(kproc);
+}
+EXPORT_SYMBOL_GPL(k3_rproc_start);
+
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("TI K3 common Remoteproc code");
diff --git a/drivers/remoteproc/ti_k3_common.h b/drivers/remoteproc/ti_k3_common.h
index b6b977e16af6..2eb1539b3bb9 100644
--- a/drivers/remoteproc/ti_k3_common.h
+++ b/drivers/remoteproc/ti_k3_common.h
@@ -95,4 +95,5 @@ int k3_rproc_release(struct k3_rproc *kproc);
 int k3_rproc_request_mbox(struct rproc *rproc);
 int k3_rproc_prepare(struct rproc *rproc);
 int k3_rproc_unprepare(struct rproc *rproc);
+int k3_rproc_start(struct rproc *rproc);
 #endif /* REMOTEPROC_TI_K3_COMMON_H */
diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
index 7e7aca192d0a..75ab86b4e82a 100644
--- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
@@ -50,7 +50,8 @@ static int k3_dsp_rproc_start(struct rproc *rproc)
 	if (ret)
 		return ret;
 
-	ret = k3_rproc_release(kproc);
+	/* Call the K3 common start function after doing DSP specific stuff */
+	ret = k3_rproc_start(rproc);
 	if (ret)
 		return ret;
 
@@ -428,7 +429,6 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
 		dev_info(dev, "configured DSP for IPC-only mode\n");
 		rproc->state = RPROC_DETACHED;
 		/* override rproc ops with only required IPC-only mode ops */
-		rproc->ops->start = NULL;
 		rproc->ops->stop = NULL;
 		rproc->ops->attach = k3_dsp_rproc_attach;
 		rproc->ops->detach = k3_dsp_rproc_detach;
diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
index 25f013fa7511..0f1237172233 100644
--- a/drivers/remoteproc/ti_k3_m4_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_m4_remoteproc.c
@@ -244,26 +244,6 @@ static void k3_m4_release_tsp(void *data)
 	ti_sci_proc_release(tsp);
 }
 
-/*
- * Power up the M4 remote processor.
- *
- * This function will be invoked only after the firmware for this rproc
- * was loaded, parsed successfully, and all of its resource requirements
- * were met. This callback is invoked only in remoteproc mode.
- */
-static int k3_m4_rproc_start(struct rproc *rproc)
-{
-	struct k3_rproc *kproc = rproc->priv;
-	struct device *dev = kproc->dev;
-	int ret;
-
-	ret = k3_rproc_release(kproc);
-	if (ret)
-		dev_err(dev, "local-reset deassert failed, ret = %d\n", ret);
-
-	return ret;
-}
-
 /*
  * Stop the M4 remote processor.
  *
@@ -316,7 +296,7 @@ static int k3_m4_rproc_detach(struct rproc *rproc)
 static const struct rproc_ops k3_m4_rproc_ops = {
 	.prepare = k3_rproc_prepare,
 	.unprepare = k3_rproc_unprepare,
-	.start = k3_m4_rproc_start,
+	.start = k3_rproc_start,
 	.stop = k3_m4_rproc_stop,
 	.attach = k3_m4_rproc_attach,
 	.detach = k3_m4_rproc_detach,
-- 
2.34.1

