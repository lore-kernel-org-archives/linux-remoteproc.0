Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F115D178376;
	Tue, 20 Aug 2024 10:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724151017; cv=none; b=uzT1FZtvpFXZ4ucNuyeG9JYF4HeBSdzNT5Gfyu0WBUn5iU2h1O4LbcRXJmG2B4krh4RI7uyZUiUgGsX2Wy2e/XBZ4/AJUkQYyvWNzEJPWmSDT2h93tDrDfoFxJq6RR0DK0iSf0VeuuM4zWbaZIaLxtwP2ro6xbfAk1DO0PfQnD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724151017; c=relaxed/simple;
	bh=O1uwyAeSGEd4AvsES8Z6gwpkVzZ2KrbsiIn7WbEYRD0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Z740h7de7UjFqFpG4BDU3+Q1UBvjc5obYHvb3e/FVQ2EJi5LOtIL2s+TtZqlU4/GOGjxHAblydWNN8DqHEoPNYd9qonWeIPTtrkL3x5Pjp04nTrRqCCAcYXfx9iRNOqI2sQYls998J+v8wAlBQHgFyT7zZ1SOA0Cp3MmgS7m+oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=vbWTgcwA; arc=none smtp.client-ip=198.47.19.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="vbWTgcwA"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 47KAo7gr108404;
	Tue, 20 Aug 2024 05:50:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1724151008;
	bh=pCgilSn2pZbLDqEQHy8CxGYb0S9a7ieqf3GWSbjGDVA=;
	h=From:To:CC:Subject:Date;
	b=vbWTgcwAM2ROgWeqs30coh1j4LDbuzKY93Tuqv1LEpMNkIdCYUfm2gz1dsy5b+Z8f
	 0bqEDqDKa4IfIyyg5U6zIVi0O9KuRUuflngxdJuvDRSYpVcWvoNQ6DVqtEj785p3nG
	 7VWHxEjqW6+tULQQmsxWDHnVctlrogDs4pyB4YSQ=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 47KAo7UU015450
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 20 Aug 2024 05:50:07 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 20
 Aug 2024 05:50:07 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 20 Aug 2024 05:50:07 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 47KAo4H7011113;
	Tue, 20 Aug 2024 05:50:05 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <afd@ti.com>
CC: <hnagalla@ti.com>, <u-kumar1@ti.com>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] remoteproc: k3-r5: Delay notification of wakeup event
Date: Tue, 20 Aug 2024 16:20:04 +0530
Message-ID: <20240820105004.2788327-1-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

From: Udit Kumar <u-kumar1@ti.com>

Few times, core1 was scheduled to boot first before core0, which leads
to error:

'k3_r5_rproc_start: can not start core 1 before core 0'.

This was happening due to some scheduling between prepare and start
callback. The probe function waits for event, which is getting
triggered by prepare callback. To avoid above condition move event
trigger to start instead of prepare callback.

Fixes: 61f6f68447ab ("remoteproc: k3-r5: Wait for core0 power-up before powering up core1")
Signed-off-by: Udit Kumar <u-kumar1@ti.com>
[ Applied wakeup event trigger only for Split-Mode booted rprocs ]
Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
v2: Changelog:
* Mathieu
1) Rebased changes on top of -next-20240820 tag.

Link to v1:
https://lore.kernel.org/all/20240809060132.308642-1-b-padhi@ti.com/

 drivers/remoteproc/ti_k3_r5_remoteproc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
index 8a63a9360c0f..e61e53381abc 100644
--- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
@@ -469,8 +469,6 @@ static int k3_r5_rproc_prepare(struct rproc *rproc)
 			ret);
 		return ret;
 	}
-	core->released_from_reset = true;
-	wake_up_interruptible(&cluster->core_transition);
 
 	/*
 	 * Newer IP revisions like on J7200 SoCs support h/w auto-initialization
@@ -587,6 +585,9 @@ static int k3_r5_rproc_start(struct rproc *rproc)
 		ret = k3_r5_core_run(core);
 		if (ret)
 			return ret;
+
+		core->released_from_reset = true;
+		wake_up_interruptible(&cluster->core_transition);
 	}
 
 	return 0;
-- 
2.34.1

