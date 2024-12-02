Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE981DF740;
	Mon,  2 Dec 2024 21:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733176304; cv=none; b=nGvGvy/uu5FDtIZhq/P+MJnxi40nMPR8hD0/F6CfAkTxHHYSTVoQJ4bcwu7FqwaSVV4cL25Nk1R+UKQVpUB1DnMVA6lEU0AjP/f+IZyEabMikyXjI/wijj2vIkqi7sbLJuF4FR1uUVUM5Lg+AmK3Py05GrkM9PaiecMBAONA2wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733176304; c=relaxed/simple;
	bh=Emezrf3DA7uMjr9yf2vP9Tk2wlaif8y1dDhMAC1NPTI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m0fMAoJm5YnQqxSReWSX/X6FVlX7DWlKUkuZFmqnUq5AmZ5PMu7A/mHVTQQ49TiWEuEi9zRABmervwPdTHdSuDshyf6LBMHbFAF0NgXAwTSkrSz4aJB9EPl/1qcAcKVZo3pcEQ53ssXMB2n11hl5vVmhRGykrC/z5FEgTBMTJMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=scYOC64r; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="scYOC64r"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4B2Lpbvv1538987
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 2 Dec 2024 15:51:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733176297;
	bh=eKmC6TClHbszm1nUSfdIpKedBgDBBDv7vmYfgShEc7U=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=scYOC64r05dTgPSDjAc6sjnTmyd/biItM/rh2T+8Lwb8XiWRX8oenn5+y/rGplnOe
	 fTQddai0DF8dhRxWI8jyhULP81vqH28XAZ2S62vFWH77qgWFrKSTd8qhPNLhNDrFe7
	 I7/H5NtuKmPLYNHKKQepZOgJ3T/5WehoRS3r+HM4=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4B2LpbVr038473
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 2 Dec 2024 15:51:37 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 2
 Dec 2024 15:51:37 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 2 Dec 2024 15:51:37 -0600
Received: from lelvsmtp6.itg.ti.com ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B2LparK039277;
	Mon, 2 Dec 2024 15:51:36 -0600
From: Andrew Davis <afd@ti.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Andrew
 Davis <afd@ti.com>
Subject: [PATCH v2 2/5] remoteproc: keystone: Use devm_pm_runtime_enable() helper
Date: Mon, 2 Dec 2024 15:51:32 -0600
Message-ID: <20241202215135.294829-2-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241202215135.294829-1-afd@ti.com>
References: <20241202215135.294829-1-afd@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Use device life-cycle managed runtime enable function to simplify probe
and exit paths.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/remoteproc/keystone_remoteproc.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/remoteproc/keystone_remoteproc.c b/drivers/remoteproc/keystone_remoteproc.c
index 3f2f72bd1cac8..2af3b64bc239c 100644
--- a/drivers/remoteproc/keystone_remoteproc.c
+++ b/drivers/remoteproc/keystone_remoteproc.c
@@ -410,12 +410,13 @@ static int keystone_rproc_probe(struct platform_device *pdev)
 		return PTR_ERR(ksproc->reset);
 
 	/* enable clock for accessing DSP internal memories */
-	pm_runtime_enable(dev);
+	ret = devm_pm_runtime_enable(dev);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to enable runtime PM\n");
+
 	ret = pm_runtime_resume_and_get(dev);
-	if (ret < 0) {
-		dev_err(dev, "failed to enable clock, status = %d\n", ret);
-		goto disable_rpm;
-	}
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to enable clock\n");
 
 	ret = keystone_rproc_of_get_memories(pdev, ksproc);
 	if (ret)
@@ -475,8 +476,6 @@ static int keystone_rproc_probe(struct platform_device *pdev)
 	gpiod_put(ksproc->kick_gpio);
 disable_clk:
 	pm_runtime_put_sync(dev);
-disable_rpm:
-	pm_runtime_disable(dev);
 	return ret;
 }
 
@@ -487,7 +486,6 @@ static void keystone_rproc_remove(struct platform_device *pdev)
 	rproc_del(ksproc->rproc);
 	gpiod_put(ksproc->kick_gpio);
 	pm_runtime_put_sync(&pdev->dev);
-	pm_runtime_disable(&pdev->dev);
 }
 
 static const struct of_device_id keystone_rproc_of_match[] = {
-- 
2.39.2

