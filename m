Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B871E885A;
	Tue, 13 May 2025 05:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747115204; cv=none; b=pBwhk+wJgFzMRv5glYaVQRmhGfsblkD5sESD3NU7gKPEFNiXxGY3OTjuQwiDeIAkvHEKPiV+zQvFaBwcNzFUF8CmCa9dogchUzxd4LxOdF76XuLT+j30nPm+XXAFN+2vwt5D9oNRyiNnJoc5uXF3JmY6xH/bBbp3GznTwQ5vQqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747115204; c=relaxed/simple;
	bh=/143TBWT4ffE80Kwq4TRHCmtZw7LZE2r2UiJW1kE9Zg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GKv3jv+6ozC7+ueYSJ6HQ4sgstbujP+huWxjetKszBvoI4yi8RklEl3Kd59p7eXlT2ytujee7A/p6vH/atpoefnL7Lu5bwHbl3CPf1qWJahKBxzYnsOhSLMM8VrUfExovJ2rCQaGemDY0+2P8stWQ0I9MYwyGCVFRktumAXkaQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=jjB7MFSb; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="jjB7MFSb"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 54D5kYnv2226432
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 May 2025 00:46:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747115194;
	bh=Fj+hDKZ3DJhjfBqikb8AlwjEb4VaNZKT4lVh4ddWfts=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=jjB7MFSbpm56OkMoVjEV8PqjP07RB8aNetwyJVtqO1quu5JspPsHhQYJNK5ieVS9S
	 dTCOW7gVbfD/GQ1+ZU06+VrwSCN2HGAqrE7J0G4SGmvMUUxIXryLtDVL3TMZ5q9PDg
	 Ed8vY29WBaZSbt6ZLLsakoMfYlxvxgCji0L0nAEc=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 54D5kY4v032490
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 13 May 2025 00:46:34 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 13
 May 2025 00:46:34 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 13 May 2025 00:46:34 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54D5jAqS131001;
	Tue, 13 May 2025 00:46:30 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v12 19/36] remoteproc: k3-m4: Introduce central function to release rproc from reset
Date: Tue, 13 May 2025 11:14:53 +0530
Message-ID: <20250513054510.3439842-20-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250513054510.3439842-1-b-padhi@ti.com>
References: <20250513054510.3439842-1-b-padhi@ti.com>
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
Reviewed-by: Andrew Davis <afd@ti.com>
---
v12: Changelog:
1. Carried R/B tag.

Link to v11:
https://lore.kernel.org/all/20250425104135.830255-19-b-padhi@ti.com/

v11: Changelog:
0. New patch in this series.
1. Split [v10 17/33] into [v11 18/35] and [v11 19/35]. 

Link to v10:
https://lore.kernel.org/all/20250417182001.3903905-18-b-padhi@ti.com/

 drivers/remoteproc/ti_k3_m4_remoteproc.c | 33 +++++++++++++++++++-----
 1 file changed, 26 insertions(+), 7 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
index 5123162748953..d9c105bc4845d 100644
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

