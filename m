Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD74E223E9E;
	Thu, 19 Dec 2024 11:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734606377; cv=none; b=XuzPg43Bbl0FuWMZkvlMsxUQexxlhr5CUTWx4g0YQ5MwxWHbYyMChz3iyF0ks38sYGYFy9w2ZkquOCtth4+uWP4j5WExZJTE5MNG8ZMai/zqUVE5GnVmELPbRjR/sjbk1aeywnNogJd02T7cy7c02r/QF6D+Y328BbNZ/EI1Cf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734606377; c=relaxed/simple;
	bh=z7BOrRn7oM7fIdrAstqQA67tv3pUOD9QS24qe0z5duY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aeKn0/e2weKR4x3wdX8HkANTUyUl3+PtQ2rmqUMyNv0y1UGw0LX5mmPnVbz6CNhwQUHNCqOL6Zu5ClqHH3slno8pOqxrRwklvTm8FLVvL6FIllcjzyQRSnnjbnAzMZnoXU2IZjz4EvsJ4LwBhNQjLZagLCcptkyJ3VbJqZjJ0dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=tkefW9nf; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="tkefW9nf"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BJB67nH3773131
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Dec 2024 05:06:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734606367;
	bh=gzCpo6v+NMTuJrFrGACHffYkGY2JN6kxc7jV5O8z9V4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=tkefW9nfZMHTud9+8lGPxEvKbNr3mVpX/hk3Vk1IDTMGQ7D1Adp1IZ2jwAKlTrZYj
	 qG8vUBYbDO5qT9fAVtI2YK0ZrJXxndboVnKhfy09Tq/VsMoN491HNPzilQKxsuLFeY
	 Nz1NLh9R3EOB3Oa2GfhDtYUr4wjiF0dJNSktCiYI=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BJB67lB015631
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 19 Dec 2024 05:06:07 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 19
 Dec 2024 05:06:06 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 19 Dec 2024 05:06:06 -0600
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BJB5jYD088123;
	Thu, 19 Dec 2024 05:06:03 -0600
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 5/5] remoteproc: k3-r5: Add devm action to release tsp
Date: Thu, 19 Dec 2024 16:35:45 +0530
Message-ID: <20241219110545.1898883-6-b-padhi@ti.com>
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

Use a device lifecycle managed action to release tsp ti_sci_proc handle.
This helps prevent mistakes like releasing out of order in cleanup
functions and forgetting to release on error paths.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
v2: Changelog:
1. Re-ordered [PATCH 3/5] from v1 to [PATCH v2 5/5] in v2. [Andrew]

Link to v1:
https://lore.kernel.org/all/20241204111130.2218497-4-b-padhi@ti.com/

 drivers/remoteproc/ti_k3_r5_remoteproc.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
index 30b72bcb4d68..dbc513c5569c 100644
--- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
@@ -1487,6 +1487,13 @@ static int k3_r5_core_of_get_sram_memories(struct platform_device *pdev,
 	return 0;
 }
 
+static void k3_r5_release_tsp(void *data)
+{
+	struct ti_sci_proc *tsp = data;
+
+	ti_sci_proc_release(tsp);
+}
+
 static int k3_r5_core_of_init(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1580,6 +1587,10 @@ static int k3_r5_core_of_init(struct platform_device *pdev)
 		goto err;
 	}
 
+	ret = devm_add_action_or_reset(dev, k3_r5_release_tsp, core->tsp);
+	if (ret)
+		goto err;
+
 	platform_set_drvdata(pdev, core);
 	devres_close_group(dev, k3_r5_core_of_init);
 
@@ -1596,13 +1607,7 @@ static int k3_r5_core_of_init(struct platform_device *pdev)
  */
 static void k3_r5_core_of_exit(struct platform_device *pdev)
 {
-	struct k3_r5_core *core = platform_get_drvdata(pdev);
 	struct device *dev = &pdev->dev;
-	int ret;
-
-	ret = ti_sci_proc_release(core->tsp);
-	if (ret)
-		dev_err(dev, "failed to release proc, ret = %d\n", ret);
 
 	platform_set_drvdata(pdev, NULL);
 	devres_release_group(dev, k3_r5_core_of_init);
-- 
2.34.1

