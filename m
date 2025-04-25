Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3CF24EF83;
	Fri, 25 Apr 2025 10:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745577766; cv=none; b=QDjB5jZDVsfpi7i9Xc8/GSqgMUVtYBijAQPPygHcS/ThpKMDrz368eodxWoD0PARIopUq6EpIHY8zUDeA9jnRFp3kbrg52zo7baXu8Dm8LJE6jWKgwUJvMG1UAjAGfFAEuep+8eEtqQtxB3tTbM29jFrK2/HAJGx5cN+cN73zN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745577766; c=relaxed/simple;
	bh=LOAOC1g/c2UZr2AGXpHGSQEbwSm7x23LTnhAUyEeot0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a+/bzlFSEnE0vSotowIn/joGGuI4JO2gGuY/IxsAc8sgAR2LuZ2lwXYrSKAG4uUVUaVcmQFu0rRkfaRo0s+L8fzkQjVivIm6D5Q5GcFIzkwn0Bo5NXZ2JvFyLCTnt0ghbXj7FRrHhslEJ4wGEB+wLdIm8aJRQMKtFzLYfPSdD1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=HzMQXH3D; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="HzMQXH3D"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53PAgbNX2152234
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 05:42:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745577757;
	bh=9sqFotMoDm5a/mu7tDO4szSooxpVDVcum1C+sa7rwXk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=HzMQXH3DH8PbkNtVaki9CdYYSGdzVb8v92hb8J3LH9Vh6GFKe7KE2KX0Q7AZUbtr1
	 2FAHxVha46HcV1aSbHjpkcmqLxO7r/HBiRftfYwoQdazbeK8iGgDM1xK7Mbhjzm8O2
	 ZuciGG7FrU1YcJHKPOk3pIDvGPiLDKcmSCT9stQo=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53PAgbKd087452
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 25 Apr 2025 05:42:37 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 25
 Apr 2025 05:42:37 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 25 Apr 2025 05:42:36 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53PAfaZa038329;
	Fri, 25 Apr 2025 05:42:33 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v11 15/35] remoteproc: k3-m4: Introduce central function to put rproc into reset
Date: Fri, 25 Apr 2025 16:11:15 +0530
Message-ID: <20250425104135.830255-16-b-padhi@ti.com>
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

Currently, the TI K3 M4 remoteproc driver assumes all of the M4 devices
have local resets. Even though its true for all existing M4 devices,
keep room for future devices which possibly may not have local resets
and only have a module reset.

Therefore introduce a central function, k3_m4_rproc_reset() which
handles both type of devices (with and without local resets), and use it
throughout the driver to put the remote processor into reset. This is
done to align the reset implementation with DSP remoteproc driver and
can be factored out later.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
Tested-by: Judith Mendez <jm@ti.com>
---
v11: Changelog:
0. New patch in this series.
1. Split [v10 15/33] into [v11 15/35] and [v11 16/35]. [Andrew]

Link to v10:
https://lore.kernel.org/all/20250417182001.3903905-16-b-padhi@ti.com/

 drivers/remoteproc/ti_k3_m4_remoteproc.c | 36 +++++++++++++++---------
 1 file changed, 23 insertions(+), 13 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
index 8a6917259ce60..2abf22f45bea3 100644
--- a/drivers/remoteproc/ti_k3_m4_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_m4_remoteproc.c
@@ -21,6 +21,26 @@
 #include "ti_sci_proc.h"
 #include "ti_k3_common.h"
 
+/* Put the M4 remote processor into reset */
+static int k3_m4_rproc_reset(struct k3_rproc *kproc)
+{
+	struct device *dev = kproc->dev;
+	int ret;
+
+	if (kproc->data->uses_lreset) {
+		ret = reset_control_assert(kproc->reset);
+		if (ret)
+			dev_err(dev, "local-reset assert failed, ret = %d\n", ret);
+	} else {
+		ret = kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
+							    kproc->ti_sci_id);
+		if (ret)
+			dev_err(dev, "module-reset assert failed, ret = %d\n", ret);
+	}
+
+	return ret;
+}
+
 static int k3_m4_rproc_ping_mbox(struct k3_rproc *kproc)
 {
 	struct device *dev = kproc->dev;
@@ -65,11 +85,9 @@ static int k3_m4_rproc_prepare(struct rproc *rproc)
 	 * Ensure the local reset is asserted so the core doesn't
 	 * execute bogus code when the module reset is released.
 	 */
-	ret = reset_control_assert(kproc->reset);
-	if (ret) {
-		dev_err(dev, "could not assert local reset\n");
+	ret = k3_m4_rproc_reset(kproc);
+	if (ret)
 		return ret;
-	}
 
 	ret = reset_control_status(kproc->reset);
 	if (ret <= 0) {
@@ -374,16 +392,8 @@ static int k3_m4_rproc_start(struct rproc *rproc)
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
+	return k3_m4_rproc_reset(kproc);
 }
 
 /*
-- 
2.34.1

