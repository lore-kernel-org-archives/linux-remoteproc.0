Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA0224886E;
	Mon, 17 Mar 2025 12:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742213294; cv=none; b=OgWfNihLQ7kv/R44H12PDxahpS2MI89Oxr4nPYT7RSGeHNn8zZG/rhVI80O9p6h6qiLw9RtDeUtY1CsZ5f4xCVoVh3AnxDaovn1+HeAsDGhUfQ3DC6pBROI/3ykuZoeC6VvP9uJjPyn4ChO3moiKmku26SUOKNtD7lEUPMXm1lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742213294; c=relaxed/simple;
	bh=ZJi/Qn+rYlROSgyP+c5aAhzKngV+AnTMXVWmqOzuUTI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=plElBhq9FtVlaV1cYK7mSUe1V70g/p3qVkErqj+3VqPo2PZq1JDUMyw53sqkmLwNUzxNce/PF5K6GbOTv7WIyDoW4EJkj8bbfYRXeFLGw5hpfhAkFBWrY6Ox65Mby3WU69b5iSj9PZEG2xLvxNqAp/18iDrIBgBCBmaMG4zOu0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=lCjq3Bi2; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="lCjq3Bi2"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52HC838C2267180
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Mar 2025 07:08:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742213283;
	bh=uvbt/2QUKnblCaZEiYV6Ya27n6TLlpLFTLful0J9tI0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=lCjq3Bi2NSyHxjT9YzlhlPBJa89YRrJj00SRfF7RLQ4aWEDHMqRSRj8ouDTE9La95
	 dRl64DyAsO105rIFhoi4N3DsLe2FOaqKT3BUn0cG8bI241+bcjJ0ykSc1NFjlDJLpe
	 9NDIb/zNTaX+CuMdFYXm/vUck6QS3CKjzvsXnVdE=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52HC838x108802
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 17 Mar 2025 07:08:03 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 17
 Mar 2025 07:08:02 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 17 Mar 2025 07:08:02 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52HC6MKL060901;
	Mon, 17 Mar 2025 07:07:58 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v9 24/26] remoteproc: k3: Refactor mem_release() functions into common driver
Date: Mon, 17 Mar 2025 17:36:20 +0530
Message-ID: <20250317120622.1746415-25-b-padhi@ti.com>
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

The k3_{r5/dsp}_mem_release() and k3_m4_rproc_dev_mem_release()
functions release the reserved memory of the device, which get auto
triggered upon device removal. Refactor these functions into
ti_k3_common.c driver as k3_mem_release() and align R5, DSP and M4
drivers to use this common function throughout.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
 drivers/remoteproc/ti_k3_common.c         | 8 ++++++++
 drivers/remoteproc/ti_k3_common.h         | 1 +
 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 9 +--------
 drivers/remoteproc/ti_k3_m4_remoteproc.c  | 9 +--------
 drivers/remoteproc/ti_k3_r5_remoteproc.c  | 9 +--------
 5 files changed, 12 insertions(+), 24 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
index 27295d1b1932..a51c0196530e 100644
--- a/drivers/remoteproc/ti_k3_common.c
+++ b/drivers/remoteproc/ti_k3_common.c
@@ -462,5 +462,13 @@ int k3_rproc_of_get_memories(struct platform_device *pdev,
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
index a811c4951e6b..70656215c4d7 100644
--- a/drivers/remoteproc/ti_k3_common.h
+++ b/drivers/remoteproc/ti_k3_common.h
@@ -107,4 +107,5 @@ void *k3_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len,
 			bool *is_iomem);
 int k3_rproc_of_get_memories(struct platform_device *pdev,
 			     struct k3_rproc *kproc);
+void k3_mem_release(void *data);
 #endif /* REMOTEPROC_TI_K3_COMMON_H */
diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
index 476f53249793..1176a6f4c977 100644
--- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
@@ -66,13 +66,6 @@ static const struct rproc_ops k3_dsp_rproc_ops = {
 	.get_loaded_rsc_table	=	k3_get_loaded_rsc_table,
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
index 771769e3dd66..67b92cbf7c2b 100644
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
index b392c40b4670..fed1d189144a 100644
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

