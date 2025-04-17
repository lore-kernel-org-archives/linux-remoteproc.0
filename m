Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904FF25FA2D;
	Thu, 17 Apr 2025 18:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744914075; cv=none; b=O9aIMuzPZ2ppScpUv1xR5FRJpbrpIYk0RCmPMp/helCJ3CDqUWQsZZMPKJXv4qHipTRhkFit25LExVKlsUhmrHgzH65waCKM/ueVSnTONxiMY+gcm1X2P2mpLjuoZ5B3t4xto/YFLWQgUsYiUIRgxURyltLejy5zka4MlflVvSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744914075; c=relaxed/simple;
	bh=iu0Midzt3c0Q0Ptlka7ofMOhNX+FYlYX/fbLUTlr6WQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mDGBIG1kzIGNP1lFNH3sKBlpMCJjNrO4oq6q0lD+6My9Njlad2Ri22/qnN4Ewxf0OjFCeeGyR8+qL5qfLQ4BUoVSPbXcM4ozNkdNK4i620RvFvQH3LksxtgJCKOaZ4mW7bnn43J7bgjLUvcG52s5S2kYvSujz4dAE6p6cHuMxUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=riboOhBJ; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="riboOhBJ"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53HIL6PM080568
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Apr 2025 13:21:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744914066;
	bh=VgWaqHo25otLBVqjgJsvpSbHhUxN4I80iCjffYbFuh8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=riboOhBJ54peOXbeSMSW/oazuBIVnN2YLI4wRaFocvEyR9w2x/wtXhwNMKpZVqujc
	 dgkqRXbxPifGjCDLxehFqFsk4AYd4NXHanSNn3aQtLDJnGxCz88eQt9XsNv2zs8zIo
	 oehN8zakKtbKKGRtXNjrFU9obScWklDIymFloYU8=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53HIL6W5028295
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 17 Apr 2025 13:21:06 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 17
 Apr 2025 13:21:05 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 17 Apr 2025 13:21:05 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53HIK1I0071102;
	Thu, 17 Apr 2025 13:21:02 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v10 16/33] remoteproc: k3-dsp: Correct Reset deassert logic for devices w/o lresets
Date: Thu, 17 Apr 2025 23:49:44 +0530
Message-ID: <20250417182001.3903905-17-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250417182001.3903905-1-b-padhi@ti.com>
References: <20250417182001.3903905-1-b-padhi@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

The k3_dsp_rproc_release() function erroneously deasserts the local
reset even for devices which do not support it. Even though it results
in a no-operation, Update the logic to explicitly deassert the local
reset for devices that support it and only the global reset for those
that do not.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
v10: Changelog:
1. Split [v9 13/26] into [v10 16/33] and [v10 17/33] patches. 

Link to v9:
https://lore.kernel.org/all/20250317120622.1746415-14-b-padhi@ti.com/

 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 26 +++++++++++------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
index f8a5282df5b71..b10b35326bd6b 100644
--- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
@@ -30,24 +30,22 @@ static int k3_dsp_rproc_release(struct k3_rproc *kproc)
 	struct device *dev = kproc->dev;
 	int ret;
 
-	if (kproc->data->uses_lreset)
-		goto lreset;
+	if (kproc->data->uses_lreset) {
+		ret = reset_control_deassert(kproc->reset);
+		if (ret) {
+			dev_err(dev, "local-reset deassert failed, (%pe)\n", ERR_PTR(ret));
+			if (kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
+								  kproc->ti_sci_id))
+				dev_warn(dev, "module-reset assert back failed\n");
+		}
 
-	ret = kproc->ti_sci->ops.dev_ops.get_device(kproc->ti_sci,
-						    kproc->ti_sci_id);
-	if (ret) {
-		dev_err(dev, "module-reset deassert failed (%pe)\n", ERR_PTR(ret));
 		return ret;
 	}
 
-lreset:
-	ret = reset_control_deassert(kproc->reset);
-	if (ret) {
-		dev_err(dev, "local-reset deassert failed, (%pe)\n", ERR_PTR(ret));
-		if (kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
-							  kproc->ti_sci_id))
-			dev_warn(dev, "module-reset assert back failed\n");
-	}
+	ret = kproc->ti_sci->ops.dev_ops.get_device(kproc->ti_sci,
+						    kproc->ti_sci_id);
+	if (ret)
+		dev_err(dev, "module-reset deassert failed (%pe)\n", ERR_PTR(ret));
 
 	return ret;
 }
-- 
2.34.1

