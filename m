Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94FE81CB33B
	for <linux-remoteproc@vger.kernel.org>; Fri,  6 Sep 2024 11:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725623270; cv=none; b=VheB4uHaVYpBPAnkasaRAlb3PsawHJ0dUyeiTYkRbt/QEmCmKVw1Jowj4DjBBDqhurMboZjjDC9jtEtOIx/2Hy/U8ESfM2AVRzsS5RHmpdnARgzztD00k2v0S/rnTFuju3J6ZorQgOQK7TmsPP1eZ7/I7J7X9WxLQfQPpS4jJbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725623270; c=relaxed/simple;
	bh=ze1wiwQaD8OYUGZ6QgRS/yKIFc0vom8bIpE5YEHwiLs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J8a5ci0Sv0/ZPjK1zYu1d6mgyJ2f/SYMDNJZDa1L3/MpkXunxqKhN3n832yUlj9vdxnRud8r16I7G86C5o/EpEiyghLfG2xVQ1uBl9I2nKfn/5+lm34ar9MHGw/VwTmaZeXTTKLgQCuxoqrIQjIu1eLFFFOfR4UliVoCzzMKAP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4X0ZGK0Gsmz2DbrD;
	Fri,  6 Sep 2024 19:47:21 +0800 (CST)
Received: from kwepemf500003.china.huawei.com (unknown [7.202.181.241])
	by mail.maildlp.com (Postfix) with ESMTPS id 03CF21A0188;
	Fri,  6 Sep 2024 19:47:44 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemf500003.china.huawei.com
 (7.202.181.241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 6 Sep
 2024 19:47:43 +0800
From: Zhang Zekun <zhangzekun11@huawei.com>
To: <patrice.chotard@foss.st.com>, <andersson@kernel.org>,
	<mathieu.poirier@linaro.org>, <linux-remoteproc@vger.kernel.org>
CC: <chenjun102@huawei.com>, <zhangzekun11@huawei.com>
Subject: [PATCH v2 1/3] remoteproc: Use devm_platform_ioremap_resource_byname() helper function
Date: Fri, 6 Sep 2024 19:34:03 +0800
Message-ID: <20240906113405.92782-2-zhangzekun11@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240906113405.92782-1-zhangzekun11@huawei.com>
References: <20240906113405.92782-1-zhangzekun11@huawei.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
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

