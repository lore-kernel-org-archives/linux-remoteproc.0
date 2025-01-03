Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4591F9F48;
	Fri,  3 Jan 2025 10:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735899189; cv=none; b=koaoDUXgId6m1Vhd+d7lU7Fcy27CUID9Il0auq460CyoFI0+D+OI5995iBKITENQgRSLyl/FQDCnhF/ah6/oZ0sDY9t1fWazB4zfbwrOn00y/IxBAWKguCd1Po+2T6Mi0GMirLgr3gMTJ62SSKjWWaR++k0BOpEMWlzicaFDh2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735899189; c=relaxed/simple;
	bh=dv8Rdx922O7xN0WyGdN3/oUDuk5E4qQbW+XT7rPM7dg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cTbYO0UmV3W8MVZy0fILhesuOfu8lZcYwouFCLzS4VRhHy0zBOP601QtC86EP7chlvpzZnsngGEDYzLo0dlx1ouwRVOSBKSS4isu1RA6iyB8MMPJNW52WRIUpCV7YoldmPu5x6wsO0hL/wt2+ojhpJHNIS9xlsVFg8sqcVgzguc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=tLEeMvQd; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="tLEeMvQd"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 503ACwqR2076377
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 3 Jan 2025 04:12:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1735899178;
	bh=tcHAMj3B1jP+H8++Z/xR9g/S7xj6x47Z+JTtbYMT5j4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=tLEeMvQdLORSI6eRrT1p6KX+342FSoQACVAEx0vcrMdSsZfitwex2Fqhb+xKvgrB6
	 3Fd2ngT+WnTuYk9FhQMNdmzWVPJTZP+Y8iYq+1bvG3R9JBWBCctsRrsVidzxupj1AZ
	 KqIUD+Bq+/6vJuux5ziZPsBS4bZ/QOPs8pI7a26s=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 503ACwhM112379
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 3 Jan 2025 04:12:58 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 3
 Jan 2025 04:12:58 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 3 Jan 2025 04:12:58 -0600
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 503ACVSO126047;
	Fri, 3 Jan 2025 04:12:54 -0600
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>,
        <p.zabel@pengutronix.de>, <jan.kiszka@siemens.com>,
        <christophe.jaillet@wanadoo.fr>, <jkangas@redhat.com>,
        <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v8 06/20] remoteproc: k3: Refactor rproc_reset() implementation into common driver
Date: Fri, 3 Jan 2025 15:42:17 +0530
Message-ID: <20250103101231.1508151-7-b-padhi@ti.com>
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

The k3_dsp_rproc_reset() function erroneously asserts the local reset
even for devices which do not support it. Even though it results in a
no-operation, Update the logic to explicitly assert the local reset for
devices that support it and only the global reset for those that do not.

Further, refactor the above function into the ti_k3_common.c driver as
k3_rproc_reset() and use it throughout DSP and M4 drivers for resetting
the remote processor.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
 drivers/remoteproc/ti_k3_common.c         | 25 +++++++++++++++++++
 drivers/remoteproc/ti_k3_common.h         |  1 +
 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 30 ++---------------------
 drivers/remoteproc/ti_k3_m4_remoteproc.c  | 16 +++---------
 4 files changed, 31 insertions(+), 41 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
index bd6353283078..8f4cc52c1332 100644
--- a/drivers/remoteproc/ti_k3_common.c
+++ b/drivers/remoteproc/ti_k3_common.c
@@ -117,5 +117,30 @@ void k3_rproc_kick(struct rproc *rproc, int vqid)
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
index 57792d68b7ef..52f784ada496 100644
--- a/drivers/remoteproc/ti_k3_common.h
+++ b/drivers/remoteproc/ti_k3_common.h
@@ -90,4 +90,5 @@ struct k3_rproc {
 
 void k3_rproc_mbox_callback(struct mbox_client *client, void *data);
 void k3_rproc_kick(struct rproc *rproc, int vqid);
+int k3_rproc_reset(struct k3_rproc *kproc);
 #endif /* REMOTEPROC_TI_K3_COMMON_H */
diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
index b2551b5171a9..045b1e81d06c 100644
--- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
@@ -24,32 +24,6 @@
 
 #define KEYSTONE_RPROC_LOCAL_ADDRESS_MASK	(SZ_16M - 1)
 
-/* Put the DSP processor into reset */
-static int k3_dsp_rproc_reset(struct k3_rproc *kproc)
-{
-	struct device *dev = kproc->dev;
-	int ret;
-
-	ret = reset_control_assert(kproc->reset);
-	if (ret) {
-		dev_err(dev, "local-reset assert failed (%pe)\n", ERR_PTR(ret));
-		return ret;
-	}
-
-	if (kproc->data->uses_lreset)
-		return ret;
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
@@ -203,7 +177,7 @@ static int k3_dsp_rproc_stop(struct rproc *rproc)
 {
 	struct k3_rproc *kproc = rproc->priv;
 
-	k3_dsp_rproc_reset(kproc);
+	k3_rproc_reset(kproc);
 
 	return 0;
 }
@@ -584,7 +558,7 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
 				return dev_err_probe(dev, ret, "failed to get reset status\n");
 			} else if (ret == 0) {
 				dev_warn(dev, "local reset is deasserted for device\n");
-				k3_dsp_rproc_reset(kproc);
+				k3_rproc_reset(kproc);
 			}
 		}
 	}
diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
index fc688b124a54..d31cf9babf1d 100644
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

