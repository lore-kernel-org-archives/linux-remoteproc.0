Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384821FA8CA;
	Fri,  3 Jan 2025 10:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735899219; cv=none; b=AxSu8Dv6tytNN/iXRc7ZJN6xWIgrUOyjVoqAcT+c+5lb+EOA9Xfx2kMTQlvRgXUYt3KapFli2BU/+zKgSqSgr0iJwcd493Kn+SLTcnDNVUTtz1HJjHFuWjs7lWYZNjDl/tSTTQOQMfQrI4fdiG6tnQtiRtAcsCxBvOL6zFTErIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735899219; c=relaxed/simple;
	bh=WxYHpwnj589i3r7ggcViWjJur51iO7WpbyOqo4RDzxw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LkR/Uu/25OwHH4gofxEjGRbaK8gzz9fl5WsDwjRoACfb1efrlgPfWMDci6fYoWKKmZZPnDTq9crZ+Lvl6MbQjmDNlQR1zwWStcCi1CzVkRPh0zTGl4m/4IjxCLs1EIbAT/fj402AgLc2ijmFQF0kvwFO2DEU6/j97sx1r6e9PoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=BAqvvZFB; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="BAqvvZFB"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 503ADSkm2076649
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 3 Jan 2025 04:13:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1735899208;
	bh=cMXq3nzKtZoHJpAJ/F6gjJpkrH4JmCG/sD2OvNtujqw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=BAqvvZFB3fkG+VxX8dzNOaaFtU9QD/UkZcJNMGg9WkryK5exuW3eK6koFCpClM1LS
	 q6YntZrO0xUxzxOEeAmAhDjv7k1pYJ0YriHKlw/5BIBYJwLXAGh/DPDH8VLJ828Pst
	 poGBLJglo4x50TnzKBOlvYz3QxezwxYLxQP/rdkQ=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 503ADSTW126191
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 3 Jan 2025 04:13:28 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 3
 Jan 2025 04:13:27 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 3 Jan 2025 04:13:27 -0600
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 503ACVSW126047;
	Fri, 3 Jan 2025 04:13:24 -0600
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>,
        <p.zabel@pengutronix.de>, <jan.kiszka@siemens.com>,
        <christophe.jaillet@wanadoo.fr>, <jkangas@redhat.com>,
        <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v8 14/20] remoteproc: k3: Refactor .detach rproc ops into common driver
Date: Fri, 3 Jan 2025 15:42:25 +0530
Message-ID: <20250103101231.1508151-15-b-padhi@ti.com>
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

The .detach rproc ops implementations in ti_k3_dsp_remoteproc.c and
ti_k3_m4_remoteproc.c drivers clears the "is_attach_ongoing" flag which
was set in .attach ops. Refactor the implementations into ti_k3_common.c
driver as k3_rproc_detach() and align DSP and M4 drivers to register
this common function as .detach ops.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
 drivers/remoteproc/ti_k3_common.c         | 19 +++++++++++++++++++
 drivers/remoteproc/ti_k3_common.h         |  1 +
 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 20 +-------------------
 drivers/remoteproc/ti_k3_m4_remoteproc.c  | 20 +-------------------
 4 files changed, 22 insertions(+), 38 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
index 296a47de9d72..b5ef2ac0d399 100644
--- a/drivers/remoteproc/ti_k3_common.c
+++ b/drivers/remoteproc/ti_k3_common.c
@@ -330,5 +330,24 @@ int k3_rproc_attach(struct rproc *rproc)
 }
 EXPORT_SYMBOL_GPL(k3_rproc_attach);
 
