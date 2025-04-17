Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8AB025744D;
	Thu, 17 Apr 2025 18:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744914036; cv=none; b=hkV6uHWT6LK6eEmpRPlgl6Q5zQyBz4Xc1AVhMSDSWF9AIQLguPF8x/utHvsheQFVc4QChil/tEhd+ktLXJwIYxQ0Gvz1iUa9gxw9IzX8c6tpAtRWPfmW14V0yNAdFCmaNPB4vCHZB+h6RGjc1F7NJwEGl/OccJfOVxwmwtagZZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744914036; c=relaxed/simple;
	bh=RZkSK3Qz7brPniST2h30m+Ze/j1ql8WgwmNiPgLbspQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p5MOsIb+GtIb9ofUyfe85INJT9olj33axNiByGkQR4PkOwkdFLgx2a70pZ9BLnrBR9lrrMcR1OrNwWgC36p3yMZlqsRrOMAlal+OjEuHiKwJAGjQ3hc8PxmtIpdYcgB7r4CBA4TSlbSZVe/RC3FTGHn7jhdrLqkHmR6niZnx2jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=f3x5Aw3A; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="f3x5Aw3A"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53HIKQf6720058
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Apr 2025 13:20:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744914026;
	bh=MpMkUW8PY/9Yx9tS9u0SCNhh+AertQja8qB8dHCDnIw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=f3x5Aw3AGG0tNOnAeVXDeF12QGVbkbOdsVvmjUbUCwX/Y+o9RT2s/I5z3JOKEkVss
	 wCTj7MuXhBQig12upOhpr22Axso9EPgYAv6CcItULK7vGUy0JHyYZQyNKLmrkYcFg4
	 DZ/f7ZOqoYUZQyUu4pju09ZUZe8+4SLy3SLyYSTI=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53HIKQxm022524
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 17 Apr 2025 13:20:26 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 17
 Apr 2025 13:20:24 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 17 Apr 2025 13:20:24 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53HIK1Hn071102;
	Thu, 17 Apr 2025 13:20:21 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v10 05/33] remoteproc: k3-r5: Re-order k3_r5_release_tsp() function
Date: Thu, 17 Apr 2025 23:49:33 +0530
Message-ID: <20250417182001.3903905-6-b-padhi@ti.com>
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

The TI-SCI processor control handle, 'tsp', will be refactored from
k3_r5_core struct into k3_r5_rproc struct in a future commit. So, the
'tsp' pointer will be initialized inside k3_r5_cluster_rproc_init() now.

Move the k3_r5_release_tsp() function, which releases the tsp handle,
above k3_r5_cluster_rproc_init(), so that the later can register the
former as a devm action.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
v10: Changelog:
1. Split release_tsp() re-ordering from [v9 01/26] into this patch.
2. Updated commit message to call out changes in a better way.

Link to v9:
https://lore.kernel.org/all/20250317120622.1746415-2-b-padhi@ti.com/

 drivers/remoteproc/ti_k3_r5_remoteproc.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
index 062a654cac0f0..8e2d9fa446662 100644
--- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
@@ -1356,6 +1356,13 @@ static int k3_r5_core_of_get_sram_memories(struct platform_device *pdev,
 	return 0;
 }
 
+static void k3_r5_release_tsp(void *data)
+{
+	struct ti_sci_proc *tsp = data;
+
+	ti_sci_proc_release(tsp);
+}
+
 static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
 {
 	struct k3_r5_cluster *cluster = platform_get_drvdata(pdev);
@@ -1495,13 +1502,6 @@ static void k3_r5_cluster_rproc_exit(void *data)
 	}
 }
 
-static void k3_r5_release_tsp(void *data)
-{
-	struct ti_sci_proc *tsp = data;
-
-	ti_sci_proc_release(tsp);
-}
-
 static int k3_r5_core_of_init(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-- 
2.34.1

