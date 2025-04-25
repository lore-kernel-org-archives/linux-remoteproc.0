Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A7F2522B4;
	Fri, 25 Apr 2025 10:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745577781; cv=none; b=D3wi1EqT+nV4WedwSYT8aZLe1Al9wYjb/liH9xnpK1qpKGWBzSr4D5lMzVuNhw/oL2+a9QN8hWHyBU+yfFs9CDLEOMg1cXvboPUCbZ+b0MuIU9tYErofHomUvAwtu6uL5orQk5yQ+xleLD0iBP1Kkm6550XDmkmBOEZOaf6wpmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745577781; c=relaxed/simple;
	bh=Zmq/fGhMC397A/P3H4UNTGfkeCU47xUEGZ9OewdjW40=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O8Um69691qWu2vnt0HJPFwKUpCFZAWi6DqG1AGst3XFvO6EQPyUN0Z/NkTpEi8JiuJdz0taMGKsRgNmJSMxunUv9M3s9lY29e0STOtv+dwmrarfxHhX386TvgW7Vqb65josiW1O+vnMe0aJw5iD3dAFGJoCc/C/dUyX9eVvvcGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=q5NMSqN8; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="q5NMSqN8"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53PAgqLZ2767973
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 05:42:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745577772;
	bh=sq/Rxc/H6xuFxGEFt3xUu79sqKlc2a1xiR9BYUnniUY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=q5NMSqN8wWp5qPal0ZoWIH7K1LQSuRtGb8/K/i9TVWar8G2QoozzfnQ081d4xMSjm
	 ndlR0TSVn3HlhdOgXt7DRPTZXPxoS0/9SV2r/Mebb6hWrFxaSsy0LVEEuDXhSbkWlo
	 +wl7x4YGyEz5Vhd9X0qMpriQDHhnzdRt15ZcNXoU=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53PAgqWH028157
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 25 Apr 2025 05:42:52 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 25
 Apr 2025 05:42:52 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 25 Apr 2025 05:42:52 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53PAfaZe038329;
	Fri, 25 Apr 2025 05:42:48 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v11 19/35] remoteproc: k3: Refactor rproc_release() implementation into common driver
Date: Fri, 25 Apr 2025 16:11:19 +0530
Message-ID: <20250425104135.830255-20-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250425104135.830255-1-b-padhi@ti.com>
References: <20250425104135.830255-1-b-padhi@ti.com>
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
---
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
index 894b4c9168f59..e4a924cb1798e 100644
--- a/drivers/remoteproc/ti_k3_common.c
+++ b/drivers/remoteproc/ti_k3_common.c
@@ -126,5 +126,30 @@ int k3_rproc_reset(struct k3_rproc *kproc)
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
index f3400fc774766..c1af39cd288c1 100644
--- a/drivers/remoteproc/ti_k3_common.h
+++ b/drivers/remoteproc/ti_k3_common.h
@@ -91,4 +91,5 @@ struct k3_rproc {
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
index 74f1b6c0a9562..aba3672facce0 100644
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

