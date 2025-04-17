Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0022571A0;
	Thu, 17 Apr 2025 18:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744914132; cv=none; b=NfpZU8DJQjZwMvKjOA4ZZLoZk95gWRTSvhOWbU9PJ/AfsRFjD9rGkd6+8bZL2/G7w2X8c24NMRFrFa0pni+UFthj4uWZtRizZ85yVxJoSfrBkdpd9hHC5zF2MYn9ztJbvksgyGlKXUjXG0Y0UvEuLaSu5SseWjBpxzDNNCtSYhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744914132; c=relaxed/simple;
	bh=PcEV97oMWzc1lE6yU7Ed9t/wm6dNWEofBYSxvUCrBTg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pS+3WyvVXdUVvbAG1Epk3eQZ6iwpNZV+kOwF37WkhsFVZ0m/HbbDCLu0QEYLoUU9tRFpxdF+E+18SNW4TogV8TA3ceCgTsK14YZu5Ze6wp+USRKZGu1Ptn9QgIlhbOPZEPUVUuJg7QqwNTAB89NwK06oKs/f326PhgBu7S0CfhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=jT8swMbk; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="jT8swMbk"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53HIM2og720207
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Apr 2025 13:22:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744914122;
	bh=rb+5+aeSD03+a+aDVf8QsRNe+EhbNpl+QT9n2QkgSGI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=jT8swMbkG80Io7ecCdlWBn8x/TGXSXs/vNOnvdga79h9kBtRzD8CPFpcwM5yS8/Kp
	 YblKxM/2A8flBY8trcjQj7ry8ASl80WII7qNEvewEK6ULDmkidW1BXBxHJl2bgvDFX
	 6hi/x3s/ZdZOr3X5d08Q0jHMiNoWaUAMwWJia5r4=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53HIM2ci023480
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 17 Apr 2025 13:22:02 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 17
 Apr 2025 13:22:02 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 17 Apr 2025 13:22:02 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53HIK1IF071102;
	Thu, 17 Apr 2025 13:21:58 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v10 31/33] remoteproc: k3: Refactor mem_release() functions into common driver
Date: Thu, 17 Apr 2025 23:49:59 +0530
Message-ID: <20250417182001.3903905-32-b-padhi@ti.com>
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

The mem_release() implementations in the TI K3 R5, DSP and M4 remoteproc
drivers release the reserved memory of the device, which get auto
triggered upon device removal.

Refactor these functions into ti_k3_common.c driver as k3_mem_release()
and use this common function in R5, DSP and M4 drivers.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
v10: Changelog:
1. Update commit message to call out changes in a better way.

Link to v9:
https://lore.kernel.org/all/20250317120622.1746415-25-b-padhi@ti.com/

 drivers/remoteproc/ti_k3_common.c         | 8 ++++++++
 drivers/remoteproc/ti_k3_common.h         | 1 +
 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 9 +--------
 drivers/remoteproc/ti_k3_m4_remoteproc.c  | 9 +--------
 drivers/remoteproc/ti_k3_r5_remoteproc.c  | 9 +--------
 5 files changed, 12 insertions(+), 24 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
index 4358502850214..ec7c06f492ec5 100644
--- a/drivers/remoteproc/ti_k3_common.c
+++ b/drivers/remoteproc/ti_k3_common.c
@@ -463,5 +463,13 @@ int k3_rproc_of_get_memories(struct platform_device *pdev,
 }
 EXPORT_SYMBOL_GPL(k3_rproc_of_get_memories);
 
+void k3_mem_release(void *data)
+{
+	struct device *dev = data;
+
+	of_reserved_mem_device_release(dev);
+}
+EXPORT_SYMBOL_GPL(k3_mem_release);
+
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("TI K3 common Remoteproc code");
diff --git a/drivers/remoteproc/ti_k3_common.h b/drivers/remoteproc/ti_k3_common.h
index a811c4951e6b0..70656215c4d72 100644
--- a/drivers/remoteproc/ti_k3_common.h
+++ b/drivers/remoteproc/ti_k3_common.h
@@ -107,4 +107,5 @@ void *k3_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len,
 			bool *is_iomem);
 int k3_rproc_of_get_memories(struct platform_device *pdev,
 			     struct k3_rproc *kproc);
+void k3_mem_release(void *data);
 #endif /* REMOTEPROC_TI_K3_COMMON_H */
diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
index 5ba82944a537f..6c79b347a610a 100644
--- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
@@ -66,13 +66,6 @@ static const struct rproc_ops k3_dsp_rproc_ops = {
 	.get_loaded_rsc_table	= k3_get_loaded_rsc_table,
 };
 
-static void k3_dsp_mem_release(void *data)
-{
-	struct device *dev = data;
-
-	of_reserved_mem_device_release(dev);
-}
-
 static int k3_dsp_reserved_mem_init(struct k3_rproc *kproc)
 {
 	struct device *dev = kproc->dev;
@@ -102,7 +95,7 @@ static int k3_dsp_reserved_mem_init(struct k3_rproc *kproc)
 			ERR_PTR(ret));
 		return ret;
 	}
-	ret = devm_add_action_or_reset(dev, k3_dsp_mem_release, dev);
+	ret = devm_add_action_or_reset(dev, k3_mem_release, dev);
 	if (ret)
 		return ret;
 
diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
index 81862a7809b5b..aeddbf82901f9 100644
--- a/drivers/remoteproc/ti_k3_m4_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_m4_remoteproc.c
@@ -21,13 +21,6 @@
 #include "ti_sci_proc.h"
 #include "ti_k3_common.h"
 
-static void k3_m4_rproc_dev_mem_release(void *data)
-{
-	struct device *dev = data;
-
-	of_reserved_mem_device_release(dev);
-}
-
 static int k3_m4_reserved_mem_init(struct k3_rproc *kproc)
 {
 	struct device *dev = kproc->dev;
@@ -56,7 +49,7 @@ static int k3_m4_reserved_mem_init(struct k3_rproc *kproc)
 		dev_err(dev, "device cannot initialize DMA pool (%d)\n", ret);
 		return ret;
 	}
-	ret = devm_add_action_or_reset(dev, k3_m4_rproc_dev_mem_release, dev);
+	ret = devm_add_action_or_reset(dev, k3_mem_release, dev);
 	if (ret)
 		return ret;
 
diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
index 94e9506a8e6e2..59bd610f2a8c7 100644
--- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
@@ -761,13 +761,6 @@ static int k3_r5_rproc_configure(struct k3_rproc *kproc)
 	return ret;
 }
 
-static void k3_r5_mem_release(void *data)
-{
-	struct device *dev = data;
-
-	of_reserved_mem_device_release(dev);
-}
-
 static int k3_r5_reserved_mem_init(struct k3_rproc *kproc)
 {
 	struct device *dev = kproc->dev;
@@ -798,7 +791,7 @@ static int k3_r5_reserved_mem_init(struct k3_rproc *kproc)
 		return ret;
 	}
 
-	ret = devm_add_action_or_reset(dev, k3_r5_mem_release, dev);
+	ret = devm_add_action_or_reset(dev, k3_mem_release, dev);
 	if (ret)
 		return ret;
 
-- 
2.34.1

