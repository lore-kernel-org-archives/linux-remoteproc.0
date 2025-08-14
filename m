Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21354231856;
	Thu, 14 Aug 2025 15:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755185989; cv=none; b=hl1AqWfs+aOcZnsampViUX1awaMd812QNUQrssOejCzq3PlJHAkn2tDwx3buUhvXQvDiwLkqXqJV2jAimErNO2QVMiGG0lI49jLEK0mCz1DprWaQWDoWBPZ2Vx6aLEm93y/68LNVXxNCegIulJB0mZzIN1+brXR9RTe8/MLky/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755185989; c=relaxed/simple;
	bh=AwhzDvIA2bj3m3zRBFLS/ktlTTmp4bzl55JHykjiVEo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SPR0LLXeYWlkqruSxAOvZBdaHbgigeYyPKXU4LroxrCiq+qX+hFi7rOyFnzbi1q4DtmbYiC0j55XRCzAcEpiyKtRooHdImO9wjISw7yH1B7wOva0BLFuRTS4or4YaKvVEM59wuZrc9fueUSnnk4VmxlVewi32Ks8tMISx9sfBt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Dlua3dKt; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Dlua3dKt"
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57EFdh192335651;
	Thu, 14 Aug 2025 10:39:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755185983;
	bh=O82T6so8Km0QtWJYw5utRsVDe3pb0SzgiPo8alDm3sI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Dlua3dKtUfDSnShvZwtcLd+ZM4p4QbIcDGnFQkyyry+wrjb31pfGSlTWRS3OsUYyt
	 wQAEYtp1Ya8Z9fLViro49rT9dHTSAlrwQGEQN08ufl5VShgoKWbaWsTU4oxtbHlCmL
	 vmj3ar8P9+YZtN+K9v9y/AMPqWHYK3irtRLVkBMc=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57EFdhpj1932385
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 14 Aug 2025 10:39:43 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 14
 Aug 2025 10:39:43 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 14 Aug 2025 10:39:43 -0500
Received: from fllvem-mr08.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57EFdfKh3826763;
	Thu, 14 Aug 2025 10:39:42 -0500
From: Andrew Davis <afd@ti.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Hari Nagalla <hnagalla@ti.com>, Beleswar Padhi
	<b-padhi@ti.com>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Andrew
 Davis <afd@ti.com>
Subject: [PATCH 4/4] remoteproc: wkup_m3: Use devm_rproc_add() helper
Date: Thu, 14 Aug 2025 10:39:40 -0500
Message-ID: <20250814153940.670564-4-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250814153940.670564-1-afd@ti.com>
References: <20250814153940.670564-1-afd@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Use the device lifecycle managed add function. This helps prevent mistakes
like deleting out of order in cleanup functions and forgetting to delete
on error paths.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/remoteproc/wkup_m3_rproc.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/remoteproc/wkup_m3_rproc.c b/drivers/remoteproc/wkup_m3_rproc.c
index 30e9ecd75657f..2d5bfbefcacc5 100644
--- a/drivers/remoteproc/wkup_m3_rproc.c
+++ b/drivers/remoteproc/wkup_m3_rproc.c
@@ -210,20 +210,13 @@ static int wkup_m3_rproc_probe(struct platform_device *pdev)
 
 	dev_set_drvdata(dev, rproc);
 
-	ret = rproc_add(rproc);
+	ret = devm_rproc_add(dev, rproc);
 	if (ret)
 		return dev_err_probe(dev, ret, "rproc_add failed\n");
 
 	return 0;
 }
 
-static void wkup_m3_rproc_remove(struct platform_device *pdev)
-{
-	struct rproc *rproc = platform_get_drvdata(pdev);
-
-	rproc_del(rproc);
-}
-
 #ifdef CONFIG_PM
 static int wkup_m3_rpm_suspend(struct device *dev)
 {
@@ -242,7 +235,6 @@ static const struct dev_pm_ops wkup_m3_rproc_pm_ops = {
 
 static struct platform_driver wkup_m3_rproc_driver = {
 	.probe = wkup_m3_rproc_probe,
-	.remove = wkup_m3_rproc_remove,
 	.driver = {
 		.name = "wkup_m3_rproc",
 		.of_match_table = wkup_m3_rproc_of_match,
-- 
2.39.2

