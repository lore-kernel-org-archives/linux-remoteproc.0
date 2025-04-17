Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B664264629;
	Thu, 17 Apr 2025 18:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744914105; cv=none; b=H2Jpl5mgQ+lsw1Nz4/53YHMxidO3nG9U3lfL0BPgKp39ritJ9oUL69t/EyD/TPobb88cyEytMo0yTtlSi1/bsQ67/8QGSfzr1hFnxkv9fgvxOKU5WUDdohH9mgzodjBewNH8u+3ZvHzqrZrveG9azcApAlpYNNfodr5rSw1JaXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744914105; c=relaxed/simple;
	bh=IutFvg4gyRRc8C58Y24wM+qWLupC8lkAxoKg+nD1WC8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rwy460J1QBuh8nvnAaYEn699O7FCzuUBucmH9hvEy5Hxdb3WDVpNsFCoo7vMgOKz62y6Jj4ganDx99wNu/WmJ/coR24P0/hX++SGnYIrt9ECCM1zKvt9NvWmwFDNWzLQH6gJ9Vyo4JNwycRaDv3elEBSpHO01yD/vG5T6Idmcog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=O9Xt7fkF; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="O9Xt7fkF"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53HILak6080679
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Apr 2025 13:21:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744914096;
	bh=sRTIVUavhERxSsagZqdqnDWRc6XhdKy0mxrCqR6WrgE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=O9Xt7fkFTJdgWbqK0o4uWhJwug2ootLd66TwPSO4fmdMJBtNv5+QS2aQaF8OKZOwS
	 fQW/clp8suKJcVFSF58NmgQjDewzBiM5EwmZ2cKhsgvpQ7ZunuQLfWNIW2ED6SeT1w
	 zHUUGimi+OpKnKQEBmo7bTj5nbf+Q+dQSlQ4AzXo=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53HILaGg028450
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 17 Apr 2025 13:21:36 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 17
 Apr 2025 13:21:35 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 17 Apr 2025 13:21:35 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53HIK1I8071102;
	Thu, 17 Apr 2025 13:21:32 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v10 24/33] remoteproc: k3: Refactor .start rproc ops into common driver
Date: Thu, 17 Apr 2025 23:49:52 +0530
Message-ID: <20250417182001.3903905-25-b-padhi@ti.com>
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

The k3_dsp_rproc_start() function sets the boot vector and releases the
reset on the remote processor. Whereas, the k3_m4_rproc_start() function
only needs to release the reset.

Refactor the k3_m4_rproc_start() into ti_k3_common.c as k3_rproc_start()
and align the DSP and M4 drivers to invoke this common function when
releasing the reset on the remote processor.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
v10: Changelog:
1. Don't remove dsp func override. Already done by [v10 20/33] patch.

Link to v9:
https://lore.kernel.org/all/20250317120622.1746415-18-b-padhi@ti.com/

 drivers/remoteproc/ti_k3_common.c         | 15 +++++++++++++++
 drivers/remoteproc/ti_k3_common.h         |  1 +
 drivers/remoteproc/ti_k3_dsp_remoteproc.c |  3 ++-
 drivers/remoteproc/ti_k3_m4_remoteproc.c  | 22 +---------------------
 4 files changed, 19 insertions(+), 22 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
index 0f6b68796026c..4261c3b7ba827 100644
--- a/drivers/remoteproc/ti_k3_common.c
+++ b/drivers/remoteproc/ti_k3_common.c
@@ -269,5 +269,20 @@ int k3_rproc_unprepare(struct rproc *rproc)
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
index c1b07187c124c..51a92a3064793 100644
--- a/drivers/remoteproc/ti_k3_common.h
+++ b/drivers/remoteproc/ti_k3_common.h
@@ -95,4 +95,5 @@ int k3_rproc_release(struct k3_rproc *kproc);
 int k3_rproc_request_mbox(struct rproc *rproc);
 int k3_rproc_prepare(struct rproc *rproc);
 int k3_rproc_unprepare(struct rproc *rproc);
+int k3_rproc_start(struct rproc *rproc);
 #endif /* REMOTEPROC_TI_K3_COMMON_H */
diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
index 5099d21ce066f..67d46c4a1ba61 100644
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
 
diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
index 6f421ebc691b3..70f186eedc6c7 100644
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

