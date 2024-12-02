Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41CA1DDC19;
	Mon,  2 Dec 2024 22:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733177953; cv=none; b=nFhTJFJO5xGAJGONr+c7SMuN6pxkHeqBIXdaOvzVNtzOyKL7lEW6TfqokF5dT/gcsIK5jddw1fLr73BDJcwoJAQHk+wmwQiBO0uihJi2g4jed/JdWq8YGshIlf5Ekj0iBxQgW9RaOqE3B0+mUXBxXhiVzyMX2SZS4isPqi12A94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733177953; c=relaxed/simple;
	bh=Aozbz3bWXqF7F76Tu8d0hlgtsQZWnJPCD0v39IXAarI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gey03d9MkExQy1GLXtceqod4qMD5nPSGQNXp21TT4ZPf/do4jXdIfx+JeIkJuEywIduRGt1eSozSu0Cm688KnlThviiJhXBnDl/0FCNYguR6BKvVXHcMNFABLgbnu54HyiOW94HNuCSpxygRGYO6uI1cFJc4BilbNkXFGKwj0GA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=qY/s2qkM; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="qY/s2qkM"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4B2MJ6UE1528301
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 2 Dec 2024 16:19:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733177946;
	bh=TLtXusRMjrN3yzTWi90NwUk4sR7yTSZj/gKurUQqQ70=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=qY/s2qkMjIYecmpeK+7GQ4pjJvReUTGyAo4wvfFnhtRfrVELmUhFOLJHqGOow1zKu
	 SRNAupsi10HcJansN16zxKt/JxPcFPFQqtJf1cP8s/8uVo6ilLrtfncUcrb5o1hY4p
	 wfOh84cCy7sL62jgjugBUcb8OAvVO8twIJI3MnUk=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4B2MJ6GL062221
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 2 Dec 2024 16:19:06 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 2
 Dec 2024 16:19:06 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 2 Dec 2024 16:19:06 -0600
Received: from lelvsmtp5.itg.ti.com ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B2MJ5Ut068468;
	Mon, 2 Dec 2024 16:19:05 -0600
From: Andrew Davis <afd@ti.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Andrew
 Davis <afd@ti.com>
Subject: [PATCH 2/4] remoteproc: wkup_m3: Use devm action to call PM runtime put sync
Date: Mon, 2 Dec 2024 16:19:02 -0600
Message-ID: <20241202221904.319149-2-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241202221904.319149-1-afd@ti.com>
References: <20241202221904.319149-1-afd@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

This helps prevent mistakes like putting out of order in cleanup functions
and forgetting to put sync on error paths.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/remoteproc/wkup_m3_rproc.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/remoteproc/wkup_m3_rproc.c b/drivers/remoteproc/wkup_m3_rproc.c
index 35c2145b12db7..2569f041d9cab 100644
--- a/drivers/remoteproc/wkup_m3_rproc.c
+++ b/drivers/remoteproc/wkup_m3_rproc.c
@@ -125,6 +125,13 @@ static const struct of_device_id wkup_m3_rproc_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, wkup_m3_rproc_of_match);
 
+static void wkup_m3_rproc_pm_runtime_put(void *data)
+{
+	struct device *dev = data;
+
+	pm_runtime_put_sync(dev);
+}
+
 static int wkup_m3_rproc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -152,17 +159,16 @@ static int wkup_m3_rproc_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return dev_err_probe(dev, ret, "Failed to enable runtime PM\n");
 	ret = pm_runtime_get_sync(&pdev->dev);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "pm_runtime_get_sync() failed\n");
-		goto err;
-	}
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "pm_runtime_get_sync() failed\n");
+	ret = devm_add_action_or_reset(dev, wkup_m3_rproc_pm_runtime_put, dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to add disable pm devm action\n");
 
 	rproc = rproc_alloc(dev, "wkup_m3", &wkup_m3_rproc_ops,
 			    fw_name, sizeof(*wkupm3));
-	if (!rproc) {
-		ret = -ENOMEM;
-		goto err;
-	}
+	if (!rproc)
+		return -ENOMEM;
 
 	rproc->auto_boot = false;
 	rproc->sysfs_read_only = true;
@@ -219,8 +225,6 @@ static int wkup_m3_rproc_probe(struct platform_device *pdev)
 
 err_put_rproc:
 	rproc_free(rproc);
-err:
-	pm_runtime_put_noidle(dev);
 	return ret;
 }
 
@@ -230,7 +234,6 @@ static void wkup_m3_rproc_remove(struct platform_device *pdev)
 
 	rproc_del(rproc);
 	rproc_free(rproc);
-	pm_runtime_put_sync(&pdev->dev);
 }
 
 #ifdef CONFIG_PM
-- 
2.39.2

