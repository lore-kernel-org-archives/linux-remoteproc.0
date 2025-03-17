Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA4C23BD02;
	Mon, 17 Mar 2025 12:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742213272; cv=none; b=EL70i6a3/giLMZEKwndz3S7wqrCSs7+anPTafkJFysVdwvBZ7uglYYCojwJsamYXmBLDZ3uj2nse+BDbOebutAMfVIuNnwFigHJ3r0xKZ+8fw2U31px2X1jOmdk09DahLttl0gynKt4zdmxcWbVEviAkjTnjInZO+5Vzu01vqAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742213272; c=relaxed/simple;
	bh=l9Ndok2AQJEgSzbnoTNC6wGc3mMyHnPL5DkSyEPO74M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NwlKzsXGqKwlX3GGQTzCHXHOsKbvhk7+A3vHGAwmguHWfJX3Bep6hxjaWVxUFe/x+mdY8ADXeozeNgOI7GRgWYgVYtLsE6OwF8CCmeNvdfz64dR7vTIj7997e0/SM3mA6t5SsHyw/6NUsSXXuHHLiPBo4prMecqvDn2f+VLJWa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=c6vQUetX; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="c6vQUetX"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52HC7d9p2266969
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Mar 2025 07:07:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742213259;
	bh=aWjv01r1zcFzNOjSzFjjXP3YPhZ89BccdUX/AsEVbBM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=c6vQUetXcW9gho/TVAPVNB3NxgWpn8KF18U+MU9jK5FcLXh1k5HXbh+c/LRuV3zCf
	 /KPbM2MyITGarA58JcJ6/CZfcjy+EYNAs/7l4ANIllHQgKygZcPcbR2yczaysiDjSV
	 JN/qLf34jx+rJaj+Ct1hnpvvI4l4MlrpP/R2CkA8=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52HC7dIc000703
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 17 Mar 2025 07:07:39 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 17
 Mar 2025 07:07:39 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 17 Mar 2025 07:07:39 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52HC6MKF060901;
	Mon, 17 Mar 2025 07:07:35 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v9 18/26] remoteproc: k3: Refactor .stop rproc ops into common driver
Date: Mon, 17 Mar 2025 17:36:14 +0530
Message-ID: <20250317120622.1746415-19-b-padhi@ti.com>
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

The .stop rproc ops implementations in ti_k3_dsp_remoteproc.c and
ti_k3_m4_remoteproc.c drivers put the remote processor into reset.
Refactor the implementations into ti_k3_common.c driver as
k3_rproc_stop() and align DSP and M4 drivers to register this common
function as .stop ops.

Further, do not override the .stop ops with NULL when operating in
IPC-only mode in ti_k3_dsp_remoteproc.c, as .stop is never invoked in
rproc_detach routine.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
 drivers/remoteproc/ti_k3_common.c         | 14 ++++++++++++++
 drivers/remoteproc/ti_k3_common.h         |  1 +
 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 18 +-----------------
 drivers/remoteproc/ti_k3_m4_remoteproc.c  | 15 +--------------
 4 files changed, 17 insertions(+), 31 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
index e2c7da357ab5..93d793e0899f 100644
--- a/drivers/remoteproc/ti_k3_common.c
+++ b/drivers/remoteproc/ti_k3_common.c
@@ -283,5 +283,19 @@ int k3_rproc_start(struct rproc *rproc)
 }
 EXPORT_SYMBOL_GPL(k3_rproc_start);
 
+/*
+ * Stop the remote processor.
+ *
+ * This function puts the remote processor into reset, and finishes processing
+ * of any pending messages. This callback is invoked only in remoteproc mode.
+ */
+int k3_rproc_stop(struct rproc *rproc)
+{
+	struct k3_rproc *kproc = rproc->priv;
+
+	return k3_rproc_reset(kproc);
+}
+EXPORT_SYMBOL_GPL(k3_rproc_stop);
+
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("TI K3 common Remoteproc code");
diff --git a/drivers/remoteproc/ti_k3_common.h b/drivers/remoteproc/ti_k3_common.h
index 51a92a306479..0162757f024c 100644
--- a/drivers/remoteproc/ti_k3_common.h
+++ b/drivers/remoteproc/ti_k3_common.h
@@ -96,4 +96,5 @@ int k3_rproc_request_mbox(struct rproc *rproc);
 int k3_rproc_prepare(struct rproc *rproc);
 int k3_rproc_unprepare(struct rproc *rproc);
 int k3_rproc_start(struct rproc *rproc);
+int k3_rproc_stop(struct rproc *rproc);
 #endif /* REMOTEPROC_TI_K3_COMMON_H */
diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
index fb3ba5a1e07c..c5fe2b097a6f 100644
--- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
@@ -58,21 +58,6 @@ static int k3_dsp_rproc_start(struct rproc *rproc)
 	return 0;
 }
 
-/*
- * Stop the DSP remote processor.
- *
- * This function puts the DSP processor into reset, and finishes processing
- * of any pending messages. This callback is invoked only in remoteproc mode.
- */
-static int k3_dsp_rproc_stop(struct rproc *rproc)
-{
-	struct k3_rproc *kproc = rproc->priv;
-
-	k3_rproc_reset(kproc);
-
-	return 0;
-}
-
 /*
  * Attach to a running DSP remote processor (IPC-only mode)
  *
@@ -186,7 +171,7 @@ static void *k3_dsp_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool
 
 static const struct rproc_ops k3_dsp_rproc_ops = {
 	.start		= k3_dsp_rproc_start,
-	.stop		= k3_dsp_rproc_stop,
+	.stop		= k3_rproc_stop,
 	.kick		= k3_rproc_kick,
 	.da_to_va	= k3_dsp_rproc_da_to_va,
 };
@@ -412,7 +397,6 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
 		dev_info(dev, "configured DSP for IPC-only mode\n");
 		rproc->state = RPROC_DETACHED;
 		/* override rproc ops with only required IPC-only mode ops */
-		rproc->ops->stop = NULL;
 		rproc->ops->attach = k3_dsp_rproc_attach;
 		rproc->ops->detach = k3_dsp_rproc_detach;
 		rproc->ops->get_loaded_rsc_table = k3_dsp_get_loaded_rsc_table;
diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
index 69066cb91740..8830b1d84675 100644
--- a/drivers/remoteproc/ti_k3_m4_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_m4_remoteproc.c
@@ -244,19 +244,6 @@ static void k3_m4_release_tsp(void *data)
 	ti_sci_proc_release(tsp);
 }
 
-/*
- * Stop the M4 remote processor.
- *
- * This function puts the M4 processor into reset, and finishes processing
- * of any pending messages. This callback is invoked only in remoteproc mode.
- */
-static int k3_m4_rproc_stop(struct rproc *rproc)
-{
-	struct k3_rproc *kproc = rproc->priv;
-
-	return k3_rproc_reset(kproc);
-}
-
 /*
  * Attach to a running M4 remote processor (IPC-only mode)
  *
@@ -285,7 +272,7 @@ static const struct rproc_ops k3_m4_rproc_ops = {
 	.prepare = k3_rproc_prepare,
 	.unprepare = k3_rproc_unprepare,
 	.start = k3_rproc_start,
-	.stop = k3_m4_rproc_stop,
+	.stop = k3_rproc_stop,
 	.attach = k3_m4_rproc_attach,
 	.detach = k3_m4_rproc_detach,
 	.kick = k3_rproc_kick,
-- 
2.34.1

