Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39F0222591;
	Thu, 19 Dec 2024 11:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734606370; cv=none; b=s7TgwH5Q1WgEURbNluFmtbS678L8BlFVg4JoER2quw07S+PKBb0QRuq86v7K9BmWiLpqs1D4YtEIkkWMAQ8smlI346mAUUi1JsouTnIZGcZVrZA9n5HABhqTcYwZfd69DXi2eOzfp2gdsq2yYKVwNx5i+7aGus29Qg1EDCXysBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734606370; c=relaxed/simple;
	bh=9got5afp3kwpNmGyX3X5DFFZ/ORTpuwcMBoxJATTLAc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AKRzHTqj4AoXlMydNcJdQzIGGo9W2+YugBGZVpqlbRRXTXDid9AWcvAk9As7wxkzEKs3JQGtOXTBcMhFUy3WOeMtguwr6BVDG5xFwPTS7H0EPc900jUB2C4+6ZhSEAQpNNDYYqIjF9dgNBqm7erPMwYnrfS08sJf0Em0yF+B/So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=dJPVFCQP; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="dJPVFCQP"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BJB5rnx3773114
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Dec 2024 05:05:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734606353;
	bh=/Zm+E6WmfjClb5CVQFdTgeL5GpKLvseHQ4i/Wj/uBTo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=dJPVFCQPCIJLh/IqRd+a45IQjkuBp+Wv+34Q8+dWCy7Fg+5KhM8WEFsSEi8Julp+U
	 H5QaS17XTGVssCJ+YcvbumOrihbCFDk/ktTdzOG7pNHuh+ygIzh9jtH/pzL2ANmTF3
	 furnWvScLxCpZMIHIaiklO9085v6KtgqJgOzlwH0=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BJB5rWX015250
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 19 Dec 2024 05:05:53 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 19
 Dec 2024 05:05:53 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 19 Dec 2024 05:05:52 -0600
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BJB5jY9088123;
	Thu, 19 Dec 2024 05:05:49 -0600
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 1/5] remoteproc: k3-r5: Add devm action to release reserved memory
Date: Thu, 19 Dec 2024 16:35:41 +0530
Message-ID: <20241219110545.1898883-2-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241219110545.1898883-1-b-padhi@ti.com>
References: <20241219110545.1898883-1-b-padhi@ti.com>
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
v2: Changelog:
1. None to this patch
 
Link to v1:
https://lore.kernel.org/all/20241204111130.2218497-2-b-padhi@ti.com/

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

