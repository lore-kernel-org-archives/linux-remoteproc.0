Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E106513CF8D;
	Mon,  6 May 2024 14:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715005152; cv=none; b=isqseuPQNSim1IKKMqps82MaqU+yNA4nIYsBFPukR2eN2sIF0U3vKVkrNoL39nGATx6to5Kgry1NPGlJ0Qft8BxFQxnqAGtRFomTTS64paH7n4nIPPKEPfy62mWlgG9wOX+Gw39SdYqLsgttMJXAf6P+qa2aICeqQbNnfjuZAxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715005152; c=relaxed/simple;
	bh=FAKNQBGUKKFusDeatYhafNln5MX8xfJagk0O96bWMBA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VRcSW9h1vsrGlwjFNgE7oA2d5zMw1aut/2ReJCT0KB7EOvU/eucv+8SvFcPQyOe2rUu9igBU3OcUqDCEAyVE0eVRCEORPFsOpDW0HCyz9ACJC62OV2MUmmbjAY0XCC3zwSjJ/WFW+dWfI4Bwn/m/7lI9ps0U+t5sWB91hwlhsNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=tboUKVnZ; arc=none smtp.client-ip=198.47.23.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="tboUKVnZ"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 446EIr87017415;
	Mon, 6 May 2024 09:18:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1715005133;
	bh=vGrj2I00iop+9WWPNabe2FeZlqglag8xAYaGInOumy0=;
	h=From:To:CC:Subject:Date;
	b=tboUKVnZRbaMKXkeRZ5lXnavmhrCdvLMiwi1/0w3mWhA0UAGGSRnrrBmu/9xNsJdn
	 fsfPYZm0PxYXf8EqlXXvqJrrAdLHoXZRQqtaP2nt/vAJq3RMH9XWZf3P45nxZEPf9C
	 dEQabbYjFVPSn7DILnG1TmLEj/qkE5QHZiVZh9wM=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 446EIrw3041746
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 6 May 2024 09:18:53 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 6
 May 2024 09:18:53 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 6 May 2024 09:18:53 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.69.66])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 446EInOp083672;
	Mon, 6 May 2024 09:18:50 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>
CC: <mathieu.poirier@linaro.org>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <dan.carpenter@linaro.org>,
        <hnagalla@ti.com>, <devarsht@ti.com>, <nm@ti.com>, <s-anna@ti.com>,
        <u-kumar1@ti.com>
Subject: [PATCH] remoteproc: k3-r5: Jump to error handling labels in start/stop errors
Date: Mon, 6 May 2024 19:48:49 +0530
Message-ID: <20240506141849.1735679-1-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

In case of errors during core start operation from sysfs, the driver
directly returns with the -EPERM error code. Fix this to ensure that
mailbox channels are freed on error before returning by jumping to the
'put_mbox' error handling label. Similarly, jump to the 'out' error
handling label to return with required -EPERM error code during the
core stop operation from sysfs.

Fixes: 3c8a9066d584 ("remoteproc: k3-r5: Do not allow core1 to power up before core0 via sysfs")

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
As stated in the bug-report[0], Smatch complains that:
drivers/remoteproc/ti_k3_r5_remoteproc.c:583 k3_r5_rproc_start() warn: missing unwind goto?
drivers/remoteproc/ti_k3_r5_remoteproc.c:651 k3_r5_rproc_stop() warn: missing unwind goto?

This patch addresses the warnings by jumping to appropriate error
labels in case an error occurs during start/stop operation from sysfs.

[0]-https://lore.kernel.org/all/acc4f7a0-3bb5-4842-95a5-fb3c3fc8554b@moroto.mountain/

 drivers/remoteproc/ti_k3_r5_remoteproc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
index 1799b4f6d11e..50e486bcfa10 100644
--- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
@@ -580,7 +580,8 @@ static int k3_r5_rproc_start(struct rproc *rproc)
 		if (core != core0 && core0->rproc->state == RPROC_OFFLINE) {
 			dev_err(dev, "%s: can not start core 1 before core 0\n",
 				__func__);
-			return -EPERM;
+			ret = -EPERM;
+			goto put_mbox;
 		}
 
 		ret = k3_r5_core_run(core);
@@ -648,7 +649,8 @@ static int k3_r5_rproc_stop(struct rproc *rproc)
 		if (core != core1 && core1->rproc->state != RPROC_OFFLINE) {
 			dev_err(dev, "%s: can not stop core 0 before core 1\n",
 				__func__);
-			return -EPERM;
+			ret = -EPERM;
+			goto out;
 		}
 
 		ret = k3_r5_core_halt(core);
-- 
2.34.1

