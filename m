Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496271F1906;
	Tue, 13 May 2025 05:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747115208; cv=none; b=Tpjrm3MbSJw63h7LcpA9DgmIDwZkh1UioriWjwG/mixxGr9DQqKujouBAjmlLSiwjtSXPM5uOfQVL4Df+QgSXS9PtgBMMLWsRbELnvFpnFW9N5k7e/aayfj6hh1WMRx3L82vaG7qtS+cLbyQCHl3iIx5TRPzKeYDwMS9Lguc+uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747115208; c=relaxed/simple;
	bh=JJn92PQFfVWk5XygAiJ4zijhsQAzjIFu8t6FeDzq7JA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Wr4agczS0Yw5co/Q3Jz3gyNbpgz1/P/BjTByYX7N2RGzUsP4OY848Pst1LYN6OcQdFJROauMiB+dWsTt/pMZWoydN6ex3pI/pTh51m/yiGMp4/rA0RkJw07/FD06HSzHFZ58DHd3mSk8c7rQNAtbhvL/9ZWJAAonwvLpkj5ZZQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=jREo9fOK; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="jREo9fOK"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 54D5kcaL2986906
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 May 2025 00:46:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747115199;
	bh=Nws17/MmADb4S1sCO5hEd39axacVL7RiGC1Wrf8PR7s=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=jREo9fOKLAMvcPdcIpfsQCl/7NVJh53c4gr62E2qqOR1gdeNpKDXctT15caz0K6S6
	 556kEh3HgoqMusJVTi36V8c5DTBB1pVsGqrD/x4wprRxMKTsxSEM6AYNDriB8XQCEX
	 rfvRC326cRNkTo8vj5P1s2QieSEVXEf/lttIDZMw=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 54D5kctX088885
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 13 May 2025 00:46:38 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 13
 May 2025 00:46:38 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 13 May 2025 00:46:38 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54D5jAqT131001;
	Tue, 13 May 2025 00:46:34 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v12 20/36] remoteproc: k3: Refactor rproc_release() implementation into common driver
Date: Tue, 13 May 2025 11:14:54 +0530
Message-ID: <20250513054510.3439842-21-b-padhi@ti.com>
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

The rproc_release() implementations in TI K3 DSP and M4 remoteproc
drivers deassert reset in the same way. Refactor the above function into
the ti_k3_common.c driver as k3_rproc_release() and use it throughout
DSP and M4 drivers for releasing the reset from the remote processor.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
Tested-by: Judith Mendez <jm@ti.com>
Reviewed-by: Andrew Davis <afd@ti.com>
---
v12: Changelog:
1. Carried R/B tag.

Link to v11:
https://lore.kernel.org/all/20250425104135.830255-20-b-padhi@ti.com/

v11: Changelog:
1. Split [v10 17/33] into [v11 18/35] and [v11 19/35].
2. Carried T/B tag.

Link to v10:
https://lore.kernel.org/all/20250417182001.3903905-18-b-padhi@ti.com/

v10: Changelog:
1. Split [v9 13/26] into [v10 16/33] and [v10 17/33] patches. 

Link to v9:
https://lore.kernel.org/all/20250317120622.1746415-14-b-padhi@ti.com/

 drivers/remoteproc/ti_k3_common.c         | 25 ++++++++++++++++++++++
 drivers/remoteproc/ti_k3_common.h         |  1 +
 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 26 +----------------------
 drivers/remoteproc/ti_k3_m4_remoteproc.c  | 26 +----------------------
 4 files changed, 28 insertions(+), 50 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
index 7cd5f3ece8197..ab1507290ee01 100644
--- a/drivers/remoteproc/ti_k3_common.c
+++ b/drivers/remoteproc/ti_k3_common.c
@@ -130,5 +130,30 @@ int k3_rproc_reset(struct k3_rproc *kproc)
 }
 EXPORT_SYMBOL_GPL(k3_rproc_reset);
 
