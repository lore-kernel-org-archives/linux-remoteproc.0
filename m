Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1710C264A78;
	Thu, 17 Apr 2025 18:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744914108; cv=none; b=kuXXcAXOVUIcZl+o0XeU8I4vudZMd58BFQF5U0ArdKN8arA/4IMqwAsVR3Ar/yX/BiXDEJOQyCAnoZvf3lSoE4cWfciUKbgVvcixIxsJEdLZao+sQhWSWsfk7Rv2HTvEnaT0eLc/PMYpXhaNdIG4D7jDI653GN3ujKAaS1c5lnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744914108; c=relaxed/simple;
	bh=2qPyFpIlZx03Mz030g7imRbNyJGwvsupK1FDdMvg1Rs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GJZVN4FUJjHzIcmB3AYFY/O2XEYznrApRffW8+PrgQ6z5wUvFHMfpk+DqxSCiW6Ze4usn5XVDfYViTbLgXeinumdpEjh6XRFieg0RSDxy2wjaZPjCaH9F6s9n+nqNe1M80SQdbPTT4E/EiWWBOtuaXRRPLgPK3qiWkqmaGSe+Qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=fB/gVfOG; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="fB/gVfOG"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53HILdTL720160
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Apr 2025 13:21:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744914099;
	bh=zfY2qd6Zn8DUY3kj8uZxWxSmA2EwK/yJNF5TWLvZmj8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=fB/gVfOGdlwXZaZ213Qe8RLxFrRllUirRKhuvz84o8+l96E9f24HCwEIGdhoXf4nc
	 /ZwBALkuDCt6FExGN7t0okEVoGcTr43LjmnP6gBRyI7+78Iu6UbET1+UDUm7e3MF85
	 OkDelynHfGwatgHPx+Ok6sVuuRA1ftED6jfwB6zQ=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53HILdUh028459
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 17 Apr 2025 13:21:39 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 17
 Apr 2025 13:21:39 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 17 Apr 2025 13:21:39 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53HIK1I9071102;
	Thu, 17 Apr 2025 13:21:36 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v10 25/33] remoteproc: k3: Refactor .stop rproc ops into common driver
Date: Thu, 17 Apr 2025 23:49:53 +0530
Message-ID: <20250417182001.3903905-26-b-padhi@ti.com>
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

The .stop rproc ops implementations in TI K3 DSP and M4 remoteproc
drivers put the remote processor into reset. Refactor the
implementations into ti_k3_common.c driver as k3_rproc_stop() and
register this common function as .stop ops in DSP and M4 drivers.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
v10: Changelog:
1. Don't remove dsp func override. Already done by [v10 20/33] patch.

Link to v9:
https://lore.kernel.org/all/20250317120622.1746415-19-b-padhi@ti.com/

 drivers/remoteproc/ti_k3_common.c         | 14 ++++++++++++++
 drivers/remoteproc/ti_k3_common.h         |  1 +
 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 17 +----------------
 drivers/remoteproc/ti_k3_m4_remoteproc.c  | 15 +--------------
 4 files changed, 17 insertions(+), 30 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
index 4261c3b7ba827..2f607f63e512b 100644
--- a/drivers/remoteproc/ti_k3_common.c
+++ b/drivers/remoteproc/ti_k3_common.c
@@ -284,5 +284,19 @@ int k3_rproc_start(struct rproc *rproc)
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
index 51a92a3064793..0162757f024c9 100644
--- a/drivers/remoteproc/ti_k3_common.h
+++ b/drivers/remoteproc/ti_k3_common.h
@@ -96,4 +96,5 @@ int k3_rproc_request_mbox(struct rproc *rproc);
 int k3_rproc_prepare(struct rproc *rproc);
 int k3_rproc_unprepare(struct rproc *rproc);
 int k3_rproc_start(struct rproc *rproc);
+int k3_rproc_stop(struct rproc *rproc);
 #endif /* REMOTEPROC_TI_K3_COMMON_H */
diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
index 67d46c4a1ba61..f506a9360879a 100644
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
 	.start			= k3_dsp_rproc_start,
-	.stop			= k3_dsp_rproc_stop,
+	.stop			= k3_rproc_stop,
 	.attach			= k3_dsp_rproc_attach,
 	.detach			= k3_dsp_rproc_detach,
 	.kick			= k3_rproc_kick,
diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
index 70f186eedc6c7..66c4aee332534 100644
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

