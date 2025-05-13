Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C212136337;
	Tue, 13 May 2025 05:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747115203; cv=none; b=jigbYKiIBncqIWJoE8kYuOyIn4W3vE2VEftiM6O8nbV+pASRlz+lTBKyjhvd1eZIATLW13iEZ9YaLqS8BnjsaPK2v53YyFrqimAfhADBmk6ZPhsYsZXTCsk+p4N2dxcDWXTEE4c+Q0hrXFZUnKqfjEiCFVeGmMK0la0MtbKajls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747115203; c=relaxed/simple;
	bh=81Wi6NAT9SOjQWyoRImxkhI0Tmm4YEAdxP4BqHBv9LM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ACHDjtN/DvofTKQbU/9zLoOHIrm+mDftCKXLfjylYE4nLY5KGwP6dkDavLHqPMajkuGXkFNaDIEJ0I5yw6oQBDnsnIfcrtVP8Tz49FymW6G7ubUHIyovx9IVAh2z1CxzMNzu3YYGUidgpGRJrNxB4xEoWF1h7GA1QEa5v1QfozM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=YAfqO2tX; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="YAfqO2tX"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 54D5kQkv2986534
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 May 2025 00:46:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747115186;
	bh=MaH2O6D0RitZicu7NqnATjP4mKjgI2FA+gHOg+uW7iY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=YAfqO2tXmXYOLOaRQfnKo5dCSmu96oVifcTrF0fDdznu5PDjZHe99OOMVBceY3L99
	 lq0aG7i+B7n0V2zizA9RNdgaUOk4jNrL/eqLEEduL+Wb7dBXGDlcQdbverZzbylzJX
	 fAWApuPEe2mv16sRMp4kweeL1DUu9li/lX2O9JlE=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 54D5kQeo028019
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 13 May 2025 00:46:26 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 13
 May 2025 00:46:25 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 13 May 2025 00:46:25 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54D5jAqQ131001;
	Tue, 13 May 2025 00:46:22 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v12 17/36] remoteproc: k3: Refactor rproc_reset() implementation into common driver
Date: Tue, 13 May 2025 11:14:51 +0530
Message-ID: <20250513054510.3439842-18-b-padhi@ti.com>
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

The rproc_reset() implementations in TI K3 DSP and M4 remoteproc drivers
assert reset in the same way. Refactor the above function into the
ti_k3_common.c driver as k3_rproc_reset() and use it throughout DSP and
M4 drivers for resetting the remote processor.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
Tested-by: Judith Mendez <jm@ti.com>
Reviewed-by: Andrew Davis <afd@ti.com>
---
v12: Changelog:
1. Carried R/B tag.

Link to v11:
https://lore.kernel.org/all/20250425104135.830255-17-b-padhi@ti.com/

v11: Changelog:
1. Split [v10 15/33] into [v11 15/35] and [v11 16/35].
2. Carried T/B tag.

Link to v10:
https://lore.kernel.org/all/20250417182001.3903905-16-b-padhi@ti.com/

v10: Changelog:
1. Split [v9 12/26] into [v10 14/33] and [v10 15/33] patches. 

Link to v9:
https://lore.kernel.org/all/20250317120622.1746415-13-b-padhi@ti.com/

 drivers/remoteproc/ti_k3_common.c         | 21 ++++++++++++++++++++
 drivers/remoteproc/ti_k3_common.h         |  1 +
 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 24 ++---------------------
 drivers/remoteproc/ti_k3_m4_remoteproc.c  | 24 ++---------------------
 4 files changed, 26 insertions(+), 44 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
index c4a9e5df0ea59..7cd5f3ece8197 100644
--- a/drivers/remoteproc/ti_k3_common.c
+++ b/drivers/remoteproc/ti_k3_common.c
@@ -109,5 +109,26 @@ void k3_rproc_kick(struct rproc *rproc, int vqid)
 }
 EXPORT_SYMBOL_GPL(k3_rproc_kick);
 
