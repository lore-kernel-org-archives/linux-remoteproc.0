Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33EA21B85DB;
	Wed,  4 Dec 2024 11:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733310706; cv=none; b=ZBC6Am42doSxoZon9Bl2puIHwdmQQWNvNUFaLjlMh97qP1Ari/K8HkuahLcl9i3JetokRQayLtGSjK9776C2w9fqoVZc29ud1qCwWL5rw+1yW/ttdyOq+xLiCfGo4pW1ejgkEhm5k+lkAELnJqtXW3Nbhru7V+qiVZwPIQfI3UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733310706; c=relaxed/simple;
	bh=3zmW6MC5KD/bxXC+Ip1U5h9S7gKMYqLKBJ7ioNRc5Ik=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g/hua7E2ptfYmmUCljwIzDuedLWidDf8voPQqc9OZhWOc5teoxnFeVpRYuiMRDoFVSPjN3OzO1J0t8AQygZ+rrtk6RgSQML81sa/CxWjbW6AoWds+QYLW90o363P5ynaA0fxtxKOWnfx+VOmT+4R88zL+/QwM+8Mow0nnyKVfP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=UFzQ9tpw; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="UFzQ9tpw"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4B4BBcZr062435;
	Wed, 4 Dec 2024 05:11:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733310698;
	bh=lstoYoTf3SJwGkrApo7In28oldN80V5FqTvJLxVMOww=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=UFzQ9tpwdFNrYlvvTucI8ZTBZKHR5wDIKKf9A4GYlWZ3bhgvxOpUqj9wh5+hunDEI
	 BUsWch9Is6j+zpwUZkGWY7PWuOHjxHKBkhN0U3LIepD5snvqxoJwwl/XR49mEiH31t
	 OOmnEJX1d6Y5prbNflstmZIwcHSMXwuCnBel7GAU=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B4BBceZ068069;
	Wed, 4 Dec 2024 05:11:38 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 4
 Dec 2024 05:11:37 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 4 Dec 2024 05:11:37 -0600
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B4BBVUL083186;
	Wed, 4 Dec 2024 05:11:35 -0600
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <b-padhi@ti.com>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/5] remoteproc: k3-r5: Add devm action to release reserved memory
Date: Wed, 4 Dec 2024 16:41:26 +0530
Message-ID: <20241204111130.2218497-2-b-padhi@ti.com>
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

Use a device lifecycle managed action to release reserved memory. This
helps prevent mistakes like releasing out of order in cleanup functions
and forgetting to release on error paths.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
 drivers/remoteproc/ti_k3_r5_remoteproc.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
index 6560b7954027..d51f88a5abc1 100644
--- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
@@ -955,6 +955,13 @@ static int k3_r5_rproc_configure(struct k3_r5_rproc *kproc)
 	return ret;
 }
 
+static void k3_r5_mem_release(void *data)
+{
+	struct device *dev = data;
+
+	of_reserved_mem_device_release(dev);
+}
+
 static int k3_r5_reserved_mem_init(struct k3_r5_rproc *kproc)
 {
 	struct device *dev = kproc->dev;
@@ -985,12 +992,14 @@ static int k3_r5_reserved_mem_init(struct k3_r5_rproc *kproc)
 		return ret;
 	}
 
+	ret = devm_add_action_or_reset(dev, k3_r5_mem_release, dev);
+	if (ret)
+		return ret;
+
 	num_rmems--;
 	kproc->rmem = kcalloc(num_rmems, sizeof(*kproc->rmem), GFP_KERNEL);
-	if (!kproc->rmem) {
-		ret = -ENOMEM;
-		goto release_rmem;
-	}
+	if (!kproc->rmem)
+		return -ENOMEM;
 
 	/* use remaining reserved memory regions for static carveouts */
 	for (i = 0; i < num_rmems; i++) {
@@ -1041,8 +1050,6 @@ static int k3_r5_reserved_mem_init(struct k3_r5_rproc *kproc)
 	for (i--; i >= 0; i--)
 		iounmap(kproc->rmem[i].cpu_addr);
 	kfree(kproc->rmem);
-release_rmem:
-	of_reserved_mem_device_release(dev);
 	return ret;
 }
 
@@ -1053,8 +1060,6 @@ static void k3_r5_reserved_mem_exit(struct k3_r5_rproc *kproc)
 	for (i = 0; i < kproc->num_rmems; i++)
 		iounmap(kproc->rmem[i].cpu_addr);
 	kfree(kproc->rmem);
-
-	of_reserved_mem_device_release(kproc->dev);
 }
 
 /*
-- 
2.34.1

