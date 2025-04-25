Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5C523D289;
	Fri, 25 Apr 2025 10:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745577728; cv=none; b=BZj8jDwg4fuvkxsWzsB2sdIsQlPdk6g4w/JismLYbC07iTTh1eei6UUF6s3hShqTrOut8OpP5jdeOgWsdcjGXmxmSzxzaKFy/H59ke7mBg7HvgnMXJ0jTJICBRmW20gwcNZuviwv7KDtOIFPW+RBbod6Zp4O4KrgLZhooDhRGKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745577728; c=relaxed/simple;
	bh=K5HZUZXPQCvzo6f+wPFQ3hKg3yMupKFSJg1csU1hCU8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LLeh8mdZKpHgZ2UZ4iCgKERCuviwmaPNyLRQuR+DwR/pOblVu4NiCT2iw81S5qG9WMitS77xB62eV0ZUi4HcHJ8mAluak/52ZMMIFOeomHJMg2YLgK5MCVjCfTg06GcJBYDPLGlgcSaq2gS3I7nh2A6l8AOOBohCysiWGBYcT1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=qkKYNet8; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="qkKYNet8"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53PAfx8V2910664
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 05:41:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745577719;
	bh=q5ZWD0svyr3V3FpCrF3bUXDERi80WQ6vGR0Jz+hDQnM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=qkKYNet8bk9KDns2l21C49KsxkQrnmEUb//DK8Pdiy23QvpYl1v6dpr6NL4QJ8YnM
	 3CyrYveAv+sWzWlLw/6OhIJW8+l8w5nkHHwmH8gKqXeGNpp70RKltwmWug0ofWsceG
	 B6E+yjwnebQN2QiOaqVL99cAnW3tqWZEN4ZU0+ws=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53PAfx4h129133
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 25 Apr 2025 05:41:59 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 25
 Apr 2025 05:41:59 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 25 Apr 2025 05:41:58 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53PAfaZQ038329;
	Fri, 25 Apr 2025 05:41:55 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v11 05/35] remoteproc: k3-r5: Re-order k3_r5_release_tsp() function
Date: Fri, 25 Apr 2025 16:11:05 +0530
Message-ID: <20250425104135.830255-6-b-padhi@ti.com>
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

The TI-SCI processor control handle, 'tsp', will be refactored from
k3_r5_core struct into k3_r5_rproc struct in a future commit. So, the
'tsp' pointer will be initialized inside k3_r5_cluster_rproc_init() now.

Move the k3_r5_release_tsp() function, which releases the tsp handle,
above k3_r5_cluster_rproc_init(), so that the later can register the
former as a devm action.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
Tested-by: Judith Mendez <jm@ti.com>
---
v11: Changelog:
1. Carried T/B tag.

Link to v10:
https://lore.kernel.org/all/20250417182001.3903905-6-b-padhi@ti.com/

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

