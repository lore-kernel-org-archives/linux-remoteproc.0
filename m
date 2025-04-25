Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6643A25229B;
	Fri, 25 Apr 2025 10:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745577779; cv=none; b=iN/BbIJowT2qK178429W0B5Rua+yP+3IowWJ/BNN2ejIKflgODdWGcFUe9RjP2tUnDtlt7UKIYi1zm3pYWlkD93A6B2sbmz1HRIITAvgw2LGc5wJY5PmH4HzCvOVM6f93Y+sjP5eWqZ7vP22tGanCaPYG1eaJ3TpWhHzpUSSegY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745577779; c=relaxed/simple;
	bh=89Almo13alfX6pkzuflW2Fr9yEe87kpVEHeBUuj9WLE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g2OKiQ65sHMTmUZu2FnjvGTEcStPfmHqrzzUYnVHM32y6irYWtNqFDYSD7A+2efzj9R3UFSR6IXFQqlvb+EEHxf1JiRWYhFwjXNAZQsBKt2DyRCALCJ0iSd4iPZUVq8tD3ZoLRFZkrwQxKsYgzqI5FzHxNwtQSnyNxqUIMeiGKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=mg5/Y+Lr; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="mg5/Y+Lr"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53PAgmDw2123118
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 05:42:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745577769;
	bh=E05evRSxeApAmVaPRj7K+TgjurXW1lxPbmtteQHAVh0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=mg5/Y+Lr0doOIU8JTKvon15d2GXtHgftZsG5M/QtqNSBuh6wsknI/Ru4OPVKKaibB
	 bFMqN6rrzsXsWhoqbcvYkIqtbRMCd5uHZE7/ZWBoJOhMhXzkVypJx/JqggbX4SuYr9
	 rKZl3I0hZJh+dJ3mtdcKs+O/hibGo1cNnk/ETd2I=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53PAgmiC129480
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 25 Apr 2025 05:42:48 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 25
 Apr 2025 05:42:48 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 25 Apr 2025 05:42:47 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53PAfaZd038329;
	Fri, 25 Apr 2025 05:42:45 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v11 18/35] remoteproc: k3-m4: Introduce central function to release rproc from reset
Date: Fri, 25 Apr 2025 16:11:18 +0530
Message-ID: <20250425104135.830255-19-b-padhi@ti.com>
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

Therefore introduce a central function, k3_m4_rproc_release() which
handles both type of devices (with and without local resets), and use it
throughout the driver to release the remote processor from reset. Also,
for devices with local reset, Assert the module reset back in case the
local reset deassert operation failed.

This is done to align the reset release implementation with DSP
remoteproc driver and can be factored out later.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
Tested-by: Judith Mendez <jm@ti.com>
---
v11: Changelog:
0. New patch in this series.
1. Split [v10 17/33] into [v11 18/35] and [v11 19/35]. 

Link to v10:
https://lore.kernel.org/all/20250417182001.3903905-18-b-padhi@ti.com/

 drivers/remoteproc/ti_k3_m4_remoteproc.c | 33 +++++++++++++++++++-----
 1 file changed, 26 insertions(+), 7 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
index 7d5b75be2e4f8..74f1b6c0a9562 100644
--- a/drivers/remoteproc/ti_k3_m4_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_m4_remoteproc.c
@@ -21,6 +21,30 @@
 #include "ti_sci_proc.h"
 #include "ti_k3_common.h"
 
+/* Release the M4 remote processor from reset */
+static int k3_m4_rproc_release(struct k3_rproc *kproc)
+{
+	struct device *dev = kproc->dev;
+	int ret;
+
+	if (kproc->data->uses_lreset) {
+		ret = reset_control_deassert(kproc->reset);
+		if (ret) {
+			dev_err(dev, "local-reset deassert failed, ret = %d\n", ret);
+			if (kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
+								  kproc->ti_sci_id))
+				dev_warn(dev, "module-reset assert back failed\n");
+		}
+	} else {
+		ret = kproc->ti_sci->ops.dev_ops.get_device(kproc->ti_sci,
+							    kproc->ti_sci_id);
+		if (ret)
+			dev_err(dev, "module-reset deassert failed, ret = %d\n", ret);
+	}
+
+	return ret;
+}
+
 static int k3_m4_rproc_ping_mbox(struct k3_rproc *kproc)
 {
 	struct device *dev = kproc->dev;
@@ -347,20 +371,15 @@ static void k3_m4_release_tsp(void *data)
 static int k3_m4_rproc_start(struct rproc *rproc)
 {
 	struct k3_rproc *kproc = rproc->priv;
-	struct device *dev = kproc->dev;
 	int ret;
 
 	ret = k3_m4_rproc_ping_mbox(kproc);
 	if (ret)
 		return ret;
 
-	ret = reset_control_deassert(kproc->reset);
-	if (ret) {
-		dev_err(dev, "local-reset deassert failed, ret = %d\n", ret);
-		return ret;
-	}
+	ret = k3_m4_rproc_release(kproc);
 
-	return 0;
+	return ret;
 }
 
 /*
-- 
2.34.1

