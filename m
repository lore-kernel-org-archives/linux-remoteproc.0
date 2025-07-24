Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35EC12D878C;
	Thu, 24 Jul 2025 13:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753363918; cv=none; b=hdayCaJjKflfriZwcGMwFJ1oBrHlN9R5cyuBtupOLALOgqj2Yds0qFAS7sOwW7ckDafLEFeGTYwN7Wt9zh1Ro0deEXX5rL1wdCQWDsGZ1JEQsPYpyaX4UVdDIchEzRpDZ//MJs0ryMiAqoQDij1hIeGPZKPX+av7wigzw7L1kg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753363918; c=relaxed/simple;
	bh=3zzn1ea8CK30bhCRlV4cWE5qDuesQ+mvFiNJSnmbAoM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XeuAqF1YmQjnRTMoHMd44I6PoBnJTfOLCrMWIpA6pzUJxJqgsNMSsttVZ4Jcwo4ThT208zizn6o5E10GAwrCP5/Q7muZjTu+l1IZMEtS+WQkisfAyY4e5Az1dHBbChb99mol43nXqx4kJ0+layFh5ntpptJymvo50IFVxHYIeUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=GnLWkaYS; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="GnLWkaYS"
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56ODVmo81978144;
	Thu, 24 Jul 2025 08:31:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1753363908;
	bh=Yb1NoViRB7nkpp60Mxw37GtwJN6/hW6ZuaO1A5RaCSc=;
	h=From:To:CC:Subject:Date;
	b=GnLWkaYSrOCY6WXNpziMc2ox9LSAyEpfmU2C51aicHGExXnAaQKYrd9onhC60wy39
	 4jqc/2U0mNL9Ivci8HWQo4OrRTXOjc4cslYhk/iX6sQ8Be4uP9GGZVPU/Ra13upA59
	 7bJdf8GCjM9N9FTYZZI48MBFiRd3nyZ5OLQUu7wU=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56ODVmgP3136318
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 24 Jul 2025 08:31:48 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 24
 Jul 2025 08:31:47 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 24 Jul 2025 08:31:47 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56ODViRr504944;
	Thu, 24 Jul 2025 08:31:45 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <jm@ti.com>, <jan.kiszka@siemens.com>,
        <christophe.jaillet@wanadoo.fr>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH] remoteproc: core: Do not process carveout and devmem rsc in attach mode
Date: Thu, 24 Jul 2025 19:01:44 +0530
Message-ID: <20250724133144.3776839-1-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

When attaching to a remote processor, it is implied that the rproc was
booted by an external entity. Thus, it's carveout and devmem resources
would already have been processed by the external entity during boot.

Re-allocating the carveouts in Linux (without proper flags) would zero
out the memory regions used by the firmware and can lead to undefined
behaviour. And there is no need to re-map the memory regions for devmem
resources as well.

Therefore, do not process the carveout and devmem resources in attach
mode by not appending them to the rproc->carveouts and rproc->mappings
lists respectively.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
Testing:
1. Tested IPC with remoteprocs in attach mode in TI platforms.
[However, TI K3 platforms do not use resource table for carveouts,
all the memory regions are reserved statically in Device Tree.]

 drivers/remoteproc/remoteproc_core.c | 30 ++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 825672100528..ef709a5fa73c 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -640,6 +640,20 @@ static int rproc_handle_devmem(struct rproc *rproc, void *ptr,
 		return -EINVAL;
 	}
 
+	/*
+	 * When attaching to a remote processor, it is implied that the rproc
+	 * was booted by an external entity. Thus, it's devmem resources would
+	 * already have been mapped by the external entity during boot. There is
+	 * no need to re-map the memory regions here.
+	 *
+	 * Skip adding the devmem rsc to the mapping list and return without
+	 * complaining.
+	 */
+	if (rproc->state == RPROC_DETACHED) {
+		dev_info(dev, "skipping devmem rsc in attach mode\n");
+		return 0;
+	}
+
 	mapping = kzalloc(sizeof(*mapping), GFP_KERNEL);
 	if (!mapping)
 		return -ENOMEM;
@@ -839,6 +853,22 @@ static int rproc_handle_carveout(struct rproc *rproc,
 		return -EINVAL;
 	}
 
+	/*
+	 * When attaching to a remote processor, it is implied that the rproc
+	 * was booted by an external entity. Thus, it's carveout resources would
+	 * already have been allocated by the external entity during boot.
+	 * Re-allocating the carveouts here (without proper flags) would zero
+	 * out the memory regions used by the firmware and can lead to undefined
+	 * behaviour.
+	 *
+	 * Skip adding the carveouts to the alloc list and return without
+	 * complaining.
+	 */
+	if (rproc->state == RPROC_DETACHED) {
+		dev_info(dev, "skipping carveout allocation in attach mode\n");
+		return 0;
+	}
+
 	dev_dbg(dev, "carveout rsc: name: %s, da 0x%x, pa 0x%x, len 0x%x, flags 0x%x\n",
 		rsc->name, rsc->da, rsc->pa, rsc->len, rsc->flags);
 
-- 
2.34.1

