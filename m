Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE3E25743D;
	Thu, 17 Apr 2025 18:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744914082; cv=none; b=nublkrmCyEzKzzuSuRYTExuf/sEvhWNwJhPFJddfZFwnhMqWEftYlNC/2J70KTmOt7TfPYyULQXnrNSVipGNl8azSWUTA+VcfaHBEZOl8e5CVTjPoBGB7xfoFMvHvUnUbbQcSv6wdo5nQkmcc9HBqHe13AphAU3PX9YNeUYt4l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744914082; c=relaxed/simple;
	bh=YOt9sbHtxNS55H3MhCjXbPaKsIZi+lz6KRUvHCklLjM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rdmwSgwbKsJ3tpzqcL0mIMY5bk/tvlNOvFlr9C0aTP5l9bcwXJS5sT6HxeVEmEpz7W638gWm9vkSlOIt2g7vfdxs46nQPyujE9Kn8LsJ80YavzE0Pu4sllG7qMKR0EQN6xTTB25RSsoWi+Mni2lqnAvHhvZ7e9O0yInbsVD+6Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=t2RSzvx5; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="t2RSzvx5"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53HIL9VQ776041
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Apr 2025 13:21:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744914070;
	bh=vBFGhGJK+W1DY+JIU+08qcSVrVm/VM1NoVZEBx4OVck=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=t2RSzvx5SR0SK6q/0cYnEhvtAgkvRTGW39X1wzxAfs8P0OXn655NVTZS6Lhx8Tv0o
	 GZyEetyUt3A61clJwE+LUFOiWAjcbrCJN79dKDJglg+9O1TqsId6CxXSmmpE7meZ44
	 Zar8CDmROUIxBLTDV2dpX+K8UimUvbckD2XG3W3I=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53HIL93i023096
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 17 Apr 2025 13:21:09 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 17
 Apr 2025 13:21:09 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 17 Apr 2025 13:21:09 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53HIK1I1071102;
	Thu, 17 Apr 2025 13:21:06 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v10 17/33] remoteproc: k3: Refactor rproc_release() implementation into common driver
Date: Thu, 17 Apr 2025 23:49:45 +0530
Message-ID: <20250417182001.3903905-18-b-padhi@ti.com>
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

The rproc_release() implementations in TI K3 DSP and M4 remoteproc
drivers deassert reset in the same way. Refactor the above function into
the ti_k3_common.c driver as k3_rproc_release() and use it throughout
DSP and M4 drivers for releasing the reset from the remote processor.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
v10: Changelog:
1. Split [v9 13/26] into [v10 16/33] and [v10 17/33] patches. 

Link to v9:
https://lore.kernel.org/all/20250317120622.1746415-14-b-padhi@ti.com/

 drivers/remoteproc/ti_k3_common.c         | 27 ++++++++++++++++++++++
 drivers/remoteproc/ti_k3_common.h         |  1 +
 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 28 +----------------------
 drivers/remoteproc/ti_k3_m4_remoteproc.c  |  8 +++----
 4 files changed, 32 insertions(+), 32 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
index 19bb6c337af77..011a871860754 100644
--- a/drivers/remoteproc/ti_k3_common.c
+++ b/drivers/remoteproc/ti_k3_common.c
@@ -130,5 +130,32 @@ int k3_rproc_reset(struct k3_rproc *kproc)
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
index b10b35326bd6b..577dcd65093a9 100644
--- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
@@ -24,32 +24,6 @@
 
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
-
-		return ret;
-	}
-
-	ret = kproc->ti_sci->ops.dev_ops.get_device(kproc->ti_sci,
-						    kproc->ti_sci_id);
-	if (ret)
-		dev_err(dev, "module-reset deassert failed (%pe)\n", ERR_PTR(ret));
-
-	return ret;
-}
-
 static int k3_dsp_rproc_request_mbox(struct rproc *rproc)
 {
 	struct k3_rproc *kproc = rproc->priv;
@@ -158,7 +132,7 @@ static int k3_dsp_rproc_start(struct rproc *rproc)
 	if (ret)
 		return ret;
 
-	ret = k3_dsp_rproc_release(kproc);
+	ret = k3_rproc_release(kproc);
 	if (ret)
 		return ret;
 
diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
index 7d5b75be2e4f8..a8a5211bf0c7f 100644
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

