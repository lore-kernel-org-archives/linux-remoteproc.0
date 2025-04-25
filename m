Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A288D2571DF;
	Fri, 25 Apr 2025 10:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745577809; cv=none; b=LDCePgWG4/3b5vqJcD+LegBENi/NOy1jUPpdmberPMKpHqtzgJSPx74kPDFAMdmofnNunEwrcpPTf61/14GGNlmbAdzWhaWMdUtEVrvYdPu5bPmDSTuOs/HC6kjXwLPLKlWdA+bybedRqOwKXtCixI7TWSxkIqfkOAjPAKHBwGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745577809; c=relaxed/simple;
	bh=1uYjF4zdyoPCPSUfHh/jzsQEtwSXvyW/u4QdRMpnGvA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qOvo1McpNWV5hjv0mkZ8BI6e74tCxKfbAxadBZj/8MfbWRP7fgYCqdlMAi9RobEoGfSm87yaTlOEqNx1bGubnJjZ3H0SdXfuu5gsjhWvlxrdYjgKa9dWLPJ1vbTa/2tA20Ym5x8BUHNWDBA8hYrh+6d8xr6tJ+xBYL/sZQFfhXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=fS0F9lup; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="fS0F9lup"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53PAhJw02152270
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 05:43:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745577799;
	bh=NVIsFxtp/GNDGVnyuwmMKD28JptWROfBrrLVC0NmtTw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=fS0F9lupzH3om7ZBkjU77uJhaGfyo9i/eveBdgLoHjXnbK7zCxVUBQBpkTCFCncjT
	 rZR0v/cjL0n/3/Y3G8CnkSuIq30six13dNMf0hJttTHs1/pZct59RGSzoLarxidmFq
	 RPmGObTG9mRzCMk75pyCDJNeTZwd2Tq8f1gH/KVM=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53PAhJXE089194
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 25 Apr 2025 05:43:19 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 25
 Apr 2025 05:43:18 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 25 Apr 2025 05:43:19 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53PAfaZl038329;
	Fri, 25 Apr 2025 05:43:15 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v11 26/35] remoteproc: k3: Refactor .start rproc ops into common driver
Date: Fri, 25 Apr 2025 16:11:26 +0530
Message-ID: <20250425104135.830255-27-b-padhi@ti.com>
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

The k3_dsp_rproc_start() function sets the boot vector and releases the
reset on the remote processor. Whereas, the k3_m4_rproc_start() function
only needs to release the reset.

Refactor the k3_m4_rproc_start() into ti_k3_common.c as k3_rproc_start()
and align the DSP and M4 drivers to invoke this common function when
releasing the reset on the remote processor.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
Tested-by: Judith Mendez <jm@ti.com>
---
v11: Changelog:
1. Carried T/B tag.

Link to v10:
https://lore.kernel.org/all/20250417182001.3903905-25-b-padhi@ti.com/

v10: Changelog:
1. Don't remove dsp func override. Already done by [v10 20/33] patch.

Link to v9:
https://lore.kernel.org/all/20250317120622.1746415-18-b-padhi@ti.com/

 drivers/remoteproc/ti_k3_common.c         | 15 +++++++++++++++
 drivers/remoteproc/ti_k3_common.h         |  1 +
 drivers/remoteproc/ti_k3_dsp_remoteproc.c |  3 ++-
 drivers/remoteproc/ti_k3_m4_remoteproc.c  | 16 +---------------
 4 files changed, 19 insertions(+), 16 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
index b5f66be2e5cc8..5e0d1298d05b1 100644
--- a/drivers/remoteproc/ti_k3_common.c
+++ b/drivers/remoteproc/ti_k3_common.c
@@ -263,5 +263,20 @@ int k3_rproc_unprepare(struct rproc *rproc)
 }
 EXPORT_SYMBOL_GPL(k3_rproc_unprepare);
 
+/*
+ * Power up the remote processor.
+ *
+ * This function will be invoked only after the firmware for this rproc
+ * was loaded, parsed successfully, and all of its resource requirements
+ * were met. This callback is invoked only in remoteproc mode.
+ */
+int k3_rproc_start(struct rproc *rproc)
+{
+	struct k3_rproc *kproc = rproc->priv;
+
+	return k3_rproc_release(kproc);
+}
+EXPORT_SYMBOL_GPL(k3_rproc_start);
+
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("TI K3 common Remoteproc code");
diff --git a/drivers/remoteproc/ti_k3_common.h b/drivers/remoteproc/ti_k3_common.h
index c1b07187c124c..51a92a3064793 100644
--- a/drivers/remoteproc/ti_k3_common.h
+++ b/drivers/remoteproc/ti_k3_common.h
@@ -95,4 +95,5 @@ int k3_rproc_release(struct k3_rproc *kproc);
 int k3_rproc_request_mbox(struct rproc *rproc);
 int k3_rproc_prepare(struct rproc *rproc);
 int k3_rproc_unprepare(struct rproc *rproc);
+int k3_rproc_start(struct rproc *rproc);
 #endif /* REMOTEPROC_TI_K3_COMMON_H */
diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
index 5099d21ce066f..67d46c4a1ba61 100644
--- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
@@ -50,7 +50,8 @@ static int k3_dsp_rproc_start(struct rproc *rproc)
 	if (ret)
 		return ret;
 
-	ret = k3_rproc_release(kproc);
+	/* Call the K3 common start function after doing DSP specific stuff */
+	ret = k3_rproc_start(rproc);
 	if (ret)
 		return ret;
 
diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
index 7167d311e0876..69066cb917406 100644
--- a/drivers/remoteproc/ti_k3_m4_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_m4_remoteproc.c
@@ -244,20 +244,6 @@ static void k3_m4_release_tsp(void *data)
 	ti_sci_proc_release(tsp);
 }
 
-/*
- * Power up the M4 remote processor.
- *
- * This function will be invoked only after the firmware for this rproc
- * was loaded, parsed successfully, and all of its resource requirements
- * were met. This callback is invoked only in remoteproc mode.
- */
-static int k3_m4_rproc_start(struct rproc *rproc)
-{
-	struct k3_rproc *kproc = rproc->priv;
-
-	return k3_rproc_release(kproc);
-}
-
 /*
  * Stop the M4 remote processor.
  *
@@ -298,7 +284,7 @@ static int k3_m4_rproc_detach(struct rproc *rproc)
 static const struct rproc_ops k3_m4_rproc_ops = {
 	.prepare = k3_rproc_prepare,
 	.unprepare = k3_rproc_unprepare,
-	.start = k3_m4_rproc_start,
+	.start = k3_rproc_start,
 	.stop = k3_m4_rproc_stop,
 	.attach = k3_m4_rproc_attach,
 	.detach = k3_m4_rproc_detach,
-- 
2.34.1

