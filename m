Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873DF15218E;
	Mon, 10 Jun 2024 15:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718032649; cv=none; b=Pp82xPDPN6MVQ4I4CVLVhnQokuFZCtTEUV4lMYpTBQ6kNnk9utrEgnWvq5cxYV600vM0ZQgBqiADp1sgoLXK8KzyKETBt8bFdFI4vPfyCqhBkLOAzgjl2TofsK7L/+0PiTd83M5igiWb8PTkEzz3dT5TfOOxT7O1lhXQgieUnfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718032649; c=relaxed/simple;
	bh=34IBcVJRT9a1iGd/s4e2KmsiacQ/fwBWEn/GfLuaU84=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SWD/ZeVPJ+yXQk80QcWPTQXPrON2eOImTLiW4K9+Zz/qoBhKwyPjhTJ8nxUO1fSk9aKbG2TeudkudcAHSzE0r9utTGdUnfVYOKhHjm9PC9gCV6NVOH6zvz5cYyGH1uWP2p962jKphL308WL0GTOC+gJcpRmbR+SGL55g2ASsvhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=BymZSzbP; arc=none smtp.client-ip=198.47.23.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="BymZSzbP"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45AFHOmX126249;
	Mon, 10 Jun 2024 10:17:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718032644;
	bh=r0k+DvL6KY1JUyaLhso3b+X98/K/2Xw/JXU0kRkC/zo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=BymZSzbPbO7i5E0wLt2YsTRQ40RnqIjnWrjxCVAp9JDcBa+deQnhZ2+f4MMCxHof7
	 OdrnI3DQIQkXMDzTcAUXXGvFtblS4GG8AZ605152jsG0Zzb3tMPYKF97MJX1OyZBV9
	 iZogwg5sqxDowAJSZ2mmoVQpGUvrhuz5BOePqg1s=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45AFHOjQ017905
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 10 Jun 2024 10:17:24 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 10
 Jun 2024 10:17:23 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 10 Jun 2024 10:17:23 -0500
Received: from fllvsmtp7.itg.ti.com ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45AFHMqd017714;
	Mon, 10 Jun 2024 10:17:23 -0500
From: Andrew Davis <afd@ti.com>
To: Hari Nagalla <hnagalla@ti.com>, Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Andrew
 Davis <afd@ti.com>
Subject: [PATCH 3/6] remoteproc: omap: Use devm_rproc_add() helper
Date: Mon, 10 Jun 2024 10:17:18 -0500
Message-ID: <20240610151721.189472-3-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240610151721.189472-1-afd@ti.com>
References: <20240610151721.189472-1-afd@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Use the device lifecycle managed add function. This helps prevent mistakes
like deleting out of order in cleanup functions and forgetting to delete
on error paths.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/remoteproc/omap_remoteproc.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
index df46be84658f7..9ae2e831456d5 100644
--- a/drivers/remoteproc/omap_remoteproc.c
+++ b/drivers/remoteproc/omap_remoteproc.c
@@ -1359,20 +1359,13 @@ static int omap_rproc_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, rproc);
 
-	ret = rproc_add(rproc);
+	ret = devm_rproc_add(&pdev->dev, rproc);
 	if (ret)
 		return ret;
 
 	return 0;
 }
 
-static void omap_rproc_remove(struct platform_device *pdev)
-{
-	struct rproc *rproc = platform_get_drvdata(pdev);
-
-	rproc_del(rproc);
-}
-
 static const struct dev_pm_ops omap_rproc_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(omap_rproc_suspend, omap_rproc_resume)
 	SET_RUNTIME_PM_OPS(omap_rproc_runtime_suspend,
@@ -1381,7 +1374,6 @@ static const struct dev_pm_ops omap_rproc_pm_ops = {
 
 static struct platform_driver omap_rproc_driver = {
 	.probe = omap_rproc_probe,
-	.remove_new = omap_rproc_remove,
 	.driver = {
 		.name = "omap-rproc",
 		.pm = &omap_rproc_pm_ops,
-- 
2.39.2

