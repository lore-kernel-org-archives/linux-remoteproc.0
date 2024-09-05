Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D6919A2A2
	for <linux-remoteproc@vger.kernel.org>; Thu,  5 Sep 2024 12:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725538722; cv=none; b=lfSi0lg9WMfHteJU9ym6oHoQne4Y6vazzwNauYyb8WsVNHjFwgL55yPjMSHanhzkTvlV928jZU97Px3oJQ8xz87cDyFEcUE4nAb03sUeVPsw2ZNNq7SB/u3ds/c0aEiC4JD69ST8sAMlH6/HPcwsHKZAo5W2TVttkEl7HfjpD9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725538722; c=relaxed/simple;
	bh=ze1wiwQaD8OYUGZ6QgRS/yKIFc0vom8bIpE5YEHwiLs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XHIsMFk5kC9BNLQr6L8CIM0G1eEXWQMcM4ZGy+Dofw5zwQaY3f30B9CMlwOaqhUxvpTFsl+jN74CLVBNYC36JlIi4E1yv3dT8s5yl8Y1pXIY8i9q2kzB412sUDNxrxaJRggJnkPi0mqunwdIKFaDTrvrI4sLr0BYMmZ2d4z3d0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Wzz0562YtzyRTw;
	Thu,  5 Sep 2024 20:17:57 +0800 (CST)
Received: from kwepemf500003.china.huawei.com (unknown [7.202.181.241])
	by mail.maildlp.com (Postfix) with ESMTPS id 11A671403D4;
	Thu,  5 Sep 2024 20:18:37 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemf500003.china.huawei.com
 (7.202.181.241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 5 Sep
 2024 20:18:36 +0800
From: Zhang Zekun <zhangzekun11@huawei.com>
To: <patrice.chotard@foss.st.com>, <andersson@kernel.org>,
	<mathieu.poirier@linaro.org>, <linux-remoteproc@vger.kernel.org>
CC: <zhangzekun11@huawei.com>
Subject: [PATCH] remoteproc: Use devm_platform_ioremap_resource_byname() helper function
Date: Thu, 5 Sep 2024 20:05:01 +0800
Message-ID: <20240905120501.131046-1-zhangzekun11@huawei.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemf500003.china.huawei.com (7.202.181.241)

platform_get_resource_byname() and devm_ioremap_resource() can be
replaced by devm_platform_ioremap_resource_byname(), which can
simplify the code logic a bit, No functional change here.

Signed-off-by: Zhang Zekun <zhangzekun11@huawei.com>
---
 drivers/remoteproc/st_slim_rproc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/st_slim_rproc.c b/drivers/remoteproc/st_slim_rproc.c
index d17719384c16..5412beb0a692 100644
--- a/drivers/remoteproc/st_slim_rproc.c
+++ b/drivers/remoteproc/st_slim_rproc.c
@@ -259,16 +259,14 @@ struct st_slim_rproc *st_slim_rproc_alloc(struct platform_device *pdev,
 		slim_rproc->mem[i].size = resource_size(res);
 	}
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "slimcore");
-	slim_rproc->slimcore = devm_ioremap_resource(dev, res);
+	slim_rproc->slimcore = devm_platform_ioremap_resource_byname(pdev, "slimcore");
 	if (IS_ERR(slim_rproc->slimcore)) {
 		dev_err(&pdev->dev, "failed to ioremap slimcore IO\n");
 		err = PTR_ERR(slim_rproc->slimcore);
 		goto err;
 	}
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "peripherals");
-	slim_rproc->peri = devm_ioremap_resource(dev, res);
+	slim_rproc->peri = devm_platform_ioremap_resource_byname(pdev, "peripherals");
 	if (IS_ERR(slim_rproc->peri)) {
 		dev_err(&pdev->dev, "failed to ioremap peripherals IO\n");
 		err = PTR_ERR(slim_rproc->peri);
-- 
2.17.1

