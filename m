Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F921CB50F
	for <linux-remoteproc@vger.kernel.org>; Fri,  6 Sep 2024 11:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725623270; cv=none; b=f+m/u/UWfP83bR0xq0RWorhSjdzxMIiaZk2HYhm70PHmV6Uc+Yt3nuiGFeF8TGLHp7Ao9dWXAnkX5qDijg4UMFhu5M/mk23SE7UVM0xypSvat4w2Eg36Izyd95DPOysaRTWvL+vG92kpy4iyEZ3RSGo6MhdKZHEbLiNSCe4I/Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725623270; c=relaxed/simple;
	bh=GmERoR9dTS8kT5fgtCWRRqkf61y20wY4e6r8TlcKvUw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M2cj6ByXk7PUyouiD5jrqg2C8Y4MBxYzqX3YW2sl+2IV/m8Yjt0TLobRGmSyxWNz32+4RCMvcymSB1Y1V1dweUJWO9Pg/o/bo9zDp+857DwhpN1gOurcv5OscCAGA4P8V6klyuz78+jz5JySqv75VWVWOwNY+Dejeaz8UxHENV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4X0ZDJ2gdNzfbC7;
	Fri,  6 Sep 2024 19:45:36 +0800 (CST)
Received: from kwepemf500003.china.huawei.com (unknown [7.202.181.241])
	by mail.maildlp.com (Postfix) with ESMTPS id 903C414011A;
	Fri,  6 Sep 2024 19:47:44 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemf500003.china.huawei.com
 (7.202.181.241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 6 Sep
 2024 19:47:43 +0800
From: Zhang Zekun <zhangzekun11@huawei.com>
To: <patrice.chotard@foss.st.com>, <andersson@kernel.org>,
	<mathieu.poirier@linaro.org>, <linux-remoteproc@vger.kernel.org>
CC: <chenjun102@huawei.com>, <zhangzekun11@huawei.com>
Subject: [PATCH v2 2/3] remoteproc: da8xx: Simplify with devm_platform_ioremap_resource_byname()
Date: Fri, 6 Sep 2024 19:34:04 +0800
Message-ID: <20240906113405.92782-3-zhangzekun11@huawei.com>
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
 drivers/remoteproc/da8xx_remoteproc.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/remoteproc/da8xx_remoteproc.c b/drivers/remoteproc/da8xx_remoteproc.c
index 9041a0e07fb2..8770d0cf1255 100644
--- a/drivers/remoteproc/da8xx_remoteproc.c
+++ b/drivers/remoteproc/da8xx_remoteproc.c
@@ -239,8 +239,6 @@ static int da8xx_rproc_probe(struct platform_device *pdev)
 	struct da8xx_rproc *drproc;
 	struct rproc *rproc;
 	struct irq_data *irq_data;
-	struct resource *bootreg_res;
-	struct resource *chipsig_res;
 	struct clk *dsp_clk;
 	struct reset_control *dsp_reset;
 	void __iomem *chipsig;
@@ -258,15 +256,11 @@ static int da8xx_rproc_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	bootreg_res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
-						   "host1cfg");
-	bootreg = devm_ioremap_resource(dev, bootreg_res);
+	bootreg = devm_platform_ioremap_resource_byname(pdev, "host1cfg");
 	if (IS_ERR(bootreg))
 		return PTR_ERR(bootreg);
 
-	chipsig_res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
-						   "chipsig");
-	chipsig = devm_ioremap_resource(dev, chipsig_res);
+	chipsig = devm_platform_ioremap_resource_byname(pdev, "chipsig");
 	if (IS_ERR(chipsig))
 		return PTR_ERR(chipsig);
 
-- 
2.17.1

