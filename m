Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8635920100D;
	Tue, 13 May 2025 05:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747115236; cv=none; b=I9vNWHt4etRrGnvq2ON2bD5kGZaii6bIt4QlKDucFzSJ3Jgdbcn5/LrPGyAkBRnhf+nH5zZmg3j1zJ4uw7rr3OsXhcCHnC8O/OEljZo4cbA1x4FSxDIiAXhiF9ZoZHT44wFwyLcf8nPUpCzX/vUXnY+VDEAh/kVnHfvcCCMAqmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747115236; c=relaxed/simple;
	bh=MqOpYIv54AbI0UPExY1KfDVtjwlcjC14DhjRaelAEdk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ryvrfaA/Yl1OuiaUfN/oMzuwOhyoQ9afe4p2MyJrd2zumPZesW4/qLVAnuc6sKIr7t8t0me7RYPO2P0JWO+du+16wR0kO1BnRPNjkABOeWj74mQQcv2WNFlL8BiKPjod6gZmX3JYZ/3owm3DPxypMo50Wg7LDQjQzBCzZ9gzQFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=QIX/dg16; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="QIX/dg16"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 54D5l7hZ2764482
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 May 2025 00:47:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747115227;
	bh=3DiAhAZSBfrvgY1JC54CddHqmQInseCYzKoE2eXS63A=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=QIX/dg16PSvlfgCpT6+9oYT0x/b9FYMftCAw5Oy95piV+fqto6HSvOBQquDsbgX+1
	 2cx9UHcpl8TdOrRWH8isicofFhYTp9trcHJMuE2vYXpbw4TPEID+dXzS7+qAr+u1ga
	 LrZR0ETXfS1es0ynDtryd9VhuV5sTYtrzpPi2YNE=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 54D5l7EI032709
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 13 May 2025 00:47:07 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 13
 May 2025 00:47:07 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 13 May 2025 00:47:06 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54D5jAqa131001;
	Tue, 13 May 2025 00:47:03 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v12 27/36] remoteproc: k3: Refactor .start rproc ops into common driver
Date: Tue, 13 May 2025 11:15:01 +0530
Message-ID: <20250513054510.3439842-28-b-padhi@ti.com>
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

The k3_dsp_rproc_start() function sets the boot vector and releases the
reset on the remote processor. Whereas, the k3_m4_rproc_start() function
only needs to release the reset.

Refactor the k3_m4_rproc_start() into ti_k3_common.c as k3_rproc_start()
and align the DSP and M4 drivers to invoke this common function when
releasing the reset on the remote processor.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
Tested-by: Judith Mendez <jm@ti.com>
Reviewed-by: Andrew Davis <afd@ti.com>
---
v12: Changelog:
1. Carried R/B tag.

Link to v11:
https://lore.kernel.org/all/20250425104135.830255-27-b-padhi@ti.com/

v11: Changelog:
1. Carried T/B tag.

Link to v10:
https://lore.kernel.org/all/20250417182001.3903905-25-b-padhi@ti.com/

v10: Changelog:
1. Don't remove dsp func override. Already done by [v10 20/33] patch.

Link to v9:
https://lore.kernel.org/all/20250317120622.1746415-18-b-padhi@ti.com/

 drivers/remoteproc/ti_k3_common.c         | 15 +++++++++++++++
 drivers/remoteproc/ti_k3_common.h         |  1 +
 drivers/remoteproc/ti_k3_dsp_remoteproc.c |  3 ++-
 drivers/remoteproc/ti_k3_m4_remoteproc.c  | 16 +---------------
 4 files changed, 19 insertions(+), 16 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
index 235f6fca675a3..32569c00cfc0c 100644
--- a/drivers/remoteproc/ti_k3_common.c
+++ b/drivers/remoteproc/ti_k3_common.c
@@ -267,5 +267,20 @@ int k3_rproc_unprepare(struct rproc *rproc)
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
index e0909fe0578e8..5237223f05028 100644
--- a/drivers/remoteproc/ti_k3_common.h
+++ b/drivers/remoteproc/ti_k3_common.h
@@ -100,4 +100,5 @@ int k3_rproc_release(struct k3_rproc *kproc);
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
index 6e7d78ff78941..af206e2f50cf5 100644
--- a/drivers/remoteproc/ti_k3_m4_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_m4_remoteproc.c
@@ -244,20 +244,6 @@ static void k3_m4_release_tsp(void *data)
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
-
-	return k3_rproc_release(kproc);
-}
-
 /*
  * Stop the M4 remote processor.
  *
@@ -298,7 +284,7 @@ static int k3_m4_rproc_detach(struct rproc *rproc)
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

