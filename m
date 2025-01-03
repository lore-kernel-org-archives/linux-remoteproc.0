Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45C11F9F75;
	Fri,  3 Jan 2025 10:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735899194; cv=none; b=gpCg53txTL3QhQ/bUCaDsmjEC2BOuWrN6tMnR+CWnsLTSZTgKUtEZmFQ4T7pxBuIK4oc3a5DHVcH4L9qtUQRJsUteY/t88Dx0L0NapXYYVz3Tc++N/zZenfUkbYZkT8gFWsWqfwoqFgJop8V+FBSt/1Y9ShItKwfMu53YaNuens=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735899194; c=relaxed/simple;
	bh=r2wIasGEClrDJxcFyrPt6OS2ds0xiD7/1YtYeEinklw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IX5iYJz/3o91FhgVljtONip5a8GhFkDP38aNYSiK2LYTTJeOt1V+f3r/HEjXaozgvIkP1tIgEWoRS3ZYUDIYeJ6cJgwuldz7Wfm3VIh+9WrYQT39o5UmhVqyJxOkn7APEaxZRzffGqYVFpxxbNNULWtSUS2YoyZjTUx7O14/iJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=fRyVG3J2; arc=none smtp.client-ip=198.47.19.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="fRyVG3J2"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 503AD2s0033585;
	Fri, 3 Jan 2025 04:13:02 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1735899182;
	bh=3OaDFkprKgvZiVPCfSGh/Lb6TcLawnwA3Tz8FOz6CK4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=fRyVG3J2fB71PQUcYAyXzWu84wL8GJ7VrpyPrrHsBXiY9/jYgwsDlOc0E3B4f9+Wk
	 e8mlmx5we9nra6kwtGQ1UewxzmToSofvxxF4r3qIKvSRK4z5T3+nLm25ICbsyGKFkt
	 /FtrgSgq0kRi+uO4bo9FO8/LuW9i9ep8zoOcZcGY=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 503AD2Rx125968
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 3 Jan 2025 04:13:02 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 3
 Jan 2025 04:13:01 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 3 Jan 2025 04:13:01 -0600
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 503ACVSP126047;
	Fri, 3 Jan 2025 04:12:58 -0600
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>,
        <p.zabel@pengutronix.de>, <jan.kiszka@siemens.com>,
        <christophe.jaillet@wanadoo.fr>, <jkangas@redhat.com>,
        <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v8 07/20] remoteproc: k3: Refactor rproc_release() implementation into common driver
Date: Fri, 3 Jan 2025 15:42:18 +0530
Message-ID: <20250103101231.1508151-8-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250103101231.1508151-1-b-padhi@ti.com>
References: <20250103101231.1508151-1-b-padhi@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

The k3_dsp_rproc_release() function erroneously deasserts the local
reset even for devices which do not support it. Even though it results
in a no-operation, Update the logic to explicitly deassert the local
reset for devices that support it and only the global reset for those
that do not.

Further, refactor the above function into the ti_k3_common.c driver as
k3_rproc_release() and use it throughout DSP and M4 drivers for
releasing the reset from the remote processor.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
 drivers/remoteproc/ti_k3_common.c         | 27 ++++++++++++++++++++
 drivers/remoteproc/ti_k3_common.h         |  1 +
 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 30 +----------------------
 drivers/remoteproc/ti_k3_m4_remoteproc.c  |  8 +++---
 4 files changed, 32 insertions(+), 34 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
index 8f4cc52c1332..cec664819a1d 100644
--- a/drivers/remoteproc/ti_k3_common.c
+++ b/drivers/remoteproc/ti_k3_common.c
@@ -142,5 +142,32 @@ int k3_rproc_reset(struct k3_rproc *kproc)
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
+
+		return ret;
+	}
+
+	ret = kproc->ti_sci->ops.dev_ops.get_device(kproc->ti_sci,
+						    kproc->ti_sci_id);
+	if (ret)
+		dev_err(dev, "module-reset deassert failed (%pe)\n", ERR_PTR(ret));
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(k3_rproc_release);
+
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("TI K3 common Remoteproc code");
diff --git a/drivers/remoteproc/ti_k3_common.h b/drivers/remoteproc/ti_k3_common.h
index 52f784ada496..37516765e505 100644
--- a/drivers/remoteproc/ti_k3_common.h
+++ b/drivers/remoteproc/ti_k3_common.h
@@ -91,4 +91,5 @@ struct k3_rproc {
 void k3_rproc_mbox_callback(struct mbox_client *client, void *data);
 void k3_rproc_kick(struct rproc *rproc, int vqid);
 int k3_rproc_reset(struct k3_rproc *kproc);
+int k3_rproc_release(struct k3_rproc *kproc);
 #endif /* REMOTEPROC_TI_K3_COMMON_H */
diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
index 045b1e81d06c..64affbe0ba29 100644
--- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
@@ -24,34 +24,6 @@
 
 #define KEYSTONE_RPROC_LOCAL_ADDRESS_MASK	(SZ_16M - 1)
 
-/* Release the DSP processor from reset */
-static int k3_dsp_rproc_release(struct k3_rproc *kproc)
-{
-	struct device *dev = kproc->dev;
-	int ret;
-
-	if (kproc->data->uses_lreset)
-		goto lreset;
-
-	ret = kproc->ti_sci->ops.dev_ops.get_device(kproc->ti_sci,
-						    kproc->ti_sci_id);
-	if (ret) {
-		dev_err(dev, "module-reset deassert failed (%pe)\n", ERR_PTR(ret));
-		return ret;
-	}
-
-lreset:
-	ret = reset_control_deassert(kproc->reset);
-	if (ret) {
-		dev_err(dev, "local-reset deassert failed, (%pe)\n", ERR_PTR(ret));
-		if (kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
-							  kproc->ti_sci_id))
-			dev_warn(dev, "module-reset assert back failed\n");
-	}
-
-	return ret;
-}
-
 static int k3_dsp_rproc_request_mbox(struct rproc *rproc)
 {
 	struct k3_rproc *kproc = rproc->priv;
@@ -160,7 +132,7 @@ static int k3_dsp_rproc_start(struct rproc *rproc)
 	if (ret)
 		return ret;
 
-	ret = k3_dsp_rproc_release(kproc);
+	ret = k3_rproc_release(kproc);
 	if (ret)
 		return ret;
 
diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
index d31cf9babf1d..c24085411e1c 100644
--- a/drivers/remoteproc/ti_k3_m4_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_m4_remoteproc.c
@@ -354,13 +354,11 @@ static int k3_m4_rproc_start(struct rproc *rproc)
 	if (ret)
 		return ret;
 
-	ret = reset_control_deassert(kproc->reset);
-	if (ret) {
+	ret = k3_rproc_release(kproc);
+	if (ret)
 		dev_err(dev, "local-reset deassert failed, ret = %d\n", ret);
-		return ret;
-	}
 
-	return 0;
+	return ret;
 }
 
 /*
-- 
2.34.1

