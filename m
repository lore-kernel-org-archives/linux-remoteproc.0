Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9AC257420;
	Thu, 17 Apr 2025 18:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744914068; cv=none; b=hgAp2Dy8jnjKaJU36fuWxbXGxfAxow3IOGKm05ienP15Ya8PzR90OdfhhqRx3aLnn8ugTN8lay+3w8N83xjDyj0IrNzfffhlL7CySSS38YSAWyuEwsF52sVQQYIdGvzV4eeVLkdU4M1bMP3cAO0sngj92CRuudKEgBjKYEXm/H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744914068; c=relaxed/simple;
	bh=Mz7E2qdiZErfdkdKvMy12mejKuq1gzaHB2osG3pGO98=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pKB/Y/W9ol8+TPfzQl+zrsm8RYN5zeRUikMsZ+eR7dp1MRQC+gUuRBqAELpeWHHx8EWxlyLZ61BOhWX6KCfLE2AgFtnF2gagLUk+mD9NnH7SpK5I9bMK+4rIJDtOP5J9NcE+8u1WwlZihWZuvEAmHGWKJPVVsFI52sqs7XzYg5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=NzZmn1n8; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="NzZmn1n8"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53HIKwZN089374
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Apr 2025 13:20:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744914058;
	bh=bWMBLZwsgbQiG91ZuT6tpE4C+bi2C/9OtGXSx8gIc2w=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=NzZmn1n8hE/o2M3lJ0YcKZO/oxjfxafuVyi/LIeTz4M6558MWYY2XkAIIFvYoQclx
	 32pY7phrwfSKhNQe8tf5E8B763RuDevD0xUfbEEuQRiaIIiMDSHxGY8lZrB2nQi/3k
	 TELkixdhFsimKlIGFSOShV0WZxs5BaVmoSrsbJ3E=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53HIKwjv027960
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 17 Apr 2025 13:20:58 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 17
 Apr 2025 13:20:58 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 17 Apr 2025 13:20:58 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53HIK1Hw071102;
	Thu, 17 Apr 2025 13:20:55 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v10 14/33] remoteproc: k3-dsp: Correct Reset logic for devices without lresets
Date: Thu, 17 Apr 2025 23:49:42 +0530
Message-ID: <20250417182001.3903905-15-b-padhi@ti.com>
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

The k3_dsp_rproc_reset() function erroneously asserts the local reset
even for devices which do not support it. Even though it results in a
no-operation, Update the logic to explicitly assert the local reset for
devices that support it and only the global reset for those that do not.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
v10: Changelog:
1. Split [v9 12/26] into [v10 14/33] and [v10 15/33] patches. 

Link to v9:
https://lore.kernel.org/all/20250317120622.1746415-13-b-padhi@ti.com/

 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
index 476f4e69d2c11..0a8c9e61393d2 100644
--- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
@@ -30,15 +30,13 @@ static int k3_dsp_rproc_reset(struct k3_rproc *kproc)
 	struct device *dev = kproc->dev;
 	int ret;
 
-	ret = reset_control_assert(kproc->reset);
-	if (ret) {
-		dev_err(dev, "local-reset assert failed (%pe)\n", ERR_PTR(ret));
+	if (kproc->data->uses_lreset) {
+		ret = reset_control_assert(kproc->reset);
+		if (ret)
+			dev_err(dev, "local-reset assert failed (%pe)\n", ERR_PTR(ret));
 		return ret;
 	}
 
-	if (kproc->data->uses_lreset)
-		return ret;
-
 	ret = kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
 						    kproc->ti_sci_id);
 	if (ret) {
-- 
2.34.1

