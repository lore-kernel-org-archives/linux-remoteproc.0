Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86011B87F2;
	Wed,  4 Dec 2024 11:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733310709; cv=none; b=ZM/ETQlvop4jLrdED18B3/cx1YRDkFxr9i7teWQvF1TJzAZ3KFduAbskDErzXBknTUuFteMHS0b4KuHyw9zJOx4B12ZODN3AO/uhqUj8q72/77hLCnUtFYapU7iME2l/UumMWpMH0e/AcTb4382HewUsBOi/7kXHtHJT6/Hkd2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733310709; c=relaxed/simple;
	bh=SMNRB7yJd0csoHCLrx5jNYkQsSs1vlyrBpbRxrLd/70=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tEGJPeCchoP+/AHDgDFxzD+Qjs4f00GnSb6vOF2Goa1dT9Ea47TCQKHu+4VqCJGvq8SqEeT6r3l0H79ovh7nWcsrKJ11bF6r+xdouPL8pyy9XL+HPaD9/PagESisPAkai983lMmBgbG0urV/+wJ0OvF95CSnGYTqUz6rFKbbw1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=TnPCCNcz; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="TnPCCNcz"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4B4BBfHS1779879
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 4 Dec 2024 05:11:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733310701;
	bh=4w5Yzsc4wGy4qYPeLwV0qn3uMFc2ikXQj2oq1xY3Y1A=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=TnPCCNczYhwOUOFAg1g6p6cAb9HKd6LSHQnFaPMtyo0uB5dEEmsMKaKeYEewUpvbH
	 gQetXgcWf/z1hHUJjKhp/VmY/uTRw5aVl8T4t6IWXcgmvF8vwlb6+YH4f9e5cu7Jar
	 v6WUOCvv+8IwRcH2bQppUnHYySq78MGvLxR+esgA=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4B4BBfp2044813
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 4 Dec 2024 05:11:41 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 4
 Dec 2024 05:11:40 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 4 Dec 2024 05:11:40 -0600
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B4BBVUM083186;
	Wed, 4 Dec 2024 05:11:38 -0600
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <b-padhi@ti.com>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/5] remoteproc: k3-r5: Use devm_kcalloc() helper
Date: Wed, 4 Dec 2024 16:41:27 +0530
Message-ID: <20241204111130.2218497-3-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241204111130.2218497-1-b-padhi@ti.com>
References: <20241204111130.2218497-1-b-padhi@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Use a device lifecycle managed action to free memory. This helps prevent
mistakes like freeing out of order in cleanup functions and forgetting
to free on error paths.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
 drivers/remoteproc/ti_k3_r5_remoteproc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
index d51f88a5abc1..0753a5c35c7e 100644
--- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
@@ -997,7 +997,7 @@ static int k3_r5_reserved_mem_init(struct k3_r5_rproc *kproc)
 		return ret;
 
 	num_rmems--;
-	kproc->rmem = kcalloc(num_rmems, sizeof(*kproc->rmem), GFP_KERNEL);
+	kproc->rmem = devm_kcalloc(dev, num_rmems, sizeof(*kproc->rmem), GFP_KERNEL);
 	if (!kproc->rmem)
 		return -ENOMEM;
 
@@ -1049,7 +1049,6 @@ static int k3_r5_reserved_mem_init(struct k3_r5_rproc *kproc)
 unmap_rmem:
 	for (i--; i >= 0; i--)
 		iounmap(kproc->rmem[i].cpu_addr);
-	kfree(kproc->rmem);
 	return ret;
 }
 
@@ -1059,7 +1058,6 @@ static void k3_r5_reserved_mem_exit(struct k3_r5_rproc *kproc)
 
 	for (i = 0; i < kproc->num_rmems; i++)
 		iounmap(kproc->rmem[i].cpu_addr);
-	kfree(kproc->rmem);
 }
 
 /*
-- 
2.34.1

