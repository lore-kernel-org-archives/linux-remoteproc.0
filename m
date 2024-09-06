Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951A01CB33E
	for <linux-remoteproc@vger.kernel.org>; Fri,  6 Sep 2024 11:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.255
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725623269; cv=none; b=RlWynpfdq7eRk6Hh7pW64T4H+pmcHNj7gDrF/kto6alvyHG/8En41hC12t2OXxP5Vs/4O1AdmLu4tENAb7/A3J8+I2GQtet9NcJzv4Gr+Kyv0ssN+OtEvf2r+JG5pKVDVfemtczCIlc5XFgyobXRVhhJgnRHWft3YkjWUPzWfaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725623269; c=relaxed/simple;
	bh=9y6iXEMIN+VUEAKsI378DLBae/79+cN4G5pGmJwoktk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CRu/8ZexLFzk7oigkfmyvW/cOhCkhLTXRuLOsghTV0YVgTsReUVJn3JwGlq5N4p3znDySLUEF4tJZhTy/XV8VeRlK6w5gl3C5eypbuhKCBogh3esRVlLimqbIpGTB/Xx+KjJkqe3i7+7ZVWilH76NV7VJIslRwGlfVWHoS5H6jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.255
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4X0ZFd0lTnz1BNDj;
	Fri,  6 Sep 2024 19:46:45 +0800 (CST)
Received: from kwepemf500003.china.huawei.com (unknown [7.202.181.241])
	by mail.maildlp.com (Postfix) with ESMTPS id 2EDEA180064;
	Fri,  6 Sep 2024 19:47:45 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemf500003.china.huawei.com
 (7.202.181.241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 6 Sep
 2024 19:47:44 +0800
From: Zhang Zekun <zhangzekun11@huawei.com>
To: <patrice.chotard@foss.st.com>, <andersson@kernel.org>,
	<mathieu.poirier@linaro.org>, <linux-remoteproc@vger.kernel.org>
CC: <chenjun102@huawei.com>, <zhangzekun11@huawei.com>
Subject: [PATCH v2 3/3] remoteporc: ingenic: Simplify with devm_platform_ioremap_resource_byname()
Date: Fri, 6 Sep 2024 19:34:05 +0800
Message-ID: <20240906113405.92782-4-zhangzekun11@huawei.com>
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
 drivers/remoteproc/ingenic_rproc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/remoteproc/ingenic_rproc.c b/drivers/remoteproc/ingenic_rproc.c
index 9902cce28692..1b78d8ddeacf 100644
--- a/drivers/remoteproc/ingenic_rproc.c
+++ b/drivers/remoteproc/ingenic_rproc.c
@@ -183,8 +183,7 @@ static int ingenic_rproc_probe(struct platform_device *pdev)
 	vpu->dev = &pdev->dev;
 	platform_set_drvdata(pdev, vpu);
 
-	mem = platform_get_resource_byname(pdev, IORESOURCE_MEM, "aux");
-	vpu->aux_base = devm_ioremap_resource(dev, mem);
+	vpu->aux_base = devm_platform_ioremap_resource_byname(pdev, "aux");
 	if (IS_ERR(vpu->aux_base)) {
 		dev_err(dev, "Failed to ioremap\n");
 		return PTR_ERR(vpu->aux_base);
-- 
2.17.1

