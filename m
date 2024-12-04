Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C78D1F130E;
	Wed,  4 Dec 2024 11:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733310712; cv=none; b=YSJgNHHTyEmd34jtSiManK/Z027tdHbybTIKBgaOFBCeap5bjMQDz8t7g5HpKW93aQkLJfYiE4ASZ1afanL7Qbgi3uP1BBZ2wNZXzY6ujRIuNfbZA3XlsI8OAAsxIam4Wp/M+X2n4JQKNiKLytLj0JA1MFIyI14Zn0IkrR4Do7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733310712; c=relaxed/simple;
	bh=ZWkoSIpSq7/l2O91jG7cWPTcCkrNV0qWOb4ljATi3JU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kRwOAhPWjhQ6P6sBquxD9U3ry/QA3uq31awp/3kTydmQ1hAJ9m/Tp3Bz0AlaPDSRDu1ITs5OW08qwJMlfZYyJkqkfDJwevGa6HLP5YJikOmwV+cGD3to99OfVA2GJ5fWBUD2l/GEYynrv8ot+Ytsf7DA+PVP59fSzuSwTq7Zy9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=SRDvPhST; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="SRDvPhST"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4B4BBiiq062446;
	Wed, 4 Dec 2024 05:11:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733310704;
	bh=uBAF7xUFSeFheMZzMtXSi1X5ACBbVQYUQmHsTg1KUtw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=SRDvPhSTA2AK6ja2Snw8ILIdI7QWI4vLkR40R5S+dO2/T2JfwCUl42luoW51KiykO
	 2hkXpBDyhMIfVGcRrrA+ZinumZAuEzYlye9xfwsac7pzIcKAs490k/CbcsvZb5Wx3f
	 BLqhrn9ogy7ojhIqTpyPlwzf6FmjGkvPEe6R30ts=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4B4BBipd037572
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 4 Dec 2024 05:11:44 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 4
 Dec 2024 05:11:43 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 4 Dec 2024 05:11:43 -0600
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B4BBVUN083186;
	Wed, 4 Dec 2024 05:11:41 -0600
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <b-padhi@ti.com>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH 3/5] remoteproc: k3-r5: Add devm action to release tsp
Date: Wed, 4 Dec 2024 16:41:28 +0530
Message-ID: <20241204111130.2218497-4-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241204111130.2218497-1-b-padhi@ti.com>
References: <20241204111130.2218497-1-b-padhi@ti.com>
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
 drivers/remoteproc/ti_k3_r5_remoteproc.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
index 0753a5c35c7e..2966cb210403 100644
--- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
@@ -1513,6 +1513,13 @@ static int k3_r5_core_of_get_sram_memories(struct platform_device *pdev,
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
@@ -1606,6 +1613,10 @@ static int k3_r5_core_of_init(struct platform_device *pdev)
 		goto err;
 	}
 
+	ret = devm_add_action_or_reset(dev, k3_r5_release_tsp, core->tsp);
+	if (ret)
+		goto err;
+
 	platform_set_drvdata(pdev, core);
 	devres_close_group(dev, k3_r5_core_of_init);
 
@@ -1622,13 +1633,7 @@ static int k3_r5_core_of_init(struct platform_device *pdev)
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

