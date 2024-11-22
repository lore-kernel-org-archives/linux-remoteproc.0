Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D96175A5;
	Fri, 22 Nov 2024 17:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732298044; cv=none; b=LKUVDMCiEL9HOiOWdwP5KRxSanzS9CGRqwNc5aBG7PV6220A2OX5JsfNcTArQx9LVZjGjSgtkibub5gS5CdcGBXxjpE58zK36Zm1itjgTmuCdaRKBfb4pmoYeN0dHHJFpHVXR2SyqnPfyesZFuIZHVApF5k4CAGy+idaKS4aVBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732298044; c=relaxed/simple;
	bh=cutVbZjFmescBiksgNvM2mBtDEqXhRIwdRT9749DYEQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bK8Wf7NN70qEWHNCGiNdGwlhL6lHpKKLoW6VHbkKxVRj7r9oUwsHqTbcFlun2U4YQSOy6O2I7Lcq72DHNcm05d3c3znKnISLtVCcMWsVQ6R/4HKhwQI4U7BI6g7m/w/gwh/f2h/Tr5+HfirHS8V8xpfMpathDLvXy3KPyBCKq2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=KMe+EJFO; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="KMe+EJFO"
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AMGMheB010521;
	Fri, 22 Nov 2024 18:53:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=nJkjxzVfnCioMHZUj0mDGO
	q0e4V+G6DBTikNsBt0udA=; b=KMe+EJFOLxo7ILBk5qRyzGa0a5Cyoe95ChTLSH
	lj7lG+EIjbMLmaVEvmW+TBSoG/ELxj/q1Q9z0b7Q5lyCYZXeTbZMeCMmLKAO87g0
	CoNiuuq8QHR/t+CB6O3hItNTqY9rJwiB837/zmtzmYieNPUICL4dXoHSzBz3ZCyx
	meUAIgoA6RtXqQPKsXhWpKagdtTOSoTUMqcaL2qe02cBCx91FtIZg1tFm9anyILt
	/QQ2+6uzXRUg4jMgQ6BpfN/MFUEDXUeNo5IaHi2f70HQdFtoVZ5ckSBLo4uVNqbo
	ukeXlEEtSHdyDnwJX6pb+gGYeBNm8LwTZzzhCfObcYSKs4fg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42y77ntkbb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 18:53:34 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id BEE5F40047;
	Fri, 22 Nov 2024 18:52:31 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7052126EEE0;
	Fri, 22 Nov 2024 18:51:36 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE6.st.com
 (10.75.129.135) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 22 Nov
 2024 18:51:36 +0100
Received: from localhost (10.48.86.121) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 22 Nov
 2024 18:51:35 +0100
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <arnaud.pouliquen@foss.st.com>
Subject: [PATCH] remoteproc: core: Fix ida_free call while not allocated
Date: Fri, 22 Nov 2024 18:51:27 +0100
Message-ID: <20241122175127.2188037-1-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

In the rproc_alloc() function, on error, put_device(&rproc->dev) is
called, leading to the call of the rproc_type_release() function.
An error can occurs before ida_alloc is called.

In such case in rproc_type_release(), the condition (rproc->index >= 0) is
true as rproc->index has been  initialized to 0.
ida_free() is called reporting a warning:
[    4.181906] WARNING: CPU: 1 PID: 24 at lib/idr.c:525 ida_free+0x100/0x164
[    4.186378] stm32-display-dsi 5a000000.dsi: Fixed dependency cycle(s) with /soc/dsi@5a000000/panel@0
[    4.188854] ida_free called for id=0 which is not allocated.
[    4.198256] mipi-dsi 5a000000.dsi.0: Fixed dependency cycle(s) with /soc/dsi@5a000000
[    4.203556] Modules linked in: panel_orisetech_otm8009a dw_mipi_dsi_stm(+) gpu_sched dw_mipi_dsi stm32_rproc stm32_crc32 stm32_ipcc(+) optee(+)
[    4.224307] CPU: 1 UID: 0 PID: 24 Comm: kworker/u10:0 Not tainted 6.12.0 #442
[    4.231481] Hardware name: STM32 (Device Tree Support)
[    4.236627] Workqueue: events_unbound deferred_probe_work_func
[    4.242504] Call trace:
[    4.242522]  unwind_backtrace from show_stack+0x10/0x14
[    4.250218]  show_stack from dump_stack_lvl+0x50/0x64
[    4.255274]  dump_stack_lvl from __warn+0x80/0x12c
[    4.260134]  __warn from warn_slowpath_fmt+0x114/0x188
[    4.265199]  warn_slowpath_fmt from ida_free+0x100/0x164
[    4.270565]  ida_free from rproc_type_release+0x38/0x60
[    4.275832]  rproc_type_release from device_release+0x30/0xa0
[    4.281601]  device_release from kobject_put+0xc4/0x294
[    4.286762]  kobject_put from rproc_alloc.part.0+0x208/0x28c
[    4.292430]  rproc_alloc.part.0 from devm_rproc_alloc+0x80/0xc4
[    4.298393]  devm_rproc_alloc from stm32_rproc_probe+0xd0/0x844 [stm32_rproc]
[    4.305575]  stm32_rproc_probe [stm32_rproc] from platform_probe+0x5c/0xbc


Calling ida_alloc earlier in rproc_alloc ensures that the rproc->index is
properly set.

Fixes: 08333b911f01 ("remoteproc: Directly use ida_alloc()/free()")

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
Note for backporting to previous kernel versions: The SHA 08333b911f01
seems to correspond to the last commit that updated IDA allocation.
The issue existed before, but the fix could not be applied without some
rework.
---
 drivers/remoteproc/remoteproc_core.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index f276956f2c5c..ef6febe35633 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -2486,6 +2486,13 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
 	rproc->dev.driver_data = rproc;
 	idr_init(&rproc->notifyids);
 
+	/* Assign a unique device index and name */
+	rproc->index = ida_alloc(&rproc_dev_index, GFP_KERNEL);
+	if (rproc->index < 0) {
+		dev_err(dev, "ida_alloc failed: %d\n", rproc->index);
+		goto put_device;
+	}
+
 	rproc->name = kstrdup_const(name, GFP_KERNEL);
 	if (!rproc->name)
 		goto put_device;
@@ -2496,13 +2503,6 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
 	if (rproc_alloc_ops(rproc, ops))
 		goto put_device;
 
-	/* Assign a unique device index and name */
-	rproc->index = ida_alloc(&rproc_dev_index, GFP_KERNEL);
-	if (rproc->index < 0) {
-		dev_err(dev, "ida_alloc failed: %d\n", rproc->index);
-		goto put_device;
-	}
-
 	dev_set_name(&rproc->dev, "remoteproc%d", rproc->index);
 
 	atomic_set(&rproc->power, 0);

base-commit: adc218676eef25575469234709c2d87185ca223a
-- 
2.25.1

