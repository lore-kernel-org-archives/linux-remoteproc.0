Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9436225F998;
	Thu, 17 Apr 2025 18:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744914073; cv=none; b=ha7tid4dYiUyB1ZdhOHqJQk01L7kDDn5Nom1NUuqvrlVWgo9AowjQUQByqvFU8aKv09EVCnPTDY4xXmXy3aBZv8zYskG2XOm4WmqSLu2Ob1xCYNaTvv+AIotUaWTai3LK6qbM8snydKBUVPugy6LcTXH7PVV5qMeBoWMd1K0rEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744914073; c=relaxed/simple;
	bh=Iutj1irQQ9DOwIzreYkPwA0/FRrCjwRMA2FVB4+Yc1o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WFAHhItzR5/sap8ZKZrbyy65DZmR4Xt/me+byjJzmefIsiDZKKKk3ufGhVhct06GaTuX8vGuQO0J76tkhXQVqGZXWmISHwISOjAZ+7RmbVHFRjY24x+ytveKbk6yxYWTZ1fmoqa5Ikmz2RUCO2x1c+2nN8EAKHqE1dskW7VRrY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=eQBcrdyM; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="eQBcrdyM"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53HIL2rH776033
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Apr 2025 13:21:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744914062;
	bh=+9pF9EUrceCupNFsB3+lBss80wlaXFpgIG7nDWfD6/M=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=eQBcrdyMEcBdqQg3cCW0/ad6WhnQ/q2XEJoBnEgokRoD4S6kslsJ/zGCt9yEeVr70
	 xleK0wNhWjk+D+N9QjzQbrO2Sz0ZfaqsQLwELbf5676rALmUNTqk1QhEaUGQNSEnee
	 oD3Czkqfeid8uCd8CwOhuoPzTf1wZgRInLRADNLI=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53HIL21Z028051
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 17 Apr 2025 13:21:02 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 17
 Apr 2025 13:21:02 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 17 Apr 2025 13:21:01 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53HIK1Hx071102;
	Thu, 17 Apr 2025 13:20:58 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v10 15/33] remoteproc: k3: Refactor rproc_reset() implementation into common driver
Date: Thu, 17 Apr 2025 23:49:43 +0530
Message-ID: <20250417182001.3903905-16-b-padhi@ti.com>
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

The rproc_reset() implementations in TI K3 DSP and M4 remoteproc drivers
assert reset in the same way. Refactor the above function into the
ti_k3_common.c driver as k3_rproc_reset() and use it throughout DSP and
M4 drivers for resetting the remote processor.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
v10: Changelog:
1. Split [v9 12/26] into [v10 14/33] and [v10 15/33] patches. 

Link to v9:
https://lore.kernel.org/all/20250317120622.1746415-13-b-padhi@ti.com/

 drivers/remoteproc/ti_k3_common.c         | 25 ++++++++++++++++++++
 drivers/remoteproc/ti_k3_common.h         |  1 +
 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 28 ++---------------------
 drivers/remoteproc/ti_k3_m4_remoteproc.c  | 16 +++----------
 4 files changed, 31 insertions(+), 39 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
index aace308b49b0e..19bb6c337af77 100644
--- a/drivers/remoteproc/ti_k3_common.c
+++ b/drivers/remoteproc/ti_k3_common.c
@@ -105,5 +105,30 @@ void k3_rproc_kick(struct rproc *rproc, int vqid)
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
+		return ret;
+	}
+
+	ret = kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
+						    kproc->ti_sci_id);
+	if (ret) {
+		dev_err(dev, "module-reset assert failed (%pe)\n", ERR_PTR(ret));
+		if (reset_control_deassert(kproc->reset))
+			dev_warn(dev, "local-reset deassert back failed\n");
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(k3_rproc_reset);
+
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("TI K3 common Remoteproc code");
diff --git a/drivers/remoteproc/ti_k3_common.h b/drivers/remoteproc/ti_k3_common.h
index 6ae7ac4ec5696..f3400fc774766 100644
--- a/drivers/remoteproc/ti_k3_common.h
+++ b/drivers/remoteproc/ti_k3_common.h
@@ -90,4 +90,5 @@ struct k3_rproc {
 
 void k3_rproc_mbox_callback(struct mbox_client *client, void *data);
 void k3_rproc_kick(struct rproc *rproc, int vqid);
+int k3_rproc_reset(struct k3_rproc *kproc);
 #endif /* REMOTEPROC_TI_K3_COMMON_H */
diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
index 0a8c9e61393d2..f8a5282df5b71 100644
--- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
@@ -24,30 +24,6 @@
 
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
-		return ret;
-	}
-
-	ret = kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
-						    kproc->ti_sci_id);
-	if (ret) {
-		dev_err(dev, "module-reset assert failed (%pe)\n", ERR_PTR(ret));
-		if (reset_control_deassert(kproc->reset))
-			dev_warn(dev, "local-reset deassert back failed\n");
-	}
-
-	return ret;
-}
-
 /* Release the DSP processor from reset */
 static int k3_dsp_rproc_release(struct k3_rproc *kproc)
 {
@@ -201,7 +177,7 @@ static int k3_dsp_rproc_stop(struct rproc *rproc)
 {
 	struct k3_rproc *kproc = rproc->priv;
 
-	k3_dsp_rproc_reset(kproc);
+	k3_rproc_reset(kproc);
 
 	return 0;
 }
@@ -565,7 +541,7 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
 				return dev_err_probe(dev, ret, "failed to get reset status\n");
 			} else if (ret == 0) {
 				dev_warn(dev, "local reset is deasserted for device\n");
-				k3_dsp_rproc_reset(kproc);
+				k3_rproc_reset(kproc);
 			}
 		}
 	}
diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
index 8a6917259ce60..7d5b75be2e4f8 100644
--- a/drivers/remoteproc/ti_k3_m4_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_m4_remoteproc.c
@@ -65,11 +65,9 @@ static int k3_m4_rproc_prepare(struct rproc *rproc)
 	 * Ensure the local reset is asserted so the core doesn't
 	 * execute bogus code when the module reset is released.
 	 */
-	ret = reset_control_assert(kproc->reset);
-	if (ret) {
-		dev_err(dev, "could not assert local reset\n");
+	ret = k3_rproc_reset(kproc);
+	if (ret)
 		return ret;
-	}
 
 	ret = reset_control_status(kproc->reset);
 	if (ret <= 0) {
@@ -374,16 +372,8 @@ static int k3_m4_rproc_start(struct rproc *rproc)
 static int k3_m4_rproc_stop(struct rproc *rproc)
 {
 	struct k3_rproc *kproc = rproc->priv;
-	struct device *dev = kproc->dev;
-	int ret;
 
-	ret = reset_control_assert(kproc->reset);
-	if (ret) {
-		dev_err(dev, "local-reset assert failed, ret = %d\n", ret);
-		return ret;
-	}
-
-	return 0;
+	return k3_rproc_reset(kproc);
 }
 
 /*
-- 
2.34.1