+/* Release the remote processor from reset */
+int k3_rproc_release(struct k3_rproc *kproc)
+{
+	struct device *dev = kproc->dev;
+	int ret;
+
+	if (kproc->data->uses_lreset) {
+		ret = reset_control_deassert(kproc->reset);
+		if (ret) {
+			dev_err(dev, "local-reset deassert failed, (%pe)\n", ERR_PTR(ret));
+			if (kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
+								  kproc->ti_sci_id))
+				dev_warn(dev, "module-reset assert back failed\n");
+		}
+	} else {
+		ret = kproc->ti_sci->ops.dev_ops.get_device(kproc->ti_sci,
+							    kproc->ti_sci_id);
+		if (ret)
+			dev_err(dev, "module-reset deassert failed (%pe)\n", ERR_PTR(ret));
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(k3_rproc_release);
+
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("TI K3 common Remoteproc code");
diff --git a/drivers/remoteproc/ti_k3_common.h b/drivers/remoteproc/ti_k3_common.h
index a2bb2484cebee..c64c3fcb531ee 100644
--- a/drivers/remoteproc/ti_k3_common.h
+++ b/drivers/remoteproc/ti_k3_common.h
@@ -96,4 +96,5 @@ struct k3_rproc {
 void k3_rproc_mbox_callback(struct mbox_client *client, void *data);
 void k3_rproc_kick(struct rproc *rproc, int vqid);
 int k3_rproc_reset(struct k3_rproc *kproc);
+int k3_rproc_release(struct k3_rproc *kproc);
 #endif /* REMOTEPROC_TI_K3_COMMON_H */
diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
index 08e6dde3ea267..577dcd65093a9 100644
--- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
@@ -24,30 +24,6 @@
 
 #define KEYSTONE_RPROC_LOCAL_ADDRESS_MASK	(SZ_16M - 1)
 
-/* Release the DSP processor from reset */
-static int k3_dsp_rproc_release(struct k3_rproc *kproc)
-{
-	struct device *dev = kproc->dev;
-	int ret;
-
-	if (kproc->data->uses_lreset) {
-		ret = reset_control_deassert(kproc->reset);
-		if (ret) {
-			dev_err(dev, "local-reset deassert failed, (%pe)\n", ERR_PTR(ret));
-			if (kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
-								  kproc->ti_sci_id))
-				dev_warn(dev, "module-reset assert back failed\n");
-		}
-	} else {
-		ret = kproc->ti_sci->ops.dev_ops.get_device(kproc->ti_sci,
-							    kproc->ti_sci_id);
-		if (ret)
-			dev_err(dev, "module-reset deassert failed (%pe)\n", ERR_PTR(ret));
-	}
-
-	return ret;
-}
-
 static int k3_dsp_rproc_request_mbox(struct rproc *rproc)
 {
 	struct k3_rproc *kproc = rproc->priv;
@@ -156,7 +132,7 @@ static int k3_dsp_rproc_start(struct rproc *rproc)
 	if (ret)
 		return ret;
 
-	ret = k3_dsp_rproc_release(kproc);
+	ret = k3_rproc_release(kproc);
 	if (ret)
 		return ret;
 
diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
index d9c105bc4845d..3a21ff95046fd 100644
--- a/drivers/remoteproc/ti_k3_m4_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_m4_remoteproc.c
@@ -21,30 +21,6 @@
 #include "ti_sci_proc.h"
 #include "ti_k3_common.h"
 
-/* Release the M4 remote processor from reset */
-static int k3_m4_rproc_release(struct k3_rproc *kproc)
-{
-	struct device *dev = kproc->dev;
-	int ret;
-
-	if (kproc->data->uses_lreset) {
-		ret = reset_control_deassert(kproc->reset);
-		if (ret) {
-			dev_err(dev, "local-reset deassert failed, ret = %d\n", ret);
-			if (kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
-								  kproc->ti_sci_id))
-				dev_warn(dev, "module-reset assert back failed\n");
-		}
-	} else {
-		ret = kproc->ti_sci->ops.dev_ops.get_device(kproc->ti_sci,
-							    kproc->ti_sci_id);
-		if (ret)
-			dev_err(dev, "module-reset deassert failed, ret = %d\n", ret);
-	}
-
-	return ret;
-}
-
 static int k3_m4_rproc_ping_mbox(struct k3_rproc *kproc)
 {
 	struct device *dev = kproc->dev;
@@ -377,7 +353,7 @@ static int k3_m4_rproc_start(struct rproc *rproc)
 	if (ret)
 		return ret;
 
-	ret = k3_m4_rproc_release(kproc);
+	ret = k3_rproc_release(kproc);
 
 	return ret;
 }
-- 
2.34.1