+/* Put the remote processor into reset */
+int k3_rproc_reset(struct k3_rproc *kproc)
+{
+	struct device *dev = kproc->dev;
+	int ret;
+
+	if (kproc->data->uses_lreset) {
+		ret = reset_control_assert(kproc->reset);
+		if (ret)
+			dev_err(dev, "local-reset assert failed (%pe)\n", ERR_PTR(ret));
+	} else {
+		ret = kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
+							    kproc->ti_sci_id);
+		if (ret)
+			dev_err(dev, "module-reset assert failed (%pe)\n", ERR_PTR(ret));
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(k3_rproc_reset);
+
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("TI K3 common Remoteproc code");
diff --git a/drivers/remoteproc/ti_k3_common.h b/drivers/remoteproc/ti_k3_common.h
index 4d9640557c340..a2bb2484cebee 100644
--- a/drivers/remoteproc/ti_k3_common.h
+++ b/drivers/remoteproc/ti_k3_common.h
@@ -95,4 +95,5 @@ struct k3_rproc {
 
 void k3_rproc_mbox_callback(struct mbox_client *client, void *data);
 void k3_rproc_kick(struct rproc *rproc, int vqid);
+int k3_rproc_reset(struct k3_rproc *kproc);
 #endif /* REMOTEPROC_TI_K3_COMMON_H */
diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
index 2ffcdba1c7754..f8a5282df5b71 100644
--- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
@@ -24,26 +24,6 @@
 
 #define KEYSTONE_RPROC_LOCAL_ADDRESS_MASK	(SZ_16M - 1)
 
-/* Put the DSP processor into reset */
-static int k3_dsp_rproc_reset(struct k3_rproc *kproc)
-{
-	struct device *dev = kproc->dev;
-	int ret;
-
-	if (kproc->data->uses_lreset) {
-		ret = reset_control_assert(kproc->reset);
-		if (ret)
-			dev_err(dev, "local-reset assert failed (%pe)\n", ERR_PTR(ret));
-	} else {
-		ret = kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
-							    kproc->ti_sci_id);
-		if (ret)
-			dev_err(dev, "module-reset assert failed (%pe)\n", ERR_PTR(ret));
-	}
-
-	return ret;
-}
-
 /* Release the DSP processor from reset */
 static int k3_dsp_rproc_release(struct k3_rproc *kproc)
 {
@@ -197,7 +177,7 @@ static int k3_dsp_rproc_stop(struct rproc *rproc)
 {
 	struct k3_rproc *kproc = rproc->priv;
 
-	k3_dsp_rproc_reset(kproc);
+	k3_rproc_reset(kproc);
 
 	return 0;
 }
@@ -561,7 +541,7 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
 				return dev_err_probe(dev, ret, "failed to get reset status\n");
 			} else if (ret == 0) {
 				dev_warn(dev, "local reset is deasserted for device\n");
-				k3_dsp_rproc_reset(kproc);
+				k3_rproc_reset(kproc);
 			}
 		}
 	}
diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
index 150c68e5f3967..5123162748953 100644
--- a/drivers/remoteproc/ti_k3_m4_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_m4_remoteproc.c
@@ -21,26 +21,6 @@
 #include "ti_sci_proc.h"
 #include "ti_k3_common.h"
 
-/* Put the M4 remote processor into reset */
-static int k3_m4_rproc_reset(struct k3_rproc *kproc)
-{
-	struct device *dev = kproc->dev;
-	int ret;
-
-	if (kproc->data->uses_lreset) {
-		ret = reset_control_assert(kproc->reset);
-		if (ret)
-			dev_err(dev, "local-reset assert failed, ret = %d\n", ret);
-	} else {
-		ret = kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
-							    kproc->ti_sci_id);
-		if (ret)
-			dev_err(dev, "module-reset assert failed, ret = %d\n", ret);
-	}
-
-	return ret;
-}
-
 static int k3_m4_rproc_ping_mbox(struct k3_rproc *kproc)
 {
 	struct device *dev = kproc->dev;
@@ -85,7 +65,7 @@ static int k3_m4_rproc_prepare(struct rproc *rproc)
 	 * Ensure the local reset is asserted so the core doesn't
 	 * execute bogus code when the module reset is released.
 	 */
-	ret = k3_m4_rproc_reset(kproc);
+	ret = k3_rproc_reset(kproc);
 	if (ret)
 		return ret;
 
@@ -393,7 +373,7 @@ static int k3_m4_rproc_stop(struct rproc *rproc)
 {
 	struct k3_rproc *kproc = rproc->priv;
 
-	return k3_m4_rproc_reset(kproc);
+	return k3_rproc_reset(kproc);
 }
 
 /*
-- 
2.34.1

