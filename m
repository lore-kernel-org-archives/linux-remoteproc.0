Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C87B1DF986;
	Mon,  2 Dec 2024 22:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733177956; cv=none; b=lS48zZ9kNzsXKOnaBTNyHFY8LTvadd1fmz0/y+woiCoL+c30RncoqT1kz5kQKnAbbccowgF8oV199eEHLdGJefgH+eacIR9G36Ed06RJKodstM5qma68kt07PTj5bGCj3fOLJPZ+d9WC71jRe9Ep0CB/hPCV9363VWhBz38N0l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733177956; c=relaxed/simple;
	bh=urvpwznyO5WKUBXGA4SCvIRflXbeZHt0QRLOdzFKni4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cGOpoiWebQjvKIt2nAE1vFCNqaDHsiGyc4e3iDSZxQRXWicPhmLJxedmPI86jNbzTbeKKB0/1laI6eFnGsU8njEI0xHSOzOaaUNJGWQ2k3JOo7ckPfqwLIvQ6VXlOanv1xT84lKwJeLV0Ek8zbpouG7094kE/Gy1M7iisdH6aNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=TMgs6gNZ; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="TMgs6gNZ"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4B2MJ60o1793774
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 2 Dec 2024 16:19:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733177947;
	bh=1l584hfjXVw8ZfV2t87/tz1GLJ0Q02GqO2iqyohvDUM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=TMgs6gNZYoo8U3kCXbW5gNQwneCxmVPpkjvJYi6Tiz6LxTrQjyhEb40LSgtsxmpmT
	 BIzsXk1d4dAVr3QyRTF3IXmtPZ8M6GqiuarooGH/7WQ9InJRfuOIU3MVdmxC8S01Sz
	 X3Jc0HyP7fjvRdpEJ2GsvfRD2fVr1sxgRq3/QSmo=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4B2MJ6nv062225
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 2 Dec 2024 16:19:06 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 2
 Dec 2024 16:19:06 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 2 Dec 2024 16:19:06 -0600
Received: from lelvsmtp5.itg.ti.com ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B2MJ5Uv068468;
	Mon, 2 Dec 2024 16:19:06 -0600
From: Andrew Davis <afd@ti.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Andrew
 Davis <afd@ti.com>
Subject: [PATCH 4/4] remoteproc: wkup_m3: Use devm_rproc_add() helper
Date: Mon, 2 Dec 2024 16:19:04 -0600
Message-ID: <20241202221904.319149-4-afd@ti.com>
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

Use the device lifecycle managed add function. This helps prevent mistakes
like deleting out of order in cleanup functions and forgetting to delete
on error paths.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/remoteproc/wkup_m3_rproc.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/remoteproc/wkup_m3_rproc.c b/drivers/remoteproc/wkup_m3_rproc.c
index 30e9ecd75657f..6af9aa4179d0c 100644
--- a/drivers/remoteproc/wkup_m3_rproc.c
+++ b/drivers/remoteproc/wkup_m3_rproc.c
@@ -208,22 +208,13 @@ static int wkup_m3_rproc_probe(struct platform_device *pdev)
 		wkupm3->mem[i].dev_addr = be32_to_cpu(*addrp) - l4_offset;
 	}
 
-	dev_set_drvdata(dev, rproc);
-
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
@@ -242,7 +233,6 @@ static const struct dev_pm_ops wkup_m3_rproc_pm_ops = {
 
 static struct platform_driver wkup_m3_rproc_driver = {
 	.probe = wkup_m3_rproc_probe,
-	.remove = wkup_m3_rproc_remove,
 	.driver = {
 		.name = "wkup_m3_rproc",
 		.of_match_table = wkup_m3_rproc_of_match,
-- 
2.39.2