+/*
+ * Detach from a running remote processor (IPC-only mode)
+ *
+ * This rproc detach callback performs the opposite operation to attach callback
+ * and only needs to clear the "is_attach_ongoing" flag to ensure no mailbox
+ * messages are sent to or received from a detached core. The remote core is not
+ * stopped and will be left to continue to run its booted firmware. This callback
+ * is invoked only in IPC-only mode.
+ */
+int k3_rproc_detach(struct rproc *rproc)
+{
+	struct k3_rproc *kproc = rproc->priv;
+
+	kproc->is_attach_ongoing = false;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(k3_rproc_detach);
+
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("TI K3 common Remoteproc code");
diff --git a/drivers/remoteproc/ti_k3_common.h b/drivers/remoteproc/ti_k3_common.h
index 89175cb5a006..c7be85b0e5ac 100644
--- a/drivers/remoteproc/ti_k3_common.h
+++ b/drivers/remoteproc/ti_k3_common.h
@@ -98,4 +98,5 @@ int k3_rproc_unprepare(struct rproc *rproc);
 int k3_rproc_start(struct rproc *rproc);
 int k3_rproc_stop(struct rproc *rproc);
 int k3_rproc_attach(struct rproc *rproc);
+int k3_rproc_detach(struct rproc *rproc);
 #endif /* REMOTEPROC_TI_K3_COMMON_H */
diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
index 43c1eda47be2..dd81bcc8e1e4 100644
--- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
@@ -58,24 +58,6 @@ static int k3_dsp_rproc_start(struct rproc *rproc)
 	return 0;
 }
 
-/*
- * Detach from a running DSP remote processor (IPC-only mode)
- *
- * This rproc detach callback performs the opposite operation to attach callback
- * and only needs to clear the "is_attach_ongoing" flag to ensure no mailbox
- * messages are sent to or received from a detached core. The DSP core is not
- * stopped and will be left to continue to run its booted firmware. This callback
- * is invoked only in IPC-only mode.
- */
-static int k3_dsp_rproc_detach(struct rproc *rproc)
-{
-	struct k3_rproc *kproc = rproc->priv;
-
-	kproc->is_attach_ongoing = false;
-
-	return 0;
-}
-
 /*
  * This function implements the .get_loaded_rsc_table() callback and is used
  * to provide the resource table for a booted DSP in IPC-only mode. The K3 DSP
@@ -171,6 +153,7 @@ static const struct rproc_ops k3_dsp_rproc_ops = {
 	.start		= k3_dsp_rproc_start,
 	.stop		= k3_rproc_stop,
 	.attach		= k3_rproc_attach,
+	.detach		= k3_rproc_detach,
 	.kick		= k3_rproc_kick,
 	.da_to_va	= k3_dsp_rproc_da_to_va,
 };
@@ -396,7 +379,6 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
 		dev_info(dev, "configured DSP for IPC-only mode\n");
 		rproc->state = RPROC_DETACHED;
 		/* override rproc ops with only required IPC-only mode ops */
-		rproc->ops->detach = k3_dsp_rproc_detach;
 		rproc->ops->get_loaded_rsc_table = k3_dsp_get_loaded_rsc_table;
 	} else {
 		dev_info(dev, "configured DSP for remoteproc mode\n");
diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
index e78e35c1375c..6b532bda8d1d 100644
--- a/drivers/remoteproc/ti_k3_m4_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_m4_remoteproc.c
@@ -244,31 +244,13 @@ static void k3_m4_release_tsp(void *data)
 	ti_sci_proc_release(tsp);
 }
 
-/*
- * Detach from a running M4 remote processor (IPC-only mode)
- *
- * This rproc detach callback performs the opposite operation to attach callback
- * and only needs to clear the "is_attach_ongoing" flag to ensure no mailbox
- * messages are sent to or received from a detached core. The M4 core is not
- * stopped and will be left to continue to run its booted firmware. This
- * callback is invoked only in IPC-only mode.
- */
-static int k3_m4_rproc_detach(struct rproc *rproc)
-{
-	struct k3_rproc *kproc = rproc->priv;
-
-	kproc->is_attach_ongoing = false;
-
-	return 0;
-}
-
 static const struct rproc_ops k3_m4_rproc_ops = {
 	.prepare = k3_rproc_prepare,
 	.unprepare = k3_rproc_unprepare,
 	.start = k3_rproc_start,
 	.stop = k3_rproc_stop,
 	.attach = k3_rproc_attach,
-	.detach = k3_m4_rproc_detach,
+	.detach = k3_rproc_detach,
 	.kick = k3_rproc_kick,
 	.da_to_va = k3_m4_rproc_da_to_va,
 	.get_loaded_rsc_table = k3_m4_get_loaded_rsc_table,
-- 
2.34.1

