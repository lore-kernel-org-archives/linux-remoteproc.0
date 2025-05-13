Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00AFB1EFF81;
	Tue, 13 May 2025 05:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747115190; cv=none; b=H4/UUvyM3wyjdoI8nSQAEmKaV+QQBl+S8xyDjTeXmoYgCTMtdZQoC4QPBN3TzYFyiD3mVXcxyQTrxKdcfykc6UbM6nLzqCK7VztZVvglfjZ4mfFZZ421pm3hZy+YdiglshWeYRU9S9hZs0/6Nz6LUqE1gK0lioPjPzaQGO7UYXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747115190; c=relaxed/simple;
	bh=AXNR915YNI8Voc2Uh7fifl+gty7dVzja7BOvMvPZBnQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k75GNyfXt0Ce/MeGh/C+0qSD5KRNJzd4KS5IqqYQnZ5J/CZhqreGaWy3b/Nm/WlpqRc74ly10CQBiA2kH9RKdCO3g0AMAAZBaaxaob1lSfwJqMTiri52M+mxYXn7LP2BzbHl/XZ1ofZzUCbNMlhVImf7gmAnzwJVImZ+D36V65Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Q1kZKXht; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Q1kZKXht"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 54D5kLbK2764301
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 May 2025 00:46:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747115182;
	bh=TGfIRXIwQovYsnFdzb2rrvdrHBRKevG/Q/9+MuWR7Hs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Q1kZKXhtIecXvO41Pby5vkYz0NPr+U1YpD/1Qj10Hjrp3U9OvpI5u/Ednpr1DF1vm
	 O4ltCdruP4uHWUwBSKLK1CDc9ODI9cGy2ssX4DZ7NN5+zzEuRKAPVTvy8A9qy68cQj
	 Jp2+/m7KGjqye0s5zwIS6v6OgjFSPHPGsff2upLw=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 54D5kLD1088760
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 13 May 2025 00:46:21 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 13
 May 2025 00:46:21 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 13 May 2025 00:46:21 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54D5jAqP131001;
	Tue, 13 May 2025 00:46:18 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v12 16/36] remoteproc: k3-m4: Introduce central function to put rproc into reset
Date: Tue, 13 May 2025 11:14:50 +0530
Message-ID: <20250513054510.3439842-17-b-padhi@ti.com>
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

Therefore introduce a central function, k3_m4_rproc_reset() which
handles both type of devices (with and without local resets), and use it
throughout the driver to put the remote processor into reset. This is
done to align the reset implementation with DSP remoteproc driver and
can be factored out later.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
Tested-by: Judith Mendez <jm@ti.com>
Reviewed-by: Andrew Davis <afd@ti.com>
---
v12: Changelog:
1. Carried R/B tag.

Link to v11:
https://lore.kernel.org/all/20250425104135.830255-16-b-padhi@ti.com/

v11: Changelog:
0. New patch in this series.
1. Split [v10 15/33] into [v11 15/35] and [v11 16/35]. [Andrew]

Link to v10:
https://lore.kernel.org/all/20250417182001.3903905-16-b-padhi@ti.com/

 drivers/remoteproc/ti_k3_m4_remoteproc.c | 36 +++++++++++++++---------
 1 file changed, 23 insertions(+), 13 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
index 9dcae94121930..150c68e5f3967 100644
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

