Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E2323BD02;
	Mon, 17 Mar 2025 12:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742213266; cv=none; b=R/XwAFfMORVvP63zJyErHQeM1o7tyDcG7Dc4BrBDxGykaFBdfzyfy/3oEgWEhZdIielbVX8zWqrY2CXjlqlsBKvNXT2qQQWwkHzU111zjYaYW4n1PMQz2W9wbUHQqZgvs4DhZgZhB1NF850qzNrF1c6Q5A/cphw+hCuF90wk9oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742213266; c=relaxed/simple;
	bh=twB3VnTcAf6TnhnidOIfI8EqbX6+m14S+IxS5axSL0Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t9ifglQBFXJCMgqB/Rqfxcl7zGZvk6wDa49Vt6JCizHzlX7I7um5/DuPdzFVIQ1K9iu7VyHZtKq8lLNkfc9NBVDIBTUke/GA/DqCU6hm6m9HlaY30+mq0F89oRpcPD7hRsw2CfQSaLp+v6MOKKP/rrqbujLTfFEUILVNfgqkiVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=o/yHlMSu; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="o/yHlMSu"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52HC7ZW62266961
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Mar 2025 07:07:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742213255;
	bh=JARC1+Q5f9wGAvl+IXbS0Oin1wCKT8XeCIAeU4lhnCU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=o/yHlMSuTTys/p83FAuidmB0XUM7SVjpeLjtXZCmfZKK0wtNNo2RyKa5n5dc1QOpl
	 W7DXLfcBBM5iZ0tXDByOT8jxGanTaZ8qp/QlqlCdegXaM0sxxdhYb61QNsheHOXpp6
	 bH//jTPYBQNfkPQMfvithaao9cXcMl97or2YPRZ4=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52HC7ZGA000681
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 17 Mar 2025 07:07:35 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 17
 Mar 2025 07:07:35 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 17 Mar 2025 07:07:35 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52HC6MKE060901;
	Mon, 17 Mar 2025 07:07:32 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v9 17/26] remoteproc: k3: Refactor .start rproc ops into common driver
Date: Mon, 17 Mar 2025 17:36:13 +0530
Message-ID: <20250317120622.1746415-18-b-padhi@ti.com>
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
index e548beb817ca..e2c7da357ab5 100644
--- a/drivers/remoteproc/ti_k3_common.c
+++ b/drivers/remoteproc/ti_k3_common.c
@@ -268,5 +268,20 @@ int k3_rproc_unprepare(struct rproc *rproc)
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
index c1b07187c124..51a92a306479 100644
--- a/drivers/remoteproc/ti_k3_common.h
+++ b/drivers/remoteproc/ti_k3_common.h
@@ -95,4 +95,5 @@ int k3_rproc_release(struct k3_rproc *kproc);
 int k3_rproc_request_mbox(struct rproc *rproc);
 int k3_rproc_prepare(struct rproc *rproc);
 int k3_rproc_unprepare(struct rproc *rproc);
+int k3_rproc_start(struct rproc *rproc);
 #endif /* REMOTEPROC_TI_K3_COMMON_H */
diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
index ca3afd11fb89..fb3ba5a1e07c 100644
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
 
@@ -411,7 +412,6 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
 		dev_info(dev, "configured DSP for IPC-only mode\n");
 		rproc->state = RPROC_DETACHED;
 		/* override rproc ops with only required IPC-only mode ops */
-		rproc->ops->start = NULL;
 		rproc->ops->stop = NULL;
 		rproc->ops->attach = k3_dsp_rproc_attach;
 		rproc->ops->detach = k3_dsp_rproc_detach;
diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
index d53538d7dc0d..69066cb91740 100644
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
@@ -304,7 +284,7 @@ static int k3_m4_rproc_detach(struct rproc *rproc)
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

