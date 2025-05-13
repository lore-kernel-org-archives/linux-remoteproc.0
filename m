Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F6B7DA7F;
	Tue, 13 May 2025 05:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747115153; cv=none; b=j0neYlaAbUubNMeAhh35OwgQbeEAPeeK+wvpsR+PvbHivkzxwfpS7sp3MftN2D76YXuhY/uRJH2d8PkX+ZWF9vakIj24KOWvnBrJKHB0hd/NjW801AIGnBAe4GKf26UqVWPFGc+F7XDwcTp3euITgazBA8siighMvC6mkCP2u3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747115153; c=relaxed/simple;
	bh=tWCLFzBq4QtkTyQZg5vtookrGmyrTXs0yYMMqyN6XR4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lr1r3qYtRFs9QFEegaA9TGkWs7PZBMpxnvBPKmh4p2E5jwUarEZMce0el6ILRV9iKg3m4PbnQ6wwNP+eN6NReImPNYz7ErcdEzyYot/MtO1OWHeh0TQ5WOb05wZVmzFiP+kgrpboiQ7Wxt9+khbKMWUNa/EmedukGhR9vSNMgUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=lFIg5Ki5; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="lFIg5Ki5"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 54D5jWac2210703
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 May 2025 00:45:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747115132;
	bh=h9g7xkVWq9sPE/E369IfByaxL5kqikNRGPZz49On2b4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=lFIg5Ki5mYghP8R4qxGVFMGc/avNVS0tQu4812hl5dGbCDED5qGTGKH2DLLPWUREl
	 JDD+I4oKa+jBS4m1950UJWnCP7HoXyaWvpve3qZFAWw21vejMWxKU6SZD8qPFkwH7v
	 Vqx0tAay7BuZZkaHjYa6SL4RHtN7w+2wmUhi7hcc=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 54D5jWHR088475
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 13 May 2025 00:45:32 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 13
 May 2025 00:45:32 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 13 May 2025 00:45:31 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54D5jAqD131001;
	Tue, 13 May 2025 00:45:28 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v12 04/36] remoteproc: k3-m4: Don't assert reset in detach routine
Date: Tue, 13 May 2025 11:14:38 +0530
Message-ID: <20250513054510.3439842-5-b-padhi@ti.com>
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

The rproc_detach() function invokes __rproc_detach() before
rproc_unprepare_device(). The __rproc_detach() function sets the
rproc->state to "RPROC_DETACHED".

However, the TI K3 M4 driver erroneously looks for "RPROC_ATTACHED"
state in its .unprepare ops to identify IPC-only mode; which leads to
resetting the rproc in detach routine.

Therefore, correct the IPC-only mode detection logic to look for
"RPROC_DETACHED" in k3_m4_rproc_unprepare() function.

Fixes: ebcf9008a895 ("remoteproc: k3-m4: Add a remoteproc driver for M4F subsystem")
Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
v12: Changelog:
1. New patch. Fixup a state detection logic.

 drivers/remoteproc/ti_k3_m4_remoteproc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
index a16fb165fcedd..6cd50b16a8e82 100644
--- a/drivers/remoteproc/ti_k3_m4_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_m4_remoteproc.c
@@ -228,7 +228,7 @@ static int k3_m4_rproc_unprepare(struct rproc *rproc)
 	int ret;
 
 	/* If the core is going to be detached do not assert the module reset */
-	if (rproc->state == RPROC_ATTACHED)
+	if (rproc->state == RPROC_DETACHED)
 		return 0;
 
 	ret = kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
-- 
2.34.1

