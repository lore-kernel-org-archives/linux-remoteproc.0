Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F10A242D79;
	Fri, 25 Apr 2025 10:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745577774; cv=none; b=qONg5QY27VH8OjDzZ+7I3OYxYo7HkycXJQQaJ5qhusuxR9NWNe6jXq6D3w+ZaSXbf2Eph26Dj7Ym5dwCX9vBVLtbIHblaG/Vd6mUcWhxjAn39uV/yzAbfHK1Tx48I7mViH4c6ETj+QA3L4wX1vrA+eSGnxUEmBqz5SR5vpqmbu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745577774; c=relaxed/simple;
	bh=vXX3zZkBd/GMj5M0W+GK9W2Yffn5ntSLUYtHW1rbztg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Cq1r4uXad2TdEU2PJRr+rkyei20oJMgAUn8ojc+xzQbFR0AQAMunW2dbX+JgYj6jzLHapVHa+Ge70IfXan9IC5mU3C+rloQkkf75g/i9iwNr+E6V5bw76Fqu+lwQtiHb8aEejJaiZJmctT+wmgNwID4B3s4UmlKt1O62WZaPWB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=rpyjrv2q; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="rpyjrv2q"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53PAgiFL2911091
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 05:42:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745577764;
	bh=O8mnW6iuiNWubrmA0CYtIwecFYXDDSV9rOtemeUS0CM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=rpyjrv2qOOlej7+KXlV0uSysr2YJmXuAyfKp0XG0B8+Xuhze6aWpQkTeGfdLlNI7c
	 5Ifv9evTJutP1nlNRge5tbhojPtH5j56lDEhkfxsplD6s7t63qBc7sltlVZTRdv9CT
	 LX5cCq2uAPRH6xFfridEBkOzt56fRooYibFls0ug=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53PAgiRc028125
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 25 Apr 2025 05:42:44 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 25
 Apr 2025 05:42:44 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 25 Apr 2025 05:42:44 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53PAfaZc038329;
	Fri, 25 Apr 2025 05:42:41 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v11 17/35] remoteproc: k3-dsp: Correct Reset deassert logic for devices w/o lresets
Date: Fri, 25 Apr 2025 16:11:17 +0530
Message-ID: <20250425104135.830255-18-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250425104135.830255-1-b-padhi@ti.com>
References: <20250425104135.830255-1-b-padhi@ti.com>
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
in a no-operation, Update the logic to explicitly deassert only the
global reset for devices that do not have a local reset.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
Tested-by: Judith Mendez <jm@ti.com>
---
v11: Changelog:
1. Put if-else block for code path with lreset and w/o lreset. [Andrew]
2. Carried T/B tag.

Link to v10:
https://lore.kernel.org/all/20250417182001.3903905-17-b-padhi@ti.com/

v10: Changelog:
1. Split [v9 13/26] into [v10 16/33] and [v10 17/33] patches. 

Link to v9:
https://lore.kernel.org/all/20250317120622.1746415-14-b-padhi@ti.com/

 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 30 ++++++++++-------------
 1 file changed, 13 insertions(+), 17 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
index f8a5282df5b71..08e6dde3ea267 100644
--- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
@@ -30,23 +30,19 @@ static int k3_dsp_rproc_release(struct k3_rproc *kproc)
 	struct device *dev = kproc->dev;
 	int ret;
 
-	if (kproc->data->uses_lreset)
-		goto lreset;
-
-	ret = kproc->ti_sci->ops.dev_ops.get_device(kproc->ti_sci,
-						    kproc->ti_sci_id);
-	if (ret) {
-		dev_err(dev, "module-reset deassert failed (%pe)\n", ERR_PTR(ret));
-		return ret;
-	}
-
-lreset:
-	ret = reset_control_deassert(kproc->reset);
-	if (ret) {
-		dev_err(dev, "local-reset deassert failed, (%pe)\n", ERR_PTR(ret));
-		if (kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
-							  kproc->ti_sci_id))
-			dev_warn(dev, "module-reset assert back failed\n");
+	if (kproc->data->uses_lreset) {
+		ret = reset_control_deassert(kproc->reset);
+		if (ret) {
+			dev_err(dev, "local-reset deassert failed, (%pe)\n", ERR_PTR(ret));
+			if (kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
+								  kproc->ti_sci_id))
+				dev_warn(dev, "module-reset assert back failed\n");
+		}
+	} else {
+		ret = kproc->ti_sci->ops.dev_ops.get_device(kproc->ti_sci,
+							    kproc->ti_sci_id);
+		if (ret)
+			dev_err(dev, "module-reset deassert failed (%pe)\n", ERR_PTR(ret));
 	}
 
 	return ret;
-- 
2.34.1

