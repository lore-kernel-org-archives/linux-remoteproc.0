Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62971241131;
	Mon, 17 Mar 2025 12:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742213251; cv=none; b=FnoCylInzKL6bPhY5JZEOX3gEoAX+PgRkRfTNwKxweZIeV3nJvQgLrFhOs2RUDlzC4KydJ7NKYuwqis0eHFvtUtaKK4ixgta81haplIyakcGaVzXseSV+r1GgZJpDzEscQRTJU8KCsUzn15T/qSrepbwGgPnxBqhnurcayRP1vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742213251; c=relaxed/simple;
	bh=lzzZgZEkOiAWPB4ufuINXi6X98kVKrVdAnyrcp19Z2Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nJYV0oVnLPdKJtg+6iyybnzFyNI2GxknvUBnX0HJYRxWfwehlFpfdV5r7Y4+hFFF8TYpKEYvzkRf5zlQRhJ5bbhRV1D6vem8g47t+8sDoovQ6Q9vDusSlQrd+3qzfisBh7ZaojntqArOj4UwhgDHsT1btDNo3otyDMCoDfF2jRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=n6DsbIkx; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="n6DsbIkx"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52HC7K0S2802895
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Mar 2025 07:07:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742213240;
	bh=tY5l8nx9prH+KWgvUgwULRS9nJ8usFY32vn4hHQj1Q4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=n6DsbIkxjElh1mT0ANILT/RjpnDAYAvx+RKQgmkLqfRR6zbmMqTyiUmtujdJHXuXM
	 tg+sIAqx/gC37eGdbqArHiI3iGTxR/wtKtpMWJN/DeoG2W5UkEV1aDitFhW3qyHmC9
	 EIMMVyGZ04CrE7dVaKsCAknvPYLfyeBAXwAX10zE=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52HC7KJL108565
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 17 Mar 2025 07:07:20 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 17
 Mar 2025 07:07:19 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 17 Mar 2025 07:07:19 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52HC6MKA060901;
	Mon, 17 Mar 2025 07:07:16 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v9 13/26] remoteproc: k3: Refactor rproc_release() implementation into common driver
Date: Mon, 17 Mar 2025 17:36:09 +0530
Message-ID: <20250317120622.1746415-14-b-padhi@ti.com>
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
index db6a12c89226..3b1d041fec7b 100644
--- a/drivers/remoteproc/ti_k3_common.c
+++ b/drivers/remoteproc/ti_k3_common.c
@@ -129,5 +129,32 @@ int k3_rproc_reset(struct k3_rproc *kproc)
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
index f3400fc77476..c1af39cd288c 100644
--- a/drivers/remoteproc/ti_k3_common.h
+++ b/drivers/remoteproc/ti_k3_common.h
@@ -91,4 +91,5 @@ struct k3_rproc {
 void k3_rproc_mbox_callback(struct mbox_client *client, void *data);
 void k3_rproc_kick(struct rproc *rproc, int vqid);
 int k3_rproc_reset(struct k3_rproc *kproc);
+int k3_rproc_release(struct k3_rproc *kproc);
 #endif /* REMOTEPROC_TI_K3_COMMON_H */
diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
index f8a5282df5b7..577dcd65093a 100644
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
index 7d5b75be2e4f..a8a5211bf0c7 100644
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

