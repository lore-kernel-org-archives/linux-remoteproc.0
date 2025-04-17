Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057E3256C6D;
	Thu, 17 Apr 2025 18:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744914096; cv=none; b=WtawtW0gLh8Uny5OSZ0NugrJ5JRSWrds1jOERfUMkN59Zja8nmf3BL0Nr/vEeDOmEMHUikAqH9Cu4AfsVVrBJu/pVCIG3e8Db/Z4Y6HfMECjNSvCTlTEWRvxd3vKftbioszw734/PZ0FZ7preMSBRMbwH+iAT2EAcZmJXDpccro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744914096; c=relaxed/simple;
	bh=5ThHpqBrnqUnxmuguFmWcJ+sH4q977765sTextSabUE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DmuSaCImr7BbLFl2YWxLFUiWethWYxbcw3NWxzF9R491H5OEty8OuaMIT2ICzWW4+sz8KQqD161DQHNYmqnlBT23rRC/zk4Q/VnzXeD9OwnDltD5pVFl0ltBV9I2n+tROZ2xYB9/qvgU6KFOu4/wAXQjI72xUjHWqpiulCNfovM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=TtDf3KP3; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="TtDf3KP3"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53HILOq5089511
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Apr 2025 13:21:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744914084;
	bh=jy3mN7QPfdSm8AZZNEGugiPMNuL7Q2IlcerXnADJdYk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=TtDf3KP3d1x2AgtM6qZ38ywOwzi5yCA3ZZgABZkx0zhgd/Lc1D2FqYaUcJy5f+yz4
	 Qw/edwaM/hrTT7lwu6BIw8iPvjHk4/+CbMyH4TrZWRd7wdGfUunulOMEBtqTRLrwK/
	 QF0Qt5r9O54WxXTzQgxTMKueUatTBG0kPn6yk9+U=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53HILO6E068016
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 17 Apr 2025 13:21:24 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 17
 Apr 2025 13:21:24 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 17 Apr 2025 13:21:24 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53HIK1I5071102;
	Thu, 17 Apr 2025 13:21:21 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v10 21/33] remoteproc: k3-dsp: Assert local reset during .prepare callback
Date: Thu, 17 Apr 2025 23:49:49 +0530
Message-ID: <20250417182001.3903905-22-b-padhi@ti.com>
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

The ti_k3_dsp_remoteproc.c driver asserts the local reset in probe
and releases the module reset in .prepare callback. This is done to
ensure the core does not execute bogus code when module reset is
deasserted.

Put both of these operations together in .prepare callback, which is
more suitable as it ensures local reset is asserted for subsequent core
start operations from sysfs. This is done to align the .prepare callback
of DSP with the M4 driver which can be factored out at a later stage.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
v10: Changelog:
1. Split [v9 15/26] into [v10 21/33] and [v10 22/33] patches. 

Link to v9:
https://lore.kernel.org/all/20250317120622.1746415-16-b-padhi@ti.com/

 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 30 ++++++++++++-----------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
index 9037e3948f4f5..a43715309eed5 100644
--- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
@@ -44,6 +44,22 @@ static int k3_dsp_rproc_prepare(struct rproc *rproc)
 	if (rproc->state == RPROC_DETACHED)
 		return 0;
 
+	/*
+	 * Ensure the local reset is asserted so the core doesn't
+	 * execute bogus code when the module reset is released.
+	 */
+	if (kproc->data->uses_lreset) {
+		ret = k3_rproc_reset(kproc);
+		if (ret)
+			return ret;
+
+		ret = reset_control_status(kproc->reset);
+		if (ret <= 0) {
+			dev_err(dev, "local reset still not asserted\n");
+			return ret;
+		}
+	}
+
 	ret = kproc->ti_sci->ops.dev_ops.get_device(kproc->ti_sci,
 						    kproc->ti_sci_id);
 	if (ret)
@@ -471,20 +487,6 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
 		rproc->state = RPROC_DETACHED;
 	} else {
 		dev_info(dev, "configured DSP for remoteproc mode\n");
-		/*
-		 * ensure the DSP local reset is asserted to ensure the DSP
-		 * doesn't execute bogus code in .prepare() when the module
-		 * reset is released.
-		 */
-		if (data->uses_lreset) {
-			ret = reset_control_status(kproc->reset);
-			if (ret < 0) {
-				return dev_err_probe(dev, ret, "failed to get reset status\n");
-			} else if (ret == 0) {
-				dev_warn(dev, "local reset is deasserted for device\n");
-				k3_rproc_reset(kproc);
-			}
-		}
 	}
 
 	ret = devm_rproc_add(dev, rproc);
-- 
2.34.1

