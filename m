Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF4D267396;
	Thu, 17 Apr 2025 18:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744914141; cv=none; b=PUCMV5J5xUrD479bi/hKT8ai5/PS1dELg1PAawU+Uy6YUdOhtrfSymXTQiH2n3TpqeQrlvsj6BQgltqiQ/S+vF5qtdj02Wpv6AvpkQpQFVT0cyRdNb532w0xhi6dx1RTOUWbpjjnr6/4dcFoJUmmFpjYKxnSV8no3cSGG4MmJpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744914141; c=relaxed/simple;
	bh=kuti+Dhsm+iHWIbAjiHls7iE8E39lux+D4PqcTRTxzI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rrlP37keOrW1D18+9QxJotB/WYCyEM1QwdMznAuEbNj1mswvpDWTdST9JaXOphzury+VLyTAZ7YDDhyA55kWws45QzAZZzLxH4U/MrGgHHEH3wyV9c+NaLc0s+P6fXqRGy/reIbbw+hmiw9myjHz4yWpxCpwLaj57xjJRn/0yz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=qwz063pL; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="qwz063pL"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53HIM9US776115
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Apr 2025 13:22:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744914129;
	bh=yzM3VXY0WpBGdJKmDbExnid1aO6P13vN8jkfkHbTiDE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=qwz063pLOHRpiCM3JakbrG5+JSXe+9aE8vcHtcP1RAV4MScZvJXqpAGKq7iZ8pTFF
	 PH6vO7ngBK+r0S/M3Jt6PAmEOmRdDNp7UWSxGDpZWwedBkuaKw1HRtY+0OYZcL67sv
	 gS7m+xFSEU+HqlSgF0eHuLR4FZA3PXZRujGlj3oo=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53HIM92X028699
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 17 Apr 2025 13:22:09 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 17
 Apr 2025 13:22:09 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 17 Apr 2025 13:22:09 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53HIK1IH071102;
	Thu, 17 Apr 2025 13:22:06 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v10 33/33] remoteproc: k3: Refactor release_tsp() functions into common driver
Date: Thu, 17 Apr 2025 23:50:01 +0530
Message-ID: <20250417182001.3903905-34-b-padhi@ti.com>
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

The release_tsp() implementations in the TI K3 R5, DSP and M4 remoteproc
drivers release the TI-SCI processor control of a remote processor,
which is auto triggered upon device removal.

Refactor these functions into ti_k3_common.c driver as k3_release_tsp()
and use this common function throughout in R5, DSP and M4 drivers.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
v10: Changelog:
1. Update commit message to call out changes in a better way.

Link to v9:
https://lore.kernel.org/all/20250317120622.1746415-27-b-padhi@ti.com/

 drivers/remoteproc/ti_k3_common.c         | 8 ++++++++
 drivers/remoteproc/ti_k3_common.h         | 1 +
 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 9 +--------
 drivers/remoteproc/ti_k3_m4_remoteproc.c  | 9 +--------
 drivers/remoteproc/ti_k3_r5_remoteproc.c  | 9 +--------
 5 files changed, 12 insertions(+), 24 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
index f7fa757de04de..64edf536f384d 100644
--- a/drivers/remoteproc/ti_k3_common.c
+++ b/drivers/remoteproc/ti_k3_common.c
@@ -541,5 +541,13 @@ int k3_reserved_mem_init(struct k3_rproc *kproc)
 }
 EXPORT_SYMBOL_GPL(k3_reserved_mem_init);
 
+void k3_release_tsp(void *data)
+{
+	struct ti_sci_proc *tsp = data;
+
+	ti_sci_proc_release(tsp);
+}
+EXPORT_SYMBOL_GPL(k3_release_tsp);
+
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("TI K3 common Remoteproc code");
diff --git a/drivers/remoteproc/ti_k3_common.h b/drivers/remoteproc/ti_k3_common.h
index 148717942dfb3..a9981303dde83 100644
--- a/drivers/remoteproc/ti_k3_common.h
+++ b/drivers/remoteproc/ti_k3_common.h
@@ -109,4 +109,5 @@ int k3_rproc_of_get_memories(struct platform_device *pdev,
 			     struct k3_rproc *kproc);
 void k3_mem_release(void *data);
 int k3_reserved_mem_init(struct k3_rproc *kproc);
+void k3_release_tsp(void *data);
 #endif /* REMOTEPROC_TI_K3_COMMON_H */
diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
index 45000b68260c1..7a72933bd403b 100644
--- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
@@ -66,13 +66,6 @@ static const struct rproc_ops k3_dsp_rproc_ops = {
 	.get_loaded_rsc_table	= k3_get_loaded_rsc_table,
 };
 
-static void k3_dsp_release_tsp(void *data)
-{
-	struct ti_sci_proc *tsp = data;
-
-	ti_sci_proc_release(tsp);
-}
-
 static int k3_dsp_rproc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -136,7 +129,7 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
 		dev_err_probe(dev, ret, "ti_sci_proc_request failed\n");
 		return ret;
 	}
-	ret = devm_add_action_or_reset(dev, k3_dsp_release_tsp, kproc->tsp);
+	ret = devm_add_action_or_reset(dev, k3_release_tsp, kproc->tsp);
 	if (ret)
 		return ret;
 
diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
index d6c9d90184bb4..6a5ff3b7a82a3 100644
--- a/drivers/remoteproc/ti_k3_m4_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_m4_remoteproc.c
@@ -21,13 +21,6 @@
 #include "ti_sci_proc.h"
 #include "ti_k3_common.h"
 
-static void k3_m4_release_tsp(void *data)
-{
-	struct ti_sci_proc *tsp = data;
-
-	ti_sci_proc_release(tsp);
-}
-
 static const struct rproc_ops k3_m4_rproc_ops = {
 	.prepare = k3_rproc_prepare,
 	.unprepare = k3_rproc_unprepare,
@@ -93,7 +86,7 @@ static int k3_m4_rproc_probe(struct platform_device *pdev)
 	ret = ti_sci_proc_request(kproc->tsp);
 	if (ret < 0)
 		return dev_err_probe(dev, ret, "ti_sci_proc_request failed\n");
-	ret = devm_add_action_or_reset(dev, k3_m4_release_tsp, kproc->tsp);
+	ret = devm_add_action_or_reset(dev, k3_release_tsp, kproc->tsp);
 	if (ret)
 		return ret;
 
diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
index 77183606b9d4d..aada8a3795357 100644
--- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
@@ -1011,13 +1011,6 @@ static int k3_r5_core_of_get_sram_memories(struct platform_device *pdev,
 	return 0;
 }
 
-static void k3_r5_release_tsp(void *data)
-{
-	struct ti_sci_proc *tsp = data;
-
-	ti_sci_proc_release(tsp);
-}
-
 static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
 {
 	struct k3_r5_cluster *cluster = platform_get_drvdata(pdev);
@@ -1103,7 +1096,7 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
 			goto out;
 		}
 
-		ret = devm_add_action_or_reset(cdev, k3_r5_release_tsp, kproc->tsp);
+		ret = devm_add_action_or_reset(cdev, k3_release_tsp, kproc->tsp);
 		if (ret)
 			goto out;
 	}
-- 
2.34.1

