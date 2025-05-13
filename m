Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B5D1EFF9A;
	Tue, 13 May 2025 05:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747115190; cv=none; b=tiU5jcddOehQhmPC8fg+ChozPxCvy+ZwP02LjJ4ZyPCxoieb/CF9CRXuse1Yzg3/N9ZtNhYmbLDZpdV+RlIQw0Llk878FVv9tu7zf+xkBXQzwda+2+W+Lh/w/cb2C1O7pTBLn2j0AZVLxjHLdYHbG3ANICo0BEVMfpp6JCTM6kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747115190; c=relaxed/simple;
	bh=OEopinO3c5zea6BIXpmpfugpZ5ZMhTF5uodQRc8GTJU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pONi+J+TE0QOAgCM6EliKJQaS736G6A+GYjVDxoXBWt7q7OzHlWP7e9Sw0x7MOHLIWcgS0AYAyRkq5qIj+bEun3yP4LO8h5twVWlHpU83sbPuG538Ptcq3s66SNDiQivfiKXHK1C1VP4f8xw3Bepm4eRoFymZf0HXd+umfZeca8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=D/4kgQiy; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="D/4kgQiy"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 54D5kHnh2985925
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 May 2025 00:46:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747115177;
	bh=ykXiJ6g7dD1Db3aXqucHZbCYZjNcttRHqZBnwEdjMHY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=D/4kgQiy1tzsXqqGuppilmmVfvsJC0gRAqL1s4Y/eWPjQ1H1tqgEfJFTNAQcY1e4q
	 nZZ8n9LQBgyFl/byCJYAgXZmz5CJbZfSHdCAfPI+H2tCHCNu9GkzZuj+C63f+Kglwy
	 cetYGkExtd73wvkFD23PiwGzP2kXCGUYE1RR3F1E=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 54D5kHVR063311
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 13 May 2025 00:46:17 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 13
 May 2025 00:46:17 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 13 May 2025 00:46:17 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54D5jAqO131001;
	Tue, 13 May 2025 00:46:13 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v12 15/36] remoteproc: k3-dsp: Correct Reset logic for devices without lresets
Date: Tue, 13 May 2025 11:14:49 +0530
Message-ID: <20250513054510.3439842-16-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250513054510.3439842-1-b-padhi@ti.com>
References: <20250513054510.3439842-1-b-padhi@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

The k3_dsp_rproc_reset() function erroneously asserts the local reset
even for devices which do not support it. Even though it results in a
no-operation, Update the logic to explicitly assert the local reset for
devices that support it and only the global reset for those that do not.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
Tested-by: Judith Mendez <jm@ti.com>
Reviewed-by: Andrew Davis <afd@ti.com>
---
v12: Changelog:
1. Carried R/B tag.

Link to v11:
https://lore.kernel.org/all/20250425104135.830255-15-b-padhi@ti.com/

v11: Changelog:
1. Don't deassert lreset back if asserting module reset fails. [Andrew]
2. Put if-else block for code path with lreset and w/o lreset. [Andrew]
3. Carried T/B tag.

Link to v10:
https://lore.kernel.org/all/20250417182001.3903905-15-b-padhi@ti.com/

v10: Changelog:
1. Split [v9 12/26] into [v10 14/33] and [v10 15/33] patches. 

Link to v9:
https://lore.kernel.org/all/20250317120622.1746415-13-b-padhi@ti.com/

 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 24 +++++++++--------------
 1 file changed, 9 insertions(+), 15 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
index 476f4e69d2c11..2ffcdba1c7754 100644
--- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
@@ -30,21 +30,15 @@ static int k3_dsp_rproc_reset(struct k3_rproc *kproc)
 	struct device *dev = kproc->dev;
 	int ret;
 
-	ret = reset_control_assert(kproc->reset);
-	if (ret) {
-		dev_err(dev, "local-reset assert failed (%pe)\n", ERR_PTR(ret));
-		return ret;
-	}
-
-	if (kproc->data->uses_lreset)
-		return ret;
-
-	ret = kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
-						    kproc->ti_sci_id);
-	if (ret) {
-		dev_err(dev, "module-reset assert failed (%pe)\n", ERR_PTR(ret));
-		if (reset_control_deassert(kproc->reset))
-			dev_warn(dev, "local-reset deassert back failed\n");
+	if (kproc->data->uses_lreset) {
+		ret = reset_control_assert(kproc->reset);
+		if (ret)
+			dev_err(dev, "local-reset assert failed (%pe)\n", ERR_PTR(ret));
+	} else {
+		ret = kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
+							    kproc->ti_sci_id);
+		if (ret)
+			dev_err(dev, "module-reset assert failed (%pe)\n", ERR_PTR(ret));
 	}
 
 	return ret;
-- 
2.34.1

